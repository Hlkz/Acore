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
-- Table structure for table `auctionhousedbc`
--

DROP TABLE IF EXISTS `auctionhousedbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auctionhousedbc` (
  `HouseId` int(10) NOT NULL DEFAULT '0',
  `Faction` int(10) NOT NULL DEFAULT '0',
  `DepositPercent` int(10) NOT NULL DEFAULT '0',
  `CutPercent` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`HouseId`),
  UNIQUE KEY `ID` (`HouseId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctionhousedbc`
--

LOCK TABLES `auctionhousedbc` WRITE;
/*!40000 ALTER TABLE `auctionhousedbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `auctionhousedbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `auctionhousedbc`
--

INSERT INTO `auctionhousedbc` VALUES ('1', '1', '5', '5', 'Stormwind Auction House', 'Hôtel des ventes de Hurlevent');
INSERT INTO `auctionhousedbc` VALUES ('2', '3', '5', '5', 'Alliance Auction House', 'Hôtel des ventes de l\'Alliance');
INSERT INTO `auctionhousedbc` VALUES ('3', '4', '5', '5', 'Darnassus Auction House', 'Hôtel des ventes de Darnassus');
INSERT INTO `auctionhousedbc` VALUES ('4', '5', '5', '5', 'Undercity Auction House', 'Hôtel des ventes de Fossoyeuse');
INSERT INTO `auctionhousedbc` VALUES ('5', '6', '5', '5', 'Thunder Bluff  Auction House', 'Hôtel des ventes des Pitons du Tonnerre');
INSERT INTO `auctionhousedbc` VALUES ('6', '2', '5', '5', 'Horde Auction House', 'Hôtel des ventes de la Horde');
INSERT INTO `auctionhousedbc` VALUES ('7', '369', '25', '15', 'Blackwater Auction House', 'Hôtel des ventes des Flots noirs');
