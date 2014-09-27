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
-- Table structure for table `lfgdungeongroup`
--

DROP TABLE IF EXISTS `lfgdungeongroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lfgdungeongroup` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `OrderIndex` int(10) NOT NULL DEFAULT '0',
  `ParentGroup` int(10) NOT NULL DEFAULT '0',
  `TypeId` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lfgdungeongroup`
--

LOCK TABLES `lfgdungeongroup` WRITE;
/*!40000 ALTER TABLE `lfgdungeongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `lfgdungeongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `lfgdungeongroup`
--

INSERT INTO `lfgdungeongroup` VALUES ('5', 'Wrath of the Lich King Heroic', 'Wrath of the Lich King  - mode héroïque', '1', '0', '5');
INSERT INTO `lfgdungeongroup` VALUES ('4', 'Wrath of the Lich King Normal', 'Wrath of the Lich King  - mode normal', '2', '0', '1');
INSERT INTO `lfgdungeongroup` VALUES ('3', 'Burning Crusade Heroic', 'The Burning Crusade - mode héroïque', '3', '0', '5');
INSERT INTO `lfgdungeongroup` VALUES ('2', 'Burning Crusade Normal', 'The Burning Crusade - mode normal', '4', '0', '1');
INSERT INTO `lfgdungeongroup` VALUES ('1', 'Classic Dungeons', 'Donjons classiques', '5', '0', '1');
INSERT INTO `lfgdungeongroup` VALUES ('9', 'Wrath of the Lich King Raid (25)', 'Raid de Wrath of the Lich King (25)', '17', '0', '2');
INSERT INTO `lfgdungeongroup` VALUES ('8', 'Wrath of the Lich King Raid (10)', 'Raid de Wrath of the Lich King (10)', '18', '0', '2');
INSERT INTO `lfgdungeongroup` VALUES ('7', 'Burning Crusade Raid', 'Raid de The Burning Crusade', '19', '0', '2');
INSERT INTO `lfgdungeongroup` VALUES ('6', 'Classic Raid', 'Raids classiques', '20', '0', '2');
INSERT INTO `lfgdungeongroup` VALUES ('11', 'World Events', 'Évènements mondiaux', '21', '0', '0');
