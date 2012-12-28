#include "ScriptPCH.h"
#include "Chat.h"

class com_item_info : public CommandScript {
   public: com_item_info() : CommandScript("comiteminfo") {}

static bool HandleComItemInfo(ChatHandler* handler, const char* args) {
	if (!*args) return false;
	char* item = strtok((char*)args, " ");
    int32 item_id = (int32)atof(item);
	ItemTemplate const* itemt = sObjectMgr->GetItemTemplate(item_id);
	int32 random = itemt->RandomProperty;
	if (!itemt) return false;
	if (!random) return false;
	ChatHandler(handler->GetSession()).PSendSysMessage("Objet %u - EnchEntry %u", item_id, random);
	return true; }

ChatCommand* GetCommands() const {
	static ChatCommand ComItemInfo[] = {
		{ "ii",      SEC_ADMINISTRATOR,	false, &HandleComItemInfo,	"", NULL },
		{ NULL,             0,					false, NULL,				"", NULL } };
	return ComItemInfo; }
};

void AddSc_Com_Item_Info() {
   new com_item_info(); }