
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
    NODE_AT_PEACE, // Guild | Faction | FactionGuild
    NODE_OCCUPIED, // Guild | Faction | FactionGuild
    NODE_AT_WAR,   // vs FactionEnnemies
    NODE_CONTESTED
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

class Node;
struct NodeCreature
{
    Creature* Creature;
    Node* Node;
    uint32 Type;
};
struct NodeRelation
{
    Node* Relation;
    uint32 Type;
    int32 Hostile;
    uint32 Path;
};

typedef std::map<ObjectGuid, Player*> PlayerMap;
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

class Faction;
typedef std::map<uint32, Node*> NodeMap;
typedef std::map<uint32, NodeCreature*> NodeCreatureMap;
typedef std::map<uint32, NodeRelation*> NodeRelationMap;

class Node
{
    friend class NodeMgr;

    public:
        Node(Map* map, Field* fields);
        ~Node() { }

        void Load();
        void Populate();
        void InitCreature(NodeCreature* nodeCrea);

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

        Map* GetMap() { return m_map; };

    private:
        uint32 m_id;
        Map* m_map;
        uint32 m_type;
        uint32 m_status;
        uint32 m_leadType;
        uint32 m_factionId;
        Faction* m_faction;
        uint32 m_guildId;
        Guild* m_guild;

        Creature* m_base;
        CommanderMap m_commanders;
        uint32 m_flags;
        NodeCreatureMap m_creatures;
        NodeRelationMap m_relations;
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
