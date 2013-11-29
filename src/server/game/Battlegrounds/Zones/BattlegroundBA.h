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
    BA_SOUND_HORDE_CAPTAIN                  = 8333,
    BA_SOUND_CLAIMED            = 8192,
};

enum BG_BA_Nodes
{
    BG_BA_NODES_TOWER_A_T1,
    BG_BA_NODES_TOWER_A_T2,
    BG_BA_NODES_TOWER_A_M1,
    BG_BA_NODES_TOWER_A_M2,
    BG_BA_NODES_TOWER_A_B1,
    BG_BA_NODES_TOWER_A_B2,
    BG_BA_NODES_TOWER_H_T1,
    BG_BA_NODES_TOWER_H_T2,
    BG_BA_NODES_TOWER_H_M1,
    BG_BA_NODES_TOWER_H_M2,
    BG_BA_NODES_TOWER_H_B1,
    BG_BA_NODES_TOWER_H_B2,
    BG_BA_NODES_NEXUS_A,
    BG_BA_NODES_NEXUS_H,
    BG_BA_NODES_MAX,
};

enum BG_BA_ObjectTypes
{
    BG_BA_OBJECT_MAX = 0
};

enum BG_BA_ItemIds
{
    BG_BA_ITEMID_COLLECT = 60086,
    BG_BA_ITEMID_SHARD = 60087,
};

enum BG_BA_ObjectIds
{
    // bush?
};

const uint32 BG_BA_GraveyardIds[BG_TEAMS_COUNT] = { 1950, 1951 };

enum BG_BA_CreatureEntry
{
    BA_TOWER_A_ENTRY = 1000344,
    BA_TOWER_H_ENTRY = 1000345,
    BA_NEXUS_A_ENTRY = 1000346,
    BA_NEXUS_H_ENTRY = 1000347,
    BA_VENDOR_A_ENTRY = 1000342,
    BA_VENDOR_H_ENTRY = 1000343,
    BA_CREEP_A = 1000340,
    BA_CREEP_H = 1000341,
};

enum BG_BA_CreatureType
{
    BA_CTYPE_TOWER_A_1 = 0,
    BA_CTYPE_TOWER_A_T1 = 0, BA_CTYPE_TOWER_A_M1 = 2, BA_CTYPE_TOWER_A_B1 = 4,
    BA_CTYPE_TOWER_H_1 = 6,
    BA_CTYPE_TOWER_H_T1 = 6, BA_CTYPE_TOWER_H_M1 = 8, BA_CTYPE_TOWER_H_B1 = 10,
    BA_CTYPE_TOWER_MAX  = 12,
    BA_CTYPE_NEXUS_A = 12, BA_CTYPE_NEXUS_H,
    BA_CTYPE_VENDOR_A,
    BA_CTYPE_VENDOR_H,
    BA_CTYPE_MAX,
};

const float BG_BA_CreaturePos[BA_CTYPE_MAX][4] =
{
    {-5629.822f, 411.894f, -1.355f, 6.227f}, // A top
    {-5581.089f, 411.481f, -0.831f, 1.254f},
    {-5666.560f, 351.028f, -1.654f, 4.347f}, // A mid
    {-5660.115f, 310.184f, -2.994879f, 0.292036f},
    {-5744.229004f, 306.575226f, -2.192745f, 3.244565f}, // A bot
    {-5764.373f, 248.640f, -0.899f, 5.355f},
    {-5518.027f, 305.337f, -1.188f, 0.560f}, // H top
    {-5497.967f, 353.830f, -0.648f, 2.480f},
    {-5595.334f, 253.431f, -1.425f, 0.957f}, // H mid
    {-5611.152f, 292.091f, -2.999f, 3.698f},
    {-5650.515625f, 187.605408f, -1.270019f, 4.334392f}, // H bot
    {-5692.971680f, 192.353500f, -0.826565f, 4.457612f},
    {-5731.264f, 396.886f, 3.9719f, 5.462f}, // Nexus
    {-5536.418f, 205.265f, 2.794f, 2.457f},
    {-5762.917f, 391.590f, 3.2899f, 6.225f}, // Vendors
    {-5503.889f, 210.334f, 2.5911f, 3.071f},
};

const uint32 BG_BA_NextPoint[18] =
{
    BA_CTYPE_NEXUS_A, BA_CTYPE_TOWER_A_T1,
    BA_CTYPE_NEXUS_A, BA_CTYPE_TOWER_A_M1,
    BA_CTYPE_NEXUS_A, BA_CTYPE_TOWER_A_B1,
    BA_CTYPE_NEXUS_H, BA_CTYPE_TOWER_H_T1,
    BA_CTYPE_NEXUS_H, BA_CTYPE_TOWER_H_M1,
    BA_CTYPE_NEXUS_H, BA_CTYPE_TOWER_H_B1,
};

enum BG_BA_WorldStates
{
    BA_WS_A_TOWERCOUNT      = 22100,
    BA_WS_H_TOWERCOUNT        = 22101,
    BA_WS_CREEPKILLED        = 22103,
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
