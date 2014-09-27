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
-- Table structure for table `soundfilter`
--

DROP TABLE IF EXISTS `soundfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soundfilter` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soundfilter`
--

LOCK TABLES `soundfilter` WRITE;
/*!40000 ALTER TABLE `soundfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `soundfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `soundfilter`
--

INSERT INTO `soundfilter` VALUES ('1', 'Death Knight Human Male');
INSERT INTO `soundfilter` VALUES ('2', 'Death Knight Human Female');
INSERT INTO `soundfilter` VALUES ('3', 'Death Knight Dwarf Male');
INSERT INTO `soundfilter` VALUES ('4', 'Death Knight Dwarf Female');
INSERT INTO `soundfilter` VALUES ('5', 'Death Knight NightElf Male');
INSERT INTO `soundfilter` VALUES ('6', 'Death Knight NightElf Female');
INSERT INTO `soundfilter` VALUES ('7', 'Death Knight Gnome Male');
INSERT INTO `soundfilter` VALUES ('8', 'Death Knight Gnome Female');
INSERT INTO `soundfilter` VALUES ('9', 'Death Knight Draenei Male');
INSERT INTO `soundfilter` VALUES ('10', 'Death Knight Draenei Female');
INSERT INTO `soundfilter` VALUES ('11', 'Death Knight Orc Male');
INSERT INTO `soundfilter` VALUES ('12', 'Death Knight Orc Female');
INSERT INTO `soundfilter` VALUES ('13', 'Death Knight Scourge Male');
INSERT INTO `soundfilter` VALUES ('14', 'Death Knight Scourge Female');
INSERT INTO `soundfilter` VALUES ('15', 'Death Knight Tauren Male');
INSERT INTO `soundfilter` VALUES ('16', 'Death Knight Tauren Female');
INSERT INTO `soundfilter` VALUES ('17', 'Death Knight Troll Male');
INSERT INTO `soundfilter` VALUES ('18', 'Death Knight Troll Female');
INSERT INTO `soundfilter` VALUES ('19', 'Death Knight BloodElf Male');
INSERT INTO `soundfilter` VALUES ('20', 'Death Knight BloodElf Female');
