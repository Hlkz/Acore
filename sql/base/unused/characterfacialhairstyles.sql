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
-- Table structure for table `characterfacialhairstyles`
--

DROP TABLE IF EXISTS `characterfacialhairstyles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characterfacialhairstyles` (
  `Race` int(10) NOT NULL DEFAULT '0',
  `Gender` int(10) NOT NULL DEFAULT '0',
  `SpecificId` int(10) NOT NULL DEFAULT '0',
  `GeosetId1` int(10) NOT NULL DEFAULT '0',
  `GeosetId2` int(10) NOT NULL DEFAULT '0',
  `GeosetId3` int(10) NOT NULL DEFAULT '0',
  `GeosetId4` int(10) NOT NULL DEFAULT '0',
  `GeosetId5` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Race`,`Gender`,`SpecificId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characterfacialhairstyles`
--

LOCK TABLES `characterfacialhairstyles` WRITE;
/*!40000 ALTER TABLE `characterfacialhairstyles` DISABLE KEYS */;
/*!40000 ALTER TABLE `characterfacialhairstyles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `characterfacialhairstyles`
--

INSERT INTO `characterfacialhairstyles` VALUES ('1', '0', '1', '1', '2', '1', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('1', '0', '2', '1', '2', '1', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('1', '0', '3', '2', '1', '2', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('1', '0', '4', '2', '2', '2', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('1', '0', '5', '1', '2', '2', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('1', '0', '6', '2', '2', '1', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('1', '0', '7', '1', '2', '1', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '0', '0', '2', '2', '2', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('6', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('6', '0', '1', '2', '2', '2', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('6', '0', '2', '3', '3', '3', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '0', '1', '3', '3', '3', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '0', '2', '4', '4', '4', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '0', '3', '5', '5', '5', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '0', '4', '6', '6', '6', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '0', '0', '1', '1', '1', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '0', '1', '2', '2', '2', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '0', '2', '3', '3', '3', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '0', '3', '4', '4', '4', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '0', '4', '5', '5', '5', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '0', '5', '6', '6', '2', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '1', '0', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('6', '0', '3', '4', '4', '4', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('6', '0', '4', '5', '5', '5', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('6', '0', '5', '6', '6', '6', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('1', '0', '8', '1', '1', '1', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '0', '5', '7', '7', '7', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '0', '6', '8', '8', '8', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '0', '7', '9', '9', '9', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '0', '8', '10', '10', '10', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '0', '9', '11', '11', '11', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '0', '10', '12', '12', '12', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '0', '2', '2', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '0', '3', '3', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '0', '4', '4', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '0', '5', '5', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '0', '6', '6', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '0', '7', '7', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '0', '8', '8', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '0', '9', '9', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '0', '10', '10', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '1', '1', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '1', '2', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '1', '3', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '1', '4', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '1', '5', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '1', '6', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '1', '7', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '1', '8', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('4', '1', '9', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('6', '0', '6', '7', '7', '7', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('7', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '0', '2', '0', '4', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('7', '0', '1', '2', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('7', '0', '2', '3', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('7', '0', '3', '4', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('7', '0', '4', '5', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('7', '0', '5', '6', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('7', '0', '6', '7', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('7', '0', '7', '8', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('7', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('1', '0', '0', '1', '1', '1', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '1', '2', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '1', '5', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('1', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '1', '0', '0', '2', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '1', '1', '0', '3', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '1', '2', '0', '4', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '1', '3', '0', '5', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '1', '4', '0', '6', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '1', '0', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '1', '1', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '1', '3', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '1', '4', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '1', '6', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '1', '7', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '0', '2', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '1', '2', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '2', '2', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '3', '3', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '4', '4', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '5', '2', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '6', '3', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '7', '4', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '8', '2', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '9', '3', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '10', '2', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '11', '3', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '12', '2', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '13', '3', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '14', '2', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '15', '3', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('5', '0', '16', '4', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('1', '1', '1', '0', '2', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('1', '1', '2', '0', '3', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('1', '1', '3', '0', '4', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('1', '1', '4', '0', '5', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('1', '1', '5', '0', '6', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('1', '1', '6', '0', '7', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '1', '1', '0', '2', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '1', '2', '0', '3', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '1', '3', '0', '4', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '1', '4', '0', '5', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '1', '5', '0', '6', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('2', '1', '6', '0', '7', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('6', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('6', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('6', '1', '2', '0', '0', '3', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('6', '1', '3', '0', '0', '4', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '0', '1', '0', '3', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('18', '0', '3', '0', '5', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '0', '4', '0', '6', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '1', '1', '0', '2', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '1', '2', '0', '3', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '1', '3', '0', '4', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '1', '4', '0', '5', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('3', '1', '5', '0', '6', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('6', '1', '4', '0', '0', '5', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('7', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('7', '1', '6', '0', '0', '7', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('7', '1', '2', '0', '0', '3', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('7', '1', '5', '0', '0', '6', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('7', '1', '4', '0', '0', '5', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('7', '1', '3', '0', '0', '4', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '0', '5', '0', '2', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '0', '6', '0', '3', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '0', '7', '0', '4', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '0', '8', '0', '5', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '0', '9', '0', '6', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '0', '10', '0', '4', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '1', '5', '0', '7', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '1', '0', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('11', '0', '4', '5', '0', '4', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('11', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('11', '0', '1', '2', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('11', '0', '2', '3', '0', '2', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('12', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('12', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('11', '0', '3', '4', '0', '3', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('11', '0', '5', '6', '0', '5', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('11', '0', '6', '7', '0', '6', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('11', '0', '7', '8', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('11', '1', '2', '4', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('11', '1', '3', '5', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('11', '1', '4', '6', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('11', '1', '5', '7', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('11', '1', '6', '8', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('13', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('13', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('14', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('15', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('15', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('11', '1', '1', '3', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('11', '1', '0', '2', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '0', '0', '0', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '1', '2', '0', '3', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '1', '3', '0', '4', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '1', '4', '0', '5', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '1', '5', '0', '6', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '1', '6', '0', '7', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '1', '7', '0', '8', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '1', '8', '0', '9', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '1', '9', '0', '10', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '1', '10', '0', '11', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '0', '1', '2', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '0', '2', '3', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '0', '3', '4', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '0', '4', '5', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '0', '5', '6', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '0', '6', '7', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '0', '7', '8', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '0', '8', '9', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '0', '9', '10', '0', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('10', '1', '1', '0', '2', '0', '0', '2');
INSERT INTO `characterfacialhairstyles` VALUES ('16', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('16', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('17', '0', '6', '8', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('17', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('16', '0', '1', '2', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('16', '0', '2', '3', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('16', '0', '3', '4', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('16', '0', '4', '5', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('16', '0', '5', '6', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('18', '1', '0', '0', '0', '0', '-858993460', '-858993460');
INSERT INTO `characterfacialhairstyles` VALUES ('18', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('18', '0', '10', '0', '4', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('18', '0', '1', '0', '3', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('18', '0', '2', '0', '4', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('8', '0', '3', '0', '5', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('18', '0', '4', '0', '6', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('18', '0', '5', '0', '2', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('18', '0', '6', '0', '3', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('18', '0', '7', '0', '4', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('18', '0', '8', '0', '5', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('18', '0', '9', '0', '6', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('17', '0', '1', '3', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('17', '0', '2', '4', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('17', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('17', '0', '4', '6', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('17', '0', '3', '5', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('17', '0', '5', '7', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('19', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('19', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('19', '0', '1', '3', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('19', '0', '2', '4', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('20', '0', '1', '1', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('20', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('21', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('21', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('21', '0', '1', '0', '3', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('21', '0', '2', '0', '4', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('21', '0', '3', '0', '5', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('21', '0', '4', '0', '6', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('20', '0', '2', '2', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('20', '0', '3', '3', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('20', '0', '4', '4', '0', '0', '0', '0');
INSERT INTO `characterfacialhairstyles` VALUES ('20', '0', '0', '0', '0', '0', '0', '0');
