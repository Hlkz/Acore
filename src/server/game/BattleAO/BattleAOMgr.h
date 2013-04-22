#ifndef BATTLEAO_MGR_H_
#define BATTLEAO_MGR_H_

#include "BattleAO.h"
#include "BattleAOQueue.h"
#include "ace/Singleton.h"

typedef std::map<uint32, BattleAO*> BattleAOContainer;
typedef std::set<uint32> BattleAOClientIdsContainer;

class Player;
class GameObject;
class Creature;
class ZoneScript;
struct GossipMenuItems;

struct BattleAOData
{
    BattleAOContainer m_BattleAOs;
    BattleAOClientIdsContainer m_ClientBattleAOIds[1];
    BAOFreeSlotQueueContainer BAOFreeSlotQueue;
};

class BattleAOMgr
{
  public:
    BattleAOMgr(); //ctor
    ~BattleAOMgr(); //dtor

    // create battleAO events
    void InitBattleAO();
    // called when a player enters/leaves an battleAO area
    void HandlePlayerEnterZone(Player* player, uint32 areaflag);
    void HandlePlayerLeaveZone(Player* player, uint32 areaflag);

    void HandlePlayerResurrects(Player* player, uint32 areaflag);

    BattleAO* GetBattleAO();

    ZoneScript* GetZoneScript(uint32 zoneId);

    void AddZone(uint32 zoneid, BattleAO * handle);

    void Update(uint32 diff);

    void HandleGossipOption(Player* player, uint64 guid, uint32 gossipid);

    bool CanTalkTo(Player* player, Creature* creature, GossipMenuItems gso);

    void HandleDropFlag(Player* player, uint32 spellId);
	
    BattleAOQueue& GetBattleAOQueue() { return m_BattleAOQueues[BATTLEGROUND_QUEUE_AO]; }
	void RemoveFromBAOFreeSlotQueue();
	BAOFreeSlotQueueContainer& GetBAOFreeSlotQueueStore();
	void BuildBattleAOStatusPacket(WorldPacket* data, uint8 QueueSlot, uint8 StatusID, uint32 Time1, uint32 Time2);
    void ScheduleQueueUpdate();
	
    typedef std::vector < BattleAO * >BattleAOSet;
    typedef std::map < uint32 /* zoneid */, BattleAO * >BattleAOMap;
  private:
    // contains all initiated battleAO events
    // used when initing / cleaning up
      BattleAOSet m_BattleAOSet;
    // maps the zone ids to an battleAO event
    // used in player event handling
    BattleAOMap m_BattleAOMap;
    // update interval
    uint32 m_UpdateTimer;
	
	std::vector<uint64> m_QueueUpdateScheduler;
	BattleAOQueue m_BattleAOQueues[1];
	typedef std::map<BattlegroundTypeId, BattleAOData> BattleAODataContainer;
	BattleAODataContainer baoDataStore;
};

#define sBattleAOMgr ACE_Singleton<BattleAOMgr, ACE_Null_Mutex>::instance()

#endif
