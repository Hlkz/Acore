#include "ScriptPCH.h"
#include "Config.h"

//spell 62579:don alexstraza

//mage de bataille : 36920:boulefeu

class npc_teleport : public CreatureScript
{
	public:
		npc_teleport() : CreatureScript("npc_teleport") { }
		
		void MainMenu(Player* player, Creature* creature)
		{
			std::ostringstream ostr;
			ostr << ConfigMgr::GetStringDefault("u_t_s", "");
			
			creature->HasQuestForPlayer(player);
			
			player->ADD_GOSSIP_ITEM(6, "[Shop] Karazhan", GOSSIP_SENDER_MAIN, 10);
			/*	if (player->GetTeam() == ALLIANCE)
			player->ADD_GOSSIP_ITEM(9, "[PvP sauvage] Cratère d'Azshara", GOSSIP_SENDER_MAIN, 12);
			if (player->GetTeam() == HORDE)
			player->ADD_GOSSIP_ITEM(9, "[PvP sauvage] Cratère d'Azshara", GOSSIP_SENDER_MAIN, 13);*/
			player->ADD_GOSSIP_ITEM(9, "[Duel] Ahn'Qiraj", GOSSIP_SENDER_MAIN, 16);
			//	player->ADD_GOSSIP_ITEM(9, ostr.str().c_str(), GOSSIP_SENDER_MAIN, 20);
			//	player->ADD_GOSSIP_ITEM(2, "[PvE] Donjons...", GOSSIP_SENDER_MAIN, 30);
			//	player->ADD_GOSSIP_ITEM(6, "Dalaran (accès au monde...)", GOSSIP_SENDER_MAIN, 14);
			if(player->GetQuestStatus(100054) == QUEST_STATUS_REWARDED)
				player->ADD_GOSSIP_ITEM(3, "[World Event] Bosquet du crépuscule", GOSSIP_SENDER_MAIN, 40);
			player->ADD_GOSSIP_ITEM(2, "Elwynn...", GOSSIP_SENDER_MAIN, 60);
			player->ADD_GOSSIP_ITEM(2, "Durotar...", GOSSIP_SENDER_MAIN, 61);
			player->SEND_GOSSIP_MENU(1, creature->GetGUID());
		}
		
		bool OnGossipHello(Player* player, Creature* creature)
		{
			MainMenu(player, creature);
			return true;
		}
		
		void TeleportTo(Player* player, uint32 mapid, float x, float y, float z, float o)
		{
			player->TeleportTo(mapid, x, y, z, o);
			player->CastSpell(player, 36937); //transfert
		}

		bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
		{
			uint32 u_t_m = ConfigMgr::GetIntDefault("u_t_m", NULL);
			float u_t_x = ConfigMgr::GetFloatDefault("u_t_x", NULL);
			float u_t_y = ConfigMgr::GetFloatDefault("u_t_y", NULL);
			float u_t_z = ConfigMgr::GetFloatDefault("u_t_z", NULL);
			float u_t_o = ConfigMgr::GetFloatDefault("u_t_o", NULL);

			/*if (player->isInCombat()) {
			creature->MonsterWhisper("Vous êtes en combat.", player->GetGUID());
			player->CLOSE_GOSSIP_MENU();
			return true; }*/

			player->PlayerTalkClass->ClearMenus();

			switch (uiAction)
			{
			
			case 1: MainMenu(player, creature); break;

			case 10: player->CLOSE_GOSSIP_MENU(); // Karazhan
				TeleportTo(player, 532, -10945.8f, -2103.85f, 92.8f, 0.9f); break;
			case 11: player->CLOSE_GOSSIP_MENU();
				TeleportTo(player, 532, -11233.4f, -1697.76f, 179.3f, 0.6f); break;
		
			case 12: player->CLOSE_GOSSIP_MENU(); // Cratère
				TeleportTo(player, 37, -120.103f, -52.833f, 268.7f, 0.1f); break;
			case 13: player->CLOSE_GOSSIP_MENU();
				TeleportTo(player, 37, 362.67f, 97.629f, 247.5f, 3.1f); break;

			case 14: player->CLOSE_GOSSIP_MENU(); // Dala
				TeleportTo(player, 571, 5819.49f, 642.93f, 647.9f, 0.1f); break;
			case 16: player->CLOSE_GOSSIP_MENU(); // Ahn Qiraj
				TeleportTo(player, 531, -8512.5f, 2016.02f, 104.6f, 3.6f); break;
			case 20: player->CLOSE_GOSSIP_MENU(); // FFA
				TeleportTo(player, u_t_m, u_t_x, u_t_y, u_t_z, u_t_o); break;
		
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
				TeleportTo(player, 0, -8758.238f, 820.46f, 97.635f, 3.83f); break;
			case 32: player->CLOSE_GOSSIP_MENU(); // Tranchebauge
				TeleportTo(player, 1, -4786.528f, -2331.625f, 114.7f, 0.6f); break;
			case 33: player->CLOSE_GOSSIP_MENU(); // Gnomeregan
				TeleportTo(player, 0, -5080.112f, 721.833f, 260.56f, 0.37f); break;
			case 34: player->CLOSE_GOSSIP_MENU(); // Monastère
				TeleportTo(player, 0, 2996.03f, -784.148f, 175.22f, 2.2f); break;
			case 35: player->CLOSE_GOSSIP_MENU(); // Uldaman
				TeleportTo(player, 0, -6079.128f, -3015.764f, 232.14f, 0.52f); break;
			case 36: player->CLOSE_GOSSIP_MENU(); // Maraudon
				TeleportTo(player, 1, -1397.381f, 2902.977f, 137.72f, 5.31f); break;
			case 37: player->CLOSE_GOSSIP_MENU(); // Zul Farrak
				TeleportTo(player, 1, -6815.779f, -2892.542f, 8.89f, 0.78f); break;
			case 38: player->CLOSE_GOSSIP_MENU(); // Temple Englouti
				TeleportTo(player, 0, -10420.893f, -3794.955f, 32.67f, 3.85f); break;
		
			case 40: player->CLOSE_GOSSIP_MENU(); // Taerar
				TeleportTo(player, 0, -10712.433594f, -422.857239f, 126.675827f, 0.493374f); break;

			case 50: player->CLOSE_GOSSIP_MENU(); // Gurubashi
				TeleportTo(player, 0, -13229.830078f, 225.240143f, 32.587940f, 1.100993f); break;
		
			case 60: player->CLOSE_GOSSIP_MENU(); // Elwynn
				TeleportTo(player, 0, -9210.956055f, 366.980072f, 72.539406f, 0.275015f); break;
			case 61: player->CLOSE_GOSSIP_MENU(); // Durotar
				TeleportTo(player, 1, 1130.409546f, -4359.610840f, 25.287050f, 5.119390f); break;
			}
			
			return true;
		}
};

void AddSc_npc_teleport()
{
	new npc_teleport();
}