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
-- Table structure for table `camerashakes`
--

DROP TABLE IF EXISTS `camerashakes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `camerashakes` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `ShakeType` int(10) NOT NULL DEFAULT '0',
  `Direction` int(10) NOT NULL DEFAULT '0',
  `Amplitude` float NOT NULL DEFAULT '0',
  `Frequency` float NOT NULL DEFAULT '0',
  `Duration` float NOT NULL DEFAULT '0',
  `Phase` float NOT NULL DEFAULT '0',
  `Coefficient` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camerashakes`
--

LOCK TABLES `camerashakes` WRITE;
/*!40000 ALTER TABLE `camerashakes` DISABLE KEYS */;
/*!40000 ALTER TABLE `camerashakes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `camerashakes`
--

INSERT INTO `camerashakes` VALUES ('1', '1', '2', '2', '3', '0.4', '0.06', '1');
INSERT INTO `camerashakes` VALUES ('2', '1', '2', '7', '3', '0.4', '0.06', '1');
INSERT INTO `camerashakes` VALUES ('4', '0', '0', '2', '6', '4', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('5', '0', '1', '2', '4', '4', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('6', '0', '2', '4', '5.2', '4', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('7', '1', '0', '2', '6', '2', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('8', '1', '1', '2', '4', '2', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('9', '1', '2', '4', '5.2', '2', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('10', '1', '2', '3', '2', '0.6', '0.16', '2');
INSERT INTO `camerashakes` VALUES ('11', '1', '2', '4', '3', '0.6', '0.1', '2');
INSERT INTO `camerashakes` VALUES ('12', '1', '2', '6', '4', '0.65', '0.08', '1');
INSERT INTO `camerashakes` VALUES ('13', '0', '0', '2', '6', '0.6', '0', '3');
INSERT INTO `camerashakes` VALUES ('14', '0', '1', '2', '6', '0.6', '0', '3');
INSERT INTO `camerashakes` VALUES ('15', '0', '2', '2', '6', '0.6', '0', '3');
INSERT INTO `camerashakes` VALUES ('16', '1', '0', '1', '7', '1', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('17', '1', '1', '1', '4', '1', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('18', '1', '2', '1', '6', '1', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('36', '0', '0', '2', '6', '10', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('37', '0', '1', '2', '4', '10', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('38', '0', '2', '4', '5.2', '10', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('56', '0', '0', '5', '2.5', '0.25', '0', '1');
INSERT INTO `camerashakes` VALUES ('76', '0', '0', '2', '6', '20', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('77', '0', '1', '2', '4', '20', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('78', '0', '2', '4', '5.2', '20', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('79', '0', '0', '2', '6', '7', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('80', '0', '1', '2', '4', '7', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('81', '0', '2', '4', '5.2', '7', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('82', '1', '2', '12', '3', '0.6', '0.06', '1');
INSERT INTO `camerashakes` VALUES ('83', '1', '2', '9', '8', '2', '0.06', '1');
INSERT INTO `camerashakes` VALUES ('84', '0', '2', '10', '10', '1.5', '0', '3');
INSERT INTO `camerashakes` VALUES ('85', '0', '1', '10', '10', '1.5', '0', '3');
INSERT INTO `camerashakes` VALUES ('86', '0', '0', '10', '10', '1.5', '0', '3');
INSERT INTO `camerashakes` VALUES ('87', '0', '0', '2', '4', '4', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('89', '0', '1', '2', '4', '4', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('90', '0', '2', '2', '4', '4', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('91', '0', '0', '4', '6', '4', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('92', '0', '2', '4', '6', '7', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('93', '0', '1', '4', '6', '4', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('94', '0', '0', '6', '8', '7', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('95', '0', '1', '6', '8', '7', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('96', '0', '2', '6', '8', '7', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('97', '0', '0', '10', '6', '10', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('98', '0', '1', '10', '4', '10', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('99', '0', '2', '10', '5.2', '10', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('100', '0', '0', '2', '6', '4', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('101', '0', '1', '2', '4', '4', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('102', '0', '2', '4', '5.2', '4', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('103', '0', '0', '4', '6', '1', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('104', '0', '1', '4', '6', '1', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('105', '0', '2', '4', '6', '1', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('106', '1', '2', '10', '8', '1', '0.06', '1');
INSERT INTO `camerashakes` VALUES ('107', '0', '0', '10', '10', '0.75', '0', '3');
INSERT INTO `camerashakes` VALUES ('109', '0', '1', '10', '10', '0.75', '0', '3');
INSERT INTO `camerashakes` VALUES ('110', '0', '2', '10', '10', '0.75', '0', '3');
INSERT INTO `camerashakes` VALUES ('111', '0', '0', '0.05', '12', '2', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('112', '0', '1', '0.05', '12', '2', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('113', '0', '2', '0.07', '12', '2', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('114', '0', '0', '1.5', '5', '1', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('115', '0', '1', '1.5', '5', '1', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('116', '0', '2', '1.5', '5', '1', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('117', '1', '0', '1', '8', '0.2', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('118', '1', '1', '1', '8', '0.2', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('119', '1', '2', '1', '8', '0.3', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('120', '0', '0', '8', '0.5', '2', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('121', '0', '1', '8', '0.5', '2', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('122', '0', '2', '8', '0.5', '2', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('123', '0', '0', '2', '4', '1', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('124', '0', '1', '2', '4', '1', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('125', '0', '2', '2', '4', '1', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('132', '0', '0', '2', '6', '5', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('133', '0', '1', '2', '4', '5', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('134', '0', '2', '4', '5.2', '5', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('141', '0', '0', '10', '10', '4', '0', '3');
INSERT INTO `camerashakes` VALUES ('142', '0', '1', '10', '10', '4', '0', '3');
INSERT INTO `camerashakes` VALUES ('143', '1', '2', '6', '10', '6', '0', '3');
INSERT INTO `camerashakes` VALUES ('144', '0', '0', '8', '8', '12', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('145', '0', '1', '8', '8', '12', '0', '0.4');
INSERT INTO `camerashakes` VALUES ('146', '0', '2', '8', '8', '12', '0', '0.4');
