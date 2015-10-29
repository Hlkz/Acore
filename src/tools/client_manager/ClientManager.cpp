#include "ClientManager.h"
#include "Timer.h"
#include <iostream>
#include <boost/algorithm/string.hpp>
#include "StormLib/StormLib.h"
#include "StormLib/StormCommon.h"

ClientManager::ClientManager(po::variables_map vm)
{
    mVm = vm;

    Proceed();
}

bool ClientManager::Proceed()
{
    //std::cout << "\n  ClientManager\n\n";
    uint32 oldMSTime = getMSTime();

    selector = new ClientSelector(mVm);

    compressor = new ClientCompressor(mVm);

    patcher = new ClientPatcher(mVm);

    //printf("\n  Program executed in %u ms", GetMSTimeDiffToNow(oldMSTime));
    return true;
}

namespace Manager
{
    void Init()
    {
        FullDataPath = sConfigMgr->GetStringDefault("FullDataPath", "D:\\A\\Client\\Manager\\Data\\FullData");
        TinyDataPath = sConfigMgr->GetStringDefault("TinyDataPath", "D:\\A\\Client\\Manager\\Data\\TinyData");
        TinyLocPath = sConfigMgr->GetStringDefault("TinyLocPath", "D:\\A\\Client\\Manager\\Data\\TinyLoc");
        TinyPatchPath = sConfigMgr->GetStringDefault("TinyPatchPath", "D:\\A\\Client\\Manager\\Data\\TinyPatch");
        std::string LocDataPath = sConfigMgr->GetStringDefault("FullDataPathLoc", "D:\\A\\Client\\Manager\\Data\\LocData");
        FullDataPathFr = LocDataPath + "\\frFR";
        FullDataPathEn = LocDataPath + "\\enUS";
        TinyDataPathFr = TinyLocPath + "\\frFR";
        TinyDataPathEn = TinyLocPath + "\\enUS";

        ManagerDataPath = sConfigMgr->GetStringDefault("DataPath", "D:\\A\\Client\\Manager\\Data");
        PatchOutputPath = sConfigMgr->GetStringDefault("PatchOutputPath", "D:\\A\\Client\\Manager\\Output");
        UpdatePath = sConfigMgr->GetStringDefault("UpdatePath", "D:\\A\\Client\\Manager\\Update");
    }

    void Console()
    {
        TC_LOG_INFO("client.manager", "ClientManager\n");
        std::string cmd;
        while (cmd != "exit" && cmd != "quit" && cmd != "e" && cmd != "q")
        {
            std::getline(std::cin, cmd);
            if (cmd.length() > 0)
                system(std::string("ClientManager.exe " + cmd).c_str());
        }
    }

    void ManageFile(std::string path)
    {
        if (path.length() < 5)
            return;

        if (boost::iequals(path.substr(path.length() - 4, 4), ".zmp"))
            Manager::ExtractZMP(path);
    }

    bool OpenMPQ(std::string path, HANDLE* phMpq)
    {
        if (SFileOpenArchive(path.c_str(), 0, 0, phMpq))
            return true;
        else
        {
            TC_LOG_ERROR("client.compressor", "  Error opening the archive (code: %u)", GetLastError());
            printf("  Error: %s", Util::GetLastErrorAsString().c_str());
            TC_LOG_ERROR("client.compressor", "  Error on file %s", path.c_str());
            return false;
        }
    }

    bool AddFileToMPQ(fs::path from, fs::path to, HANDLE* mpq, bool replace)
    {
        DWORD dwFlags; // dwCompression, dwCompressionNext;

        if (boost::iequals(from.extension().string(), "wav"))
            dwFlags = MPQ_FILE_COMPRESS | MPQ_FILE_ENCRYPTED;
        else if ((boost::iequals(from.extension().string(), "mp3"))
            || (boost::iequals(from.extension().string(), "smk"))
            || (boost::iequals(from.extension().string(), "bik"))
            || (boost::iequals(from.extension().string(), "mpq")))
            dwFlags = 0;
        else
            dwFlags = MPQ_FILE_COMPRESS | MPQ_FILE_ENCRYPTED;

        if (replace)
            dwFlags |= MPQ_FILE_REPLACEEXISTING;

        //if (dwFlags & MPQ_FILE_COMPRESS)
        //    SFileAddFileEx(mpq, from.string().c_str(), to.string().c_str(), dwFlags, dwCompression, dwCompressionNext);
        //else
        return SFileAddFile(*mpq, from.string().c_str(), to.string().c_str(), dwFlags);
    }

    bool AddDirToMPQ(fs::path from, fs::path to, HANDLE* mpq, bool replace)
    {
        if (!fs::exists(from) || !fs::is_directory(from))
            return false;

        fs::directory_iterator end_itr;
        for (fs::directory_iterator i(from); i != end_itr; ++i)
            if (fs::is_directory(i->status()))
                AddDirToMPQ(i->path(), to / i->path().filename(), mpq, replace);
            else
                AddFileToMPQ(i->path(), to / i->path().filename(), mpq, replace);
        return true;
    }

    bool BuildVersion(fs::path dest, uint32 build, uint32 major, uint32 minor, uint32 bugfix)
    {
#ifndef WIN32
        printf("\nThis programm only works on windows");
        return;
#endif

        QueryResult result;

        if (!build)
        {
            result = LoginDatabase.Query("SELECT Build FROM versions ORDER BY Build DESC LIMIT 1");
            build = result->Fetch()->GetUInt32();
            if (!build)
                return false;
        }

        if (!major && !minor && !bugfix)
        {
            std::stringstream select_query;
            select_query << "SELECT MajorVersion, MinorVersion, BugfixVersion FROM versions WHERE Build = " << build;
            result = LoginDatabase.Query(select_query.str().c_str());
            Field* fields = result->Fetch();
            major = fields[0].GetUInt32();
            minor = fields[1].GetUInt32();
            bugfix = fields[2].GetUInt32();
        }

        if (fs::exists(dest))
            fs::remove_all(dest);
        else if (!fs::exists(dest.parent_path()))
            fs::create_directories(dest.parent_path());
        else if (!fs::is_directory(dest.parent_path()))
            return false;

        TCHAR NPath[MAX_PATH];
        GetCurrentDirectory(MAX_PATH, NPath);
        SetCurrentDirectory(UpdatePath.string().c_str());

        fs::path buildVersion_exe("bin\\BuildVersion.exe");
        std::stringstream buildVersion_cmd;
        buildVersion_cmd << buildVersion_exe.string() << " --file=" << dest.string()
            << " --Major=\"" << major << "\" --Minor=\"" << minor << "\" --Bugfix=\"" << bugfix << "\" --Build=\"" << build << "\"" << std::endl;
        Util::exec(buildVersion_cmd.str().c_str());

        SetCurrentDirectory(NPath);
        if (!fs::exists(dest))
        {
            printf("\n  Error generating Wow.exe");
            return false;
        }
        return true;
    }

    void ExtractZMP(fs::path path)
    {
        FILE* zmpFile;
        uint32 err = fopen_s(&zmpFile, path.string().c_str(), "rb");

        fseek(zmpFile, 0, SEEK_END);
        if (err || feof(zmpFile) || !ftell(zmpFile))
        {
            if (!err)
                fclose(zmpFile);
            return;
        }
        fseek(zmpFile, 0, SEEK_SET);

        std::string filename = path.filename().string();
        std::string name = filename.substr(0, filename.length() - 4);

        std::string sqlPath = fs::path(PatchOutputPath / (filename + ".sql")).string();
        FILE* sqlFile;
        err = fopen_s(&sqlFile, sqlPath.c_str(), "w");

        std::string testPath = fs::path(PatchOutputPath / (filename + ".test.sql")).string();
        FILE* testFile;
        err = fopen_s(&testFile, testPath.c_str(), "w");

        QueryResult result = WorldDatabase.PQuery("SELECT Id FROM worldmapareadbc WHERE InternalName = \"%s\"", name.c_str());
        uint32 id = 0;
        if (result)
        {
            Field* fields = result->Fetch();
            id = fields[0].GetUInt32();
        }

        for (uint32 i = 0; i < 16384; ++i)
        {
            uint32 area;
            fread(&area, 4, 1, zmpFile);
            if (area)
                fprintf(sqlFile, "\nINSERT INTO zmp_files (id, x, y, area) VALUES ('%u', '%u', '%u', '%u');", id, i / 128, i % 128, area);
            if (i % 128 == 0)
                fprintf(testFile, "\n");
            fprintf(testFile, "%u ", area);
        }
        fprintf(sqlFile, "\n");
        fprintf(testFile, "\n");

        fclose(zmpFile);
    }

}
