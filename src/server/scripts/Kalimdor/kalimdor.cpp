#include "kalimdor.h"
#include "ScriptedEscortAI.h"

class npc_webo_emeraldtrash : public CreatureScript
{
public:
    npc_webo_emeraldtrash() : CreatureScript("npc_webo_emeraldtrash") { }

    struct npc_webo_emeraldtrashAI : public npc_escortAI
    {
        npc_webo_emeraldtrashAI(Creature* creature) : npc_escortAI(creature)
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
        return new npc_webo_emeraldtrashAI(creature);
    }
};

class npc_webo_emeraldfix : public CreatureScript
{
public:
    npc_webo_emeraldfix() : CreatureScript("npc_webo_emeraldfix") { }

    struct npc_webo_emeraldfixAI : public CreatureAI
    {
        npc_webo_emeraldfixAI(Creature* creature) : CreatureAI(creature), node(0) { }
		uint32 node;

		void UpdateAI(uint32 diff)
		{
            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
		}
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_webo_emeraldfixAI(creature);
    }
};

class npc_webo_emeraldportal : public CreatureScript
{
public:
    npc_webo_emeraldportal() : CreatureScript("npc_webo_emeraldportal") { }

    struct npc_webo_emeraldportalAI : public CreatureAI
    {
        npc_webo_emeraldportalAI(Creature* creature) : CreatureAI(creature), phasetimer(0), phasestate(0) { }
		int32 phasetimer; uint32 phasestate;

        void UpdateAI(uint32 diff)
        {
            phasetimer-=diff;
            if (phasetimer < 0)
            {
                phasetimer = 4000;
                phasestate = sWorld->getWorldState(WS_BO_PHASE);
            }
            if (phasestate < 9)
                return;

            Map* map = me->GetMap();
            Map::PlayerList const &PlayerList = map->GetPlayers();
            if (!PlayerList.isEmpty())
                for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                    if (Player* player = i->GetSource())
                        if (player->IsInRange(me, 0.0f, 3.0f, false))
                            player->TeleportTo(782, -5375.187012f, 230.771652f, 52.250080f, 3.632217f);
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_webo_emeraldportalAI(creature);
    }
};

class npc_webo_step : public CreatureScript
{
public:
    npc_webo_step() : CreatureScript("npc_webo_step") { }

    struct npc_webo_stepAI : public CreatureAI
    {
        npc_webo_stepAI(Creature* creature) : CreatureAI(creature), step(0) { }
        uint32 step;

        void UpdateAI(uint32 diff)
        {
            if (mapevent_kalimdor::mapevent_kalimdor_WMS* wm = static_cast<mapevent_kalimdor::mapevent_kalimdor_WMS*>(me->GetWMScript()))
            {
				if (wm->GetData(1) < step+4)
                    if (Unit* u = ObjectAccessor::FindUnit(wm->GetData64(WE_BO_NPC_NEUTRAL)))
                        if (u->IsInRange(me, 0.0f, 5.0f, false))
                            wm->ChangePhase(step+4);
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_webo_stepAI(creature);
    }
};

class npc_webo_neutralguard : public CreatureScript
{
public:
    npc_webo_neutralguard() : CreatureScript("npc_webo_neutralguard") { }

    struct npc_webo_neutralguardAI : public npc_escortAI
    {
        npc_webo_neutralguardAI(Creature* creature) : npc_escortAI(creature) { }

		void UpdateAI(uint32 diff)
		{
            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
		}
        void WaypointReached(uint32 pointId) {}
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_webo_neutralguardAI(creature);
    }
};

class npc_webo_neutral : public CreatureScript
{
public:
    npc_webo_neutral() : CreatureScript("npc_webo_neutral") { }

    bool OnGossipHello(Player *player, Creature * creature)
    {
        if (creature->IsInCombat())
            return true;
        if (sWorld->getWorldState(WS_BO_PHASE) > 6)
            return true;
        creature->HasQuestForPlayer(player);
        player->ADD_GOSSIP_ITEM(0, "Avancer", GOSSIP_SENDER_MAIN, 4);
        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }
	
	bool OnGossipSelect(Player *player, Creature * creature, uint32 sender, uint32 action)
	{
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
            case 4:
                uint32 step = sWorld->getWorldState(WS_BO_PHASE)-3;
                creature->GetMotionMaster()->MovePoint(step+1, WEBO_Steps_Positions[step][0], WEBO_Steps_Positions[step][1], WEBO_Steps_Positions[step][2]);
                break;
        }
        return true;
    }
};

void mapevent_kalimdor::mapevent_kalimdor_WMS::Initialize()
{
    wave_mobs = 0;
    wave_timer = 0;
    patrol_timer = 0;
    portal_guid = 0;
    emeriss_guid = 0;
    trigger_guid = 0;
    neutral_guid = 0;
    sWorld->setWorldState(WS_BO_PHASE, 3);
    phase = 3;
    node_mobs = sWorld->getWorldState(WS_BO_NODE_MOBS);
    for (uint32 i = 0; i < WE_BO_MAX_NODES; ++i)
    {
        WEBONodes* node = new WEBONodes;
        node->phase = WEBO_Nodes[i][3];
        Position p = {WEBO_Nodes[i][0],WEBO_Nodes[i][1],WEBO_Nodes[i][2]};
        node->pos = p;
        node->count = 0;
        nodes[i] = node;
    }
    AddCreature(WE_BO_NPC_NEUTRAL, 2986.934082f, -3346.240967f, 151.467896f, 5.638025f);
    for (uint32 i = 0; i < WE_BO_MAX_STEPS; ++i)
        if (Creature* cr = AddCreature(WE_BO_NPC_STEP, WEBO_Steps_Positions[i][0], WEBO_Steps_Positions[i][1], WEBO_Steps_Positions[i][2], 0))
            if (npc_webo_step::npc_webo_stepAI* crAI = CAST_AI(npc_webo_step::npc_webo_stepAI, cr->AI()))
            crAI->step = i;
}

void  mapevent_kalimdor::mapevent_kalimdor_WMS::Update(uint32 diff)
{
    wave_timer -= diff;
    if (wave_timer < 0)
    {
        --wave_mobs;
        uint32 entry = WE_BO_NPC_EMERALD_GUARD_ELITE + urand(0, 2);
        if (Unit* portal = ObjectAccessor::FindUnit(portal_guid))
            if (Creature* mob = portal->SummonCreature(entry, portal->GetPositionX(), portal->GetPositionY(), portal->GetPositionZ(), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 60000))
                if (npc_escortAI* mobAI = CAST_AI(npc_escortAI, mob->AI()))
                {
					mobAI->AddWaypoint(0, 3201.968262f, -3716.672119f, 122.573830f);
					mobAI->AddWaypoint(0, 3182.630859f, -3706.736328f, 122.087433f);
					mobAI->AddWaypoint(0, 3172.587158f, -3688.447510f, 121.302536f);
					mobAI->AddWaypoint(0, 3184.498535f, -3641.968994f, 124.166412f);
					mobAI->AddWaypoint(0, 3180.952637f, -3585.428467f, 131.683304f);
					mobAI->AddWaypoint(0, 3137.673584f, -3474.331055f, 136.379974f);
					mobAI->AddWaypoint(0, 3095.748291f, -3418.673340f, 139.533447f);
					mobAI->AddWaypoint(0, 3057.762695f, -3394.676758f, 142.550156f);
					mobAI->AddWaypoint(0, 3016.924072f, -3361.996094f, 147.584961f);
					mobAI->AddWaypoint(0, 2986.210449f, -3334.336914f, 151.338928f);
					mobAI->AddWaypoint(0, 2942.978760f, -3271.750000f, 157.688599f);
					mobAI->AddWaypoint(0, 2913.917969f, -3270.948242f, 160.036575f);
				}

		if (wave_mobs < 0)
		{
			wave_mobs = sWorld->getWorldState(WS_BO_WAVE_MOBS);
			wave_timer = urand(8000, 12000);
		}
		else
			wave_timer = urand(400, 800);
	}

	for (WEBONodesMap::iterator itr = nodes.begin(); itr != nodes.end(); ++itr)
	{
		if (itr->second->phase > phase)
		{
            if (itr->second->count < node_mobs)
            {
                uint32 entry = WE_BO_NPC_EMERALD_GUARD + urand(0, 2);
                if (Unit* portal = ObjectAccessor::FindUnit(portal_guid))
                {
                    float x = itr->second->pos.GetPositionX()+irand(-10,10);
                    float y = itr->second->pos.GetPositionY()+irand(-10,10);
                    float z = itr->second->pos.GetPositionZ();
                    if (Creature* mob = portal->SummonCreature(entry, x, y, portal->GetMap()->GetHeight(x, y, z), frand(0,6), TEMPSUMMON_CORPSE_TIMED_DESPAWN, sWorld->getWorldState(WS_BO_NODE_RESPAWN)))
                    	if (npc_webo_emeraldfix::npc_webo_emeraldfixAI* mobAI = CAST_AI(npc_webo_emeraldfix::npc_webo_emeraldfixAI, mob->AI()))
                    	{
                            itr->second->count++;
                            mobAI->node = itr->first;
                        }
                }
            }
        }
    }

	patrol_timer--;
	if (patrol_timer < 0)
	{
		if (Unit* neutral = ObjectAccessor::FindUnit(neutral_guid))
		{
			uint32 entry = WE_BO_NPC_NEUTRAL_GUARD + urand(0, 2);
            if (Creature* guard = neutral->SummonCreature(entry, 2918.084961f, -3270.776855f, 160.036469f, 0.017537f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 60000))
                if (npc_escortAI* guardAI = CAST_AI(npc_escortAI, guard->AI()))
                {
					guardAI->AddWaypoint(0, 2913.917969f, -3270.948242f, 160.036575f);
					guardAI->AddWaypoint(0, 2942.978760f, -3271.750000f, 157.688599f);
					guardAI->AddWaypoint(0, 2986.210449f, -3334.336914f, 151.338928f);
					guardAI->AddWaypoint(0, 3016.924072f, -3361.996094f, 147.584961f);
					guardAI->AddWaypoint(0, 3057.762695f, -3394.676758f, 142.550156f);
					guardAI->AddWaypoint(0, 3095.748291f, -3418.673340f, 139.533447f);
					guardAI->AddWaypoint(0, 3137.673584f, -3474.331055f, 136.379974f);
					guardAI->AddWaypoint(0, 3180.952637f, -3585.428467f, 131.683304f);
					guardAI->AddWaypoint(0, 3184.498535f, -3641.968994f, 124.166412f);
					guardAI->AddWaypoint(0, 3172.587158f, -3688.447510f, 121.302536f);
					guardAI->AddWaypoint(0, 3182.630859f, -3706.736328f, 122.087433f);
					guardAI->AddWaypoint(0, 3201.968262f, -3716.672119f, 122.573830f);
				}
		}
		patrol_timer = sWorld->getWorldState(WS_BO_PATROL_TIME);
	}
}

void  mapevent_kalimdor::mapevent_kalimdor_WMS::OnCreatureCreate(Creature* creature)
{
    switch (creature->GetEntry())
    {
        case WE_BO_NPC_EMERALD_PORTAL:
			portal_guid = creature->GetGUID();
            break;
        case WE_BO_NPC_EMERISS:
			emeriss_guid = creature->GetGUID();
            break;
        case WE_BO_NPC_BOSS_TRIGGER:
			trigger_guid = creature->GetGUID();
            break;
        case WE_BO_NPC_NEUTRAL:
			neutral_guid = creature->GetGUID();
            break;
    }
}

void  mapevent_kalimdor::mapevent_kalimdor_WMS::OnCreatureRemove(Creature* creature)
{
    switch (creature->GetEntry())
    {
        case WE_BO_NPC_EMERALD_GUARD:
        case WE_BO_NPC_EMERALD_SYLV:
        case WE_BO_NPC_EMERALD_ORACLE:
            if (npc_webo_emeraldfix::npc_webo_emeraldfixAI* mobAI = CAST_AI(npc_webo_emeraldfix::npc_webo_emeraldfixAI, creature->AI()))
				nodes[mobAI->node]->count--;
            break;
        case WE_BO_NPC_EMERALD_PORTAL:
            portal_guid = 0;
            break;
        case WE_BO_NPC_EMERISS:
            emeriss_guid = 0;
            break;
        case WE_BO_NPC_BOSS_TRIGGER:
            trigger_guid = 0;
            break;
    }
}

void  mapevent_kalimdor::mapevent_kalimdor_WMS::SetData(uint32 type, uint32 data)
{
    switch (type)
    {
        case 1: {
			WEBONodesMap::iterator itr = nodes.find(data);
			if (itr != nodes.end())
				itr->second->count--;
			break; }
		case 2:
			ChangePhase(data);
			break;
    }
}

uint64 mapevent_kalimdor::mapevent_kalimdor_WMS::GetData64(uint32 data) const
{
    switch (data)
    {
        case WE_BO_NPC_NEUTRAL:
            return neutral_guid;
            break;
        case WE_BO_NPC_BOSS_TRIGGER:
            return trigger_guid;
            break;
    }
	return 0;
}

uint32 mapevent_kalimdor::mapevent_kalimdor_WMS::GetData(uint32 data) const
{
    switch (data)
    {
        case 1:
            return phase;
            break;
    }
	return 0;
}

void mapevent_kalimdor::mapevent_kalimdor_WMS::ChangePhase(uint32 newphase)
{
	TC_LOG_ERROR(LOG_FILTER_GENERAL, "CHANGEPHASE %u", newphase);
    sWorld->setWorldState(WS_BO_PHASE, newphase);
    phase = newphase;
    switch (phase)
    {
        case WS_BO_PHASE_BOSS:
            if (Unit* emeriss = ObjectAccessor::FindUnit(emeriss_guid))
                emeriss->GetMotionMaster()->MoveJump(3167.062988f, -3663.271973f, 121.738525f, 10.0f, 20.0f);
            break;
        case WS_BO_PHASE_BOSS_GROUND:
            if (Unit* emeriss = ObjectAccessor::FindUnit(emeriss_guid))
            {
                emeriss->SetCanFly(false);
                emeriss->SetDisableGravity(false);
                emeriss->RemoveByteFlag(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_HOVER);
                emeriss->ClearUnitState(UNIT_STATE_IN_FLIGHT);
            }
            break;
    }
}

void AddSC_mapevent_kalimdor()
{
    new npc_webo_emeraldtrash();
    new npc_webo_emeraldfix();
    new npc_webo_emeraldportal();
    new npc_webo_step();
    new npc_webo_neutralguard();
    new npc_webo_neutral();
    new mapevent_kalimdor();
}
