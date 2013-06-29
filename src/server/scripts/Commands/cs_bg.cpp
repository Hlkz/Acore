#include "ScriptPCH.h"
#include "Chat.h"
#include "BattlegroundMgr.h"
#include "BattleAOMgr.h"

class com_bg : public CommandScript
{
   public:
       com_bg() : CommandScript("cs_bg") { }


       static bool HandleComBg(ChatHandler* handler, const char* /*args*/)
       {
			Player* player = handler->GetSession()->GetPlayer();
			if (sBattleAOMgr->GetBattleAO()->HasPlayer(player))
				return true;
			BattleAOQueue& baoQueue = sBattleAOMgr->GetBattleAOQueue();
			WorldPacket data;
			if (player->GetBattlegroundQueueIndex(BATTLEGROUND_QUEUE_AO) < PLAYER_MAX_BATTLEGROUND_QUEUES) // déjà tag : détag
			{
				player->RemoveBattlegroundQueueId(BATTLEGROUND_QUEUE_AO);
				uint32 queueSlot = player->GetBattlegroundQueueIndex(BATTLEGROUND_QUEUE_AO);
				sBattleAOMgr->BuildBattleAOStatusPacket(&data,queueSlot, STATUS_NONE, 0, 0);
				baoQueue.RemovePlayer(player->GetGUID(), true);
				player->GetSession()->SendPacket(&data);
				sLog->outDebug(LOG_FILTER_BAO, "BAO : detag par .bg");
				return true;
			}
			if (!player->HasFreeBattlegroundQueueId())
			{
				sBattlegroundMgr->BuildGroupJoinedBattlegroundPacket(&data, ERR_BATTLEGROUND_TOO_MANY_QUEUES);
				player->GetSession()->SendPacket(&data);
				return true;
			}
			BAOGroupQueueInfo* ginfo = baoQueue.AddGroup(player, NULL, false);
			uint32 queueSlot = player->AddBattlegroundQueueId(BATTLEGROUND_QUEUE_AO);
			sBattleAOMgr->BuildBattleAOStatusPacket(&data, queueSlot, STATUS_WAIT_QUEUE, 10, 0);
			player->GetSession()->SendPacket(&data);
			sBattleAOMgr->ScheduleQueueUpdate();
			sLog->outDebug(LOG_FILTER_BAO, "BAO : tag par .bg");
			return true;
       }

       ChatCommand* GetCommands() const
       {
           static ChatCommand ComBg[] =
           {
               { "bg",          SEC_PLAYER,			false, &HandleComBg,	"", NULL },
               { NULL,             0,					false, NULL,				"", NULL }
           };
           return ComBg;
       }
};

void AddSc_Com_Bg()
{
   new com_bg();
}