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
-- Table structure for table `weaponswingsounds2`
--

DROP TABLE IF EXISTS `weaponswingsounds2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weaponswingsounds2` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Weight` int(10) NOT NULL DEFAULT '0',
  `Critical` int(10) NOT NULL DEFAULT '0',
  `Sound` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weaponswingsounds2`
--

LOCK TABLES `weaponswingsounds2` WRITE;
/*!40000 ALTER TABLE `weaponswingsounds2` DISABLE KEYS */;
/*!40000 ALTER TABLE `weaponswingsounds2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `weaponswingsounds2`
--

INSERT INTO `weaponswingsounds2` VALUES ('1', '0', '0', '233');
INSERT INTO `weaponswingsounds2` VALUES ('2', '0', '1', '234');
INSERT INTO `weaponswingsounds2` VALUES ('3', '1', '0', '235');
INSERT INTO `weaponswingsounds2` VALUES ('4', '1', '1', '236');
INSERT INTO `weaponswingsounds2` VALUES ('5', '2', '0', '237');
INSERT INTO `weaponswingsounds2` VALUES ('6', '2', '1', '238');
