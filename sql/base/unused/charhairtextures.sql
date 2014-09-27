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
-- Table structure for table `charhairtextures`
--

DROP TABLE IF EXISTS `charhairtextures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charhairtextures` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Race` int(10) NOT NULL DEFAULT '0',
  `Gender` int(10) NOT NULL DEFAULT '0',
  `Unk1` int(10) NOT NULL DEFAULT '0',
  `Unk2` int(10) NOT NULL DEFAULT '0',
  `Unk3` int(10) NOT NULL DEFAULT '0',
  `Unk4` int(10) NOT NULL DEFAULT '0',
  `Unk5` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charhairtextures`
--

LOCK TABLES `charhairtextures` WRITE;
/*!40000 ALTER TABLE `charhairtextures` DISABLE KEYS */;
/*!40000 ALTER TABLE `charhairtextures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `charhairtextures`
--

INSERT INTO `charhairtextures` VALUES ('1', '1', '1', '0', '38874', '0', '0', '0');
INSERT INTO `charhairtextures` VALUES ('2', '1', '1', '0', '1009700', '1', '0', '0');
INSERT INTO `charhairtextures` VALUES ('8', '1', '0', '0', '6852', '2', '2', '2');
INSERT INTO `charhairtextures` VALUES ('9', '1', '0', '0', '8', '2', '1', '1');
INSERT INTO `charhairtextures` VALUES ('10', '1', '0', '1', '1', '0', '0', '0');
INSERT INTO `charhairtextures` VALUES ('11', '1', '0', '1', '2', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('12', '1', '0', '1', '4', '0', '2', '2');
INSERT INTO `charhairtextures` VALUES ('13', '1', '0', '1', '8', '0', '3', '3');
INSERT INTO `charhairtextures` VALUES ('14', '1', '0', '1', '16', '0', '4', '4');
INSERT INTO `charhairtextures` VALUES ('15', '1', '0', '1', '32', '0', '5', '5');
INSERT INTO `charhairtextures` VALUES ('16', '1', '0', '1', '64', '0', '6', '6');
INSERT INTO `charhairtextures` VALUES ('17', '1', '0', '1', '128', '0', '7', '7');
INSERT INTO `charhairtextures` VALUES ('18', '1', '0', '1', '256', '0', '8', '8');
INSERT INTO `charhairtextures` VALUES ('19', '3', '0', '0', '1066', '0', '0', '0');
INSERT INTO `charhairtextures` VALUES ('20', '3', '0', '0', '788', '0', '2', '2');
INSERT INTO `charhairtextures` VALUES ('21', '3', '0', '0', '192', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('22', '3', '0', '1', '33', '0', '0', '0');
INSERT INTO `charhairtextures` VALUES ('23', '3', '0', '1', '66', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('24', '3', '0', '1', '1156', '0', '2', '2');
INSERT INTO `charhairtextures` VALUES ('25', '3', '0', '1', '264', '0', '3', '3');
INSERT INTO `charhairtextures` VALUES ('26', '3', '0', '1', '528', '0', '4', '4');
INSERT INTO `charhairtextures` VALUES ('27', '3', '1', '0', '32767', '0', '3', '3');
INSERT INTO `charhairtextures` VALUES ('28', '1', '0', '0', '1074', '1', '2', '2');
INSERT INTO `charhairtextures` VALUES ('29', '1', '0', '0', '256', '1', '1', '1');
INSERT INTO `charhairtextures` VALUES ('31', '5', '1', '0', '1566', '0', '0', '0');
INSERT INTO `charhairtextures` VALUES ('32', '5', '1', '0', '481', '1', '0', '0');
INSERT INTO `charhairtextures` VALUES ('33', '5', '0', '0', '644', '0', '0', '0');
INSERT INTO `charhairtextures` VALUES ('34', '5', '0', '0', '282', '0', '-1', '-1');
INSERT INTO `charhairtextures` VALUES ('35', '5', '0', '0', '96', '1', '1', '1');
INSERT INTO `charhairtextures` VALUES ('36', '2', '0', '0', '70', '0', '0', '0');
INSERT INTO `charhairtextures` VALUES ('37', '2', '0', '0', '8', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('38', '2', '0', '0', '16', '0', '2', '2');
INSERT INTO `charhairtextures` VALUES ('39', '2', '0', '0', '32', '0', '3', '3');
INSERT INTO `charhairtextures` VALUES ('42', '4', '1', '0', '254', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('43', '4', '0', '0', '254', '0', '0', '0');
INSERT INTO `charhairtextures` VALUES ('44', '4', '0', '1', '1', '0', '14', '14');
INSERT INTO `charhairtextures` VALUES ('45', '4', '0', '1', '2', '0', '0', '0');
INSERT INTO `charhairtextures` VALUES ('46', '1', '0', '0', '1', '-1', '-1', '-1');
INSERT INTO `charhairtextures` VALUES ('47', '4', '0', '1', '4', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('48', '4', '0', '1', '8', '0', '2', '2');
INSERT INTO `charhairtextures` VALUES ('49', '4', '0', '1', '16', '0', '3', '3');
INSERT INTO `charhairtextures` VALUES ('50', '4', '0', '1', '32', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('51', '2', '0', '1', '4', '0', '2', '2');
INSERT INTO `charhairtextures` VALUES ('52', '2', '0', '1', '2', '0', '0', '0');
INSERT INTO `charhairtextures` VALUES ('53', '2', '0', '1', '24', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('54', '2', '0', '1', '352', '0', '5', '5');
INSERT INTO `charhairtextures` VALUES ('55', '2', '0', '1', '1152', '0', '3', '3');
INSERT INTO `charhairtextures` VALUES ('56', '2', '0', '1', '512', '0', '4', '4');
INSERT INTO `charhairtextures` VALUES ('57', '2', '1', '0', '2', '0', '0', '0');
INSERT INTO `charhairtextures` VALUES ('58', '2', '1', '0', '4', '0', '4', '4');
INSERT INTO `charhairtextures` VALUES ('59', '2', '1', '0', '136', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('60', '2', '1', '0', '16', '0', '5', '5');
INSERT INTO `charhairtextures` VALUES ('61', '2', '1', '0', '32', '0', '6', '6');
INSERT INTO `charhairtextures` VALUES ('62', '2', '1', '0', '64', '0', '7', '7');
INSERT INTO `charhairtextures` VALUES ('63', '4', '1', '1', '1', '0', '4', '4');
INSERT INTO `charhairtextures` VALUES ('64', '4', '1', '1', '2', '0', '5', '5');
INSERT INTO `charhairtextures` VALUES ('65', '4', '1', '1', '4', '0', '6', '6');
INSERT INTO `charhairtextures` VALUES ('66', '4', '1', '1', '8', '0', '7', '7');
INSERT INTO `charhairtextures` VALUES ('67', '4', '1', '1', '16', '0', '8', '8');
INSERT INTO `charhairtextures` VALUES ('68', '4', '1', '1', '32', '0', '9', '9');
INSERT INTO `charhairtextures` VALUES ('69', '4', '1', '1', '64', '0', '10', '10');
INSERT INTO `charhairtextures` VALUES ('70', '4', '1', '1', '128', '0', '11', '11');
INSERT INTO `charhairtextures` VALUES ('71', '4', '1', '1', '256', '0', '12', '12');
INSERT INTO `charhairtextures` VALUES ('72', '4', '1', '1', '512', '0', '13', '13');
INSERT INTO `charhairtextures` VALUES ('73', '3', '0', '0', '1', '0', '-1', '-1');
INSERT INTO `charhairtextures` VALUES ('74', '6', '0', '0', '255', '-1', '0', '0');
INSERT INTO `charhairtextures` VALUES ('75', '2', '0', '0', '1', '0', '-1', '-1');
INSERT INTO `charhairtextures` VALUES ('76', '7', '1', '0', '511', '0', '0', '0');
INSERT INTO `charhairtextures` VALUES ('77', '2', '1', '0', '1', '0', '-1', '-1');
INSERT INTO `charhairtextures` VALUES ('78', '10', '0', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('79', '10', '1', '0', '255', '0', '0', '0');
INSERT INTO `charhairtextures` VALUES ('80', '11', '0', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('81', '11', '1', '0', '255', '0', '0', '0');
INSERT INTO `charhairtextures` VALUES ('82', '12', '0', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('83', '12', '1', '0', '255', '0', '0', '0');
INSERT INTO `charhairtextures` VALUES ('84', '13', '0', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('85', '13', '1', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('86', '14', '0', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('87', '14', '1', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('88', '15', '0', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('89', '15', '1', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('90', '16', '0', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('91', '16', '1', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('92', '17', '0', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('93', '17', '1', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('98', '18', '0', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('99', '18', '1', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('100', '19', '0', '0', '255', '0', '1', '1');
INSERT INTO `charhairtextures` VALUES ('101', '19', '1', '0', '255', '0', '1', '1');
