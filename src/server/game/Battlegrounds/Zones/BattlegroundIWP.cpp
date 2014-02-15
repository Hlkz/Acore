
#include "BattlegroundIWP.h"
#include "BattlegroundMgr.h"

#include "ObjectMgr.h"
#include "WorldPacket.h"

#include "Formulas.h"
#include "SpellAuras.h"

#include "Language.h"
#include "WorldSession.h"
#include "Player.h"
#include "ReputationMgr.h"
#include "GameObject.h"

#include "ScriptPCH.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "CombatAI.h"

class npc_iwp_commander : public CreatureScript
{
public:
    npc_iwp_commander() : CreatureScript("npc_iwp_commander") { }

    struct npc_iwp_commanderAI : public npc_escortAI
    {
        npc_iwp_commanderAI(Creature* creature) : npc_escortAI(creature)
        {
            go = false;
            SetDespawnAtEnd(false);
        }
        bool go;

        void UpdateAI(uint32 diff)
        {
            npc_escortAI::UpdateAI(diff);
            if (!go && !me->IsInCombat())
            {
                go = true;
                Start(false, true);
                SetDespawnAtEnd(false);
            }

            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }

        void WaypointReached(uint32 pointId) { }

    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_iwp_commanderAI(creature);
    }
};

BattlegroundIWP::BattlegroundIWP()
{
    BgObjects.resize(IWP_OBJECT_MAX);
    BgCreatures.resize(IWP_CREATURE_MAX);
    StartMessageIds[BG_STARTING_EVENT_FIRST]  = LANG_BG_BA_START_TWO_MINUTES;
    StartMessageIds[BG_STARTING_EVENT_SECOND] = LANG_BG_BA_START_ONE_MINUTE;
    StartMessageIds[BG_STARTING_EVENT_THIRD]  = LANG_BG_BA_START_HALF_MINUTE;
    StartMessageIds[BG_STARTING_EVENT_FOURTH] = LANG_BG_BA_HAS_BEGUN;
}

BattlegroundIWP::~BattlegroundIWP()
{
}

bool BattlegroundIWP::SetupBattleground()
{
    //obj
    return true;
}

void BattlegroundIWP::StartingEventCloseDoors()
{
}

void BattlegroundIWP::StartingEventOpenDoors()
{
    //UpdateWorldState(AV_SHOW_H_SCORE, 1);
    //UpdateWorldState(AV_SHOW_A_SCORE, 1);
}

void BattlegroundIWP::HandleKillPlayer(Player* player, Player* killer)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
    Battleground::HandleKillPlayer(player, killer);
}

void BattlegroundIWP::HandleKillUnit(Creature* unit, Player* killer)
{
    TC_LOG_DEBUG(LOG_FILTER_BATTLEGROUND, "bg_BA HandleKillUnit %i", unit->GetEntry());
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
}

void BattlegroundIWP::PostUpdateImpl(uint32 diff)
{
    if (GetStatus() == STATUS_IN_PROGRESS)
    {
    }
}

void BattlegroundIWP::AddPlayer(Player* player)
{
    Battleground::AddPlayer(player);
    BattlegroundIWPScore* sc = new BattlegroundIWPScore;
    PlayerScores[player->GetGUID()] = sc;
    uint32 team = player->GetBGTeam();
    if (team == ALLIANCE)
    {
        player->GetReputationMgr().SetReputation(sFactionStore.LookupEntry(3801), 3000);
        player->GetReputationMgr().SetReputation(sFactionStore.LookupEntry(3802), -42000);
    }
    else
    {
        player->GetReputationMgr().SetReputation(sFactionStore.LookupEntry(3802), 3000);
        player->GetReputationMgr().SetReputation(sFactionStore.LookupEntry(3801), -42000);
    }
    player->InitStatsMod(STAT_MOD_TYPE_BG_BA);
    player->UpdateStatsMod(STAT_MOD_TYPE_BG_BA, true, false);
}

void BattlegroundIWP::EndBattleground(uint32 winner)
{
    Battleground::EndBattleground(winner);
}

void BattlegroundIWP::RemovePlayer(Player* player, uint64 /*guid*/, uint32 /*team*/)
{
    if (!player)
    {
        TC_LOG_ERROR(LOG_FILTER_BATTLEGROUND, "bg_IWP no player at remove");
        return;
    }
}

void BattlegroundIWP::HandleAreaTrigger(Player* player, uint32 trigger)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    switch (trigger)
    {
        case 5840:
        default:
            Battleground::HandleAreaTrigger(player, trigger);
            break;
    }
}

void BattlegroundIWP::UpdatePlayerScore(Player* Source, uint32 type, uint32 value, bool doAddHonor)
{
    BattlegroundScoreMap::iterator itr = PlayerScores.find(Source->GetGUID());
    if (itr == PlayerScores.end())
        return;

    switch (type)
    {
        default:
            Battleground::UpdatePlayerScore(Source, type, value, doAddHonor);
            break;
    }
}


void BattlegroundIWP::FillInitialWorldStates(WorldPacket& data)
{
    //tofix 20 node + 2 tower count
    //data << uint32(BA_SHOW_A_SCORE) << uint32(0);
}

void BattlegroundIWP::ResetBGSubclass()
{
    //tofix timers
    for (uint16 i = 0; i < IWP_CREATURE_MAX; i++)
        if (BgCreatures[i])
            DelCreature(i);
}

uint32 BattlegroundIWP::GetPrematureWinner()
{
    //tofix surrender
    return Battleground::GetPrematureWinner();
}

WorldSafeLocsEntry const* BattlegroundIWP::GetClosestGraveYard(Player* player)
{
    player->SetRezTime(getMSTime() + 12*IN_MILLISECONDS);
    TeamId teamIndex = GetTeamIndexByTeamId(player->GetTeam(true));
    std::vector<uint8> graveyards;
    WorldSafeLocsEntry const*entry = sWorldSafeLocsStore.LookupEntry(IWP_GraveyardIds[teamIndex]);
    return entry;
}

void AddSC_npc_iwp()
{
    new npc_iwp_commander();
}
