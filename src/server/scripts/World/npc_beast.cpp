#include "ScriptPCH.h"
#include "Pet.h"

enum NpcBeast
{
    LANG_BEAST_SPIDER         = 12007,
    LANG_BEAST_CARRION        = 12008,
    LANG_BEAST_BAT            = 12009,
    LANG_BEAST_CRAB           = 12010,
    LANG_BEAST_CROCOLISK      = 12011,
    LANG_BEAST_DRAGONHAWK     = 12012,
    LANG_BEAST_CAT            = 12013,
    LANG_BEAST_GORILLA        = 12014,
    LANG_BEAST_STRIDER        = 12015,
    LANG_BEAST_HYENA          = 12016,
    LANG_BEAST_HOUND          = 12017,
    LANG_BEAST_OWL            = 12018,
    LANG_BEAST_BEAR           = 12019,
    LANG_BEAST_MOTH           = 12020,
    LANG_BEAST_RAPTOR         = 12021,
    LANG_BEAST_RAVAGER        = 12022,
    LANG_BEAST_BOAR           = 12023,
    LANG_BEAST_SCORPID        = 12024,
    LANG_BEAST_SERPENT        = 12025,
    LANG_BEAST_WINDSERPENT    = 12026,
    LANG_BEAST_TURTLE         = 12027
};

class npc_beast : public CreatureScript
{
public:
    npc_beast() : CreatureScript("npc_beast") { }

    void CreatePet(Player *player, Creature * creature, uint32 entry)
    {
        if (player->GetPet())
        {
            creature->MonsterWhisper(player->GetSession()->GetTrinityString(12001), player->GetGUID());
            player->PlayerTalkClass->SendCloseGossip();
            return;
        }

        Creature *creatureTarget = creature->SummonCreature(entry, player->GetPositionX(), player->GetPositionY()+2, player->GetPositionZ(), player->GetOrientation(), TEMPSUMMON_CORPSE_TIMED_DESPAWN, 500);
        if(!creatureTarget)
            return;
        Pet*pet = player->CreateTamedPetFrom(creatureTarget, 0);
        if (!pet)
            return;

        creatureTarget->setDeathState(JUST_DIED); // kill original creature
        creatureTarget->RemoveCorpse();
        creatureTarget->SetHealth(0); // just for nice GM-mode view
        pet->SetPower(POWER_HAPPINESS, 1048000);
        pet->SetUInt32Value(UNIT_FIELD_LEVEL, player->getLevel() - 1); // prepare visual effect for levelup
        pet->GetMap()->AddToMap((Creature*)pet);
        pet->SetUInt32Value(UNIT_FIELD_LEVEL, player->getLevel()); // visual effect for levelup
        if (!pet->InitStatsForLevel(player->getLevel()))
            TC_LOG_ERROR("entities.pet", "Pet Create fail: no init stats for entry %u", entry);
        pet->UpdateAllStats();
        player->SetMinion(pet, true); // caster have pet now
        pet->SavePetToDB(PET_SAVE_AS_CURRENT);
        pet->InitTalentForLevel();
        player->PetSpellInitialize();
        player->PlayerTalkClass->SendCloseGossip();
        creature->MonsterWhisper(player->GetSession()->GetTrinityString(12002), player->GetGUID());
    }

    bool OnGossipHello(Player *player, Creature * creature)
    {
        WorldSession* session = player->GetSession();
        creature->HasQuestForPlayer(player);

        if(player->getClass() != CLASS_HUNTER)
        {
            player->ADD_GOSSIP_ITEM(0, session->GetTrinityString(12000), GOSSIP_SENDER_MAIN, 150);
            player->SEND_GOSSIP_MENU(100002, creature->GetGUID());
            return true;
        }

        player->ADD_GOSSIP_ITEM(4, session->GetTrinityString(12003), GOSSIP_SENDER_MAIN, 30);
        player->ADD_GOSSIP_ITEM(2, session->GetTrinityString(12004), GOSSIP_SENDER_MAIN, 31);
        player->ADD_GOSSIP_ITEM(5, session->GetTrinityString(12000), GOSSIP_SENDER_MAIN, 150);
        player->SEND_GOSSIP_MENU(player->GetDefaultGossipMenuForSource(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player *player, Creature * creature, uint32 sender, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        WorldSession* session = player->GetSession();

        switch (action) {

        case 100: OnGossipHello(player, creature); break;

        case 150: player->CLOSE_GOSSIP_MENU();    break;

        case 30:
            player->ADD_GOSSIP_ITEM(2, session->GetTrinityString(12041), GOSSIP_SENDER_MAIN, 100);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_SPIDER), GOSSIP_SENDER_MAIN, 1);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_CARRION), GOSSIP_SENDER_MAIN, 2);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_BAT), GOSSIP_SENDER_MAIN, 93);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_CRAB), GOSSIP_SENDER_MAIN, 4);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_CROCOLISK), GOSSIP_SENDER_MAIN, 5);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_DRAGONHAWK), GOSSIP_SENDER_MAIN, 6);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_CAT), GOSSIP_SENDER_MAIN, 7);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_GORILLA), GOSSIP_SENDER_MAIN, 8);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_STRIDER), GOSSIP_SENDER_MAIN, 9);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_HYENA), GOSSIP_SENDER_MAIN, 10);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_HOUND), GOSSIP_SENDER_MAIN, 11);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_OWL), GOSSIP_SENDER_MAIN, 12);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_BEAR), GOSSIP_SENDER_MAIN, 13);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_MOTH), GOSSIP_SENDER_MAIN, 914);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_RAPTOR), GOSSIP_SENDER_MAIN, 15);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_RAVAGER), GOSSIP_SENDER_MAIN, 16);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_BOAR), GOSSIP_SENDER_MAIN, 17);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_SCORPID), GOSSIP_SENDER_MAIN, 18);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_SERPENT), GOSSIP_SENDER_MAIN, 19);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_WINDSERPENT), GOSSIP_SENDER_MAIN, 20);
            player->ADD_GOSSIP_ITEM(6, session->GetTrinityString(LANG_BEAST_TURTLE), GOSSIP_SENDER_MAIN, 21);
            player->SEND_GOSSIP_MENU(player->GetDefaultGossipMenuForSource(creature), creature->GetGUID());
            break;

        case 31: player->GetSession()->SendStablePet(creature->GetGUID()); break;

        case 1: /*Araignée*/            CreatePet(player, creature, 2349);     break;
        case 2: /*Charognard*/          CreatePet(player, creature, 26838);    break;
        case 93: /*Chauve-souris*/      CreatePet(player, creature, 28233);    break;
        case 4: /*Crabe*/               CreatePet(player, creature, 24478);    break;
        case 5: /*Crocilisque*/         CreatePet(player, creature, 1417);     break;
        case 6: /*Faucon dragon*/       CreatePet(player, creature, 27946);    break;
        case 7: /*Félin*/               CreatePet(player, creature, 28097);    break;
        case 8: /*Gorille*/             CreatePet(player, creature, 1557);     break;
        case 9: /*Haut-trotteur*/       CreatePet(player, creature, 3068);     break;
        case 10: /*Hyène*/              CreatePet(player, creature, 13036);    break;
        case 11: /*Loup*/               CreatePet(player, creature, 2753);     break;
        case 12: /*Oiseau de proie*/    CreatePet(player, creature, 23136);    break;
        case 13: /*Ours*/               CreatePet(player, creature, 29319);    break;
        case 14: /*Phalène*/            CreatePet(player, creature, 27421);    break;
        case 15: /*Raptor*/             CreatePet(player, creature, 14821);    break;
        case 16: /*Ravageur*/           CreatePet(player, creature, 17199);    break;
        case 17: /*Sanglier*/           CreatePet(player, creature, 29996);    break;
        case 18: /*Scorpide*/           CreatePet(player, creature, 9698);     break;
        case 19: /*Serpent*/            CreatePet(player, creature, 28358);    break;
        case 20: /*Serpent des vents*/  CreatePet(player, creature, 5349);     break;
        case 21: /*Tortue*/             CreatePet(player, creature, 25482);    break;
        }
        return true;
    }
};

void AddSC_npc_beast()
{
    new npc_beast();
}
