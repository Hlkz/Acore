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
            fs::create_directories(to);
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
}

namespace Manager
{
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

        fs::directory_iterator end_itr;
        for (fs::directory_iterator i(from); i != end_itr; ++i)
            if (fs::is_directory(i->status()))
                AddDirToMPQ(i->path(), to / i->path().filename(), mpq, replace);
            else
                AddFileToMPQ(i->path(), to / i->path().filename(), mpq, replace);
        return true;
    }

    bool BuildVersion(fs::path dest, uint32 build, uint32 major, uint32 minor, uint32 bugfix)
    {
#ifndef WIN32
        printf("\nThis programm only works on windows");
        return;
#endif

        QueryResult result;

        if (!build)
        {
            result = LoginDatabase.Query("SELECT Build FROM versions ORDER BY Build DESC LIMIT 1");
            build = result->Fetch()->GetUInt32();
            if (!build)
                return false;
        }

        if (!major && !minor && !bugfix)
        {
            std::stringstream select_query;
            select_query << "SELECT MajorVersion, MinorVersion, BugfixVersion FROM versions WHERE Build = " << build;
            result = LoginDatabase.Query(select_query.str().c_str());
            Field* fields = result->Fetch();
            major = fields[0].GetUInt32();
            minor = fields[1].GetUInt32();
            bugfix = fields[2].GetUInt32();
        }

        if (fs::exists(dest))
            fs::remove_all(dest);
        else if (!fs::exists(dest.parent_path()))
            fs::create_directories(dest.parent_path());
        else if (!fs::is_directory(dest.parent_path()))
            return false;

        TCHAR NPath[MAX_PATH];
        GetCurrentDirectory(MAX_PATH, NPath);
        SetCurrentDirectory(UpdatePath.string().c_str());

        fs::path buildVersion_exe("bin\\BuildVersion.exe");
        std::stringstream buildVersion_cmd;
        buildVersion_cmd << buildVersion_exe.string() << " --file=" << dest.string()
            << " --Major=\"" << major << "\" --Minor=\"" << minor << "\" --Bugfix=\"" << bugfix << "\" --Build=\"" << build << "\"" << std::endl;
        Util::exec(buildVersion_cmd.str().c_str());

        SetCurrentDirectory(NPath);
        if (!fs::exists(dest))
        {
            printf("\n  Error generating Wow.exe");
            return false;
        }
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
