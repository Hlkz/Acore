
#include "Creature.h"
#include "CreatureAI.h"
#include "DatabaseEnv.h"
#include "GameObject.h"
#include "Group.h"
#include "MapScript.h"
#include "Log.h"
#include "Map.h"
#include "Player.h"
#include "Pet.h"
#include "WorldSession.h"
#include "Opcodes.h"

void WMScript::HandleGameObject(uint64 GUID, bool open, GameObject* go)
{
    if (!go)
        go = world->GetGameObject(GUID);
    if (go)
        go->SetGoState(open ? GO_STATE_ACTIVE : GO_STATE_READY);
    else
        TC_LOG_DEBUG(LOG_FILTER_TSCR, "WorldScript: HandleGameObject failed");
}

void WMScript::DoUseDoorOrButton(uint64 uiGuid, uint32 uiWithRestoreTime, bool bUseAlternativeState)
{
    if (!uiGuid)
        return;

    GameObject* go = world->GetGameObject(uiGuid);

    if (go)
    {
        if (go->GetGoType() == GAMEOBJECT_TYPE_DOOR || go->GetGoType() == GAMEOBJECT_TYPE_BUTTON)
        {
            if (go->getLootState() == GO_READY)
                go->UseDoorOrButton(uiWithRestoreTime, bUseAlternativeState);
            else if (go->getLootState() == GO_ACTIVATED)
                go->ResetDoorOrButton();
        }
        else
            TC_LOG_ERROR(LOG_FILTER_GENERAL, "SD2: Script call DoUseDoorOrButton, but gameobject entry %u is type %u.", go->GetEntry(), go->GetGoType());
    }
}

void WMScript::DoRespawnGameObject(uint64 uiGuid, uint32 uiTimeToDespawn)
{
    if (GameObject* go = world->GetGameObject(uiGuid))
    {
        //not expect any of these should ever be handled
        if (go->GetGoType() == GAMEOBJECT_TYPE_FISHINGNODE || go->GetGoType() == GAMEOBJECT_TYPE_DOOR ||
            go->GetGoType() == GAMEOBJECT_TYPE_BUTTON || go->GetGoType() == GAMEOBJECT_TYPE_TRAP)
            return;

        if (go->isSpawned())
            return;

        go->SetRespawnTime(uiTimeToDespawn);
    }
}

void WMScript::DoUpdateWorldState(uint32 uiStateId, uint32 uiStateData)
{
    Map::PlayerList const& lPlayers = world->GetPlayers();

    if (!lPlayers.isEmpty())
    {
        for (Map::PlayerList::const_iterator itr = lPlayers.begin(); itr != lPlayers.end(); ++itr)
            if (Player* player = itr->GetSource())
                player->SendUpdateWorldState(uiStateId, uiStateData);
    }
    else
        TC_LOG_DEBUG(LOG_FILTER_TSCR, "DoUpdateWorldState attempt send data but no players in map.");
}

// Update Achievement Criteria for all players in instance
void WMScript::DoUpdateAchievementCriteria(AchievementCriteriaTypes type, uint32 miscValue1 /*= 0*/, uint32 miscValue2 /*= 0*/, Unit* unit /*= NULL*/)
{
    Map::PlayerList const &PlayerList = world->GetPlayers();

    if (!PlayerList.isEmpty())
        for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
            if (Player* player = i->GetSource())
                player->UpdateAchievementCriteria(type, miscValue1, miscValue2, unit);
}

// Start timed achievement for all players in instance
void WMScript::DoStartTimedAchievement(AchievementCriteriaTimedTypes type, uint32 entry)
{
    Map::PlayerList const &PlayerList = world->GetPlayers();

    if (!PlayerList.isEmpty())
        for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
            if (Player* player = i->GetSource())
                player->StartTimedAchievement(type, entry);
}

// Stop timed achievement for all players in instance
void WMScript::DoStopTimedAchievement(AchievementCriteriaTimedTypes type, uint32 entry)
{
    Map::PlayerList const &PlayerList = world->GetPlayers();

    if (!PlayerList.isEmpty())
        for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
            if (Player* player = i->GetSource())
                player->RemoveTimedAchievement(type, entry);
}

// Remove Auras due to Spell on all players in instance
void WMScript::DoRemoveAurasDueToSpellOnPlayers(uint32 spell)
{
    Map::PlayerList const& PlayerList = world->GetPlayers();
    if (!PlayerList.isEmpty())
    {
        for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
        {
            if (Player* player = itr->GetSource())
            {
                player->RemoveAurasDueToSpell(spell);
                if (Pet* pet = player->GetPet())
                    pet->RemoveAurasDueToSpell(spell);
            }
        }
    }
}

// Cast spell on all players in instance
void WMScript::DoCastSpellOnPlayers(uint32 spell)
{
    Map::PlayerList const &PlayerList = world->GetPlayers();

    if (!PlayerList.isEmpty())
        for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
            if (Player* player = i->GetSource())
                player->CastSpell(player, spell, true);
}

bool WMScript::CheckAchievementCriteriaMeet(uint32 criteria_id, Player const* /*source*/, Unit const* /*target*/ /*= NULL*/, uint32 /*miscvalue1*/ /*= 0*/)
{
    TC_LOG_ERROR(LOG_FILTER_GENERAL, "Achievement system call InstanceScript::CheckAchievementCriteriaMeet but instance script for map %u not have implementation for achievement criteria %u",
        world->GetId(), criteria_id);
    return false;
}
