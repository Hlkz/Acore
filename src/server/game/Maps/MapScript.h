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
        explicit WMScript(Map* map) : world(map) { }

        virtual ~WMScript() { }

        Map* world;

        virtual void Initialize() { }

        virtual void Update(uint32 /*diff*/) { }

        Creature* AddCreature(uint32 entry, float x, float y, float z, float o, uint32 respawntime = 0);

    protected:
    private:
};

#endif
