
#ifndef _NODEMGR_H
#define _NODEMGR_H

#include <ace/Singleton.h>

#include "Node.h"
#include <map>
#include <set>
#include <vector>

enum NodeTimeIntervals
{
    NODE_WAVE_INVERVAL = 10000      // ms
};

enum NodeType
{
    NODE_DETACHED       = 0,
    NODE_PEDESTRIAN     = 1
};

enum NodeHostile
{
    NODE_EXALTED    = -2,
    NODE_HONORED    = -1,
    NODE_NEUTRAL    =  0,
    NODE_HOSTILE    =  1,
    NODE_HATED      =  2
};

class NodeMgr
{
    friend class ACE_Singleton<NodeMgr, ACE_Null_Mutex>;
    private:
        NodeMgr();
        ~NodeMgr();

    public:
        void InitNodes();

        void Update(uint32 diff);

        Node* GetNodeById(uint32 id) { for (NodeMap::iterator itr = m_Nodes.begin(); itr != m_Nodes.end(); ++itr) if (itr->first == id) return itr->second; return NULL; }

    private:
        NodeMap m_Nodes;

        time_t m_LastWaveTime;


};

#define sNodeMgr ACE_Singleton<NodeMgr, ACE_Null_Mutex>::instance()

#endif
