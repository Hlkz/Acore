#include "ScriptPCH.h"
#include "Chat.h"

class com_we : public CommandScript
{
public:
    com_we() : CommandScript("cs_we") { }

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

    ChatCommand* GetCommands() const
    {
        static ChatCommand ComWE[] =
        {
            { "we",             SEC_ADMINISTRATOR,  false, &HandleComWE,        "", NULL },
            { NULL,             0,                  false, NULL,                "", NULL }
        };
	    return ComWE;
    }
};

void AddSc_Com_WE()
{
   new com_we();
}