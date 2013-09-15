#include  "MapScript.h"


Creature* WMScript::AddCreature(uint32 entry, float x, float y, float z, float o, uint32 respawntime)
{
    Creature* creature = new Creature;
    if (!creature->Create(sObjectMgr->GenerateLowGuid(HIGHGUID_UNIT), world, PHASEMASK_NORMAL, entry, 0, 0, x, y, z, o))
    {
        delete creature;
        return NULL;
    }

    creature->SetHomePosition(x, y, z, o);

    CreatureTemplate const* cinfo = sObjectMgr->GetCreatureTemplate(entry);
    if (!cinfo)
    {
        delete creature;
        return NULL;
    }
    // Force using DB speeds
    creature->SetSpeed(MOVE_WALK,  cinfo->speed_walk);
    creature->SetSpeed(MOVE_RUN,   cinfo->speed_run);

    if (!world->AddToMap(creature))
    {
        delete creature;
        return NULL;
    }

    if (respawntime)
        creature->SetRespawnDelay(respawntime);

    return  creature;
}
