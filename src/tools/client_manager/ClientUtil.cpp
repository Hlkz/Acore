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

    std::wstring GetActualPathName(const wchar_t* path)
    {
        // This is quite involved, but the meat is SHGetFileInfo

        const wchar_t kSeparator = L'\\';

        // copy input string because we'll be temporary modifying it in place
        size_t length = wcslen(path);
        wchar_t buffer[MAX_PATH];
        memcpy(buffer, path, (length + 1) * sizeof(path[0]));

        size_t i = 0;

        std::wstring result;

        // for network paths (\\server\share\RestOfPath), getting the display
        // name mangles it into unusable form (e.g. "\\server\share" turns
        // into "share on server (server)"). So detect this case and just skip
        // up to two path components
        if (length >= 2 && buffer[0] == kSeparator && buffer[1] == kSeparator)
        {
            int skippedCount = 0;
            i = 2; // start after '\\'
            while (i < length && skippedCount < 2)
            {
                if (buffer[i] == kSeparator)
                    ++skippedCount;
                ++i;
            }

            result.append(buffer, i);
        }
        // for drive names, just add it uppercased
        else if (length >= 2 && buffer[1] == L':')
        {
            result += towupper(buffer[0]);
            result += L':';
            if (length >= 3 && buffer[2] == kSeparator)
            {
                result += kSeparator;
                i = 3; // start after drive, colon and separator
            }
            else
            {
                i = 2; // start after drive and colon
            }
        }

        size_t lastComponentStart = i;
        bool addSeparator = false;

        while (i < length)
        {
            // skip until path separator
            while (i < length && buffer[i] != kSeparator)
                ++i;

            if (addSeparator)
                result += kSeparator;

            // if we found path separator, get real filename of this
            // last path name component
            bool foundSeparator = (i < length);
            buffer[i] = 0;
            SHFILEINFOW info;

            // nuke the path separator so that we get real name of current path component
            info.szDisplayName[0] = 0;
            if (SHGetFileInfoW(buffer, 0, &info, sizeof(info), SHGFI_DISPLAYNAME))
            {
                result += info.szDisplayName;
            }
            else
            {
                // most likely file does not exist.
                // So just append original path name component.
                result.append(buffer + lastComponentStart, i - lastComponentStart);
            }

            // restore path separator that we might have nuked before
            if (foundSeparator)
                buffer[i] = kSeparator;

            ++i;
            lastComponentStart = i;
            addSeparator = true;
        }

        return result;
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
