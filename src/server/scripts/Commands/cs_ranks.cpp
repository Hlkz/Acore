#include "ScriptPCH.h"
#include "Chat.h"
#include "Language.h"

/* player.h
const uint32 PvpRankTitle[6][2] =
{
    {1, 16}, // rank 1 Soldat Grunt
    {2, 17}, // rank 2 Caporal Sergent
    {6, 24}, // rank 3 Chevalier Champion
    {11, 62}, // rank 4 Commandant Porteguerre
    {12, 26}, // rank 5 Maréchal Général
    {14, 27}, // rank 6 Connétable Warlord
};
*/

typedef std::map<uint64, PlayerInfo> PlayerContainer;
PlayerContainer playersStore;

uint32 PvpPointsFloor[6] =
{
    200, // rank 1
    500, // rank 2
    750, // rank 3
    880, // rank 4
    1000, // rank 5
    1100,  // rank 6
};

const uint32 PvpRankEff[6] =
{
    200, // rank 1
    20, // rank 2
    8, // rank 3
    5, // rank 4
    3, // rank 5
    1  // rank 6
};

void World::UpdateRanksText()
{
    PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_TOP_RANK);//0 name 1 rankid
    PreparedQueryResult result = CharacterDatabase.Query(stmt);
 
    if (!result)
        return;

    std::ostringstream TopRanksFr;
    std::ostringstream TopRanksEn;

    int8 i = 0;
    do {
        std::string strName = result->Fetch()[i, 0].GetString(); // name
        uint32 iRank = result->Fetch()[i, 1].GetUInt32(); // rank / 0: unranked
        uint32 iFaction = result->Fetch()[i, 2].GetUInt32(); // alliance: 469 / horde: 67

        if (iRank)
        {
            TopRanksFr << "\n " << (i+1) << "   " << sObjectMgr->GetTrinityString(LANG_RANKS_NAME+iRank+6*(iFaction==67), LOCALE_frFR) << "  " << strName;
            TopRanksEn << "\n " << (i+1) << "   " << sObjectMgr->GetTrinityString(LANG_RANKS_NAME+iRank+6*(iFaction==67), LOCALE_enUS) << "  " << strName;
        }

        ++i;
    }
    while (result->NextRow());

    std::string FinalTopRanksFr = sObjectMgr->GetTrinityString(17900, LOCALE_frFR) + TopRanksFr.str() + sObjectMgr->GetTrinityString(17901, LOCALE_frFR);
    std::string FinalTopRanksEn = sObjectMgr->GetTrinityString(17900, LOCALE_enUS) + TopRanksEn.str() + sObjectMgr->GetTrinityString(17901, LOCALE_enUS);

    SQLTransaction trans = WorldDatabase.BeginTransaction();
    PreparedStatement* stmt2 = WorldDatabase.GetPreparedStatement(WORLD_UPD_TOP_RANK_LOCALE);
    stmt2->setString(0, FinalTopRanksFr);
    trans->Append(stmt2);
    WorldDatabase.CommitTransaction(trans);

    SQLTransaction trans2 = WorldDatabase.BeginTransaction();
    PreparedStatement* stmt3 = WorldDatabase.GetPreparedStatement(WORLD_UPD_TOP_RANK);
    stmt3->setString(0, FinalTopRanksEn);
    trans2->Append(stmt3);
    WorldDatabase.CommitTransaction(trans2);

    sObjectMgr->LoadPageTexts();
    sObjectMgr->LoadPageTextLocales();
};

bool World::DistributeRanks()
{
    sWorld->SendWorldText(LANG_DIST_RANKS_START);

    PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_PVP_ALL); // 0guid, 1pvprank, 2pvptotal, 3pvplast
    PreparedQueryResult result = CharacterDatabase.Query(stmt);

    if (!result)
        return false;

    int8 i = 0;
    do {
        uint64 guid = result->Fetch()[i, 0].GetUInt32();
        uint32 rank = result->Fetch()[i, 1].GetUInt32();
        uint32 total = result->Fetch()[i, 2].GetUInt32();
        uint32 last = result->Fetch()[i, 3].GetUInt32();
        int32 points = floor(10*sqrt((float)total/10)+last);

        SQLTransaction trans2 = CharacterDatabase.BeginTransaction();
        PreparedStatement* stmt2 = CharacterDatabase.GetPreparedStatement(CHAR_UPD_PVP_POINTS);
        stmt2->setUInt32(0, (uint32)points > PvpPointsFloor[rank] && rank != 6);
        stmt2->setUInt32(1, points);
        stmt2->setUInt32(2, GUID_LOPART(guid));
        trans2->Append(stmt2);
        CharacterDatabase.CommitTransaction(trans2);

        ++i;
    }
    while (result->NextRow());

    for (uint32 rankid = 6; rankid=0; rankid--)
    {
        PreparedStatement* stmt3 = CharacterDatabase.GetPreparedStatement(CHAR_SEL_PLA_BY_RANK);
        stmt3->setUInt32(0, rankid);
        stmt3->setUInt32(0, rankid-1);
        PreparedQueryResult result = CharacterDatabase.Query(stmt);

        if (!result)
            continue;

        uint8 i = 0;
        do {
            uint64 guid = result->Fetch()[i].GetUInt32();
            SQLTransaction trans4 = CharacterDatabase.BeginTransaction();
            PreparedStatement* stmt4 = CharacterDatabase.GetPreparedStatement(CHAR_UPD_PVP_RANK);
            stmt4->setUInt32(0, rankid);
            stmt4->setUInt32(1, i>=PvpRankEff[rankid-1]);
            stmt4->setUInt32(2, GUID_LOPART(guid));
            trans4->Append(stmt4);
            CharacterDatabase.CommitTransaction(trans4);
            ++i;
        }
        while (result->NextRow());
    }
    UpdateRanksText();
    sWorld->SendWorldText(LANG_DIST_RANKS_END);

    return true;
};


class com_ranks : public CommandScript
{
public:
    com_ranks() : CommandScript("cs_ranks") { }

    ChatCommand* GetCommands() const
    {
        static ChatCommand ranksSetTable[] =
        {
            { "last",           SEC_ADMINISTRATOR,  true,  &HandleRanksSetPvpLastCommand,     "", NULL },
            { "total",          SEC_ADMINISTRATOR,  true,  &HandleRanksSetPvpTotalCommand,    "", NULL },
            { "",               SEC_ADMINISTRATOR,  true,  &HandleRanksSetCommand,            "", NULL },
            { NULL,             SEC_PLAYER,         false, NULL,                              "", NULL }
        };
        static ChatCommand ranksCommandTable[] =
        {
            { "set",            SEC_ADMINISTRATOR,  true,  NULL,   "", ranksSetTable },
            { "distribute",     SEC_ADMINISTRATOR,  false, &HandleRanksDistributeCommand,     "", NULL },
            { "text",           SEC_GAMEMASTER,     false, &HandleRanksUpdateTextCommand,     "", NULL },
            { "",               SEC_PLAYER,         false, &HandleRanksDisplayCommand,        "", NULL },
            { NULL,             SEC_PLAYER,         false, NULL,                              "", NULL }
        };
        static ChatCommand commandTable[] =
        {
            { "ranks",        SEC_PLAYER,         true,  NULL,     "", ranksCommandTable },
            { NULL,           SEC_PLAYER,         false, NULL,     "", NULL }
        };
        return commandTable;
    }

    static bool HandleRanksSetPvpLastCommand(ChatHandler* handler, char const* args)
    {
        if (!*args)
            return false;
        char* last = strtok((char*)args, " ");
        int pvplast = atoi(last);
        handler->GetSession()->GetPlayer()->SetPvpLast(pvplast);
        return true;
    }

    static bool HandleRanksSetPvpTotalCommand(ChatHandler* handler, char const* args)
    {
        if (!*args)
            return false;
        char* total = strtok((char*)args, " ");
        int pvptotal = atoi(total);
        handler->GetSession()->GetPlayer()->SetPvpTotal(pvptotal);
        return true;
    }

    static bool HandleRanksSetCommand(ChatHandler* handler, char const* args)
    {
        if (!*args)
            return false;
        char* rank = strtok((char*)args, " ");
        int pvprank = atoi(rank);
		handler->GetSession()->GetPlayer()->SetPvpRank(pvprank);
        return true;
    }

    static bool HandleRanksDistributeCommand(ChatHandler* handler, char const* args)
    {
        if (*args)
            return false;
        sWorld->DistributeRanks();
        return true;
    }

    static bool HandleRanksUpdateTextCommand(ChatHandler* handler, char const* args)
    {
        if (*args)
            return false;
        sWorld->UpdateRanksText();
        return true;
    }

    static bool HandleRanksDisplayCommand(ChatHandler* handler, char const* args)
    {
        if (*args)
            return false;
        WorldSession* session = handler->GetSession();
        PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_RANKS_INFO);
        stmt->setUInt32(0, GUID_LOPART(handler->GetSession()->GetPlayer()->GetGUID()));
        PreparedQueryResult result = CharacterDatabase.Query(stmt);
        if (!result)
            return false;
        uint32 team = result->Fetch()[0].GetUInt32();
        uint32 rank = result->Fetch()[1].GetUInt32();
        uint32 total = result->Fetch()[2].GetUInt32();
        uint32 last = result->Fetch()[3].GetUInt32();
		uint32 points = floor(10*sqrt((float)total/10)+last);
        handler->PSendSysMessage(LANG_RANKS_INFO_COMMAND, session->GetTrinityString(LANG_RANKS_NAME+rank+6*(team==67)));
        handler->PSendSysMessage(LANG_RANKS_INFO_COMMAND+1, last, total);
        if (rank != 6)
            handler->PSendSysMessage(LANG_RANKS_INFO_COMMAND+2, points, PvpPointsFloor[rank]);
        else
            handler->PSendSysMessage(LANG_RANKS_INFO_COMMAND+3, points);
        return true;
    }
};

void AddSc_Com_Ranks()
{
    new com_ranks();
}

