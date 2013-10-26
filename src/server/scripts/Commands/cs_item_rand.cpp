#include "ScriptPCH.h"
#include "Chat.h"

#ifndef TRINITY_ITEM_RAND_COMMAND
#define TRINITY_ITEM_RAND_COMMAND

int32 ItemRandChoix(int32 item_id, int choix)
{
    ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(item_id);
    if (!itemProto)
        return NULL;
    uint32 randomPropId = choix;
    ItemRandomPropertiesEntry const* random_id = sItemRandomPropertiesStore.LookupEntry(randomPropId);
    if (!random_id)
        return NULL;
    return random_id->ID;
}

bool ItemRandAddChoix(Player *player, uint32 item_id, int choix)
{
    uint32 noSpaceForCount = 0;
    ItemPosCountVec dest;
    InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, item_id, 1, &noSpaceForCount);
    if (msg != EQUIP_ERR_OK)
    if (dest.empty())
    {
        ChatHandler(player->GetSession()).PSendSysMessage("Vous n'avez plus de place.");
        return true;
    }
        if (Item* item = player->StoreNewItem(dest, item_id, true, ItemRandChoix(item_id, choix)))
        {
            player->SendNewItem(item, 1, true, false);
            return true;
        }
    return false;
}

#endif

class item_rand_commandscript : public CommandScript
{
public:
    item_rand_commandscript() : CommandScript("item_rand_commandscript") { }

    ChatCommand* GetCommands() const
    {
        static ChatCommand commandTable[] =
        {
            { "rand",           SEC_GAMEMASTER,      false, &HandleItemRandCommand,      "", NULL },
            { NULL,             0,                   false, NULL,                        "", NULL } 
        };
        return commandTable;
    }

    static bool HandleItemRandCommand(ChatHandler* handler, const char* args)
    {
        if (!*args)
            return false;

        char* item = strtok((char*)args, " ");
        char* ench = strtok(NULL, " ");
        int32 item_id = (int32)atof(item);
        int ench_id = (int)atof(ench);

        if (ItemRandAddChoix(handler->GetSession()->GetPlayer(), item_id, ench_id))
            return true;
        return false;
    }
};

void AddSC_item_rand_commandscript() {
   new item_rand_commandscript(); }