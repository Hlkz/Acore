
/* ScriptData
Name: node_commandscript
%Complete: 100
Comment: All node related commands
Category: commandscripts
EndScriptData */

#include "ScriptMgr.h"
//#include "ObjectMgr.h"
#include "Chat.h"
//#include "AccountMgr.h"
#include "Language.h"
//#include "World.h"
#include "Player.h"
#include "Opcodes.h"

#include "NodeMgr.h"

class node_commandscript : public CommandScript
{
public:
    node_commandscript() : CommandScript("node_commandscript") { }

    ChatCommand* GetCommands() const override
    {
        static ChatCommand nodeAddCommandTable[] =
        {
            { "creature",       SEC_ANIMATOR,       true,  &HandleNodeAddCreatureCommand,     "", NULL },
            { NULL,             0,                  false, NULL,                              "", NULL }
        };
        static ChatCommand nodeCommandTable[] =
        {
            { "add",            SEC_ANIMATOR,       true,  NULL,               "", nodeAddCommandTable },
            { "load",           SEC_ANIMATOR,       true,  &HandleNodeLoadCommand,            "", NULL },
            //{ "",               SEC_ANIMATOR,       false, &HandleNodeCommand,                "", NULL },
            { NULL,             0,                  false, NULL,                              "", NULL }
        };
        static ChatCommand commandTable[] =
        {
            { "node",           SEC_ANIMATOR,       true,  NULL,                   "", nodeCommandTable },
            { NULL,             0,                  false, NULL,                               "", NULL }
        };
        return commandTable;
    }

    static bool HandleNodeLoadCommand(ChatHandler* handler, char const* args)
    {
        if (!*args)
            return false;

        char* nodeIdStr = strtok((char*)args, " ");
        uint32 nodeId = atoi(nodeIdStr);

        if (Node* node = sNodeMgr->GetNodeById(nodeId))
            node->Load();
        else
            return false;
        return true;
    }

    // Add/remove a creature to/from a node
    static bool HandleNodeAddCreatureCommand(ChatHandler* handler, char const* args)
    {
        uint32 nodeId, type, guid;
        nodeId = 0;
        type = 0;
        guid = 0;

        if (*args)
        {
            char* nodeIdStr = strtok((char*)args, " ");
            nodeId = atoi(nodeIdStr);

            char* typeStr = strtok(NULL, " ");
            type = atoi(typeStr);

            char* guidStr = strtok(NULL, " ");
            guid = atoi(guidStr);
        }
        if (!guid)
            if (Creature* crea = handler->getSelectedCreature())
                guid = crea->GetGUIDLow();
        if (!guid)
            return false;

        sNodeMgr->SetCreatureNode(guid, nodeId, type);
        return true;
    }
};

void AddSC_node_commandscript()
{
    new node_commandscript();
}
