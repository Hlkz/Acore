#include "ScriptPCH.h"
#include "Config.h"

class universal_teleporter : public CreatureScript {
	public: universal_teleporter() : CreatureScript("universal_teleporter") {}

void MainMenu(Player *player, Creature *creature) {

	std::ostringstream ostr;
	ostr << ConfigMgr::GetStringDefault("u_t_s", "");
	
	player->ADD_GOSSIP_ITEM(6, "[Shop] Karazhan", GOSSIP_SENDER_MAIN, 10);
/*	if (player->GetTeam() == ALLIANCE) {
		player->ADD_GOSSIP_ITEM(9, "[PvP sauvage] Cratère d'Azshara", GOSSIP_SENDER_MAIN, 12); }
	if (player->GetTeam() == HORDE) {
		player->ADD_GOSSIP_ITEM(9, "[PvP sauvage] Cratère d'Azshara", GOSSIP_SENDER_MAIN, 13); }*/
	player->ADD_GOSSIP_ITEM(9, "[Duel] Ahn'Qiraj", GOSSIP_SENDER_MAIN, 16);
//	player->ADD_GOSSIP_ITEM(9, ostr.str().c_str(), GOSSIP_SENDER_MAIN, 20);
//	player->ADD_GOSSIP_ITEM(2, "[PvE] Donjons...", GOSSIP_SENDER_MAIN, 30);
//	player->ADD_GOSSIP_ITEM(6, "Dalaran (accès au monde...)", GOSSIP_SENDER_MAIN, 14);
	player->SEND_GOSSIP_MENU(1, creature->GetGUID()); }
	
bool OnGossipHello(Player* player, Creature* creature) {
	MainMenu(player, creature);
	return true; }

bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction) {

	uint32 u_t_m = ConfigMgr::GetIntDefault("u_t_m", NULL);
	float u_t_x = ConfigMgr::GetFloatDefault("u_t_x", NULL);
	float u_t_y = ConfigMgr::GetFloatDefault("u_t_y", NULL);
	float u_t_z = ConfigMgr::GetFloatDefault("u_t_z", NULL);
	float u_t_o = ConfigMgr::GetFloatDefault("u_t_o", NULL);

	if (player->isInCombat() && player->GetMapId() != 531 && player->GetMapId() != 532) {
		creature->MonsterWhisper("Vous êtes en combat.", player->GetGUID());
		player->CLOSE_GOSSIP_MENU();
		return true; }

	player->PlayerTalkClass->ClearMenus();

		switch (uiAction) {

	case 1: MainMenu(player, creature); break;

	case 10: player->CLOSE_GOSSIP_MENU(); // Karazhan
		player->TeleportTo(532, -10945.8f, -2103.85f, 92.8f, 0.9f); break;
	case 11: player->CLOSE_GOSSIP_MENU();
		player->TeleportTo(532, -11233.4f, -1697.76f, 179.3f, 0.6f); break;
		
	case 12: player->CLOSE_GOSSIP_MENU(); // Cratère
		player->TeleportTo(37, -120.103f, -52.833f, 268.7f, 0.1f); break;
	case 13: player->CLOSE_GOSSIP_MENU();
		player->TeleportTo(37, 362.67f, 97.629f, 247.5f, 3.1f); break;

	case 14: player->CLOSE_GOSSIP_MENU(); // Dala
		player->TeleportTo(571, 5819.49f, 642.93f, 647.9f, 0.1f); break;
	case 16: player->CLOSE_GOSSIP_MENU(); // Ahn Qiraj
		player->TeleportTo(531, -8512.5f, 2016.02f, 104.6f, 3.6f); break;
	case 20: player->CLOSE_GOSSIP_MENU(); // FFA
		player->TeleportTo(u_t_m, u_t_x, u_t_y, u_t_z, u_t_o); break;
		
	case 30:
		if (player->GetTeam() == ALLIANCE)
			player->ADD_GOSSIP_ITEM(9, "[20-30] La Prison", GOSSIP_SENDER_MAIN, 31);
		player->ADD_GOSSIP_ITEM(9, "[22-42] Tranchebauge", GOSSIP_SENDER_MAIN, 32);
		player->ADD_GOSSIP_ITEM(9, "[23-33] Gnomeregan", GOSSIP_SENDER_MAIN, 33);
		player->ADD_GOSSIP_ITEM(9, "[25-45] Monastère écarlate", GOSSIP_SENDER_MAIN, 34);
		player->ADD_GOSSIP_ITEM(9, "[35-45] Uldaman", GOSSIP_SENDER_MAIN, 35);
		player->ADD_GOSSIP_ITEM(9, "[39-53] Maraudon", GOSSIP_SENDER_MAIN, 36);
		player->ADD_GOSSIP_ITEM(9, "[41-51] Zul'Farrak", GOSSIP_SENDER_MAIN, 37);
		player->ADD_GOSSIP_ITEM(9, "[45-55] Temple Englouti", GOSSIP_SENDER_MAIN, 38);
		player->SEND_GOSSIP_MENU(1, creature->GetGUID());
		break;
	case 31: player->CLOSE_GOSSIP_MENU(); // Prison
		player->TeleportTo(0, -8758.238f, 820.46f, 97.635f, 3.83f); break;
	case 32: player->CLOSE_GOSSIP_MENU(); // Tranchebauge
		player->TeleportTo(1, -4786.528f, -2331.625f, 114.7f, 0.6f); break;
	case 33: player->CLOSE_GOSSIP_MENU(); // Gnomeregan
		player->TeleportTo(0, -5080.112f, 721.833f, 260.56f, 0.37f); break;
	case 34: player->CLOSE_GOSSIP_MENU(); // Monastère
		player->TeleportTo(0, 2996.03f, -784.148f, 175.22f, 2.2f); break;
	case 35: player->CLOSE_GOSSIP_MENU(); // Uldaman
		player->TeleportTo(0, -6079.128f, -3015.764f, 232.14f, 0.52f); break;
	case 36: player->CLOSE_GOSSIP_MENU(); // Maraudon
		player->TeleportTo(1, -1397.381f, 2902.977f, 137.72f, 5.31f); break;
	case 37: player->CLOSE_GOSSIP_MENU(); // Zul Farrak
		player->TeleportTo(1, -6815.779f, -2892.542f, 8.89f, 0.78f); break;
	case 38: player->CLOSE_GOSSIP_MENU(); // Temple Englouti
		player->TeleportTo(0, -10420.893f, -3794.955f, 32.67f, 3.85f); break;

		}
    return true; }
};

void AddSc_universal_teleporter() {
	new universal_teleporter(); }