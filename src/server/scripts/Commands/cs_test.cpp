#include "ScriptPCH.h"
#include "Chat.h"
#include "Object.h"
#include "BattleAOMgr.h"

class com_test : public CommandScript {
   public: com_test() : CommandScript("cs_test") {}

static bool HandleComTest(ChatHandler* handler, char const* /*args*/) {

	BattleAO* bao = sBattleAOMgr->GetBattleAO();
	sLog->outError(LOG_FILTER_GENERAL, "coucou %f", bao->AoCreatures[0]);

	return true; }

ChatCommand* GetCommands() const {
	static ChatCommand ComTest[] = {
		{ "test",        	SEC_ADMINISTRATOR,	false, &HandleComTest,	"", NULL },
		{ NULL,             0,					false, NULL,			"", NULL } };
	return ComTest; }
};

void AddSc_Com_Test() {
   new com_test(); }