#include "ScriptPCH.h"
#include "Chat.h"

class com_talent : public CommandScript
{
   public:
       com_talent() : CommandScript("comtalent") { }


       static bool HandleComTalent(ChatHandler* handler, const char* /*args*/)
       {
			handler->GetSession()->GetPlayer()->resetTalents(true);
			handler->GetSession()->GetPlayer()->SendTalentsInfoData(false);
			return true;
       }

       ChatCommand* GetCommands() const
       {
           static ChatCommand ComTalent[] =
           {
               { "talent",          SEC_PLAYER,			false, &HandleComTalent,	"", NULL },
               { NULL,             0,					false, NULL,				"", NULL }
           };
           return ComTalent;
       }
};

void AddSc_Com_Talent()
{
   new com_talent();
}