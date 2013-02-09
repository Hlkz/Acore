#include "BattlegroundAO.h"
#include "World.h"
#include "WorldPacket.h"
#include "ObjectMgr.h"
#include "BattlegroundMgr.h"
#include "Creature.h"
#include "Language.h"
#include "Object.h"
#include "Player.h"
#include "Util.h"
#include "WorldSession.h"

BattlegroundAO::BattlegroundAO()
{
    m_BuffChange = true;
    BgObjects.resize(BG_AO_OBJECT_MAX);
    BgCreatures.resize(BG_AO_ALL_NODES_COUNT + 7);//+7 for aura triggers
}

BattlegroundAO::~BattlegroundAO()
{
}

void BattlegroundAO::PostUpdateImpl(uint32 diff)
{
    if (GetStatus() == STATUS_IN_PROGRESS)
    {
        int team_points[BG_TEAMS_COUNT] = { 0, 0 };

        for (int node = 0; node < BG_AO_DYNAMIC_NODES_COUNT; ++node)
        {
            // 3 sec delay to spawn new banner instead previous despawned one
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

            // 1-minute to occupy a node from contested state
            if (m_NodeTimers[node])
            {
                if (m_NodeTimers[node] > diff)
                    m_NodeTimers[node] -= diff;
                else
                {
                    m_NodeTimers[node] = 0;
                    // Change from contested to occupied !
                    uint8 teamIndex = m_Nodes[node]-1;
                    m_prevNodes[node] = m_Nodes[node];
                    m_Nodes[node] += 2;
                    // burn current contested banner
                    _DelBanner(node, BG_AO_NODE_TYPE_CONTESTED, teamIndex);
                    // create new occupied banner
                    _CreateBanner(node, BG_AO_NODE_TYPE_OCCUPIED, teamIndex, true);
                    _SendNodeUpdate(node);
                    _NodeOccupied(node, (teamIndex == 0) ? ALLIANCE:HORDE);
                    // Message to chatlog

                    if (teamIndex == 0)
                    {
                        // FIXME: team and node names not localized
                        SendMessage2ToAll(LANG_BG_AO_NODE_TAKEN, CHAT_MSG_BG_SYSTEM_ALLIANCE, NULL, LANG_BG_AO_ALLY, _GetNodeNameId(node));
                        PlaySoundToAll(BG_AO_SOUND_NODE_CAPTURED_ALLIANCE);
                    }
                    else
                    {
                        // FIXME: team and node names not localized
                        SendMessage2ToAll(LANG_BG_AO_NODE_TAKEN, CHAT_MSG_BG_SYSTEM_HORDE, NULL, LANG_BG_AO_HORDE, _GetNodeNameId(node));
                        PlaySoundToAll(BG_AO_SOUND_NODE_CAPTURED_HORDE);
                    }
                }
            }

            for (int team = 0; team < BG_TEAMS_COUNT; ++team)
                if (m_Nodes[node] == team + BG_AO_NODE_TYPE_OCCUPIED)
                    ++team_points[team];
        }

        // Accumulate points
        for (int team = 0; team < BG_TEAMS_COUNT; ++team)
        {
            int points = team_points[team];
            if (!points)
                continue;
            m_lastTick[team] += diff;
            if (m_lastTick[team] > BG_AO_TickIntervals[points])
            {
                m_lastTick[team] -= BG_AO_TickIntervals[points];
                m_TeamScores[team] += BG_AO_TickPoints[points];
                if (m_TeamScores[team] > BG_AO_MAX_TEAM_SCORE)
                    m_TeamScores[team] = BG_AO_MAX_TEAM_SCORE;
                if (team == TEAM_ALLIANCE)
                    UpdateWorldState(BG_AO_OP_RESOURCES_ALLY, m_TeamScores[team]);
                if (team == TEAM_HORDE)
                    UpdateWorldState(BG_AO_OP_RESOURCES_HORDE, m_TeamScores[team]);
            }
        }

        // Test win condition
        if (m_TeamScores[TEAM_ALLIANCE] >= BG_AO_MAX_TEAM_SCORE)
            m_TeamScores[TEAM_ALLIANCE] = 0;
        if (m_TeamScores[TEAM_HORDE] >= BG_AO_MAX_TEAM_SCORE)
            m_TeamScores[TEAM_HORDE] = 0;
    }
}

void BattlegroundAO::StartingEvent()
{
    // despawn banners, auras
    for (int obj = BG_AO_OBJECT_BANNER_NEUTRAL; obj < BG_AO_DYNAMIC_NODES_COUNT * 8; ++obj)
        SpawnBGObject(obj, RESPAWN_ONE_DAY);

	sLog->outError(LOG_FILTER_GENERAL, "ici");

    // Starting base spirit guides
    _NodeOccupied(BG_AO_SPIRIT_ALIANCE, ALLIANCE);
    _NodeOccupied(BG_AO_SPIRIT_HORDE, HORDE);

    // spawn neutral banners
    for (int banner = BG_AO_OBJECT_BANNER_NEUTRAL, i = 0; i < 5; banner += 8, ++i)
        SpawnBGObject(banner, RESPAWN_IMMEDIATELY);
}


void BattlegroundAO::AddPlayer(Player* player)
{
    Battleground::AddPlayer(player);
    //create score and add it to map, default values are set in the constructor
    BattlegroundAOScore* sc = new BattlegroundAOScore;

    PlayerScores[player->GetGUID()] = sc;
}

void BattlegroundAO::RemovePlayer(Player* /*player*/, uint64 /*guid*/, uint32 /*team*/)
{
}

/*  type: 0-neutral, 1-contested, 3-occupied
    teamIndex: 0-ally, 1-horde                        */
void BattlegroundAO::_CreateBanner(uint8 node, uint8 type, uint8 teamIndex, bool delay)
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

    SpawnBGObject(obj, RESPAWN_IMMEDIATELY);

    // handle aura with banner
    if (!type)
        return;
    obj = node * 8 + ((type == BG_AO_NODE_TYPE_OCCUPIED) ? (5 + teamIndex) : 7);
    SpawnBGObject(obj, RESPAWN_IMMEDIATELY);
}

void BattlegroundAO::_DelBanner(uint8 node, uint8 type, uint8 teamIndex)
{
    uint8 obj = node*8 + type + teamIndex;
    SpawnBGObject(obj, RESPAWN_ONE_DAY);

    // handle aura with banner
    if (!type)
        return;
    obj = node * 8 + ((type == BG_AO_NODE_TYPE_OCCUPIED) ? (5 + teamIndex) : 7);
    SpawnBGObject(obj, RESPAWN_ONE_DAY);
}

int32 BattlegroundAO::_GetNodeNameId(uint8 node)
{
    switch (node)
    {
        case BG_AO_NODE_SANCTUM:    return LANG_BG_AO_NODE_SANCTUM;
        case BG_AO_NODE_PALAIS:		return LANG_BG_AO_NODE_PALAIS;
        case BG_AO_NODE_PUITS:      return LANG_BG_AO_NODE_PUITS;
        case BG_AO_NODE_RUINES:		return LANG_BG_AO_NODE_RUINES;
        case BG_AO_NODE_LAC:		return LANG_BG_AO_NODE_LAC;
        case BG_AO_NODE_CATACOMBES:	return LANG_BG_AO_NODE_CATACOMBES;
        case BG_AO_NODE_TEMPLE:		return LANG_BG_AO_NODE_TEMPLE;
        default:
            ASSERT(false);
    }
    return 0;
}

void BattlegroundAO::FillInitialWorldStates(WorldPacket& data)
{
    const uint8 plusArray[] = {0, 2, 3, 0, 1};

    // Node icons
    for (uint8 node = 0; node < BG_AO_DYNAMIC_NODES_COUNT; ++node)
        data << uint32(BG_AO_OP_NODEICONS[node]) << uint32((m_Nodes[node] == 0)?1:0);

    // Node occupied states
    for (uint8 node = 0; node < BG_AO_DYNAMIC_NODES_COUNT; ++node)
        for (uint8 i = 1; i < BG_AO_DYNAMIC_NODES_COUNT; ++i)
            data << uint32(BG_AO_OP_NODESTATES[node] + plusArray[i]) << uint32((m_Nodes[node] == i)?1:0);

    // How many bases each team owns
    uint8 ally = 0, horde = 0;
    for (uint8 node = 0; node < BG_AO_DYNAMIC_NODES_COUNT; ++node)
        if (m_Nodes[node] == BG_AO_NODE_STATUS_ALLY_OCCUPIED)
            ++ally;
        else if (m_Nodes[node] == BG_AO_NODE_STATUS_HORDE_OCCUPIED)
            ++horde;

    data << uint32(BG_AO_OP_OCCUPIED_BASES_ALLY)  << uint32(ally);
    data << uint32(BG_AO_OP_OCCUPIED_BASES_HORDE) << uint32(horde);

    // Team scores
    data << uint32(BG_AO_OP_RESOURCES_MAX)      << uint32(BG_AO_MAX_TEAM_SCORE);
    data << uint32(BG_AO_OP_RESOURCES_ALLY)     << uint32(m_TeamScores[TEAM_ALLIANCE]);
    data << uint32(BG_AO_OP_RESOURCES_HORDE)    << uint32(m_TeamScores[TEAM_HORDE]);

    // other unknown
    data << uint32(0x745) << uint32(0x2);           // 37 1861 unk
}

void BattlegroundAO::_SendNodeUpdate(uint8 node)
{
    // Send node owner state update to refresh map icons on client
    const uint8 plusArray[] = {0, 2, 3, 0, 1};

    if (m_prevNodes[node])
        UpdateWorldState(BG_AO_OP_NODESTATES[node] + plusArray[m_prevNodes[node]], 0);
    else
        UpdateWorldState(BG_AO_OP_NODEICONS[node], 0);

    UpdateWorldState(BG_AO_OP_NODESTATES[node] + plusArray[m_Nodes[node]], 1);

    // How many bases each team owns
    uint8 ally = 0, horde = 0;
    for (uint8 i = 0; i < BG_AO_DYNAMIC_NODES_COUNT; ++i)
        if (m_Nodes[i] == BG_AO_NODE_STATUS_ALLY_OCCUPIED)
            ++ally;
        else if (m_Nodes[i] == BG_AO_NODE_STATUS_HORDE_OCCUPIED)
            ++horde;

    UpdateWorldState(BG_AO_OP_OCCUPIED_BASES_ALLY, ally);
    UpdateWorldState(BG_AO_OP_OCCUPIED_BASES_HORDE, horde);
}

void BattlegroundAO::_NodeOccupied(uint8 node, Team team)
{
    if (!AddSpiritGuide(node, BG_AO_SpiritGuidePos[node][0], BG_AO_SpiritGuidePos[node][1], BG_AO_SpiritGuidePos[node][2], BG_AO_SpiritGuidePos[node][3], team))
        sLog->outError(LOG_FILTER_BATTLEGROUND, "Failed to spawn spirit guide! point: %u, team: %u, ", node, team);

    uint8 capturedNodes = 0;
    for (uint8 i = 0; i < BG_AO_DYNAMIC_NODES_COUNT; ++i)
    {
        if (m_Nodes[node] == GetTeamIndexByTeamId(team) + BG_AO_NODE_TYPE_OCCUPIED && !m_NodeTimers[i])
            ++capturedNodes;
    }
	
    if (node >= BG_AO_DYNAMIC_NODES_COUNT)//only dynamic nodes, no start points
        return;

    Creature* trigger = BgCreatures[node+9] ? GetBGCreature(node+9) : NULL;//0-6 spirit guides TOFIX
    if (!trigger)
        trigger = AddCreature(WORLD_TRIGGER, node+9, team, BG_AO_NodePositions[node][0], BG_AO_NodePositions[node][1], BG_AO_NodePositions[node][2], BG_AO_NodePositions[node][3]);
}

void BattlegroundAO::_NodeDeOccupied(uint8 node)
{
    if (node >= BG_AO_DYNAMIC_NODES_COUNT)
        return;

    //remove bonus honor aura trigger creature when node is lost
    if (node < BG_AO_DYNAMIC_NODES_COUNT)//only dynamic nodes, no start points
        DelCreature(node+7);//NULL checks are in DelCreature! 0-6 spirit guides

    // Those who are waiting to resurrect at this node are taken to the closest own node's graveyard
    std::vector<uint64> ghost_list = m_ReviveQueue[BgCreatures[node]];
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
                player->TeleportTo(GetMapId(), ClosestGrave->x, ClosestGrave->y, ClosestGrave->z, player->GetOrientation());
        }
    }

    if (BgCreatures[node])
        DelCreature(node);

    // buff object isn't despawned
}

/* Invoked if a player used a banner as a gameobject */
void BattlegroundAO::EventPlayerClickedOnFlag(Player* source, GameObject* /*target_obj*/)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;


    uint8 node = BG_AO_NODE_SANCTUM;
    GameObject* obj = GetBgMap()->GetGameObject(BgObjects[node*8+7]);
    while ((node < BG_AO_DYNAMIC_NODES_COUNT) && ((!obj) || (!source->IsWithinDistInMap(obj, 10))))
    {
        ++node;
        obj = GetBgMap()->GetGameObject(BgObjects[node*8+BG_AO_OBJECT_AURA_CONTESTED]);
    }

    if (node == BG_AO_DYNAMIC_NODES_COUNT)
    {
        // this means our player isn't close to any of banners - maybe cheater ??
        return;
    }

    TeamId teamIndex = GetTeamIndexByTeamId(source->GetTeam());

    // Check if player really could use this banner, not cheated
    if (!(m_Nodes[node] == 0 || teamIndex == m_Nodes[node]%2))
        return;

    source->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_ENTER_PVP_COMBAT);
    uint32 sound = 0;
    // If node is neutral, change to contested
    if (m_Nodes[node] == BG_AO_NODE_TYPE_NEUTRAL)
    {
        UpdatePlayerScore(source, SCORE_BASES_ASSAULTED, 1);
        m_prevNodes[node] = m_Nodes[node];
        m_Nodes[node] = teamIndex + 1;
        _DelBanner(node, BG_AO_NODE_TYPE_NEUTRAL, 0);
        _CreateBanner(node, BG_AO_NODE_TYPE_CONTESTED, teamIndex, true);
        _SendNodeUpdate(node);
        m_NodeTimers[node] = BG_AO_FLAG_CAPTURING_TIME;

        // FIXME: team and node names not localized
        if (teamIndex == 0)
            SendMessage2ToAll(LANG_BG_AO_NODE_CLAIMED, CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node), LANG_BG_AO_ALLY);
        else
            SendMessage2ToAll(LANG_BG_AO_NODE_CLAIMED, CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node), LANG_BG_AO_HORDE);

        sound = BG_AO_SOUND_NODE_CLAIMED;
    }
    // If node is contested
    else if ((m_Nodes[node] == BG_AO_NODE_STATUS_ALLY_CONTESTED) || (m_Nodes[node] == BG_AO_NODE_STATUS_HORDE_CONTESTED))
    {
        // If last state is NOT occupied, change node to enemy-contested
        if (m_prevNodes[node] < BG_AO_NODE_TYPE_OCCUPIED)
        {
            UpdatePlayerScore(source, SCORE_BASES_ASSAULTED, 1);
            m_prevNodes[node] = m_Nodes[node];
            m_Nodes[node] = teamIndex + BG_AO_NODE_TYPE_CONTESTED;
            _DelBanner(node, BG_AO_NODE_TYPE_CONTESTED, !teamIndex);
            _CreateBanner(node, BG_AO_NODE_TYPE_CONTESTED, teamIndex, true);
            _SendNodeUpdate(node);
            m_NodeTimers[node] = BG_AO_FLAG_CAPTURING_TIME;

            // FIXME: node names not localized
            if (teamIndex == TEAM_ALLIANCE)
                SendMessage2ToAll(LANG_BG_AO_NODE_ASSAULTED, CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node));
            else
                SendMessage2ToAll(LANG_BG_AO_NODE_ASSAULTED, CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node));
        }
        // If contested, change back to occupied
        else
        {
            UpdatePlayerScore(source, SCORE_BASES_DEFENDED, 1);
            m_prevNodes[node] = m_Nodes[node];
            m_Nodes[node] = teamIndex + BG_AO_NODE_TYPE_OCCUPIED;
            _DelBanner(node, BG_AO_NODE_TYPE_CONTESTED, !teamIndex);
            _CreateBanner(node, BG_AO_NODE_TYPE_OCCUPIED, teamIndex, true);
            _SendNodeUpdate(node);
            m_NodeTimers[node] = 0;
            _NodeOccupied(node, (teamIndex == TEAM_ALLIANCE) ? ALLIANCE:HORDE);

            // FIXME: node names not localized
            if (teamIndex == TEAM_ALLIANCE)
                SendMessage2ToAll(LANG_BG_AO_NODE_DEFENDED, CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node));
            else
                SendMessage2ToAll(LANG_BG_AO_NODE_DEFENDED, CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node));
        }
        sound = (teamIndex == TEAM_ALLIANCE) ? BG_AO_SOUND_NODE_ASSAULTED_ALLIANCE : BG_AO_SOUND_NODE_ASSAULTED_HORDE;
    }
    // If node is occupied, change to enemy-contested
    else
    {
        UpdatePlayerScore(source, SCORE_BASES_ASSAULTED, 1);
        m_prevNodes[node] = m_Nodes[node];
        m_Nodes[node] = teamIndex + BG_AO_NODE_TYPE_CONTESTED;
        _DelBanner(node, BG_AO_NODE_TYPE_OCCUPIED, !teamIndex);
        _CreateBanner(node, BG_AO_NODE_TYPE_CONTESTED, teamIndex, true);
        _SendNodeUpdate(node);
        _NodeDeOccupied(node);
        m_NodeTimers[node] = BG_AO_FLAG_CAPTURING_TIME;

        // FIXME: node names not localized
        if (teamIndex == TEAM_ALLIANCE)
            SendMessage2ToAll(LANG_BG_AO_NODE_ASSAULTED, CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node));
        else
            SendMessage2ToAll(LANG_BG_AO_NODE_ASSAULTED, CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node));

        sound = (teamIndex == TEAM_ALLIANCE) ? BG_AO_SOUND_NODE_ASSAULTED_ALLIANCE : BG_AO_SOUND_NODE_ASSAULTED_HORDE;
    }

    // If node is occupied again, send "X has taken the Y" msg.
    if (m_Nodes[node] >= BG_AO_NODE_TYPE_OCCUPIED)
    {
        // FIXME: team and node names not localized
        if (teamIndex == TEAM_ALLIANCE)
            SendMessage2ToAll(LANG_BG_AO_NODE_TAKEN, CHAT_MSG_BG_SYSTEM_ALLIANCE, NULL, LANG_BG_AO_ALLY, _GetNodeNameId(node));
        else
            SendMessage2ToAll(LANG_BG_AO_NODE_TAKEN, CHAT_MSG_BG_SYSTEM_HORDE, NULL, LANG_BG_AO_HORDE, _GetNodeNameId(node));
    }
    PlaySoundToAll(sound);
}

uint32 BattlegroundAO::GetPrematureWinner()
{
    // How many bases each team owns
    uint8 ally = 0, horde = 0;
    for (uint8 i = 0; i < BG_AO_DYNAMIC_NODES_COUNT; ++i)
        if (m_Nodes[i] == BG_AO_NODE_STATUS_ALLY_OCCUPIED)
            ++ally;
        else if (m_Nodes[i] == BG_AO_NODE_STATUS_HORDE_OCCUPIED)
            ++horde;

    if (ally > horde)
        return ALLIANCE;
    else if (horde > ally)
        return HORDE;

    // If the values are equal, fall back to the original result (based on number of players on each team)
    return Battleground::GetPrematureWinner();
}

bool BattlegroundAO::SetupBattleground()
{
    for (int i = 0; i < BG_AO_DYNAMIC_NODES_COUNT; ++i)
    {
        if (!AddObject(BG_AO_OBJECT_BANNER_NEUTRAL + 8*i, BG_AO_OBJECTID_NODE_BANNER_0 + i, BG_AO_NodePositions[i][0], BG_AO_NodePositions[i][1], BG_AO_NodePositions[i][2], BG_AO_NodePositions[i][3], 0, 0, std::sin(BG_AO_NodePositions[i][3]/2), std::cos(BG_AO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_AO_OBJECT_BANNER_CONT_A + 8*i, BG_AO_OBJECTID_BANNER_CONT_A, BG_AO_NodePositions[i][0], BG_AO_NodePositions[i][1], BG_AO_NodePositions[i][2], BG_AO_NodePositions[i][3], 0, 0, std::sin(BG_AO_NodePositions[i][3]/2), std::cos(BG_AO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_AO_OBJECT_BANNER_CONT_H + 8*i, BG_AO_OBJECTID_BANNER_CONT_H, BG_AO_NodePositions[i][0], BG_AO_NodePositions[i][1], BG_AO_NodePositions[i][2], BG_AO_NodePositions[i][3], 0, 0, std::sin(BG_AO_NodePositions[i][3]/2), std::cos(BG_AO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_AO_OBJECT_BANNER_ALLY + 8*i, BG_AO_OBJECTID_BANNER_A, BG_AO_NodePositions[i][0], BG_AO_NodePositions[i][1], BG_AO_NodePositions[i][2], BG_AO_NodePositions[i][3], 0, 0, std::sin(BG_AO_NodePositions[i][3]/2), std::cos(BG_AO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_AO_OBJECT_BANNER_HORDE + 8*i, BG_AO_OBJECTID_BANNER_H, BG_AO_NodePositions[i][0], BG_AO_NodePositions[i][1], BG_AO_NodePositions[i][2], BG_AO_NodePositions[i][3], 0, 0, std::sin(BG_AO_NodePositions[i][3]/2), std::cos(BG_AO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_AO_OBJECT_AURA_ALLY + 8*i, BG_AO_OBJECTID_AURA_A, BG_AO_NodePositions[i][0], BG_AO_NodePositions[i][1], BG_AO_NodePositions[i][2], BG_AO_NodePositions[i][3], 0, 0, std::sin(BG_AO_NodePositions[i][3]/2), std::cos(BG_AO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_AO_OBJECT_AURA_HORDE + 8*i, BG_AO_OBJECTID_AURA_H, BG_AO_NodePositions[i][0], BG_AO_NodePositions[i][1], BG_AO_NodePositions[i][2], BG_AO_NodePositions[i][3], 0, 0, std::sin(BG_AO_NodePositions[i][3]/2), std::cos(BG_AO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_AO_OBJECT_AURA_CONTESTED + 8*i, BG_AO_OBJECTID_AURA_C, BG_AO_NodePositions[i][0], BG_AO_NodePositions[i][1], BG_AO_NodePositions[i][2], BG_AO_NodePositions[i][3], 0, 0, std::sin(BG_AO_NodePositions[i][3]/2), std::cos(BG_AO_NodePositions[i][3]/2), RESPAWN_ONE_DAY)
)
        {
            sLog->outError(LOG_FILTER_SQL, "BatteGroundAO: Failed to spawn some object Battleground not created!");
            return false;
        }
    }
    /* buffs TOFIX
    for (int i = 0; i < BG_AB_DYNAMIC_NODES_COUNT; ++i)
    {
        if (!AddObject(BG_AB_OBJECT_SPEEDBUFF_STABLES + 3 * i, Buff_Entries[0], BG_AB_BuffPositions[i][0], BG_AB_BuffPositions[i][1], BG_AB_BuffPositions[i][2], BG_AB_BuffPositions[i][3], 0, 0, std::sin(BG_AB_BuffPositions[i][3]/2), std::cos(BG_AB_BuffPositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_AB_OBJECT_SPEEDBUFF_STABLES + 3 * i + 1, Buff_Entries[1], BG_AB_BuffPositions[i][0], BG_AB_BuffPositions[i][1], BG_AB_BuffPositions[i][2], BG_AB_BuffPositions[i][3], 0, 0, std::sin(BG_AB_BuffPositions[i][3]/2), std::cos(BG_AB_BuffPositions[i][3]/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_AB_OBJECT_SPEEDBUFF_STABLES + 3 * i + 2, Buff_Entries[2], BG_AB_BuffPositions[i][0], BG_AB_BuffPositions[i][1], BG_AB_BuffPositions[i][2], BG_AB_BuffPositions[i][3], 0, 0, std::sin(BG_AB_BuffPositions[i][3]/2), std::cos(BG_AB_BuffPositions[i][3]/2), RESPAWN_ONE_DAY)
)
            sLog->outError(LOG_FILTER_SQL, "BatteGroundAB: Failed to spawn buff object!");
    }*/

    return true;
}

void BattlegroundAO::Reset()
{
    //call parent's class reset
    Battleground::Reset();

    m_TeamScores[TEAM_ALLIANCE]          = 0;
    m_TeamScores[TEAM_HORDE]             = 0;
    m_lastTick[TEAM_ALLIANCE]            = 0;
    m_lastTick[TEAM_HORDE]               = 0;

    for (uint8 i = 0; i < BG_AO_DYNAMIC_NODES_COUNT; ++i)
    {
        m_Nodes[i] = 0;
        m_prevNodes[i] = 0;
        m_NodeTimers[i] = 0;
        m_BannerTimers[i].timer = 0;
    }

    for (uint8 i = 0; i < BG_AO_ALL_NODES_COUNT + 7; ++i)//+7 for aura triggers
        if (BgCreatures[i])
            DelCreature(i);
}

WorldSafeLocsEntry const* BattlegroundAO::GetClosestGraveYard(Player* player)
{
    TeamId teamIndex = GetTeamIndexByTeamId(player->GetTeam());

    // Is there any occupied node for this team?
    std::vector<uint8> nodes;
    for (uint8 i = 0; i < BG_AO_DYNAMIC_NODES_COUNT; ++i)
        if (m_Nodes[i] == teamIndex + 3)
            nodes.push_back(i);

    WorldSafeLocsEntry const* good_entry = NULL;
    // If so, select the closest node to place ghost on
    if (!nodes.empty())
    {
        float plr_x = player->GetPositionX();
        float plr_y = player->GetPositionY();

        float mindist = 999999.0f;
        for (uint8 i = 0; i < nodes.size(); ++i)
        {
            WorldSafeLocsEntry const*entry = sWorldSafeLocsStore.LookupEntry(BG_AO_GraveyardIds[nodes[i]]);
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
        good_entry = sWorldSafeLocsStore.LookupEntry(BG_AO_GraveyardIds[teamIndex+7]);

    return good_entry;
}

void BattlegroundAO::UpdatePlayerScore(Player* Source, uint32 type, uint32 value, bool doAddHonor)
{
    BattlegroundScoreMap::iterator itr = PlayerScores.find(Source->GetGUID());
    if (itr == PlayerScores.end())                         // player not found...
        return;

    switch (type)
    {
        case SCORE_BASES_ASSAULTED:
            ((BattlegroundAOScore*)itr->second)->BasesAssaulted += value;
            break;
        case SCORE_BASES_DEFENDED:
            ((BattlegroundAOScore*)itr->second)->BasesDefended += value;
            break;
        default:
            Battleground::UpdatePlayerScore(Source, type, value, doAddHonor);
            break;
    }
}
