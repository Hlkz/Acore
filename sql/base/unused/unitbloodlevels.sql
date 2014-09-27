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
-- Table structure for table `unitbloodlevels`
--

DROP TABLE IF EXISTS `unitbloodlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unitbloodlevels` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `ViolenceLevel1` int(10) NOT NULL DEFAULT '0',
  `ViolenceLevel2` int(10) NOT NULL DEFAULT '0',
  `ViolenceLevel3` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitbloodlevels`
--

LOCK TABLES `unitbloodlevels` WRITE;
/*!40000 ALTER TABLE `unitbloodlevels` DISABLE KEYS */;
/*!40000 ALTER TABLE `unitbloodlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `unitbloodlevels`
--

INSERT INTO `unitbloodlevels` VALUES ('1', '0', '2', '1');
INSERT INTO `unitbloodlevels` VALUES ('2', '0', '2', '2');
INSERT INTO `unitbloodlevels` VALUES ('3', '0', '3', '3');
INSERT INTO `unitbloodlevels` VALUES ('4', '0', '4', '4');
