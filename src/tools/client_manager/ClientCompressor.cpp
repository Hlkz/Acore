
#include "ClientManager.h"

#include "Timer.h"
#include <String.h>
#include <iostream>
#include <iomanip>
#include <boost/algorithm/string.hpp>

#include "StormLib/StormLib.h"
#include "StormLib/StormCommon.h"

ClientCompressor::ClientCompressor(po::variables_map vm)
{
    mFlags = 0;
    if (vm.count("c-all"))
        mFlags |= COMPRESS_ALL;
    else if (vm.count("c-alle"))
        mFlags |= COMPRESS_ALLE;
    else
    {
        if (vm.count("c-common"))
            mFlags |= COMPRESS_COMMON;
        if (vm.count("c-common2"))
            mFlags |= COMPRESS_COMMON2;
        if (vm.count("c-lichking"))
            mFlags |= COMPRESS_LICHKING;
        if (vm.count("c-locale"))
            mFlags |= COMPRESS_LOCALE;
        if (vm.count("c-speech"))
            mFlags |= COMPRESS_SPEECH;
        if (vm.count("c-patch"))
            mFlags |= COMPRESS_PATCH;
    }
    if (vm.count("c-install"))
        mFlags |= COMPRESS_INSTALL;
    if (vm.count("c-release"))
        mFlags |= COMPRESS_RELEASE;
    if (vm.count("c-udbc"))
        mFlags |= UPDATE_DBC;
    if (vm.count("c-ulua"))
        mFlags |= UPDATE_LUA;
    if (!mFlags)
        return;

    mVm = vm;

    PatchOutputPath = sConfigMgr->GetStringDefault("PatchOutputPath", "D:\\A\\Client\\Manager\\Output");
    ReleasePath = sConfigMgr->GetStringDefault("ReleasePath", "D:\\A\\Client\\Manager\\Release");
    GameDataPath = sConfigMgr->GetStringDefault("GameDataPath", "D:\\A\\Client\\Aviana\\Data");

    Proceed();
}

bool ClientCompressor::Proceed()
{
    if (PatchOutputPath.string().length() < 10)
        return false;
    uint32 oldMSTime = getMSTime();
    std::cout << "\nCompressor";

    // Compress TinyData &| TinyLoc &| TinyPatch
    if (mFlags & COMPRESS_ALL)
        Compress();

    // Install compressed Tiny to GamePath
    if (mFlags & (COMPRESS_INSTALL))
        InstallPatches();

    if (mFlags & COMPRESS_RELEASE)
        ReleaseFullVersion();

    // Update dbc/lua in client (test function)
    if (mFlags & UPDATE_DBC || mFlags & UPDATE_LUA)
    {
        if (fs::exists(GameDataPath / "frFR"))
            UpdatePatchMPQ(LOCALE_frFR);
        if (fs::exists(GameDataPath / "enUS"))
            UpdatePatchMPQ(LOCALE_enUS);
    }

    printf("\nCompressor executed in %u ms\n", GetMSTimeDiffToNow(oldMSTime));
    return true;
}

void ClientCompressor::Compress()
{
    SaveOutput();

    if (mFlags & COMPRESS_ALL_LOC)
    {
        fs::create_directories(PatchOutputPath / "frFR");
        fs::create_directories(PatchOutputPath / "enUS");
    }

    // Patch
    if (mFlags & COMPRESS_PATCH)
    {
        GeneratePatchMPQ(LOCALE_frFR);
        GeneratePatchMPQ(LOCALE_enUS);
    }
    // Mixed
    if (mFlags & COMPRESS_COMMON)
        GenerateCommonMPQ();
    if (mFlags & COMPRESS_COMMON2)
        GenerateCommon2MPQ();
    if (mFlags & COMPRESS_LICHKING)
        GenerateLichkingMPQ();
    // frFR
    if (mFlags & COMPRESS_LOCALE)
        GenerateLocaleMPQ(LOCALE_frFR);
    if (mFlags & COMPRESS_SPEECH)
        GenerateSpeechMPQ(LOCALE_frFR);
    // enUS
    if (mFlags & COMPRESS_LOCALE)
        GenerateLocaleMPQ(LOCALE_enUS);
    if (mFlags & COMPRESS_SPEECH)
        GenerateSpeechMPQ(LOCALE_enUS);
}

bool ClientCompressor::SaveOutput()
{
    bool save = false;
    boost::filesystem::directory_iterator end_itr;
    for (boost::filesystem::directory_iterator i(PatchOutputPath); i != end_itr; ++i)
        if (!fs::is_directory(i->status()) || !boost::regex_match(i->path().filename().string(), boost::regex("[0-9]{4}-[0-9]{2}-[0-9]{2}.*")))
            save = true;

    if (save)
    {
        printf("\n  Saving Output");
        time_t t;
        time(&t);
        tm* time = localtime(&t);
        std::stringstream saveDir;
        saveDir << PatchOutputPath.string() << "/" << std::setw(4) << std::setfill('0') << time->tm_year + 1900 << "-" << std::setw(2) << time->tm_mon + 1 << "-" << std::setw(2) << time->tm_mday;
        fs::path savePath(saveDir.str());
        uint8 i = 0;
        while (fs::exists(savePath))
        {
            i++;
            std::ostringstream saveString;
            saveString << saveDir.str() << "_" << (uint32)i;
            savePath = fs::path(saveString.str());

        }
        fs::create_directories(savePath);
        boost::filesystem::directory_iterator end_itr;
        for (boost::filesystem::directory_iterator i(PatchOutputPath); i != end_itr; ++i)
            if (!fs::is_directory(i->status()) || !boost::regex_match(i->path().filename().string(), boost::regex("[0-9]{4}-[0-9]{2}-[0-9]{2}.*")))
                fs::rename(i->path(), savePath / i->path().filename());
    }
    return true;
}

void ClientCompressor::GenerateCommonMPQ()
{
    printf("\n  Starting Common generation");
    fs::path commonPath(PatchOutputPath / "common.mpq");
    HANDLE common;
    SFileCreateArchive(commonPath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, COMMONMAXFILES, &common);

    Manager::AddDirToMPQ(TinyDataPath + "\\_shaders", "_shaders", &common);
    Manager::AddDirToMPQ(TinyDataPath + "\\Cameras", "Cameras", &common);
    Manager::AddDirToMPQ(TinyDataPath + "\\Character", "Character", &common);
    Manager::AddDirToMPQ(TinyDataPath + "\\Environments", "Environments", &common);
    Manager::AddDirToMPQ(TinyDataPath + "\\Interiors", "Interiors", &common);
    Manager::AddDirToMPQ(TinyDataPath + "\\Item", "Item", &common);
    Manager::AddDirToMPQ(TinyDataPath + "\\Particles", "Particles", &common);
    Manager::AddDirToMPQ(TinyDataPath + "\\shaders", "shaders", &common);
    Manager::AddDirToMPQ(TinyDataPath + "\\Spell", "Spell", &common);
    Manager::AddDirToMPQ(TinyDataPath + "\\Spells", "Spells", &common);
    Manager::AddDirToMPQ(TinyDataPath + "\\Textures", "Textures", &common);
    Manager::AddDirToMPQ(TinyDataPath + "\\Tileset", "Tileset", &common);
    Manager::AddDirToMPQ(TinyDataPath + "\\WTF", "WTF", &common);
    Manager::AddDirToMPQ(TinyDataPath + "\\XTextures", "XTextures", &common);
    Manager::AddFileToMPQ(TinyDataPath + "\\signaturefile", "signaturefile", &common);
    Manager::AddFileToMPQ(TinyDataPath + "\\component.wow-data.txt", "component.wow-data.txt", &common);

    SFileCloseArchive(common);
    printf("\n  Ending Common generation");
}

void ClientCompressor::GenerateCommon2MPQ()
{
    printf("\n  Starting Common2 generation");
    fs::path common2Path(PatchOutputPath / "common-2.mpq");
    HANDLE common2;
    SFileCreateArchive(common2Path.string().c_str(), MPQ_CREATE_ARCHIVE_V2, COMMON2MAXFILES, &common2);

    Manager::AddDirToMPQ(TinyDataPath + "\\Sound", "Sound", &common2);

    SFileCloseArchive(common2);
    printf("\n  Ending Common2 generation");
}

void ClientCompressor::GenerateLichkingMPQ()
{
    printf("\n  Starting Lichking generation");
    fs::path lichkingPath(PatchOutputPath / "lichking.mpq");
    HANDLE lichking;
    SFileCreateArchive(lichkingPath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, LICHKINGMAXFILES, &lichking);

    Manager::AddDirToMPQ(TinyDataPath + "\\Creature", "Creature", &lichking);
    Manager::AddDirToMPQ(TinyDataPath + "\\Dungeons", "Dungeons", &lichking);
    Manager::AddDirToMPQ(TinyDataPath + "\\World", "World", &lichking);

    SFileCloseArchive(lichking);
    printf("\n  Ending Lichking generation");
}

void ClientCompressor::GenerateLocaleMPQ(uint8 loc)
{
    printf("\n  Starting Locale generation ");
    std::string locs = loc ? "frFR" : "enUS";
    std::cout << locs;
    std::string prefix = loc ? TinyDataPathFr : TinyDataPathEn;
    fs::path localePath(PatchOutputPath / locs / ("locale-" + locs + ".mpq"));
    HANDLE locale;
    SFileCreateArchive(localePath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, PATCHMAXFILES, &locale);

    Manager::AddDirToMPQ(prefix + "\\Fonts", "Fonts", &locale);
    Manager::AddDirToMPQ(prefix + "\\Interface", "Interface", &locale);
    Manager::AddFileToMPQ(prefix + "\\Wow.ini", "Wow.ini", &locale);
    Manager::AddFileToMPQ(prefix + "\\component.wow-" + locs + ".txt", "component.wow-" + locs + ".txt", &locale);

    SFileCloseArchive(locale);
    printf("\n  Ending Locale generation");
}

void ClientCompressor::GenerateSpeechMPQ(uint8 loc)
{
    printf("\n  Starting Speech generation ");
    std::string locs = loc ? "frFR" : "enUS";
    std::cout << locs;
    std::string prefix = loc ? TinyDataPathFr : TinyDataPathEn;
    fs::path speechPath(PatchOutputPath / locs / ("speech-" + locs + ".mpq"));
    HANDLE speech;
    SFileCreateArchive(speechPath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, PATCHMAXFILES, &speech);

    Manager::AddDirToMPQ(prefix + "\\Sound", "Sound", &speech);

    SFileCloseArchive(speech);
    printf("\n  Ending Speech generation");
}

void ClientCompressor::GeneratePatchMPQ(uint8 loc)
{
    printf("\n  Starting Patch generation ");
    std::string locs = loc ? "frFR" : "enUS";
    std::cout << locs;
    std::string prefix = TinyPatchPath + "\\" + locs;
    fs::path patchPath(PatchOutputPath / locs / ("patch-" + locs + ".mpq"));
    HANDLE patch;
    SFileCreateArchive(patchPath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, PATCHMAXFILES, &patch);

    Manager::AddDirToMPQ(prefix + "\\DBFilesClient", "DBFilesClient", &patch);
    Manager::AddDirToMPQ(prefix + "\\Interface", "Interface", &patch);

    SFileCloseArchive(patch);
    printf("\n  Ending Patch generation");
}

void ClientCompressor::UpdatePatchMPQ(uint8 loc)
{
    printf("\n  Updating Patch ");
    std::string locs = loc ? "frFR" : "enUS";
    std::cout << locs;
    std::string prefix = TinyPatchPath + "\\" + locs;
    fs::path patchPath(GameDataPath / locs / ("patch-" + locs + ".mpq"));
    HANDLE patch;

    if (SFileOpenArchive(patchPath.string().c_str(), 0, 0, &patch))
    {
        if (mFlags & UPDATE_DBC)
        {
            std::cout << " dbc";
            Manager::AddDirToMPQ(prefix + "\\DBFilesClient", "DBFilesClient", &patch, true);
        }
        if (mFlags & UPDATE_LUA)
        {
            std::cout << " lua";
            Manager::AddDirToMPQ(prefix + "\\Interface", "Interface", &patch, true);
        }
        printf("\n  Compacting...");
        SFileCompactArchive(patch, NULL, 0);
        SFileCloseArchive(patch);
    }
    else
        printf("\n  Error opening the archive (code: %u)", GetLastError());

    //printf("\n  Ending Patch update");
}

void ClientCompressor::InstallPatches()
{
    fs::path installTo = GameDataPath;
    printf("\n  Installing Patches");
    boost::filesystem::directory_iterator end_itr;
    for (boost::filesystem::directory_iterator i(PatchOutputPath); i != end_itr; ++i)
        if (!fs::is_directory(i->status()) || !boost::regex_match(i->path().filename().string(), boost::regex("[0-9]{4}-[0-9]{2}-[0-9]{2}.*")))
        {
            fs::path from(i->path());
            fs::path to(installTo / from.filename());
            if (fs::is_directory(from))
            {
                if (fs::exists(to) && fs::is_directory(to))
                {
                    for (boost::filesystem::directory_iterator j(from); j != end_itr; ++j)
                    {
                        fs::path dest(to / j->path().filename());
                        if (fs::exists(dest))
                            fs::remove_all(dest);
                        fs::rename(j->path(), dest);
                    }
                    fs::remove_all(from);
                }
            }
            else
            {
                if (fs::exists(to))
                    fs::remove_all(to);
                fs::rename(from, to);
            }
        }
    //printf("\n  Ending Patches installation");
}

bool ClientCompressor::ReleaseFullVersion()
{
#ifndef WIN32
    printf("\nThis programm only works on windows");
    return;
#endif
    SetCurrentDirectory(ReleasePath.string().c_str());

    FullVersion fv;
    fv.SourcePath = ManagerDataPath / "Source";
    if (!fs::exists(fv.SourcePath))
        return false;

    QueryResult result;
    result = LoginDatabase.Query("SELECT Build, MajorVersion, MinorVersion, BugfixVersion, TimeStamp FROM versions ORDER BY Build DESC LIMIT 1");
    Field* fields = result->Fetch();
    fv.Build = fields[0].GetUInt32();
    fv.Major = fields[1].GetUInt32();
    fv.Minor = fields[2].GetUInt32();
    fv.Bugfix = fields[3].GetUInt32();
    fv.Timestamp = fields[4].GetUInt32();

    fv.ClientName = sConfigMgr->GetStringDefault("ClientName", "Aviana");
    PrepareFullVersion(&fv, "frFR");
    PrepareFullVersion(&fv, "enUS");
    return true;
}

void ClientCompressor::PrepareFullVersion(FullVersion* fv, std::string loc)
{
    printf(std::string("\n  Generating FullVersion " + loc).c_str());
    std::stringstream ssName;
    ssName << fv->ClientName << "-" << fv->Major << "." << fv->Minor << "." << fv->Bugfix << "-" << loc;
    std::string clientName(ssName.str());
    fs::path clientPath(ReleasePath / clientName);
    if (fs::exists(clientPath))
        fs::remove_all(clientPath);
    Util::CpyDir(fv->SourcePath, clientPath);
    Manager::BuildVersion(clientPath / "Wow.exe");

    fs::path dataPath(clientPath / "Data");
    Util::CpyDir(PatchOutputPath / loc, dataPath / loc);
    Util::CpyFile(PatchOutputPath / "common.mpq", dataPath / "common.mpq");
    Util::CpyFile(PatchOutputPath / "common-2.mpq", dataPath / "common-2.mpq");
    Util::CpyFile(PatchOutputPath / "lichking.mpq", dataPath / "lichking.mpq"); 
    std::ofstream(fs::path(dataPath / loc / "realmlist.wtf").string(), std::ios_base::out | std::ios_base::app)
        << "set realmlist " << sConfigMgr->GetStringDefault("RealmlistAddress", "auth.aviana-online.com");

    printf("\n    Generating Torrent");
    std::string torrentName(clientName + ".torrent");
    fs::path torrentPath(ReleasePath / torrentName);
    std::string announcePath(sConfigMgr->GetStringDefault("AnnounceAddress", "http://localhost/announce"));
    Util::exec("bin\\transmission-create.exe " + clientName + " --tracker " + announcePath);

    std::string clhash = Util::exec("bin\\cl_torrent_hash.exe " + torrentPath.string());
    unsigned char info_hash[20];
    for (std::size_t pos = 0; pos < 20; pos = pos ++)
    {
        int32 num = strtol(clhash.substr(2 * pos, 2).c_str(), NULL, 16);
        info_hash[pos] = num;
    }
    std::string delete_query = "DELETE FROM tracker_files WHERE file_name = \"" + clientName + "\"";
    LoginDatabase.Query(delete_query.c_str());
    PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_INS_PATCH);
    stmt->setString(0, std::string((char*)info_hash));
    stmt->setString(1, clientName);
    stmt->setString(2, "");
    LoginDatabase.Execute(stmt);
}
