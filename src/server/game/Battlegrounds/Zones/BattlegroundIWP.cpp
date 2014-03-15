
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

class go_iwp_flag : public GameObjectScript
{
    public:
        go_iwp_flag() : GameObjectScript("go_iwp_flag") { }

        struct go_iwp_flagAI : public GameObjectAI
        {
            go_iwp_flagAI(GameObject* go) : GameObjectAI(go)
            {
                if (Battleground* bg = sBattlegroundMgr->GetBattleground(go->GetInstanceId(), BATTLEGROUND_BA))
                    if (BattlegroundIWP* BG_IWP = static_cast<BattlegroundIWP*>(bg))
                        iwp = BG_IWP;
                team = go->GetEntry() == BG_IWP_GOB_FLAG_A ? ALLIANCE : HORDE;
            }
            uint32 team;
            BattlegroundIWP* iwp;

            bool GossipHello(Player* player)
            {
                go->SetLootState(GO_JUST_DEACTIVATED);
                player->CastSpell(player, team==ALLIANCE?BG_IWP_SP_FLAG_A:BG_IWP_SP_FLAG_H);
                return false;
            }
        
        };

        GameObjectAI* GetAI(GameObject* go) const
        {
            return new go_iwp_flagAI(go);
        }
};


class npc_iwp_node : public CreatureScript
{
public:
    npc_iwp_node() : CreatureScript("npc_iwp_node") { }

    struct npc_iwp_nodeAI : ScriptedAI
    {
        npc_iwp_nodeAI(Creature* creature) : ScriptedAI(creature)
        {
            if (Battleground* bg = sBattlegroundMgr->GetBattleground(me->GetInstanceId(), BATTLEGROUND_BA))
                if (BattlegroundIWP* BG_IWP = static_cast<BattlegroundIWP*>(bg))
                    iwp = BG_IWP;
            uint32 fac = me->getFaction();
            team = fac == 3802 ? ALLIANCE : HORDE;
        }
        uint32 team;
        BattlegroundIWP* iwp;
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
        return new npc_iwp_nodeAI(creature);
    }
};

class npc_iwp_commander : public CreatureScript
{
public:
    npc_iwp_commander() : CreatureScript("npc_iwp_commander") { }

    struct npc_iwp_commanderAI : public npc_escortAI
    {
        npc_iwp_commanderAI(Creature* creature) : npc_escortAI(creature)
        {
            m_go = false;
            SetDespawnAtEnd(false);
            m_team = me->getFaction() == 3801 ? ALLIANCE : HORDE;
            if (Battleground* bg = sBattlegroundMgr->GetBattleground(me->GetInstanceId(), BATTLEGROUND_IWP))
                if (BattlegroundIWP* iwp = static_cast<BattlegroundIWP*>(bg))
                    m_iwp = iwp;
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

            if (me->HasAura(m_team==ALLIANCE?BG_IWP_SP_FLAG_A:BG_IWP_SP_FLAG_H))
                if (m_iwp)
                    if (m_obj)
                        if (me->IsInDist(m_obj->GetPositionX(), m_obj->GetPositionY(), m_obj->GetPositionZ(), 10.0f))
                        {
                            if (m_status == BG_IWP_COMMANDER_RENF)
                                ;
                            else
                            {
                                me->SummonGameObject(m_team==ALLIANCE?BG_IWP_GOB_FLAG_A:BG_IWP_GOB_FLAG_H, m_obj->GetPositionX(), m_obj->GetPositionY(), m_obj->GetPositionZ(), 0, 0, 0, 0, 0, 0);
                                m_iwp->m_pts[m_iwp->GetTeamIndexByTeamId(m_team)]++;
                                TCLC("%s marque !", m_team==ALLIANCE?"L'Alliance":"La Horde");
                                TCLC("Scores : Alliance %u <===> Horde %u", m_iwp->m_pts[0], m_iwp->m_pts[1]);
                                me->RemoveAura(m_team==ALLIANCE?BG_IWP_SP_FLAG_A:BG_IWP_SP_FLAG_H);
                                m_node->FlagsP();
                               // this->jus
                            }
                        }
            
            if (!UpdateVictim()) return;
            DoMeleeAttackIfReady();
        }

        void WaypointReached(uint32 pointId) { }

        void JustDied(Unit* /*killer*/) { if (m_node) m_node->FlagsP(); }

        void SetStatus(uint32 status) { m_status = status; }

    private:
        bool m_go;
        uint32 m_team;
        Creature* m_obj;
        IWPNode* m_node;
        BattlegroundIWP* m_iwp;
        uint32 m_status;

    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_iwp_commanderAI(creature);
    }
};

BattlegroundIWP::BattlegroundIWP()
{
    BgObjects.resize(BG_IWP_OBJECT_MAX);
    BgCreatures.resize(BG_IWP_CREA_MAX);
    StartMessageIds[BG_STARTING_EVENT_FIRST]  = LANG_BG_BA_START_TWO_MINUTES;
    StartMessageIds[BG_STARTING_EVENT_SECOND] = LANG_BG_BA_START_ONE_MINUTE;
    StartMessageIds[BG_STARTING_EVENT_THIRD]  = LANG_BG_BA_START_HALF_MINUTE;
    StartMessageIds[BG_STARTING_EVENT_FOURTH] = LANG_BG_BA_HAS_BEGUN;
    m_wavetimer = 10000;
    m_pts[0] = 0;
    m_pts[1] = 0;
}

BattlegroundIWP::~BattlegroundIWP()
{
}

bool BattlegroundIWP::SetupBattleground()
{
    /*
    BG_IWPNode* NodeA = AddNode(1, ALLIANCE, GetBGCreature(IWP_BASE_A));
    BG_IWPNode* NodeH = AddNode(2, HORDE, GetBGCreature(IWP_BASE_H));
    NodeA->AddEnemy(NodeH);
    NodeH->AddEnemy(NodeA);
    */
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
    TC_LOG_DEBUG(LOG_FILTER_BATTLEGROUND, "IWP HandleKillUnit %i", unit->GetEntry());
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
}

void BattlegroundIWP::PostUpdateImpl(uint32 diff)
{
    if (m_wavetimer <= 0)
    {
        for (IWPNodeMap::const_iterator itr = m_Nodes.begin(); itr != m_Nodes.end(); ++itr)
            if (IWPNode* node = itr->second)
            {
                uint32 team = node->GetTeam();
                IWPNodeMap enemies = node->GetEnemies();
                if (Creature* baseA = node->GetBase())
                    for (IWPNodeMap::const_iterator itr2 = enemies.begin(); itr2 != enemies.end(); ++itr2)
                        if (IWPNode* enemy = itr2->second)
                            if (team != enemy->GetTeam())
                                if (Creature* baseB = enemy->GetBase())
                                    if (Creature* commander = baseA->SummonCreature(team==ALLIANCE?BG_IWP_NPC_COMMANDER_A:BG_IWP_NPC_COMMANDER_H, baseA->GetPositionX(), baseA->GetPositionY(), baseA->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                                        if (npc_iwp_commander::npc_iwp_commanderAI* commanderAI = CAST_AI(npc_iwp_commander::npc_iwp_commanderAI, commander->AI()))
                                        {
                                            if (node->GetFlags() > 0)
                                            {
                                                commander->CastSpell(commander, team==ALLIANCE?BG_IWP_SP_FLAG_A:BG_IWP_SP_FLAG_H);
                                                node->FlagsM();
                                            }
                                            commanderAI->AddWaypoint(0, baseB->GetPositionX(), baseB->GetPositionY(), baseB->GetPositionZ());
                                            //commanderAI->obj = baseB;
                                            //commanderAI->node = node;
                                        }
            }
        m_wavetimer = 10000;
    }
    else m_wavetimer -= diff;
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

IWPNode* BattlegroundIWP::AddNode(uint32 id, uint32 team, Creature* base)
{
    IWPNode* Node = new IWPNode(id, team, base);
    m_Nodes[id] = Node;
    Node->SetFlags(2);
    return Node;
}

void BattlegroundIWP::RemoveNode(uint32 id)
{
    IWPNodeMap::iterator itr = m_Nodes.find(id);
    if (itr != m_Nodes.end())
    {
        delete itr->second;
        m_Nodes.erase(itr);
    }
}

IWPNode* const BattlegroundIWP::GetNode(uint32 id)
{
    IWPNodeMap::iterator itr = m_Nodes.find(id);
    if (itr != m_Nodes.end())
        if (itr->second)
            return itr->second;
    return NULL;
}

void AddSC_npc_iwp()
{
    new go_iwp_flag();
    new npc_iwp_node();
    new npc_iwp_commander();
}
