
#include "ClientManager.h"

#include "Timer.h"
#include "SHA1.h"
#include <iostream>
#include <bitset>
#include <boost/algorithm/string.hpp>

#include "StormLib/StormLib.h"
#include "StormLib/StormCommon.h"

ClientPatcher::ClientPatcher(po::variables_map vm)
{
    mFlags = 0;
    if (vm.count("p-version"))
        mFlags |= PATCH_VERSION;
    if (vm.count("p-update"))
        mFlags |= PATCH_UPDATE;
    if (!mFlags)
        return;
    if (vm.count("p-patch"))
        mFlags |= PATCH_ONLY;
    if (vm.count("p-release"))
        mFlags |= PATCH_RELEASE;

    mVm = vm;

    Proceed();
}

bool ClientPatcher::Proceed()
{
    uint32 oldMSTime = getMSTime();
    std::cout << "\nPatcher";

    if (mFlags & PATCH_VERSION)
        CommitVersion();

    if (mFlags & PATCH_UPDATE)
        ReleaseUpdate();

    printf("\nPatcher executed in %u ms\n", GetMSTimeDiffToNow(oldMSTime));
    return true;
}

void ClientPatcher::CommitVersion()
{
    uint32 build, major, minor, bugfix;
    std::string hotfix, gitcmd;
    build = sConfigMgr->GetIntDefault("NewClientBuild", 10000);
    major = sConfigMgr->GetIntDefault("NewMajorVersion", 1);
    minor = sConfigMgr->GetIntDefault("NewMinorVersion", 0);
    bugfix = sConfigMgr->GetIntDefault("NewBugfixVersion", 0);
    hotfix = sConfigMgr->GetStringDefault("NewHotfixVersion", "");

    // Check build
    QueryResult result;
    result = LoginDatabase.Query("SELECT Build FROM versions ORDER BY Build DESC LIMIT 1");
    uint32 lastBuild = result->Fetch()->GetUInt32();
    if (lastBuild >= build)
    {
        printf("\n  Error: build %u exist, cannot create build %u", lastBuild, build);
        return;
    }

    char buff[128];
    sprintf(buff, "%u.%u.%u%s (%u)", major, minor, bugfix, hotfix.c_str(), build);
    std::string Ammend(buff);
    printf("\nCommitting version %s", Ammend.c_str());
    // git commit
    printf("\n  git commit");
    printf("\n    Committing TinyData");
    Util::exec("git -C \"" + TinyDataPath + "\" commit --allow-empty -m  \"" + Ammend + "\"");
    printf("\n    Committing TinyLoc");
    Util::exec("git -C \"" + TinyLocPath + "\" commit --allow-empty -m  \"" + Ammend + "\"");
    printf("\n    Committing TinyPatch");
    Util::exec("git -C \"" + TinyPatchPath + "\" commit --allow-empty -m  \"" + Ammend + "\"");
    // database save
    printf("\n  database save");
    std::stringstream insert_query;
    insert_query << "INSERT INTO versions (Build, MajorVersion, MinorVersion, BugfixVersion, HotfixVersion, FullHash, LocHash, PatchHash, TimeStamp) "
        << "VALUES(" << build << ", " << major << ", " << minor << ", " << bugfix << ", \"" << hotfix << "\", \""
        << Util::exec("git -C \"" + TinyDataPath + "\" log --format=\"%H\" -n 1") << "\", \""
        << Util::exec("git -C \"" + TinyLocPath + "\" log --format=\"%H\" -n 1") << "\", \""
        << Util::exec("git -C \"" + TinyPatchPath + "\" log --format=\"%H\" -n 1") << "\", " << std::time(nullptr) << ")";
    LoginDatabase.Query(insert_query.str().c_str());
    // realmlist update
    insert_query.str("");
    insert_query << "UPDATE realmlist SET gamebuild = " << build;
    LoginDatabase.Query(insert_query.str().c_str());
}

void ClientPatcher::ReleaseUpdate()
{
#ifndef WIN32
    printf("\nThis programm only works on windows");
    return;
#endif

    QueryResult result;
    Update up;

    if (mVm.count("p-updatefrom"))
        up.fromBuild = mVm["p-updatefrom"].as<uint32>();
    //if (mVm.count("p-updateto"))
    //    installTo = mVm["p-updateto"].as<uint32>();

    //if (!up.fromBuild && up.toBuild)
    //{
    //    printf("\n  You cant specify to which build install without specifying from which one");
    //    return;
    //}
    if (!up.fromBuild)
    {
        result = LoginDatabase.Query("SELECT Build FROM versions ORDER BY Build DESC LIMIT 2");

        up.toBuild = result->Fetch()->GetUInt32();
        if (result->NextRow())
            up.fromBuild = result->Fetch()->GetUInt32();
        else
        {
            printf("\n  There is only one client version");
            return;
        }
    }
    if (!up.toBuild)
    {
        result = LoginDatabase.Query("SELECT Build FROM versions ORDER BY Build DESC LIMIT 1");
        up.toBuild = result->Fetch()->GetUInt32();
    }
    if (up.fromBuild >= up.toBuild)
    {
        printf("\n  Cannot update a version (%u) to an older one (%u)", up.fromBuild, up.toBuild);
        return;
    }

    std::string fromFullHash, fromLocHash, fromPatchHash, toFullHash, toLocHash, toPatchHash;
    std::stringstream select_query;
    select_query << "SELECT MajorVersion, MinorVersion, BugfixVersion, FullHash, LocHash, PatchHash FROM versions WHERE Build = " << up.fromBuild;
    result = LoginDatabase.Query(select_query.str().c_str());
    Field* fields = result->Fetch();
    up.fromMajor = fields[0].GetUInt32();
    up.fromMinor = fields[1].GetUInt32();
    up.fromBugfix = fields[2].GetUInt32();
    fromFullHash = fields[3].GetString();
    fromLocHash = fields[4].GetString();
    fromPatchHash = fields[5].GetString();

    select_query.str("");
    select_query << "SELECT MajorVersion, MinorVersion, BugfixVersion, FullHash, LocHash, PatchHash, TimeStamp FROM versions WHERE Build = " << up.toBuild;
    result = LoginDatabase.Query(select_query.str().c_str());
    fields = result->Fetch();
    up.toMajor = fields[0].GetUInt32();
    up.toMinor = fields[1].GetUInt32();
    up.toBugfix = fields[2].GetUInt32();
    toFullHash = fields[3].GetString();
    toLocHash = fields[4].GetString();
    toPatchHash = fields[5].GetString();
    up.toTimeStamp = fields[6].GetUInt32();

    printf("\nInstalling from build %u to build %u", up.fromBuild, up.toBuild);

    printf("\n  Cleaning Installer dir");
    fs::remove_all(UpdatePath / "data");
    fs::remove_all(UpdatePath / "frFR");
    fs::remove_all(UpdatePath / "enUS");
    fs::remove_all(UpdatePath / "installers");
    fs::remove_all(UpdatePath / "downloaders");
    fs::create_directory(UpdatePath / "installers");
    fs::create_directory(UpdatePath / "downloaders");

    printf("\n  Extracting git diff");
    if (!(mFlags & PATCH_ONLY))
    {
        ExtractGitDiff(TinyDataPath, fromFullHash, toFullHash, "TinyData.diff");
        ExtractGitDiff(TinyLocPath, fromLocHash, toLocHash, "TinyLoc.diff");
    }
    ExtractGitDiff(TinyPatchPath, fromPatchHash, toPatchHash, "TinyPatch.diff");

    printf("\n  Building Wow.exe");
    fs::path wow_exe(UpdatePath / "data/base/Wow.exe");
    if (!Manager::BuildVersion(wow_exe, up.toBuild, up.toMajor, up.toMinor, up.toBugfix))
        return;

    SetCurrentDirectory(UpdatePath.string().c_str());

    // Downloader base
    printf("\n  Building downloader base");
    AddMPQToFile(UpdatePath / "res" / "installer" / "base.exe", UpdatePath / "res" / "installer" / "skin", UpdatePath / "res" / "Installer.exe");
    AddMPQToFile(UpdatePath / "res" / "downloader" / "base.exe", UpdatePath / "res" / "downloader" / "skin", UpdatePath / "base.exe");

    if (fs::exists(UpdatePath / "data/enUS"))
        fs::rename(UpdatePath / "data/enUS", UpdatePath / "enUS");
    GenerateUpdate(&up, "frFR");
    if (fs::exists(UpdatePath / "enUS"))
        fs::rename(UpdatePath / "enUS", UpdatePath / "data/enUS");
    if (fs::exists(UpdatePath / "data/frFR"))
        fs::rename(UpdatePath / "data/frFR", UpdatePath / "frFR");
    GenerateUpdate(&up, "enUS");
    if (fs::exists(UpdatePath / "frFR"))
        fs::rename(UpdatePath / "frFR", UpdatePath / "data/frFR");

    // Delete temp files
    fs::remove(UpdatePath / "res" / "Installer.exe");
    fs::remove(UpdatePath / "base.exe");
    fs::remove(UpdatePath / "res" / "skin-installer.mpq");
    fs::remove(UpdatePath / "res" / "skin-downloader.mpq");
    fs::remove(UpdatePath / "prepatch.lst");
}

void ClientPatcher::AddMPQToFile(fs::path source, fs::path mpqsource, fs::path out)
{
    HANDLE mpq;
    fs::path mpqPath(UpdatePath / "res" / ("skin-" + mpqsource.parent_path().filename().string() + ".mpq"));
    if (fs::exists(mpqPath))
        fs::remove(mpqPath);
    SFileCreateArchive(mpqPath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, 0x200, &mpq);
    Manager::AddDirToMPQ(mpqsource, "", &mpq);
    SFileCloseArchive(mpq);

    std::ifstream skin_mpq(mpqPath.string(), std::ios::binary | std::ios::in | std::ios::ate);
    uint32 skinLength = skin_mpq.tellg();
    char* buffer = new char[skinLength];
    skin_mpq.seekg(skin_mpq.beg);
    skin_mpq.read(buffer, skinLength);
    skin_mpq.close();

    if (fs::exists(out))
        fs::remove(out);
    fs::copy_file(source, out);
    std::ofstream base(out.string(), std::ios::binary | std::ios::out | std::ios::app);
    base.write(buffer, skinLength);
    base.close();
}

void ClientPatcher::ExtractGitDiff(std::string path, std::string fromHash, std::string toHash, std::string filename)
{
    printf("\n    Generating %s", filename.c_str());
    fs::path diffPath(ManagerDataPath / filename);
    if (fs::exists(diffPath))
        fs::remove(diffPath);
    std::string gitcmd("git -C " + path + " diff " + fromHash + " " + toHash + " --name-status  >> " + ManagerDataPath.string() + "/" + filename);
    Util::exec(gitcmd.c_str());

    printf("\n    Extracting files from %s", filename.c_str());
    std::ifstream diffFile(diffPath.string());
    std::string str;
    while (std::getline(diffFile, str))
    {
        std::string prefix = str.substr(0, 1);
        if (str.length() < 4)
            continue;

        std::string file(str.substr(2, str.length() - 2));
        if (prefix == "M" || prefix == "A")
        {
            std::string from(path + "/" + file);
            fs::path to(UpdatePath / "data" / file);
            if (fs::exists(from))
            {
                if (fs::exists(to))
                    fs::remove(to);
                fs::create_directories(Util::RemoveName(to.string()));
                fs::copy_file(from, to);
            }
        }
        //else if (prefix == "D");
    }
    diffFile.close();
}

void ClientPatcher::GenerateUpdate(Update* up, std::string loc)
{
    std::stringstream fromss, toss, patchCmdStart, patchCmdEnd, baseName, mpqss;
    baseName << "wow-" << up->fromBuild << "-" << up->toBuild << "-" << loc;
    printf("\n  Generating %s", baseName.str().c_str());

    // Installer

    printf("\n    Preparing Installer");
    std::string installerName(baseName.str() + ".exe");
    fs::path installerPath(UpdatePath / "installers" / installerName);
    fromss << up->fromMajor << "." << up->fromMinor << "." << up->fromBugfix << "." << up->fromBuild;
    toss << up->toMajor << "." << up->toMinor << "." << up->toBugfix << "." << up->toBuild;
    patchCmdStart << "* set the product patch name" << std::endl
        << "PatchVersion This patch upgrades World of Warcraft from version " << fromss.str() << " to version " << toss.str() << "." << std::endl
        << "TargetVersion " << fromss.str() << std::endl
        << "SourceVersion " << toss.str() << std::endl
        << "Language ";
    patchCmdEnd << std::endl
        << "SetLauncher \"$(InstallPath)\\Wow.exe\"" << std::endl
        << "* SetUninstall $(WinDir)\\WoWUnin.dat" << std::endl
        << "Self \"Patch Installer\"" << std::endl
        << "WoWPatchIndex 2" << std::endl
        << "PatchSize 1992294400" << std::endl;

    fs::path patchCmd(UpdatePath / "res/data/patch.cmd");
    if (fs::exists(patchCmd))
        fs::remove(patchCmd);
    std::ofstream(patchCmd.string(), std::ios_base::out | std::ios_base::app) << patchCmdStart.str() << loc << patchCmdEnd.str();

    fs::path patchHtml(UpdatePath / "res/data/patch.html");
    if (fs::exists(patchHtml))
        fs::remove(patchHtml);
    std::ofstream(patchHtml.string(), std::ios_base::out | std::ios_base::app)
        << "<script language=\"javascript\">document.location=\"" << sConfigMgr->GetStringDefault("PatchNoteAddress", "localhost/patch") << "/" << up->toBuild << "-" << loc << "\";</script>";

    printf("\n    Generating Installer");
    Util::exec("bin\\headergenerator.exe data data_tmp");
    Util::exec("bin\\listgenerator.exe data_tmp data_tmp\\patch.lst");
    Util::CpyDir("res\\data", "data_tmp");
    Util::exec("bin\\mpqcreate.exe tmp.mpq data_tmp");
    Util::exec("bin\\append.exe res\\base.exe " + installerPath.string() + " tmp.mpq res\\Installer.exe res\\RichEd20.dll res\\Unicows.dll");
    fs::remove_all("data_tmp");
    fs::remove("tmp.mpq");

    fs::path piecesPath(installerName);
    if (fs::exists(piecesPath))
        fs::remove_all(piecesPath);
    uint32 pieceLength = 262144;
    std::stringstream fileSplitter;
    fileSplitter << "bin\\fileSplitter.exe " << installerPath.string() << " " << pieceLength << " " << piecesPath.string();
    Util::exec(fileSplitter.str());

    // Torrent
    printf("\n    Generating Torrent");
    std::string torrentName(installerName + ".torrent");
    fs::path torrentPath(UpdatePath / "downloaders" / torrentName);
    if (fs::exists(torrentPath))
        fs::remove(torrentPath);
    std::ofstream tor(torrentPath.string(), std::ios::out | std::ios::binary | std::ios::app);
    std::string announcePath(sConfigMgr->GetStringDefault("AnnounceAddress", "http://localhost/announce"));
    std::string strHash(readfile(piecesPath / "hash.txt"));
    std::stringstream ss, ssEnd;
    ss << "d8:announce" << announcePath.length() << ":" << announcePath << "10:autolaunchi2e11:choose pathi0e13:creation datei" << up->toTimeStamp << "e"
        << "14:download label" << installerName.length() << ":" << installerName << "13:download typei1e4:info";
    uint32 infoPos = ss.str().length();
    ss << "d5:filesld6:lengthi" << Util::filesize(installerPath) << "e"
        << "4:pathl" << installerName.length() << ":" << installerName << "eee4:name0:12:piece lengthi" << pieceLength << "e6:pieces" << uint32(strHash.size() / 2) << ":";
    tor.write(ss.str().c_str(), ss.str().length());
    for (std::size_t pos = 0; pos < strHash.size(); pos = pos + 2)
    {
        int32 num = strtol(strHash.substr(pos, 2).c_str(), NULL, 16);
        tor.write((char*)&num, 1);
    }
    tor.write("e", 1);
    ssEnd << "13:launch target" << installerName.length() << ":" << installerName << "e";
    tor.write(ssEnd.str().c_str(), ssEnd.str().length());
    tor.close();

    // Calculate the torrent info_hash
    std::ifstream tori(torrentPath.string(), std::ifstream::ate | std::ifstream::binary);
    uint32 torrentLength = tori.tellg();
    uint32 infoLength = torrentLength - ssEnd.str().length() - infoPos;
    tori.seekg(infoPos);
    char* buffer = new char[infoLength];
    tori.read(buffer, infoLength);
    unsigned char info_hash[20];
    SHA1((unsigned char *)buffer, infoLength, info_hash);
    tori.close();

    // Saving update to database
    std::string delete_query = "DELETE FROM tracker_files WHERE file_name = \"" + installerName + "\"";
    LoginDatabase.Query(delete_query.c_str());
    std::string directDownload(sConfigMgr->GetStringDefault("PatchAddress", "http://localhost/patch") + "/" + installerName);
    PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_INS_PATCH);
    stmt->setString(0, std::string((char*)info_hash));
    stmt->setString(1, installerName);
    stmt->setString(2, directDownload);
    LoginDatabase.Execute(stmt);

    // Downloader
    printf("\n    Generating Downloader");
    std::string downloaderName(baseName.str() + "-dl.exe");
    fs::path downloaderPath(UpdatePath / "downloaders" / downloaderName);
    Util::exec("bin\\BwoD.exe compile " + torrentPath.string() + " " + downloaderPath.string());

    // Patch

    std::string prepatch("prepatch.lst");
    if (fs::exists(prepatch))
        fs::remove(prepatch);
    std::ofstream(prepatch, std::ios_base::out | std::ios_base::app) << "extract " << downloaderName << std::endl << "execute " << downloaderName;

    printf("\n    Generating MPQ");
    mpqss << up->fromBuild << "-" << loc << ".mpq";
    std::string mpqName(mpqss.str());
    fs::path mpqPath(UpdatePath / mpqName);
    if (fs::exists(mpqPath))
        fs::remove(mpqPath);
    HANDLE mpq;
    SFileCreateArchive(mpqPath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, 0x1000, &mpq);
    Manager::AddFileToMPQ(prepatch, prepatch, &mpq);
    Manager::AddFileToMPQ(downloaderPath, downloaderName, &mpq);
    SFileCloseArchive(mpq);

    // Save files
    if (mFlags & PATCH_RELEASE)
    {
        printf("\n    Saving files");
        fs::path patchReleasePath(sConfigMgr->GetStringDefault("PatchReleasePath", "D:\\A\\Build\\bin\\Release\\data\\patches"));
        fs::path installersPath(patchReleasePath / "installers");
        if (!fs::exists(installersPath))
            fs::create_directories(installersPath);
        fs::path downloadersPath(patchReleasePath / "downloaders");
        if (!fs::exists(downloadersPath))
            fs::create_directories(downloadersPath);

        Util::CpyFile(installerPath, installersPath / installerName, true);
        Util::CpyFile(downloaderPath, downloadersPath / downloaderName, true);
        Util::CpyFile(torrentPath, downloadersPath / torrentName, true);
        if (fs::exists(patchReleasePath / installerName))
            fs::remove_all(patchReleasePath / installerName);
        Util::CpyDir(piecesPath, patchReleasePath / installerName, true);
        Util::CpyFile(mpqPath, patchReleasePath / mpqName, true);
    }
}

std::string ClientPatcher::readfile(fs::path path)
{
    std::ifstream file(path.string().c_str());
    std::string str((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
    return str;
}

std::string ClientPatcher::escape(std::string str)
{
    boost::replace_all(str, "\"", "\\\"");
    return str;
}
