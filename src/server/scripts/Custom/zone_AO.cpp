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
#include "BattlegroundAO.h"

enum Spells
{
    // azsharin
    SPELL_BLADESTORM    = 46924,
    SPELL_MORTAL_STRIKE = 12294,
    SPELL_SUNDER_ARMOR  = 7386
};

enum Events
{
    // azsharing
    EVENT_BLADESTORM    = 1,
    EVENT_MORTAL_STRIKE = 2,
    EVENT_SUNDER_ARMOR  = 3
};

enum CreaturesIds
{
    NPC_AZSHARIN    = 50000
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

        void UpdateAI(const uint32 diff)
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

void AddSC_zone_AO()
{
    new npc_azsharin();
}