#ifndef CLIENTUTIL_H
#define CLIENTUTIL_H

namespace Util
{
    std::string RemoveName(std::string fullPath);
    std::string RemovePrefix(std::string str, std::string prefix);

    bool CpyDir(std::string from, std::string to);

    bool AddFileToMPQ(fs::path from, fs::path to, HANDLE* mpq, bool replace = false);
    bool AddDirToMPQ(fs::path from, fs::path to, HANDLE* mpq, bool replace = false);

    std::ifstream::pos_type filesize(const char* filename);
}
#endif
