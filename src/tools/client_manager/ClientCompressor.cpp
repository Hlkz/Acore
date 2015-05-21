
#include "ClientManager.h"
#include "ClientCompressor.h"

#include "StormLib\StormLib.h"
#include "StormLib\StormCommon.h"

#include "Timer.h"
#include <String.h>
#include <iostream>
#include <iomanip>
#include <boost\algorithm\string.hpp>

ClientCompressor::ClientCompressor(po::variables_map vm)
{
    mVm = vm;
    mFlags = 0;
    if (mVm.count("c-all"))
        mFlags |= COMPRESS_ALL;
    if (mVm.count("c-common"))
        mFlags |= COMPRESS_COMMON;
    if (mVm.count("c-common2"))
        mFlags |= COMPRESS_COMMON2;
    if (mVm.count("c-lichking"))
        mFlags |= COMPRESS_LICHKING;
    if (mVm.count("c-locale"))
        mFlags |= COMPRESS_LOCALE;
    if (mVm.count("c-speech"))
        mFlags |= COMPRESS_SPEECH;
    if (mVm.count("c-patch"))
        mFlags |= COMPRESS_PATCH;
    if (mVm.count("c-udbc"))
        mFlags |= UPDATE_DBC;
    if (mVm.count("c-ulua"))
        mFlags |= UPDATE_LUA;
    if (!mFlags)
        return;

    Proceed();
}

bool ClientCompressor::Proceed()
{
    if (PatchOutputPath.length() < 10)
        return false;
    uint32 oldMSTime = getMSTime();
    std::cout << "\nCompressor";

    SaveOutput();

    bool all = mFlags & COMPRESS_ALL;

    if (mFlags & COMPRESS_LOCALE || mFlags & COMPRESS_PATCH || mFlags & COMPRESS_SPEECH || all)
    {
        fs::create_directories(PatchOutputPath + "\\frFR");
        fs::create_directories(PatchOutputPath + "\\enUS");
    }

    // Patch
    if (mFlags & COMPRESS_PATCH)
    {
        GeneratePatchMPQ(LOCALE_frFR);
        GeneratePatchMPQ(LOCALE_enUS);
    }
    // Mixed
    if (mFlags & COMPRESS_COMMON || all)
        GenerateCommonMPQ();
    if (mFlags & COMPRESS_COMMON2 || all)
        GenerateCommon2MPQ();
    if (mFlags & COMPRESS_LICHKING || all)
        GenerateLichkingMPQ();
    // frFR
    if (mFlags & COMPRESS_LOCALE || all)
        GenerateLocaleMPQ(LOCALE_frFR);
    if (mFlags & COMPRESS_SPEECH || all)
        GenerateSpeechMPQ(LOCALE_frFR);
    // enUS
    if (mFlags & COMPRESS_LOCALE || all)
        GenerateLocaleMPQ(LOCALE_enUS);
    if (mFlags & COMPRESS_SPEECH || all)
        GenerateSpeechMPQ(LOCALE_enUS);

    // Update dbc/lua in client (test function)
    if (mFlags & UPDATE_DBC || mFlags & UPDATE_LUA)
    {
        if (fs::exists(GameDataPath + "\\frFR"))
            UpdatePatchMPQ(LOCALE_frFR);
        if (fs::exists(GameDataPath + "\\enUS"))
            UpdatePatchMPQ(LOCALE_enUS);
    }

    printf("\nCompressor executed in %u ms\n", GetMSTimeDiffToNow(oldMSTime));
    return true;
}

bool ClientCompressor::SaveOutput()
{
    bool save = false;
    boost::filesystem::directory_iterator end_itr;
    for (boost::filesystem::directory_iterator i(PatchOutputPath); i != end_itr; ++i)
        if (!fs::is_directory(i->status()) || !boost::regex_match(i->path().filename().string(), boost::regex("[0-9]{4}-[0-9]{2}-[0-9]{2}.*")))
            save = true;

    if (save)
    {
        printf("\n  Saving Output");
        time_t t;
        time(&t);
        tm* time = localtime(&t);
        std::stringstream saveDir;
        saveDir << PatchOutputPath << "/" << std::setw(4) << std::setfill('0') << time->tm_year + 1900 << "-" << std::setw(2) << time->tm_mon + 1 << "-" << std::setw(2) << time->tm_mday;
        fs::path savePath(saveDir.str());
        uint8 i = 0;
        while (fs::exists(savePath))
        {
            i++;
            std::ostringstream saveString;
            saveString << saveDir.str() << "_" << (uint32)i;
            savePath = fs::path(saveString.str());

        }
        fs::create_directories(savePath);
        boost::filesystem::directory_iterator end_itr;
        for (boost::filesystem::directory_iterator i(PatchOutputPath); i != end_itr; ++i)
            if (!fs::is_directory(i->status()) || !boost::regex_match(i->path().filename().string(), boost::regex("[0-9]{4}-[0-9]{2}-[0-9]{2}.*")))
                fs::rename(i->path(), savePath / i->path().filename());
    }
    return true;
}

void ClientCompressor::GenerateCommonMPQ()
{
    printf("\n  Starting Common generation");
    fs::path commonPath(fs::path(PatchOutputPath) / fs::path("common.mpq"));
    HANDLE common;
    SFileCreateArchive(commonPath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, 0x40000, &common);

    AddDirToMPQ(TinyDataPath + "\\_shaders", "_shaders", &common);
    AddDirToMPQ(TinyDataPath + "\\Cameras", "Cameras", &common);
    AddDirToMPQ(TinyDataPath + "\\Character", "Character", &common);
    AddDirToMPQ(TinyDataPath + "\\Creature", "Creature", &common);
    AddDirToMPQ(TinyDataPath + "\\Environments", "Environments", &common);
    AddDirToMPQ(TinyDataPath + "\\Interiors", "Interiors", &common);
    AddDirToMPQ(TinyDataPath + "\\Item", "Item", &common);
    AddDirToMPQ(TinyDataPath + "\\Particles", "Particles", &common);
    AddDirToMPQ(TinyDataPath + "\\shaders", "shaders", &common);
    AddDirToMPQ(TinyDataPath + "\\Spell", "Spell", &common);
    AddDirToMPQ(TinyDataPath + "\\Spells", "Spells", &common);
    AddDirToMPQ(TinyDataPath + "\\Textures", "Textures", &common);
    AddDirToMPQ(TinyDataPath + "\\Tileset", "Tileset", &common);
    AddDirToMPQ(TinyDataPath + "\\WTF", "WTF", &common);
    AddDirToMPQ(TinyDataPath + "\\XTextures", "XTextures", &common);
    AddFileToMPQ(TinyDataPath + "\\signaturefile", "signaturefile", &common);
    AddFileToMPQ(TinyDataPath + "\\component.wow-data.txt", "component.wow-data.txt", &common);

    SFileCloseArchive(common);
    printf("\n  Ending Common generation");
}

void ClientCompressor::GenerateCommon2MPQ()
{
    printf("\n  Starting Common2 generation");
    fs::path common2Path(fs::path(PatchOutputPath) / fs::path("common-2.mpq"));
    HANDLE common2;
    SFileCreateArchive(common2Path.string().c_str(), MPQ_CREATE_ARCHIVE_V2, 0x40000, &common2);

    AddDirToMPQ(TinyDataPath + "\\Sound", "Sound", &common2);

    SFileCloseArchive(common2);
    printf("\n  Ending Common2 generation");
}

void ClientCompressor::GenerateLichkingMPQ()
{
    printf("\n  Starting Lichking generation");
    fs::path lichkingPath(fs::path(PatchOutputPath) / fs::path("lichking.mpq"));
    HANDLE lichking;
    SFileCreateArchive(lichkingPath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, 0x40000, &lichking);

    AddDirToMPQ(TinyDataPath + "\\World", "World", &lichking);
    AddDirToMPQ(TinyDataPath + "\\Dungeons", "Dungeons", &lichking);

    SFileCloseArchive(lichking);
    printf("\n  Ending Lichking generation");
}

void ClientCompressor::GenerateLocaleMPQ(uint8 loc)
{
    printf("\n  Starting Locale generation ");
    std::string locs = loc ? "frFR" : "enUS";
    std::cout << locs;
    std::string prefix = loc ? TinyDataPathFr : TinyDataPathEn;
    fs::path localePath(PatchOutputPath + "\\" + locs + "\\" + "locale-" + locs + ".mpq");
    HANDLE locale;
    SFileCreateArchive(localePath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, 0x40000, &locale);

    AddDirToMPQ(prefix + "\\Fonts", "Fonts", &locale);
    AddDirToMPQ(prefix + "\\Interface", "Interface", &locale);
    AddFileToMPQ(prefix + "\\Wow.ini", "Wow.ini", &locale);
    AddFileToMPQ(prefix + "\\component.wow-" + locs + ".txt", "component.wow-" + locs + ".txt", &locale);

    SFileCloseArchive(locale);
    printf("\n  Ending Locale generation");
}

void ClientCompressor::GenerateSpeechMPQ(uint8 loc)
{
    printf("\n  Starting Speech generation ");
    std::string locs = loc ? "frFR" : "enUS";
    std::cout << locs;
    std::string prefix = loc ? TinyDataPathFr : TinyDataPathEn;
    fs::path speechPath(PatchOutputPath + "\\" + locs + "\\" + "speech-" + locs + ".mpq");
    HANDLE speech;
    SFileCreateArchive(speechPath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, 0x40000, &speech);

    AddDirToMPQ(prefix + "\\Sound", "Sound", &speech);

    SFileCloseArchive(speech);
    printf("\n  Ending Speech generation");
}

void ClientCompressor::GeneratePatchMPQ(uint8 loc)
{
    printf("\n  Starting Patch generation ");
    std::string locs = loc ? "frFR" : "enUS";
    std::cout << locs;
    std::string prefix = TinyDataPathPatch + "\\" + locs;
    fs::path patchPath(PatchOutputPath + "\\" + locs + "\\" + "patch-" + locs + ".mpq");
    HANDLE patch;
    SFileCreateArchive(patchPath.string().c_str(), MPQ_CREATE_ARCHIVE_V2, 0x4000, &patch);

    AddDirToMPQ(prefix + "\\DBFilesClient", "DBFilesClient", &patch);
    AddDirToMPQ(prefix + "\\Interface", "Interface", &patch);

    SFileCloseArchive(patch);
    printf("\n  Ending Patch generation");
}

void ClientCompressor::UpdatePatchMPQ(uint8 loc)
{
    printf("\n  Updating Patch ");
    std::string locs = loc ? "frFR" : "enUS";
    std::cout << locs;
    std::string prefix = TinyDataPathPatch + "\\" + locs;
    fs::path patchPath(GameDataPath + "\\" + locs + "\\" + "patch-" + locs + ".mpq");
    HANDLE patch;

    if (SFileOpenArchive(patchPath.string().c_str(), 0, 0, &patch))
    {
        if (mFlags & UPDATE_DBC)
        {
            std::cout << " dbc";
            AddDirToMPQ(prefix + "\\DBFilesClient", "DBFilesClient", &patch, true);
        }
        if (mFlags & UPDATE_LUA)
        {
            std::cout << " lua";
            AddDirToMPQ(prefix + "\\Interface", "Interface", &patch, true);
        }
        printf("\n  Compacting...");
        SFileCompactArchive(patch, NULL, 0);
        SFileCloseArchive(patch);
    }
    else
        printf("\n  Error opening the archive (code: %u)", GetLastError());

    //printf("\n  Ending Patch update");
}

bool ClientCompressor::AddFileToMPQ(fs::path from, fs::path to, HANDLE* mpq, bool replace)
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
        dwFlags =  MPQ_FILE_COMPRESS | MPQ_FILE_ENCRYPTED;

    if (replace)
        dwFlags |= MPQ_FILE_REPLACEEXISTING;

    //if (dwFlags & MPQ_FILE_COMPRESS)
    //    SFileAddFileEx(mpq, from.string().c_str(), to.string().c_str(), dwFlags, dwCompression, dwCompressionNext);
    //else
    return SFileAddFile(*mpq, from.string().c_str(), to.string().c_str(), dwFlags);
}

bool ClientCompressor::AddDirToMPQ(fs::path from, fs::path to, HANDLE* mpq, bool replace)
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
