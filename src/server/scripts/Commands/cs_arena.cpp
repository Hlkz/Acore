#include "ScriptPCH.h"
#include "Chat.h"

class com_arena : public CommandScript
{
   public:
       com_arena() : CommandScript("cs_arena") { }


       static bool HandleComArena(ChatHandler* handler, const char* /*args*/)
       {
		    BattlegroundTypeId bgTypeId = BATTLEGROUND_AA;
			handler->GetSession()->SendBattleGroundList(handler->GetSession()->GetPlayer()->GetGUID(), bgTypeId);
			return true;
       }

       ChatCommand* GetCommands() const
       {
           static ChatCommand ComArena[] =
           {
               { "arena",          SEC_PLAYER,			false, &HandleComArena,	"", NULL },
               { NULL,             0,					false, NULL,				"", NULL }
           };
           return ComArena;
       }
};

void AddSc_Com_Arena()
{
   new com_arena();
}