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
-- Table structure for table `attackanimkits`
--

DROP TABLE IF EXISTS `attackanimkits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attackanimkits` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Animation` int(10) NOT NULL DEFAULT '0',
  `Type` int(10) NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  `Unknown` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attackanimkits`
--

LOCK TABLES `attackanimkits` WRITE;
/*!40000 ALTER TABLE `attackanimkits` DISABLE KEYS */;
/*!40000 ALTER TABLE `attackanimkits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `attackanimkits`
--

INSERT INTO `attackanimkits` VALUES ('1', '0', '1', '1', '0');
INSERT INTO `attackanimkits` VALUES ('2', '1', '5', '1', '0');
INSERT INTO `attackanimkits` VALUES ('3', '4', '1', '1', '0');
INSERT INTO `attackanimkits` VALUES ('4', '5', '5', '1', '0');
INSERT INTO `attackanimkits` VALUES ('5', '6', '3', '1', '0');
INSERT INTO `attackanimkits` VALUES ('6', '6', '4', '1', '0');
INSERT INTO `attackanimkits` VALUES ('7', '7', '1', '4', '0');
INSERT INTO `attackanimkits` VALUES ('8', '7', '2', '1', '0');
INSERT INTO `attackanimkits` VALUES ('9', '8', '5', '1', '0');
INSERT INTO `attackanimkits` VALUES ('10', '10', '4', '4', '0');
INSERT INTO `attackanimkits` VALUES ('11', '11', '1', '1', '0');
INSERT INTO `attackanimkits` VALUES ('12', '11', '2', '1', '0');
INSERT INTO `attackanimkits` VALUES ('13', '12', '5', '2', '0');
INSERT INTO `attackanimkits` VALUES ('14', '0', '7', '1', '1');
INSERT INTO `attackanimkits` VALUES ('15', '4', '7', '1', '1');
INSERT INTO `attackanimkits` VALUES ('16', '7', '7', '1', '1');
INSERT INTO `attackanimkits` VALUES ('17', '11', '7', '1', '1');
INSERT INTO `attackanimkits` VALUES ('18', '11', '8', '1', '1');
INSERT INTO `attackanimkits` VALUES ('19', '7', '8', '4', '1');
INSERT INTO `attackanimkits` VALUES ('21', '10', '3', '1', '0');
INSERT INTO `attackanimkits` VALUES ('22', '15', '2', '1', '0');
INSERT INTO `attackanimkits` VALUES ('23', '15', '8', '1', '1');
INSERT INTO `attackanimkits` VALUES ('24', '15', '1', '1', '0');
INSERT INTO `attackanimkits` VALUES ('25', '15', '7', '1', '1');
INSERT INTO `attackanimkits` VALUES ('26', '14', '1', '1', '0');
INSERT INTO `attackanimkits` VALUES ('27', '14', '7', '1', '1');
