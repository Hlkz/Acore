
#include "FactionMgr.h"
#include "GuildMgr.h"

// Used in FactionMgr::InitFactions()
Faction::Faction(FactionEntry const* factionEntry)
{
    m_Relations.clear();
}

void Faction::AddRelation(uint32 id, uint32 statusFlags)
{
    Faction* faction = sFactionMgr->GetFactionById(id);
    if (!faction)
    {
        TC_LOG_ERROR("misc", "Faction::AddRelation relation %u doesn't exist", id);
        return;
    }

    FactionRelation relation;
    relation.Relation = faction;
    relation.StatusFlags = statusFlags;
    m_Relations[id] = relation;
}
