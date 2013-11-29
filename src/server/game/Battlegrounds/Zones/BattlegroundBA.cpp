
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

class npc_ba_turret : public CreatureScript
{
    public:
        npc_ba_turret() : CreatureScript("npc_ba_turret") { }

        struct npc_ba_turretAI : public TurretAI
        {
            npc_ba_turretAI(Creature* creature) : TurretAI(creature)
            {
                me->SetControlled(true, UNIT_STATE_STUNNED); //disable rotate
                me->m_CombatDistance = 20.0f;
                me->m_SightDistance = 20.0f;

                if (Battleground* bg = sBattlegroundMgr->GetBattleground(me->GetInstanceId(), BATTLEGROUND_BA))
                    if (BattlegroundBA* ba = static_cast<BattlegroundBA*>(bg))
                        BA = ba;
                uint32 fac = me->getFaction();
                team = fac == 3802 ? HORDE : ALLIANCE;
            }
            uint32 team;
            BattlegroundBA* BA;
            uint32 type;

            void UpdateAI(uint32 /*diff*/)
            {
                if (!me->HasUnitState(UNIT_STATE_STUNNED))
                    me->SetControlled(true, UNIT_STATE_STUNNED); //disable rotate

                if (!UpdateVictim())
                    return;

                // DoSpellAttackIfReady(me->m_spells[0]);
            }

            void JustDied(Unit *)
            {
                uint32 NextType = BG_BA_NextPoint[type];
                if (BA)
                {
                    if (team == ALLIANCE)
                        BA->SendMessageToAll(LANG_BG_BA_TOWER_DEAD_H, CHAT_MSG_BG_SYSTEM_HORDE);
                    else
                        BA->SendMessageToAll(LANG_BG_BA_TOWER_DEAD_A, CHAT_MSG_BG_SYSTEM_ALLIANCE);
                    BA->PlaySoundToAll(BA_SOUND_CLAIMED);
                    if(Creature* NextCrea = BA->GetBGCreature(NextType))
                        NextCrea->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    uint32 otherTeamId = BA->GetTeamIndexByTeamId(BA->GetOtherTeam(team));
                    if (!BA->IsNexusAttackable[otherTeamId] && (NextType == BA_CTYPE_NEXUS_A || NextType == BA_CTYPE_NEXUS_H))
                    {
                        BA->IsNexusAttackable[otherTeamId] = true;
                        if (otherTeamId == TEAM_ALLIANCE)
                            BA->SendMessageToAll(LANG_BG_BA_NEXUS_VULN_A, CHAT_MSG_BG_SYSTEM_ALLIANCE);
                        else
                            BA->SendMessageToAll(LANG_BG_BA_NEXUS_VULN_H, CHAT_MSG_BG_SYSTEM_HORDE);
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_ba_turretAI(creature);
        }
};

class npc_ba_nexus : public CreatureScript
{
public:
    npc_ba_nexus() : CreatureScript("npc_ba_nexus") { }

    struct npc_ba_nexusAI : ScriptedAI
    {
        npc_ba_nexusAI(Creature* creature) : ScriptedAI(creature)
        {
            if (Battleground* bg = sBattlegroundMgr->GetBattleground(me->GetInstanceId(), BATTLEGROUND_BA))
                if (BattlegroundBA* ba = static_cast<BattlegroundBA*>(bg))
                    BA = ba;
            uint32 fac = me->getFaction();
            team = fac == 3802 ? ALLIANCE : HORDE;
        }
        uint32 team;
        BattlegroundBA* BA;

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

        void JustDied(Unit *)
        {
            if (BA)
                BA->EndBattleground(team);
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_ba_nexusAI(creature);
    }
};

class npc_ba_creep : public CreatureScript
{
public:
    npc_ba_creep() : CreatureScript("npc_ba_creep") { }

    struct npc_ba_creepAI : public npc_escortAI
    {
        npc_ba_creepAI(Creature* creature) : npc_escortAI(creature)
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
        return new npc_ba_creepAI(creature);
    }
};

class npc_ba_nashor : public CreatureScript
{
public:
    npc_ba_nashor() : CreatureScript("npc_ba_nashor") { }

    struct npc_ba_nashorAI : public BossAI
    {
        npc_ba_nashorAI(Creature* creature) : BossAI(creature, creature->GetGUID()) { }
        uint32 timer;

        void KilledUnit(Unit *) { }

        void JustDied(Unit *) { }

        void EnterCombat(Unit* victim)
        {
            BossAI::EnterCombat(victim);
        }

        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;
            events.Update(diff);

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            if(timer <= diff) {
                DoMeleeAttackIfReady();  timer = 6000; }
            else timer -= diff;
        }
    };
    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_ba_nashorAI (creature);
    }
};

class npc_ba_vendor : public CreatureScript
{
public:
    npc_ba_vendor() : CreatureScript("npc_ba_vendor") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        npc_ba_vendor::npc_ba_vendorAI* vendorAI = CAST_AI(npc_ba_vendor::npc_ba_vendorAI, GetAI(creature));
        if (!vendorAI)
            return true;
        if (!vendorAI->BA)
            return true;
        std::ostringstream ostr;
        ostr << "Vous avez " << player->GetItemCount(BG_BA_ITEMID_SHARD) << " esquilles a depenser, chaque modification en coute 5 !";
        WorldSession* session = player->GetSession();
        creature->HasQuestForPlayer(player);
        player->ADD_GOSSIP_ITEM(6, ostr.str().c_str(), GOSSIP_SENDER_MAIN, 1);
        player->ADD_GOSSIP_ITEM(3, "+40 Force", GOSSIP_SENDER_MAIN, 10);
        player->ADD_GOSSIP_ITEM(3, "+40 Agi", GOSSIP_SENDER_MAIN, 11);
        player->ADD_GOSSIP_ITEM(3, "+40 Endurance", GOSSIP_SENDER_MAIN, 12);
        player->ADD_GOSSIP_ITEM(3, "+40 Intelligence", GOSSIP_SENDER_MAIN, 13);
        player->ADD_GOSSIP_ITEM(3, "+40 Esprit", GOSSIP_SENDER_MAIN, 14);
        player->ADD_GOSSIP_ITEM(3, "+400 Armure", GOSSIP_SENDER_MAIN, 23);
        player->ADD_GOSSIP_ITEM(3, "+100 Puissance d'attaque", GOSSIP_SENDER_MAIN, 30);
        player->SEND_GOSSIP_MENU(1, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();
        OnGossipHello(player, creature);
        if (uiAction > 9 && player->GetItemCount(BG_BA_ITEMID_SHARD) > 4)
        {
            player->UpdateStatMod(STAT_MOD_TYPE_BG_BA, uiAction-10, player->GetStatMod(STAT_MOD_TYPE_BG_BA, uiAction-10) + 40 + (uiAction==30)*60 + (uiAction==23)*360);
            player->DestroyItemCount(BG_BA_ITEMID_SHARD, 5, true);
        }
        return true;
    }

    struct npc_ba_vendorAI : ScriptedAI
    {
        npc_ba_vendorAI(Creature* creature) : ScriptedAI(creature)
        {
            if (Battleground* bg = sBattlegroundMgr->GetBattleground(me->GetInstanceId(), BATTLEGROUND_BA))
                if (BattlegroundBA* ba = static_cast<BattlegroundBA*>(bg))
                    BA = ba;
            uint32 fac = me->getFaction();
            team = fac == 3802 ? ALLIANCE : HORDE;
        }
        uint32 team;
        BattlegroundBA* BA;

        void Reset() { }
        void UpdateAI(uint32 diff) { }
        void JustDied(Unit *) { }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_ba_vendorAI(creature);
    }
};

BattlegroundBA::BattlegroundBA()
{
    BgObjects.resize(BG_BA_OBJECT_MAX);
    BgCreatures.resize(BA_CTYPE_MAX);
    m_WavesCount = 0;
    m_WavesTimer = 0;
    IsNexusAttackable[TEAM_ALLIANCE] = false;
    IsNexusAttackable[TEAM_HORDE] = false;
    StartMessageIds[BG_STARTING_EVENT_FIRST]  = LANG_BG_BA_START_TWO_MINUTES;
    StartMessageIds[BG_STARTING_EVENT_SECOND] = LANG_BG_BA_START_ONE_MINUTE;
    StartMessageIds[BG_STARTING_EVENT_THIRD]  = LANG_BG_BA_START_HALF_MINUTE;
    StartMessageIds[BG_STARTING_EVENT_FOURTH] = LANG_BG_BA_HAS_BEGUN;
}

BattlegroundBA::~BattlegroundBA()
{
}

bool BattlegroundBA::SetupBattleground()
{
    for (uint8 i = BA_CTYPE_TOWER_A_1; i < BA_CTYPE_TOWER_H_1; i++)
    {
        if (Creature* tower = AddCreature(BA_TOWER_A_ENTRY, i, ALLIANCE, BG_BA_CreaturePos[i][0], BG_BA_CreaturePos[i][1], BG_BA_CreaturePos[i][2], BG_BA_CreaturePos[i][3]))
        {
            if (npc_ba_turret::npc_ba_turretAI* pturret = CAST_AI(npc_ba_turret::npc_ba_turretAI, tower->AI()))
                pturret->type = i;
            if (i != BA_CTYPE_TOWER_A_T1+1 && i != BA_CTYPE_TOWER_A_M1+1 && i != BA_CTYPE_TOWER_A_B1+1)
                tower->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        }
        else
        {
            TC_LOG_ERROR(LOG_FILTER_SQL, "BatteGroundBA: Failed to spawn A towers");
            return false;
        }
    }
    for (uint8 i = BA_CTYPE_TOWER_H_1; i < BA_CTYPE_TOWER_MAX; i++)
    {
        if (Creature* tower = AddCreature(BA_TOWER_H_ENTRY, i, HORDE, BG_BA_CreaturePos[i][0], BG_BA_CreaturePos[i][1], BG_BA_CreaturePos[i][2], BG_BA_CreaturePos[i][3]))
        {
            if (npc_ba_turret::npc_ba_turretAI* pturret = CAST_AI(npc_ba_turret::npc_ba_turretAI, tower->AI()))
                pturret->type = i;
            if (i != BA_CTYPE_TOWER_H_T1+1 && i != BA_CTYPE_TOWER_H_M1+1 && i != BA_CTYPE_TOWER_H_B1+1)
                tower->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        }
        else
        {
            TC_LOG_ERROR(LOG_FILTER_SQL, "BatteGroundBA: Failed to spawn H towers");
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

    SetStartDelayTime(60000);

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
    killer->AddItem(BG_BA_ITEMID_SHARD, 15);
    UpdatePlayerScore(killer, SCORE_ARCANE_FRAG, 15);
    Battleground::HandleKillPlayer(player, killer);
}

void BattlegroundBA::HandleKillUnit(Creature* unit, Player* killer)
{
    TC_LOG_DEBUG(LOG_FILTER_BATTLEGROUND, "bg_BA HandleKillUnit %i", unit->GetEntry());
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
    uint32 entry = unit->GetEntry();
    if (entry == BA_CREEP_A || entry == BA_CREEP_H)
    {
        UpdatePlayerScore(killer, SCORE_CREEPS_KILLED, 1);
        killer->AddItem(BG_BA_ITEMID_SHARD, 1);
        UpdatePlayerScore(killer, SCORE_ARCANE_FRAG, 1);
    }
}

void BattlegroundBA::PostUpdateImpl(uint32 diff)
{
    if (GetStatus() == STATUS_IN_PROGRESS)
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

void BattlegroundBA::SpawnCreeps(uint32 count)
{
    Creature* nexusa = GetBGCreature(BA_CTYPE_NEXUS_A);
    Creature* nexush = GetBGCreature(BA_CTYPE_NEXUS_H);

    if (nexusa)
    {
        if (Creature* creeptop = nexusa->SummonCreature(BA_CREEP_A, nexusa->GetPositionX(), nexusa->GetPositionY(), nexusa->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
            if (npc_escortAI* creepAI = CAST_AI(npc_escortAI, creeptop->AI()))
            { // TOP
                creepAI->AddWaypoint(0, -5718.999023f, 407.097992f, 3.971146f); // haut plat a
                creepAI->AddWaypoint(0, -5665.672363f, 418.739594f, 3.714551f); // haut esc a
                creepAI->AddWaypoint(0, -5645.784180f, 419.602417f, -1.706164f); // bas esc a
                creepAI->AddWaypoint(0, -5559.209961f, 417.835968f, -0.520683f); // coin a
                creepAI->AddWaypoint(0, -5516.463379f, 382.097076f, -0.160112f); // coin h 2
                creepAI->AddWaypoint(0, -5507.485352f, 366.676910f, -0.507420f); // coin h
                creepAI->AddWaypoint(0, -5509.661133f, 279.008820f, -0.611549f); // bas esc h
                creepAI->AddWaypoint(0, -5519.605957f, 260.064453f, 3.734702f); // haut esc h
                creepAI->AddWaypoint(0, -5527.742188f, 233.713364f, 3.443575f); // haut
                creepAI->AddWaypoint(0, -5525.796387f, 217.749344f, 3.344448f); // haut plat h
                if (nexush) creepAI->AddWaypoint(0, nexush->GetPositionX(), nexush->GetPositionY(), nexush->GetPositionZ()); //nexus h
            }
        if (Creature* creepmid = nexusa->SummonCreature(BA_CREEP_A, nexusa->GetPositionX(), nexusa->GetPositionY(), nexusa->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
            if (npc_escortAI* creepAI = CAST_AI(npc_escortAI, creepmid->AI()))
            { // MID
                creepAI->AddWaypoint(0, -5718.719238f, 389.569702f, 3.971861f); // haut plat a
                creepAI->AddWaypoint(0, -5690.548828f, 381.282776f, 2.837310f); // haut esc a
                creepAI->AddWaypoint(0, -5684.860352f, 370.115051f, -1.659460f); // bas esc a
                creepAI->AddWaypoint(0, -5674.895020f, 348.629425f, -1.883493f); // tour m1 a
                creepAI->AddWaypoint(0, -5652.097656f, 314.810577f, -2.824843f); // tour m2 a
                creepAI->AddWaypoint(0, -5617.568848f, 284.953430f, -3.052890f); // tour m2 h
                creepAI->AddWaypoint(0, -5588.509766f, 257.879700f, -1.657841f); // tour m1 h
                creepAI->AddWaypoint(0, -5580.628418f, 236.735428f, -0.824628f); // bas esc h
                creepAI->AddWaypoint(0, -5574.752441f, 227.337234f, 3.843520f); // haut esc h
                creepAI->AddWaypoint(0, -5553.711914f, 209.825790f, 3.344431f); // haut plat h
                if (nexush) creepAI->AddWaypoint(0, nexush->GetPositionX(), nexush->GetPositionY(), nexush->GetPositionZ()); //nexus h
            }
        if (Creature* creepbot = nexusa->SummonCreature(BA_CREEP_A, nexusa->GetPositionX(), nexusa->GetPositionY(), nexusa->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
            if (npc_escortAI* creepAI = CAST_AI(npc_escortAI, creepbot->AI()))
            { // BOT
                creepAI->AddWaypoint(0, -5745.647461f, 381.819885f, 3.654306f); // haut plat a
                creepAI->AddWaypoint(0, -5751.123047f, 344.837067f, 2.751340f); // haut esc a
                creepAI->AddWaypoint(0, -5751.028320f, 332.097107f, -1.622571f); // bas esc a
                creepAI->AddWaypoint(0, -5751.888672f, 223.525681f, -0.963767f); // coin a
                creepAI->AddWaypoint(0, -5740.180664f, 207.748154f, -0.844657f); // coin a 2
                creepAI->AddWaypoint(0, -5697.625000f, 186.396500f, -0.773012f); // coin h
                creepAI->AddWaypoint(0, -5621.074707f, 182.253922f, -1.040058f); // bas esc h
                creepAI->AddWaypoint(0, -5605.150879f, 187.222183f, 3.928060f); // haut esc h
                creepAI->AddWaypoint(0, -5567.566895f, 198.476898f, 3.082360f); // haut
                creepAI->AddWaypoint(0, -5549.085449f, 193.960861f, 3.344653f); // haut plat h
                if (nexush) creepAI->AddWaypoint(0, nexush->GetPositionX(), nexush->GetPositionY(), nexush->GetPositionZ()); //nexus h
            }
    }

    if (nexush)
    {
        if (Creature* creeptop = nexush->SummonCreature(BA_CREEP_H, nexush->GetPositionX(), nexush->GetPositionY(), nexush->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
            if (npc_escortAI* creepAI = CAST_AI(npc_escortAI, creeptop->AI()))
            { // TOP
                creepAI->AddWaypoint(0, -5525.796387f, 217.749344f, 3.344448f); // haut plat h
                creepAI->AddWaypoint(0, -5527.742188f, 233.713364f, 3.443575f); // haut
                creepAI->AddWaypoint(0, -5519.605957f, 260.064453f, 3.734702f); // haut esc h
                creepAI->AddWaypoint(0, -5509.661133f, 279.008820f, -0.611549f); // bas esc h
                creepAI->AddWaypoint(0, -5507.485352f, 366.676910f, -0.507420f); // coin h
                creepAI->AddWaypoint(0, -5516.463379f, 382.097076f, -0.160112f); // coin h 2
                creepAI->AddWaypoint(0, -5559.209961f, 417.835968f, -0.520683f); // coin a
                creepAI->AddWaypoint(0, -5645.784180f, 419.602417f, -1.706164f); // bas esc a
                creepAI->AddWaypoint(0, -5665.672363f, 418.739594f, 3.714551f); // haut esc a
                creepAI->AddWaypoint(0, -5718.999023f, 407.097992f, 3.971146f); // haut plat a
                if (nexusa) creepAI->AddWaypoint(0, nexusa->GetPositionX(), nexusa->GetPositionY(), nexusa->GetPositionZ()); //nexus a
            }
        if (Creature* creepmid = nexush->SummonCreature(BA_CREEP_H, nexush->GetPositionX(), nexush->GetPositionY(), nexush->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
            if (npc_escortAI* creepAI = CAST_AI(npc_escortAI, creepmid->AI()))
            { // MID
                creepAI->AddWaypoint(0, -5553.711914f, 209.825790f, 3.344431f); // haut plat h
                creepAI->AddWaypoint(0, -5574.752441f, 227.337234f, 3.843520f); // haut esc h
                creepAI->AddWaypoint(0, -5580.628418f, 236.735428f, -0.824628f); // bas esc h
                creepAI->AddWaypoint(0, -5588.509766f, 257.879700f, -1.657841f); // tour m1 h
                creepAI->AddWaypoint(0, -5617.568848f, 284.953430f, -3.052890f); // tour m2 h
                creepAI->AddWaypoint(0, -5652.097656f, 314.810577f, -2.824843f); // tour m2 a
                creepAI->AddWaypoint(0, -5674.895020f, 348.629425f, -1.883493f); // tour m1 a
                creepAI->AddWaypoint(0, -5684.860352f, 370.115051f, -1.659460f); // bas esc a
                creepAI->AddWaypoint(0, -5690.548828f, 381.282776f, 2.837310f); // haut esc a
                creepAI->AddWaypoint(0, -5718.719238f, 389.569702f, 3.971861f); // haut plat a
                if (nexusa) creepAI->AddWaypoint(0, nexusa->GetPositionX(), nexusa->GetPositionY(), nexusa->GetPositionZ()); //nexus a
            }
        if (Creature* creepbot = nexush->SummonCreature(BA_CREEP_H, nexush->GetPositionX(), nexush->GetPositionY(), nexush->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
            if (npc_escortAI* creepAI = CAST_AI(npc_escortAI, creepbot->AI()))
            { // BOT
                creepAI->AddWaypoint(0, -5549.085449f, 193.960861f, 3.344653f); // haut plat h
                creepAI->AddWaypoint(0, -5567.566895f, 198.476898f, 3.082360f); // haut
                creepAI->AddWaypoint(0, -5605.150879f, 187.222183f, 3.928060f); // haut esc h
                creepAI->AddWaypoint(0, -5621.074707f, 182.253922f, -1.040058f); // bas esc h
                creepAI->AddWaypoint(0, -5697.625000f, 186.396500f, -0.773012f); // coin h
                creepAI->AddWaypoint(0, -5740.180664f, 207.748154f, -0.844657f); // coin a 2
                creepAI->AddWaypoint(0, -5751.888672f, 223.525681f, -0.963767f); // coin a
                creepAI->AddWaypoint(0, -5751.028320f, 332.097107f, -1.622571f); // bas esc a
                creepAI->AddWaypoint(0, -5751.123047f, 344.837067f, 2.751340f); // haut esc a
                creepAI->AddWaypoint(0, -5745.647461f, 381.819885f, 3.654306f); // haut plat a
                if (nexusa) creepAI->AddWaypoint(0, nexusa->GetPositionX(), nexusa->GetPositionY(), nexusa->GetPositionZ()); //nexus a
            }
    }
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
    player->AddItem(BG_BA_ITEMID_COLLECT, 1);
    player->InitStatsMod(STAT_MOD_TYPE_BG_BA);
    player->UpdateStatsMod(STAT_MOD_TYPE_BG_BA, true, false);
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
        case SCORE_CREEPS_KILLED:
            ((BattlegroundBAScore*)itr->second)->CreepsKilled += value;
            break;
        case SCORE_ARCANE_FRAG:
            ((BattlegroundBAScore*)itr->second)->ArcaneFrag += value;
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

WorldSafeLocsEntry const* BattlegroundBA::GetClosestGraveYard(Player* player)
{
    player->SetRezTime(getMSTime() + 12*IN_MILLISECONDS);
    TeamId teamIndex = GetTeamIndexByTeamId(player->GetTeamFromDB());
    std::vector<uint8> graveyards;
    WorldSafeLocsEntry const*entry = sWorldSafeLocsStore.LookupEntry(BG_BA_GraveyardIds[teamIndex]);
    return entry;
}

void AddSC_npc_ba()
{
    new npc_ba_turret();
    new npc_ba_nexus();
    new npc_ba_creep();
    new npc_ba_nashor();
    new npc_ba_vendor();
}
