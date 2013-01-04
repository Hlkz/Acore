#include "ScriptPCH.h"

class rand_item : public CreatureScript {
public: rand_item() : CreatureScript("rand_item") {}

uint32 count; std::string* rie;

int32 Choix(int32 item_id, int choix) {
    ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(item_id);
    if (!itemProto) return 0;
    if ((!itemProto->RandomProperty) && (!itemProto->RandomSuffix)) return 0;
    if ((itemProto->RandomProperty) && (itemProto->RandomSuffix)) return 0;
    if (itemProto->RandomProperty) {
        uint32 randomPropId = choix;
        ItemRandomPropertiesEntry const* random_id = sItemRandomPropertiesStore.LookupEntry(randomPropId);
        if (!random_id) return 0;
        return random_id->ID; }
    else {
        uint32 randomPropId = choix;
        ItemRandomSuffixEntry const* random_id = sItemRandomSuffixStore.LookupEntry(randomPropId);
        if (!random_id) return 0;
        return -int32(random_id->ID); } }

void AddItemChoix(Player *player, uint32 item_id, int choix) {
    uint32 noSpaceForCount = 0;
    ItemPosCountVec dest;
    InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, item_id, 1, &noSpaceForCount);
    if (msg != EQUIP_ERR_OK)
    if (dest.empty()) {
		ChatHandler(player->GetSession()).PSendSysMessage("Vous n'avez plus de place.");
        return; }
		Item* item = player->StoreNewItem(dest, item_id, true, Choix(item_id, choix));
		if (item) player->SendNewItem(item, 1, true, false);
    return; }

void MainMenu(Player *player, Creature *creature) {
	WorldSession* session = player->GetSession();
	player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12050), GOSSIP_SENDER_MAIN, 300);
	player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12051), GOSSIP_SENDER_MAIN, 400);
	player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12052), GOSSIP_SENDER_MAIN, 500);
	player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12053), GOSSIP_SENDER_MAIN, 600);
	player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12054), GOSSIP_SENDER_MAIN, 200);
	player->SEND_GOSSIP_MENU(1000023, creature->GetGUID()); }
	
bool OnGossipHello(Player *player, Creature * creature) { MainMenu(player, creature); return true; }
	
bool OnGossipSelect(Player *player, Creature * creature, uint32 sender, uint32 action) {
    player->PlayerTalkClass->ClearMenus();
	WorldSession* session = player->GetSession();

		switch (action) {
	
	case 100: MainMenu(player, creature); break;

	case 101: player->CLOSE_GOSSIP_MENU(); break;
		
    case 200:
        player->SetRandRetour(action);
        player->ADD_GOSSIP_ITEM(6, "Chevalière d'aigue marine (Ring)", GOSSIP_SENDER_MAIN, 156);
        player->ADD_GOSSIP_ITEM(6, "Lentille verte (Engi head)", GOSSIP_SENDER_MAIN, 158);
        player->ADD_GOSSIP_ITEM(6, "Cape de tulle (Cloak)", GOSSIP_SENDER_MAIN, 202);
        player->ADD_GOSSIP_ITEM(6, "Cape de champion (Cloak)", GOSSIP_SENDER_MAIN, 203);
        player->ADD_GOSSIP_ITEM(6, "Cape de cabaliste (Cloak)", GOSSIP_SENDER_MAIN, 204);
        player->ADD_GOSSIP_ITEM(6, "Kriss sacrificiel (Dagger)", GOSSIP_SENDER_MAIN, 211);
        player->ADD_GOSSIP_ITEM(6, "Targe inebranlable (Shield)", GOSSIP_SENDER_MAIN, 208);
        player->ADD_GOSSIP_ITEM(6, "Carabine de precision (Gun)", GOSSIP_SENDER_MAIN, 209);
        player->ADD_GOSSIP_ITEM(6, "Sphère de sorcier (Off-hand)", GOSSIP_SENDER_MAIN, 212);
        player->ADD_GOSSIP_ITEM(6, "Baguette de braise.", GOSSIP_SENDER_MAIN, 210);
		player->ADD_GOSSIP_ITEM(20, session->GetTrinityString(12041), GOSSIP_SENDER_MAIN, 100);
        player->SEND_GOSSIP_MENU(1000023, creature->GetGUID());
		break;
	    case 156: player->SetRandItId(20964); goto l276276; break;
	    case 158: player->SetRandItId(10504); goto l276276; break;
	    case 202: player->SetRandItId(7524); goto l276276; break;
	    case 203: player->SetRandItId(7544); goto l276276; break;
	    case 204: player->SetRandItId(7533); goto l276276; break;;
	    case 211: player->SetRandItId(3187); goto l276276; break;
	    case 208: player->SetRandItId(15592); goto l276276; break;
	    case 209: player->SetRandItId(3430); goto l276276; break;
	    case 212: player->SetRandItId(9882); goto l276276; break;
	    case 210: player->SetRandItId(5215); goto l276276; break;

    case 300: // Sac
        player->SetRandRetour(action);
        player->ADD_GOSSIP_ITEM(6, "Collier tumultueux (Neck)", GOSSIP_SENDER_MAIN, 306);
        player->ADD_GOSSIP_ITEM(6, "Anneau tumultueux (Ring)", GOSSIP_SENDER_MAIN, 310);
        player->ADD_GOSSIP_ITEM(6, "Cape tumultueuse (Cloak)", GOSSIP_SENDER_MAIN, 302);
        player->ADD_GOSSIP_ITEM(6, "Protège-mains dénombrés (Hands)", GOSSIP_SENDER_MAIN, 304);
        player->ADD_GOSSIP_ITEM(6, "Protège-épaules dénombrés (Shoulders)", GOSSIP_SENDER_MAIN, 308);
        player->ADD_GOSSIP_ITEM(6, "Foulard dénombré (Waist)", GOSSIP_SENDER_MAIN, 311);
        player->ADD_GOSSIP_ITEM(6, "Garde-mains vigoureux (Hands)", GOSSIP_SENDER_MAIN, 303);
        player->ADD_GOSSIP_ITEM(6, "Spalières vigoureuses (Shoulders)", GOSSIP_SENDER_MAIN, 307);
        player->ADD_GOSSIP_ITEM(6, "Ceinture vigoureuse (Waist)", GOSSIP_SENDER_MAIN, 312);
        player->ADD_GOSSIP_ITEM(6, "Manicles liées à la terre (Hands)", GOSSIP_SENDER_MAIN, 305);
        player->ADD_GOSSIP_ITEM(6, "Garde-épaules liés à la terre (Shoulders)", GOSSIP_SENDER_MAIN, 309);
        player->ADD_GOSSIP_ITEM(6, "Ceinturon liés à la terre (Waist)", GOSSIP_SENDER_MAIN, 313);
        player->ADD_GOSSIP_ITEM(20, session->GetTrinityString(12041), GOSSIP_SENDER_MAIN, 100);
        player->SEND_GOSSIP_MENU(1000023, creature->GetGUID());
		break;
	    case 302: player->SetRandItId(51994); goto l276276; break;
	    case 303: player->SetRandItId(51965); goto l276276; break;
	    case 304: player->SetRandItId(51973); goto l276276; break;
	    case 305: player->SetRandItId(51980); goto l276276; break;
	    case 306: player->SetRandItId(51996); goto l276276; break;
	    case 307: player->SetRandItId(51966); goto l276276; break;
	    case 308: player->SetRandItId(51974); goto l276276; break;
		case 309: player->SetRandItId(51976); goto l276276; break;
	    case 310: player->SetRandItId(51992); goto l276276; break;
	    case 311: player->SetRandItId(51968); goto l276276; break;
	    case 312: player->SetRandItId(51964); goto l276276; break;
	    case 313: player->SetRandItId(51978); goto l276276; break;
		
    case 400: // Tissu
        player->SetRandRetour(action);
        player->ADD_GOSSIP_ITEM(6, "Chapeau de Sombrebrume (Head)", GOSSIP_SENDER_MAIN, 401);
        player->ADD_GOSSIP_ITEM(6, "Mantelet lunaire (Shoulders)", GOSSIP_SENDER_MAIN, 402);
        player->ADD_GOSSIP_ITEM(6, "Drapé de sorcier (Chest)", GOSSIP_SENDER_MAIN, 403);
        player->ADD_GOSSIP_ITEM(6, "Brassards tisses de sang (Wrist)", GOSSIP_SENDER_MAIN, 404);
        player->ADD_GOSSIP_ITEM(6, "Gants de Revelosh (Hands)", GOSSIP_SENDER_MAIN, 409);
        player->ADD_GOSSIP_ITEM(6, "Gants royaux (Hands)", GOSSIP_SENDER_MAIN, 405);
        player->ADD_GOSSIP_ITEM(6, "Echarpe royale (Waist)", GOSSIP_SENDER_MAIN, 406);
        player->ADD_GOSSIP_ITEM(6, "Jambières Régaliennes (Legs)", GOSSIP_SENDER_MAIN, 407);
        player->ADD_GOSSIP_ITEM(6, "Bottes royales (Feets)", GOSSIP_SENDER_MAIN, 408);
        player->ADD_GOSSIP_ITEM(20, session->GetTrinityString(12041), GOSSIP_SENDER_MAIN, 100);
        player->SEND_GOSSIP_MENU(1000023, creature->GetGUID());
		break;
		case 401: player->SetRandItId(14246); goto l276276; break;
		case 402: player->SetRandItId(14247); goto l276276; break;
		case 403: player->SetRandItId(9874); goto l276276; break;
		case 404: player->SetRandItId(14260); goto l276276; break;
		case 405: player->SetRandItId(9910); goto l276276; break;
		case 406: player->SetRandItId(9906); goto l276276; break;
		case 407: player->SetRandItId(7469); goto l276276; break;
		case 408: player->SetRandItId(9907); goto l276276; break;
	    case 409: player->SetRandItId(9390); goto l276276; break;
	
    case 500: // Cuir
        player->SetRandRetour(action);
        player->ADD_GOSSIP_ITEM(6, "Chapeau de noctambule (Head)", GOSSIP_SENDER_MAIN, 501);
        player->ADD_GOSSIP_ITEM(6, "Spallières de Revelosh (Shoulders)", GOSSIP_SENDER_MAIN, 502);
        player->ADD_GOSSIP_ITEM(6, "Armure de veneur (Chest)", GOSSIP_SENDER_MAIN, 503);
        player->ADD_GOSSIP_ITEM(6, "Poignets déterrés (Wrist)", GOSSIP_SENDER_MAIN, 509);
        player->ADD_GOSSIP_ITEM(6, "Garde-poignets de pisteur (Wrist)", GOSSIP_SENDER_MAIN, 504);
        player->ADD_GOSSIP_ITEM(6, "Gants de pisteur (Hands)", GOSSIP_SENDER_MAIN, 505);
        player->ADD_GOSSIP_ITEM(6, "Ceinture de pisteur (Waist)", GOSSIP_SENDER_MAIN, 506);
        player->ADD_GOSSIP_ITEM(6, "Jambières de chevaucheur (Legs)", GOSSIP_SENDER_MAIN, 507);
        player->ADD_GOSSIP_ITEM(6, "Bottes de chevaucheur (Feets)", GOSSIP_SENDER_MAIN, 508);
        player->ADD_GOSSIP_ITEM(20, session->GetTrinityString(12041), GOSSIP_SENDER_MAIN, 100);
        player->SEND_GOSSIP_MENU(1000023, creature->GetGUID());
		break;
		case 501: player->SetRandItId(15156); goto l276276; break;
		case 502: player->SetRandItId(8389); goto l276276; break;
		case 503: player->SetRandItId(8776); goto l276276; break;
		case 504: player->SetRandItId(0025); goto l276276; break;
		case 505: player->SetRandItId(9920); goto l276276; break;
		case 506: player->SetRandItId(9916); goto l276276; break;
		case 507: player->SetRandItId(15374); goto l276276; break;
		case 508: player->SetRandItId(15370); goto l276276; break;
		case 509: player->SetRandItId(9428); goto l276276; break;
		
    case 600: // Maille
        player->SetRandRetour(action);
        player->ADD_GOSSIP_ITEM(6, "Diademe de la brigade (Head)", GOSSIP_SENDER_MAIN, 601);
        player->ADD_GOSSIP_ITEM(6, "Espauliers des anciens (Shoulders)", GOSSIP_SENDER_MAIN, 602);
        player->ADD_GOSSIP_ITEM(6, "Cuirasse de capitaine (Chest)", GOSSIP_SENDER_MAIN, 603);
        player->ADD_GOSSIP_ITEM(6, "Garde-bras de Revelosh (Wrist)", GOSSIP_SENDER_MAIN, 609);
        player->ADD_GOSSIP_ITEM(6, "Brassards d'Ironaya (Wrist)", GOSSIP_SENDER_MAIN, 610);
        player->ADD_GOSSIP_ITEM(6, "Brassards de la maille d'os (Wrist)", GOSSIP_SENDER_MAIN, 604);
        player->ADD_GOSSIP_ITEM(6, "Gantelets de la maille d'os (Hands)", GOSSIP_SENDER_MAIN, 605);
        player->ADD_GOSSIP_ITEM(6, "Ceinturon de la brigade (Waist)", GOSSIP_SENDER_MAIN, 606);
        player->ADD_GOSSIP_ITEM(6, "Garde-jambes des anciens.", GOSSIP_SENDER_MAIN, 607);
        player->ADD_GOSSIP_ITEM(6, "Grêves anciennes.", GOSSIP_SENDER_MAIN, 608);
        player->ADD_GOSSIP_ITEM(20, session->GetTrinityString(12041), GOSSIP_SENDER_MAIN, 100);
        player->SEND_GOSSIP_MENU(1000023, creature->GetGUID());
		break;
		case 601: player->SetRandItId(9932); goto l276276; break;
		case 602: player->SetRandItId(15608); goto l276276; break;
		case 603: player->SetRandItId(7486); goto l276276; break;
		case 604: player->SetRandItId(15612); goto l276276; break;
		case 605: player->SetRandItId(15610); goto l276276; break;
		case 606: player->SetRandItId(9931); goto l276276; break;
		case 607: player->SetRandItId(15607); goto l276276; break;
		case 608: player->SetRandItId(15599); goto l276276; break;
	    case 609: player->SetRandItId(9388); goto l276276; break;
	    case 610: player->SetRandItId(9409); goto l276276; break;
		
l276276:
		case 9999:
			lmenu:
			player->PlayerTalkClass->ClearMenus();
			player->SetRandRis(RandItemSuffix(player->GetRandItId(), player->GetSession()->GetSessionDbLocaleIndex()));
			player->SetRandRie(RandItemEnch(player->GetRandItId()));
			for (count=0; count<31; count++) {
				if (player->GetRandRie()[count] == 2) goto lmenu2;
				player->ADD_GOSSIP_ITEM(6, " " + player->GetRandRis()[count], GOSSIP_SENDER_MAIN, 10001+count); }
lmenu2:
			player->ADD_GOSSIP_ITEM(0, player->GetSession()->GetTrinityString(12040), GOSSIP_SENDER_MAIN, player->GetRandRetour());
			player->SEND_GOSSIP_MENU(1000023, creature->GetGUID());
			break;

		case 10001: case 10002: case 10003: case 10004: case 10005: case 10006: case 10007: case 10008: case 10009: case 10010:
		case 10011: case 10012: case 10013: case 10014: case 10015: case 10016: case 10017: case 10018: case 10019: case 10020:
		case 10021: case 10022: case 10023: case 10024: case 10025: case 10026: case 10027: case 10028: case 10029: case 10030:

			AddItemChoix(player, player->GetRandItId(), player->GetRandRie()[action-10001]);
			goto lmenu; break;
		}
	return true; }

	struct npc_training_dummyAI : Scripted_NoMovementAI {
        npc_training_dummyAI(Creature* creature) : Scripted_NoMovementAI(creature) {
            entry = creature->GetEntry(); }

        uint32 entry;
        uint32 resetTimer;
        uint32 despawnTimer;

        void Reset() { me->SetControlled(true, UNIT_STATE_STUNNED); }
        void EnterEvadeMode() {
            if (!_EnterEvadeMode()) return;
			Reset(); }
		void UpdateAI(uint32 const diff) {
            if (!me->HasUnitState(UNIT_STATE_STUNNED))
                me->SetControlled(true, UNIT_STATE_STUNNED); }
        void MoveInLineOfSight(Unit* /*who*/){return;}
    };

};

void AddSc_rand_item() {
	new rand_item(); }