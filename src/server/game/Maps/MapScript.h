#ifndef TRINITY_WMS_H
#define TRINITY_WMS_H

#include "ZoneScript.h"
#include "World.h"
#include "ObjectMgr.h"
//#include "GameObject.h"
//#include "Map.h"

class Map;
class Unit;
class Player;
class GameObject;
class Creature;

class WMScript : public ZoneScript
{
    public:
        explicit WMScript(Map* map) : world(map) {}

        virtual ~WMScript() {}

        Map* world;

        virtual void Initialize() {}

        virtual void Update(uint32 /*diff*/) { }

        Creature* AddCreature(uint32 entry, float x, float y, float z, float o, uint32 respawntime = 0)
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


    protected:
    private:
};

#endif
