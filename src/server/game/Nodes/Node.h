
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
        void AddCommander(Creature* commander) { m_Commanders[commander->GetGUID()] = commander; }
        void RemoveCommander(uint64 guid) { CommanderMap::iterator itr = m_Commanders.find(guid); if (itr != m_Commanders.end()) { delete itr->second; m_Commanders.erase(itr); } }
        CommanderMap GetCommanders() { return m_Commanders; }

        void AddFlag() { m_Flags++; }
        void RemoveFlag() { m_Flags--; }
        void SetFlags(uint32 flags) { m_Flags = flags; }
        uint32 GetFlags() { return m_Flags; }

        void AddCreature(uint32 guid, NodeCreature* nodeCreature);
        void RemoveCreature(uint32 guid);
        void AddRelation(uint32 id, uint32 type = 0, int32 hostile = 0, uint32 path = 0);
      //void RemoveRelation(uint32 id) { NodeRelationMap::iterator itr = m_relations.find(id); if (itr != m_relations.end()) { delete itr->second; m_relations.erase(itr); } }
      //NodeRelation GetRelation(uint32 id) { NodeRelationMap::iterator itr = m_relations.find(id); if (itr != m_relations.end()) return itr->second; return NULL; }
        NodeRelationMap GetRelations() { return m_Relations; }

        void SendWaves();
        void SendWave(NodeRelationMap::iterator itr);

        Map* GetMap() { return m_Map; };

    private:
        uint32 m_Id;
        Map* m_Map;
        uint32 m_Type;
        uint32 m_Status;
        uint32 m_LeadType;
        uint32 m_FactionId;
        Faction* m_Faction;
        uint32 m_GuildId;
        Guild* m_Guild;

        Creature* m_Base;
        CommanderMap m_Commanders;
        uint32 m_Flags;
        NodeCreatureMap m_Creatures;
        NodeRelationMap m_Relations;
};

#endif
