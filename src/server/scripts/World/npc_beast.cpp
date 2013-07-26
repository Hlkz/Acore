#include "ScriptPCH.h"
#include "Pet.h"

class beast_master : public CreatureScript {
public: beast_master() : CreatureScript("beast_master"){}

void CreatePet(Player *player, Creature * creature, uint32 entry){
	
    if(player->GetPet()){
        creature->MonsterWhisper(player->GetSession()->GetTrinityString(12001), player->GetGUID());
        player->PlayerTalkClass->SendCloseGossip();
        return; }

    Creature *creatureTarget = creature->SummonCreature(entry, player->GetPositionX(), player->GetPositionY()+2, player->GetPositionZ(), player->GetOrientation(), TEMPSUMMON_CORPSE_TIMED_DESPAWN, 500);
    if(!creatureTarget) return;

	Pet*pet = player->CreateTamedPetFrom(creatureTarget, 0);
    if(!pet) return;
	
    creatureTarget->setDeathState(JUST_DIED); // kill original creature
    creatureTarget->RemoveCorpse();
    creatureTarget->SetHealth(0); // just for nice GM-mode view
    pet->SetPower(POWER_HAPPINESS, 1048000);
    pet->SetUInt32Value(UNIT_FIELD_LEVEL, player->getLevel() - 1); // prepare visual effect for levelup
    pet->GetMap()->AddToMap((Creature*)pet);
    pet->SetUInt32Value(UNIT_FIELD_LEVEL, player->getLevel()); // visual effect for levelup
    if(!pet->InitStatsForLevel(player->getLevel()))
		sLog->outError (LOG_FILTER_PETS, "Pet Create fail: no init stats for entry %u", entry);
    pet->UpdateAllStats();
    player->SetMinion(pet, true); // caster have pet now
    pet->SavePetToDB(PET_SAVE_AS_CURRENT);
    pet->InitTalentForLevel();
    player->PetSpellInitialize();
    player->PlayerTalkClass->SendCloseGossip();
    creature->MonsterWhisper(player->GetSession()->GetTrinityString(12002), player->GetGUID());
}


bool OnGossipHello(Player *player, Creature * creature) {

	creature->HasQuestForPlayer(player);
	WorldSession* session = player->GetSession();

    if(player->getClass() != CLASS_HUNTER){
		player->ADD_GOSSIP_ITEM(0, session->GetTrinityString(12000), GOSSIP_SENDER_MAIN, 150);
		player->SEND_GOSSIP_MENU(1000005, creature->GetGUID());
    return true; }
	
    if(player->GetPet()) player->GetPet()->SetPower(POWER_HAPPINESS, 1048000);

    player->ADD_GOSSIP_ITEM(4, session->GetTrinityString(12003), GOSSIP_SENDER_MAIN, 30);
    player->ADD_GOSSIP_ITEM(2, session->GetTrinityString(12004), GOSSIP_SENDER_MAIN, 31);
    player->ADD_GOSSIP_ITEM(5, session->GetTrinityString(12000), GOSSIP_SENDER_MAIN, 150);
    player->SEND_GOSSIP_MENU(1000008, creature->GetGUID());
    return true; }

bool OnGossipSelect(Player *player, Creature * creature, uint32 sender, uint32 action){
	player->PlayerTalkClass->ClearMenus();
	WorldSession* session = player->GetSession();
	
    switch (action){
	
    case 100:
		OnGossipHello(player, creature);
	break;

    case 150: player->CLOSE_GOSSIP_MENU();	break;

    case 30:
        player->ADD_GOSSIP_ITEM(2, session->GetTrinityString(12006), GOSSIP_SENDER_MAIN, 100);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12007), GOSSIP_SENDER_MAIN, 1);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12008), GOSSIP_SENDER_MAIN, 2);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12009), GOSSIP_SENDER_MAIN, 93);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12010), GOSSIP_SENDER_MAIN, 4);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12011), GOSSIP_SENDER_MAIN, 5);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12012), GOSSIP_SENDER_MAIN, 6);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12013), GOSSIP_SENDER_MAIN, 7);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12014), GOSSIP_SENDER_MAIN, 8);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12015), GOSSIP_SENDER_MAIN, 9);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12016), GOSSIP_SENDER_MAIN, 10);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12017), GOSSIP_SENDER_MAIN, 11);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12018), GOSSIP_SENDER_MAIN, 12);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12019), GOSSIP_SENDER_MAIN, 13);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12020), GOSSIP_SENDER_MAIN, 914);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12021), GOSSIP_SENDER_MAIN, 15);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12022), GOSSIP_SENDER_MAIN, 16);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12023), GOSSIP_SENDER_MAIN, 17);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12024), GOSSIP_SENDER_MAIN, 18);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12025), GOSSIP_SENDER_MAIN, 19);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12026), GOSSIP_SENDER_MAIN, 20);
        player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(12027), GOSSIP_SENDER_MAIN, 21);
        player->SEND_GOSSIP_MENU(1000008, creature->GetGUID());
    break;
	
    case 31: player->GetSession()->SendStablePet(creature->GetGUID()); break;

		case 1: /*Araignée*/			CreatePet(player, creature, 2349);	break;
		case 2: /*Charognard*/			CreatePet(player, creature, 26838);	break;
		case 93: /*Chauve-souris*/		CreatePet(player, creature, 28233);	break;
		case 4: /*Crabe*/				CreatePet(player, creature, 24478);	break;  
		case 5: /*Crocilisque*/			CreatePet(player, creature, 1417);	break;  
		case 6: /*Faucon dragon*/		CreatePet(player, creature, 27946);	break;
		case 7: /*Félin*/				CreatePet(player, creature, 28097);	break;
		case 8: /*Gorille*/				CreatePet(player, creature, 1557);	break;
		case 9: /*Haut-trotteur*/		CreatePet(player, creature, 3068);	break;
		case 10: /*Hyène*/				CreatePet(player, creature, 13036);	break;
		case 11: /*Loup*/				CreatePet(player, creature, 2753);	break;
		case 12: /*Oiseau de proie*/	CreatePet(player, creature, 23136);	break;
		case 13: /*Ours*/				CreatePet(player, creature, 29319);	break;
        case 14: /*Phalène*/			CreatePet(player, creature, 27421);	break;
		case 15: /*Raptor*/				CreatePet(player, creature, 14821);	break;
		case 16: /*Ravageur*/			CreatePet(player, creature, 17199);	break;
		case 17: /*Sanglier*/			CreatePet(player, creature, 29996);	break;
		case 18: /*Scorpide*/			CreatePet(player, creature, 9698);	break;
		case 19: /*Serpent*/			CreatePet(player, creature, 28358);	break;
		case 20: /*Serpent des vents*/	CreatePet(player, creature, 5349);	break;
		case 21: /*Tortue*/				CreatePet(player, creature, 25482);	break;
	}
    return true; }
};

void AddSc_beast_master(){	new beast_master();	}