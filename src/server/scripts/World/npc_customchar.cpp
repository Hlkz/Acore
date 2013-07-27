#include "ScriptPCH.h"

class npc_customchar : public CreatureScript {
    public: npc_customchar() : CreatureScript("npc_customchar") {}

bool OnGossipHello(Player* player, Creature* creature) {
	MainMenu(player, creature);
	return true; }
		
void MainMenu(Player *player, Creature *creature) {
	player->ADD_GOSSIP_ITEM( 0, "Changement de nom" , GOSSIP_SENDER_MAIN, 1);
	player->ADD_GOSSIP_ITEM( 4, "Changement d'apparence" , GOSSIP_SENDER_MAIN, 2);
	player->ADD_GOSSIP_ITEM( 8, "Changement de race" , GOSSIP_SENDER_MAIN, 3);
	player->ADD_GOSSIP_ITEM( 9, "Changement de faction" , GOSSIP_SENDER_MAIN, 5);
	player->SEND_GOSSIP_MENU(1000012, creature->GetGUID()); }

bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) {
	player->PlayerTalkClass->ClearMenus();

		switch (action) {
		
	case 9: MainMenu(player, creature); break;
	
	case 5:
		player->ADD_GOSSIP_ITEM( 4, "Confirmation" , GOSSIP_SENDER_MAIN, 4);
		player->ADD_GOSSIP_ITEM( 0, "<Retour>" , GOSSIP_SENDER_MAIN, 9);
		player->SEND_GOSSIP_MENU(1000013, creature->GetGUID());
		break;
		
	case 1:
		player->CLOSE_GOSSIP_MENU();
		player->SetAtLoginFlag(AT_LOGIN_RENAME);
		player->PlayDirectSound(13838);
		creature->MonsterWhisper("Un changement de nom vous sera proposé à votre prochaine reconnexion.", player->GetGUID());
		break;
	case 2:
		player->CLOSE_GOSSIP_MENU();
		player->SetAtLoginFlag(AT_LOGIN_CUSTOMIZE);
		player->PlayDirectSound(13838);
		creature->MonsterWhisper("Un changement d'apparence vous sera proposé à votre prochaine reconnexion.", player->GetGUID());
		break;
	case 3:
		player->CLOSE_GOSSIP_MENU();
		player->SetAtLoginFlag(AT_LOGIN_CHANGE_RACE);
		player->PlayDirectSound(13838);
		creature->MonsterWhisper("Un changement de race vous sera proposé à votre prochaine reconnexion.", player->GetGUID());
		break;
	case 4:
		player->CLOSE_GOSSIP_MENU();
		player->SetAtLoginFlag(AT_LOGIN_CHANGE_FACTION);
		player->PlayDirectSound(13838);
		creature->MonsterWhisper("Un changement de faction vous sera proposé à votre prochaine reconnexion.", player->GetGUID());
		break;

		}
    return true; }
};

void AddSc_npc_customchar() {
    new npc_customchar; }