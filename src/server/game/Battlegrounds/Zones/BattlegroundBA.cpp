
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
				me->m_CombatDistance = 45.0f;
				me->m_SightDistance = 45.0f;

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

				DoSpellAttackIfReady(me->m_spells[0]);
			}
			
			void JustDied(Unit *)
			{
				uint32 NextType = BG_BA_NextPoint[type];
				if (BA)
				{
					if(Creature* NextCrea = BA->GetBGCreature(NextType))
						NextCrea->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					if (!BA->IsNexusAttackable[BA->GetTeamIndexByTeamId(BA->GetOtherTeam(team))] && (NextType == BA_CTYPE_NEXUS_A || NextType == BA_CTYPE_NEXUS_H))
					{
						TC_LOG_ERROR(LOG_FILTER_GENERAL, "coucou NEXUS VULNERABEUL !");
						BA->IsNexusAttackable[BA->GetTeamIndexByTeamId(BA->GetOtherTeam(team))] = true;
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

		void WaypointReached(uint32 pointId) {}

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

BattlegroundBA::BattlegroundBA()
{
    BgObjects.resize(BG_BA_OBJECT_MAX);
    BgCreatures.resize(BA_CTYPE_MAX);
	m_WavesCount = 0;
	m_WavesTimer = 0;
	IsNexusAttackable[TEAM_ALLIANCE] = false;
	IsNexusAttackable[TEAM_HORDE] = false;
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
			if (i != BA_CTYPE_TOWER_A_TOP+2 && i != BA_CTYPE_TOWER_A_MID+2 && i != BA_CTYPE_TOWER_A_BOT+2)
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
			if (i != BA_CTYPE_TOWER_H_TOP+2 && i != BA_CTYPE_TOWER_H_MID+2 && i != BA_CTYPE_TOWER_H_BOT+2)
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
			if (m_WavesCount == 6)
			{
				m_WavesCount = 0;
				m_WavesTimer = 17000;
			}
			else
				m_WavesTimer = 600;
		}
	}
	
	//REZ
	for (BattlegroundBA::BGBAPlayerMap::const_iterator itr = m_BAPlayers.begin(); itr != m_BAPlayers.end(); ++itr)
		if (Player* player = ObjectAccessor::FindPlayer(MAKE_NEW_GUID(itr->first, 0, HIGHGUID_PLAYER)))
			if (m_BAPlayers[player->GetGUID()].NextRezTimer)
				if (getMSTime() >= m_BAPlayers[player->GetGUID()].NextRezTimer)
					if (player->HasAura(SPELL_WAITING_FOR_RESURRECT))
					{
						player->ResurrectPlayer(1.0f);
						player->CastSpell(player, 6962, true);
						player->CastSpell(player, SPELL_RESURRECTION_VISUAL, true);
						player->CastSpell(player, SPELL_SPIRIT_HEAL_MANA, true);
						player->RemoveAurasDueToSpell(SPELL_WAITING_FOR_RESURRECT);
						sObjectAccessor->ConvertCorpseForPlayer(player->GetGUID());
						m_BAPlayers[player->GetGUID()].NextRezTimer = 0;
					}
					else
						m_BAPlayers[player->GetGUID()].NextRezTimer = getMSTime() + 6*IN_MILLISECONDS;
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
				creepAI->AddWaypoint(0, -4934.822266f, 358.114716f, 4.927556f); //haut escaliers
				creepAI->AddWaypoint(0, -4933.100586f, 251.718414f, 0.000447f); //bas escaliers
				creepAI->AddWaypoint(0, -4936.915527f, -13.912660f, 0.000501f); //coin
				if (nexush) creepAI->AddWaypoint(0, nexush->GetPositionX(), nexush->GetPositionY(), nexush->GetPositionZ()); //nexus h
			}
		if (Creature* creepmid = nexusa->SummonCreature(BA_CREEP_A, nexusa->GetPositionX(), nexusa->GetPositionY(), nexusa->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
			if (npc_escortAI* creepAI = CAST_AI(npc_escortAI, creepmid->AI()))
			{ // MID
				creepAI->AddWaypoint(0, -4975.296875f, 332.126495f, 4.437662f); //haut escaliers a
				creepAI->AddWaypoint(0, -5665.098145f, 351.857880f, -0.369316f); //bas escaliers a
				creepAI->AddWaypoint(0, -5644.247559f, 311.628906f, -0.001237f); //milieu a
				creepAI->AddWaypoint(0, -5411.986328f, 79.070816f, -0.001237f); //milieu h
				creepAI->AddWaypoint(0, -5394.129883f, 55.194798f, -0.001237f); //bas escaliers h
				creepAI->AddWaypoint(0, -5381.382813f, 40.029888f, 4.769938f); //haut escaliers h
				if (nexush) creepAI->AddWaypoint(0, nexush->GetPositionX(), nexush->GetPositionY(), nexush->GetPositionZ()); //nexus h
			}
		if (Creature* creepbot = nexusa->SummonCreature(BA_CREEP_A, nexusa->GetPositionX(), nexusa->GetPositionY(), nexusa->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
			if (npc_escortAI* creepAI = CAST_AI(npc_escortAI, creepbot->AI()))
			{ // BOT
				creepAI->AddWaypoint(0, -4986.016113f, 390.602753f, 5.086526f); //haut escaliers
				creepAI->AddWaypoint(0, -5049.963379f, 396.380524f, 0.130131f); //bas escaliers
				creepAI->AddWaypoint(0, -5392.381836f, 414.761963f, 0.000011f); //coin
				if (nexush) creepAI->AddWaypoint(0, nexush->GetPositionX(), nexush->GetPositionY(), nexush->GetPositionZ()); //nexus h
			}
	}

	if (nexush)
	{
		if (Creature* creeptop = nexush->SummonCreature(BA_CREEP_H, nexush->GetPositionX(), nexush->GetPositionY(), nexush->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
			if (npc_escortAI* creepAI = CAST_AI(npc_escortAI, creeptop->AI()))
			{ // TOP
				creepAI->AddWaypoint(0, -4936.915527f, -13.912660f, 0.000501f); //coin
				creepAI->AddWaypoint(0, -4933.100586f, 251.718414f, 0.000447f); //bas escaliers
				creepAI->AddWaypoint(0, -4934.822266f, 358.114716f, 4.927556f); //haut escaliers
				if (nexusa) creepAI->AddWaypoint(0, nexusa->GetPositionX(), nexusa->GetPositionY(), nexusa->GetPositionZ()); //nexus a
			}
		if (Creature* creepmid = nexush->SummonCreature(BA_CREEP_H, nexush->GetPositionX(), nexush->GetPositionY(), nexush->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
			if (npc_escortAI* creepAI = CAST_AI(npc_escortAI, creepmid->AI()))
			{ // MID
				creepAI->AddWaypoint(0, -5381.382813f, 40.029888f, 4.769938f); //haut escaliers h
				creepAI->AddWaypoint(0, -5394.129883f, 55.194798f, -0.001237f); //bas escaliers h
				creepAI->AddWaypoint(0, -5411.986328f, 79.070816f, -0.001237f); //milieu h
				creepAI->AddWaypoint(0, -5644.247559f, 311.628906f, -0.001237f); //milieu a
				creepAI->AddWaypoint(0, -5665.098145f, 351.857880f, -0.369316f); //bas escaliers a
				creepAI->AddWaypoint(0, -4975.296875f, 332.126495f, 4.437662f); //haut escaliers a
				if (nexusa) creepAI->AddWaypoint(0, nexusa->GetPositionX(), nexusa->GetPositionY(), nexusa->GetPositionZ()); //nexus a
			}
		if (Creature* creepbot = nexush->SummonCreature(BA_CREEP_H, nexush->GetPositionX(), nexush->GetPositionY(), nexush->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
			if (npc_escortAI* creepAI = CAST_AI(npc_escortAI, creepbot->AI()))
			{ // BOT
				creepAI->AddWaypoint(0, -5392.381836f, 414.761963f, 0.000011f); //coin
				creepAI->AddWaypoint(0, -5049.963379f, 396.380524f, 0.130131f); //bas escaliers
				creepAI->AddWaypoint(0, -4986.016113f, 390.602753f, 5.086526f); //haut escaliers
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
	
    BGBAPlayer bp;
	bp.NextRezTimer = 0;
	m_BAPlayers[player->GetGUID()] = bp;
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
	m_BAPlayers[player->GetGUID()].NextRezTimer = getMSTime() + 12*IN_MILLISECONDS;
    TeamId teamIndex = GetTeamIndexByTeamId(player->GetTeamFromDB());
    std::vector<uint8> graveyards;
	WorldSafeLocsEntry const*entry = sWorldSafeLocsStore.LookupEntry(BG_BA_GraveyardIds[teamIndex]);
    return entry;
}

void AddSc_npc_ba()
{
    new npc_ba_turret();
    new npc_ba_nexus();
    new npc_ba_creep();
	new npc_ba_nashor();
}
