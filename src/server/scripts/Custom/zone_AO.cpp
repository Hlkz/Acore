/*
 * Copyright (C) 2008-2013 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "World.h"
#include "PetAI.h"
#include "PassiveAI.h"
#include "CombatAI.h"
#include "GameEventMgr.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Cell.h"
#include "CellImpl.h"
#include "SpellAuras.h"
#include "Pet.h"
#include "MapManager.h"
#include "Map.h"
#include "Battleground.h"

enum Spells
{
    // azsharin
    SPELL_BLADESTORM    = 46924,
    SPELL_MORTAL_STRIKE = 12294,
    SPELL_SUNDER_ARMOR  = 7386,

    // Horde Boss
    SPELL_SUMMON_WOLFS  = 51533,

    // Alliance Boss
    SPELL_SUMMON_WATER  = 31687,
    SPELL_FROSTBOLT      = 116,
    SPELL_NOVA          = 122,
    SPELL_CONGEL        = 44572,
    SPELL_IB            = 45438
};

enum Events
{
    // azsharing
    EVENT_BLADESTORM    = 1,
    EVENT_MORTAL_STRIKE = 2,
    EVENT_SUNDER_ARMOR  = 3,

    // Horde Boss
    EVENT_SUMMON_WOLFS  = 4,
    
    // Alliance Boss
    EVENT_FROSTBOLT     = 5,
    EVENT_NOVA          = 6,
    EVENT_CONGEL        = 7,
    EVENT_SUMMON_WATER  = 8
};

enum CreaturesIds
{
    NPC_AZSHARIN    = 100010, // Boss du temple
    NPC_NOGLAK      = 100020 // boss de la Horde
    //boss de l'alliance pas encore implanté
};

enum TextsAzsharin
{
};

class npc_azsharin : public CreatureScript
{
public:
    npc_azsharin() : CreatureScript("npc_azsharin") { }

    struct npc_azsharinAI : public ScriptedAI
    {
        npc_azsharinAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset()
        {
            events.Reset();
            me->setFaction(14); // Find way to link node and creature...
        }

        void EnterCombat(Unit* target)
        {
            events.ScheduleEvent(EVENT_BLADESTORM, 30000);
            events.ScheduleEvent(EVENT_MORTAL_STRIKE, 6000);
            events.ScheduleEvent(EVENT_SUNDER_ARMOR, 3000);
        }

        void UpdateAI(uint32 diff)
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_BLADESTORM:
                            DoCast(me, SPELL_BLADESTORM);
                            events.ScheduleEvent(EVENT_BLADESTORM, 30000);
                            break;
                        case EVENT_MORTAL_STRIKE:
                            DoCast(me, SPELL_MORTAL_STRIKE);
                            events.ScheduleEvent(EVENT_MORTAL_STRIKE, 6000);
                            break;
                        case EVENT_SUNDER_ARMOR:
                            DoCast(me, SPELL_SUNDER_ARMOR);
                            events.ScheduleEvent(EVENT_SUNDER_ARMOR, 3000);
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
        }

        void JustDied(Unit* killer)
        {
            Map* map = me->GetMap();
            for (Map::PlayerList::const_iterator itr = map->GetPlayers().begin(); itr != map->GetPlayers().end(); ++itr)
            {
                if (Player* player = itr->getSource())
                {
                    if (killer->ToPlayer()->GetTeam() == player->GetTeam())
                        player->ModifyHonorPoints(8000);
                }
            }
        }

        private:
            EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_azsharinAI(creature);
    }
};

class npc_hordeboss : public CreatureScript
{
public:
    npc_hordeboss() : CreatureScript("npc_hordeboss") { }

    struct npc_hordebossAI : public ScriptedAI
    {
        npc_hordebossAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset()
        {
            events.Reset();
            me->setFaction(1735);
        }

        void EnterCombat(Unit* target)
        {
            events.ScheduleEvent(EVENT_BLADESTORM, 30000);
            events.ScheduleEvent(EVENT_MORTAL_STRIKE, 6000);
            events.ScheduleEvent(EVENT_SUNDER_ARMOR, 3000);
            events.ScheduleEvent(EVENT_SUMMON_WOLFS, 60000);
        }

        void UpdateAI(uint32 diff)
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_BLADESTORM:
                            DoCast(me, SPELL_BLADESTORM);
                            events.ScheduleEvent(EVENT_BLADESTORM, 30000);
                            break;
                        case EVENT_MORTAL_STRIKE:
                            DoCast(me, SPELL_MORTAL_STRIKE);
                            events.ScheduleEvent(EVENT_MORTAL_STRIKE, 6000);
                            break;
                        case EVENT_SUNDER_ARMOR:
                            DoCast(me, SPELL_SUNDER_ARMOR);
                            events.ScheduleEvent(EVENT_SUNDER_ARMOR, 3000);
                            break;
                        case EVENT_SUMMON_WOLFS:
                            DoCast(me, SPELL_SUMMON_WOLFS);
                            events.ScheduleEvent(EVENT_SUMMON_WOLFS, 60000);
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
        }

        void JustDied(Unit* killer)
        {
            Map* map = me->GetMap();
            for (Map::PlayerList::const_iterator itr = map->GetPlayers().begin(); itr != map->GetPlayers().end(); ++itr)
            {
                if (Player* player = itr->getSource())
                {
                    if (killer->ToPlayer()->GetTeam() == player->GetTeam())
                    {
                        player->ModifyHonorPoints(10000);
                        player->ModifyArenaPoints(20);
                    }

                }
            }
        }

        private:
            EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_hordebossAI(creature);
    }
};

class npc_allianceboss : public CreatureScript
{
public:
    npc_allianceboss() : CreatureScript("npc_allianceboss") { }

    struct npc_alliancebossAI : public ScriptedAI
    {
        npc_alliancebossAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset()
        {
            events.Reset();
            me->setFaction(1732);
        }

        void DamageTaken(Unit* /*attacker*/, uint32& /*damage*/)
        {
            if (!HealthAbovePct(30))
            {
                DoCast(me, SPELL_IB);
                DoCast(me, SPELL_SUMMON_WATER);
                DoCast(me, SPELL_SUMMON_WATER);
                events.ScheduleEvent(EVENT_SUMMON_WATER, 30000);
            }
        }
        void EnterCombat(Unit* target)
        {
            events.ScheduleEvent(EVENT_FROSTBOLT, 5000);
            events.ScheduleEvent(EVENT_NOVA, 20000);
            events.ScheduleEvent(EVENT_CONGEL, 20001);
        }

        void UpdateAI(uint32 diff)
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_FROSTBOLT:
                            DoCast(me, SPELL_FROSTBOLT);
                            events.ScheduleEvent(EVENT_FROSTBOLT, 5000);
                            break;
                        case EVENT_NOVA:
                            DoCast(me, SPELL_NOVA);
                            events.ScheduleEvent(EVENT_NOVA, 20000);
                            break;
                        case EVENT_CONGEL:
                                DoCast(me, SPELL_CONGEL, true);
                                events.ScheduleEvent(EVENT_CONGEL, 20001);
                            break;
                        case EVENT_SUMMON_WATER:
                            DoCast(me, SPELL_SUMMON_WATER);
                            DoCast(me, SPELL_SUMMON_WATER);
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
        }

        void JustDied(Unit* killer)
        {
            Map* map = me->GetMap();
            for (Map::PlayerList::const_iterator itr = map->GetPlayers().begin(); itr != map->GetPlayers().end(); ++itr)
            {
                if (Player* player = itr->getSource())
                {
                    if (killer->ToPlayer()->GetTeam() == player->GetTeam())
                    {
                        player->ModifyHonorPoints(10000);
                        player->ModifyArenaPoints(20);
                    }

                }
            }
        }

        private:
            EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_alliancebossAI(creature);
    }
};

void AddSC_zone_AO()
{
    new npc_azsharin();
    new npc_hordeboss();
    new npc_allianceboss();
}