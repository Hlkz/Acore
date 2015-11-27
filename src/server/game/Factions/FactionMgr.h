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
        void LoadRelations();
        void LoadGuildRelations();

        void Update(uint32 diff);

        Faction* GetFactionById(uint32 id) { if (m_factions.find(id) != m_factions.end()) return m_factions[id]; return NULL; }
        Faction* GetFactionByName(const std::string& factionName) const;

    private:
        FactionMap m_factions;
};

#define sFactionMgr FactionMgr::instance()

#endif // __FACTIONMGR_H
