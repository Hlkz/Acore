#include "ScriptPCH.h"

class bienvenue : public CreatureScript {
public: bienvenue() : CreatureScript("bienvenue")	{}

bool OnGossipHello(Player *player, Creature * creature) {
	MainMenu(player, creature);
    return true; }

void MainMenu(Player *player, Creature *creature) {
	player->ADD_GOSSIP_ITEM(0, "De quelle menace parlez vous ?", GOSSIP_SENDER_MAIN, 1);
	player->SEND_GOSSIP_MENU(1000000, creature->GetGUID()); }

bool OnGossipSelect(Player *player, Creature * creature, uint32 sender, uint32 action) {
    player->PlayerTalkClass->ClearMenus();

switch (action) {
	case 1:
    player->ADD_GOSSIP_ITEM(0, "Qui sont-ils ? Comment fonctionne l'organisation ?", GOSSIP_SENDER_MAIN, 2);
	player->SEND_GOSSIP_MENU(1000001, creature->GetGUID());
	break;
	case 2:
	player->ADD_GOSSIP_ITEM(0, "Au revoir...", GOSSIP_SENDER_MAIN, 3);
	player->SEND_GOSSIP_MENU(1000002, creature->GetGUID());
	break;
	case 3:
	player->CLOSE_GOSSIP_MENU();
	break;
} return true; } };

void AddSc_Bienvenue() {
new bienvenue(); }