#include "ScriptMgr.h"
#include "MapScript.h"
#include "Cell.h"
#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "TemporarySummon.h"

enum WE_BO_Phase
{
	WS_BO_PHASE_BOSS = 7,
	WS_BO_PHASE_BOSS_GROUND = 8,
	WS_BO_PHASE_PORTAL = 9,
};

const uint32 WE_BO_MAX_STEPS = 4;
const float WEBO_Steps_Positions[WE_BO_MAX_STEPS][4] =
{
    { 3039.730225f, -3379.340332f, 144.415665f, 5.737165f }, // 3=>4
    { 3124.804443f, -3447.446777f, 138.796890f, 5.440283f }, // 4=>5
    { 3151.570068f, -3513.052246f, 130.572220f, 5.042087f }, // 5=>6
    { 3175.049316f, -3581.414307f, 131.377457f, 4.876884f }  // 6=>7 WS_BO_PHASE_BOSS
};

enum WE_BO_WorldState
{
    WS_BO_WAVE_MOBS    = 22300,
    WS_BO_PHASE        = 22301,
    WS_BO_NODE_RESPAWN = 22302,
    WS_BO_NODE_MOBS    = 22303,
    WS_BO_PATROL_TIME  = 22304,
};

enum WE_BO_NPCENTRIES
{
    WE_BO_NPC_EMERALD_GUARD         = 1000032,
    WE_BO_NPC_EMERALD_SYLV          = 1000033,
    WE_BO_NPC_EMERALD_ORACLE        = 1000034,
    WE_BO_NPC_EMERALD_GUARD_ELITE   = 1000035,
    WE_BO_NPC_EMERALD_SYLV_ELITE    = 1000036,
    WE_BO_NPC_EMERALD_ORACLE_ELITE  = 1000037,
    WE_BO_NPC_EMERALD_PORTAL        = 1000038,
    WE_BO_NPC_STEP                  = 1000039,
    WE_BO_NPC_NEUTRAL               = 1000040,
    WE_BO_NPC_NEUTRAL_GUARD         = 1000041,
    WE_BO_NPC_NEUTRAL_GUARDA        = 1000042,
    WE_BO_NPC_NEUTRAL_GUARDH        = 1000043,
    WE_BO_NPC_BOSS_TRIGGER          = 1000046,
    WE_BO_NPC_EMERISS               = 100016,
};

const uint32 WE_BO_MAX_NODES = 24;
const float WEBO_Nodes[WE_BO_MAX_NODES][4] =
{
    { 3265.585205f, -3765.340088f, 127.423820f, 6.0f },
    { 3235.345703f, -3787.077148f, 123.589317f, 6.0f },
    { 3224.192383f, -3759.271729f, 121.749100f, 6.0f },
    { 3229.222656f, -3817.890625f, 128.195633f, 6.0f },
    { 3196.179199f, -3805.125977f, 122.375931f, 6.0f },
    { 3222.017334f, -3761.881592f, 121.768532f, 6.0f },
    { 3192.304199f, -3775.465332f, 121.180817f, 6.0f },
    { 3149.268311f, -3782.319824f, 122.164276f, 6.0f },
    { 3114.085449f, -3770.004883f, 124.629158f, 6.0f },
    { 3145.823486f, -3746.914551f, 121.932922f, 6.0f },
    { 3172.745605f, -3724.254883f, 123.538498f, 6.0f },
    { 3169.799072f, -3692.588135f, 121.580627f, 6.0f },
    { 3136.088867f, -3704.884766f, 120.379471f, 6.0f },
    { 3107.472900f, -3681.561279f, 118.626297f, 6.0f },
    { 3137.036621f, -3680.180420f, 120.294899f, 6.0f },
    { 3145.362549f, -3635.875000f, 123.346069f, 6.0f },
    { 3169.231445f, -3660.625732f, 122.161789f, 6.0f },
    { 3223.017334f, -3675.675537f, 124.658188f, 6.0f },
    { 3257.570801f, -3682.872559f, 123.559013f, 6.0f },
    { 3277.460449f, -3651.765137f, 132.846436f, 6.0f },
    { 3275.937012f, -3620.385010f, 136.978394f, 6.0f },
    { 3242.257080f, -3621.149414f, 131.865372f, 6.0f },
    { 3217.598145f, -3613.696045f, 130.860535f, 6.0f },
    { 3157.415527f, -3616.417480f, 128.333466f, 6.0f }
};

struct WEBONodes
{
    WEBONodes() : phase(0), count(0) {}
    uint32 phase;
    uint32 count;
	Position pos;
};

class mapevent_kalimdor : public WorldMapScript
{
public:
    mapevent_kalimdor() : WorldMapScript("mapevent_kalimdor", 1) { }

    WMScript* GetWMScript(Map* map) const
    {
        return new mapevent_kalimdor_WMS(map);
    }

    struct mapevent_kalimdor_WMS : public WMScript
    {
        mapevent_kalimdor_WMS(Map* map) : WMScript(map) {}
		
        public:

        void Initialize();
        void Update(uint32 diff);

        void OnCreatureCreate(Creature* creature);
        void OnCreatureRemove(Creature* creature);

        void SetData(uint32 type, uint32 data);
        uint64 GetData64(uint32 data) const;
        uint32 GetData(uint32 data) const;

        typedef std::map<uint32, WEBONodes*> WEBONodesMap;

        void ChangePhase(uint32 newphase);

        protected:
            int32 wave_timer;
            int32 wave_mobs;
            int32 patrol_timer;
            uint64 portal_guid;
            uint64 emeriss_guid;
            uint64 trigger_guid;
            uint64 neutral_guid;
            WEBONodesMap nodes;
            uint32 node_mobs;
            uint32 phase;
    };
};

void AddSC_mapevent_kalimdor();
