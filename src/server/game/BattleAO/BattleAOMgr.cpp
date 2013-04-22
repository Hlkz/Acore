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
        sLog->outInfo(LOG_FILTER_BAO, "BAO : init failed.");
        delete pBAO;
    }
    else
    {
        m_BattleAOSet.push_back(pBAO);
        sLog->outInfo(LOG_FILTER_BAO, "BAO : successfully initiated.");
    }
}

void BattleAOMgr::SendToBattleAO(Player* player)
{
        float x, y, z, O;
		uint32 mapid = BATTLEAO_MAP;
		x=2358.145752f;
		y=-5657.163574f;
		z=426.026245f;
		O=0.0f;
        uint32 team;
        team = player->GetTeamFromDB(); //tofix spawn a2 / h2 / neutre
        player->TeleportTo(mapid, x, y, z, O);
}

void BattleAOMgr::AddZone(uint32 zoneid, BattleAO *handle)
{
    m_BattleAOMap[zoneid] = handle;
}

void BattleAOMgr::HandlePlayerEnterZone(Player* player, uint32 zoneid)
{
    BattleAOMap::iterator itr = m_BattleAOMap.find(zoneid);
    if (itr == m_BattleAOMap.end())
        return;

    //tofix if (itr->second->HasPlayer(player))
    //   return;

    itr->second->HandlePlayerEnterZone(player, zoneid);
    sLog->outDebug(LOG_FILTER_BAO, "Player %u entered BAO", player->GetGUIDLow());
}

void BattleAOMgr::HandlePlayerLeaveZone(Player* player, uint32 zoneid)
{
    BattleAOMap::iterator itr = m_BattleAOMap.find(zoneid);
    if (itr == m_BattleAOMap.end())
        return;

    // teleport: remove once in removefromworld, once in updatezone
    //tofix if (!itr->second->HasPlayer(player))
    //    return;
    itr->second->HandlePlayerLeaveZone(player, zoneid);
    sLog->outDebug(LOG_FILTER_BAO, "Player %u left BAO", player->GetGUIDLow());
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
        for (BattleAOSet::iterator itr = m_BattleAOSet.begin(); itr != m_BattleAOSet.end(); ++itr)
            (*itr)->Update(m_UpdateTimer);
        m_UpdateTimer = 0;
    }
	
    m_BattleAOQueues[0].UpdateEvents(diff);
    if (!m_QueueUpdateScheduler.empty())
    {
        std::vector<uint64> scheduled;
        std::swap(scheduled, m_QueueUpdateScheduler);
		m_BattleAOQueues[0].BattleAOQueueUpdate(diff);
    }
}

ZoneScript* BattleAOMgr::GetZoneScript(uint32 zoneId)
{
    BattleAOMap::iterator itr = m_BattleAOMap.find(zoneId);
    if (itr != m_BattleAOMap.end())
        return itr->second;
    else
        return NULL;
}

//////////////////
// QUEUE SYSTEM //
//////////////////

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