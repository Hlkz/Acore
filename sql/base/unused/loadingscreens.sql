-- MySQL dump 10.13  Distrib 5.6.9-rc, for Win64 (x86_64)
--
-- Host: localhost    Database: unused
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
-- Table structure for table `loadingscreens`
--

DROP TABLE IF EXISTS `loadingscreens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loadingscreens` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Texture` varchar(200) NOT NULL DEFAULT '',
  `HasWideScreen` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loadingscreens`
--

LOCK TABLES `loadingscreens` WRITE;
/*!40000 ALTER TABLE `loadingscreens` DISABLE KEYS */;
/*!40000 ALTER TABLE `loadingscreens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `loadingscreens`
--

INSERT INTO `loadingscreens` VALUES ('3', 'Kalimdor', 'Interface\\Glues\\LoadingScreens\\LoadScreenKalimdor.blp', '1');
INSERT INTO `loadingscreens` VALUES ('4', 'Azeroth', 'Interface\\Glues\\LoadingScreens\\LoadScreenEasternKingdom.blp', '1');
INSERT INTO `loadingscreens` VALUES ('21', 'InstanceCave', 'Interface\\Glues\\LoadingScreens\\LoadScreenCave.blp', '0');
INSERT INTO `loadingscreens` VALUES ('23', 'InstanceDungeon', 'Interface\\Glues\\LoadingScreens\\LoadScreenDungeon.blp', '0');
INSERT INTO `loadingscreens` VALUES ('25', 'InstanceExterior', 'Interface\\Glues\\LoadingScreens\\LoadScreenEnviroment.blp', '0');
INSERT INTO `loadingscreens` VALUES ('42', 'InstanceRuinedCity', 'Interface\\Glues\\LoadingScreens\\LoadScreenRuinedCity.blp', '0');
INSERT INTO `loadingscreens` VALUES ('61', 'InstanceRaid', 'Interface\\Glues\\LoadingScreens\\LoadScreenRaid.blp', '0');
INSERT INTO `loadingscreens` VALUES ('81', 'InstanceMaraudon', 'Interface\\Glues\\LoadingScreens\\LoadScreenMaraudon.blp', '0');
INSERT INTO `loadingscreens` VALUES ('82', 'InstanceDireMaul', 'Interface\\Glues\\LoadingScreens\\LoadScreenDireMaul.blp', '0');
INSERT INTO `loadingscreens` VALUES ('101', 'InstanceStratholme', 'Interface\\Glues\\LoadingScreens\\LoadScreenStrathome.blp', '0');
INSERT INTO `loadingscreens` VALUES ('102', 'InstanceScholomance', 'Interface\\Glues\\LoadingScreens\\LoadScreenScholomance.blp', '0');
INSERT INTO `loadingscreens` VALUES ('103', 'InstanceBlackrockDepths', 'Interface\\Glues\\LoadingScreens\\LoadScreenBlackrockDepths.blp', '0');
INSERT INTO `loadingscreens` VALUES ('104', 'InstanceAlteracValley', 'Interface\\Glues\\LoadingScreens\\LoadScreenPvpBattleground.blp', '0');
INSERT INTO `loadingscreens` VALUES ('122', 'InstanceWarsongGulch', 'Interface\\Glues\\LoadingScreens\\LoadScreenWarsongGulch.blp', '0');
INSERT INTO `loadingscreens` VALUES ('141', 'InstanceBlackWingLair', 'Interface\\Glues\\LoadingScreens\\LoadScreenBlackWingLair.blp', '0');
INSERT INTO `loadingscreens` VALUES ('142', 'InstanceDeadmines', 'Interface\\Glues\\LoadingScreens\\LoadScreenDeadmines.blp', '0');
INSERT INTO `loadingscreens` VALUES ('143', 'InstanceWailingCaverns', 'Interface\\Glues\\LoadingScreens\\LoadScreenWailingCaverns.blp', '0');
INSERT INTO `loadingscreens` VALUES ('144', 'InstanceUldaman', 'Interface\\Glues\\LoadingScreens\\LoadScreenUldaman.blp', '0');
INSERT INTO `loadingscreens` VALUES ('145', 'InstanceRazorfenD', 'Interface\\Glues\\LoadingScreens\\LoadScreenRazorfenDowns.blp', '0');
INSERT INTO `loadingscreens` VALUES ('146', 'InstanceZulFarrak', 'Interface\\Glues\\LoadingScreens\\LoadScreenZulFarrak.blp', '0');
INSERT INTO `loadingscreens` VALUES ('161', 'InstanceZulGurub', 'Interface\\Glues\\LoadingScreens\\LoadScreenZulGurub.blp', '0');
INSERT INTO `loadingscreens` VALUES ('181', 'ChampionsHall', 'Interface\\Glues\\LoadingScreens\\LoadScreenChampionsHall.blp', '0');
INSERT INTO `loadingscreens` VALUES ('182', 'HallOfLegends', 'Interface\\Glues\\LoadingScreens\\LoadScreenHallofLegends.blp', '0');
INSERT INTO `loadingscreens` VALUES ('183', 'InstanceArathiBasin', 'Interface\\Glues\\LoadingScreens\\LoadscreenArathiBasin.blp', '0');
INSERT INTO `loadingscreens` VALUES ('184', 'InstanceAhnQiraj20', 'Interface\\Glues\\LoadingScreens\\LoadScreenAhnQiraj20man.blp', '0');
INSERT INTO `loadingscreens` VALUES ('185', 'InstanceAhnQiraj40', 'Interface\\Glues\\LoadingScreens\\LoadScreenAhnQiraj40man.blp', '0');
INSERT INTO `loadingscreens` VALUES ('186', 'InstanceStormwindStockade', 'Interface\\Glues\\LoadingScreens\\LoadScreenStormwindStockade.blp', '0');
INSERT INTO `loadingscreens` VALUES ('187', 'InstanceBlackfathomDeep', 'Interface\\Glues\\LoadingScreens\\LoadScreenBlackFathomDeeps.blp', '0');
INSERT INTO `loadingscreens` VALUES ('188', 'InstanceRazorfenKraul', 'Interface\\Glues\\LoadingScreens\\LoadScreenRazorfenKraul.blp', '0');
INSERT INTO `loadingscreens` VALUES ('189', 'InstanceBlackrockSpire', 'Interface\\Glues\\LoadingScreens\\LoadScreenBlackrockSpire.blp', '0');
INSERT INTO `loadingscreens` VALUES ('190', 'InstanceScarletMonastery', 'Interface\\Glues\\LoadingScreens\\LoadScreenMonastery.blp', '0');
INSERT INTO `loadingscreens` VALUES ('191', 'InstanceSunkenTemple', 'Interface\\Glues\\LoadingScreens\\LoadScreenSunkenTemple.blp', '0');
INSERT INTO `loadingscreens` VALUES ('192', 'InstanceMoltenCore', 'Interface\\Glues\\LoadingScreens\\LoadScreenMoltenCore.blp', '0');
INSERT INTO `loadingscreens` VALUES ('193', 'InstanceGnomeregan', 'Interface\\Glues\\LoadingScreens\\LoadScreenGnomeregan.blp', '0');
INSERT INTO `loadingscreens` VALUES ('194', 'InstanceStockades', 'Interface\\Glues\\LoadingScreens\\LoadScreenStormwindStockade.blp', '0');
INSERT INTO `loadingscreens` VALUES ('195', 'InstanceRagefireChasm', 'Interface\\Glues\\LoadingScreens\\LoadScreenRagefireChasm.blp', '0');
INSERT INTO `loadingscreens` VALUES ('196', 'InstanceBlackfathomDeeps', 'Interface\\Glues\\LoadingScreens\\LoadScreenBlackFathomDeeps.blp', '0');
INSERT INTO `loadingscreens` VALUES ('197', 'InstanceNaxxramas', 'Interface\\Glues\\LoadingScreens\\LoadScreenNaxxramas.blp', '0');
INSERT INTO `loadingscreens` VALUES ('198', 'Outland', 'Interface\\Glues\\LoadingScreens\\LoadScreenOutland.blp', '1');
INSERT INTO `loadingscreens` VALUES ('199', 'InstanceHellfireCitadel', 'Interface\\Glues\\LoadingScreens\\LoadScreenHellfireCitadel.blp', '0');
INSERT INTO `loadingscreens` VALUES ('200', 'InstanceKarazhan', 'Interface\\Glues\\LoadingScreens\\LoadScreenKarazhan.blp', '0');
INSERT INTO `loadingscreens` VALUES ('201', 'InstanceAuchindoun', 'Interface\\Glues\\LoadingScreens\\LoadScreenAuchindoun.blp', '0');
INSERT INTO `loadingscreens` VALUES ('202', 'InstanceDeepRunTram', 'Interface\\Glues\\LoadingScreens\\LoadScreenDeepRunTram.blp', '0');
INSERT INTO `loadingscreens` VALUES ('203', 'InstanceShadowfangKeep', 'Interface\\Glues\\LoadingScreens\\LoadScreenShadowFangKeep.blp', '0');
INSERT INTO `loadingscreens` VALUES ('204', 'InstanceShadowfangKeep', 'Interface\\Glues\\LoadingScreens\\LoadScreenShadowFangKeep.blp', '0');
INSERT INTO `loadingscreens` VALUES ('205', 'InstanceDeepRunTram', 'Interface\\Glues\\LoadingScreens\\LoadScreenDeepRunTram.blp', '0');
INSERT INTO `loadingscreens` VALUES ('206', 'InstanceTempestKeep', 'Interface\\Glues\\LoadingScreens\\LoadScreenTempestKeep.blp', '0');
INSERT INTO `loadingscreens` VALUES ('207', 'InstanceCoilFang', 'Interface\\Glues\\LoadingScreens\\LoadScreenCoilFang.blp', '0');
INSERT INTO `loadingscreens` VALUES ('208', 'InstanceHellfireMagtheridon', 'Interface\\Glues\\LoadingScreens\\LoadScreenHellfireCitadelRaid.blp', '0');
INSERT INTO `loadingscreens` VALUES ('209', 'InstanceCavernsTime', 'Interface\\Glues\\LoadingScreens\\LoadScreenCavernsTime.blp', '0');
INSERT INTO `loadingscreens` VALUES ('210', 'InstanceNetherBG', 'Interface\\Glues\\LoadingScreens\\LoadScreenNetherBattlegrounds.blp', '0');
INSERT INTO `loadingscreens` VALUES ('212', 'InstanceCavernsofTime', 'Interface\\Glues\\LoadingScreens\\LoadScreenCavernsTime.blp', '0');
INSERT INTO `loadingscreens` VALUES ('213', 'InstanceGruul\'sLair', 'Interface\\Glues\\LoadingScreens\\LoadScreenGruulsLair.blp', '0');
INSERT INTO `loadingscreens` VALUES ('214', 'InstanceZul\"Aman', 'Interface\\Glues\\LoadingScreens\\LoadScreenZulAman.blp', '0');
INSERT INTO `loadingscreens` VALUES ('215', 'InstanceBlackTemple', 'Interface\\Glues\\LoadingScreens\\LoadScreenBlackTemple.blp', '0');
INSERT INTO `loadingscreens` VALUES ('216', 'Northrend', 'Interface\\Glues\\LoadingScreens\\LoadScreenNorthrend.blp', '1');
INSERT INTO `loadingscreens` VALUES ('217', 'InstanceLordaeronPVP', 'Interface\\Glues\\LoadingScreens\\LoadScreenRuinsofLordaeronBattlegrounds.blp', '0');
INSERT INTO `loadingscreens` VALUES ('218', 'InstanceBladesEdgePVP', 'Interface\\Glues\\LoadingScreens\\LoadScreenBladesEdgeArena.blp', '0');
INSERT INTO `loadingscreens` VALUES ('219', 'InstanceNagrandPVP', 'Interface\\Glues\\LoadingScreens\\LoadScreenNagrandArenaBattlegrounds.blp', '0');
INSERT INTO `loadingscreens` VALUES ('220', 'InstanceUtgardeKeep', 'Interface\\Glues\\LoadingScreens\\LoadScreenUtgarde.blp', '0');
INSERT INTO `loadingscreens` VALUES ('221', 'InstanceUtgardePinnacle', 'Interface\\Glues\\LoadingScreens\\LoadScreenUtgardePinnecle.blp', '0');
INSERT INTO `loadingscreens` VALUES ('222', 'InstanceStratholmCOT', 'Interface\\Glues\\LoadingScreens\\LoadScreenOldStrathome.blp', '0');
INSERT INTO `loadingscreens` VALUES ('223', 'InstanceSunwell5man', 'Interface\\Glues\\LoadingScreens\\LoadScreenSunwell5Man.blp', '0');
INSERT INTO `loadingscreens` VALUES ('224', 'InstanceSunwell5Man', 'Interface\\Glues\\LoadingScreens\\LoadScreenSunwell5Man.blp', '0');
INSERT INTO `loadingscreens` VALUES ('225', 'InstanceSunwellRaid', 'Interface\\Glues\\LoadingScreens\\LoadScreenSunwell.blp', '0');
INSERT INTO `loadingscreens` VALUES ('226', 'InstanceNexus70', 'Interface\\Glues\\LoadingScreens\\LoadScreenNexus70.blp', '0');
INSERT INTO `loadingscreens` VALUES ('227', 'InstanceNexus80', 'Interface\\Glues\\LoadingScreens\\LoadScreenNexus80.blp', '0');
INSERT INTO `loadingscreens` VALUES ('228', 'InstanceDrakTharon', 'Interface\\Glues\\LoadingScreens\\LoadScreenDrakTharon.blp', '0');
INSERT INTO `loadingscreens` VALUES ('229', 'InstanceAzjolUpperCity', 'Interface\\Glues\\LoadingScreens\\LoadScreenAzjolUpperCity.blp', '0');
INSERT INTO `loadingscreens` VALUES ('230', 'InstanceUlduar77', 'Interface\\Glues\\LoadingScreens\\LoadScreenUlduar77.blp', '0');
INSERT INTO `loadingscreens` VALUES ('231', 'InstanceHallsofLightning', 'Interface\\Glues\\LoadingScreens\\LoadScreenUlduar80.blp', '0');
INSERT INTO `loadingscreens` VALUES ('232', 'InstanceAhnKahet', 'Interface\\Glues\\LoadingScreens\\LoadScreenAzjolNerub76.blp', '0');
INSERT INTO `loadingscreens` VALUES ('233', 'InstanceEbonHold', 'Interface\\Glues\\LoadingScreens\\LoadScreenDeathKnight.blp', '0');
INSERT INTO `loadingscreens` VALUES ('234', 'InstanceAzjolLowerCity', 'Interface\\Glues\\LoadingScreens\\LoadScreenAzjolNerub76.blp', '0');
INSERT INTO `loadingscreens` VALUES ('235', 'InstanceDalaranPrison', 'Interface\\Glues\\LoadingScreens\\LoadScreenDalaranPrison.blp', '0');
INSERT INTO `loadingscreens` VALUES ('236', 'InstanceNexus25', 'Interface\\Glues\\LoadingScreens\\LoadScreenMalygos.blp', '0');
INSERT INTO `loadingscreens` VALUES ('237', 'InstanceGunDrak', 'Interface\\Glues\\LoadingScreens\\LoadScreenGunDrak.blp', '0');
INSERT INTO `loadingscreens` VALUES ('238', 'InstanceNorthrendBG', 'Interface\\Glues\\LoadingScreens\\LoadScreenNorthrendBG.blp', '0');
INSERT INTO `loadingscreens` VALUES ('239', 'InstanceChamberBlack', 'Interface\\Glues\\LoadingScreens\\LoadScreenChamberBlack.blp', '0');
INSERT INTO `loadingscreens` VALUES ('240', 'InstanceOrgrimmarArena', 'Interface\\Glues\\LoadingScreens\\LoadScreenOrgrimmarArena.blp', '0');
INSERT INTO `loadingscreens` VALUES ('242', 'InstanceDalaranSewer', 'Interface\\Glues\\LoadingScreens\\LoadScreenDalaranSewersArena.blp', '0');
INSERT INTO `loadingscreens` VALUES ('243', 'Wintergrasp Vault of Archavon', 'Interface\\Glues\\LoadingScreens\\LoadScreenWintergrasp.blp', '0');
INSERT INTO `loadingscreens` VALUES ('244', 'InstanceUlduarRaid', 'Interface\\Glues\\LoadingScreens\\LOADSCREENULDUARRAID.BLP', '0');
INSERT INTO `loadingscreens` VALUES ('245', 'InstanceIsleOfConquest', 'Interface\\Glues\\LoadingScreens\\LoadScreenIsleOfConquest.blp', '0');
INSERT INTO `loadingscreens` VALUES ('246', 'InstanceArgentRaid', 'Interface\\Glues\\LoadingScreens\\LoadScreenArgentRaid.blp', '0');
INSERT INTO `loadingscreens` VALUES ('247', 'InstanceArgentDungeon', 'Interface\\Glues\\LoadingScreens\\LoadScreenArgentDungeon.blp', '0');
INSERT INTO `loadingscreens` VALUES ('249', 'InstanceIcecrownCitadel5man', 'Interface\\Glues\\LoadingScreens\\loadscreenicecrown5man.blp', '0');
INSERT INTO `loadingscreens` VALUES ('250', 'InstanceIcecrownCitadel', 'Interface\\Glues\\LoadingScreens\\loadscreenicecrowncitadel.blp', '0');
INSERT INTO `loadingscreens` VALUES ('252', 'InstancePitofSaron', 'Interface\\Glues\\LoadingScreens\\loadscreenpitofsaron.blp', '0');
INSERT INTO `loadingscreens` VALUES ('253', 'InstanceHallsofReflection', 'Interface\\Glues\\LoadingScreens\\loadscreenhallsofreflection.blp', '0');
INSERT INTO `loadingscreens` VALUES ('254', 'InstanceRubySanctum', 'Interface\\Glues\\LoadingScreens\\loadscreenrubysanctum.blp', '0');
