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
  `QualityMod` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
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

INSERT INTO `durabilityqualitydbc` VALUES ('1', '1');
INSERT INTO `durabilityqualitydbc` VALUES ('2', '0.6');
INSERT INTO `durabilityqualitydbc` VALUES ('3', '1');
INSERT INTO `durabilityqualitydbc` VALUES ('4', '0.8');
INSERT INTO `durabilityqualitydbc` VALUES ('5', '1');
INSERT INTO `durabilityqualitydbc` VALUES ('6', '1');
INSERT INTO `durabilityqualitydbc` VALUES ('7', '1.2');
INSERT INTO `durabilityqualitydbc` VALUES ('8', '1.25');
INSERT INTO `durabilityqualitydbc` VALUES ('9', '1.44');
INSERT INTO `durabilityqualitydbc` VALUES ('10', '2.5');
INSERT INTO `durabilityqualitydbc` VALUES ('11', '1.728');
INSERT INTO `durabilityqualitydbc` VALUES ('12', '3');
INSERT INTO `durabilityqualitydbc` VALUES ('13', '0');
INSERT INTO `durabilityqualitydbc` VALUES ('14', '0');
INSERT INTO `durabilityqualitydbc` VALUES ('15', '1.2');
INSERT INTO `durabilityqualitydbc` VALUES ('16', '1.25');
