#include "ScriptPCH.h"
#include "Chat.h"
//#include "Object.h"

class test_commandscript : public CommandScript
{
public:
    test_commandscript() : CommandScript("test_commandscript") {}

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
        return true;
    }
};

void AddSC_test_commandscript()
{
   new test_commandscript();
}
