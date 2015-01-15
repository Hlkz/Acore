#include "NodeMgr.h"

// Used in NodeMgr::InitNodes()
Node::Node(Field* fields)
{
    m_Id = fields[0].GetUInt32();
    m_Team = fields[1].GetUInt32();
    m_Comment = fields[2].GetUInt32();
    m_Relations.clear();
}

void Node::AddRelation(uint32 id, uint32 type, int32 hostile, uint32 path)
{
    Node* node = sNodeMgr->GetNodeById(id);
    if (!node)
    {
        TC_LOG_ERROR("misc", "Node::AddRelation relation %u doesn't exist", id);
        return;
    }

    NodeRelation relation;
    relation.Relation = node;
    relation.Type = type;
    relation.Hostile = hostile;
    relation.Path = path;
    m_Relations[id] = relation;
}

void Node::SendWaves()
{
    for (NodeRelationMap::iterator itr = m_Relations.begin(); itr != m_Relations.end(); ++itr)
        if (itr->second.Type == NODE_PEDESTRIAN && itr->second.Hostile == NODE_HOSTILE)
            SendWave(itr);
}

void Node::SendWave(NodeRelationMap::iterator itr)
{
    // todo, spawn commander + soldiers
}
