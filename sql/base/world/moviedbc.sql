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
-- Table structure for table `moviedbc`
--

DROP TABLE IF EXISTS `moviedbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moviedbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Filename` varchar(100) NOT NULL DEFAULT '0',
  `Unk` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moviedbc`
--

LOCK TABLES `moviedbc` WRITE;
/*!40000 ALTER TABLE `moviedbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `moviedbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `moviedbc`
--

INSERT INTO `moviedbc` VALUES ('1', 'Interface\\Cinematics\\Logo', '100');
INSERT INTO `moviedbc` VALUES ('2', 'Interface\\Cinematics\\WOW_Intro', '100');
INSERT INTO `moviedbc` VALUES ('14', '', '100');
INSERT INTO `moviedbc` VALUES ('16', '', '100');
