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
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `languages`
--

INSERT INTO `languages` VALUES ('1', 'Orcish', 'Orc');
INSERT INTO `languages` VALUES ('2', 'Darnassian', 'Darnassien');
INSERT INTO `languages` VALUES ('3', 'Taurahe', 'Taurahe');
INSERT INTO `languages` VALUES ('6', 'Dwarvish', 'Nain');
INSERT INTO `languages` VALUES ('7', 'Common', 'Commun');
INSERT INTO `languages` VALUES ('8', 'Demonic', 'Démoniaque');
INSERT INTO `languages` VALUES ('9', 'Titan', 'Titan');
INSERT INTO `languages` VALUES ('10', 'Thalassian', 'Thalassien');
INSERT INTO `languages` VALUES ('11', 'Draconic', 'Draconique');
INSERT INTO `languages` VALUES ('12', 'Kalimag', 'Kalimag');
INSERT INTO `languages` VALUES ('13', 'Gnomish', 'Gnome');
INSERT INTO `languages` VALUES ('14', 'Troll', 'Troll');
INSERT INTO `languages` VALUES ('33', 'Gutterspeak', 'Bas-parler');
INSERT INTO `languages` VALUES ('35', 'Draenei', 'Draeneï');
INSERT INTO `languages` VALUES ('36', 'Zombie', 'Zombie');
INSERT INTO `languages` VALUES ('37', 'Gnomish Binary', 'Binaire gnome');
INSERT INTO `languages` VALUES ('38', 'Goblin Binary', 'Binaire gobelin');
