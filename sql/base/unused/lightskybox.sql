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
-- Table structure for table `lightskybox`
--

DROP TABLE IF EXISTS `lightskybox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lightskybox` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Model` varchar(100) NOT NULL DEFAULT '',
  `Flags` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lightskybox`
--

LOCK TABLES `lightskybox` WRITE;
/*!40000 ALTER TABLE `lightskybox` DISABLE KEYS */;
/*!40000 ALTER TABLE `lightskybox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `lightskybox`
--

INSERT INTO `lightskybox` VALUES ('1', 'Environments\\Stars\\StratholmeSkybox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('2', 'Environments\\Stars\\PortalWorldLegionSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('3', 'Environments\\Stars\\DeathClouds.mdx', '0');
INSERT INTO `lightskybox` VALUES ('4', 'Environments\\Stars\\Stars.mdx', '0');
INSERT INTO `lightskybox` VALUES ('5', 'Environments\\Stars\\CavernsOfTimeSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('6', 'Environments\\Stars\\DireMaulSkyBox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('7', 'Environments\\Stars\\HellfireSkyBox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('8', 'Environments\\Stars\\BoneWastesSkyBox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('9', 'Environments\\Stars\\ShadowMoonSkyBox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('10', 'Environments\\Stars\\NetherstormSkyBox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('11', 'Environments\\Stars\\BladesEdgeSkyBox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('12', 'Environments\\Stars\\NagrandSkyBox.mdx', '1');
INSERT INTO `lightskybox` VALUES ('14', 'Environments\\Stars\\BladesedgeForestSkyBox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('15', 'Environments\\Stars\\BladesedgeNightElfSkyBox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('18', 'Environments\\Stars\\ShadowmoonIllidan.mdx', '0');
INSERT INTO `lightskybox` VALUES ('19', 'Environments\\Stars\\DragonblightScarletSkyBox.mdx', '2');
INSERT INTO `lightskybox` VALUES ('21', 'ENVIRONMENTS\\Stars\\ZulDrakSkyB.mdx', '1');
INSERT INTO `lightskybox` VALUES ('23', 'ENVIRONMENTS\\Stars\\ColdarraSky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('25', 'ENVIRONMENTS\\Stars\\IceCrownCitadelSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('26', 'ENVIRONMENTS\\Stars\\Aurora.mdx', '2');
INSERT INTO `lightskybox` VALUES ('27', 'ENVIRONMENTS\\Stars\\IceCrownSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('28', 'ENVIRONMENTS\\Stars\\IceCrownCitadelSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('29', 'ENVIRONMENTS\\Stars\\IceCrownDarkSky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('30', 'ENVIRONMENTS\\Stars\\IceCrownCitadelSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('33', 'ENVIRONMENTS\\Stars\\NexusRaid_NebulaSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('34', 'ENVIRONMENTS\\Stars\\ChamberAspectsBlackSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('35', 'ENVIRONMENTS\\Stars\\BladesedgeForestSkyBox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('36', 'ENVIRONMENTS\\Stars\\IceCrownScourgeSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('37', 'ENVIRONMENTS\\Stars\\StormPeaks_SkyA.mdx', '1');
INSERT INTO `lightskybox` VALUES ('38', 'ENVIRONMENTS\\Stars\\DeathKnightFireSkyBox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('39', 'ENVIRONMENTS\\Stars\\DeathKnightFireSkyBox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('40', 'ENVIRONMENTS\\Stars\\DeathKnightFireSkyBox.mdx', '2');
INSERT INTO `lightskybox` VALUES ('41', 'ENVIRONMENTS\\Stars\\IceCrownDarkSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('42', 'ENVIRONMENTS\\Stars\\IceCrownSunsetSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('45', 'ENVIRONMENTS\\Stars\\WintergraspSmokySky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('48', 'ENVIRONMENTS\\Stars\\WintergraspSmokySky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('49', 'ENVIRONMENTS\\Stars\\ChamberAspectsBlackSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('51', 'ENVIRONMENTS\\Stars\\ChamberAspectsBlackSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('52', 'ENVIRONMENTS\\Stars\\WintergraspSmokySky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('55', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('56', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('57', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('58', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('59', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('60', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('61', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('62', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('63', 'ENVIRONMENTS\\Stars\\AuroraOrange.mdx', '2');
INSERT INTO `lightskybox` VALUES ('64', 'ENVIRONMENTS\\Stars\\AuroraOrange.mdx', '2');
INSERT INTO `lightskybox` VALUES ('65', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('66', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('67', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('68', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('69', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('70', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('71', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('72', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('73', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('74', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('75', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('76', 'ENVIRONMENTS\\Stars\\AuroraOrange.mdx', '2');
INSERT INTO `lightskybox` VALUES ('77', 'ENVIRONMENTS\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('78', 'ENVIRONMENTS\\Stars\\AuroraOrange.mdx', '2');
INSERT INTO `lightskybox` VALUES ('79', 'ENVIRONMENTS\\Stars\\AuroraOrange.mdx', '2');
INSERT INTO `lightskybox` VALUES ('80', 'ENVIRONMENTS\\Stars\\ZulDrakSkyA.mdx', '0');
INSERT INTO `lightskybox` VALUES ('81', 'ENVIRONMENTS\\Stars\\DeathSkybox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('82', 'ENVIRONMENTS\\Stars\\DeathSkybox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('83', 'ENVIRONMENTS\\Stars\\DeathSkybox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('84', 'ENVIRONMENTS\\Stars\\AuroraOrange.mdx', '2');
INSERT INTO `lightskybox` VALUES ('85', 'ENVIRONMENTS\\Stars\\AuroraOrange.mdx', '2');
INSERT INTO `lightskybox` VALUES ('86', 'ENVIRONMENTS\\Stars\\AuroraOrange.mdx', '2');
INSERT INTO `lightskybox` VALUES ('87', 'ENVIRONMENTS\\Stars\\AuroraOrange.mdx', '2');
INSERT INTO `lightskybox` VALUES ('88', 'ENVIRONMENTS\\Stars\\AuroraOrange.mdx', '2');
INSERT INTO `lightskybox` VALUES ('89', 'ENVIRONMENTS\\Stars\\AuroraOrange.mdx', '2');
INSERT INTO `lightskybox` VALUES ('90', 'ENVIRONMENTS\\Stars\\DeathSkybox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('91', 'ENVIRONMENTS\\Stars\\DeathSkybox.mdx', '0');
INSERT INTO `lightskybox` VALUES ('92', 'ENVIRONMENTS\\Stars\\UlduranCloudySky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('93', 'ENVIRONMENTS\\Stars\\UlduranCloudySky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('94', 'ENVIRONMENTS\\Stars\\DalaranSkyBox.mdx', '1');
INSERT INTO `lightskybox` VALUES ('95', 'ENVIRONMENTS\\Stars\\DalaranSkyBox.mdx', '1');
INSERT INTO `lightskybox` VALUES ('96', 'ENVIRONMENTS\\Stars\\StormPeaks_SkyB_Storm.mdx', '1');
INSERT INTO `lightskybox` VALUES ('97', 'ENVIRONMENTS\\Stars\\NexusRaid_StarrySky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('98', 'ENVIRONMENTS\\Stars\\NexusRaid_NebulaSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('99', 'ENVIRONMENTS\\Stars\\NexusRaid_StarrySky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('100', 'ENVIRONMENTS\\Stars\\NexusRaid_NebulaSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('101', 'ENVIRONMENTS\\Stars\\NexusRaid_Wormhole.mdx', '0');
INSERT INTO `lightskybox` VALUES ('102', 'ENVIRONMENTS\\Stars\\NexusRaid_RuneEffects_Nebula.mdx', '0');
INSERT INTO `lightskybox` VALUES ('103', 'ENVIRONMENTS\\Stars\\NexusRaid_RuneEffects_Starry.mdx', '0');
INSERT INTO `lightskybox` VALUES ('104', 'ENVIRONMENTS\\Stars\\NexusRaid_StarrySky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('105', 'ENVIRONMENTS\\Stars\\NexusRaid_StarrySky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('106', 'ENVIRONMENTS\\Stars\\NexusRaid_NebulaSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('107', 'ENVIRONMENTS\\Stars\\NexusRaid_Wormhole.mdx', '0');
INSERT INTO `lightskybox` VALUES ('108', 'ENVIRONMENTS\\Stars\\NexusRaid_NebulaSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('109', 'ENVIRONMENTS\\Stars\\NexusRaid_RuneEffects_Nebula.mdx', '0');
INSERT INTO `lightskybox` VALUES ('110', 'ENVIRONMENTS\\Stars\\NexusRaid_StarrySky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('111', 'ENVIRONMENTS\\Stars\\NexusRaid_RuneEffects_Nebula.mdx', '0');
INSERT INTO `lightskybox` VALUES ('112', 'ENVIRONMENTS\\Stars\\ZulDrakSkyB.mdx', '0');
INSERT INTO `lightskybox` VALUES ('113', 'ENVIRONMENTS\\Stars\\ZulDrakSkyA.mdx', '1');
INSERT INTO `lightskybox` VALUES ('114', 'Environments\\Stars\\IceCrownStormySky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('115', 'ENVIRONMENTS\\Stars\\StormPeaks_SkyB_Storm.mdx', '1');
INSERT INTO `lightskybox` VALUES ('116', 'ENVIRONMENTS\\Stars\\StormPeaks_SkyC_Ulduar.mdx', '1');
INSERT INTO `lightskybox` VALUES ('117', 'ENVIRONMENTS\\Stars\\IceCrownCitadelSky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('118', 'ENVIRONMENTS\\Stars\\NexusRaid_Wormhole.mdx', '0');
INSERT INTO `lightskybox` VALUES ('119', 'ENVIRONMENTS\\Stars\\AzjolNerub_SkyA.mdx', '0');
INSERT INTO `lightskybox` VALUES ('120', 'ENVIRONMENTS\\Stars\\StormPeaks_SkyC_Ulduar.mdx', '1');
INSERT INTO `lightskybox` VALUES ('121', 'ENVIRONMENTS\\Stars\\AzjolNerub_SkyA.mdx', '0');
INSERT INTO `lightskybox` VALUES ('122', 'ENVIRONMENTS\\Stars\\StormPeaks_SkyC_Ulduar.mdx', '1');
INSERT INTO `lightskybox` VALUES ('123', 'Environments\\Stars\\AuroraYellowGreen.mdx', '2');
INSERT INTO `lightskybox` VALUES ('124', 'Environments\\Stars\\Battlefield_Dirty_SkyBox.mdx', '2');
INSERT INTO `lightskybox` VALUES ('125', 'Environments\\Stars\\AuroraOrange.mdx', '2');
INSERT INTO `lightskybox` VALUES ('126', 'Environments\\Stars\\IceCrownSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('134', 'Environments\\Stars\\IceCrownStormySky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('135', 'Environments\\Stars\\IceCrownRaidSky01.mdx', '0');
INSERT INTO `lightskybox` VALUES ('136', 'Environments\\Stars\\IceCrownSky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('137', 'Environments\\Stars\\IceCrownSky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('138', 'Environments\\Stars\\IceCrownStarrySky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('139', 'Environments\\Stars\\IceCrownSky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('140', 'Environments\\Stars\\IceCrownSky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('141', 'Environments\\Stars\\IceCrownCitadelSky.mdx', '0');
INSERT INTO `lightskybox` VALUES ('142', 'Environments\\Stars\\IceCrownRaidSky01.mdx', '0');
INSERT INTO `lightskybox` VALUES ('143', 'Environments\\Stars\\IceCrownStormySky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('144', 'Environments\\Stars\\IceCrownStormySky.mdx', '1');
INSERT INTO `lightskybox` VALUES ('145', 'Environments\\Stars\\IceCrownRaidSky02.mdx', '0');
INSERT INTO `lightskybox` VALUES ('148', 'Environments\\Stars\\RubySanctumSky.mdx', '0');
