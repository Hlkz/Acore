#ifndef CLIENTSELECTOR_H
#define CLIENTSELECTOR_H

#include "Common.h"
#include <boost/regex.hpp>
#include <boost/filesystem.hpp>
#include <boost/program_options.hpp>

namespace fs = boost::filesystem;
namespace po = boost::program_options;

/*
struct XFile
{
    XFile(std::string n, std::string p) { name = n; path = fs::path(p); }
    fs::path path;      // look in this path
    std::string name;   // name or regex of the file
};
*/

struct XFiles
{
    XFiles(int32 eF = 0) { xtrctFlags = eF; }
    //std::vector<XFile> files;
    std::set<std::pair<fs::path, fs::path>> files;
    int32 xtrctFlags;
};

struct eFiles
{
    eFiles(int32 eF = 0) { xtrctFlags = eF; }
    std::vector<fs::path> files;
    int32 xtrctFlags;
};

enum ExtractFlag
{
    EXTRACT_ADTS        = 0x10,
    EXTRACT_DATABASE    = 0x20,
    EXTRACT_SOUNDS      = 0x40,
    COMPLETION          = 0x80,
    DONT_EXTRACT_ITEMS  = 0x100
    //EXTRACT_TEXTURES    = 0x01,
    //EXTRACT_MODELS      = 0x02,
    //EXTRACT_WMOS        = 0x04,
};

enum XtractFlags
{
    EXT_WDL         = 0x01,
    EXT_MDX         = 0x02,
    EXT_WMO         = 0x04,
    EXT_ADT         = 0x08,
    XTRCT_REGEX     = 0x10,
    XTRCT_SUBDIR    = 0x20,
    XTRCT_CPYDIR    = 0x40,
    EXT_A_MDX       = 0x80,
    XTRCT_MIX       = 0x100,
    XTRCT_LOC       = 0x200
};

class ClientSelector
{
    public:
        ClientSelector(po::variables_map vm);
        ~ClientSelector() {}

        bool Proceed();

        // Mains
        void ExtractADTs();
        void ExtractWMOs();
        void NamesFromUnusedDatabase();
        void NamesFromWorldDatabase();
        void Extract();
        void NamesOfSounds();
        void ExtractSounds();
        void Completion();
        void End();
        // From files
        void NamesFromWDL(std::string path);
        void NamesFromADT(std::string path);
        void NamesFromWMO(std::string path);
        void NamesFromM2(std::string path);
        void NamesFromTRS(std::string path);
        // Files extra
        void BuildZMP(uint32 id, std::string name);

        // Util
        void SplitPath(std::string &name, std::string &path);
        std::string CleanExtension(std::string file, int32 xtrctFlags);
        void Bar(uint32 i, uint32 max, std::string disp = "");
        // Vectors
        bool AddExactFile(eFiles &vec, std::string str);
        bool AddFile(XFiles &vec, std::string str, std::string add = "");
        bool AddUInt(uint32 integer, std::vector<uint32> &vec);
        //bool AddString(std::string str, std::vector<std::string> &vec);

        // Generic
        //std::string ClientSelector::MismatchString(std::string const &a, std::string const &b);
        //bool Cpy(std::string from, std::string to);
        //void XCpy(std::string filter, std::string in, std::string from, std::string to, bool subDir = false, bool icase = false, bool cpyDir = false, bool inAbs = false);
        //void Fnd(std::string filter, std::string in, std::vector<std::string> &found, bool subDir = false, bool icase = false);

        // Extraction
        bool XCommitFile(std::string path);
        bool XtrctFile(fs::path from, fs::path to);
        bool XtrctDir(fs::path from, fs::path to);
        uint32 Xtrct(fs::path from, fs::path to, bool nolog = false);
        uint32 Xtrct(std::string name, fs::path in, fs::path from, fs::path to, bool inAbs = false);
        void Xtrct_XFile(fs::path name, fs::path path = "", fs::path in = "");
        void Xtrct_eFile(fs::path file);
        void Xtrct_XFiles(std::string name, XFiles &xfiles);
        void Xtrct_eFiles(std::string name, eFiles &efiles);

    private:
        po::variables_map mVm;
        int32 mFlags;
        int32 mXtrctFlags;
        bool mCopy;

        // Adts
        XFiles Adt;
        XFiles WdAdt;
        eFiles BlpAdt;
        eFiles MdxAdt;
        eFiles BlpMap;
        eFiles BlpMinimap;
        // Wmos
        eFiles WmoAdt;
        XFiles GroupWmo;
        eFiles BlpWmo;
        eFiles MdxWmo; // + BlpM2
        // Models
        eFiles eMdx_M;
        eFiles eWmoMdx_M; // gobdisplayinfodbc
        XFiles MdxGround;
        XFiles MdxItem;
        XFiles MdxItemHead;
        XFiles AnimMdx; // regex: name00+-00.anim
        XFiles SkinMdx; // regex: name00.skin
        eFiles BlpM2;
        // Textures
        XFiles Blp_RL;
        eFiles eBlp;
        eFiles eBlp_M;
        XFiles BlpItem;
        XFiles BlpItem2;
        eFiles BlpIcon;
        eFiles BlpBaked;
        // Sounds
        XFiles Sounds;

        std::vector<uint32> CreatureDisplayIds; // filled with creature_template
        std::vector<uint32> WMOIds;             // filled when WMOs are extracted
        std::vector<uint32> SoundsToExtract;    // from SoundAmbience, ZoneMusic, ZoneIntroMusic from AreaTable, WMOAreaTable (WMOIds must be filled)
        std::map<uint32, std::string> CreaModelData;
};

#endif
