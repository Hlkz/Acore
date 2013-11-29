#ifndef BATTLEAO_H_
#define BATTLEAO_H_

#include "Utilities/Util.h"
#include "SharedDefines.h"
#include "ZoneScript.h"
#include "WorldPacket.h"
#include "GameObject.h"
#include "Battleground.h"
#include "ObjectAccessor.h"
#include "ScriptPCH.h"
#include "ScriptedCreature.h"

enum BattleAOIds
{
    BATTLEAO_MAP = 782,
    BATTLEAO_AREA = 5810,
    BAO_SPELL_CHARGE = 39089,
    BAO_CREATURE_ENTRY_A_SPIRITGUIDE = 100017,
    BAO_CREATURE_ENTRY_H_SPIRITGUIDE = 100018,
};
#define BAO_TEAMS_COUNT 3
#define BAO_MIN_PLAYERS_FOR_BALANCE 8

enum BAO_Nodes
{
    BAO_NODE_NORD           = 0,
    BAO_NODE_SUD            = 1,
    BAO_NODE_RUINES         = 2,
    BAO_NODE_FIRST_SPIRIT     = 3,
    BAO_NODE_PUITS          = 3,
    BAO_NODE_TOUR_A2        = 4,
    BAO_NODE_TOUR_H2        = 5,
    BAO_NODE_A2             = 6,
    BAO_NODE_H2             = 7,
    BAO_SPIRIT_A2             = 6,
    BAO_SPIRIT_H2             = 7,
    BAO_NODES_COUNT         = 8,
    BAO_NODE_MAX_SPIRIT       = 8,
    BAO_SPIRIT_MAX            = 5, // spirithealers from BAO_NODE_FIRST_SPIRIT to BAO_NODE_MAX_SPIRIT
    BAO_CREATURE_MAX        = 5  // spirithealers tofix:guards
};

const uint8 BAO_DepNodes[BAO_NODES_COUNT][5] =
{
    {0, 4,2,9,9},{1, 5,2,9,9}, // ruines : tour proche, syltania
    {2, 0,1,9,9}, //            syltania : ruine
    {3, 4,5,9,9}, //               puits : tour
    {4, 5,0,3,6},{5, 4,1,3,7}, //     a2 : tour a2
    {6, 4,9,9,9},{7, 5,9,9,9} //      h2 : tour h2
};

enum BAO_NodeStatus
{
    BAO_NODE_TYPE_NEUTRAL             = 0,
    BAO_NODE_TYPE_CONTESTED           = 1,
    BAO_NODE_STATUS_ALLY_CONTESTED    = 1,
    BAO_NODE_STATUS_HORDE_CONTESTED   = 2,
    BAO_NODE_TYPE_OCCUPIED            = 3,
    BAO_NODE_STATUS_ALLY_OCCUPIED     = 3,
    BAO_NODE_STATUS_HORDE_OCCUPIED    = 4
};

enum BAO_WorldState
{
    BAO_WS_RESOURCES_ALLY          = 22001,
    BAO_WS_RESOURCES_HORDE         = 22002,
    BAO_WS_OCCUPIED_BASES_ALLY     = 22003,
    BAO_WS_OCCUPIED_BASES_HORDE    = 22004,
    BAO_WS_CANPLAYERSTAG           = 22005,
};

const uint32 BAO_OP_NODESTATES[BAO_NODES_COUNT]       =  { 3001, 3011, 3021, 3031, 3041, 3051, 3061, 3071 };
const uint32 BAO_OP_NODEICONS[BAO_NODES_COUNT]        =  { 3000, 3010, 3020, 3030, 3040, 3050, 3060, 3070 };
const uint32 BAO_SAVENODEWORLDSTATE[BAO_NODES_COUNT]  =  { 22200, 22201, 22202, 22203, 22204, 22205, 22206, 22207 };

enum BAO_ObjectId
{
    BAO_OBJECTID_BANNER               = 180114,
    BAO_OBJECTID_BANNER_A             = 180115,
    BAO_OBJECTID_BANNER_CONT_A        = 180116,
    BAO_OBJECTID_BANNER_H             = 180117,
    BAO_OBJECTID_BANNER_CONT_H        = 180118,
    BAO_OBJECTID_AURA_A               = 180100,
    BAO_OBJECTID_AURA_H               = 180101,
    BAO_OBJECTID_AURA_C               = 180102,
};

enum BAO_ObjectType
{
    BAO_OBJECT_BANNER_NEUTRAL          = 0,
    BAO_OBJECT_BANNER_CONT_A           = 1,
    BAO_OBJECT_BANNER_CONT_H           = 2,
    BAO_OBJECT_BANNER_ALLY             = 3,
    BAO_OBJECT_BANNER_HORDE            = 4,
    BAO_OBJECT_AURA_ALLY               = 5,
    BAO_OBJECT_AURA_HORDE              = 6,
    BAO_OBJECT_AURA_CONTESTED          = 7,
    BAO_BANNER_MAX = 8,
    BAO_OBJECT_MAX = BAO_BANNER_MAX * BAO_NODES_COUNT
};

enum BAO_Sounds
{
    BAO_SOUND_NODE_CLAIMED              = 8192,
    BAO_SOUND_NODE_CAPTURED_ALLIANCE    = 8173,
    BAO_SOUND_NODE_CAPTURED_HORDE       = 8213,
    BAO_SOUND_NODE_ASSAULTED_ALLIANCE   = 8212,
    BAO_SOUND_NODE_ASSAULTED_HORDE      = 8174,
};

enum BAO_Timers
{
    BAO_OBJECTIVE_UPDATE_INTERVAL   = 1    *1000,
    BAO_FLAG_CAPTURING_TIME         = 2 *60*1000,
    BAO_SPIRIT_REZ_TIME             = 22   *1000
};

struct BattleAOScore
{
    BattleAOScore() : KillingBlows(0), Deaths(0), HonorableKills(0), BonusHonor(0),
        DamageDone(0), HealingDone(0) { }
    uint32 KillingBlows; uint32 Deaths; uint32 HonorableKills;
    uint32 BonusHonor; uint32 DamageDone; uint32 HealingDone;
};

const uint32 BAO_GraveyardIds[BAO_SPIRIT_MAX+2] = {1761, 1762, 1763, 1764, 1765, 1760, 1766};

const float BAO_NodePositions[BAO_NODES_COUNT][4] = // banners
{
    {-5510.409180f, -299.316681f, 4.405378f, 3.009199f},    // nord
    {-5831.860840f, -383.221375f, 4.101608f, 3.615526f},    // sud
    {-5638.83f, -288.73f, 35.434f, 3.14f},                  // ruines
    {-5623.449219f, 33.006149f, 7.052403f, 3.120155f},      // puits
    {-5498.252441f, -113.755493f, -0.4025003f, 3.616046f},  // tour a2
    {-5773.827637f, -123.747971f, -10.509393f, 3.352937f},  // tour h2
    {0.0f, 0.0f, 0.0f, 0.0f},                               // a2
    {0.0f, 0.0f, 0.0f, 0.0f}                                // h2
};
const float BAO_SpiritGuidePos[BAO_SPIRIT_MAX][4] =         // npcs
{
    {-5645.717773f, 118.826782f, 9.399622f, 3.350337f},     // puits
    {-5459.024414f, -90.056808f, -14.164452f, 3.785068f},   // tour a2
    {-5746.135254f, -36.832146f, -23.168255f, 2.127475f},   // tour h2
    {-5105.729980f, -196.615295f, -1.474849f, 5.715950f},   // a2
    {-6139.462891f, -274.528137f, 4.637090f, 3.788593f}     // h2
};

struct BattleAOPlayer
{
    time_t  OfflineRemoveTime;
    uint32  Team;
};

struct AO_BannerTimer
{
    uint32 timer;
    uint8 type;
    uint8 teamIndex;
};

struct AO_Node
{
    uint32 status;
    uint32 prev;
    uint8 banner;               // type de la bannière active
    AO_BannerTimer bannertimer; // for animation (burn + new banner)
    uint32 timer;               // when clicked
};

class Player;
class GameObject;
class WorldPacket;
class Creature;
class Unit;

class BattleAO;
class BAOGraveyard;

typedef std::set<uint64> GuidSet;
typedef std::map<uint64, time_t> PlayerTimerMap;

class BattleAO : public ZoneScript
{
    friend class BattleAOMgr;

public:

    BattleAO();
    virtual ~BattleAO();

    template<class Do>
    void BroadcastWorker(Do& _do);
    void PlaySoundToAll(uint32 SoundID);
    void SendMessage2ToAll(int32 entry, ChatMsg type, Player const* source, int32 arg1, int32 arg2);

    bool SetupBattleAO();
    bool Update(uint32 diff);

    typedef std::map<uint64, BattleAOPlayer> BattleAOPlayerMap;
    BattleAOPlayerMap const& GetPlayers() const { return m_Players; }
    bool HasPlayer(Player* player) const { return m_Players.find(player->GetGUID()) != m_Players.end(); }
    bool HasPlayerByGuid(uint64 guid) const { return m_Players.find(guid) != m_Players.end(); }

    typedef std::map<uint64, BattleAOScore*> BattleAOScoreMap;
    BattleAOScoreMap::const_iterator GetPlayerScoresBegin() const { return PlayerScores.begin(); }
    BattleAOScoreMap::const_iterator GetPlayerScoresEnd() const { return PlayerScores.end(); }
    uint32 GetPlayerScoresSize() const { return PlayerScores.size(); }

    void AddPlayer(Player* player);
    void RemovePlayer(uint64 guid, bool teleport=true);
    void HandlePlayerEnterZone(Player* player, uint32 zoneid);
    void HandlePlayerLeaveZone(Player* player, uint32 zoneid);
    void HandleKill(Player* killer, Player* victim);
    void HandleQuestComplete(uint32 questid, Player* player);
    void EventPlayerClickedOnFlag(Player* source, GameObject* target_obj);
    void EventPlayerLoggedIn(Player* player);
    void EventPlayerLoggedOut(Player* player);

    Group* GetFreeBAORaid(TeamId TeamId);
    Group* GetGroupPlayer(uint64 guid, TeamId TeamId);
    bool AddOrSetPlayerToCorrectBAOGroup(Player* player);
    WorldSafeLocsEntry const* GetClosestGraveYard(Player* player);

    void UpdatePlayerScore(Player* Source, uint32 type, uint32 value);
    void SendUpdateWorldState(uint32 Field, uint32 value);
    void SendAllNodeUpdate(Player* player);
    void FillInitialWorldStates(WorldPacket& data);
    void FillInitialWorldStatesForKZ(WorldPacket& data);
    void SendPacketToAll(WorldPacket* packet);
    void SendPacketToTeam(uint32 TeamID, WorldPacket* packet, Player* sender = NULL, bool self = true);

    typedef std::vector<uint64> AOCreatures;
    AOCreatures AoCreatures;
    Creature* GetAOCreature(uint32 type);
    Creature* AddCreature(uint32 entry, uint32 type, uint32 teamval, float x, float y, float z, float o, uint32 respawntime = 0);
    bool AddSpiritGuide(uint32 type, float x, float y, float z, float o, uint32 team); // tofix:guard
    bool DelCreature(uint32 type);

    typedef std::vector<uint64> AOObjects;
    AOObjects AoObjects;
    GameObject* GetAOObject(uint32 type);
    bool AddObject(uint32 type, uint32 entry, float x, float y, float z, float o, float rotation0, float rotation1, float rotation2, float rotation3, uint32 respawnTime = 0);
    void SpawnAOObject(uint32 type, uint32 respawntime);
    bool DelObject(uint32 type);

    static TeamId GetTeamIndexByTeamId(uint32 Team) { return Team == ALLIANCE ? TEAM_ALLIANCE : Team == HORDE ? TEAM_HORDE : TEAM_NEUTRAL; }
    uint32 GetOtherTeam(uint32 team) { return (team == HORDE ? ALLIANCE : HORDE); }
    void UpdatePlayersCount(uint32 Team, bool remove) { m_PlayersCount[GetTeamIndexByTeamId(Team)] = m_PlayersCount[GetTeamIndexByTeamId(Team)]+1-2*remove; }
    int32 GetPlayersCount(uint32 team) const { return m_PlayersCount[GetTeamIndexByTeamId(team)]; }
    uint32 GetFreeSlotsForTeam(Team Team) const;
    void RemoveFromBAOFreeSlotQueue();
    bool CanPlayersTag() { return m_playerscantag; }
    void SetPlayersCanTag(bool playerscantag) { m_playerscantag = playerscantag; }
    void SetBalanceTag(bool balancetag) { m_balancetag = balancetag; }

    void RemoveAurasFromPlayer(Player* player);
    void TeamCastSpell(TeamId team, int32 spellId);

    bool TeamHasDepForNode(uint32 team, uint8 node);
    void UpdateBannersFlag(uint8 node, uint32 teambefore, uint32 teamafter = 0);

private:

    Map* m_Map;
    BattleAOPlayerMap m_Players;
    int32 m_PlayersCount[BAO_TEAMS_COUNT];
    GuidSet m_Groups[BG_TEAMS_COUNT];
    std::deque<uint64> m_OfflineQueue;
    BattleAOScoreMap PlayerScores;
    bool m_playerscantag;
    bool m_balancetag;

    AO_Node m_Nodes[BAO_NODES_COUNT];
    uint32 m_lastTick[BG_TEAMS_COUNT];

    void _CreateBanner(uint8 node, uint8 type, uint8 teamIndex, bool delay = false);
    void _DelBanner(uint8 node, uint8 status);
    void _SendNodeUpdate(uint8 node);
    int32 _GetNodeNameId(uint8 node, bool maj = false);
    void _NodeOccupied(uint8 node, Team team); // tofix:guards
    void _NodeDeOccupied(uint8 node);

    Player* _GetPlayer(uint64 guid, bool offlineRemove, char const* context) const {
        Player* player = NULL;
        if (!offlineRemove)
            player = ObjectAccessor::FindPlayer(guid);
        return player; }
    Player* _GetPlayer(BattleAOPlayerMap::iterator itr, char const* context) { return _GetPlayer(itr->first, itr->second.OfflineRemoveTime, context); }
    Player* _GetPlayer(BattleAOPlayerMap::const_iterator itr, char const* context) const { return _GetPlayer(itr->first, itr->second.OfflineRemoveTime, context); }
    Player* _GetPlayerForTeam(uint32 teamId, BattleAOPlayerMap::const_iterator itr, char const* context) const {
    Player* player = _GetPlayer(itr, context);
        if (player) {
            uint32 team = itr->second.Team;
            if (!team)
                team = player->GetTeam();
                if (team != teamId)
                    player = NULL; }
            return player; }
};

#endif
