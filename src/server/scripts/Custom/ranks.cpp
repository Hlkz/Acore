#include "ScriptPCH.h"
#include "Chat.h"
#include "Language.h"
#include "BattlegroundMgr.h"

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

	sWorld->SendWorldText(LANG_DIST_RANKS_END);

	return true;
};

class com_ranks : public CommandScript {
   public: com_ranks() : CommandScript("cs_ranks") {}

static bool HandleComRanks(ChatHandler* handler, const char* args) {

	return sWorld->DistributeRanks();  }

ChatCommand* GetCommands() const {
	static ChatCommand ComSuffix[] = {
		{ "ranks",         SEC_CONSOLE,			false, &HandleComRanks,		"", NULL },
		{ NULL,             0,					false, NULL,				"", NULL } };
	return ComSuffix; }
};

void AddSc_Com_Ranks() {
   new com_ranks(); }

