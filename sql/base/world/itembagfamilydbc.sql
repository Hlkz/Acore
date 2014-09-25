-- MySQL dump 10.13  Distrib 5.6.9-rc, for Win64 (x86_64)
--
-- Host: localhost    Database: world
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
-- Table structure for table `itembagfamilydbc`
--

DROP TABLE IF EXISTS `itembagfamilydbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itembagfamilydbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itembagfamilydbc`
--

LOCK TABLES `itembagfamilydbc` WRITE;
/*!40000 ALTER TABLE `itembagfamilydbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `itembagfamilydbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `itembagfamilydbc`
--

INSERT INTO `itembagfamilydbc` VALUES ('0', 'NONE', 'AUCUNE');
INSERT INTO `itembagfamilydbc` VALUES ('1', 'Arrows', 'Flèches');
INSERT INTO `itembagfamilydbc` VALUES ('2', 'Bullets', 'Balles');
INSERT INTO `itembagfamilydbc` VALUES ('3', 'Soul Shards', 'Fragments d\'âme');
INSERT INTO `itembagfamilydbc` VALUES ('4', 'Leatherworking Supplies', 'Fournitures de travail du cuir');
INSERT INTO `itembagfamilydbc` VALUES ('5', 'Inscription Supplies', 'Fournitures de calligraphie');
INSERT INTO `itembagfamilydbc` VALUES ('6', 'Herbs', 'Herbes');
INSERT INTO `itembagfamilydbc` VALUES ('7', 'Enchanting Supplies', 'Fournitures d\'enchanteur');
INSERT INTO `itembagfamilydbc` VALUES ('8', 'Engineering Supplies', 'Fournitures d\'ingénieur');
INSERT INTO `itembagfamilydbc` VALUES ('9', 'Keys', 'Clés');
INSERT INTO `itembagfamilydbc` VALUES ('10', 'Gems', 'Gemmes');
INSERT INTO `itembagfamilydbc` VALUES ('11', 'Mining Supplies', 'Fournitures de mineur');
INSERT INTO `itembagfamilydbc` VALUES ('12', 'Soulbound Equipment', 'Équipement lié');
INSERT INTO `itembagfamilydbc` VALUES ('13', 'Vanity Pets', 'Mascottes');
INSERT INTO `itembagfamilydbc` VALUES ('14', 'Currency Tokens', 'Monnaies');
INSERT INTO `itembagfamilydbc` VALUES ('15', 'Quest Items', 'Objets de quêtes');
