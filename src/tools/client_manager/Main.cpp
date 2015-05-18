#include "ClientManager.h"
#include <iostream>

LoginDatabaseWorkerPool LoginDatabase;
UnusedDatabaseWorkerPool UnusedDatabase;
WorldDatabaseWorkerPool WorldDatabase;

std::string FullDataPath;
std::string FullDataPathLoc;
std::string TinyDataPath;
std::string TinyDataPathLoc;
std::string TinyDataPathPatch;
std::string PatchOutputPath;
std::string PatchResPath;

std::string FullDataPathEn;
std::string FullDataPathFr;
std::string TinyDataPathEn;
std::string TinyDataPathFr;

int main(int argc, char *argv[])
{
    po::options_description desc("Allowed options");
    desc.add_options()
        ("help", "produce help message")

        ("selector", "Launch ClientSelector")
            ("deldata", "Delete TinyData before selection")
            ("noadt", "Don't select files from adts")
            ("nodb", "Don't select files from the db")
                ("noitem", "Don't select items from the db")
            ("nosound", "Don't select sounds files")
            ("nocompletion", "Don't select completion files")

        ("compress", "Launch ClientCompressor")
            ("all", "Compress All")
            ("common", "Compress Common")
            ("common-2", "Compress Common-2")
            ("lichking", "Compress Lichking")
            ("locale", "Compress Locale")
            ("speech", "Compress Speech")
            ("patch", "Compress Patch")
        //("compression", po::value<int>(), "set compression level")
        ;

    po::variables_map vm;
    po::store(po::parse_command_line(argc, argv, desc), vm);
    po::notify(vm);

    if (vm.count("help"))
    {
        std::cout << desc << "\n";
        return 1;
    }

    ClientManager* Manager = new ClientManager(vm);

    printf("\n  EndOfExe\n  ");
    //system("pause");
    return 0;
}
