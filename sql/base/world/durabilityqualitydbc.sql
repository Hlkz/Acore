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
-- Table structure for table `durabilityqualitydbc`
--

DROP TABLE IF EXISTS `durabilityqualitydbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `durabilityqualitydbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `QualityMod` float DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ID` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `durabilityqualitydbc`
--

LOCK TABLES `durabilityqualitydbc` WRITE;
/*!40000 ALTER TABLE `durabilityqualitydbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `durabilityqualitydbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `durabilityqualitydbc`
--

INSERT INTO `durabilityqualitydbc` VALUES ('1', '1065350000');
INSERT INTO `durabilityqualitydbc` VALUES ('2', '1058640000');
INSERT INTO `durabilityqualitydbc` VALUES ('3', '1065350000');
INSERT INTO `durabilityqualitydbc` VALUES ('4', '1062000000');
INSERT INTO `durabilityqualitydbc` VALUES ('5', '1065350000');
INSERT INTO `durabilityqualitydbc` VALUES ('6', '1065350000');
INSERT INTO `durabilityqualitydbc` VALUES ('7', '1067030000');
INSERT INTO `durabilityqualitydbc` VALUES ('8', '1067450000');
INSERT INTO `durabilityqualitydbc` VALUES ('9', '1069040000');
INSERT INTO `durabilityqualitydbc` VALUES ('10', '1075840000');
INSERT INTO `durabilityqualitydbc` VALUES ('11', '1071460000');
INSERT INTO `durabilityqualitydbc` VALUES ('12', '1077940000');
INSERT INTO `durabilityqualitydbc` VALUES ('13', '0');
INSERT INTO `durabilityqualitydbc` VALUES ('14', '0');
INSERT INTO `durabilityqualitydbc` VALUES ('15', '1067030000');
INSERT INTO `durabilityqualitydbc` VALUES ('16', '1067450000');
