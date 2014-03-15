
#include "NodeMgr.h"

NodeMgr::NodeMgr() { }

NodeMgr::~NodeMgr() { }

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
