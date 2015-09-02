
#include "DBCStores.h"
#include "NodeMgr.h"
//#include "FactionMgr.h"
//#include "GuildMgr.h"

// Used in NodeMgr::InitNodes()
Node::Node(Map* map, Field* fields)
{
    m_Id = fields[0].GetUInt32();
    m_Map = map;
    m_Type = fields[2].GetUInt32();
    m_Status = fields[3].GetUInt32();
    m_LeadType = fields[4].GetUInt32();
    m_FactionId = fields[5].GetUInt32();
    m_Faction = sFactionMgr->GetFactionById(m_FactionId); // NULL if dont exist or 0
    m_GuildId = fields[6].GetUInt32();
    m_Guild = sGuildMgr->GetGuildById(m_GuildId);
    m_Relations.clear();
}

void Node::Load()
{
    Populate();
}

void Node::Populate()
{
    FactionEntry const* factionEntry = m_Faction ? m_Faction->GetEntry() : NULL;

    for (NodeCreatureMap::iterator itr = m_Creatures.begin(); itr != m_Creatures.end(); ++itr)
        InitCreature(itr->second);
}

void Node::InitCreature(NodeCreature* nodeCrea)
{
    if (nodeCrea->Creature)
    {
        if (m_Faction)
        {
            if (0 < nodeCrea->Type && nodeCrea->Type < 4)
                if (uint32 factionTemplate = m_Faction->GetEntry()->LinkedTemplates[nodeCrea->Type - 1])
                    if (sDBCMgr->GetFactionTemplateEntry(factionTemplate))
                        nodeCrea->Creature->setFaction(factionTemplate);
        }
    }
}

void Node::AddCreature(uint32 guid, NodeCreature* nodeCreature)
{
    m_Creatures[guid] = nodeCreature;
    InitCreature(nodeCreature);
}

void Node::RemoveCreature(uint32 guid)
{
    m_Creatures.erase(guid);
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
    m_Relations[id] = relation;
}

void Node::SendWaves()
{
    for (NodeRelationMap::iterator itr = m_Relations.begin(); itr != m_Relations.end(); ++itr)
        if (itr->second->Type == NODE_PEDESTRIAN && itr->second->Hostile == NODE_HOSTILE)
            SendWave(itr);
}

void Node::SendWave(NodeRelationMap::iterator itr)
{
    // todo, spawn commander + soldiers
}
