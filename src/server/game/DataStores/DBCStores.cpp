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

static AreaFlagByAreaID sAreaFlagByAreaID;
static AreaFlagByMapID sAreaFlagByMapID;                    // for instances without generated *.map files

static WMOAreaInfoByTripple sWMOAreaInfoByTripple;

std::map<uint32, CharStartOutfitEntry const*> sCharStartOutfitMap;

typedef std::map<uint32, SimpleFactionsList> FactionTeamMap;
static FactionTeamMap sFactionTeamMap;

//DBCStorage <ItemCondExtCostsEntry> sItemCondExtCostsStore(ItemCondExtCostsEntryfmt);
//DBCStorage <ItemDisplayInfoEntry> sItemDisplayInfoStore(ItemDisplayTemplateEntryfmt); -- not used currently

// DBC used only for initialization sMapDifficultyMap at startup.
MapDifficultyMap sMapDifficultyMap;

SpellCategoryStore sSpellsByCategoryStore;
PetFamilySpellsStore sPetFamilySpellsStore;

TalentSpellPosMap sTalentSpellPosMap;

// store absolute bit position for first rank for talent inspect
static uint32 sTalentTabPages[MAX_CLASSES][3];

TaxiMask sTaxiNodesMask;
TaxiMask sOldContinentsNodesMask;
TaxiMask sHordeTaxiNodesMask;
TaxiMask sAllianceTaxiNodesMask;
TaxiMask sDeathKnightTaxiNodesMask;

// DBC used only for initialization sTaxiPathSetBySource at startup.
TaxiPathSetBySource sTaxiPathSetBySource;

// DBC used only for initialization sTaxiPathNodeStore at startup.
TaxiPathNodesByPath sTaxiPathNodesByPath;

typedef std::list<std::string> StoreProblemList;

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
    for (AreaTableContainer::const_iterator itr = sDBCMgr->AreaTableStore.begin(); itr != sDBCMgr->AreaTableStore.end(); ++itr)
    {
        if (AreaTableEntry const* area = itr->second)
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
    sDBCMgr->LoadAreaTriggerStore();
    sDBCMgr->LoadAreaGroupStore();
    sDBCMgr->LoadAreaPOIStore();
    sDBCMgr->LoadAuctionHouseStore();
    sDBCMgr->LoadBankBagSlotPricesStore();
    sDBCMgr->LoadBannedAddOnsStore();
    sDBCMgr->LoadBattlemasterListStore();
    sDBCMgr->LoadBarberShopStyleStore();
    sDBCMgr->LoadCharStartOutfitStore();
    for (CharStartOutfitContainer::const_iterator itr = sDBCMgr->CharStartOutfitStore.begin(); itr != sDBCMgr->CharStartOutfitStore.end(); ++itr)
        if (CharStartOutfitEntry const* outfit = itr->second)
            sCharStartOutfitMap[outfit->Race | (outfit->Class << 8) | (outfit->Gender << 16)] = outfit;

    sDBCMgr->LoadCharTitlesStore();
    sDBCMgr->LoadChatChannelsStore();
    sDBCMgr->LoadChrClassesStore();
    sDBCMgr->LoadChrRacesStore();
    sDBCMgr->LoadCinematicSequencesStore();
    sDBCMgr->LoadCreatureDisplayInfoStore();
    sDBCMgr->LoadCreatureDisplayInfoExtraStore();
    sDBCMgr->LoadCreatureFamilyStore();
    sDBCMgr->LoadCreatureModelDataStore();
    sDBCMgr->LoadCreatureSpellDataStore();
    sDBCMgr->LoadCreatureTypeStore();
    sDBCMgr->LoadCurrencyTypesStore();
    sDBCMgr->LoadDestructibleModelDataStore();
    sDBCMgr->LoadDungeonEncounterStore();
    sDBCMgr->LoadDurabilityCostsStore();
    sDBCMgr->LoadDurabilityQualityStore();
    sDBCMgr->LoadEmotesStore();
    sDBCMgr->LoadEmotesTextStore();
    sDBCMgr->LoadFactionStore();
    for (FactionContainer::const_iterator itr = sDBCMgr->FactionStore.begin(); itr != sDBCMgr->FactionStore.end(); ++itr)
    {
        FactionEntry const* faction = itr->second;
        if (faction && faction->team)
        {
            SimpleFactionsList &flist = sFactionTeamMap[faction->team];
            flist.push_back(itr->first);
        }
    }
    sDBCMgr->LoadFactionTemplateStore();

    sDBCMgr->LoadGameObjectDisplayInfoStore();
    for (GameObjectDisplayInfoContainer::const_iterator itr = sDBCMgr->GameObjectDisplayInfoStore.begin(); itr != sDBCMgr->GameObjectDisplayInfoStore.end(); ++itr)
    {
        if (GameObjectDisplayInfoEntry const* info = itr->second)
        {
            if (info->maxX < info->minX)
                std::swap(*(float*)(&info->maxX), *(float*)(&info->minX));
            if (info->maxY < info->minY)
                std::swap(*(float*)(&info->maxY), *(float*)(&info->minY));
            if (info->maxZ < info->minZ)
                std::swap(*(float*)(&info->maxZ), *(float*)(&info->minZ));
        }
    }

    sDBCMgr->LoadGemPropertiesStore();
    sDBCMgr->LoadGlyphPropertiesStore();
    sDBCMgr->LoadGlyphSlotStore();
    sDBCMgr->LoadHolidaysStore();
    sDBCMgr->LoadItemBagFamilyStore();
    //sDBCMgr->LoadItemDisplayInfoStore();
    //sDBCMgr->LoadItemCondExtCostsStore();
    sDBCMgr->LoadItemExtendedCostStore();
    sDBCMgr->LoadItemLimitCategoryStore();
    sDBCMgr->LoadItemRandomPropertiesStore();
    sDBCMgr->LoadItemRandomSuffixStore();
    sDBCMgr->LoadItemSetStore();
    sDBCMgr->LoadLFGDungeonStore();
    sDBCMgr->LoadLightStore();
    sDBCMgr->LoadLiquidTypeStore();
    sDBCMgr->LoadLockStore();
    sDBCMgr->LoadMailTemplateStore();
    sDBCMgr->LoadMapStore();
    sDBCMgr->LoadMapDifficultyStore();
    // fill data
    for (uint32 i = 1; i < sDBCMgr->MapDifficultyStore.size(); ++i)
    if (MapDifficultyEntry const* entry = sDBCMgr->GetMapDifficultyEntry(i))
        sMapDifficultyMap[MAKE_PAIR32(entry->MapId, entry->Difficulty)] = MapDifficulty(entry->resetTime, entry->maxPlayers, entry->areaTriggerText[0] != '\0');
    sDBCMgr->MapDifficultyStore.clear();
    sDBCMgr->LoadMovieStore();
    sDBCMgr->LoadOverrideSpellDataStore();
    sDBCMgr->LoadPowerDisplayStore();
    sDBCMgr->LoadPvPDifficultyStore();
    for (PvPDifficultyContainer::const_iterator itr = sDBCMgr->PvPDifficultyStore.begin(); itr != sDBCMgr->PvPDifficultyStore.end(); ++itr)
        if (PvPDifficultyEntry const* entry = itr->second)
            if (entry->bracketId > MAX_BATTLEGROUND_BRACKETS)
                ASSERT(false && "Need update MAX_BATTLEGROUND_BRACKETS by DBC data");

    sDBCMgr->LoadQuestXPStore();
    sDBCMgr->LoadQuestFactionRewStore();
    sDBCMgr->LoadQuestSortStore();
    sDBCMgr->LoadRandomPropertiesPointsStore();
    sDBCMgr->LoadScalingStatDistributionStore();
    sDBCMgr->LoadScalingStatValuesStore();
    sDBCMgr->LoadSkillLineStore();
    sDBCMgr->LoadSkillLineAbilityStore();
    sDBCMgr->LoadSoundEntriesStore();
    sDBCMgr->LoadSpellCastTimesStore();
    sDBCMgr->LoadSpellCategoryStore();
    sDBCMgr->LoadSpellDifficultyStore();
    sDBCMgr->LoadSpellDurationStore();
    sDBCMgr->LoadSpellFocusObjectStore();
    sDBCMgr->LoadSpellItemEnchantmentStore();
    sDBCMgr->LoadSpellItemEnchantmentConditionStore();
    sDBCMgr->LoadSpellRadiusStore();
    sDBCMgr->LoadSpellRangeStore();
    sDBCMgr->LoadSpellRuneCostStore();
    sDBCMgr->LoadSpellShapeshiftStore();
    sDBCMgr->LoadStableSlotPricesStore();
    sDBCMgr->LoadSummonPropertiesStore();
    sDBCMgr->LoadTalentStore();
    // create talent spells set
    for (TalentContainer::const_iterator itr = sDBCMgr->TalentStore.begin(); itr != sDBCMgr->TalentStore.end(); ++itr)
        if (TalentEntry const* talentInfo = itr->second)
            for (int j = 0; j < MAX_TALENT_RANK; j++)
                if (talentInfo->RankID[j])
                    sTalentSpellPosMap[talentInfo->RankID[j]] = TalentSpellPos(itr->first, j);
    sDBCMgr->LoadTalentTabStore();

    // prepare fast data access to bit pos of talent ranks for use at inspecting
    // now have all max ranks (and then bit amount used for store talent ranks in inspect)
    for (uint32 talentTabId = 1; talentTabId < sDBCMgr->TalentTabStore.size(); ++talentTabId)
    {
        TalentTabEntry const* talentTabInfo = sDBCMgr->GetTalentTabEntry(talentTabId);
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

    sDBCMgr->LoadTaxiNodesStore();
    uint32 pathCount = sDBCMgr->LoadTaxiPathStore();
    for (uint32 i = 1; i < sDBCMgr->TaxiPathStore.size(); ++i)
    if (TaxiPathEntry const* entry = sDBCMgr->GetTaxiPathEntry(i))
        sTaxiPathSetBySource[entry->from][entry->to] = TaxiPathBySourceAndDestination(entry->ID, entry->price);
    sDBCMgr->LoadTaxiPathNodeStore(); // Loaded only for initialization different structures
    // Calculate path nodes count
    std::vector<uint32> pathLength;
    pathLength.resize(pathCount);                           // 0 and some other indexes not used
    for (TaxiPathNodeContainer::const_iterator itr = sDBCMgr->TaxiPathNodeStore.begin(); itr != sDBCMgr->TaxiPathNodeStore.end(); ++itr)
        if (TaxiPathNodeEntry const* entry = itr->second)
            if (pathLength[entry->path] < entry->index + 1)
                pathLength[entry->path] = entry->index + 1;

    // Set path length
    sTaxiPathNodesByPath.resize(pathCount);                 // 0 and some other indexes not used
    for (uint32 i = 1; i < sTaxiPathNodesByPath.size(); ++i)
        sTaxiPathNodesByPath[i].resize(pathLength[i]);

    // fill data
    for (TaxiPathNodeContainer::const_iterator itr = sDBCMgr->TaxiPathNodeStore.begin(); itr != sDBCMgr->TaxiPathNodeStore.end(); ++itr)
        if (TaxiPathNodeEntry const* entry = itr->second)
            sTaxiPathNodesByPath[entry->path].set(entry->index, entry);

    sDBCMgr->LoadTeamContributionPointsStore();
    sDBCMgr->LoadTotemCategoryStore();
    sDBCMgr->LoadTransportAnimationStore();
    for (TransportAnimationContainer::const_iterator itr = sDBCMgr->TransportAnimationStore.begin(); itr != sDBCMgr->TransportAnimationStore.end(); ++itr)
        if (TransportAnimationEntry const* anim = itr->second)
            sTransportMgr->AddPathNodeToTransport(anim->TransportEntry, anim->TimeSeg, anim);
    sDBCMgr->LoadTransportRotationStore();
    for (TransportRotationContainer::const_iterator itr = sDBCMgr->TransportRotationStore.begin(); itr != sDBCMgr->TransportRotationStore.end(); ++itr)
        if (TransportRotationEntry const* rot = itr->second)
            sTransportMgr->AddPathRotationToTransport(rot->TransportEntry, rot->TimeSeg, rot);
    sDBCMgr->LoadVehicleStore();
    sDBCMgr->LoadVehicleSeatStore();

    sDBCMgr->LoadWMOAreaTableStore();
    for (WMOAreaTableContainer::const_iterator itr = sDBCMgr->WMOAreaTableStore.begin(); itr != sDBCMgr->WMOAreaTableStore.end(); ++itr)
        if (WMOAreaTableEntry const* entry = itr->second)
            sWMOAreaInfoByTripple.insert(WMOAreaInfoByTripple::value_type(WMOAreaTableTripple(entry->rootId, entry->adtId, entry->groupId), entry));
    sDBCMgr->LoadWorldMapAreaStore();
    sDBCMgr->LoadWorldMapOverlayStore();
    sDBCMgr->LoadWorldSafeLocsStore();

    sSpellMgr->LoadSpellInfoStore();

    for (SkillLineAbilityContainer::const_iterator itr = sDBCMgr->SkillLineAbilityStore.begin(); itr != sDBCMgr->SkillLineAbilityStore.end(); ++itr)
    {
        SkillLineAbilityEntry const* skillLine = itr->second;
        if (!skillLine)
            continue;

        SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(skillLine->spellId);

        if (spellInfo && spellInfo->Attributes & SPELL_ATTR0_PASSIVE)
        {
            for (uint32 i = 1; i < sDBCMgr->CreatureFamilyStore.size(); ++i)
            {
                CreatureFamilyEntry const* cFamily = sDBCMgr->GetCreatureFamilyEntry(i);
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
        for (uint32 i = 1; i < sDBCMgr->TaxiNodesStore.size(); ++i)
        {
            TaxiNodesEntry const* node = sDBCMgr->GetTaxiNodesEntry(i);
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

    TC_LOG_INFO("server.loading", ">> Initialized data stores in %u ms", GetMSTimeDiffToNow(oldMSTime));

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
    CreatureFamilyEntry const* pet_family = sDBCMgr->GetCreatureFamilyEntry(petfamily);
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

    if (MapEntry const* mapEntry = sDBCMgr->GetMapEntry(map_id))
        return GetAreaEntryByAreaID(mapEntry->linked_zone);

    return NULL;
}

char const* GetRaceName(uint8 race, uint8 locale)
{
    ChrRacesEntry const* raceEntry = sDBCMgr->GetChrRacesEntry(race);
    return raceEntry ? raceEntry->name[locale] : NULL;
}

char const* GetClassName(uint8 class_, uint8 locale)
{
    ChrClassesEntry const* classEntry = sDBCMgr->GetChrClassesEntry(class_);
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

    if (WorldMapAreaEntry const* wma = sDBCMgr->GetWorldMapAreaEntry(zoneId))
        return wma->virtual_map_id >= 0 ? wma->virtual_map_id : wma->map_id;

    return mapid;
}

ContentLevels GetContentLevelsForMapAndZone(uint32 mapid, uint32 zoneId)
{
    mapid = GetVirtualMapForMapAndZone(mapid, zoneId);
    if (mapid < 2)
        return CONTENT_1_60;

    MapEntry const* mapEntry = sDBCMgr->GetMapEntry(mapid);
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

    TotemCategoryEntry const* itemEntry = sDBCMgr->GetTotemCategoryEntry(itemTotemCategoryId);
    if (!itemEntry)
        return false;
    TotemCategoryEntry const* reqEntry = sDBCMgr->GetTotemCategoryEntry(requiredTotemCategoryId);
    if (!reqEntry)
        return false;

    if (itemEntry->categoryType != reqEntry->categoryType)
        return false;

    return (itemEntry->categoryMask & reqEntry->categoryMask) == reqEntry->categoryMask;
}

void Zone2MapCoordinates(float& x, float& y, uint32 zone)
{
    WorldMapAreaEntry const* maEntry = sDBCMgr->GetWorldMapAreaEntry(zone);

    // if not listed then map coordinates (instance)
    if (!maEntry)
        return;

    std::swap(x, y);                                         // at client map coords swapped
    x = x*((maEntry->x2-maEntry->x1)/100)+maEntry->x1;
    y = y*((maEntry->y2-maEntry->y1)/100)+maEntry->y1;      // client y coord from top to down
}

void Map2ZoneCoordinates(float& x, float& y, uint32 zone)
{
    WorldMapAreaEntry const* maEntry = sDBCMgr->GetWorldMapAreaEntry(zone);

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
    for (PvPDifficultyContainer::const_iterator itr = sDBCMgr->PvPDifficultyStore.begin(); itr != sDBCMgr->PvPDifficultyStore.end(); ++itr)
    {
        if (PvPDifficultyEntry const* entry = itr->second)
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
    for (PvPDifficultyContainer::const_iterator itr = sDBCMgr->PvPDifficultyStore.begin(); itr != sDBCMgr->PvPDifficultyStore.end(); ++itr)
        if (PvPDifficultyEntry const* entry = itr->second)
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
    if (LiquidTypeEntry const* liq = sDBCMgr->GetLiquidTypeEntry(liquidType))
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
    for (LFGDungeonContainer::const_iterator itr = sDBCMgr->LFGDungeonStore.begin(); itr != sDBCMgr->LFGDungeonStore.end(); ++itr)
    {
        LFGDungeonEntry const* dungeon = itr->second;
        if (!dungeon)
            continue;

        if (dungeon->map == int32(mapId) && Difficulty(dungeon->difficulty) == difficulty)
            return dungeon;
    }

    return NULL;
}

uint32 GetDefaultMapLight(uint32 mapId)
{
    for (int32 i = sDBCMgr->LightStore.size(); i >= 0; --i)
    {
        LightEntry const* light = sDBCMgr->GetLightEntry(uint32(i));
        if (!light)
            continue;

        if (light->MapId == mapId && light->X == 0.0f && light->Y == 0.0f && light->Z == 0.0f)
            return light->Id;
    }

    return 0;
}

/*********************************************************/
/***                    DBC LOADING                    ***/
/*********************************************************/

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

void DBCMgr::LoadAreaGroupStore()
{
    uint32 oldMSTime = getMSTime();
    AreaGroupStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, AreaId1, AreaId2, AreaId3, AreaId4, AreaId5, AreaId6, NextGroup from areagroupdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 AreaGroup entry. DB table `AreaGroup dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        AreaGroupEntry* newAreaGroup = new AreaGroupEntry;
        newAreaGroup->AreaGroupId = fields[0].GetUInt32();
        for (uint8 i = 0; i < 6; i++)
            newAreaGroup->AreaId[i] = fields[1 + i].GetUInt32();
        newAreaGroup->nextGroup = fields[7].GetUInt32();
        AreaGroupStore[newAreaGroup->AreaGroupId] = newAreaGroup;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu AreaGroup entries in %u ms", (unsigned long)AreaGroupStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadAreaTriggerStore()
{
    uint32 oldMSTime = getMSTime();
    AreaTriggerStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, MapId, X, Y, Z, Radius, BoxX, BoxY, BoxZ, BoxOrientation FROM areatriggerdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 AreaTrigger entry. DB table `AreaTrigger dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        AreaTriggerEntry* newAreaTrigger = new AreaTriggerEntry;
        newAreaTrigger->id = fields[0].GetUInt32();
        newAreaTrigger->mapid = fields[1].GetUInt32();
        newAreaTrigger->x = fields[2].GetFloat();
        newAreaTrigger->y = fields[3].GetFloat();
        newAreaTrigger->z = fields[4].GetFloat();
        newAreaTrigger->radius = fields[5].GetFloat();
        newAreaTrigger->box_x = fields[6].GetFloat();
        newAreaTrigger->box_y = fields[7].GetFloat();
        newAreaTrigger->box_z = fields[8].GetFloat();
        newAreaTrigger->box_orientation = fields[9].GetFloat();
        AreaTriggerStore[newAreaTrigger->id] = newAreaTrigger;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu AreaTrigger entries in %u ms", (unsigned long)AreaTriggerStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadAuctionHouseStore()
{
    uint32 oldMSTime = getMSTime();
    AuctionHouseStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT HouseId, Faction, DepositPercent, CutPercent FROM auctionhousedbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 AuctionHouse entry. DB table `AuctionHouse dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        AuctionHouseEntry* newAuctionHouse = new AuctionHouseEntry;

        newAuctionHouse->houseId = fields[0].GetUInt32();
        newAuctionHouse->faction = fields[1].GetUInt32();
        newAuctionHouse->depositPercent = fields[2].GetUInt32();
        newAuctionHouse->cutPercent = fields[3].GetUInt32();
        AuctionHouseStore[newAuctionHouse->houseId] = newAuctionHouse;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu AuctionHouse entries in %u ms", (unsigned long)AuctionHouseStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadBankBagSlotPricesStore()
{
    uint32 oldMSTime = getMSTime();
    BankBagSlotPricesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Price FROM bankbagslotpricesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 BankBagSlotPrices entry. DB table `BankBagSlotPrices dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        BankBagSlotPricesEntry* newBankBagSlotPrices = new BankBagSlotPricesEntry;
        newBankBagSlotPrices->ID = fields[0].GetUInt32();
        newBankBagSlotPrices->price = fields[1].GetUInt32();
        BankBagSlotPricesStore[newBankBagSlotPrices->ID] = newBankBagSlotPrices;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu BankBagSlotPrices entries in %u ms", (unsigned long)BankBagSlotPricesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadBannedAddOnsStore()
{
    uint32 oldMSTime = getMSTime();
    BannedAddOnsStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id FROM bannedaddonsdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 BannedAddOns entry. DB table `BannedAddOns dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        BannedAddOnsEntry* newBannedAddOns = new BannedAddOnsEntry;
        newBannedAddOns->Id = fields[0].GetUInt32();
        BannedAddOnsStore[newBannedAddOns->Id] = newBannedAddOns;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu BannedAddOns entries in %u ms", (unsigned long)BannedAddOnsStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadBarberShopStyleStore()
{
    uint32 oldMSTime = getMSTime();
    BarberShopStyleStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Type, Race, Gender, HairId FROM barbershopstyledbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 BarberShopStyle entry. DB table `BarberShopStyle dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        BarberShopStyleEntry* newBarberShopStyle = new BarberShopStyleEntry;
        newBarberShopStyle->Id = fields[0].GetUInt32();
        newBarberShopStyle->type = fields[1].GetUInt32();
        newBarberShopStyle->race = fields[2].GetUInt32();
        newBarberShopStyle->gender = fields[3].GetUInt32();
        newBarberShopStyle->hair_id = fields[4].GetUInt32();
        BarberShopStyleStore[newBarberShopStyle->Id] = newBarberShopStyle;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu BarberShopStyle entries in %u ms", (unsigned long)BarberShopStyleStore.size(), GetMSTimeDiffToNow(oldMSTime));
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

void DBCMgr::LoadChatChannelsStore()
{
    uint32 oldMSTime = getMSTime();
    ChatChannelsStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT ChannelId, Flags, Pattern, Pattern_loc2 FROM chatchannelsdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 ChatChannels entry. DB table `ChatChannels dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        ChatChannelsEntry* newChatChannels = new ChatChannelsEntry;
        newChatChannels->ChannelID = fields[0].GetUInt32();
        newChatChannels->flags = fields[1].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newChatChannels->pattern[i] = NULL;
        newChatChannels->pattern[0] = (char*)fields[2].GetCString();
        newChatChannels->pattern[2] = (char*)fields[3].GetCString();
        ChatChannelsStore[newChatChannels->ChannelID] = newChatChannels;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu ChatChannels entries in %u ms", (unsigned long)ChatChannelsStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadCharStartOutfitStore()
{
    uint32 oldMSTime = getMSTime();
    CharStartOutfitStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Race, Class, Gender, ItemId1, ItemId2, ItemId3, ItemId4, ItemId5, ItemId6, ItemId7, ItemId8, ItemId9, ItemId10, ItemId11, ItemId12, ItemId13, ItemId14, ItemId15, ItemId16, ItemId17, ItemId18, ItemId19, ItemId20, ItemId21, ItemId22, ItemId23, ItemId24 FROM charstartoutfitdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 CharStartOutfit entry. DB table `CharStartOutfit dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        CharStartOutfitEntry* newCharStartOutfit = new CharStartOutfitEntry;
        newCharStartOutfit->Race = fields[0].GetUInt32();
        newCharStartOutfit->Class = fields[1].GetUInt32();
        newCharStartOutfit->Gender = fields[2].GetUInt32();
        for (uint8 i = 0; i < 24; i++)
            newCharStartOutfit->ItemId[i] = fields[3 + i].GetInt32();
        CharStartOutfitStore[newCharStartOutfit->Race] = newCharStartOutfit;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu CharStartOutfit entries in %u ms", (unsigned long)CharStartOutfitStore.size(), GetMSTimeDiffToNow(oldMSTime));
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
        newCharTitles->ID = fields[0].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newCharTitles->name[i] = NULL;
        newCharTitles->name[0] = (char*)fields[1].GetCString();
        newCharTitles->name[2] = (char*)fields[2].GetCString();
        newCharTitles->bit_index = fields[3].GetUInt32();
        CharTitlesStore[newCharTitles->ID] = newCharTitles;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu chartitles entries in %u ms", (unsigned long)CharTitlesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadChrClassesStore()
{
    uint32 oldMSTime = getMSTime();
    ChrClassesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, PowerType, Name, Name_loc2, SpellFamily, CinematicSequence, Expansion FROM chrclassesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 ChrClasses entry. DB table `ChrClasses dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        ChrClassesEntry* newChrClasses = new ChrClassesEntry;
        newChrClasses->ClassID = fields[0].GetUInt32();
        newChrClasses->powerType = fields[1].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newChrClasses->name[i] = NULL;
        newChrClasses->name[0] = (char*)fields[2].GetCString();
        newChrClasses->name[2] = (char*)fields[3].GetCString();
        newChrClasses->spellfamily = fields[4].GetUInt32();
        newChrClasses->CinematicSequence = fields[5].GetUInt32();
        newChrClasses->expansion = fields[6].GetUInt32();
        ChrClassesStore[newChrClasses->ClassID] = newChrClasses;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu ChrClasses entries in %u ms", (unsigned long)ChrClassesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadChrRacesStore()
{
    uint32 oldMSTime = getMSTime();
    ChrRacesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Flags, FactionId, ModelMale, ModelFemale, TeamId, CinematicSequence, NameMale, NameMale_loc2, Expansion FROM chrracesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 ChrRaces entry. DB table `ChrRaces dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        ChrRacesEntry* newChrRaces = new ChrRacesEntry;
        newChrRaces->RaceID = fields[0].GetUInt32();
        newChrRaces->Flags = fields[1].GetUInt32();
        newChrRaces->FactionID = fields[2].GetUInt32();
        newChrRaces->model_m = fields[3].GetUInt32();
        newChrRaces->model_f = fields[4].GetUInt32();
        newChrRaces->TeamID = fields[5].GetUInt32();
        newChrRaces->CinematicSequence = fields[6].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newChrRaces->name[i] = NULL;
        newChrRaces->name[0] = (char*)fields[7].GetCString();
        newChrRaces->name[2] = (char*)fields[8].GetCString();
        newChrRaces->expansion = fields[9].GetUInt32();
        ChrRacesStore[newChrRaces->RaceID] = newChrRaces;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu ChrRaces entries in %u ms", (unsigned long)ChrRacesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadCinematicSequencesStore()
{
    uint32 oldMSTime = getMSTime();
    CinematicSequencesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id FROM cinematicsequencesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 CinematicSequences entry. DB table `CinematicSequences dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        CinematicSequencesEntry* newCinematicSequences = new CinematicSequencesEntry;
        newCinematicSequences->Id = fields[0].GetUInt32();
        CinematicSequencesStore[newCinematicSequences->Id] = newCinematicSequences;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu CinematicSequences entries in %u ms", (unsigned long)CinematicSequencesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadCreatureDisplayInfoStore()
{
    uint32 oldMSTime = getMSTime();
    CreatureDisplayInfoStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, ModelId, ExtraId, Scale FROM creaturedisplayinfodbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 CreatureDisplayInfo entry. DB table `CreatureDisplayInfo dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        CreatureDisplayInfoEntry* newCreatureDisplayInfo = new CreatureDisplayInfoEntry;
        newCreatureDisplayInfo->Displayid = fields[0].GetUInt32();
        newCreatureDisplayInfo->ModelId = fields[1].GetUInt32();
        newCreatureDisplayInfo->ExtraId = fields[2].GetUInt32();
        newCreatureDisplayInfo->scale = fields[3].GetFloat();
        CreatureDisplayInfoStore[newCreatureDisplayInfo->Displayid] = newCreatureDisplayInfo;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu CreatureDisplayInfo entries in %u ms", (unsigned long)CreatureDisplayInfoStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadCreatureDisplayInfoExtraStore()
{
    uint32 oldMSTime = getMSTime();
    CreatureDisplayInfoExtraStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Race, Gender FROM creaturedisplayinfoextradbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 CreatureDisplayInfoExtra entry. DB table `CreatureDisplayInfoExtra dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        CreatureDisplayInfoExtraEntry* newCreatureDisplayInfoExtra = new CreatureDisplayInfoExtraEntry;
        newCreatureDisplayInfoExtra->Race = fields[1].GetUInt32();
        newCreatureDisplayInfoExtra->Gender = fields[2].GetUInt32();
        CreatureDisplayInfoExtraStore[fields[0].GetUInt32()] = newCreatureDisplayInfoExtra;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu CreatureDisplayInfoExtra entries in %u ms", (unsigned long)CreatureDisplayInfoExtraStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadCreatureFamilyStore()
{
    uint32 oldMSTime = getMSTime();
    CreatureFamilyStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, MinScale, MinScaleLevel, MaxScale, MaxScaleLevel, SkillLine_F6, SkillLine_F7, PetFoodMask, PetTalentType, Name, Name_loc2 FROM creaturefamilydbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 CreatureFamily entry. DB table `CreatureFamily dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        CreatureFamilyEntry* newCreatureFamily = new CreatureFamilyEntry;
        newCreatureFamily->ID = fields[0].GetUInt32();
        newCreatureFamily->minScale = fields[1].GetFloat();
        newCreatureFamily->minScaleLevel = fields[2].GetUInt32();
        newCreatureFamily->maxScale = fields[3].GetFloat();
        newCreatureFamily->maxScaleLevel = fields[4].GetUInt32();
        newCreatureFamily->skillLine[0] = fields[5].GetUInt32();
        newCreatureFamily->skillLine[1] = fields[6].GetUInt32();
        newCreatureFamily->petFoodMask = fields[7].GetUInt32();
        newCreatureFamily->petTalentType = fields[8].GetInt32();
        for (uint8 i = 0; i < 16; i++)
            newCreatureFamily->Name[i] = NULL;
        newCreatureFamily->Name[0] = (char*)fields[9].GetCString();
        newCreatureFamily->Name[2] = (char*)fields[10].GetCString();
        CreatureFamilyStore[newCreatureFamily->ID] = newCreatureFamily;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu CreatureFamily entries in %u ms", (unsigned long)CreatureFamilyStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadCreatureModelDataStore()
{
    uint32 oldMSTime = getMSTime();
    CreatureModelDataStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Flags, Scale, CollisionHeight, MountHeight FROM creaturemodeldatadbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 CreatureModelData entry. DB table `CreatureModelData dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        CreatureModelDataEntry* newCreatureModelData = new CreatureModelDataEntry;
        newCreatureModelData->Id = fields[0].GetUInt32();
        newCreatureModelData->Flags = fields[1].GetUInt32();
        newCreatureModelData->Scale = fields[2].GetFloat();
        newCreatureModelData->CollisionHeight = fields[3].GetFloat();
        newCreatureModelData->MountHeight = fields[4].GetFloat();
        CreatureModelDataStore[newCreatureModelData->Id] = newCreatureModelData;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu CreatureModelData entries in %u ms", (unsigned long)CreatureModelDataStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadCreatureSpellDataStore()
{
    uint32 oldMSTime = getMSTime();
    CreatureSpellDataStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, SpellId1, SpellId2, SpellId3, SpellId4 FROM creaturespelldatadbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 CreatureSpellData entry. DB table `CreatureSpellData dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        CreatureSpellDataEntry* newCreatureSpellData = new CreatureSpellDataEntry;
        newCreatureSpellData->ID = fields[0].GetUInt32();
        for (uint8 i = 0; i < 4; i++)
            newCreatureSpellData->spellId[i] = fields[1 + i].GetUInt32();
        CreatureSpellDataStore[newCreatureSpellData->ID] = newCreatureSpellData;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu CreatureSpellData entries in %u ms", (unsigned long)CreatureSpellDataStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadCreatureTypeStore()
{
    uint32 oldMSTime = getMSTime();
    CreatureTypeStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id FROM creaturetypedbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 CreatureType entry. DB table `CreatureType dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        CreatureTypeEntry* newCreatureType = new CreatureTypeEntry;
        newCreatureType->ID = fields[0].GetUInt32();
        CreatureTypeStore[newCreatureType->ID] = newCreatureType;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu CreatureType entries in %u ms", (unsigned long)CreatureTypeStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadCurrencyTypesStore()
{
    uint32 oldMSTime = getMSTime();
    CurrencyTypesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT ItemId, BitIndex FROM currencytypesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 CurrencyTypes entry. DB table `CurrencyTypes dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        CurrencyTypesEntry* newCurrencyTypes = new CurrencyTypesEntry;
        newCurrencyTypes->ItemId = fields[0].GetUInt32();
        newCurrencyTypes->BitIndex = fields[1].GetUInt32();
        CurrencyTypesStore[newCurrencyTypes->ItemId] = newCurrencyTypes;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu CurrencyTypes entries in %u ms", (unsigned long)CurrencyTypesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadDestructibleModelDataStore()
{
    uint32 oldMSTime = getMSTime();
    DestructibleModelDataStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, DamagedDisplayId, DestroyedDisplayId, RebuildingDisplayId, SmokeDisplayId FROM destructiblemodeldatadbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 DestructibleModelData entry. DB table `DestructibleModelData dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        DestructibleModelDataEntry* newDestructibleModelData = new DestructibleModelDataEntry;
        newDestructibleModelData->Id = fields[0].GetUInt32();
        newDestructibleModelData->DamagedDisplayId = fields[1].GetUInt32();
        newDestructibleModelData->DestroyedDisplayId = fields[2].GetUInt32();
        newDestructibleModelData->RebuildingDisplayId = fields[3].GetUInt32();
        newDestructibleModelData->SmokeDisplayId = fields[4].GetUInt32();
        DestructibleModelDataStore[newDestructibleModelData->Id] = newDestructibleModelData;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu DestructibleModelData entries in %u ms", (unsigned long)DestructibleModelDataStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadDungeonEncounterStore()
{
    uint32 oldMSTime = getMSTime();
    DungeonEncounterStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, MapId, Difficulty, EncounterIndex, EncounterName, EncounterName_loc2 FROM dungeonencounterdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 DungeonEncounter entry. DB table `DungeonEncounter dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        DungeonEncounterEntry* newDungeonEncounter = new DungeonEncounterEntry;
        newDungeonEncounter->id = fields[0].GetUInt32();
        newDungeonEncounter->mapId = fields[1].GetUInt32();
        newDungeonEncounter->difficulty = fields[2].GetUInt32();
        newDungeonEncounter->encounterIndex = fields[3].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newDungeonEncounter->encounterName[i] = NULL;
        newDungeonEncounter->encounterName[0] = (char*)fields[4].GetCString();
        newDungeonEncounter->encounterName[2] = (char*)fields[5].GetCString();
        DungeonEncounterStore[newDungeonEncounter->id] = newDungeonEncounter;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu DungeonEncounter entries in %u ms", (unsigned long)DungeonEncounterStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadDurabilityCostsStore()
{
    uint32 oldMSTime = getMSTime();
    DurabilityCostsStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT ItemLevel, Multiplier1, Multiplier2, Multiplier3, Multiplier4, Multiplier5, Multiplier6, Multiplier7, Multiplier8, Multiplier9, Multiplier10, Multiplier11, Multiplier12, Multiplier13, Multiplier14, Multiplier15, Multiplier16, Multiplier17, Multiplier18, Multiplier19, Multiplier20, Multiplier21, Multiplier22, Multiplier23, Multiplier24, Multiplier25, Multiplier26, Multiplier27, Multiplier28, Multiplier29 FROM durabilitycostsdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 DurabilityCosts entry. DB table `DurabilityCosts dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        DurabilityCostsEntry* newDurabilityCosts = new DurabilityCostsEntry;
        newDurabilityCosts->Itemlvl = fields[0].GetUInt32();
        for (uint8 i = 0; i < 29; i++)
            newDurabilityCosts->multiplier[i] = fields[1 + i].GetUInt32();
        DurabilityCostsStore[newDurabilityCosts->Itemlvl] = newDurabilityCosts;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu DurabilityCosts entries in %u ms", (unsigned long)DurabilityCostsStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadDurabilityQualityStore()
{
    uint32 oldMSTime = getMSTime();
    DurabilityQualityStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, QualityMod FROM durabilityqualitydbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 DurabilityQuality entry. DB table `DurabilityQuality dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        DurabilityQualityEntry* newDurabilityQuality = new DurabilityQualityEntry;
        newDurabilityQuality->Id = fields[0].GetUInt32();
        newDurabilityQuality->quality_mod = fields[1].GetFloat();
        DurabilityQualityStore[newDurabilityQuality->Id] = newDurabilityQuality;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu DurabilityQuality entries in %u ms", (unsigned long)DurabilityQualityStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadEmotesStore()
{
    uint32 oldMSTime = getMSTime();
    EmotesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Flags, EmoteType, UnitStandState FROM emotesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 Emotes entry. DB table `Emotes dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        EmotesEntry* newEmotes = new EmotesEntry;
        newEmotes->Id = fields[0].GetUInt32();
        newEmotes->Flags = fields[1].GetUInt32();
        newEmotes->EmoteType = fields[2].GetUInt32();
        newEmotes->UnitStandState = fields[3].GetUInt32();
        EmotesStore[newEmotes->Id] = newEmotes;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu Emotes entries in %u ms", (unsigned long)EmotesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadEmotesTextStore()
{
    uint32 oldMSTime = getMSTime();
    EmotesTextStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, EmoteId FROM emotestextdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 EmotesText entry. DB table `EmotesText dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        EmotesTextEntry* newEmotesText = new EmotesTextEntry;
        newEmotesText->Id = fields[0].GetUInt32();
        newEmotesText->textid = fields[1].GetUInt32();
        EmotesTextStore[newEmotesText->Id] = newEmotesText;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu EmotesText entries in %u ms", (unsigned long)EmotesTextStore.size(), GetMSTimeDiffToNow(oldMSTime));
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
        newFaction->reputationListID = fields[1].GetInt32();
        for (uint8 i = 0; i < 4; i++)
            newFaction->BaseRepRaceMask[i] = fields[2 + i].GetUInt32();
        for (uint8 i = 0; i < 4; i++)
            newFaction->BaseRepClassMask[i] = fields[6 + i].GetUInt32();
        for (uint8 i = 0; i < 4; i++)
            newFaction->BaseRepValue[i] = fields[10 + i].GetUInt32();
        for (uint8 i = 0; i < 4; i++)
            newFaction->ReputationFlags[i] = fields[14 + i].GetUInt32();
        newFaction->team = fields[18].GetUInt32();
        newFaction->spilloverRateIn = fields[19].GetFloat();
        newFaction->spilloverRateOut = fields[20].GetFloat();
        newFaction->spilloverMaxRankIn = fields[21].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newFaction->name[i] = NULL;
        newFaction->name[0] = (char*)fields[22].GetCString();
        newFaction->name[2] = (char*)fields[23].GetCString();
        FactionStore[newFaction->ID] = newFaction;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu faction entries in %u ms", (unsigned long)FactionStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadFactionTemplateStore()
{
    uint32 oldMSTime = getMSTime();
    FactionTemplateStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Faction, FactionFlags, OurMask, FriendlyMask, HostileMask, EnemyFaction1, EnemyFaction2, EnemyFaction3, EnemyFaction4, "
        "FriendFaction1, FriendFaction2, FriendFaction3, FriendFaction4 FROM factiontemplatedbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 factiontemplate entry. DB table `factiontemplatedbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        FactionTemplateEntry* newFactionTemplate = new FactionTemplateEntry;
        newFactionTemplate->ID = fields[0].GetUInt32();
        newFactionTemplate->faction = fields[1].GetUInt32();
        newFactionTemplate->factionFlags = fields[2].GetUInt32();
        newFactionTemplate->ourMask = fields[3].GetUInt32();
        newFactionTemplate->friendlyMask = fields[4].GetUInt32();
        for (uint8 i = 0; i < 4; i++)
            newFactionTemplate->enemyFaction[i] = fields[5 + i].GetUInt32();
        for (uint8 i = 0; i < 4; i++)
            newFactionTemplate->enemyFaction[i] = fields[9 + i].GetUInt32();
        FactionTemplateStore[newFactionTemplate->ID] = newFactionTemplate;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu factiontemplate entries in %u ms", (unsigned long)FactionTemplateStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadGameObjectDisplayInfoStore()
{
    uint32 oldMSTime = getMSTime();
    GameObjectDisplayInfoStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, MinX, MinY, MinZ, MaxX, MaxY, MaxZ FROM gameobjectdisplayinfodbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 GameObjectDisplayInfo entry. DB table `GameObjectDisplayInfo dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        GameObjectDisplayInfoEntry* newGameObjectDisplayInfo = new GameObjectDisplayInfoEntry;
        newGameObjectDisplayInfo->Displayid = fields[0].GetUInt32();
        newGameObjectDisplayInfo->minX = fields[1].GetFloat();
        newGameObjectDisplayInfo->minY = fields[2].GetFloat();
        newGameObjectDisplayInfo->minZ = fields[3].GetFloat();
        newGameObjectDisplayInfo->maxX = fields[4].GetFloat();
        newGameObjectDisplayInfo->maxY = fields[5].GetFloat();
        newGameObjectDisplayInfo->maxZ = fields[6].GetFloat();
        GameObjectDisplayInfoStore[newGameObjectDisplayInfo->Displayid] = newGameObjectDisplayInfo;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu GameObjectDisplayInfo entries in %u ms", (unsigned long)GameObjectDisplayInfoStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadGemPropertiesStore()
{
    uint32 oldMSTime = getMSTime();
    GemPropertiesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, SpellItemEnchantment, Color FROM gempropertiesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 GemProperties entry. DB table `GemProperties dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        GemPropertiesEntry* newGemProperties = new GemPropertiesEntry;
        newGemProperties->ID = fields[0].GetUInt32();
        newGemProperties->spellitemenchantement = fields[1].GetUInt32();
        newGemProperties->color = fields[2].GetUInt32();
        GemPropertiesStore[newGemProperties->ID] = newGemProperties;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu GemProperties entries in %u ms", (unsigned long)GemPropertiesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadGlyphPropertiesStore()
{
    uint32 oldMSTime = getMSTime();
    GlyphPropertiesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, SpellId, TypeFlags, Unk1 FROM glyphpropertiesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 GlyphProperties entry. DB table `GlyphProperties dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        GlyphPropertiesEntry* newGlyphProperties = new GlyphPropertiesEntry;
        newGlyphProperties->Id = fields[0].GetUInt32();
        newGlyphProperties->SpellId = fields[1].GetUInt32();
        newGlyphProperties->TypeFlags = fields[2].GetUInt32();
        newGlyphProperties->Unk1 = fields[3].GetUInt32();
        GlyphPropertiesStore[newGlyphProperties->Id] = newGlyphProperties;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu GlyphProperties entries in %u ms", (unsigned long)GlyphPropertiesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadGlyphSlotStore()
{
    uint32 oldMSTime = getMSTime();
    GlyphSlotStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, TypeFlags, `Order` FROM glyphslotdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 GlyphSlot entry. DB table `GlyphSlot dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        GlyphSlotEntry* newGlyphSlot = new GlyphSlotEntry;
        newGlyphSlot->Id = fields[0].GetUInt32();
        newGlyphSlot->TypeFlags = fields[1].GetUInt32();
        newGlyphSlot->Order = fields[2].GetUInt32();
        GlyphSlotStore[newGlyphSlot->Id] = newGlyphSlot;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu GlyphSlot entries in %u ms", (unsigned long)GlyphSlotStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadHolidaysStore()
{
    uint32 oldMSTime = getMSTime();
    HolidaysStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Duration1, Duration2, Duration3, Duration4, Duration5, Duration6, Duration7, Duration8, Duration9, Duration10, "
        "Date1, Date2, Date3, Date4, Date5, Date6, Date7, Date8, Date9, Date10, Date11, Date12, Date13, Date14, Date15, Date16, Date17, Date18, Date19, Date20, Date21, Date22, Date23, Date24, Date25, Date26, "
        "Region, Looping, CalendarFlags1, CalendarFlags2, CalendarFlags3, CalendarFlags4, CalendarFlags5, CalendarFlags6, CalendarFlags7, CalendarFlags8, CalendarFlags9, CalendarFlags10, "
        "TextureFilename, Priority, CalendarFilterType FROM holidaysdbc");

    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 Holidays entry. DB table `Holidays dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();
        HolidaysEntry* newHolidays = new HolidaysEntry;
        newHolidays->Id = fields[0].GetUInt32();
        for (uint8 i = 0; i < 10; i++)
            newHolidays->Duration[i] = fields[1 + i].GetUInt32();
        for (uint8 i = 0; i < 26; i++)
            newHolidays->Date[i] = fields[11 + i].GetUInt32();
        newHolidays->Region = fields[37].GetUInt32();
        newHolidays->Looping = fields[38].GetUInt32();
        for (uint8 i = 0; i < 10; i++)
            newHolidays->CalendarFlags[i] = fields[39 + i].GetUInt32();
        newHolidays->TextureFilename = (char*)fields[49].GetCString();
        newHolidays->Priority = fields[50].GetUInt32();
        newHolidays->CalendarFilterType = fields[51].GetUInt32();
        HolidaysStore[newHolidays->Id] = newHolidays;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu Holidays entries in %u ms", (unsigned long)HolidaysStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadItemBagFamilyStore()
{
    uint32 oldMSTime = getMSTime();
    ItemBagFamilyStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id FROM itembagfamilydbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 ItemBagFamily entry. DB table `ItemBagFamily dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        ItemBagFamilyEntry* newItemBagFamily = new ItemBagFamilyEntry;
        newItemBagFamily->ID = fields[0].GetUInt32();
        ItemBagFamilyStore[newItemBagFamily->ID] = newItemBagFamily;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu ItemBagFamily entries in %u ms", (unsigned long)ItemBagFamilyStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadItemExtendedCostStore()
{
    uint32 oldMSTime = getMSTime();
    ItemExtendedCostStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, ReqHonorPoints, ReqArenaPoints, ReqArenaSlot, ReqItem1, ReqItem2, ReqItem3, ReqItem4, ReqItem5, "
        "ReqItemCount1, ReqItemCount2, ReqItemCount3, ReqItemCount4, ReqItemCount5, ReqPersonalArenaRating FROM itemextendedcostdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 itemextendedcost entry. DB table `itemextendedcostdbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        ItemExtendedCostEntry* newItemExtendedCost = new ItemExtendedCostEntry;
        newItemExtendedCost->ID = fields[0].GetUInt32();
        newItemExtendedCost->reqhonorpoints = fields[1].GetUInt32();
        newItemExtendedCost->reqarenapoints = fields[2].GetUInt32();
        newItemExtendedCost->reqarenaslot = fields[3].GetUInt32();
        for (uint8 i = 0; i < 5; i++)
            newItemExtendedCost->reqitem[i] = fields[4 + i].GetUInt32();
        for (uint8 i = 0; i < 4; i++)
            newItemExtendedCost->reqitemcount[i] = fields[9 + i].GetUInt32();
        newItemExtendedCost->reqpersonalarenarating = fields[14].GetUInt32();
        ItemExtendedCostStore[newItemExtendedCost->ID] = newItemExtendedCost;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu itemextendedcost entries in %u ms", (unsigned long)ItemExtendedCostStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadItemLimitCategoryStore()
{
    uint32 oldMSTime = getMSTime();
    ItemLimitCategoryStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, MaxCount, Mode FROM itemlimitcategorydbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 ItemLimitCategory entry. DB table `ItemLimitCategory dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        ItemLimitCategoryEntry* newItemLimitCategory = new ItemLimitCategoryEntry;
        newItemLimitCategory->ID = fields[0].GetUInt32();
        newItemLimitCategory->maxCount = fields[1].GetUInt32();
        newItemLimitCategory->mode = fields[2].GetUInt32();
        ItemLimitCategoryStore[newItemLimitCategory->ID] = newItemLimitCategory;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu ItemLimitCategory entries in %u ms", (unsigned long)ItemLimitCategoryStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadItemRandomPropertiesStore()
{
    uint32 oldMSTime = getMSTime();
    ItemRandomPropertiesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, EnchantId1, EnchantId2, EnchantId3, Name, Name_loc2 FROM itemrandompropertiesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 ItemRandomProperties entry. DB table `ItemRandomProperties dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        ItemRandomPropertiesEntry* newItemRandomProperties = new ItemRandomPropertiesEntry;
        newItemRandomProperties->ID = fields[0].GetUInt32();
        for (uint8 i = 0; i < 3; i++)
            newItemRandomProperties->enchant_id[i] = fields[1 + i].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newItemRandomProperties->nameSuffix[i] = NULL;
        newItemRandomProperties->nameSuffix[0] = (char*)fields[4].GetCString();
        newItemRandomProperties->nameSuffix[2] = (char*)fields[5].GetCString();
        ItemRandomPropertiesStore[newItemRandomProperties->ID] = newItemRandomProperties;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu ItemRandomProperties entries in %u ms", (unsigned long)ItemRandomPropertiesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadItemRandomSuffixStore()
{
    uint32 oldMSTime = getMSTime();
    ItemRandomSuffixStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Name, Name_loc2, EnchantId1, EnchantId2, EnchantId3, Prefix1, Prefix2, Prefix3 FROM itemrandomsuffixdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 ItemRandomSuffix entry. DB table `ItemRandomSuffix dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        ItemRandomSuffixEntry* newItemRandomSuffix = new ItemRandomSuffixEntry;
        newItemRandomSuffix->ID = fields[0].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newItemRandomSuffix->nameSuffix[i] = NULL;
        newItemRandomSuffix->nameSuffix[0] = (char*)fields[1].GetCString();
        newItemRandomSuffix->nameSuffix[2] = (char*)fields[2].GetCString();
        for (uint8 i = 0; i < 3; i++)
            newItemRandomSuffix->enchant_id[i] = fields[3 + i].GetUInt32();
        for (uint8 i = 0; i < 3; i++)
            newItemRandomSuffix->prefix[i] = fields[6 + i].GetUInt32();
        ItemRandomSuffixStore[newItemRandomSuffix->ID] = newItemRandomSuffix;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu ItemRandomSuffix entries in %u ms", (unsigned long)ItemRandomSuffixStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadItemSetStore()
{
    uint32 oldMSTime = getMSTime();
    ItemSetStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT id, Name, Name_loc2, ItemId1, ItemId2, ItemId3, ItemId4, ItemId5, ItemId6, ItemId7, ItemId8, ItemId9, ItemId10, Spells1, Spells2, Spells3, Spells4, Spells5, Spells6, Spells7, Spells8, ItemsToTriggerSpell1, ItemsToTriggerSpell2, ItemsToTriggerSpell3, ItemsToTriggerSpell4, ItemsToTriggerSpell5, ItemsToTriggerSpell6, ItemsToTriggerSpell7, ItemsToTriggerSpell8, RequiredSkillId, RequiredSkillValue FROM itemsetdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 ItemSet entry. DB table `ItemSet dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        ItemSetEntry* newItemSet = new ItemSetEntry;
        for (uint8 i = 0; i < 16; i++)
            newItemSet->name[i] = NULL;
        newItemSet->name[0] = (char*)fields[1].GetCString();
        newItemSet->name[2] = (char*)fields[2].GetCString();
        for (uint8 i = 0; i < 10; i++)
            newItemSet->itemId[i] = fields[3 + i].GetUInt32();
        for (uint8 i = 0; i < 8; i++)
            newItemSet->spells[i] = fields[13 + i].GetUInt32();
        for (uint8 i = 0; i < 8; i++)
            newItemSet->items_to_triggerspell[i] = fields[21 + i].GetUInt32();
        newItemSet->required_skill_id = fields[29].GetUInt32();
        newItemSet->required_skill_value = fields[30].GetUInt32();
        ItemSetStore[fields[0].GetUInt32()] = newItemSet; // tocheck

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu ItemSet entries in %u ms", (unsigned long)ItemSetStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadLFGDungeonStore()
{
    uint32 oldMSTime = getMSTime();
    LFGDungeonStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Name, Name_loc2, MinLevel, MaxLevel, RecLevel, RecMinLevel, RecMaxLevel, MapId, Difficulty, Flags, Type, Expansion, GroupType FROM lfgdungeonsdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 LFGDungeon entry. DB table `LFGDungeon dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        LFGDungeonEntry* newLFGDungeon = new LFGDungeonEntry;
        newLFGDungeon->ID = fields[0].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newLFGDungeon->name[i] = NULL;
        newLFGDungeon->name[0] = (char*)fields[1].GetCString();
        newLFGDungeon->name[2] = (char*)fields[2].GetCString();
        newLFGDungeon->minlevel = fields[3].GetUInt32();
        newLFGDungeon->maxlevel = fields[4].GetUInt32();
        newLFGDungeon->reclevel = fields[5].GetUInt32();
        newLFGDungeon->recminlevel = fields[6].GetUInt32();
        newLFGDungeon->recmaxlevel = fields[7].GetUInt32();
        newLFGDungeon->map = fields[8].GetUInt32();
        newLFGDungeon->difficulty = fields[9].GetUInt32();
        newLFGDungeon->flags = fields[10].GetUInt32();
        newLFGDungeon->type = fields[11].GetUInt32();
        newLFGDungeon->expansion = fields[12].GetUInt32();
        newLFGDungeon->grouptype = fields[13].GetUInt32();
        LFGDungeonStore[newLFGDungeon->ID] = newLFGDungeon;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu LFGDungeon entries in %u ms", (unsigned long)LFGDungeonStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadLightStore()
{
    uint32 oldMSTime = getMSTime();
    LightStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, MapId, X, Y, Z FROM lightdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 Light entry. DB table `Light dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        LightEntry* newLight = new LightEntry;
        newLight->Id = fields[0].GetUInt32();
        newLight->MapId = fields[1].GetUInt32();
        newLight->X = fields[2].GetFloat();
        newLight->Y = fields[3].GetFloat();
        newLight->Z = fields[4].GetFloat();
        LightStore[newLight->Id] = newLight;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu Light entries in %u ms", (unsigned long)LightStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadLiquidTypeStore()
{
    uint32 oldMSTime = getMSTime();
    LiquidTypeStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Type, SpellId FROM liquidtypedbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 LiquidType entry. DB table `LiquidType dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        LiquidTypeEntry* newLiquidType = new LiquidTypeEntry;
        newLiquidType->Id = fields[0].GetUInt32();
        newLiquidType->Type = fields[1].GetUInt32();
        newLiquidType->SpellId = fields[2].GetUInt32();
        LiquidTypeStore[newLiquidType->Id] = newLiquidType;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu LiquidType entries in %u ms", (unsigned long)LiquidTypeStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadLockStore()
{
    uint32 oldMSTime = getMSTime();
    LockStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Type1, Type2, Type3, Type4, Type5, Type6, Type7, Type8, Index1, Index2, Index3, Index4, Index5, Index6, Index7, Index8, Skill1, Skill2, Skill3, Skill4, Skill5, Skill6, Skill7, Skill8 FROM lockdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 Lock entry. DB table `Lock dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        LockEntry* newLock = new LockEntry;
        newLock->ID = fields[0].GetUInt32();
        for (uint8 i = 0; i < 8; i++)
            newLock->Type[i] = fields[1 + i].GetUInt32();
        for (uint8 i = 0; i < 8; i++)
            newLock->Index[i] = fields[9 + i].GetUInt32();
        for (uint8 i = 0; i < 8; i++)
            newLock->Skill[i] = fields[17 + i].GetUInt32();
        LockStore[newLock->ID] = newLock;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu Lock entries in %u ms", (unsigned long)LockStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadMailTemplateStore()
{
    uint32 oldMSTime = getMSTime();
    MailTemplateStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Content, Content_loc2 FROM mailtemplatedbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 MailTemplate entry. DB table `MailTemplate dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        MailTemplateEntry* newMailTemplate = new MailTemplateEntry;
        newMailTemplate->ID = fields[0].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newMailTemplate->content[i] = NULL;
        newMailTemplate->content[0] = (char*)fields[1].GetCString();
        newMailTemplate->content[2] = (char*)fields[2].GetCString();
        MailTemplateStore[newMailTemplate->ID] = newMailTemplate;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu MailTemplate entries in %u ms", (unsigned long)MailTemplateStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadMapStore()
{
    uint32 oldMSTime = getMSTime();
    MapStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, MapType, Flags, Name, Name_loc2, LinkedZone, MultiMapId, EntranceMap, EntranceX, EntranceY, "
        "Addon, UnkTime, MaxPlayers FROM mapdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 map entry. DB table `mapdbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        MapEntry* newMap = new MapEntry;
        newMap->MapID = fields[0].GetUInt32();
        newMap->map_type = fields[1].GetUInt32();
        newMap->Flags = fields[2].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newMap->name[i] = NULL;
        newMap->name[0] = (char*)fields[3].GetCString();
        newMap->name[2] = (char*)fields[4].GetCString();
        newMap->linked_zone = fields[5].GetUInt32();
        newMap->multimap_id = fields[6].GetUInt32();
        newMap->entrance_map = fields[7].GetInt32();
        newMap->entrance_x = fields[8].GetFloat();
        newMap->entrance_y = fields[9].GetFloat();
        newMap->addon = fields[10].GetUInt32();
        newMap->unk_time = fields[11].GetUInt32();
        newMap->maxPlayers = fields[12].GetUInt32();
        MapStore[newMap->MapID] = newMap;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu map entries in %u ms", (unsigned long)MapStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadMapDifficultyStore()
{
    uint32 oldMSTime = getMSTime();
    MapDifficultyStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, MapId, Difficulty, AreaTriggerText, ResetTime, MaxPlayers FROM mapdifficultydbc ORDER BY Id ASC");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 mapdifficulty entry. DB table `mapdifficultydbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        MapDifficultyEntry* newMapDifficulty = new MapDifficultyEntry;
        newMapDifficulty->MapId = fields[1].GetUInt32();
        newMapDifficulty->Difficulty = fields[2].GetUInt32();
        newMapDifficulty->areaTriggerText = (char*)fields[3].GetCString();
        newMapDifficulty->resetTime = fields[4].GetUInt32();
        newMapDifficulty->maxPlayers = fields[5].GetUInt32();
        MapDifficultyStore[fields[0].GetUInt32()] = newMapDifficulty;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu mapdifficulty entries in %u ms", (unsigned long)MapDifficultyStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadMovieStore()
{
    uint32 oldMSTime = getMSTime();
    MovieStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id FROM moviedbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 Movie entry. DB table `Movie dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        MovieEntry* newMovie = new MovieEntry;
        newMovie->Id = fields[0].GetUInt32();
        MovieStore[newMovie->Id] = newMovie;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu Movie entries in %u ms", (unsigned long)MovieStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadOverrideSpellDataStore()
{
    uint32 oldMSTime = getMSTime();
    OverrideSpellDataStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, SpellId1, SpellId2, SpellId3, SpellId4, SpellId5, SpellId6, SpellId7, SpellId8, SpellId9, SpellId10 FROM overridespelldatadbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 OverrideSpellData entry. DB table `OverrideSpellData dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        OverrideSpellDataEntry* newOverrideSpellData = new OverrideSpellDataEntry;
        newOverrideSpellData->id = fields[0].GetUInt32();
        for (uint8 i = 0; i < 10; i++)
            newOverrideSpellData->spellId[i] = fields[1 + i].GetUInt32();
        OverrideSpellDataStore[newOverrideSpellData->id] = newOverrideSpellData;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu OverrideSpellData entries in %u ms", (unsigned long)OverrideSpellDataStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadPowerDisplayStore()
{
    uint32 oldMSTime = getMSTime();
    PowerDisplayStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, PowerType FROM powerdisplaydbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 PowerDisplay entry. DB table `PowerDisplay dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        PowerDisplayEntry* newPowerDisplay = new PowerDisplayEntry;
        newPowerDisplay->Id = fields[0].GetUInt32();
        newPowerDisplay->PowerType = fields[1].GetUInt32();
        PowerDisplayStore[newPowerDisplay->Id] = newPowerDisplay;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu PowerDisplay entries in %u ms", (unsigned long)PowerDisplayStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadPvPDifficultyStore()
{
    uint32 oldMSTime = getMSTime();
    PvPDifficultyStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, MapId, BracketId, MinLevel, MaxLevel, Difficulty FROM pvpdifficultydbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 PvPDifficulty entry. DB table `PvPDifficulty dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        PvPDifficultyEntry* newPvPDifficulty = new PvPDifficultyEntry;
        newPvPDifficulty->mapId = fields[1].GetUInt32();
        newPvPDifficulty->bracketId = fields[2].GetUInt32();
        newPvPDifficulty->minLevel = fields[3].GetUInt32();
        newPvPDifficulty->maxLevel = fields[4].GetUInt32();
        newPvPDifficulty->difficulty = fields[5].GetUInt32();
        PvPDifficultyStore[fields[0].GetUInt32()] = newPvPDifficulty; // tocheck id

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu PvPDifficulty entries in %u ms", (unsigned long)PvPDifficultyStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadQuestSortStore()
{
    uint32 oldMSTime = getMSTime();
    QuestSortStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id FROM questsortdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 QuestSort entry. DB table `QuestSort dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        QuestSortEntry* newQuestSort = new QuestSortEntry;
        newQuestSort->id = fields[0].GetUInt32();
        QuestSortStore[newQuestSort->id] = newQuestSort;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu QuestSort entries in %u ms", (unsigned long)QuestSortStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadQuestXPStore()
{
    uint32 oldMSTime = getMSTime();
    QuestXPStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Exp1, Exp2, Exp3, Exp4, Exp5, Exp6, Exp7, Exp8, Exp9, Exp10 FROM questxpdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 QuestXP entry. DB table `QuestXP dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        QuestXPEntry* newQuestXP = new QuestXPEntry;
        newQuestXP->id = fields[0].GetUInt32();
        for (uint8 i = 0; i < 10; i++)
            newQuestXP->Exp[i] = fields[1 + i].GetUInt32();
        QuestXPStore[newQuestXP->id] = newQuestXP;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu QuestXP entries in %u ms", (unsigned long)QuestXPStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadQuestFactionRewStore()
{
    uint32 oldMSTime = getMSTime();
    QuestFactionRewStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, QuestRewFactionValue1, QuestRewFactionValue2, QuestRewFactionValue3, QuestRewFactionValue4, QuestRewFactionValue5, QuestRewFactionValue6, QuestRewFactionValue7, QuestRewFactionValue8, QuestRewFactionValue9, QuestRewFactionValue10 FROM questfactionrewarddbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 QuestFactionRew entry. DB table `QuestFactionRew dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        QuestFactionRewEntry* newQuestFactionRew = new QuestFactionRewEntry;
        newQuestFactionRew->id = fields[0].GetUInt32();
        for (uint8 i = 0; i < 10; i++)
            newQuestFactionRew->QuestRewFactionValue[i] = fields[1 + i].GetInt32();
        QuestFactionRewStore[newQuestFactionRew->id] = newQuestFactionRew;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu QuestFactionRew entries in %u ms", (unsigned long)QuestFactionRewStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadRandomPropertiesPointsStore()
{
    uint32 oldMSTime = getMSTime();
    RandomPropertiesPointsStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT ItemLevel, EpicPropertiesPoints1, EpicPropertiesPoints2, EpicPropertiesPoints3, EpicPropertiesPoints4, EpicPropertiesPoints5, RarePropertiesPoints1, RarePropertiesPoints2, RarePropertiesPoints3, RarePropertiesPoints4, RarePropertiesPoints5, UncommonPropertiesPoints1, UncommonPropertiesPoints2, UncommonPropertiesPoints3, UncommonPropertiesPoints4, UncommonPropertiesPoints5 FROM randproppointsdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 RandomPropertiesPoints entry. DB table `RandomPropertiesPoints dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        RandomPropertiesPointsEntry* newRandomPropertiesPoints = new RandomPropertiesPointsEntry;
        newRandomPropertiesPoints->itemLevel = fields[0].GetUInt32();
        for (uint8 i = 0; i < 5; i++)
            newRandomPropertiesPoints->EpicPropertiesPoints[i] = fields[1 + i].GetUInt32();
        for (uint8 i = 0; i < 5; i++)
            newRandomPropertiesPoints->RarePropertiesPoints[i] = fields[6 + i].GetUInt32();
        for (uint8 i = 0; i < 5; i++)
            newRandomPropertiesPoints->UncommonPropertiesPoints[i] = fields[11 + i].GetUInt32();
        RandomPropertiesPointsStore[newRandomPropertiesPoints->itemLevel] = newRandomPropertiesPoints; // tocheck

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu RandomPropertiesPoints entries in %u ms", (unsigned long)RandomPropertiesPointsStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadScalingStatDistributionStore()
{
    uint32 oldMSTime = getMSTime();
    ScalingStatDistributionStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, StatMod1, StatMod2, StatMod3, StatMod4, StatMod5, StatMod6, StatMod7, StatMod8, StatMod9, StatMod10, "
            "Modifier1, Modifier2, Modifier3, Modifier4, Modifier5, Modifier6, Modifier7, Modifier8, Modifier9, Modifier10, MaxLevel FROM scalingstatdistributiondbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 ScalingStatDistribution entry. DB table `ScalingStatDistribution dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        ScalingStatDistributionEntry* newScalingStatDistribution = new ScalingStatDistributionEntry;
        newScalingStatDistribution->Id = fields[0].GetUInt32();
        for (uint8 i = 0; i < 10; i++)
            newScalingStatDistribution->StatMod[i] = fields[1 + i].GetInt32();
        for (uint8 i = 0; i < 10; i++)
            newScalingStatDistribution->Modifier[i] = fields[11 + 1].GetUInt32();
        newScalingStatDistribution->MaxLevel = fields[21].GetUInt32();
        ScalingStatDistributionStore[newScalingStatDistribution->Id] = newScalingStatDistribution;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu ScalingStatDistribution entries in %u ms", (unsigned long)ScalingStatDistributionStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadScalingStatValuesStore()
{
    uint32 oldMSTime = getMSTime();
    ScalingStatValuesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Level, SsdMultiplierA1, SsdMultiplierA2, SsdMultiplierA3, SsdMultiplierA4, ArmorModA1, ArmorModA2, ArmorModA3, ArmorModA4, "
                "DpsMod1, DpsMod2, DpsMod3, DpsMod4, DpsMod5, DpsMod6, SpellPower, SsdMultiplierB, SsdMultiplierC, ArmorModB1, ArmorModB2, ArmorModB3, ArmorModB4, ArmorModB5 FROM scalingstatvaluesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 ScalingStatValues entry. DB table `ScalingStatValues dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        ScalingStatValuesEntry* newScalingStatValues = new ScalingStatValuesEntry;
        newScalingStatValues->Id = fields[0].GetUInt32();
        newScalingStatValues->Level = fields[1].GetUInt32();
        for (uint8 i = 0; i < 4; i++)
            newScalingStatValues->ssdMultiplier[i] = fields[2 + i].GetUInt32();
        for (uint8 i = 0; i < 4; i++)
            newScalingStatValues->armorMod[i] = fields[6 + i].GetUInt32();
        for (uint8 i = 0; i < 6; i++)
            newScalingStatValues->dpsMod[i] = fields[10 + i].GetUInt32();
        newScalingStatValues->spellPower = fields[16].GetUInt32();
        newScalingStatValues->ssdMultiplier2 = fields[17].GetUInt32();
        newScalingStatValues->ssdMultiplier3 = fields[18].GetUInt32();
        for (uint8 i = 0; i < 5; i++)
            newScalingStatValues->armorMod2[i] = fields[19 + i].GetUInt32();
        ScalingStatValuesStore[newScalingStatValues->Id] = newScalingStatValues;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu ScalingStatValues entries in %u ms", (unsigned long)ScalingStatValuesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadSkillLineStore()
{
    uint32 oldMSTime = getMSTime();
    SkillLineStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, CategoryId, Name, Name_loc2, SpellIcon, CanLink FROM skilllinedbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 SkillLine entry. DB table `SkillLine dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        SkillLineEntry* newSkillLine = new SkillLineEntry;
        newSkillLine->id = fields[0].GetUInt32();
        newSkillLine->categoryId = fields[1].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newSkillLine->name[i] = NULL;
        newSkillLine->name[0] = (char*)fields[2].GetCString();
        newSkillLine->name[2] = (char*)fields[3].GetCString();
        newSkillLine->spellIcon = fields[4].GetUInt32();
        newSkillLine->canLink = fields[5].GetUInt32();
        SkillLineStore[newSkillLine->id] = newSkillLine;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu SkillLine entries in %u ms", (unsigned long)SkillLineStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadSkillLineAbilityStore()
{
    uint32 oldMSTime = getMSTime();
    SkillLineAbilityStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, SkillId, SpellId, Racemask, Classemask, ReqSkillValue, ForwardSpellId, LearnOnGetSkill, `MaxValue`, MinValue FROM skilllineabilitydbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 SkillLineAbility entry. DB table `SkillLineAbility dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        SkillLineAbilityEntry* newSkillLineAbility = new SkillLineAbilityEntry;
        newSkillLineAbility->id = fields[0].GetUInt32();
        newSkillLineAbility->skillId = fields[1].GetUInt32();
        newSkillLineAbility->spellId = fields[2].GetUInt32();
        newSkillLineAbility->racemask = fields[3].GetUInt32();
        newSkillLineAbility->classmask = fields[4].GetUInt32();
        newSkillLineAbility->req_skill_value = fields[5].GetUInt32();
        newSkillLineAbility->forward_spellid = fields[6].GetUInt32();
        newSkillLineAbility->learnOnGetSkill = fields[7].GetUInt32();
        newSkillLineAbility->max_value = fields[8].GetUInt32();
        newSkillLineAbility->min_value = fields[9].GetUInt32();
        SkillLineAbilityStore[newSkillLineAbility->id] = newSkillLineAbility;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu SkillLineAbility entries in %u ms", (unsigned long)SkillLineAbilityStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadSoundEntriesStore()
{
    uint32 oldMSTime = getMSTime();
    SoundEntriesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id FROM soundentriesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 SoundEntries entry. DB table `SoundEntries dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        SoundEntriesEntry* newSoundEntries = new SoundEntriesEntry;
        newSoundEntries->Id = fields[0].GetUInt32();
        SoundEntriesStore[newSoundEntries->Id] = newSoundEntries;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu SoundEntries entries in %u ms", (unsigned long)SoundEntriesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadSpellCastTimesStore()
{
    uint32 oldMSTime = getMSTime();
    SpellCastTimesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, CastTime FROM spellcasttimesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 SpellCastTimes entry. DB table `SpellCastTimes dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        SpellCastTimesEntry* newSpellCastTimes = new SpellCastTimesEntry;
        newSpellCastTimes->ID = fields[0].GetUInt32();
        newSpellCastTimes->CastTime = fields[1].GetUInt32();
        SpellCastTimesStore[newSpellCastTimes->ID] = newSpellCastTimes;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu SpellCastTimes entries in %u ms", (unsigned long)SpellCastTimesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadSpellCategoryStore()
{
    uint32 oldMSTime = getMSTime();
    SpellCategoryStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Flags FROM spellcategorydbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 SpellCategory entry. DB table `SpellCategory dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        SpellCategoryEntry* newSpellCategory = new SpellCategoryEntry;
        newSpellCategory->Id = fields[0].GetUInt32();
        newSpellCategory->Flags = fields[1].GetUInt32();
        SpellCategoryStore[newSpellCategory->Id] = newSpellCategory;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu SpellCategory entries in %u ms", (unsigned long)SpellCategoryStore.size(), GetMSTimeDiffToNow(oldMSTime));
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

void DBCMgr::LoadSpellDurationStore()
{
    uint32 oldMSTime = getMSTime();
    SpellDurationStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Duration1, Duration2, Duration3 FROM spelldurationdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 SpellDuration entry. DB table `SpellDuration dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        SpellDurationEntry* newSpellDuration = new SpellDurationEntry;
        newSpellDuration->ID = fields[0].GetUInt32();
        for (uint8 i = 0; i < 3; i++)
            newSpellDuration->Duration[i] = fields[1 + i].GetInt32();
        SpellDurationStore[newSpellDuration->ID] = newSpellDuration;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu SpellDuration entries in %u ms", (unsigned long)SpellDurationStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadSpellFocusObjectStore()
{
    uint32 oldMSTime = getMSTime();
    SpellFocusObjectStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id FROM spellfocusobjectdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 SpellFocusObject entry. DB table `SpellFocusObject dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        SpellFocusObjectEntry* newSpellFocusObject = new SpellFocusObjectEntry;
        newSpellFocusObject->ID = fields[0].GetUInt32();
        SpellFocusObjectStore[newSpellFocusObject->ID] = newSpellFocusObject;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu SpellFocusObject entries in %u ms", (unsigned long)SpellFocusObjectStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadSpellItemEnchantmentStore()
{
    uint32 oldMSTime = getMSTime();
    SpellItemEnchantmentStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Type1, Type2, Type3, Amount1, Amount2, Amount3, AmountB1, AmountB2, AmountB3, SpellId1, SpellId2, SpellId3, Description, Description_loc2, AuraId, Slot, GemId, EnchantmentCondition, RequiredSkill, RequiredSkillValue, RequiredLevel FROM spellitemenchantmentdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 SpellItemEnchantment entry. DB table `SpellItemEnchantment dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        SpellItemEnchantmentEntry* newSpellItemEnchantment = new SpellItemEnchantmentEntry;
        newSpellItemEnchantment->ID = fields[0].GetUInt32();
        for (uint8 i = 0; i < 3; i++)
            newSpellItemEnchantment->type[i] = fields[1 + i].GetUInt32();
        for (uint8 i = 0; i < 3; i++)
            newSpellItemEnchantment->amount[i] = fields[4 + i].GetUInt32();
        for (uint8 i = 0; i < 3; i++)
            newSpellItemEnchantment->spellid[i] = fields[7 + i].GetUInt32();
        for (uint8 i = 0; i < 16; i++)
            newSpellItemEnchantment->description[i] = NULL;
        newSpellItemEnchantment->description[0] = (char*)fields[10].GetCString();
        newSpellItemEnchantment->description[2] = (char*)fields[11].GetCString();
        newSpellItemEnchantment->aura_id = fields[12].GetUInt32();
        newSpellItemEnchantment->slot = fields[13].GetUInt32();
        newSpellItemEnchantment->GemID = fields[14].GetUInt32();
        newSpellItemEnchantment->EnchantmentCondition = fields[15].GetUInt32();
        newSpellItemEnchantment->requiredSkill = fields[16].GetUInt32();
        newSpellItemEnchantment->requiredSkillValue = fields[17].GetUInt32();
        newSpellItemEnchantment->requiredLevel = fields[18].GetUInt32();
        SpellItemEnchantmentStore[newSpellItemEnchantment->ID] = newSpellItemEnchantment;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu SpellItemEnchantment entries in %u ms", (unsigned long)SpellItemEnchantmentStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadSpellItemEnchantmentConditionStore()
{
    uint32 oldMSTime = getMSTime();
    SpellItemEnchantmentConditionStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Color1, Color2, Color3, Color4, Color5, Comparator1, Comparator2, Comparator3, Comparator4, Comparator5, CompareColor1, CompareColor2, CompareColor3, CompareColor4, CompareColor5, Value1, Value2, Value3, Value4, Value5 FROM spellitemenchantmentconditiondbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 SpellItemEnchantmentCondition entry. DB table `SpellItemEnchantmentCondition dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        SpellItemEnchantmentConditionEntry* newSpellItemEnchantmentCondition = new SpellItemEnchantmentConditionEntry;
        newSpellItemEnchantmentCondition->ID = fields[0].GetUInt32();
        for (uint8 i = 0; i < 5; i++)
            newSpellItemEnchantmentCondition->Color[i] = fields[1 + i].GetUInt32();
        for (uint8 i = 0; i < 5; i++)
            newSpellItemEnchantmentCondition->Comparator[i] = fields[6 + i].GetUInt32();
        for (uint8 i = 0; i < 5; i++)
            newSpellItemEnchantmentCondition->CompareColor[i] = fields[11 + i].GetUInt32();
        for (uint8 i = 0; i < 5; i++)
            newSpellItemEnchantmentCondition->Value[i] = fields[16 + i].GetUInt32();
        SpellItemEnchantmentConditionStore[newSpellItemEnchantmentCondition->ID] = newSpellItemEnchantmentCondition;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu SpellItemEnchantmentCondition entries in %u ms", (unsigned long)SpellItemEnchantmentConditionStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadSpellRadiusStore()
{
    uint32 oldMSTime = getMSTime();
    SpellRadiusStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, RadiusMin, RadiusPerLevel, RadiusMax FROM spellradiusdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 SpellRadius entry. DB table `SpellRadius dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        SpellRadiusEntry* newSpellRadius = new SpellRadiusEntry;
        newSpellRadius->ID = fields[0].GetUInt32();
        newSpellRadius->RadiusMin = fields[1].GetFloat();
        newSpellRadius->RadiusPerLevel = fields[2].GetFloat();
        newSpellRadius->RadiusMax = fields[3].GetFloat();
        SpellRadiusStore[newSpellRadius->ID] = newSpellRadius;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu SpellRadius entries in %u ms", (unsigned long)SpellRadiusStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadSpellRangeStore()
{
    uint32 oldMSTime = getMSTime();
    SpellRangeStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, MinRangeHostile, MinRangeFriend, MaxRangeHostile, MaxRangeFriend, Type FROM spellrangedbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 SpellRange entry. DB table `SpellRange dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        SpellRangeEntry* newSpellRange = new SpellRangeEntry;
        newSpellRange->ID = fields[0].GetUInt32();
        newSpellRange->minRangeHostile = fields[1].GetFloat();
        newSpellRange->minRangeFriend = fields[2].GetFloat();
        newSpellRange->maxRangeHostile = fields[3].GetFloat();
        newSpellRange->maxRangeFriend = fields[4].GetFloat();
        newSpellRange->type = fields[5].GetUInt32();
        SpellRangeStore[newSpellRange->ID] = newSpellRange;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu SpellRange entries in %u ms", (unsigned long)SpellRangeStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadSpellRuneCostStore()
{
    uint32 oldMSTime = getMSTime();
    SpellRuneCostStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, RuneCostBlood, RuneCostFrost, RuneCostUnholy, RunePowerGain FROM spellrunecostdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 SpellRuneCost entry. DB table `SpellRuneCost dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        SpellRuneCostEntry* newSpellRuneCost = new SpellRuneCostEntry;
        newSpellRuneCost->ID = fields[0].GetUInt32();
        newSpellRuneCost->RuneCost[0] = fields[1].GetUInt32();
        newSpellRuneCost->RuneCost[1] = fields[2].GetUInt32();
        newSpellRuneCost->RuneCost[2] = fields[3].GetUInt32();
        newSpellRuneCost->runePowerGain = fields[4].GetUInt32();
        SpellRuneCostStore[newSpellRuneCost->ID] = newSpellRuneCost;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu SpellRuneCost entries in %u ms", (unsigned long)SpellRuneCostStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadSpellShapeshiftStore()
{
    uint32 oldMSTime = getMSTime();
    SpellShapeshiftStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Flags1, CreatureType, AttackSpeed, ModelIdAlliance, ModelIdHorde, StanceSpell1, StanceSpell2, StanceSpell3, StanceSpell4, StanceSpell5, StanceSpell6, StanceSpell7, StanceSpell8 FROM spellshapeshiftformdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 SpellShapeshift entry. DB table `SpellShapeshift dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        SpellShapeshiftEntry* newSpellShapeshift = new SpellShapeshiftEntry;
        newSpellShapeshift->ID = fields[0].GetUInt32();
        newSpellShapeshift->flags1 = fields[1].GetUInt32();
        newSpellShapeshift->creatureType = fields[2].GetUInt32();
        newSpellShapeshift->attackSpeed = fields[3].GetUInt32();
        newSpellShapeshift->modelID_A = fields[4].GetUInt32();
        newSpellShapeshift->modelID_H = fields[5].GetUInt32();
        for (uint8 i = 0; i < 8; i++)
            newSpellShapeshift->stanceSpell[i] = fields[6 + i].GetUInt32();
        SpellShapeshiftStore[newSpellShapeshift->ID] = newSpellShapeshift;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu SpellShapeshift entries in %u ms", (unsigned long)SpellShapeshiftStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadStableSlotPricesStore()
{
    uint32 oldMSTime = getMSTime();
    StableSlotPricesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Slot, Price FROM stableslotpricesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 StableSlotPrices entry. DB table `StableSlotPrices dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        StableSlotPricesEntry* newStableSlotPrices = new StableSlotPricesEntry;
        newStableSlotPrices->Slot = fields[0].GetUInt32();
        newStableSlotPrices->Price = fields[1].GetUInt32();
        StableSlotPricesStore[newStableSlotPrices->Slot] = newStableSlotPrices;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu StableSlotPrices entries in %u ms", (unsigned long)StableSlotPricesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadSummonPropertiesStore()
{
    uint32 oldMSTime = getMSTime();
    SummonPropertiesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Category, Faction, Type, Slot, Flags FROM summonpropertiesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 SummonProperties entry. DB table `SummonProperties dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        SummonPropertiesEntry* newSummonProperties = new SummonPropertiesEntry;
        newSummonProperties->Id = fields[0].GetUInt32();
        newSummonProperties->Category = fields[1].GetUInt32();
        newSummonProperties->Faction = fields[2].GetUInt32();
        newSummonProperties->Type = fields[3].GetUInt32();
        newSummonProperties->Slot = fields[4].GetUInt32();
        newSummonProperties->Flags = fields[5].GetUInt32();
        SummonPropertiesStore[newSummonProperties->Id] = newSummonProperties;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu SummonProperties entries in %u ms", (unsigned long)SummonPropertiesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadTalentStore()
{
    uint32 oldMSTime = getMSTime();
    TalentStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, TalentTab, Row, Col, Rank1, Rank2, Rank3, Rank4, Rank5, DependsOn, DependsOnRank FROM talentdbc");
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

void DBCMgr::LoadTalentTabStore()
{
    uint32 oldMSTime = getMSTime();
    TalentTabStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, ClassMask, PetTalentMask, TabPage FROM talenttabdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 TalentTab entry. DB table `TalentTab dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        TalentTabEntry* newTalentTab = new TalentTabEntry;
        newTalentTab->TalentTabID = fields[0].GetUInt32();
        newTalentTab->ClassMask = fields[1].GetUInt32();
        newTalentTab->petTalentMask = fields[2].GetUInt32();
        newTalentTab->tabpage = fields[3].GetUInt32();
        TalentTabStore[newTalentTab->TalentTabID] = newTalentTab;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu TalentTab entries in %u ms", (unsigned long)TalentTabStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadTaxiNodesStore()
{
    uint32 oldMSTime = getMSTime();
    TaxiNodesStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, MapId, X, Y, Z, Name, Name_loc2, MountCreatureId1, MountCreatureId2 FROM taxinodesdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 TaxiNodes entry. DB table `TaxiNodes dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        TaxiNodesEntry* newTaxiNodes = new TaxiNodesEntry;
        newTaxiNodes->ID = fields[0].GetUInt32();
        newTaxiNodes->map_id = fields[1].GetUInt32();
        newTaxiNodes->x = fields[2].GetFloat();
        newTaxiNodes->y = fields[3].GetFloat();
        newTaxiNodes->z = fields[4].GetFloat();
        for (uint8 i = 0; i < 16; i++)
            newTaxiNodes->name[i] = NULL;
        newTaxiNodes->name[0] = (char*)fields[5].GetCString();
        newTaxiNodes->name[2] = (char*)fields[6].GetCString();
        for (uint8 i = 0; i < 2; i++)
            newTaxiNodes->MountCreatureID[i] = fields[7 + i].GetUInt32();
        TaxiNodesStore[newTaxiNodes->ID] = newTaxiNodes;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu TaxiNodes entries in %u ms", (unsigned long)TaxiNodesStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

uint32 DBCMgr::LoadTaxiPathStore()
{
    uint32 oldMSTime = getMSTime();
    TaxiPathStore.clear();
    uint32 maxValue = 0;

    QueryResult result = WorldDatabase.Query("SELECT Id, `From`, `To`, Price FROM taxipathdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 TaxiPath entry. DB table `TaxiPath dbc` is empty.");
        return 0;
    }

    do {
        Field* fields = result->Fetch();

        TaxiPathEntry* newTaxiPath = new TaxiPathEntry;
        newTaxiPath->ID = fields[0].GetUInt32();
        newTaxiPath->from = fields[1].GetUInt32();
        newTaxiPath->to = fields[2].GetUInt32();
        newTaxiPath->price = fields[3].GetUInt32();
        TaxiPathStore[newTaxiPath->ID] = newTaxiPath;
        if (maxValue < newTaxiPath->ID + 1)
            maxValue = newTaxiPath->ID + 1;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu TaxiPath entries in %u ms", (unsigned long)TaxiPathStore.size(), GetMSTimeDiffToNow(oldMSTime));
    return maxValue;
}

void DBCMgr::LoadTaxiPathNodeStore()
{
    uint32 oldMSTime = getMSTime();
    TaxiPathNodeStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT PathId, `Index`, MapId, X, Y, Z, ActionFlag, Delay, ArrivalEventId, DepartureEventId, Id FROM taxipathnodedbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 TaxiPathNode entry. DB table `TaxiPathNode dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        TaxiPathNodeEntry* newTaxiPathNode = new TaxiPathNodeEntry;
        newTaxiPathNode->path = fields[0].GetUInt32();
        newTaxiPathNode->index = fields[1].GetUInt32();
        newTaxiPathNode->mapid = fields[2].GetUInt32();
        newTaxiPathNode->x = fields[3].GetFloat();
        newTaxiPathNode->y = fields[4].GetFloat();
        newTaxiPathNode->z = fields[5].GetFloat();
        newTaxiPathNode->actionFlag = fields[6].GetUInt32();
        newTaxiPathNode->delay = fields[7].GetUInt32();
        newTaxiPathNode->arrivalEventID = fields[8].GetUInt32();
        newTaxiPathNode->departureEventID = fields[9].GetUInt32();
        TaxiPathNodeStore[fields[10].GetUInt32()] = newTaxiPathNode;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu TaxiPathNode entries in %u ms", (unsigned long)TaxiPathNodeStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadTeamContributionPointsStore()
{
    uint32 oldMSTime = getMSTime();
    TeamContributionPointsStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Value FROM teamcontributionpointsdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 TeamContributionPoints entry. DB table `TeamContributionPoints dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        TeamContributionPointsEntry* newTeamContributionPoints = new TeamContributionPointsEntry;
        newTeamContributionPoints->value = fields[1].GetFloat();
        TeamContributionPointsStore[fields[0].GetUInt32()] = newTeamContributionPoints;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu TeamContributionPoints entries in %u ms", (unsigned long)TeamContributionPointsStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadTotemCategoryStore()
{
    uint32 oldMSTime = getMSTime();
    TotemCategoryStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, CategoryType, CategoryMask FROM totemcategorydbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 TotemCategory entry. DB table `TotemCategory dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        TotemCategoryEntry* newTotemCategory = new TotemCategoryEntry;
        newTotemCategory->ID = fields[0].GetUInt32();
        newTotemCategory->categoryType = fields[1].GetUInt32();
        newTotemCategory->categoryMask = fields[2].GetUInt32();
        TotemCategoryStore[newTotemCategory->ID] = newTotemCategory;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu TotemCategory entries in %u ms", (unsigned long)TotemCategoryStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadTransportAnimationStore()
{
    uint32 oldMSTime = getMSTime();
    TransportAnimationStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, TransportEntry, TimeSeg, X, Y, Z FROM transportanimationdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 TransportAnimation entry. DB table `TransportAnimation dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        TransportAnimationEntry* newTransportAnimation = new TransportAnimationEntry;
        newTransportAnimation->TransportEntry = fields[1].GetUInt32();
        newTransportAnimation->TimeSeg = fields[2].GetUInt32();
        newTransportAnimation->X = fields[3].GetFloat();
        newTransportAnimation->Y = fields[4].GetFloat();
        newTransportAnimation->Z = fields[5].GetFloat();
        TransportAnimationStore[fields[0].GetUInt32()] = newTransportAnimation;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu TransportAnimation entries in %u ms", (unsigned long)TransportAnimationStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadTransportRotationStore()
{
    uint32 oldMSTime = getMSTime();
    TransportRotationStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, TransportEntry, TimeSeg, X, Y, Z, W FROM transportRotationdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 TransportRotation entry. DB table `TransportRotation dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        TransportRotationEntry* newTransportRotation = new TransportRotationEntry;
        newTransportRotation->TransportEntry = fields[1].GetUInt32();
        newTransportRotation->TimeSeg = fields[2].GetUInt32();
        newTransportRotation->X = fields[3].GetFloat();
        newTransportRotation->Y = fields[4].GetFloat();
        newTransportRotation->Z = fields[5].GetFloat();
        newTransportRotation->W = fields[6].GetFloat();
        TransportRotationStore[fields[0].GetUInt32()] = newTransportRotation;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu TransportRotation entries in %u ms", (unsigned long)TransportRotationStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadVehicleStore()
{
    uint32 oldMSTime = getMSTime();
    VehicleStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Flags, TurnSpeed, PitchSpeed, PitchMin, PitchMax, SeatId1, SeatId2, SeatId3, SeatId4, SeatId5, SeatId6, SeatId7, SeatId8, "
                        "MouseLookOffsetPitch, CameraFadeDistScalarMin, CameraFadeDistScalarMax, CameraPitchOffset, FacingLimitRight, FacingLimitLeft, "
                        "MSSLTrgtTurnLingering, MSSLTrgtPitchLingering, MSSLTrgtMouseLingering, MSSLTrgtEndOpacity, MSSLTrgtArcSpeed, MSSLTrgtArcRepeat, MSSLTrgtArcWidth, "
                        "MSSLTrgtImpactRadius1, MSSLTrgtImpactRadius2, MSSLTrgtArcTexture, MSSLTrgtImpactTexture, MSSLTrgtImpactModel1, MSSLTrgtImpactModel2, "
                        "CameraYawOffset, UiLocomotionType, MSSLTrgtImpactTexRadius, UiSeatIndicatorType, PowerDisplayId1 FROM vehicledbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 Vehicle entry. DB table `Vehicle dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        VehicleEntry* newVehicle = new VehicleEntry;
        newVehicle->m_ID = fields[0].GetUInt32();
        newVehicle->m_flags = fields[1].GetUInt32();
        newVehicle->m_turnSpeed = fields[2].GetFloat();
        newVehicle->m_pitchSpeed = fields[3].GetFloat();
        newVehicle->m_pitchMin = fields[4].GetFloat();
        newVehicle->m_pitchMax = fields[5].GetFloat();
        for (uint8 i = 0; i < 8; i++)
            newVehicle->m_seatID[i] = fields[6 + 1].GetUInt32();
        newVehicle->m_mouseLookOffsetPitch = fields[14].GetFloat();
        newVehicle->m_cameraFadeDistScalarMin = fields[15].GetFloat();
        newVehicle->m_cameraFadeDistScalarMax = fields[16].GetFloat();
        newVehicle->m_cameraPitchOffset = fields[17].GetFloat();
        newVehicle->m_facingLimitRight = fields[18].GetFloat();
        newVehicle->m_facingLimitLeft = fields[19].GetFloat();
        newVehicle->m_msslTrgtTurnLingering = fields[20].GetFloat();
        newVehicle->m_msslTrgtPitchLingering = fields[21].GetFloat();
        newVehicle->m_msslTrgtMouseLingering = fields[22].GetFloat();
        newVehicle->m_msslTrgtEndOpacity = fields[23].GetFloat();
        newVehicle->m_msslTrgtArcSpeed = fields[24].GetFloat();
        newVehicle->m_msslTrgtArcRepeat = fields[25].GetFloat();
        newVehicle->m_msslTrgtArcWidth = fields[26].GetFloat();
        for (uint8 i = 0; i < 2; i++)
            newVehicle->m_msslTrgtImpactRadius[i] = fields[27 + i].GetUInt32();
        newVehicle->m_msslTrgtArcTexture = (char*)fields[29].GetCString();
        newVehicle->m_msslTrgtImpactTexture = (char*)fields[30].GetCString();
        for (uint8 i = 0; i < 2; i++)
            newVehicle->m_msslTrgtImpactModel[i] = (char*)fields[31 + i].GetCString();
        newVehicle->m_cameraYawOffset = fields[33].GetFloat();
        newVehicle->m_uiLocomotionType = fields[34].GetUInt32();
        newVehicle->m_msslTrgtImpactTexRadius = fields[35].GetFloat();
        newVehicle->m_uiSeatIndicatorType = fields[36].GetUInt32();
        newVehicle->m_powerDisplayId = fields[37].GetUInt32();
        VehicleStore[newVehicle->m_ID] = newVehicle;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu Vehicle entries in %u ms", (unsigned long)VehicleStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadVehicleSeatStore()
{
    uint32 oldMSTime = getMSTime();
    VehicleSeatStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Flags, AttachmentOffsetId, AttachmentOffsetX, AttachmentOffsetY, AttachmentOffsetZ, PreDelay, EnterSpeed, EnterGravity, "
        "EnterMinDuration, EnterMaxDuration, EnterMinArcHeight, EnterMaxArcHeight, EnterAnimStart, EnterAnimLoop, RideAnimStart, RideAnimLoop, RideUpperAnimStart, RideupperAnimLoop, "
        "ExitPreDelay, ExitSpeed, ExitGravity, ExitMinDuration, ExitMaxDuration, ExitMinArcHeight, ExitMaxArcHeight, ExitAnimStart, ExitAnimLoop, ExitAnimEnd, "
        "PassengerYaw, PassengerPitch, PassengerRoll, PassengerAttachmentId, VehicleEnterAnim, VehicleExitAnim, VehicleRideAnimLoop, VehicleRideAnimBone, VehicleExitAnimBone, VehicleRideAnimLoopBone, "
        "VehicleEnterAnimDelay, VehicleExitAnimDelay, VehicleAbilityDisplay, EnterUISoundId, ExitUISoundId, UiSkin, FlagsB FROM vehicleseatdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 VehicleSeat entry. DB table `VehicleSeat dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        VehicleSeatEntry* newVehicleSeat = new VehicleSeatEntry;
        newVehicleSeat->m_ID = fields[0].GetUInt32();
        newVehicleSeat->m_flags = fields[1].GetUInt32();
        newVehicleSeat->m_attachmentID = fields[2].GetInt32();
        newVehicleSeat->m_attachmentOffsetX = fields[3].GetFloat();
        newVehicleSeat->m_attachmentOffsetY = fields[4].GetFloat();
        newVehicleSeat->m_attachmentOffsetZ = fields[5].GetFloat();
        newVehicleSeat->m_enterPreDelay = fields[6].GetFloat();
        newVehicleSeat->m_enterSpeed = fields[7].GetFloat();
        newVehicleSeat->m_enterGravity = fields[8].GetFloat();
        newVehicleSeat->m_enterMinDuration = fields[9].GetFloat();
        newVehicleSeat->m_enterMaxDuration = fields[10].GetFloat();
        newVehicleSeat->m_enterMinArcHeight = fields[11].GetFloat();
        newVehicleSeat->m_enterMaxArcHeight = fields[12].GetFloat();
        newVehicleSeat->m_enterAnimStart = fields[13].GetInt32();
        newVehicleSeat->m_enterAnimLoop = fields[14].GetInt32();
        newVehicleSeat->m_rideAnimStart = fields[15].GetInt32();
        newVehicleSeat->m_rideAnimLoop = fields[16].GetInt32();
        newVehicleSeat->m_rideUpperAnimStart = fields[17].GetInt32();
        newVehicleSeat->m_rideUpperAnimLoop = fields[18].GetInt32();
        newVehicleSeat->m_exitPreDelay = fields[19].GetFloat();
        newVehicleSeat->m_exitSpeed = fields[20].GetFloat();
        newVehicleSeat->m_exitGravity = fields[21].GetFloat();
        newVehicleSeat->m_exitMinDuration = fields[22].GetFloat();
        newVehicleSeat->m_exitMaxDuration = fields[23].GetFloat();
        newVehicleSeat->m_exitMinArcHeight = fields[24].GetFloat();
        newVehicleSeat->m_exitMaxArcHeight = fields[25].GetFloat();
        newVehicleSeat->m_exitAnimStart = fields[26].GetInt32();
        newVehicleSeat->m_exitAnimLoop = fields[27].GetInt32();
        newVehicleSeat->m_exitAnimEnd = fields[28].GetInt32();
        newVehicleSeat->m_passengerYaw = fields[29].GetFloat();
        newVehicleSeat->m_passengerPitch = fields[30].GetFloat();
        newVehicleSeat->m_passengerRoll = fields[31].GetFloat();
        newVehicleSeat->m_passengerAttachmentID = fields[32].GetInt32();
        newVehicleSeat->m_vehicleEnterAnim = fields[33].GetInt32();
        newVehicleSeat->m_vehicleExitAnim = fields[34].GetInt32();
        newVehicleSeat->m_vehicleRideAnimLoop = fields[35].GetInt32();
        newVehicleSeat->m_vehicleEnterAnimBone = fields[36].GetInt32();
        newVehicleSeat->m_vehicleExitAnimBone = fields[37].GetInt32();
        newVehicleSeat->m_vehicleRideAnimLoopBone = fields[38].GetInt32();
        newVehicleSeat->m_vehicleEnterAnimDelay = fields[39].GetFloat();
        newVehicleSeat->m_vehicleExitAnimDelay = fields[40].GetFloat();
        newVehicleSeat->m_vehicleAbilityDisplay = fields[41].GetUInt32();
        newVehicleSeat->m_enterUISoundID = fields[42].GetUInt32();
        newVehicleSeat->m_exitUISoundID = fields[43].GetUInt32();
        newVehicleSeat->m_uiSkin = fields[44].GetInt32();
        newVehicleSeat->m_flagsB = fields[45].GetUInt32();
        VehicleSeatStore[newVehicleSeat->m_ID] = newVehicleSeat;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu VehicleSeat entries in %u ms", (unsigned long)VehicleSeatStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadWMOAreaTableStore()
{
    uint32 oldMSTime = getMSTime();
    WMOAreaTableStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, RootId, AdtId, GroupId, Flags, AreaId FROM wmoareatabledbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 WMOAreaTable entry. DB table `WMOAreaTable dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        WMOAreaTableEntry* newWMOAreaTable = new WMOAreaTableEntry;
        newWMOAreaTable->Id = fields[0].GetUInt32();
        newWMOAreaTable->rootId = fields[1].GetInt32();
        newWMOAreaTable->adtId = fields[2].GetInt32();
        newWMOAreaTable->groupId = fields[3].GetInt32();
        newWMOAreaTable->Flags = fields[4].GetUInt32();
        newWMOAreaTable->areaId = fields[5].GetUInt32();
        WMOAreaTableStore[newWMOAreaTable->Id] = newWMOAreaTable;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu WMOAreaTable entries in %u ms", (unsigned long)WMOAreaTableStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadWorldMapAreaStore()
{
    uint32 oldMSTime = getMSTime();
    WorldMapAreaStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, Map, Area, LocLeft, LocRight, LocTop, LocBottom, DisplayMap FROM worldmapareadbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 WorldMapArea entry. DB table `WorldMapArea dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        WorldMapAreaEntry* newWorldMapArea = new WorldMapAreaEntry;
        newWorldMapArea->map_id = fields[1].GetUInt32();
        newWorldMapArea->area_id = fields[2].GetUInt32();
        newWorldMapArea->y1 = fields[3].GetFloat();
        newWorldMapArea->y2 = fields[4].GetFloat();
        newWorldMapArea->x1 = fields[5].GetFloat();
        newWorldMapArea->x2 = fields[6].GetFloat();
        newWorldMapArea->virtual_map_id = fields[7].GetUInt32();
        WorldMapAreaStore[fields[0].GetUInt32()] = newWorldMapArea; // tocheck

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu WorldMapArea entries in %u ms", (unsigned long)WorldMapAreaStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadWorldMapOverlayStore()
{
    uint32 oldMSTime = getMSTime();
    WorldMapOverlayStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, AreaTableId1, AreaTableId2, AreaTableId3, AreaTableId4 FROM worldmapoverlaydbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 WorldMapOverlay entry. DB table `WorldMapOverlay dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        WorldMapOverlayEntry* newWorldMapOverlay = new WorldMapOverlayEntry;
        newWorldMapOverlay->ID = fields[0].GetUInt32();
        for (uint8 i = 0; i < 4; i++)
            newWorldMapOverlay->areatableID[i] = fields[1 + i].GetUInt32();
        WorldMapOverlayStore[newWorldMapOverlay->ID] = newWorldMapOverlay;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu WorldMapOverlay entries in %u ms", (unsigned long)WorldMapOverlayStore.size(), GetMSTimeDiffToNow(oldMSTime));
}

void DBCMgr::LoadWorldSafeLocsStore()
{
    uint32 oldMSTime = getMSTime();
    WorldSafeLocsStore.clear();

    QueryResult result = WorldDatabase.Query("SELECT Id, MapId, X, Y, Z FROM worldsafelocsdbc");
    if (!result)
    {
        TC_LOG_ERROR("server.loading", ">> Loaded 0 WorldSafeLocs entry. DB table `WorldSafeLocs dbc` is empty.");
        return;
    }

    do {
        Field* fields = result->Fetch();

        WorldSafeLocsEntry* newWorldSafeLocs = new WorldSafeLocsEntry;
        newWorldSafeLocs->ID = fields[0].GetUInt32();
        newWorldSafeLocs->map_id = fields[1].GetUInt32();
        newWorldSafeLocs->x = fields[2].GetFloat();
        newWorldSafeLocs->y = fields[3].GetFloat();
        newWorldSafeLocs->z = fields[4].GetFloat();
        WorldSafeLocsStore[newWorldSafeLocs->ID] = newWorldSafeLocs;

    } while (result->NextRow());

    TC_LOG_ERROR("misc", ">> Loaded %lu WorldSafeLocs entries in %u ms", (unsigned long)WorldSafeLocsStore.size(), GetMSTimeDiffToNow(oldMSTime));
}
