
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

    QueryResult result = WorldDatabase.Query("SELECT id, team, comment FROM nodes");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 Nodes. DB table `nodes` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();
        m_Nodes[fields[0].GetUInt32()] = new Node(fields);
    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu Nodes in %u ms", (unsigned long)m_Nodes.size(), GetMSTimeDiffToNow(oldMSTime));
    oldMSTime = getMSTime();
    uint32 relationCount = 0;

    result = WorldDatabase.Query("SELECT id, relation, type, hostile, path FROM node_relations");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 NodeRelations. DB table `node_relations` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();
        m_Nodes[fields[0].GetUInt32()]->AddRelation(fields[1].GetUInt32(), fields[2].GetUInt32(), fields[3].GetInt32(), fields[4].GetUInt32());
        relationCount++;
    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %u NodeRelations in %u ms", relationCount, GetMSTimeDiffToNow(oldMSTime));
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
