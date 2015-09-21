 
#ifndef _NODEMGR_H
#define _NODEMGR_H

#include "Common.h"
#include "Node.h"

enum NodeTimeIntervals
{
    NODE_DECR_JUSTDIED_INVERVAL = 120000,
    NODE_WAVE_INVERVAL          = 10000      // ms
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

        void Update(uint32 diff);

        void InitNodes();
        Node* GetNodeById(uint32 id) { for (NodeMap::iterator itr = m_nodes.begin(); itr != m_nodes.end(); ++itr) if (itr->first == id) return itr->second; return NULL; }

        NodeCreature* GetNodeCreatureByGuid(uint32 guid) { for (NodeCreatureMap::iterator itr = m_nodeCreatures.begin(); itr != m_nodeCreatures.end(); ++itr) if (itr->first == guid) return itr->second; return NULL; }
        void SetCreatureNode(uint32 guid, uint32 node, uint32 type);
        bool AddNodeCreature(uint32 guid, uint32 nodeId, uint32 type);
        void AddNodeCreature(Creature* creature, Node* node, uint32 type);
        void RemoveNodeCreature(uint32 guid);

        NodeBanner* GetNodeBannerByGuid(ObjectGuid guid) { for (NodeAllBannerMap::iterator itr = m_nodeBanners.begin(); itr != m_nodeBanners.end(); ++itr) if (itr->first == guid) return itr->second; return NULL; }

        //NodeGroup* GetNodeGroupByGuid(ObjectGuid guid) { for (NodeGroup::iterator itr = m_nodeGroup.begin(); itr != m_nodeGroup.end(); ++itr) if (itr->first == guid) return itr->second; return NULL; }
        void AddNodeGroup(Group* group, uint32 faction, uint32 guild);
        void AddNodeGroup(NodeGroup* nodeGroup);
        void RemoveNodeGroup(ObjectGuid guid);

    private:
        NodeMap m_nodes;
        NodeCreatureMap m_nodeCreatures;
        NodeGroupMap m_nodeGroups;

        NodeAllBannerMap m_nodeBanners;

        NodeBattleMap m_nodeBattles;

        time_t m_justDiedCountResetTime;
        time_t m_lastWaveTime;
};

#define sNodeMgr NodeMgr::instance()

#endif // __NODEMGR_H
