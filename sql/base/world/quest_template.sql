-- MySQL dump 10.13  Distrib 5.6.9-rc, for Win64 (x86_64)
--
-- Host: localhost    Database: world
-- ------------------------------------------------------
-- Server version	5.6.9-rc

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `quest_template`
--

DROP TABLE IF EXISTS `quest_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest_template` (
  `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Method` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `QuestLevel` smallint(3) NOT NULL DEFAULT '1',
  `MinLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `QuestSortID` smallint(6) NOT NULL DEFAULT '0',
  `QuestType` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SuggestedGroupNum` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LimitTime` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredRaces` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredFactionId1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredFactionId2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredFactionValue1` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredFactionValue2` mediumint(8) NOT NULL DEFAULT '0',
  `NextQuestIdChain` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardXPId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardOrRequiredMoney` int(11) NOT NULL DEFAULT '0',
  `RewardMoneyMaxLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardSpell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardSpellCast` int(11) NOT NULL DEFAULT '0',
  `RewardHonor` int(11) NOT NULL DEFAULT '0',
  `RewardHonorMultiplier` float NOT NULL DEFAULT '0',
  `SourceItemId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardTitle` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredPlayerKills` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardTalents` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardArenaPoints` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardItem1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardItem2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardItem3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardItem4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardAmount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardAmount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardAmount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardAmount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardFactionID1` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionID2` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionID3` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionID4` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionID5` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionValue1` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionValue2` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionValue3` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionValue4` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionValue5` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionOverride1` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionOverride2` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionOverride3` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionOverride4` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionOverride5` mediumint(8) NOT NULL DEFAULT '0',
  `PointMapId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PointX` float NOT NULL DEFAULT '0',
  `PointY` float NOT NULL DEFAULT '0',
  `PointOption` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `LogTitle` text,
  `LogTitle_loc2` text,
  `LogDescription` text,
  `LogDescription_loc2` text,
  `QuestDescription` text,
  `QuestDescription_loc2` text,
  `EndText` text,
  `EndText_loc2` text,
  `OfferRewardText` text,
  `OfferRewardText_loc2` text,
  `RequestItemsText` text,
  `RequestItemsText_loc2` text,
  `QuestCompletionLog` text,
  `QuestCompletionLog_loc2` text,
  `RequiredNpcOrGo1` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGo2` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGo3` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGo4` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Unknown0` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ObjectiveText1` text,
  `ObjectiveText1_loc2` text,
  `ObjectiveText2` text,
  `ObjectiveText2_loc2` text,
  `ObjectiveText3` text,
  `ObjectiveText3_loc2` text,
  `ObjectiveText4` text,
  `ObjectiveText4_loc2` text,
  `DetailsEmote1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay1` int(10) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay2` int(10) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay3` int(10) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay4` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteOnIncomplete` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteOnComplete` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay1` int(10) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay2` int(10) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay3` int(10) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay4` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) DEFAULT '0',
  PRIMARY KEY (`ID`)
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest_template`
--

LOCK TABLES `quest_template` WRITE;
/*!40000 ALTER TABLE `quest_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `quest_template`
--

