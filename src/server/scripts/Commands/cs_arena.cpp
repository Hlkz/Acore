#include "ScriptPCH.h"
#include "Chat.h"

class arena_commandscript : public CommandScript
{
public:
   arena_commandscript() : CommandScript("arena_commandscript") { }

       ChatCommand* GetCommands() const
       {
           static ChatCommand commandTable[] =
           {
               { "arena",          SEC_PLAYER,          false, &HandleArenaCommand, "", NULL },
               { NULL,             0,                   false, NULL,                "", NULL }
           };
           return commandTable;
       }

       static bool HandleArenaCommand(ChatHandler* handler, const char* /*args*/)
       {
            BattlegroundTypeId bgTypeId = BATTLEGROUND_AA;
            handler->GetSession()->SendBattleGroundList(handler->GetSession()->GetPlayer()->GetGUID(), bgTypeId);
            return true;
       }
};

void AddSC_arena_commandscript()
{
   new arena_commandscript();
}