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
-- Table structure for table `lfgdungeonexpansion`
--

DROP TABLE IF EXISTS `lfgdungeonexpansion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lfgdungeonexpansion` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Dungeon` int(10) NOT NULL DEFAULT '0',
  `Expansion` int(10) NOT NULL DEFAULT '0',
  `RandomId` int(10) NOT NULL DEFAULT '0',
  `HardModeLevelMin` int(10) NOT NULL DEFAULT '0',
  `HardModeLevelMax` int(10) NOT NULL DEFAULT '0',
  `TargetLevelMin` int(10) NOT NULL DEFAULT '0',
  `TargetLevelMax` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lfgdungeonexpansion`
--

LOCK TABLES `lfgdungeonexpansion` WRITE;
/*!40000 ALTER TABLE `lfgdungeonexpansion` DISABLE KEYS */;
/*!40000 ALTER TABLE `lfgdungeonexpansion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `lfgdungeonexpansion`
--

INSERT INTO `lfgdungeonexpansion` VALUES ('38', '2', '0', '258', '57', '60', '59', '60');
INSERT INTO `lfgdungeonexpansion` VALUES ('36', '30', '0', '258', '47', '60', '49', '52');
INSERT INTO `lfgdungeonexpansion` VALUES ('46', '32', '0', '258', '55', '60', '57', '60');
INSERT INTO `lfgdungeonexpansion` VALUES ('53', '34', '0', '258', '53', '60', '55', '58');
INSERT INTO `lfgdungeonexpansion` VALUES ('54', '36', '0', '258', '56', '60', '58', '60');
INSERT INTO `lfgdungeonexpansion` VALUES ('37', '38', '0', '258', '57', '60', '59', '60');
INSERT INTO `lfgdungeonexpansion` VALUES ('49', '40', '0', '258', '57', '60', '59', '60');
INSERT INTO `lfgdungeonexpansion` VALUES ('95', '136', '1', '259', '58', '70', '59', '62');
INSERT INTO `lfgdungeonexpansion` VALUES ('57', '137', '1', '259', '59', '70', '61', '63');
INSERT INTO `lfgdungeonexpansion` VALUES ('88', '138', '1', '259', '67', '70', '69', '70');
INSERT INTO `lfgdungeonexpansion` VALUES ('110', '140', '1', '259', '60', '70', '62', '64');
INSERT INTO `lfgdungeonexpansion` VALUES ('66', '147', '1', '259', '67', '70', '69', '70');
INSERT INTO `lfgdungeonexpansion` VALUES ('107', '148', '1', '259', '62', '70', '64', '66');
INSERT INTO `lfgdungeonexpansion` VALUES ('108', '149', '1', '259', '63', '70', '65', '67');
INSERT INTO `lfgdungeonexpansion` VALUES ('109', '150', '1', '259', '65', '70', '67', '68');
INSERT INTO `lfgdungeonexpansion` VALUES ('92', '151', '1', '259', '67', '70', '69', '70');
INSERT INTO `lfgdungeonexpansion` VALUES ('65', '170', '1', '259', '64', '70', '66', '68');
INSERT INTO `lfgdungeonexpansion` VALUES ('76', '171', '1', '259', '68', '70', '70', '70');
INSERT INTO `lfgdungeonexpansion` VALUES ('61', '172', '1', '259', '67', '70', '69', '70');
INSERT INTO `lfgdungeonexpansion` VALUES ('97', '173', '1', '259', '67', '70', '69', '70');
INSERT INTO `lfgdungeonexpansion` VALUES ('98', '174', '1', '259', '68', '70', '70', '70');
INSERT INTO `lfgdungeonexpansion` VALUES ('87', '198', '1', '259', '68', '70', '70', '70');
INSERT INTO `lfgdungeonexpansion` VALUES ('201', '258', '0', '0', '15', '60', '15', '60');
INSERT INTO `lfgdungeonexpansion` VALUES ('200', '258', '1', '0', '15', '58', '15', '58');
INSERT INTO `lfgdungeonexpansion` VALUES ('199', '258', '2', '0', '15', '58', '15', '58');
INSERT INTO `lfgdungeonexpansion` VALUES ('202', '259', '1', '0', '59', '70', '59', '70');
INSERT INTO `lfgdungeonexpansion` VALUES ('203', '259', '2', '0', '59', '68', '59', '68');
INSERT INTO `lfgdungeonexpansion` VALUES ('219', '274', '0', '258', '57', '60', '59', '60');
INSERT INTO `lfgdungeonexpansion` VALUES ('220', '276', '0', '258', '51', '60', '53', '56');
