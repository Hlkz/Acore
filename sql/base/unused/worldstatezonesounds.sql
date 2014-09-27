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
-- Table structure for table `worldstatezonesounds`
--

DROP TABLE IF EXISTS `worldstatezonesounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worldstatezonesounds` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Value` int(10) NOT NULL DEFAULT '0',
  `Area` int(10) NOT NULL DEFAULT '0',
  `WMOArea` int(10) NOT NULL DEFAULT '0',
  `IntroMusic` int(10) NOT NULL DEFAULT '0',
  `Music` int(10) NOT NULL DEFAULT '0',
  `SoundAmbience` int(10) NOT NULL DEFAULT '0',
  `Preferences` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worldstatezonesounds`
--

LOCK TABLES `worldstatezonesounds` WRITE;
/*!40000 ALTER TABLE `worldstatezonesounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `worldstatezonesounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `worldstatezonesounds`
--

INSERT INTO `worldstatezonesounds` VALUES ('2019', '1', '159', '0', '62', '14', '36', '84');
INSERT INTO `worldstatezonesounds` VALUES ('2019', '1', '0', '18154', '182', '13', '43', '0');
INSERT INTO `worldstatezonesounds` VALUES ('2019', '1', '0', '18153', '401', '232', '103', '0');
INSERT INTO `worldstatezonesounds` VALUES ('843', '0', '3428', '0', '0', '0', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3202', '0', '3428', '0', '0', '0', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('2465', '0', '3428', '0', '0', '0', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('1946', '0', '3428', '0', '0', '0', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '0', '4080', '0', '0', '394', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '1', '4080', '0', '0', '395', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '2', '4080', '0', '0', '396', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '0', '0', '40329', '0', '394', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '1', '0', '40329', '0', '395', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '2', '0', '40329', '0', '396', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '0', '0', '40353', '0', '394', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '1', '0', '40353', '0', '395', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '2', '0', '40353', '0', '396', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '0', '0', '43245', '0', '394', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '1', '0', '43245', '0', '395', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '2', '0', '43245', '0', '396', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '0', '0', '40331', '0', '394', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '1', '0', '40331', '0', '395', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '2', '0', '40331', '0', '396', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '0', '0', '43205', '0', '394', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '1', '0', '43205', '0', '395', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3426', '2', '0', '43205', '0', '396', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3427', '1337', '151', '0', '0', '0', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3427', '5555', '4019', '0', '0', '0', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('3710', '1', '4197', '0', '0', '445', '463', '84');
INSERT INTO `worldstatezonesounds` VALUES ('4096', '1', '4273', '0', '0', '527', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('4162', '1', '4273', '0', '0', '529', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('4164', '1', '4273', '0', '0', '530', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('4161', '1', '4273', '0', '0', '528', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('4122', '1', '0', '47321', '0', '531', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('4150', '1', '0', '43600', '0', '533', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('4061', '3', '0', '47478', '0', '534', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('4956', '1', '4820', '0', '0', '548', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('4957', '1', '4820', '0', '0', '547', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('4956', '1', '0', '49438', '0', '548', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('4956', '1', '0', '49439', '0', '548', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('4957', '1', '0', '49438', '0', '547', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('4957', '1', '0', '49437', '0', '547', '0', '0');
INSERT INTO `worldstatezonesounds` VALUES ('4957', '1', '0', '49441', '0', '547', '0', '0');
