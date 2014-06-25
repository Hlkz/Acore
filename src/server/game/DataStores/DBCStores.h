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

typedef std::unordered_multimap<uint32, SkillRaceClassInfoEntry const*> SkillRaceClassInfoMap;
typedef std::pair<SkillRaceClassInfoMap::iterator, SkillRaceClassInfoMap::iterator> SkillRaceClassInfoBounds;
SkillRaceClassInfoEntry const* GetSkillRaceClassInfo(uint32 skill, uint8 race, uint8 class_);

//extern DBCStorage <ItemDisplayInfoEntry>      sItemDisplayInfoStore; -- not used currently
extern MapDifficultyMap                          sMapDifficultyMap;
extern SpellCategoryStore                        sSpellsByCategoryStore;
extern PetFamilySpellsStore                      sPetFamilySpellsStore;
extern TaxiMask                                  sTaxiNodesMask;
extern TaxiMask                                  sOldContinentsNodesMask;
extern TaxiMask                                  sHordeTaxiNodesMask;
extern TaxiMask                                  sAllianceTaxiNodesMask;
extern TaxiMask                                  sDeathKnightTaxiNodesMask;
extern TaxiPathSetBySource                       sTaxiPathSetBySource;
extern TaxiPathNodesByPath                       sTaxiPathNodesByPath;
//extern DBCStorage <WorldMapAreaEntry>           sWorldMapAreaStore; -- use Zone2MapCoordinates and Map2ZoneCoordinates

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
typedef std::unordered_map<uint32, const AreaGroupEntry*> AreaGroupContainer;
typedef std::unordered_map<uint32, const AreaTriggerEntry*> AreaTriggerContainer;
typedef std::unordered_map<uint32, const AuctionHouseEntry*> AuctionHouseContainer;
typedef std::unordered_map<uint32, const BankBagSlotPricesEntry*> BankBagSlotPricesContainer;
typedef std::unordered_map<uint32, const BannedAddOnsEntry*> BannedAddOnsContainer;
typedef std::unordered_map<uint32, const BarberShopStyleEntry*> BarberShopStyleContainer;
typedef std::unordered_map<uint32, const ChatChannelsEntry*> ChatChannelsContainer;
typedef std::unordered_map<uint32, const CharStartOutfitEntry*> CharStartOutfitContainer;
typedef std::unordered_map<uint32, const ChrClassesEntry*> ChrClassesContainer;
typedef std::unordered_map<uint32, const ChrRacesEntry*> ChrRacesContainer;
typedef std::unordered_map<uint32, const CinematicSequencesEntry*> CinematicSequencesContainer;
typedef std::unordered_map<uint32, const CreatureDisplayInfoEntry*> CreatureDisplayInfoContainer;
typedef std::unordered_map<uint32, const CreatureDisplayInfoExtraEntry*> CreatureDisplayInfoExtraContainer;
typedef std::unordered_map<uint32, const CreatureFamilyEntry*> CreatureFamilyContainer;
typedef std::unordered_map<uint32, const CreatureModelDataEntry*> CreatureModelDataContainer;
typedef std::unordered_map<uint32, const CreatureSpellDataEntry*> CreatureSpellDataContainer;
typedef std::unordered_map<uint32, const CreatureTypeEntry*> CreatureTypeContainer;
typedef std::unordered_map<uint32, const CurrencyTypesEntry*> CurrencyTypesContainer;
typedef std::unordered_map<uint32, const DestructibleModelDataEntry*> DestructibleModelDataContainer;
typedef std::unordered_map<uint32, const DungeonEncounterEntry*> DungeonEncounterContainer;
typedef std::unordered_map<uint32, const DurabilityCostsEntry*> DurabilityCostsContainer;
typedef std::unordered_map<uint32, const DurabilityQualityEntry*> DurabilityQualityContainer;
typedef std::unordered_map<uint32, const EmotesEntry*> EmotesContainer;
typedef std::unordered_map<uint32, const EmotesTextEntry*> EmotesTextContainer;
typedef std::unordered_map<uint32, const GameObjectDisplayInfoEntry*> GameObjectDisplayInfoContainer;
typedef std::unordered_map<uint32, const GemPropertiesEntry*> GemPropertiesContainer;
typedef std::unordered_map<uint32, const GlyphPropertiesEntry*> GlyphPropertiesContainer;
typedef std::unordered_map<uint32, const GlyphSlotEntry*> GlyphSlotContainer;
typedef std::unordered_map<uint32, const HolidaysEntry*> HolidaysContainer;
typedef std::unordered_map<uint32, const ItemBagFamilyEntry*> ItemBagFamilyContainer;
typedef std::unordered_map<uint32, const ItemLimitCategoryEntry*> ItemLimitCategoryContainer;
typedef std::unordered_map<uint32, const ItemRandomPropertiesEntry*> ItemRandomPropertiesContainer;
typedef std::unordered_map<uint32, const ItemRandomSuffixEntry*> ItemRandomSuffixContainer;
typedef std::unordered_map<uint32, const ItemSetEntry*> ItemSetContainer;
typedef std::unordered_map<uint32, const LFGDungeonEntry*> LFGDungeonContainer;
typedef std::unordered_map<uint32, const LightEntry*> LightContainer;
typedef std::unordered_map<uint32, const LiquidTypeEntry*> LiquidTypeContainer;
typedef std::unordered_map<uint32, const LockEntry*> LockContainer;
typedef std::unordered_map<uint32, const MailTemplateEntry*> MailTemplateContainer;
typedef std::unordered_map<uint32, const MovieEntry*> MovieContainer;
typedef std::unordered_map<uint32, const OverrideSpellDataEntry*> OverrideSpellDataContainer;
typedef std::unordered_map<uint32, const PowerDisplayEntry*> PowerDisplayContainer;
typedef std::unordered_map<uint32, const PvPDifficultyEntry*> PvPDifficultyContainer;
typedef std::unordered_map<uint32, const QuestSortEntry*> QuestSortContainer;
typedef std::unordered_map<uint32, const QuestXPEntry*> QuestXPContainer;
typedef std::unordered_map<uint32, const QuestFactionRewEntry*> QuestFactionRewContainer;
typedef std::unordered_map<uint32, const RandomPropertiesPointsEntry*> RandomPropertiesPointsContainer;
typedef std::unordered_map<uint32, const ScalingStatDistributionEntry*> ScalingStatDistributionContainer;
typedef std::unordered_map<uint32, const ScalingStatValuesEntry*> ScalingStatValuesContainer;
typedef std::unordered_map<uint32, const SkillLineEntry*> SkillLineContainer;
typedef std::unordered_map<uint32, const SkillLineAbilityEntry*> SkillLineAbilityContainer;
typedef std::unordered_map<uint32, const SkillRaceClassInfoEntry*> SkillRaceClassInfoContainer;
typedef std::unordered_map<uint32, const SkillTiersEntry*> SkillTiersContainer;
typedef std::unordered_map<uint32, const SoundEntriesEntry*> SoundEntriesContainer;
typedef std::unordered_map<uint32, const SpellCastTimesEntry*> SpellCastTimesContainer;
typedef std::unordered_map<uint32, const SpellCategoryEntry*> SpellCategoryContainer;
typedef std::unordered_map<uint32, const SpellDurationEntry*> SpellDurationContainer;
typedef std::unordered_map<uint32, const SpellFocusObjectEntry*> SpellFocusObjectContainer;
typedef std::unordered_map<uint32, const SpellItemEnchantmentEntry*> SpellItemEnchantmentContainer;
typedef std::unordered_map<uint32, const SpellItemEnchantmentConditionEntry*> SpellItemEnchantmentConditionContainer;
typedef std::unordered_map<uint32, const SpellRadiusEntry*> SpellRadiusContainer;
typedef std::unordered_map<uint32, const SpellRangeEntry*> SpellRangeContainer;
typedef std::unordered_map<uint32, const SpellRuneCostEntry*> SpellRuneCostContainer;
typedef std::unordered_map<uint32, const SpellShapeshiftEntry*> SpellShapeshiftContainer;
typedef std::unordered_map<uint32, const StableSlotPricesEntry*> StableSlotPricesContainer;
typedef std::unordered_map<uint32, const SummonPropertiesEntry*> SummonPropertiesContainer;
typedef std::unordered_map<uint32, const TalentTabEntry*> TalentTabContainer;
typedef std::unordered_map<uint32, const TaxiNodesEntry*> TaxiNodesContainer;
typedef std::unordered_map<uint32, const TaxiPathEntry*> TaxiPathContainer;
typedef std::unordered_map<uint32, const TaxiPathNodeEntry*> TaxiPathNodeContainer;
typedef std::unordered_map<uint32, const TeamContributionPointsEntry*> TeamContributionPointsContainer;
typedef std::unordered_map<uint32, const TotemCategoryEntry*> TotemCategoryContainer;
typedef std::unordered_map<uint32, const TransportAnimationEntry*> TransportAnimationContainer;
typedef std::unordered_map<uint32, const TransportRotationEntry*> TransportRotationContainer;
typedef std::unordered_map<uint32, const VehicleEntry*> VehicleContainer;
typedef std::unordered_map<uint32, const VehicleSeatEntry*> VehicleSeatContainer;
typedef std::unordered_map<uint32, const WMOAreaTableEntry*> WMOAreaTableContainer;
typedef std::unordered_map<uint32, const WorldMapAreaEntry*> WorldMapAreaContainer;
typedef std::unordered_map<uint32, const WorldMapOverlayEntry*> WorldMapOverlayContainer;
typedef std::unordered_map<uint32, const WorldSafeLocsEntry*> WorldSafeLocsContainer;

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

        void LoadAreaGroupStore();
        void LoadAreaTriggerStore();
        void LoadAuctionHouseStore();
        void LoadBankBagSlotPricesStore();
        void LoadBannedAddOnsStore();
        void LoadBarberShopStyleStore();
        void LoadChatChannelsStore();
        void LoadCharStartOutfitStore();
        void LoadChrClassesStore();
        void LoadChrRacesStore();
        void LoadCinematicSequencesStore();
        void LoadCreatureDisplayInfoStore();
        void LoadCreatureDisplayInfoExtraStore();
        void LoadCreatureFamilyStore();
        void LoadCreatureModelDataStore();
        void LoadCreatureSpellDataStore();
        void LoadCreatureTypeStore();
        void LoadCurrencyTypesStore();
        void LoadDestructibleModelDataStore();
        void LoadDungeonEncounterStore();
        void LoadDurabilityCostsStore();
        void LoadDurabilityQualityStore();
        void LoadEmotesStore();
        void LoadEmotesTextStore();
        void LoadGameObjectDisplayInfoStore();
        void LoadGemPropertiesStore();
        void LoadGlyphPropertiesStore();
        void LoadGlyphSlotStore();
        void LoadHolidaysStore();
        void LoadItemBagFamilyStore();
        void LoadItemLimitCategoryStore();
        void LoadItemRandomPropertiesStore();
        void LoadItemRandomSuffixStore();
        void LoadItemSetStore();
        void LoadLFGDungeonStore();
        void LoadLightStore();
        void LoadLiquidTypeStore();
        void LoadLockStore();
        void LoadMailTemplateStore();
        void LoadMovieStore();
        void LoadOverrideSpellDataStore();
        void LoadPowerDisplayStore();
        void LoadPvPDifficultyStore();
        void LoadQuestSortStore();
        void LoadQuestXPStore();
        void LoadQuestFactionRewStore();
        void LoadRandomPropertiesPointsStore();
        void LoadScalingStatDistributionStore();
        void LoadScalingStatValuesStore();
        void LoadSkillLineStore();
        void LoadSkillLineAbilityStore();
        void LoadSkillRaceClassInfoStore();
        void LoadSkillTiersStore();
        void LoadSoundEntriesStore();
        void LoadSpellCastTimesStore();
        void LoadSpellCategoryStore();
        void LoadSpellDurationStore();
        void LoadSpellFocusObjectStore();
        void LoadSpellItemEnchantmentStore();
        void LoadSpellItemEnchantmentConditionStore();
        void LoadSpellRadiusStore();
        void LoadSpellRangeStore();
        void LoadSpellRuneCostStore();
        void LoadSpellShapeshiftStore();
        void LoadStableSlotPricesStore();
        void LoadSummonPropertiesStore();
        void LoadTalentTabStore();
        void LoadTaxiNodesStore();
        uint32 LoadTaxiPathStore();
        void LoadTaxiPathNodeStore();
        void LoadTeamContributionPointsStore();
        void LoadTotemCategoryStore();
        void LoadTransportAnimationStore();
        void LoadTransportRotationStore();
        void LoadVehicleStore();
        void LoadVehicleSeatStore();
        void LoadWMOAreaTableStore();
        void LoadWorldMapAreaStore();
        void LoadWorldMapOverlayStore();
        void LoadWorldSafeLocsStore();

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
        const AreaGroupEntry* GetAreaGroupEntry(uint32 Id) const { AreaGroupContainer::const_iterator itr = AreaGroupStore.find(Id); if (itr != AreaGroupStore.end()) return itr->second; return NULL; }
        const AreaTriggerEntry* GetAreaTriggerEntry(uint32 Id) const { AreaTriggerContainer::const_iterator itr = AreaTriggerStore.find(Id); if (itr != AreaTriggerStore.end()) return itr->second; return NULL; }
        const AuctionHouseEntry* GetAuctionHouseEntry(uint32 Id) const { AuctionHouseContainer::const_iterator itr = AuctionHouseStore.find(Id); if (itr != AuctionHouseStore.end()) return itr->second; return NULL; }
        const BankBagSlotPricesEntry* GetBankBagSlotPricesEntry(uint32 Id) const { BankBagSlotPricesContainer::const_iterator itr = BankBagSlotPricesStore.find(Id); if (itr != BankBagSlotPricesStore.end()) return itr->second; return NULL; }
        const BannedAddOnsEntry* GetBannedAddOnsEntry(uint32 Id) const { BannedAddOnsContainer::const_iterator itr = BannedAddOnsStore.find(Id); if (itr != BannedAddOnsStore.end()) return itr->second; return NULL; }
        const BarberShopStyleEntry* GetBarberShopStyleEntry(uint32 Id) const { BarberShopStyleContainer::const_iterator itr = BarberShopStyleStore.find(Id); if (itr != BarberShopStyleStore.end()) return itr->second; return NULL; }
        const ChatChannelsEntry* GetChatChannelsEntry(uint32 Id) const { ChatChannelsContainer::const_iterator itr = ChatChannelsStore.find(Id); if (itr != ChatChannelsStore.end()) return itr->second; return NULL; }
        const CharStartOutfitEntry* GetCharStartOutfitEntry(uint32 Id) const { CharStartOutfitContainer::const_iterator itr = CharStartOutfitStore.find(Id); if (itr != CharStartOutfitStore.end()) return itr->second; return NULL; }
        const ChrClassesEntry* GetChrClassesEntry(uint32 Id) const { ChrClassesContainer::const_iterator itr = ChrClassesStore.find(Id); if (itr != ChrClassesStore.end()) return itr->second; return NULL; }
        const ChrRacesEntry* GetChrRacesEntry(uint32 Id) const { ChrRacesContainer::const_iterator itr = ChrRacesStore.find(Id); if (itr != ChrRacesStore.end()) return itr->second; return NULL; }
        const CinematicSequencesEntry* GetCinematicSequencesEntry(uint32 Id) const { CinematicSequencesContainer::const_iterator itr = CinematicSequencesStore.find(Id); if (itr != CinematicSequencesStore.end()) return itr->second; return NULL; }
        const CreatureDisplayInfoEntry* GetCreatureDisplayInfoEntry(uint32 Id) const { CreatureDisplayInfoContainer::const_iterator itr = CreatureDisplayInfoStore.find(Id); if (itr != CreatureDisplayInfoStore.end()) return itr->second; return NULL; }
        const CreatureDisplayInfoExtraEntry* GetCreatureDisplayInfoExtraEntry(uint32 Id) const { CreatureDisplayInfoExtraContainer::const_iterator itr = CreatureDisplayInfoExtraStore.find(Id); if (itr != CreatureDisplayInfoExtraStore.end()) return itr->second; return NULL; }
        const CreatureFamilyEntry* GetCreatureFamilyEntry(uint32 Id) const { CreatureFamilyContainer::const_iterator itr = CreatureFamilyStore.find(Id); if (itr != CreatureFamilyStore.end()) return itr->second; return NULL; }
        const CreatureModelDataEntry* GetCreatureModelDataEntry(uint32 Id) const { CreatureModelDataContainer::const_iterator itr = CreatureModelDataStore.find(Id); if (itr != CreatureModelDataStore.end()) return itr->second; return NULL; }
        const CreatureSpellDataEntry* GetCreatureSpellDataEntry(uint32 Id) const { CreatureSpellDataContainer::const_iterator itr = CreatureSpellDataStore.find(Id); if (itr != CreatureSpellDataStore.end()) return itr->second; return NULL; }
        const CreatureTypeEntry* GetCreatureTypeEntry(uint32 Id) const { CreatureTypeContainer::const_iterator itr = CreatureTypeStore.find(Id); if (itr != CreatureTypeStore.end()) return itr->second; return NULL; }
        const CurrencyTypesEntry* GetCurrencyTypesEntry(uint32 Id) const { CurrencyTypesContainer::const_iterator itr = CurrencyTypesStore.find(Id); if (itr != CurrencyTypesStore.end()) return itr->second; return NULL; }
        const DestructibleModelDataEntry* GetDestructibleModelDataEntry(uint32 Id) const { DestructibleModelDataContainer::const_iterator itr = DestructibleModelDataStore.find(Id); if (itr != DestructibleModelDataStore.end()) return itr->second; return NULL; }
        const DungeonEncounterEntry* GetDungeonEncounterEntry(uint32 Id) const { DungeonEncounterContainer::const_iterator itr = DungeonEncounterStore.find(Id); if (itr != DungeonEncounterStore.end()) return itr->second; return NULL; }
        const DurabilityCostsEntry* GetDurabilityCostsEntry(uint32 Id) const { DurabilityCostsContainer::const_iterator itr = DurabilityCostsStore.find(Id); if (itr != DurabilityCostsStore.end()) return itr->second; return NULL; }
        const DurabilityQualityEntry* GetDurabilityQualityEntry(uint32 Id) const { DurabilityQualityContainer::const_iterator itr = DurabilityQualityStore.find(Id); if (itr != DurabilityQualityStore.end()) return itr->second; return NULL; }
        const EmotesEntry* GetEmotesEntry(uint32 Id) const { EmotesContainer::const_iterator itr = EmotesStore.find(Id); if (itr != EmotesStore.end()) return itr->second; return NULL; }
        const EmotesTextEntry* GetEmotesTextEntry(uint32 Id) const { EmotesTextContainer::const_iterator itr = EmotesTextStore.find(Id); if (itr != EmotesTextStore.end()) return itr->second; return NULL; }
        const GameObjectDisplayInfoEntry* GetGameObjectDisplayInfoEntry(uint32 Id) const { GameObjectDisplayInfoContainer::const_iterator itr = GameObjectDisplayInfoStore.find(Id); if (itr != GameObjectDisplayInfoStore.end()) return itr->second; return NULL; }
        const GemPropertiesEntry* GetGemPropertiesEntry(uint32 Id) const { GemPropertiesContainer::const_iterator itr = GemPropertiesStore.find(Id); if (itr != GemPropertiesStore.end()) return itr->second; return NULL; }
        const GlyphPropertiesEntry* GetGlyphPropertiesEntry(uint32 Id) const { GlyphPropertiesContainer::const_iterator itr = GlyphPropertiesStore.find(Id); if (itr != GlyphPropertiesStore.end()) return itr->second; return NULL; }
        const GlyphSlotEntry* GetGlyphSlotEntry(uint32 Id) const { GlyphSlotContainer::const_iterator itr = GlyphSlotStore.find(Id); if (itr != GlyphSlotStore.end()) return itr->second; return NULL; }
        const HolidaysEntry* GetHolidaysEntry(uint32 Id) const { HolidaysContainer::const_iterator itr = HolidaysStore.find(Id); if (itr != HolidaysStore.end()) return itr->second; return NULL; }
        const ItemBagFamilyEntry* GetItemBagFamilyEntry(uint32 Id) const { ItemBagFamilyContainer::const_iterator itr = ItemBagFamilyStore.find(Id); if (itr != ItemBagFamilyStore.end()) return itr->second; return NULL; }
        const ItemLimitCategoryEntry* GetItemLimitCategoryEntry(uint32 Id) const { ItemLimitCategoryContainer::const_iterator itr = ItemLimitCategoryStore.find(Id); if (itr != ItemLimitCategoryStore.end()) return itr->second; return NULL; }
        const ItemRandomPropertiesEntry* GetItemRandomPropertiesEntry(uint32 Id) const { ItemRandomPropertiesContainer::const_iterator itr = ItemRandomPropertiesStore.find(Id); if (itr != ItemRandomPropertiesStore.end()) return itr->second; return NULL; }
        const ItemRandomSuffixEntry* GetItemRandomSuffixEntry(uint32 Id) const { ItemRandomSuffixContainer::const_iterator itr = ItemRandomSuffixStore.find(Id); if (itr != ItemRandomSuffixStore.end()) return itr->second; return NULL; }
        const ItemSetEntry* GetItemSetEntry(uint32 Id) const { ItemSetContainer::const_iterator itr = ItemSetStore.find(Id); if (itr != ItemSetStore.end()) return itr->second; return NULL; }
        const LFGDungeonEntry* GetLFGDungeonEntry(uint32 Id) const { LFGDungeonContainer::const_iterator itr = LFGDungeonStore.find(Id); if (itr != LFGDungeonStore.end()) return itr->second; return NULL; }
        const LiquidTypeEntry* GetLiquidTypeEntry(uint32 Id) const { LiquidTypeContainer::const_iterator itr = LiquidTypeStore.find(Id); if (itr != LiquidTypeStore.end()) return itr->second; return NULL; }
        const LightEntry* GetLightEntry(uint32 Id) const { LightContainer::const_iterator itr = LightStore.find(Id); if (itr != LightStore.end()) return itr->second; return NULL; }
        const LockEntry* GetLockEntry(uint32 Id) const { LockContainer::const_iterator itr = LockStore.find(Id); if (itr != LockStore.end()) return itr->second; return NULL; }
        const MailTemplateEntry* GetMailTemplateEntry(uint32 Id) const { MailTemplateContainer::const_iterator itr = MailTemplateStore.find(Id); if (itr != MailTemplateStore.end()) return itr->second; return NULL; }
        const MovieEntry* GetMovieEntry(uint32 Id) const { MovieContainer::const_iterator itr = MovieStore.find(Id); if (itr != MovieStore.end()) return itr->second; return NULL; }
        const OverrideSpellDataEntry* GetOverrideSpellDataEntry(uint32 Id) const { OverrideSpellDataContainer::const_iterator itr = OverrideSpellDataStore.find(Id); if (itr != OverrideSpellDataStore.end()) return itr->second; return NULL; }
        const PowerDisplayEntry* GetPowerDisplayEntry(uint32 Id) const { PowerDisplayContainer::const_iterator itr = PowerDisplayStore.find(Id); if (itr != PowerDisplayStore.end()) return itr->second; return NULL; }
        const PvPDifficultyEntry* GetPvPDifficultyEntry(uint32 Id) const { PvPDifficultyContainer::const_iterator itr = PvPDifficultyStore.find(Id); if (itr != PvPDifficultyStore.end()) return itr->second; return NULL; }
        const QuestSortEntry* GetQuestSortEntry(uint32 Id) const { QuestSortContainer::const_iterator itr = QuestSortStore.find(Id); if (itr != QuestSortStore.end()) return itr->second; return NULL; }
        const QuestXPEntry* GetQuestXPEntry(uint32 Id) const { QuestXPContainer::const_iterator itr = QuestXPStore.find(Id); if (itr != QuestXPStore.end()) return itr->second; return NULL; }
        const QuestFactionRewEntry* GetQuestFactionRewEntry(uint32 Id) const { QuestFactionRewContainer::const_iterator itr = QuestFactionRewStore.find(Id); if (itr != QuestFactionRewStore.end()) return itr->second; return NULL; }
        const RandomPropertiesPointsEntry* GetRandomPropertiesPointsEntry(uint32 Id) const { RandomPropertiesPointsContainer::const_iterator itr = RandomPropertiesPointsStore.find(Id); if (itr != RandomPropertiesPointsStore.end()) return itr->second; return NULL; }
        const ScalingStatDistributionEntry* GetScalingStatDistributionEntry(uint32 Id) const { ScalingStatDistributionContainer::const_iterator itr = ScalingStatDistributionStore.find(Id); if (itr != ScalingStatDistributionStore.end()) return itr->second; return NULL; }
        const ScalingStatValuesEntry* GetScalingStatValuesEntry(uint32 Id) const { ScalingStatValuesContainer::const_iterator itr = ScalingStatValuesStore.find(Id); if (itr != ScalingStatValuesStore.end()) return itr->second; return NULL; }
        const SkillLineEntry* GetSkillLineEntry(uint32 Id) const { SkillLineContainer::const_iterator itr = SkillLineStore.find(Id); if (itr != SkillLineStore.end()) return itr->second; return NULL; }
        const SkillLineAbilityEntry* GetSkillLineAbilityEntry(uint32 Id) const { SkillLineAbilityContainer::const_iterator itr = SkillLineAbilityStore.find(Id); if (itr != SkillLineAbilityStore.end()) return itr->second; return NULL; }
        const SkillTiersEntry* GetSkillTiersEntry(uint32 Id) const { SkillTiersContainer::const_iterator itr = SkillTiersStore.find(Id); if (itr != SkillTiersStore.end()) return itr->second; return NULL; }
        const SkillRaceClassInfoEntry* GetSkillRaceClassInfoEntry(uint32 Id) const { SkillRaceClassInfoContainer::const_iterator itr = SkillRaceClassInfoStore.find(Id); if (itr != SkillRaceClassInfoStore.end()) return itr->second; return NULL; }
        const SoundEntriesEntry* GetSoundEntriesEntry(uint32 Id) const { SoundEntriesContainer::const_iterator itr = SoundEntriesStore.find(Id); if (itr != SoundEntriesStore.end()) return itr->second; return NULL; }
        const SpellCastTimesEntry* GetSpellCastTimesEntry(uint32 Id) const { SpellCastTimesContainer::const_iterator itr = SpellCastTimesStore.find(Id); if (itr != SpellCastTimesStore.end()) return itr->second; return NULL; }
        const SpellCategoryEntry* GetSpellCategoryEntry(uint32 Id) const { SpellCategoryContainer::const_iterator itr = SpellCategoryStore.find(Id); if (itr != SpellCategoryStore.end()) return itr->second; return NULL; }
        const SpellDurationEntry* GetSpellDurationEntry(uint32 Id) const { SpellDurationContainer::const_iterator itr = SpellDurationStore.find(Id); if (itr != SpellDurationStore.end()) return itr->second; return NULL; }
        const SpellFocusObjectEntry* GetSpellFocusObjectEntry(uint32 Id) const { SpellFocusObjectContainer::const_iterator itr = SpellFocusObjectStore.find(Id); if (itr != SpellFocusObjectStore.end()) return itr->second; return NULL; }
        const SpellItemEnchantmentEntry* GetSpellItemEnchantmentEntry(uint32 Id) const { SpellItemEnchantmentContainer::const_iterator itr = SpellItemEnchantmentStore.find(Id); if (itr != SpellItemEnchantmentStore.end()) return itr->second; return NULL; }
        const SpellItemEnchantmentConditionEntry* GetSpellItemEnchantmentConditionEntry(uint32 Id) const { SpellItemEnchantmentConditionContainer::const_iterator itr = SpellItemEnchantmentConditionStore.find(Id); if (itr != SpellItemEnchantmentConditionStore.end()) return itr->second; return NULL; }
        const SpellRadiusEntry* GetSpellRadiusEntry(uint32 Id) const { SpellRadiusContainer::const_iterator itr = SpellRadiusStore.find(Id); if (itr != SpellRadiusStore.end()) return itr->second; return NULL; }
        const SpellRangeEntry* GetSpellRangeEntry(uint32 Id) const { SpellRangeContainer::const_iterator itr = SpellRangeStore.find(Id); if (itr != SpellRangeStore.end()) return itr->second; return NULL; }
        const SpellRuneCostEntry* GetSpellRuneCostEntry(uint32 Id) const { SpellRuneCostContainer::const_iterator itr = SpellRuneCostStore.find(Id); if (itr != SpellRuneCostStore.end()) return itr->second; return NULL; }
        const SpellShapeshiftEntry* GetSpellShapeshiftEntry(uint32 Id) const { SpellShapeshiftContainer::const_iterator itr = SpellShapeshiftStore.find(Id); if (itr != SpellShapeshiftStore.end()) return itr->second; return NULL; }
        const StableSlotPricesEntry* GetStableSlotPricesEntry(uint32 Id) const { StableSlotPricesContainer::const_iterator itr = StableSlotPricesStore.find(Id); if (itr != StableSlotPricesStore.end()) return itr->second; return NULL; }
        const SummonPropertiesEntry* GetSummonPropertiesEntry(uint32 Id) const { SummonPropertiesContainer::const_iterator itr = SummonPropertiesStore.find(Id); if (itr != SummonPropertiesStore.end()) return itr->second; return NULL; }
        const TalentTabEntry* GetTalentTabEntry(uint32 Id) const { TalentTabContainer::const_iterator itr = TalentTabStore.find(Id); if (itr != TalentTabStore.end()) return itr->second; return NULL; }
        const TaxiNodesEntry* GetTaxiNodesEntry(uint32 Id) const { TaxiNodesContainer::const_iterator itr = TaxiNodesStore.find(Id); if (itr != TaxiNodesStore.end()) return itr->second; return NULL; }
        const TaxiPathEntry* GetTaxiPathEntry(uint32 Id) const { TaxiPathContainer::const_iterator itr = TaxiPathStore.find(Id); if (itr != TaxiPathStore.end()) return itr->second; return NULL; }
        const TaxiPathNodeEntry* GetTaxiPathNodeEntry(uint32 Id) const { TaxiPathNodeContainer::const_iterator itr = TaxiPathNodeStore.find(Id); if (itr != TaxiPathNodeStore.end()) return itr->second; return NULL; }
        const TeamContributionPointsEntry* GetTeamContributionPointsEntry(uint32 Id) const { TeamContributionPointsContainer::const_iterator itr = TeamContributionPointsStore.find(Id); if (itr != TeamContributionPointsStore.end()) return itr->second; return NULL; }
        const TotemCategoryEntry* GetTotemCategoryEntry(uint32 Id) const { TotemCategoryContainer::const_iterator itr = TotemCategoryStore.find(Id); if (itr != TotemCategoryStore.end()) return itr->second; return NULL; }
        const TransportAnimationEntry* GetTransportAnimationEntry(uint32 Id) const { TransportAnimationContainer::const_iterator itr = TransportAnimationStore.find(Id); if (itr != TransportAnimationStore.end()) return itr->second; return NULL; }
        const TransportRotationEntry* GetTransportRotationEntry(uint32 Id) const { TransportRotationContainer::const_iterator itr = TransportRotationStore.find(Id); if (itr != TransportRotationStore.end()) return itr->second; return NULL; }
        const VehicleEntry* GetVehicleEntry(uint32 Id) const { VehicleContainer::const_iterator itr = VehicleStore.find(Id); if (itr != VehicleStore.end()) return itr->second; return NULL; }
        const VehicleSeatEntry* GetVehicleSeatEntry(uint32 Id) const { VehicleSeatContainer::const_iterator itr = VehicleSeatStore.find(Id); if (itr != VehicleSeatStore.end()) return itr->second; return NULL; }
        const WMOAreaTableEntry* GetWMOAreaTableEntry(uint32 Id) const { WMOAreaTableContainer::const_iterator itr = WMOAreaTableStore.find(Id); if (itr != WMOAreaTableStore.end()) return itr->second; return NULL; }
        const WorldMapAreaEntry* GetWorldMapAreaEntry(uint32 Id) const { WorldMapAreaContainer::const_iterator itr = WorldMapAreaStore.find(Id); if (itr != WorldMapAreaStore.end()) return itr->second; return NULL; }
        const WorldMapOverlayEntry* GetWorldMapOverlayEntry(uint32 Id) const { WorldMapOverlayContainer::const_iterator itr = WorldMapOverlayStore.find(Id); if (itr != WorldMapOverlayStore.end()) return itr->second; return NULL; }
        const WorldSafeLocsEntry* GetWorldSafeLocsEntry(uint32 Id) const { WorldSafeLocsContainer::const_iterator itr = WorldSafeLocsStore.find(Id); if (itr != WorldSafeLocsStore.end()) return itr->second; return NULL; }

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

        AreaGroupContainer AreaGroupStore;
        AreaTriggerContainer AreaTriggerStore;
        AuctionHouseContainer AuctionHouseStore;
        BankBagSlotPricesContainer BankBagSlotPricesStore;
        BannedAddOnsContainer BannedAddOnsStore;
        BarberShopStyleContainer BarberShopStyleStore;
        ChatChannelsContainer ChatChannelsStore;
        CharStartOutfitContainer CharStartOutfitStore;
        ChrClassesContainer ChrClassesStore;
        ChrRacesContainer ChrRacesStore;
        CinematicSequencesContainer CinematicSequencesStore;
        CreatureDisplayInfoContainer CreatureDisplayInfoStore;
        CreatureDisplayInfoExtraContainer CreatureDisplayInfoExtraStore;
        CreatureFamilyContainer CreatureFamilyStore;
        CreatureModelDataContainer CreatureModelDataStore;
        CreatureSpellDataContainer CreatureSpellDataStore;
        CreatureTypeContainer CreatureTypeStore;
        CurrencyTypesContainer CurrencyTypesStore;
        DestructibleModelDataContainer DestructibleModelDataStore;
        DungeonEncounterContainer DungeonEncounterStore;
        DurabilityCostsContainer DurabilityCostsStore;
        DurabilityQualityContainer DurabilityQualityStore;
        EmotesContainer EmotesStore;
        EmotesTextContainer EmotesTextStore;
        GameObjectDisplayInfoContainer GameObjectDisplayInfoStore;
        GemPropertiesContainer GemPropertiesStore;
        GlyphPropertiesContainer GlyphPropertiesStore;
        GlyphSlotContainer GlyphSlotStore;
        HolidaysContainer HolidaysStore;
        ItemBagFamilyContainer ItemBagFamilyStore;
        ItemLimitCategoryContainer ItemLimitCategoryStore;
        ItemRandomPropertiesContainer ItemRandomPropertiesStore;
        ItemRandomSuffixContainer ItemRandomSuffixStore;
        ItemSetContainer ItemSetStore;
        LFGDungeonContainer LFGDungeonStore;
        LightContainer LightStore;
        LiquidTypeContainer LiquidTypeStore;
        LockContainer LockStore;
        MailTemplateContainer MailTemplateStore;
        MovieContainer MovieStore;
        OverrideSpellDataContainer OverrideSpellDataStore;
        PowerDisplayContainer PowerDisplayStore;
        PvPDifficultyContainer PvPDifficultyStore;
        QuestSortContainer QuestSortStore;
        QuestXPContainer QuestXPStore;
        QuestFactionRewContainer QuestFactionRewStore;
        RandomPropertiesPointsContainer RandomPropertiesPointsStore;
        ScalingStatDistributionContainer ScalingStatDistributionStore;
        ScalingStatValuesContainer ScalingStatValuesStore;
        SkillLineContainer SkillLineStore;
        SkillLineAbilityContainer SkillLineAbilityStore;
        SkillRaceClassInfoContainer SkillRaceClassInfoStore;
        SkillTiersContainer SkillTiersStore;
        SoundEntriesContainer SoundEntriesStore;
        SpellCastTimesContainer SpellCastTimesStore;
        SpellCategoryContainer SpellCategoryStore;
        SpellDurationContainer SpellDurationStore;
        SpellFocusObjectContainer SpellFocusObjectStore;
        SpellItemEnchantmentContainer SpellItemEnchantmentStore;
        SpellItemEnchantmentConditionContainer SpellItemEnchantmentConditionStore;
        SpellRadiusContainer SpellRadiusStore;
        SpellRangeContainer SpellRangeStore;
        SpellRuneCostContainer SpellRuneCostStore;
        SpellShapeshiftContainer SpellShapeshiftStore;
        StableSlotPricesContainer StableSlotPricesStore;
        SummonPropertiesContainer SummonPropertiesStore;
        TalentTabContainer TalentTabStore;
        TaxiNodesContainer TaxiNodesStore;
        TaxiPathContainer TaxiPathStore;
        TaxiPathNodeContainer TaxiPathNodeStore;
        TeamContributionPointsContainer TeamContributionPointsStore;
        TotemCategoryContainer TotemCategoryStore;
        TransportAnimationContainer TransportAnimationStore;
        TransportRotationContainer TransportRotationStore;
        VehicleContainer VehicleStore;
        VehicleSeatContainer VehicleSeatStore;
        WMOAreaTableContainer WMOAreaTableStore;
        WorldMapAreaContainer WorldMapAreaStore;
        WorldMapOverlayContainer WorldMapOverlayStore;
        WorldSafeLocsContainer WorldSafeLocsStore;
};

#define sDBCMgr ACE_Singleton<DBCMgr, ACE_Null_Mutex>::instance()

#endif
