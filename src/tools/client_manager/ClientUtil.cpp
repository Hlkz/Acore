#include "ClientManager.h"
#include <iostream>
#include <boost/algorithm/string.hpp>

#include "StormLib/StormLib.h"
#include "StormLib/StormCommon.h"

#ifdef WIN32
#include <tchar.h>
#endif

namespace Util
{
    std::string RemoveName(std::string fullPath)
    {
        char drive[_MAX_DRIVE];
        char dir[_MAX_DIR];
        char fname[_MAX_FNAME];
        char ext[_MAX_EXT];
        _splitpath(fullPath.c_str(), drive, dir, fname, ext);
        return std::string(drive) + std::string(dir);
    }

    std::string RemovePrefix(std::string str, std::string prefix)
    {
        if (str.length() > prefix.length())
            str = str.substr(prefix.length() + 1, str.length() - prefix.length() - 1);
        return str;
    }

    bool CpyDir(std::string from, std::string to)
    {
        boost::filesystem::path source(from);
        boost::filesystem::path destination(to);

        if (!boost::filesystem::exists(source) || !boost::filesystem::is_directory(source))
            return false;
        boost::filesystem::create_directory(destination);

        // Iterate through the source directory
        for (boost::filesystem::directory_iterator file(source); file != boost::filesystem::directory_iterator(); ++file)
        {
            try
            {
                boost::filesystem::path current(file->path());
                if (boost::filesystem::is_directory(current))
                {
                    if (!CpyDir(current.string(), boost::filesystem::path(destination / current.filename()).string()))
                        return false;
                }
                else
                    boost::filesystem::copy_file(current, destination / current.filename());
            }
            catch (boost::filesystem::filesystem_error const & e)
            {
                std::cerr << e.what() << '\n';
            }
        }
        return true;
    }

    bool AddFileToMPQ(fs::path from, fs::path to, HANDLE* mpq, bool replace)
    {
        DWORD dwFlags; // dwCompression, dwCompressionNext;

        if (boost::iequals(from.extension().string(), "wav"))
            dwFlags = MPQ_FILE_COMPRESS | MPQ_FILE_ENCRYPTED;
        else if ((boost::iequals(from.extension().string(), "mp3"))
            || (boost::iequals(from.extension().string(), "smk"))
            || (boost::iequals(from.extension().string(), "bik"))
            || (boost::iequals(from.extension().string(), "mpq")))
            dwFlags = 0;
        else
            dwFlags = MPQ_FILE_COMPRESS | MPQ_FILE_ENCRYPTED;

        if (replace)
            dwFlags |= MPQ_FILE_REPLACEEXISTING;

        //if (dwFlags & MPQ_FILE_COMPRESS)
        //    SFileAddFileEx(mpq, from.string().c_str(), to.string().c_str(), dwFlags, dwCompression, dwCompressionNext);
        //else
        return SFileAddFile(*mpq, from.string().c_str(), to.string().c_str(), dwFlags);
    }

    bool AddDirToMPQ(fs::path from, fs::path to, HANDLE* mpq, bool replace)
    {
        if (!fs::exists(from) || !fs::is_directory(from))
            return false;

        boost::filesystem::directory_iterator end_itr;
        for (boost::filesystem::directory_iterator i(from); i != end_itr; ++i)
            if (fs::is_directory(i->status()))
                AddDirToMPQ(i->path(), to / i->path().filename(), mpq, replace);
            else
                AddFileToMPQ(i->path(), to / i->path().filename(), mpq, replace);
        return true;
    }
}

bool ClientSelector::AddUInt(uint32 integer, std::vector<uint32> &vec)
{
    bool exist = false;
    for (std::vector<uint32>::const_iterator itr = vec.begin(); itr != vec.end(); ++itr)
        if ((*itr) == integer)
            return false;
    vec.push_back(integer);
    return true;
}

/*
bool ClientSelector::AddString(std::string str, std::vector<std::string> &vec)
{
    bool exist = false;
    for (std::vector<std::string>::const_iterator itr = vec.begin(); itr != vec.end(); ++itr)
        if ((*itr) == str)
            return false;
    vec.push_back(str);
    return true;
}
*/

void ClientSelector::SplitPath(std::string &name, std::string &path)
{
    char drive[_MAX_DRIVE];
    char dir[_MAX_DIR];
    char fname[_MAX_FNAME];
    char ext[_MAX_EXT];
    _splitpath(name.c_str(), drive, dir, fname, ext);
    path = std::string(drive) + std::string(dir);
    if (path.length()) path = path.substr(0, path.length() - 1); // Remove last /
    name = std::string(fname) + std::string(ext);
}

/*
std::string ClientSelector::MismatchString(std::string const &a, std::string const &b)
{
    std::string::const_iterator longBegin, longEnd, shortBegin;

    if (a.length() >= b.length())
    {
        longBegin = a.begin();
        longEnd = a.end();
        shortBegin = b.begin();
    }
    else {
        longBegin = b.begin();
        longEnd = b.end();
        shortBegin = a.begin();
    }

    std::pair<std::string::const_iterator, std::string::const_iterator> mismatch_pair = mismatch(longBegin, longEnd, shortBegin);
    return std::string(mismatch_pair.first, longEnd);
}

bool ClientSelector::CpyFile(std::string from, std::string to)
{
    boost::filesystem::create_directories(boost::filesystem::path(RemoveName(to)));
    if (boost::filesystem::exists(from) && !boost::filesystem::exists(to))
    {
        boost::filesystem::copy_file(boost::filesystem::path(from), boost::filesystem::path(to));
        return true;
    }
    return false;
}

bool ClientSelector::Cpy(std::string from, std::string to)
{
    if (boost::filesystem::exists(from))
    {
        if (boost::filesystem::is_directory(from))
            return CpyDir(from, to);
        else
            return CpyFile(from, to);
    }
    return false;
}

void ClientSelector::XCpy(std::string filter, std::string in, std::string from, std::string to, bool subDir, bool icase, bool cpyDir, bool inAbs)
{
    if (!inAbs)
        in = from + (in.length() ? "\\" + in : "");
    if (!boost::filesystem::exists(boost::filesystem::path(in)))
        return;

    boost::filesystem::directory_iterator end_itr;
    for (boost::filesystem::directory_iterator i(in); i != end_itr; ++i)
    {
        std::string file = i->path().string();
        if (boost::regex_match(i->path().filename().string(), boost::regex(filter, icase ? boost::regex::icase : boost::regex::normal)))
        {
            if (boost::filesystem::is_directory(i->status()))
            {
                if (cpyDir)
                    CpyDir(file, std::string(to + file.substr(from.length(), file.length() - from.length())));
                else if (subDir)
                    XCpy(filter, file, from, to, subDir, icase, false, true); // subdir
            }
            else
                CpyFile(file, std::string(to + file.substr(from.length(), file.length() - from.length())));
        }
        else if (boost::filesystem::is_directory(i->status()) && subDir)
            XCpy(filter, file, from, to, true, icase, cpyDir, true); // subdir
    }
}

void ClientSelector::Fnd(std::string filter, std::string in, std::vector<std::string> &found, bool subDir, bool icase)
{
    if (!boost::filesystem::exists(boost::filesystem::path(in)))
        return;

    boost::filesystem::directory_iterator end_itr;
    for (boost::filesystem::directory_iterator i(in); i != end_itr; ++i)
    {
        if (boost::regex_match(i->path().filename().string(), boost::regex(filter, icase ? boost::regex::icase : boost::regex::normal)))
            found.push_back(i->path().string());
        else if (boost::filesystem::is_directory(i->status()) && subDir)
            Fnd(filter, i->path().string(), found, true, icase);
    }
}
*/

void ClientSelector::Bar(uint32 i, uint32 max, std::string disp)
{
    uint32 done = uint32(100 * i / max);
    std::cout << "\r      " << done << "%";
    if (done < 100)
        std::cout << "  " << disp.substr(0, 60);
}
