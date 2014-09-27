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
-- Table structure for table `gameobjectartkit`
--

DROP TABLE IF EXISTS `gameobjectartkit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobjectartkit` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Texture1` varchar(200) NOT NULL DEFAULT '',
  `Texture2` varchar(200) NOT NULL DEFAULT '',
  `Texture3` varchar(200) NOT NULL DEFAULT '',
  `Model1` varchar(200) NOT NULL DEFAULT '',
  `Model2` varchar(200) NOT NULL DEFAULT '',
  `Model3` varchar(200) NOT NULL DEFAULT '',
  `Model4` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameobjectartkit`
--

LOCK TABLES `gameobjectartkit` WRITE;
/*!40000 ALTER TABLE `gameobjectartkit` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobjectartkit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `gameobjectartkit`
--

INSERT INTO `gameobjectartkit` VALUES ('1', '', '', '', 'World\\Generic\\PVP\\BattlefieldBanners\\BattlefieldBanner_State_FlagH_Plaguelands.mdx', '', '', '');
INSERT INTO `gameobjectartkit` VALUES ('2', '', '', '', 'World\\Generic\\PVP\\BattlefieldBanners\\BattlefieldBanner_State_FlagA_Plaguelands.mdx', '', '', '');
INSERT INTO `gameobjectartkit` VALUES ('21', '', '', '', 'World\\Generic\\PVP\\BattlefieldBanners\\BattlefieldBanner_State_FlagN_Plaguelands.mdx', '', '', '');
INSERT INTO `gameobjectartkit` VALUES ('61', '', '', '', 'World\\Expansion01\\Doodads\\HellfirePeninsula\\PVPFlags\\Hellfire_PVPFlags_NorthFortFlagsH.mdx', '', '', '');
INSERT INTO `gameobjectartkit` VALUES ('62', '', '', '', 'World\\Expansion01\\Doodads\\HellfirePeninsula\\PVPFlags\\Hellfire_PVPFlags_NorthFortFlagsA.mdx', '', '', '');
INSERT INTO `gameobjectartkit` VALUES ('63', '', '', '', 'World\\Expansion01\\Doodads\\HellfirePeninsula\\PVPFlags\\Hellfire_PVPFlags_NorthFortFlagsN.mdx', '', '', '');
INSERT INTO `gameobjectartkit` VALUES ('64', '', '', '', 'World\\Expansion01\\Doodads\\HellfirePeninsula\\PVPFlags\\Hellfire_PVPFlags_SouthFortFlagsH.mdx', '', '', '');
INSERT INTO `gameobjectartkit` VALUES ('65', '', '', '', 'World\\Expansion01\\Doodads\\HellfirePeninsula\\PVPFlags\\Hellfire_PVPFlags_SouthFortFlagsA.mdx', '', '', '');
INSERT INTO `gameobjectartkit` VALUES ('66', '', '', '', 'World\\Expansion01\\Doodads\\HellfirePeninsula\\PVPFlags\\Hellfire_PVPFlags_SouthFortFlagsN.mdx', '', '', '');
INSERT INTO `gameobjectartkit` VALUES ('67', '', '', '', 'World\\Expansion01\\Doodads\\HellfirePeninsula\\PVPFlags\\Hellfire_PVPFlags_WestFortFlagsA.mdx', '', '', '');
INSERT INTO `gameobjectartkit` VALUES ('68', '', '', '', 'World\\Expansion01\\Doodads\\HellfirePeninsula\\PVPFlags\\Hellfire_PVPFlags_WestFortFlagsH.mdx', '', '', '');
INSERT INTO `gameobjectartkit` VALUES ('69', '', '', '', 'World\\Expansion01\\Doodads\\HellfirePeninsula\\PVPFlags\\Hellfire_PVPFlags_WestFortFlagsN.mdx', '', '', '');
INSERT INTO `gameobjectartkit` VALUES ('81', '', '', '', 'World\\Generic\\PassiveDoodads\\ParticleEmitters\\LavaSplashParticle.mdx', 'World\\Generic\\PassiveDoodads\\ParticleEmitters\\LavaSplashParticle.mdx', 'World\\Generic\\PassiveDoodads\\ParticleEmitters\\LavaSplashParticle.mdx', 'World\\Generic\\PassiveDoodads\\ParticleEmitters\\LavaSplashParticle.mdx');
INSERT INTO `gameobjectartkit` VALUES ('82', '', '', '', 'World\\Generic\\PassiveDoodads\\Traps\\SpellObject_InvisibleTrap.mdx', '', '', '');
INSERT INTO `gameobjectartkit` VALUES ('101', '', '', '', 'World\\Expansion01\\Doodads\\Auchindoun\\Passivedoodads\\Ethereal_Ribbons\\Auchindoun_Ethereal_Ribbon_Type1.mdx', '', '', '');
INSERT INTO `gameobjectartkit` VALUES ('121', '', '', '', 'World\\Generic\\PassiveDoodads\\SummerFestival\\SummerFest_Bonfire_ON.mdx', '', '', '');
INSERT INTO `gameobjectartkit` VALUES ('122', '', '', '', 'World\\Generic\\PassiveDoodads\\SummerFestival\\SummerFest_Bonfire_OFF.mdx', '', '', '');
