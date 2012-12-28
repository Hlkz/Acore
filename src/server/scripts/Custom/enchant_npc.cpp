#include "ScriptPCH.h"

class enchant_npc : public CreatureScript {
public: enchant_npc() : CreatureScript("enchant_npc") {}

bool OnGossipHello(Player *player, Creature * creature) {
	MainMenu(player, creature);
    return true; }

void MainMenu(Player *player, Creature *creature) {
		player->SetClmSlty(0);
        player->ADD_GOSSIP_ITEM(0, "Dos", GOSSIP_SENDER_MAIN, 14);
        player->ADD_GOSSIP_ITEM(0, "Torse", GOSSIP_SENDER_MAIN, 4);
        player->ADD_GOSSIP_ITEM(0, "Poignets", GOSSIP_SENDER_MAIN, 8);
        player->ADD_GOSSIP_ITEM(0, "Mains", GOSSIP_SENDER_MAIN, 9);
        Item *item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, 6); if(item)
        player->ADD_GOSSIP_ITEM(0, "Jambes : Renfort d'armure épais", GOSSIP_SENDER_MAIN, 6);
        player->ADD_GOSSIP_ITEM(0, "Pieds", GOSSIP_SENDER_MAIN, 7);
        player->ADD_GOSSIP_ITEM(0, "Main droite", GOSSIP_SENDER_MAIN, 15);		
        item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, 16); if(item) {
		if(item->GetTemplate()->SubClass == 6)	player->ADD_GOSSIP_ITEM(0, "Bouclier", GOSSIP_SENDER_MAIN, 18);
        else { if(item->GetTemplate()->Class != 4) player->ADD_GOSSIP_ITEM(0, "Main gauche", GOSSIP_SENDER_MAIN, 16); } }
        item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, 17); if(item) {
		if((item->GetTemplate()->SubClass == 2) || (item->GetTemplate()->SubClass == 3) || (item->GetTemplate()->SubClass == 18))
			player->ADD_GOSSIP_ITEM(0, "A distance : lunette mortelle", GOSSIP_SENDER_MAIN, 17); }
		player->SEND_GOSSIP_MENU(20003, creature->GetGUID()); }

void Ench(Player *player, Creature *creature, uint32 slotid, uint32 enchid, uint32 twoha, uint32 requil, uint32 slty) {
	Item *item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slotid);
	
	if(!item) {
		creature->MonsterWhisper("Vous devez vous équiper de l'objet.", player->GetGUID());
		MainMenu(player, creature);
        return; }
    if (requil == 1 && item->GetTemplate()->ItemLevel <= 34) {
		creature->MonsterWhisper("L'objet n'est pas d'un niveau suffisant.", player->GetGUID());
		MainMenu(player, creature);
        return; }
    if (twoha == 1 && item->GetTemplate()->InventoryType != 17) {
		creature->MonsterWhisper("Cette enchantement requiert une arme à deux mains.", player->GetGUID());
		MainMenu(player, creature);
        return; }
	if (slotid == 16) {
	if ((item->GetTemplate()->Class == 4) && (item->GetTemplate()->SubClass != 6)) {
		creature->MonsterWhisper("Je n'enchante pas ce genre d'objets.", player->GetGUID());
		player->CLOSE_GOSSIP_MENU();
        return; }
	if(item->GetTemplate()->SubClass == 6 && slty == 1) {
		creature->MonsterWhisper("Un enchantement d'arme ne va pas sur un bouclier.", player->GetGUID());
		player->CLOSE_GOSSIP_MENU();
		return; }
	if(item->GetTemplate()->SubClass != 6 && slty == 0) {
		creature->MonsterWhisper("Un enchantement de bouclier ne va pas sur ce type d'arme.", player->GetGUID());
		player->CLOSE_GOSSIP_MENU();
		return; } }
	SpellItemEnchantmentEntry const* enchant_id = sSpellItemEnchantmentStore.LookupEntry(enchid);
	if (!enchant_id) {
		creature->MonsterWhisper("L'enchantement sélectionné n'est pas un enchantement, prévenez un administrateur.", player->GetGUID());
		player->CLOSE_GOSSIP_MENU();
        return; }
	player->ApplyEnchantment(item, PERM_ENCHANTMENT_SLOT, false);
	item->SetEnchantment(PERM_ENCHANTMENT_SLOT, enchid, 0, 0);
	player->ApplyEnchantment(item, PERM_ENCHANTMENT_SLOT, true);
	MainMenu(player, creature); }

bool OnGossipSelect(Player *player, Creature * creature, uint32 sender, uint32 action) {
    player->PlayerTalkClass->ClearMenus();

		switch (action) {
	
	case 100:	MainMenu(player, creature);	break;

// Dos
	case 14:
		player->ADD_GOSSIP_ITEM(3, "70 armure", GOSSIP_SENDER_MAIN, 1412);
		player->ADD_GOSSIP_ITEM(3, "120 armure", GOSSIP_SENDER_MAIN, 1407);
		player->ADD_GOSSIP_ITEM(3, "5 résistances", GOSSIP_SENDER_MAIN, 1413);
		player->ADD_GOSSIP_ITEM(3, "7 résistances", GOSSIP_SENDER_MAIN, 1408);
		player->ADD_GOSSIP_ITEM(3, "12 agilité", GOSSIP_SENDER_MAIN, 1401);
		player->ADD_GOSSIP_ITEM(3, "12 esquive", GOSSIP_SENDER_MAIN, 1406);
		player->ADD_GOSSIP_ITEM(3, "12 défense", GOSSIP_SENDER_MAIN, 1411);
		player->ADD_GOSSIP_ITEM(3, "20 pénétration des sorts", GOSSIP_SENDER_MAIN, 1409);
		player->ADD_GOSSIP_ITEM(3, "10 résistance ombre", GOSSIP_SENDER_MAIN, 1404);
		player->ADD_GOSSIP_ITEM(3, "15 résistance ombre", GOSSIP_SENDER_MAIN, 1403);
		player->ADD_GOSSIP_ITEM(3, "15 résistance feu", GOSSIP_SENDER_MAIN, 1405);
		player->ADD_GOSSIP_ITEM(3, "15 résistance arcane", GOSSIP_SENDER_MAIN, 1410);
		player->ADD_GOSSIP_ITEM(3, "15 résistance nature", GOSSIP_SENDER_MAIN, 1400);
		player->ADD_GOSSIP_ITEM(3, "camouflage", GOSSIP_SENDER_MAIN, 1402);
		player->ADD_GOSSIP_ITEM(0, "=> Retour", GOSSIP_SENDER_MAIN, 100);
		player->SEND_GOSSIP_MENU(20004, creature->GetGUID());
		break;
	case 1400:	Ench(player, creature, 14, 1395, 0, 0, 0);	break;
	case 1401:	Ench(player, creature, 14, 368, 0, 1, 0);	break;
	case 1402:	Ench(player, creature, 14, 910, 0, 0, 0);	break;
	case 1403:	Ench(player, creature, 14, 1441, 0, 1, 0);	break;
	case 1404:	Ench(player, creature, 14, 804, 0, 0, 0);	break;
	case 1405:	Ench(player, creature, 14, 1349, 0, 0, 0);	break;
	case 1406:	Ench(player, creature, 14, 2078, 0, 0, 0);	break;
	case 1407:	Ench(player, creature, 14, 2662, 0, 1, 0);	break;
	case 1408:	Ench(player, creature, 14, 2663, 0, 1, 0);	break;
	case 1409:	Ench(player, creature, 14, 2780, 0, 1, 0);	break;
	case 1410:	Ench(player, creature, 14, 1257, 0, 1, 0);	break;
	case 1411:	Ench(player, creature, 14, 1943, 0, 1, 0);	break;
	case 1412:	Ench(player, creature, 14, 1889, 0, 0, 0);	break;
	case 1413:	Ench(player, creature, 14, 1888, 0, 0, 0);	break;
		
// Torse
	case 4:
		player->ADD_GOSSIP_ITEM(3, "100 vie", GOSSIP_SENDER_MAIN, 402);
		player->ADD_GOSSIP_ITEM(3, "100 mana", GOSSIP_SENDER_MAIN, 403);
		player->ADD_GOSSIP_ITEM(3, "150 vie", GOSSIP_SENDER_MAIN, 401);
		player->ADD_GOSSIP_ITEM(3, "4 caracteristiques", GOSSIP_SENDER_MAIN, 404);
		player->ADD_GOSSIP_ITEM(3, "6 caracteristiques", GOSSIP_SENDER_MAIN, 400);
		player->ADD_GOSSIP_ITEM(3, "7 mana par 5 secondes", GOSSIP_SENDER_MAIN, 405);
		player->ADD_GOSSIP_ITEM(3, "15 résilience", GOSSIP_SENDER_MAIN, 406);
		player->ADD_GOSSIP_ITEM(3, "15 esprit", GOSSIP_SENDER_MAIN, 407);
		player->ADD_GOSSIP_ITEM(0, "=> Retour", GOSSIP_SENDER_MAIN, 100);
		player->SEND_GOSSIP_MENU(20005, creature->GetGUID());
		break;
	case 400:	Ench(player, creature, 4, 2661, 0, 1, 0);	break;
	case 401:	Ench(player, creature, 4, 2659, 0, 1, 0);	break;
	case 402:	Ench(player, creature, 4, 1892, 0, 0, 0);	break;
	case 403:	Ench(player, creature, 4, 1893, 0, 0, 0);	break;
	case 404:	Ench(player, creature, 4, 1891, 0, 0, 0);	break;
	case 405:	Ench(player, creature, 4, 2852, 0, 1, 0);	break;
	case 406:	Ench(player, creature, 4, 2789, 0, 1, 0);	break;
	case 407:	Ench(player, creature, 4, 1144, 0, 1, 0);	break;
  
// Bras
	case 8:
		player->ADD_GOSSIP_ITEM(3, "12 endurance", GOSSIP_SENDER_MAIN, 805);
		player->ADD_GOSSIP_ITEM(3, "12 intelligence", GOSSIP_SENDER_MAIN, 806);
		player->ADD_GOSSIP_ITEM(3, "12 force", GOSSIP_SENDER_MAIN, 801);
		player->ADD_GOSSIP_ITEM(3, "24 puissance d'attaque", GOSSIP_SENDER_MAIN, 807);
		player->ADD_GOSSIP_ITEM(3, "15 puissance des sorts", GOSSIP_SENDER_MAIN, 800);
		player->ADD_GOSSIP_ITEM(3, "4 caracteristiques", GOSSIP_SENDER_MAIN, 802);
		player->ADD_GOSSIP_ITEM(3, "9 esprit", GOSSIP_SENDER_MAIN, 808);
		player->ADD_GOSSIP_ITEM(3, "12 défense", GOSSIP_SENDER_MAIN, 803);
		player->ADD_GOSSIP_ITEM(3, "8 mana par les 5 secondes", GOSSIP_SENDER_MAIN, 804);
		player->ADD_GOSSIP_ITEM(0, "=> Retour", GOSSIP_SENDER_MAIN, 100);
		player->SEND_GOSSIP_MENU(20006, creature->GetGUID());
		break;
	case 800:	Ench(player, creature, 8, 2319, 0, 0, 0);	break;
	case 801:	Ench(player, creature, 8, 372, 0, 1, 0);	break;
	case 802:	Ench(player, creature, 8, 1891, 0, 1, 0);	break;
	case 803:	Ench(player, creature, 8, 1943, 0, 1, 0);	break;
	case 804:	Ench(player, creature, 8, 2382, 0, 1, 0);	break;
	case 805:	Ench(player, creature, 8, 371, 0, 1, 0);	break;
	case 806:	Ench(player, creature, 8, 369, 0, 1, 0);	break;
	case 807:	Ench(player, creature, 8, 1593, 0, 1, 0);	break;
	case 808:	Ench(player, creature, 8, 355, 0, 0, 0);	break;

// Mains
	case 9:
		player->ADD_GOSSIP_ITEM(3, "15 force", GOSSIP_SENDER_MAIN, 904);
		player->ADD_GOSSIP_ITEM(3, "15 agilité", GOSSIP_SENDER_MAIN, 901);
		player->ADD_GOSSIP_ITEM(3, "15 toucher", GOSSIP_SENDER_MAIN, 903);
		player->ADD_GOSSIP_ITEM(3, "10 critique", GOSSIP_SENDER_MAIN, 902);
		player->ADD_GOSSIP_ITEM(3, "26 puissance d'attaque", GOSSIP_SENDER_MAIN, 905);
		player->ADD_GOSSIP_ITEM(3, "20 puissance des sorts", GOSSIP_SENDER_MAIN, 906);
		player->ADD_GOSSIP_ITEM(3, "10 hâte", GOSSIP_SENDER_MAIN, 907);
		player->ADD_GOSSIP_ITEM(3, "2% vitesse monture", GOSSIP_SENDER_MAIN, 908);
		player->ADD_GOSSIP_ITEM(3, "5 pêche", GOSSIP_SENDER_MAIN, 900);
		player->ADD_GOSSIP_ITEM(0, "=> Retour", GOSSIP_SENDER_MAIN, 100);
		player->SEND_GOSSIP_MENU(20007, creature->GetGUID());
		break;
	case 900:	Ench(player, creature, 9, 846, 0, 0, 0);	break;
	case 901:	Ench(player, creature, 9, 883, 0, 0, 0);	break;
	case 902:	Ench(player, creature, 9, 2934, 0, 1, 0);	break;
	case 903:	Ench(player, creature, 9, 2935, 0, 1, 0);	break;
	case 904:	Ench(player, creature, 9, 684, 0, 1, 0);	break;
	case 905:	Ench(player, creature, 9, 1594, 0, 1, 0);	break;
	case 906:	Ench(player, creature, 9, 2323, 0, 1, 0);	break;
	case 907:	Ench(player, creature, 9, 931, 0, 0, 0);	break;
	case 908:	Ench(player, creature, 9, 930, 0, 0, 0);	break;

// Jambes
	case 6:	Ench(player, creature, 6, 18, 0, 0, 0);	break;

// Bottes
	case 7:
		player->ADD_GOSSIP_ITEM(3, "12 endurance", GOSSIP_SENDER_MAIN, 701);
		player->ADD_GOSSIP_ITEM(3, "12 agilité", GOSSIP_SENDER_MAIN, 704);
		player->ADD_GOSSIP_ITEM(3, "9 endurance + vitesse mineur", GOSSIP_SENDER_MAIN, 703);
		player->ADD_GOSSIP_ITEM(3, "6 agilité + vitesse mineur", GOSSIP_SENDER_MAIN, 705);
		player->ADD_GOSSIP_ITEM(3, "5 vie et mana par 5 secondes", GOSSIP_SENDER_MAIN, 700);
		player->ADD_GOSSIP_ITEM(3, "10 toucher et critique", GOSSIP_SENDER_MAIN, 702);
		player->ADD_GOSSIP_ITEM(3, "5 toucher", GOSSIP_SENDER_MAIN, 706);
		player->ADD_GOSSIP_ITEM(0, "=> Retour", GOSSIP_SENDER_MAIN, 100);
		player->SEND_GOSSIP_MENU(20008, creature->GetGUID());
		break;
	case 700:	Ench(player, creature, 7, 2656, 0, 1, 0);	break;
	case 701:	Ench(player, creature, 7, 371, 0, 1, 0);	break;
	case 702:	Ench(player, creature, 7, 2658, 0, 1, 0);	break;
	case 703:	Ench(player, creature, 7, 2940, 0, 1, 0);	break;
	case 704:	Ench(player, creature, 7, 368, 0, 1, 0);	break;
	case 705:	Ench(player, creature, 7, 2939, 0, 1, 0);	break;
	case 706:	Ench(player, creature, 7, 3858, 0, 0, 0);	break;
		
// Armes
	case 15:	player->SetClmSlotid(15);	goto l16;	break;
	case 16:	player->SetClmSlotid(16);	l16:
	case 153:	player->SetClmSlty(1);
		player->ADD_GOSSIP_ITEM(0, "=> Page 2", GOSSIP_SENDER_MAIN, 154);
		player->ADD_GOSSIP_ITEM(3, "15 force", GOSSIP_SENDER_MAIN, 1502);
		player->ADD_GOSSIP_ITEM(3, "20 force", GOSSIP_SENDER_MAIN, 1508);
		player->ADD_GOSSIP_ITEM(3, "15 agilité", GOSSIP_SENDER_MAIN, 1503);
		player->ADD_GOSSIP_ITEM(3, "20 agilité", GOSSIP_SENDER_MAIN, 1517);
		player->ADD_GOSSIP_ITEM(3, "20 esprit", GOSSIP_SENDER_MAIN, 1504);
		player->ADD_GOSSIP_ITEM(3, "22 intelligence", GOSSIP_SENDER_MAIN, 1505);
		player->ADD_GOSSIP_ITEM(3, "30 intelligence", GOSSIP_SENDER_MAIN, 1507);
		player->ADD_GOSSIP_ITEM(3, "29 puissance des sorts", GOSSIP_SENDER_MAIN, 1516);
		player->ADD_GOSSIP_ITEM(3, "30 puissance des sorts", GOSSIP_SENDER_MAIN, 1501);
		player->ADD_GOSSIP_ITEM(3, "40 puissance des sorts (jaune)", GOSSIP_SENDER_MAIN, 1515);
		player->ADD_GOSSIP_ITEM(3, "40 puissance des sorts (blanc)", GOSSIP_SENDER_MAIN, 1509);
		player->ADD_GOSSIP_ITEM(3, "50 feu et arcanes", GOSSIP_SENDER_MAIN, 1510);
		player->ADD_GOSSIP_ITEM(3, "54 givre et ombre", GOSSIP_SENDER_MAIN, 1511);
		player->ADD_GOSSIP_ITEM(3, "5 dégâts de l'arme", GOSSIP_SENDER_MAIN, 1521);
		player->ADD_GOSSIP_ITEM(3, "7 dégâts de l'arme", GOSSIP_SENDER_MAIN, 1506);
		player->ADD_GOSSIP_ITEM(0, "=> Retour", GOSSIP_SENDER_MAIN, 100);
		player->SEND_GOSSIP_MENU(20009, creature->GetGUID());
		break;
	case 154:
		player->ADD_GOSSIP_ITEM(0, "Page 1 <=", GOSSIP_SENDER_MAIN, 153);
		player->ADD_GOSSIP_ITEM(3, "Croisé", GOSSIP_SENDER_MAIN, 1500);
		player->ADD_GOSSIP_ITEM(3, "Vol-de-vie", GOSSIP_SENDER_MAIN, 1518);
		player->ADD_GOSSIP_ITEM(3, "Impie", GOSSIP_SENDER_MAIN, 1519);
		player->ADD_GOSSIP_ITEM(3, "Flamboyante", GOSSIP_SENDER_MAIN, 1520);
		player->ADD_GOSSIP_ITEM(3, "Frisson glacial", GOSSIP_SENDER_MAIN, 1522);
		player->ADD_GOSSIP_ITEM(3, "Tueur de démons", GOSSIP_SENDER_MAIN, 1523);
		player->ADD_GOSSIP_ITEM(3, "Mangouste", GOSSIP_SENDER_MAIN, 1512);
		player->ADD_GOSSIP_ITEM(3, "Eruption de sort", GOSSIP_SENDER_MAIN, 1513);
		player->ADD_GOSSIP_ITEM(3, "Maître de guerre", GOSSIP_SENDER_MAIN, 1514);
		player->ADD_GOSSIP_ITEM(3, "2M - 25 agilité", GOSSIP_SENDER_MAIN, 1524);
		player->ADD_GOSSIP_ITEM(3, "2M - 70 puissance d'attaque", GOSSIP_SENDER_MAIN, 1525);
		player->ADD_GOSSIP_ITEM(3, "2M - 35 agilité", GOSSIP_SENDER_MAIN, 1526);
		player->ADD_GOSSIP_ITEM(3, "2M - 9 dégâts de l'arme", GOSSIP_SENDER_MAIN, 1527);
		player->ADD_GOSSIP_ITEM(0, "=> Retour", GOSSIP_SENDER_MAIN, 100);
		player->SEND_GOSSIP_MENU(20009, creature->GetGUID());
		break;
// 1M
	case 1500:	Ench(player, creature, player->GetClmSlotid(), 1900, 0, 0, player->GetClmSlty());	break;
	case 1501:	Ench(player, creature, player->GetClmSlotid(), 2504, 0, 0, player->GetClmSlty());	break;
	case 1502:	Ench(player, creature, player->GetClmSlotid(), 2563, 0, 0, player->GetClmSlty());	break;
	case 1503:	Ench(player, creature, player->GetClmSlotid(), 2564, 0, 0, player->GetClmSlty());	break;
	case 1504:	Ench(player, creature, player->GetClmSlotid(), 2567, 0, 0, player->GetClmSlty());	break;
	case 1505:	Ench(player, creature, player->GetClmSlotid(), 2568, 0, 0, player->GetClmSlty());	break;
	case 1506:	Ench(player, creature, player->GetClmSlotid(), 120, 0, 1, player->GetClmSlty());	break;
	case 1507:	Ench(player, creature, player->GetClmSlotid(), 2666, 0, 1, player->GetClmSlty());	break;
	case 1508:	Ench(player, creature, player->GetClmSlotid(), 2668, 0, 1, player->GetClmSlty());	break;
	case 1509:	Ench(player, creature, player->GetClmSlotid(), 2669, 0, 1, player->GetClmSlty());	break;
	case 1510:	Ench(player, creature, player->GetClmSlotid(), 2671, 0, 1, player->GetClmSlty());	break;
	case 1511:	Ench(player, creature, player->GetClmSlotid(), 2672, 0, 1, player->GetClmSlty());	break;
	case 1512:	Ench(player, creature, player->GetClmSlotid(), 2673, 0, 1, player->GetClmSlty());	break;
	case 1513:	Ench(player, creature, player->GetClmSlotid(), 2674, 0, 1, player->GetClmSlty());	break;
	case 1514:	Ench(player, creature, player->GetClmSlotid(), 2675, 0, 1, player->GetClmSlty());	break;
	case 1515:	Ench(player, creature, player->GetClmSlotid(), 3846, 0, 1, player->GetClmSlty());	break;
	case 1516:	Ench(player, creature, player->GetClmSlotid(), 2505, 0, 0, player->GetClmSlty());	break;
	case 1517:	Ench(player, creature, player->GetClmSlotid(), 3222, 0, 1, player->GetClmSlty());	break;
	case 1518:	Ench(player, creature, player->GetClmSlotid(), 1898, 0, 0, player->GetClmSlty());	break;
	case 1519:	Ench(player, creature, player->GetClmSlotid(), 1899, 0, 0, player->GetClmSlty());	break;
	case 1520:	Ench(player, creature, player->GetClmSlotid(), 803, 0, 0, player->GetClmSlty());	break;
	case 1521:	Ench(player, creature, player->GetClmSlotid(), 118, 0, 0, player->GetClmSlty());	break;
	case 1522:	Ench(player, creature, player->GetClmSlotid(), 1894, 0, 0, player->GetClmSlty());	break;
	case 1523:	Ench(player, creature, player->GetClmSlotid(), 912, 0, 0, player->GetClmSlty());	break;
// 2M
	case 1524:	Ench(player, creature, player->GetClmSlotid(), 2646, 1, 0, player->GetClmSlty());	break;
	case 1525:	Ench(player, creature, player->GetClmSlotid(), 2667, 1, 1, player->GetClmSlty());	break;
	case 1526:	Ench(player, creature, player->GetClmSlotid(), 2670, 1, 1, player->GetClmSlty());	break;
	case 1527:	Ench(player, creature, player->GetClmSlotid(), 1895, 1, 0, player->GetClmSlty());	break;

// Boucliers
	case 18:
		player->ADD_GOSSIP_ITEM(3, "18 endurance", GOSSIP_SENDER_MAIN, 1803);
		player->ADD_GOSSIP_ITEM(3, "12 inteligence", GOSSIP_SENDER_MAIN, 1804);
		player->ADD_GOSSIP_ITEM(3, "12 résilience", GOSSIP_SENDER_MAIN, 1800);
		player->ADD_GOSSIP_ITEM(3, "36 valeur de blacage", GOSSIP_SENDER_MAIN, 1801);
		player->ADD_GOSSIP_ITEM(3, "15 score de blocage", GOSSIP_SENDER_MAIN, 1802);
		player->ADD_GOSSIP_ITEM(3, "5 à toutes les résistances", GOSSIP_SENDER_MAIN, 1805);
		player->ADD_GOSSIP_ITEM(0, "=> Retour", GOSSIP_SENDER_MAIN, 100);
		player->SEND_GOSSIP_MENU(20010, creature->GetGUID());
		break;
	case 1800:	Ench(player, creature, 16, 3229, 0, 1, player->GetClmSlty());	break;
	case 1801:	Ench(player, creature, 16, 2653, 0, 1, player->GetClmSlty());	break;
	case 1802:	Ench(player, creature, 16, 1985, 0, 1, player->GetClmSlty());	break;
	case 1803:	Ench(player, creature, 16, 1071, 0, 1, player->GetClmSlty());	break;
	case 1804:	Ench(player, creature, 16, 2654, 0, 1, player->GetClmSlty());	break;
	case 1805:	Ench(player, creature, 16, 1888, 0, 1, player->GetClmSlty());	break;
		
// Ranged
	case 17:	Ench(player, creature, 17, 663, 0, 0, 0);	break;
	
		}
	return true; }
};

void AddSc_enchant_npc() {
	new enchant_npc(); }