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
-- Table structure for table `questinfo`
--

DROP TABLE IF EXISTS `questinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questinfo` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questinfo`
--

LOCK TABLES `questinfo` WRITE;
/*!40000 ALTER TABLE `questinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `questinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `questinfo`
--

INSERT INTO `questinfo` VALUES ('1', 'Group', 'Groupe');
INSERT INTO `questinfo` VALUES ('21', 'Life', 'Vie');
INSERT INTO `questinfo` VALUES ('41', 'PvP', 'JcJ');
INSERT INTO `questinfo` VALUES ('62', 'Raid', 'Raid');
INSERT INTO `questinfo` VALUES ('81', 'Dungeon', 'Donjon');
INSERT INTO `questinfo` VALUES ('82', 'World Event', 'Évènement mondial');
INSERT INTO `questinfo` VALUES ('83', 'Legendary', 'Légendaire');
INSERT INTO `questinfo` VALUES ('84', 'Escort', 'Escorte');
INSERT INTO `questinfo` VALUES ('85', 'Heroic', 'Héroïque');
INSERT INTO `questinfo` VALUES ('88', 'Raid (10)', 'Raid (10)');
INSERT INTO `questinfo` VALUES ('89', 'Raid (25)', 'Raid (25)');
