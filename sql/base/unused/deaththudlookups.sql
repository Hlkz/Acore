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
-- Table structure for table `deaththudlookups`
--

DROP TABLE IF EXISTS `deaththudlookups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deaththudlookups` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Size` int(10) NOT NULL DEFAULT '0',
  `TerrainTypeSound` int(10) NOT NULL DEFAULT '0',
  `SoundId` int(10) NOT NULL DEFAULT '0',
  `SoundIdWater` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deaththudlookups`
--

LOCK TABLES `deaththudlookups` WRITE;
/*!40000 ALTER TABLE `deaththudlookups` DISABLE KEYS */;
/*!40000 ALTER TABLE `deaththudlookups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `deaththudlookups`
--

INSERT INTO `deaththudlookups` VALUES ('1', '0', '1', '907', '1266');
INSERT INTO `deaththudlookups` VALUES ('2', '0', '6', '908', '1266');
INSERT INTO `deaththudlookups` VALUES ('3', '0', '4', '909', '1266');
INSERT INTO `deaththudlookups` VALUES ('4', '0', '3', '910', '1266');
INSERT INTO `deaththudlookups` VALUES ('5', '0', '5', '911', '1266');
INSERT INTO `deaththudlookups` VALUES ('6', '1', '1', '912', '1267');
INSERT INTO `deaththudlookups` VALUES ('7', '1', '6', '913', '1267');
INSERT INTO `deaththudlookups` VALUES ('8', '1', '4', '914', '1267');
INSERT INTO `deaththudlookups` VALUES ('9', '1', '3', '915', '1267');
INSERT INTO `deaththudlookups` VALUES ('10', '1', '5', '916', '1267');
INSERT INTO `deaththudlookups` VALUES ('11', '2', '1', '917', '1267');
INSERT INTO `deaththudlookups` VALUES ('12', '2', '6', '918', '1267');
INSERT INTO `deaththudlookups` VALUES ('13', '2', '4', '919', '1267');
INSERT INTO `deaththudlookups` VALUES ('14', '2', '3', '920', '1267');
INSERT INTO `deaththudlookups` VALUES ('15', '2', '5', '921', '1267');
INSERT INTO `deaththudlookups` VALUES ('16', '3', '1', '922', '1268');
INSERT INTO `deaththudlookups` VALUES ('17', '3', '6', '923', '1268');
INSERT INTO `deaththudlookups` VALUES ('18', '3', '4', '924', '1268');
INSERT INTO `deaththudlookups` VALUES ('19', '3', '3', '925', '1268');
INSERT INTO `deaththudlookups` VALUES ('20', '3', '5', '926', '1268');
INSERT INTO `deaththudlookups` VALUES ('21', '4', '1', '927', '1269');
INSERT INTO `deaththudlookups` VALUES ('22', '4', '6', '928', '1269');
INSERT INTO `deaththudlookups` VALUES ('23', '4', '4', '929', '1269');
INSERT INTO `deaththudlookups` VALUES ('24', '4', '3', '930', '1269');
INSERT INTO `deaththudlookups` VALUES ('25', '4', '5', '931', '1269');
INSERT INTO `deaththudlookups` VALUES ('26', '1', '9', '907', '907');
INSERT INTO `deaththudlookups` VALUES ('27', '1', '8', '913', '1267');
INSERT INTO `deaththudlookups` VALUES ('47', '0', '2', '910', '0');
INSERT INTO `deaththudlookups` VALUES ('48', '0', '7', '907', '0');
INSERT INTO `deaththudlookups` VALUES ('49', '0', '8', '907', '0');
INSERT INTO `deaththudlookups` VALUES ('50', '0', '9', '907', '0');
INSERT INTO `deaththudlookups` VALUES ('51', '1', '2', '920', '0');
INSERT INTO `deaththudlookups` VALUES ('52', '1', '7', '912', '0');
INSERT INTO `deaththudlookups` VALUES ('53', '2', '2', '915', '0');
INSERT INTO `deaththudlookups` VALUES ('54', '2', '7', '917', '0');
INSERT INTO `deaththudlookups` VALUES ('55', '2', '8', '917', '0');
INSERT INTO `deaththudlookups` VALUES ('56', '2', '9', '917', '0');
INSERT INTO `deaththudlookups` VALUES ('57', '3', '2', '925', '0');
INSERT INTO `deaththudlookups` VALUES ('58', '3', '7', '922', '0');
INSERT INTO `deaththudlookups` VALUES ('59', '3', '8', '922', '0');
INSERT INTO `deaththudlookups` VALUES ('60', '3', '9', '922', '0');
INSERT INTO `deaththudlookups` VALUES ('61', '4', '2', '930', '0');
INSERT INTO `deaththudlookups` VALUES ('62', '4', '7', '927', '0');
INSERT INTO `deaththudlookups` VALUES ('63', '4', '8', '927', '0');
INSERT INTO `deaththudlookups` VALUES ('64', '4', '9', '927', '0');
