#ifndef CLIENTMANAGER_H
#define CLIENTMANAGER_H

#include "ClientSelector.h"
#include "ClientCompressor.h"
#include "DatabaseEnv.h"

#define __STORMLIB_SELF__

extern LoginDatabaseWorkerPool LoginDatabase;
extern UnusedDatabaseWorkerPool UnusedDatabase;
extern WorldDatabaseWorkerPool WorldDatabase;

/*
FullDataPath        = Patch/Data/FullData
FullDataPathLoc     = Patch/Data/FullLoc
FullDataPathFr      = FullDataPathLoc / frFR
FullDataPathEn      = FullDataPathLoc / enUS

TinyDataPath        = Patch/Data/TinyData
TinyDataPathLoc     = Patch/Data/TinyLoc
TinyDataPathFr      = TinyDataPathLoc / frFR
TinyDataPathEn      = TinyDataPathLoc / enUS

PatchOutputPath     = Patch/Output
PatchResPath        = Patch/res
*/

// Args
extern std::string FullDataPath;
extern std::string FullDataPathLoc;
extern std::string TinyDataPath;
extern std::string TinyDataPathLoc;
extern std::string TinyDataPathPatch;
extern std::string PatchOutputPath;
extern std::string PatchResPath;
extern std::string GameDataPath;
// Deduct
extern std::string FullDataPathEn;
extern std::string FullDataPathFr;
extern std::string TinyDataPathEn;
extern std::string TinyDataPathFr;

class ClientManager
{
    public:
        ClientManager(po::variables_map vm);
        ~ClientManager() {}

        bool Proceed();
        bool StartDB();

        // Data paths
        //std::string OutputPath;

        po::variables_map mVm;
        ClientSelector* selector;
        ClientCompressor* compressor;
};

#endif
