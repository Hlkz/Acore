#include "ScriptPCH.h"
#include "Chat.h"
#include "Object.h"

class com_test : public CommandScript {
   public: com_test() : CommandScript("cs_test") {}

static bool HandleComTest(ChatHandler* handler, char const* /*args*/) {
	Player* target = handler->getSelectedPlayer();
	sLog->outError(LOG_FILTER_GENERAL, "team : %u", target->GetTeam());
	sLog->outError(LOG_FILTER_GENERAL, "ffa? : %u", target->HasByteFlag(UNIT_FIELD_BYTES_2, 1, UNIT_BYTE2_FLAG_FFA_PVP));
    target->SetByteFlag(UNIT_FIELD_BYTES_2, 1, 0x01);

	return true; }

ChatCommand* GetCommands() const {
	static ChatCommand ComTest[] = {
		{ "test",        	SEC_ADMINISTRATOR,	false, &HandleComTest,	"", NULL },
		{ NULL,             0,					false, NULL,			"", NULL } };
	return ComTest; }
};

void AddSc_Com_Test() {
   new com_test(); }