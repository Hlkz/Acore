#ifndef CLIENTPATCHER_H
#define CLIENTPATCHER_H

enum PatcherFlag
{
    PATCH_VERSION   = 0x01,
    PATCH_INSTALL   = 0x02,
    PATCH_PATCH     = 0x10
};

class ClientPatcher
{
    public:
        ClientPatcher(po::variables_map vm);
        ~ClientPatcher() {}

        bool Proceed();
        void CommitVersion();
        void InstallPatch();
        void ExtractGitDiff(std::string path, std::string fromHash, std::string toHash, std::string filename);
        void GenerateInstaller(std::string loc);

        std::string exec(std::string cmd);
        std::string readfile(std::string str);
        std::string escape(std::string str);

        po::variables_map mVm;
        int32 mFlags;

        std::vector<fs::path> addPaths;
        std::vector<fs::path> delPaths;
        std::vector<fs::path> modPaths;

        uint32 fromBuild;
        uint32 fromMajor;
        uint32 fromMinor;
        uint32 fromBugfix;
        uint32 toBuild;
        uint32 toMajor;
        uint32 toMinor;
        uint32 toBugfix;
};

#endif
