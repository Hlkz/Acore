
#include "Common.h"
#include "DBCStores.h"
#include "FactionMgr.h"
#include "GuildMgr.h"

#ifndef __NODE_H
#define __NODE_H

enum NodeType
{
    NODE_POINT = 0,
    NODE_CAMP = 1,
    NODE_TOWN = 2, // Razor Hill
    NODE_CITY = 3,
    NODE_CAPITAL = 4, // Orgrimmar/Theramore etc.
    NODE_MAX_TYPE
};

const LocString NodeTypeString[NODE_MAX_TYPE] =
{
    ("Point", "Point"),
    ("Camp", "Camp"),
    ("Town", "Village"),
    ("City", "Ville"),
    ("Capital", "Capitale"),
};

enum NodeStatus
{
    NODE_STATUS_NEUTRAL,
    NODE_STATUS_ATTACKED,  // Guild | Faction
    NODE_STATUS_TAKEN,     // Guild | Faction
    NODE_STATUS_AT_PEACE,  // Guild | Faction
    NODE_MAX_STATUS
};

const LocString NodeStatusString[NODE_MAX_STATUS] =
{
    ("Contested", "Contesté"),
    ("Under attack", "Attaqué"),
    ("Occupied", "Occupé"),
    ("At peace", "En paix")
};

enum NodeTransition
{
    NODE_TRANS_NONE,
    NODE_TRANS_ATTACK,  // all except ATTACKED to ATTACKED
    NODE_TRANS_CAPTURE, // ATTACKED to TAKEN
    NODE_TRANS_PACIFY,  // TAKEN to AT_PEACE
    NODE_TRANS_GETBACK, // TAKEN to AT_PEACE
    NODE_TRANS_DEFEND,  // ATTACKED to AT_PEACE
    NODE_TRANS_LOOSE,   // all except NEUTRAL to NEUTRAL || ATTACKED to ATTACKED
};

enum NodeFlags
{
    NODE_FLAG_CONTINENT_ICON    = 0x04
};

// unused
enum NodeLeadType
{
    NODE_LEAD_NONE,                 // No leader
    NODE_LEAD_MONSTER,              // Non-faction monsters (kobold)
    NODE_LEAD_FACTION,              // Faction (kapitalrisk)
    NODE_LEAD_GUILD,                // Guild
    NODE_LEAD_GUILD_IN_FACTION,     // Guild rules for Faction (RazorHill belongs to Orgrimmar but som
    NODE_LEAD_PLAYER,               // Player
    NODE_LEAD_PLAYER_IN_FACTION,    // Player rules for Faction (RazorHill belongs to Orgrimmar but som
    NODE_LEAD_FACTION_IN_GUILD
};

// unused
enum NodeAttackFlags
{
    NODE_ATTACK_IMMUNE,
    NODE_ATTACK_OFFICIAL,
    NODE_ATTACK_PICKUP,
    NODE_ATTACK_COMMANDER
};

enum NodeLooseType
{
    NODE_LOOSE_IMMUNE,
    NODE_LOOSE_BY_CREATURE_KILLED,
    NODE_LOOSE_BY_GUARD_KILLED,
    NODE_LOOSE_BY_ACE,
    NODE_LOOSE_BY_BASE_ATTACK
};

enum NodeCaptureType
{
    NODE_CAPTURE_IMMUNE,
    NODE_CAPTURE_BY_TRIGGER,
    NODE_CAPTURE_BY_AREA,
    NODE_CAPTURE_BY_BASE,
    NODE_CAPTURE_BY_MULTI_BASE
};

#define NODE_PACIFY_TIME_STAGE 300000
const time_t NodePacifyTime[NODE_MAX_TYPE] =
{
    30 * MINUTE * IN_MILLISECONDS,
    30 * MINUTE * IN_MILLISECONDS,
    HOUR * IN_MILLISECONDS,
    HOUR * IN_MILLISECONDS,
    4 * HOUR * IN_MILLISECONDS
};

enum NodeTimeIntervals
{                               // ms
    NODE_BANNER_CAPTURING_TIME  = 60000,
    NODE_DECR_JUSTDIED_INVERVAL = 120000,
    NODE_WAVE_INVERVAL          = 10000 
};

enum NodeRelationLink
{
    NODE_LINK_DETACHED      = 0,
    NODE_LINK_PEDESTRIAN    = 1
};

enum NodeRelationRep
{
    NODE_REP_EXALTED    = -2,
    NODE_REP_HONORED    = -1,
    NODE_REP_NEUTRAL    = 0,
    NODE_REP_HOSTILE    = 1,
    NODE_REP_HATED      = 2
};

enum NodeBannerStatus
{
    NODE_BANNER_NEUTRAL,
    NODE_BANNER_CONTESTED,
    NODE_BANNER_TAKEN,
    NODE_BANNER_MAX
};

const uint32 NodeObjectId[NODE_BANNER_MAX] = { 180119, 180120, 180121 };

class Node;

struct NodeCreature
{
    Creature* creature;
    Node* node;
    uint32 Type; // unused for now
};
struct NodeRelation
{
    Node* Relation;
    uint32 Type;
    int32 Hostile;
    uint32 Path;
};

typedef std::map<ObjectGuid, Player*> PlayerMap;
typedef std::map<uint32, PlayerMap> NodeFactionPlayersMap;
typedef std::map<uint32, Guild*> GuildMap;
struct NodeBattleFaction
{
    Faction* faction;
    FactionMap FactionAllies;
    GuildMap GuildAllies;
};
struct NodeBattleGuild
{
    Guild* guild;
    FactionMap FactionAllies;
    GuildMap GuildAllies;
};
struct NodeGroup
{
    Group* group;
    Node* node;
    uint32 faction;
    uint32 guild;
};
typedef std::map<uint32, NodeBattleFaction*> NodeBattleFactionMap;
typedef std::map<uint32, NodeBattleGuild*> NodeBattleGuildMap;
typedef std::map<ObjectGuid, NodeGroup*> NodeGroupMap;

typedef std::map<uint32, Node*> NodeMap;
typedef std::map<uint32, NodeCreature*> NodeCreatureMap;
typedef std::map<uint32, NodeRelation*> NodeRelationMap;
typedef std::map<uint32, GameObject*> NodeBannerObjectMap;
struct NodeBanner
{
    Node* node;
    uint32 Index;
    uint32 Status;
    uint32 FactionId;
    uint32 GuildId;
    NodeBannerObjectMap Objects;
    uint32 Timer;
    uint32 SpawnTimer;
    GameObject* GetGameObject(uint32 status) { NodeBannerObjectMap::iterator itr = Objects.find(status); if (itr != Objects.end()) return itr->second; return NULL; }
};
typedef std::map<uint32, NodeBanner*> NodeBannerMap;
typedef std::map<ObjectGuid, NodeBanner*> NodeAllBannerMap;

class Node
{
    friend class NodeMgr;

    public:
        Node(uint32 id, LocString name, uint32 type, Map* map, float positionX, float positionY);
        Node(Map* map, Field* fields);
        ~Node() { }

        void Load(Field* fields);
        void Reset();
        void Delete();
        void Populate();
        void Depopulate();
        void InitCreature(NodeCreature* nodeCrea);

        void Update(uint32 diff);

        uint32 GetId() { return m_id; }
        uint32 GetType() { return m_type; }
        // Status
        uint32 GetStatus() { return m_status; };
        void SetStatus(uint32 status, uint32 trans, uint32 factionId, uint32 guildId);
        void SetStatus(uint32 status, uint32 trans = 0) { SetStatus(status, trans, m_factionId, m_guildId); }
        void setStatusOwner(uint32 status, uint32 trans, uint32 factionId, uint32 guildId);
        void SetFaction(uint32 factionId);
        void SetGuild(uint32 guildId);
        bool GetOwner(uint32 &factionId, uint32 &guildId) { factionId = m_factionId; guildId = m_guildId; return factionId || guildId; }
        void GetOwnerInfos(uint32 &factionId, uint32 &guildId, LocString &ownerName, uint32 &oldfactionId, uint32 &oldguildId, LocString &oldownerName);
        LocString GetOwnerName() { return m_faction ? m_faction->GetName() : m_guild ? m_guild->GetName() : LocString("Nobody", "Personne"); }
        Faction* GetFaction() { return m_faction; }
        Guild* GetGuild() { return m_guild; }
        LocString GetName() { return m_name; }
        void SetName(LocString name);
        float GetPositionX() { return m_position_x; }
        float GetPositionY() { return m_position_y; }
        void SetPosition(float positionX, float positionY);

        void AttackNode(Node* node);
        void StopAttackNode(Node* node);

        typedef std::map<uint64, Creature*> CommanderMap;
        void AddCommander(Creature* commander) { m_commanders[commander->GetGUID()] = commander; }
        void RemoveCommander(uint64 guid) { CommanderMap::iterator itr = m_commanders.find(guid); if (itr != m_commanders.end()) { delete itr->second; m_commanders.erase(itr); } }
        CommanderMap GetCommanders() { return m_commanders; }

        void AddFlag() { m_flags++; }
        void RemoveFlag() { m_flags--; }
        void SetFlags(uint32 flags) { m_flags = flags; }
        uint32 GetFlags() { return m_flags; }

        void AddCreature(uint32 guid, NodeCreature* nodeCreature);
        void RemoveCreature(uint32 guid);
        void AddRelation(uint32 id, uint32 type = 0, int32 hostile = 0, uint32 path = 0);
        NodeRelation* GetRelation(uint32 id) { NodeRelationMap::iterator itr = m_relations.find(id); if (itr != m_relations.end()) return itr->second; return NULL; }

        void SendWaves();
        void SendWave(NodeRelationMap::iterator itr);

        void HandleKilledCreature(NodeCreature* victim);

        Map* GetMap() { return m_map; };

        // Banner system
        NodeBanner* GetBanner(uint32 index) { for (NodeBannerMap::iterator itr = m_banners.begin(); itr != m_banners.end(); ++itr) if (itr->first == index) return itr->second; return NULL; }
        GameObject* AddBanner(uint32 entry, float x, float y, float z, float o, float rotation0, float rotation1, float rotation2, float rotation3, uint32 respawnTime = 0, GOState goState = GO_STATE_READY);
        void CreateBanner(NodeBanner* banner, bool delay = false);
        void SpawnBanner(NodeBanner* banner, uint32 respawntime, uint8 incrStatus = 0);
        void DelBanner(NodeBanner* banner, uint8 incrStatus = 0) { SpawnBanner(banner, 86400, incrStatus); }
        void EventPlayerClickedOnFlag(Player* source, GameObject* target_obj, NodeBanner* banner);

        void UpdateIcon(bool del = false);
        void UpdateIconUpdateString(bool del = false);
        bool CanBeAStartForPlayer(Player* player);
        WorldLocation GetStartLocation() { return m_startLocation; }
        void SetStartLocation(WorldLocation location);
        void RemoveStartLocation();

    private:
        // database: nodes table
        uint32 m_id;
        LocString m_name;
        Map* m_map;
        float m_position_x;
        float m_position_y;
        uint32 m_type;
        uint32 m_status;
        uint32 m_factionId;
        Faction* m_faction;
        uint32 m_guildId;
        Guild* m_guild;
        uint32 m_oldfactionId;
        Faction* m_oldfaction;
        uint32 m_oldguildId;
        Guild* m_oldguild;

        LocString m_iconUpdate;

        int32 m_flags;
        uint32 m_looseType;
        int32 m_looseData;
        uint32 m_captureType;
        int32 m_captureData1;
        int32 m_captureData2;
        time_t m_pacifyTimer;
        time_t m_pacifyTimerNext;

        uint32 m_areaId;
        uint32 m_zoneId;

		NodeFactionPlayersMap m_players;
		NodeGroupMap m_groups;
		NodeBattleFactionMap m_factions;
		NodeBattleGuildMap m_guilds;

        Creature* m_base;
        CommanderMap m_commanders;
        NodeCreatureMap m_creatures;
        NodeRelationMap m_relations;
        NodeBannerMap m_banners;

        bool m_isStart;
        WorldLocation m_startLocation;

        uint32 m_justDiedCount;
};

class NodeBattle
{
    friend class NodeMgr;

    public:
        NodeBattle() {}
        ~NodeBattle() {}

        void Update();

    private:
        // Concerned nodes
        NodeMap m_nodes;
        // Implicated in the fight
        NodeBattleFactionMap m_factions;
        NodeBattleGuildMap m_guilds;
        NodeGroupMap m_groups;
        PlayerMap m_pu;
};

typedef std::map<uint32, NodeBattle*> NodeBattleMap;

#endif
