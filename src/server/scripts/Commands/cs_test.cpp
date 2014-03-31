#include "ScriptPCH.h"
#include "Chat.h"
#include "BattleAOMgr.h"
#include "BattlegroundIWP.h"
#include "BattlegroundMgr.h"

class test_commandscript : public CommandScript
{
public:
    test_commandscript() : CommandScript("test_commandscript") { }

    ChatCommand* GetCommands() const
    {
        static ChatCommand commandTable[] =
        {
            { "test",           SEC_ADMINISTRATOR,  false, &HandleTestCommand,    "", NULL },
            { NULL,             0,                  false, NULL,                  "", NULL }
        };
        return commandTable;
    }

    static bool HandleTestCommand(ChatHandler* handler, char const* /*args*/)
    {
        Player* player = handler->GetSession()->GetPlayer();
        if (Battleground* bg = sBattlegroundMgr->GetBattleground(player->GetInstanceId(), BATTLEGROUND_IWP))
            if (BattlegroundIWP* IWP = static_cast<BattlegroundIWP*>(bg))
            {
                IWP->CrushWall();
            }
        return true;
    }
};

void AddSC_test_commandscript()
{
   new test_commandscript();
}
