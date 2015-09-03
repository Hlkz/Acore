#ifndef CLIENTMANAGER_H
#define CLIENTMANAGER_H

#include "ClientSelector.h"
#include "ClientCompressor.h"
#include "ClientPatcher.h"
#include "ClientUtil.h"
#include "Config.h"
#include "DatabaseEnv.h"

#define __STORMLIB_SELF__

extern LoginDatabaseWorkerPool LoginDatabase;
extern UnusedDatabaseWorkerPool UnusedDatabase;
extern WorldDatabaseWorkerPool WorldDatabase;

// Args
extern std::string FullDataPath;
extern std::string TinyDataPath;
extern std::string TinyLocPath;
extern std::string TinyPatchPath;

// Deduct
extern std::string FullDataPathEn;
extern std::string FullDataPathFr;
extern std::string TinyDataPathEn;
extern std::string TinyDataPathFr;

extern fs::path ManagerDataPath;
extern fs::path UpdatePath;

class ClientManager
{
    public:
        ClientManager(po::variables_map vm);
        ~ClientManager() {}

        bool Proceed();

        ClientSelector* selector;
        ClientCompressor* compressor;
        ClientPatcher* patcher;

        po::variables_map mVm;
};

#endif
