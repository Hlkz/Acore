
#include "BattlegroundBA.h"
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

class go_ba_flag : public GameObjectScript
{
    public:
        go_ba_flag() : GameObjectScript("go_ba_flag") { }

        struct go_ba_flagAI : public GameObjectAI
        {
            go_ba_flagAI(GameObject* go) : GameObjectAI(go)
            {
                if (Battleground* bg = sBattlegroundMgr->GetBattleground(go->GetInstanceId(), BATTLEGROUND_BA))
                    if (BattlegroundBA* BA = static_cast<BattlegroundBA*>(bg))
                        ba = BA;
                team = go->GetEntry() == BG_BA_GOB_FLAG_A ? ALLIANCE : HORDE;
            }
            uint32 team;
            BattlegroundBA* ba;

            bool GossipHello(Player* player)
            {
                go->SetLootState(GO_JUST_DEACTIVATED);
                player->CastSpell(player, team==ALLIANCE?BG_BA_GOB_FLAG_A:BG_BA_GOB_FLAG_H);
                return false;
            }
        
        };

        GameObjectAI* GetAI(GameObject* go) const
        {
            return new go_ba_flagAI(go);
        }
};


class npc_ba_node : public CreatureScript
{
public:
    npc_ba_node() : CreatureScript("npc_ba_node") { }

    struct npc_ba_nodeAI : ScriptedAI
    {
        npc_ba_nodeAI(Creature* creature) : ScriptedAI(creature)
        {
            if (Battleground* bg = sBattlegroundMgr->GetBattleground(me->GetInstanceId(), BATTLEGROUND_BA))
                if (BattlegroundBA* BA = static_cast<BattlegroundBA*>(bg))
                    ba = BA;
            uint32 fac = me->getFaction();
            team = fac == 3802 ? ALLIANCE : HORDE;
        }
        uint32 team;
        BattlegroundBA* ba;
        uint32 type;

        void Reset()
        {
            me->SetControlled(true, UNIT_STATE_STUNNED);//disable rotate
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        }

        void UpdateAI(uint32 diff)
        {
            if (!me->HasUnitState(UNIT_STATE_STUNNED))
                me->SetControlled(true, UNIT_STATE_STUNNED);//disable rotate
        }

        void JustDied(Unit *) { }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_ba_nodeAI(creature);
    }
};

class npc_ba_commander : public CreatureScript
{
public:
    npc_ba_commander() : CreatureScript("npc_ba_commander") { }

    struct npc_ba_commanderAI : public npc_escortAI
    {
        npc_ba_commanderAI(Creature* creature) : npc_escortAI(creature)
        {
            go = false;
            SetDespawnAtEnd(false);
            team = me->getFaction() == 3801 ? ALLIANCE : HORDE;
            if (Battleground* bg = sBattlegroundMgr->GetBattleground(me->GetInstanceId(), BATTLEGROUND_BA))
                if (BattlegroundBA* BA = static_cast<BattlegroundBA*>(bg))
                    ba = BA;
        }
        bool go;
        uint32 team;
        Creature* obj;
        BANode* node;
        BattlegroundBA* ba;

        void UpdateAI(uint32 diff)
        {
            npc_escortAI::UpdateAI(diff);
            if (!go && !me->IsInCombat())
            {
                go = true;
                Start(false, true);
                SetDespawnAtEnd(false);
            }

            if (me->HasAura(team==ALLIANCE?BG_BA_SP_FLAG_A:BG_BA_SP_FLAG_H))
                if (ba)
                    if (obj)
                        if (me->IsInDist(obj->GetPositionX(), obj->GetPositionY(), obj->GetPositionZ(), 10.0f))
                        {
                            me->SummonGameObject(team==ALLIANCE?BG_BA_GOB_FLAG_A:BG_BA_GOB_FLAG_H, obj->GetPositionX(), obj->GetPositionY(), obj->GetPositionZ(), 0, 0, 0, 0, 0, 0);
                            ba->m_pts[ba->GetTeamIndexByTeamId(team)]++;
                            TCLC("%s marque !", team==ALLIANCE?"L'Alliance":"La Horde");
                            TCLC("Scores : Alliance %u <===> Horde %u", ba->m_pts[0], ba->m_pts[1]);
                            me->RemoveAura(team==ALLIANCE?BG_BA_GOB_FLAG_A:BG_BA_GOB_FLAG_H);
                            node->FlagsP();
                        }
            
            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }

        void WaypointReached(uint32 pointId)
        {
            me->DespawnOrUnsummon();
        }

        void JustDied(Unit* /*killer*/)
        {
            if (node)
                node->FlagsP();
        }

    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_ba_commanderAI(creature);
    }
};

BattlegroundBA::BattlegroundBA()
{
    BgObjects.resize(BG_BA_OBJECT_MAX);
    BgCreatures.resize(BG_BA_CREA_MAX);
    StartMessageIds[BG_STARTING_EVENT_FIRST]  = LANG_BG_BA_START_TWO_MINUTES;
    StartMessageIds[BG_STARTING_EVENT_SECOND] = LANG_BG_BA_START_ONE_MINUTE;
    StartMessageIds[BG_STARTING_EVENT_THIRD]  = LANG_BG_BA_START_HALF_MINUTE;
    StartMessageIds[BG_STARTING_EVENT_FOURTH] = LANG_BG_BA_HAS_BEGUN;
    m_wavetimer = 10000;
    m_pts[0] = 0;
    m_pts[1] = 0;
}

BattlegroundBA::~BattlegroundBA()
{
}

bool BattlegroundBA::SetupBattleground()
{
    for (uint8 i = BG_BA_CREA_NODE_A_1; i < BG_BA_CREA_NODE_MAX; i++)
        if (Creature* Node = AddCreature(i<BG_BA_CREA_NODE_H_1?BG_BA_NPC_NODE_A:BG_BA_NPC_NODE_H, i, i<BG_BA_CREA_NODE_H_1?ALLIANCE:HORDE, BG_BA_CreaturePos[i][0], BG_BA_CreaturePos[i][1], BG_BA_CreaturePos[i][2], BG_BA_CreaturePos[i][3]))
        {
            if (npc_ba_node::npc_ba_nodeAI* pnode = CAST_AI(npc_ba_node::npc_ba_nodeAI, Node->AI()))
                pnode->type = i;
        }
        else
        {
            TC_LOG_ERROR("sql.sql", "BatteGroundBA: Failed to spawn A Nodes");
            return false;
        }

    if ((!AddCreature(BG_BA_NPC_NODE_A, BG_BA_CREA_NEXUS_A, ALLIANCE, BG_BA_CreaturePos[BG_BA_CREA_NEXUS_A][0], BG_BA_CreaturePos[BG_BA_CREA_NEXUS_A][1], BG_BA_CreaturePos[BG_BA_CREA_NEXUS_A][2], BG_BA_CreaturePos[BG_BA_CREA_NEXUS_A][3]))
        || (!AddCreature(BG_BA_NPC_NODE_H, BG_BA_CREA_NEXUS_H, HORDE, BG_BA_CreaturePos[BG_BA_CREA_NEXUS_H][0], BG_BA_CreaturePos[BG_BA_CREA_NEXUS_H][1], BG_BA_CreaturePos[BG_BA_CREA_NEXUS_H][2], BG_BA_CreaturePos[BG_BA_CREA_NEXUS_H][3])))
    {
        TC_LOG_ERROR("sql.sql", "BatteGroundBA: Failed to spawn nexus");
        return false;
    }
    return true;
}

void BattlegroundBA::StartingEventCloseDoors()
{
}

void BattlegroundBA::StartingEventOpenDoors()
{
    //UpdateWorldState(AV_SHOW_H_SCORE, 1);
    //UpdateWorldState(AV_SHOW_A_SCORE, 1);
}

void BattlegroundBA::HandleKillPlayer(Player* player, Player* killer)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
    Battleground::HandleKillPlayer(player, killer);
}

void BattlegroundBA::HandleKillUnit(Creature* unit, Player* killer)
{
    TC_LOG_DEBUG("bg.battleground", "BA HandleKillUnit %i", unit->GetEntry());
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
}

void BattlegroundBA::PostUpdateImpl(uint32 diff)
{
    if (m_wavetimer <= 0)
    {
        for (BANodeMap::const_iterator itr = m_Nodes.begin(); itr != m_Nodes.end(); ++itr)
            if (BANode* node = itr->second)
            {
                uint32 team = node->GetTeam();
                BANodeMap enemies = node->GetEnemies();
                if (Creature* baseA = node->GetBase())
                    for (BANodeMap::const_iterator itr2 = enemies.begin(); itr2 != enemies.end(); ++itr2)
                        if (BANode* enemy = itr2->second)
                            if (team != enemy->GetTeam())
                                if (Creature* baseB = enemy->GetBase())
                                    if (Creature* commander = baseA->SummonCreature(team==ALLIANCE?BG_BA_NPC_COMMANDER_A:BG_BA_NPC_COMMANDER_H, baseA->GetPositionX(), baseA->GetPositionY(), baseA->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                                        if (npc_ba_commander::npc_ba_commanderAI* commanderAI = CAST_AI(npc_ba_commander::npc_ba_commanderAI, commander->AI()))
                                        {
                                            if (node->GetFlags() > 0)
                                            {
                                                commander->CastSpell(commander, team==ALLIANCE?BG_BA_SP_FLAG_A:BG_BA_SP_FLAG_H);
                                                node->FlagsM();
                                            }
                                            commanderAI->AddWaypoint(0, baseB->GetPositionX(), baseB->GetPositionY(), baseB->GetPositionZ());
                                            commanderAI->obj = baseB;
                                            commanderAI->node = node;
                                        }
            }
        m_wavetimer = 10000;
    }
    else m_wavetimer -= diff;
}

void BattlegroundBA::AddPlayer(Player* player)
{
    Battleground::AddPlayer(player);
    BattlegroundBAScore* sc = new BattlegroundBAScore;
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

void BattlegroundBA::EndBattleground(uint32 winner)
{
    Battleground::EndBattleground(winner);
}

void BattlegroundBA::RemovePlayer(Player* player, uint64 /*guid*/, uint32 /*team*/)
{
    if (!player)
    {
        TC_LOG_ERROR("bg.battleground", "bg_BA no player at remove");
        return;
    }
}

void BattlegroundBA::HandleAreaTrigger(Player* player, uint32 trigger)
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

void BattlegroundBA::UpdatePlayerScore(Player* Source, uint32 type, uint32 value, bool doAddHonor)
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


void BattlegroundBA::FillInitialWorldStates(WorldPacket& data)
{
    //tofix 20 node + 2 tower count
    //data << uint32(BG_BA_SHOW_A_SCORE) << uint32(0);
}

void BattlegroundBA::ResetBGSubclass()
{
    //tofix timers
    for (uint16 i = 0; i < BG_BA_CREA_MAX; i++)
        if (BgCreatures[i])
            DelCreature(i);
}

uint32 BattlegroundBA::GetPrematureWinner()
{
    //tofix surrender
    return Battleground::GetPrematureWinner();
}

WorldSafeLocsEntry const* BattlegroundBA::GetClosestGraveYard(Player* player)
{
    player->SetRezTime(getMSTime() + 12*IN_MILLISECONDS);
    TeamId teamIndex = GetTeamIndexByTeamId(player->GetTeam(true));
    std::vector<uint8> graveyards;
    WorldSafeLocsEntry const*entry = sWorldSafeLocsStore.LookupEntry(BG_BA_GraveyardIds[teamIndex]);
    return entry;
}

BANode* BattlegroundBA::AddNode(uint32 id, uint32 team, Creature* base)
{
    BANode* Node = new BANode(id, team, base);
    m_Nodes[id] = Node;
    Node->SetFlags(2);
    return Node;
}

void BattlegroundBA::RemoveNode(uint32 id)
{
    BANodeMap::iterator itr = m_Nodes.find(id);
    if (itr != m_Nodes.end())
    {
        delete itr->second;
        m_Nodes.erase(itr);
    }
}

BANode* const BattlegroundBA::GetNode(uint32 id)
{
    BANodeMap::iterator itr = m_Nodes.find(id);
    if (itr != m_Nodes.end())
        if (itr->second)
            return itr->second;
    return NULL;
}

void AddSC_npc_ba()
{
    new go_ba_flag();
    new npc_ba_node();
    new npc_ba_commander();
}
