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
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `AmbienceId` int(10) NOT NULL DEFAULT '0',
  `EffectType` int(10) NOT NULL DEFAULT '0',
  `EffectColor1` float NOT NULL DEFAULT '0',
  `EffectColor2` float NOT NULL DEFAULT '0',
  `EffectColor3` float NOT NULL DEFAULT '0',
  `EffectColor4` float NOT NULL DEFAULT '0',
  `Texture` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather`
--

LOCK TABLES `weather` WRITE;
/*!40000 ALTER TABLE `weather` DISABLE KEYS */;
/*!40000 ALTER TABLE `weather` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `weather`
--

INSERT INTO `weather` VALUES ('1', '0', '0', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('2', '0', '1', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('3', '8533', '1', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('4', '8534', '1', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('5', '8535', '1', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('6', '8536', '2', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('7', '8537', '2', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('8', '8538', '2', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('21', '8535', '1', '1', '1', '1', '1', 'textures\\Weather\\RainDrop01.blp');
INSERT INTO `weather` VALUES ('22', '8558', '3', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('41', '8556', '3', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('42', '8557', '3', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('61', '0', '2', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('81', '0', '1', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('83', '0', '2', '1', '1', '1', '1', 'textures\\Weather\\SnowFlake01.blp');
INSERT INTO `weather` VALUES ('84', '8556', '3', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('85', '8556', '3', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('86', '4994', '1', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('87', '0', '1', '1', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('90', '0', '1', '1', '1', '1', '1', 'Particles\\LeafBrown.blp');
INSERT INTO `weather` VALUES ('91', '0', '1', '1', '1', '1', '1', 'textures\\Weather\\RainDrop01.blp');
INSERT INTO `weather` VALUES ('96', '8537', '2', '1', '1', '1', '1', 'textures\\Weather\\SnowFlake01.blp');
INSERT INTO `weather` VALUES ('97', '8537', '2', '1', '1', '1', '1', 'textures\\Weather\\SnowFlake01.blp');
INSERT INTO `weather` VALUES ('98', '0', '2', '1', '1', '1', '1', 'textures\\Weather\\SnowFlake01.blp');
INSERT INTO `weather` VALUES ('99', '8535', '1', '1', '1', '1', '1', 'textures\\Weather\\RainDrop01.blp');
INSERT INTO `weather` VALUES ('100', '8535', '1', '1', '1', '1', '1', 'textures\\Weather\\RainDropRed01.blp');
INSERT INTO `weather` VALUES ('103', '8557', '3', '0', '1', '0.502', '0', '');
INSERT INTO `weather` VALUES ('104', '0', '3', '1', '0', '0', '0', 'Textures\\WEATHER\\SNOWMIST01.BLP');
INSERT INTO `weather` VALUES ('105', '8556', '3', '0', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('106', '8556', '3', '0', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('107', '8556', '3', '0', '1', '1', '1', '');
INSERT INTO `weather` VALUES ('108', '8535', '1', '1', '1', '1', '1', 'textures\\Weather\\RainDropRed01.blp');
