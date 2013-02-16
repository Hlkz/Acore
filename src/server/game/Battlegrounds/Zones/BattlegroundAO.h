#ifndef __BATTLEGROUNDAO_H
#define __BATTLEGROUNDAO_H

#include "Battleground.h"

enum BG_AO_WorldStates
{
    BG_AO_OP_OCCUPIED_BASES_HORDE       = 1778,
    BG_AO_OP_OCCUPIED_BASES_ALLY        = 1779,
    BG_AO_OP_RESOURCES_ALLY             = 1776,
    BG_AO_OP_RESOURCES_HORDE            = 1777,
    BG_AO_OP_RESOURCES_MAX              = 1780,
    BG_AO_OP_RESOURCES_WARNING          = 1955
};

const uint32 BG_AO_OP_NODESTATES[7] =    {3001, 3011, 3021, 3031, 3041, 3051, 3061};

const uint32 BG_AO_OP_NODEICONS[7]  =    {3000, 3010, 3020, 3030, 3040, 3050, 3060};

/* Note: code uses that these IDs follow each other */
enum BG_AO_NodeObjectId
{
    BG_AO_OBJECTID_NODE_BANNER_0    = 180107,       // Sanctum banner
    BG_AO_OBJECTID_NODE_BANNER_1    = 180108,       // Palais banner
    BG_AO_OBJECTID_NODE_BANNER_2    = 180109,       // Puit banner
    BG_AO_OBJECTID_NODE_BANNER_3    = 180110,       // Ruines banner
    BG_AO_OBJECTID_NODE_BANNER_4    = 180111,       // Lac banner
    BG_AO_OBJECTID_NODE_BANNER_5    = 180112,       // Catacombes banner
    BG_AO_OBJECTID_NODE_BANNER_6    = 180113        // Temple banner
};

enum BG_AO_ObjectType
{
    // for all 7 node points 8*7=56 objects
    BG_AO_OBJECT_BANNER_NEUTRAL          = 0,
    BG_AO_OBJECT_BANNER_CONT_A           = 1,
    BG_AO_OBJECT_BANNER_CONT_H           = 2,
    BG_AO_OBJECT_BANNER_ALLY             = 3,
    BG_AO_OBJECT_BANNER_HORDE            = 4,
    BG_AO_OBJECT_AURA_ALLY               = 5,
    BG_AO_OBJECT_AURA_HORDE              = 6,
    BG_AO_OBJECT_AURA_CONTESTED          = 7,
    //buffs
    BG_AO_OBJECT_SPEEDBUFF_STABLES       = 56,
    BG_AO_OBJECT_REGENBUFF_STABLES       = 57,
    BG_AO_OBJECT_BERSERKBUFF_STABLES     = 58,

    BG_AO_OBJECT_MAX                     = 59
};

/* Object id templates from DB */
enum BG_AO_ObjectTypes
{
    BG_AO_OBJECTID_BANNER_A             = 180058,
    BG_AO_OBJECTID_BANNER_CONT_A        = 180059,
    BG_AO_OBJECTID_BANNER_H             = 180060,
    BG_AO_OBJECTID_BANNER_CONT_H        = 180061,

    BG_AO_OBJECTID_AURA_A               = 180100,
    BG_AO_OBJECTID_AURA_H               = 180101,
    BG_AO_OBJECTID_AURA_C               = 180102,
};

enum BG_AO_Timers
{
    BG_AO_FLAG_CAPTURING_TIME           = 60000
};

enum BG_AO_Score
{
    BG_AO_MAX_TEAM_SCORE                = 2000
};

/* do NOT change the order, else wrong behaviour */
enum BG_AO_BattlegroundNodes
{
    BG_AO_NODE_SANCTUM			= 0,
    BG_AO_NODE_PALAIS		    = 1,
    BG_AO_NODE_PUITS	        = 2,
    BG_AO_NODE_RUINES		    = 3,
    BG_AO_NODE_LAC		        = 4,
    BG_AO_NODE_CATACOMBES       = 5,
    BG_AO_NODE_TEMPLE	        = 6,

    BG_AO_DYNAMIC_NODES_COUNT   = 7,                        // dynamic nodes that can be captured

    BG_AO_SPIRIT_ALIANCE        = 7,
    BG_AO_SPIRIT_HORDE          = 8,

    BG_AO_ALL_NODES_COUNT       = 9                         // all nodes (dynamic and static)
};

enum BG_AO_NodeStatus
{
    BG_AO_NODE_TYPE_NEUTRAL             = 0,
    BG_AO_NODE_TYPE_CONTESTED           = 1,
    BG_AO_NODE_STATUS_ALLY_CONTESTED    = 1,
    BG_AO_NODE_STATUS_HORDE_CONTESTED   = 2,
    BG_AO_NODE_TYPE_OCCUPIED            = 3,
    BG_AO_NODE_STATUS_ALLY_OCCUPIED     = 3,
    BG_AO_NODE_STATUS_HORDE_OCCUPIED    = 4
};

enum BG_AO_Sounds
{
    BG_AO_SOUND_NODE_CLAIMED            = 8192,
    BG_AO_SOUND_NODE_CAPTURED_ALLIANCE  = 8173,
    BG_AO_SOUND_NODE_CAPTURED_HORDE     = 8213,
    BG_AO_SOUND_NODE_ASSAULTED_ALLIANCE = 8212,
    BG_AO_SOUND_NODE_ASSAULTED_HORDE    = 8174,
    BG_AO_SOUND_NEAR_VICTORY            = 8456
};

// x, y, z, o
const float BG_AO_NodePositions[BG_AO_DYNAMIC_NODES_COUNT][4] =
{
    { -5220.876953f, 46.953575f, 4.131935f, 2.886742f},		// SANCTUM
    {-5275.479f, -600.858f, -22.92f, 1.5f},		// PALAIS
    {-5589.555664f, 200.720764f, 48.408962f, 6.139848f},	// PUITS
    {-5639.259766f, -286.192535f, 35.868763f, 3.184386f},	// RUINES
    {-5618.657f, -780.007f, -17.64f, 4.4f},     // LAC
    {-5875.652f, 36.29f, 4.171f, 5.9f},			// CATACOMBES
    {-5953.658f, -669.85f, 9.932f, 1.0f},		// TEMPLE

};

// Tick intervals and given points: case 0, 1, 2, 3, 4, 5 captured nodes
// const uint32 BG_AO_TickIntervals[8] = {0, 12000, 10000, 8000, 6000, 4000, 2000, 1000};

// WorldSafeLocs ids for 7 nodes, and for ally, and horde starting location
const uint32 BG_AO_GraveyardIds[BG_AO_ALL_NODES_COUNT] = {1751, 1752, 1753, 1754, 1755, 1756, 1757, 1749, 1750};

// x, y, z, o
const float BG_AO_SpiritGuidePos[BG_AO_ALL_NODES_COUNT][4] =
{
    {-5386.287598f, -23.405453f, 2.260530f, 5.496217f},		// SANCTUM
    {-5379.100586f, -570.493774f, -22.859629f, 0.119578f},		// PALAIS
    {-5555.607422f, 239.693176f, 46.319450f, 1.621639f},		// PUIT
    {-5615.315430f, -138.574020f, 2.389513f, 2.661840f},		// RUINES
    {-5654.692871f, -809.568237f, -89.913498f, 5.287887f},		// LAC
    {-5797.379395f, 128.326675f, -2.847505f, 4.325370f},		// CATACOMBES
    {-5736.541016f, -549.076477f, -0.984098f, 0.326719f},	// TEMPLE
    {-5144.786133f, -261.154907f, 17.076521f, 1.459654f},	// A2
    {-6146.755859f, -199.270859f, -0.118240f, 1.681535f},	// H2
};

struct BG_AO_BannerTimer
{
    uint32      timer;
    uint8       type;
    uint8       teamIndex;
};

struct BattlegroundAOScore : public BattlegroundScore
{
    BattlegroundAOScore(): BasesAssaulted(0), BasesDefended(0) { }
    ~BattlegroundAOScore() { }
    uint32 BasesAssaulted;
    uint32 BasesDefended;
};

class BattlegroundAO : public Battleground
{
    public:
        BattlegroundAO();
        ~BattlegroundAO();

        void AddPlayer(Player* player);
        void StartingEvent();
        void RemovePlayer(Player* player, uint64 guid, uint32 team);
        bool SetupBattleground();
        void Reset();
        WorldSafeLocsEntry const* GetClosestGraveYard(Player* player);

        /* Scorekeeping */
        void UpdatePlayerScore(Player* Source, uint32 type, uint32 value, bool doAddHonor = true);

        void FillInitialWorldStates(WorldPacket& data);

        /* Nodes occupying */
        void EventPlayerClickedOnFlag(Player* source, GameObject* target_obj);

    private:
        void PostUpdateImpl(uint32 diff);
        /* Gameobject spawning/despawning */
        void _CreateBanner(uint8 node, uint8 type, uint8 teamIndex, bool delay);
        void _DelBanner(uint8 node, uint8 type, uint8 teamIndex);
        void _SendNodeUpdate(uint8 node);

        /* Creature spawning/despawning */
        // TODO: working, scripted peons spawning
        void _NodeOccupied(uint8 node, Team team);
        void _NodeDeOccupied(uint8 node);

        int32 _GetNodeNameId(uint8 node);

        /* Nodes info:
            0: neutral
            1: ally contested
            2: horde contested
            3: ally occupied
            4: horde occupied     */
        uint8               m_Nodes[BG_AO_DYNAMIC_NODES_COUNT];
        uint8               m_prevNodes[BG_AO_DYNAMIC_NODES_COUNT];
        BG_AO_BannerTimer   m_BannerTimers[BG_AO_DYNAMIC_NODES_COUNT];
        uint32              m_NodeTimers[BG_AO_DYNAMIC_NODES_COUNT];
        uint32              m_lastTick[BG_TEAMS_COUNT];
};
#endif
