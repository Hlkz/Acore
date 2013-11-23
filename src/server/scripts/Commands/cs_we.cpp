#include "ScriptPCH.h"
#include "Chat.h"

class WE_commandscript : public CommandScript
{
public:
    WE_commandscript() : CommandScript("WE_commandscript") { }

    ChatCommand* GetCommands() const
    {
        static ChatCommand commandTable[] =
        {
            { "we",             SEC_ADMINISTRATOR,  false, &HandleComWE,        "", NULL },
            { NULL,             0,                  false, NULL,                "", NULL }
        };
        return commandTable;
    }

    static bool HandleComWE(ChatHandler* handler, const char* args)
    {
        if (!*args)
            return false;
        char* premier = strtok((char*)args, " ");
        char* deuxieme = strtok(NULL, " ");
        uint32 Premier = (uint32)atof(premier);
        uint64 Peuxieme = (uint64)atof(deuxieme);
        return true;
    }
};

void AddSC_WE_commandscript()
{
   new WE_commandscript();
}
