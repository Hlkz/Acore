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
-- Table structure for table `worldmaptransforms`
--

DROP TABLE IF EXISTS `worldmaptransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worldmaptransforms` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Map` int(10) NOT NULL DEFAULT '0',
  `RegionMinX` float NOT NULL DEFAULT '0',
  `RegionMinY` float NOT NULL DEFAULT '0',
  `RegionMaxX` float NOT NULL DEFAULT '0',
  `RegionMaxY` float NOT NULL DEFAULT '0',
  `DestinationMap` int(10) NOT NULL DEFAULT '0',
  `RegionOffsetX` float NOT NULL DEFAULT '0',
  `RegionOffsetY` float NOT NULL DEFAULT '0',
  `DestinationArea` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worldmaptransforms`
--

LOCK TABLES `worldmaptransforms` WRITE;
/*!40000 ALTER TABLE `worldmaptransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `worldmaptransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `worldmaptransforms`
--

INSERT INTO `worldmaptransforms` VALUES ('2', '530', '4800', '-10133.3', '16000', '-2666.67', '0', '-2400', '2400', '0');
INSERT INTO `worldmaptransforms` VALUES ('3', '530', '-6933.33', '-16000', '533.333', '-8000', '1', '10133.3', '17600', '0');
INSERT INTO `worldmaptransforms` VALUES ('4', '600', '-20000', '-20000', '20000', '20000', '600', '0', '0', '37');
INSERT INTO `worldmaptransforms` VALUES ('5', '603', '2113', '-220', '2530', '1336', '603', '0', '0', '70');
INSERT INTO `worldmaptransforms` VALUES ('6', '619', '-20000', '-20000', '20000', '20000', '619', '0', '0', '50');
INSERT INTO `worldmaptransforms` VALUES ('7', '603', '1940', '1335', '2530', '2718', '603', '0', '0', '72');
INSERT INTO `worldmaptransforms` VALUES ('8', '602', '1408', '10', '1454', '67', '602', '0', '0', '54');
INSERT INTO `worldmaptransforms` VALUES ('9', '616', '-20000', '-20000', '20000', '20000', '616', '0', '0', '61');
INSERT INTO `worldmaptransforms` VALUES ('10', '631', '-20000', '-20000', '20000', '20000', '631', '0', '0', '104');
