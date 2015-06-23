
#include "ClientManager.h"

#include "Timer.h"
#include <iostream>
#include <boost/algorithm/string.hpp>

#include "StormLib\StormLib.h"
#include "StormLib\StormCommon.h"

ClientPatcher::ClientPatcher(po::variables_map vm)
{
    mFlags = 0;
    if (vm.count("p-version"))
        mFlags |= PATCH_VERSION;
    if (vm.count("p-install"))
        mFlags |= PATCH_INSTALL;
    if (vm.count("p-patch"))
        mFlags |= PATCH_PATCH;
    if (!mFlags)
        return;

    fromBuild = 0;
    if (vm.count("p-installfrom"))
        fromBuild = vm["p-installfrom"].as<uint32>();
    fromMajor = 0;
    fromMinor = 0;
    fromBugfix = 0;
    toBuild = 0;
    toMajor = 0;
    toMinor = 0;
    toBugfix = 0;

    //if (vm.count("p-installto"))
    //    installTo = vm["p-installto"].as<uint32>();

    mVm = vm;

    Proceed();
}

bool ClientPatcher::Proceed()
{
    uint32 oldMSTime = getMSTime();
    std::cout << "\nPatcher";

    if (mFlags & PATCH_VERSION)
        CommitVersion();

    if (mFlags & PATCH_INSTALL)
        InstallPatch();

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
    printf("\n  git commit");

    printf("\n    Committing TinyData");
    exec("git -C \"" + TinyDataPath + "\" commit --allow-empty -m  \"" + Ammend + "\"");
    printf("\n    Committing TinyLoc");
    exec("git -C \"" + TinyLocPath + "\" commit --allow-empty -m  \"" + Ammend + "\"");
    printf("\n    Committing TinyPatch");
    exec("git -C \"" + TinyPatchPath + "\" commit --allow-empty -m  \"" + Ammend + "\"");

    printf("\n  database save");
    std::string FullHash(exec("git -C \"" + TinyDataPath + "\" log --format=\"%H\" -n 1"));
    std::string LocHash(exec("git -C \"" + TinyLocPath + "\" log --format=\"%H\" -n 1"));
    std::string PatchHash(exec("git -C \"" + TinyPatchPath + "\" log --format=\"%H\" -n 1"));

    std::stringstream insert_query;
    insert_query << "INSERT INTO versions(Build, MajorVersion, MinorVersion, BugfixVersion, HotfixVersion, FullHash, LocHash, PatchHash) "
        << "VALUES(" << build << ", " << major << ", " << minor << ", " << bugfix << ", \"" << hotfix << "\", \""
        << FullHash << "\", \"" << LocHash << "\", \"" << PatchHash << "\")";
    LoginDatabase.Query(insert_query.str().c_str());

    insert_query.str("");
    insert_query << "UPDATE realmlist SET gamebuild = " << build;
    LoginDatabase.Query(insert_query.str().c_str());
}

void ClientPatcher::InstallPatch()
{
#ifndef WIN32
    printf("\nThis programm only works on windows");
    return;
#endif

    //if (!installFrom && installTo)
    //{
    //    printf("\n  You cant specify to which build install without specifying from which one");
    //    return;
    //}

    QueryResult result;

    if (!fromBuild)
    {
        result = LoginDatabase.Query("SELECT Build FROM versions ORDER BY Build DESC LIMIT 2");

        toBuild = result->Fetch()->GetUInt32();
        if (result->NextRow())
            fromBuild = result->Fetch()->GetUInt32();
        else
        {
            printf("\n  There is only one client version");
            return;
        }
    }
    if (!toBuild)
    {
        result = LoginDatabase.Query("SELECT Build FROM versions ORDER BY Build DESC LIMIT 1");
        toBuild = result->Fetch()->GetUInt32();
    }

    if (fromBuild >= toBuild)
    {
        printf("\n  Cannot update a version (%u) to an older one (%u)", fromBuild, toBuild);
        return;
    }

    std::string fromFullHash, fromLocHash, fromPatchHash, toFullHash, toLocHash, toPatchHash;

    std::stringstream select_query;
    select_query << "SELECT MajorVersion, MinorVersion, BugfixVersion, FullHash, LocHash, PatchHash FROM versions WHERE Build = " << fromBuild;
    result = LoginDatabase.Query(select_query.str().c_str());
    Field* fields = result->Fetch();
    fromMajor = fields[0].GetUInt32();
    fromMinor = fields[1].GetUInt32();
    fromBugfix = fields[2].GetUInt32();
    fromFullHash = fields[3].GetString();
    fromLocHash = fields[4].GetString();
    fromPatchHash = fields[5].GetString();

    select_query.str("");
    select_query << "SELECT MajorVersion, MinorVersion, BugfixVersion, FullHash, LocHash, PatchHash FROM versions WHERE Build = " << toBuild;
    result = LoginDatabase.Query(select_query.str().c_str());
    fields = result->Fetch();
    toMajor = fields[0].GetUInt32();
    toMinor = fields[1].GetUInt32();
    toBugfix = fields[2].GetUInt32();
    toFullHash = fields[3].GetString();
    toLocHash = fields[4].GetString();
    toPatchHash = fields[5].GetString();

    printf("\nInstalling from build %u to build %u", fromBuild, toBuild);

    printf("\n  Cleaning Installer dir");
    fs::remove_all(InstallerPath + "/data");
    fs::remove_all(InstallerPath + "/frFR");
    fs::remove_all(InstallerPath + "/enUS");

    ExtractGitDiff(TinyDataPath, fromFullHash, toFullHash, "TinyData.diff");
    ExtractGitDiff(TinyLocPath, fromLocHash, toLocHash, "TinyLoc.diff");
    ExtractGitDiff(TinyPatchPath, fromPatchHash, toPatchHash, "TinyPatch.diff");

    printf("\n  Building Wow.exe");
    std::string buildVersion_exe(BuildVersionPath + "/BuildVersion.exe");
    if (!fs::exists(BuildVersionPath) || !fs::exists(buildVersion_exe))
    {
        printf("\n  Error: BuildVersion does not exist");
        return;
    }
    std::stringstream buildVersion_cmd;
    buildVersion_cmd << "BuildVersion.exe --file=\"Wow.exe\" --Major=\"" << toMajor << "\" --Minor=\"" << toMinor << "\" --Bugfix=\"" << toBugfix
        << "\" --Build=\"" << toBuild << "\"" << std::endl;
    SetCurrentDirectory(BuildVersionPath.c_str());
    exec(buildVersion_cmd.str().c_str());
    std::string wowFrom(BuildVersionPath + "/Wow.exe");
    std::string wowTo(InstallerPath + "/data/base/Wow.exe");
    if (!fs::exists(wowFrom))
    {
        printf("\n  Error generating Wow.exe");
        return;
    }
    fs::create_directories(InstallerPath + "/data/base");
    fs::copy_file(wowFrom, wowTo);

    if (fs::exists(InstallerPath + "/data/enUS"))
        fs::rename(InstallerPath + "/data/enUS", InstallerPath + "/enUS");
    GenerateInstaller("frFR");
    if (fs::exists(InstallerPath + "/enUS"))
        fs::rename(InstallerPath + "/enUS", InstallerPath + "/data/enUS");
    if (fs::exists(InstallerPath + "/data/frFR"))
        fs::rename(InstallerPath + "/data/frFR", InstallerPath + "/frFR");
    GenerateInstaller("enUS");
    if (fs::exists(InstallerPath + "/data/enUS"))
        fs::rename(InstallerPath + "/data/enUS", InstallerPath + "/enUS");
}

void ClientPatcher::ExtractGitDiff(std::string path, std::string fromHash, std::string toHash, std::string filename)
{
    printf("\n    Generating %s", filename.c_str());
    std::string diffPath(DataPath + "/" + filename);
    if (fs::exists(diffPath))
        fs::remove(diffPath);
    std::string gitcmd("git -C " + path + " diff " + fromHash + " " + toHash + " --name-status  >> " + DataPath + "/" + filename);
    exec(gitcmd.c_str());

    printf("\n    Extracting files from %s", filename.c_str());
    std::ifstream diffFile(diffPath);
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
            std::string to(InstallerPath + "/data/" + file);
            if (fs::exists(from))
            {
                if (fs::exists(to))
                    fs::remove(to);
                fs::create_directories(fs::path(Util::RemoveName(to)));
                fs::copy_file(from, to);
            }
        }
        //else if (prefix == "D");
    }
    diffFile.close();
}

void ClientPatcher::GenerateInstaller(std::string loc)
{
#ifndef WIN32
    printf("\nThis programm only works on windows");
    return;
#endif

    std::stringstream fromss, toss, patchCmdStart, patchCmdEnd, baseName, mpqss;
    baseName << "wow-" << fromBuild << "-" << toBuild << "-";
    std::string installerName(baseName.str() + loc + ".exe");
    printf("\n  Generating %s", installerName.c_str());

    fromss << fromMajor << "." << fromMinor << "." << fromBugfix << "." << fromBuild;
    toss << toMajor << "." << toMinor << "." << toBugfix << "." << toBuild;
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

    std::string patchCmd(InstallerPath + "/res/data/patch.cmd");
    if (fs::exists(patchCmd))
        fs::remove(patchCmd);
    std::ofstream(patchCmd, std::ios_base::out | std::ios_base::app) << patchCmdStart.str() << loc << patchCmdEnd.str();

    std::string patchHtml(InstallerPath + "/res/data/patch.html");
    if (fs::exists(patchHtml))
        fs::remove(patchHtml);
    std::ofstream(patchHtml, std::ios_base::out | std::ios_base::app)
        << "<script language=\"javascript\">document.location=\"" << PatchNoteAdress << "/" << toBuild << "\";</script>";

    SetCurrentDirectory(InstallerPath.c_str());
    exec("bin\\headergenerator.exe data data_tmp");
    exec("bin\\listgenerator.exe data_tmp data_tmp\\patch.lst");
    Util::CpyDir("res\\data", "data_tmp");
    exec("bin\\mpqcreate.exe tmp.mpq data_tmp");
    exec(std::string("bin\\append.exe res\\base.exe " + installerName + " tmp.mpq res\\Installer.exe res\\RichEd20.dll res\\Unicows.dll").c_str());
    fs::remove("tmp.mpq");
    fs::remove_all("data_tmp");

    std::string prepatch("prepatch.lst");
    if (fs::exists(prepatch))
        fs::remove(prepatch);
    std::ofstream(prepatch, std::ios_base::out | std::ios_base::app) << "extract " << installerName << std::endl << "execute " << installerName;

    mpqss << fromBuild << "-" << loc << ".mpq";
    std::string mpqName(mpqss.str());
    std::string mpqPath(InstallerPath + "\\" + mpqName);
    std::string mpqReleasePath(ReleasePath + "\\data\\patches\\" + mpqName);
    if (fs::exists(mpqPath))
        fs::remove(mpqPath);
    printf("\n  Generating %s", mpqName.c_str());
    HANDLE mpq;
    SFileCreateArchive(mpqPath.c_str(), MPQ_CREATE_ARCHIVE_V2, 0x1000, &mpq);
    Util::AddFileToMPQ(prepatch, prepatch, &mpq);
    Util::AddFileToMPQ(installerName, installerName, &mpq);
    SFileCloseArchive(mpq);
    if (fs::exists(mpqReleasePath))
        printf("\n  Warning: %s already exist in Release folder", mpqName.c_str());
    else
        fs::rename(mpqPath, mpqReleasePath);
}

std::string ClientPatcher::exec(std::string cmd)
{
    FILE* pipe = _popen(cmd.c_str(), "r");
    if (!pipe)
        return "ERROR";
    char buffer[128];
    std::string result = "";
    while (!feof(pipe))
    {
        if (fgets(buffer, 128, pipe) != NULL)
            result = +buffer;
    }
    _pclose(pipe);
    return result.substr(0, result.length() - 1);
}

std::string ClientPatcher::readfile(std::string path)
{
    std::ifstream file(path.c_str());
    std::string str((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
    return str;
}

std::string ClientPatcher::escape(std::string str)
{
    boost::replace_all(str, "\"", "\\\"");
    return str;
}
