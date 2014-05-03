
#ifndef _NODEMGR_H
#define _NODEMGR_H

#include <ace/Singleton.h>

#include "Node.h"
#include <map>
#include <set>
#include <vector>

class NodeMgr
{
    friend class ACE_Singleton<NodeMgr, ACE_Null_Mutex>;
    private:
        NodeMgr();
        ~NodeMgr();

    public:
        void Update(uint32 diff);
        Node* GetNodeById(uint32 id);
        uint32 GetPath(uint32 id, uint32 relation);

    private:
        NodeMap mNodes;

};

#define sNodeMgr ACE_Singleton<NodeMgr, ACE_Null_Mutex>::instance()

#endif
