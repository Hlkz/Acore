#ifndef __BATTLEGROUNdIWP_H
#define __BATTLEGROUNdIWP_H

#include "Battleground.h"

enum IWP_ObjectTypes
{
    IWP_OBJECT_MAX = 0
};

enum IWP_CreatureEntry
{
};

enum IWP_CreatureType
{
    IWP_CREATURE_MAX,
};

enum BG_IWP_ItemIds
{
    IWP_ITEMID_COLLECT = 60086,
    IWP_ITEMID_SHARD = 60087,
};

const uint32 IWP_GraveyardIds[BG_TEAMS_COUNT] = { 1950, 1951 };


struct BattlegroundIWPScore : public BattlegroundScore
{
    BattlegroundIWPScore() { }
    ~BattlegroundIWPScore() { }
};

class BattlegroundIWP : public Battleground
{
    public:
        BattlegroundIWP();
        ~BattlegroundIWP();

        void AddPlayer(Player* player);
        void StartingEventCloseDoors();
        void StartingEventOpenDoors();

        void RemovePlayer(Player* player, uint64 guid, uint32 team);
        void HandleAreaTrigger(Player* Source, uint32 Trigger);
        bool SetupBattleground();
        void ResetBGSubclass();

        /*general stuff*/
        void UpdatePlayerScore(Player* Source, uint32 type, uint32 value, bool doAddHonor = true);

        /*handlestuff*/ //these are functions which get called from extern
        void HandleKillPlayer(Player* player, Player* killer);
        void HandleKillUnit(Creature* unit, Player* killer);

        void EndBattleground(uint32 winner);
        uint32 GetPrematureWinner();

        WorldSafeLocsEntry const* GetClosestGraveYard(Player* player);

    private:
        void PostUpdateImpl(uint32 diff);

        /*worldstates*/
        void FillInitialWorldStates(WorldPacket& data);

        /*variables */

};

#endif
