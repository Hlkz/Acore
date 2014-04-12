
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
#include "GameObjectAI.h"

class npc_iwp_boss : public CreatureScript
{
public:
    npc_iwp_boss() : CreatureScript("npc_iwp_boss") { }

    struct npc_iwp_bossAI : ScriptedAI
    {
        npc_iwp_bossAI(Creature* creature) : ScriptedAI(creature)
        {
            team = me->getFaction() == 3802 ? ALLIANCE : HORDE;
            if (Battleground* bg = sBattlegroundMgr->GetBattleground(me->GetInstanceId(), BATTLEGROUND_IWP))
                if (BattlegroundIWP* IWP = static_cast<BattlegroundIWP*>(bg))
                    iwp = IWP;
        }
        uint32 team;
        BattlegroundIWP* iwp;

        void Reset() { }
        void UpdateAI(uint32 diff) { }

        void JustDied(Unit *)
        {
            if (iwp)
                iwp->EndBattleground(team);
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_iwp_bossAI(creature);
    }
};

class npc_iwp_creep : public CreatureScript
{
public:
    npc_iwp_creep() : CreatureScript("npc_iwp_creep") { }

    struct npc_iwp_creepAI : public npc_escortAI
    {
        npc_iwp_creep::npc_iwp_creepAI(Creature* creature) : npc_escortAI(creature)
        {
            m_go = false;
            SetDespawnAtEnd(false);
            m_team = me->getFaction() == 3802 ? ALLIANCE : HORDE;
            if (Battleground* bg = sBattlegroundMgr->GetBattleground(me->GetInstanceId(), BATTLEGROUND_IWP))
                if (BattlegroundIWP* IWP = static_cast<BattlegroundIWP*>(bg))
                    iwp = IWP;
        }
        void UpdateAI(uint32 diff)
        {
            npc_escortAI::UpdateAI(diff);
            if (!m_go && !me->IsInCombat())
            {
                m_go = true;
                Start(false, true);
                SetDespawnAtEnd(false);
            }
    
            if (!UpdateVictim())
                return;
    
            DoMeleeAttackIfReady();
        }
        
        void JustDied(Unit *)
        {
            if (iwp)
                iwp->EraseCreep(GetGUID(), m_lane, m_team == ALLIANCE ? TEAM_ALLIANCE : TEAM_HORDE);
        }

        void WaypointReached(uint32 pointId) { }

        void SetLane(uint32 lane) { m_lane = lane; }

        private:
            bool m_go;
            uint32 m_team;
            uint32 m_lane;
            BattlegroundIWP* iwp;
    };
    
    CreatureAI* npc_iwp_creep::GetAI(Creature* creature) const
    {
        return new npc_iwp_creepAI(creature);
    }
};

BattlegroundIWP::BattlegroundIWP()
{
    BgObjects.resize(BG_IWP_OB_MAX);
    BgCreatures.resize(BG_IWP_CREA_MAX);
    StartMessageIds[BG_STARTING_EVENT_FIRST]  = LANG_BG_BA_START_TWO_MINUTES;
    StartMessageIds[BG_STARTING_EVENT_SECOND] = LANG_BG_BA_START_ONE_MINUTE;
    StartMessageIds[BG_STARTING_EVENT_THIRD]  = LANG_BG_BA_START_HALF_MINUTE;
    StartMessageIds[BG_STARTING_EVENT_FOURTH] = LANG_BG_BA_HAS_BEGUN;
    m_WavesCount = 0;
    m_WavesTimer = 0;
	m_WallFallen = false;
    m_pts[0] = 0;
    m_pts[1] = 0;
    m_CreepsCount[0] = 0;
    m_CreepsCount[1] = 0;
    m_LastCreepWasTop[0] = false;
    m_LastCreepWasTop[1] = false;
}

BattlegroundIWP::~BattlegroundIWP()
{
}

bool BattlegroundIWP::SetupBattleground()
{
    if ((!AddCreature(BG_IWP_NPC_BOSS_A, BG_IWP_CREA_BOSS_A, ALLIANCE, BG_IWP_CreaturePos[BG_IWP_CREA_BOSS_A][0], BG_IWP_CreaturePos[BG_IWP_CREA_BOSS_A][1], BG_IWP_CreaturePos[BG_IWP_CREA_BOSS_A][2], BG_IWP_CreaturePos[BG_IWP_CREA_BOSS_A][3]))
        || (!AddCreature(BG_IWP_NPC_BOSS_H, BG_IWP_CREA_BOSS_H, HORDE, BG_IWP_CreaturePos[BG_IWP_CREA_BOSS_H][0], BG_IWP_CreaturePos[BG_IWP_CREA_BOSS_H][1], BG_IWP_CreaturePos[BG_IWP_CREA_BOSS_H][2], BG_IWP_CreaturePos[BG_IWP_CREA_BOSS_H][3])))
    {
        TC_LOG_ERROR("sql.sql", "BatteGroundIWP: Failed to spawn boss");
        return false;
    }
    
    if (!AddObject(BG_IWP_OB_WALL, BG_IWP_ENTRY_WALL, BG_IWP_ObjectPos[BG_IWP_OB_WALL][0], BG_IWP_ObjectPos[BG_IWP_OB_WALL][1], BG_IWP_ObjectPos[BG_IWP_OB_WALL][2], BG_IWP_ObjectPos[BG_IWP_OB_WALL][3],0,0,0,0,0))
    {
        TC_LOG_ERROR("sql.sql", "BatteGroundIWP: Failed to spawn wall");
        return false;
    }

    return true;
}

void BattlegroundIWP::StartingEventCloseDoors() {}

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
    TC_LOG_DEBUG("bg.battleground", "IWP HandleKillUnit %i", unit->GetEntry());
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
}

void BattlegroundIWP::PostUpdateImpl(uint32 diff)
{
    if (GetStatus())//== STATUS_IN_PROGRESS)
    {
        m_WavesTimer -= diff;
        if (m_WavesTimer <= 0)
        {
            m_WavesCount++;
            SpawnCreeps(m_WavesCount);
            if (m_WavesCount == 4)
            {
                m_WavesCount = 0;
                m_WavesTimer = 17000;
            }
            else
                m_WavesTimer = 600;
        }
    }
}

void BattlegroundIWP::SpawnCreeps(uint32 count)
{
    Creature* bossa = GetBGCreature(BG_IWP_CREA_BOSS_A);
    Creature* bossh = GetBGCreature(BG_IWP_CREA_BOSS_H);

    if (bossa)
    {
        if (m_CreepsCount[TEAM_ALLIANCE] < BG_IWP_CREEPS_MAX && m_WallFallen)
            if (Creature* creepmid = bossa->SummonCreature(BG_IWP_NPC_CREEP_A, -5306.319336f, -0.073182f, 20.547842f, 3.165546f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                if (npc_iwp_creep::npc_iwp_creepAI* creepAI = CAST_AI(npc_iwp_creep::npc_iwp_creepAI, creepmid->AI()))
                { // MID
                    m_Creeps[BG_IWP_LANE_MID][TEAM_ALLIANCE][creepmid->GetGUID()] = creepmid;
                    creepAI->SetLane(2);
                    creepAI->AddWaypoint(0, -5323.509277f, -0.411021f, 17.558941f); // avantfontaine A
                    creepAI->AddWaypoint(0, -5333.532227f, -9.937929f, 17.584873f); // droitefontaine A
                    creepAI->AddWaypoint(0, -5359.521484f, 0.490013f, 16.959352f); // aprèsfontaine A
                    creepAI->AddWaypoint(0, -5398.064941f, -0.113028f, 6.890518f); // basrampe A
                    creepAI->AddWaypoint(0, -5525.838379f, -0.240710f, 6.970019f); // basrampe H
                    creepAI->AddWaypoint(0, -5563.571289f, 0.337856f, 16.989100f); // aprèsfontaine H
                    creepAI->AddWaypoint(0, -5583.243652f, 9.897322f, 16.889269f); // gauchefontaine H
                    creepAI->AddWaypoint(0, -5593.929199f, -0.301656f, 16.911194f); // avantfontaine H
                    creepAI->AddWaypoint(0, -5613.787109f, -0.336507f, 19.983620f); // Entrée H
                    m_CreepsCount[TEAM_ALLIANCE]++;
                }
        if ((1+m_CreepsCount[TEAM_ALLIANCE] < BG_IWP_CREEPS_MAX) || (BG_IWP_CREEPS_MAX-m_CreepsCount[TEAM_ALLIANCE] == 1 && !m_LastCreepWasTop[TEAM_ALLIANCE]))
            if (Creature* creeptop = bossa->SummonCreature(BG_IWP_NPC_CREEP_A, -5306.319336f, -0.073182f, 20.547842f, 3.165546f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                if (npc_iwp_creep::npc_iwp_creepAI* creepAI = CAST_AI(npc_iwp_creep::npc_iwp_creepAI, creeptop->AI()))
                { // TOP
                    m_Creeps[BG_IWP_LANE_TOP][TEAM_ALLIANCE][creeptop->GetGUID()] = creeptop;
                    creepAI->SetLane(0);
                    creepAI->AddWaypoint(0, -5323.509277f, -0.411021f, 17.558941f); // avantfontaine A
                    creepAI->AddWaypoint(0, -5333.532227f, -9.937929f, 17.584873f); // droitefontaine A
                    creepAI->AddWaypoint(0, -5359.521484f, 0.490013f, 16.959352f); // aprèsfontaine A
                    creepAI->AddWaypoint(0, -5398.064941f, -0.113028f, 6.890518f); // basrampe A
                    creepAI->AddWaypoint(0, -5396.83056f, 102.146660f, 5.918159f); // haut gauche
                    creepAI->AddWaypoint(0, -5518.325684f, 100.875595f, 6.846214f); // bas gauche
                    creepAI->AddWaypoint(0, -5525.838379f, -0.240710f, 6.970019f); // basrampe H
                    creepAI->AddWaypoint(0, -5563.571289f, 0.337856f, 16.989100f); // aprèsfontaine H
                    creepAI->AddWaypoint(0, -5583.243652f, 9.897322f, 16.889269f); // gauchefontaine H
                    creepAI->AddWaypoint(0, -5593.929199f, -0.301656f, 16.911194f); // avantfontaine H
                    creepAI->AddWaypoint(0, -5613.787109f, -0.336507f, 19.983620f); // Entrée H
                    m_CreepsCount[TEAM_ALLIANCE]++;
                    m_LastCreepWasTop[TEAM_ALLIANCE] = true;
                }
        if (m_CreepsCount[TEAM_ALLIANCE] < BG_IWP_CREEPS_MAX)
            if (Creature* creepbot = bossa->SummonCreature(BG_IWP_NPC_CREEP_A, -5306.319336f, -0.073182f, 20.547842f, 3.165546f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                if (npc_iwp_creep::npc_iwp_creepAI* creepAI = CAST_AI(npc_iwp_creep::npc_iwp_creepAI, creepbot->AI()))
                { // BOT
                    m_Creeps[BG_IWP_LANE_BOT][TEAM_ALLIANCE][creepbot->GetGUID()] = creepbot;
                    creepAI->SetLane(1);
                    creepAI->AddWaypoint(0, -5323.509277f, -0.411021f, 17.558941f); // avantfontaine A
                    creepAI->AddWaypoint(0, -5333.461914f, 9.169089f, 17.504997f); // gauchefontaine A
                    creepAI->AddWaypoint(0, -5359.521484f, 0.490013f, 16.959352f); // aprèsfontaine A
                    creepAI->AddWaypoint(0, -5398.064941f, -0.113028f, 6.890518f); // basrampe A
                    creepAI->AddWaypoint(0, -5403.535156f, -107.556732f, 4.863138f); // haut droit
                    creepAI->AddWaypoint(0, -5518.952148f, -105.223404f, 5.334596f); // bas droit
                    creepAI->AddWaypoint(0, -5525.838379f, -0.240710f, 6.970019f); // basrampe H
                    creepAI->AddWaypoint(0, -5563.571289f, 0.337856f, 16.989100f); // aprèsfontaine H
                    creepAI->AddWaypoint(0, -5583.074219f, -9.697697f, 16.914650f); // droitefontaine H
                    creepAI->AddWaypoint(0, -5593.929199f, -0.301656f, 16.911194f); // avantfontaine H
                    creepAI->AddWaypoint(0, -5613.787109f, -0.336507f, 19.983620f); // Entrée H
                    m_CreepsCount[TEAM_ALLIANCE]++;
                    m_LastCreepWasTop[TEAM_ALLIANCE] = false;
                }
    }

    if (bossh)
    {
        if (m_CreepsCount[TEAM_HORDE] < BG_IWP_CREEPS_MAX && m_WallFallen)
            if (Creature* creepmid = bossh->SummonCreature(BG_IWP_NPC_CREEP_H, -5613.787109f, -0.336507f, 19.983620f, 6.273757f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                if (npc_iwp_creep::npc_iwp_creepAI* creepAI = CAST_AI(npc_iwp_creep::npc_iwp_creepAI, creepmid->AI()))
                { // MID
                    m_Creeps[BG_IWP_LANE_MID][TEAM_HORDE][creepmid->GetGUID()] = creepmid;
                    creepAI->SetLane(2);
                    creepAI->AddWaypoint(0, -5593.929199f, -0.301656f, 16.911194f); // avantfontaine H
                    creepAI->AddWaypoint(0, -5583.243652f, 9.897322f, 16.889269f); // gauchefontaine H
                    creepAI->AddWaypoint(0, -5563.571289f, 0.337856f, 16.989100f); // aprèsfontaine H
                    creepAI->AddWaypoint(0, -5525.838379f, -0.240710f, 6.970019f); // basrampe H
                    creepAI->AddWaypoint(0, -5398.064941f, -0.113028f, 6.890518f); // basrampe A
                    creepAI->AddWaypoint(0, -5359.521484f, 0.490013f, 16.959352f); // aprèsfontaine A
                    creepAI->AddWaypoint(0, -5333.532227f, -9.937929f, 17.584873f); // droitefontaine A
                    creepAI->AddWaypoint(0, -5323.509277f, -0.411021f, 17.558941f); // avantfontaine A
                    creepAI->AddWaypoint(0, -5306.319336f, -0.073182f, 20.547842f); // Entrée A
                    m_CreepsCount[TEAM_HORDE]++;
                }
        if ((1+m_CreepsCount[TEAM_HORDE] < BG_IWP_CREEPS_MAX) || (BG_IWP_CREEPS_MAX-m_CreepsCount[TEAM_HORDE] == 1 && !m_LastCreepWasTop[TEAM_HORDE]))
            if (Creature* creeptop = bossh->SummonCreature(BG_IWP_NPC_CREEP_H, -5613.787109f, -0.336507f, 19.983620f, 6.273757f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                if (npc_iwp_creep::npc_iwp_creepAI* creepAI = CAST_AI(npc_iwp_creep::npc_iwp_creepAI, creeptop->AI()))
                { // TOP
                    m_Creeps[BG_IWP_LANE_TOP][TEAM_HORDE][creeptop->GetGUID()] = creeptop;
                    creepAI->SetLane(0);
                    creepAI->AddWaypoint(0, -5593.929199f, -0.301656f, 16.911194f); // avantfontaine H
                    creepAI->AddWaypoint(0, -5583.243652f, 9.897322f, 16.889269f); // gauchefontaine H
                    creepAI->AddWaypoint(0, -5563.571289f, 0.337856f, 16.989100f); // aprèsfontaine H
                    creepAI->AddWaypoint(0, -5525.838379f, -0.240710f, 6.970019f); // basrampe H
                    creepAI->AddWaypoint(0, -5518.325684f, 100.875595f, 6.846214f); // bas gauche
                    creepAI->AddWaypoint(0, -5396.83056f, 102.146660f, 5.918159f); // haut gauche
                    creepAI->AddWaypoint(0, -5398.064941f, -0.113028f, 6.890518f); // basrampe A
                    creepAI->AddWaypoint(0, -5359.521484f, 0.490013f, 16.959352f); // aprèsfontaine A
                    creepAI->AddWaypoint(0, -5333.532227f, -9.937929f, 17.584873f); // droitefontaine A
                    creepAI->AddWaypoint(0, -5323.509277f, -0.411021f, 17.558941f); // avantfontaine A
                    creepAI->AddWaypoint(0, -5306.319336f, -0.073182f, 20.547842f); // Entrée A
                    m_CreepsCount[TEAM_HORDE]++;
                    m_LastCreepWasTop[TEAM_HORDE] = true;
                
                }
        if (m_CreepsCount[TEAM_HORDE] < BG_IWP_CREEPS_MAX)
            if (Creature* creepbot = bossh->SummonCreature(BG_IWP_NPC_CREEP_H, -5613.787109f, -0.336507f, 19.983620f, 6.273757f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                if (npc_iwp_creep::npc_iwp_creepAI* creepAI = CAST_AI(npc_iwp_creep::npc_iwp_creepAI, creepbot->AI()))
                { // BOT
                    m_Creeps[BG_IWP_LANE_BOT][TEAM_HORDE][creepbot->GetGUID()] = creepbot;
                    creepAI->SetLane(1);
                    creepAI->AddWaypoint(0, -5593.929199f, -0.301656f, 16.911194f); // avantfontaine H
                    creepAI->AddWaypoint(0, -5583.074219f, -9.697697f, 16.914650f); // droitefontaine H
                    creepAI->AddWaypoint(0, -5563.571289f, 0.337856f, 16.989100f); // aprèsfontaine H
                    creepAI->AddWaypoint(0, -5525.838379f, -0.240710f, 6.970019f); // basrampe H
                    creepAI->AddWaypoint(0, -5518.952148f, -105.223404f, 5.334596f); // bas droit
                    creepAI->AddWaypoint(0, -5403.535156f, -107.556732f, 4.863138f); // haut droit
                    creepAI->AddWaypoint(0, -5398.064941f, -0.113028f, 6.890518f); // basrampe A
                    creepAI->AddWaypoint(0, -5359.521484f, 0.490013f, 16.959352f); // aprèsfontaine A
                    creepAI->AddWaypoint(0, -5333.461914f, 9.169089f, 17.504997f); // gauchefontaine A
                    creepAI->AddWaypoint(0, -5323.509277f, -0.411021f, 17.558941f); // avantfontaine A
                    creepAI->AddWaypoint(0, -5306.319336f, -0.073182f, 20.547842f); // Entrée A
                    m_CreepsCount[TEAM_HORDE]++;
                    m_LastCreepWasTop[TEAM_HORDE] = false;
                }
    }
}

void BattlegroundIWP::EraseCreep(uint64 guid, uint8 lane, uint8 teamid)
{
    m_Creeps[lane][teamid].erase(guid);
    m_CreepsCount[teamid]--;
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
        TC_LOG_ERROR("bg.battleground", "bg_IWP no player at remove");
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
        case 0:
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
    for (uint16 i = 0; i < BG_IWP_CREA_MAX; i++)
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
    WorldSafeLocsEntry const*entry = sWorldSafeLocsStore.LookupEntry(BG_IWP_GraveyardIds[teamIndex]);
    return entry;
}

void BattlegroundIWP::CrushWall()
{
    if (GameObject* wall = GetBGObject(BG_IWP_OB_WALL))
    {
        if (wall->GetDestructibleState() != GO_DESTRUCTIBLE_DESTROYED)
        {
            wall->SetDestructibleState(GO_DESTRUCTIBLE_DESTROYED);
            m_WallFallen = true;
        }
        else
        {
            wall->SetDestructibleState(GO_DESTRUCTIBLE_REBUILDING, NULL, true);
            m_WallFallen = false;
        }
        TCLC("FALLEN");
    }
}

void AddSC_npc_iwp()
{
    new npc_iwp_boss();
    new npc_iwp_creep();
}
