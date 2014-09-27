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
-- Table structure for table `objecteffectmodifier`
--

DROP TABLE IF EXISTS `objecteffectmodifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objecteffectmodifier` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `InputType` int(10) NOT NULL DEFAULT '0',
  `MapType` int(10) NOT NULL DEFAULT '0',
  `OutputType` int(10) NOT NULL DEFAULT '0',
  `Param1` float NOT NULL DEFAULT '0',
  `Param2` float NOT NULL DEFAULT '0',
  `Param3` float NOT NULL DEFAULT '0',
  `Param4` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objecteffectmodifier`
--

LOCK TABLES `objecteffectmodifier` WRITE;
/*!40000 ALTER TABLE `objecteffectmodifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `objecteffectmodifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `objecteffectmodifier`
--

INSERT INTO `objecteffectmodifier` VALUES ('65', '1', '1', '1', '5', '30', '0.7', '1.3');
INSERT INTO `objecteffectmodifier` VALUES ('121', '1', '1', '1', '5', '30', '0.7', '1.3');
INSERT INTO `objecteffectmodifier` VALUES ('123', '1', '1', '1', '5', '30', '1', '1.3');
INSERT INTO `objecteffectmodifier` VALUES ('124', '1', '1', '1', '5', '30', '0.7', '1.3');
INSERT INTO `objecteffectmodifier` VALUES ('141', '1', '1', '1', '5', '30', '0.7', '1.3');
INSERT INTO `objecteffectmodifier` VALUES ('161', '1', '1', '1', '5', '30', '0.7', '1.3');
INSERT INTO `objecteffectmodifier` VALUES ('181', '1', '1', '1', '5', '30', '0.7', '1.3');
INSERT INTO `objecteffectmodifier` VALUES ('182', '1', '1', '1', '5', '30', '0.7', '1.3');
INSERT INTO `objecteffectmodifier` VALUES ('184', '1', '1', '1', '5', '30', '0.7', '1.3');
INSERT INTO `objecteffectmodifier` VALUES ('201', '1', '1', '1', '5', '30', '0.7', '1.3');
INSERT INTO `objecteffectmodifier` VALUES ('202', '1', '1', '1', '5', '30', '0.7', '1.3');
