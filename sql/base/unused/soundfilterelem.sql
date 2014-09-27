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
-- Table structure for table `soundfilterelem`
--

DROP TABLE IF EXISTS `soundfilterelem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soundfilterelem` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `SoundFilter` int(10) NOT NULL DEFAULT '0',
  `OrderIndex` int(10) NOT NULL DEFAULT '0',
  `FilterType` int(10) NOT NULL DEFAULT '0',
  `True` int(10) NOT NULL DEFAULT '0',
  `Parameter1` float NOT NULL DEFAULT '0',
  `Parameter2` float NOT NULL DEFAULT '0',
  `Parameter3` float NOT NULL DEFAULT '0',
  `Parameter4` float NOT NULL DEFAULT '0',
  `Parameter5` float NOT NULL DEFAULT '0',
  `Parameter6` float NOT NULL DEFAULT '0',
  `Parameter7` float NOT NULL DEFAULT '0',
  `Parameter8` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soundfilterelem`
--

LOCK TABLES `soundfilterelem` WRITE;
/*!40000 ALTER TABLE `soundfilterelem` DISABLE KEYS */;
/*!40000 ALTER TABLE `soundfilterelem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `soundfilterelem`
--

INSERT INTO `soundfilterelem` VALUES ('1', '1', '0', '1', '1', '0.908', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('2', '1', '1', '4', '1', '1', '0.878', '1', '0', '4.512', '1.1', '0.015', '0.012');
INSERT INTO `soundfilterelem` VALUES ('3', '1', '2', '5', '1', '67', '0.035', '0.16', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('4', '2', '0', '5', '1', '70', '0.035', '0.163', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('5', '2', '1', '4', '1', '1', '1', '1', '0', '22.044', '0.838', '0.133', '0.005');
INSERT INTO `soundfilterelem` VALUES ('6', '3', '0', '1', '1', '0.884', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('7', '3', '1', '4', '1', '1', '0.491', '1', '0', '22.044', '1.066', '0.024', '0.01');
INSERT INTO `soundfilterelem` VALUES ('8', '3', '2', '5', '1', '65', '0.037', '0.119', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('9', '4', '0', '5', '1', '70', '0.035', '0.163', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('10', '4', '1', '4', '1', '1', '1', '1', '0', '22.044', '0.838', '0.03', '0.01');
INSERT INTO `soundfilterelem` VALUES ('11', '5', '0', '1', '1', '0.918', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('12', '5', '1', '4', '1', '1', '0.881', '1', '0', '22.044', '1.066', '0.021', '0.005');
INSERT INTO `soundfilterelem` VALUES ('13', '5', '2', '5', '1', '67', '0.037', '0.163', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('14', '6', '0', '5', '1', '74', '0.04', '0.163', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('15', '6', '1', '4', '1', '1', '1', '1', '0', '22.044', '0.838', '0.03', '0.005');
INSERT INTO `soundfilterelem` VALUES ('16', '7', '0', '1', '1', '0.884', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('17', '7', '1', '4', '1', '1', '0.612', '0.571', '0', '22.044', '1.111', '0.024', '0.01');
INSERT INTO `soundfilterelem` VALUES ('18', '7', '2', '5', '1', '56', '0.037', '0.201', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('19', '8', '0', '5', '1', '70', '0.04', '0.163', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('20', '8', '1', '4', '1', '1', '1', '1', '0', '24.093', '0.838', '0.131', '0.01');
INSERT INTO `soundfilterelem` VALUES ('21', '9', '0', '1', '1', '0.864', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('22', '9', '1', '4', '1', '1', '0.785', '0.577', '0', '22.044', '1.111', '0.024', '0.01');
INSERT INTO `soundfilterelem` VALUES ('23', '9', '2', '5', '1', '67', '0.037', '0.135', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('24', '10', '0', '5', '1', '70', '0.037', '0.16', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('25', '10', '1', '4', '1', '1', '1', '1', '0', '22.044', '0.838', '0.03', '0.005');
INSERT INTO `soundfilterelem` VALUES ('26', '11', '0', '1', '1', '0.912', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('27', '11', '1', '4', '1', '1', '0.682', '0.796', '0', '22.044', '1.1', '0.019', '0.01');
INSERT INTO `soundfilterelem` VALUES ('28', '11', '2', '5', '1', '67', '0.037', '0.158', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('29', '12', '0', '5', '1', '72', '0.04', '0.158', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('30', '12', '1', '4', '1', '1', '0.992', '1', '0', '22.272', '0.883', '0.033', '0.01');
INSERT INTO `soundfilterelem` VALUES ('31', '13', '0', '1', '1', '1.134', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('32', '13', '1', '4', '1', '1', '0.876', '1', '0', '22.044', '1.111', '0.021', '0.008');
INSERT INTO `soundfilterelem` VALUES ('33', '13', '2', '5', '1', '67', '0.042', '0.16', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('34', '14', '0', '5', '1', '72', '0.042', '0.165', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('35', '14', '1', '4', '1', '1', '1', '1', '0', '22.044', '0.838', '0.026', '0.01');
INSERT INTO `soundfilterelem` VALUES ('36', '15', '0', '1', '1', '0.97', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('37', '15', '1', '4', '1', '1', '0.785', '0.817', '0', '22.044', '1.111', '0.021', '0.005');
INSERT INTO `soundfilterelem` VALUES ('38', '15', '2', '5', '1', '67', '0.035', '0.119', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('39', '16', '0', '5', '1', '72', '0.04', '0.165', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('40', '16', '1', '4', '1', '1', '1', '1', '0', '22.044', '0.838', '0.028', '0.008');
INSERT INTO `soundfilterelem` VALUES ('41', '17', '0', '1', '1', '0.894', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('42', '17', '1', '4', '1', '1', '0.881', '1', '0', '21.816', '1.1', '0.03', '0.01');
INSERT INTO `soundfilterelem` VALUES ('43', '17', '2', '5', '1', '65', '0.035', '0.16', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('44', '17', '3', '3', '1', '7897.59', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('45', '18', '0', '5', '1', '72', '0.044', '0.158', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('46', '18', '1', '4', '1', '1', '1', '1', '0', '22.272', '0.838', '0.026', '0.01');
INSERT INTO `soundfilterelem` VALUES ('47', '19', '0', '1', '1', '0.877', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('48', '19', '1', '4', '1', '1', '0.878', '1', '0', '22.044', '1.1', '0.019', '0.01');
INSERT INTO `soundfilterelem` VALUES ('49', '19', '2', '5', '1', '67', '0.037', '0.156', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('50', '20', '0', '5', '1', '72', '0.037', '0.16', '1', '0', '0', '0', '0');
INSERT INTO `soundfilterelem` VALUES ('51', '20', '1', '4', '1', '1', '0.995', '1', '0', '22.272', '0.838', '0.028', '0.01');
