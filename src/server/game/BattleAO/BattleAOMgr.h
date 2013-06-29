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
    BAOFreeSlotQueueContainer BAOFreeSlotQueue;
};

class BattleAOMgr
{
  public:
    BattleAOMgr(); //ctor
    ~BattleAOMgr(); //dtor

    // create battleAO events
    void InitBattleAO();

    void HandlePlayerEnterZone(Player* player, uint32 areaflag);
    void HandlePlayerLeaveZone(Player* player, uint32 areaflag);

    void HandlePlayerResurrects(Player* player, uint32 areaflag);
    void HandleDropFlag(Player* player, uint32 spellId);

    BattleAO* GetBattleAO();
	void Update(uint32 diff);

	void SendToBattleAO(Player* player);

    BattleAOQueue& GetBattleAOQueue() { return m_BattleAOQueues; }
	void RemoveFromBAOFreeSlotQueue();
	BAOFreeSlotQueueContainer& GetBAOFreeSlotQueueStore();
	void BuildBattleAOStatusPacket(WorldPacket* data, uint8 QueueSlot, uint8 StatusID, uint32 Time1, uint32 Time2);
	void BuildPvpLogDataPacket(WorldPacket* data);
    void ScheduleQueueUpdate();

    typedef std::vector < BattleAO * >BattleAOSet;
  private:
	BattleAOSet m_BattleAOSet; // BAO list (used for sBattleAOMgr->GetBattleAO())
    uint32 m_UpdateTimer; // update interval

	std::vector<uint64> m_QueueUpdateScheduler;
	BattleAOQueue m_BattleAOQueues;
	typedef std::map<BattlegroundTypeId, BattleAOData> BattleAODataContainer;
	BattleAODataContainer baoDataStore;
};

#define sBattleAOMgr ACE_Singleton<BattleAOMgr, ACE_Null_Mutex>::instance()

#endif