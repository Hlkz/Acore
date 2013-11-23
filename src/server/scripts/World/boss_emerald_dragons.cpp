#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellScript.h"
#include "Spell.h"
#include "SpellAuraEffects.h"
#include "PassiveAI.h"
#include "MapScript.h"

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
    SAY_EMERISS_DIE                    = 2,
    SAY_EMERISS_FOG                    = 3
};

enum Events
{
    EVENT_SEEPING_FOG = 1,
    EVENT_NOXIOUS_BREATH,
    EVENT_TAIL_SWEEP,
    EVENT_CORRUPTION_OF_EARTH,
};

class npc_dream_fog : public CreatureScript
{
    public:
        npc_dream_fog() : CreatureScript("npc_dream_fog") { }

        struct npc_dream_fogAI : public ScriptedAI
        {
            npc_dream_fogAI(Creature* creature) : ScriptedAI(creature), summonerUnit((Unit*)NULL), targetUnit((Unit*)NULL) { }

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
                    if (summonerUnit)
                    {
                        if (Unit* target = summonerUnit->GetAI()->SelectTarget(SELECT_TARGET_RANDOM))
                        {
                            targetUnit = target;
                            _roamTimer = 15000;
                        }
                        else
                            _roamTimer = 5000;
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
            npc_dream_fog_cineAI(Creature* creature) : PassiveAI(creature), _summonerGuid(0) { }

            void IsSummonedBy(Unit* summoner)
            {
                _summonerGuid = summoner->GetGUID();
                me->GetMotionMaster()->MoveFollow(summoner, 0.0f, 0.0f);
            }

            void MovementInform(uint32 moveType, uint32 data)
            {
                if (moveType == FOLLOW_MOTION_TYPE && data == _summonerGuid)
                    me->DespawnOrUnsummon(1000);
            }

        private:
            uint64 _summonerGuid;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_dream_fog_cineAI(creature);
        }
};

class boss_emeriss : public CreatureScript
{
    public:
        boss_emeriss() : CreatureScript("boss_emeriss") { }

        struct boss_emerissAI : public WorldBossAI
        {
            boss_emerissAI(Creature* creature) : WorldBossAI(creature), ini(false) { }
            bool ini;

            void Reset()
            {
                if (sWorld->getWorldState(22301) < 7)
                {
                    WorldBossAI::Reset();
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
                    me->SetReactState(REACT_AGGRESSIVE);
                    events.ScheduleEvent(EVENT_TAIL_SWEEP, 4000);
                    events.ScheduleEvent(EVENT_NOXIOUS_BREATH, 10000);
                    events.ScheduleEvent(EVENT_SEEPING_FOG, urand(12500, 20000));
                    if (!ini)
                    {
                        me->SetByteFlag(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_HOVER);
                        me->SetSpeed(MOVE_FLIGHT, 1.0f);
                        me->setActive(true);
                        me->SetCanFly(true);
                        me->SetDisableGravity(true);
                        me->AddUnitState(UNIT_STATE_IN_FLIGHT);
                        if (WMScript* data = me->GetWMScript())
                            if (Unit* trigger = ObjectAccessor::FindUnit(data->GetData64(1000046)))
                                me->GetMotionMaster()->MoveFollow(trigger, 0.0f, 0.0f);
                        ini = true;
                    }
                }
                else
                {
                    me->SetCanFly(false);
                    me->SetDisableGravity(false);
                    me->RemoveByteFlag(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_HOVER);
                    me->ClearUnitState(UNIT_STATE_IN_FLIGHT);
                }
            }

            void UpdateAI(uint32 diff)
            {
                if (!me->IsInCombat())
                    if (WMScript* data = me->GetWMScript())
                        if (data->GetData(1) == 7)
                            if (me->IsInDist(3167.062988f, -3663.271973f, 121.738525f, 3.0f))
                            {
                                Talk(SAY_EMERISS_AGGRO);
                                data->SetData(2, 8);
                            }

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

            void KilledUnit(Unit* who)
            {
            }

            void EnterCombat(Unit* who)
            {
                WorldBossAI::EnterCombat(who);
            }

            void JustDied(Unit* /*killer*/)
            {
                Talk(SAY_EMERISS_DIE);
                ini = false;
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
                    case EVENT_SEEPING_FOG:
                        DoCast(me, SPELL_SEEPING_FOG_LEFT, true);
                        DoCast(me, SPELL_SEEPING_FOG_RIGHT, true);
                        events.ScheduleEvent(EVENT_SEEPING_FOG, urand(100000, 140000));
                        Talk(SAY_EMERISS_FOG);
                        break;
                    case EVENT_NOXIOUS_BREATH:
                        //DoCast(me, SPELL_NOXIOUS_BREATH);
                        events.ScheduleEvent(EVENT_NOXIOUS_BREATH, 20000);
                        break;
                    case EVENT_TAIL_SWEEP:
                         DoCast(me, SPELL_TAIL_SWEEP);
                        events.ScheduleEvent(EVENT_TAIL_SWEEP, 6000);
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

void AddSC_emerald_dragons()
{
    new npc_dream_fog();
    new npc_dream_fog_cine();
    new boss_emeriss();
};
