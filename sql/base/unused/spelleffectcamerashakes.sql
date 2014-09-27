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
-- Table structure for table `spelleffectcamerashakes`
--

DROP TABLE IF EXISTS `spelleffectcamerashakes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spelleffectcamerashakes` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `CameraShakes1` int(10) NOT NULL DEFAULT '0',
  `CameraShakes2` int(10) NOT NULL DEFAULT '0',
  `CameraShakes3` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spelleffectcamerashakes`
--

LOCK TABLES `spelleffectcamerashakes` WRITE;
/*!40000 ALTER TABLE `spelleffectcamerashakes` DISABLE KEYS */;
/*!40000 ALTER TABLE `spelleffectcamerashakes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `spelleffectcamerashakes`
--

INSERT INTO `spelleffectcamerashakes` VALUES ('1', '4', '5', '6');
INSERT INTO `spelleffectcamerashakes` VALUES ('2', '7', '8', '9');
INSERT INTO `spelleffectcamerashakes` VALUES ('3', '1', '0', '0');
INSERT INTO `spelleffectcamerashakes` VALUES ('4', '15', '14', '15');
INSERT INTO `spelleffectcamerashakes` VALUES ('5', '11', '0', '0');
INSERT INTO `spelleffectcamerashakes` VALUES ('6', '4', '5', '6');
INSERT INTO `spelleffectcamerashakes` VALUES ('7', '18', '17', '18');
INSERT INTO `spelleffectcamerashakes` VALUES ('26', '36', '37', '38');
INSERT INTO `spelleffectcamerashakes` VALUES ('66', '76', '77', '78');
INSERT INTO `spelleffectcamerashakes` VALUES ('67', '79', '80', '81');
INSERT INTO `spelleffectcamerashakes` VALUES ('68', '82', '0', '0');
INSERT INTO `spelleffectcamerashakes` VALUES ('69', '83', '0', '0');
INSERT INTO `spelleffectcamerashakes` VALUES ('70', '86', '85', '84');
INSERT INTO `spelleffectcamerashakes` VALUES ('71', '87', '89', '90');
INSERT INTO `spelleffectcamerashakes` VALUES ('72', '91', '93', '92');
INSERT INTO `spelleffectcamerashakes` VALUES ('73', '94', '95', '96');
INSERT INTO `spelleffectcamerashakes` VALUES ('74', '97', '98', '99');
INSERT INTO `spelleffectcamerashakes` VALUES ('75', '100', '101', '102');
INSERT INTO `spelleffectcamerashakes` VALUES ('76', '7', '8', '9');
INSERT INTO `spelleffectcamerashakes` VALUES ('77', '103', '104', '105');
INSERT INTO `spelleffectcamerashakes` VALUES ('78', '106', '13', '14');
INSERT INTO `spelleffectcamerashakes` VALUES ('79', '107', '109', '110');
INSERT INTO `spelleffectcamerashakes` VALUES ('80', '0', '0', '113');
INSERT INTO `spelleffectcamerashakes` VALUES ('81', '114', '115', '116');
INSERT INTO `spelleffectcamerashakes` VALUES ('82', '117', '118', '119');
INSERT INTO `spelleffectcamerashakes` VALUES ('83', '120', '121', '122');
INSERT INTO `spelleffectcamerashakes` VALUES ('84', '123', '124', '125');
INSERT INTO `spelleffectcamerashakes` VALUES ('87', '132', '133', '134');
INSERT INTO `spelleffectcamerashakes` VALUES ('91', '141', '142', '143');
INSERT INTO `spelleffectcamerashakes` VALUES ('92', '146', '146', '146');
