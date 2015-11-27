#ifndef __FACTION_H
#define __FACTION_H

#include "Common.h"

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

enum FactionFlag
{
    FACTION_FLAG_FACTION    = 0x01,
    FACTION_FLAG_ALLIANCE   = 0x02,
    FACTION_FLAG_HORDE      = 0x04
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
typedef std::map<uint32, Faction*> FactionMap;
struct FactionRelation
{
    FactionRelation(Faction* faction) : Relation(faction) { }
    Faction*    Relation;
    int32       BaseStanding;
    uint32      BaseCount;
    int32       Standing;
    int32       MemberStanding;
    uint32      MemberCount;
    uint32      Type;
};
struct FactionGuildRelation
{
    FactionGuildRelation(Guild* guild) : Relation(guild) { }
    Guild*      Relation;
    int32       Standing;
    int32       MemberStanding;
    uint32      MemberCount;
    uint32      Type;
};
typedef std::map<uint32, FactionRelation*> FactionRelationMap;
typedef std::map<uint32, FactionGuildRelation*> FactionGuildRelationMap;

class Faction
{
    friend class FactionMgr;

    public:
        Faction(FactionEntry const* factionEntry);
        ~Faction() { }

        void AddEmptyRelation(Faction* faction);
        void AddRelation(Field* fields);
        FactionRelation* GetRelation(uint32 id) { FactionRelationMap::iterator itr = m_relations.find(id); if (itr != m_relations.end()) return itr->second; return NULL; }

        void AddEmptyGuildRelation(Guild* guild);
        void AddGuildRelation(Field* fields);
        FactionGuildRelation* GetGuildRelation(uint32 id) { FactionGuildRelationMap::iterator itr = m_guildRelations.find(id); if (itr != m_guildRelations.end()) return itr->second; return NULL; }

        FactionEntry const* GetEntry() { return m_factionEntry; }
        LocString GetName() { return m_factionEntry->name; }
        int32 GetFlags() { return m_factionEntry->Flags; }

        uint32 GetId() { return m_factionEntry->ID; }
      //ObjectGuid GetLeaderGuid() { return m_leaderGuid; }

    private:
        FactionEntry const* m_factionEntry;
        FactionRelationMap m_relations;
        FactionGuildRelationMap m_guildRelations;

      //ObjectGuid m_leaderGuid; // FactionLeader for Faction = GuildMaster for Guild
};

#endif
