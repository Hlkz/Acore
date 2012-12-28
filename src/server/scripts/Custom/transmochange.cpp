#include "ScriptPCH.h"

class transmochange : public CreatureScript {
	public: transmochange() : CreatureScript("transmochange"){}
	

void MainMenu(Player *player, Creature *creature) {
	player->ADD_GOSSIP_ITEM(7, "Cachets hakkari...", GOSSIP_SENDER_MAIN, 3);
	player->ADD_GOSSIP_ITEM(7, "Insignes de justice...", GOSSIP_SENDER_MAIN, 4);
	player->ADD_GOSSIP_ITEM(7, "Marques d'honneur...", GOSSIP_SENDER_MAIN, 5);
	player->ADD_GOSSIP_ITEM(7, "Points d'arène...", GOSSIP_SENDER_MAIN, 6);
	player->ADD_GOSSIP_ITEM(7, "Trophées valeureux...", GOSSIP_SENDER_MAIN, 7);
	player->ADD_GOSSIP_ITEM(0, "<Aurevoir>", GOSSIP_SENDER_MAIN, 0);
	player->SEND_GOSSIP_MENU(1000021, creature->GetGUID()); }

bool OnGossipHello(Player *player, Creature * creature) { MainMenu(player, creature); return true; }
	
bool OnGossipSelect(Player *player, Creature * creature, uint32 sender, uint32 action) {
WorldSession* session = player->GetSession();
player->PlayerTalkClass->ClearMenus();

		switch (action){
	
	case 0: player->CLOSE_GOSSIP_MENU(); break;
	
	case 1: MainMenu(player, creature); break;

    case 3:
        player->ADD_GOSSIP_ITEM(1, "Acheter 5 emblèmes pour 1 Cachet hakkari conservé", GOSSIP_SENDER_MAIN, 30);
        player->ADD_GOSSIP_ITEM(1, "Acheter 10 emblèmes pour 2 Cachet hakkari conservé", GOSSIP_SENDER_MAIN, 31);
        player->ADD_GOSSIP_ITEM(1, "Acheter 50 emblèmes pour 10 Cachet hakkari conservé", GOSSIP_SENDER_MAIN, 32);
        player->ADD_GOSSIP_ITEM(0, "<Retour>", GOSSIP_SENDER_MAIN, 1);
        player->SEND_GOSSIP_MENU(1000021, creature->GetGUID());
		break;
	case 30:
		if (player->HasItemCount(39715, 1, 0)) {
			player->DestroyItemCount(39715, 1, true, false);
			player->AddItem(40752, 5);
			session->SendAreaTriggerMessage("Vous avez reçu 5 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 3);
		break;
	case 31:
		if (player->HasItemCount(39715, 2, 0)) {
			player->DestroyItemCount(39715, 2, true, false);
			player->AddItem(40752, 10);
			session->SendAreaTriggerMessage("Vous avez reçu 10 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 3);
		break;
	case 32:
		if (player->HasItemCount(39715, 10, 0)) {
			player->DestroyItemCount(39715, 10, true, false);
			player->AddItem(40752, 50);
			session->SendAreaTriggerMessage("Vous avez reçu 50 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 3);
		break;
		
    case 4:
        player->ADD_GOSSIP_ITEM(1, "Acheter 5 emblèmes pour 10 insignes", GOSSIP_SENDER_MAIN, 40);
        player->ADD_GOSSIP_ITEM(1, "Acheter 10 emblèmes pour 20 insignes", GOSSIP_SENDER_MAIN, 41);
        player->ADD_GOSSIP_ITEM(1, "Acheter 50 emblèmes pour 100 insignes", GOSSIP_SENDER_MAIN, 42);
        player->ADD_GOSSIP_ITEM(0, "<Retour>", GOSSIP_SENDER_MAIN, 1);
        player->SEND_GOSSIP_MENU(1000021, creature->GetGUID());
		break;
	case 40:
		if (player->HasItemCount(29434, 10, 0)) {
			player->DestroyItemCount(29434, 10, true, false);
			player->AddItem(40752, 5);
			session->SendAreaTriggerMessage("Vous avez reçu 5 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 4);
		break;
	case 41:
		if (player->HasItemCount(29434, 20, 0)) {
			player->DestroyItemCount(29434, 20, true, false);
			player->AddItem(40752, 10);
			session->SendAreaTriggerMessage("Vous avez reçu 10 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 4);
		break;
	case 42:
		if (player->HasItemCount(29434, 100, 0)) {
			player->DestroyItemCount(29434, 100, true, false);
			player->AddItem(40752, 50);
			session->SendAreaTriggerMessage("Vous avez reçu 50 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 4);
		break;
		
    case 5:
        player->ADD_GOSSIP_ITEM(1, "Acheter 5 emblèmes pour 2 marque du Goulet", GOSSIP_SENDER_MAIN, 50);
        player->ADD_GOSSIP_ITEM(1, "Acheter 10 emblèmes pour 4 marque du Goulet", GOSSIP_SENDER_MAIN, 51);
        player->ADD_GOSSIP_ITEM(1, "Acheter 50 emblèmes pour 20 marque du Goulet", GOSSIP_SENDER_MAIN, 52);
        player->ADD_GOSSIP_ITEM(1, "Acheter 5 emblèmes pour 2 marque du Bassin", GOSSIP_SENDER_MAIN, 53);
        player->ADD_GOSSIP_ITEM(1, "Acheter 10 emblèmes pour 4 marque du Bassin", GOSSIP_SENDER_MAIN, 54);
        player->ADD_GOSSIP_ITEM(1, "Acheter 50 emblèmes pour 20 marque du Bassin", GOSSIP_SENDER_MAIN, 55);
        player->ADD_GOSSIP_ITEM(0, "<Retour>", GOSSIP_SENDER_MAIN, 1);
        player->SEND_GOSSIP_MENU(1000021, creature->GetGUID());
		break;
	case 50:
		if (player->HasItemCount(20558, 2, 0)) {
			player->DestroyItemCount(20558, 2, true, false);
			player->AddItem(40752, 5);
			session->SendAreaTriggerMessage("Vous avez reçu 5 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 5);
		break;
	case 51:
		if (player->HasItemCount(20558, 4, 0)) {
			player->DestroyItemCount(20558, 4, true, false);
			player->AddItem(40752, 10);
			session->SendAreaTriggerMessage("Vous avez reçu 10 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 5);
		break;
	case 52:
		if (player->HasItemCount(20558, 20, 0)) {
			player->DestroyItemCount(20558, 20, true, false);
			player->AddItem(40752, 50);
			session->SendAreaTriggerMessage("Vous avez reçu 50 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 5);
		break;
	case 53:
		if (player->HasItemCount(20559, 2, 0)) {
			player->DestroyItemCount(20559, 2, true, false);
			player->AddItem(40752, 5);
			session->SendAreaTriggerMessage("Vous avez reçu 5 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 5);
		break;
	case 54:
		if (player->HasItemCount(20559, 4, 0)) {
			player->DestroyItemCount(20559, 4, true, false);
			player->AddItem(40752, 10);
			session->SendAreaTriggerMessage("Vous avez reçu 10 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 5);
		break;
	case 55:
		if (player->HasItemCount(20559, 20, 0)) {
			player->DestroyItemCount(20559, 20, true, false);
			player->AddItem(40752, 50);
			session->SendAreaTriggerMessage("Vous avez reçu 50 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 5);
		break;
		
    case 6:
        player->ADD_GOSSIP_ITEM(1, "Acheter 5 emblèmes pour 25 points d'arène", GOSSIP_SENDER_MAIN, 60);
        player->ADD_GOSSIP_ITEM(1, "Acheter 10 emblèmes pour 50 points d'arène", GOSSIP_SENDER_MAIN, 61);
        player->ADD_GOSSIP_ITEM(1, "Acheter 50 emblèmes pour 250 points d'arène", GOSSIP_SENDER_MAIN, 62);
        player->ADD_GOSSIP_ITEM(0, "<Retour>", GOSSIP_SENDER_MAIN, 1);
        player->SEND_GOSSIP_MENU(1000021, creature->GetGUID());
		break;
	case 60:
		if (player->GetArenaPoints() >= 25) {
			player->SetArenaPoints(player->GetArenaPoints()-25);
			player->AddItem(40752, 5);
			session->SendAreaTriggerMessage("Vous avez reçu 5 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 6);
		break;
	case 61:
		if (player->GetArenaPoints() >= 50) {
			player->SetArenaPoints(player->GetArenaPoints()-50);
			player->AddItem(40752, 10);
			session->SendAreaTriggerMessage("Vous avez reçu 10 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 6);
		break;
	case 62:
		if (player->GetArenaPoints() >= 250) {
			player->SetArenaPoints(player->GetArenaPoints()-250);
			player->AddItem(40752, 50);
			session->SendAreaTriggerMessage("Vous avez reçu 50 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 6);
		break;
		
    case 7:
        player->ADD_GOSSIP_ITEM(1, "Acheter 5 emblèmes pour 1 trophée valeureux", GOSSIP_SENDER_MAIN, 70);
        player->ADD_GOSSIP_ITEM(1, "Acheter 10 emblèmes pour 2 trophée valeureux", GOSSIP_SENDER_MAIN, 71);
        player->ADD_GOSSIP_ITEM(1, "Acheter 50 emblèmes pour 10 trophée valeureux", GOSSIP_SENDER_MAIN, 72);
        player->ADD_GOSSIP_ITEM(0, "<Retour>", GOSSIP_SENDER_MAIN, 1);
        player->SEND_GOSSIP_MENU(1000021, creature->GetGUID());
		break;
	case 70:
		if (player->HasItemCount(4193, 1, 0)) {
			player->DestroyItemCount(4193, 1, true, false);
			player->AddItem(40752, 5);
			session->SendAreaTriggerMessage("Vous avez reçu 5 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 7);
		break;
	case 71:
		if (player->HasItemCount(4193, 2, 0)) {
			player->DestroyItemCount(4193, 2, true, false);
			player->AddItem(40752, 10);
			session->SendAreaTriggerMessage("Vous avez reçu 10 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 7);
		break;
	case 72:
		if (player->HasItemCount(4193, 10, 0)) {
			player->DestroyItemCount(4193, 10, true, false);
			player->AddItem(40752, 50);
			session->SendAreaTriggerMessage("Vous avez reçu 50 emblèmes."); }
		else session->SendNotification("Vous n'avez pas les objets requis.");
		OnGossipSelect(player, creature, sender, 7);
		break;

		}
	return true; }
};

void AddSc_transmochange() {
	new transmochange(); }