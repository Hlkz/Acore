
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
};

enum NodeStatus
{
    NODE_AT_PEACE,  // Guild | Faction
    NODE_TAKEN,     // Guild | Faction
    NODE_ATTACKED,
    NODE_NEUTRAL
};

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

enum NodeObjectId
{
    NODE_OBJECTID_BANNER_CONTESTED  = 180114,
    NODE_OBJECTID_BANNER_ATTACKED   = 180118,
    NODE_OBJECTID_BANNER_TAKEN      = 180117
};

class Node;
struct NodeCreature
{
    Creature* Creature;
    Node* Node;
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
    Faction* Faction;
    FactionMap FactionAllies;
    GuildMap GuildAllies;
};
struct NodeBattleGuild
{
    Guild* Guild;
    FactionMap FactionAllies;
    GuildMap GuildAllies;
};
struct NodeGroup
{
    Group* Group;
    Node* Node;
    uint32 Faction;
    uint32 Guild;
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
    Node* Node;
    uint32 Index;
    uint32 Status;
    uint32 FactionId;
    uint32 GuildId;
    NodeBannerObjectMap Objects;
    uint32 Timer;
    uint32 SpawnTimer;
    GameObject* GeGameObject(uint32 status) { NodeBannerObjectMap::iterator itr = Objects.find(status); if (itr != Objects.end()) return itr->second; return NULL; }
};
typedef std::map<uint32, NodeBanner*> NodeBannerMap;
typedef std::map<ObjectGuid, NodeBanner*> NodeAllBannerMap;

class Node
{
    friend class NodeMgr;

    public:
        Node(Map* map, Field* fields);
        ~Node() { }

        void Load();
        void Populate();
        void InitCreature(NodeCreature* nodeCrea);

        void Update(uint32 diff);

        uint32 GetId() { return m_id; }
        void SetStatus(uint32 status);
        bool SetStatusOwner(uint32 status, uint32 factionId, uint32 guildId = 0);
        //std::string GetName() { return sDBCMgr->->sDBCMgr->GetAreaEntry(m_areaId)->; }

        void GotDefended(); // Attacked to AtPeace
        void GotAttacked(); // AtPeace/Taken/Contested to Attacked
        void GotTaken(uint32 factionId, uint32 guildId = 0);    // Attacked to Taken
        void GotPacified(); // Taken to AtPeace

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
        GameObject* AddBanner(uint32 entry, float x, float y, float z, float o, float rotation0, float rotation1, float rotation2, float rotation3, uint32 respawnTime = 0, GOState goState = GO_STATE_READY);
        void CreateBanner(NodeBanner* banner, bool delay = false);
        void SpawnBanner(NodeBanner* banner, uint32 respawntime, uint8 incrStatus = 0);
        void DelBanner(NodeBanner* banner, uint8 incrStatus = 0) { SpawnBanner(banner, 86400, incrStatus); }
        void EventPlayerClickedOnFlag(Player* source, GameObject* target_obj);

    private:
        uint32 m_id;
        Map* m_map;
        uint32 m_areaId;
        uint32 m_zoneId;
        uint32 m_type;
        uint32 m_status;
        uint32 m_leadType;
        uint32 m_factionId;
        Faction* m_faction;
        uint32 m_guildId;
        Guild* m_guild;
        LocString m_name;

        int32 m_attackFlags;
        uint32 m_looseType;
        int32 m_looseData;
        uint32 m_captureType;
        int32 m_captureData1;
        int32 m_captureData2;

		NodeFactionPlayersMap m_players;
		NodeGroupMap m_groups;
		NodeBattleFactionMap m_factions;
		NodeBattleGuildMap m_guilds;

        Creature* m_base;
        CommanderMap m_commanders;
        uint32 m_flags;
        NodeCreatureMap m_creatures;
        NodeRelationMap m_relations;
        NodeBannerMap m_banners;

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
