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
-- Table structure for table `itempetfood`
--

DROP TABLE IF EXISTS `itempetfood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itempetfood` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itempetfood`
--

LOCK TABLES `itempetfood` WRITE;
/*!40000 ALTER TABLE `itempetfood` DISABLE KEYS */;
/*!40000 ALTER TABLE `itempetfood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `itempetfood`
--

INSERT INTO `itempetfood` VALUES ('1', 'Meat', 'Viande');
INSERT INTO `itempetfood` VALUES ('2', 'Fish', 'Poisson');
INSERT INTO `itempetfood` VALUES ('3', 'Cheese', 'Fromage');
INSERT INTO `itempetfood` VALUES ('4', 'Bread', 'Pain');
INSERT INTO `itempetfood` VALUES ('5', 'Fungus', 'Champignon');
INSERT INTO `itempetfood` VALUES ('6', 'Fruit', 'Fruit');
INSERT INTO `itempetfood` VALUES ('7', 'Raw Meat', 'Viande crue');
INSERT INTO `itempetfood` VALUES ('8', 'Raw Fish', 'Poisson cru');
