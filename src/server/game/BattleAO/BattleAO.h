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
};

enum BAO_BattlegroundNodes
{
    BAO_NODE_TOUR_A2		= 0,
    BAO_NODE_SUD		    = 1,
    BAO_NODE_RUINES		    = 2,
    BAO_NODE_NORD		    = 3,
    BAO_NODE_TOUR_H2		= 4,
    BAO_NODE_PUITdS			= 5,
    BAO_NODE_PUITS			= 6,
    BAO_DYNAMIC_NODES_COUNT	= 7,                        // dynamic nodes that can be captured
    BAO_SPIRIT_A2		    = 7,
    BAO_SPIRIT_H2			= 8,
    BAO_SPIRIT_A2_TOUR	    = 9,
    BAO_SPIRIT_H2_TOUR		= 10,
    BAO_ALL_NODES_COUNT     = 11							// all nodes (dynamic and static) */
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

const uint32 BAO_OP_NODESTATES[BAO_DYNAMIC_NODES_COUNT] =	{3001, 3011, 3021, 3031, 3041, 3051, 3061};
const uint32 BAO_OP_NODEICONS[BAO_DYNAMIC_NODES_COUNT]  =	{3000, 3010, 3020, 3030, 3040, 3050, 3060};
const uint32 BAO_NODEOBJECTID[BAO_DYNAMIC_NODES_COUNT]	=	{180107, 180108, 180109, 180110, 180111, 180112, 180113};
const uint32 BAO_SAVENODEWORLDSTATE[BAO_DYNAMIC_NODES_COUNT]	=	{22200, 22201, 22202, 22203, 22204, 22205, 22206};

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
	BAO_OBJECT_MAX = 8 * BAO_ALL_NODES_COUNT // for all 7 node points 8*7=56 objects
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

const uint32 BAO_GraveyardIds[BAO_ALL_NODES_COUNT] = {1760, 1761, 1762, 1763, 1764, 1765, 1766, 1767, 1768, 1769, 1770};

const float BAO_NodePositions[BAO_DYNAMIC_NODES_COUNT][4] =
{
    {-5623.449219f, 33.006149f, 7.052403f, 3.120155f}, //puits
    {-5222.179688f, 47.053226f, 3.538148f, 2.837019f}, //sanctum
    {-5510.409180f, -299.316681f, 4.405378f, 3.009199f}, //bleu
    {-5831.860840f, -383.221375f, 4.101608f, 3.615526f}, //rouge
    {-5638.83f, -288.73f, 35.434f, 3.14f}, //ruins
	{-5262.734375f, -228.397034f, 2.171713f, 0.054353f}, //etang
	{-5955.698730f, -356.054108f, 1.495916f, 2.785967f}, //cache

};
const float BAO_SpiritGuidePos[BAO_ALL_NODES_COUNT][4] = //tofix
{
    {-5628.989258f, -48.644108f, 15.398722f, 2.225193f}, //puits
    {-5106.446289f, 86.217834f, 4.730451f, 0.734897f}, //sanctum
    {0.0f, 0.0f, 0.0f, 0.0f}, //bleu
    {0.0f, 0.0f, 0.0f, 0.0f},//rouge
    {-5757.212891f, -240.177658f, 5.380976f, 3.148425f}, //ruins
    {-5224.329590f, -343.908142f, 0.050214f, 0.255811f}, //etang
	{-5955.348633f, -437.039062f, 1.207013f, 0.432519f}, //cache
	{-5504.412598f, 231.661484f, 64.052414f, 4.132537f}, //a2 départ
	{-5326.936523f, 163.164841f, 74.170593f, 2.756121f}, //h2 départ
	{-5460.480957f, -98.561989f, -13.787698f, 1.368716f}, //tour a2
	{-5866.610840f, -135.867676f, 5.397364f, 0.628477f}, //tour h2
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
        void SendAllNodeUpdate(Player* player);

		void UpdatePlayerScore(Player* Source, uint32 type, uint32 value);

        bool Update(uint32 diff);

        void HandleKill(Player* killer, Player* victim);
        void HandleQuestComplete(uint32 questid, Player* player);

        void KickPlayerFromBattleAO(uint64 guid);

        void AddPlayer(Player* player);
		void RemovePlayer(uint64 guid);
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
		
		protected:
		std::vector<uint64> m_ReviveQueue;
		std::vector<uint64> m_ResurrectQueue;
    };
	
    CreatureAI* GetAI(Creature* creature) const
    {
        return new spirithealerAI(creature);
    }

};

#endif
