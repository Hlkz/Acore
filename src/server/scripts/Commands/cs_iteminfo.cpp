#include "ScriptPCH.h"
#include "Chat.h"

class com_item_info : public CommandScript {
   public: com_item_info() : CommandScript("cs_iteminfo") {}

static bool HandleComItemInfo(ChatHandler* handler, const char* args) {
	if (!*args) return false;
	char* item = strtok((char*)args, " ");
    int32 item_id = (int32)atof(item);
	ItemTemplate const* itemt = sObjectMgr->GetItemTemplate(item_id);
	int32 random = itemt->RandomProperty;
	if (!itemt || !random || !item_id)
		return false;
	ChatHandler(handler->GetSession()).PSendSysMessage("Objet %u - EnchEntry(randomprop) %u", item_id, random);
	return true; }

ChatCommand* GetCommands() const {
	static ChatCommand ComItemInfo[] = {
		{ "ii",      SEC_ANIMATOR,	            false, &HandleComItemInfo,	"", NULL },
		{ NULL,                  0,			    false, NULL,				"", NULL } };
	return ComItemInfo; }
};

void AddSc_Com_Item_Info() {
   new com_item_info(); }