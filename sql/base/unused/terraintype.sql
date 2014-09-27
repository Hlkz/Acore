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
-- Table structure for table `terraintype`
--

DROP TABLE IF EXISTS `terraintype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terraintype` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Description` varchar(100) NOT NULL DEFAULT '',
  `FootstepSprayRun` int(10) NOT NULL DEFAULT '0',
  `FootstepSprayWalk` int(10) NOT NULL DEFAULT '0',
  `Sound` int(10) NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terraintype`
--

LOCK TABLES `terraintype` WRITE;
/*!40000 ALTER TABLE `terraintype` DISABLE KEYS */;
/*!40000 ALTER TABLE `terraintype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `terraintype`
--

INSERT INTO `terraintype` VALUES ('0', 'Dirt', '0', '0', '1', '0');
INSERT INTO `terraintype` VALUES ('1', 'Metallic', '0', '0', '2', '0');
INSERT INTO `terraintype` VALUES ('2', 'Stone', '0', '0', '3', '0');
INSERT INTO `terraintype` VALUES ('3', 'Snow', '11', '12', '4', '1');
INSERT INTO `terraintype` VALUES ('4', 'Wood', '0', '0', '5', '0');
INSERT INTO `terraintype` VALUES ('5', 'Grass', '0', '0', '6', '0');
INSERT INTO `terraintype` VALUES ('6', 'Leaves', '0', '0', '7', '0');
INSERT INTO `terraintype` VALUES ('7', 'Sand', '0', '0', '8', '1');
INSERT INTO `terraintype` VALUES ('8', 'Soggy', '0', '0', '9', '0');
INSERT INTO `terraintype` VALUES ('9', 'DustyGrass', '0', '0', '6', '0');
INSERT INTO `terraintype` VALUES ('10', 'None', '0', '0', '0', '0');
INSERT INTO `terraintype` VALUES ('11', 'Water', '0', '0', '10', '0');
