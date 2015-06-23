#include "ClientManager.h"
#include "Timer.h"
#include <iostream>

ClientManager::ClientManager(po::variables_map vm)
{
    mVm = vm;

    DataPath = sConfigMgr->GetStringDefault("DataPath", "D:\\A\\Client\\Manager\\Data");
    PatchOutputPath = sConfigMgr->GetStringDefault("PatchOutputPath", "D:\\A\\Client\\Manager\\Output");
    VersionPath = sConfigMgr->GetStringDefault("VersionPath", "D:\\A\\Client\\Manager\\Version");
    InstallerPath = sConfigMgr->GetStringDefault("InstallerPath", "D:\\A\\Client\\Manager\\Tools\\CreateInstaller");
    BuildVersionPath = sConfigMgr->GetStringDefault("BuildVersionPath", "D:\\A\\Client\\Manager\\Tools\\BuildVersion");

    FullDataPath = sConfigMgr->GetStringDefault("FullDataPath", "D:\\A\\Client\\Manager\\Data\\FullData");
    FullDataPathLoc = sConfigMgr->GetStringDefault("FullDataPathLoc", "D:\\A\\Client\\Manager\\Data\\LocData");
    TinyDataPath = sConfigMgr->GetStringDefault("TinyDataPath", "D:\\A\\Client\\Manager\\Data\\TinyData");
    TinyLocPath = sConfigMgr->GetStringDefault("TinyLocPath", "D:\\A\\Client\\Manager\\Data\\TinyLoc");
    TinyPatchPath = sConfigMgr->GetStringDefault("TinyPatchPath", "D:\\A\\Client\\Manager\\Data\\TinyPatch");

    ReleasePath = sConfigMgr->GetStringDefault("ReleasePath", "D:\\A\\Build\\bin\\Release");
    GameDataPath = sConfigMgr->GetStringDefault("GameDataPath", "D:\\A\\Client\\Aviana\\Data");
    PatchNoteAdress = sConfigMgr->GetStringDefault("PatchNoteAdress", "localhost/patch"); // adress/build

    FullDataPathFr = FullDataPathLoc + "\\frFR";
    FullDataPathEn = FullDataPathLoc + "\\enUS";
    TinyDataPathFr = TinyLocPath + "\\frFR";
    TinyDataPathEn = TinyLocPath + "\\enUS";

    Proceed();
}

bool ClientManager::Proceed()
{
    //std::cout << "\n  ClientManager\n\n";
    uint32 oldMSTime = getMSTime();

    if (!StartDB())
        return false;

    selector = new ClientSelector(mVm);

    compressor = new ClientCompressor(mVm);

    patcher = new ClientPatcher(mVm);

    //printf("\n  Program executed in %u ms", GetMSTimeDiffToNow(oldMSTime));
    return true;
}
