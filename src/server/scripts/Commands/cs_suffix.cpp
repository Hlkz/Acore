#include "ScriptPCH.h"
#include "Chat.h"

int32 ChoixS(int32 item_id, int choix) {
    ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(item_id);
    if (!itemProto) return NULL;
	uint32 randomPropId = choix;
	ItemRandomSuffixEntry const* random_id = sItemRandomSuffixStore.LookupEntry(randomPropId);
	if (!random_id) return NULL;  
    return -int32(random_id->ID); }
	
void AddItemChoixS(Player *player, uint32 item_id, int choix) {
    uint32 noSpaceForCount = 0;
    ItemPosCountVec dest;
    InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, item_id, 1, &noSpaceForCount);
    if (msg != EQUIP_ERR_OK)
    if (dest.empty()) {
		ChatHandler(player->GetSession()).PSendSysMessage("Vous n'avez plus de place.");
        return; }
	if (Item* item = player->StoreNewItem(dest, item_id, true, ChoixS(item_id, choix)))
		player->SendNewItem(item, 1, true, false);
    return; }

class com_suffix : public CommandScript {
   public: com_suffix() : CommandScript("cs_suffix") {}

static bool HandleComSuffix(ChatHandler* handler, const char* args) {
	if (!*args) return false;
	
	char* item = strtok((char*)args, " ");
	char* ench = strtok(NULL, " ");
    int32 item_id = (int32)atof(item);
    int ench_id = (int)atof(ench);

	AddItemChoixS(handler->GetSession()->GetPlayer(), item_id, ench_id);
	return true; }

ChatCommand* GetCommands() const {
	static ChatCommand ComSuffix[] = {
		{ "suffix",         SEC_GAMEMASTER,	    false, &HandleComSuffix,	"", NULL },
		{ NULL,             0,					false, NULL,				"", NULL } };
	return ComSuffix; }
};

void AddSc_Com_Suffix() {
   new com_suffix(); }