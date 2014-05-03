
#include "NodeMgr.h"

NodeMgr::NodeMgr() { }

NodeMgr::~NodeMgr() { }

Node* NodeMgr::GetNodeById(uint32 id)
{
    for (NodeMap::iterator itr = mNodes.begin(); itr != mNodes.end(); ++itr)
    {
        if (itr->first == id)
            return itr->second;
    }
    return NULL;
}

void NodeMgr::Update(uint32 diff)
{

}

uint32 NodeMgr::GetPath(uint32 id, uint32 relation)
{
    PreparedStatement* stmt;
    stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_NODE_RELATIONS);
    stmt->setUInt32(0, id);
    stmt->setUInt32(1, relation);
    PreparedQueryResult result = WorldDatabase.Query(stmt);
    if (!result)
        return 0;
    return result->Fetch()[0].GetUInt32();
}
