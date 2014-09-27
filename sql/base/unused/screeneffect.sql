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
-- Table structure for table `screeneffect`
--

DROP TABLE IF EXISTS `screeneffect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screeneffect` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Type` int(10) NOT NULL DEFAULT '0',
  `Color_R` tinyint(3) NOT NULL DEFAULT '0',
  `Color_G` tinyint(3) NOT NULL DEFAULT '0',
  `Color_B` tinyint(3) NOT NULL DEFAULT '0',
  `Color_A` tinyint(3) NOT NULL DEFAULT '0',
  `Edge` int(10) NOT NULL DEFAULT '0',
  `BlackWhite` int(10) NOT NULL DEFAULT '0',
  `Unk` int(10) NOT NULL DEFAULT '0',
  `LightParams` int(10) NOT NULL DEFAULT '0',
  `SoundAmbience` int(10) NOT NULL DEFAULT '0',
  `ZoneMusic` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screeneffect`
--

LOCK TABLES `screeneffect` WRITE;
/*!40000 ALTER TABLE `screeneffect` DISABLE KEYS */;
/*!40000 ALTER TABLE `screeneffect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `screeneffect`
--

INSERT INTO `screeneffect` VALUES ('1', 'Ghost Screen Effect', '1', '0', '0', '0', '0', '0', '0', '0', '4', '462', '36');
INSERT INTO `screeneffect` VALUES ('21', 'Arthas Memory Events', '3', '0', '0', '0', '127', '4', '0', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('41', 'Borean Tundra - Mist of the Kvaldir', '3', '127', '127', '127', '127', '6', '40', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('43', 'ZP - Zombie-Vision', '3', '0', '0', '127', '127', '4', '0', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('61', 'BOTM - Jungle Madness', '3', '91', '127', '117', '127', '2', '25', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('81', 'Invis Screen Effect', '2', '0', '0', '0', '0', '0', '0', '0', '4', '462', '36');
INSERT INTO `screeneffect` VALUES ('82', 'Zul\'Drak - Altar of Quetz\'lun - ELM', '1', '0', '0', '0', '0', '0', '0', '0', '4', '462', '36');
INSERT INTO `screeneffect` VALUES ('101', 'Quest - Eye of Acherus', '3', '0', '0', '0', '127', '4', '0', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('121', 'Quest - Invis Screen Effect', '2', '0', '0', '0', '0', '0', '0', '0', '4', '462', '36');
INSERT INTO `screeneffect` VALUES ('122', 'Quest - Ghost Screen Effect', '1', '0', '0', '0', '0', '0', '0', '0', '4', '462', '36');
INSERT INTO `screeneffect` VALUES ('123', 'Quest - Realm of Shadows', '3', '28', '15', '19', '127', '1', '60', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('141', 'Ebon Hold - Chapter II Skybox (DND)', '0', '0', '0', '0', '0', '0', '0', '0', '5', '472', '449');
INSERT INTO `screeneffect` VALUES ('161', 'CoT Stratholme - Time Warp', '3', '0', '109', '127', '127', '8', '40', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('181', 'Ebon HOld - Chapter IV - Finale', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '474', '452');
INSERT INTO `screeneffect` VALUES ('201', 'Ebon Hold - Transition', '3', '0', '0', '0', '127', '1', '100', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('221', 'Howling Fjord - Echo of Ymiron', '2', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('222', 'DrakTharon - Skeleton Form', '3', '0', '7', '127', '127', '4', '10', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('242', 'Quest - Iron Colossus Battle (Skybox)', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '0');
INSERT INTO `screeneffect` VALUES ('262', 'Icecrown - Argent Skytalon', '3', '114', '114', '114', '127', '9', '0', '0', '-1', '0', '209');
INSERT INTO `screeneffect` VALUES ('282', 'Icecrown - Emerald Nightmare', '3', '0', '127', '0', '127', '2', '25', '0', '1', '28', '0');
INSERT INTO `screeneffect` VALUES ('302', 'Icecrown - Argent Defenders', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `screeneffect` VALUES ('322', 'Ebon Hold - Chapter III', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '473', '452');
INSERT INTO `screeneffect` VALUES ('342', 'Dragonblight - World of Shadows', '2', '0', '0', '0', '0', '0', '0', '0', '3', '474', '452');
INSERT INTO `screeneffect` VALUES ('362', 'Icecrown - Naz\'anak', '3', '50', '51', '51', '0', '200', '20', '0', '3', '0', '0');
INSERT INTO `screeneffect` VALUES ('382', 'Icecrown Bomber - See Cloak Dome', '3', '0', '127', '127', '115', '2', '0', '0', '0', '0', '0');
INSERT INTO `screeneffect` VALUES ('402', 'Icecrown - Sniper Rifle', '3', '0', '0', '0', '0', '8', '30', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('422', 'CoA Black - Twilight Shift', '3', '127', '94', '126', '127', '4', '0', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('442', 'Ebon Hold - Chapter IV Skybox (DND)', '0', '0', '0', '0', '0', '0', '0', '0', '5', '472', '502');
INSERT INTO `screeneffect` VALUES ('462', 'Drakil\'jin Death', '1', '0', '0', '0', '0', '0', '0', '0', '4', '462', '36');
INSERT INTO `screeneffect` VALUES ('482', 'Ulduar Raid - Worm Hole', '1', '0', '0', '0', '0', '0', '0', '0', '4', '0', '36');
INSERT INTO `screeneffect` VALUES ('502', 'Ulduar Raid - Phase Punch Effect 01', '3', '127', '127', '127', '127', '12', '60', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('602', 'Hrothgar\'s Landing - Mist of the Kvaldir', '3', '127', '127', '127', '127', '8', '40', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('743', 'Icecrown Raid - Gushing Wound Screen', '3', '0', '7', '127', '127', '4', '10', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('744', 'Icecrown Raid - Swarming Shadows', '3', '127', '80', '127', '127', '4', '0', '0', '-1', '0', '0');
INSERT INTO `screeneffect` VALUES ('747', 'Ruby Sanctum - Twilight Shift', '3', '127', '94', '126', '127', '4', '0', '0', '4', '505', '0');
INSERT INTO `screeneffect` VALUES ('756', 'CC Prologue - ET - Big Battle', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '574');
INSERT INTO `screeneffect` VALUES ('757', 'CC Prologue - ET - Med Battle', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '572');
INSERT INTO `screeneffect` VALUES ('758', 'CC Prologue - ET - Magic', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '573');
INSERT INTO `screeneffect` VALUES ('759', 'CC Prologue - ET - Quiet', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '571');
INSERT INTO `screeneffect` VALUES ('760', 'CC Prologue - ET - Rally', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '570');
