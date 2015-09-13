
#include "Common.h"
#include "Timer.h"
#include "DBCStores.h"
#include "FactionMgr.h"
#include "GuildMgr.h"

FactionMgr::FactionMgr()
{
    m_factions.clear();
}

FactionMgr::~FactionMgr() { }

void FactionMgr::InitFactions()
{
    uint32 oldMSTime = getMSTime();
    m_factions.clear();

    for (FactionContainer::const_iterator itr = sDBCMgr->FactionStore.begin(); itr != sDBCMgr->FactionStore.end(); ++itr)
    {
        if (FactionEntry const* factionEntry = itr->second)
            if (factionEntry->Flags)
                m_factions[factionEntry->ID] = new Faction(factionEntry);
    }

    TC_LOG_INFO("server.loading", ">> Loaded %lu Factions in %u ms", (unsigned long)m_factions.size(), GetMSTimeDiffToNow(oldMSTime));

    LoadRelations();
}

void FactionMgr::LoadRelations()
{
    uint32 oldMSTime = getMSTime();

    PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_FACTION_RELATIONS);
    stmt->setUInt32(0, time(NULL) - 20 * DAY);
    CharacterDatabase.Execute(stmt);

    for (FactionMap::const_iterator itr = m_factions.begin(); itr != m_factions.end(); ++itr)
        itr->second->m_relations.clear();

    QueryResult result = CharacterDatabase.Query("SELECT faction, relation, baseStanding, baseCount, standing, memberStanding, memberCount, type FROM faction_relations ORDER BY faction ASC");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 FactionRelations. DB table `faction_relations` is empty.");
        return;
    }

    uint32 count = 0;
    uint32 prevFactionId = 0;
    Faction* curFaction = NULL;
    do {
        Field* fields = result->Fetch();
        uint32 curFactionId = fields[0].GetUInt32();
        if (curFactionId != prevFactionId)
        {
            curFaction = GetFactionById(fields[0].GetUInt32());
            prevFactionId = curFactionId;
        }
        if (!curFaction)
            continue;

        curFaction->AddRelation(fields);
        count++;
    } while (result->NextRow());

    for (FactionMap::const_iterator itr = m_factions.begin(); itr != m_factions.end(); ++itr)
        for (FactionMap::const_iterator itr2 = m_factions.begin(); itr2 != m_factions.end(); ++itr2)
            if (itr->first != itr2->first && !itr->second->GetRelation(itr2->first))
                itr->second->AddEmptyRelation(itr2->second);

    TC_LOG_INFO("server.loading", ">> Loaded %u FactionRelations in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
    oldMSTime = getMSTime();

    stmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_FACTION_GUILD_RELATIONS);
    CharacterDatabase.Execute(stmt);

    for (FactionMap::const_iterator itr = m_factions.begin(); itr != m_factions.end(); ++itr)
        itr->second->m_guildRelations.clear();

    result = CharacterDatabase.Query("SELECT faction, guildid, standing, memberStanding, memberCount, type FROM faction_guild_relations ORDER BY faction ASC");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 FactionGuildRelations. DB table `faction_guild_relations` is empty.");
        return;
    }

    count = 0;
    prevFactionId = 0;
    curFaction = NULL;
    do {
        Field* fields = result->Fetch();
        uint32 curFactionId = fields[0].GetUInt32();
        if (curFactionId != prevFactionId)
        {
            curFaction = GetFactionById(fields[0].GetUInt32());
            prevFactionId = curFactionId;
        }
        if (!curFaction)
            continue;

        curFaction->AddGuildRelation(fields);
        count++;
    } while (result->NextRow());

    for (FactionMap::const_iterator itr = m_factions.begin(); itr != m_factions.end(); ++itr)
        sGuildMgr->CheckGuildRelations(itr->second);

    TC_LOG_INFO("server.loading", ">> Loaded %u FactionGuildRelations in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

void FactionMgr::Update(uint32 diff)
{
}
