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
-- Table structure for table `spellmissile`
--

DROP TABLE IF EXISTS `spellmissile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spellmissile` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  `DefaultPitchMin` float NOT NULL DEFAULT '0',
  `DefaultPitchMax` float NOT NULL DEFAULT '0',
  `DefaultSpeedMin` float NOT NULL DEFAULT '0',
  `DefaultSpeedMax` float NOT NULL DEFAULT '0',
  `RandomizeFacingMin` float NOT NULL DEFAULT '0',
  `RandomizeFacingMax` float NOT NULL DEFAULT '0',
  `RandomizePitchMin` float NOT NULL DEFAULT '0',
  `RandomizePitchMax` float NOT NULL DEFAULT '0',
  `RandomizeSpeedMin` float NOT NULL DEFAULT '0',
  `RandomizeSpeedMax` float NOT NULL DEFAULT '0',
  `Gravity` float NOT NULL DEFAULT '0',
  `MaxDuration` float NOT NULL DEFAULT '0',
  `CollisionRadius` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spellmissile`
--

LOCK TABLES `spellmissile` WRITE;
/*!40000 ALTER TABLE `spellmissile` DISABLE KEYS */;
/*!40000 ALTER TABLE `spellmissile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `spellmissile`
--

INSERT INTO `spellmissile` VALUES ('61', '1', '0.698132', '0.872665', '30', '40', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('121', '1', '0.698132', '0.872665', '10', '120', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('161', '1', '0.698132', '0.872665', '10', '120', '0', '0', '0', '0', '-5', '5', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('181', '1', '0.698132', '0.872665', '30', '40', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('221', '1', '-0.261799', '0.785398', '10', '120', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('222', '1', '0.698132', '0.872665', '30', '40', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('241', '1', '0.349066', '0.872665', '10', '120', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('261', '1', '0.698132', '0.872665', '30', '40', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('281', '1', '0.698132', '0.872665', '50', '50', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('301', '1', '0.698132', '0.872665', '30', '40', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('361', '1', '0.698132', '0.872665', '30', '40', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('381', '1', '0.698132', '0.872665', '10', '120', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('382', '1', '0.698132', '0.872665', '10', '120', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('441', '1', '-0.436332', '-2.09439', '10', '120', '0', '0', '0', '0', '0', '0', '19.29', '5', '0');
INSERT INTO `spellmissile` VALUES ('463', '1', '-0.261799', '0.698132', '35', '40', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('481', '1', '-0.261799', '1.5708', '45', '45', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('501', '1', '0.698132', '0.872665', '10', '120', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('502', '1', '0.523599', '1.309', '10', '120', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('526', '1', '0.523599', '1.5708', '65', '65', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('561', '1', '-0.261799', '1.5708', '65', '65', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('581', '1', '0', '0', '50', '50', '0', '0', '0', '0', '0', '0', '0', '4', '0');
INSERT INTO `spellmissile` VALUES ('582', '1', '-0.523599', '1.5708', '90', '90', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('602', '1', '0.523599', '0.523599', '7', '28', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('603', '1', '0.349066', '0.523599', '10', '16', '0.087266', '0.174533', '0.349066', '0.523599', '20', '50', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('621', '1', '0.785398', '0.785398', '22', '22', '0', '0', '0', '0', '0', '0', '19.29', '3', '0');
INSERT INTO `spellmissile` VALUES ('623', '1', '0.698132', '0.872665', '10', '120', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('625', '1', '0', '0', '30', '40', '0', '0', '0', '0', '0', '0', '0', '2', '0');
INSERT INTO `spellmissile` VALUES ('626', '1', '0', '0.698132', '20', '30', '0.523599', '-0.523599', '-0.174533', '0.174533', '0', '0', '-4.9', '2', '0');
INSERT INTO `spellmissile` VALUES ('642', '1', '-0.261799', '1.5708', '60', '60', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('661', '1', '0.698132', '0.872665', '60', '70', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('701', '1', '-0.785398', '-0.785398', '0', '40', '0', '0', '0', '0', '0', '0', '9.8', '0', '0');
INSERT INTO `spellmissile` VALUES ('762', '1', '0.785398', '0.785398', '0', '40', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('763', '63', '0.698132', '1.39626', '10', '120', '-0.022689', '0.022689', '-0.017453', '0.017453', '-10', '10', '19.28', '0', '0');
INSERT INTO `spellmissile` VALUES ('764', '1', '-0.349066', '1.5708', '50', '55.48', '0', '0.017453', '0', '0', '0', '0', '6.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('766', '1', '0.349066', '0.349066', '30', '30', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('781', '1', '-0.349066', '1.5708', '50', '55.48', '0', '0.017453', '0', '0', '0', '0', '6.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('841', '1', '0.785398', '0.785398', '19', '19', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('862', '1', '-0.785398', '0.174533', '80', '80', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('903', '1', '0', '0', '50', '55.48', '0', '0', '0', '0', '0', '0', '9.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('923', '1', '-0.785398', '0.174533', '80', '80', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('944', '17', '0', '0', '75', '75', '0', '0', '0', '0', '0', '0', '0', '3', '12');
INSERT INTO `spellmissile` VALUES ('945', '1', '0.261799', '0.261799', '60', '60', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('982', '1', '0', '0.523599', '30', '40', '0', '0', '0', '0', '0', '0', '9', '0', '0');
INSERT INTO `spellmissile` VALUES ('1002', '1', '-0.698132', '-1.0472', '30', '40', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('1003', '1', '0', '0.872665', '15', '20', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('1004', '1', '0', '0.872665', '15', '20', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('1005', '1', '0.698132', '0.872665', '60', '70', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('1006', '1', '0', '0', '100', '100', '0', '0', '0', '0', '0', '0', '0', '1.5', '0');
INSERT INTO `spellmissile` VALUES ('1007', '1', '0', '0', '50', '50', '0', '0', '0', '0', '0', '0', '0', '1.2', '0');
INSERT INTO `spellmissile` VALUES ('1022', '1', '-0.261799', '1.5708', '45', '45', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('1023', '1', '-0.261799', '1.0472', '65', '65', '0', '0', '0', '0', '0', '0', '40', '0', '0');
INSERT INTO `spellmissile` VALUES ('1024', '1', '0.523599', '1.5708', '65', '65', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('1062', '1', '0', '0', '30', '30', '0', '0', '0', '0', '0', '0', '25.29', '90', '0');
INSERT INTO `spellmissile` VALUES ('1102', '1', '0', '0', '90', '90', '0', '0', '0', '0', '0', '0', '0', '1.5', '0');
INSERT INTO `spellmissile` VALUES ('1162', '1', '0', '0', '50', '55.48', '0', '0', '0', '0', '0', '0', '5', '6', '0');
INSERT INTO `spellmissile` VALUES ('1182', '1', '0', '0', '90', '90', '0', '0', '0', '0', '0', '0', '0', '1.5', '0');
INSERT INTO `spellmissile` VALUES ('1222', '1', '0.698132', '0.872665', '30', '40', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('1263', '1', '0', '0', '30', '30', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `spellmissile` VALUES ('1264', '1', '0', '0', '30', '30', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `spellmissile` VALUES ('1265', '1', '0', '0', '30', '30', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `spellmissile` VALUES ('1266', '1', '0', '0', '30', '30', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `spellmissile` VALUES ('1267', '1', '0', '0', '30', '30', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `spellmissile` VALUES ('1342', '19', '0.523599', '1.5708', '25', '90', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('1364', '17', '-0.261799', '1.0472', '65', '65', '0', '0', '0', '0', '0', '0', '40', '0', '5');
INSERT INTO `spellmissile` VALUES ('1365', '17', '-0.523599', '1.0472', '120', '120', '0', '0', '-0.191986', '-0.191986', '0', '0', '0', '2', '5');
INSERT INTO `spellmissile` VALUES ('1372', '1', '0.872665', '0.872665', '30', '40', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('1382', '1', '0.523599', '1.0472', '65', '65', '0', '0', '0', '0', '0', '0', '40', '0', '0');
INSERT INTO `spellmissile` VALUES ('1402', '17', '0.523599', '1.5708', '65', '65', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('1422', '17', '0', '1.5708', '20', '90', '0', '0', '-0.087266', '-0.087266', '0', '0', '19', '0', '3');
INSERT INTO `spellmissile` VALUES ('1442', '1', '0.087266', '0.087266', '90', '90', '0', '0', '0', '0', '0', '0', '80', '0', '0');
INSERT INTO `spellmissile` VALUES ('1482', '1', '-0.261799', '1.0472', '65', '65', '0', '0', '0', '0', '0', '0', '40', '0', '0');
INSERT INTO `spellmissile` VALUES ('1522', '17', '0', '0', '75', '75', '0', '0', '0', '0', '0', '0', '0', '1.15', '4');
INSERT INTO `spellmissile` VALUES ('1523', '17', '0', '0', '100', '100', '0', '0', '0', '0', '0', '0', '0', '1', '4');
INSERT INTO `spellmissile` VALUES ('1662', '1', '0.523599', '1.0472', '65', '65', '0', '0', '0', '0', '0', '0', '40', '0', '0');
INSERT INTO `spellmissile` VALUES ('1682', '17', '0.523599', '1.5708', '65', '65', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('1702', '17', '-0.523599', '1.0472', '120', '120', '0', '0', '-0.191986', '-0.191986', '0', '0', '0', '2', '5');
INSERT INTO `spellmissile` VALUES ('1802', '1', '-0.261799', '1.5708', '60', '60', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('1824', '3', '0.698132', '0.872665', '60', '60', '0', '0', '0', '0', '0', '0', '19.4', '0', '0');
INSERT INTO `spellmissile` VALUES ('1863', '1', '0.872665', '0.872665', '65', '65', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('1882', '1', '-0.261799', '1.5708', '90', '90', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('1902', '1', '-0.261799', '1.5708', '90', '90', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('1922', '1', '-0.261799', '0.785398', '35', '45', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('1962', '1', '0.872665', '0.872665', '65', '65', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('1982', '1', '0.872665', '0.872665', '65', '65', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('2022', '1', '-0.261799', '1.5708', '60', '60', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('2023', '1', '-0.261799', '0.785398', '35', '45', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('2024', '1', '-0.261799', '1.0472', '65', '65', '0', '0', '0', '0', '0', '0', '40', '0', '0');
INSERT INTO `spellmissile` VALUES ('2042', '1', '-0.261799', '1.5708', '60', '60', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('2062', '1', '-0.261799', '0.785398', '35', '45', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('2063', '1', '-0.261799', '0.785398', '35', '45', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('2162', '1', '-0.261799', '1.5708', '90', '90', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('2163', '1', '0.872665', '0.872665', '65', '65', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('2164', '1', '0.872665', '0.872665', '65', '65', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('2165', '1', '0.872665', '0.872665', '65', '65', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('2166', '1', '-0.261799', '1.5708', '60', '60', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('2264', '1', '-0.261799', '1.5708', '90', '90', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('2342', '1', '-0.261799', '1.5708', '90', '90', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('2362', '1', '-0.261799', '1.0472', '65', '65', '0', '0', '0', '0', '0', '0', '40', '0', '0');
INSERT INTO `spellmissile` VALUES ('2503', '1', '-0.261799', '1.5708', '90', '90', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('2674', '1', '-0.261799', '1.5708', '90', '90', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('2675', '1', '-0.261799', '1.5708', '90', '90', '0', '0', '0', '0', '0', '0', '30', '0', '0');
INSERT INTO `spellmissile` VALUES ('2694', '1', '0', '1.5708', '30', '40', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('2702', '17', '0.523599', '0.523599', '120', '120', '0', '0', '0', '0', '0', '0', '1', '0.5', '4');
INSERT INTO `spellmissile` VALUES ('2704', '1', '0.698132', '0.872665', '120', '120', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
INSERT INTO `spellmissile` VALUES ('2706', '1', '-0.349066', '0.872665', '30', '40', '0', '0', '0', '0', '0', '0', '19.29', '0', '0');
