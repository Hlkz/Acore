#include "ScriptMgr.h"

enum NpcClass
{
    LANG_NPC_CLASS_UPGRADE     = 12070,
    LANG_NPC_CLASS_DUALSPEC    = 12071,
    LANG_NPC_CLASS_GLYPHS      = 12072,
    LANG_NPC_CLASS_TALENTS     = 12073
};

class npc_class : public CreatureScript
{
public:
    npc_class() : CreatureScript("npc_class") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        creature->SetControlled(true, UNIT_STATE_STUNNED);
        WorldSession* session = player->GetSession();
        player->ADD_GOSSIP_ITEM(3, session->GetTrinityString(LANG_NPC_CLASS_UPGRADE)  , GOSSIP_SENDER_MAIN, 1);
        player->ADD_GOSSIP_ITEM(2, session->GetTrinityString(LANG_NPC_CLASS_DUALSPEC) , GOSSIP_SENDER_MAIN, 2);
        player->ADD_GOSSIP_ITEM(1, session->GetTrinityString(LANG_NPC_CLASS_GLYPHS)   , GOSSIP_SENDER_MAIN, 3);
        player->ADD_GOSSIP_ITEM(2, session->GetTrinityString(LANG_NPC_CLASS_TALENTS)  , GOSSIP_SENDER_MAIN, 4);
        player->SEND_GOSSIP_MENU(player->GetDefaultGossipMenuForSource(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();

        switch (action)
        {

        case 1:
            OnGossipHello(player, creature);
            player->UpdateSkillsToMaxSkillsForLevel();
            if (player->HasSpell(17877)) {
                player->LearnSpell(18867, false);
                player->LearnSpell(18868, false); } // brulure de l'ombre
            if (player->HasSpell(11366)) {
                player->LearnSpell(12505, false);
                player->LearnSpell(12522, false);
                player->LearnSpell(12523, false); } // explosion pyrotechnique
            if (player->HasSpell(11113)) {
                player->LearnSpell(13018, false); } // vague explosive
            if (player->HasSpell(5570)) {
                player->LearnSpell(24974, false); } // essaim d'insecte
            if (player->HasSpell(19434)) {
                player->LearnSpell(20900, false);
                player->LearnSpell(20901, false); } // visée
            if (player->HasSpell(15407)) {
                player->LearnSpell(17311, false);
                player->LearnSpell(17312, false); } // fouet mental
            if (player->HasSpell(19236)) {
                player->LearnSpell(19240, false);
                player->LearnSpell(19238, false); } // prière du désespoir
            player->UpdateSkill(185, 450); // cuisine
            player->UpdateSkill(129, 450); // secourisme
            creature->CastSpell(player, 38588, false);
            break;

        case 2:
            OnGossipHello(player, creature);
            if (player->GetSpecsCount() == 1) {
                player->CastSpell(player, 63680, true, NULL, NULL, player->GetGUID());
                player->CastSpell(player, 63624, true, NULL, NULL, player->GetGUID()); }
            break;

        case 3:
            if (player->getClass()==1 || player->getClass()==2 || player->getClass()==7)
                player->GetSession()->SendVendor(1000008);
            else player->GetSession()->SendVendor(100006);
            break;

        case 4:
            OnGossipHello(player, creature);
            player->ResetTalents();
            player->SendTalentsInfoData(false);
            break;
        }
        return true;
    }

    struct npc_jobAI : public CreatureAI
    {
        npc_jobAI(Creature* creature) : CreatureAI(creature) { me->SetControlled(true, UNIT_STATE_STUNNED); }
        void UpdateAI(uint32 /*diff*/) { if (!me->HasUnitState(UNIT_STATE_STUNNED)) me->SetControlled(true, UNIT_STATE_STUNNED); }
    };
    CreatureAI* GetAI(Creature* creature) const { return new npc_jobAI(creature); }
};

void AddSC_npc_class()
{
    new npc_class;
}
