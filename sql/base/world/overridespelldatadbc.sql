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
-- Table structure for table `overridespelldatadbc`
--

DROP TABLE IF EXISTS `overridespelldatadbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overridespelldatadbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `SpellId1` int(10) NOT NULL DEFAULT '0',
  `SpellId2` int(10) NOT NULL DEFAULT '0',
  `SpellId3` int(10) NOT NULL DEFAULT '0',
  `SpellId4` int(10) NOT NULL DEFAULT '0',
  `SpellId5` int(10) NOT NULL DEFAULT '0',
  `SpellId6` int(10) NOT NULL DEFAULT '0',
  `SpellId7` int(10) NOT NULL DEFAULT '0',
  `SpellId8` int(10) NOT NULL DEFAULT '0',
  `SpellId9` int(10) NOT NULL DEFAULT '0',
  `SpellId10` int(10) NOT NULL DEFAULT '0',
  `Unk` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overridespelldatadbc`
--

LOCK TABLES `overridespelldatadbc` WRITE;
/*!40000 ALTER TABLE `overridespelldatadbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `overridespelldatadbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `overridespelldatadbc`
--

INSERT INTO `overridespelldatadbc` VALUES ('1', '40430', '59351', '31262', '61721', '0', '0', '0', '0', '0', '0', '5');
INSERT INTO `overridespelldatadbc` VALUES ('61', '62634', '62479', '62473', '62471', '0', '62428', '0', '0', '0', '0', '0');
INSERT INTO `overridespelldatadbc` VALUES ('121', '66905', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `overridespelldatadbc` VALUES ('141', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `overridespelldatadbc` VALUES ('221', '69667', '69668', '69671', '69669', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `overridespelldatadbc` VALUES ('241', '70946', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `overridespelldatadbc` VALUES ('266', '73491', '73492', '73499', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `overridespelldatadbc` VALUES ('271', '33912', '31289', '24331', '0', '0', '0', '0', '0', '0', '0', '0');
