#ifndef __BATTLEGROUNDBA_H
#define __BATTLEGROUNDBA_H

#include "Battleground.h"

enum BG_BA_SpellEntry
{
    BG_BA_SP_FLAG_A = 90001,
    BG_BA_SP_FLAG_H = 90000,
};

enum BG_BA_ObjectEntry
{
    BG_BA_GOB_FLAG_A = 179835,
    BG_BA_GOB_FLAG_H = 179836,
};

enum BG_BA_ObjectTypes
{
    BG_BA_OBJECT_MAX = 0
};

enum BG_BA_CreatureEntry
{
    BG_BA_NPC_NODE_A = 1000360,
    BG_BA_NPC_NODE_H = 1000361,
    BG_BA_NPC_COMMANDER_A = 1000362,
    BG_BA_NPC_COMMANDER_H = 1000363,
};

enum BG_BA_CreatureType
{
    BG_BA_CREA_NODE_A_1 = 0,
    BG_BA_CREA_NODE_A_T1 = 0, BG_BA_CREA_NODE_A_M1 = 2, BG_BA_CREA_NODE_A_B1 = 4,
    BG_BA_CREA_NODE_H_1 = 6,
    BG_BA_CREA_NODE_H_T1 = 6, BG_BA_CREA_NODE_H_M1 = 8, BG_BA_CREA_NODE_H_B1 = 10,
    BG_BA_CREA_NODE_MAX  = 12,
    BG_BA_CREA_NEXUS_A = 12, BG_BA_CREA_NEXUS_H,
    BG_BA_CREA_VENDOR_A,
    BG_BA_CREA_VENDOR_H,
    BG_BA_CREA_MAX,
};

const float BG_BA_CreaturePos[BG_BA_CREA_MAX][4] =
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

const uint32 BG_BA_GraveyardIds[BG_TEAMS_COUNT] = { 1952, 1953 };

class BANode;
typedef std::map<uint32, BANode*> BANodeMap;
typedef std::map<uint64, Creature*> BACommanderMap;
class BANode
{
    public:
        BANode(uint32 id, uint32 team, Creature* base) { Id = id; m_team = team; m_base = base; }
        ~BANode() { }

        void SetId(uint32 id) { Id = id; }
        uint32 GetId() { return Id; }
        void SetTeam(uint32 team) { m_team = team; }
        uint32 GetTeam() { return m_team; }
        void SetBase(Creature* base) { m_base = base; }
        Creature* GetBase() { return m_base; }
        void AddCommander(Creature* commander) { m_commanders[commander->GetGUID()] = commander; }
        void RemoveCommander(uint64 guid) { BACommanderMap::iterator itr = m_commanders.find(guid); if (itr != m_commanders.end()) { delete itr->second; m_commanders.erase(itr); } }
        BACommanderMap GetCommanders() { return m_commanders; }
        void FlagsP() { m_flags++; } void FlagsM() { m_flags--; }
        void SetFlags(uint32 flags) { m_flags = flags; }
        uint32 GetFlags() { return m_flags; }
        void AddEnemy(BANode* enemy) { m_Enemies[enemy->GetId()] = enemy; }
        void RemoveEnemy(uint32 id) { BANodeMap::iterator itr = m_Enemies.find(id); if (itr != m_Enemies.end()) { delete itr->second; m_Enemies.erase(itr); } }
        BANodeMap GetEnemies() { return m_Enemies; }

    private:
        uint32 Id;
        uint32 m_team;
        Creature* m_base;
        BACommanderMap m_commanders;
        uint32 m_flags;
        BANodeMap m_Enemies;
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
        
        BANodeMap const& GetNodes() const { return m_Nodes; }

        BANode* AddNode(uint32 id, uint32 team, Creature* base);
        void RemoveNode(uint32 id);
        BANode* const GetNode(uint32 id);

        /*variables*/
        uint32 m_pts[BG_TEAMS_COUNT];

    private:
        void PostUpdateImpl(uint32 diff);

        /*worldstates*/
        void FillInitialWorldStates(WorldPacket& data);

        /*variables*/
        int32 m_wavetimer;
        BANodeMap m_Nodes;
};

#endif
