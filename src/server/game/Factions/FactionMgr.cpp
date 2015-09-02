
#include "DBCStores.h"
#include "FactionMgr.h"

FactionMgr::FactionMgr()
{
    m_Factions.clear();
}

FactionMgr::~FactionMgr() { }

void FactionMgr::InitFactions()
{
    uint32 oldMSTime = getMSTime();
    m_Factions.clear();

    for (FactionContainer::const_iterator itr = sDBCMgr->FactionStore.begin(); itr != sDBCMgr->FactionStore.end(); ++itr)
    {
        if (FactionEntry const* factionEntry = itr->second)
            if (factionEntry->Flags)
                m_Factions[factionEntry->ID] = new Faction(factionEntry);
    }

    TC_LOG_INFO("server.loading", ">> Loaded %lu Factions in %u ms", (unsigned long)m_Factions.size(), GetMSTimeDiffToNow(oldMSTime));
}

void FactionMgr::Update(uint32 diff)
{
}
