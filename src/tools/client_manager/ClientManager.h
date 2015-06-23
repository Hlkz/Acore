#ifndef CLIENTMANAGER_H
#define CLIENTMANAGER_H

#include "ClientSelector.h"
#include "ClientCompressor.h"
#include "ClientPatcher.h"
#include "ClientUtil.h"
#include "Configuration/Config.h"
#include "DatabaseEnv.h"

#define __STORMLIB_SELF__

extern LoginDatabaseWorkerPool LoginDatabase;
extern UnusedDatabaseWorkerPool UnusedDatabase;
extern WorldDatabaseWorkerPool WorldDatabase;

// Args
extern std::string DataPath;
extern std::string PatchOutputPath;
extern std::string VersionPath;
extern std::string InstallerPath;
extern std::string BuildVersionPath;

extern std::string FullDataPath;
extern std::string FullDataPathLoc;
extern std::string TinyDataPath;
extern std::string TinyLocPath;
extern std::string TinyPatchPath;

extern std::string ReleasePath;
extern std::string GameDataPath;
extern std::string PatchNoteAdress;

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
        ClientPatcher* patcher;
};

#endif
