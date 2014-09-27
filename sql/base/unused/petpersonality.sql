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
-- Table structure for table `petpersonality`
--

DROP TABLE IF EXISTS `petpersonality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petpersonality` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `UnhappyLevel` int(10) NOT NULL DEFAULT '0',
  `ContentLevel` int(10) NOT NULL DEFAULT '0',
  `HappyLevel` int(10) NOT NULL DEFAULT '0',
  `UnhappyDamageModifier` float NOT NULL DEFAULT '0',
  `ContentDamageModifier` float NOT NULL DEFAULT '0',
  `HappyDamageModifier` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petpersonality`
--

LOCK TABLES `petpersonality` WRITE;
/*!40000 ALTER TABLE `petpersonality` DISABLE KEYS */;
/*!40000 ALTER TABLE `petpersonality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `petpersonality`
--

INSERT INTO `petpersonality` VALUES ('1', 'Personality: Standard', 'Personnalité : standard', '0', '333000', '666000', '0.75', '1', '1.25');
INSERT INTO `petpersonality` VALUES ('3', 'zzOLDOrnery', 'zzOLDOrnery', '0', '250000', '750000', '0', '1', '1.25');
