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
			Battleground* bg = sBattlegroundMgr->GetBattlegroundTemplate(BATTLEGROUND_AO);
			if (player->GetBattlegroundQueueIndex(BATTLEGROUND_QUEUE_AO) < PLAYER_MAX_BATTLEGROUND_QUEUES)
				return true;
			if (!player->HasFreeBattlegroundQueueId())
			{
				WorldPacket data;
				sBattlegroundMgr->BuildGroupJoinedBattlegroundPacket(&data, ERR_BATTLEGROUND_TOO_MANY_QUEUES);
				player->GetSession()->SendPacket(&data);
				return true;
			}
			BattleAOQueue& baoQueue = sBattleAOMgr->GetBattleAOQueue();
			BAOGroupQueueInfo* ginfo = baoQueue.AddGroup(player, NULL, 0);
			uint32 queueSlot = player->AddBattlegroundQueueId(BATTLEGROUND_QUEUE_AO);
			WorldPacket data;
			sBattleAOMgr->BuildBattleAOStatusPacket(&data, queueSlot, STATUS_WAIT_QUEUE, 10, 0);
			handler->GetSession()->SendPacket(&data);
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