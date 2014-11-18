
#ifndef _NODEMGR_H
#define _NODEMGR_H

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
    private:
        NodeMgr();
        ~NodeMgr();

    public:
        static NodeMgr* instance()
        {
            static NodeMgr* instance = new NodeMgr();
            return instance;
        }

        void InitNodes();

        void Update(uint32 diff);

        Node* GetNodeById(uint32 id) { for (NodeMap::iterator itr = m_Nodes.begin(); itr != m_Nodes.end(); ++itr) if (itr->first == id) return itr->second; return NULL; }

    private:
        NodeMap m_Nodes;

        time_t m_LastWaveTime;


};

#define sNodeMgr NodeMgr::instance()

#endif // __NODEMGR_H
