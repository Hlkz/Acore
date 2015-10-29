#include "ClientManager.h"
#include <iostream>

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

    bool CpyFile(fs::path from, fs::path to, bool replace)
    {
        if (!fs::exists(from) || fs::is_directory(from))
            return false;

        if (fs::exists(to) && !replace)
            return false;

        if (!fs::exists(to.parent_path()))
            fs::create_directories(to.parent_path());
        else if (!fs::is_directory(to.parent_path()))
            return false;

        if (fs::exists(to))
            fs::remove_all(to);
        fs::copy_file(from, to);
        return true;
    }

    bool CpyDir(fs::path from, fs::path to, bool replace)
    {
        if (!fs::exists(from) || !fs::is_directory(from))
            return false;

        if (!fs::exists(to))
        {
            if (!fs::create_directories(to))
                return false;
        }
        else if (!fs::is_directory(to))
            return false;

        for (fs::directory_iterator file(from); file != fs::directory_iterator(); ++file)
        {
            fs::path current(file->path());
            if (fs::is_directory(current))
            {
                if (!CpyDir(current.string(), fs::path(to / current.filename()).string(), replace))
                    return false;
            }
            else if (!fs::exists(to / current.filename()) || (replace && fs::remove_all(to / current.filename())))
                fs::copy_file(current, to / current.filename());
        }
        return true;
    }

    std::string exec(std::string cmd)
    {
        FILE* pipe = _popen(cmd.c_str(), "r");
        if (!pipe)
            return "ERROR";
        char buffer[128];
        std::string result = "";
        while (!feof(pipe))
            if (fgets(buffer, 128, pipe) != NULL)
                result = +buffer;
        _pclose(pipe);
        return result.substr(0, result.length() - 1);
    }

    std::ifstream::pos_type filesize(fs::path path)
    {
        std::ifstream in(path.string(), std::ifstream::ate | std::ifstream::binary);
        return in.tellg();
    }

    std::string GetLastErrorAsString()
    {
        DWORD error = GetLastError();
        if (error)
        {
            LPVOID lpMsgBuf;
            DWORD bufLen = FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS,
                NULL, error, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), (LPTSTR)&lpMsgBuf, 0, NULL);
            if (bufLen)
            {
                LPCSTR lpMsgStr = (LPCSTR)lpMsgBuf;
                std::string result(lpMsgStr, lpMsgStr + bufLen);
                LocalFree(lpMsgBuf);
                return result;
            }
        }
        return std::string();
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

bool ClientSelector::Cpy(std::string from, std::string to)
{
    if (fs::exists(from))
    {
        if (fs::is_directory(from))
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
    if (!fs::exists(fs::path(in)))
        return;

    fs::directory_iterator end_itr;
    for (fs::directory_iterator i(in); i != end_itr; ++i)
    {
        std::string file = i->path().string();
        if (boost::regex_match(i->path().filename().string(), boost::regex(filter, icase ? boost::regex::icase : boost::regex::normal)))
        {
            if (fs::is_directory(i->status()))
            {
                if (cpyDir)
                    CpyDir(file, std::string(to + file.substr(from.length(), file.length() - from.length())));
                else if (subDir)
                    XCpy(filter, file, from, to, subDir, icase, false, true); // subdir
            }
            else
                CpyFile(file, std::string(to + file.substr(from.length(), file.length() - from.length())));
        }
        else if (fs::is_directory(i->status()) && subDir)
            XCpy(filter, file, from, to, true, icase, cpyDir, true); // subdir
    }
}

void ClientSelector::Fnd(std::string filter, std::string in, std::vector<std::string> &found, bool subDir, bool icase)
{
    if (!fs::exists(fs::path(in)))
        return;

    fs::directory_iterator end_itr;
    for (fs::directory_iterator i(in); i != end_itr; ++i)
    {
        if (boost::regex_match(i->path().filename().string(), boost::regex(filter, icase ? boost::regex::icase : boost::regex::normal)))
            found.push_back(i->path().string());
        else if (fs::is_directory(i->status()) && subDir)
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
