
#ifndef _FACTIONMGR_H
#define _FACTIONMGR_H

#include "Faction.h"

class FactionMgr
{
    private:
        FactionMgr();
        ~FactionMgr();

    public:
        static FactionMgr* instance()
        {
            static FactionMgr* instance = new FactionMgr();
            return instance;
        }

        void InitFactions();

        void Update(uint32 diff);

        Faction* GetFactionById(uint32 id) { for (FactionMap::iterator itr = m_Factions.begin(); itr != m_Factions.end(); ++itr) if (itr->first == id) return itr->second; return NULL; }

    private:
        FactionMap m_Factions;
};

#define sFactionMgr FactionMgr::instance()

#endif // __FACTIONMGR_H
