#include "Language.h"
#include "BattleAOMgr.h"
#include "BattlegroundMgr.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "Map.h"
#include "MapManager.h"
#include "Group.h"
#include "WorldPacket.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"
#include "CreatureTextMgr.h"
#include "GroupMgr.h"

namespace Trinity
{
    class BattleAOChatBuilder
    {
        public:
            BattleAOChatBuilder(ChatMsg msgtype, int32 textId, Player const* source, va_list* args = NULL)
                : _msgtype(msgtype), _textId(textId), _source(source), _args(args) { }

            void operator()(WorldPacket& data, LocaleConstant loc_idx)
            {
                char const* text = sObjectMgr->GetTrinityString(_textId, loc_idx);
                if (_args)
                {
                    // we need copy va_list before use or original va_list will corrupted
                    va_list ap;
                    va_copy(ap, *_args);

                    char str[2048];
                    vsnprintf(str, 2048, text, ap);
                    va_end(ap);

                    do_helper(data, &str[0]);
                }
                else
                    do_helper(data, text);
            }

        private:
            void do_helper(WorldPacket& data, char const* text)
            {
                uint64 target_guid = _source ? _source->GetGUID() : 0;

                data << uint8 (_msgtype);
                data << uint32(LANG_UNIVERSAL);
                data << uint64(target_guid);                // there 0 for BG messages
                data << uint32(0);                          // can be chat msg group or something
                data << uint64(target_guid);
                data << uint32(strlen(text) + 1);
                data << text;
                data << uint8 (_source ? _source->GetChatTag() : 0);
            }

            ChatMsg _msgtype;
            int32 _textId;
            Player const* _source;
            va_list* _args;
    };

    class BattleAO2ChatBuilder
    {
        public:
            BattleAO2ChatBuilder(ChatMsg msgtype, int32 textId, Player const* source, int32 arg1, int32 arg2)
                : _msgtype(msgtype), _textId(textId), _source(source), _arg1(arg1), _arg2(arg2) {}

            void operator()(WorldPacket& data, LocaleConstant loc_idx)
            {
                char const* text = sObjectMgr->GetTrinityString(_textId, loc_idx);
                char const* arg1str = _arg1 ? sObjectMgr->GetTrinityString(_arg1, loc_idx) : "";
                char const* arg2str = _arg2 ? sObjectMgr->GetTrinityString(_arg2, loc_idx) : "";

                char str[2048];
                snprintf(str, 2048, text, arg1str, arg2str);

                uint64 target_guid = _source  ? _source->GetGUID() : 0;

                data << uint8 (_msgtype);
                data << uint32(LANG_UNIVERSAL);
                data << uint64(target_guid);                // there 0 for BG messages
                data << uint32(0);                          // can be chat msg group or something
                data << uint64(target_guid);
                data << uint32(strlen(str) + 1);
                data << str;
                data << uint8 (_source ? _source->GetChatTag() : uint8(0));
            }

        private:
            ChatMsg _msgtype;
            int32 _textId;
            Player const* _source;
            int32 _arg1;
            int32 _arg2;
    };
}                                                           // namespace Trinity

template<class Do>
void BattleAO::BroadcastWorker(Do& _do)
{
    for (BattleAOPlayerMap::const_iterator itr = m_Players.begin(); itr != m_Players.end(); ++itr)
        if (Player* player = ObjectAccessor::FindPlayer(MAKE_NEW_GUID(itr->first, 0, HIGHGUID_PLAYER)))
            _do(player);
}

BattleAO::BattleAO() //ctor
{
	m_Map = sMapMgr->CreateBaseMap(BATTLEAO_MAP);
	if (m_Map == NULL)
		
    m_PlayersCount[TEAM_ALLIANCE] = 0;
    m_PlayersCount[TEAM_HORDE]    = 0;
    m_InBAOFreeSlotQueue = false;
    m_LastResurrectTime = 0;
}
BattleAO::~BattleAO() {} //dtor

bool BattleAO::SetupBattleAO()
{	
    AoObjects.resize(BAO_OBJECT_MAX);
    AoCreatures.resize(BAO_ALL_NODES_COUNT + BAO_DYNAMIC_NODES_COUNT);
			
    for (int i = 0; i < BAO_DYNAMIC_NODES_COUNT; ++i)
    {
        if (!AddObject(BAO_OBJECT_BANNER_NEUTRAL + 8*i, BAO_OBJECTID_NODE_BANNER_A2 + i, BAO_NodePositions[i][0], BAO_NodePositions[i][1], BAO_NodePositions[i][2], BAO_NodePositions[i][3], 0, 0, std::sin(BAO_NodePositions[i][3]/2), std::cos(BAO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BAO_OBJECT_BANNER_CONT_A + 8*i, BAO_OBJECTID_BANNER_CONT_A, BAO_NodePositions[i][0], BAO_NodePositions[i][1], BAO_NodePositions[i][2], BAO_NodePositions[i][3], 0, 0, std::sin(BAO_NodePositions[i][3]/2), std::cos(BAO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BAO_OBJECT_BANNER_CONT_H + 8*i, BAO_OBJECTID_BANNER_CONT_H, BAO_NodePositions[i][0], BAO_NodePositions[i][1], BAO_NodePositions[i][2], BAO_NodePositions[i][3], 0, 0, std::sin(BAO_NodePositions[i][3]/2), std::cos(BAO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BAO_OBJECT_BANNER_ALLY + 8*i, BAO_OBJECTID_BANNER_A, BAO_NodePositions[i][0], BAO_NodePositions[i][1], BAO_NodePositions[i][2], BAO_NodePositions[i][3], 0, 0, std::sin(BAO_NodePositions[i][3]/2), std::cos(BAO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BAO_OBJECT_BANNER_HORDE + 8*i, BAO_OBJECTID_BANNER_H, BAO_NodePositions[i][0], BAO_NodePositions[i][1], BAO_NodePositions[i][2], BAO_NodePositions[i][3], 0, 0, std::sin(BAO_NodePositions[i][3]/2), std::cos(BAO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BAO_OBJECT_AURA_ALLY + 8*i, BAO_OBJECTID_AURA_A, BAO_NodePositions[i][0], BAO_NodePositions[i][1], BAO_NodePositions[i][2], BAO_NodePositions[i][3], 0, 0, std::sin(BAO_NodePositions[i][3]/2), std::cos(BAO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BAO_OBJECT_AURA_HORDE + 8*i, BAO_OBJECTID_AURA_H, BAO_NodePositions[i][0], BAO_NodePositions[i][1], BAO_NodePositions[i][2], BAO_NodePositions[i][3], 0, 0, std::sin(BAO_NodePositions[i][3]/2), std::cos(BAO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BAO_OBJECT_AURA_CONTESTED + 8*i, BAO_OBJECTID_AURA_C, BAO_NodePositions[i][0], BAO_NodePositions[i][1], BAO_NodePositions[i][2], BAO_NodePositions[i][3], 0, 0, std::sin(BAO_NodePositions[i][3]/2), std::cos(BAO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
)
		{
            sLog->outError(LOG_FILTER_SQL, "BatteAO: Failed to spawn some object Battleground not created! %i",i);
            return false;
		}
	}
	
    for (uint8 i = 0; i < BAO_DYNAMIC_NODES_COUNT; ++i)
    {
        m_Nodes[i] = 0;
        m_prevNodes[i] = 0;
        m_NodeTimers[i] = 0;
        m_BannerTimers[i].timer = 0;
    }

	for (uint8 k = 0; k < 2; ++k)
	{
		for (uint8 i = 0; i < BAO_DYNAMIC_NODES_COUNT; ++i)
		{
			for (uint8 j = 1; j < 7; ++j)
				_DelBanner(i,j,k);
		}
	}

    for (uint8 i = 0; i < BAO_ALL_NODES_COUNT + BAO_DYNAMIC_NODES_COUNT; ++i)
        if (AoCreatures[i])
            DelCreature(i);
		
	return true;
}

bool BattleAO::HasPlayer(Player* player) const { return m_Players.find(player->GetGUID()) != m_Players.end(); }
bool BattleAO::HasPlayerByGuid(uint64 guid) const { return m_Players.find(guid) != m_Players.end(); }

void BattleAO::AddPlayer(Player* player)
{	
    if (player->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_AFK))
        player->ToggleAFK();

    uint64 guid = player->GetGUID();
    uint32 team = player->GetBGTeam();

    BattleAOPlayer bp;
    bp.OfflineRemoveTime = 0;
    bp.Team = team;
	bp.Ready = 0;

    m_Players[guid] = bp;
	
    WorldPacket data;
    sBattlegroundMgr->BuildPlayerJoinedBattlegroundPacket(&data, player);
    SendPacketToTeam(team, &data, player, false);
    sBattleAOMgr->BuildBattleAOStatusPacket(&data, player->GetBattlegroundQueueIndex(BATTLEGROUND_QUEUE_AO), STATUS_IN_PROGRESS, 0, 0);
    player->GetSession()->SendPacket(&data);
    sBattleAOMgr->BuildPvpLogDataPacket(&data);
    player->GetSession()->SendPacket(&data);
	SendAllNodeUpdate(player);

    player->RemoveAurasByType(SPELL_AURA_MOUNTED);

	AddOrSetPlayerToCorrectBAOGroup(player);
    RemoveAurasFromPlayer(player);
	
    BattleAOScore* sc = new BattleAOScore;
    PlayerScores[player->GetGUID()] = sc;
}

void BattleAO::RemovePlayer(Player* player)
{
	if (!player)
		return;

	sLog->outDebug(LOG_FILTER_BAO, "BAO remove player %u", player->GetGUID());

    if (Group* group = player->GetGroup())
		group->RemoveMember(player->GetGUID());
    RemoveAurasFromPlayer(player);
	
	uint32 team = player->GetTeam();
	BattleAOPlayerMap::iterator itr = m_Players.find(player->GetGUID());
    if (itr != m_Players.end())
    {
        UpdatePlayersCount(team, true);
        m_Players.erase(itr);
    }
	RemovePlayerFromResurrectQueue(player->GetGUID());
    player->RemoveBattlegroundQueueId(BATTLEGROUND_QUEUE_AO);
	sBattleAOMgr->ScheduleQueueUpdate();
    
	BattleAOScoreMap::iterator itr2 = PlayerScores.find(player->GetGUID());
    if (itr2 != PlayerScores.end())
    {
        delete itr2->second;
        PlayerScores.erase(itr2);
    }
}

void BattleAO::RemovePlayerAtLeave(uint64 guid, bool Transport, bool SendPacket)
{
	sLog->outDebug(LOG_FILTER_BAO, "BAO RemovePlayerAtLeave %u", guid);	
    uint32 team = 0;
    bool participant = false;
    BattleAOPlayerMap::iterator itr = m_Players.find(guid);
    if (itr != m_Players.end())
    {
		BattleAOPlayer bap = itr->second;
		team=bap.Team;
		UpdatePlayersCount(team, true);
        m_Players.erase(itr);
        participant = true;
    }

    BattleAOScoreMap::iterator itr2 = PlayerScores.find(guid);
    if (itr2 != PlayerScores.end())
    {
        delete itr2->second;                                // delete player's score
        PlayerScores.erase(itr2);
    }
    RemovePlayerFromResurrectQueue(guid);
	
    Player* player = ObjectAccessor::FindPlayer(guid);
    if (player) // should remove spirit of redemption
    {
        if (player->HasAuraType(SPELL_AURA_SPIRIT_OF_REDEMPTION))
            player->RemoveAurasByType(SPELL_AURA_MOD_SHAPESHIFT);
        if (!player->isAlive())                              // resurrect on exit
        {
            player->ResurrectPlayer(1.0f);
            player->SpawnCorpseBones();
        }
    }

    if (participant) // if the player was a match participant, remove auras, calc rating, update queue
    {
        if (player)
        {
            player->ClearAfkReports();
            if (!team) team = player->GetTeam();
			
            if (SendPacket)
            {
                WorldPacket data;
                sBattleAOMgr->BuildBattleAOStatusPacket(&data, player->GetBattlegroundQueueIndex(BATTLEGROUND_QUEUE_AO), STATUS_NONE, 0, 0);
                player->GetSession()->SendPacket(&data);
            }
            player->RemoveBattlegroundQueueId(BATTLEGROUND_QUEUE_AO); //important call
        }

        /*// remove from raid group if player is member tofix
        if (Group* group = GetBgRaid(team))
        {
            if (!group->RemoveMember(guid))                // group was disbanded
            {
                SetBgRaid(team, NULL);
            }
        }*/
        sBattleAOMgr->ScheduleQueueUpdate();
    }

    if (player)
    {
        player->SetBattlegroundId(0, BATTLEGROUND_TYPE_NONE);
        player->SetBGTeam(0);
		player->TeleportToBAOEntryPoint();
    }
}

void BattleAO::EventPlayerLoggedIn(Player* player)
{
    uint64 guid = player->GetGUID();
    for (std::deque<uint64>::iterator itr = m_OfflineQueue.begin(); itr != m_OfflineQueue.end(); ++itr)
    {
        if (*itr == guid)
        {
            m_OfflineQueue.erase(itr);
            break;
        }
    }
    m_Players[guid].OfflineRemoveTime = 0;
	AddOrSetPlayerToCorrectBAOGroup(player);
	WorldPacket data;
    sBattleAOMgr->BuildBattleAOStatusPacket(&data, player->GetBattlegroundQueueIndex(BATTLEGROUND_QUEUE_AO), STATUS_IN_PROGRESS, 0, 0); // end time, start time
    player->GetSession()->SendPacket(&data);
    sBattleAOMgr->BuildPvpLogDataPacket(&data);
    player->GetSession()->SendPacket(&data);
	SendAllNodeUpdate(player);
}

void BattleAO::EventPlayerLoggedOut(Player* player)
{
    m_OfflineQueue.push_back(player->GetGUID());
	m_Players[player->GetGUID()].OfflineRemoveTime = sWorld->GetGameTime() + MAX_OFFLINE_TIME;
}

bool BattleAO::Update(uint32 diff)
{
	for (int node = 0; node < BAO_DYNAMIC_NODES_COUNT; ++node)
	{
		if (m_BannerTimers[node].timer)
		{
			if (m_BannerTimers[node].timer > diff)
		        m_BannerTimers[node].timer -= diff;
	        else
            {
				m_BannerTimers[node].timer = 0;
			    _CreateBanner(node, m_BannerTimers[node].type, m_BannerTimers[node].teamIndex, false);
		    }
	    }

		if (m_NodeTimers[node])
	    {
			if (m_NodeTimers[node] > diff)
				m_NodeTimers[node] -= diff;
			else
			{
				m_NodeTimers[node] = 0;
				uint8 teamIndex = m_Nodes[node]-1; // Change from contested to occupied !
				m_prevNodes[node] = m_Nodes[node];
				m_Nodes[node] += 2;
				_DelBanner(node, BAO_NODE_TYPE_CONTESTED, teamIndex); // burn current contested banner
				_CreateBanner(node, BAO_NODE_TYPE_OCCUPIED, teamIndex, true); // create new occupied banner
				_SendNodeUpdate(node);
				_NodeOccupied(node, (teamIndex == 0) ? ALLIANCE:HORDE);

				if (teamIndex == TEAM_ALLIANCE)
				{
					SendMessage2ToAll(LANG_BAO_NODE_TAKEN, CHAT_MSG_BG_SYSTEM_ALLIANCE, NULL, LANG_BAO_ALLY, _GetNodeNameId(node));
					PlaySoundToAll(BAO_SOUND_NODE_CAPTURED_ALLIANCE);
				}
				else
				{
					SendMessage2ToAll(LANG_BAO_NODE_TAKEN, CHAT_MSG_BG_SYSTEM_HORDE, NULL, LANG_BAO_ALLY, _GetNodeNameId(node));
					PlaySoundToAll(BAO_SOUND_NODE_CAPTURED_HORDE);
				}
            }
        }
    }
		
    if (!m_OfflineQueue.empty()) // remove offline players from bg after 5 minutes
    {
        BattleAOPlayerMap::iterator itr = m_Players.find(*(m_OfflineQueue.begin()));
        if (itr != m_Players.end())
        {
            if (itr->second.OfflineRemoveTime <= sWorld->GetGameTime())
            {
				sLog->outDebug(LOG_FILTER_BAO, "BAO kick offline player %u", itr->first);
                RemovePlayerAtLeave(itr->first, true, true); // remove player from BG
                m_OfflineQueue.pop_front(); // remove from offline queue
            }
        }
    }

	m_LastResurrectTime += diff;
    if (m_LastResurrectTime >= RESURRECTION_INTERVAL)
    {
        if (GetReviveQueueSize())
        {
            for (std::map<uint64, std::vector<uint64> >::iterator itr = m_ReviveQueue.begin(); itr != m_ReviveQueue.end(); ++itr)
            {
                Creature* sh = NULL;
                for (std::vector<uint64>::const_iterator itr2 = (itr->second).begin(); itr2 != (itr->second).end(); ++itr2)
                {
                    Player* player = ObjectAccessor::FindPlayer(*itr2);
                    if (!player)
                        continue;

                    if (!sh && player->IsInWorld())
                    {
                        sh = player->GetMap()->GetCreature(itr->first);
                        if (sh)
                            sh->CastSpell(sh, SPELL_SPIRIT_HEAL, true);
                    }
                    player->CastSpell(player, SPELL_RESURRECTION_VISUAL, true);
                    m_ResurrectQueue.push_back(*itr2);
                }
                (itr->second).clear();
            }

            m_ReviveQueue.clear();
        }
		m_LastResurrectTime = 0;
    }
    else if (m_LastResurrectTime > 500)
    {
        for (std::vector<uint64>::const_iterator itr = m_ResurrectQueue.begin(); itr != m_ResurrectQueue.end(); ++itr)
        {
            Player* player = ObjectAccessor::FindPlayer(*itr);
            if (!player)
                continue;
            player->ResurrectPlayer(1.0f);
            player->CastSpell(player, 6962, true);
            player->CastSpell(player, SPELL_SPIRIT_HEAL_MANA, true);
            sObjectAccessor->ConvertCorpseForPlayer(*itr);
        }
        m_ResurrectQueue.clear();
	}
	return true;
}

inline Player* BattleAO::_GetPlayer(uint64 guid, bool offlineRemove, char const* context) const
{
    Player* player = NULL;
    if (!offlineRemove)
		player = ObjectAccessor::FindPlayer(guid);
    return player;
}

inline Player* BattleAO::_GetPlayer(BattleAOPlayerMap::iterator itr, char const* context)
{
    return _GetPlayer(itr->first, itr->second.OfflineRemoveTime, context);
}

inline Player* BattleAO::_GetPlayer(BattleAOPlayerMap::const_iterator itr, char const* context) const
{
    return _GetPlayer(itr->first, itr->second.OfflineRemoveTime, context);
}

inline Player* BattleAO::_GetPlayerForTeam(uint32 teamId, BattleAOPlayerMap::const_iterator itr, char const* context) const
{
    Player* player = _GetPlayer(itr, context);
    if (player)
    {
        uint32 team = itr->second.Team;
        if (!team)
            team = player->GetTeam();
        if (team != teamId)
            player = NULL;
    }
    return player;
}

void BattleAO::SendPacketToAll(WorldPacket* packet)
{
    for (BattleAOPlayerMap::const_iterator itr = m_Players.begin(); itr != m_Players.end(); ++itr)
        if (Player* player = _GetPlayer(itr, "SendPacketToAll"))
            player->GetSession()->SendPacket(packet);
}

void BattleAO::SendPacketToTeam(uint32 TeamID, WorldPacket* packet, Player* sender, bool self)
{
    for (BattleAOPlayerMap::const_iterator itr = m_Players.begin(); itr != m_Players.end(); ++itr)
        if (Player* player = _GetPlayerForTeam(TeamID, itr, "SendPacketToTeam"))
            if (self || sender != player)
            {
                WorldSession* session = player->GetSession();
                sLog->outDebug(LOG_FILTER_BAO, "%s %s - SendPacketToTeam %u, Player: %s", GetOpcodeNameForLogging(packet->GetOpcode()).c_str(),
                    session->GetPlayerInfo().c_str(), TeamID, sender ? sender->GetName().c_str() : "null");
                session->SendPacket(packet);
            }
}

void BattleAO::PlaySoundToAll(uint32 SoundID)
{
    WorldPacket data;
    sBattlegroundMgr->BuildPlaySoundPacket(&data, SoundID);
    SendPacketToAll(&data);
}

void BattleAO::SendMessage2ToAll(int32 entry, ChatMsg type, Player const* source, int32 arg1, int32 arg2)
{
    Trinity::BattleAO2ChatBuilder bg_builder(type, entry, source, arg1, arg2);
    Trinity::LocalizedPacketDo<Trinity::BattleAO2ChatBuilder> bg_do(bg_builder);
    BroadcastWorker(bg_do);
}

void BattleAO::TeamCastSpell(TeamId team, int32 spellId)
{
	if (spellId > 0)
    {
        for (BattleAOPlayerMap::const_iterator itr = m_Players.begin(); itr != m_Players.end(); ++itr)
			if (Player* player = sObjectAccessor->FindPlayer(itr->first))
				if (player->GetTeamId() == team)
					player->CastSpell(player, uint32(spellId), true);
    }
    else
    {
        for (BattleAOPlayerMap::const_iterator itr = m_Players.begin(); itr != m_Players.end(); ++itr)
			if (Player* player = sObjectAccessor->FindPlayer(itr->first))
				if (player->GetTeamId() == team)
					player->RemoveAuraFromStack(uint32(-spellId));
    }
}

void BattleAO::SendUpdateWorldState(uint32 Field, uint32 Value)
{
    WorldPacket data;
    sBattlegroundMgr->BuildUpdateWorldStatePacket(&data, Field, Value);
    SendPacketToAll(&data);
}

void BattleAO::SendAllNodeUpdate(Player* player)
{
    uint8 ally = 0, horde = 0; // How many bases each team owns
    for (uint8 i = 0; i < BAO_DYNAMIC_NODES_COUNT; ++i)
        if (m_Nodes[i] == BAO_NODE_STATUS_ALLY_OCCUPIED)
            ++ally;
        else if (m_Nodes[i] == BAO_NODE_STATUS_HORDE_OCCUPIED)
            ++horde;
	
    const uint8 plusArray[] = {0, 2, 3, 0, 1}; // Send node owner state update to refresh map icons on client
	
    WorldPacket data;

    for (uint8 node = 0; node < BAO_DYNAMIC_NODES_COUNT; ++node)
	{
		if (m_prevNodes[node])
		{
			sBattlegroundMgr->BuildUpdateWorldStatePacket(&data, BAO_OP_NODESTATES[node] + plusArray[m_prevNodes[node]], 0);
			player->GetSession()->SendPacket(&data);
		}
		else
		{
			sBattlegroundMgr->BuildUpdateWorldStatePacket(&data, BAO_OP_NODEICONS[node], 0);
			player->GetSession()->SendPacket(&data);
		}
		
		sBattlegroundMgr->BuildUpdateWorldStatePacket(&data, BAO_OP_NODESTATES[node] + plusArray[m_Nodes[node]], 1);
		player->GetSession()->SendPacket(&data);
	}

    sBattlegroundMgr->BuildUpdateWorldStatePacket(&data, BAO_OP_OCCUPIED_BASES_ALLY, ally);
    player->GetSession()->SendPacket(&data);
    sBattlegroundMgr->BuildUpdateWorldStatePacket(&data, BAO_OP_OCCUPIED_BASES_HORDE, horde);
    player->GetSession()->SendPacket(&data);
}

// ****************************************************
// ******************* Group System *******************
// ****************************************************
Group* BattleAO::GetFreeBAORaid(TeamId TeamId)
{
    for (GuidSet::const_iterator itr = m_Groups[TeamId].begin(); itr != m_Groups[TeamId].end(); ++itr)
        if (Group* group = sGroupMgr->GetGroupByGUID(*itr))
            if (!group->IsFull())
                return group;

    return NULL;
}

Group* BattleAO::GetGroupPlayer(uint64 guid, TeamId TeamId)
{
    for (GuidSet::const_iterator itr = m_Groups[TeamId].begin(); itr != m_Groups[TeamId].end(); ++itr)
        if (Group* group = sGroupMgr->GetGroupByGUID(*itr))
            if (group->IsMember(guid))
                return group;

    return NULL;
}

bool BattleAO::AddOrSetPlayerToCorrectBAOGroup(Player* player)
{
    if (!player->IsInWorld())
        return false;

    if (Group* group = player->GetGroup())
        group->RemoveMember(player->GetGUID());

    Group* group = GetFreeBAORaid(player->GetTeamId());
    if (!group)
    {
        group = new Group;
        group->SetBattleAOGroup(this);
        group->Create(player);
        sGroupMgr->AddGroup(group);
        m_Groups[player->GetTeamId()].insert(group->GetGUID());
    }
    else if (group->IsMember(player->GetGUID()))
    {
        uint8 subgroup = group->GetMemberGroup(player->GetGUID());
        player->SetBattlegroundOrBattlefieldRaid(group, subgroup);
    }
    else
        group->AddMember(player);

    return true;
}

WorldSafeLocsEntry const* BattleAO::GetClosestGraveYard(Player* player)
{
    TeamId teamIndex = GetTeamIndexByTeamId(player->GetTeam());

    std::vector<uint8> nodes; // Is there any occupied node for this team?
    for (uint8 i = 0; i < BAO_DYNAMIC_NODES_COUNT; ++i)
		if (m_Nodes[i] == teamIndex + 3)
			nodes.push_back(i);

    WorldSafeLocsEntry const* good_entry = NULL;
    if (!nodes.empty()) // If so, select the closest node to place ghost on
    {
        float plr_x = player->GetPositionX();
        float plr_y = player->GetPositionY();

        float mindist = 999999.0f;
        for (uint8 i = 0; i < nodes.size(); ++i)
        {
            WorldSafeLocsEntry const*entry = sWorldSafeLocsStore.LookupEntry(BAO_GraveyardIds[nodes[i]]);
            if (!entry)
                continue;
            float dist = (entry->x - plr_x)*(entry->x - plr_x)+(entry->y - plr_y)*(entry->y - plr_y);
            if (mindist > dist)
            {
                mindist = dist;
                good_entry = entry;
            }
        }
        nodes.clear();
    }
    // If not, place ghost on starting location
    if (!good_entry)
        good_entry = sWorldSafeLocsStore.LookupEntry(BAO_GraveyardIds[teamIndex+7]);

    return good_entry;
}

void BattleAO::AddPlayerToResurrectQueue(uint64 npc_guid, uint64 player_guid)
{
    m_ReviveQueue[npc_guid].push_back(player_guid);

    Player* player = ObjectAccessor::FindPlayer(player_guid);
    if (!player)
        return;

    player->CastSpell(player, SPELL_WAITING_FOR_RESURRECT, true);
}

void BattleAO::RemovePlayerFromResurrectQueue(uint64 player_guid)
{
    for (std::map<uint64, std::vector<uint64> >::iterator itr = m_ReviveQueue.begin(); itr != m_ReviveQueue.end(); ++itr)
    {
        for (std::vector<uint64>::iterator itr2 = (itr->second).begin(); itr2 != (itr->second).end(); ++itr2)
        {
            if (*itr2 == player_guid)
            {
                (itr->second).erase(itr2);
                if (Player* player = ObjectAccessor::FindPlayer(player_guid))
                    player->RemoveAurasDueToSpell(SPELL_WAITING_FOR_RESURRECT);
                return;
            }
        }
    }
}

void BattleAO::HandleKill(Player* killer, Player* victim)
{
    UpdatePlayerScore(victim, SCORE_DEATHS, 1);
    if (killer)
    {
        if (killer == victim)
            return;

        UpdatePlayerScore(killer, SCORE_HONORABLE_KILLS, 1);
        UpdatePlayerScore(killer, SCORE_KILLING_BLOWS, 1);

        for (BattleAOPlayerMap::const_iterator itr = m_Players.begin(); itr != m_Players.end(); ++itr)
        {
            Player* creditedPlayer = ObjectAccessor::FindPlayer(itr->first);
            if (!creditedPlayer || creditedPlayer == killer)
                continue;

            if (creditedPlayer->GetTeam() == killer->GetTeam() && creditedPlayer->IsAtGroupRewardDistance(victim))
                UpdatePlayerScore(creditedPlayer, SCORE_HONORABLE_KILLS, 1);
        }
    }
}

void BattleAO::SendAreaSpiritHealerQueryOpcode(Player* player, uint64 guid)
{
    WorldPacket data(SMSG_AREA_SPIRIT_HEALER_TIME, 12);
    uint32 time = 30000 - m_LastResurrectTime;

    data << guid << time;
    ASSERT(player && player->GetSession());
    player->GetSession()->SendPacket(&data);
}

GameObject* BattleAO::GetAOObject(uint32 type)
{
    GameObject* obj = m_Map->GetGameObject(AoObjects[type]);
    if (!obj)
        sLog->outError(LOG_FILTER_BAO, "BAO::GetAOObject: gameobject type:%u, GUID:%u not found", type, GUID_LOPART(AoObjects[type]));
    return obj;
}

Creature* BattleAO::GetAOCreature(uint32 type)
{
    Creature* creature = m_Map->GetCreature(AoCreatures[type]);
    if (!creature)
        sLog->outError(LOG_FILTER_BATTLEGROUND, "BAO::GetAOCreature: creature type:%u, GUID:%u not found", type, GUID_LOPART(AoCreatures[type]));
    return creature;
}

void BattleAO::SpawnAOObject(uint32 type, uint32 respawntime)
{
    if (m_Map)
        if (GameObject* obj = m_Map->GetGameObject(AoObjects[type]))
        {
            if (respawntime)
                obj->SetLootState(GO_JUST_DEACTIVATED);
            else
                if (obj->getLootState() == GO_JUST_DEACTIVATED)
                    obj->SetLootState(GO_READY);
            obj->SetRespawnTime(respawntime);
            m_Map->AddToMap(obj);
        }
}

bool BattleAO::AddObject(uint32 type, uint32 entry, float x, float y, float z, float o, float rotation0, float rotation1, float rotation2, float rotation3, uint32 /*respawnTime*/)
{
        sLog->outError(LOG_FILTER_GENERAL, "BAO::cc ");
		sLog->outError(LOG_FILTER_GENERAL, "BAO::cc %i", m_Map->GetEntry()->MapID);
    ASSERT(type < AoObjects.size());
    Map* map = m_Map;
    if (!map)
        return false;
    GameObject* go = new GameObject;
    if (!go->Create(sObjectMgr->GenerateLowGuid(HIGHGUID_GAMEOBJECT), entry, m_Map,
        PHASEMASK_NORMAL, x, y, z, o, rotation0, rotation1, rotation2, rotation3, 100, GO_STATE_READY))
    {
        sLog->outError(LOG_FILTER_SQL, "BAO::AddObject: cannot create gameobject entry:%u", entry);
        sLog->outError(LOG_FILTER_BAO, "BAO::AddObject: cannot create gameobject entry:%u", entry);
        delete go;
        return false;
    }
    if (!map->AddToMap(go))
    {
        delete go;
        return false;
    }
    AoObjects[type] = go->GetGUID();
    return true;
}

Creature* BattleAO::AddCreature(uint32 entry, uint32 type, uint32 teamval, float x, float y, float z, float o, uint32 respawntime)
{
	sLog->outError(LOG_FILTER_BAO, "BattleAO::AddCreature: entry:%u type:%u", entry, type);
	ASSERT(type < AoCreatures.size());
    Map* map = m_Map;
    if (!map)
        return NULL;
    Creature* creature = new Creature;
    if (!creature->Create(sObjectMgr->GenerateLowGuid(HIGHGUID_UNIT), map, PHASEMASK_NORMAL, entry, 0, teamval, x, y, z, o))
    {
        sLog->outError(LOG_FILTER_BATTLEGROUND, "BattleAO::AddCreature: cannot create creature entry %u", entry);
        delete creature;
        return NULL;
    }
    creature->SetHomePosition(x, y, z, o);
    CreatureTemplate const* cinfo = sObjectMgr->GetCreatureTemplate(entry);
    if (!cinfo)
    {
        sLog->outError(LOG_FILTER_BATTLEGROUND, "BattleAO::AddCreature: creature template entry %u", entry);
        delete creature;
        return NULL;
    }
    if (!map->AddToMap(creature))
    {
        delete creature;
        return NULL;
    }
    AoCreatures[type] = creature->GetGUID();
	if (respawntime)
        creature->SetRespawnDelay(respawntime);

    return  creature;
}

bool BattleAO::DelCreature(uint32 type)
{
    if (!AoCreatures[type])
        return true;
    if (Creature* creature = m_Map->GetCreature(AoCreatures[type]))
    {
        creature->AddObjectToRemoveList();
        AoCreatures[type] = 0;
        return true;
    }
    sLog->outError(LOG_FILTER_BATTLEGROUND, "BAO::DelCreature: creature type:%u, GUID:%u not found", type, GUID_LOPART(AoCreatures[type]));
    AoCreatures[type] = 0;
    return false;
}

bool BattleAO::DelObject(uint32 type)
{
    if (!AoObjects[type])
        return true;
    if (GameObject* obj = m_Map->GetGameObject(AoObjects[type]))
    {
        obj->SetRespawnTime(0);
        obj->Delete();
        AoObjects[type] = 0;
        return true;
    }
    sLog->outError(LOG_FILTER_BATTLEGROUND, "BAO::DelObject: gameobject type:%u GUID:%u not found", type, GUID_LOPART(AoObjects[type]));
    AoObjects[type] = 0;
    return false;
}

bool BattleAO::AddSpiritGuide(uint32 type, float x, float y, float z, float o, uint32 team)
{
    uint32 entry = (team == ALLIANCE) ?
        BG_CREATURE_ENTRY_A_SPIRITGUIDE :
        BG_CREATURE_ENTRY_H_SPIRITGUIDE;
    if (Creature* creature = AddCreature(entry, type, team, x, y, z, o))
    {
        creature->setDeathState(DEAD);
        creature->SetUInt64Value(UNIT_FIELD_CHANNEL_OBJECT, creature->GetGUID());
        creature->SetUInt32Value(UNIT_CHANNEL_SPELL, SPELL_SPIRIT_HEAL_CHANNEL);
        creature->SetFloatValue(UNIT_MOD_CAST_SPEED, 1.0f);
        return true;
    }
    sLog->outError(LOG_FILTER_BAO, "BAO::AddSpiritGuide: cannot create spirit guide type:%u, entry:%u", type, entry);
    return false;
}

Creature* BattleAO::GetCreature(uint64 GUID)
{
    if (!m_Map)
        return NULL;
    return m_Map->GetCreature(GUID);
}

GameObject* BattleAO::GetGameObject(uint64 GUID)
{
    if (!m_Map)
        return NULL;
    return m_Map->GetGameObject(GUID);
}

/*	type: 0-neutral, 1-contested, 3-occupied	teamIndex: 0-ally, 1-horde	*/
void BattleAO::_CreateBanner(uint8 node, uint8 type, uint8 teamIndex, bool delay)
{
    // Just put it into the queue
    if (delay)
    {
        m_BannerTimers[node].timer = 2000;
        m_BannerTimers[node].type = type;
        m_BannerTimers[node].teamIndex = teamIndex;
        return;
    }

    uint8 obj = node*8 + type + teamIndex;

    SpawnAOObject(obj, RESPAWN_IMMEDIATELY);

    // handle aura with banner
    if (!type)
        return;
    obj = node * 8 + ((type == BAO_NODE_TYPE_OCCUPIED) ? (5 + teamIndex) : 7);
    SpawnAOObject(obj, RESPAWN_IMMEDIATELY);
}

void BattleAO::_DelBanner(uint8 node, uint8 type, uint8 teamIndex)
{
    uint8 obj = node*8 + type + teamIndex;
    SpawnAOObject(obj, RESPAWN_ONE_DAY);

    // handle aura with banner
    if (!type)
        return;
    obj = node * 8 + ((type == BAO_NODE_TYPE_OCCUPIED) ? (5 + teamIndex) : 7);
    SpawnAOObject(obj, RESPAWN_ONE_DAY);
}

void BattleAO::FillInitialWorldStates(WorldPacket& data)
{
    const uint8 plusArray[] = {0, 2, 3, 0, 1};

    // Node icons
    for (uint8 node = 0; node < BAO_DYNAMIC_NODES_COUNT; ++node)
        data << uint32(BAO_OP_NODEICONS[node]) << uint32((m_Nodes[node] == 0)?1:0);

    // Node occupied states
    for (uint8 node = 0; node < BAO_DYNAMIC_NODES_COUNT; ++node)
        for (uint8 i = 1; i < BAO_DYNAMIC_NODES_COUNT; ++i)
            data << uint32(BAO_OP_NODESTATES[node] + plusArray[i]) << uint32((m_Nodes[node] == i)?1:0);

    // How many bases each team owns
    uint8 ally = 0, horde = 0;
    for (uint8 node = 0; node < BAO_DYNAMIC_NODES_COUNT; ++node)
        if (m_Nodes[node] == BAO_NODE_STATUS_ALLY_OCCUPIED)
            ++ally;
        else if (m_Nodes[node] == BAO_NODE_STATUS_HORDE_OCCUPIED)
            ++horde;

    data << uint32(BAO_OP_OCCUPIED_BASES_ALLY)  << uint32(ally);
    data << uint32(BAO_OP_OCCUPIED_BASES_HORDE) << uint32(horde);

    // other unknown
    data << uint32(0x745) << uint32(0x2);           // 37 1861 unk
}

void BattleAO::_SendNodeUpdate(uint8 node)
{
    // Send node owner state update to refresh map icons on client
    const uint8 plusArray[] = {0, 2, 3, 0, 1};

    if (m_prevNodes[node])
        SendUpdateWorldState(BAO_OP_NODESTATES[node] + plusArray[m_prevNodes[node]], 0);
    else
        SendUpdateWorldState(BAO_OP_NODEICONS[node], 0);

    SendUpdateWorldState(BAO_OP_NODESTATES[node] + plusArray[m_Nodes[node]], 1);

    // How many bases each team owns
    uint8 ally = 0, horde = 0;
    for (uint8 i = 0; i < BAO_DYNAMIC_NODES_COUNT; ++i)
        if (m_Nodes[i] == BAO_NODE_STATUS_ALLY_OCCUPIED)
            ++ally;
        else if (m_Nodes[i] == BAO_NODE_STATUS_HORDE_OCCUPIED)
            ++horde;

    SendUpdateWorldState(BAO_OP_OCCUPIED_BASES_ALLY, ally);
    SendUpdateWorldState(BAO_OP_OCCUPIED_BASES_HORDE, horde);
}

void BattleAO::_NodeOccupied(uint8 node, Team team)
{
	if(node==0) //TODO script condition progressif
		node=0;
	
	if (!AddSpiritGuide(node, BAO_SpiritGuidePos[node][0], BAO_SpiritGuidePos[node][1], BAO_SpiritGuidePos[node][2], BAO_SpiritGuidePos[node][3], team))
		sLog->outError(LOG_FILTER_BAO, "Failed to spawn spirit guide! point: %u, team: %u, ", node, team);

    uint8 capturedNodes = 0;
    for (uint8 i = 0; i < BAO_DYNAMIC_NODES_COUNT; ++i)
    {
        if (m_Nodes[node] == GetTeamIndexByTeamId(team) + BAO_NODE_TYPE_OCCUPIED && !m_NodeTimers[i])
            ++capturedNodes;
    }
	
    if (node >= BAO_DYNAMIC_NODES_COUNT)//only dynamic nodes, no start points
        return;

	
	Creature* trigger = AoCreatures[node+BAO_ALL_NODES_COUNT] ? GetAOCreature(node+BAO_ALL_NODES_COUNT) : NULL;
	if (!trigger)
		trigger = AddCreature(WORLD_TRIGGER, node+BAO_ALL_NODES_COUNT, team, BAO_NodePositions[node][0], BAO_NodePositions[node][1], BAO_NodePositions[node][2], BAO_NodePositions[node][3]);
}

void BattleAO::_NodeDeOccupied(uint8 node)
{
    if (node >= BAO_DYNAMIC_NODES_COUNT)
        return;

	if (node < BAO_DYNAMIC_NODES_COUNT)//only dynamic nodes, no start points
		DelCreature(node+7);//NULL checks are in DelCreature! 0-6 spirit guides

	// Those who are waiting to resurrect at this node are taken to the closest own node's graveyard
	std::vector<uint64> ghost_list = m_ReviveQueue[AoCreatures[node]];
	if (!ghost_list.empty())
    {
		WorldSafeLocsEntry const* ClosestGrave = NULL;
		for (std::vector<uint64>::const_iterator itr = ghost_list.begin(); itr != ghost_list.end(); ++itr)
		{
			Player* player = ObjectAccessor::FindPlayer(*itr);
			if (!player)
				continue;

			if (!ClosestGrave)                              // cache
			    ClosestGrave = GetClosestGraveYard(player);
				
			if (ClosestGrave)
			    player->TeleportTo(BATTLEAO_MAP, ClosestGrave->x, ClosestGrave->y, ClosestGrave->z, player->GetOrientation());
		}
	}

    if (AoCreatures[node])
        DelCreature(node);
}

int32 BattleAO::_GetNodeNameId(uint8 node)
{
    switch (node)
    {
        case BAO_NODE_A2:	return LANG_BAO_NODE_A2;
        case BAO_NODE_A22:	return LANG_BAO_NODE_A22;
        case BAO_NODE_RUINS:	return LANG_BAO_NODE_RUINS;
        case BAO_NODE_H22:	return LANG_BAO_NODE_H22;
        case BAO_NODE_H2:	return LANG_BAO_NODE_H2;
        case BAO_NODE_PUIT:	return LANG_BAO_NODE_PUIT;
        default:
            ASSERT(false);
    }
    return 0;
}

void BattleAO::EventPlayerClickedOnFlag(Player* source, GameObject* /*target_obj*/)
{
    uint8 node = 0;
    GameObject* obj = m_Map->GetGameObject(AoObjects[node*BAO_BANNER_MAX+7]);
    while ((node < BAO_DYNAMIC_NODES_COUNT) && ((!obj) || (!source->IsWithinDistInMap(obj, 10))))
    {
        ++node;
        obj = m_Map->GetGameObject(AoObjects[node*BAO_BANNER_MAX+7]);
    }

    if (node == BAO_DYNAMIC_NODES_COUNT)
        return;

    TeamId teamIndex = GetTeamIndexByTeamId(source->GetTeam());

    // Check if player really could use this banner, not cheated
    if (!(m_Nodes[node] == 0 || teamIndex == m_Nodes[node]%2))
        return;

    source->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_ENTER_PVP_COMBAT);
    uint32 sound = 0;
    // If node is neutral, change to contested
    if (m_Nodes[node] == BAO_NODE_TYPE_NEUTRAL)
    {
        UpdatePlayerScore(source, SCORE_BASES_ASSAULTED, 1);
        m_prevNodes[node] = m_Nodes[node];
        m_Nodes[node] = teamIndex + 1;
        _DelBanner(node, BAO_NODE_TYPE_NEUTRAL, 0);
        _CreateBanner(node, BAO_NODE_TYPE_CONTESTED, teamIndex, true);
        _SendNodeUpdate(node);
        m_NodeTimers[node] = BAO_FLAG_CAPTURING_TIME;
		
        if (teamIndex == TEAM_ALLIANCE)
			SendMessage2ToAll(LANG_BAO_NODE_ASSAULTED, CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node), 0);
		else
			SendMessage2ToAll(LANG_BAO_NODE_ASSAULTED, CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node), 0);
        sound = BAO_SOUND_NODE_CLAIMED;
    }
    else if ((m_Nodes[node] == BAO_NODE_STATUS_ALLY_CONTESTED) || (m_Nodes[node] == BAO_NODE_STATUS_HORDE_CONTESTED)) // If node is contested
    {
        if (m_prevNodes[node] < BAO_NODE_TYPE_OCCUPIED) // If last state is NOT occupied, change node to enemy-contested
        {
            UpdatePlayerScore(source, SCORE_BASES_ASSAULTED, 1);
            m_prevNodes[node] = m_Nodes[node];
            m_Nodes[node] = teamIndex + BAO_NODE_TYPE_CONTESTED;
            _DelBanner(node, BAO_NODE_TYPE_CONTESTED, !teamIndex);
            _CreateBanner(node, BAO_NODE_TYPE_CONTESTED, teamIndex, true);
            _SendNodeUpdate(node);
            m_NodeTimers[node] = BAO_FLAG_CAPTURING_TIME;
			
            if (teamIndex == TEAM_ALLIANCE)
			SendMessage2ToAll(LANG_BAO_NODE_ASSAULTED, CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node), 0);
            else
			SendMessage2ToAll(LANG_BAO_NODE_ASSAULTED, CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node), 0);
        }
        else // If contested, change back to occupied
        {
            UpdatePlayerScore(source, SCORE_BASES_DEFENDED, 1);
            m_prevNodes[node] = m_Nodes[node];
            m_Nodes[node] = teamIndex + BAO_NODE_TYPE_OCCUPIED;
            _DelBanner(node, BAO_NODE_TYPE_CONTESTED, !teamIndex);
            _CreateBanner(node, BAO_NODE_TYPE_OCCUPIED, teamIndex, true);
            _SendNodeUpdate(node);
            m_NodeTimers[node] = 0;
            _NodeOccupied(node, (teamIndex == TEAM_ALLIANCE) ? ALLIANCE:HORDE);
			
			if (teamIndex == TEAM_ALLIANCE)
			SendMessage2ToAll(LANG_BAO_NODE_DEFENDED, CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node), 0);
            else
			SendMessage2ToAll(LANG_BAO_NODE_DEFENDED, CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node), 0);
        }
        sound = (teamIndex == TEAM_ALLIANCE) ? BAO_SOUND_NODE_ASSAULTED_ALLIANCE : BAO_SOUND_NODE_ASSAULTED_HORDE;
    }
    // If node is occupied, change to enemy-contested
    else
    {
        UpdatePlayerScore(source, SCORE_BASES_ASSAULTED, 1);
        m_prevNodes[node] = m_Nodes[node];
        m_Nodes[node] = teamIndex + BAO_NODE_TYPE_CONTESTED;
        _DelBanner(node, BAO_NODE_TYPE_OCCUPIED, !teamIndex);
        _CreateBanner(node, BAO_NODE_TYPE_CONTESTED, teamIndex, true);
        _SendNodeUpdate(node);
        _NodeDeOccupied(node);
        m_NodeTimers[node] = BAO_FLAG_CAPTURING_TIME;
		
        if (teamIndex == TEAM_ALLIANCE)
			SendMessage2ToAll(LANG_BAO_NODE_ASSAULTED, CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node), 0);
        else
			SendMessage2ToAll(LANG_BAO_NODE_ASSAULTED, CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node), 0);

        sound = (teamIndex == TEAM_ALLIANCE) ? BAO_SOUND_NODE_ASSAULTED_ALLIANCE : BAO_SOUND_NODE_ASSAULTED_HORDE;
    }

    // If node is occupied again, send "X has taken the Y" msg.
    if (m_Nodes[node] >= BAO_NODE_TYPE_OCCUPIED)
    {
        if (teamIndex == TEAM_ALLIANCE)
			SendMessage2ToAll(LANG_BAO_NODE_TAKEN, CHAT_MSG_BG_SYSTEM_ALLIANCE, NULL, LANG_BAO_ALLY, _GetNodeNameId(node));
        else
			SendMessage2ToAll(LANG_BAO_NODE_TAKEN, CHAT_MSG_BG_SYSTEM_HORDE, NULL, LANG_BAO_ALLY, _GetNodeNameId(node));
    }
    PlaySoundToAll(sound);
}

void BattleAO::UpdatePlayerScore(Player* Source, uint32 type, uint32 value)
{
    BattleAOScoreMap::iterator itr = PlayerScores.find(Source->GetGUID());
    if (itr == PlayerScores.end()) // player not found...
        return;
	
    switch (type)
    {
        case SCORE_KILLING_BLOWS:                           // Killing blows
            itr->second->KillingBlows += value;
            break;
        case SCORE_DEATHS:                                  // Deaths
            itr->second->Deaths += value;
            break;
        case SCORE_HONORABLE_KILLS:                         // Honorable kills
            itr->second->HonorableKills += value;
            break;
        case SCORE_DAMAGE_DONE:                             // Damage Done
            itr->second->DamageDone += value;
            break;
        case SCORE_HEALING_DONE:                            // Healing Done
            itr->second->HealingDone += value;
            break;
        case SCORE_BASES_ASSAULTED:
            itr->second->BasesAssaulted += value;
            break;
        case SCORE_BASES_DEFENDED:
            itr->second->BasesDefended += value;
            break;
		default:
			break;
    }
}

void BattleAO::RemoveAurasFromPlayer(Player* player)
{
    //player->RemoveAurasDueToSpell();
}

uint32 BattleAO::GetFreeSlotsForTeam(Team Team) const
{
    uint32 otherTeam;
    if (Team == ALLIANCE)
        otherTeam = GetPlayersCount(HORDE);
    else
        otherTeam = GetPlayersCount(ALLIANCE);

	uint32 diff = 0;
    if (otherTeam == GetPlayersCount(Team))
		diff = 1;
	else if (otherTeam > GetPlayersCount(Team)) 
		diff = otherTeam - GetPlayersCount(Team);

	return diff;
}
