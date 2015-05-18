#include "ClientManager.h"
#include <boost/algorithm/string.hpp>

struct MHDR
{
    /*000h*/  uint32_t flags;
    /*004h*/  uint32_t mcin;
    /*008h*/  uint32_t mtex;  //List of all the textures used
    /*00Ch*/  uint32_t mmdx;  //List of all the md2's used
    /*010h*/  uint32_t mmid;
    /*014h*/  uint32_t mwmo;  //list of all the WMO's used
};

struct SMOHeader
{
    /*000h*/  uint32_t nTextures;
    /*004h*/  uint32_t nGroups;
    /*008h*/  uint32_t nPortals;
    /*00Ch*/  uint32_t nLights;
    /*010h*/  uint32_t nDoodadNames;
    /*014h*/  uint32_t nDoodadDefs;
    /*018h*/  uint32_t nDoodadSets;
    /*01Ch*/  uint8_t  colR;
    /*01Dh*/  uint8_t  colG;
    /*01Eh*/  uint8_t  colB;
    /*01Fh*/  uint8_t  colX;
    /*020h*/  uint32_t wmoID;           // WMO/v17 ID (column 2 in WMOAreaTable.dbc)
    /*024h*/  uint32_t bounding_box[6]; // should be: C3Vector bounding_box[2]
    /*03Ch*/  uint32_t flags;
};

struct WMOMaterial {
    int32_t flags;
    int32_t specular;
    int32_t transparent;
    int32_t nameStart; // Start position for the first texture filename in the MOTX data block
    // + 0x30 bytes
};

void ClientSelector::NamesFromADT(std::string path)
{
    FILE* adtFile;
    uint32 err = fopen_s(&adtFile, path.c_str(), "rb");

    if (err || feof(adtFile))
    {
        if (!err)
            fclose(adtFile);
        return;
    }

    uint32 fourcc, size, version;
    MHDR header;

    fread(&fourcc, 4, 1, adtFile);
    fseek(adtFile, 4, SEEK_CUR);
    fread(&version, 4, 1, adtFile);
    if (fourcc != 'MVER' || version != 18)
    {
        fclose(adtFile);
        return;
    }

    fread(&fourcc, 4, 1, adtFile);
    fseek(adtFile, 4, SEEK_CUR);
    if (fourcc != 'MHDR')
    {
        fclose(adtFile);
        return;
    }
    fread(&header, 1, sizeof(MHDR), adtFile);

    if (ExtractFlags & EXTRACT_ADTS)
    {
        fseek(adtFile, header.mtex + 0x14, SEEK_SET);
        fread(&fourcc, 4, 1, adtFile);
        fread(&size, 4, 1, adtFile);
        if (fourcc != 'MTEX')
        {
            fclose(adtFile);
            return;
        }
        char* lCurStr = new char[1024];
        char* lCurPos = reinterpret_cast<char*>(ftell(adtFile));
        char* lEnd = lCurPos + size;
        while (lCurPos < lEnd)
        {
            fgets(lCurStr, 1024, adtFile);
            std::string name(lCurStr);
            AddExactFile(BlpAdt, name);
            if (name.length() > 4)
                AddExactFile(BlpAdt, name.substr(0, name.length() - 4) + "_s.blp");
            lCurPos += strlen(lCurStr) + 1;
            fseek(adtFile, int(lCurPos), SEEK_SET);
        }
    }

    if (ExtractFlags & EXTRACT_ADTS)
    {
        fseek(adtFile, header.mmdx + 0x14, SEEK_SET);
        fread(&fourcc, 4, 1, adtFile);
        fread(&size, 4, 1, adtFile);
        if (fourcc != 'MMDX')
        {
            fclose(adtFile);
            return;
        }
        char* lCurStr = new char[1024];
        char* lCurPos = reinterpret_cast<char*>(ftell(adtFile));
        char* lEnd = lCurPos + size;
        while (lCurPos < lEnd)
        {
            fgets(lCurStr, 1024, adtFile);
            AddExactFile(MdxAdt, lCurStr);
            lCurPos += strlen(lCurStr) + 1;
            fseek(adtFile, int(lCurPos), SEEK_SET);
        }
    }

    //if (ExtractFlags & EXTRACT_ADTS || ExtractFlags & EXTRACT_SOUNDS)
    {
        fseek(adtFile, header.mwmo + 0x14, SEEK_SET);
        fread(&fourcc, 4, 1, adtFile);
        fread(&size, 4, 1, adtFile);
        if (fourcc != 'MWMO')
        {
            fclose(adtFile);
            return;
        }
        char* lCurStr = new char[1024];
        char* lCurPos = reinterpret_cast<char*>(ftell(adtFile));
        char* lEnd = lCurPos + size;
        while (lCurPos < lEnd)
        {
            fgets(lCurStr, 1024, adtFile);
            std::string name(lCurStr);
            if (name.length() > 3)
                AddExactFile(WmoAdt, name);
            lCurPos += strlen(lCurStr) + 1;
            fseek(adtFile, int(lCurPos), SEEK_SET);
        }
    }

    fclose(adtFile);
}

void ClientSelector::NamesFromWMO(std::string path)
{
    FILE* wmoFile;
    uint32 err = fopen_s(&wmoFile, path.c_str(), "rb");

    fseek(wmoFile, 0, SEEK_END);
    if (err || feof(wmoFile) || !ftell(wmoFile))
    {
        if (!err)
            fclose(wmoFile);
        return;
    }
    fseek(wmoFile, 0, SEEK_SET);

    char* texbuf = 0;
    uint32 fourcc, size;
    SMOHeader header;
    bool m2 = false;
    bool blp = false;

    while (!feof(wmoFile))
    {
        fread(&fourcc, 4, 1, wmoFile);
        fread(&size, 4, 1, wmoFile);
        size_t nextpos = ftell(wmoFile) + size;

        if (fourcc == 'MOHD')
        {
            fread(&header, 1, sizeof(SMOHeader), wmoFile);
            AddUInt(header.wmoID, WMOIds);
        }
        else if (fourcc == 'MOTX')
        {
            texbuf = new char[size];
            fread(texbuf, size, 1, wmoFile);
        }
        else if (fourcc == 'MOMT')
        {
            for (unsigned int i = 0; i < header.nTextures; ++i)
            {
                WMOMaterial m;
                fread(&m, 0x10, 1, wmoFile);
                AddExactFile(BlpWmo, texbuf + m.nameStart);
                fseek(wmoFile, 0x30, SEEK_CUR);
            }
            if (m2)
            {
                fclose(wmoFile);
                return;
            }
            blp = true;
        }
        else if (fourcc == 'MODN')
        {
            char* lCurStr = new char[1024];
            char* lCurPos = reinterpret_cast<char*>(ftell(wmoFile));
            char* lEnd = lCurPos + size;
            while (lCurPos < lEnd)
            {
                fgets(lCurStr, 1024, wmoFile);
                if (strlen(lCurStr))
                    AddExactFile(MdxWmo, std::string(lCurStr));
                lCurPos += strlen(lCurStr) + 1;
                fseek(wmoFile, int(lCurPos), SEEK_SET);
            }
            if (blp)
            {
                fclose(wmoFile);
                return;
            }
            m2 = true;
        }
        fseek(wmoFile, nextpos, SEEK_SET);;
    }
    fclose(wmoFile);
}

void ClientSelector::NamesFromM2(std::string path)
{
    FILE* m2File;
    uint32 err = fopen_s(&m2File, path.c_str(), "rb");

    fseek(m2File, 0, SEEK_END);
    if (err || feof(m2File) || !ftell(m2File))
    {
        if (!err)
            fclose(m2File);
        return;
    }
    fseek(m2File, 0, SEEK_SET);

    fseek(m2File, 0x50, SEEK_SET);
    uint32 nTextures, ofsTextures;
    fread(&nTextures, 4, 1, m2File);
    fread(&ofsTextures, 4, 1, m2File);

    fseek(m2File, ofsTextures, SEEK_SET);
    for (uint32 i = 0; i < nTextures; i++)
    {
        uint32 tell, length, ofs;
        fseek(m2File, 8, SEEK_CUR);
        fread(&length, 4, 1, m2File);
        fread(&ofs, 4, 1, m2File);
        tell = ftell(m2File);
        fseek(m2File, ofs, SEEK_SET);
        char* filename = new char[length];
        fgets(filename, length, m2File);
        fseek(m2File, tell, SEEK_SET);
        if (strlen(filename))
            AddExactFile(BlpM2, filename);
    }
    fclose(m2File);
}

void ClientSelector::NamesFromTRS(std::string path)
{
    FILE* trsFile;
    uint32 err = fopen_s(&trsFile, path.c_str(), "rb");

    fseek(trsFile, 0, SEEK_END);
    if (err || feof(trsFile) || !ftell(trsFile))
    {
        if (!err)
            fclose(trsFile);
        return;
    }
    fseek(trsFile, 0, SEEK_SET);

    bool ismap = false;
    while (!feof(trsFile))
    {
        char* s = new char[256];
        fgets(s, 256, trsFile);
        std::string str(s);
        if (boost::equals(str.substr(0, 5), "dir: "))
        {
            str = str.substr(5, str.length() - 8);
            ismap = true;
            if (boost::equals(str.substr(0, 4), "WMO\\"))
                ismap = false;
        }
        else
        {
            bool cpy = false;
            size_t fnd = str.find_first_of('	');
            if (ismap)
            {
                boost::regex mapregex("(.*)\\\\map([0-9]{2}_[0-9]{2})\\.blp");
                if (boost::regex_match(str.substr(0, fnd), mapregex))
                    if (fs::exists(TinyDataPath + "\\World\\Maps\\" + boost::regex_replace(str.substr(0, fnd), mapregex, "$1\\\\$1_$2.adt")))
                        cpy = true;
            }
            else
            {
                boost::regex mapregex("(.*)_[0-9]{2}_[0-9]{2}\\.blp");
                if (boost::regex_match(str.substr(0, fnd), mapregex))
                    if (fs::exists(TinyDataPath + "\\World\\" + boost::regex_replace(str.substr(0, fnd), mapregex, "$1.wmo")))
                        cpy = true;
            }

            if (cpy)
            {
                fnd = str.find_last_of('	');
                if (fnd != std::string::npos)
                    AddExactFile(BlpMinimap, "Textures\\Minimap\\" + str.substr(fnd + 1, str.length() - fnd - 3));
            }
        }
    }

    fclose(trsFile);
}
