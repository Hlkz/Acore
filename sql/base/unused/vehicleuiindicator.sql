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
-- Table structure for table `vehicleuiindicator`
--

DROP TABLE IF EXISTS `vehicleuiindicator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicleuiindicator` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Texture` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicleuiindicator`
--

LOCK TABLES `vehicleuiindicator` WRITE;
/*!40000 ALTER TABLE `vehicleuiindicator` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicleuiindicator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `vehicleuiindicator`
--

INSERT INTO `vehicleuiindicator` VALUES ('221', 'Interface\\Vehicles\\SeatIndicator\\Vehicle-Demolisher.blp');
INSERT INTO `vehicleuiindicator` VALUES ('222', 'Interface\\Vehicles\\SeatIndicator\\Vehicle-Demolisher.blp');
INSERT INTO `vehicleuiindicator` VALUES ('223', 'Interface\\Vehicles\\SeatIndicator\\Vehicle-SiegeEngine.blp');
INSERT INTO `vehicleuiindicator` VALUES ('224', 'Interface\\Vehicles\\SeatIndicator\\vehicle-motorcycle.blp');
INSERT INTO `vehicleuiindicator` VALUES ('225', 'Interface\\Vehicles\\SeatIndicator\\vehicle-mammoth.blp');
INSERT INTO `vehicleuiindicator` VALUES ('226', 'Interface\\Vehicles\\SeatIndicator\\vehicle-motorcycle.blp');
INSERT INTO `vehicleuiindicator` VALUES ('227', 'Interface\\Vehicles\\SeatIndicator\\Vehicle-SiegeEngine.blp');
INSERT INTO `vehicleuiindicator` VALUES ('228', 'Interface\\Vehicles\\SeatIndicator\\Vehicle-Bomber.blp');
INSERT INTO `vehicleuiindicator` VALUES ('249', 'Interface\\Vehicles\\SeatIndicator\\vehicle-rocket.blp');
