#include "ClientManager.h"
#include "Configuration/Config.h"
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
std::string GameDataPath;

std::string FullDataPathEn;
std::string FullDataPathFr;
std::string TinyDataPathEn;
std::string TinyDataPathFr;

int main(int argc, char *argv[])
{
    po::options_description desc("Allowed options");
    desc.add_options()
        ("help", "produce help message")

        ("s-all", "Select All")
        ("s-adt", "Select from adts")
        ("s-db", "Select from the db")
        ("s-sound", "Select sounds")
        ("s-compl", "Selection Completion")
        ("s-noitem", "Don't select items from the db")
        ("s-deldata", "Delete TinyData before selection")

        ("c-all", "Compress All")
        ("c-common", "Compress Common")
        ("c-common2", "Compress Common-2")
        ("c-lichking", "Compress Lichking")
        ("c-locale", "Compress Locale")
        ("c-speech", "Compress Speech")
        ("c-patch", "Compress Patch")
        ("c-udbc", "Update dbc")
        ("c-ulua", "Update lua")
        ("c-install", "Install to game path")
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

    std::string configFile = "clientmanager.conf";
    std::string configError;
    if (!sConfigMgr->LoadInitial(configFile, configError))
    {
        printf("Error in config file: %s\n", configError.c_str());
        return 1;
    }

    ClientManager* Manager = new ClientManager(vm);

    printf("\n");
    //printf("\nEndOfExe\n  ");
    //system("pause");
    return 0;
}
