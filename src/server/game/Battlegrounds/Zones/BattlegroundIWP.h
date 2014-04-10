#ifndef __BATTLEGROUNdIWP_H
#define __BATTLEGROUNdIWP_H

#include "BattlegroundMgr.h"

enum BG_IWP_SpellEntry
{
    BG_IWP_SP_FLAG_A = 90001,
    BG_IWP_SP_FLAG_H = 90000,
};

enum BG_IWP_CreatureEntry
{
    BG_IWP_NPC_CREEP_A = 1000400,
    BG_IWP_NPC_CREEP_H = 1000401,
    BG_IWP_NPC_BOSS_A = 1000400,
    BG_IWP_NPC_BOSS_H = 1000401,
};

enum BG_IWP_CreatureType
{
    BG_IWP_CREA_BOSS_A,
    BG_IWP_CREA_BOSS_H,
    BG_IWP_CREA_MAX,
};

const float BG_IWP_CreaturePos[BG_IWP_CREA_MAX][4] =
{
    {-5263.204590f, -0.234453f, 39.183247f, 3.195785f},
    {-5629.822f, 411.894f, -1.355f, 6.227f},
};

enum BG_IWP_LANES
{
    BG_IWP_LANE_TOP,
    BG_IWP_LANE_BOT,
    BG_IWP_LANE_MID,
    BG_IWP_LANE_MAX
};
#define BG_IWP_CREEPS_MAX 20

enum BG_IWP_ObjectEntry
{
    BG_IWP_ENTRY_WALL = 190376,
};

enum BG_IWP_ObjectTypes
{
    BG_IWP_OB_WALL,
    BG_IWP_OB_MAX,
};

const float BG_IWP_ObjectPos[BG_IWP_OB_MAX][4] =
{
    { -5458.0f, 0.4f, 0.0f, 1.6f},
};

const uint32 BG_IWP_GraveyardIds[BG_TEAMS_COUNT] = { 1954, 1955 };

struct BattlegroundIWPScore : public BattlegroundScore
{
    BattlegroundIWPScore() { }
    ~BattlegroundIWPScore() { }
};

class BattlegroundIWP : public Battleground
{
    public:
        BattlegroundIWP();
        ~BattlegroundIWP();

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

        void EndBattleground(uint32 winner);
        uint32 GetPrematureWinner();

        WorldSafeLocsEntry const* GetClosestGraveYard(Player* player);

        void CrushWall();
        void EraseCreep(uint64 guid, uint8 lane, uint8 teamid);

        /*variables*/
        uint32 m_pts[BG_TEAMS_COUNT];

    private:
        void PostUpdateImpl(uint32 diff);
        void SpawnCreeps(uint32 count);

        /*worldstates*/
        void FillInitialWorldStates(WorldPacket& data);

        /*variables */
        int32 m_Team_TowerCount[BG_TEAMS_COUNT];
        int32 m_WavesTimer;
        int32 m_WavesCount;
        bool m_WallFallen;
        int32 m_CreepsCount[BG_TEAMS_COUNT];
        std::map<uint64, Creature*> m_Creeps[BG_IWP_LANE_MAX][BG_TEAMS_COUNT];
        bool m_LastCreepWasTop[BG_TEAMS_COUNT];
};

#endif
