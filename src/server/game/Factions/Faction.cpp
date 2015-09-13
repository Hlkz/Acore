
#include "DBCStores.h"
#include "FactionMgr.h"
#include "GuildMgr.h"

// Used in FactionMgr::InitFactions()
Faction::Faction(FactionEntry const* factionEntry)
{
    m_factionEntry = factionEntry;
    m_relations.clear();
}

void Faction::AddEmptyRelation(Faction* faction)
{
    FactionRelation* relation = new FactionRelation(faction);
    relation->BaseStanding      = 0;
    relation->BaseCount         = 1;
    relation->Standing          = 0;
    relation->MemberStanding    = 0;
    relation->MemberCount       = 0;
    relation->Type              = 0;
    m_relations[faction->GetId()] = relation;

    PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_INS_FACTION_RELATION);
    stmt->setUInt32(0, GetId());
    stmt->setUInt32(1, faction->GetId());
    CharacterDatabase.Execute(stmt);

    TC_LOG_ERROR("sql.sql", "Faction::AddRelation Added non-existent Relation id %u for Faction id %u", faction->GetId(), GetId());
}

void Faction::AddRelation(Field* fields)
{
    uint32 id = fields[1].GetUInt32();
    Faction* faction = sFactionMgr->GetFactionById(id);
    if (!faction)
    {
        TC_LOG_ERROR("misc", "Faction::AddRelation relation %u doesn't exist", id);
        return;
    }

    FactionRelation* relation = new FactionRelation(faction);
    relation->BaseStanding      = fields[2].GetInt32();
    relation->BaseCount         = fields[3].GetUInt32();
    relation->Standing          = fields[4].GetInt32();
    relation->MemberStanding    = fields[5].GetInt32();
    relation->MemberCount       = fields[6].GetUInt32();
    relation->Type              = fields[7].GetUInt32();
    m_relations[id] = relation;
}

void Faction::AddEmptyGuildRelation(Guild* guild)
{
    FactionGuildRelation* relation = new FactionGuildRelation(guild);
    relation->Standing = 0;
    relation->MemberStanding = 0;
    relation->MemberCount = 0;
    relation->Type = 0;
    m_guildRelations[guild->GetId()] = relation;

    PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_INS_FACTION_GUILD_RELATION);
    stmt->setUInt32(0, GetId());
    stmt->setUInt32(1, guild->GetId());
    CharacterDatabase.Execute(stmt);

    TC_LOG_ERROR("sql.sql", "Faction::AddRelation Added non-existent Guild id %u for Faction id %u", guild->GetId(), GetId());
}

void Faction::AddGuildRelation(Field* fields)
{
    uint32 id = fields[1].GetUInt32();
    Guild* guild = sGuildMgr->GetGuildById(id);
    if (!guild)
    {
        TC_LOG_ERROR("misc", "Faction::AddRelation Guild id %u doesn't exist", id);
        return;
    }

    FactionGuildRelation* relation = new FactionGuildRelation(guild);
    relation->Standing = fields[2].GetInt32();
    relation->MemberStanding = fields[3].GetInt32();
    relation->MemberCount = fields[4].GetUInt32();
    relation->Type = fields[5].GetUInt32();
    m_guildRelations[id] = relation;
}
