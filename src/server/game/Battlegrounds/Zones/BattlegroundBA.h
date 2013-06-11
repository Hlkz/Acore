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

enum BG_BA_ObjectIds
{
	// bush?
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
    BG_BA_OBJECT_MAX,
};

enum BG_BA_OBJECTS
{
    BA_OPLACE_MAX,
};

enum BG_BA_CreatureEntry
{
	BA_TOWER_A_ENTRY = 3,
	BA_TOWER_H_ENTRY = 3,
	BA_NEXUS_A_ENTRY = 3,
	BA_NEXUS_H_ENTRY = 3,
	BA_VENDOR_A_ENTRY = 3,
	BA_VENDOR_H_ENTRY = 3,
};
enum BG_BA_CreatureType
{
	BA_CTYPE_TOWER_A_1 = 0,
	BA_CTYPE_TOWER_H_1 = 9,
	BA_CTYPE_TOWER_MAX  = 18,
	BA_CTYPE_NEXUS_A   = 18,
	BA_CTYPE_NEXUS_H,
	BA_CTYPE_VENDOR_A,
	BA_CTYPE_VENDOR_H,
    BA_CTYPE_MAX,
};

const float BG_BA_CreaturePos[BA_CTYPE_MAX][4] =
{
    {643.000000f, 44.000000f, 69.740196f, -0.001854f},
    {676.000000f, -374.000000f, 30.000000f, -0.001854f},
    {73.417755f, -496.433105f, 48.731918f, -0.001854f},
    {-157.409195f, 31.206272f, 77.050598f, -0.001854f},
    {-531.217834f, -405.231384f, 49.551376f, -0.001854f},
    {-1090.476807f, -253.308670f, 57.672371f, -0.001854f},
    {-1090.476807f, -253.308670f, 57.672371f, -0.001854f},
    {-1090.476807f, -253.308670f, 57.672371f, -0.001854f},
    {-1090.476807f, -253.308670f, 57.672371f, -0.001854f},
    {-1090.476807f, -253.308670f, 57.672371f, -0.001854f},
    {-1090.476807f, -253.308670f, 57.672371f, -0.001854f},
    {-1090.476807f, -253.308670f, 57.672371f, -0.001854f},
    {-1090.476807f, -253.308670f, 57.672371f, -0.001854f},
    {-1090.476807f, -253.308670f, 57.672371f, -0.001854f},
    {-1090.476807f, -253.308670f, 57.672371f, -0.001854f},
    {-1090.476807f, -253.308670f, 57.672371f, -0.001854f},
    {-1090.476807f, -253.308670f, 57.672371f, -0.001854f},
    {-1090.476807f, -253.308670f, 57.672371f, -0.001854f},
    {-1090.476807f, -253.308670f, 57.672371f, -0.001854f},
    {-1090.476807f, -253.308670f, 57.672371f, -0.001854f}
};

enum BG_BA_CreatureIds
{
    BA_NPC_A_TOWER,
	BA_NPC_H_TOWER,
	BA_NPC_A_NEXUS,
	BA_NPC_H_NEXUS,
    BA_NPC_INFO_MAX,
};

const uint32 BG_BA_CreatureInfo[BA_NPC_INFO_MAX][4] =
{
    { 13331, 1216, 60, 60 }, // a2 tower
    { 13422, 1216, 61, 61 }, // h2 tower
    { 13358, 1216, 59, 60 }, // a2 nexus
    { 11949, 469, 0, 0}, // h2 nexus
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

struct BattlegroundBAScore : public BattlegroundScore
{
    BattlegroundBAScore() : CreepsKilled(0) { }
    ~BattlegroundBAScore() { }
    uint32 CreepsKilled;
};

class BattlegroundBA : public Battleground
{
    public:
        BattlegroundBA();
        ~BattlegroundBA();

        /* inherited from BattlegroundClass */
        void AddPlayer(Player* player);

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

    private:
        void PostUpdateImpl(uint32 diff);

        /*worldstates*/
        void FillInitialWorldStates(WorldPacket& data);

        /*variables */
        int32 m_Team_TowerCount[2];
};

#endif
