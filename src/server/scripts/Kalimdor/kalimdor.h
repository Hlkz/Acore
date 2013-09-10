#include "ScriptMgr.h"
#include "MapScript.h"
#include "Cell.h"
#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "TemporarySummon.h"

class mapevent_kalimdor : public WorldMapScript
{
public:
    mapevent_kalimdor() : WorldMapScript("mapevent_kalimdor", 1) { }

    WMScript* GetWMScript(Map* map) const
    {
        return new mapevent_kalimdor_WMS(map);
    }

    struct mapevent_kalimdor_WMS : public WMScript
    {
        mapevent_kalimdor_WMS(Map* map) : WMScript(map) {}
		
        void Initialize();
        void Update(uint32 diff);

        void OnCreatureCreate(Creature* creature);
        void OnGameObjectCreate(GameObject* go);
        void OnGameObjectRemove(GameObject* go);

        void SetData(uint32 type, uint32 data);
        uint64 GetData64(uint32 data) const;

        protected:
			//var
			uint32 dattimer;
    };
};

void AddSC_mapevent_kalimdor();
