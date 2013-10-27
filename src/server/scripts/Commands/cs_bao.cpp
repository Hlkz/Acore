#include "Chat.h"
#include "Language.h"
#include "Player.h"
#include "BattleAOMgr.h"
#include "World.h"
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
                sBattleAOMgr->GetBattleAO()->SetPlayersCanTag(true);
                sWorld->setWorldState(BAO_WS_CANPLAYERSTAG, true);
                handler->SendSysMessage(LANG_BAO_DISABLE);
                return true;
            }

            if (param == "off")
            {
                sBattleAOMgr->GetBattleAO()->SetPlayersCanTag(false);
                sWorld->setWorldState(BAO_WS_CANPLAYERSTAG, false);
                handler->SendSysMessage(LANG_BAO_ENABLE);
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
                sBattleAOMgr->GetBattleAO()->SetBalanceTag(true);
                handler->SendSysMessage(LANG_BAO_BALANCE_DISABLE);
                return true;
            }

            if (param == "off")
            {
                sBattleAOMgr->GetBattleAO()->SetBalanceTag(false);
                handler->SendSysMessage(LANG_BAO_BALANCE_ENABLE);
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
