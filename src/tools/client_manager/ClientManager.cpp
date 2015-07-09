#include "ClientManager.h"
#include "Timer.h"
#include <iostream>

ClientManager::ClientManager(po::variables_map vm)
{
    mVm = vm;

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
    UpdatePath = sConfigMgr->GetStringDefault("UpdatePath", "D:\\A\\Client\\Manager\\Update");

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
