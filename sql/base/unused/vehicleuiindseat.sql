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
-- Table structure for table `vehicleuiindseat`
--

DROP TABLE IF EXISTS `vehicleuiindseat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicleuiindseat` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `VehicleUIIndicator` int(10) NOT NULL DEFAULT '0',
  `VirtualSeatIndex` int(10) NOT NULL DEFAULT '0',
  `X` float NOT NULL DEFAULT '0',
  `Y` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicleuiindseat`
--

LOCK TABLES `vehicleuiindseat` WRITE;
/*!40000 ALTER TABLE `vehicleuiindseat` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicleuiindseat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `vehicleuiindseat`
--

INSERT INTO `vehicleuiindseat` VALUES ('221', '221', '1', '0.504', '0.778');
INSERT INTO `vehicleuiindseat` VALUES ('222', '221', '2', '0.693', '0.293');
INSERT INTO `vehicleuiindseat` VALUES ('223', '222', '1', '0.5', '0.802');
INSERT INTO `vehicleuiindseat` VALUES ('224', '222', '2', '0.705', '0.347');
INSERT INTO `vehicleuiindseat` VALUES ('225', '222', '3', '0.307', '0.345');
INSERT INTO `vehicleuiindseat` VALUES ('226', '223', '1', '0.501', '0.14');
INSERT INTO `vehicleuiindseat` VALUES ('227', '223', '2', '0.698', '0.799');
INSERT INTO `vehicleuiindseat` VALUES ('228', '223', '3', '0.303', '0.799');
INSERT INTO `vehicleuiindseat` VALUES ('229', '223', '4', '0.5', '0.578');
INSERT INTO `vehicleuiindseat` VALUES ('230', '224', '1', '0.653', '0.712');
INSERT INTO `vehicleuiindseat` VALUES ('231', '225', '1', '0.348', '0.76');
INSERT INTO `vehicleuiindseat` VALUES ('232', '225', '2', '0.652', '0.76');
INSERT INTO `vehicleuiindseat` VALUES ('233', '226', '1', '0.508', '0.681');
INSERT INTO `vehicleuiindseat` VALUES ('234', '226', '2', '0.663', '0.71');
INSERT INTO `vehicleuiindseat` VALUES ('235', '227', '1', '0.5', '0.229');
INSERT INTO `vehicleuiindseat` VALUES ('236', '227', '4', '0.5', '0.601');
INSERT INTO `vehicleuiindseat` VALUES ('237', '228', '1', '0.505', '0.387');
INSERT INTO `vehicleuiindseat` VALUES ('238', '228', '2', '0.505', '0.563');
INSERT INTO `vehicleuiindseat` VALUES ('242', '249', '1', '0.5', '0.55');
