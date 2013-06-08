#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellScript.h"
#include "Spell.h"
#include "SpellAuraEffects.h"
#include "PassiveAI.h"

/*enum EmeraldDragonNPC
{
    NPC_DREAM_FOG                   = 15224,
    DRAGON_YSONDRE                  = 14887,
    DRAGON_LETHON                   = 14888,
    DRAGON_EMERISS                  = 14889,
    DRAGON_TAERAR                   = 14890,
};*/

enum EmeraldDragonSpells
{
    SPELL_TAIL_SWEEP                = 15847,    // tail sweep - slap everything behind dragon (2 seconds interval)
    SPELL_SUMMON_PLAYER             = 24776,    // teleport highest threat player in front of dragon if wandering off
    SPELL_DREAM_FOG                 = 24777,    // auraspell for Dream Fog NPC (15224)
    SPELL_SLEEP                     = 24778,    // sleep triggerspell (used for Dream Fog)
    SPELL_SEEPING_FOG_LEFT          = 24813,    // dream fog - summon left
    SPELL_SEEPING_FOG_RIGHT         = 24814,    // dream fog - summon right
    SPELL_NOXIOUS_BREATH            = 24818,
    SPELL_CORRUPTION_OF_EARTH       = 24910,
};

enum EmerissTexts
{
    SAY_EMERISS_AGGRO               = 0,
    SAY_EMERISS_CAST_CORRUPTION     = 1,
    SAY_EMERISS_DIE					= 2,
    SAY_EMERISS_FOG					= 3
};

//
// Emerald Dragon Eventlists (shared and specials)
//

enum Events
{
    // General events for all dragons
    EVENT_SEEPING_FOG = 1,
    EVENT_NOXIOUS_BREATH,
    EVENT_TAIL_SWEEP,

    // Emeriss
    EVENT_CORRUPTION_OF_EARTH,
};

/*
 * ---
 * --- Emerald Dragons : Base AI-structure used for all the Emerald dragons
 * ---
 */

struct emerald_dragonAI : public WorldBossAI
{
    emerald_dragonAI(Creature* creature) : WorldBossAI(creature)
    {
    }

    void Reset()
    {
        WorldBossAI::Reset();
        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
        me->SetReactState(REACT_AGGRESSIVE);
        events.ScheduleEvent(EVENT_TAIL_SWEEP, 4000);
        events.ScheduleEvent(EVENT_NOXIOUS_BREATH, 10000);
        events.ScheduleEvent(EVENT_SEEPING_FOG, urand(12500, 20000));
    }

    // Target killed during encounter, mark them as suspectible for Aura Of Nature
    void KilledUnit(Unit* who)
    {
        //if (who->GetTypeId() == TYPEID_PLAYER)
        //    who->CastSpell(who, SPELL_MARK_OF_NATURE, true);
    }

    // Execute and reschedule base events shared between all Emerald Dragons
    void ExecuteEvent(uint32 eventId)
    {
        switch (eventId)
        {
            case EVENT_SEEPING_FOG:
                // Seeping Fog appears only as "pairs", and only ONE pair at any given time!
                // Despawntime is 2 minutes, so reschedule it for new cast after 2 minutes + a minor "random time" (30 seconds at max)
                DoCast(me, SPELL_SEEPING_FOG_LEFT, true);
                DoCast(me, SPELL_SEEPING_FOG_RIGHT, true);
                events.ScheduleEvent(EVENT_SEEPING_FOG, urand(100000, 140000));
				Talk(SAY_EMERISS_FOG);
                break;
            case EVENT_NOXIOUS_BREATH:
                // Noxious Breath is cast on random intervals, no less than 7.5 seconds between
                DoCast(me, SPELL_NOXIOUS_BREATH);
                events.ScheduleEvent(EVENT_NOXIOUS_BREATH, 20000);
                break;
            case EVENT_TAIL_SWEEP:
                // Tail Sweep is cast every two seconds, no matter what goes on in front of the dragon
                DoCast(me, SPELL_TAIL_SWEEP);
                events.ScheduleEvent(EVENT_TAIL_SWEEP, 6000);
                break;
        }
    }

    void UpdateAI(uint32 diff)
    {
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->HasUnitState(UNIT_STATE_CASTING))
            return;

        while (uint32 eventId = events.ExecuteEvent())
            ExecuteEvent(eventId);

        if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO, 0, -50.0f, true))
            DoCast(target, SPELL_SUMMON_PLAYER);

        DoMeleeAttackIfReady();
    }
};

/*
 * --- NPC: Dream Fog
 */
class npc_dream_fog : public CreatureScript
{
    public:
        npc_dream_fog() : CreatureScript("npc_dream_fog") { }

        struct npc_dream_fogAI : public ScriptedAI
        {
            npc_dream_fogAI(Creature* creature) : ScriptedAI(creature), summonerUnit((Unit*)NULL), targetUnit((Unit*)NULL)
            {
            }
			
            void IsSummonedBy(Unit* summoner)
            {
				summonerUnit = summoner;
            }

            void Reset()
            {
                _roamTimer = 0;
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                if (_roamTimer <= diff)
                {
                    // Chase target, but don't attack - otherwise just roam around
					if (summonerUnit)
					{
						if (Unit* target = summonerUnit->GetAI()->SelectTarget(SELECT_TARGET_RANDOM))
						{
							targetUnit = target;
						    _roamTimer = 15000;
						}
						else
						{
							sLog->outError(LOG_FILTER_GENERAL, "WB dragon error : dreamfog cant find any target");
						    _roamTimer = 5000;
						}
					}
                    me->GetMotionMaster()->Clear(false);
					me->GetMotionMaster()->MoveChase(targetUnit, 0.2f);
                    me->SetWalk(true);
                    me->SetSpeed(MOVE_WALK, 0.75f);
                }
                else
				{
                    _roamTimer -= diff;
					if (targetUnit->IsInRange(me, 0.0f, 1.0f, false))
						_roamTimer = 1000;
				}
            }

        private:
            uint32 _roamTimer;
			Unit* summonerUnit;
			Unit* targetUnit;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_dream_fogAI(creature);
        }
};

class npc_dream_fog_cine : public CreatureScript
{
    public:
        npc_dream_fog_cine() : CreatureScript("npc_dream_fog_cine") { }

        struct npc_dream_fog_cineAI : public PassiveAI
        {
            npc_dream_fog_cineAI(Creature* creature) : PassiveAI(creature), _summonerGuid(0)
            {
            }

            void IsSummonedBy(Unit* summoner)
            {
                _summonerGuid = summoner->GetGUID();
                me->GetMotionMaster()->MoveFollow(summoner, 0.0f, 0.0f);
            }

            void MovementInform(uint32 moveType, uint32 data)
            {
                if (moveType == FOLLOW_MOTION_TYPE && data == _summonerGuid)
                {
                    me->DespawnOrUnsummon(1000);
                }
            }

        private:
            uint64 _summonerGuid;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_dream_fog_cineAI(creature);
        }
};

/*
 * ---
 * --- Dragonspecific scripts and handling: EMERISS
 * ---
 */

class boss_emeriss : public CreatureScript
{
    public:
        boss_emeriss() : CreatureScript("boss_emeriss") { }

        struct boss_emerissAI : public emerald_dragonAI
        {
            boss_emerissAI(Creature* creature) : emerald_dragonAI(creature)
            {
            }

            void Reset()
            {
                _stage = 1;
                emerald_dragonAI::Reset();
            }

            void KilledUnit(Unit* who)
            {
                emerald_dragonAI::KilledUnit(who);
            }

            void EnterCombat(Unit* who)
			{
                Talk(SAY_EMERISS_AGGRO);
                WorldBossAI::EnterCombat(who);
            }

			void JustDied(Unit* /*killer*/)
			{
				Talk(SAY_EMERISS_DIE);
			}

            void DamageTaken(Unit* /*attacker*/, uint32& /*damage*/)
            {
                if (!HealthAbovePct(100 - 25 * _stage))
                {
                    Talk(SAY_EMERISS_CAST_CORRUPTION);
                    DoCast(me, SPELL_CORRUPTION_OF_EARTH, true);
                    ++_stage;
                }
            }

            void ExecuteEvent(uint32 eventId)
            {
                switch (eventId)
                {
					case 0:
                    default:
                        emerald_dragonAI::ExecuteEvent(eventId);
                        break;
                }
            }

        private:
            uint8 _stage;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new boss_emerissAI(creature);
        }
};


/*
 * --- Spell: Dream Fog
 */

class spell_dream_fog_sleep : public SpellScriptLoader
{
    public:
        spell_dream_fog_sleep() : SpellScriptLoader("spell_dream_fog_sleep") { }

        class spell_dream_fog_sleep_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_dream_fog_sleep_SpellScript);
			
            void Register()
            {}
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_dream_fog_sleep_SpellScript();
        }
};



void AddSC_emerald_dragons()
{
    // helper NPC scripts
    new npc_dream_fog();
    new npc_dream_fog_cine();

    // dragons
    new boss_emeriss();

    // dragon spellscripts
    new spell_dream_fog_sleep();
};
