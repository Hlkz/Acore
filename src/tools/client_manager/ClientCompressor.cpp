
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
    if (vm.count("c-full"))
        mFlags |= COMPRESS_FULLDATA;

    mVm = vm;

    ReleasePath = sConfigMgr->GetStringDefault("ReleasePath", "D:\\A\\Client\\Manager\\Release");
    GameDataPath = sConfigMgr->GetStringDefault("GameDataPath", "D:\\A\\Client\\Aviana\\Data");

    Proceed();
}

bool ClientCompressor::Proceed()
{
    if (PatchOutputPath.string().length() < 10)
        return false;
    uint32 oldMSTime = getMSTime();
    TC_LOG_INFO("client.selector", "ClientCompressor");

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

    TC_LOG_INFO("client.compressor", "Compressor executed in %u ms\n", GetMSTimeDiffToNow(oldMSTime));
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
        TC_LOG_INFO("client.compressor", "  Saving Output");
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
    TC_LOG_INFO("client.compressor", "  Starting Common generation");
    fs::path commonPath(PatchOutputPath / "common.mpq");
    HANDLE common;
    SFileCreateArchive(commonPath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, mFlags & COMPRESS_FULLDATA ? FULLCOMMONMAXFILES : COMMONMAXFILES, &common);
    fs::path dataPath = mFlags & COMPRESS_FULLDATA ? FullDataPath : TinyDataPath;

    Manager::AddDirToMPQ(dataPath / "_shaders", "_shaders", &common);
    Manager::AddDirToMPQ(dataPath / "Cameras", "Cameras", &common);
    Manager::AddDirToMPQ(dataPath / "Character", "Character", &common);
    Manager::AddDirToMPQ(dataPath / "Environments", "Environments", &common);
    Manager::AddDirToMPQ(dataPath / "Interiors", "Interiors", &common);
    Manager::AddDirToMPQ(dataPath / "Item", "Item", &common);
    Manager::AddDirToMPQ(dataPath / "Particles", "Particles", &common);
    Manager::AddDirToMPQ(dataPath / "shaders", "shaders", &common);
    Manager::AddDirToMPQ(dataPath / "Spell", "Spell", &common);
    Manager::AddDirToMPQ(dataPath / "Spells", "Spells", &common);
    Manager::AddDirToMPQ(dataPath / "Textures", "Textures", &common);
    Manager::AddDirToMPQ(dataPath / "Tileset", "Tileset", &common);
    Manager::AddDirToMPQ(dataPath / "WTF", "WTF", &common);
    Manager::AddDirToMPQ(dataPath / "XTextures", "XTextures", &common);
    Manager::AddFileToMPQ(dataPath / "signaturefile", "signaturefile", &common);
    Manager::AddFileToMPQ(dataPath / "component.wow-data.txt", "component.wow-data.txt", &common);

    SFileCloseArchive(common);
    TC_LOG_INFO("client.compressor", "  Ending Common generation");
}

void ClientCompressor::GenerateCommon2MPQ()
{
    TC_LOG_INFO("client.compressor", "  Starting Common2 generation");
    fs::path common2Path(PatchOutputPath / "common-2.mpq");
    HANDLE common2;
    SFileCreateArchive(common2Path.string().c_str(), MPQ_CREATE_ARCHIVE_V2, COMMON2MAXFILES, &common2);
    fs::path dataPath = mFlags & COMPRESS_FULLDATA ? FullDataPath : TinyDataPath;

    Manager::AddDirToMPQ(dataPath / "Sound", "Sound", &common2);

    SFileCloseArchive(common2);
    TC_LOG_INFO("client.compressor", "  Ending Common2 generation");
}

void ClientCompressor::GenerateLichkingMPQ()
{
    TC_LOG_INFO("client.compressor", "  Starting Lichking generation");
    fs::path lichkingPath(PatchOutputPath / "lichking.mpq");
    HANDLE lichking;
    SFileCreateArchive(lichkingPath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, mFlags & COMPRESS_FULLDATA ? FULLLICHKINGMAXFILES : LICHKINGMAXFILES, &lichking);
    fs::path dataPath = mFlags & COMPRESS_FULLDATA ? FullDataPath : TinyDataPath;

    Manager::AddDirToMPQ(dataPath / "Creature", "Creature", &lichking);
    Manager::AddDirToMPQ(dataPath / "Dungeons", "Dungeons", &lichking);
    Manager::AddDirToMPQ(dataPath / "World", "World", &lichking);

    SFileCloseArchive(lichking);
    TC_LOG_INFO("client.compressor", "  Ending Lichking generation");
}

void ClientCompressor::GenerateLocaleMPQ(uint8 loc)
{
    std::string locs = loc ? "frFR" : "enUS";
    TC_LOG_INFO("client.compressor", "  Starting Locale generation %s", locs.c_str());
    fs::path localePath(PatchOutputPath / locs / ("locale-" + locs + ".mpq"));
    HANDLE locale;
    SFileCreateArchive(localePath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, PATCHMAXFILES, &locale);
    fs::path dataPath = mFlags & COMPRESS_FULLDATA ? (loc ? FullDataPathFr : FullDataPathEn) : (loc ? TinyDataPathFr : TinyDataPathEn);

    Manager::AddDirToMPQ(dataPath / "Fonts", "Fonts", &locale);
    Manager::AddDirToMPQ(dataPath / "Interface", "Interface", &locale);
    Manager::AddFileToMPQ(dataPath / "Wow.ini", "Wow.ini", &locale);
    Manager::AddFileToMPQ(dataPath / ("component.wow-" + locs + ".txt"), "component.wow-" + locs + ".txt", &locale);

    SFileCloseArchive(locale);
    TC_LOG_INFO("client.compressor", "  Ending Locale generation");
}

void ClientCompressor::GenerateSpeechMPQ(uint8 loc)
{
    std::string locs = loc ? "frFR" : "enUS";
    TC_LOG_INFO("client.compressor", "  Starting Speech generation %s", locs.c_str());
    fs::path speechPath(PatchOutputPath / locs / ("speech-" + locs + ".mpq"));
    HANDLE speech;
    SFileCreateArchive(speechPath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, PATCHMAXFILES, &speech);
    fs::path dataPath = mFlags & COMPRESS_FULLDATA ? (loc ? FullDataPathFr : FullDataPathEn) : (loc ? TinyDataPathFr : TinyDataPathEn);

    Manager::AddDirToMPQ(dataPath / "Sound", "Sound", &speech);

    SFileCloseArchive(speech);
    TC_LOG_INFO("client.compressor", "  Ending Speech generation");
}

void ClientCompressor::GeneratePatchMPQ(uint8 loc)
{
    if (mFlags & COMPRESS_FULLDATA)
    {
        TC_LOG_INFO("client.compressor", "  Can't generate Patch for FullData");
        return;
    }

    std::string locs = loc ? "frFR" : "enUS";
    TC_LOG_INFO("client.compressor", "  Starting Patch generation %s", locs.c_str());
    std::string prefix = TinyPatchPath + "\\" + locs;
    fs::path patchPath(PatchOutputPath / locs / ("patch-" + locs + ".mpq"));
    HANDLE patch;
    SFileCreateArchive(patchPath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, PATCHMAXFILES, &patch);

    Manager::AddDirToMPQ(prefix + "\\DBFilesClient", "DBFilesClient", &patch);
    Manager::AddDirToMPQ(prefix + "\\Interface", "Interface", &patch);

    SFileCloseArchive(patch);
    TC_LOG_INFO("client.compressor", "  Ending Patch generation");
}

void ClientCompressor::UpdatePatchMPQ(uint8 loc)
{
    std::string locs = loc ? "frFR" : "enUS";
    TC_LOG_INFO("client.compressor", "  Updating Patch %s", locs.c_str());
    std::string prefix = TinyPatchPath + "\\" + locs;
    fs::path patchPath(GameDataPath / locs / ("patch-" + locs + ".mpq"));
    HANDLE patch;

    if (Manager::OpenMPQ(patchPath.string(), &patch))
    {
        if (mFlags & UPDATE_DBC)
            Manager::AddDirToMPQ(prefix + "\\DBFilesClient", "DBFilesClient", &patch, true);
        if (mFlags & UPDATE_LUA)
            Manager::AddDirToMPQ(prefix + "\\Interface", "Interface", &patch, true);
        TC_LOG_INFO("client.compressor", "  Compacting...");
        SFileCompactArchive(patch, NULL, 0);
        SFileCloseArchive(patch);
    }
    //TC_LOG_INFO("client.compressor", "  Ending Patch update");
}

void ClientCompressor::InstallPatches()
{
    fs::path installTo = GameDataPath;
    TC_LOG_INFO("client.compressor", "  Installing Patches");
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
    //TC_LOG_INFO("client.compressor", "  Ending Patches installation");
}

bool ClientCompressor::ReleaseFullVersion()
{
#ifndef WIN32
    TC_LOG_INFO("client.compressor", "This programm only works on windows");
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
    TC_LOG_INFO("client.compressor", "  Generating FullVersion %s", loc.c_str());
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

    TC_LOG_INFO("client.compressor", "    Generating Torrent");
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
    stmt->setString(0, ByteArrayToHexStr(info_hash, 20));
    stmt->setString(1, clientName);
    stmt->setString(2, "");
    LoginDatabase.Execute(stmt);
}
