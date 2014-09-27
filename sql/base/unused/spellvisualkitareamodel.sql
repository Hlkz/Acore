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
-- Table structure for table `spellvisualkitareamodel`
--

DROP TABLE IF EXISTS `spellvisualkitareamodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spellvisualkitareamodel` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(46) NOT NULL DEFAULT '',
  `EnumId` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spellvisualkitareamodel`
--

LOCK TABLES `spellvisualkitareamodel` WRITE;
/*!40000 ALTER TABLE `spellvisualkitareamodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `spellvisualkitareamodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `spellvisualkitareamodel`
--

INSERT INTO `spellvisualkitareamodel` VALUES ('1', 'Spells\\Blizzard_Impact_Base.mdx', '0');
INSERT INTO `spellvisualkitareamodel` VALUES ('2', 'Spells\\RainOfFire_Impact_Base.mdx', '1');
INSERT INTO `spellvisualkitareamodel` VALUES ('3', 'Spells\\CallLightning_Impact.mdx', '2');
INSERT INTO `spellvisualkitareamodel` VALUES ('4', 'Spells\\FlamestrikeSmall_Impact_Base.mdx', '3');
INSERT INTO `spellvisualkitareamodel` VALUES ('5', 'Spells\\DeathAndDecay_Area_Base.mdx', '4');
INSERT INTO `spellvisualkitareamodel` VALUES ('6', 'Spells\\ArcaneShot_Area.mdx', '5');
INSERT INTO `spellvisualkitareamodel` VALUES ('7', 'Spells\\StarShards_Impact_Base.mdx', '6');
INSERT INTO `spellvisualkitareamodel` VALUES ('8', 'Spells\\Fel_RainOfFire_Impact_Base.mdx', '7');
INSERT INTO `spellvisualkitareamodel` VALUES ('9', 'Spells\\HellfireRaid_Dust_Impact_Base.mdx', '8');
INSERT INTO `spellvisualkitareamodel` VALUES ('21', 'Spells\\DeathAndDecay.mdx', '9');
INSERT INTO `spellvisualkitareamodel` VALUES ('41', 'Spells\\DeathKnight_Desecration.mdx', '10');
INSERT INTO `spellvisualkitareamodel` VALUES ('61', 'Spells\\Druid_StarfallMissile.mdx', '11');
INSERT INTO `spellvisualkitareamodel` VALUES ('81', 'Spells\\archimonde_fire.mdx', '12');
INSERT INTO `spellvisualkitareamodel` VALUES ('82', 'Spells\\Archimonde_Blue_Fire.mdx', '13');
INSERT INTO `spellvisualkitareamodel` VALUES ('83', 'Spells\\DeathAndDecayGreen.mdx', '14');
