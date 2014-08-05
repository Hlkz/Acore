
#ifndef __NODE_H
#define __NODE_H

class Node;
struct NodeRelation
{
    Node* Relation;
    uint32 Type;
    int32 Hostile;
    uint32 Path;
};
typedef std::map<uint32, Node*> NodeMap;
typedef std::map<uint32, NodeRelation> NodeRelationMap;

class Node
{
    friend class NodeMgr;

    public:
        Node(Field* fields);
        ~Node() { }
        
        void SetId(uint32 id) { m_Id = id; }
        uint32 GetId() { return m_Id; }
        void SetTeam(uint32 team) { m_Team = team; }
        uint32 GetTeam() { return m_Team; }
        void SetBase(Creature* base) { m_Base = base; }
        Creature* GetBase() { return m_Base; }
        
        typedef std::map<uint64, Creature*> CommanderMap;
        void AddCommander(Creature* commander) { m_Commanders[commander->GetGUID()] = commander; }
        void RemoveCommander(uint64 guid) { CommanderMap::iterator itr = m_Commanders.find(guid); if (itr != m_Commanders.end()) { delete itr->second; m_Commanders.erase(itr); } }
        CommanderMap GetCommanders() { return m_Commanders; }

        void AddFlag() { m_Flags++; }
        void RemoveFlag() { m_Flags--; }
        void SetFlags(uint32 flags) { m_Flags = flags; }
        uint32 GetFlags() { return m_Flags; }

        void AddRelation(uint32 id, uint32 type = 0, int32 hostile = 0, uint32 path = 0);
      //void RemoveRelation(uint32 id) { NodeRelationMap::iterator itr = m_relations.find(id); if (itr != m_relations.end()) { delete itr->second; m_relations.erase(itr); } }
      //NodeRelation GetRelation(uint32 id) { NodeRelationMap::iterator itr = m_relations.find(id); if (itr != m_relations.end()) return itr->second; return NULL; }
        NodeRelationMap GetRelations() { return m_Relations; }

        void SendWaves();
        void SendWave(NodeRelationMap::iterator itr);

    private:
        uint32 m_Id;
        std::string m_Comment;

        uint32 m_Team;
        Creature* m_Base;
        CommanderMap m_Commanders;
        uint32 m_Flags;
        NodeRelationMap m_Relations;
};

#endif
