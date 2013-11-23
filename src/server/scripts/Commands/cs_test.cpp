#include "ScriptPCH.h"
#include "Chat.h"
#include "BattleAOMgr.h"

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
        Map* map = player->GetMap();
        BattleAO* BAO = sBattleAOMgr->GetBattleAO();
        player->UpdateTriggerVisibility();
        /*
        for (uint8 i = 0; i < BAO_DYNAMIC_NODES_COUNT; ++i)
        {
            UpdateData udata;
            WorldPacket packet;
            GameObject* gob = BAO->GetAOObject(BAO->m_NodesBanners[i]);
            TC_LOG_ERROR(LOG_FILTER_GENERAL, "coucou nodesbanners : %u", BAO->m_NodesBanners[i]);
            gob->BuildValuesUpdate BuildValuesUpdateBlockForPlayer(&udata, player);
            udata.BuildPacket(&packet);
            player->GetSession()->SendPacket(&packet);
        }*/
        return true;
    }
};

void AddSC_test_commandscript()
{
   new test_commandscript();
}
