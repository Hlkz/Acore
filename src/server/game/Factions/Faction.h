
#ifndef __FACTION_H
#define __FACTION_H

enum FactionTimeIntervals
{
    FACTION_WAVE_INVERVAL = 10000      // ms
};

enum FactionHostile
{
    FACTION_EXALTED    = -2,
    FACTION_HONORED    = -1,
    FACTION_NEUTRAL    =  0,
    FACTION_HOSTILE    =  1,
    FACTION_HATED      =  2
};

enum FactionStatus
{
    FACTION_AT_PEACE, // Guild | Faction | FactionGuild
    FACTION_OCCUPIED, // Guild | Faction | FactionGuild
    FACTION_AT_WAR,   // vs FactionEnnemies
    FACTION_CONTESTED
};

enum FactionRelationStatusFlags
{
    FACTION_RELATION_FLAG_NONE      = 0,
	FACTION_RELATION_FLAG_FRIEND    = 1, // blue, can trade
	FACTION_RELATION_FLAG_ENEMY     = 2, // red, can attack
    FACTION_RELATION_FLAG_ALLY      = 4  // green, can buff
};

class Faction;
class Guild;
class Node;
typedef std::map<uint32, Node*> NodeMap;

struct FactionRelation
{
    Faction* Relation;
    uint32 StatusFlags;
};
typedef std::map<uint32, Faction*> FactionMap;
typedef std::map<uint32, FactionRelation> FactionRelationMap;

class Faction
{
    friend class FactionMgr;

    public:
        Faction(FactionEntry const* factionEntry);
        ~Faction() { }

        void AddRelation(uint32 id, uint32 statusFlags = 0);
      //void RemoveRelation(uint32 id) { FactionRelationMap::iterator itr = m_relations.find(id); if (itr != m_relations.end()) { delete itr->second; m_relations.erase(itr); } }
      //FactionRelation GetRelation(uint32 id) { FactionRelationMap::iterator itr = m_relations.find(id); if (itr != m_relations.end()) return itr->second; return NULL; }
        FactionRelationMap GetRelations() { return m_Relations; }
        FactionEntry const* GetEntry() { return m_FactionEntry; }

      //ObjectGuid GetLeaderGuid() { return m_LeaderGuid; }

    private:

        NodeMap m_Nodes;
        FactionRelationMap m_Relations;
      //ObjectGuid m_LeaderGuid; // FactionLeader for Faction = GuildMaster for Guild

        FactionEntry const* m_FactionEntry;

};

#endif
