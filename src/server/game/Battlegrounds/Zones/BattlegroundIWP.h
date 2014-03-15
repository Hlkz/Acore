#ifndef __BATTLEGROUNdIWP_H
#define __BATTLEGROUNdIWP_H

#include "Battleground.h"

enum BG_IWP_SpellEntry
{
    BG_IWP_SP_FLAG_A = 90001,
    BG_IWP_SP_FLAG_H = 90000,
};

enum BG_IWP_ObjectEntry
{
    BG_IWP_GOB_FLAG_A = 179833,
    BG_IWP_GOB_FLAG_H = 179834,
};

enum BG_IWP_ObjectTypes
{
    BG_IWP_OBJECT_MAX = 0
};

enum BG_IWP_CreatureEntry
{
    BG_IWP_NPC_NODE_A = 1000360,
    BG_IWP_NPC_NODE_H = 1000361,
    BG_IWP_NPC_COMMANDER_A = 1000362,
    BG_IWP_NPC_COMMANDER_H = 1000363,
};

enum BG_IWP_CreatureType
{
    BG_IWP_CREA_NODE_BASE_A,
    BG_IWP_CREA_NODE_SL_A,
    BG_IWP_CREA_NODE_SR_A,
    BG_IWP_CREA_NODE_M_A,
    BG_IWP_CREA_NODE_EL_A,
    BG_IWP_CREA_NODE_ER_A,
    BG_IWP_CREA_NODE_BASE_H,
    BG_IWP_CREA_NODE_SL_H,
    BG_IWP_CREA_NODE_SR_H,
    BG_IWP_CREA_NODE_M_H,
    BG_IWP_CREA_NODE_EL_H,
    BG_IWP_CREA_NODE_ER_H,
    BG_IWP_CREA_VENDOR_A,
    BG_IWP_CREA_VENDOR_H,
    BG_IWP_CREA_MAX,
};

const float BG_IWP_CreaturePos[BG_IWP_CREA_MAX][4] =
{
    {-5629.822f, 411.894f, -1.355f, 6.227f},
    {-5629.822f, 411.894f, -1.355f, 6.227f},
    {-5629.822f, 411.894f, -1.355f, 6.227f},
    {-5629.822f, 411.894f, -1.355f, 6.227f},
    {-5629.822f, 411.894f, -1.355f, 6.227f},
    {-5629.822f, 411.894f, -1.355f, 6.227f},
    {-5629.822f, 411.894f, -1.355f, 6.227f},
    {-5629.822f, 411.894f, -1.355f, 6.227f},
    {-5629.822f, 411.894f, -1.355f, 6.227f},
    {-5629.822f, 411.894f, -1.355f, 6.227f},
    {-5629.822f, 411.894f, -1.355f, 6.227f},
    {-5629.822f, 411.894f, -1.355f, 6.227f},
    {-5762.917f, 391.590f, 3.2899f, 6.225f}, // Vendors
    {-5503.889f, 210.334f, 2.5911f, 3.071f},
};

enum BG_IWP_CommanderStatus
{
    BG_IWP_COMMANDER_ENVA,
    BG_IWP_COMMANDER_RENF
};

const uint32 BG_IWP_GraveyardIds[BG_TEAMS_COUNT] = { 1952, 1953 };

class IWPNode;
typedef std::map<uint32, IWPNode*> IWPNodeMap;
typedef std::map<uint64, Creature*> IWPCommanderMap;
class IWPNode
{
    public:
        IWPNode(uint32 id, uint32 team, Creature* base) { Id = id; m_team = team; m_base = base; }
        ~IWPNode() { }

        void SetId(uint32 id) { Id = id; }
        uint32 GetId() { return Id; }
        void SetTeam(uint32 team) { m_team = team; }
        uint32 GetTeam() { return m_team; }
        void SetBase(Creature* base) { m_base = base; } 
        Creature* GetBase() { return m_base; }
        void AddCommander(Creature* commander) { m_commanders[commander->GetGUID()] = commander; }
        void RemoveCommander(uint64 guid) { IWPCommanderMap::iterator itr = m_commanders.find(guid); if (itr != m_commanders.end()) { delete itr->second; m_commanders.erase(itr); } }
        IWPCommanderMap GetCommanders() { return m_commanders; }
        void FlagsP() { m_flags++; } void FlagsM() { m_flags--; } // Flags left to send
        void SetFlags(uint32 flags) { m_flags = flags; }
        uint32 GetFlags() { return m_flags; }
        void AddAlly(IWPNode* ally) { m_Allies[ally->GetId()] = ally; } // Allies
        void RemoveAlly(uint32 id) { IWPNodeMap::iterator itr = m_Allies.find(id); if (itr != m_Allies.end()) { delete itr->second; m_Allies.erase(itr); } }
        IWPNodeMap GetAllies() { return m_Allies; }
        void AddEnemy(IWPNode* enemy) { m_Enemies[enemy->GetId()] = enemy; } // Enemies
        void RemoveEnemy(uint32 id) { IWPNodeMap::iterator itr = m_Enemies.find(id); if (itr != m_Enemies.end()) { delete itr->second; m_Enemies.erase(itr); } }
        IWPNodeMap GetEnemies() { return m_Enemies; }

    private:
        uint32 Id;
        uint32 m_team;
        Creature* m_base;
        IWPCommanderMap m_commanders;
        uint32 m_flags;
        IWPNodeMap m_Allies;
        IWPNodeMap m_Enemies;
};

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
        
        IWPNodeMap const& GetNodes() const { return m_Nodes; }

        IWPNode* AddNode(uint32 id, uint32 team, Creature* base);
        void RemoveNode(uint32 id);
        IWPNode* const GetNode(uint32 id);

        /*variables*/
        uint32 m_pts[BG_TEAMS_COUNT];

    private:
        void PostUpdateImpl(uint32 diff);

        /*worldstates*/
        void FillInitialWorldStates(WorldPacket& data);

        /*variables*/
        int32 m_wavetimer;
        IWPNodeMap m_Nodes;
};

#endif
