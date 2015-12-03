
/* ScriptData
Name: node_commandscript
%Complete: 100
Comment: All node related commands
Category: commandscripts
EndScriptData */

#include "ScriptMgr.h"
#include "Chat.h"
#include "Common.h"
#include "Language.h"
#include "MapManager.h"
#include "NodeMgr.h"
#include "Player.h"
#include "Opcodes.h"
#include "ReputationMgr.h"
#include "Group.h"

class node_commandscript : public CommandScript
{
public:
    node_commandscript() : CommandScript("node_commandscript") { }

    ChatCommand* GetCommands() const override
    {
        static ChatCommand nodeAddCommandTable[] =
        {
            { "creature",       SEC_ANIMATOR,      false,  &HandleNodeAddCreatureCommand,    "", NULL },
            { "guard",          SEC_ANIMATOR,      false,  &HandleNodeAddGuardCommand,       "", NULL },
            { "civilian",       SEC_ANIMATOR,      false,  &HandleNodeAddCivilianCommand,    "", NULL },
            { NULL,             0,                  false,  NULL,                             "", NULL }
        };
        static ChatCommand nodeSetCommandTable[] =
        {
            { "name",           SEC_ADMINISTRATOR, false,  &HandleNodeSetNameCommand,        "", NULL },
            { "position",       SEC_ADMINISTRATOR, false,  &HandleNodeSetPositionCommand,    "", NULL },
            { "start",          SEC_ADMINISTRATOR, false,  &HandleNodeSetStartCommand,       "", NULL },
            { "status",         SEC_ANIMATOR,      false,  &HandleNodeSetStatusCommand,      "", NULL },
            { "faction",        SEC_ANIMATOR,      false,  &HandleNodeSetFactionCommand,     "", NULL },
            { "guild",          SEC_ANIMATOR,      false,  &HandleNodeSetGuildCommand,       "", NULL },
            { NULL,             0,                  false,  NULL,                             "", NULL }
        };
        static ChatCommand nodeRemoveCommandTable[] =
        {
            { "start",          SEC_ADMINISTRATOR, false,  &HandleNodeRemoveStartCommand,    "", NULL },
            { NULL,             0,                  false,  NULL,                             "", NULL }
        };
        static ChatCommand nodeCommandTable[] =
        {
            { "add",            SEC_ANIMATOR,      false,  NULL,              "", nodeAddCommandTable },
            { "set",            SEC_ANIMATOR,      false,  NULL,              "", nodeSetCommandTable },
            { "remove",         SEC_ANIMATOR,      false,  NULL,           "", nodeRemoveCommandTable },
            { "create",         SEC_ADMINISTRATOR, false,  &HandleNodeCreateCommand,         "", NULL },
            { "delete",         SEC_ADMINISTRATOR, false,  &HandleNodeDeleteCommand,         "", NULL },
            { "getinfos",       SEC_PLAYER,        false,  &HandleNodeGetInfosCommand,       "", NULL },
            { "load",           SEC_ANIMATOR,      false,  &HandleNodeLoadCommand,           "", NULL },
            { "info",           SEC_ANIMATOR,      false,  &HandleNodeInfoCommand,           "", NULL },
            { "target",         SEC_ANIMATOR,      false,  &HandleNodeTargetCommand,         "", NULL },
            //{ "",               SEC_ANIMATOR,       false, &HandleNodeCommand,                "", NULL },
            { NULL,             0,                  false,  NULL,                             "", NULL }
        };
        static ChatCommand commandTable[] =
        {
            { "node",           SEC_PLAYER,        true,   NULL,                 "", nodeCommandTable },
            { "join",           SEC_PLAYER,        false,  &HandleJoinNodeBattleCommand,     "", NULL },
            { "gj",             SEC_PLAYER,        false,  &HandleGroupJoinNodeBattleCommand,"", NULL },
            { "rpz",            SEC_PLAYER,        false,  &HandleRepresentCommand,          "", NULL },
            { "testiconself",   SEC_ANIMATOR,      false,  &HandleTestIconSelfCommand,       "", NULL },
            { "sendicon",       SEC_ANIMATOR,      false,  &HandleSendIconCommand,           "", NULL },
            { NULL,             0,                  false,  NULL,                              "", NULL }
        };
        return commandTable;
    }

    static bool HandleNodeCreateCommand(ChatHandler* handler, char const* args)
    {
        if (!*args)
            return false;

        Player* player = handler->GetSession()->GetPlayer();

        char* typeStr = strtok((char*)args, " ");
        char* idStr = strtok(NULL, " ");
        uint32 id = idStr ? (uint32)atoi(idStr) : 0;
        if (!id)
        {
            if (QueryResult result = WorldDatabase.Query("SELECT id FROM nodes ORDER BY id DESC LIMIT 1"))
                id = result->Fetch()->GetUInt32() + 1;
            else
                return false;
        }

        if (sNodeMgr->GetNodeById(id))
        {
            handler->PSendSysMessage("Node id %u already exists.", id);
            return true;
        }

        uint32 type = 0;
        if (typeStr)
        {
            if (!strcmp(typeStr, "town"))
                type = NODE_TOWN;
            else if (!strcmp(typeStr, "city"))
                type = NODE_CITY;
            else if (!strcmp(typeStr, "capital"))
                type = NODE_CAPITAL;
            else
                type = (uint32)atoi(typeStr);
        }

        char const* nameStr = handler->extractQuotedArg(strtok(NULL, ""));
        char const* name_loc2Str = handler->extractQuotedArg(strtok(NULL, ""));
        AreaTableEntry const* area = GetAreaEntryByAreaID(player->GetAreaId());
        if (!nameStr && area)
            nameStr = area->area_name[0].c_str();
        if (!name_loc2Str && area)
            name_loc2Str = area->area_name[2].c_str();
        LocString name(nameStr, name_loc2Str);

        if (Node* node = sNodeMgr->CreateNode(id, name, type, player->GetMap(), player->GetPositionX(), player->GetPositionY()))
            handler->PSendSysMessage("Node %u (%s) type:%u successfully created.", node->GetId(), node->GetName()[handler->GetSessionDbcLocale()].c_str(), node->GetType());
        else
            handler->SendSysMessage("Error creating the node.");
        return true;
    }

    static bool HandleNodeDeleteCommand(ChatHandler* handler, char const* args)
    {
        uint32 id = 0;
        if (*args)
            id = (uint32)atoi(args);

        if (!id)
        {
            if (Node* node = handler->GetSession()->GetSelectedNode())
                handler->PSendSysMessage("You have to type the id to delete a node. You are targeting node id %u.", node->GetId());
            else
                handler->PSendSysMessage("You have to type the id to delete a node.");
            return true;
        }
        sNodeMgr->DeleteNode(id);
        return true;
    }

    static bool HandleNodeLoadCommand(ChatHandler* handler, char const* args)
    {
        uint32 id = 0;
        if (*args)
            id = (uint32)atoi(args);

        if (!id)
        {
            if (Node* node = handler->GetSession()->GetSelectedNode())
                handler->PSendSysMessage("You have to type the id to load a node. You are targeting node id %u.", node->GetId());
            else
                handler->PSendSysMessage("You have to type the id to load a node.");
            return true;
        }
        sNodeMgr->LoadNode(id);
        return true;
    }

    static void PrintNodeInfos(ChatHandler* handler, Node* node)
    {
        LocaleConstant loc = handler->GetSessionDbcLocale();
        uint32 factionId, guildId, oldfactionId, oldguildId;
        LocString ownerName, oldownerName;
        node->GetOwnerInfos(factionId, guildId, ownerName, oldfactionId, oldguildId, oldownerName);
        handler->PSendSysMessage("Node %u '%s' - Type %s (%u) - Status %s (%u)", node->GetId(), node->GetName()[loc].c_str(),
            NodeTypeString[node->GetType()][loc].c_str(), node->GetType(), NodeStatusString[node->GetStatus()][loc].c_str(), node->GetStatus());
        if (oldfactionId || oldguildId)
            handler->PSendSysMessage("Owned by %s '%s' (%u) over %s '%s' (%u)",
            factionId ? "faction" : guildId ? "guild" : "none", ownerName[loc].c_str(), factionId ? factionId : guildId ? guildId : 0,
            oldfactionId ? "faction" : oldguildId ? "guild" : "none", oldownerName[loc].c_str(), oldfactionId ? oldfactionId : oldguildId ? oldguildId : 0);
        else if (factionId || guildId)
            handler->PSendSysMessage("Owned by %s '%s' (%u)",
            factionId ? "faction" : guildId ? "guild" : "none", ownerName[loc].c_str(), factionId ? factionId : guildId ? guildId : 0);
        //handler->PSendSysMessage("Zone '%s' (%u) - Area '%s' (%u) - JustDied: %u", node-);
    }

    static bool HandleNodeInfoCommand(ChatHandler* handler, char const* args)
    {
        Node* node = NULL;
        if (*args)
            node = sNodeMgr->GetNodeById(atoi(args));
        else
            node = handler->GetSession()->GetSelectedNode();

        if (node)
            PrintNodeInfos(handler, node);
        else
            handler->SendSysMessage("You have to target a node or specify an id.");
        return true;
    }

    static bool HandleNodeTargetCommand(ChatHandler* handler, char const* args)
    {
        WorldSession* session = handler->GetSession();
        Player* player = session->GetPlayer();

        bool found = false;
        if (*args)
            found = session->SetSelectedNode(atoi(args));
        else if (player)
        {
            if (QueryResult result = WorldDatabase.PQuery("SELECT id, (POW(position_x - '%f', 2) + POW(position_y - '%f', 2)) AS order_ FROM nodes WHERE map = '%i' ORDER BY order_ ASC LIMIT 1",
                player->GetPositionX(), player->GetPositionY(), player->GetMapId()))
                if (uint32 id = result->Fetch()[0].GetUInt32())
                    found = session->SetSelectedNode(id);
        }
        else
            return false;

        if (found)
            if (Node* node = session->GetSelectedNode())
            {
                PrintNodeInfos(handler, node);
                return true;
            }
        handler->SendSysMessage("Can't find a node on this map.");
        return true;
    }

    static bool HandleNodeSetNameCommand(ChatHandler* handler, char const* args)
    {
        if (!*args)
            return false;
        Node* node = handler->GetSession()->GetSelectedNode();
        if (!node)
            return false;

        char const* nameStr = handler->extractQuotedArg((char*)args);
        if (!nameStr)
        {
            handler->SendSysMessage(LANG_BAD_VALUE);
            handler->SetSentErrorMessage(true);
            return false;
        }

        char const* name_loc2Str = handler->extractQuotedArg(strtok(NULL, ""));
        if (!name_loc2Str)
        {
            handler->SendSysMessage(LANG_BAD_VALUE);
            handler->SetSentErrorMessage(true);
            return false;
        }

        node->SetName(LocString(nameStr, name_loc2Str));
        return true;
    }

    static bool HandleNodeSetFactionCommand(ChatHandler* handler, char const* args)
    {
        if (!*args)
            return false;
        Node* node = handler->GetSession()->GetSelectedNode();
        if (!node)
            return false;

        Faction* faction = NULL;
        char const* nameStr = handler->extractQuotedArg(strtok((char*)args, ""));
        if (nameStr)
            faction = sFactionMgr->GetFactionByName(nameStr);
        else
            faction = sFactionMgr->GetFactionById(atoi(args));

        if (faction)
            node->SetFaction(faction->GetId());
        else
            handler->SendSysMessage("Faction not found.");
        return true;
    }

    static bool HandleNodeSetGuildCommand(ChatHandler* handler, char const* args)
    {
        if (!*args)
            return false;
        Node* node = handler->GetSession()->GetSelectedNode();
        if (!node)
            return false;

        Guild* guild = NULL;
        char const* nameStr = handler->extractQuotedArg(strtok((char*)args, ""));
        if (nameStr)
            guild = sGuildMgr->GetGuildByName(nameStr);
        else
            guild = sGuildMgr->GetGuildById(atoi(args));

        if (guild)
            node->SetGuild(guild->GetId());
        else
            handler->SendSysMessage("Guild not found.");
        return true;
    }

    static bool HandleNodeSetPositionCommand(ChatHandler* handler, char const* args)
    {
        Node* node = handler->GetSession()->GetSelectedNode();
        if (!node)
            return false;

        Player* player = handler->GetSession()->GetPlayer();
        node->SetPosition(player->GetPositionX(), player->GetPositionY());
        return true;
    }

    static bool HandleNodeSetStartCommand(ChatHandler* handler, char const* args)
    {
        Node* node = handler->GetSession()->GetSelectedNode();
        if (!node)
            return false;

        if (*args)
            node->RemoveStartLocation();
        else
            node->SetStartLocation(handler->GetSession()->GetPlayer()->GetWorldLocation());
        return true;
    }

    static bool HandleNodeRemoveStartCommand(ChatHandler* handler, char const* args)
    {
        Node* node = handler->GetSession()->GetSelectedNode();
        if (!node)
            return false;

        node->RemoveStartLocation();
        return true;
    }

    static bool HandleNodeSetStatusCommand(ChatHandler* handler, char const* args)
    {
        Node* node = handler->GetSession()->GetSelectedNode();
        if (!node)
            return false;

        if (!*args)
            return false;

        uint32 status = 0, trans = 0, factionId = 0, guildId = 0;
        status = atoi(strtok((char*)args, " "));
        trans = atoi(strtok(NULL, " "));
        factionId = atoi(strtok(NULL, " "));
        guildId = atoi(strtok(NULL, " "));
        node->SetStatus(status, trans, factionId, guildId);
        return true;
    }

    // Add/remove a creature to/from a node
    static bool HandleNodeAddCreatureCommand(ChatHandler* handler, char const* args)
    {
        Node* node = handler->GetSession()->GetSelectedNode();
        if (!node)
            return false;

        uint32 type = 0;
        if (*args)
            type = (uint32)atoi(args);

        if (Creature* crea = handler->getSelectedCreature())
            sNodeMgr->SetCreatureNode(crea->GetGUIDLow(), node->GetId(), type);
        else
            return false;
        return true;
    }

    static bool HandleNodeAddGuardCommand(ChatHandler* handler, char const* args)
    {
        Node* node = handler->GetSession()->GetSelectedNode();
        if (!node)
            return false;

        if (Creature* crea = handler->getSelectedCreature())
            sNodeMgr->SetCreatureNode(crea->GetGUIDLow(), node->GetId(), 1);
        else
            return false;
        return true;
    }

    static bool HandleNodeAddCivilianCommand(ChatHandler* handler, char const* args)
    {
        Node* node = handler->GetSession()->GetSelectedNode();
        if (!node)
            return false;

        if (Creature* crea = handler->getSelectedCreature())
            sNodeMgr->SetCreatureNode(crea->GetGUIDLow(), node->GetId(), 2);
        else
            return false;
        return true;
    }

    static bool HandleJoinNodeBattleCommand(ChatHandler* handler, char const* args)
    {
        return true;
    }

    static bool HandleGroupJoinNodeBattleCommand(ChatHandler* handler, char const* args)
    {
        Player* player = handler->GetSession()->GetPlayer();
        Group* group = player->GetGroup();

        if ((group && (!group->IsLeader(player->GetGUID()) || group->GetMembersCount() < 4))
            || (!group && handler->GetSession()->GetSecurity() < SEC_ANIMATOR))
            return true;

        uint32 nodeId, factionId, guildId;
        nodeId = 0;
        factionId = 0;
        guildId = 0;

        if (*args)
        {
            char* nodeIdStr = strtok((char*)args, " ");
            nodeId = atoi(nodeIdStr);

            char* factionIdStr = strtok(NULL, " ");
            factionId = atoi(factionIdStr);

            char* guildIdStr = strtok(NULL, " ");
            guildId = atoi(guildIdStr);
        }

        if (((!factionId && !guildId) || (factionId && guildId))
            || (factionId && !sFactionMgr->GetFactionById(factionId))
            || (guildId && !sGuildMgr->GetGuildById(guildId)))
            return true;

        // everything's fine, do it (is it 0 (PARTY_OP_INVITE) correct code)
        //SendPartyResult(PARTY_OP_INVITE, "", ERR_PARTY_RESULT_OK);

        if (Node* node = sNodeMgr->GetNodeById(nodeId))
        {
            if (!group)
            {
                group = new Group;
                group->Create(player);
            }
            if (group)
                group->ConvertToNodeGroup(factionId, guildId, node);
        }
        TCLC("ended");
        return true;
    }

    static bool HandleNodeGetInfosCommand(ChatHandler* handler, char const* args)
    {
        Player* player = handler->GetSession()->GetPlayer();
        if (*args)
        {
            if (player->GetMapId() == 606)
                if (uint32 id = atoi(strtok((char*)args, " ")))
                    if (Node* node = sNodeMgr->GetNodeById(id))
                        if (node->CanBeAStartForPlayer(player))
                        {
                            player->TeleportTo(node->GetStartLocation());
                            WorldPacket data;
                            ChatHandler::BuildChatPacket(data, CHAT_MSG_SYSTEM, LANG_ADDON, player, player, "AON,0"); // serv confirm that client can hide worldmap
                            handler->GetSession()->SendPacket(&data);
                            return true;
                        }
        }

        const char* AONewCharString = (player->GetMapId() == 606) ? "AON,1" : "AON,0";
        WorldPacket data;
        ChatHandler::BuildChatPacket(data, CHAT_MSG_SYSTEM, LANG_ADDON, player, player, AONewCharString);
        handler->GetSession()->SendPacket(&data);

        sNodeMgr->SendIconsUpdateToPlayer(player, (player->GetMapId() == 606));
        return true;
    }

    static bool HandleRepresentCommand(ChatHandler* handler, char const* args)
    {
        Player* player = handler->GetSession()->GetPlayer();
        if (*args)
        {
            if (args[0] == '?')
                player->SendFaction();
            else if (char const* name = handler->extractQuotedArg((char*)args))
                if (Faction* faction = sFactionMgr->GetFactionByName(name))
                {
                    if (faction->GetId() == player->GetFaction())
                        player->ResetFaction();
                    else if (player->GetReputationMgr().GetReputation(faction->GetId()) > 2999)
                        player->SetFaction(faction->GetId());
                }
        }
        else
            player->ResetFaction();
        return true;
    }

    static bool SendIcon(ChatHandler* handler, char const* args, bool self = false)
    {
        if (!*args)
            return false;
        char* typeStr = strtok((char*)args, " ");
        char* idStr = strtok(NULL, " ");
        char* iconStr = strtok(NULL, " ");
        char* scaleStr = strtok(NULL, " ");

        uint32 type = typeStr ? (uint32)atoi(typeStr) : 0;
        uint32 id = idStr ? (uint32)atoi(idStr) : 0;

        if (!type || !id || type > 10)
            return false;

        uint32 icon = iconStr ? (uint32)atoi(iconStr) : 0;
        float scale = scaleStr ? (float)atof(scaleStr) : 0;
        char const* title = handler->extractQuotedArg(strtok(NULL, ""));
        char const* desc = handler->extractQuotedArg(strtok(NULL, ""));
        char* flagsStr = strtok(NULL, " ");
        int32 flags = flagsStr ? (int32)atoi(iconStr) : 0;
        
        Player* player = handler->GetSession()->GetPlayer();
        if (self)
            sWorld->SendIconUpdateToPlayer(player, type, id, icon, scale, player->GetMapId(), player->GetPositionX(), player->GetPositionY(), title ? title : "", desc ? desc : "", flags);
        else
            sWorld->SendIconUpdate(type, id, icon, scale, player->GetMapId(), player->GetPositionX(), player->GetPositionY(), title ? title : "", desc ? desc : "", flags);
        return true;
    }

    static bool HandleTestIconSelfCommand(ChatHandler* handler, char const* args)
    {
        return SendIcon(handler, args, true);
    }

    static bool HandleSendIconCommand(ChatHandler* handler, char const* args)
    {
        return SendIcon(handler, args);
    }
};

void AddSC_node_commandscript()
{
    new node_commandscript();
}
