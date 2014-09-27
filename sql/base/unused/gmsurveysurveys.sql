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
-- Table structure for table `gmsurveysurveys`
--

DROP TABLE IF EXISTS `gmsurveysurveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gmsurveysurveys` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `RefId1` int(10) NOT NULL DEFAULT '0',
  `RefId2` int(10) NOT NULL DEFAULT '0',
  `RefId3` int(10) NOT NULL DEFAULT '0',
  `RefId4` int(10) NOT NULL DEFAULT '0',
  `RefId5` int(10) NOT NULL DEFAULT '0',
  `RefId6` int(10) NOT NULL DEFAULT '0',
  `RefId7` int(10) NOT NULL DEFAULT '0',
  `RefId8` int(10) NOT NULL DEFAULT '0',
  `RefId9` int(10) NOT NULL DEFAULT '0',
  `RefId10` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gmsurveysurveys`
--

LOCK TABLES `gmsurveysurveys` WRITE;
/*!40000 ALTER TABLE `gmsurveysurveys` DISABLE KEYS */;
/*!40000 ALTER TABLE `gmsurveysurveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `gmsurveysurveys`
--

INSERT INTO `gmsurveysurveys` VALUES ('6', '28', '29', '30', '31', '32', '0', '0', '0', '0', '0');
INSERT INTO `gmsurveysurveys` VALUES ('9', '35', '36', '37', '38', '39', '40', '41', '0', '0', '0');
