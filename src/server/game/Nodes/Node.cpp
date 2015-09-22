
#include "DatabaseEnv.h"
#include "DBCStores.h"
#include "NodeMgr.h"
#include "Node.h"
#include "Opcodes.h"
#include "ChatTextBuilder.h"
//#include "WorldPacket.h"
//#include "FactionMgr.h"
//#include "GuildMgr.h"

// Used in NodeMgr::InitNodes()
Node::Node(Map* map, Field* fields)
{
    m_id = fields[0].GetUInt32();
    m_map = map;
    m_type = fields[2].GetUInt32();
    m_status = fields[3].GetUInt32();
    m_leadType = fields[4].GetUInt32();
    m_factionId = fields[5].GetUInt32();
    m_faction = sFactionMgr->GetFactionById(m_factionId); // NULL if dont exist or 0
    m_guildId = fields[6].GetUInt32();
    m_guild = sGuildMgr->GetGuildById(m_guildId); // NULL if dont exist or 0

    Load(fields);
}

void Node::Load(Field* fields)
{
    m_name = LocString(fields[7].GetString());
    m_name[2] = fields[8].GetString();
    m_areaId = fields[9].GetUInt32();
    m_zoneId = 0;
    if (const AreaTableEntry* area = sDBCMgr->GetAreaTableEntry(m_areaId))
        m_zoneId = area->zone;

    m_attackFlags = fields[10].GetInt32();
    m_looseType = fields[11].GetUInt32();
    m_looseData = fields[12].GetInt32();
    m_captureType = fields[13].GetUInt32();
    m_captureData1 = fields[14].GetInt32();
    m_captureData2 = fields[15].GetInt32();

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
}

void Node::setStatus(uint32 status)
{
    m_status = status;
    PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_NODE_STATUS);;
    stmt->setUInt32(0, m_status);
    stmt->setUInt32(1, m_id);
    WorldDatabase.Execute(stmt);
}

bool Node::setStatusOwner(uint32 status, uint32 factionId, uint32 guildId)
{
    if (factionId && guildId)
        return false;

    if (factionId)
    {
        m_guild = NULL;
        m_guildId = 0;
        if (Faction* faction = sFactionMgr->GetFactionById(factionId))
        {
            m_faction = faction;
            m_factionId = factionId;
        }
        else
            return false;
    }
    else
    {
        m_faction = NULL;
        m_factionId = 0;
        if (Guild* guild = sGuildMgr->GetGuildById(guildId))
        {
            m_guild = guild;
            m_guildId = guildId;
        }
        else
            return false;
    }

    m_status = status;
    PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_NODE_STATUS_OWNER);
    stmt->setUInt32(0, m_status);
    stmt->setUInt32(1, m_factionId);
    stmt->setUInt32(2, m_guildId);
    stmt->setUInt32(3, m_id);
    WorldDatabase.Execute(stmt);
    return true;
}

void Node::SetStatus(uint32 status, uint32 trans, uint32 factionId, uint32 guildId)
{
    if (status == m_status)
    {
        if (status == NODE_NEUTRAL)
            return;
        else if (factionId == m_factionId && guildId == m_guildId)
            return;
    }

    switch (trans)
    {
        case NODE_TRANS_NONE :
            break;
        case NODE_TRANS_ATTACK:
            TCLC("Node::GotAttacked id %u", m_id);
            break;
        case NODE_TRANS_DEFEND:
            TCLC("Node::GotDefended id %u", m_id);
            break;
        case NODE_TRANS_CAPTURE:
            TCLC("Node::GotTaken id %u", m_id);
            break;
        case NODE_TRANS_PACIFY:
            TCLC("Node::GotPacified id %u", m_id);
            break;
        case NODE_TRANS_LOOSE:
            TCLC("Node::GotLost id %u", m_id);
            break;
    }

    switch (status)
    {
        case NODE_NEUTRAL:
            break;
        case NODE_ATTACKED:
            break;
        case NODE_TAKEN:
            break;
        case NODE_AT_PEACE:
            break;
    }

    if (factionId == m_factionId && guildId == guildId)
        setStatus(status);
    else
        setStatusOwner(status, factionId, guildId);

    Populate();

    for (NodeBannerMap::iterator itr = m_banners.begin(); itr != m_banners.end(); ++itr)
    {
        for (uint8 i = 0; i < NODE_BANNER_MAX; ++i)
            DelBanner(itr->second, i + 1);
        CreateBanner(itr->second);
    }
}

void Node::Populate()
{
    FactionEntry const* factionEntry = m_faction ? m_faction->GetEntry() : NULL;

    for (NodeCreatureMap::iterator itr = m_creatures.begin(); itr != m_creatures.end(); ++itr)
        InitCreature(itr->second);
}

void Node::InitCreature(NodeCreature* nodeCrea)
{
    if (nodeCrea->Creature)
    {
        if (m_faction)
        {
            if (nodeCrea->Type)
            {
                if (uint32 factionTemplate = m_faction->GetEntry()->LinkedTemplates[0 /*nodeCrea->Type - 1 */])
                    if (sDBCMgr->GetFactionTemplateEntry(factionTemplate))
                        nodeCrea->Creature->setFaction(factionTemplate);
            }
        }
    }
}

void Node::Update(uint32 diff)
{
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
                            SetStatus(NODE_TAKEN, NODE_TRANS_CAPTURE,banner->FactionId, banner->GuildId);
                        else
                            banner->Timer = m_captureData2;

                    }
                    else
                        SetStatus(NODE_TAKEN, NODE_TRANS_CAPTURE, banner->FactionId, banner->GuildId);

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
    Creature* creature = nodeCreature->Creature;
    m_justDiedCount++;

    if (creature->IsGuard())
    {
        WorldPacket data(SMSG_ZONE_UNDER_ATTACK, 4);
        data << (uint32)m_areaId;
        sWorld->SendZoneMessage(creature->GetZoneId() , &data);
    }

    if (m_justDiedCount > 3)
        SetStatus(NODE_ATTACKED, NODE_TRANS_ATTACK);
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

    if (GameObject* obj = banner->GeGameObject(incrStatus ? incrStatus - 1 : banner->Status))
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

    if (m_status == NODE_ATTACKED)
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
