
#include "DBCStores.h"
#include "NodeMgr.h"
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
    m_guild = sGuildMgr->GetGuildById(m_guildId);
    m_relations.clear();
}

void Node::Load()
{
    Populate();
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
        if (itr->second->Type == NODE_PEDESTRIAN && itr->second->Hostile == NODE_HOSTILE)
            SendWave(itr);
}

void Node::SendWave(NodeRelationMap::iterator itr)
{
    // todo, spawn commander + soldiers
}

void NodeBattle::Update()
{

}
