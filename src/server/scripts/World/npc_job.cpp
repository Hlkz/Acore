#include "ScriptPCH.h"

enum NpcJob
{
    LANG_NPC_JOB_SKINNING       = 12080,
    LANG_NPC_JOB_HERBALISM      = 12081,
    LANG_NPC_JOB_MINING         = 12082,
    LANG_NPC_JOB_ENGINEERING    = 12083,
    LANG_NPC_JOB_ERR          = 12090,

    SPELL_FORGE    = 9785,        SKILL_FORGE    = 164,
    SPELL_JOA    = 28895,    SKILL_JOA    = 755,
    SPELL_EN    = 13920,    SKILL_EN    = 333,
    SPELL_AL    = 11611,    SKILL_AL    = 171,
    SPELL_EG    = 12656,    SKILL_EG    = 202,
    SPELL_IN    = 45360,    SKILL_IN    = 773,
    SPELL_TA    = 12180,    SKILL_TA    = 197,
    SPELL_MI    = 10248,    SKILL_MI    = 186,
    SPELL_HE    = 11993,    SKILL_HE    = 182,
    SPELL_LW    = 10662,    SKILL_LW    = 165,
    SPELL_SK    = 10768,    SKILL_SK    = 393,
};

class npc_job : public CreatureScript
{
public:
    npc_job() : CreatureScript("npc_job") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        WorldSession* session = player->GetSession();
        creature->HasQuestForPlayer(player);
        player->ADD_GOSSIP_ITEM(3, session->GetTrinityString(LANG_NPC_JOB_SKINNING) , GOSSIP_SENDER_MAIN, 1009);
        player->ADD_GOSSIP_ITEM(3, session->GetTrinityString(LANG_NPC_JOB_HERBALISM) , GOSSIP_SENDER_MAIN, 1004);
        player->ADD_GOSSIP_ITEM(3, session->GetTrinityString(LANG_NPC_JOB_MINING) , GOSSIP_SENDER_MAIN, 1008);
        //player->ADD_GOSSIP_ITEM(3, "Alchimie (artisanat)" , GOSSIP_SENDER_MAIN, 1000);
        //player->ADD_GOSSIP_ITEM(3, "Calligraphie" , GOSSIP_SENDER_MAIN, 1005);
        //player->ADD_GOSSIP_ITEM(3, "Couture" , GOSSIP_SENDER_MAIN, 1010);
        //player->ADD_GOSSIP_ITEM(3, "Enchantement" , GOSSIP_SENDER_MAIN, 1002);
        //player->ADD_GOSSIP_ITEM(3, "Forge" , GOSSIP_SENDER_MAIN, 1001);
        player->ADD_GOSSIP_ITEM(3, session->GetTrinityString(LANG_NPC_JOB_ENGINEERING) , GOSSIP_SENDER_MAIN, 1003);
        //player->ADD_GOSSIP_ITEM(3, "Joaillerie" , GOSSIP_SENDER_MAIN, 1006);
        //player->ADD_GOSSIP_ITEM(3, "Travail du cuir" , GOSSIP_SENDER_MAIN, 1007);
        player->SEND_GOSSIP_MENU(player->GetDefaultGossipMenuForSource(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        if (player->GetFreePrimaryProfessionPoints() >= 1)
        {
            switch (action) {

            case 1000:
                player->CLOSE_GOSSIP_MENU();
                player->learnSpell(SPELL_AL, false);
                player->UpdateSkill(SKILL_AL, 300);
                break;
            case 1001:
                player->CLOSE_GOSSIP_MENU();
                player->learnSpell(SPELL_FORGE, false);
                player->UpdateSkill(SKILL_FORGE, 300);
                break;
            case 1002:
                player->CLOSE_GOSSIP_MENU();
                player->learnSpell(SPELL_EN, false);
                player->UpdateSkill(SKILL_EN, 300);
                break;
            case 1003:
                player->CLOSE_GOSSIP_MENU();
                player->learnSpell(SPELL_EG, false);
                player->UpdateSkill(SKILL_EG, 300);
                break;
            case 1004:
                player->CLOSE_GOSSIP_MENU();
                player->learnSpell(SPELL_HE, false);
                player->learnSpell(55501, false);
                player->UpdateSkill(SKILL_HE, 300);
                break;
            case 1005:
                player->CLOSE_GOSSIP_MENU();
                player->learnSpell(SPELL_IN, false);
                player->UpdateSkill(SKILL_IN, 300);
                break;
            case 1006:
                player->CLOSE_GOSSIP_MENU();
                player->learnSpell(SPELL_JOA, false);
                player->UpdateSkill(SKILL_JOA, 300);
                break;
            case 1007:
                player->CLOSE_GOSSIP_MENU();
                player->learnSpell(SPELL_LW, false);
                player->UpdateSkill(SKILL_LW, 300);
                break;
            case 1008:
                player->CLOSE_GOSSIP_MENU();
                player->learnSpell(SPELL_MI, false);
                player->learnSpell(53123, false);
                player->UpdateSkill(SKILL_MI, 300);
                break;
            case 1009:
                player->CLOSE_GOSSIP_MENU();
                player->learnSpell(SPELL_SK, false);
                player->learnSpell(53664, false);
                player->UpdateSkill(SKILL_SK, 300);
                break;
            case 1010:
                player->CLOSE_GOSSIP_MENU();
                player->learnSpell(SPELL_TA, false);
                player->UpdateSkill(SKILL_TA, 300);
                break;
            }
        }
        else
        {
            player->CLOSE_GOSSIP_MENU();
            creature->MonsterWhisper(player->GetSession()->GetTrinityString(LANG_NPC_JOB_ERR), player->GetGUID(), false);
        }

        return true;
    }
};

void AddSC_npc_job()
{
    new npc_job;
}
