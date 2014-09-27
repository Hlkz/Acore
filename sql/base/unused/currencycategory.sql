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
-- Table structure for table `currencycategory`
--

DROP TABLE IF EXISTS `currencycategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencycategory` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencycategory`
--

LOCK TABLES `currencycategory` WRITE;
/*!40000 ALTER TABLE `currencycategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencycategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `currencycategory`
--

INSERT INTO `currencycategory` VALUES ('1', '0', 'Miscellaneous', 'Divers');
INSERT INTO `currencycategory` VALUES ('2', '0', 'Player vs. Player', 'JcJ');
INSERT INTO `currencycategory` VALUES ('4', '0', 'Classic', 'Classique');
INSERT INTO `currencycategory` VALUES ('21', '0', 'Wrath of the Lich King', 'Wrath of the Lich King');
INSERT INTO `currencycategory` VALUES ('22', '0', 'Dungeon and Raid', 'Raid');
INSERT INTO `currencycategory` VALUES ('23', '0', 'Burning Crusade', 'Burning Crusade');
INSERT INTO `currencycategory` VALUES ('41', '0', 'Test', 'Test');
INSERT INTO `currencycategory` VALUES ('3', '3', 'Unused', 'Inutilisées');
