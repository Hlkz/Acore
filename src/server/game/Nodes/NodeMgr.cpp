
#include "NodeMgr.h"

NodeMgr::NodeMgr()
{
    m_LastWaveTime = 0;
}

NodeMgr::~NodeMgr() { }

void NodeMgr::InitNodes()
{
    uint32 oldMSTime = getMSTime();
    m_Nodes.clear();

    QueryResult result = WorldDatabase.Query("SELECT id, map, type, status, leadtype, faction, guild FROM nodes ORDER BY map ASC");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 Nodes. DB table `nodes` is empty.");
        return;
    }

    uint32 prevMapId = 0;
    Map* curMap = sMapMgr->FindMap(0, 0);
    do {
        Field* fields = result->Fetch();
        uint32 curMapId = fields[1].GetUInt32();
        if (curMapId != prevMapId)
        {
            curMap = sMapMgr->FindMap(curMapId, 0);
            prevMapId = curMapId;
        }
        if (!curMap)
            continue;

        m_Nodes[fields[0].GetUInt32()] = new Node(curMap, fields);
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %lu Nodes in %u ms", (unsigned long)m_Nodes.size(), GetMSTimeDiffToNow(oldMSTime));
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
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u NodeCreatures in %u ms", count, GetMSTimeDiffToNow(oldMSTime));

    for (NodeMap::iterator itr = m_Nodes.begin(); itr != m_Nodes.end(); ++itr)
        itr->second->Load();
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
    m_NodeCreatures[creature->GetGUIDLow()] = nodeCreature;
}

void NodeMgr::RemoveNodeCreature(uint32 guid)
{
    if (NodeCreature* nodeCreature = GetNodeCreatureByGuid(guid))
        nodeCreature->Node->RemoveCreature(guid);
    m_NodeCreatures.erase(guid);
}

void NodeMgr::Update(uint32 diff)
{
    // Waves
    m_LastWaveTime += diff;
    if (m_LastWaveTime >= NODE_WAVE_INVERVAL)
    {
        for (NodeMap::iterator itr = m_Nodes.begin(); itr != m_Nodes.end(); ++itr)
            if (Node* node = itr->second)
                node->SendWaves();
        m_LastWaveTime = 0;
    }
}
