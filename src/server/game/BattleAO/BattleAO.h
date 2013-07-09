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
    AO_SPELL_CHARGE	= 39089,
	BAO_CREATURE_ENTRY_A_SPIRITGUIDE = 100017,
	BAO_CREATURE_ENTRY_H_SPIRITGUIDE = 100018,
};

enum BAO_BattlegroundNodes
{
    BAO_NODE_NORD		    = 0,
    BAO_NODE_SUD		    = 1,
    BAO_NODE_RUINES		    = 2,
	BAO_NODE_FIRST_SPIRIT	= 3, // graveyard from BAO_NODE_FIRST_SPIRIT to BAO_ALL_NODES_COUNT
    BAO_NODE_PUITS			= 3,
    BAO_NODE_TOUR_A2		= 4,
    BAO_NODE_TOUR_H2		= 5,
    BAO_DYNAMIC_NODES_COUNT	= 6, // dynamic nodes that can be captured
    BAO_SPIRIT_A2		    = 6,
    BAO_SPIRIT_H2			= 7,
    BAO_ALL_NODES_COUNT     = 8, // all nodes (dynamic and static) */
    BAO_SPIRIT_MAX = BAO_ALL_NODES_COUNT-BAO_NODE_FIRST_SPIRIT,
	BAO_CREATURE_MAX = BAO_SPIRIT_MAX+BAO_DYNAMIC_NODES_COUNT // insiblemarker+spirithealers
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

enum BAOWorldStates
{
    BAO_OP_RESOURCES_ALLY          = 22001,
    BAO_OP_RESOURCES_HORDE         = 22002,
    BAO_OP_OCCUPIED_BASES_ALLY     = 22003,
    BAO_OP_OCCUPIED_BASES_HORDE    = 22004,
};

const uint32 BAO_OP_NODESTATES[BAO_DYNAMIC_NODES_COUNT] =	{3001, 3011, 3021, 3031, 3041, 3051};
const uint32 BAO_OP_NODEICONS[BAO_DYNAMIC_NODES_COUNT]  =	{3000, 3010, 3020, 3030, 3040, 3050};
const uint32 BAO_NODEOBJECTID[BAO_DYNAMIC_NODES_COUNT]	=	{180107, 180108, 180109, 180110, 180111, 180112};
const uint32 BAO_SAVENODEWORLDSTATE[BAO_DYNAMIC_NODES_COUNT]	=	{22200, 22201, 22202, 22203, 22204, 22205};

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


enum BG_AO_ObjectType
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
	BAO_OBJECT_MAX = 8 * BAO_ALL_NODES_COUNT
};

enum BattleAOSounds
{
    BAO_SOUND_NODE_CLAIMED				= 8192,
    BAO_SOUND_NODE_CAPTURED_ALLIANCE	= 8173,
    BAO_SOUND_NODE_CAPTURED_HORDE		= 8213,
    BAO_SOUND_NODE_ASSAULTED_ALLIANCE	= 8212,
    BAO_SOUND_NODE_ASSAULTED_HORDE		= 8174,
};

enum BattleAOTimers
{
    BAO_OBJECTIVE_UPDATE_INTERVAL	= 1*IN_MILLISECONDS,
    BAO_FLAG_CAPTURING_TIME			= 2*MINUTE*IN_MILLISECONDS,
    BAO_SPIRIT_REZ_TIME				= 22*IN_MILLISECONDS
};

struct BattleAOScore
{
    BattleAOScore() : KillingBlows(0), Deaths(0), HonorableKills(0), BonusHonor(0),
        DamageDone(0), HealingDone(0) {}
    uint32 KillingBlows; uint32 Deaths; uint32 HonorableKills;
    uint32 BonusHonor; uint32 DamageDone; uint32 HealingDone;
};

const uint32 BAO_GraveyardIds[BAO_ALL_NODES_COUNT-BAO_NODE_FIRST_SPIRIT+1] = {1761, 1762, 1763, 1764, 1765, 1760};

const float BAO_NodePositions[BAO_DYNAMIC_NODES_COUNT][4] =
{
    {-5510.409180f, -299.316681f, 4.405378f, 3.009199f},	// nord
    {-5831.860840f, -383.221375f, 4.101608f, 3.615526f},	// sud
    {-5638.83f, -288.73f, 35.434f, 3.14f},					// ruines
    {-5623.449219f, 33.006149f, 7.052403f, 3.120155f},		// puits
	{-5498.252441f, -113.755493f, -0.4025003f, 3.616046f},	// tour a2
	{-5773.827637f, -123.747971f, -10.509393f, 3.352937f},	// tour h2

};
const float BAO_SpiritGuidePos[BAO_SPIRIT_MAX][4] =
{
    {-5645.717773f, 118.826782f, 9.399622f, 3.350337f},		//puits
	{-5459.024414f, -90.056808f, -14.164452f, 3.785068f},	// tour a2
	{-5746.135254f, -36.832146f, -23.168255f, 2.127475f},	// tour h2
	{-5105.729980f, -196.615295f, -1.474849f, 5.715950f},	//  a2
	{-6139.462891f, -274.528137f, 4.637090f, 3.788593f},	// h2
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
    uint32 timer;
    uint8 type;
    uint8 teamIndex;
};

class BattleAO : public ZoneScript
{
    friend class BattleAOMgr;

    public:
        BattleAO(); /// Constructor
        virtual ~BattleAO(); /// Destructor

        typedef std::map<uint64, BattleAOPlayer> BattleAOPlayerMap;
        BattleAOPlayerMap const& GetPlayers() const { return m_Players; }
		bool HasPlayer(Player* player) const { return m_Players.find(player->GetGUID()) != m_Players.end(); }
		bool HasPlayerByGuid(uint64 guid) const { return m_Players.find(guid) != m_Players.end(); }

        typedef std::map<uint64, BattleAOScore*> BattleAOScoreMap;
        BattleAOScoreMap::const_iterator GetPlayerScoresBegin() const { return PlayerScores.begin(); }
        BattleAOScoreMap::const_iterator GetPlayerScoresEnd() const { return PlayerScores.end(); }
        uint32 GetPlayerScoresSize() const { return PlayerScores.size(); }

        void SendUpdateWorldState(uint32 Field, uint32 value);
        void SendAllNodeUpdate(Player* player);

		void UpdatePlayerScore(Player* Source, uint32 type, uint32 value);

        bool Update(uint32 diff);

        void HandleKill(Player* killer, Player* victim);
        void HandleQuestComplete(uint32 questid, Player* player);

        void KickPlayerFromBattleAO(uint64 guid);

        void AddPlayer(Player* player);
		void RemovePlayer(uint64 guid, bool teleport=true);
        void HandlePlayerEnterZone(Player* player, uint32 zone);
        void HandlePlayerLeaveZone(Player* player, uint32 zone);

        Group* GetFreeBAORaid(TeamId TeamId);
        Group* GetGroupPlayer(uint64 guid, TeamId TeamId);
        bool AddOrSetPlayerToCorrectBAOGroup(Player* player);

        void EventPlayerClickedOnFlag(Player* source, GameObject* target_obj);
        void EventPlayerLoggedIn(Player* player);
        void EventPlayerLoggedOut(Player* player);

        WorldSafeLocsEntry const* GetClosestGraveYard(Player* player);

		uint32 LastRez(uint32 diff) { m_LastResurrectTime += diff; return m_LastResurrectTime; }
		void NewLastRez() { m_LastResurrectTime = 0; }

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
		void FillInitialWorldStatesForKZ(WorldPacket& data);
        void SendPacketToAll(WorldPacket* packet);
        void SendPacketToTeam(uint32 TeamID, WorldPacket* packet, Player* sender = NULL, bool self = true);

        void SendAreaSpiritHealerQueryOpcode(Player* player, uint64 guid);

		bool SetupBattleAO();

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
			TC_LOG_ERROR(LOG_FILTER_GENERAL, "coucou player count for a2 : %i", m_PlayersCount[GetTeamIndexByTeamId(ALLIANCE)]);
			TC_LOG_ERROR(LOG_FILTER_GENERAL, "coucou player count for h2 : %i", m_PlayersCount[GetTeamIndexByTeamId(HORDE)]);
			TC_LOG_ERROR(LOG_FILTER_GENERAL, "coucou playersize:%i scoresize:%i", m_Players.size(), PlayerScores.size());
        }

        uint32 GetFreeSlotsForTeam(Team Team) const;
		void RemoveFromBAOFreeSlotQueue();

		void RemoveAurasFromPlayer(Player* player);

	private:
        /* Gameobject spawning/despawning */
        void _CreateBanner(uint8 node, uint8 type, uint8 teamIndex, bool delay);
        void _DelBanner(uint8 node, uint8 type, uint8 teamIndex);
        void _SendNodeUpdate(uint8 node);
        int32 _GetNodeNameId(uint8 node);

        /* Creature spawning/despawning */
        //tofix gardes
        void _NodeOccupied(uint8 node, Team team);
        void _NodeDeOccupied(uint8 node);

        /* m_Nodes values : 0: neutral, 1: ally contested, 3: ally occupied, */
        uint8               m_Nodes[BAO_ALL_NODES_COUNT];
        uint8               m_prevNodes[BAO_DYNAMIC_NODES_COUNT];
        AO_BannerTimer   m_BannerTimers[BAO_DYNAMIC_NODES_COUNT];
        uint32              m_NodeTimers[BAO_DYNAMIC_NODES_COUNT];
        uint32              m_lastTick[BG_TEAMS_COUNT];

    protected:

        void PlayerAddedToBAOCheck(Player* player);
		
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

		Map* m_Map;

        BattleAOPlayerMap m_Players;
        uint32 m_LastResurrectTime;
        std::deque<uint64> m_OfflineQueue;
        BattleAOScoreMap PlayerScores;

        GuidSet m_Groups[BG_TEAMS_COUNT]; // Contain different raid group

        uint32 m_PlayersCount[BG_TEAMS_COUNT];

		bool m_InBAOFreeSlotQueue;

        void TeamCastSpell(TeamId team, int32 spellId);

};

class spirithealer : public CreatureScript
{
public:
    spirithealer() : CreatureScript("spirithealer") { }

    struct spirithealerAI : public ScriptedAI
    {
        spirithealerAI(Creature* creature) : ScriptedAI(creature) {}
		
		void UpdateAI(uint32 diff);
		bool InQueue(uint64 player_guid);
		void AddPlayerToQueue(uint64 player_guid);
		void RemovePlayerFromQueue(uint64 player_guid);
		
		std::vector<uint64> m_ReviveQueue;
		std::vector<uint64> m_ResurrectQueue;
    };
	
    CreatureAI* GetAI(Creature* creature) const {
        return new spirithealerAI(creature); }
};

#endif
