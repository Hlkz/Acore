#include "ScriptPCH.h"
#include "Chat.h"
#include "ObjectGuid.h"

class ucast_commandscript : public CommandScript
{
public:
    ucast_commandscript() : CommandScript("ucast_commandscript") { }

    ChatCommand* GetCommands() const
    {
        static ChatCommand commandTable[] =
        {
            { "ucast",          SEC_ADMINISTRATOR, false,  &HandleUCastCommand, "", NULL },
            { NULL,             0,                 false,  NULL,                "", NULL }
        };
        return commandTable;
    }

    static bool HandleUCastCommand(ChatHandler* handler, const char* args)
    {
        if (!*args)
            return false;
        char* spellid = strtok((char*)args, " ");
        char* victimguid = strtok(NULL, " ");
        char* victimentry = strtok(NULL, " ");
        char* casterguid = strtok(NULL, " ");
        char* casterentry = strtok(NULL, " ");
        uint32 SpellId = (uint32)atof(spellid);
        ObjectGuid VictimGUID((uint64)atof(victimguid));
        uint32 VictimEntry = (uint64)atof(victimentry);
        ObjectGuid CasterGUID((uint64)atof(casterguid));
        uint32 CasterEntry = (uint64)atof(casterentry);
        if (!SpellId)
            return false;
        Player* player = handler->GetSession()->GetPlayer();
        Unit* Victim = NULL;
        if (VictimGUID)
        {
            if (VictimEntry)
            {
                ObjectGuid UnitGUID(HIGHGUID_UNIT, VictimEntry, VictimGUID.GetEntry());
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
                ObjectGuid UnitGUID(HIGHGUID_UNIT, CasterEntry, CasterGUID.GetEntry());
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
        return true;
    }
};

void AddSC_ucast_commandscript()
{
   new ucast_commandscript();
}
