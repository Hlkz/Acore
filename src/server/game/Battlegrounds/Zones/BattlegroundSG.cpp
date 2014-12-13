
#include "BattlegroundSG.h"
#include "World.h"
#include "WorldPacket.h"
#include "ObjectMgr.h"
#include "BattlegroundMgr.h"
#include "Creature.h"
#include "Language.h"
#include "Player.h"
#include "Util.h"
#include "WorldSession.h"

BattlegroundSG::BattlegroundSG()
{
    BgObjects.resize(BG_SG_OBJECT_MAX);
    BgCreatures.resize(BG_SG_CREA_MAX + BG_SG_DYNAMIC_NODES_COUNT);

    StartDelayTimes[BG_STARTING_EVENT_FIRST] = (BattlegroundStartTimeIntervals)15000;
    StartDelayTimes[BG_STARTING_EVENT_SECOND] = (BattlegroundStartTimeIntervals)10000;
    StartDelayTimes[BG_STARTING_EVENT_THIRD] = (BattlegroundStartTimeIntervals)5000;
    StartDelayTimes[BG_STARTING_EVENT_FOURTH] = BG_START_DELAY_NONE;

    StartMessageIds[BG_STARTING_EVENT_FIRST]  = LANG_BG_SG_START_TWO_MINUTES;
    StartMessageIds[BG_STARTING_EVENT_SECOND] = LANG_BG_SG_START_ONE_MINUTE;
    StartMessageIds[BG_STARTING_EVENT_THIRD]  = LANG_BG_SG_START_HALF_MINUTE;
    StartMessageIds[BG_STARTING_EVENT_FOURTH] = LANG_BG_SG_HAS_BEGUN;
    m_WallFallen = false;
    m_pts[0] = 0;
    m_pts[1] = 0;

    _flagSpellForceTimer = 0;
    _bothFlagsKept = false;
    _flagDebuffState = 0;
    m_FlagKeepers[TEAM_ALLIANCE].Clear();
    m_FlagKeepers[TEAM_HORDE].Clear();
    m_DroppedFlagGUID[TEAM_ALLIANCE].Clear();
    m_DroppedFlagGUID[TEAM_HORDE].Clear();
    _flagState[TEAM_ALLIANCE] = BG_SG_FLAG_STATE_ON_BASE;
    _flagState[TEAM_HORDE] = BG_SG_FLAG_STATE_ON_BASE;
    _flagsTimer[TEAM_ALLIANCE] = 0;
    _flagsTimer[TEAM_HORDE] = 0;
    _flagsDropTimer[TEAM_ALLIANCE] = 0;
    _flagsDropTimer[TEAM_HORDE] = 0;
    _lastFlagCaptureTeam = 0;
    _minutesElapsed = 0;
    m_isCommanderAlive[TEAM_ALLIANCE] = true;
    m_isCommanderAlive[TEAM_HORDE] = true;
}

BattlegroundSG::~BattlegroundSG() { }

bool BattlegroundSG::SetupBattleground()
{
    for (int i = 0; i < BG_SG_DYNAMIC_NODES_COUNT; ++i)
    {
        if (!AddObject(BG_SG_OBJECT_BANNER_NEUTRAL + 8*i, BG_SG_ENTRY_BANNER, BG_SG_NodePositions[i], 0, 0, std::sin(BG_SG_NodePositions[i].GetOrientation()/2), std::cos(BG_SG_NodePositions[i].GetOrientation()/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_SG_OBJECT_BANNER_CONT_A + 8*i, BG_SG_ENTRY_BANNER_CONT_A, BG_SG_NodePositions[i], 0, 0, std::sin(BG_SG_NodePositions[i].GetOrientation()/2), std::cos(BG_SG_NodePositions[i].GetOrientation()/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_SG_OBJECT_BANNER_CONT_H + 8*i, BG_SG_ENTRY_BANNER_CONT_H, BG_SG_NodePositions[i], 0, 0, std::sin(BG_SG_NodePositions[i].GetOrientation()/2), std::cos(BG_SG_NodePositions[i].GetOrientation()/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_SG_OBJECT_BANNER_ALLY + 8*i, BG_SG_ENTRY_BANNER_A, BG_SG_NodePositions[i], 0, 0, std::sin(BG_SG_NodePositions[i].GetOrientation()/2), std::cos(BG_SG_NodePositions[i].GetOrientation()/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_SG_OBJECT_BANNER_HORDE + 8*i, BG_SG_ENTRY_BANNER_H, BG_SG_NodePositions[i], 0, 0, std::sin(BG_SG_NodePositions[i].GetOrientation()/2), std::cos(BG_SG_NodePositions[i].GetOrientation()/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_SG_OBJECT_AURA_ALLY + 8*i, BG_SG_ENTRY_AURA_A, BG_SG_NodePositions[i], 0, 0, std::sin(BG_SG_NodePositions[i].GetOrientation()/2), std::cos(BG_SG_NodePositions[i].GetOrientation()/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_SG_OBJECT_AURA_HORDE + 8*i, BG_SG_ENTRY_AURA_H, BG_SG_NodePositions[i], 0, 0, std::sin(BG_SG_NodePositions[i].GetOrientation()/2), std::cos(BG_SG_NodePositions[i].GetOrientation()/2), RESPAWN_ONE_DAY)
            || !AddObject(BG_SG_OBJECT_AURA_CONTESTED + 8*i, BG_SG_ENTRY_AURA_C, BG_SG_NodePositions[i], 0, 0, std::sin(BG_SG_NodePositions[i].GetOrientation()/2), std::cos(BG_SG_NodePositions[i].GetOrientation()/2), RESPAWN_ONE_DAY))
        {
            TC_LOG_ERROR("sql.sql", "BatteGroundSG: Failed to spawn some object Battleground not created!");
            return false;
        }
    }
    
    // flags
    if (!AddObject(BG_SG_OBJECT_FLAG_A,BG_SG_ENTRY_FLAG_A, BG_SG_FlagPositions[0], 0, 0, std::sin(BG_SG_FlagPositions[0].GetOrientation()/2), std::cos(BG_SG_FlagPositions[0].GetOrientation()/2), BG_SG_FLAG_RESPAWN_TIME/1000)
        || !AddObject(BG_SG_OBJECT_FLAG_H, BG_SG_ENTRY_FLAG_H, BG_SG_FlagPositions[1], 0, 0, std::sin(BG_SG_FlagPositions[1].GetOrientation()/2), std::cos(BG_SG_FlagPositions[1].GetOrientation()/2), BG_SG_FLAG_RESPAWN_TIME/1000)
        // buffs
        || !AddObject(BG_SG_OBJECT_SPEEDBUFF, BG_OBJECTID_SPEEDBUFF_ENTRY, BG_SG_BuffPositions[0], 0, 0, std::sin(BG_SG_BuffPositions[0].GetOrientation()/2), std::cos(BG_SG_BuffPositions[0].GetOrientation()/2), BUFF_RESPAWN_TIME)
        || !AddObject(BG_SG_OBJECT_REGENBUFF_LEFT, BG_OBJECTID_REGENBUFF_ENTRY, BG_SG_BuffPositions[1], 0, 0, std::sin(BG_SG_BuffPositions[1].GetOrientation()/2), std::cos(BG_SG_BuffPositions[1].GetOrientation()/2), BUFF_RESPAWN_TIME)
        || !AddObject(BG_SG_OBJECT_REGENBUFF_RIGHT, BG_OBJECTID_REGENBUFF_ENTRY, BG_SG_BuffPositions[2], 0, 0, std::sin(BG_SG_BuffPositions[2].GetOrientation()/2), std::cos(BG_SG_BuffPositions[2].GetOrientation()/2), BUFF_RESPAWN_TIME)
        || !AddObject(BG_SG_OBJECT_BERSERKBUFF_LEFT, BG_OBJECTID_BERSERKERBUFF_ENTRY, BG_SG_BuffPositions[3], 0, 0, std::sin(BG_SG_BuffPositions[3].GetOrientation()/2), std::cos(BG_SG_BuffPositions[3].GetOrientation()/2), BUFF_RESPAWN_TIME)
        || !AddObject(BG_SG_OBJECT_BERSERKBUFF_RIGHT, BG_OBJECTID_BERSERKERBUFF_ENTRY, BG_SG_BuffPositions[4], 0, 0, std::sin(BG_SG_BuffPositions[4].GetOrientation()/2), std::cos(BG_SG_BuffPositions[4].GetOrientation()/2), BUFF_RESPAWN_TIME)
        // gates
        || !AddObject(BG_SG_OBJECT_GATE_A, BG_SG_ENTRY_GATE_A, BG_SG_DoorPositions[0], 0, 0, std::sin(BG_SG_DoorPositions[0].GetOrientation()/2), std::cos(BG_SG_DoorPositions[0].GetOrientation()/2), RESPAWN_IMMEDIATELY)
        || !AddObject(BG_SG_OBJECT_GATE_H, BG_SG_ENTRY_GATE_H, BG_SG_DoorPositions[1], 0, 0, std::sin(BG_SG_DoorPositions[1].GetOrientation()/2), std::cos(BG_SG_DoorPositions[1].GetOrientation()/2), RESPAWN_IMMEDIATELY)
        // wall
        || !AddObject(BG_SG_OBJECT_WALL, BG_SG_ENTRY_WALL, BG_SG_WallPosition, 0, 0, std::sin(BG_SG_WallPosition.GetOrientation()/2), std::cos(BG_SG_WallPosition.GetOrientation()/2), RESPAWN_IMMEDIATELY))
    {
        TC_LOG_ERROR("sql.sql", "BatteGroundSG: Failed to spawn door object Battleground not created!");
        return false;
    }

    return true;
}

void BattlegroundSG::Reset()
{
    //call parent's class reset
    Battleground::Reset();

    for (uint8 i = 0; i < BG_SG_DYNAMIC_NODES_COUNT; ++i)
    {
        m_Nodes[i] = 0;
        m_prevNodes[i] = 0;
        m_NodeTimers[i] = 0;
        m_BannerTimers[i].timer = 0;
    }

    for (uint8 i = 0; i < BG_SG_CREA_MAX + BG_SG_DYNAMIC_NODES_COUNT; ++i) // + DynamicNodesCount aura triggers
        if (BgCreatures[i])
            DelCreature(i);
}

void BattlegroundSG::StartingEventCloseDoors()
{
    for (int obj = BG_SG_OBJECT_BANNER_NEUTRAL; obj < BG_SG_DYNAMIC_NODES_COUNT * BG_SG_BANNER_MAX; ++obj) // despawn banners/auras
        SpawnBGObject(obj, RESPAWN_ONE_DAY);
    for (int obj = BG_SG_OBJECT_SPEEDBUFF; obj <= BG_SG_OBJECT_BERSERKBUFF_RIGHT; ++obj) // despawn buffs
        SpawnBGObject(obj, RESPAWN_ONE_DAY);
    DoorClose(BG_SG_OBJECT_GATE_A);
    DoorClose(BG_SG_OBJECT_GATE_H);
    SpawnBGObject(BG_SG_OBJECT_GATE_A, RESPAWN_IMMEDIATELY); // spawn doors
    SpawnBGObject(BG_SG_OBJECT_GATE_H, RESPAWN_IMMEDIATELY);
    SpawnBGObject(BG_SG_OBJECT_WALL, RESPAWN_IMMEDIATELY); // spawn wall
    SpawnBGObject(BG_SG_OBJECT_FLAG_A, RESPAWN_ONE_DAY); // despawn flags
    SpawnBGObject(BG_SG_OBJECT_FLAG_H, RESPAWN_ONE_DAY);

    for (uint8 node = BG_SG_FIRST_NODE; node < BG_SG_DYNAMIC_NODES_COUNT; node++)
    {
        _NodeOccupied(node, (node < BG_SG_NODE_BOTCASTLE ? ALLIANCE : HORDE)); // spawn spirit healers
        m_Nodes[node] = (node < BG_SG_NODE_BOTCASTLE ? TEAM_ALLIANCE : TEAM_HORDE) + BG_SG_NODE_TYPE_OCCUPIED;
        m_prevNodes[node] = m_Nodes[node];
        _CreateBanner(node, BG_SG_NODE_TYPE_OCCUPIED, (node < BG_SG_NODE_BOTCASTLE ? TEAM_ALLIANCE : TEAM_HORDE), 0); // spawn banners
    }
    if (GameObject* ob = GetBGObject(BG_SG_OBJECT_BANNER_ALLY + BG_SG_BANNER_MAX * BG_SG_NODE_TOPCASTLE))
        ob->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_CANTH2);
    if (GameObject* ob = GetBGObject(BG_SG_OBJECT_BANNER_HORDE + BG_SG_BANNER_MAX * BG_SG_NODE_BOTCASTLE))
        ob->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_CANTA2);
    UpdateFlagCastTime(0, true);
}

void BattlegroundSG::StartingEventOpenDoors()
{
    for (uint32 i = BG_SG_OBJECT_GATE_A; i <= BG_SG_OBJECT_GATE_H; ++i)
        DoorOpen(i);

    for (uint32 i = BG_SG_OBJECT_SPEEDBUFF; i < BG_SG_OBJECT_MAX; ++i)
        SpawnBGObject(i, RESPAWN_IMMEDIATELY);

    //UpdateWorldState(AV_SHOW_H_SCORE, 1);
    //UpdateWorldState(AV_SHOW_A_SCORE, 1);
}

void BattlegroundSG::HandleKillPlayer(Player* player, Player* killer)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
    Battleground::HandleKillPlayer(player, killer);
}

void BattlegroundSG::HandleKillUnit(Creature* unit, Player* killer)
{
    TC_LOG_DEBUG("bg.battleground", "SG HandleKillUnit %i", unit->GetEntry());
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
}

void BattlegroundSG::PostUpdateImpl(uint32 diff)
{
    if (GetStatus() == STATUS_IN_PROGRESS)
    {
        if (!m_WallFallen && GetStartTime() >= 12 * MINUTE*IN_MILLISECONDS)
             CrushWall();
        
        for (int node = BG_SG_FIRST_NODE; node < BG_SG_DYNAMIC_NODES_COUNT; ++node)
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
                    UpdateFlagCastTime(teamIndex);
                    // burn current contested banner
                    _DelBanner(node, BG_SG_NODE_TYPE_CONTESTED, teamIndex);
                    // create new occupied banner
                    _CreateBanner(node, BG_SG_NODE_TYPE_OCCUPIED, teamIndex, true);
                    _SendNodeUpdate(node);
                    _NodeOccupied(node, (teamIndex == 0) ? ALLIANCE:HORDE);
                    // Message to chatlog

                    if (teamIndex == 0)
                    {
                        // FIXME: team and node names not localized
                        SendMessage2ToAll(LANG_BG_SG_NODE_TAKEN, CHAT_MSG_BG_SYSTEM_ALLIANCE, NULL, LANG_BG_AB_ALLY, _GetNodeNameId(node));
                        PlaySoundToAll(BG_SG_SOUND_NODE_CAPTURED_ALLIANCE);
                    }
                    else
                    {
                        // FIXME: team and node names not localized
                        SendMessage2ToAll(LANG_BG_SG_NODE_TAKEN, CHAT_MSG_BG_SYSTEM_HORDE, NULL, LANG_BG_AB_HORDE, _GetNodeNameId(node));
                        PlaySoundToAll(BG_SG_SOUND_NODE_CAPTURED_HORDE);
                    }
                }
            }
        }

        ////// Flag System //////

        // first update needed after 1 minute of game already in progress
        if (GetStartTime() > uint32(_minutesElapsed * MINUTE * IN_MILLISECONDS) +  3 * MINUTE * IN_MILLISECONDS)
        {
            ++_minutesElapsed;
            //UpdateWorldState(BG_SG_STATE_TIMER, 25 - _minutesElapsed);
        }

        if (_flagState[TEAM_ALLIANCE] == BG_SG_FLAG_STATE_WAIT_RESPAWN)
        {
            _flagsTimer[TEAM_ALLIANCE] -= diff;

            if (_flagsTimer[TEAM_ALLIANCE] < 0)
            {
                _flagsTimer[TEAM_ALLIANCE] = 0;
                RespawnFlag(ALLIANCE, true);
            }
        }

        if (_flagState[TEAM_ALLIANCE] == BG_SG_FLAG_STATE_ON_GROUND)
        {
            _flagsDropTimer[TEAM_ALLIANCE] -= diff;

            if (_flagsDropTimer[TEAM_ALLIANCE] < 0)
            {
                _flagsDropTimer[TEAM_ALLIANCE] = 0;
                RespawnFlagAfterDrop(ALLIANCE);
                _bothFlagsKept = false;
            }
        }

        if (_flagState[TEAM_HORDE] == BG_SG_FLAG_STATE_WAIT_RESPAWN)
        {
            _flagsTimer[TEAM_HORDE] -= diff;

            if (_flagsTimer[TEAM_HORDE] < 0)
            {
                _flagsTimer[TEAM_HORDE] = 0;
                RespawnFlag(HORDE, true);
            }
        }

        if (_flagState[TEAM_HORDE] == BG_SG_FLAG_STATE_ON_GROUND)
        {
            _flagsDropTimer[TEAM_HORDE] -= diff;

            if (_flagsDropTimer[TEAM_HORDE] < 0)
            {
                _flagsDropTimer[TEAM_HORDE] = 0;
                RespawnFlagAfterDrop(HORDE);
                _bothFlagsKept = false;
            }
        }

        if (_bothFlagsKept)
        {
            _flagSpellForceTimer += diff;
            if (_flagDebuffState == 0 && _flagSpellForceTimer >= 10*MINUTE*IN_MILLISECONDS)  //10 minutes
            {
                if (Player* player = ObjectAccessor::FindPlayer(m_FlagKeepers[0]))
                    player->CastSpell(player, BG_SG_SPELL_FOCUSED_ASSAULT, true);
                if (Player* player = ObjectAccessor::FindPlayer(m_FlagKeepers[1]))
                    player->CastSpell(player, BG_SG_SPELL_FOCUSED_ASSAULT, true);
                _flagDebuffState = 1;
            }
            else if (_flagDebuffState == 1 && _flagSpellForceTimer >= 900000) //15 minutes
            {
                if (Player* player = ObjectAccessor::FindPlayer(m_FlagKeepers[0]))
                {
                    player->RemoveAurasDueToSpell(BG_SG_SPELL_FOCUSED_ASSAULT);
                    player->CastSpell(player, BG_SG_SPELL_BRUTAL_ASSAULT, true);
                }
                if (Player* player = ObjectAccessor::FindPlayer(m_FlagKeepers[1]))
                {
                    player->RemoveAurasDueToSpell(BG_SG_SPELL_FOCUSED_ASSAULT);
                    player->CastSpell(player, BG_SG_SPELL_BRUTAL_ASSAULT, true);
                }
                _flagDebuffState = 2;
            }
        }
        else
        {
            if (Player* player = ObjectAccessor::FindPlayer(m_FlagKeepers[0]))
            {
                player->RemoveAurasDueToSpell(BG_SG_SPELL_FOCUSED_ASSAULT);
                player->RemoveAurasDueToSpell(BG_SG_SPELL_BRUTAL_ASSAULT);
            }
            if (Player* player = ObjectAccessor::FindPlayer(m_FlagKeepers[1]))
            {
                player->RemoveAurasDueToSpell(BG_SG_SPELL_FOCUSED_ASSAULT);
                player->RemoveAurasDueToSpell(BG_SG_SPELL_BRUTAL_ASSAULT);
            }

            _flagSpellForceTimer = 0; //reset timer.
            _flagDebuffState = 0;
        }

        if (IsAllianceFlagPickedup())
            if (Player* player = ObjectAccessor::FindPlayer(m_FlagKeepers[TEAM_ALLIANCE]))
                if (GameObject* spawn = GetBGObject(BG_SG_OBJECT_FLAG_H))
                    if (player->IsWithinDistInMap(spawn, 3))
                        EventPlayerCapturedFlag(player);
        if (IsHordeFlagPickedup())
            if (Player* player = ObjectAccessor::FindPlayer(m_FlagKeepers[TEAM_HORDE]))
                if (GameObject* spawn = GetBGObject(BG_SG_OBJECT_FLAG_A))
                    if (player->IsWithinDistInMap(spawn, 3))
                        EventPlayerCapturedFlag(player);
    }
}

void BattlegroundSG::RespawnFlag(uint32 Team, bool captured)
{
    if (Team == ALLIANCE)
    {
        TC_LOG_DEBUG("bg.battleground", "Respawn Alliance flag");
        _flagState[TEAM_ALLIANCE] = BG_SG_FLAG_STATE_ON_BASE;
    }
    else
    {
        TC_LOG_DEBUG("bg.battleground", "Respawn Horde flag");
        _flagState[TEAM_HORDE] = BG_SG_FLAG_STATE_ON_BASE;
    }

    if (captured)
    {
        //when map_update will be allowed for battlegrounds this code will be useless
        SpawnBGObject(BG_SG_OBJECT_FLAG_H, RESPAWN_IMMEDIATELY);
        SpawnBGObject(BG_SG_OBJECT_FLAG_A, RESPAWN_IMMEDIATELY);
        SendMessageToAll(LANG_BG_SG_F_PLACED, CHAT_MSG_BG_SYSTEM_NEUTRAL);
        PlaySoundToAll(BG_SG_SOUND_FLAGS_RESPAWNED);        // flag respawned sound...
    }
    _bothFlagsKept = false;
}

void BattlegroundSG::RespawnFlagAfterDrop(uint32 team)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    RespawnFlag(team, false);
    if (team == ALLIANCE)
    {
        SpawnBGObject(BG_SG_OBJECT_FLAG_A, RESPAWN_IMMEDIATELY);
        SendMessageToAll(LANG_BG_SG_ALLIANCE_FLAG_RESPAWNED, CHAT_MSG_BG_SYSTEM_NEUTRAL);
    }
    else
    {
        SpawnBGObject(BG_SG_OBJECT_FLAG_H, RESPAWN_IMMEDIATELY);
        SendMessageToAll(LANG_BG_SG_HORDE_FLAG_RESPAWNED, CHAT_MSG_BG_SYSTEM_NEUTRAL);
    }

    PlaySoundToAll(BG_SG_SOUND_FLAGS_RESPAWNED);

    if (GameObject* obj = GetBgMap()->GetGameObject(GetDroppedFlagGUID(team)))
        obj->Delete();
    else
        TC_LOG_ERROR("bg.battleground", "unknown dropped flag (%s)", GetDroppedFlagGUID(team).ToString().c_str());

    SetDroppedFlagGUID(ObjectGuid::Empty, GetTeamIndexByTeamId(team));
    _bothFlagsKept = false;
}

void BattlegroundSG::EventPlayerCapturedFlag(Player* player)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    uint32 winner = 0;

    player->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_ENTER_PVP_COMBAT);
    if (player->GetTeam() == ALLIANCE)
    {
        if (!IsHordeFlagPickedup())
            return;
        SetHordeFlagPicker(ObjectGuid::Empty);              // must be before aura remove to prevent 2 events (drop+capture) at the same time
                                                            // horde flag in base (wont respawned)
        _flagState[TEAM_HORDE] = BG_SG_FLAG_STATE_DESPAWN;
                                                            // Drop Horde Flag from Player
        player->RemoveAurasDueToSpell(BG_SG_SPELL_BOT_FLAG);
        if (_flagDebuffState == 1)
          player->RemoveAurasDueToSpell(BG_SG_SPELL_FOCUSED_ASSAULT);
        else if (_flagDebuffState == 2)
          player->RemoveAurasDueToSpell(BG_SG_SPELL_BRUTAL_ASSAULT);

        // Alliance can now claim the castle
        if (GameObject* ob = GetBGObject(BG_SG_OBJECT_BANNER_HORDE + BG_SG_BANNER_MAX * BG_SG_NODE_BOTCASTLE))
            ob->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_CANTA2);

        PlaySoundToAll(BG_SG_SOUND_FLAG_CAPTURED_ALLIANCE);
    }
    else
    {
        if (!IsAllianceFlagPickedup())
            return;
        SetAllianceFlagPicker(ObjectGuid::Empty);           // must be before aura remove to prevent 2 events (drop+capture) at the same time
                                                            // alliance flag in base (wont respawned)
        _flagState[TEAM_ALLIANCE] = BG_SG_FLAG_STATE_DESPAWN;
                                                            // Drop Alliance Flag from Player
        player->RemoveAurasDueToSpell(BG_SG_SPELL_TOP_FLAG);
        if (_flagDebuffState == 1)
            player->RemoveAurasDueToSpell(BG_SG_SPELL_FOCUSED_ASSAULT);
        else if (_flagDebuffState == 2)
            player->RemoveAurasDueToSpell(BG_SG_SPELL_BRUTAL_ASSAULT);

        // Horde can now claim the castle
        if (GameObject* ob = GetBGObject(BG_SG_OBJECT_BANNER_ALLY + BG_SG_BANNER_MAX * BG_SG_NODE_TOPCASTLE))
            ob->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_CANTH2);

        PlaySoundToAll(BG_SG_SOUND_FLAG_CAPTURED_HORDE);
    }
    //for flag capture is reward 2 honorable kills
    RewardHonorToTeam(GetBonusHonorFromKill(2), player->GetTeam());

    SpawnBGObject(BG_SG_OBJECT_FLAG_H, BG_SG_FLAG_RESPAWN_TIME);
    SpawnBGObject(BG_SG_OBJECT_FLAG_A, BG_SG_FLAG_RESPAWN_TIME);

    if (player->GetTeam() == ALLIANCE)
        SendMessageToAll(LANG_BG_SG_CAPTURED_HF, CHAT_MSG_BG_SYSTEM_ALLIANCE, player);
    else
        SendMessageToAll(LANG_BG_SG_CAPTURED_AF, CHAT_MSG_BG_SYSTEM_HORDE, player);

    UpdateFlagState(player->GetTeam(), 1);                  // flag state none
    //UpdateTeamScore(player->GetTeamId());
    // only flag capture should be updated
    //UpdatePlayerScore(player, SCORE_FLAG_CAPTURES, 1);      // +1 flag captures

    // update last flag capture to be used if teamscore is equal (in warsong gulch)
    SetLastFlagCapture(player->GetTeam());
}

void BattlegroundSG::EventPlayerDroppedFlag(Player* player)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
    {
        // if not running, do not cast things at the dropper player (prevent spawning the "dropped" flag), neither send unnecessary messages
        // just take off the aura
        if (player->GetTeam() == ALLIANCE)
        {
            if (!IsHordeFlagPickedup())
                return;

            if (GetFlagPickerGUID(TEAM_HORDE) == player->GetGUID())
            {
                SetHordeFlagPicker(ObjectGuid::Empty);
                player->RemoveAurasDueToSpell(BG_SG_SPELL_BOT_FLAG);
            }
        }
        else
        {
            if (!IsAllianceFlagPickedup())
                return;

            if (GetFlagPickerGUID(TEAM_ALLIANCE) == player->GetGUID())
            {
                SetAllianceFlagPicker(ObjectGuid::Empty);
                player->RemoveAurasDueToSpell(BG_SG_SPELL_TOP_FLAG);
            }
        }
        return;
    }

    bool set = false;

    if (player->GetTeam() == ALLIANCE)
    {
        if (!IsHordeFlagPickedup())
            return;
        if (GetFlagPickerGUID(TEAM_HORDE) == player->GetGUID())
        {
            SetHordeFlagPicker(ObjectGuid::Empty);
            player->RemoveAurasDueToSpell(BG_SG_SPELL_BOT_FLAG);
            if (_flagDebuffState == 1)
                player->RemoveAurasDueToSpell(BG_SG_SPELL_FOCUSED_ASSAULT);
            else if (_flagDebuffState == 2)
                player->RemoveAurasDueToSpell(BG_SG_SPELL_BRUTAL_ASSAULT);
            _flagState[TEAM_HORDE] = BG_SG_FLAG_STATE_ON_GROUND;
            player->CastSpell(player, BG_SG_SPELL_BOT_FLAG_DROPPED, true);
            set = true;
        }
    }
    else
    {
        if (!IsAllianceFlagPickedup())
            return;
        if (GetFlagPickerGUID(TEAM_ALLIANCE) == player->GetGUID())
        {
            SetAllianceFlagPicker(ObjectGuid::Empty);
            player->RemoveAurasDueToSpell(BG_SG_SPELL_TOP_FLAG);
            if (_flagDebuffState == 1)
                player->RemoveAurasDueToSpell(BG_SG_SPELL_FOCUSED_ASSAULT);
            else if (_flagDebuffState == 2)
                player->RemoveAurasDueToSpell(BG_SG_SPELL_BRUTAL_ASSAULT);
            _flagState[TEAM_ALLIANCE] = BG_SG_FLAG_STATE_ON_GROUND;
            player->CastSpell(player, BG_SG_SPELL_TOP_FLAG_DROPPED, true);
            set = true;
        }
    }

    if (set)
    {
        player->CastSpell(player, SPELL_RECENTLY_DROPPED_FLAG, true);
        UpdateFlagState(player->GetTeam(), 1);

        if (player->GetTeam() == ALLIANCE)
        {
            //SendMessageToAll(LANG_BG_SG_DROPPED_HF, CHAT_MSG_BG_SYSTEM_HORDE, player);
            //UpdateWorldState(BG_SG_FLAG_UNK_HORDE, uint32(-1));
        }
        else
        {
            //SendMessageToAll(LANG_BG_SG_DROPPED_AF, CHAT_MSG_BG_SYSTEM_ALLIANCE, player);
            //UpdateWorldState(BG_SG_FLAG_UNK_ALLIANCE, uint32(-1));
        }

        _flagsDropTimer[GetTeamIndexByTeamId(player->GetTeam()) ? 0 : 1] = BG_SG_FLAG_DROP_TIME;
    }
}

/*  type: 0-neutral, 1-contested, 3-occupied
    teamIndex: 0-ally, 1-horde                        */
void BattlegroundSG::_CreateBanner(uint8 node, uint8 type, uint8 teamIndex, bool delay)
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
    obj = node * BG_SG_BANNER_MAX + ((type == BG_SG_NODE_TYPE_OCCUPIED) ? (5 + teamIndex) : 7);
    SpawnBGObject(obj, RESPAWN_IMMEDIATELY);
}

void BattlegroundSG::_DelBanner(uint8 node, uint8 type, uint8 teamIndex)
{
    uint8 obj = node*8 + type + teamIndex;
    SpawnBGObject(obj, RESPAWN_ONE_DAY);

    // handle aura with banner
    if (!type)
        return;
    obj = node * 8 + ((type == BG_SG_NODE_TYPE_OCCUPIED) ? (5 + teamIndex) : 7);
    SpawnBGObject(obj, RESPAWN_ONE_DAY);
}

int32 BattlegroundSG::_GetNodeNameId(uint8 node)
{
    switch (node)
    {
        case BG_SG_NODE_TOPCASTLE:  return LANG_BG_SG_NODE_TOPCASTLE;
        case BG_SG_NODE_TOPLEFT:    return LANG_BG_SG_NODE_TOPLEFT;
        case BG_SG_NODE_TOPRIGHT:   return LANG_BG_SG_NODE_TOPRIGHT;
        case BG_SG_NODE_BOTCASTLE:  return LANG_BG_SG_NODE_BOTCASTLE;
        case BG_SG_NODE_BOTLEFT:    return LANG_BG_SG_NODE_BOTLEFT;
        case BG_SG_NODE_BOTRIGHT:   return LANG_BG_SG_NODE_BOTRIGHT;
        default:
            ASSERT(false);
    }
    return 0;
}

void BattlegroundSG::_NodeOccupied(uint8 node, Team team)
{
    if (node == BG_SG_NODE_BOTCASTLE || node == BG_SG_NODE_TOPCASTLE)
        if (!AddSpiritGuide(BG_SG_CREA_SPIRIT_TOP + (node==BG_SG_NODE_BOTCASTLE), BG_SG_CreaturePos[BG_SG_CREA_SPIRIT_TOP + (node==BG_SG_NODE_BOTCASTLE)], GetTeamIndexByTeamId(team)))
            TC_LOG_ERROR("bg.battleground", "Failed to spawn spirit guide! point: %u, team: %u, ", node, team);

    Creature* trigger = !BgCreatures[BG_SG_CREA_MAX + node] ? GetBGCreature(BG_SG_CREA_MAX + node) : NULL;
    if (!trigger)
        trigger = AddCreature(WORLD_TRIGGER, BG_SG_CREA_MAX + node, BG_SG_NodePositions[node], GetTeamIndexByTeamId(team));

    //add bonus honor aura trigger creature when node is accupied
    //cast bonus aura (+50% honor in 25yards)
    //aura should only apply to players who have accupied the node, set correct faction for trigger
    if (trigger)
    {
        trigger->setFaction(team == ALLIANCE ? 84 : 83);
        trigger->CastSpell(trigger, SPELL_HONORABLE_DEFENDER_25Y, false);
    }
}

void BattlegroundSG::_NodeDeOccupied(uint8 node)
{
    if (node >= BG_SG_DYNAMIC_NODES_COUNT)
        return;

    //remove bonus honor aura trigger creature when node is lost
    if (node < BG_SG_DYNAMIC_NODES_COUNT)//only dynamic nodes, no start points
        DelCreature(node+7);//NULL checks are in DelCreature! 0-6 spirit guides

    RelocateDeadPlayers(BgCreatures[node]);

    if (node == BG_SG_NODE_BOTCASTLE || node == BG_SG_NODE_TOPCASTLE)
        if (BgCreatures[BG_SG_CREA_SPIRIT_TOP + (node==BG_SG_NODE_BOTCASTLE)])
            DelCreature(BG_SG_CREA_SPIRIT_TOP + (node==BG_SG_NODE_BOTCASTLE));

    // buff object isn't despawned
}

/* Invoked if a player used a banner as a gameobject */
void BattlegroundSG::EventPlayerClickedOnFlag(Player* source, GameObject* target_obj)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    if (target_obj->GetEntry() == BG_SG_ENTRY_FLAG_A || target_obj->GetEntry() == BG_SG_ENTRY_FLAG_H
        || target_obj->GetEntry() == BG_SG_ENTRY_FLAG_GROUND_A || target_obj->GetEntry() == BG_SG_ENTRY_FLAG_GROUND_H)
    {
        int32 message_id = 0;
        ChatMsg type = CHAT_MSG_BG_SYSTEM_NEUTRAL;

        //alliance flag picked up from base
        if (source->GetTeam() == HORDE && GetFlagState(ALLIANCE) == BG_SG_FLAG_STATE_ON_BASE
            && BgObjects[BG_SG_OBJECT_FLAG_A] == target_obj->GetGUID())
        {
            message_id = LANG_BG_SG_PICKEDUP_AF;
            type = CHAT_MSG_BG_SYSTEM_HORDE;
            PlaySoundToAll(BG_SG_SOUND_ALLIANCE_FLAG_PICKED_UP);
            SpawnBGObject(BG_SG_OBJECT_FLAG_A, RESPAWN_ONE_DAY);
            SetAllianceFlagPicker(source->GetGUID());
            _flagState[TEAM_ALLIANCE] = BG_SG_FLAG_STATE_ON_PLAYER;
            //update world state to show correct flag carrier
            UpdateFlagState(HORDE, BG_SG_FLAG_STATE_ON_PLAYER);
            //UpdateWorldState(BG_SG_FLAG_UNK_ALLIANCE, 1);
            source->CastSpell(source, BG_SG_SPELL_TOP_FLAG, true);
            if (_flagState[1] == BG_SG_FLAG_STATE_ON_PLAYER)
              _bothFlagsKept = true;
        }

        //horde flag picked up from base
        if (source->GetTeam() == ALLIANCE && GetFlagState(HORDE) == BG_SG_FLAG_STATE_ON_BASE
            && BgObjects[BG_SG_OBJECT_FLAG_H] == target_obj->GetGUID())
        {
            message_id = LANG_BG_SG_PICKEDUP_HF;
            type = CHAT_MSG_BG_SYSTEM_ALLIANCE;
            PlaySoundToAll(BG_SG_SOUND_HORDE_FLAG_PICKED_UP);
            SpawnBGObject(BG_SG_OBJECT_FLAG_H, RESPAWN_ONE_DAY);
            SetHordeFlagPicker(source->GetGUID());
            _flagState[TEAM_HORDE] = BG_SG_FLAG_STATE_ON_PLAYER;
            //update world state to show correct flag carrier
            UpdateFlagState(ALLIANCE, BG_SG_FLAG_STATE_ON_PLAYER);
            //UpdateWorldState(BG_SG_FLAG_UNK_HORDE, 1);
            source->CastSpell(source, BG_SG_SPELL_BOT_FLAG, true);
            if (_flagState[0] == BG_SG_FLAG_STATE_ON_PLAYER)
              _bothFlagsKept = true;
        }

        //Alliance flag on ground(not in base) (returned or picked up again from ground!)
        if (GetFlagState(ALLIANCE) == BG_SG_FLAG_STATE_ON_GROUND && source->IsWithinDistInMap(target_obj, 10)
            && target_obj->GetGOInfo()->entry == BG_SG_ENTRY_FLAG_GROUND_A)
        {
            if (source->GetTeam() == ALLIANCE)
            {
                message_id = LANG_BG_SG_RETURNED_AF;
                type = CHAT_MSG_BG_SYSTEM_ALLIANCE;
                UpdateFlagState(HORDE, BG_SG_FLAG_STATE_WAIT_RESPAWN);
                RespawnFlag(ALLIANCE, false);
                SpawnBGObject(BG_SG_OBJECT_FLAG_A, RESPAWN_IMMEDIATELY);
                PlaySoundToAll(BG_SG_SOUND_FLAG_RETURNED);
                //UpdatePlayerScore(source, SCORE_FLAG_RETURNS, 1);
                _bothFlagsKept = false;
            }
            else
            {
                message_id = LANG_BG_SG_PICKEDUP_AF;
                type = CHAT_MSG_BG_SYSTEM_HORDE;
                PlaySoundToAll(BG_SG_SOUND_ALLIANCE_FLAG_PICKED_UP);
                SpawnBGObject(BG_SG_OBJECT_FLAG_A, RESPAWN_ONE_DAY);
                SetAllianceFlagPicker(source->GetGUID());
                source->CastSpell(source, BG_SG_SPELL_TOP_FLAG, true);
                _flagState[TEAM_ALLIANCE] = BG_SG_FLAG_STATE_ON_PLAYER;
                UpdateFlagState(HORDE, BG_SG_FLAG_STATE_ON_PLAYER);
                if (_flagDebuffState == 1)
                    source->CastSpell(source, BG_SG_SPELL_FOCUSED_ASSAULT, true);
                else if (_flagDebuffState == 2)
                    source->CastSpell(source, BG_SG_SPELL_BRUTAL_ASSAULT, true);
                //UpdateWorldState(BG_SG_FLAG_UNK_ALLIANCE, 1);
            }
            //called in HandleGameObjectUseOpcode:
            //target_obj->Delete();
        }

        //Horde flag on ground(not in base) (returned or picked up again)
        if (GetFlagState(HORDE) == BG_SG_FLAG_STATE_ON_GROUND && source->IsWithinDistInMap(target_obj, 10)
            && target_obj->GetGOInfo()->entry == BG_SG_ENTRY_FLAG_GROUND_H)
        {
            if (source->GetTeam() == HORDE)
            {
                message_id = LANG_BG_SG_RETURNED_HF;
                type = CHAT_MSG_BG_SYSTEM_HORDE;
                UpdateFlagState(ALLIANCE, BG_SG_FLAG_STATE_WAIT_RESPAWN);
                RespawnFlag(HORDE, false);
                SpawnBGObject(BG_SG_OBJECT_FLAG_H, RESPAWN_IMMEDIATELY);
                PlaySoundToAll(BG_SG_SOUND_FLAG_RETURNED);
                //UpdatePlayerScore(source, SCORE_FLAG_RETURNS, 1);
                _bothFlagsKept = false;
            }
            else
            {
                message_id = LANG_BG_SG_PICKEDUP_HF;
                type = CHAT_MSG_BG_SYSTEM_ALLIANCE;
                PlaySoundToAll(BG_SG_SOUND_HORDE_FLAG_PICKED_UP);
                SpawnBGObject(BG_SG_OBJECT_FLAG_H, RESPAWN_ONE_DAY);
                SetHordeFlagPicker(source->GetGUID());
                source->CastSpell(source, BG_SG_SPELL_BOT_FLAG, true);
                _flagState[TEAM_HORDE] = BG_SG_FLAG_STATE_ON_PLAYER;
                UpdateFlagState(ALLIANCE, BG_SG_FLAG_STATE_ON_PLAYER);
                if (_flagDebuffState == 1)
                    source->CastSpell(source, BG_SG_SPELL_FOCUSED_ASSAULT, true);
                else if (_flagDebuffState == 2)
                    source->CastSpell(source, BG_SG_SPELL_BRUTAL_ASSAULT, true);
                //UpdateWorldState(BG_SG_FLAG_UNK_HORDE, 1);
            }
            //called in HandleGameObjectUseOpcode:
            //target_obj->Delete();
        }

        if (!message_id)
            return;

        SendMessageToAll(message_id, type, source);
        source->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_ENTER_PVP_COMBAT);
    }
    else // claim bases
    {
        uint8 node = BG_SG_FIRST_NODE;
        GameObject* obj = GetBgMap()->GetGameObject(BgObjects[node * BG_SG_BANNER_MAX + BG_SG_OBJECT_AURA_CONTESTED]);
        while ((node < BG_SG_DYNAMIC_NODES_COUNT) && ((!obj) || (!source->IsWithinDistInMap(obj, 10))))
        {
            ++node;
            obj = GetBgMap()->GetGameObject(BgObjects[node * BG_SG_BANNER_MAX + BG_SG_OBJECT_AURA_CONTESTED]);
        }

        // this means our player isn't close to any of banners - maybe cheater ??
        if (node == BG_SG_DYNAMIC_NODES_COUNT)
            return;

        TeamId teamIndex = GetTeamIndexByTeamId(source->GetTeam());

        // Check if player really could use this banner, not cheated
        if (!(m_Nodes[node] == 0 || teamIndex == m_Nodes[node] % 2))
            return;

        source->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_ENTER_PVP_COMBAT);
        uint32 sound = 0;
        // If node is neutral, change to contested
        if (m_Nodes[node] == BG_SG_NODE_TYPE_NEUTRAL)
        {
            //UpdatePlayerScore(source, SCORE_BASES_ASSAULTED, 1);
            m_prevNodes[node] = m_Nodes[node];
            m_Nodes[node] = teamIndex + 1;
            // burn current neutral banner
            _DelBanner(node, BG_SG_NODE_TYPE_NEUTRAL, 0);
            // create new contested banner
            _CreateBanner(node, BG_SG_NODE_TYPE_CONTESTED, teamIndex, true);
            _SendNodeUpdate(node);
            m_NodeTimers[node] = BG_SG_FLAG_CAPTURING_TIME;

            // FIXME: team and node names not localized
            if (teamIndex == 0)
                SendMessage2ToAll(LANG_BG_SG_NODE_CLAIMED, CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node), LANG_BG_SG_ALLY);
            else
                SendMessage2ToAll(LANG_BG_SG_NODE_CLAIMED, CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node), LANG_BG_SG_HORDE);

            sound = BG_SG_SOUND_NODE_CLAIMED;
        }
        // If node is contested
        else if ((m_Nodes[node] == BG_SG_NODE_STATUS_ALLY_CONTESTED) || (m_Nodes[node] == BG_SG_NODE_STATUS_HORDE_CONTESTED))
        {
            // If last state is NOT occupied, change node to enemy-contested
            if (m_prevNodes[node] < BG_SG_NODE_TYPE_OCCUPIED)
            {
                //UpdatePlayerScore(source, SCORE_BASES_ASSAULTED, 1);
                m_prevNodes[node] = m_Nodes[node];
                m_Nodes[node] = teamIndex + BG_SG_NODE_TYPE_CONTESTED;
                // burn current contested banner
                _DelBanner(node, BG_SG_NODE_TYPE_CONTESTED, !teamIndex);
                // create new contested banner
                _CreateBanner(node, BG_SG_NODE_TYPE_CONTESTED, teamIndex, true);
                _SendNodeUpdate(node);
                m_NodeTimers[node] = BG_SG_FLAG_CAPTURING_TIME;

                // FIXME: node names not localized
                if (teamIndex == TEAM_ALLIANCE)
                    SendMessage2ToAll(LANG_BG_SG_NODE_ASSAULTED, CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node));
                else
                    SendMessage2ToAll(LANG_BG_SG_NODE_ASSAULTED, CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node));
            }
            // If contested, change back to occupied
            else
            {
                //UpdatePlayerScore(source, SCORE_BASES_DEFENDED, 1);
                m_prevNodes[node] = m_Nodes[node];
                m_Nodes[node] = teamIndex + BG_SG_NODE_TYPE_OCCUPIED;
                UpdateFlagCastTime(teamIndex);
                // burn current contested banner
                _DelBanner(node, BG_SG_NODE_TYPE_CONTESTED, !teamIndex);
                // create new occupied banner
                _CreateBanner(node, BG_SG_NODE_TYPE_OCCUPIED, teamIndex, true);
                _SendNodeUpdate(node);
                m_NodeTimers[node] = 0;
                _NodeOccupied(node, (teamIndex == TEAM_ALLIANCE) ? ALLIANCE : HORDE);

                // FIXME: node names not localized
                if (teamIndex == TEAM_ALLIANCE)
                    SendMessage2ToAll(LANG_BG_SG_NODE_DEFENDED, CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node));
                else
                    SendMessage2ToAll(LANG_BG_SG_NODE_DEFENDED, CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node));
            }
            sound = (teamIndex == TEAM_ALLIANCE) ? BG_SG_SOUND_NODE_ASSAULTED_ALLIANCE : BG_SG_SOUND_NODE_ASSAULTED_HORDE;
        }
        // If node is occupied, change to enemy-contested
        else
        {
            //UpdatePlayerScore(source, SCORE_BASES_ASSAULTED, 1);
            m_prevNodes[node] = m_Nodes[node];
            m_Nodes[node] = teamIndex + BG_SG_NODE_TYPE_CONTESTED;
            UpdateFlagCastTime(teamIndex);
            // burn current occupied banner
            _DelBanner(node, BG_SG_NODE_TYPE_OCCUPIED, !teamIndex);
            // create new contested banner
            _CreateBanner(node, BG_SG_NODE_TYPE_CONTESTED, teamIndex, true);
            _SendNodeUpdate(node);
            _NodeDeOccupied(node);
            m_NodeTimers[node] = BG_SG_FLAG_CAPTURING_TIME;

            // FIXME: node names not localized
            if (teamIndex == TEAM_ALLIANCE)
                SendMessage2ToAll(LANG_BG_SG_NODE_ASSAULTED, CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node));
            else
                SendMessage2ToAll(LANG_BG_SG_NODE_ASSAULTED, CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node));

            sound = (teamIndex == TEAM_ALLIANCE) ? BG_SG_SOUND_NODE_ASSAULTED_ALLIANCE : BG_SG_SOUND_NODE_ASSAULTED_HORDE;
        }

        // If node is occupied again, send "X has taken the Y" msg.
        if (m_Nodes[node] >= BG_SG_NODE_TYPE_OCCUPIED)
        {
            // FIXME: team and node names not localized
            if (teamIndex == TEAM_ALLIANCE)
                SendMessage2ToAll(LANG_BG_SG_NODE_TAKEN, CHAT_MSG_BG_SYSTEM_ALLIANCE, NULL, LANG_BG_SG_ALLY, _GetNodeNameId(node));
            else
                SendMessage2ToAll(LANG_BG_SG_NODE_TAKEN, CHAT_MSG_BG_SYSTEM_HORDE, NULL, LANG_BG_SG_HORDE, _GetNodeNameId(node));
        }
        PlaySoundToAll(sound);
    }
}

void BattlegroundSG::AddPlayer(Player* player)
{
    Battleground::AddPlayer(player);
    PlayerScores[player->GetGUIDLow()] = new BattlegroundSGScore(player->GetGUID());
}

void BattlegroundSG::EndBattleground(uint32 winner)
{
    Battleground::EndBattleground(winner);
}

void BattlegroundSG::RemovePlayer(Player* player, ObjectGuid /*guid*/, uint32 /*team*/)
{
    if (!player)
    {
        TC_LOG_ERROR("bg.battleground", "bg_SG no player at remove");
        return;
    }
}

void BattlegroundSG::HandleAreaTrigger(Player* player, uint32 trigger)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    switch (trigger)
    {
        case 5840:
        default:
            Battleground::HandleAreaTrigger(player, trigger);
            break;
    }
}

void BattlegroundSG::_SendNodeUpdate(uint8 node)
{
    // Send node owner state update to refresh map icons on client
    const uint8 plusArray[] = {0, 2, 3, 0, 1};
    /*
    if (m_prevNodes[node])
        UpdateWorldState(BG_SG_OP_NODESTATES[node] + plusArray[m_prevNodes[node]], 0);
    else
        UpdateWorldState(BG_SG_OP_NODEICONS[node], 0);
    */
    //UpdateWorldState(BG_SG_OP_NODESTATES[node] + plusArray[m_Nodes[node]], 1);
}

void BattlegroundSG::UpdateFlagState(uint32 team, uint32 value)
{
    //if (team == ALLIANCE)
    //    UpdateWorldState(BG_SG_FLAG_STATE_ALLIANCE, value);
    //else
    //    UpdateWorldState(BG_SG_FLAG_STATE_HORDE, value);
}

void BattlegroundSG::UpdateFlagCastTime(uint8 teamIndex, bool both)
{
    both = true;
    if (teamIndex == TEAM_ALLIANCE || both) // 2 for both
        if (GameObject* go = GetBGObject(BG_SG_OBJECT_FLAG_A))
            go->SetPvPCastTime(std::max(30000 - 12000 * !m_isCommanderAlive[TEAM_ALLIANCE]
                - 15000 * (m_Nodes[BG_SG_NODE_TOPLEFT] != TEAM_ALLIANCE + BG_SG_NODE_TYPE_OCCUPIED)
                - 15000 * (m_Nodes[BG_SG_NODE_TOPRIGHT] != TEAM_ALLIANCE + BG_SG_NODE_TYPE_OCCUPIED), 0));
    if (teamIndex == TEAM_HORDE || both) // 2 for both
        if (GameObject* go = GetBGObject(BG_SG_OBJECT_FLAG_H))
            go->SetPvPCastTime(std::max(30000 - 12000 * !m_isCommanderAlive[TEAM_HORDE]
                - 15000 * (m_Nodes[BG_SG_NODE_BOTLEFT] != TEAM_HORDE + BG_SG_NODE_TYPE_OCCUPIED)
                - 15000 * (m_Nodes[BG_SG_NODE_BOTRIGHT] != TEAM_HORDE + BG_SG_NODE_TYPE_OCCUPIED), 0));
}

void BattlegroundSG::FillInitialWorldStates(WorldPacket& data)
{
    //tofix 20 node + 2 tower count
    //data << uint32(BA_SHOW_A_SCORE) << uint32(0);


    const uint8 plusArray[] = { 0, 2, 3, 0, 1 };

    // Node icons
    //for (uint8 node = 0; node < BG_SG_DYNAMIC_NODES_COUNT; ++node)
    //    data << uint32(BG_SG_OP_NODEICONS[node]) << uint32((m_Nodes[node] == 0)?1:0);

    // Node occupied states
    //for (uint8 node = 0; node < BG_SG_DYNAMIC_NODES_COUNT; ++node)
    //    for (uint8 i = 1; i < BG_SG_DYNAMIC_NODES_COUNT; ++i)
    //        data << uint32(BG_SG_OP_NODESTATES[node] + plusArray[i]) << uint32((m_Nodes[node] == i)?1:0);

    // other unknown
    //data << uint32(0x745) << uint32(0x2);           // 37 1861 unk
}

void BattlegroundSG::ResetBGSubclass()
{
    //tofix timers
    for (uint8 i = 0; i < BG_SG_CREA_MAX; i++)
        if (BgCreatures[i])
            DelCreature(i);
}

uint32 BattlegroundSG::GetPrematureWinner()
{
    //tofix surrender
    return Battleground::GetPrematureWinner();
}

WorldSafeLocsEntry const* BattlegroundSG::GetClosestGraveYard(Player* player)
{
    player->SetRezTime(getMSTime() + 12*IN_MILLISECONDS);
    TeamId teamIndex = GetTeamIndexByTeamId(player->GetTeam(true));
    std::vector<uint8> graveyards;
    WorldSafeLocsEntry const*entry = sDBCMgr->GetWorldSafeLocsEntry(BG_SG_GraveyardIds[teamIndex]);
    return entry;
}

void BattlegroundSG::CrushWall()
{
    if (GameObject* wall = GetBGObject(BG_SG_OBJECT_WALL))
    {
        if (wall->GetDestructibleState() != GO_DESTRUCTIBLE_DESTROYED)
        {
            wall->SetDestructibleState(GO_DESTRUCTIBLE_DESTROYED);
            m_WallFallen = true;
        }
        else
        {
            wall->SetDestructibleState(GO_DESTRUCTIBLE_REBUILDING, NULL, true);
            m_WallFallen = false;
        }
    }
}

void AddSC_npc_iwp()
{
}
