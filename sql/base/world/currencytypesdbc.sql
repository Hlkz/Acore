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
-- Table structure for table `currencytypesdbc`
--

DROP TABLE IF EXISTS `currencytypesdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencytypesdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `ItemId` int(10) NOT NULL DEFAULT '0',
  `Category` int(10) NOT NULL DEFAULT '0',
  `BitIndex` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencytypesdbc`
--

LOCK TABLES `currencytypesdbc` WRITE;
/*!40000 ALTER TABLE `currencytypesdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencytypesdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `currencytypesdbc`
--

INSERT INTO `currencytypesdbc` VALUES ('1', '37711', '1', '1');
INSERT INTO `currencytypesdbc` VALUES ('2', '37742', '1', '2');
INSERT INTO `currencytypesdbc` VALUES ('42', '29434', '1', '7');
INSERT INTO `currencytypesdbc` VALUES ('61', '41596', '1', '8');
INSERT INTO `currencytypesdbc` VALUES ('81', '43016', '1', '9');
INSERT INTO `currencytypesdbc` VALUES ('241', '44990', '1', '25');
INSERT INTO `currencytypesdbc` VALUES ('103', '43307', '2', '12');
INSERT INTO `currencytypesdbc` VALUES ('104', '43308', '2', '13');
INSERT INTO `currencytypesdbc` VALUES ('121', '20560', '2', '14');
INSERT INTO `currencytypesdbc` VALUES ('122', '20559', '2', '15');
INSERT INTO `currencytypesdbc` VALUES ('123', '29024', '2', '16');
INSERT INTO `currencytypesdbc` VALUES ('124', '42425', '2', '17');
INSERT INTO `currencytypesdbc` VALUES ('125', '20558', '2', '18');
INSERT INTO `currencytypesdbc` VALUES ('126', '43589', '2', '19');
INSERT INTO `currencytypesdbc` VALUES ('161', '43228', '2', '21');
INSERT INTO `currencytypesdbc` VALUES ('181', '44209', '2', '22');
INSERT INTO `currencytypesdbc` VALUES ('201', '37836', '2', '23');
INSERT INTO `currencytypesdbc` VALUES ('321', '47395', '2', '28');
INSERT INTO `currencytypesdbc` VALUES ('4', '38644', '3', '3');
INSERT INTO `currencytypesdbc` VALUES ('101', '40752', '22', '10');
INSERT INTO `currencytypesdbc` VALUES ('102', '40753', '22', '11');
INSERT INTO `currencytypesdbc` VALUES ('221', '45624', '22', '24');
INSERT INTO `currencytypesdbc` VALUES ('301', '47241', '22', '27');
INSERT INTO `currencytypesdbc` VALUES ('341', '49426', '22', '29');
INSERT INTO `currencytypesdbc` VALUES ('22', '41749', '24', '5');
INSERT INTO `currencytypesdbc` VALUES ('141', '43949', '2089878896', '20');
