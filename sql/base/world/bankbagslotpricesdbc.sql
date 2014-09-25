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
-- Table structure for table `bankbagslotpricesdbc`
--

DROP TABLE IF EXISTS `bankbagslotpricesdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankbagslotpricesdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Price` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankbagslotpricesdbc`
--

LOCK TABLES `bankbagslotpricesdbc` WRITE;
/*!40000 ALTER TABLE `bankbagslotpricesdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankbagslotpricesdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `bankbagslotpricesdbc`
--

INSERT INTO `bankbagslotpricesdbc` VALUES ('1', '1000');
INSERT INTO `bankbagslotpricesdbc` VALUES ('2', '10000');
INSERT INTO `bankbagslotpricesdbc` VALUES ('3', '100000');
INSERT INTO `bankbagslotpricesdbc` VALUES ('4', '250000');
INSERT INTO `bankbagslotpricesdbc` VALUES ('5', '250000');
INSERT INTO `bankbagslotpricesdbc` VALUES ('6', '250000');
INSERT INTO `bankbagslotpricesdbc` VALUES ('7', '250000');
INSERT INTO `bankbagslotpricesdbc` VALUES ('8', '999999999');
INSERT INTO `bankbagslotpricesdbc` VALUES ('9', '999999999');
INSERT INTO `bankbagslotpricesdbc` VALUES ('10', '999999999');
INSERT INTO `bankbagslotpricesdbc` VALUES ('11', '999999999');
INSERT INTO `bankbagslotpricesdbc` VALUES ('12', '999999999');
