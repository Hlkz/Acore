#ifndef __BATTLEGROUNdSG_H
#define __BATTLEGROUNdSG_H

#include "Battleground.h"
#include "BattlegroundScore.h"
#include "Object.h"

enum BG_SG_ObjectEntry
{
    BG_SG_ENTRY_BANNER              = 180114,
    BG_SG_ENTRY_BANNER_A            = 180058,
    BG_SG_ENTRY_BANNER_CONT_A       = 180059,
    BG_SG_ENTRY_BANNER_H            = 180060,
    BG_SG_ENTRY_BANNER_CONT_H       = 180061,

    BG_SG_ENTRY_AURA_A              = 180100,
    BG_SG_ENTRY_AURA_H              = 180101,
    BG_SG_ENTRY_AURA_C              = 180102,

    BG_SG_ENTRY_GATE_A              = 180255,
    BG_SG_ENTRY_GATE_H              = 180256,

    BG_SG_ENTRY_FLAG_A              = 300100,
    BG_SG_ENTRY_FLAG_H              = 300101,
    BG_SG_ENTRY_FLAG_GROUND_A       = 300102,
    BG_SG_ENTRY_FLAG_GROUND_H       = 300103,
    BG_SG_ENTRY_WALL                = 300104
};

enum BG_SG_SpellId
{
    BG_SG_SPELL_TOP_FLAG            = 91000,
    BG_SG_SPELL_TOP_FLAG_DROPPED    = 91001,
    BG_SG_SPELL_TOP_FLAG_PICKED     = 61265,    // fake spell, does not exist but used as timer start event
    BG_SG_SPELL_BOT_FLAG            = 91002,
    BG_SG_SPELL_BOT_FLAG_DROPPED    = 91003,
    BG_SG_SPELL_BOT_FLAG_PICKED     = 61266,    // fake spell, does not exist but used as timer start event
    BG_SG_SPELL_FOCUSED_ASSAULT     = 91004,
    BG_SG_SPELL_BRUTAL_ASSAULT      = 91005
};

enum BG_SG_FlagState
{
    BG_SG_FLAG_STATE_ON_BASE      = 0,
    BG_SG_FLAG_STATE_WAIT_RESPAWN = 1,
    BG_SG_FLAG_STATE_ON_PLAYER    = 2,
    BG_SG_FLAG_STATE_ON_GROUND    = 3,
    BG_SG_FLAG_STATE_DESPAWN      = 4
};

enum BG_SG_BattlegroundNodes
{
    BG_SG_FIRST_NODE            = 0,
    BG_SG_NODE_TOPCASTLE        = 0,
    BG_SG_NODE_TOPLEFT          = 1,
    BG_SG_NODE_TOPRIGHT         = 2,
    BG_SG_NODE_BOTCASTLE        = 3,
    BG_SG_NODE_BOTLEFT          = 4,
    BG_SG_NODE_BOTRIGHT         = 5,

    BG_SG_DYNAMIC_NODES_COUNT   = 6,                        // dynamic nodes that can be captured
    BG_SG_ALL_NODES_COUNT       = 6                         // all nodes (dynamic and static)
};

enum BG_SG_NodeStatus
{
    BG_SG_NODE_TYPE_NEUTRAL             = 0,
    BG_SG_NODE_TYPE_CONTESTED           = 1,
    BG_SG_NODE_STATUS_ALLY_CONTESTED    = 1,
    BG_SG_NODE_STATUS_HORDE_CONTESTED   = 2,
    BG_SG_NODE_TYPE_OCCUPIED            = 3,
    BG_SG_NODE_STATUS_ALLY_OCCUPIED     = 3,
    BG_SG_NODE_STATUS_HORDE_OCCUPIED    = 4
};

enum BG_SG_Sounds
{
    BG_SG_SOUND_FLAG_CAPTURED_ALLIANCE  = 8173,
    BG_SG_SOUND_FLAG_CAPTURED_HORDE     = 8213,
    BG_SG_SOUND_FLAG_PLACED             = 8232,
    BG_SG_SOUND_FLAG_RETURNED           = 8192,
    BG_SG_SOUND_HORDE_FLAG_PICKED_UP    = 8212,
    BG_SG_SOUND_ALLIANCE_FLAG_PICKED_UP = 8174,
    BG_SG_SOUND_FLAGS_RESPAWNED         = 8232,

    BG_SG_SOUND_NODE_CLAIMED            = 8192,
    BG_SG_SOUND_NODE_CAPTURED_ALLIANCE  = 8173,
    BG_SG_SOUND_NODE_CAPTURED_HORDE     = 8213,
    BG_SG_SOUND_NODE_ASSAULTED_ALLIANCE = 8212,
    BG_SG_SOUND_NODE_ASSAULTED_HORDE    = 8174,
    BG_SG_SOUND_NEAR_VICTORY            = 8456
};

Position const BG_SG_NodePositions[BG_SG_DYNAMIC_NODES_COUNT] =
{
    {-5333.911621f, -22.338478f, 17.571016f, 3.079528f},    // Top Castle
    {-5360.165527f, 84.619232f, 5.961283f, 3.150036f},      // Top Left
    {-5363.530762f, -86.244675f, 5.811011f, 3.210246f},     // Top Right
    {-5584.494141f, 19.899845f, 16.944483f, 6.270202f},     // Bot Castle
    {-5554.310547f, 85.910332f, 6.588565f, 0.038985f},      // Bot Left
    {-5559.531250f, -83.388077f, 5.187103f, 6.271991f}      // Bot Right
};

Position const BG_SG_WallPosition = {-5458.0f, 0.4f, 0.0f, 1.6f};

const Position BG_SG_DoorPositions[2] =
{
    {-5297.939941f, -0.275404f, 20.547562f, 3.112791f},
    {-5621.741211f, -0.673010f, 19.983755f, 6.279034f}
};

enum BG_SG_CreatureEntry
{
    BG_SG_NPC_COMMANDER_A   = 1000400,
    BG_SG_NPC_COMMANDER_H   = 1000401,
    BG_SG_NPC_SPIRIT_A      = 1000401,
    BG_SG_NPC_SPIRIT_H      = 1000401
};

enum BG_SG_CreatureType
{
    BG_SG_CREA_COMMANDER_A,
    BG_SG_CREA_COMMANDER_H,
    BG_SG_CREA_SPIRIT_TOP,
    BG_SG_CREA_SPIRIT_BOT,
    BG_SG_CREA_MAX
};

const Position BG_SG_CreaturePos[BG_SG_CREA_MAX] =
{
    {-5263.204590f, -0.234453f, 39.183247f, 3.195785f},
    {-5656.943359f, -0.053149f, 38.619267f, 6.224021f},
    {-5273.337402f, -7.004924f, 21.786064f, 1.401316f},
    {-5646.089844f, 3.509330f, 21.222200f, 4.413930f}
};


const Position BG_SG_FlagPositions[BG_TEAMS_COUNT] =
{
    {-5305.731934f, 0.249082f, 20.547823f, 3.109895f},
    {-5614.048828f, -0.775325f, 19.983828f, 0.005889f}
};

const Position BG_SG_BuffPositions[5] =
{
    {-5455.428223f, -0.482691f, 5.024897f, 0.005016f},      // speed
    {-5481.371094f, 130.941925f, 7.665468f, 4.671815f},      // heal
    {-5438.705566f, -130.740585f, 5.810061f, 1.440335f},
    {-5460.574707f, 60.970158f, 22.735567f, 6.232051f},     // berserk
    {-5462.164551f, -63.153919f, 22.944208f, 3.127985f}
};

enum BG_SG_LANES
{
    BG_SG_LANE_TOP,
    BG_SG_LANE_BOT,
    BG_SG_LANE_MID,
    BG_SG_LANE_MAX
};
#define BG_SG_CREEPS_MAX 20

enum BG_SG_ObjectTypes
{
    // for all 6 node points 8*6=48 objects
    BG_SG_OBJECT_BANNER_NEUTRAL          = 0,
    BG_SG_OBJECT_BANNER_CONT_A           = 1,
    BG_SG_OBJECT_BANNER_CONT_H           = 2,
    BG_SG_OBJECT_BANNER_ALLY             = 3,
    BG_SG_OBJECT_BANNER_HORDE            = 4,
    BG_SG_OBJECT_AURA_ALLY               = 5,
    BG_SG_OBJECT_AURA_HORDE              = 6,
    BG_SG_OBJECT_AURA_CONTESTED          = 7,
    BG_SG_BANNER_MAX                     = 8,
    //gates
    BG_SG_OBJECT_GATE_A                  = 48,
    BG_SG_OBJECT_GATE_H                  = 49,
    //buffs
    BG_SG_OBJECT_SPEEDBUFF               = 50,
    BG_SG_OBJECT_REGENBUFF_LEFT          = 51,
    BG_SG_OBJECT_REGENBUFF_RIGHT         = 52,
    BG_SG_OBJECT_BERSERKBUFF_LEFT        = 53,
    BG_SG_OBJECT_BERSERKBUFF_RIGHT       = 54,
    BG_SG_OBJECT_WALL                    = 55,
    BG_SG_OBJECT_FLAG_A                  = 56,
    BG_SG_OBJECT_FLAG_H                  = 57,
    BG_SG_OBJECT_MAX                     = 58
};

enum BG_SG_Timers
{
    BG_SG_FLAG_RESPAWN_TIME     = 23000,
    BG_SG_FLAG_DROP_TIME        = 10000,
    BG_SG_SPELL_FORCE_TIME      = 600000,
    BG_SG_SPELL_BRUTAL_TIME     = 900000,
    BG_SG_FLAG_CAPTURING_TIME   = 60000
};

const uint32 BG_SG_GraveyardIds[BG_TEAMS_COUNT] = { 1954, 1955 };

struct BG_SG_BannerTimer
{
    uint32      timer;
    uint8       type;
    uint8       teamIndex;
};

typedef std::map<ObjectGuid, Creature*> SGCreepMap;

struct BattlegroundSGScore final : public BattlegroundScore
{
    friend class BattlegroundSG;

    protected:
        BattlegroundSGScore(ObjectGuid playerGuid) : BattlegroundScore(playerGuid) { }

        void UpdateScore(uint32 type, uint32 value) override
        {
            BattlegroundScore::UpdateScore(type, value);
        }

        void BuildObjectivesBlock(WorldPacket& data) final
        {
            data << uint32(0);
        }
};

class BattlegroundSG : public Battleground
{
    public:
        BattlegroundSG();
        ~BattlegroundSG();

        void AddPlayer(Player* player) override;
        void StartingEventCloseDoors() override;
        void StartingEventOpenDoors() override;

        void RemovePlayer(Player* player, ObjectGuid guid, uint32 team) override;
        void HandleAreaTrigger(Player* Source, uint32 Trigger) override;
        bool SetupBattleground() override;
        void Reset() override;
        void EndBattleground(uint32 winner) override;
        uint32 GetPrematureWinner() override;
        void ResetBGSubclass() override;

        /*handlestuff*/ //these are functions which get called from extern
        void HandleKillPlayer(Player* player, Player* killer) override;
        void HandleKillUnit(Creature* unit, Player* killer) override;

        WorldSafeLocsEntry const* GetClosestGraveYard(Player* player) override;

        void CrushWall();

        /*variables*/
        uint32 m_pts[BG_TEAMS_COUNT];

    private:
        void PostUpdateImpl(uint32 diff);

        /* BG Flags */
        ObjectGuid GetFlagPickerGUID(int32 team) const override
        {
            if (team == TEAM_ALLIANCE || team == TEAM_HORDE)
                return m_FlagKeepers[team];
            return ObjectGuid::Empty;
        }
        void SetAllianceFlagPicker(ObjectGuid guid) { m_FlagKeepers[TEAM_ALLIANCE] = guid; }
        void SetHordeFlagPicker(ObjectGuid guid)    { m_FlagKeepers[TEAM_HORDE] = guid; }
        bool IsAllianceFlagPickedup() const         { return !m_FlagKeepers[TEAM_ALLIANCE].IsEmpty(); }
        bool IsHordeFlagPickedup() const            { return !m_FlagKeepers[TEAM_HORDE].IsEmpty(); }
        void RespawnFlag(uint32 Team, bool captured);
        void RespawnFlagAfterDrop(uint32 Team);
        uint8 GetFlagState(uint32 team)             { return _flagState[GetTeamIndexByTeamId(team)]; }

        /* Battleground Events */
        void EventPlayerDroppedFlag(Player* player) override;
        void EventPlayerClickedOnFlag(Player* player, GameObject* target_obj) override;
        void EventPlayerCapturedFlag(Player* player);

        /* Gameobject spawning/despawning */
        void _CreateBanner(uint8 node, uint8 type, uint8 teamIndex, bool delay);
        void _DelBanner(uint8 node, uint8 type, uint8 teamIndex);
        void _SendNodeUpdate(uint8 node);

        /* Creature spawning/despawning */
        /// @todo working, scripted peons spawning
        void _NodeOccupied(uint8 node, Team team);
        void _NodeDeOccupied(uint8 node);

        int32 _GetNodeNameId(uint8 node);

        void UpdateFlagState(uint32 team, uint32 value);
        void SetLastFlagCapture(uint32 team)                { _lastFlagCaptureTeam = team; }
        void SetDroppedFlagGUID(ObjectGuid guid, int32 team = -1) override
        {
            if (team == TEAM_ALLIANCE || team == TEAM_HORDE)
                m_DroppedFlagGUID[team] = guid;
        }
        void UpdateFlagCastTime(uint8 teamIndex, bool both = false);

        ObjectGuid GetDroppedFlagGUID(uint32 TeamID)             { return m_DroppedFlagGUID[GetTeamIndexByTeamId(TeamID)]; }
        void FillInitialWorldStates(WorldPacket& data) override;

        /*variables */
        bool m_isCommanderAlive[BG_TEAMS_COUNT];
        bool m_WallFallen;

        ObjectGuid m_FlagKeepers[2];                            // 0 - alliance, 1 - horde
        ObjectGuid m_DroppedFlagGUID[2];
        uint8 _flagState[2];                               // for checking flag state
        int32 _flagsTimer[2];
        int32 _flagsDropTimer[2];
        uint32 _lastFlagCaptureTeam;                       // Winner is based on this if score is equal

        int32 _flagSpellForceTimer;
        bool _bothFlagsKept;
        uint8 _flagDebuffState;                            // 0 - no debuffs, 1 - focused assault, 2 - brutal assault
        uint8 _minutesElapsed;

        uint8               m_Nodes[BG_SG_DYNAMIC_NODES_COUNT];
        uint8               m_prevNodes[BG_SG_DYNAMIC_NODES_COUNT];
        BG_SG_BannerTimer   m_BannerTimers[BG_SG_DYNAMIC_NODES_COUNT];
        uint32              m_NodeTimers[BG_SG_DYNAMIC_NODES_COUNT];
};

#endif
