#ifndef __BATTLEAOQUEUE_H
#define __BATTLEAOQUEUE_H

#include "Common.h"
#include "DBCEnums.h"
#include "BattleAO.h"
#include "DBCEnums.h"
#include "EventProcessor.h"
#include <deque>

//this container can't be deque, because deque doesn't like removing the last element - if you remove it, it invalidates next iterator and crash appears
typedef std::list<BattleAO*> BAOFreeSlotQueueContainer;

struct BAOGroupQueueInfo;
struct BAOPlayerQueueInfo
{
    uint32  LastOnlineTime;
    BAOGroupQueueInfo* GroupInfo;
};

struct BAOGroupQueueInfo
{
    std::map<uint64, BAOPlayerQueueInfo*> Players;
    uint32  Team;
    uint32  JoinTime;
    uint32  RemoveInviteTime;
    bool    IsInvitedToBAO;
};

enum BattleAOQueueGroupTypes
{
    BAO_QUEUE_PREMADE_ALLIANCE   = 0,
    BAO_QUEUE_PREMADE_HORDE      = 1,
    BAO_QUEUE_NORMAL_ALLIANCE    = 2,
    BAO_QUEUE_NORMAL_HORDE       = 3
};
#define BAO_QUEUE_GROUP_TYPES_COUNT 4

class BattleAO;
class BattleAOQueue
{
    public:
        BattleAOQueue();
        ~BattleAOQueue();
		
        void BattleAOQueueUpdate(uint32 diff);
        void UpdateEvents(uint32 diff);

        void FillPlayersToBAO();
		BAOGroupQueueInfo* AddGroup(Player* leader, Group* group, bool isPremade);
        void RemovePlayer(uint64 guid, bool decreasePlayersCount);
        bool IsPlayerInvited(uint64 pl_guid, const uint32 removeTime);
        bool GetPlayerGroupInfoData(uint64 guid, BAOGroupQueueInfo* ginfo);
		
        typedef std::map<uint64, BAOPlayerQueueInfo> BAOQueuedPlayersMap;
        BAOQueuedPlayersMap m_QueuedPlayers;
        typedef std::deque<BAOGroupQueueInfo*> BAOGroupsQueueType;
		BAOGroupsQueueType m_QueuedGroups[BAO_QUEUE_GROUP_TYPES_COUNT];

        class SelectionPool
        {
		public:
			SelectionPool(): PlayerCount(0) {};
			void Init();
			bool AddGroup(BAOGroupQueueInfo* ginfo, uint32 desiredCount);
			bool KickGroup(uint32 size);
			uint32 GetPlayerCount() const {return PlayerCount;}
		public:
			BAOGroupsQueueType SelectedGroups;
		private:
			uint32 PlayerCount;
        };

        SelectionPool m_SelectionPools[BG_TEAMS_COUNT];
        uint32 GetPlayersInQueue(TeamId id);
    private:
        bool InviteGroupToBAO(BAOGroupQueueInfo* ginfo, uint32 side);
		EventProcessor m_events;
};

class BAOQueueInviteEvent : public BasicEvent
{
    public:
        BAOQueueInviteEvent(uint64 pl_guid, uint32 removeTime) : m_PlayerGuid(pl_guid), m_RemoveTime(removeTime) {}
        virtual ~BAOQueueInviteEvent() {}

        virtual bool Execute(uint64 e_time, uint32 p_time);
        virtual void Abort(uint64 e_time);
    private:
        uint64 m_PlayerGuid;
        uint32 m_RemoveTime;
};

class BAOQueueRemoveEvent : public BasicEvent
{
    public:
        BAOQueueRemoveEvent(uint64 pl_guid, uint32 removeTime) : m_PlayerGuid(pl_guid), m_RemoveTime(removeTime) {}

        virtual ~BAOQueueRemoveEvent() {}

        virtual bool Execute(uint64 e_time, uint32 p_time);
        virtual void Abort(uint64 e_time);
    private:
        uint64 m_PlayerGuid;
        uint32 m_RemoveTime;
};

#endif
