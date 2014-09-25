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
-- Table structure for table `powerdisplaydbc`
--

DROP TABLE IF EXISTS `powerdisplaydbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `powerdisplaydbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `PowerType` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `R` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `G` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `B` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `powerdisplaydbc`
--

LOCK TABLES `powerdisplaydbc` WRITE;
/*!40000 ALTER TABLE `powerdisplaydbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `powerdisplaydbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `powerdisplaydbc`
--

INSERT INTO `powerdisplaydbc` VALUES ('1', '0', 'AMMOSLOT', '255', '128', '0');
INSERT INTO `powerdisplaydbc` VALUES ('41', '3', 'POWER_TYPE_PYRITE', '0', '202', '255');
INSERT INTO `powerdisplaydbc` VALUES ('61', '3', 'POWER_TYPE_STEAM', '242', '242', '242');
INSERT INTO `powerdisplaydbc` VALUES ('101', '3', 'POWER_TYPE_HEAT', '255', '125', '0');
INSERT INTO `powerdisplaydbc` VALUES ('121', '3', 'POWER_TYPE_OOZE', '193', '255', '0');
INSERT INTO `powerdisplaydbc` VALUES ('141', '3', 'POWER_TYPE_BLOOD_POWER', '188', '0', '255');
INSERT INTO `powerdisplaydbc` VALUES ('142', '3', 'POWER_TYPE_WRATH', '255', '176', '0');
