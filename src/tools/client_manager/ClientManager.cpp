#include "ClientManager.h"
#include "Timer.h"
#include <iostream>
#include <boost/filesystem.hpp>

ClientManager::ClientManager(po::variables_map vm)
{
    mVm = vm;

    FullDataPath = "D:\\A\\Client\\Patch\\Data\\FullData";
    FullDataPathLoc = "D:\\A\\Client\\Patch\\Data\\LocData";
    TinyDataPath = "D:\\A\\Client\\Patch\\Data\\TinyData";
    TinyDataPathLoc = "D:\\A\\Client\\Patch\\Data\\TinyLoc";
    TinyDataPathPatch = "D:\\A\\Client\\Patch\\Data\\TinyPatch";
    PatchOutputPath = "D:\\A\\Client\\Patch\\Output";
    PatchResPath = "D:\\A\\Client\\Patch\\res";
    GameDataPath = "D:\\A\\Client\\Aviana\\Data";

    FullDataPathFr = FullDataPathLoc + "\\frFR";
    FullDataPathEn = FullDataPathLoc + "\\enUS";
    TinyDataPathFr = TinyDataPathLoc + "\\frFR";
    TinyDataPathEn = TinyDataPathLoc + "\\enUS";

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

    //printf("\n  Program executed in %u ms", GetMSTimeDiffToNow(oldMSTime));
    return true;
}
