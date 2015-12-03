
#include "DatabaseEnv.h"
#include "DBCStores.h"
#include "MapManager.h"
#include "NodeMgr.h"
#include "Node.h"
#include "Opcodes.h"
#include "ChatTextBuilder.h"
#include "ReputationMgr.h"

// Used in NodeMgr::CreateNode
Node::Node(uint32 id, LocString name, uint32 type, Map* map, float positionX, float positionY)
    : m_id(id), m_name(name), m_type(type < NODE_MAX_TYPE ? type : 0), m_status(NODE_STATUS_NEUTRAL),
    m_factionId(0), m_faction(NULL), m_guildId(0), m_guild(NULL), m_oldfactionId(0), m_oldfaction(NULL), m_oldguildId(0), m_oldguild(NULL),
    m_map(map), m_position_x(positionX), m_position_y(positionY),
    m_flags(0), m_looseType(0), m_looseData(0), m_captureType(0), m_captureData1(0), m_captureData2(0),
    m_justDiedCount(0), m_isStart(false), m_startLocation()
{
    m_map->GetZoneAndAreaId(m_zoneId, m_areaId, positionX, positionY, 0.0f);

    m_pacifyTimer = NodePacifyTime[m_type];
    m_pacifyTimerNext = uint32(m_pacifyTimer / NODE_PACIFY_TIME_STAGE) * NODE_PACIFY_TIME_STAGE;

    m_banners.clear();
    m_creatures.clear();
    m_relations.clear();
}

// Used in NodeMgr::InitNodes()                              7                            10
// SELECT id, name, name_loc2, type, status, faction, guild, map, position_x, position_y, flags, looseType, looseData, captureType, captureData1, captureData2
Node::Node(Map* map, Field* fields) : m_justDiedCount(0), m_isStart(false), m_startLocation()
{
    m_id = fields[0].GetUInt32();
    m_map = map;

    Load(fields);
}

void Node::Load(Field* fields)
{
    m_name = LocString(fields[1].GetString(), fields[2].GetString());

    m_type = fields[3].GetUInt32();
    if (m_type > NODE_MAX_TYPE)
        m_type = 0;
    m_status = fields[4].GetUInt32();

    m_factionId = fields[5].GetUInt32();
    m_faction = sFactionMgr->GetFactionById(m_factionId);
    m_guildId = fields[6].GetUInt32();
    m_guild = sGuildMgr->GetGuildById(m_guildId);
    if (m_status)
        if (!m_faction && !m_guild)
            m_status = NODE_STATUS_NEUTRAL;

    m_oldfactionId = fields[17].GetUInt32();
    m_oldfaction = sFactionMgr->GetFactionById(m_oldfactionId);
    m_oldguildId = fields[18].GetUInt32();
    m_oldguild = sGuildMgr->GetGuildById(m_oldguildId);
    if (m_status == NODE_STATUS_TAKEN)
        if (!m_oldfaction && !m_oldguild)
            m_status = NODE_STATUS_AT_PEACE;

    m_position_x = fields[8].GetFloat();
    m_position_y = fields[9].GetFloat();
    m_map->GetZoneAndAreaId(m_zoneId, m_areaId, m_position_x, m_position_y, 0.0f);

    m_flags = fields[10].GetInt32();
    m_looseType = fields[11].GetUInt32();
    m_looseData = fields[12].GetInt32();
    m_captureType = fields[13].GetUInt32();
    m_captureData1 = fields[14].GetInt32();
    m_captureData2 = fields[15].GetInt32();
    m_pacifyTimer = fields[16].GetUInt32();
    if (m_pacifyTimer)
        m_pacifyTimerNext = uint32(m_pacifyTimer / NODE_PACIFY_TIME_STAGE) * NODE_PACIFY_TIME_STAGE;

    m_banners.clear();
    m_creatures.clear();
    m_relations.clear();
    m_justDiedCount = 0;
}

void Node::Reset()
{
    Populate();

    for (NodeBannerMap::iterator itr = m_banners.begin(); itr != m_banners.end(); ++itr)
    {
        for (uint8 i = 0; i < NODE_BANNER_MAX; ++i)
            DelBanner(itr->second, i + 1);
        CreateBanner(itr->second);
    }

    UpdateIcon();
}

void Node::Delete()
{
    Depopulate();

    for (NodeBannerMap::iterator itr = m_banners.begin(); itr != m_banners.end(); ++itr)
        for (uint8 i = 0; i < NODE_BANNER_MAX; ++i)
        {
            DelBanner(itr->second, i + 1);
            if (GameObject* go = itr->second->GetGameObject(i))
                go->Delete();
        }

    UpdateIcon(true);
}

void Node::SetStatus(uint32 status, uint32 trans, uint32 factionId, uint32 guildId)
{
    if (factionId && guildId)
        return;

    if (trans == NODE_TRANS_GETBACK)
    {
        if (!m_oldfactionId && !m_oldguildId)
            return;
        factionId = m_oldfactionId;
        guildId = m_oldguildId;
    }

    if (status == m_status)
    {
        if (status == NODE_STATUS_NEUTRAL)
            return;
        else if (factionId == m_factionId && guildId == m_guildId)
        {
            if (status != NODE_STATUS_ATTACKED && trans != NODE_TRANS_PACIFY) // check if oldguild disband
                return;
        }
    }

    if (status == NODE_STATUS_TAKEN)
    {
        m_pacifyTimer = NodePacifyTime[m_type];
        m_pacifyTimerNext = uint32(m_pacifyTimer / NODE_PACIFY_TIME_STAGE) * NODE_PACIFY_TIME_STAGE;
        WorldDatabase.PExecute("UPDATE nodes SET pacifyTimer = %u WHERE id = %u", m_pacifyTimer, m_id);
    }

    LocString oldownerName = GetOwnerName();
    setStatusOwner(status, trans, factionId, guildId);
    LocString ownerName = GetOwnerName();

    LocString message;
    switch (trans)
    {
        case NODE_TRANS_NONE :
        default:
            break;
        case NODE_TRANS_ATTACK:
            message = LocString("%s is under attack!", "L'ennemi attaque %s !");
            sWorld->SendZoneLocText2(m_zoneId, message, GetName());
            break;
        case NODE_TRANS_DEFEND:
            message = LocString("%s has defended %s!", "%s a défendu %s !");
            sWorld->SendZoneLocText2(m_zoneId, message, ownerName, GetName());
            break;
        case NODE_TRANS_CAPTURE:
            message = LocString("%s has taken %s!", "%s a pris %s !");
            sWorld->SendZoneLocText2(m_zoneId, message, ownerName, GetName());
            break;
        case NODE_TRANS_PACIFY:
            if (m_status == NODE_STATUS_AT_PEACE) // can still be under attack if oldguild disbands
            {
                message = LocString("%s is at peace.", "%s est en paix.");
                sWorld->SendZoneLocText2(m_zoneId, message, GetName());
            }
            break;
        case NODE_TRANS_GETBACK:
            message = LocString("%s retreived the control of %s!", "%s a récupéré le contrôle de %s !");
            sWorld->SendZoneLocText2(m_zoneId, message, ownerName, GetName());
            break;
        case NODE_TRANS_LOOSE:
            message = LocString("%s has lost the control of %s!", "%s a perdu le contrôle de %s !");
            sWorld->SendZoneLocText2(m_zoneId, message, oldownerName, GetName());
            break;
    }

    Populate();

    for (NodeBannerMap::iterator itr = m_banners.begin(); itr != m_banners.end(); ++itr)
    {
        for (uint8 i = 0; i < NODE_BANNER_MAX; ++i)
            DelBanner(itr->second, i + 1);
        CreateBanner(itr->second);
    }

    UpdateIcon();
}

void Node::setStatusOwner(uint32 status, uint32 trans, uint32 factionId, uint32 guildId)
{
    // Owner change?
    if (factionId != m_factionId || guildId != guildId)
    {
        if (factionId)
        {
            if (Faction* faction = sFactionMgr->GetFactionById(factionId))
            {
                m_factionId = factionId;
                m_faction = faction;
            }
            else
            {
                m_factionId = 0;
                m_faction = NULL;
            }
            m_guildId = 0;
            m_guild = NULL;
        }
        else
        {
            if (Guild* guild = sGuildMgr->GetGuildById(guildId))
            {
                m_guildId = guildId;
                m_guild = guild;
            }
            else
            {
                m_guildId = 0;
                m_guild = NULL;
            }
            m_factionId = 0;
            m_faction = NULL;
        }
    }

    if (status == NODE_STATUS_NEUTRAL || status == NODE_STATUS_AT_PEACE || (status == NODE_STATUS_ATTACKED && trans == NODE_TRANS_PACIFY))
    {
        if (m_oldfactionId)
        {
            m_oldfactionId = 0;
            m_oldfaction = NULL;
        }
        if (m_oldguildId)
        {
            m_oldguildId = 0;
            m_oldguild = NULL;
        }
    }

    m_status = status;
    PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_NODE_STATUS_OWNER);
    stmt->setUInt32(0, m_status);
    stmt->setUInt32(1, m_factionId);
    stmt->setUInt32(2, m_guildId);
    stmt->setUInt32(3, m_oldfactionId);
    stmt->setUInt32(4, m_oldguildId);
    stmt->setUInt32(5, m_id);
    WorldDatabase.Execute(stmt);
    return;
}

void Node::SetFaction(uint32 factionId)
{
    switch (m_status)
    {
    case NODE_STATUS_ATTACKED:
    case NODE_STATUS_TAKEN:
        SetStatus(m_status, 0, factionId, 0);
        break;
    case NODE_STATUS_NEUTRAL:
    case NODE_STATUS_AT_PEACE:
    default:
        SetStatus(NODE_STATUS_AT_PEACE, 0, factionId, 0);
    }
}

void Node::SetGuild(uint32 guildId)
{
    switch (m_status)
    {
        case NODE_STATUS_ATTACKED:
        case NODE_STATUS_TAKEN:
            SetStatus(m_status, 0, 0, guildId);
            break;
        case NODE_STATUS_NEUTRAL:
        case NODE_STATUS_AT_PEACE:
        default:
            SetStatus(NODE_STATUS_AT_PEACE, 0, 0, guildId);
    }
}

void Node::GetOwnerInfos(uint32 &factionId, uint32 &guildId, LocString &ownerName, uint32 &oldfactionId, uint32 &oldguildId, LocString &oldownerName)
{
    factionId = m_factionId;
    guildId = m_guildId;
    ownerName = m_faction ? m_faction->GetName() : m_guild ? m_guild->GetName() : "none";

    oldfactionId = m_oldfactionId;
    oldguildId = m_oldguildId;
    oldownerName = m_oldfaction ? m_oldfaction->GetName() : m_oldguild ? m_oldguild->GetName() : "none";
}

void Node::SetName(LocString name)
{
    m_name = name;
    WorldDatabase.EscapeString(name[0]);
    WorldDatabase.EscapeString(name[2]);
    WorldDatabase.PExecute("UPDATE nodes SET name = '%s', name_loc2 = '%s' WHERE id = %u", name[0].c_str(), name[2].c_str(), m_id);
    UpdateIcon();
}

void Node::SetPosition(float positionX, float positionY)
{
    m_position_x = positionX;
    m_position_y = positionY;
    WorldDatabase.PExecute("UPDATE nodes SET position_x = %f, position_y = %f WHERE id = %u", positionX, positionY, m_id);
    UpdateIcon();
}

void Node::Populate()
{
    FactionEntry const* factionEntry = m_faction ? m_faction->GetEntry() : NULL;

    for (NodeCreatureMap::iterator itr = m_creatures.begin(); itr != m_creatures.end(); ++itr)
        InitCreature(itr->second);
}

void Node::Depopulate()
{
    for (NodeCreatureMap::iterator itr = m_creatures.begin(); itr != m_creatures.end(); ++itr)
        if (Creature* crea = itr->second->creature)
            crea->Respawn(true);
}

void Node::InitCreature(NodeCreature* nodeCrea)
{
    if (nodeCrea->creature)
    {
        if (m_faction)
        {
            if (nodeCrea->Type != 3)
            {
                if (uint32 factionTemplate = m_faction->GetEntry()->LinkedTemplates[0 /*nodeCrea->Type - 1 */])
                    if (sDBCMgr->GetFactionTemplateEntry(factionTemplate))
                        nodeCrea->creature->setFaction(factionTemplate);
            }
        }
    }
}

void Node::Update(uint32 diff)
{
    if (m_status == NODE_STATUS_TAKEN)
    {
        if (m_pacifyTimer)
        {
            if (m_pacifyTimer > diff)
            {
                m_pacifyTimer -= diff;
                if (m_pacifyTimer < m_pacifyTimerNext)
                {
                    m_pacifyTimerNext = uint32(m_pacifyTimer / NODE_PACIFY_TIME_STAGE) * NODE_PACIFY_TIME_STAGE;
                    WorldDatabase.PExecute("UPDATE nodes SET pacifyTimer = %u WHERE id = %u", m_pacifyTimer, m_id);
                }
            }
            else
                SetStatus(NODE_STATUS_AT_PEACE, NODE_TRANS_PACIFY, m_factionId, m_guildId);
        }
        else
        {
            m_pacifyTimer = NodePacifyTime[m_type];
            m_pacifyTimerNext = uint32(m_pacifyTimer / NODE_PACIFY_TIME_STAGE) * NODE_PACIFY_TIME_STAGE;
            WorldDatabase.PExecute("UPDATE nodes SET pacifyTimer = %u WHERE id = %u", m_pacifyTimer, m_id);
        }
    }

    for (NodeBannerMap::iterator itr = m_banners.begin(); itr != m_banners.end(); ++itr)
    {
        NodeBanner* banner = itr->second;

        if (banner->SpawnTimer)
        {
            if (banner->SpawnTimer > diff)
                banner->SpawnTimer -= diff;
            else
                SpawnBanner(banner, 0);
        }

        if (banner->Timer)
        {
            if (banner->Timer > diff)
                banner->Timer -= diff;
            else
            {
                banner->Timer = 0;
                DelBanner(banner);
                if (banner->Status == NODE_BANNER_CONTESTED)
                {
                    banner->Status = NODE_BANNER_TAKEN;
                    CreateBanner(banner, true);

                    if (m_captureType = NODE_CAPTURE_BY_MULTI_BASE)
                    {
                        bool all = true;
                        for (NodeBannerMap::iterator itr2 = m_banners.begin(); itr2 != m_banners.end(); ++itr2)
                            if (itr2->second->Status != NODE_BANNER_TAKEN || itr2->second->FactionId != banner->FactionId || itr2->second->GuildId != banner->GuildId)
                                all = false;
                        if (all)
                            SetStatus(NODE_STATUS_TAKEN, NODE_TRANS_CAPTURE, banner->FactionId, banner->GuildId);
                        else
                            banner->Timer = m_captureData2;

                    }
                    else
                        SetStatus(NODE_STATUS_TAKEN, NODE_TRANS_CAPTURE, banner->FactionId, banner->GuildId);

                }
                else if (banner->Status == NODE_BANNER_TAKEN)
                {
                    banner->FactionId = m_factionId;
                    banner->GuildId = m_guildId;
                    CreateBanner(banner, true);
                }
            }
        }
    }
}

void Node::AddCreature(uint32 guid, NodeCreature* nodeCreature)
{
    m_creatures[guid] = nodeCreature;
    InitCreature(nodeCreature);
}

void Node::RemoveCreature(uint32 guid)
{
    m_creatures.erase(guid);
}

void Node::AddRelation(uint32 id, uint32 type, int32 hostile, uint32 path)
{
    Node* node = sNodeMgr->GetNodeById(id);
    if (!node)
    {
        TC_LOG_ERROR("misc", "Node::AddRelation relation %u doesn't exist", id);
        return;
    }

    NodeRelation* relation = new NodeRelation;
    relation->Relation = node;
    relation->Type = type;
    relation->Hostile = hostile;
    relation->Path = path;
    m_relations[id] = relation;
}

void Node::SendWaves()
{
    for (NodeRelationMap::iterator itr = m_relations.begin(); itr != m_relations.end(); ++itr)
        if (itr->second->Type == NODE_LINK_PEDESTRIAN && itr->second->Hostile == NODE_REP_HOSTILE)
            SendWave(itr);
}

void Node::SendWave(NodeRelationMap::iterator itr)
{
    // todo, spawn commander + soldiers
}

void Node::HandleKilledCreature(NodeCreature* nodeCreature)
{
    Creature* creature = nodeCreature->creature;
    m_justDiedCount++;

    if (creature->IsGuard())
    {
        WorldPacket data(SMSG_ZONE_UNDER_ATTACK, 4);
        data << (uint32)m_areaId;
        sWorld->SendZoneMessage(creature->GetZoneId() , &data);
    }

    if (m_justDiedCount > 3)
        SetStatus(NODE_STATUS_ATTACKED, NODE_TRANS_ATTACK);
}

void NodeBattle::Update()
{
}

GameObject* Node::AddBanner(uint32 entry, float x, float y, float z, float o, float rotation0, float rotation1, float rotation2, float rotation3, uint32 /*respawnTime*/, GOState goState)
{
    if (!m_map)
        return false;
    // Must be created this way, adding to godatamap would add it to the base map of the instance
    // and when loading it (in go::LoadFromDB()), a new guid would be assigned to the object, and a new object would be created
    // So we must create it specific for this instance
    GameObject* go = new GameObject;
    if (!go->Create(sObjectMgr->GenerateLowGuid(HIGHGUID_GAMEOBJECT), entry, m_map, PHASEMASK_NORMAL, x, y, z, o, rotation0, rotation1, rotation2, rotation3, 100, goState))
    {
        TC_LOG_ERROR("node", "Node::AddBanner: cannot create gameobject (entry: %u) for node (id %u)!", entry, m_id);
        delete go;
        return false;
    }
/*
    uint32 guid = go->GetGUIDLow();

    // without this, UseButtonOrDoor caused the crash, since it tried to get go info from godata
    // iirc that was changed, so adding to go data map is no longer required if that was the only function using godata from GameObject without checking if it existed
    GameObjectData& data = sObjectMgr->NewGOData(guid);

    data.id             = entry;
    data.mapid          = GetMapId();
    data.posX           = x;
    data.posY           = y;
    data.posZ           = z;
    data.orientation    = o;
    data.rotation0      = rotation0;
    data.rotation1      = rotation1;
    data.rotation2      = rotation2;
    data.rotation3      = rotation3;
    data.spawntimesecs  = respawnTime;
    data.spawnMask      = 1;
    data.animprogress   = 100;
    data.go_state       = 1;
*/
    // Add to world, so it can be later looked up from HashMapHolder
    if (!m_map->AddToMap(go))
    {
        delete go;
        return NULL;
    }
    return go;
}

void Node::CreateBanner(NodeBanner* banner, bool delay)
{
    if (delay)
        banner->SpawnTimer = 2000;
    else
        SpawnBanner(banner, 0);
}

void Node::SpawnBanner(NodeBanner* banner, uint32 respawntime, uint8 incrStatus)
{
    banner->SpawnTimer = 0;

    if (GameObject* obj = banner->GetGameObject(incrStatus ? incrStatus - 1 : banner->Status))
    {
        if (respawntime)
            obj->SetLootState(GO_JUST_DEACTIVATED);
        else
            if (obj->getLootState() == GO_JUST_DEACTIVATED)
                // Change state from GO_JUST_DEACTIVATED to GO_READY in case battleground is starting again
                obj->SetLootState(GO_READY);
        obj->SetRespawnTime(respawntime);
        m_map->AddToMap(obj);
    }
}

void Node::EventPlayerClickedOnFlag(Player* source, GameObject* target_obj, NodeBanner* banner)
{
    if (!banner)
        return;

    uint32 factionId = 0;
    uint32 guildId = 0;
    source->GetFactionInBattle(factionId, guildId);
    if (!factionId && !guildId)
        return;

    source->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_ENTER_PVP_COMBAT);
    uint32 sound = 0;

    if (m_status == NODE_STATUS_ATTACKED)
    {
        if (m_captureType == NODE_CAPTURE_BY_BASE || m_captureType == NODE_CAPTURE_BY_MULTI_BASE)
        {
            if (banner->Status == NODE_BANNER_TAKEN && factionId == m_factionId && guildId == m_guildId)
                return;
            DelBanner(banner);

            if (banner->Status == NODE_BANNER_CONTESTED && factionId == m_factionId && guildId == m_guildId)
            {
                TCLC("Banner def");
                banner->Status = NODE_BANNER_TAKEN;
                banner->Timer = 0;
            }
            else
            {
                TCLC("Banner atk");
                banner->Status = NODE_BANNER_CONTESTED;
                banner->Timer = m_captureData1 ? m_captureData1 : NODE_BANNER_CAPTURING_TIME;
            }

            banner->FactionId = factionId;
            banner->GuildId = guildId;
            CreateBanner(banner, true);
            sWorld->SendZoneLocText(m_zoneId, "d");
        }
    }
}

void Node::UpdateIcon(bool del)
{
    UpdateIconUpdateString(del);
    sWorld->SendGlobalLocAddonMessage(m_iconUpdate);
}

void Node::UpdateIconUpdateString(bool del)
{
    if (del)
    {
        m_iconUpdate = ChatHandler::BuildIconUpdateString(1, GetId(), 0);
        return;
    }

    LocString ownedBy("Contested", "Contesté");
    LocString controle("Control: ", "Contrôle : ");
    if (m_guild)
        ownedBy = controle + m_guild->GetName();
    if (m_faction)
        ownedBy = controle + m_faction->GetName();
    uint32 iconId = 0;
    uint32 scale = 18; // not actually scale but size in pixels
    uint32 flags = (m_type == NODE_CAPITAL || m_flags & NODE_FLAG_CONTINENT_ICON) ? 1 : 0;

    switch (m_status)
    {
        case NODE_STATUS_NEUTRAL:
        default:
            iconId = 6;
            break;
        case NODE_STATUS_ATTACKED:
            iconId = 101;
            break;
        case NODE_STATUS_TAKEN:
            if (m_guild)
                iconId = 155;
            else if (m_faction)
            {
                uint32 flags = m_faction->GetFlags();
                if (flags & FACTION_FLAG_ALLIANCE)
                {
                    if (flags & FACTION_FLAG_HORDE)
                        iconId = 156;
                    else
                        iconId = 9;
                }
                else if (flags & FACTION_FLAG_HORDE)
                    iconId = 12;
                else
                    iconId = 157;
            }
            break;
        case NODE_STATUS_AT_PEACE:
            if (m_guild)
                iconId = 128;
            else if (m_faction)
            {
                uint32 flags = m_faction->GetFlags();
                if (flags & FACTION_FLAG_ALLIANCE)
                {
                    if (flags & FACTION_FLAG_HORDE)
                        iconId = 131;
                    else
                        iconId = 11;
                }
                else if (flags & FACTION_FLAG_HORDE)
                    iconId = 10;
                else
                    iconId = 158;
            }
            break;
    }

    m_iconUpdate = ChatHandler::BuildIconUpdateString(1, GetId(), iconId, scale, GetMap()->GetId(), m_position_x, m_position_y, m_name, ownedBy, flags);
}

bool Node::CanBeAStartForPlayer(Player* player)
{
    if (!m_isStart || m_status != NODE_STATUS_AT_PEACE || m_guildId)
        return false;

    if (m_faction)
        if (player->GetReputationMgr().GetReputation(m_faction->GetEntry()) > 2999)
            return true;
    return false;
}

void Node::SetStartLocation(WorldLocation location)
{
    m_isStart = true;
    m_startLocation = WorldLocation(GetMap()->GetId(), location.GetPositionX(), location.GetPositionY(), location.GetPositionZ(), location.GetOrientation());
    WorldDatabase.PExecute("DELETE FROM node_start WHERE node = %u", m_id);
    WorldDatabase.PExecute("INSERT INTO node_start (node, position_x, position_y, position_z, orientation) VALUES (%u, %f, %f, %f, %f)",
        m_id, location.GetPositionX(), location.GetPositionY(), location.GetPositionZ(), location.GetOrientation());
}

void Node::RemoveStartLocation()
{
    m_isStart = false;
    WorldDatabase.PExecute("DELETE FROM node_start WHERE node = %u", m_id);
}
