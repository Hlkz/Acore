#include "ScriptPCH.h"

class news_serv : public CreatureScript {
public: news_serv() : CreatureScript("news_serv")	{}

bool OnGossipHello(Player *player, Creature * creature) {
	MainMenu(player, creature);
    return true; }

void MainMenu(Player *player, Creature *creature) {
	player->ADD_GOSSIP_ITEM(0, "- Les commandes", GOSSIP_SENDER_MAIN, 1);
	player->ADD_GOSSIP_ITEM(0, "- Le PvP sauvage", GOSSIP_SENDER_MAIN, 2);
	player->ADD_GOSSIP_ITEM(0, "- Les zones FFA", GOSSIP_SENDER_MAIN, 5);
	player->ADD_GOSSIP_ITEM(0, "- Le PvE", GOSSIP_SENDER_MAIN, 4);
	player->ADD_GOSSIP_ITEM(0, "- Une ouverture au monde ?", GOSSIP_SENDER_MAIN, 7);
	player->ADD_GOSSIP_ITEM(0, "- Où sont les maîtres de classe ?", GOSSIP_SENDER_MAIN, 3);
	player->ADD_GOSSIP_ITEM(0, "- Récompenses", GOSSIP_SENDER_MAIN, 6);
	player->ADD_GOSSIP_ITEM(0, "- Royaume RP", GOSSIP_SENDER_MAIN, 8);
	player->ADD_GOSSIP_ITEM(0, "<Quitter>", GOSSIP_SENDER_MAIN, 10);
	player->SEND_GOSSIP_MENU(1000007, creature->GetGUID()); }

bool OnGossipSelect(Player *player, Creature * creature, uint32 sender, uint32 action) {
    player->PlayerTalkClass->ClearMenus();

switch (action) {

	case 100:	MainMenu(player, creature);	break;
	
	case 1:
    player->ADD_GOSSIP_ITEM(0, "Voici les commandes qui vous sont accessible :", GOSSIP_SENDER_MAIN, 1);
    player->ADD_GOSSIP_ITEM(0, ".talent : équivalent gratuit d'une réinitialisation des talents auprès d'un maître de classe.", GOSSIP_SENDER_MAIN, 1);
    player->ADD_GOSSIP_ITEM(0, ".arena : fenêtre d'inscription en file d'attente d'arène.", GOSSIP_SENDER_MAIN, 1);
    player->ADD_GOSSIP_ITEM(0, "<Retour>", GOSSIP_SENDER_MAIN, 100);
	player->SEND_GOSSIP_MENU(1000007, creature->GetGUID());
	break;
	case 2:
    player->ADD_GOSSIP_ITEM(0, "Actuellement il se déroule au Cratère d'Azshara, le téléporteur au centre de la zone shop peut vous y emmener. Nous prévoyons de le favoriser plus tard au sein meme de Karazhan. Certaines récompenses ne s'acquièrent qu'en tuant des joueurs de la faction adverse dans ces zones.", GOSSIP_SENDER_MAIN, 2);
    player->ADD_GOSSIP_ITEM(0, "<Retour>", GOSSIP_SENDER_MAIN, 100);
	player->SEND_GOSSIP_MENU(1000007, creature->GetGUID());
	break;
	case 3:
    player->ADD_GOSSIP_ITEM(0, "Il n'y en a pas. La bibliotèque 'Maître universel' vous ajoutera les rangs supérieurs des sorts débloqués avec vos talents. Elle pourra aussi vous enseigner la double spécialisation des talents. Il est possible de réinitialiser vos talents avec la commande .talent.", GOSSIP_SENDER_MAIN, 3);
    player->ADD_GOSSIP_ITEM(0, "<Retour>", GOSSIP_SENDER_MAIN, 100);
	player->SEND_GOSSIP_MENU(1000007, creature->GetGUID());
	break;
	case 4:
    player->ADD_GOSSIP_ITEM(0, "Les donjons du niveau sont en train d'être corrigés. Le système de donjon aléatoire est foncionnel. (à deux détails près) Plusieurs world boss séront prochainement appelés a survenir au Cratère et à Karazhan, les récompenses seront mises à jour.", GOSSIP_SENDER_MAIN, 4);
    player->ADD_GOSSIP_ITEM(0, "<Retour>", GOSSIP_SENDER_MAIN, 100);
	player->SEND_GOSSIP_MENU(1000007, creature->GetGUID());
	break;
	case 5:
    player->ADD_GOSSIP_ITEM(0, "Plusieurs zones FFA seront accessibles à tour de rôle. Qu'une seule a la fois. Elles seront ensuite améliorées, classées, supprimées pour certaines, et de nouvelles arriveront sans doutes plus tard. Tout cela en fonction de vos avis sur le forum)", GOSSIP_SENDER_MAIN, 5);
    player->ADD_GOSSIP_ITEM(0, "<Retour>", GOSSIP_SENDER_MAIN, 100);
	player->SEND_GOSSIP_MENU(1000007, creature->GetGUID());
	break;
	case 6:
    player->ADD_GOSSIP_ITEM(0, "Les récompenses d'honneur, arène, worldboss, FFA, journalières et boutiques sont et resteront distinctes les unes des autres. Chaque mois les titres pour les premiers en haut faits, arène et vh seront redistribués. De toutes les récompenses possible, la seule amélioration visible en termes de statistiques sera la vitesse des montures 100%. (vielle école, zhevra et destrier cramoisi) Une nouveauté : la transmogrification. Celle ci est universelle aux monnaies, en dehors des têtes qui seront elles séparées. Pas d'armes pour le moment.", GOSSIP_SENDER_MAIN, 6);
    player->ADD_GOSSIP_ITEM(0, "<Retour>", GOSSIP_SENDER_MAIN, 100);
	player->SEND_GOSSIP_MENU(1000007, creature->GetGUID());
	break;
	case 7:
    player->ADD_GOSSIP_ITEM(0, "Vous pouvez en tant que joueur sortir des zones personnalisées pour vous rendre en Azeroth. Cela semblait nécessaire, car comment oser priver wow de son univers ? Cependant, en combat, un joueur qui s'y sera aventuré n'aura aucun avantage sur les autres.", GOSSIP_SENDER_MAIN, 7);
    player->ADD_GOSSIP_ITEM(0, "<Retour>", GOSSIP_SENDER_MAIN, 100);
	player->SEND_GOSSIP_MENU(1000007, creature->GetGUID());
	break;
	case 8:
    player->ADD_GOSSIP_ITEM(0, "Le projet a été repris ! Un sondage est en cours sur le forum, nous avons besoin de vos avis.", GOSSIP_SENDER_MAIN, 7);
    player->ADD_GOSSIP_ITEM(0, "<Retour>", GOSSIP_SENDER_MAIN, 100);
	player->SEND_GOSSIP_MENU(1000007, creature->GetGUID());
	break;
	case 10:
	player->CLOSE_GOSSIP_MENU();
	break;
} return true; } };

void AddSc_News_Serv() {
new news_serv(); }