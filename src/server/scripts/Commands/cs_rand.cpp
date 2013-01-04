#include "ScriptPCH.h"
#include "Chat.h"

int32 Choix(int32 item_id, int choix) {
    ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(item_id);
    if (!itemProto) return 0;
    uint32 randomPropId = choix;
	ItemRandomPropertiesEntry const* random_id = sItemRandomPropertiesStore.LookupEntry(randomPropId);
	if (!random_id) return 0;
	return random_id->ID; }

void AddItemChoix(Player *player, uint32 item_id, int choix) {
    uint32 noSpaceForCount = 0;
    ItemPosCountVec dest;
    InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, item_id, 1, &noSpaceForCount);
    if (msg != EQUIP_ERR_OK)
    if (dest.empty()) {
		ChatHandler(player->GetSession()).PSendSysMessage("Vous n'avez plus de place.");
        return; }
		Item* item = player->StoreNewItem(dest, item_id, true, Choix(item_id, choix));
		if (item) player->SendNewItem(item, 1, true, false);
    return; }

class com_rand : public CommandScript {
   public: com_rand() : CommandScript("cs_rand") {}

static bool HandleComRand(ChatHandler* handler, const char* args) {
	if (!*args) return false;
	
	char* item = strtok((char*)args, " ");
	char* ench = strtok(NULL, " ");
    int32 item_id = (int32)atof(item);
    int ench_id = (int)atof(ench);

	AddItemChoix(handler->GetSession()->GetPlayer(), item_id, ench_id);
	return true; }

ChatCommand* GetCommands() const {
	static ChatCommand ComRand[] = {
		{ "rand",          SEC_ADMINISTRATOR,	false, &HandleComRand,		"", NULL },
		{ NULL,             0,					false, NULL,				"", NULL } };
	return ComRand; }
};

void AddSc_Com_Rand() {
   new com_rand(); }