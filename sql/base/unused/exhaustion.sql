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
-- Table structure for table `exhaustion`
--

DROP TABLE IF EXISTS `exhaustion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exhaustion` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Xp` int(10) NOT NULL DEFAULT '0',
  `Factor` float NOT NULL DEFAULT '0',
  `OutdoorHours` float NOT NULL DEFAULT '0',
  `InnHours` float NOT NULL DEFAULT '0',
  `Name` int(10) NOT NULL DEFAULT '0',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `Threshold` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhaustion`
--

LOCK TABLES `exhaustion` WRITE;
/*!40000 ALTER TABLE `exhaustion` DISABLE KEYS */;
/*!40000 ALTER TABLE `exhaustion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `exhaustion`
--

INSERT INTO `exhaustion` VALUES ('1', '10000', '2', '-1', '8', '0', 'En forme', '1094713344');
INSERT INTO `exhaustion` VALUES ('2', '13333', '1', '-1', '6', '0', 'Normal', '0');
INSERT INTO `exhaustion` VALUES ('3', '20000', '1', '8', '4', '0', 'XXXFatigué', '0');
INSERT INTO `exhaustion` VALUES ('4', '40000', '0.5', '4', '2', '0', 'XXXFatigué', '0');
INSERT INTO `exhaustion` VALUES ('5', '-1', '0.25', '0', '0', '0', 'XXXEpuisé', '0');
INSERT INTO `exhaustion` VALUES ('6', '10000', '2', '-1', '0', '0', 'Parrainez un ami', '0');
