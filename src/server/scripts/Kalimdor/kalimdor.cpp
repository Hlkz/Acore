#include "ScriptMgr.h"
#include "Cell.h"
#include "CellImpl.h"
#include "kalimdor.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "TemporarySummon.h"

void mapevent_kalimdor::mapevent_kalimdor_WMS::Initialize()
{
    //worldstates?
    dattimer = 0;
}

void  mapevent_kalimdor::mapevent_kalimdor_WMS::Update(uint32 diff)
{
}

void  mapevent_kalimdor::mapevent_kalimdor_WMS::OnCreatureCreate(Creature* creature)
{
    switch (creature->GetEntry())
    {
        case 0:
        default:
            break;
    }
}

void  mapevent_kalimdor::mapevent_kalimdor_WMS::OnGameObjectCreate(GameObject* go)
{
    switch (go->GetEntry())
    {
        case 0:
        default:
            break;
    }
}

void  mapevent_kalimdor::mapevent_kalimdor_WMS::OnGameObjectRemove(GameObject* go)
{
}

void  mapevent_kalimdor::mapevent_kalimdor_WMS::SetData(uint32 type, uint32 data)
{
    switch (type)
    {
        case 0:
        default:
            break;
    }
}

uint64  mapevent_kalimdor::mapevent_kalimdor_WMS::GetData64(uint32 data) const
{
    switch (data)
    {
        case 0:
        default:
            break;
        // case npcentry:
         //    return npcguid;
    }
    return 0;
}

void AddSC_mapevent_kalimdor()
{
    new mapevent_kalimdor();
}
