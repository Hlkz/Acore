
#include "Battleground.h"
#include "NodeMgr.h"
#include "MapManager.h"
#include "Group.h"

NodeMgr::NodeMgr()
{
    m_justDiedCountResetTime = 0;
    m_lastWaveTime = 0;
}

NodeMgr::~NodeMgr() { }

void NodeMgr::InitNodes()
{
    uint32 oldMSTime = getMSTime();
    m_nodes.clear();

    QueryResult result = WorldDatabase.Query("SELECT id, map, type, status, faction, guild, name, name_loc2, area, "
                                             "flags, looseType, looseData, captureType, captureData1, captureData2 FROM nodes ORDER BY map ASC");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 Nodes. DB table `nodes` is empty.");
        return;
    }

    uint32 prevMapId = 0;
    Map* curMap = sMapMgr->CreateBaseMap(0);
    do {
        Field* fields = result->Fetch();
        uint32 curMapId = fields[1].GetUInt32();
        if (curMapId != prevMapId)
        {
            curMap = sMapMgr->CreateBaseMap(curMapId);
            prevMapId = curMapId;
        }
        if (!curMap)
        {
            TC_LOG_ERROR("sql.sql", "Can't spawn Node id %u on non-existent Map entry %u", fields[0].GetUInt32(), curMapId);
            continue;
        }

        m_nodes[fields[0].GetUInt32()] = new Node(curMap, fields);
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %lu Nodes in %u ms", (unsigned long)m_nodes.size(), GetMSTimeDiffToNow(oldMSTime));
    oldMSTime = getMSTime();
    uint32 count = 0;

    result = WorldDatabase.Query("SELECT node, relation, type, hostile, path FROM node_relations ORDER BY node ASC");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 NodeRelations. DB table `node_relations` is empty.");
        return;
    }

    uint32 prevNodeId = 0;
    Node* curNode = NULL;
    do {
        Field* fields = result->Fetch();
        uint32 curNodeId = fields[0].GetUInt32();
        if (curNodeId != prevNodeId)
        {
            curNode = GetNodeById(fields[0].GetUInt32());
            prevNodeId = curNodeId;
        }
        if (!curNode)
            continue;

        curNode->AddRelation(fields[1].GetUInt32(), fields[2].GetUInt32(), fields[3].GetInt32(), fields[4].GetUInt32());
        count++;
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u NodeRelations in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
    oldMSTime = getMSTime();
    count = 0;

    result = WorldDatabase.Query("SELECT node, id, position_x, position_y, position_z, position_o, rotation0, rotation1, rotation2, rotation3 FROM node_banners ORDER BY node ASC");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 NodeBanner. DB table `node_banners` is empty.");
        return;
    }

    prevNodeId = 0;
    curNode = NULL;
    do {
        Field* fields = result->Fetch();
        uint32 curNodeId = fields[0].GetUInt32();
        if (curNodeId != prevNodeId)
        {
            curNode = GetNodeById(fields[0].GetUInt32());
            prevNodeId = curNodeId;
        }
        if (!curNode)
            continue;

        NodeBanner* banner = new NodeBanner;
        banner->Node = curNode;
        banner->Index = fields[1].GetUInt32();
        banner->Status = NODE_BANNER_TAKEN;
        banner->FactionId = curNode->m_factionId;
        banner->GuildId = curNode->m_guildId;
        banner->Timer = 0;
        banner->SpawnTimer = 0;
        banner->Objects.clear();
        for (uint32 i = 0; i < NODE_BANNER_MAX; ++i)
            if (GameObject* go = curNode->AddBanner(NodeObjectId[i], fields[2].GetFloat(), fields[3].GetFloat(), fields[4].GetFloat(), fields[5].GetFloat(),
                                                    fields[6].GetFloat(), fields[7].GetFloat(), fields[8].GetFloat(), fields[9].GetFloat(), 86400))
            {
                banner->Objects[i] = go;
                m_nodeBanners[go->GetGUID()] = banner;
            }
            else
                TC_LOG_ERROR("sql.sql", "NodeMgr::InitNodes cannot add banner gameobject index %u status %u to node %u", banner->Index, i, curNode->GetId());
        curNode->m_banners[banner->Index] = banner;

        count++;
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u NodeBanners in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
    oldMSTime = getMSTime();
    count = 0;

    result = WorldDatabase.Query("SELECT guid, node, type FROM node_creatures ORDER BY node ASC");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 NodeCreatures. DB table `node_creatures` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();
        if (AddNodeCreature(fields[0].GetUInt32(), fields[1].GetUInt32(), fields[2].GetUInt32()))
            count++;
        else
            TC_LOG_ERROR("sql.sql", "Can't spawn Creature guid %u for Node id %u", fields[0].GetUInt32(), fields[1].GetUInt32());
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u NodeCreatures in %u ms", count, GetMSTimeDiffToNow(oldMSTime));

    for (NodeMap::iterator itr = m_nodes.begin(); itr != m_nodes.end(); ++itr)
        itr->second->Reset();
}

void NodeMgr::LoadNode(uint32 nodeId)
{
    uint32 oldMSTime = getMSTime();
    m_nodes.clear();

    QueryResult result = WorldDatabase.PQuery("SELECT id, map, type, status, faction, guild, name, name_loc2, area, "
                                             "flags, looseType, looseData, captureType, captureData1, captureData2 FROM nodes WHERE id = '%d'", nodeId);
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> NodeMgr::LoadNode - Node id %u does not exist.", nodeId);
        return;
    }

    Field* fields = result->Fetch();
    Node* node = GetNodeById(nodeId);

    if (!node)
    {
        if (Map* map = sMapMgr->CreateBaseMap(fields[1].GetUInt32()))
        {
            m_nodes[fields[0].GetUInt32()] = new Node(map, fields);
        }
    }
    else
        node->Load(fields);

    node = GetNodeById(nodeId);
    if (!node)
        return;

    result = WorldDatabase.PQuery("SELECT node, relation, type, hostile, path FROM node_relations WHERE node = '%d'", nodeId);
    if (result)
    {
        do {
            Field* fields = result->Fetch();
            node->AddRelation(fields[1].GetUInt32(), fields[2].GetUInt32(), fields[3].GetInt32(), fields[4].GetUInt32());
        } while (result->NextRow());
    }

    result = WorldDatabase.PQuery("SELECT node, id, position_x, position_y, position_z, position_o, rotation0, rotation1, rotation2, rotation3 FROM node_banners WHERE node = '%d'", nodeId);
    if (result)
    {
        do {
            Field* fields = result->Fetch();
            NodeBanner* banner = new NodeBanner;
            banner->Node = node;
            banner->Index = fields[1].GetUInt32();
            banner->Status = NODE_BANNER_TAKEN;
            banner->FactionId = node->m_factionId;
            banner->GuildId = node->m_guildId;
            banner->Timer = 0;
            banner->SpawnTimer = 0;
            banner->Objects.clear();
            for (uint32 i = 0; i < NODE_BANNER_MAX; ++i)
                if (GameObject* go = node->AddBanner(NodeObjectId[i], fields[2].GetFloat(), fields[3].GetFloat(), fields[4].GetFloat(), fields[5].GetFloat(),
                                                        fields[6].GetFloat(), fields[7].GetFloat(), fields[8].GetFloat(), fields[9].GetFloat(), 86400))
                {
                    banner->Objects[i] = go;
                    m_nodeBanners[go->GetGUID()] = banner;
                }
                else
                    TC_LOG_ERROR("sql.sql", "NodeMgr::InitNodes cannot add banner gameobject index %u status %u to node %u", banner->Index, i, node->GetId());
            node->m_banners[banner->Index] = banner;
        } while (result->NextRow());
    }

    result = WorldDatabase.PQuery("SELECT guid, node, type FROM node_creatures WHERE node = '%d'", nodeId);
    if (result)
    {
        do {
            Field* fields = result->Fetch();
            if (!AddNodeCreature(fields[0].GetUInt32(), fields[1].GetUInt32(), fields[2].GetUInt32()))
                TC_LOG_ERROR("sql.sql", "Can't spawn Creature guid %u for Node id %u", fields[0].GetUInt32(), fields[1].GetUInt32());
        } while (result->NextRow());
    }

    node->Reset();
}

void NodeMgr::SetCreatureNode(uint32 guid, uint32 node, uint32 type)
{
    PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_DEL_NODE_CREATURE);
    stmt->setUInt32(0, guid);
    WorldDatabase.Execute(stmt);

    RemoveNodeCreature(guid);

    if (AddNodeCreature(guid, node, type))
    {
        PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_INS_NODE_CREATURE);
        stmt->setUInt32(0, guid);
        stmt->setUInt32(1, node);
        stmt->setUInt32(2, type);
        WorldDatabase.Execute(stmt);
    }
}

bool NodeMgr::AddNodeCreature(uint32 guid, uint32 nodeId, uint32 type)
{
    Node* node = sNodeMgr->GetNodeById(nodeId);
    if (!node)
        return false;

    Creature* creature;
    if (!(creature = node->GetMap()->GetCreature(ObjectGuid(HIGHGUID_UNIT, sObjectMgr->GetCreatureData(guid)->id, guid))))
    {
        creature = new Creature();
        if (!creature->LoadCreatureFromDB(guid, node->GetMap(), true))
        {
            TC_LOG_ERROR("sql.sql", "Failed to load creature guid %u from node_creatures in map %u", guid, node->GetMap()->GetId());
            delete creature;
            return false;
        }
    }

    AddNodeCreature(creature, node, type);
    return true;
}

void NodeMgr::AddNodeCreature(Creature* creature, Node* node, uint32 type)
{
    if (!creature || !node)
        return;

    NodeCreature* nodeCreature = new NodeCreature;
    nodeCreature->Creature = creature;
    nodeCreature->Node = node;
    nodeCreature->Type = type;

    node->AddCreature(creature->GetGUIDLow(), nodeCreature);
    m_nodeCreatures[creature->GetGUIDLow()] = nodeCreature;
}

void NodeMgr::RemoveNodeCreature(uint32 guid)
{
    if (NodeCreature* nodeCreature = GetNodeCreatureByGuid(guid))
        nodeCreature->Node->RemoveCreature(guid);
    m_nodeCreatures.erase(guid);
}

void NodeMgr::Update(uint32 diff)
{
    for (NodeMap::iterator itr = m_nodes.begin(); itr != m_nodes.end(); ++itr)
        itr->second->Update(diff);

    m_justDiedCountResetTime += diff;
    if (m_justDiedCountResetTime >= NODE_DECR_JUSTDIED_INVERVAL)
    {
        for (NodeMap::iterator itr = m_nodes.begin(); itr != m_nodes.end(); ++itr)
            if (Node* node = itr->second)
                if (node->m_justDiedCount > 0)
                    node->m_justDiedCount--;
        m_justDiedCountResetTime = 0;
    }

    // Waves
    m_lastWaveTime += diff;
    if (m_lastWaveTime >= NODE_WAVE_INVERVAL)
    {
        for (NodeMap::iterator itr = m_nodes.begin(); itr != m_nodes.end(); ++itr)
            if (Node* node = itr->second)
                node->SendWaves();
        m_lastWaveTime = 0;
    }

    for (NodeBattleMap::iterator itr = m_nodeBattles.begin(); itr != m_nodeBattles.end(); ++itr)
        itr->second->Update();
}

NodeGroup* NodeMgr::AddNodeGroup(Group* group, uint32 faction, uint32 guild, Node* node)
{
    NodeGroup* nodeGroup = new NodeGroup;
    nodeGroup->Group = group;
    nodeGroup->Faction = faction;
    nodeGroup->Guild = guild;
    nodeGroup->Node = node;
    AddNodeGroup(nodeGroup);
    return nodeGroup;
}

void NodeMgr::AddNodeGroup(NodeGroup* nodeGroup)
{
    m_nodeGroups[nodeGroup->Group->GetGUID()] = nodeGroup;
}

void NodeMgr::RemoveNodeGroup(ObjectGuid guid)
{
    m_nodeGroups.erase(guid);
}

NodeBanner* NodeMgr::CanUseNodeBanner(Player* player, const GameObject* target_obj, NodeBanner* banner)
{
    if (!banner)
        banner = GetNodeBannerByGuid(target_obj->GetGUID());
    if (!banner)
        return NULL;

    uint32 factionId = 0;
    uint32 guildId = 0;
    player->GetFactionInBattle(factionId, guildId);

    if (!factionId && !guildId)
        return NULL;

    Node* node = banner->Node;

    if (node->m_status == NODE_ATTACKED)
    {
        if (node->m_captureType == NODE_CAPTURE_BY_BASE || node->m_captureType == NODE_CAPTURE_BY_MULTI_BASE)
            if (factionId == banner->FactionId && guildId == banner->GuildId)
                return NULL;
    }
    else
        return NULL;

    if (!player->isTotalImmune() &&                            // Damage immune
        !player->HasAura(SPELL_RECENTLY_DROPPED_FLAG) &&       // Still has recently held flag debuff
        player->IsAlive())                                     // Alive
        return banner;
    else
        return NULL;
}
