#include "BattleAOMgr.h"
#include "BattleAOAO.h"
#include "ObjectMgr.h"
#include "Player.h"

BattleAOMgr::BattleAOMgr()
{
    m_UpdateTimer = 0;
}

BattleAOMgr::~BattleAOMgr()
{
    for (BattleAOSet::iterator itr = m_BattleAOSet.begin(); itr != m_BattleAOSet.end(); ++itr)
        delete *itr;
}

void BattleAOMgr::InitBattleAO()
{
    BattleAO* pBAO = new BattleAOAO;
    if (!pBAO->SetupBattleAO())
    {
        sLog->outError(LOG_FILTER_BAO, "BAO : init failed.");
        delete pBAO;
    }
    else
    {
        m_BattleAOSet.push_back(pBAO);
        sLog->outError(LOG_FILTER_BAO, "BAO : successfully initiated.");
    }
}

void BattleAOMgr::SendToBattleAO(Player* player)
{
	uint32 team = player->GetTeamFromDB();

	if (sWorld->getWorldState(22003) == 0)
		player->TeleportTo(BATTLEAO_MAP, -5369.008789f, 219.136292f, 50.291454f, 3.776330f);
	else
	{
		if(player->IsDeserter())
			player->TeleportTo(BATTLEAO_MAP, -5610.104980f, -592.819092f, -20.958515f, 1.135133f);
		else if (team == ALLIANCE)
			player->TeleportTo(BATTLEAO_MAP, -5522.344238f, -123.176567f, -17.148638f, 3.033346f);
		else if (team == HORDE)
			player->TeleportTo(BATTLEAO_MAP, -5787.119629f, -127.544693f, -9.115396f, 0.080639f);
	}
}

BattleAO *BattleAOMgr::GetBattleAO()
{
    for (BattleAOSet::iterator itr = m_BattleAOSet.begin(); itr != m_BattleAOSet.end(); ++itr)
    {
        if (*itr)
            return (*itr);
    }
    return NULL;
}

void BattleAOMgr::Update(uint32 diff)
{
    m_UpdateTimer += diff;
    if (m_UpdateTimer > BAO_OBJECTIVE_UPDATE_INTERVAL)
    {
        GetBattleAO()->Update(m_UpdateTimer);
        m_UpdateTimer = 0;
    }

    m_BattleAOQueues.UpdateEvents(diff);
    if (!m_QueueUpdateScheduler.empty())
    {
        std::vector<uint64> scheduled;
        std::swap(scheduled, m_QueueUpdateScheduler);
		m_BattleAOQueues.BattleAOQueueUpdate(diff);
    }
}

BAOFreeSlotQueueContainer& BattleAOMgr::GetBAOFreeSlotQueueStore()
{
    return baoDataStore[BATTLEGROUND_AO].BAOFreeSlotQueue;
}

void BattleAOMgr::BuildBattleAOStatusPacket(WorldPacket* data, uint8 QueueSlot, uint8 StatusID, uint32 Time1, uint32 Time2)
{
    if (StatusID == 0)
    {
        data->Initialize(SMSG_BATTLEFIELD_STATUS, 4+8);
        *data << uint32(QueueSlot);
        *data << uint64(0);
        return;
    }

    data->Initialize(SMSG_BATTLEFIELD_STATUS, (4+8+1+1+4+1+4+4+4));
    *data << uint32(QueueSlot);
    *data << uint8(0);
    *data << uint8(0x0);
    *data << uint32(BATTLEGROUND_AO);
    *data << uint16(0x1F90);
    *data << uint8(1);
    *data << uint8(255);
    *data << uint32(0);
    *data << uint8(0);
    *data << uint32(StatusID);
    switch (StatusID)
    {
        case STATUS_WAIT_QUEUE:
            *data << uint32(Time1);
            *data << uint32(Time2);
            break;
        case STATUS_WAIT_JOIN:
            *data << uint32(BATTLEAO_MAP);
            *data << uint64(0);
            *data << uint32(Time1);
            break;
        case STATUS_IN_PROGRESS:
            *data << uint32(BATTLEAO_MAP);
            *data << uint64(0);
            *data << uint32(Time1);
            *data << uint32(Time2);
            *data << uint8(0);
            break;
        default:
            break;
    }
}

void BattleAOMgr::BuildPvpLogDataPacket(WorldPacket* data)
{
	BattleAO* bao = sBattleAOMgr->GetBattleAO();
    data->Initialize(MSG_PVP_LOG_DATA, (1+1+4+40*bao->GetPlayerScoresSize()));
    *data << uint8(0); // type (battleground=0/arena=1)
    *data << uint8(0); // bg not ended
    size_t wpos = data->wpos();
    uint32 scoreCount = 0;
    *data << uint32(scoreCount); // placeholder
    BattleAO::BattleAOScoreMap::const_iterator itr2 = bao->GetPlayerScoresBegin();
    for (BattleAO::BattleAOScoreMap::const_iterator itr = itr2; itr != bao->GetPlayerScoresEnd();)
    {
        itr2 = itr++;
        if (!bao->HasPlayerByGuid(itr2->first))
        {
            sLog->outError(LOG_FILTER_BAO, "BAO player %i has scoreboard but is not in bao !", itr->first);
            continue;
        }
        *data << uint64(itr2->first);
        *data << uint32(itr2->second->KillingBlows);
        *data << uint32(itr2->second->HonorableKills);
        *data << uint32(itr2->second->Deaths);
        *data << uint32(itr2->second->BonusHonor);
        *data << uint32(itr2->second->DamageDone);
        *data << uint32(itr2->second->HealingDone);
	    *data << uint32(0);
        //*data << uint32(itr2->second->BasesAssaulted);      // bases assaulted
        //*data << uint32(itr2->second->BasesDefended);       // bases defended
	    scoreCount++;
    }
    data->put(wpos, scoreCount);
}

void BattleAOMgr::RemoveFromBAOFreeSlotQueue()
{
    BAOFreeSlotQueueContainer& queues = baoDataStore[BATTLEGROUND_AO].BAOFreeSlotQueue;
    for (BAOFreeSlotQueueContainer::iterator itr = queues.begin(); itr != queues.end(); ++itr)
    {
	    queues.erase(itr);
		return;
    }
}

void BattleAOMgr::ScheduleQueueUpdate()
{
    uint64 const scheduleId = ((uint64)0 << 32) | (0 << 24) | (BATTLEGROUND_QUEUE_AO << 16) | (BATTLEGROUND_AO << 8) | 0;
    if (std::find(m_QueueUpdateScheduler.begin(), m_QueueUpdateScheduler.end(), scheduleId) == m_QueueUpdateScheduler.end())
        m_QueueUpdateScheduler.push_back(scheduleId);
}

void BattleAOMgr::HandlePlayerEnterZone(Player* player, uint32 zoneid)
{
    if (zoneid != BATTLEAO_AREA)
        return;
	if (GetBattleAO()->HasPlayer(player))
        return;
    GetBattleAO()->HandlePlayerEnterZone(player, zoneid);
    sLog->outDebug(LOG_FILTER_BAO, "BAO : Player %u entered", player->GetGUIDLow());
}

void BattleAOMgr::HandlePlayerLeaveZone(Player* player, uint32 zoneid)
{
    if (zoneid != BATTLEAO_AREA)
        return;
	if (!GetBattleAO()->HasPlayer(player))
        return;
    GetBattleAO()->HandlePlayerLeaveZone(player, zoneid);
    sLog->outDebug(LOG_FILTER_BAO, "BAO : Player %u left", player->GetGUIDLow());
}