#ifndef __BATTLEGROUNDBB_H
#define __BATTLEGROUNDBB_H

#include "Battleground.h"
#include "BattlegroundScore.h"

enum BG_BB_Sounds
{
    BG_BB_SOUND_NEAR_VICTORY                = 8456, /// @todo: Not confirmed yet
    BG_BB_SOUND_ALLIANCE_ASSAULTS           = 8212, //tower, grave + enemy boss if someone tries to attack him
    BG_BB_SOUND_HORDE_ASSAULTS              = 8174,
    BG_BB_SOUND_ALLIANCE_GOOD               = 8173, //if something good happens for the team:  wins(maybe only through killing the boss), captures mine or grave, destroys tower and defends grave
    BG_BB_SOUND_HORDE_GOOD                  = 8213,
    BG_BB_SOUND_BOTH_TOWER_DEFEND           = 8192,
    BG_BB_SOUND_ALLIANCE_CAPTAIN            = 8232, //gets called when someone attacks them and at the beginning after 3min+rand(x)*10sec (maybe buff)
    BG_BB_SOUND_HORDE_CAPTAIN               = 8333,
    BG_BB_SOUND_CLAIMED                     = 8192,
};

enum BG_BB_Nodes
{
    BG_BB_NODES_TOWER_A_T1,
    BG_BB_NODES_TOWER_A_T2,
    BG_BB_NODES_TOWER_A_M1,
    BG_BB_NODES_TOWER_A_M2,
    BG_BB_NODES_TOWER_A_B1,
    BG_BB_NODES_TOWER_A_B2,
    BG_BB_NODES_TOWER_H_T1,
    BG_BB_NODES_TOWER_H_T2,
    BG_BB_NODES_TOWER_H_M1,
    BG_BB_NODES_TOWER_H_M2,
    BG_BB_NODES_TOWER_H_B1,
    BG_BB_NODES_TOWER_H_B2,
    BG_BB_NODES_NEXUS_A,
    BG_BB_NODES_NEXUS_H,
    BG_BB_NODES_MAX,
};

enum BG_BB_ObjectTypes
{
    BG_BB_OBJECT_MAX = 0
};

enum BG_BB_ItemIds
{
    BG_BB_ITEMID_COLLECT = 60086,
    BG_BB_ITEMID_SHARD = 60087,
};

enum BG_BB_ObjectIds
{
    // bush?
};

const uint32 BG_BB_GraveyardIds[BG_TEAMS_COUNT] = { 1950, 1951 };

enum BG_BB_CreatureEntry
{
    BG_BB_TOWER_A_ENTRY = 1000364,
    BG_BB_TOWER_H_ENTRY = 1000365,
    BG_BB_NEXUS_A_ENTRY = 1000366,
    BG_BB_NEXUS_H_ENTRY = 1000367,
    BG_BB_VENDOR_A_ENTRY = 1000362,
    BG_BB_VENDOR_H_ENTRY = 1000363,
    BG_BB_CREEP_A = 1000360,
    BG_BB_CREEP_H = 1000361,
};

enum BG_BB_CreatureType
{
    BG_BB_CREA_TOWER_A_1 = 0,
    BG_BB_CREA_TOWER_A_T1 = 0, BG_BB_CREA_TOWER_A_M1 = 2, BG_BB_CREA_TOWER_A_B1 = 4,
    BG_BB_CREA_TOWER_H_1 = 6,
    BG_BB_CREA_TOWER_H_T1 = 6, BG_BB_CREA_TOWER_H_M1 = 8, BG_BB_CREA_TOWER_H_B1 = 10,
    BG_BB_CREA_TOWER_MAX  = 12,
    BG_BB_CREA_NEXUS_A = 12, BG_BB_CREA_NEXUS_H,
    BG_BB_CREA_VENDOR_A,
    BG_BB_CREA_VENDOR_H,
    BG_BB_CREA_MAX,
};

const float BG_BB_CreaturePos[BG_BB_CREA_MAX][4] =
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

const uint32 BG_BB_NextPoint[18] =
{
    BG_BB_CREA_NEXUS_A, BG_BB_CREA_TOWER_A_T1,
    BG_BB_CREA_NEXUS_A, BG_BB_CREA_TOWER_A_M1,
    BG_BB_CREA_NEXUS_A, BG_BB_CREA_TOWER_A_B1,
    BG_BB_CREA_NEXUS_H, BG_BB_CREA_TOWER_H_T1,
    BG_BB_CREA_NEXUS_H, BG_BB_CREA_TOWER_H_M1,
    BG_BB_CREA_NEXUS_H, BG_BB_CREA_TOWER_H_B1,
};

enum BG_BB_WorldStates
{
    BG_BB_WS_A_TOWERCOUNT      = 22100,
    BG_BB_WS_H_TOWERCOUNT        = 22101,
    BG_BB_WS_CREEPKILLED        = 22103,
};

//alliance_control alliance_assault h_control h_assault
const uint32 BG_BB_NodeWorldStates[20][4] =
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
inline BG_BB_Nodes &operator++(BG_BB_Nodes &i){ return i = BG_BB_Nodes(i + 1); }

enum BG_BB_Objectives
{
    BB_OBJECTIVE_CREEPS_KILLED = 42,
    BB_OBJECTIVE_ARCANE_FRAG = 44
};

struct BattlegroundBBScore final : public BattlegroundScore
{
    friend class BattlegroundBB;

    protected:
        BattlegroundBBScore(uint64 playerGuid) : BattlegroundScore(playerGuid), CreepsKilled(0), ArcaneFrag(0) { }

        void UpdateScore(uint32 type, uint32 value) override
        {
            switch (type)
            {
                case BB_OBJECTIVE_CREEPS_KILLED:
                    CreepsKilled += value;
                    break;
                case BB_OBJECTIVE_ARCANE_FRAG:
                    ArcaneFrag += value;
                    break;
                default:
                    BattlegroundScore::UpdateScore(type, value);
                    break;
            }
        }

        void BuildObjectivesBlock(WorldPacket& data) final
        {
            data << uint32(2);
            data << uint32(CreepsKilled);
            data << uint32(ArcaneFrag);
        }

        uint32 CreepsKilled;
        uint32 ArcaneFrag;
};

class BattlegroundBB : public Battleground
{
    public:
        BattlegroundBB();
        ~BattlegroundBB();

        void AddPlayer(Player* player);
        void StartingEventCloseDoors();
        void StartingEventOpenDoors();

        void RemovePlayer(Player* player, uint64 guid, uint32 team);
        void HandleAreaTrigger(Player* Source, uint32 Trigger);
        bool SetupBattleground();
        void ResetBGSubclass();

        /*handlestuff*/ //these are functions which get called from extern
        void HandleKillPlayer(Player* player, Player* killer);
        void HandleKillUnit(Creature* unit, Player* killer);

        void EventPlayerDestroyedPoint(BG_BB_Nodes node);
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
