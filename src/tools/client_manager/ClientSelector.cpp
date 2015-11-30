#include "ClientManager.h"
#include "Timer.h"
#include <tchar.h>
#include <iostream>
#include <regex>
#include <boost/filesystem.hpp>
#include <boost/algorithm/string.hpp>

ClientSelector::ClientSelector(po::variables_map vm)
{
    mFlags = 0;
    if (vm.count("s-adt"))
        mFlags |= EXTRACT_ADTS;
    if (vm.count("s-db"))
        mFlags |= EXTRACT_DATABASE;
    if (vm.count("s-sound"))
        mFlags |= EXTRACT_SOUNDS;
    if (vm.count("s-compl"))
        mFlags |= COMPLETION;
    if (vm.count("s-all"))
        mFlags = EXTRACT_ADTS | EXTRACT_DATABASE | EXTRACT_SOUNDS | COMPLETION;
    if (vm.count("s-noitem"))
        mFlags |= DONT_EXTRACT_ITEMS;
    if (!mFlags)
        return;

    mVm = vm; // additionnals
    mCopy = true;

    // Adts
    Adt         = XFiles(XTRCT_MIX | EXT_ADT | XTRCT_REGEX);
    WdAdt       = XFiles(XTRCT_MIX | EXT_WDL | XTRCT_REGEX);
    BlpAdt      = eFiles(XTRCT_MIX);
    MdxAdt      = eFiles(XTRCT_MIX | EXT_MDX);
    BlpMap      = eFiles(XTRCT_LOC | XTRCT_CPYDIR);
    BlpMinimap  = eFiles(XTRCT_MIX);
    // Wmos
    WmoAdt      = eFiles(XTRCT_MIX | EXT_WMO);
    GroupWmo    = XFiles(XTRCT_MIX | XTRCT_REGEX);
    BlpWmo      = eFiles(XTRCT_MIX);
    MdxWmo      = eFiles(XTRCT_MIX | EXT_MDX);
    // Models
    eMdx_M      = eFiles(XTRCT_MIX | EXT_MDX);
    eWmoMdx_M   = eFiles(XTRCT_MIX | EXT_MDX | EXT_WMO);
    MdxGround   = XFiles(XTRCT_MIX | EXT_MDX | XTRCT_SUBDIR);
    MdxItem     = XFiles(XTRCT_MIX | EXT_MDX | XTRCT_SUBDIR);
    MdxItemHead = XFiles(XTRCT_MIX | EXT_A_MDX | XTRCT_SUBDIR | XTRCT_REGEX);
    SkinMdx     = XFiles(XTRCT_REGEX);
    AnimMdx     = XFiles(XTRCT_REGEX);
    BlpM2       = eFiles();
    // Textures
    Blp_RL      = XFiles(XTRCT_LOC | XTRCT_REGEX);
    eBlp        = eFiles();
    eBlp_M      = eFiles(XTRCT_MIX);
    BlpItem     = XFiles(XTRCT_MIX | XTRCT_SUBDIR);
    BlpItem2    = XFiles(XTRCT_MIX | XTRCT_SUBDIR | XTRCT_REGEX);
    BlpIcon     = eFiles(XTRCT_LOC);
    BlpBaked    = eFiles(XTRCT_MIX);
    // Sounds
    Sounds      = XFiles(XTRCT_SUBDIR);

    Proceed();
}

bool ClientSelector::Proceed()
{
    uint32 oldMSTime = getMSTime();
    TC_LOG_INFO("client.selector", "  ClientSelector");
    TC_LOG_INFO("client.selector", "    Extracting Adts: %s", (mFlags & EXTRACT_ADTS ? "yes" : "no"));
    TC_LOG_INFO("client.selector", "    Extracting Database: %s", (mFlags & EXTRACT_DATABASE ? "yes" : "no"));
    TC_LOG_INFO("client.selector", "    Extracting Sounds: %s", (mFlags & EXTRACT_SOUNDS ? "yes" : "no"));
    TC_LOG_INFO("client.selector", "    Completion: %s", (mFlags & COMPLETION ? "yes" : "no"));
    TC_LOG_INFO("client.selector", "  ");

    boost::filesystem::create_directories(boost::filesystem::path(TinyDataPath));
    boost::filesystem::create_directories(boost::filesystem::path(TinyDataPathFr));
    boost::filesystem::create_directories(boost::filesystem::path(TinyDataPathEn));

    ExtractADTs();
    NamesFromUnusedDatabase();
    NamesFromWorldDatabase();
    Extract();
    NamesOfSounds();
    ExtractSounds();
    Completion();
    End();

    uint32 diff = GetMSTimeDiffToNow(oldMSTime);
    time_t diffsec = diff / 1000;
    diff -= diffsec;
    tm* difftm = localtime(&diffsec);
    TC_LOG_INFO("client.selector", "  ClientSelector executed in %uh%um%us %ums\n", difftm->tm_hour, difftm->tm_min, difftm->tm_sec, GetMSTimeDiffToNow(oldMSTime));
    return true;
}

void ClientSelector::ExtractADTs()
{
    if (!(mFlags & EXTRACT_ADTS) && !(mFlags & EXTRACT_SOUNDS))
        return;
    TC_LOG_INFO("client.selector", "  Extracting ADTs");

    QueryResult result = WorldDatabase.Query("SELECT InternalName FROM mapdbc WHERE TinyClient");
    do {
        Field* fields = result->Fetch();
        std::string name = fields[0].GetString();

        fs::path in("World\\Maps\\" + name);
        if (fs::exists(FullDataPath / in))
        {
            fs::create_directories(TinyDataPath / in);
            AddFile(WdAdt, in.string() + "\\" + name, "\\.wd.");
            AddFile(Adt, in.string() + "\\" + name, "_[0-9]{1,3}_[0-9]{1,3}\\.adt");
        }
    } while (result->NextRow());

    mCopy = mFlags & EXTRACT_ADTS ? true : false;
    Xtrct_XFiles("Adt", Adt);
    Xtrct_XFiles("Adt additionnals", WdAdt);
    mCopy = true;
    Xtrct_eFiles("Root Wmos from Adts", WmoAdt);

    TC_LOG_INFO("client.selector", "  ");
}

void ClientSelector::Extract()
{
    if (mFlags & EXTRACT_DATABASE || mFlags & EXTRACT_SOUNDS) //if (mFlags & EXTRACT_MODELS)
    {
        TC_LOG_INFO("client.selector", "  Extracting Models");
        if (mFlags & EXTRACT_DATABASE)
        {
            Xtrct_eFiles("Models (exact, mixed)", eMdx_M);
            Xtrct_XFiles("Ground Models", MdxGround);
            if (!(mFlags & DONT_EXTRACT_ITEMS))
            {
                Xtrct_XFiles("Item Models", MdxItem);
                Xtrct_XFiles("Head Item Models", MdxItemHead);
            }
        }
        Xtrct_eFiles("Models & Wmos (exact, mixed)", eWmoMdx_M);
        TC_LOG_INFO("client.selector", "  ");
    }

    if (mFlags & EXTRACT_DATABASE) //if (mFlags & EXTRACT_TEXTURES)
    {
        TC_LOG_INFO("client.selector", "  Extracting Textures");
        Xtrct_XFiles("Textures (regex, localized)", Blp_RL);
        Xtrct_eFiles("Textures (exact)", eBlp);
        Xtrct_eFiles("Textures (exact, mixed)", eBlp_M);
        if (!(mFlags & DONT_EXTRACT_ITEMS))
        {
            Xtrct_XFiles("Item Textures (mixed)", BlpItem);
            Xtrct_XFiles("Item Textures (regex, mixed)", BlpItem2);
        }
        Xtrct_eFiles("Icons (localized)", BlpIcon);
        Xtrct_eFiles("Baked Npc Textures (mixed)", BlpBaked);
        TC_LOG_INFO("client.selector", "  ");
    }
}

void ClientSelector::End()
{
    TC_LOG_INFO("client.selector", "  Completing Adt, Wmo and Model extraction");

    Xtrct_eFiles("Adt Models", MdxAdt);
    Xtrct_eFiles("Adt Textures", BlpAdt);

    Xtrct_eFiles("Wmo Models", MdxWmo);
    Xtrct_eFiles("Wmo Textures", BlpWmo);
    Xtrct_XFiles("Group Wmos", GroupWmo);

    Xtrct_eFiles("Model Textures", BlpM2);
    Xtrct_XFiles("Models Animations", AnimMdx);
    Xtrct_XFiles("Models Skins", SkinMdx);

    TC_LOG_INFO("client.selector", "  ");
}

void ClientSelector::ExtractSounds()
{
    if (mFlags & EXTRACT_SOUNDS)
    {
        TC_LOG_INFO("client.selector", "  Extracting Sounds");
        Xtrct_XFiles("Sounds", Sounds);
        TC_LOG_INFO("client.selector", "  ");
    }
}

void ClientSelector::Completion()
{
    if (!(mFlags & COMPLETION))
        return;

    TC_LOG_INFO("client.selector", "  Completion\n");

    mXtrctFlags = XTRCT_CPYDIR | XTRCT_MIX | EXT_MDX | EXT_WMO;
    Xtrct_eFile("_shaders");
    Xtrct_eFile("shaders");
    Xtrct_eFile("WTF");
    Xtrct_eFile("XTextures");
    mXtrctFlags = XTRCT_MIX;
    Xtrct_eFile("signaturefile");
    Xtrct_eFile("component.wow-data.txt");
    mXtrctFlags |= EXT_MDX;
    Xtrct_eFile("Spells\\ErrorCube.m2");
    mXtrctFlags = XTRCT_MIX | XTRCT_REGEX;
    Xtrct_XFile(".*\\.blp", "Textures");

    mXtrctFlags = XTRCT_CPYDIR | XTRCT_LOC | EXT_MDX | EXT_WMO;
    Xtrct_eFile("Fonts");
    Xtrct_eFile("Interface\\AbilitiesFrame");
    Xtrct_eFile("Interface\\AchievementFrame");
    Xtrct_eFile("Interface\\ArenaEnemyFrame");
    Xtrct_eFile("Interface\\AuctionFrame");
    Xtrct_eFile("Interface\\BankFrame");
    Xtrct_eFile("Interface\\BarberShop");
    Xtrct_eFile("Interface\\BattlefieldFrame");
    Xtrct_eFile("Interface\\Buttons");
    Xtrct_eFile("Interface\\Calendar");
    Xtrct_eFile("Interface\\CastingBar");
    Xtrct_eFile("Interface\\CharacterFrame");
    Xtrct_eFile("Interface\\ChatFrame");
    Xtrct_eFile("Interface\\Cinematics");
    Xtrct_eFile("Interface\\ClassTrainerFrame");
    Xtrct_eFile("Interface\\ComboFrame");
    Xtrct_eFile("Interface\\Common");
    Xtrct_eFile("Interface\\ContainerFrame");
    Xtrct_eFile("Interface\\Cooldown");
    Xtrct_eFile("Interface\\Cursor");
    Xtrct_eFile("Interface\\DialogFrame");
    Xtrct_eFile("Interface\\DressUpFrame");
    Xtrct_eFile("Interface\\Durability");
    Xtrct_eFile("Interface\\Exploration");
    Xtrct_eFile("Interface\\FlavorImages");
    Xtrct_eFile("Interface\\FriendsFrame");
    Xtrct_eFile("Interface\\FullScreenTextures");
    Xtrct_eFile("Interface\\Glues");
    Xtrct_eFile("Interface\\GMChatFrame");
    Xtrct_eFile("Interface\\GossipFrame");
    Xtrct_eFile("Interface\\GroupFrame");
    Xtrct_eFile("Interface\\GuildBankFrame");
    Xtrct_eFile("Interface\\HelpFrame");
    Xtrct_eFile("Interface\\InventoryItems");
    Xtrct_eFile("Interface\\ItemAnimations");
    Xtrct_eFile("Interface\\ItemSocketingFrame");
    Xtrct_eFile("Interface\\ItemTextFrame");
    Xtrct_eFile("Interface\\KeyBindingFrame");
    Xtrct_eFile("Interface\\LCDXML");
    Xtrct_eFile("Interface\\LFGFrame");
    Xtrct_eFile("Interface\\LFGFrame");
    Xtrct_eFile("Interface\\LootFrame");
    Xtrct_eFile("Interface\\MacroFrame");
    Xtrct_eFile("Interface\\MailFrame");
    Xtrct_eFile("Interface\\MainMenuBar");
    Xtrct_eFile("Interface\\MerchantFrame");
    Xtrct_eFile("Interface\\Minimap");
    Xtrct_eFile("Interface\\MoneyFrame");
    Xtrct_eFile("Interface\\OptionsFrame");
    Xtrct_eFile("Interface\\PaperDoll");
    Xtrct_eFile("Interface\\PaperDollInfoFrame");
    Xtrct_eFile("Interface\\PetActionBar");
    Xtrct_eFile("Interface\\PetitionFrame");
    Xtrct_eFile("Interface\\PetPaperDollFrame");
    Xtrct_eFile("Interface\\PetStableFrame");
    Xtrct_eFile("Interface\\Pictures");
    Xtrct_eFile("Interface\\PlayerFrame");
    Xtrct_eFile("Interface\\PvPFrame");
    Xtrct_eFile("Interface\\PvPRankBadges");
    Xtrct_eFile("Interface\\QuestFrame");
    Xtrct_eFile("Interface\\RaidFrame");
    Xtrct_eFile("Interface\\SelectionCircle");
    Xtrct_eFile("Interface\\ShapeshiftBar");
    Xtrct_eFile("Interface\\Spellbook");
    Xtrct_eFile("Interface\\SpellShadow");
    Xtrct_eFile("Interface\\Stationery");
    Xtrct_eFile("Interface\\TabardFrame");
    Xtrct_eFile("Interface\\TalentFrame");
    Xtrct_eFile("Interface\\TargetingFrame");
    Xtrct_eFile("Interface\\TaxiFrame");
    Xtrct_eFile("Interface\\TimeManager");
    Xtrct_eFile("Interface\\TokenFrame");
    Xtrct_eFile("Interface\\Tooltips");
    Xtrct_eFile("Interface\\TradeFrame");
    Xtrct_eFile("Interface\\TradeSkillFrame");
    Xtrct_eFile("Interface\\TutorialFrame");
    Xtrct_eFile("Interface\\Vehicles");
    Xtrct_eFile("Interface\\WorldStateFrame");
    mXtrctFlags = XTRCT_LOC;
    Xtrct_eFile("Wow.ini");
    Xtrct_eFile("Interface\\PVP-Banner-Emblem-1.blp");
    Xtrct_eFile("Interface\\WorldMap\\Kalimdor.zmp");
    mXtrctFlags = XTRCT_LOC | XTRCT_REGEX;
    Xtrct_XFile("component\\.wow-....\\.txt");
    Xtrct_XFile(".*\\.blp", "Interface\\WorldMap");

    // WorldMap
    TC_LOG_INFO("client.selector", "    Building ZMP files");
    QueryResult result = WorldDatabase.Query("SELECT Id, InternalName FROM worldmapareadbc WHERE TinyClient");
    do {
        Field* fields = result->Fetch();
        uint32 id = fields[0].GetUInt32();
        std::string name = fields[1].GetString();

        if (QueryResult result2 = UnusedDatabase.PQuery("SELECT id FROM zmp_files WHERE id = %u LIMIT 1", id))
            BuildZMP(id, name);

        if (name.length())
            AddExactFile(BlpMap, "Interface\\WorldMap\\" + name);
    } while (result->NextRow());
    Xtrct_eFiles("World Maps", BlpMap);

    // MiniMap
    mXtrctFlags = XTRCT_MIX;
    NamesFromTRS(FullDataPath + "\\Textures\\Minimap\\md5translate.trs");
    Xtrct_eFile("Textures\\Minimap\\md5translate.trs");
    Xtrct_eFiles("World Minimaps", BlpMinimap);

    TC_LOG_INFO("client.selector", "  ");
}
