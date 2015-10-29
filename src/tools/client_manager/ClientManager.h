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
extern fs::path TinyDataPathEn;
extern fs::path TinyDataPathFr;

extern fs::path ManagerDataPath;
extern fs::path PatchOutputPath;
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

namespace Manager
{
    void Init();
    void Console();
    void ManageFile(std::string path);

    bool OpenMPQ(std::string path, HANDLE* phMpq);
    bool AddFileToMPQ(fs::path from, fs::path to, HANDLE* mpq, bool replace = false);
    bool AddDirToMPQ(fs::path from, fs::path to, HANDLE* mpq, bool replace = false);

    bool BuildVersion(fs::path dest, uint32 build = 0, uint32 major = 0, uint32 minor = 0, uint32 bugfix = 0);

    void ExtractZMP(fs::path path);
}

#endif
