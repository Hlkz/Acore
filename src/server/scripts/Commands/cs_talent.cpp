#include "ScriptPCH.h"
#include "Chat.h"

class talent_commandscript : public CommandScript
{
public:
    talent_commandscript() : CommandScript("talent_commandscript") { }

    ChatCommand* GetCommands() const
    {
        static ChatCommand ComTalent[] =
        {
            { "talent",         SEC_PLAYER,         false, &HandleTalentCommand,    "", NULL },
            { NULL,             0,                  false, NULL,                    "", NULL }
        };
        return ComTalent;
    }

    static bool HandleTalentCommand(ChatHandler* handler, const char* /*args*/)
    {
        handler->GetSession()->GetPlayer()->resetTalents();
        handler->GetSession()->GetPlayer()->SendTalentsInfoData(false);
        return true;
    }
};

void AddSC_talent_commandscript()
{
   new talent_commandscript();
}
