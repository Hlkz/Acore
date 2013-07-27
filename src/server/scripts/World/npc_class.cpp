#include "ScriptPCH.h"

class npc_class : public CreatureScript {
    public: npc_class() : CreatureScript("npc_class") {}

bool OnGossipHello(Player* player, Creature* creature) {
	creature->SetControlled(true, UNIT_STATE_STUNNED);
	MainMenu(player, creature);
	return true; }
		
void MainMenu(Player *player, Creature *creature) {
	player->ADD_GOSSIP_ITEM( 3, "Mise a niveau des sorts, stats et compétences" , GOSSIP_SENDER_MAIN, 1);
	player->ADD_GOSSIP_ITEM( 2, "Apprentissage de la double spécalisation" , GOSSIP_SENDER_MAIN, 2);
	player->ADD_GOSSIP_ITEM( 1, "Vendeur de glyphes." , GOSSIP_SENDER_MAIN, 3);
	player->ADD_GOSSIP_ITEM( 2, "Réinitialisation des talents" , GOSSIP_SENDER_MAIN, 4);
	player->SEND_GOSSIP_MENU(1000003, creature->GetGUID()); }

bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) {
	player->PlayerTalkClass->ClearMenus();

		switch (action) {

	case 1:
		MainMenu(player, creature);
		player->UpdateSkillsToMaxSkillsForLevel();
		if (player->HasSpell(17877)) {
		player->learnSpell(18867, false);
		player->learnSpell(18868, false); } // brulure de l'ombre
		if (player->HasSpell(11366)) {
		player->learnSpell(12505, false);
		player->learnSpell(12522, false);
		player->learnSpell(12523, false); } // explosion pyrotechnique
		if (player->HasSpell(11113)) {
		player->learnSpell(13018, false); } // vague explosive
		if (player->HasSpell(5570)) {
		player->learnSpell(24974, false); } // essaim d'insecte
		if (player->HasSpell(19434)) {
		player->learnSpell(20900, false);
		player->learnSpell(20901, false); } // visée
		if (player->HasSpell(15407)) {
		player->learnSpell(17311, false);
		player->learnSpell(17312, false); } // fouet mental
		if (player->HasSpell(19236)) {
		player->learnSpell(19240, false);
		player->learnSpell(19238, false); } // prière du désespoir
		player->UpdateSkill(185, 450); // cuisine
		player->UpdateSkill(129, 450); // secourisme
		creature->CastSpell(player,38588,false);
		break;

	case 2:
		MainMenu(player, creature);
		if (player->GetSpecsCount() == 1) {
			player->CastSpell(player, 63680, true, NULL, NULL, player->GetGUID());
			player->CastSpell(player, 63624, true, NULL, NULL, player->GetGUID()); }
		break;
	
	case 3:
		if(player->getClass()==1 || player->getClass()==2 || player->getClass()==7)
			player->GetSession()->SendVendor(1000008);
		else player->GetSession()->SendVendor(100006);
		break;

	case 30:
		if(player->getClass() == 1){    player->GetSession()->SendListInventory(999991); } // guerrier
		if(player->getClass() == 2){	player->GetSession()->SendListInventory(999992); } // paladin
		if(player->getClass() == 3){	player->GetSession()->SendListInventory(999993); } // chasseur
		if(player->getClass() == 4){	player->GetSession()->SendListInventory(999994); } // voleur
		if(player->getClass() == 5){	player->GetSession()->SendListInventory(999995); } // prêtre
		if(player->getClass() == 7){	player->GetSession()->SendListInventory(999996); } // chaman
		if(player->getClass() == 8){	player->GetSession()->SendListInventory(999997); } // mage
		if(player->getClass() == 9){	player->GetSession()->SendListInventory(999998); } // démoniste
		if(player->getClass() == 11){	player->GetSession()->SendListInventory(999999); } // druide
		break;
	
	case 4:
		MainMenu(player, creature);
		player->resetTalents(true);
 		player->SendTalentsInfoData(false);
		break;
	
		}
    return true; }
};

void AddSc_npc_class() {
    new npc_class; }