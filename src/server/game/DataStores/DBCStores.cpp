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

#include "DBCStores.h"
#include "Log.h"
#include "SharedDefines.h"
#include "SpellMgr.h"
#include "TransportMgr.h"
#include "DBCfmt.h"
#include "Timer.h"
#include "ObjectDefines.h"
#include "SpellMgr.h"
#include "SpellInfo.h"

#include <map>

typedef std::map<uint16, uint32> AreaFlagByAreaID;
typedef std::map<uint32, uint32> AreaFlagByMapID;

struct WMOAreaTableTripple
{
    WMOAreaTableTripple(int32 r, int32 a, int32 g) :  groupId(g), rootId(r), adtId(a)
    {
    }

    bool operator <(const WMOAreaTableTripple& b) const
    {
        return memcmp(this, &b, sizeof(WMOAreaTableTripple))<0;
    }

    // ordered by entropy; that way memcmp will have a minimal medium runtime
    int32 groupId;
    int32 rootId;
    int32 adtId;
};

typedef std::map<WMOAreaTableTripple, WMOAreaTableEntry const*> WMOAreaInfoByTripple;

DBCStorage <AreaGroupEntry> sAreaGroupStore(AreaGroupEntryfmt);
static AreaFlagByAreaID sAreaFlagByAreaID;
static AreaFlagByMapID sAreaFlagByMapID;                    // for instances without generated *.map files

static WMOAreaInfoByTripple sWMOAreaInfoByTripple;

DBCStorage <AreaTriggerEntry> sAreaTriggerStore(AreaTriggerEntryfmt);
DBCStorage <AuctionHouseEntry> sAuctionHouseStore(AuctionHouseEntryfmt);
DBCStorage <BankBagSlotPricesEntry> sBankBagSlotPricesStore(BankBagSlotPricesEntryfmt);
DBCStorage <BannedAddOnsEntry> sBannedAddOnsStore(BannedAddOnsfmt);
DBCStorage <BarberShopStyleEntry> sBarberShopStyleStore(BarberShopStyleEntryfmt);
DBCStorage <CharStartOutfitEntry> sCharStartOutfitStore(CharStartOutfitEntryfmt);
std::map<uint32, CharStartOutfitEntry const*> sCharStartOutfitMap;
DBCStorage <ChatChannelsEntry> sChatChannelsStore(ChatChannelsEntryfmt);
DBCStorage <ChrClassesEntry> sChrClassesStore(ChrClassesEntryfmt);
DBCStorage <ChrRacesEntry> sChrRacesStore(ChrRacesEntryfmt);
DBCStorage <CinematicSequencesEntry> sCinematicSequencesStore(CinematicSequencesEntryfmt);
DBCStorage <CreatureDisplayInfoEntry> sCreatureDisplayInfoStore(CreatureDisplayInfofmt);
DBCStorage <CreatureDisplayInfoExtraEntry> sCreatureDisplayInfoExtraStore(CreatureDisplayInfoExtrafmt);
DBCStorage <CreatureFamilyEntry> sCreatureFamilyStore(CreatureFamilyfmt);
DBCStorage <CreatureModelDataEntry> sCreatureModelDataStore(CreatureModelDatafmt);
DBCStorage <CreatureSpellDataEntry> sCreatureSpellDataStore(CreatureSpellDatafmt);
DBCStorage <CreatureTypeEntry> sCreatureTypeStore(CreatureTypefmt);
DBCStorage <CurrencyTypesEntry> sCurrencyTypesStore(CurrencyTypesfmt);

DBCStorage <DestructibleModelDataEntry> sDestructibleModelDataStore(DestructibleModelDatafmt);
DBCStorage <DungeonEncounterEntry> sDungeonEncounterStore(DungeonEncounterfmt);
DBCStorage <DurabilityQualityEntry> sDurabilityQualityStore(DurabilityQualityfmt);
DBCStorage <DurabilityCostsEntry> sDurabilityCostsStore(DurabilityCostsfmt);

DBCStorage <EmotesEntry> sEmotesStore(EmotesEntryfmt);
DBCStorage <EmotesTextEntry> sEmotesTextStore(EmotesTextEntryfmt);

typedef std::map<uint32, SimpleFactionsList> FactionTeamMap;
static FactionTeamMap sFactionTeamMap;
DBCStorage <FactionTemplateEntry> sFactionTemplateStore(FactionTemplateEntryfmt);

DBCStorage <GameObjectDisplayInfoEntry> sGameObjectDisplayInfoStore(GameObjectDisplayInfofmt);
DBCStorage <GemPropertiesEntry> sGemPropertiesStore(GemPropertiesEntryfmt);
DBCStorage <GlyphPropertiesEntry> sGlyphPropertiesStore(GlyphPropertiesfmt);
DBCStorage <GlyphSlotEntry> sGlyphSlotStore(GlyphSlotfmt);

DBCStorage <GtBarberShopCostBaseEntry>    sGtBarberShopCostBaseStore(GtBarberShopCostBasefmt);
DBCStorage <GtCombatRatingsEntry>         sGtCombatRatingsStore(GtCombatRatingsfmt);
DBCStorage <GtChanceToMeleeCritBaseEntry> sGtChanceToMeleeCritBaseStore(GtChanceToMeleeCritBasefmt);
DBCStorage <GtChanceToMeleeCritEntry>     sGtChanceToMeleeCritStore(GtChanceToMeleeCritfmt);
DBCStorage <GtChanceToSpellCritBaseEntry> sGtChanceToSpellCritBaseStore(GtChanceToSpellCritBasefmt);
DBCStorage <GtChanceToSpellCritEntry>     sGtChanceToSpellCritStore(GtChanceToSpellCritfmt);
DBCStorage <GtNPCManaCostScalerEntry>     sGtNPCManaCostScalerStore(GtNPCManaCostScalerfmt);
DBCStorage <GtOCTClassCombatRatingScalarEntry> sGtOCTClassCombatRatingScalarStore(GtOCTClassCombatRatingScalarfmt);
DBCStorage <GtOCTRegenHPEntry>            sGtOCTRegenHPStore(GtOCTRegenHPfmt);
//DBCStorage <GtOCTRegenMPEntry>            sGtOCTRegenMPStore(GtOCTRegenMPfmt);  -- not used currently
DBCStorage <GtRegenHPPerSptEntry>         sGtRegenHPPerSptStore(GtRegenHPPerSptfmt);
DBCStorage <GtRegenMPPerSptEntry>         sGtRegenMPPerSptStore(GtRegenMPPerSptfmt);

DBCStorage <HolidaysEntry>                sHolidaysStore(Holidaysfmt);

DBCStorage <ItemEntry>                    sItemStore(Itemfmt);
DBCStorage <ItemBagFamilyEntry>           sItemBagFamilyStore(ItemBagFamilyfmt);
//DBCStorage <ItemCondExtCostsEntry> sItemCondExtCostsStore(ItemCondExtCostsEntryfmt);
//DBCStorage <ItemDisplayInfoEntry> sItemDisplayInfoStore(ItemDisplayTemplateEntryfmt); -- not used currently
DBCStorage <ItemExtendedCostEntry> sItemExtendedCostStore(ItemExtendedCostEntryfmt);
DBCStorage <ItemLimitCategoryEntry> sItemLimitCategoryStore(ItemLimitCategoryEntryfmt);
DBCStorage <ItemRandomPropertiesEntry> sItemRandomPropertiesStore(ItemRandomPropertiesfmt);
DBCStorage <ItemRandomSuffixEntry> sItemRandomSuffixStore(ItemRandomSuffixfmt);
DBCStorage <ItemSetEntry> sItemSetStore(ItemSetEntryfmt);

DBCStorage <LFGDungeonEntry> sLFGDungeonStore(LFGDungeonEntryfmt);
DBCStorage <LightEntry> sLightStore(LightEntryfmt);
DBCStorage <LiquidTypeEntry> sLiquidTypeStore(LiquidTypefmt);
DBCStorage <LockEntry> sLockStore(LockEntryfmt);

DBCStorage <MailTemplateEntry> sMailTemplateStore(MailTemplateEntryfmt);
DBCStorage <MapEntry> sMapStore(MapEntryfmt);

// DBC used only for initialization sMapDifficultyMap at startup.
DBCStorage <MapDifficultyEntry> sMapDifficultyStore(MapDifficultyEntryfmt); // only for loading
MapDifficultyMap sMapDifficultyMap;

DBCStorage <MovieEntry> sMovieStore(MovieEntryfmt);

DBCStorage <OverrideSpellDataEntry> sOverrideSpellDataStore(OverrideSpellDatafmt);

DBCStorage <PowerDisplayEntry> sPowerDisplayStore(PowerDisplayfmt);
DBCStorage <PvPDifficultyEntry> sPvPDifficultyStore(PvPDifficultyfmt);

DBCStorage <QuestSortEntry> sQuestSortStore(QuestSortEntryfmt);
DBCStorage <QuestXPEntry>   sQuestXPStore(QuestXPfmt);
DBCStorage <QuestFactionRewEntry>  sQuestFactionRewardStore(QuestFactionRewardfmt);
DBCStorage <RandomPropertiesPointsEntry> sRandomPropertiesPointsStore(RandomPropertiesPointsfmt);
DBCStorage <ScalingStatDistributionEntry> sScalingStatDistributionStore(ScalingStatDistributionfmt);
DBCStorage <ScalingStatValuesEntry> sScalingStatValuesStore(ScalingStatValuesfmt);

DBCStorage <SkillLineEntry> sSkillLineStore(SkillLinefmt);
DBCStorage <SkillLineAbilityEntry> sSkillLineAbilityStore(SkillLineAbilityfmt);

DBCStorage <SoundEntriesEntry> sSoundEntriesStore(SoundEntriesfmt);

DBCStorage <SpellItemEnchantmentEntry> sSpellItemEnchantmentStore(SpellItemEnchantmentfmt);
DBCStorage <SpellItemEnchantmentConditionEntry> sSpellItemEnchantmentConditionStore(SpellItemEnchantmentConditionfmt);
SpellCategoryStore sSpellsByCategoryStore;
PetFamilySpellsStore sPetFamilySpellsStore;

DBCStorage <SpellCastTimesEntry> sSpellCastTimesStore(SpellCastTimefmt);
DBCStorage <SpellCategoryEntry> sSpellCategoryStore(SpellCategoryfmt);
DBCStorage <SpellDurationEntry> sSpellDurationStore(SpellDurationfmt);
DBCStorage <SpellFocusObjectEntry> sSpellFocusObjectStore(SpellFocusObjectfmt);
DBCStorage <SpellRadiusEntry> sSpellRadiusStore(SpellRadiusfmt);
DBCStorage <SpellRangeEntry> sSpellRangeStore(SpellRangefmt);
DBCStorage <SpellRuneCostEntry> sSpellRuneCostStore(SpellRuneCostfmt);
DBCStorage <SpellShapeshiftEntry> sSpellShapeshiftStore(SpellShapeshiftfmt);
DBCStorage <StableSlotPricesEntry> sStableSlotPricesStore(StableSlotPricesfmt);
DBCStorage <SummonPropertiesEntry> sSummonPropertiesStore(SummonPropertiesfmt);
TalentSpellPosMap sTalentSpellPosMap;
DBCStorage <TalentTabEntry> sTalentTabStore(TalentTabEntryfmt);

// store absolute bit position for first rank for talent inspect
static uint32 sTalentTabPages[MAX_CLASSES][3];

DBCStorage <TaxiNodesEntry> sTaxiNodesStore(TaxiNodesEntryfmt);
TaxiMask sTaxiNodesMask;
TaxiMask sOldContinentsNodesMask;
TaxiMask sHordeTaxiNodesMask;
TaxiMask sAllianceTaxiNodesMask;
TaxiMask sDeathKnightTaxiNodesMask;

// DBC used only for initialization sTaxiPathSetBySource at startup.
TaxiPathSetBySource sTaxiPathSetBySource;
DBCStorage <TaxiPathEntry> sTaxiPathStore(TaxiPathEntryfmt);

// DBC used only for initialization sTaxiPathNodeStore at startup.
TaxiPathNodesByPath sTaxiPathNodesByPath;
static DBCStorage <TaxiPathNodeEntry> sTaxiPathNodeStore(TaxiPathNodeEntryfmt);

DBCStorage <TeamContributionPointsEntry> sTeamContributionPointsStore(TeamContributionPointsfmt);
DBCStorage <TotemCategoryEntry> sTotemCategoryStore(TotemCategoryEntryfmt);
DBCStorage <TransportAnimationEntry> sTransportAnimationStore(TransportAnimationfmt);
DBCStorage <TransportRotationEntry> sTransportRotationStore(TransportRotationfmt);
DBCStorage <VehicleEntry> sVehicleStore(VehicleEntryfmt);
DBCStorage <VehicleSeatEntry> sVehicleSeatStore(VehicleSeatEntryfmt);
DBCStorage <WMOAreaTableEntry> sWMOAreaTableStore(WMOAreaTableEntryfmt);
DBCStorage <WorldMapAreaEntry> sWorldMapAreaStore(WorldMapAreaEntryfmt);
DBCStorage <WorldMapOverlayEntry> sWorldMapOverlayStore(WorldMapOverlayEntryfmt);
DBCStorage <WorldSafeLocsEntry> sWorldSafeLocsStore(WorldSafeLocsEntryfmt);

typedef std::list<std::string> StoreProblemList;

uint32 DBCFileCount = 0;

static bool LoadDBC_assert_print(uint32 fsize, uint32 rsize, const std::string& filename)
{
    TC_LOG_ERROR("misc", "Size of '%s' set by format string (%u) not equal size of C++ structure (%u).", filename.c_str(), fsize, rsize);

    // ASSERT must fail after function call
    return false;
}

template<class T>
inline void LoadDBC(uint32& availableDbcLocales, StoreProblemList& errors, DBCStorage<T>& storage, std::string const& dbcPath, std::string const& filename, std::string const* customFormat = NULL, std::string const* customIndexName = NULL)
{
    // compatibility format and C++ structure sizes
    ASSERT(DBCFileLoader::GetFormatRecordSize(storage.GetFormat()) == sizeof(T) || LoadDBC_assert_print(DBCFileLoader::GetFormatRecordSize(storage.GetFormat()), sizeof(T), filename));

    ++DBCFileCount;
    std::string dbcFilename = dbcPath + filename;
    SqlDbc * sql = NULL;
    if (customFormat)
        sql = new SqlDbc(&filename, customFormat, customIndexName, storage.GetFormat());

    if (storage.Load(dbcFilename.c_str(), sql))
    {
        for (uint8 i = 0; i < TOTAL_LOCALES; ++i)
        {
            if (!(availableDbcLocales & (1 << i)))
                continue;

            std::string localizedName(dbcPath);
            localizedName.append(localeNames[i]);
            localizedName.push_back('/');
            localizedName.append(filename);

            if (!storage.LoadStringsFrom(localizedName.c_str()))
                availableDbcLocales &= ~(1<<i);             // mark as not available for speedup next checks
        }
    }
    else
    {
        // sort problematic dbc to (1) non compatible and (2) non-existed
        if (FILE* f = fopen(dbcFilename.c_str(), "rb"))
        {
            std::ostringstream stream;
            stream << dbcFilename << " exists, and has " << storage.GetFieldCount() << " field(s) (expected " << strlen(storage.GetFormat()) << "). Extracted file might be from wrong client version or a database-update has been forgotten.";
            std::string buf = stream.str();
            errors.push_back(buf);
            fclose(f);
        }
        else
            errors.push_back(dbcFilename);
    }

    delete sql;
}

void LoadDBCStores(const std::string& dataPath)
{
    uint32 oldMSTime = getMSTime();

    std::string dbcPath = dataPath+"dbc/";

    StoreProblemList bad_dbc_files;
    uint32 availableDbcLocales = 0xFFFFFFFF;

    sDBCMgr->LoadAreaTableStore();

    // must be after AreaTableStore loading
    for (uint32 i = 0; i < sDBCMgr->AreaTableStore.size(); ++i)           // areaflag numbered from 0
    {
        if (AreaTableEntry const* area = sDBCMgr->GetAreaTableEntry(i))
        {
            // fill AreaId->DBC records
            sAreaFlagByAreaID.insert(AreaFlagByAreaID::value_type(uint16(area->ID), area->exploreFlag));

            // fill MapId->DBC records (skip sub zones and continents)
            if (area->zone == 0 && area->mapid != 0 && area->mapid != 1 && area->mapid != 530 && area->mapid != 571)
                sAreaFlagByMapID.insert(AreaFlagByMapID::value_type(area->mapid, area->exploreFlag));
        }
    }

    sDBCMgr->LoadAchievementStore();
    sDBCMgr->LoadAchievementCriteriaStore();
    LoadDBC(availableDbcLocales, bad_dbc_files, sAreaTriggerStore,            dbcPath, "AreaTrigger.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sAreaGroupStore,              dbcPath, "AreaGroup.dbc");
    sDBCMgr->LoadAreaPOIStore();
    LoadDBC(availableDbcLocales, bad_dbc_files, sAuctionHouseStore,           dbcPath, "AuctionHouse.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sBankBagSlotPricesStore,      dbcPath, "BankBagSlotPrices.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sBannedAddOnsStore,           dbcPath, "BannedAddOns.dbc");
    sDBCMgr->LoadBattlemasterListStore();
    LoadDBC(availableDbcLocales, bad_dbc_files, sBarberShopStyleStore,        dbcPath, "BarberShopStyle.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sCharStartOutfitStore,        dbcPath, "CharStartOutfit.dbc");
    for (uint32 i = 0; i < sCharStartOutfitStore.GetNumRows(); ++i)
        if (CharStartOutfitEntry const* outfit = sCharStartOutfitStore.LookupEntry(i))
            sCharStartOutfitMap[outfit->Race | (outfit->Class << 8) | (outfit->Gender << 16)] = outfit;

    sDBCMgr->LoadCharTitlesStore();
    LoadDBC(availableDbcLocales, bad_dbc_files, sChatChannelsStore,           dbcPath, "ChatChannels.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sChrClassesStore,             dbcPath, "ChrClasses.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sChrRacesStore,               dbcPath, "ChrRaces.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sCinematicSequencesStore,     dbcPath, "CinematicSequences.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sCreatureDisplayInfoStore,    dbcPath, "CreatureDisplayInfo.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sCreatureDisplayInfoExtraStore, dbcPath, "CreatureDisplayInfoExtra.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sCreatureFamilyStore,         dbcPath, "CreatureFamily.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sCreatureModelDataStore,      dbcPath, "CreatureModelData.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sCreatureSpellDataStore,      dbcPath, "CreatureSpellData.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sCreatureTypeStore,           dbcPath, "CreatureType.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sCurrencyTypesStore,          dbcPath, "CurrencyTypes.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sDestructibleModelDataStore,  dbcPath, "DestructibleModelData.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sDungeonEncounterStore,       dbcPath, "DungeonEncounter.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sDurabilityCostsStore,        dbcPath, "DurabilityCosts.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sDurabilityQualityStore,      dbcPath, "DurabilityQuality.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sEmotesStore,                 dbcPath, "Emotes.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sEmotesTextStore,             dbcPath, "EmotesText.dbc");
    sDBCMgr->LoadFactionStore();
    for (uint32 i = 0; i < sDBCMgr->FactionStore.size(); ++i)
    {
        FactionEntry const* faction = sDBCMgr->GetFactionEntry(i);
        if (faction && faction->team)
        {
            SimpleFactionsList &flist = sFactionTeamMap[faction->team];
            flist.push_back(i);
        }
    }

    LoadDBC(availableDbcLocales, bad_dbc_files, sFactionTemplateStore,        dbcPath, "FactionTemplate.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sGameObjectDisplayInfoStore,  dbcPath, "GameObjectDisplayInfo.dbc");
    for (uint32 i = 0; i < sGameObjectDisplayInfoStore.GetNumRows(); ++i)
    {
        if (GameObjectDisplayInfoEntry const* info = sGameObjectDisplayInfoStore.LookupEntry(i))
        {
            if (info->maxX < info->minX)
                std::swap(*(float*)(&info->maxX), *(float*)(&info->minX));
            if (info->maxY < info->minY)
                std::swap(*(float*)(&info->maxY), *(float*)(&info->minY));
            if (info->maxZ < info->minZ)
                std::swap(*(float*)(&info->maxZ), *(float*)(&info->minZ));
        }
    }

    LoadDBC(availableDbcLocales, bad_dbc_files, sGemPropertiesStore,          dbcPath, "GemProperties.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sGlyphPropertiesStore,        dbcPath, "GlyphProperties.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sGlyphSlotStore,              dbcPath, "GlyphSlot.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sGtBarberShopCostBaseStore,   dbcPath, "gtBarberShopCostBase.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sGtCombatRatingsStore,        dbcPath, "gtCombatRatings.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sGtChanceToMeleeCritBaseStore, dbcPath, "gtChanceToMeleeCritBase.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sGtChanceToMeleeCritStore,    dbcPath, "gtChanceToMeleeCrit.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sGtChanceToSpellCritBaseStore, dbcPath, "gtChanceToSpellCritBase.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sGtChanceToSpellCritStore,    dbcPath, "gtChanceToSpellCrit.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sGtNPCManaCostScalerStore,    dbcPath, "gtNPCManaCostScaler.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sGtOCTClassCombatRatingScalarStore,    dbcPath, "gtOCTClassCombatRatingScalar.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sGtOCTRegenHPStore,           dbcPath, "gtOCTRegenHP.dbc");
    //LoadDBC(dbcCount, availableDbcLocales, bad_dbc_files, sGtOCTRegenMPStore,           dbcPath, "gtOCTRegenMP.dbc");       -- not used currently
    LoadDBC(availableDbcLocales, bad_dbc_files, sGtRegenHPPerSptStore,        dbcPath, "gtRegenHPPerSpt.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sGtRegenMPPerSptStore,        dbcPath, "gtRegenMPPerSpt.dbc");

    LoadDBC(availableDbcLocales, bad_dbc_files, sHolidaysStore,               dbcPath, "Holidays.dbc");

    LoadDBC(availableDbcLocales, bad_dbc_files, sItemStore,                   dbcPath, "Item.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sItemBagFamilyStore,          dbcPath, "ItemBagFamily.dbc");
    //LoadDBC(dbcCount, availableDbcLocales, bad_dbc_files, sItemDisplayInfoStore,        dbcPath, "ItemDisplayInfo.dbc");     -- not used currently
    //LoadDBC(dbcCount, availableDbcLocales, bad_dbc_files, sItemCondExtCostsStore,       dbcPath, "ItemCondExtCosts.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sItemExtendedCostStore,       dbcPath, "ItemExtendedCost.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sItemLimitCategoryStore,      dbcPath, "ItemLimitCategory.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sItemRandomPropertiesStore,   dbcPath, "ItemRandomProperties.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sItemRandomSuffixStore,       dbcPath, "ItemRandomSuffix.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sItemSetStore,                dbcPath, "ItemSet.dbc");

    LoadDBC(availableDbcLocales, bad_dbc_files, sLFGDungeonStore,             dbcPath, "LFGDungeons.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sLightStore,                  dbcPath, "Light.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sLiquidTypeStore,             dbcPath, "LiquidType.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sLockStore,                   dbcPath, "Lock.dbc");

    LoadDBC(availableDbcLocales, bad_dbc_files, sMailTemplateStore,           dbcPath, "MailTemplate.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sMapStore,                    dbcPath, "Map.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sMapDifficultyStore,          dbcPath, "MapDifficulty.dbc");
    // fill data
    for (uint32 i = 1; i < sMapDifficultyStore.GetNumRows(); ++i)
        if (MapDifficultyEntry const* entry = sMapDifficultyStore.LookupEntry(i))
            sMapDifficultyMap[MAKE_PAIR32(entry->MapId, entry->Difficulty)] = MapDifficulty(entry->resetTime, entry->maxPlayers, entry->areaTriggerText[0] != '\0');
    sMapDifficultyStore.Clear();

    LoadDBC(availableDbcLocales, bad_dbc_files, sMovieStore,                  dbcPath, "Movie.dbc");

    LoadDBC(availableDbcLocales, bad_dbc_files, sOverrideSpellDataStore,      dbcPath, "OverrideSpellData.dbc");

    LoadDBC(availableDbcLocales, bad_dbc_files, sPowerDisplayStore,           dbcPath, "PowerDisplay.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sPvPDifficultyStore,          dbcPath, "PvpDifficulty.dbc");
    for (uint32 i = 0; i < sPvPDifficultyStore.GetNumRows(); ++i)
        if (PvPDifficultyEntry const* entry = sPvPDifficultyStore.LookupEntry(i))
            if (entry->bracketId > MAX_BATTLEGROUND_BRACKETS)
                ASSERT(false && "Need update MAX_BATTLEGROUND_BRACKETS by DBC data");

    LoadDBC(availableDbcLocales, bad_dbc_files, sQuestXPStore,                dbcPath, "QuestXP.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sQuestFactionRewardStore,     dbcPath, "QuestFactionReward.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sQuestSortStore,              dbcPath, "QuestSort.dbc");

    LoadDBC(availableDbcLocales, bad_dbc_files, sRandomPropertiesPointsStore, dbcPath, "RandPropPoints.dbc");

    LoadDBC(availableDbcLocales, bad_dbc_files, sScalingStatDistributionStore, dbcPath, "ScalingStatDistribution.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sScalingStatValuesStore,      dbcPath, "ScalingStatValues.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sSkillLineStore,              dbcPath, "SkillLine.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sSkillLineAbilityStore,       dbcPath, "SkillLineAbility.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sSoundEntriesStore,           dbcPath, "SoundEntries.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sSpellCastTimesStore,         dbcPath, "SpellCastTimes.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sSpellCategoryStore,          dbcPath, "SpellCategory.dbc");
    sDBCMgr->LoadSpellDifficultyStore();
    LoadDBC(availableDbcLocales, bad_dbc_files, sSpellDurationStore,          dbcPath, "SpellDuration.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sSpellFocusObjectStore,       dbcPath, "SpellFocusObject.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sSpellItemEnchantmentStore,   dbcPath, "SpellItemEnchantment.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sSpellItemEnchantmentConditionStore, dbcPath, "SpellItemEnchantmentCondition.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sSpellRadiusStore,            dbcPath, "SpellRadius.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sSpellRangeStore,             dbcPath, "SpellRange.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sSpellRuneCostStore,          dbcPath, "SpellRuneCost.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sSpellShapeshiftStore,        dbcPath, "SpellShapeshiftForm.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sStableSlotPricesStore,       dbcPath, "StableSlotPrices.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sSummonPropertiesStore,       dbcPath, "SummonProperties.dbc");

    sDBCMgr->LoadTalentStore();

    // create talent spells set
    for (TalentContainer::const_iterator itr = sDBCMgr->TalentStore.begin(); itr != sDBCMgr->TalentStore.end(); ++itr)
    {
        TalentEntry const* talentInfo = itr->second;
        if (!talentInfo)
            continue;

        for (int j = 0; j < MAX_TALENT_RANK; j++)
            if (talentInfo->RankID[j])
                sTalentSpellPosMap[talentInfo->RankID[j]] = TalentSpellPos(itr->first, j);
    }

    LoadDBC(availableDbcLocales, bad_dbc_files, sTalentTabStore,              dbcPath, "TalentTab.dbc");

    // prepare fast data access to bit pos of talent ranks for use at inspecting
    {
        // now have all max ranks (and then bit amount used for store talent ranks in inspect)
        for (uint32 talentTabId = 1; talentTabId < sTalentTabStore.GetNumRows(); ++talentTabId)
        {
            TalentTabEntry const* talentTabInfo = sTalentTabStore.LookupEntry(talentTabId);
            if (!talentTabInfo)
                continue;

            // prevent memory corruption; otherwise cls will become 12 below
            if ((talentTabInfo->ClassMask & CLASSMASK_ALL_PLAYABLE) == 0)
                continue;

            // store class talent tab pages
            for (uint32 cls = 1; cls < MAX_CLASSES; ++cls)
                if (talentTabInfo->ClassMask & (1 << (cls - 1)))
                    sTalentTabPages[cls][talentTabInfo->tabpage] = talentTabId;
        }
    }

    LoadDBC(availableDbcLocales, bad_dbc_files, sTaxiNodesStore,              dbcPath, "TaxiNodes.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sTaxiPathStore,               dbcPath, "TaxiPath.dbc");
    for (uint32 i = 1; i < sTaxiPathStore.GetNumRows(); ++i)
        if (TaxiPathEntry const* entry = sTaxiPathStore.LookupEntry(i))
            sTaxiPathSetBySource[entry->from][entry->to] = TaxiPathBySourceAndDestination(entry->ID, entry->price);
    uint32 pathCount = sTaxiPathStore.GetNumRows();

    //## TaxiPathNode.dbc ## Loaded only for initialization different structures
    LoadDBC(availableDbcLocales, bad_dbc_files, sTaxiPathNodeStore,           dbcPath, "TaxiPathNode.dbc");
    // Calculate path nodes count
    std::vector<uint32> pathLength;
    pathLength.resize(pathCount);                           // 0 and some other indexes not used
    for (uint32 i = 1; i < sTaxiPathNodeStore.GetNumRows(); ++i)
        if (TaxiPathNodeEntry const* entry = sTaxiPathNodeStore.LookupEntry(i))
        {
            if (pathLength[entry->path] < entry->index + 1)
                pathLength[entry->path] = entry->index + 1;
        }
    // Set path length
    sTaxiPathNodesByPath.resize(pathCount);                 // 0 and some other indexes not used
    for (uint32 i = 1; i < sTaxiPathNodesByPath.size(); ++i)
        sTaxiPathNodesByPath[i].resize(pathLength[i]);
    // fill data
    for (uint32 i = 1; i < sTaxiPathNodeStore.GetNumRows(); ++i)
        if (TaxiPathNodeEntry const* entry = sTaxiPathNodeStore.LookupEntry(i))
            sTaxiPathNodesByPath[entry->path].set(entry->index, entry);

    LoadDBC(availableDbcLocales, bad_dbc_files, sTeamContributionPointsStore, dbcPath, "TeamContributionPoints.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sTotemCategoryStore,          dbcPath, "TotemCategory.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sTransportAnimationStore,     dbcPath, "TransportAnimation.dbc");
    for (uint32 i = 0; i < sTransportAnimationStore.GetNumRows(); ++i)
    {
        TransportAnimationEntry const* anim = sTransportAnimationStore.LookupEntry(i);
        if (!anim)
            continue;

        sTransportMgr->AddPathNodeToTransport(anim->TransportEntry, anim->TimeSeg, anim);
    }

    LoadDBC(availableDbcLocales, bad_dbc_files, sTransportRotationStore,     dbcPath, "TransportRotation.dbc");
    for (uint32 i = 0; i < sTransportRotationStore.GetNumRows(); ++i)
    {
        TransportRotationEntry const* rot = sTransportRotationStore.LookupEntry(i);
        if (!rot)
            continue;

        sTransportMgr->AddPathRotationToTransport(rot->TransportEntry, rot->TimeSeg, rot);
    }

    LoadDBC(availableDbcLocales, bad_dbc_files, sVehicleStore,                dbcPath, "Vehicle.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sVehicleSeatStore,            dbcPath, "VehicleSeat.dbc");

    LoadDBC(availableDbcLocales, bad_dbc_files, sWMOAreaTableStore,           dbcPath, "WMOAreaTable.dbc");
    for (uint32 i = 0; i < sWMOAreaTableStore.GetNumRows(); ++i)
        if (WMOAreaTableEntry const* entry = sWMOAreaTableStore.LookupEntry(i))
            sWMOAreaInfoByTripple.insert(WMOAreaInfoByTripple::value_type(WMOAreaTableTripple(entry->rootId, entry->adtId, entry->groupId), entry));
    LoadDBC(availableDbcLocales, bad_dbc_files, sWorldMapAreaStore,           dbcPath, "WorldMapArea.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sWorldMapOverlayStore,        dbcPath, "WorldMapOverlay.dbc");
    LoadDBC(availableDbcLocales, bad_dbc_files, sWorldSafeLocsStore,          dbcPath, "WorldSafeLocs.dbc");

    TC_LOG_INFO("server.loading", "Loading SpellInfo store...");
    sSpellMgr->LoadSpellInfoStore();

    for (uint32 j = 0; j < sSkillLineAbilityStore.GetNumRows(); ++j) // (After SkillLineAbility CreatureFamily Spell)
    {
        SkillLineAbilityEntry const* skillLine = sSkillLineAbilityStore.LookupEntry(j);

        if (!skillLine)
            continue;

        SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(skillLine->spellId);

        if (spellInfo && spellInfo->Attributes & SPELL_ATTR0_PASSIVE)
        {
            for (uint32 i = 1; i < sCreatureFamilyStore.GetNumRows(); ++i)
            {
                CreatureFamilyEntry const* cFamily = sCreatureFamilyStore.LookupEntry(i);
                if (!cFamily)
                    continue;

                if (skillLine->skillId != cFamily->skillLine[0] && skillLine->skillId != cFamily->skillLine[1])
                    continue;
                if (spellInfo->SpellLevel)
                    continue;

                if (skillLine->learnOnGetSkill != ABILITY_LEARNED_ON_GET_RACE_OR_CLASS_SKILL)
                    continue;

                sPetFamilySpellsStore[i].insert(spellInfo->Id);
            }
        }
    }

    // Create Spelldifficulty searcher (After SpellDifficulty Spell)
    for (SpellDifficultyContainer::const_iterator itr = sDBCMgr->SpellDifficultyStore.begin(); itr != sDBCMgr->SpellDifficultyStore.end(); ++itr)
    {
        SpellDifficultyEntry const* spellDiff = itr->second;
        if (!spellDiff)
            continue;

        SpellDifficultyEntry newEntry;
        memset(newEntry.SpellID, 0, 4 * sizeof(uint32));
        for (int x = 0; x < MAX_DIFFICULTY; ++x)
        {
            if (spellDiff->SpellID[x] <= 0 || !sSpellMgr->GetSpellInfo(spellDiff->SpellID[x]))
            {
                if (spellDiff->SpellID[x] > 0)//don't show error if spell is <= 0, not all modes have spells and there are unknown negative values
                    TC_LOG_ERROR("sql.sql", "`spelldifficultydbc` table: spell %i at field id:%u at spellid%i does not exist in SpellStore (`spells` table), loaded as 0", spellDiff->SpellID[x], spellDiff->ID, x);
                newEntry.SpellID[x] = 0;//spell was <= 0 or invalid, set to 0
            }
            else
                newEntry.SpellID[x] = spellDiff->SpellID[x];
        }
        if (newEntry.SpellID[0] <= 0 || newEntry.SpellID[1] <= 0)//id0-1 must be always set!
            continue;

        for (int x = 0; x < MAX_DIFFICULTY; ++x)
        if (newEntry.SpellID[x])
            sSpellMgr->SetSpellDifficultyId(uint32(newEntry.SpellID[x]), spellDiff->ID);
    }

    // Initialize global taxinodes mask
    // include existed nodes that have at least single not spell base (scripted) path
    {
        std::set<uint32> spellPaths;
        for (uint32 i = 1; i < sSpellMgr->GetSpellInfoStoreSize(); ++i)
            if (SpellInfo const* sInfo = sSpellMgr->GetSpellInfo(i))
                for (int j = 0; j < MAX_SPELL_EFFECTS; ++j)
                    if (sInfo->Effects[j].Effect == SPELL_EFFECT_SEND_TAXI)
                        spellPaths.insert(sInfo->Effects[j].MiscValue);

        memset(sTaxiNodesMask, 0, sizeof(sTaxiNodesMask));
        memset(sOldContinentsNodesMask, 0, sizeof(sOldContinentsNodesMask));
        memset(sHordeTaxiNodesMask, 0, sizeof(sHordeTaxiNodesMask));
        memset(sAllianceTaxiNodesMask, 0, sizeof(sAllianceTaxiNodesMask));
        memset(sDeathKnightTaxiNodesMask, 0, sizeof(sDeathKnightTaxiNodesMask));
        for (uint32 i = 1; i < sTaxiNodesStore.GetNumRows(); ++i)
        {
            TaxiNodesEntry const* node = sTaxiNodesStore.LookupEntry(i);
            if (!node)
                continue;

            TaxiPathSetBySource::const_iterator src_i = sTaxiPathSetBySource.find(i);
            if (src_i != sTaxiPathSetBySource.end() && !src_i->second.empty())
            {
                bool ok = false;
                for (TaxiPathSetForSource::const_iterator dest_i = src_i->second.begin(); dest_i != src_i->second.end(); ++dest_i)
                {
                    // not spell path
                    if (spellPaths.find(dest_i->second.ID) == spellPaths.end())
                    {
                        ok = true;
                        break;
                    }
                }

                if (!ok)
                    continue;
            }

            // valid taxi network node
            uint8  field = (uint8)((i - 1) / 32);
            uint32 submask = 1 << ((i - 1) % 32);
            sTaxiNodesMask[field] |= submask;

            if (node->MountCreatureID[0] && node->MountCreatureID[0] != 32981)
                sHordeTaxiNodesMask[field] |= submask;
            if (node->MountCreatureID[1] && node->MountCreatureID[1] != 32981)
                sAllianceTaxiNodesMask[field] |= submask;
            if (node->MountCreatureID[0] == 32981 || node->MountCreatureID[1] == 32981)
                sDeathKnightTaxiNodesMask[field] |= submask;

            // old continent node (+ nodes virtually at old continents, check explicitly to avoid loading map files for zone info)
            if (node->map_id < 2 || i == 82 || i == 83 || i == 93 || i == 94)
                sOldContinentsNodesMask[field] |= submask;

            // fix DK node at Ebon Hold and Shadow Vault flight master
            if (i == 315 || i == 333)
                ((TaxiNodesEntry*)node)->MountCreatureID[1] = 32981;
        }
    }

    // error checks
    if (bad_dbc_files.size() >= DBCFileCount)
    {
        TC_LOG_ERROR("misc", "Incorrect DataDir value in worldserver.conf or ALL required *.dbc files (%d) not found by path: %sdbc", DBCFileCount, dataPath.c_str());
        exit(1);
    }
    else if (!bad_dbc_files.empty())
    {
        std::string str;
        for (StoreProblemList::iterator i = bad_dbc_files.begin(); i != bad_dbc_files.end(); ++i)
            str += *i + "\n";

        TC_LOG_ERROR("misc", "Some required *.dbc files (%u from %d) not found or not compatible:\n%s", (uint32)bad_dbc_files.size(), DBCFileCount, str.c_str());
        exit(1);
    }

    TC_LOG_INFO("server.loading", ">> Initialized %d data stores in %u ms", DBCFileCount, GetMSTimeDiffToNow(oldMSTime));

}

SimpleFactionsList const* GetFactionTeamList(uint32 faction)
{
    FactionTeamMap::const_iterator itr = sFactionTeamMap.find(faction);
    if (itr != sFactionTeamMap.end())
        return &itr->second;

    return NULL;
}

char* GetPetName(uint32 petfamily, uint32 dbclang)
{
    if (!petfamily)
        return NULL;
    CreatureFamilyEntry const* pet_family = sCreatureFamilyStore.LookupEntry(petfamily);
    if (!pet_family)
        return NULL;
    return pet_family->Name[dbclang]?pet_family->Name[dbclang]:NULL;
}

TalentSpellPos const* GetTalentSpellPos(uint32 spellId)
{
    TalentSpellPosMap::const_iterator itr = sTalentSpellPosMap.find(spellId);
    if (itr == sTalentSpellPosMap.end())
        return NULL;

    return &itr->second;
}

uint32 GetTalentSpellCost(uint32 spellId)
{
    if (TalentSpellPos const* pos = GetTalentSpellPos(spellId))
        return pos->rank+1;

    return 0;
}

int32 GetAreaFlagByAreaID(uint32 area_id)
{
    AreaFlagByAreaID::iterator i = sAreaFlagByAreaID.find(area_id);
    if (i == sAreaFlagByAreaID.end())
        return -1;

    return i->second;
}

WMOAreaTableEntry const* GetWMOAreaTableEntryByTripple(int32 rootid, int32 adtid, int32 groupid)
{
    WMOAreaInfoByTripple::iterator i = sWMOAreaInfoByTripple.find(WMOAreaTableTripple(rootid, adtid, groupid));
        if (i == sWMOAreaInfoByTripple.end())
            return NULL;
        return i->second;
}

AreaTableEntry const* GetAreaEntryByAreaID(uint32 area_id)
{
    int32 areaflag = GetAreaFlagByAreaID(area_id);
    if (areaflag < 0)
        return NULL;

    return sDBCMgr->GetAreaTableEntry(areaflag);
}

AreaTableEntry const* GetAreaEntryByAreaFlagAndMap(uint32 area_flag, uint32 map_id)
{
    if (area_flag)
        return sDBCMgr->GetAreaTableEntry(area_flag);

    if (MapEntry const* mapEntry = sMapStore.LookupEntry(map_id))
        return GetAreaEntryByAreaID(mapEntry->linked_zone);

    return NULL;
}

char const* GetRaceName(uint8 race, uint8 locale)
{
    ChrRacesEntry const* raceEntry = sChrRacesStore.LookupEntry(race);
    return raceEntry ? raceEntry->name[locale] : NULL;
}

char const* GetClassName(uint8 class_, uint8 locale)
{
    ChrClassesEntry const* classEntry = sChrClassesStore.LookupEntry(class_);
    return classEntry ? classEntry->name[locale] : NULL;
}

uint32 GetAreaFlagByMapId(uint32 mapid)
{
    AreaFlagByMapID::iterator i = sAreaFlagByMapID.find(mapid);
    if (i == sAreaFlagByMapID.end())
        return 0;
    else
        return i->second;
}

uint32 GetVirtualMapForMapAndZone(uint32 mapid, uint32 zoneId)
{
    if (mapid != 530 && mapid != 571)                        // speed for most cases
        return mapid;

    if (WorldMapAreaEntry const* wma = sWorldMapAreaStore.LookupEntry(zoneId))
        return wma->virtual_map_id >= 0 ? wma->virtual_map_id : wma->map_id;

    return mapid;
}

ContentLevels GetContentLevelsForMapAndZone(uint32 mapid, uint32 zoneId)
{
    mapid = GetVirtualMapForMapAndZone(mapid, zoneId);
    if (mapid < 2)
        return CONTENT_1_60;

    MapEntry const* mapEntry = sMapStore.LookupEntry(mapid);
    if (!mapEntry)
        return CONTENT_1_60;

    switch (mapEntry->Expansion())
    {
        default: return CONTENT_1_60;
        case 1:  return CONTENT_61_70;
        case 2:  return CONTENT_71_80;
    }
}

bool IsTotemCategoryCompatiableWith(uint32 itemTotemCategoryId, uint32 requiredTotemCategoryId)
{
    if (requiredTotemCategoryId == 0)
        return true;
    if (itemTotemCategoryId == 0)
        return false;

    TotemCategoryEntry const* itemEntry = sTotemCategoryStore.LookupEntry(itemTotemCategoryId);
    if (!itemEntry)
        return false;
    TotemCategoryEntry const* reqEntry = sTotemCategoryStore.LookupEntry(requiredTotemCategoryId);
    if (!reqEntry)
        return false;

    if (itemEntry->categoryType != reqEntry->categoryType)
        return false;

    return (itemEntry->categoryMask & reqEntry->categoryMask) == reqEntry->categoryMask;
}

void Zone2MapCoordinates(float& x, float& y, uint32 zone)
{
    WorldMapAreaEntry const* maEntry = sWorldMapAreaStore.LookupEntry(zone);

    // if not listed then map coordinates (instance)
    if (!maEntry)
        return;

    std::swap(x, y);                                         // at client map coords swapped
    x = x*((maEntry->x2-maEntry->x1)/100)+maEntry->x1;
    y = y*((maEntry->y2-maEntry->y1)/100)+maEntry->y1;      // client y coord from top to down
}

void Map2ZoneCoordinates(float& x, float& y, uint32 zone)
{
    WorldMapAreaEntry const* maEntry = sWorldMapAreaStore.LookupEntry(zone);

    // if not listed then map coordinates (instance)
    if (!maEntry)
        return;

    x = (x-maEntry->x1)/((maEntry->x2-maEntry->x1)/100);
    y = (y-maEntry->y1)/((maEntry->y2-maEntry->y1)/100);    // client y coord from top to down
    std::swap(x, y);                                         // client have map coords swapped
}

MapDifficulty const* GetMapDifficultyData(uint32 mapId, Difficulty difficulty)
{
    MapDifficultyMap::const_iterator itr = sMapDifficultyMap.find(MAKE_PAIR32(mapId, difficulty));
    return itr != sMapDifficultyMap.end() ? &itr->second : NULL;
}

MapDifficulty const* GetDownscaledMapDifficultyData(uint32 mapId, Difficulty &difficulty)
{
    uint32 tmpDiff = difficulty;
    MapDifficulty const* mapDiff = GetMapDifficultyData(mapId, Difficulty(tmpDiff));
    if (!mapDiff)
    {
        if (tmpDiff > RAID_DIFFICULTY_25MAN_NORMAL) // heroic, downscale to normal
            tmpDiff -= 2;
        else
            tmpDiff -= 1;   // any non-normal mode for raids like tbc (only one mode)

        // pull new data
        mapDiff = GetMapDifficultyData(mapId, Difficulty(tmpDiff)); // we are 10 normal or 25 normal
        if (!mapDiff)
        {
            tmpDiff -= 1;
            mapDiff = GetMapDifficultyData(mapId, Difficulty(tmpDiff)); // 10 normal
        }
    }

    difficulty = Difficulty(tmpDiff);
    return mapDiff;
}

PvPDifficultyEntry const* GetBattlegroundBracketByLevel(uint32 mapid, uint32 level)
{
    PvPDifficultyEntry const* maxEntry = NULL;              // used for level > max listed level case
    for (uint32 i = 0; i < sPvPDifficultyStore.GetNumRows(); ++i)
    {
        if (PvPDifficultyEntry const* entry = sPvPDifficultyStore.LookupEntry(i))
        {
            // skip unrelated and too-high brackets
            if (entry->mapId != mapid || entry->minLevel > level)
                continue;

            // exactly fit
            if (entry->maxLevel >= level)
                return entry;

            // remember for possible out-of-range case (search higher from existed)
            if (!maxEntry || maxEntry->maxLevel < entry->maxLevel)
                maxEntry = entry;
        }
    }

    return maxEntry;
}

PvPDifficultyEntry const* GetBattlegroundBracketById(uint32 mapid, BattlegroundBracketId id)
{
    for (uint32 i = 0; i < sPvPDifficultyStore.GetNumRows(); ++i)
        if (PvPDifficultyEntry const* entry = sPvPDifficultyStore.LookupEntry(i))
            if (entry->mapId == mapid && entry->GetBracketId() == id)
                return entry;

    return NULL;
}

uint32 const* GetTalentTabPages(uint8 cls)
{
    return sTalentTabPages[cls];
}

uint32 GetLiquidFlags(uint32 liquidType)
{
    if (LiquidTypeEntry const* liq = sLiquidTypeStore.LookupEntry(liquidType))
        return 1 << liq->Type;

    return 0;
}

CharStartOutfitEntry const* GetCharStartOutfitEntry(uint8 race, uint8 class_, uint8 gender)
{
    std::map<uint32, CharStartOutfitEntry const*>::const_iterator itr = sCharStartOutfitMap.find(race | (class_ << 8) | (gender << 16));
    if (itr == sCharStartOutfitMap.end())
        return NULL;

    return itr->second;
}

/// Returns LFGDungeonEntry for a specific map and difficulty. Will return first found entry if multiple dungeons use the same map (such as Scarlet Monastery)
LFGDungeonEntry const* GetLFGDungeon(uint32 mapId, Difficulty difficulty)
{
    for (uint32 i = 0; i < sLFGDungeonStore.GetNumRows(); ++i)
    {
        LFGDungeonEntry const* dungeon = sLFGDungeonStore.LookupEntry(i);
        if (!dungeon)
            continue;

        if (dungeon->map == int32(mapId) && Difficulty(dungeon->difficulty) == difficulty)
            return dungeon;
    }

    return NULL;
}

uint32 GetDefaultMapLight(uint32 mapId)
{
    for (int32 i = sLightStore.GetNumRows(); i >= 0; --i)
    {
        LightEntry const* light = sLightStore.LookupEntry(uint32(i));
        if (!light)
            continue;

        if (light->MapId == mapId && light->X == 0.0f && light->Y == 0.0f && light->Z == 0.0f)
            return light->Id;
    }

    return 0;
}

void DBCMgr::LoadAchievementStore()
{
    uint32 oldMSTime = getMSTime();
    AchievementStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Faction, MapId, Name, Name_loc2, Category, Points, Flags, Demands, ReferencedAchievement FROM achievementdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 achievement entry. DB table `achievementdbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        AchievementEntry* newAchievement = new AchievementEntry;
        newAchievement->ID              = fields[0].GetUInt32();
        newAchievement->requiredFaction = fields[1].GetInt32();
        newAchievement->mapID           = fields[2].GetInt32();
        for (uint8 i = 0; i < 16; i++)
            newAchievement->name[i]     = NULL;
        newAchievement->name[0]         = (char*)fields[3].GetCString();
        newAchievement->name[2]         = (char*)fields[4].GetCString();
        newAchievement->categoryId      = fields[5].GetUInt32();
        newAchievement->points          = fields[6].GetUInt32();
        newAchievement->flags           = fields[7].GetUInt32();
        newAchievement->count           = fields[8].GetUInt32();
        newAchievement->refAchievement  = fields[9].GetUInt32();
        AchievementStore[newAchievement->ID] = newAchievement;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu Achievement entries in %u ms", (unsigned long)AchievementStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadAchievementCriteriaStore()
{
    uint32 oldMSTime = getMSTime();
    AchievementCriteriaStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Achievement, Type, AssetId, Quantity, StartEvent, StartAsset, FailEvent, FailAsset, "
                            "Flags, TimerStartEvent, TimerAssetId, TimerTime FROM achievement_criteriadbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 achievement criteria entry. DB table `achievement_criteriadbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        AchievementCriteriaEntry* newAchievementCriteria = new AchievementCriteriaEntry;
        newAchievementCriteria->ID                  = fields[0].GetUInt32();
        newAchievementCriteria->referredAchievement = fields[1].GetUInt32();
        newAchievementCriteria->requiredType        = fields[2].GetUInt32();
        switch (newAchievementCriteria->requiredType)
        {
            case ACHIEVEMENT_CRITERIA_TYPE_KILL_CREATURE:
                newAchievementCriteria->kill_creature.creatureID = fields[3].GetUInt32();
                newAchievementCriteria->kill_creature.creatureCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_WIN_BG:
                newAchievementCriteria->win_bg.bgMapID = fields[3].GetUInt32();
                newAchievementCriteria->win_bg.winCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_REACH_LEVEL:
                newAchievementCriteria->reach_level.unused = fields[3].GetUInt32();
                newAchievementCriteria->reach_level.level = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_REACH_SKILL_LEVEL:
                newAchievementCriteria->reach_skill_level.skillID = fields[3].GetUInt32();
                newAchievementCriteria->reach_skill_level.skillLevel = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_COMPLETE_ACHIEVEMENT:
                newAchievementCriteria->complete_achievement.linkedAchievement = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_COMPLETE_QUEST_COUNT:
                newAchievementCriteria->complete_quest_count.unused = fields[3].GetUInt32();
                newAchievementCriteria->complete_quest_count.totalQuestCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_COMPLETE_DAILY_QUEST_DAILY:
                newAchievementCriteria->complete_daily_quest_daily.unused = fields[3].GetUInt32();
                newAchievementCriteria->complete_daily_quest_daily.numberOfDays = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_COMPLETE_QUESTS_IN_ZONE:
                newAchievementCriteria->complete_quests_in_zone.zoneID = fields[3].GetUInt32();
                newAchievementCriteria->complete_quests_in_zone.questCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_COMPLETE_DAILY_QUEST:
                newAchievementCriteria->complete_daily_quest.unused = fields[3].GetUInt32();
                newAchievementCriteria->complete_daily_quest.questCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_COMPLETE_BATTLEGROUND:
                newAchievementCriteria->complete_battleground.mapID = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_DEATH_AT_MAP:
                newAchievementCriteria->death_at_map.mapID = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_DEATH_IN_DUNGEON:
                newAchievementCriteria->death_in_dungeon.manLimit = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_COMPLETE_RAID:
                newAchievementCriteria->complete_raid.groupSize = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_KILLED_BY_CREATURE:
                newAchievementCriteria->killed_by_creature.creatureEntry = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_FALL_WITHOUT_DYING:
                newAchievementCriteria->fall_without_dying.unused = fields[3].GetUInt32();
                newAchievementCriteria->fall_without_dying.fallHeight = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_DEATHS_FROM:
                newAchievementCriteria->death_from.type = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_COMPLETE_QUEST:
                newAchievementCriteria->complete_quest.questID = fields[3].GetUInt32();
                newAchievementCriteria->complete_quest.questCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET:
                newAchievementCriteria->be_spell_target.spellID = fields[3].GetUInt32();
                newAchievementCriteria->be_spell_target.spellCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_CAST_SPELL:
                newAchievementCriteria->cast_spell.spellID = fields[3].GetUInt32();
                newAchievementCriteria->cast_spell.castCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_BG_OBJECTIVE_CAPTURE:
                newAchievementCriteria->bg_objective.objectiveId = fields[3].GetUInt32();
                newAchievementCriteria->bg_objective.completeCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_HONORABLE_KILL_AT_AREA:
                newAchievementCriteria->honorable_kill_at_area.areaID = fields[3].GetUInt32();
                newAchievementCriteria->honorable_kill_at_area.killCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_WIN_ARENA:
                newAchievementCriteria->win_arena.mapID = fields[3].GetUInt32();
                newAchievementCriteria->win_arena.count = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_PLAY_ARENA:
                newAchievementCriteria->play_arena.mapID = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_LEARN_SPELL:
                newAchievementCriteria->learn_spell.spellID = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_OWN_ITEM:
                newAchievementCriteria->own_item.itemID = fields[3].GetUInt32();
                newAchievementCriteria->own_item.itemCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_WIN_RATED_ARENA:
                newAchievementCriteria->win_rated_arena.unused = fields[3].GetUInt32();
                newAchievementCriteria->win_rated_arena.count = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_HIGHEST_TEAM_RATING:
                newAchievementCriteria->highest_team_rating.teamtype = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_HIGHEST_PERSONAL_RATING:
                newAchievementCriteria->highest_personal_rating.teamtype = fields[3].GetUInt32();
                newAchievementCriteria->highest_personal_rating.PersonalRating = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_LEARN_SKILL_LEVEL:
                newAchievementCriteria->learn_skill_level.skillID = fields[3].GetUInt32();
                newAchievementCriteria->learn_skill_level.skillLevel = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_USE_ITEM:
                newAchievementCriteria->use_item.itemID = fields[3].GetUInt32();
                newAchievementCriteria->use_item.itemCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_LOOT_ITEM:
                newAchievementCriteria->loot_item.itemID = fields[3].GetUInt32();
                newAchievementCriteria->loot_item.itemCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_EXPLORE_AREA:
                newAchievementCriteria->explore_area.areaReference = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_OWN_RANK:
                newAchievementCriteria->own_rank.rank = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_BUY_BANK_SLOT:
                newAchievementCriteria->buy_bank_slot.unused = fields[3].GetUInt32();
                newAchievementCriteria->buy_bank_slot.numberOfSlots = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_GAIN_REPUTATION:
                newAchievementCriteria->gain_reputation.factionID = fields[3].GetUInt32();
                newAchievementCriteria->gain_reputation.reputationAmount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_GAIN_EXALTED_REPUTATION:
                newAchievementCriteria->gain_exalted_reputation.unused = fields[3].GetUInt32();
                newAchievementCriteria->gain_exalted_reputation.numberOfExaltedFactions = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_VISIT_BARBER_SHOP:
                newAchievementCriteria->visit_barber.unused = fields[3].GetUInt32();
                newAchievementCriteria->visit_barber.numberOfVisits = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_EQUIP_EPIC_ITEM:
                newAchievementCriteria->equip_epic_item.itemSlot = fields[3].GetUInt32();
                newAchievementCriteria->equip_epic_item.count = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_ROLL_NEED_ON_LOOT:
                newAchievementCriteria->roll_need_on_loot.rollValue = fields[3].GetUInt32();
                newAchievementCriteria->roll_need_on_loot.count = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_ROLL_GREED_ON_LOOT:
                newAchievementCriteria->roll_greed_on_loot.rollValue = fields[3].GetUInt32();
                newAchievementCriteria->roll_greed_on_loot.count = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_HK_CLASS:
                newAchievementCriteria->hk_class.classID = fields[3].GetUInt32();
                newAchievementCriteria->hk_class.count = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_HK_RACE:
                newAchievementCriteria->hk_race.raceID = fields[3].GetUInt32();
                newAchievementCriteria->hk_race.count = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_DO_EMOTE:
                newAchievementCriteria->do_emote.emoteID = fields[3].GetUInt32();
                newAchievementCriteria->do_emote.count = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_DAMAGE_DONE:
            case ACHIEVEMENT_CRITERIA_TYPE_HEALING_DONE:
                newAchievementCriteria->healing_done.unused = fields[3].GetUInt32();
                newAchievementCriteria->healing_done.count = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_GET_KILLING_BLOWS:
                newAchievementCriteria->get_killing_blow.unused = fields[3].GetUInt32();
                newAchievementCriteria->get_killing_blow.killCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_EQUIP_ITEM:
                newAchievementCriteria->equip_item.itemID = fields[3].GetUInt32();
                newAchievementCriteria->equip_item.count = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_MONEY_FROM_QUEST_REWARD:
                newAchievementCriteria->quest_reward_money.unused = fields[3].GetUInt32();
                newAchievementCriteria->quest_reward_money.goldInCopper = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_LOOT_MONEY:
                newAchievementCriteria->loot_money.unused = fields[3].GetUInt32();
                newAchievementCriteria->loot_money.goldInCopper = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_USE_GAMEOBJECT:
                newAchievementCriteria->use_gameobject.goEntry = fields[3].GetUInt32();
                newAchievementCriteria->use_gameobject.useCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_SPECIAL_PVP_KILL:
                newAchievementCriteria->special_pvp_kill.unused = fields[3].GetUInt32();
                newAchievementCriteria->special_pvp_kill.killCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_FISH_IN_GAMEOBJECT:
                newAchievementCriteria->fish_in_gameobject.goEntry = fields[3].GetUInt32();
                newAchievementCriteria->fish_in_gameobject.lootCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_LEARN_SKILLLINE_SPELLS:
                newAchievementCriteria->learn_skillline_spell.skillLine = fields[3].GetUInt32();
                newAchievementCriteria->learn_skillline_spell.spellCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_WIN_DUEL:
                newAchievementCriteria->win_duel.unused = fields[3].GetUInt32();
                newAchievementCriteria->win_duel.duelCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_HIGHEST_POWER:
                newAchievementCriteria->highest_power.powerType = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_HIGHEST_STAT:
                newAchievementCriteria->highest_stat.statType = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_HIGHEST_SPELLPOWER:
                newAchievementCriteria->highest_spellpower.spellSchool = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_HIGHEST_RATING:
                newAchievementCriteria->highest_rating.ratingType = fields[3].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_LOOT_TYPE:
                newAchievementCriteria->loot_type.lootType = fields[3].GetUInt32();
                newAchievementCriteria->loot_type.lootTypeCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_LEARN_SKILL_LINE:
                newAchievementCriteria->learn_skill_line.skillLine = fields[3].GetUInt32();
                newAchievementCriteria->learn_skill_line.spellCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_EARN_HONORABLE_KILL:
                newAchievementCriteria->honorable_kill.unused = fields[3].GetUInt32();
                newAchievementCriteria->honorable_kill.killCount = fields[4].GetUInt32();
                break;
            case ACHIEVEMENT_CRITERIA_TYPE_USE_LFD_TO_GROUP_WITH_PLAYERS:
                newAchievementCriteria->use_lfg.unused = fields[3].GetUInt32();
                newAchievementCriteria->use_lfg.dungeonsComplete = fields[4].GetUInt32();
                break;
            default:
                newAchievementCriteria->raw.field3 = fields[3].GetUInt32();
                newAchievementCriteria->raw.count = fields[4].GetUInt32();
        }
        newAchievementCriteria->additionalRequirements[0].additionalRequirement_type    = fields[5].GetUInt32();
        newAchievementCriteria->additionalRequirements[0].additionalRequirement_value   = fields[6].GetUInt32();
        newAchievementCriteria->additionalRequirements[0].additionalRequirement_type    = fields[7].GetUInt32();
        newAchievementCriteria->additionalRequirements[0].additionalRequirement_value   = fields[8].GetUInt32();
        newAchievementCriteria->flags           = fields[9].GetUInt32();
        newAchievementCriteria->timerStartEvent = fields[10].GetUInt32();
        newAchievementCriteria->timedType       = fields[11].GetUInt32();
        newAchievementCriteria->timeLimit       = fields[12].GetUInt32();
        AchievementCriteriaStore[newAchievementCriteria->ID] = newAchievementCriteria;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu achievement criteria entries in %u ms", (unsigned long)AchievementCriteriaStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadAreaPOIStore()
{
    uint32 oldMSTime = getMSTime();
    AreaPOIStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT ID, importance, NormalIcon, NormalIcon50, NormalIcon0, HordeIcon, HordeIcon50, HordeIcon0, "
                            "AllianceIcon, AllianceIcon50, AllianceIcon0, FactionID, X, Y, Z, MapId, Area, WorldState FROM areapoidbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 area POI entry. DB table `areapoidbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        AreaPOIEntry* newAreaPOI = new AreaPOIEntry;
        newAreaPOI->id = fields[0].GetUInt32();
        for (uint8 i = 0; i < 11; i++)
            newAreaPOI->icon[i] = fields[i + 1].GetUInt32();
        newAreaPOI->x           = fields[12].GetFloat();
        newAreaPOI->y           = fields[13].GetFloat();
        newAreaPOI->z           = fields[14].GetFloat();
        newAreaPOI->mapId       = fields[15].GetUInt32();
        newAreaPOI->zoneId      = fields[16].GetUInt32();
        newAreaPOI->worldState  = fields[17].GetUInt32();
        AreaPOIStore[newAreaPOI->id] = newAreaPOI;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu area POI entries in %u ms", (unsigned long)AreaPOIStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadAreaTableStore()
{
    uint32 oldMSTime = getMSTime();
    AreaTableStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, MapId, ParentArea, ExploreFlag, Flags, ExplorationLevel, Name, Name_loc2, FactionGroup, "
                            "LiquidTypeWater, LiquidTypeOcean, LiquidTypeMagma, LiquidTypeSlime FROM areatabledbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 area table entry. DB table `areatabledbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        AreaTableEntry* newAreaTable = new AreaTableEntry;
        newAreaTable->ID            = fields[0].GetUInt32();
        newAreaTable->mapid         = fields[1].GetUInt32();
        newAreaTable->zone          = fields[2].GetUInt32();
        newAreaTable->exploreFlag   = fields[3].GetUInt32();
        newAreaTable->flags         = fields[4].GetUInt32();
        newAreaTable->area_level    = fields[5].GetInt32();
        for (uint8 i = 0; i < 16; i++)
            newAreaTable->area_name[i] = NULL;
        newAreaTable->area_name[0]  = (char*)fields[6].GetCString();
        newAreaTable->area_name[2]  = (char*)fields[7].GetCString();
        newAreaTable->team          = fields[8].GetUInt32();
        for (uint8 i = 0; i < 4; i++)
            newAreaTable->LiquidTypeOverride[i] = fields[9 + i].GetInt32();
        AreaTableStore[newAreaTable->exploreFlag] = newAreaTable;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu area table entries in %u ms", (unsigned long)AreaTableStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadBattlemasterListStore()
{
    uint32 oldMSTime = getMSTime();
    BattlemasterListStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Instance1, Instance2, Instance3, Instance4, Instance5, Instance6, Instance7, Instance8, "
        "InstanceType, Name, Name_loc2, MaxGroupSize, HolidayWorldStateId FROM battlemasterlistdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 battlemaster list entry. DB table `battlemasterlistdbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        BattlemasterListEntry* newBattlemasterList = new BattlemasterListEntry;
        newBattlemasterList->id = fields[0].GetUInt32();
        for (uint8 i = 0; i < 8; i++)
            newBattlemasterList->mapid[i] = fields[1 + i].GetInt32();
        newBattlemasterList->type = fields[1].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newBattlemasterList->name[i] = NULL;
        newBattlemasterList->name[0] = (char*)fields[9].GetCString();
        newBattlemasterList->name[2] = (char*)fields[10].GetCString();
        newBattlemasterList->maxGroupSize = fields[11].GetUInt32();
        newBattlemasterList->HolidayWorldStateId = fields[12].GetUInt32();
        BattlemasterListStore[newBattlemasterList->id] = newBattlemasterList;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu battlemaster list entries in %u ms", (unsigned long)BattlemasterListStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadCharTitlesStore()
{
    uint32 oldMSTime = getMSTime();
    CharTitlesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Male, Male_loc2, InGameOrder FROM chartitlesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 chartitles entry. DB table `battlemasterlistdbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        CharTitlesEntry* newCharTitles = new CharTitlesEntry;
        newCharTitles->ID           = fields[0].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newCharTitles->name[i]  = NULL;
        newCharTitles->name[0]      = (char*)fields[1].GetCString();
        newCharTitles->name[2]      = (char*)fields[2].GetCString();
        newCharTitles->bit_index    = fields[3].GetUInt32();
        CharTitlesStore[newCharTitles->ID] = newCharTitles;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu chartitles entries in %u ms", (unsigned long)CharTitlesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadFactionStore()
{
    uint32 oldMSTime = getMSTime();
    FactionStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, ReputationListId, BaseRepRaceMask1, BaseRepRaceMask2, BaseRepRaceMask3, BaseRepRaceMask4, BaseRepClassMask1, BaseRepClassMask2, BaseRepClassMask3, BaseRepClassMask4, BaseRepValue1, BaseRepValue2, BaseRepValue3, BaseRepValue4, "
                                                "ReputationFlags1, ReputationFlags2, ReputationFlags3, ReputationFlags4, Team, SpilloverRateIn, SpilloverRateOut, SpilloverMaxRankIn, Name, Name_loc2 FROM factiondbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 faction entry. DB table `factiondbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        FactionEntry* newFaction = new FactionEntry;
        newFaction->ID = fields[0].GetUInt32();
        newFaction->reputationListID    = fields[1].GetInt32();
        for (uint8 i = 0; i < 4; i++)
            newFaction->BaseRepRaceMask[i] = fields[2 + i].GetUInt32();
        for (uint8 i = 0; i < 4; i++)
            newFaction->BaseRepClassMask[i] = fields[6 + i].GetUInt32();
        for (uint8 i = 0; i < 4; i++)
            newFaction->BaseRepValue[i] = fields[10 + i].GetUInt32();
        for (uint8 i = 0; i < 4; i++)
            newFaction->ReputationFlags[i] = fields[14 + i].GetUInt32();
        newFaction->team                = fields[18].GetUInt32();
        newFaction->spilloverRateIn     = fields[19].GetFloat();
        newFaction->spilloverRateOut    = fields[20].GetFloat();
        newFaction->spilloverMaxRankIn  = fields[21].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newFaction->name[i] = NULL;
        newFaction->name[0]             = (char*)fields[22].GetCString();
        newFaction->name[2]             = (char*)fields[23].GetCString();
        FactionStore[newFaction->ID] = newFaction;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu faction entries in %u ms", (unsigned long)FactionStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadSpellDifficultyStore()
{
    uint32 oldMSTime = getMSTime();
    SpellDifficultyStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT id, spellid0, spellid1, spellid2, spellid3 FROM spelldifficultydbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 spelldifficulty entry. DB table `spelldifficultydbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        SpellDifficultyEntry* newSpellDifficulty = new SpellDifficultyEntry;
        newSpellDifficulty->ID = fields[0].GetUInt32();
        for (uint8 i = 0; i < MAX_DIFFICULTY; i++)
            newSpellDifficulty->SpellID[i] = fields[1 + i].GetUInt32();
        SpellDifficultyStore[newSpellDifficulty->ID] = newSpellDifficulty;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu spelldifficulty entries in %u ms", (unsigned long)SpellDifficultyStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadTalentStore()
{
    uint32 oldMSTime = getMSTime();
    TalentStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT TalentID, TalentTab, Row, Col, Rank1, Rank2, Rank3, Rank4, Rank5, DependsOn, DependsOnRank FROM talentdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 talent entry. DB table `talentdbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        TalentEntry* newTalent = new TalentEntry;
        newTalent->TalentID = fields[0].GetUInt32();
        newTalent->TalentTab = fields[1].GetUInt32();
        newTalent->Row = fields[2].GetUInt32();
        newTalent->Col = fields[3].GetUInt32();
        for (uint8 i = 0; i < MAX_TALENT_RANK; i++)
            newTalent->RankID[i] = fields[4 + i].GetUInt32();
        newTalent->DependsOn = fields[9].GetUInt32();
        newTalent->DependsOnRank = fields[10].GetUInt32();
        TalentStore[newTalent->TalentID] = newTalent;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu talent entries in %u ms", (unsigned long)TalentStore.size(), GetMSTimeDiffToNow(oldMSTime));
}
