
#ifndef __NODE_H
#define __NODE_H

class Node;
typedef std::map<uint32, Node*> NodeMap;
class Node
{
    friend class NodeMgr;

    public:
        Node(uint32 id, uint32 team, Creature* base) { Id = id; m_team = team; m_base = base; }
        ~Node() { }
        
        void SetId(uint32 id) { Id = id; }
        uint32 GetId() { return Id; }
        void SetTeam(uint32 team) { m_team = team; }
        uint32 GetTeam() { return m_team; }
        void SetBase(Creature* base) { m_base = base; } 
        Creature* GetBase() { return m_base; }
        
        typedef std::map<uint64, Creature*> CommanderMap;
        void AddCommander(Creature* commander) { m_commanders[commander->GetGUID()] = commander; }
        void RemoveCommander(uint64 guid) { CommanderMap::iterator itr = m_commanders.find(guid); if (itr != m_commanders.end()) { delete itr->second; m_commanders.erase(itr); } }
        CommanderMap GetCommanders() { return m_commanders; }

        void AddFlag() { m_flags++; }
        void RemoveFlag() { m_flags--; }
        void SetFlags(uint32 flags) { m_flags = flags; }
        uint32 GetFlags() { return m_flags; }

        void AddAlly(Node* ally) { m_Allies[ally->GetId()] = ally; } // Allies
        void RemoveAlly(uint32 id) { NodeMap::iterator itr = m_Allies.find(id); if (itr != m_Allies.end()) { delete itr->second; m_Allies.erase(itr); } }
        NodeMap GetAllies() { return m_Allies; }

        void AddEnemy(Node* enemy) { m_Enemies[enemy->GetId()] = enemy; } // Enemies
        void RemoveEnemy(uint32 id) { NodeMap::iterator itr = m_Enemies.find(id); if (itr != m_Enemies.end()) { delete itr->second; m_Enemies.erase(itr); } }
        NodeMap GetEnemies() { return m_Enemies; }

    private:
        uint32 Id;
        uint32 m_team;
        Creature* m_base;
        CommanderMap m_commanders;
        uint32 m_flags;
        NodeMap m_Allies;
        NodeMap m_Enemies;
};

#endif
