#include "ScriptMgr.h"
#include "Chat.h"
#include "Language.h"
#include "ObjectMgr.h"
#include "Player.h"

/* player.h
const uint32 PvpRankTitle[6][2] =
{
    {1, 16}, // rank 1 Soldat Grunt
    {2, 17}, // rank 2 Caporal Sergent
    {6, 24}, // rank 3 Chevalier Champion
    {11, 94}, // rank 4 Commandant Porteguerre
    {12, 26}, // rank 5 Maréchal Général
    {14, 27}, // rank 6 Connétable Warlord
};
*/

enum PvpRanks
{
    PVPRANK_NONE        = 0,
    PVPRANK_SCOUT       = 1,
    PVPRANK_PRIVATE     = 2,
    PVPRANK_WARMONGER   = 3,
    PVPRANK_COMMANDER   = 4,
    PVPRANK_GENERAL     = 5,
    PVPRANK_MARSHAL     = 6,
    PVPRANK_WARLORD     = 7,
    PVPRANK_LEGEND      = 8,
    PVPRANK_MAX         = 8
};

uint32 PvpPointsFloor[PVPRANK_MAX] =
{
    50, // Scout
    150, // Private
    250, // Warmonger
    350, // Commander
    500, // General
    700,  // Marshal
    1000, // Warlord
    2800, // Legend
};

const uint32 PvpRankEff[PVPRANK_MAX] =
{
    3000000, // Scout
    1000000, // Private
    300, // Warmonger
    100, // Commander
    30, // General
    10,  // Marshal
    3, // Warlord
    1, // Legend
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
        uint32 iFaction = 469; //result->Fetch()[i, 2].GetUInt32(); // alliance: 469 / horde: 67

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

    // Update pvppoints from pvptotal and pvplast
    CharacterDatabase.DirectExecute("UPDATE characters SET pvppoints = FLOOR(pvptotal / 6 + pvplast), pvptotal = pvptotal + pvplast, pvplast = 0 "
                                    "WHERE pvprank > 0 OR pvptotal > 0 OR pvplast > 0");
    // promote (pvprank) if enough pvppoints
    for (uint32 i = 0; i < PVPRANK_MAX; i++)
        CharacterDatabase.DirectPExecute("UPDATE characters SET pvprank = pvprank + (pvppoints > '%d') WHERE pvprank = '%d'", PvpPointsFloor[i], i);
    // demote the worst if the pvprank is full
    for (uint32 i = PVPRANK_MAX; i > 0; i--)
        CharacterDatabase.DirectPExecute("UPDATE characters SET pvprank = pvprank - 1 WHERE pvprank = '%d' AND pvppoints < (SELECT MIN(pvppoints) "
                                         "FROM (SELECT pvppoints FROM characters WHERE pvprank = '%d' ORDER BY pvppoints DESC LIMIT %d) AS t)", i, i, PvpRankEff[i - 1]);

    sWorld->SendWorldText(LANG_DIST_RANKS_TITLEACH);

    for (SessionMap::const_iterator itr = m_sessions.begin(); itr != m_sessions.end(); ++itr)
        if (Player* player = itr->second->_player)
            player->SetPvpRank(player->GetPvpRank());

    UpdateRanksText();
    sWorld->SendWorldText(LANG_DIST_RANKS_END);

    return true;
};


class ranks_commandscript : public CommandScript
{
public:
    ranks_commandscript() : CommandScript("ranks_commandscript") { }

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
            { "set",            SEC_ADMINISTRATOR,  true,  NULL,                     "", ranksSetTable },
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
        stmt->setUInt64(0, handler->GetSession()->GetPlayer()->GetGUID());
        PreparedQueryResult result = CharacterDatabase.Query(stmt);
        if (!result)
            return false;
        uint32 team = 469; //result->Fetch()[0].GetUInt32();
        uint32 rank = result->Fetch()[0].GetUInt32();
        uint32 total = result->Fetch()[1].GetUInt32();
        uint32 last = result->Fetch()[2].GetUInt32();
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

void AddSC_ranks_commandscript()
{
    new ranks_commandscript();
}
