#ifndef BATTLEAO_H_
#define BATTLEAO_H_

#include "Utilities/Util.h"
#include "SharedDefines.h"
#include "ZoneScript.h"
#include "WorldPacket.h"
#include "GameObject.h"
#include "Battleground.h"
#include "ObjectAccessor.h"

enum BattleAOIds
{
    BATTLEAO_MAP = 609,
	BATTLEAO_AREA = 4298,
    AO_SPELL_CHARGE	= 39089,
};

enum AO_NodeStatus
{
    AO_NODE_TYPE_NEUTRAL             = 0,
    AO_NODE_TYPE_CONTESTED           = 1,
    AO_NODE_STATUS_ALLY_CONTESTED    = 1,
    AO_NODE_STATUS_HORDE_CONTESTED   = 2,
    AO_NODE_TYPE_OCCUPIED            = 3,
    AO_NODE_STATUS_ALLY_OCCUPIED     = 3,
    AO_NODE_STATUS_HORDE_OCCUPIED    = 4
};

enum AOWorldStates
{
    BAO_OP_OCCUPIED_BASES_HORDE       = 1778,
    BAO_OP_OCCUPIED_BASES_ALLY        = 1779,
    BAO_OP_RESOURCES_ALLY             = 1776,
    BAO_OP_RESOURCES_HORDE            = 1777,
    BAO_OP_RESOURCES_MAX              = 1780,
    BAO_OP_RESOURCES_WARNING          = 1955
};

//const uint32 AO_OP_NODESTATES[7] =    {3001, 3011, 3021, 3031, 3041, 3051, 3061};
//const uint32 AO_OP_NODEICONS[7]  =    {3000, 3010, 3020, 3030, 3040, 3050, 3060};
const uint32 AO_OP_NODESTATES[5] =    {3001, 3011, 3021, 3031, 3041};
const uint32 AO_OP_NODEICONS[5]  =    {3000, 3010, 3020, 3030, 3040};

enum AO_NodeObjectId
{
	BAO_OBJECTID_NODE_BANNER_A2    = 180107,
    BAO_OBJECTID_NODE_BANNER_A22    = 180108,
    BAO_OBJECTID_NODE_BANNER_MID    = 180109,
    BAO_OBJECTID_NODE_BANNER_H22    = 180110,
    BAO_OBJECTID_NODE_BANNER_H2    = 180111,
    /*BG_AO_OBJECTID_NODE_BANNER_0    = 180107,       // Sanctum banner
    BG_AO_OBJECTID_NODE_BANNER_1    = 180108,       // Palais banner
    BG_AO_OBJECTID_NODE_BANNER_2    = 180109,       // Puit banner
    BG_AO_OBJECTID_NODE_BANNER_3    = 180110,       // Ruines banner
    BG_AO_OBJECTID_NODE_BANNER_4    = 180111,       // Lac banner
    BG_AO_OBJECTID_NODE_BANNER_5    = 180112,       // Catacombes banner
    BG_AO_OBJECTID_NODE_BANNER_6    = 180113        // Temple banner */
};

enum BAO_ObjectTypes
{
    BAO_OBJECTID_BANNER_A             = 180058,
    BAO_OBJECTID_BANNER_CONT_A        = 180059,
    BAO_OBJECTID_BANNER_H             = 180060,
    BAO_OBJECTID_BANNER_CONT_H        = 180061,
	BAO_OBJECTID_AURA_A               = 180100,
    BAO_OBJECTID_AURA_H               = 180101,
    BAO_OBJECTID_AURA_C               = 180102,
};

enum BG_AO_BattlegroundNodes
{
	AO_NODE_A2 = 0,
	AO_NODE_A22 = 1,
	AO_NODE_MID = 2,
	AO_NODE_H22 = 3,
	AO_NODE_H2 = 4,
    /*AO_NODE_SANCTUM			= 0,
    AO_NODE_PALAIS		    = 1,
    AO_NODE_PUITS	        = 2,
    AO_NODE_RUINES		    = 3,
    AO_NODE_LAC		        = 4,
    AO_NODE_CATACOMBES      = 5,
    AO_NODE_TEMPLE	        = 6,
    AO_DYNAMIC_NODES_COUNT   = 7,                        // dynamic nodes that can be captured
    AO_SPIRIT_ALIANCE        = 7,
    AO_SPIRIT_HORDE          = 8,
    AO_ALL_NODES_COUNT       = 9                         // all nodes (dynamic and static) */
    AO_DYNAMIC_NODES_COUNT   = 5,                        // dynamic nodes that can be captured
	AO_ALL_NODES_COUNT       = 5,
};

enum BG_AO_ObjectType
{
    // for all 7 node points 8*7=56 objects
    AO_OBJECT_BANNER_NEUTRAL          = 0,
    AO_OBJECT_BANNER_CONT_A           = 1,
    AO_OBJECT_BANNER_CONT_H           = 2,
    AO_OBJECT_BANNER_ALLY             = 3,
    AO_OBJECT_BANNER_HORDE            = 4,
    AO_OBJECT_AURA_ALLY               = 5,
    AO_OBJECT_AURA_HORDE              = 6,
    AO_OBJECT_AURA_CONTESTED          = 7,
	AO_BANNER_MAX = 8,
    //buffs
    AO_OBJECT_SPEEDBUFF_STABLES       = 56,
    AO_OBJECT_REGENBUFF_STABLES       = 57,
    AO_OBJECT_BERSERKBUFF_STABLES     = 58,
    AO_OBJECT_MAX                     = 59
};

enum BattleAOSounds
{
    AO_HORDE_WINS						= 8454,
    AO_ALLIANCE_WINS					= 8455,
    AO_SOUND_NODE_CLAIMED				= 8192,
    AO_SOUND_NODE_CAPTURED_ALLIANCE		= 8173,
    AO_SOUND_NODE_CAPTURED_HORDE		= 8213,
    AO_SOUND_NODE_ASSAULTED_ALLIANCE	= 8212,
    AO_SOUND_NODE_ASSAULTED_HORDE		= 8174,
    AO_SOUND_NEAR_VICTORY				= 8456
};

enum BattleAOTimers
{
    BAO_OBJECTIVE_UPDATE_INTERVAL        = 1000,
    BAO_FLAG_CAPTURING_TIME           = 60000
};

struct BattleAOScore
{
    BattleAOScore() : KillingBlows(0), Deaths(0), HonorableKills(0), BonusHonor(0),
        DamageDone(0), HealingDone(0), BasesAssaulted(0), BasesDefended(0) { }

    uint32 KillingBlows;
    uint32 Deaths;
    uint32 HonorableKills;
    uint32 BonusHonor;
    uint32 DamageDone;
    uint32 HealingDone;
	uint32 BasesAssaulted;
	uint32 BasesDefended;
};

const uint32 BAO_GraveyardIds[AO_ALL_NODES_COUNT] = {1900, 1901, 1902, 1903, 1904};

const float BAO_NodePositions[AO_DYNAMIC_NODES_COUNT][4] =
{
    {2326.420166f, -5665.936523f, 426.028809f, 0.337806f},//a2
    {2353.310791f, -5650.761230f, 426.052795f, 1.618222f},//a22
    {2371.950439f, -5652.683594f, 426.127716f, 0.587738f},//mid
    {2371.343994f, -5673.425293f, 426.068817f, 0.062393f},//h22
    {2349.964355f, -5693.840820f, 426.028076f, 4.112648f},//h2

};
const float BAO_SpiritGuidePos[AO_ALL_NODES_COUNT][4] =
{
    {2326.420166f, -5665.936523f, 426.028809f, 0.337806f},//a2
    {2353.310791f, -5650.761230f, 426.052795f, 1.618222f},//a22
    {2371.950439f, -5652.683594f, 426.127716f, 0.587738f},//mid
    {2371.343994f, -5673.425293f, 426.068817f, 0.062393f},//h22
    {2349.964355f, -5693.840820f, 426.028076f, 4.112648f},//h2
};

struct BattleAOPlayer
{
    time_t  OfflineRemoveTime;                              // for tracking and removing offline players from queue after 5 minutes
    uint32  Team;                                           // Player's team
    uint8   Ready;                                          // If Player ready
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

struct AO_BannerTimer
{
    uint32      timer;
    uint8       type;
    uint8       teamIndex;
};

class BattleAO : public ZoneScript
{
    friend class BattleAOMgr;

    public:
        BattleAO(); /// Constructor
        virtual ~BattleAO(); /// Destructor
		
        typedef std::map<uint64, BattleAOPlayer> BattleAOPlayerMap;
        BattleAOPlayerMap const& GetPlayers() const { return m_Players; }
		bool HasPlayer(Player* player) const;
		bool HasPlayerByGuid(uint64 guid) const;
		
        typedef std::map<uint64, BattleAOScore*> BattleAOScoreMap;
        BattleAOScoreMap::const_iterator GetPlayerScoresBegin() const { return PlayerScores.begin(); }
        BattleAOScoreMap::const_iterator GetPlayerScoresEnd() const { return PlayerScores.end(); }
        uint32 GetPlayerScoresSize() const { return PlayerScores.size(); }

        void SendUpdateWorldState(uint32 Field, uint32 value);
		
		void UpdatePlayerScore(Player* Source, uint32 type, uint32 value);

        bool Update(uint32 diff);
		
        void HandleKill(Player* killer, Player* victim);
				
        void KickPlayerFromBattleAO(uint64 guid);

        void AddPlayer(Player* player);
        void RemovePlayer(Player* player);
		void RemovePlayerAtLeave(uint64 guid, bool Transport, bool SendPacket);
        
        Group* GetFreeBAORaid(TeamId TeamId);
        Group* GetGroupPlayer(uint64 guid, TeamId TeamId);
        bool AddOrSetPlayerToCorrectBAOGroup(Player* player);
		
        void EventPlayerClickedOnFlag(Player* source, GameObject* target_obj);
        void EventPlayerLoggedIn(Player* player);
        void EventPlayerLoggedOut(Player* player);

        WorldSafeLocsEntry const* GetClosestGraveYard(Player* player);

        virtual void AddPlayerToResurrectQueue(uint64 npc_guid, uint64 player_guid);
        void RemovePlayerFromResurrectQueue(uint64 player_guid);

        typedef std::vector<uint64> AOObjects;
        typedef std::vector<uint64> AOCreatures;
        AOObjects AoObjects;
        AOCreatures AoCreatures;
		void SpawnAOObject(uint32 type, uint32 respawntime);
		bool AddObject(uint32 type, uint32 entry, float x, float y, float z, float o, float rotation0, float rotation1, float rotation2, float rotation3, uint32 respawnTime = 0);
        Creature* AddCreature(uint32 entry, uint32 type, uint32 teamval, float x, float y, float z, float o, uint32 respawntime = 0);
        bool DelCreature(uint32 type);
        bool DelObject(uint32 type);
        bool AddSpiritGuide(uint32 type, float x, float y, float z, float o, uint32 team);
        int32 GetObjectType(uint64 guid);

        GameObject* GetAOObject(uint32 type);
        Creature* GetAOCreature(uint32 type);

        Creature* GetCreature(uint64 GUID);
        GameObject* GetGameObject(uint64 GUID);
		
        WorldPacket BuildWarningAnnPacket(std::string const& msg);
        void SendWarningToAllInZone(uint32 entry);
        void SendWarningToPlayer(Player* player, uint32 entry);

		void FillInitialWorldStates(WorldPacket& data);
        void SendPacketToAll(WorldPacket* packet);
        void SendPacketToTeam(uint32 TeamID, WorldPacket* packet, Player* sender = NULL, bool self = true);
		
        void SendAreaSpiritHealerQueryOpcode(Player* player, uint64 guid);
		
		bool SetupBattleAO();
        void StartBattle();

        uint32 GetReviveQueueSize() const { return m_ReviveQueue.size(); }
		
        template<class Do>
        void BroadcastWorker(Do& _do);
        void PlaySoundToAll(uint32 SoundID);
		void SendMessage2ToAll(int32 entry, ChatMsg type, Player const* source, int32 arg1, int32 arg2);
		
        static TeamId GetTeamIndexByTeamId(uint32 Team) { return Team == ALLIANCE ? TEAM_ALLIANCE : TEAM_HORDE; }
        uint32 GetOtherTeam(Team team) { return (team == HORDE ? ALLIANCE : HORDE); }
        void UpdatePlayersCount(uint32 Team, bool remove) { m_PlayersCount[GetTeamIndexByTeamId(Team)] = m_PlayersCount[GetTeamIndexByTeamId(Team)]+1-2*remove; }
		uint32 GetPlayersCount(uint32 team) const   { return m_PlayersCount[GetTeamIndexByTeamId(team)]; }
				
		void test()
        {
			sLog->outError(LOG_FILTER_GENERAL, "coucou player count for a2 : %i", m_PlayersCount[GetTeamIndexByTeamId(ALLIANCE)]);
			sLog->outError(LOG_FILTER_GENERAL, "coucou player count for h2 : %i", m_PlayersCount[GetTeamIndexByTeamId(HORDE)]);
			sLog->outError(LOG_FILTER_GENERAL, "coucou playersize:%i scoresize:%i", m_Players.size(), PlayerScores.size());
        }

        uint32 GetFreeSlotsForTeam(Team Team) const;
		void RemoveFromBAOFreeSlotQueue();

		void RemoveAurasFromPlayer(Player* player);
		
	private:
        void PostUpdateImpl(uint32 diff);		
        /* Gameobject spawning/despawning */
        void _CreateBanner(uint8 node, uint8 type, uint8 teamIndex, bool delay);
        void _DelBanner(uint8 node, uint8 type, uint8 teamIndex);
        void _SendNodeUpdate(uint8 node);
        int32 _GetNodeNameId(uint8 node);

        /* Creature spawning/despawning */
        // TODO: working, scripted peons spawning
        void _NodeOccupied(uint8 node, Team team);
        void _NodeDeOccupied(uint8 node);
		
        /* Nodes info:
            0: neutral
            1: ally contested
            2: horde contested
            3: ally occupied
            4: horde occupied     */
        uint8               m_Nodes[AO_DYNAMIC_NODES_COUNT];
        uint8               m_prevNodes[AO_DYNAMIC_NODES_COUNT];
        AO_BannerTimer   m_BannerTimers[AO_DYNAMIC_NODES_COUNT];
        uint32              m_NodeTimers[AO_DYNAMIC_NODES_COUNT];
        uint32              m_lastTick[BG_TEAMS_COUNT];

    protected:
		
        void PlayerAddedToBAOCheck(Player* player);

        Player* _GetPlayer(uint64 guid, bool offlineRemove, const char* context) const;
        Player* _GetPlayer(BattleAOPlayerMap::iterator itr, const char* context);
        Player* _GetPlayer(BattleAOPlayerMap::const_iterator itr, const char* context) const;
        Player* _GetPlayerForTeam(uint32 teamId, BattleAOPlayerMap::const_iterator itr, const char* context) const;

		Map* m_Map;

        BattleAOPlayerMap  m_Players;
        std::map<uint64, std::vector<uint64> >  m_ReviveQueue;
        std::vector<uint64> m_ResurrectQueue;
        uint32 m_LastResurrectTime;
        std::deque<uint64> m_OfflineQueue;
        BattleAOScoreMap PlayerScores;

        GuidSet m_Groups[BG_TEAMS_COUNT]; // Contain different raid group
		
        uint32 m_PlayersCount[BG_TEAMS_COUNT];
		bool   m_InBAOFreeSlotQueue;
				
        void TeamCastSpell(TeamId team, int32 spellId);
		
};

#endif
