#include "ClientManager.h"
#include <iostream>
#include <algorithm>
#include <boost/algorithm/string.hpp>

bool ClientSelector::AddExactFile(eFiles &vec, std::string str)
{
    str = CleanExtension(str, vec.xtrctFlags);
    vec.files.push_back(str);
    return true;
}

bool ClientSelector::AddFile(XFiles &vec, std::string str, std::string add)
{
    std::string path;
    SplitPath(str, path);
    str = CleanExtension(str, vec.xtrctFlags) + add;
    vec.files.insert(std::pair<std::string, std::string>(str, path));
    return true;
}

std::string ClientSelector::CleanExtension(std::string file, int32 xtrctFlags)
{
    if (xtrctFlags & EXT_MDX && file.length() > 4 && (boost::iequals(file.substr(file.length() - 4, 4), ".mdx") || boost::iequals(file.substr(file.length() - 4, 4), ".mdl")))
        file = file.substr(0, file.length() - 2) + "2"; // .m2

    if (xtrctFlags & XTRCT_REGEX)
        boost::replace_all(file, ".", "\\.");
    return file;
}

bool ClientSelector::XCommitFile(std::string path)
{
    if (mXtrctFlags & EXT_WDL)
        if (path.length() > 4 && boost::iequals(path.substr(path.length() - 4, 4), ".wdl"))
            NamesFromWDL(path);

    if (mXtrctFlags & EXT_ADT)
        if (path.length() > 4 && boost::iequals(path.substr(path.length() - 4, 4), ".adt"))
            NamesFromADT(path);

    if (mXtrctFlags & EXT_WMO)
        if (path.length() > 4 && boost::iequals(path.substr(path.length() - 4, 4), ".wmo"))
        {
            NamesFromWMO(path);
            AddFile(GroupWmo, RemovePrefix(path.substr(0, path.length() - 4), FullDataPath), "_[0-9]{3}\\.wmo");
        }

    if (mXtrctFlags & EXT_MDX)
    {
        if (path.length() > 3 && boost::iequals(path.substr(path.length() - 3, 3), ".m2"))
        {
            NamesFromM2(path);
            std::string apath = RemovePrefix(path.substr(0, path.length() - 3), FullDataPath);
            AddFile(SkinMdx, apath, "[0-9]{2}\\.skin");
            AddFile(AnimMdx, apath, "[0-9]{2,}-[0-9]{2}\\.anim");
        }
    }

    return true;
}

bool ClientSelector::XtrctFile(fs::path from, fs::path to)
{
    fs::create_directories(fs::path(RemoveName(to.string())));
    if (fs::exists(from) && !fs::is_directory(from))
    {
        if (XCommitFile(from.string()) && mCopy)
        {
            if (!fs::exists(to))
            {
                fs::copy_file(from, to);
                XtrctLog(from.string());
            }
            else
                XtrctLog(from.string(), 1);
        }
        return 1;
    }
    return 0;
}

bool ClientSelector::XtrctDir(fs::path from, fs::path to)
{
    fs::path source(from);
    fs::path destination(to);

    if (!fs::exists(source) || !fs::is_directory(source))
        return false;
    fs::create_directory(destination);

    // Iterate through the source directory
    for (fs::directory_iterator file(source); file != fs::directory_iterator(); ++file)
    {
        try
        {
            fs::path current(file->path());
            if (fs::is_directory(current))
            {
                if (!XtrctDir(current.string(), fs::path(destination / current.filename()).string()))
                    return false;
            }
            else if (XCommitFile(current.string()) && mCopy) // tofix save names
            {
                if (!fs::exists(destination / current.filename()))
                {
                    fs::copy_file(current, destination / current.filename());
                    XtrctLog(from.string());
                }
                else
                    XtrctLog(from.string(), 1);
            }
        }
        catch (fs::filesystem_error const & e)
        {
            std::cerr << e.what() << '\n';
        }
    }
    return true;
}

// Exact
uint32 ClientSelector::Xtrct(fs::path from, fs::path to, bool nolog)
{
    if (!nolog)
        XtrctLog(from.string() + " TO:" + to.string(), 2);

    if (boost::filesystem::exists(from))
    {
        if (!boost::filesystem::is_directory(from))
            return XtrctFile(from, to);
        else if (mXtrctFlags & XTRCT_CPYDIR)
            return XtrctDir(from, to);
    }
    return 0;
}

// Lookup
uint32 ClientSelector::Xtrct(std::string name, fs::path in, fs::path from, fs::path to, bool inAbs)
{
    if (!inAbs)
    {
        XtrctLog(" IN:" + in.string() + " NAME:" + name + " FLAGS:" + std::to_string(mXtrctFlags), 2);
        in = from / in;
    }

    if (!boost::filesystem::exists(in))
        return 0;

    uint32 count = 0;
    boost::filesystem::directory_iterator end_itr;

    if (mXtrctFlags & XTRCT_REGEX)
    {
        boost::regex filter(name, boost::regex::icase);
        for (boost::filesystem::directory_iterator i(in); i != end_itr; ++i)
        {
            std::string file = i->path().string();
            if (boost::regex_match(i->path().filename().string(), filter))
            {
                if (boost::filesystem::is_directory(i->status()))
                {
                    if (mXtrctFlags & XTRCT_CPYDIR)
                        count += XtrctDir(i->path(), to / fs::path(RemovePrefix(file, from.string())));
                    else if ((mXtrctFlags & XTRCT_SUBDIR) && !boost::iequals(i->path().filename().string(), ".git"))
                        count += Xtrct(name, i->path(), from, to, true); // subdir
                }
                else
                    count += XtrctFile(file, to / fs::path(RemovePrefix(file, from.string())));
            }
            else if (boost::filesystem::is_directory(i->status()) && (mXtrctFlags & XTRCT_SUBDIR) && !boost::iequals(i->path().filename().string(), ".git"))
                count += Xtrct(name, i->path(), from, to, true); // subdir
        }
    }
    else
    {
        fs::path current = fs::path(in / name);
        count += Xtrct(current, fs::path(to / RemovePrefix(current.string(), from.string())), true);

        if (mXtrctFlags & XTRCT_SUBDIR)
            for (boost::filesystem::directory_iterator i(in); i != end_itr; ++i)
                if (boost::filesystem::is_directory(i->status()))
                    if (!boost::iequals(i->path().filename().string(), ".git"))
                        if (!(mXtrctFlags & XTRCT_CPYDIR) || !boost::iequals(i->path().filename().string(), name))
                            Xtrct(name, i->path(), from, to, true); // subdir
    }

    return count;
}

void ClientSelector::Xtrct_XFiles(std::string name, XFiles &xfiles)
{
    mXtrctFlags = xfiles.xtrctFlags;
    std::cout << "\n    " << name << " [" << xfiles.files.size() << "]\n";
    uint32 i = 1;
    for (std::set<std::pair<fs::path, fs::path>>::iterator itr = xfiles.files.begin(); itr != xfiles.files.end(); itr++)
    {
        Bar(i++, xfiles.files.size(), (*itr).second.string() + "\\" + (*itr).first.string());
        Xtrct_XFile((*itr).first, (*itr).second);
    }
    xfiles.files.clear();
}

void ClientSelector::Xtrct_eFiles(std::string name, eFiles &efiles)
{
    std::vector<fs::path>* vec = &efiles.files;
    std::sort((*vec).begin(), (*vec).end());
    (*vec).erase(std::unique((*vec).begin(), (*vec).end()), (*vec).end());
    mXtrctFlags = efiles.xtrctFlags;
    std::cout << "\n    " << name << " [" << efiles.files.size() << "]\n";
    uint32 i = 1;
    for (std::vector<fs::path>::const_iterator itr = efiles.files.begin(); itr != efiles.files.end(); ++itr)
    {
        Bar(i++, efiles.files.size(), (*itr).string());
        Xtrct_eFile(*itr);
    }
    efiles.files.clear();
}

// type 0:Full/Loc 1:Full 2:Loc
void ClientSelector::Xtrct_XFile(fs::path name, fs::path path, fs::path in)
{
    if (path.string().length())
        in = path;

    if (!(mXtrctFlags & XTRCT_LOC))
        Xtrct(name.string(), in, FullDataPath, TinyDataPath);
    if (!(mXtrctFlags & XTRCT_MIX))
    {
        Xtrct(name.string(), in, FullDataPathFr, TinyDataPathFr);
        Xtrct(name.string(), in, FullDataPathEn, TinyDataPathEn);
    }
}

// type 0:Full/Loc 1:Full 2:Loc
void ClientSelector::Xtrct_eFile(fs::path file)
{
    if (!(mXtrctFlags & XTRCT_LOC))
        Xtrct(FullDataPath / file, TinyDataPath / file);
    if (!(mXtrctFlags & XTRCT_MIX))
    {
        Xtrct(FullDataPathEn / file, TinyDataPathEn / file);
        Xtrct(FullDataPathFr / file, TinyDataPathFr / file);
    }
}
