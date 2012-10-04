#include "MPQManager.h"
#include "WDT.h"
#include "ContinentBuilder.h"
#include "Cache.h"
#include "DBC.h"
#include "Constants.h"
#include "Model.h"

#include <set>

#include "Common.h"
#include "LoginDatabase.h"
#include "Util.h"
LoginDatabaseWorkerPool LoginDatabase;

MPQManager* MPQHandler;
CacheClass* Cache;

void ExtractMMaps(std::set<uint32>& mapIds, uint32 threads, bool debug)
{
    DBC* dbc = MPQHandler->GetDBC("Map");
    for (std::vector<Record*>::iterator itr = dbc->Records.begin(); itr != dbc->Records.end(); ++itr)
    {
        uint32 mapId = (*itr)->Values[0];

        // Skip this map if a list of specific maps was provided and this one is not contained in it.
        if (!mapIds.empty() && mapIds.find(mapId) == mapIds.end())
            continue;

        std::string name = (*itr)->GetString(1);
        WDT wdt("World\\maps\\" + name + "\\" + name + ".wdt");
        if (!wdt.IsValid || wdt.IsGlobalModel)
            continue;
        printf("Building %s MapId %u\n", name.c_str(), mapId);
        ContinentBuilder builder(name, mapId, &wdt, threads);
        builder.Build(debug);
    }
}

void ExtractDBCs()
{
    printf("Extracting DBCs\n");
    // Create the filesystem structure
    std::string baseDBCPath = "dbc/";
    Utils::CreateDir(baseDBCPath);

    // Populate list of DBC files
    std::set<std::string> DBCFiles;
    for (std::vector<std::string>::iterator itr = MPQHandler->LocaleFiles[MPQHandler->BaseLocale]->Files.begin(); itr != MPQHandler->LocaleFiles[MPQHandler->BaseLocale]->Files.end(); ++itr)
        if (itr->rfind(".dbc") == itr->length() - strlen(".dbc"))
            DBCFiles.insert(*itr);

    // Iterate over all available locales
    for (std::set<uint32>::iterator itr = MPQHandler->AvailableLocales.begin(); itr != MPQHandler->AvailableLocales.end(); ++itr)
    {
        printf("Extracting DBCs for locale %s\n", MPQManager::Languages[*itr]);
        std::string path = baseDBCPath;
        if (*itr != MPQHandler->BaseLocale)
        {
            path += std::string(MPQManager::Languages[*itr]) + "/";
            Utils::CreateDir(path);
        }
        
        std::string component = "component.wow-" + std::string(MPQManager::Languages[*itr]) + ".txt";
        // Extract the component file
        Utils::SaveToDisk(MPQHandler->GetFile(component), path + component);
        // Extract the DBC files for the given locale
        for (std::set<std::string>::iterator itr2 = DBCFiles.begin(); itr2 != DBCFiles.end(); ++itr2)
            Utils::SaveToDisk(MPQHandler->GetFileFrom(*itr2, MPQHandler->LocaleFiles[*itr]), path + (itr2->c_str() + strlen("DBFilesClient\\")));
    }
    printf("DBC extraction finished!\n");
}

void ExtractGameobjectModels()
{
    Constants::ToWoWCoords = true;
    printf("Extracting GameObject models\n");

    std::string baseBuildingsPath = "Buildings/";
    std::string baseVmapsPath = "vmaps/";
    Utils::CreateDir(baseVmapsPath);
    Utils::CreateDir(baseBuildingsPath);

    FILE* modelList = fopen((baseVmapsPath + "GameObjectModels.list").c_str(), "wb");
    if (!modelList)
    {
        printf("Could not create file vmaps/GameObjectModels.list, please make sure that you have the write permissions in the folder\n");
        return;
    }

    DBC* dbc = MPQHandler->GetDBC("GameObjectDisplayInfo");
    for (std::vector<Record*>::iterator itr = dbc->Records.begin(); itr != dbc->Records.end(); ++itr)
    {
        std::string path = (*itr)->GetString(1);
        std::string fileName = Utils::GetPlainName(path.c_str());
        std::string extension = Utils::GetExtension(fileName);
        // Convert the extension to lowercase
        std::transform(extension.begin(), extension.end(), extension.begin(), ::tolower);
        if (extension == "mdx" || extension == "m2")
        {
            fileName = Utils::FixModelPath(fileName);
            Model model(path);
            
            if (model.IsBad)
                continue;

            FILE* output = fopen((baseBuildingsPath + fileName).c_str(), "wb");
            if (!output)
            {
                printf("Could not create file %s, please check that you have write permissions\n", (baseBuildingsPath + fileName).c_str());
                continue;
            }
            // Placeholder for 0 values
            int Nop[12] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

            fwrite(Constants::VMAPMagic, 8, 1, output);
            uint32 numVerts = model.Header.CountBoundingVertices;
            fwrite(&numVerts, sizeof(uint32), 1, output);
            uint32 numGroups = 1;
            fwrite(&numGroups, sizeof(uint32), 1, output);
            fwrite(Nop, 4 * 3 , 1, output); // rootwmoid, flags, groupid
            fwrite(Nop, sizeof(float), 3 * 2, output);//bbox, only needed for WMO currently
            fwrite(Nop, 4, 1, output);// liquidflags
            fwrite("GRP ", 4, 1, output);

            uint32 branches = 1;
            uint32 wsize = sizeof(branches) + sizeof(uint32) * branches;
            fwrite(&wsize, sizeof(uint32), 1, output);
            fwrite(&branches, sizeof(branches), 1, output);
            uint32 numTris = model.Header.CountBoundingTriangles;
            fwrite(&numTris, sizeof(uint32), 1, output);
            fwrite("INDX", 4, 1, output);
            wsize = sizeof(uint32) + sizeof(unsigned short) * numTris;
            fwrite(&wsize, sizeof(int), 1, output);
            fwrite(&numTris, sizeof(uint32), 1, output);
            uint16* indices = new uint16[numTris];

            if (numTris > 0)
            {
                uint32 i = 0;
                for (std::vector<Triangle<uint16> >::iterator itr2 = model.Triangles.begin(); itr2 != model.Triangles.end(); ++itr2, ++i)
                {
                    indices[i * 3 + 0] = itr2->V0;
                    indices[i * 3 + 1] = itr2->V1;
                    indices[i * 3 + 2] = itr2->V2;
                }
                fwrite(indices, sizeof(uint16), numTris, output);
            }

            
            fwrite("VERT", 4, 1, output);
            wsize = sizeof(int) + sizeof(float) * 3 * numVerts;
            fwrite(&wsize, sizeof(int), 1, output);
            fwrite(&numVerts, sizeof(int), 1, output);
            float* vertices = new float[numVerts*3];

            if (numVerts > 0)
            {
                uint32 i = 0;
                for (std::vector<Vector3>::iterator itr2 = model.Vertices.begin(); itr2 != model.Vertices.end(); ++itr2, ++i)
                {
                    vertices[i * 3 + 0] = itr2->x;
                    vertices[i * 3 + 1] = itr2->y;
                    vertices[i * 3 + 2] = itr2->z;
                }

                fwrite(vertices, sizeof(float), numVerts * 3, output);
            }
            
            fclose(output);
            delete[] indices;
            delete[] vertices;
        }
        else if (extension == "wmo")
        {
            //WorldModelRoot model(path);
        }
    }

    printf("GameObject models extraction finished!");
    Constants::ToWoWCoords = false;
}

bool HandleArgs(int argc, char** argv, uint32& threads, std::set<uint32>& mapList, bool& debugOutput, uint32& extractFlags)
{
    char* param = NULL;
    extractFlags = 0;

    for (int i = 1; i < argc; ++i)
    {
        if (strcmp(argv[i], "--threads") == 0)
        {
            param = argv[++i];
            if (!param)
                return false;

            threads = atoi(param);
            printf("Using %i threads\n", threads);
        }
        else if (strcmp(argv[i], "--maps") == 0)
        {
            param = argv[++i];
            if (!param)
                return false;
            std::string maps = std::string(param);
            Tokens tokens(maps, ',');

            for (Tokens::iterator itr = tokens.begin(); itr != tokens.end(); ++itr)
                mapList.insert(atoi(*itr));

            printf("Extracting only provided list of maps (%u).\n", mapList.size());
        }
        else if (strcmp(argv[i], "--debug") == 0)
        {
            param = argv[++i];
            if (!param)
                return false;
            debugOutput = atoi(param);
            if (debugOutput)
                printf("Output will contain debug information (.obj files)\n");
        }
        else if (strcmp(argv[i], "--extract") == 0)
        {
            param = argv[++i];
            if (!param)
                return false;

            extractFlags = atoi(param);

            if (!(extractFlags & Constants::EXTRACT_FLAG_ALLOWED)) // Tried to use an invalid flag
                return false;

            printf("Detected flags: \n");
            printf("* Extract DBCs: %s\n", (extractFlags & Constants::EXTRACT_FLAG_DBC) ? "Yes" : "No");
            printf("* Extract Maps: %s\n", (extractFlags & Constants::EXTRACT_FLAG_MAPS) ? "Yes" : "No");
            printf("* Extract VMaps: %s\n", (extractFlags & Constants::EXTRACT_FLAG_VMAPS) ? "Yes" : "No");
            printf("* Extract GameObject Models: %s\n", (extractFlags & Constants::EXTRACT_FLAG_GOB_MODELS) ? "Yes" : "No");
            printf("* Extract MMaps: %s\n", (extractFlags & Constants::EXTRACT_FLAG_MMAPS) ? "Yes" : "No");
        }
    }
    return true;
}

void PrintUsage()
{
    printf("MeshExtractor help.\n");
    printf("* Use \"--threads <number>\" to specify <number> threads, default to 4 (Only available when extracting MMaps)\n");
    printf("* Use \"--maps a,b,c,d,e\" to extract only the maps specified (Do not use spaces)\n");
    printf("* Use \"--debug 1\" to generate debug information of the tiles (Only available when extracting MMaps)\n");
    printf("* Use \"--extract X\" to extract the data specified by the flag X (Note: You can combine the flags with the bitwise OR operator |). Available flags are: \n");
    {
        printf("- %u to extract DBCs\n", Constants::EXTRACT_FLAG_DBC);
        printf("- %u to extract Maps (Not yet implemented)\n", Constants::EXTRACT_FLAG_MAPS);
        printf("- %u to extract VMaps (Not yet implemented)\n", Constants::EXTRACT_FLAG_VMAPS);
        printf("- %u to extract GameObject models (Not yet finished)\n", Constants::EXTRACT_FLAG_GOB_MODELS);
        printf("- %u to extract MMaps (Not yet finished)\n", Constants::EXTRACT_FLAG_MMAPS);
    }
}

int main(int argc, char* argv[])
{
    system("pause");
    uint32 threads = 4, extractFlags = 0;
    std::set<uint32> mapIds;
    bool debug = false;
    
    if (!HandleArgs(argc, argv, threads, mapIds, debug, extractFlags))
    {
        PrintUsage();
        return -1;
    }

    Cache = new CacheClass();
    MPQHandler = new MPQManager();
    MPQHandler->Initialize();

    if (extractFlags & Constants::EXTRACT_FLAG_DBC)
        ExtractDBCs();

    if (extractFlags & Constants::EXTRACT_FLAG_MMAPS)
        ExtractMMaps(mapIds, threads, debug);

    if (extractFlags & Constants::EXTRACT_FLAG_GOB_MODELS)
        ExtractGameobjectModels();
   
    return 0;
}