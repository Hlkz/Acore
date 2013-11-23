#include "ScriptPCH.h"
#include "Chat.h"

#ifndef TRINITY_ITEM_SUFFIX_COMMAND
#define TRINITY_ITEM_SUFFIX_COMMAND

int32 ItemSuffixChoix(int32 item_id, int choix)
{
    ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(item_id);
    if (!itemProto)
        return NULL;
    uint32 randomPropId = choix;
    ItemRandomSuffixEntry const* random_id = sItemRandomSuffixStore.LookupEntry(randomPropId);
    if (!random_id)
        return NULL;
    return -int32(random_id->ID);
}

void ItemSuffixAddChoix(Player *player, uint32 item_id, int choix)
{
    uint32 noSpaceForCount = 0;
    ItemPosCountVec dest;
    InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, item_id, 1, &noSpaceForCount);
    if (msg != EQUIP_ERR_OK)
    if (dest.empty())
    {
        ChatHandler(player->GetSession()).PSendSysMessage("Vous n'avez plus de place.");
        return;
    }
    if (Item* item = player->StoreNewItem(dest, item_id, true, ItemSuffixChoix(item_id, choix)))
        player->SendNewItem(item, 1, true, false);
    return;
}

#endif

class item_suffix_commandscript : public CommandScript
{
public:
    item_suffix_commandscript() : CommandScript("item_suffix_commandscript") { }


    ChatCommand* GetCommands() const
    {
        static ChatCommand commandTable[] =
        {
            { "suffix",         SEC_GAMEMASTER,     false, &HandleItemSuffixCommand,    "", NULL },
            { NULL,             0,                  false, NULL,                        "", NULL }
        };
        return commandTable;
    }

    static bool HandleItemSuffixCommand(ChatHandler* handler, const char* args)
    {
        if (!*args)
        return false;

        char* item = strtok((char*)args, " ");
        char* ench = strtok(NULL, " ");
        int32 item_id = (int32)atof(item);
        int ench_id = (int)atof(ench);

        ItemSuffixAddChoix(handler->GetSession()->GetPlayer(), item_id, ench_id);
        return true;
    }
};

void AddSC_item_suffix_commandscript() {
   new item_suffix_commandscript(); }