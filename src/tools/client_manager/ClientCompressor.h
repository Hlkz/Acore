#ifndef CLIENTCOMPRESSOR_H
#define CLIENTCOMPRESSOR_H

class ClientCompressor
{
    public:
        ClientCompressor(po::variables_map vm);
        ~ClientCompressor() {}

        bool Proceed();

        bool SaveOutput();
        bool CompressTinyData();
        bool CompressTinyDataLoc();

        void GenerateCommonMPQ();
        void GenerateCommon2MPQ();
        void GenerateLichkingMPQ();
        void GenerateLocaleMPQ(uint8 loc);
        void GenerateSpeechMPQ(uint8 loc);
        void GeneratePatchMPQ(uint8 loc);

        bool AddFileToMPQ(fs::path from, fs::path to, HANDLE* mpq);
        bool AddDirToMPQ(fs::path from, fs::path to, HANDLE* mpq);

        po::variables_map mVm;
};

#endif
