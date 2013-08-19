#ifndef __BATTLEGROUNDBA_H
#define __BATTLEGROUNDBA_H

#include "Battleground.h"

enum BG_BA_Sounds
{
    BA_SOUND_NEAR_VICTORY                   = 8456, /// @todo: Not confirmed yet
    BA_SOUND_ALLIANCE_ASSAULTS              = 8212, //tower, grave + enemy boss if someone tries to attack him
    BA_SOUND_HORDE_ASSAULTS                 = 8174,
    BA_SOUND_ALLIANCE_GOOD                  = 8173, //if something good happens for the team:  wins(maybe only through killing the boss), captures mine or grave, destroys tower and defends grave
    BA_SOUND_HORDE_GOOD                     = 8213,
    BA_SOUND_BOTH_TOWER_DEFEND              = 8192,
    BA_SOUND_ALLIANCE_CAPTAIN               = 8232, //gets called when someone attacks them and at the beginning after 3min+rand(x)*10sec (maybe buff)
    BA_SOUND_HORDE_CAPTAIN                  = 8333
};

enum BG_BA_Nodes
{
    BG_BA_NODES_TOWER_A2_1,
    BG_BA_NODES_TOWER_A2_2,
    BG_BA_NODES_TOWER_A2_3,
    BG_BA_NODES_TOWER_A2_4,
    BG_BA_NODES_TOWER_A2_5,
    BG_BA_NODES_TOWER_A2_6,
    BG_BA_NODES_TOWER_A2_7,
    BG_BA_NODES_TOWER_A2_8,
    BG_BA_NODES_TOWER_A2_9,
    BG_BA_NODES_TOWER_H2_1,
    BG_BA_NODES_TOWER_H2_2,
    BG_BA_NODES_TOWER_H2_3,
    BG_BA_NODES_TOWER_H2_4,
    BG_BA_NODES_TOWER_H2_5,
    BG_BA_NODES_TOWER_H2_6,
    BG_BA_NODES_TOWER_H2_7,
    BG_BA_NODES_TOWER_H2_8,
    BG_BA_NODES_TOWER_H2_9,
    BG_BA_NODES_NEXUS_A2,
    BG_BA_NODES_NEXUS_H2,
    BG_BA_NODES_MAX,
};

enum BG_BA_ObjectTypes
{
    BG_BA_OBJECT_MAX = 0
};

enum BG_BA_ItemIds
{
	BG_BA_ITEMID_COLLECT = 60500,
	BG_BA_ITEMID_SHARD = 60501,
};

enum BG_BA_ObjectIds
{
	// bush?
};

const uint32 BG_BA_GraveyardIds[BG_TEAMS_COUNT] = { 1950, 1951 };

enum BG_BA_CreatureEntry
{
	BA_TOWER_A_ENTRY = 1000144,
	BA_TOWER_H_ENTRY = 1000145,
	BA_NEXUS_A_ENTRY = 1000146,
	BA_NEXUS_H_ENTRY = 1000147,
	BA_VENDOR_A_ENTRY = 1000142,
	BA_VENDOR_H_ENTRY = 1000143,
	BA_CREEP_A = 1000140,
	BA_CREEP_H = 1000141,
};

enum BG_BA_CreatureType
{
	BA_CTYPE_TOWER_A_1 = 0,
	BA_CTYPE_TOWER_A_TOP = 0, BA_CTYPE_TOWER_A_MID = 3, BA_CTYPE_TOWER_A_BOT = 6,
	BA_CTYPE_TOWER_H_1 = 9,
	BA_CTYPE_TOWER_H_TOP = 9, BA_CTYPE_TOWER_H_MID = 12, BA_CTYPE_TOWER_H_BOT = 15,
	BA_CTYPE_TOWER_MAX  = 18,
	BA_CTYPE_NEXUS_A = 18, BA_CTYPE_NEXUS_H,
	BA_CTYPE_VENDOR_A,
	BA_CTYPE_VENDOR_H,
    BA_CTYPE_MAX,
};

const float BG_BA_CreaturePos[BA_CTYPE_MAX][4] =
{
    {-5602.600098f, 428.147797f, 0.001219f, 6.134692f}, //a top
    {-5508.722168f, 430.498047f, 0.000069f, 6.249358f},
    {-5402.633301f, 407.868652f, 0.001219f, 5.609258f},
    {-5641.794922f, 334.372223f, 0.000163f, 5.354031f}, //a mid
    {-5586.227051f, 267.281952f, 0.000349f, 5.357156f},
    {-5567.512207f, 226.124710f, 0.000084f, 5.498530f},
    {-5758.408691f, 282.653320f, 0.405170f, 4.817607f}, //a bot
    {-5761.738770f, 174.259521f, 0.000548f, 4.622039f},
    {-5738.321289f, 81.839798f, -0.027153f, 5.621843f},
    {-5307.648926f, 130.079834f, 0.000220f, 1.652620f}, //h top
    {-5305.019043f, 240.732986f, 0.000220f, 1.619462f},
    {-5335.945801f, 373.357880f, 0.000782f, 2.926343f},
    {-5398.898438f, 69.949028f, 0.000447f, 2.418985f}, //h mid
    {-5464.693848f, 118.116333f, 0.000576f, 2.358518f},
    {-5502.078613f, 179.079742f, 0.001211f, 2.324919f},
    {-5458.341797f, -5.833536f, 0.000397f, 3.006467f}, //h bot
    {-5568.236328f, -0.496658f, 0.000397f, 4.581978f},
    {-5657.486328f, 1.578186f, 0.031662f, 2.296466f},
    {-5702.780762f, 373.572784f, 6.457244f, 5.473417f}, //nexus
    {-5350.832031f, 31.342957f, 4.812562f,	2.272907f},
    {-4902.000488f, 389.285583f, 4.927508f, 3.015102f}, //vendors
    {-5707.783203f, -395.708099f, 0.000146f, 1.452193f}
};

const uint32 BG_BA_NextPoint[18] =
{
	BA_CTYPE_NEXUS_A, BA_CTYPE_TOWER_A_TOP, BA_CTYPE_TOWER_A_1+1,
	BA_CTYPE_NEXUS_A, BA_CTYPE_TOWER_A_MID, BA_CTYPE_TOWER_A_1+4,
	BA_CTYPE_NEXUS_A, BA_CTYPE_TOWER_A_BOT, BA_CTYPE_TOWER_A_1+7,
	BA_CTYPE_NEXUS_H, BA_CTYPE_TOWER_H_TOP, BA_CTYPE_TOWER_H_1+1,
	BA_CTYPE_NEXUS_H, BA_CTYPE_TOWER_H_MID, BA_CTYPE_TOWER_H_1+4,
	BA_CTYPE_NEXUS_H, BA_CTYPE_TOWER_H_BOT, BA_CTYPE_TOWER_H_1+7,
};

enum BG_BA_WorldStates
{
    BA_WS_A_TOWERCOUNT      = 22100,
    BA_WS_H_TOWERCOUNT		= 22101,
	BA_WS_CREEPKILLED		= 22103,
};

//alliance_control alliance_assault h_control h_assault
const uint32 BG_BA_NodeWorldStates[20][4] =
{
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
    {1325, 1326, 1327, 1328},
};
inline BG_BA_Nodes &operator++(BG_BA_Nodes &i){ return i = BG_BA_Nodes(i + 1); }

struct BGBAPlayer
{
    time_t  NextRezTimer;
};

struct BattlegroundBAScore : public BattlegroundScore
{
    BattlegroundBAScore() : CreepsKilled(0), ArcaneFrag(0) { }
    ~BattlegroundBAScore() { }
    uint32 CreepsKilled;
    uint32 ArcaneFrag;
};

class BattlegroundBA : public Battleground
{
    public:
        BattlegroundBA();
        ~BattlegroundBA();
		
        typedef std::map<uint64, BGBAPlayer> BGBAPlayerMap;
        void AddPlayer(Player* player);
        void StartingEventCloseDoors();
        void StartingEventOpenDoors();

        void RemovePlayer(Player* player, uint64 guid, uint32 team);
        void HandleAreaTrigger(Player* Source, uint32 Trigger);
        bool SetupBattleground();
        void ResetBGSubclass();

        /*general stuff*/
        void UpdatePlayerScore(Player* Source, uint32 type, uint32 value, bool doAddHonor = true);

        /*handlestuff*/ //these are functions which get called from extern
        void HandleKillPlayer(Player* player, Player* killer);
        void HandleKillUnit(Creature* unit, Player* killer);

		void EventPlayerDestroyedPoint(BG_BA_Nodes node);
        void EndBattleground(uint32 winner);
		
        uint32 GetPrematureWinner();
		
		bool IsNexusAttackable[BG_TEAMS_COUNT];

        WorldSafeLocsEntry const* GetClosestGraveYard(Player* player);
		
		BGBAPlayerMap m_BAPlayers;

    private:
        void PostUpdateImpl(uint32 diff);
		void SpawnCreeps(uint32 count);

        /*worldstates*/
        void FillInitialWorldStates(WorldPacket& data);

        /*variables */
        int32 m_Team_TowerCount[BG_TEAMS_COUNT];
		int32 m_WavesTimer;
		int32 m_WavesCount;
};

#endif
