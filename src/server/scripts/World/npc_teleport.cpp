#include "ScriptPCH.h"
#include "Config.h"

class npc_teleport : public CreatureScript
{
public:
    npc_teleport() : CreatureScript("npc_teleport") { }
	
    bool OnGossipHello(Player* player, Creature* creature)
    {
        std::ostringstream ostr;
        creature->HasQuestForPlayer(player);
        player->ADD_GOSSIP_ITEM(6, "[Shop] Karazhan", GOSSIP_SENDER_MAIN, 10);
        player->ADD_GOSSIP_ITEM(9, "[Duel] Ahn'Qiraj", GOSSIP_SENDER_MAIN, 16);
        if (sConfigMgr->GetBoolDefault("u_t", false))
        {
            ostr << sConfigMgr->GetStringDefault("u_t_s", "");
            player->ADD_GOSSIP_ITEM(9, ostr.str().c_str(), GOSSIP_SENDER_MAIN, 20);
        }
        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    void TeleportTo(Player* player, uint32 mapid, float x, float y, float z, float o)
    {
        player->TeleportTo(mapid, x, y, z, o);
        player->CastSpell(player, 36937); //transfert
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        uint32 u_t_m = sConfigMgr->GetIntDefault("u_t_m", NULL);
        float u_t_x = sConfigMgr->GetFloatDefault("u_t_x", NULL);
        float u_t_y = sConfigMgr->GetFloatDefault("u_t_y", NULL);
        float u_t_z = sConfigMgr->GetFloatDefault("u_t_z", NULL);
        float u_t_o = sConfigMgr->GetFloatDefault("u_t_o", NULL);

        /*if (player->IsInCombat()) {
            creature->MonsterWhisper("Vous êtes en combat.", player->GetGUID());
            player->CLOSE_GOSSIP_MENU();
            return true; }*/

        player->PlayerTalkClass->ClearMenus();
        switch (uiAction)
        {
        case 1: OnGossipHello(player, creature);                         break;

        case 10: player->CLOSE_GOSSIP_MENU(); // Karazhan
            TeleportTo(player, 532, -10945.8f, -2103.85f, 92.8f, 0.9f);  break;
        case 11: player->CLOSE_GOSSIP_MENU();
            TeleportTo(player, 532, -11233.4f, -1697.76f, 179.3f, 0.6f); break;
		
        case 16: player->CLOSE_GOSSIP_MENU(); // Ahn Qiraj
            TeleportTo(player, 531, -8512.5f, 2016.02f, 104.6f, 3.6f);   break;
        case 20: player->CLOSE_GOSSIP_MENU(); // FFA
            TeleportTo(player, u_t_m, u_t_x, u_t_y, u_t_z, u_t_o);       break;
        }
        return true;
    }
};

void AddSC_npc_teleport()
{
    new npc_teleport();
}
