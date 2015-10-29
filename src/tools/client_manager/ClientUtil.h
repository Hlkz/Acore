#ifndef CLIENTUTIL_H
#define CLIENTUTIL_H

namespace Util
{
    std::string RemoveName(std::string fullPath);
    std::string RemovePrefix(std::string str, std::string prefix);

    bool CpyFile(fs::path from, fs::path to, bool replace = false);
    bool CpyDir(fs::path from, fs::path to, bool replace = false);

    std::string exec(std::string cmd);
    std::ifstream::pos_type filesize(fs::path path);
    std::string GetLastErrorAsString();
}

#endif
