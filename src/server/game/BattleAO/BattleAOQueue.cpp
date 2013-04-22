#include "BattleAOMgr.h"
#include "BattleAOQueue.h"
#include "Chat.h"
#include "Group.h"
#include "Log.h"
#include "Language.h"
#include "ObjectMgr.h"
#include "Player.h"

BattleAOQueue::BattleAOQueue() {}

BattleAOQueue::~BattleAOQueue()
{
    m_events.KillAllEvents(false);

	for (uint32 j = 0; j < BAO_QUEUE_GROUP_TYPES_COUNT; ++j)
    {
		for (BAOGroupsQueueType::iterator itr = m_QueuedGroups[0][j].begin(); itr!= m_QueuedGroups[0][j].end(); ++itr)
			delete (*itr);
	}
}

void BattleAOQueue::SelectionPool::Init()
{
    SelectedGroups.clear();
    PlayerCount = 0;
}

bool BattleAOQueue::SelectionPool::KickGroup(uint32 size)
{
    bool found = false;
    BAOGroupsQueueType::iterator groupToKick = SelectedGroups.begin();
    for (BAOGroupsQueueType::iterator itr = groupToKick; itr != SelectedGroups.end(); ++itr)
    {
        if (abs((int32)((*itr)->Players.size() - size)) <= 1)
        {
            groupToKick = itr;
            found = true;
        }
        else if (!found && (*itr)->Players.size() >= (*groupToKick)->Players.size())
            groupToKick = itr;
    }
    if (GetPlayerCount())
    {
        BAOGroupQueueInfo* ginfo = (*groupToKick);
        SelectedGroups.erase(groupToKick);
        PlayerCount -= ginfo->Players.size();
        if (ginfo->Players.size() <= size + 1)
            return false;
    }
    return true;
}

bool BattleAOQueue::SelectionPool::AddGroup(BAOGroupQueueInfo* ginfo, uint32 desiredCount)
{
    if (!ginfo->IsInvitedToBAO && desiredCount >= PlayerCount + ginfo->Players.size())
    {
        SelectedGroups.push_back(ginfo);
        PlayerCount += ginfo->Players.size();
        return true;
    }
    if (PlayerCount < desiredCount)
        return true;
    return false;
}

BAOGroupQueueInfo* BattleAOQueue::AddGroup(Player* leader, Group* grp, bool isPremade)
{
    BAOGroupQueueInfo* ginfo	= new BAOGroupQueueInfo;
    ginfo->RemoveInviteTime		= 0;
    ginfo->JoinTime				= getMSTime();
    ginfo->Team					= leader->GetTeam();
    ginfo->IsInvitedToBAO		= 0;
    ginfo->Players.clear();

    uint32 index = 0;
    if (!isPremade)
        index += BG_TEAMS_COUNT;
    if (ginfo->Team == HORDE)
        index++;
	
	if (grp)
    {
        for (GroupReference* itr = grp->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* member = itr->getSource();
            if (!member)
                continue;
			BAOPlayerQueueInfo&	pl_info = m_QueuedPlayers[member->GetGUID()];
            pl_info.LastOnlineTime = ginfo->JoinTime;
            pl_info.GroupInfo = ginfo;
            ginfo->Players[member->GetGUID()] = &pl_info;
        }
    }
    else
    {
		BAOPlayerQueueInfo& pl_info = m_QueuedPlayers[leader->GetGUID()];
        pl_info.LastOnlineTime   = ginfo->JoinTime;
        pl_info.GroupInfo = ginfo;
        ginfo->Players[leader->GetGUID()]  = &pl_info;
    }
	
	m_QueuedGroups[0][index].push_back(ginfo);
	return ginfo;
}

void BattleAOQueue::RemovePlayer(uint64 guid, bool decreaseInvitedCount)
{
    BAOQueuedPlayersMap::iterator itr;

    itr = m_QueuedPlayers.find(guid);
    if (itr == m_QueuedPlayers.end())
        return;

    BAOGroupQueueInfo* group = itr->second.GroupInfo;
    BAOGroupsQueueType::iterator group_itr;

    uint32 index = (group->Team == HORDE) ? BAO_QUEUE_PREMADE_HORDE : BAO_QUEUE_PREMADE_ALLIANCE;

        //we must check premade and normal team's queue - because when players from premade are joining BAO,
        //they leave groupinfo so we can't use its players size to find out index
        for (uint32 j = index; j < BAO_QUEUE_GROUP_TYPES_COUNT; j += BG_TEAMS_COUNT)
        {
            BAOGroupsQueueType::iterator k = m_QueuedGroups[0][j].begin();
            for (; k != m_QueuedGroups[0][j].end(); ++k)
            {
                if ((*k) == group)
                {
                    group_itr = k;
                    index = j;
                    break;
                }
            }
        }

    std::map<uint64, BAOPlayerQueueInfo*>::iterator pitr = group->Players.find(guid);
    if (pitr != group->Players.end())
        group->Players.erase(pitr);
	
    if (decreaseInvitedCount && group->IsInvitedToBAO)
        if (BattleAO* BAO = sBattleAOMgr->GetBattleAO())
            BAO->DecreaseInvitedCount(group->Team);

    m_QueuedPlayers.erase(itr);
	
    if (group->Players.empty())
    {
        m_QueuedGroups[0][index].erase(group_itr);
        delete group;
    }
}

bool BattleAOQueue::IsPlayerInvited(uint64 pl_guid, const uint32 removeTime)
{
    BAOQueuedPlayersMap::const_iterator qItr = m_QueuedPlayers.find(pl_guid);
    return (qItr != m_QueuedPlayers.end()
        && qItr->second.GroupInfo->IsInvitedToBAO == 1
        && qItr->second.GroupInfo->RemoveInviteTime == removeTime);
}

bool BattleAOQueue::GetPlayerGroupInfoData(uint64 guid, BAOGroupQueueInfo* ginfo)
{
    BAOQueuedPlayersMap::const_iterator qItr = m_QueuedPlayers.find(guid);
    if (qItr == m_QueuedPlayers.end())
        return false;
    *ginfo = *(qItr->second.GroupInfo);
    return true;
}

uint32 BattleAOQueue::GetPlayersInQueue(TeamId id)
{
    return m_SelectionPools[id].GetPlayerCount();
}

bool BattleAOQueue::InviteGroupToBAO(BAOGroupQueueInfo* ginfo, uint32 side)
{
    if (side)
        ginfo->Team = side;

    if (!ginfo->IsInvitedToBAO)
    {
        ginfo->IsInvitedToBAO = true;
        ginfo->RemoveInviteTime = getMSTime() + INVITE_ACCEPT_WAIT_TIME;

        for (std::map<uint64, BAOPlayerQueueInfo*>::iterator itr = ginfo->Players.begin(); itr != ginfo->Players.end(); ++itr)
        {
            Player* player = ObjectAccessor::FindPlayer(itr->first);
            if (!player)
                continue;
			
			BattleAO* BAO = sBattleAOMgr->GetBattleAO();
            //sBattleAOMgr->InvitePlayer(player, BAO, ginfo->Team);
            BAO->IncreaseInvitedCount(ginfo->Team);

            player->SetInviteForBattlegroundQueueType(BATTLEGROUND_QUEUE_AO, ginfo->IsInvitedToBAO);

            BAOQueueInviteEvent* inviteEvent = new BAOQueueInviteEvent(player->GetGUID(), ginfo->RemoveInviteTime);
            m_events.AddEvent(inviteEvent, m_events.CalculateTime(INVITATION_REMIND_TIME));
            BAOQueueRemoveEvent* removeEvent = new BAOQueueRemoveEvent(player->GetGUID(), ginfo->RemoveInviteTime);
            m_events.AddEvent(removeEvent, m_events.CalculateTime(INVITE_ACCEPT_WAIT_TIME));

            WorldPacket data;

            uint32 queueSlot = player->GetBattlegroundQueueIndex(BATTLEGROUND_QUEUE_AO);
			sBattleAOMgr->BuildBattleAOStatusPacket(&data, queueSlot, STATUS_WAIT_JOIN, INVITE_ACCEPT_WAIT_TIME, 0);
            player->GetSession()->SendPacket(&data);
        }
        return true;
    }

    return false;
}

void BattleAOQueue::FillPlayersToBAO()
{
	BattleAO* BAO = sBattleAOMgr->GetBattleAO();
    int32 hordeFree = BAO->GetFreeSlotsForTeam(HORDE);
    int32 aliFree   = BAO->GetFreeSlotsForTeam(ALLIANCE);

    BAOGroupsQueueType::const_iterator Ali_itr = m_QueuedGroups[0][BAO_QUEUE_NORMAL_ALLIANCE].begin();
    uint32 aliCount = m_QueuedGroups[0][BAO_QUEUE_NORMAL_ALLIANCE].size();
    uint32 aliIndex = 0;
    for (; aliIndex < aliCount && m_SelectionPools[TEAM_ALLIANCE].AddGroup((*Ali_itr), aliFree); aliIndex++)
        ++Ali_itr;
    BAOGroupsQueueType::const_iterator Horde_itr = m_QueuedGroups[0][BAO_QUEUE_NORMAL_HORDE].begin();
    uint32 hordeCount = m_QueuedGroups[0][BAO_QUEUE_NORMAL_HORDE].size();
    uint32 hordeIndex = 0;
    for (; hordeIndex < hordeCount && m_SelectionPools[TEAM_HORDE].AddGroup((*Horde_itr), hordeFree); hordeIndex++)
        ++Horde_itr;

	int32 diffAli   = aliFree   - int32(m_SelectionPools[TEAM_ALLIANCE].GetPlayerCount());
    int32 diffHorde = hordeFree - int32(m_SelectionPools[TEAM_HORDE].GetPlayerCount());
    while (abs(diffAli - diffHorde) > 1 && (m_SelectionPools[TEAM_HORDE].GetPlayerCount() > 0 || m_SelectionPools[TEAM_ALLIANCE].GetPlayerCount() > 0))
    {
        if (diffAli < diffHorde)
        {
            if (m_SelectionPools[TEAM_ALLIANCE].KickGroup(diffHorde - diffAli))
            {
                for (; aliIndex < aliCount && m_SelectionPools[TEAM_ALLIANCE].AddGroup((*Ali_itr), (aliFree >= diffHorde) ? aliFree - diffHorde : 0); aliIndex++)
                    ++Ali_itr;
            }
            if (!m_SelectionPools[TEAM_ALLIANCE].GetPlayerCount())
            {
                if (aliFree <= diffHorde + 1)
                    break;
                m_SelectionPools[TEAM_HORDE].KickGroup(diffHorde - diffAli);
            }
        }
        else
        {
            if (m_SelectionPools[TEAM_HORDE].KickGroup(diffAli - diffHorde))
            {
                for (; hordeIndex < hordeCount && m_SelectionPools[TEAM_HORDE].AddGroup((*Horde_itr), (hordeFree >= diffAli) ? hordeFree - diffAli : 0); hordeIndex++)
                    ++Horde_itr;
            }
            if (!m_SelectionPools[TEAM_HORDE].GetPlayerCount())
            {
                if (hordeFree <= diffAli + 1)
                    break;
                m_SelectionPools[TEAM_ALLIANCE].KickGroup(diffAli - diffHorde);
            }
        }
        diffAli   = aliFree   - int32(m_SelectionPools[TEAM_ALLIANCE].GetPlayerCount());
        diffHorde = hordeFree - int32(m_SelectionPools[TEAM_HORDE].GetPlayerCount());
    }
}

void BattleAOQueue::UpdateEvents(uint32 diff)
{
    m_events.Update(diff);
}

void BattleAOQueue::BattleAOQueueUpdate(uint32 /*diff*/)
{
	sLog->outError(LOG_FILTER_GENERAL, "coucou update queue");
    if (m_QueuedGroups[0][BAO_QUEUE_PREMADE_ALLIANCE].empty() &&
        m_QueuedGroups[0][BAO_QUEUE_PREMADE_HORDE].empty() &&
        m_QueuedGroups[0][BAO_QUEUE_NORMAL_ALLIANCE].empty() &&
        m_QueuedGroups[0][BAO_QUEUE_NORMAL_HORDE].empty())
        return;
	
	m_SelectionPools[TEAM_ALLIANCE].Init();
	m_SelectionPools[TEAM_HORDE].Init();
	
	FillPlayersToBAO();

	for (BAOGroupsQueueType::const_iterator citr = m_SelectionPools[TEAM_ALLIANCE].SelectedGroups.begin(); citr != m_SelectionPools[TEAM_ALLIANCE].SelectedGroups.end(); ++citr)
		InviteGroupToBAO((*citr), (*citr)->Team);

	for (BAOGroupsQueueType::const_iterator citr = m_SelectionPools[TEAM_HORDE].SelectedGroups.begin(); citr != m_SelectionPools[TEAM_HORDE].SelectedGroups.end(); ++citr)
		InviteGroupToBAO((*citr), (*citr)->Team);
	
	BattleAO* BAO = sBattleAOMgr->GetBattleAO();
	if (!BAO->HasFreeSlots())
		BAO->RemoveFromBAOFreeSlotQueue();

    m_SelectionPools[TEAM_ALLIANCE].Init();
    m_SelectionPools[TEAM_HORDE].Init();
}

bool BAOQueueInviteEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    Player* player = ObjectAccessor::FindPlayer(m_PlayerGuid);
    if (!player)
        return true;

    BattleAO* BAO = sBattleAOMgr->GetBattleAO();

    uint32 queueSlot = player->GetBattlegroundQueueIndex(BATTLEGROUND_QUEUE_AO);
    if (queueSlot < PLAYER_MAX_BATTLEGROUND_QUEUES)
    {
        BattleAOQueue &BAOQueue = sBattleAOMgr->GetBattleAOQueue();
        if (BAOQueue.IsPlayerInvited(m_PlayerGuid, m_RemoveTime))
        {
            WorldPacket data;
			sBattleAOMgr->BuildBattleAOStatusPacket(&data, queueSlot, STATUS_WAIT_JOIN, INVITE_ACCEPT_WAIT_TIME - INVITATION_REMIND_TIME, 0);
            
            player->GetSession()->SendPacket(&data);
        }
    }
    return true;
}

void BAOQueueInviteEvent::Abort(uint64 /*e_time*/) {}

bool BAOQueueRemoveEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    Player* player = ObjectAccessor::FindPlayer(m_PlayerGuid);
    if (!player)
        return true;

    BattleAO* BAO = sBattleAOMgr->GetBattleAO();

    uint32 queueSlot = player->GetBattlegroundQueueIndex(BATTLEGROUND_QUEUE_AO);
    if (queueSlot < PLAYER_MAX_BATTLEGROUND_QUEUES)
    {
        BattleAOQueue &BAOQueue = sBattleAOMgr->GetBattleAOQueue();
        if (BAOQueue.IsPlayerInvited(m_PlayerGuid, m_RemoveTime))
        {
            player->RemoveBattlegroundQueueId(BATTLEGROUND_QUEUE_AO);
            BAOQueue.RemovePlayer(m_PlayerGuid, true);
            sBattleAOMgr->ScheduleQueueUpdate();

            WorldPacket data;
            sBattleAOMgr->BuildBattleAOStatusPacket(&data, queueSlot, STATUS_NONE, 0, 0);
            
            player->GetSession()->SendPacket(&data);
        }
    }
    return true;
}

void BAOQueueRemoveEvent::Abort(uint64 /*e_time*/) {}
