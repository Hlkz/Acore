#include "Chat.h"
#include "GameEventMgr.h"
#include "Language.h"
#include "Player.h"
#include "ScriptMgr.h"

class bao_commandscript : public CommandScript
{
public:
    bao_commandscript() : CommandScript("bao_commandscript") { }

    ChatCommand* GetCommands() const
    {
        static ChatCommand baoCommandTable[] =
        {
            { "tag",            SEC_ADMINISTRATOR,     true,  &HandleBaoTagCommand,              "", NULL },
            { "balance",        SEC_ADMINISTRATOR,     true,  &HandleBaoBalanceCommand,          "", NULL },
            { NULL,             0,					   false, NULL,                              "", NULL }
        };
        static ChatCommand commandTable[] =
        {
            { "bao",            SEC_ADMINISTRATOR,     false, NULL,                  "",   baoCommandTable },
            { NULL,             0,                     false, NULL,                               "", NULL }
        };
        return commandTable;
    }
	
    static bool HandleBaoTagCommand(ChatHandler* handler, char const* args)
    {
        if (WorldSession* session = handler->GetSession())
        {
            if (!*args)
                return false;

            std::string param = (char*)args;

            if (param == "on")
            {
                return true;
            }

            if (param == "off")
            {
                return true;
            }
        }

        handler->SendSysMessage(LANG_USE_BOL);
        handler->SetSentErrorMessage(true);
        return false;
    }

    static bool HandleBaoBalanceCommand(ChatHandler* handler, char const* args)
    {
        if (WorldSession* session = handler->GetSession())
        {
            if (!*args)
                return false;

            std::string param = (char*)args;

            if (param == "on")
            {
                return true;
            }

            if (param == "off")
            {
                return true;
            }
        }

        handler->SendSysMessage(LANG_USE_BOL);
        handler->SetSentErrorMessage(true);
        return false;
    }
};

void AddSC_bao_commandscript()
{
    new bao_commandscript();
}
