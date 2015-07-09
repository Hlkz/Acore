#ifndef CLIENTPATCHER_H
#define CLIENTPATCHER_H

enum PatcherFlag
{
    PATCH_VERSION   = 0x01,
    PATCH_UPDATE    = 0x02,
    PATCH_ONLY      = 0x04,
    PATCH_RELEASE   = 0x08
};

struct Update
{
    Update() : fromBuild(0), toBuild(0) { }

    uint32 fromBuild;
    uint32 fromMajor;
    uint32 fromMinor;
    uint32 fromBugfix;
    uint32 toBuild;
    uint32 toMajor;
    uint32 toMinor;
    uint32 toBugfix;
    time_t toTimeStamp;
};

class ClientPatcher
{
    public:
        ClientPatcher(po::variables_map vm);
        ~ClientPatcher() {}

        bool Proceed();
        // Version
        void CommitVersion();
        // Update
        void ReleaseUpdate();
        void ExtractGitDiff(std::string path, std::string fromHash, std::string toHash, std::string filename);
        void AddMPQToFile(fs::path source, fs::path mpqsource, fs::path out);
        void GenerateUpdate(Update* up, std::string loc);

        // Util
        std::string readfile(fs::path path);
        std::string escape(std::string str);

        po::variables_map mVm;
        int32 mFlags;
};

#endif
