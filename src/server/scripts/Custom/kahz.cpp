#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"

enum Spells {
	SPELL_BREATH		= 20712, // 900/solo
	SPELL_AOE			= 38728, // 1k/solo
	SPELL_FEAR			= 42220, // fear
	SPELL_FURY_STACK	= 66721, // 5%dgt
	SPELL_JUSTICE		= 25169, // visuel
	SPELL_ENRAGE		= 45111 // visuel+buff
};

class kahz : public CreatureScript {
    public: kahz() : CreatureScript("kahz") {}
        struct kahzAI : public BossAI {
            kahzAI(Creature* creature) : BossAI(creature, creature->GetGUID()) {}

uint32 Phase; uint32 Auto_Timer; uint32 Auto2_Timer;
uint32 Breath_Timer; uint32 Aoe_Timer; uint32 Flamme_Timer; uint32 Fear_Timer;

void KilledUnit(Unit *) {
    me->InterruptNonMeleeSpells(true);
	me->MonsterYell("Faiblit ! Offrez vous à moi !", LANG_DRACONIC, NULL);
	DoCast(me, SPELL_FURY_STACK);
	DoCast(me, SPELL_FURY_STACK); }

void JustDied(Unit *) {
	me->MonsterYell("I-Ils arrivent, ils vous achèveront... Garrr !", LANG_DRACONIC, NULL); }
	
void EnterCombat(Unit* victim) {
	BossAI::EnterCombat(victim);
	me->MonsterYell("Que peuvent faire ces insectes sur mon chemin ?", LANG_DRACONIC, NULL);
	Phase = 1;
	Auto_Timer = 4000; Auto2_Timer = 6000;
	Breath_Timer = 2000; Aoe_Timer = 8000; Fear_Timer = 16000; }

void UpdateAI(const uint32 diff)
{
	if (!UpdateVictim())
		return;
	events.Update(diff);

	if (me->HasUnitState(UNIT_STATE_CASTING))
		return;
    
	if ((Phase == 1) && (!HealthAbovePct(75))) {
	me->MonsterYell("Moucherons ! Vous n'êtes rien !", LANG_DRACONIC, NULL);
    me->InterruptNonMeleeSpells(true);
	DoCast(me, SPELL_FURY_STACK); DoCast(me, SPELL_FURY_STACK);
	Phase = 2;
	Auto_Timer = 4000; Auto2_Timer = 6000;
	Breath_Timer = 2000; Aoe_Timer = 8000; Fear_Timer = 16000; }
	
	if ((Phase == 2) && (!HealthAbovePct(50))) {
	me->MonsterYell("Brûlez ! Sentez vos coeurs s'assécher !", LANG_DRACONIC, NULL);
    me->InterruptNonMeleeSpells(true);
	DoCast(me, SPELL_FURY_STACK); DoCast(me, SPELL_FURY_STACK);
	DoCast(me, SPELL_JUSTICE);
	Phase = 3;
	Auto_Timer = 4000; Auto2_Timer = 6000;
	Breath_Timer = 2000; Aoe_Timer = 8000; Fear_Timer = 12000; }

	if ((Phase == 3) && (!HealthAbovePct(25))) {
	me->MonsterYell("C'est trop ! Laissez vous massacrer !", LANG_DRACONIC, NULL);
    me->InterruptNonMeleeSpells(true);
	DoCast(me, SPELL_FURY_STACK); DoCast(me, SPELL_FURY_STACK);
	DoCast(me, SPELL_ENRAGE);
	Phase = 4;
	Auto_Timer = 4000; Auto2_Timer = 6000;
	Breath_Timer = 2000; Aoe_Timer = 8000; Fear_Timer = 8000; }
	
		if(Auto_Timer <= diff) {
			DoMeleeAttackIfReady();  Auto_Timer = 6000; }
		else Auto_Timer -= diff;
		if(Auto2_Timer <= diff) {
			DoMeleeAttackIfReady();  Auto2_Timer = 6000; }
		else Auto2_Timer -= diff;
		
		if(Breath_Timer <= diff) {
			DoCast(me, SPELL_BREATH);
			Breath_Timer = 12000; }
		else Breath_Timer -= diff;
		
		if(Aoe_Timer <= diff) {
			DoCast(me, SPELL_AOE);
			Aoe_Timer = 12000; }
		else Aoe_Timer -= diff;
		
		if(Fear_Timer <= diff) {
			if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
				target->CastSpell(target, SPELL_FEAR);
			if (Phase >=2) Flamme_Timer = 6000;
			if (Phase >=3) { if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true)) target->CastSpell(target, SPELL_FEAR); }
			if (Phase <= 2) Fear_Timer = 18000;
			if (Phase == 3) Fear_Timer = 14000;
			if (Phase == 4) Fear_Timer = 10000;}
		else Fear_Timer -= diff;
		
	if (Phase >= 2) {
		if(Flamme_Timer <= diff) {
			if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
				me->SummonGameObject(177704, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), 0.0f, 0.0f, 0.0f, 0.0f, 600);
		Flamme_Timer = 20000; }
		else Flamme_Timer -= diff; }
	}
};

CreatureAI* GetAI(Creature* creature) const {
return new kahzAI (creature); }
};

void AddSC_kahz() { new kahz(); }