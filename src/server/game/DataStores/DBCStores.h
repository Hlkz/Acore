/*
 * Copyright (C) 2008-2014 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef TRINITY_DBCSTORES_H
#define TRINITY_DBCSTORES_H

#include "Common.h"
#include "DBCStore.h"
#include "DBCStructure.h"

#include <list>

typedef std::list<uint32> SimpleFactionsList;
SimpleFactionsList const* GetFactionTeamList(uint32 faction);

char* GetPetName(uint32 petfamily, uint32 dbclang);
uint32 GetTalentSpellCost(uint32 spellId);
TalentSpellPos const* GetTalentSpellPos(uint32 spellId);

int32 GetAreaFlagByAreaID(uint32 area_id);                  // -1 if not found
AreaTableEntry const* GetAreaEntryByAreaID(uint32 area_id);
AreaTableEntry const* GetAreaEntryByAreaFlagAndMap(uint32 area_flag, uint32 map_id);
uint32 GetAreaFlagByMapId(uint32 mapid);

char const* GetRaceName(uint8 race, uint8 locale);
char const* GetClassName(uint8 class_, uint8 locale);

WMOAreaTableEntry const* GetWMOAreaTableEntryByTripple(int32 rootid, int32 adtid, int32 groupid);

uint32 GetVirtualMapForMapAndZone(uint32 mapid, uint32 zoneId);

enum ContentLevels
{
    CONTENT_1_60 = 0,
    CONTENT_61_70,
    CONTENT_71_80
};
ContentLevels GetContentLevelsForMapAndZone(uint32 mapid, uint32 zoneId);

bool IsTotemCategoryCompatiableWith(uint32 itemTotemCategoryId, uint32 requiredTotemCategoryId);

void Zone2MapCoordinates(float &x, float &y, uint32 zone);
void Map2ZoneCoordinates(float &x, float &y, uint32 zone);

typedef std::map<uint32/*pair32(map, diff)*/, MapDifficulty> MapDifficultyMap;
MapDifficulty const* GetMapDifficultyData(uint32 mapId, Difficulty difficulty);
MapDifficulty const* GetDownscaledMapDifficultyData(uint32 mapId, Difficulty &difficulty);

uint32 const* /*[MAX_TALENT_TABS]*/ GetTalentTabPages(uint8 cls);

uint32 GetLiquidFlags(uint32 liquidType);

PvPDifficultyEntry const* GetBattlegroundBracketByLevel(uint32 mapid, uint32 level);
PvPDifficultyEntry const* GetBattlegroundBracketById(uint32 mapid, BattlegroundBracketId id);

CharStartOutfitEntry const* GetCharStartOutfitEntry(uint8 race, uint8 class_, uint8 gender);

LFGDungeonEntry const* GetLFGDungeon(uint32 mapId, Difficulty difficulty);

uint32 GetDefaultMapLight(uint32 mapId);

extern DBCStorage <AreaGroupEntry>               sAreaGroupStore;
extern DBCStorage <AreaTriggerEntry>             sAreaTriggerStore;
extern DBCStorage <AuctionHouseEntry>            sAuctionHouseStore;
extern DBCStorage <BankBagSlotPricesEntry>       sBankBagSlotPricesStore;
extern DBCStorage <BannedAddOnsEntry>            sBannedAddOnsStore;
extern DBCStorage <BarberShopStyleEntry>         sBarberShopStyleStore;
extern DBCStorage <ChatChannelsEntry>            sChatChannelsStore;
extern DBCStorage <CharStartOutfitEntry>         sCharStartOutfitStore;
extern DBCStorage <ChrClassesEntry>              sChrClassesStore;
extern DBCStorage <ChrRacesEntry>                sChrRacesStore;
extern DBCStorage <CinematicSequencesEntry>      sCinematicSequencesStore;
extern DBCStorage <CreatureDisplayInfoEntry>     sCreatureDisplayInfoStore;
extern DBCStorage <CreatureDisplayInfoExtraEntry> sCreatureDisplayInfoExtraStore;
extern DBCStorage <CreatureFamilyEntry>          sCreatureFamilyStore;
extern DBCStorage <CreatureModelDataEntry>       sCreatureModelDataStore;
extern DBCStorage <CreatureSpellDataEntry>       sCreatureSpellDataStore;
extern DBCStorage <CreatureTypeEntry>            sCreatureTypeStore;
extern DBCStorage <CurrencyTypesEntry>           sCurrencyTypesStore;
extern DBCStorage <DestructibleModelDataEntry>   sDestructibleModelDataStore;
extern DBCStorage <DungeonEncounterEntry>        sDungeonEncounterStore;
extern DBCStorage <DurabilityCostsEntry>         sDurabilityCostsStore;
extern DBCStorage <DurabilityQualityEntry>       sDurabilityQualityStore;
extern DBCStorage <EmotesEntry>                  sEmotesStore;
extern DBCStorage <EmotesTextEntry>              sEmotesTextStore;
extern DBCStorage <GameObjectDisplayInfoEntry>   sGameObjectDisplayInfoStore;
extern DBCStorage <GemPropertiesEntry>           sGemPropertiesStore;
extern DBCStorage <GlyphPropertiesEntry>         sGlyphPropertiesStore;
extern DBCStorage <GlyphSlotEntry>               sGlyphSlotStore;

extern DBCStorage <GtBarberShopCostBaseEntry>    sGtBarberShopCostBaseStore;
extern DBCStorage <GtCombatRatingsEntry>         sGtCombatRatingsStore;
extern DBCStorage <GtChanceToMeleeCritBaseEntry> sGtChanceToMeleeCritBaseStore;
extern DBCStorage <GtChanceToMeleeCritEntry>     sGtChanceToMeleeCritStore;
extern DBCStorage <GtChanceToSpellCritBaseEntry> sGtChanceToSpellCritBaseStore;
extern DBCStorage <GtChanceToSpellCritEntry>     sGtChanceToSpellCritStore;
extern DBCStorage <GtNPCManaCostScalerEntry>     sGtNPCManaCostScalerStore;
extern DBCStorage <GtOCTClassCombatRatingScalarEntry> sGtOCTClassCombatRatingScalarStore;
extern DBCStorage <GtOCTRegenHPEntry>            sGtOCTRegenHPStore;
//extern DBCStorage <GtOCTRegenMPEntry>            sGtOCTRegenMPStore; -- not used currently
extern DBCStorage <GtRegenHPPerSptEntry>         sGtRegenHPPerSptStore;
extern DBCStorage <GtRegenMPPerSptEntry>         sGtRegenMPPerSptStore;
extern DBCStorage <HolidaysEntry>                sHolidaysStore;
extern DBCStorage <ItemBagFamilyEntry>           sItemBagFamilyStore;
//extern DBCStorage <ItemDisplayInfoEntry>      sItemDisplayInfoStore; -- not used currently
extern DBCStorage <ItemLimitCategoryEntry>       sItemLimitCategoryStore;
extern DBCStorage <ItemRandomPropertiesEntry>    sItemRandomPropertiesStore;
extern DBCStorage <ItemRandomSuffixEntry>        sItemRandomSuffixStore;
extern DBCStorage <ItemSetEntry>                 sItemSetStore;
extern DBCStorage <LFGDungeonEntry>              sLFGDungeonStore;
extern DBCStorage <LiquidTypeEntry>              sLiquidTypeStore;
extern DBCStorage <LockEntry>                    sLockStore;
extern DBCStorage <MailTemplateEntry>            sMailTemplateStore;
extern MapDifficultyMap                          sMapDifficultyMap;
extern DBCStorage <MovieEntry>                   sMovieStore;
extern DBCStorage <OverrideSpellDataEntry>       sOverrideSpellDataStore;
extern DBCStorage <PowerDisplayEntry>            sPowerDisplayStore;
extern DBCStorage <QuestSortEntry>               sQuestSortStore;
extern DBCStorage <QuestXPEntry>                 sQuestXPStore;
extern DBCStorage <QuestFactionRewEntry>         sQuestFactionRewardStore;
extern DBCStorage <RandomPropertiesPointsEntry>  sRandomPropertiesPointsStore;
extern DBCStorage <ScalingStatDistributionEntry> sScalingStatDistributionStore;
extern DBCStorage <ScalingStatValuesEntry>       sScalingStatValuesStore;
extern DBCStorage <SkillLineEntry>               sSkillLineStore;
extern DBCStorage <SkillLineAbilityEntry>        sSkillLineAbilityStore;
extern DBCStorage <SoundEntriesEntry>            sSoundEntriesStore;
extern DBCStorage <SpellCastTimesEntry>          sSpellCastTimesStore;
extern DBCStorage <SpellCategoryEntry>           sSpellCategoryStore;
extern DBCStorage <SpellDurationEntry>           sSpellDurationStore;
extern DBCStorage <SpellFocusObjectEntry>        sSpellFocusObjectStore;
extern DBCStorage <SpellItemEnchantmentEntry>    sSpellItemEnchantmentStore;
extern DBCStorage <SpellItemEnchantmentConditionEntry> sSpellItemEnchantmentConditionStore;
extern SpellCategoryStore                        sSpellsByCategoryStore;
extern PetFamilySpellsStore                      sPetFamilySpellsStore;
extern DBCStorage <SpellRadiusEntry>             sSpellRadiusStore;
extern DBCStorage <SpellRangeEntry>              sSpellRangeStore;
extern DBCStorage <SpellRuneCostEntry>           sSpellRuneCostStore;
extern DBCStorage <SpellShapeshiftEntry>         sSpellShapeshiftStore;
extern DBCStorage <StableSlotPricesEntry>        sStableSlotPricesStore;
extern DBCStorage <SummonPropertiesEntry>        sSummonPropertiesStore;
extern DBCStorage <TalentTabEntry>               sTalentTabStore;
extern DBCStorage <TaxiNodesEntry>               sTaxiNodesStore;
extern DBCStorage <TaxiPathEntry>                sTaxiPathStore;
extern TaxiMask                                  sTaxiNodesMask;
extern TaxiMask                                  sOldContinentsNodesMask;
extern TaxiMask                                  sHordeTaxiNodesMask;
extern TaxiMask                                  sAllianceTaxiNodesMask;
extern TaxiMask                                  sDeathKnightTaxiNodesMask;
extern TaxiPathSetBySource                       sTaxiPathSetBySource;
extern TaxiPathNodesByPath                       sTaxiPathNodesByPath;
extern DBCStorage <TeamContributionPointsEntry>  sTeamContributionPointsStore;
extern DBCStorage <TotemCategoryEntry>           sTotemCategoryStore;
extern DBCStorage <VehicleEntry>                 sVehicleStore;
extern DBCStorage <VehicleSeatEntry>             sVehicleSeatStore;
extern DBCStorage <WMOAreaTableEntry>            sWMOAreaTableStore;
//extern DBCStorage <WorldMapAreaEntry>           sWorldMapAreaStore; -- use Zone2MapCoordinates and Map2ZoneCoordinates
extern DBCStorage <WorldMapOverlayEntry>         sWorldMapOverlayStore;
extern DBCStorage <WorldSafeLocsEntry>           sWorldSafeLocsStore;

void LoadDBCStores(const std::string& dataPath);

typedef std::unordered_map<uint32, const AchievementEntry*> AchievementContainer;
typedef std::unordered_map<uint32, const AchievementCriteriaEntry*> AchievementCriteriaContainer;
typedef std::unordered_map<uint32, const AreaPOIEntry*> AreaPOIContainer;
typedef std::unordered_map<uint32, const AreaTableEntry*> AreaTableContainer;
typedef std::unordered_map<uint32, const BattlemasterListEntry*> BattlemasterListContainer;
typedef std::unordered_map<uint32, const CharTitlesEntry*> CharTitlesContainer;
typedef std::unordered_map<uint32, const FactionEntry*> FactionContainer;
typedef std::unordered_map<uint32, const FactionTemplateEntry*> FactionTemplateContainer;
typedef std::unordered_map<uint32, const ItemExtendedCostEntry*> ItemExtendedCostContainer;
typedef std::unordered_map<uint32, const MapEntry*> MapContainer;
typedef std::unordered_map<uint32, const MapDifficultyEntry*> MapDifficultyContainer;
typedef std::unordered_map<uint32, const SpellDifficultyEntry*> SpellDifficultyContainer;
typedef std::unordered_map<uint32, const TalentEntry*> TalentContainer;

class DBCMgr
{
    friend class ACE_Singleton<DBCMgr, ACE_Null_Mutex>;
    private:
        DBCMgr() { }
        ~DBCMgr() { }

    public:

        void LoadAchievementStore();
        void LoadAchievementCriteriaStore();
        void LoadAreaPOIStore();
        void LoadAreaTableStore();
        void LoadBattlemasterListStore();
        void LoadCharTitlesStore();
        void LoadFactionStore();
        void LoadFactionTemplateStore();
        void LoadItemExtendedCostStore();
        void LoadMapStore();
        void LoadMapDifficultyStore();
        void LoadSpellDifficultyStore();
        void LoadTalentStore();

        const AchievementEntry* GetAchievementEntry(uint32 ID) const { AchievementContainer::const_iterator itr = AchievementStore.find(ID); if (itr != AchievementStore.end()) return itr->second; return NULL; }
        const AchievementCriteriaEntry* GetAchievementCriteriaEntry(uint32 ID) const { AchievementCriteriaContainer::const_iterator itr = AchievementCriteriaStore.find(ID); if (itr != AchievementCriteriaStore.end()) return itr->second; return NULL; }
        const AreaPOIEntry* GetAreaPOIEntry(uint32 ID) const { AreaPOIContainer::const_iterator itr = AreaPOIStore.find(ID); if (itr != AreaPOIStore.end()) return itr->second; return NULL; }
        const AreaTableEntry* GetAreaTableEntry(uint32 ID) const { AreaTableContainer::const_iterator itr = AreaTableStore.find(ID); if (itr != AreaTableStore.end()) return itr->second; return NULL; }
        const BattlemasterListEntry* GetBattlemasterListEntry(uint32 ID) const { BattlemasterListContainer::const_iterator itr = BattlemasterListStore.find(ID); if (itr != BattlemasterListStore.end()) return itr->second; return NULL; }
        const CharTitlesEntry* GetCharTitlesEntry(uint32 ID) const { CharTitlesContainer::const_iterator itr = CharTitlesStore.find(ID); if (itr != CharTitlesStore.end()) return itr->second; return NULL; }
        const FactionEntry* GetFactionEntry(uint32 ID) const { FactionContainer::const_iterator itr = FactionStore.find(ID); if (itr != FactionStore.end()) return itr->second; return NULL; }
        const FactionTemplateEntry* GetFactionTemplateEntry(uint32 ID) const { FactionTemplateContainer::const_iterator itr = FactionTemplateStore.find(ID); if (itr != FactionTemplateStore.end()) return itr->second; return NULL; }
        const ItemExtendedCostEntry* GetItemExtendedCostEntry(uint32 ID) const { ItemExtendedCostContainer::const_iterator itr = ItemExtendedCostStore.find(ID); if (itr != ItemExtendedCostStore.end()) return itr->second; return NULL; }
        const MapEntry* GetMapEntry(uint32 ID) const { MapContainer::const_iterator itr = MapStore.find(ID); if (itr != MapStore.end()) return itr->second; return NULL; }
        const MapDifficultyEntry* GetMapDifficultyEntry(uint32 ID) const { MapDifficultyContainer::const_iterator itr = MapDifficultyStore.find(ID); if (itr != MapDifficultyStore.end()) return itr->second; return NULL; }
        const SpellDifficultyEntry* GetSpellDifficultyEntry(uint32 ID) const { SpellDifficultyContainer::const_iterator itr = SpellDifficultyStore.find(ID); if (itr != SpellDifficultyStore.end()) return itr->second; return NULL; }
        const TalentEntry* GetTalentEntry(uint32 TalentID) const { TalentContainer::const_iterator itr = TalentStore.find(TalentID); if (itr != TalentStore.end()) return itr->second; return NULL; }

        AchievementContainer AchievementStore;
        AchievementCriteriaContainer AchievementCriteriaStore;
        AreaPOIContainer AreaPOIStore;
        AreaTableContainer AreaTableStore;
        BattlemasterListContainer BattlemasterListStore;
        CharTitlesContainer CharTitlesStore;
        FactionContainer FactionStore;
        FactionTemplateContainer FactionTemplateStore;
        ItemExtendedCostContainer ItemExtendedCostStore;
        MapContainer MapStore;
        MapDifficultyContainer MapDifficultyStore;
        SpellDifficultyContainer SpellDifficultyStore;
        TalentContainer TalentStore;
};

#define sDBCMgr ACE_Singleton<DBCMgr, ACE_Null_Mutex>::instance()

#endif
