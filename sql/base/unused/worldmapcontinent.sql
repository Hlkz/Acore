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
-- Table structure for table `worldmapcontinent`
--

DROP TABLE IF EXISTS `worldmapcontinent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worldmapcontinent` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Map` int(10) NOT NULL DEFAULT '0',
  `LeftBoundary` int(10) NOT NULL DEFAULT '0',
  `RightBoundary` int(10) NOT NULL DEFAULT '0',
  `TopBoundary` int(10) NOT NULL DEFAULT '0',
  `BottomBoundary` int(10) NOT NULL DEFAULT '0',
  `ContinentOffsetX` float NOT NULL DEFAULT '0',
  `ContinentOffsetY` float NOT NULL DEFAULT '0',
  `Scale` float NOT NULL DEFAULT '0',
  `TaxiMinX` float NOT NULL DEFAULT '0',
  `TaxiMinY` float NOT NULL DEFAULT '0',
  `TaxiMaxX` float NOT NULL DEFAULT '0',
  `TaxiMaxY` float NOT NULL DEFAULT '0',
  `WorldMap` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worldmapcontinent`
--

LOCK TABLES `worldmapcontinent` WRITE;
/*!40000 ALTER TABLE `worldmapcontinent` DISABLE KEYS */;
/*!40000 ALTER TABLE `worldmapcontinent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `worldmapcontinent`
--

INSERT INTO `worldmapcontinent` VALUES ('1', '0', '26', '44', '8', '60', '16.875', '-1.5', '0.7', '-16530', '-16530', '12270', '12270', '1');
INSERT INTO `worldmapcontinent` VALUES ('2', '1', '16', '46', '9', '52', '-20.1875', '3.3125', '0.7', '-11870', '-13370', '12470', '10970', '1');
INSERT INTO `worldmapcontinent` VALUES ('3', '530', '23', '47', '15', '61', '14.5', '-7', '0.75', '-5867', '-1600', '6400', '10670', '0');
INSERT INTO `worldmapcontinent` VALUES ('4', '571', '16', '45', '12', '33', '1.8125', '-6.375', '0.7', '-3733', '-6933', '11730', '8533', '1');
