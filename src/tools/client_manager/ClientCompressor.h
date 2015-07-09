#ifndef CLIENTCOMPRESSOR_H
#define CLIENTCOMPRESSOR_H

#define COMMONMAXFILES 0x14000
#define COMMON2MAXFILES 0x4000
#define LICHKINGMAXFILES 0x10000
#define PATCHMAXFILES 0x4000

enum CompressorFlag
{
    COMPRESS_COMMON     = 0x01,
    COMPRESS_COMMON2    = 0x02,
    COMPRESS_LICHKING   = 0x04,
    COMPRESS_LOCALE     = 0x10,
    COMPRESS_SPEECH     = 0x20,
    COMPRESS_PATCH      = 0x40,
    COMPRESS_ALL        = COMPRESS_COMMON | COMPRESS_COMMON2 | COMPRESS_LICHKING | COMPRESS_LOCALE | COMPRESS_SPEECH | COMPRESS_PATCH,
    COMPRESS_ALLE       = COMPRESS_COMMON | COMPRESS_COMMON2 | COMPRESS_LICHKING | COMPRESS_LOCALE | COMPRESS_SPEECH,
    COMPRESS_ALL_LOC    = COMPRESS_LOCALE | COMPRESS_SPEECH | COMPRESS_PATCH,
    COMPRESS_INSTALL    = 0x100,
    COMPRESS_RELEASE    = 0x200,
    UPDATE_DBC          = 0x400,
    UPDATE_LUA          = 0x800
};

struct FullVersion
{
    uint32 Build;
    uint32 Major;
    uint32 Minor;
    uint32 Bugfix;
    time_t Timestamp;
    std::string ClientName;
    fs::path SourcePath;
};

class ClientCompressor
{
    public:
        ClientCompressor(po::variables_map vm);
        ~ClientCompressor() {}

        bool Proceed();
        void Compress();
        // Testing
        void UpdatePatchMPQ(uint8 loc);
        void InstallPatches();
        // FullVersion
        bool ReleaseFullVersion();
        void PrepareFullVersion(FullVersion* fv, std::string loc);

        // Compress()
        bool SaveOutput();
        void GenerateCommonMPQ();
        void GenerateCommon2MPQ();
        void GenerateLichkingMPQ();
        void GenerateLocaleMPQ(uint8 loc);
        void GenerateSpeechMPQ(uint8 loc);
        void GeneratePatchMPQ(uint8 loc);

        po::variables_map mVm;
        int32 mFlags;

        fs::path PatchOutputPath;
        fs::path ReleasePath;
        fs::path GameDataPath;
};

#endif
