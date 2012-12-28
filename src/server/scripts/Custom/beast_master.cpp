#include "ScriptPCH.h"

class beast_master : public CreatureScript {
public: beast_master() : CreatureScript("beast_master"){}

void CreatePet(Player *player, Creature * m_creature, uint32 entry){
    if(player->getClass() != CLASS_HUNTER){
		player->ADD_GOSSIP_ITEM(0, "Au revoir.", GOSSIP_SENDER_MAIN, 3);
		player->SEND_GOSSIP_MENU(1000005, m_creature->GetGUID());
		return; }

    if(player->GetPet()){
        m_creature->MonsterWhisper("Vous devez d'abord abandonner votre familier.", player->GetGUID());
        player->PlayerTalkClass->SendCloseGossip();
        return; }

    Creature *creatureTarget = m_creature->SummonCreature(entry, player->GetPositionX(), player->GetPositionY()+2, player->GetPositionZ(), player->GetOrientation(), TEMPSUMMON_CORPSE_TIMED_DESPAWN, 500);
    if(!creatureTarget) return;

	Pet*pet = player->CreateTamedPetFrom(creatureTarget, 0);
    if(!pet) return;
	
    // kill original creature
    creatureTarget->setDeathState(JUST_DIED);
    creatureTarget->RemoveCorpse();
    creatureTarget->SetHealth(0);              // just for nice GM-mode view
	/*
    pet->SetPower(POWER_HAPPINESS, 1048000);

    //pet->SetUInt32Value(UNIT_FIELD_PETEXPERIENCE,0);
    //pet->SetUInt32Value(UNIT_FIELD_PETNEXTLEVELEXP, uint32((Trinity::XP::xp_to_level(70))/4));

    // prepare visual effect for levelup
    pet->SetUInt32Value(UNIT_FIELD_LEVEL, player->getLevel() - 1);
    pet->GetMap()->AddToMap((Creature*)pet);
    // visual effect for levelup
    pet->SetUInt32Value(UNIT_FIELD_LEVEL, player->getLevel());

//    if(!pet->InitStatsForLevel(player->getLevel()))
//		sLog->outError ("Pet Create fail: no init stats for entry %u", entry);

    pet->UpdateAllStats();
    // caster have pet now
    player->SetMinion(pet, true);
    pet->SavePetToDB(PET_SAVE_AS_CURRENT);
    pet->InitTalentForLevel(); */
    player->PetSpellInitialize();
    //end
    player->PlayerTalkClass->SendCloseGossip();
    m_creature->MonsterWhisper("Familier ajouté.", player->GetGUID());
        }


bool OnGossipHello(Player *player, Creature * m_creature){

    if(player->getClass() != CLASS_HUNTER){
		player->ADD_GOSSIP_ITEM(0, "Au revoir.", GOSSIP_SENDER_MAIN, 150);
		player->SEND_GOSSIP_MENU(1000005, m_creature->GetGUID());
    return true; }

    player->ADD_GOSSIP_ITEM(4, "J'aimerais nouveau familier.", GOSSIP_SENDER_MAIN, 30);
    player->ADD_GOSSIP_ITEM(2, "Ecurie", GOSSIP_SENDER_MAIN, GOSSIP_OPTION_STABLEPET);
    player->ADD_GOSSIP_ITEM(6, "J'aimerais de quoi nourrir mon familier.", GOSSIP_SENDER_MAIN, GOSSIP_OPTION_VENDOR);
    player->ADD_GOSSIP_ITEM(5, "Au revoir.", GOSSIP_SENDER_MAIN, 150);
    player->SEND_GOSSIP_MENU(1000008, m_creature->GetGUID());
    return true; }

bool OnGossipSelect(Player *player, Creature * m_creature, uint32 sender, uint32 action){
	player->PlayerTalkClass->ClearMenus();
	
    switch (action){
	
    case 100:
		player->ADD_GOSSIP_ITEM(4, "J'aimerais un nouveau familier.", GOSSIP_SENDER_MAIN, 30);
		player->ADD_GOSSIP_ITEM(2, "Ecurie", GOSSIP_SENDER_MAIN, GOSSIP_OPTION_STABLEPET);
		player->ADD_GOSSIP_ITEM(6, "J'aimerais de quoi nourrir mon familier.", GOSSIP_SENDER_MAIN, GOSSIP_OPTION_VENDOR);
		player->ADD_GOSSIP_ITEM(5, "Au revoir.", GOSSIP_SENDER_MAIN, 150);
		player->SEND_GOSSIP_MENU(1000008, m_creature->GetGUID());
	break;

    case 150:	player->CLOSE_GOSSIP_MENU();	break;

    case 30:
        player->ADD_GOSSIP_ITEM(2, "<= Menu Principal", GOSSIP_SENDER_MAIN, 100);
        player->ADD_GOSSIP_ITEM(6, "Araignée.", GOSSIP_SENDER_MAIN, 1);
        player->ADD_GOSSIP_ITEM(6, "Charognard.", GOSSIP_SENDER_MAIN, 2);
        player->ADD_GOSSIP_ITEM(6, "Chauve-souris.", GOSSIP_SENDER_MAIN, 93);
        player->ADD_GOSSIP_ITEM(6, "Crabe.", GOSSIP_SENDER_MAIN, 4);
        player->ADD_GOSSIP_ITEM(6, "Crocilisque.", GOSSIP_SENDER_MAIN, 5);
        player->ADD_GOSSIP_ITEM(6, "Faucon-dragon.", GOSSIP_SENDER_MAIN, 6);
        player->ADD_GOSSIP_ITEM(6, "Félin.", GOSSIP_SENDER_MAIN, 7);
        player->ADD_GOSSIP_ITEM(6, "Gorille.", GOSSIP_SENDER_MAIN, 8);
        player->ADD_GOSSIP_ITEM(6, "Haut-trotteur.", GOSSIP_SENDER_MAIN, 9);
        player->ADD_GOSSIP_ITEM(6, "Hyene.", GOSSIP_SENDER_MAIN, 10);
        player->ADD_GOSSIP_ITEM(6, "Loup.", GOSSIP_SENDER_MAIN, 11);
        player->ADD_GOSSIP_ITEM(6, "Oiseau de proie.", GOSSIP_SENDER_MAIN, 12);
        player->ADD_GOSSIP_ITEM(6, "Ours.", GOSSIP_SENDER_MAIN, 13);
        player->ADD_GOSSIP_ITEM(6, "Phalène.", GOSSIP_SENDER_MAIN, 914);
        player->ADD_GOSSIP_ITEM(6, "Raptor.", GOSSIP_SENDER_MAIN, 15);
        player->ADD_GOSSIP_ITEM(6, "Ravageur.", GOSSIP_SENDER_MAIN, 16);
        player->ADD_GOSSIP_ITEM(6, "Sanglier.", GOSSIP_SENDER_MAIN, 17);
        player->ADD_GOSSIP_ITEM(6, "Scorpide.", GOSSIP_SENDER_MAIN, 18);
        player->ADD_GOSSIP_ITEM(6, "Serpent.", GOSSIP_SENDER_MAIN, 19);
        player->ADD_GOSSIP_ITEM(6, "Serpent des vents.", GOSSIP_SENDER_MAIN, 20);
        player->ADD_GOSSIP_ITEM(6, "Tortue.", GOSSIP_SENDER_MAIN, 21);
        player->SEND_GOSSIP_MENU(1000008, m_creature->GetGUID());
    break;

    case GOSSIP_OPTION_STABLEPET:	player->GetSession()->SendStablePet(m_creature->GetGUID());			break;
    case GOSSIP_OPTION_VENDOR:		player->GetSession()->SendListInventory(m_creature->GetGUID());		break;

		case 1: /*Araignée*/			CreatePet(player, m_creature, 2349);	break;
		case 2: /*Charognard*/			CreatePet(player, m_creature, 26838);	break;
		case 93: /*Chauve-souris*/		CreatePet(player, m_creature, 28233);	break;
		case 4: /*Crabe*/				CreatePet(player, m_creature, 24478);	break;  
		case 5: /*Crocilisque*/			CreatePet(player, m_creature, 1417);	break;  
		case 6: /*Faucon dragon*/		CreatePet(player, m_creature, 27946);	break;
		case 7: /*Félin*/				CreatePet(player, m_creature, 28097);	break;
		case 8: /*Gorille*/				CreatePet(player, m_creature, 1557);	break;
		case 9: /*Haut-trotteur*/		CreatePet(player, m_creature, 3068);	break;
		case 10: /*Hyène*/				CreatePet(player, m_creature, 13036);	break;
		case 11: /*Loup*/				CreatePet(player, m_creature, 2753);	break;
		case 12: /*Oiseau de proie*/	CreatePet(player, m_creature, 23136);	break;
		case 13: /*Ours*/				CreatePet(player, m_creature, 29319);	break;
        case 914: /*Phalène*/			CreatePet(player, m_creature, 27421);	break;
		case 15: /*Raptor*/				CreatePet(player, m_creature, 14821);	break;
		case 16: /*Ravageur*/			CreatePet(player, m_creature, 17199);	break;
		case 17: /*Sanglier*/			CreatePet(player, m_creature, 29996);	break;
		case 18: /*Scorpide*/			CreatePet(player, m_creature, 9698);	break;
		case 19: /*Serpent*/			CreatePet(player, m_creature, 28358);	break;
		case 20: /*Serpent des vents*/	CreatePet(player, m_creature, 5349);	break;
		case 21: /*Tortue*/				CreatePet(player, m_creature, 25482);	break;
	}
    return true; }
};

void AddSc_beast_master(){	new beast_master();	}