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
-- Table structure for table `gtchancetospellcritbase`
--

DROP TABLE IF EXISTS `gtchancetospellcritbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gtchancetospellcritbase` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Value` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gtchancetospellcritbase`
--

LOCK TABLES `gtchancetospellcritbase` WRITE;
/*!40000 ALTER TABLE `gtchancetospellcritbase` DISABLE KEYS */;
/*!40000 ALTER TABLE `gtchancetospellcritbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `gtchancetospellcritbase`
--

INSERT INTO `gtchancetospellcritbase` VALUES ('1', '0');
INSERT INTO `gtchancetospellcritbase` VALUES ('2', '0.033355');
INSERT INTO `gtchancetospellcritbase` VALUES ('3', '0.03602');
INSERT INTO `gtchancetospellcritbase` VALUES ('4', '0');
INSERT INTO `gtchancetospellcritbase` VALUES ('5', '0.012375');
INSERT INTO `gtchancetospellcritbase` VALUES ('6', '0');
INSERT INTO `gtchancetospellcritbase` VALUES ('7', '0.02201');
INSERT INTO `gtchancetospellcritbase` VALUES ('8', '0.009075');
INSERT INTO `gtchancetospellcritbase` VALUES ('9', '0.017');
INSERT INTO `gtchancetospellcritbase` VALUES ('10', '0.2');
INSERT INTO `gtchancetospellcritbase` VALUES ('11', '0.018515');
