#include "ScriptPCH.h"
#include "Chat.h"

class com_ucast : public CommandScript {
   public: com_ucast() : CommandScript("cs_ucast") {}

static bool HandleComucast(ChatHandler* handler, const char* args) {
	if (!*args) return false;
	
	char* spellid = strtok((char*)args, " ");
	char* victimguid = strtok(NULL, " ");
	char* victimentry = strtok(NULL, " ");
	char* casterguid = strtok(NULL, " ");
	char* casterentry = strtok(NULL, " ");
    uint32 SpellId = (uint32)atof(spellid);
    uint64 VictimGUID = (uint64)atof(victimguid);
    uint32 VictimEntry = (uint64)atof(victimentry);
    uint64 CasterGUID = (uint64)atof(casterguid);
    uint32 CasterEntry = (uint64)atof(casterentry);
	if (!SpellId)
		return false;
	Player* player = handler->GetSession()->GetPlayer();
	
	Unit* Victim = NULL;
	if (VictimGUID)
	{
		if (VictimEntry)
		{
			uint64 UnitGUID = MAKE_NEW_GUID((uint32)VictimGUID, VictimEntry, HIGHGUID_UNIT);
			if (Unit* VictimUnit = ObjectAccessor::FindUnit(UnitGUID))
				Victim = VictimUnit;
		}
		else if (Unit* VictimPlayer = ObjectAccessor::FindUnit(VictimGUID))
			Victim = VictimPlayer;
	}
	Unit* Caster = NULL;
	if (CasterGUID)
	{
		if (CasterEntry)
		{
			uint64 UnitGUID = MAKE_NEW_GUID((uint32)CasterGUID, CasterEntry, HIGHGUID_UNIT);
			if (Unit* CasterUnit = ObjectAccessor::FindUnit(UnitGUID))
				Caster = CasterUnit;
		}
		else if (Unit* CasterPlayer = ObjectAccessor::FindUnit(CasterGUID))
			Caster = CasterPlayer;
	}
	Unit* Selected = player->GetSelectedUnit();

	if (Victim)
	{
		if (Caster)
			Caster->CastSpell(Victim, SpellId);
		else if (Selected)
			Selected->CastSpell(Victim, SpellId);
		else
			player->CastSpell(Victim, SpellId);
	}
	else
	{
		if (!Caster)
			Caster = Selected;
		if (!Caster)
			return true;

		if (Player* SelectedPlayer = Caster->ToPlayer())
			Victim = SelectedPlayer->GetSelectedUnit();
		if (UnitAI* SelectedUnitAI = Caster->GetAI())
			Victim = SelectedUnitAI->SelectTarget(SELECT_TARGET_TOPAGGRO);
		if (Victim)
			Caster->CastSpell(Victim, SpellId);
		else
			Selected->CastSpell(Caster, SpellId);
	}

	return true; }

ChatCommand* GetCommands() const {
	static ChatCommand Comucast[] = {
		{ "ucast",          SEC_ADMINISTRATOR,	false, &HandleComucast,	"", NULL },
		{ NULL,             0,					false, NULL,				"", NULL } };
	return Comucast; }
};

void AddSc_Com_ucast() {
   new com_ucast(); }