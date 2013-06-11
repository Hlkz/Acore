#include "BattlegroundBA.h"

#include "ObjectMgr.h"
#include "WorldPacket.h"

#include "Formulas.h"
#include "GameObject.h"
#include "Language.h"
#include "Player.h"
#include "SpellAuras.h"
#include "WorldSession.h"

BattlegroundBA::BattlegroundBA()
{
    BgObjects.resize(BG_BA_OBJECT_MAX);
    BgCreatures.resize(BA_CTYPE_MAX);
}

BattlegroundBA::~BattlegroundBA()
{
}

bool BattlegroundBA::SetupBattleground()
{
	for (uint8 i = BA_CTYPE_TOWER_A_1; i < BA_CTYPE_TOWER_H_1; i++)
	{
		if (!AddCreature(BA_TOWER_A_ENTRY, i, ALLIANCE, BG_BA_CreaturePos[i][0], BG_BA_CreaturePos[i][1], BG_BA_CreaturePos[i][2], BG_BA_CreaturePos[i][3]))
		{
			TC_LOG_ERROR(LOG_FILTER_SQL, "BatteGroundBA: Failed to spawn some object Battleground not created!1");
			return false;
		}
	}
	for (uint8 i = BA_CTYPE_TOWER_H_1; i < BA_CTYPE_TOWER_MAX; i++)
	{
		if (!AddCreature(BA_TOWER_H_ENTRY, i, HORDE, BG_BA_CreaturePos[i][0], BG_BA_CreaturePos[i][1], BG_BA_CreaturePos[i][2], BG_BA_CreaturePos[i][3]))
		{
			TC_LOG_ERROR(LOG_FILTER_SQL, "BatteGroundBA: Failed to spawn towers");
			return false;
		}
	}

	if ((!AddCreature(BA_NEXUS_A_ENTRY, BA_CTYPE_NEXUS_A, ALLIANCE, BG_BA_CreaturePos[BA_CTYPE_NEXUS_A][0], BG_BA_CreaturePos[BA_CTYPE_NEXUS_A][1], BG_BA_CreaturePos[BA_CTYPE_NEXUS_A][2], BG_BA_CreaturePos[BA_CTYPE_NEXUS_A][3]))
		|| (!AddCreature(BA_NEXUS_H_ENTRY, BA_CTYPE_NEXUS_H, HORDE, BG_BA_CreaturePos[BA_CTYPE_NEXUS_H][0], BG_BA_CreaturePos[BA_CTYPE_NEXUS_H][1], BG_BA_CreaturePos[BA_CTYPE_NEXUS_H][2], BG_BA_CreaturePos[BA_CTYPE_NEXUS_H][3])))
	{
		TC_LOG_ERROR(LOG_FILTER_SQL, "BatteGroundBA: Failed to spawn nexus");
		return false;
	}
	
	if ((!AddCreature(BA_VENDOR_A_ENTRY, BA_CTYPE_VENDOR_A, ALLIANCE, BG_BA_CreaturePos[BA_CTYPE_VENDOR_A][0], BG_BA_CreaturePos[BA_CTYPE_VENDOR_A][1], BG_BA_CreaturePos[BA_CTYPE_VENDOR_A][2], BG_BA_CreaturePos[BA_CTYPE_VENDOR_A][3]))
		|| (!AddCreature(BA_VENDOR_H_ENTRY, BA_CTYPE_VENDOR_H, HORDE, BG_BA_CreaturePos[BA_CTYPE_VENDOR_H][0], BG_BA_CreaturePos[BA_CTYPE_VENDOR_H][1], BG_BA_CreaturePos[BA_CTYPE_VENDOR_H][2], BG_BA_CreaturePos[BA_CTYPE_VENDOR_H][3])))
	{
		TC_LOG_ERROR(LOG_FILTER_SQL, "BatteGroundBA: Failed to spawn vendors");
		return false;
	}

    return true;
}

void BattlegroundBA::HandleKillPlayer(Player* player, Player* killer)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
    Battleground::HandleKillPlayer(player, killer);
}

void BattlegroundBA::HandleKillUnit(Creature* unit, Player* killer)
{
    TC_LOG_DEBUG(LOG_FILTER_BATTLEGROUND, "bg_BA HandleKillUnit %i", unit->GetEntry());
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
    uint32 entry = unit->GetEntry();
	//tofix buff / gold
}

void BattlegroundBA::PostUpdateImpl(uint32 diff)
{
    if (GetStatus() == STATUS_IN_PROGRESS)
    {
		//tofix timers
	}
}

void BattlegroundBA::AddPlayer(Player* player)
{
    Battleground::AddPlayer(player);
    BattlegroundBAScore* sc = new BattlegroundBAScore;
    PlayerScores[player->GetGUID()] = sc;
}

void BattlegroundBA::EndBattleground(uint32 winner)
{
    /// @todo add enterevademode for all attacking creatures
    Battleground::EndBattleground(winner);
}

void BattlegroundBA::RemovePlayer(Player* player, uint64 /*guid*/, uint32 /*team*/)
{
   if (!player)
    {
        TC_LOG_ERROR(LOG_FILTER_BATTLEGROUND, "bg_BA no player at remove");
        return;
    }
    //tofix buff
}

void BattlegroundBA::HandleAreaTrigger(Player* player, uint32 trigger)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    switch (trigger)
    {
		case 5810:
        default:
            Battleground::HandleAreaTrigger(player, trigger);
            break;
    }
}

void BattlegroundBA::UpdatePlayerScore(Player* Source, uint32 type, uint32 value, bool doAddHonor)
{
    BattlegroundScoreMap::iterator itr = PlayerScores.find(Source->GetGUID());
    if (itr == PlayerScores.end())                         // player not found...
        return;

    switch (type)
    {
        case SCORE_CREEPS_KILLED:
			((BattlegroundBAScore*)itr->second)->CreepsKilled += value;
            break;
        default:
            Battleground::UpdatePlayerScore(Source, type, value, doAddHonor);
            break;
    }
}

void BattlegroundBA::EventPlayerDestroyedPoint(BG_BA_Nodes node)
{
    TC_LOG_DEBUG(LOG_FILTER_BATTLEGROUND, "bg_BA: player destroyed point node %i", node);
	DelCreature(node);
	//tofix annonce
}

void BattlegroundBA::FillInitialWorldStates(WorldPacket& data)
{
	//tofix 20 node + 2 tower count
    //data << uint32(BA_SHOW_A_SCORE) << uint32(0);
}

void BattlegroundBA::ResetBGSubclass()
{
	//tofix timers
    for (uint16 i = 0; i < BA_CTYPE_MAX; i++)
        if (BgCreatures[i])
            DelCreature(i);
}

uint32 BattlegroundBA::GetPrematureWinner()
{
	//tofix surrender
    return Battleground::GetPrematureWinner();
}
