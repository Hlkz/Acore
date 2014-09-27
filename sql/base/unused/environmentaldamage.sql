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
-- Table structure for table `environmentaldamage`
--

DROP TABLE IF EXISTS `environmentaldamage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `environmentaldamage` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `EnumId` int(10) NOT NULL DEFAULT '0',
  `SpellVisual` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `environmentaldamage`
--

LOCK TABLES `environmentaldamage` WRITE;
/*!40000 ALTER TABLE `environmentaldamage` DISABLE KEYS */;
/*!40000 ALTER TABLE `environmentaldamage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `environmentaldamage`
--

INSERT INTO `environmentaldamage` VALUES ('1', '0', '871');
INSERT INTO `environmentaldamage` VALUES ('2', '1', '870');
INSERT INTO `environmentaldamage` VALUES ('3', '2', '1066');
INSERT INTO `environmentaldamage` VALUES ('4', '3', '1064');
INSERT INTO `environmentaldamage` VALUES ('5', '4', '1065');
INSERT INTO `environmentaldamage` VALUES ('6', '5', '1067');
