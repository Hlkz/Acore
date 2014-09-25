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
-- Table structure for table `scalingstatdistributiondbc`
--

DROP TABLE IF EXISTS `scalingstatdistributiondbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scalingstatdistributiondbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `StatMod1` int(10) NOT NULL DEFAULT '0',
  `StatMod2` int(10) NOT NULL DEFAULT '0',
  `StatMod3` int(10) NOT NULL DEFAULT '0',
  `StatMod4` int(10) NOT NULL DEFAULT '0',
  `StatMod5` int(10) NOT NULL DEFAULT '0',
  `StatMod6` int(10) NOT NULL DEFAULT '0',
  `StatMod7` int(10) NOT NULL DEFAULT '0',
  `StatMod8` int(10) NOT NULL DEFAULT '0',
  `StatMod9` int(10) NOT NULL DEFAULT '0',
  `StatMod10` int(10) NOT NULL DEFAULT '0',
  `Modifier1` int(10) NOT NULL DEFAULT '0',
  `Modifier2` int(10) NOT NULL DEFAULT '0',
  `Modifier3` int(10) NOT NULL DEFAULT '0',
  `Modifier4` int(10) NOT NULL DEFAULT '0',
  `Modifier5` int(10) NOT NULL DEFAULT '0',
  `Modifier6` int(10) NOT NULL DEFAULT '0',
  `Modifier7` int(10) NOT NULL DEFAULT '0',
  `Modifier8` int(10) NOT NULL DEFAULT '0',
  `Modifier9` int(10) NOT NULL DEFAULT '0',
  `Modifier10` int(10) NOT NULL DEFAULT '0',
  `MaxLevel` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scalingstatdistributiondbc`
--

LOCK TABLES `scalingstatdistributiondbc` WRITE;
/*!40000 ALTER TABLE `scalingstatdistributiondbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `scalingstatdistributiondbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `scalingstatdistributiondbc`
--

INSERT INTO `scalingstatdistributiondbc` VALUES ('1', '4', '7', '32', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '5259', '7888', '5259', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('2', '38', '3', '31', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '14532', '4106', '3193', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('3', '38', '7', '32', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '10518', '7888', '5259', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('4', '38', '32', '31', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '13332', '4767', '3900', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('5', '7', '5', '32', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '7150', '5850', '4766', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('6', '7', '5', '43', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '5067', '7601', '1350', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('7', '4', '7', '32', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '6666', '6666', '4445', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('8', '38', '3', '7', '5', '-1', '-1', '-1', '-1', '-1', '-1', '10518', '5258', '5641', '3076', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('9', '45', '7', '5', '43', '-1', '-1', '-1', '-1', '-1', '-1', '5201', '6666', '4444', '1778', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('10', '38', '31', '7', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '14532', '4106', '4789', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('11', '45', '7', '5', '6', '-1', '-1', '-1', '-1', '-1', '-1', '6153', '3996', '3997', '5258', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('12', '0', '5', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '5000', '0', '0', '0', '0', '0', '0', '0', '0', '10');
INSERT INTO `scalingstatdistributiondbc` VALUES ('13', '42', '0', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '10');
INSERT INTO `scalingstatdistributiondbc` VALUES ('14', '38', '39', '40', '41', '42', '43', '0', '0', '0', '0', '6500', '6500', '10000', '10000', '10000', '10000', '0', '0', '0', '0', '15');
INSERT INTO `scalingstatdistributiondbc` VALUES ('15', '40', '41', '42', '0', '0', '0', '0', '0', '0', '0', '4200', '5200', '6200', '0', '0', '0', '0', '0', '0', '0', '10');
INSERT INTO `scalingstatdistributiondbc` VALUES ('16', '45', '7', '5', '6', '-1', '-1', '-1', '-1', '-1', '-1', '6153', '3996', '3997', '5258', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('21', '12', '13', '14', '15', '16', '0', '0', '0', '0', '0', '5000', '6000', '7000', '8000', '9000', '0', '0', '0', '0', '0', '10');
INSERT INTO `scalingstatdistributiondbc` VALUES ('41', '3', '4', '5', '6', '7', '12', '13', '14', '15', '16', '10000', '10000', '10000', '10000', '10000', '10000', '10000', '10000', '10000', '10000', '10');
INSERT INTO `scalingstatdistributiondbc` VALUES ('42', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '10000', '10000', '10000', '10000', '10000', '10000', '10000', '10000', '10000', '10000', '10');
INSERT INTO `scalingstatdistributiondbc` VALUES ('43', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '10000', '10000', '10000', '10000', '10000', '10000', '10000', '10000', '10000', '10000', '10');
INSERT INTO `scalingstatdistributiondbc` VALUES ('102', '44', '0', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15');
INSERT INTO `scalingstatdistributiondbc` VALUES ('103', '3', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '10000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `scalingstatdistributiondbc` VALUES ('104', '32', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '10000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('105', '13', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '10000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `scalingstatdistributiondbc` VALUES ('221', '4', '7', '32', '36', '-1', '-1', '-1', '-1', '-1', '-1', '4844', '7266', '4106', '3193', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('222', '3', '44', '7', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '5259', '3506', '5259', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('223', '7', '5', '32', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '4859', '5732', '2519', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('224', '38', '3', '31', '7', '-1', '-1', '-1', '-1', '-1', '-1', '9688', '4844', '3193', '6159', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('241', '45', '0', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('251', '36', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '6666', '0', '0', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('271', '45', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '7800', '0', '0', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('291', '38', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '23252', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `scalingstatdistributiondbc` VALUES ('292', '38', '7', '35', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '10518', '7888', '5258', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('293', '4', '7', '35', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '7266', '4789', '4106', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('294', '38', '32', '35', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '8212', '7266', '3193', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('295', '7', '35', '43', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '6666', '6666', '1777', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('296', '7', '31', '35', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '7888', '5259', '5258', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('297', '35', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '5259', '0', '0', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('298', '35', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '6667', '0', '0', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('299', '35', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '6667', '0', '0', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('300', '4', '7', '35', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '5259', '7888', '5258', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('301', '45', '7', '43', '35', '-1', '-1', '-1', '-1', '-1', '-1', '5200', '6666', '1776', '4444', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('302', '38', '3', '7', '35', '-1', '-1', '-1', '-1', '-1', '-1', '8888', '4444', '6668', '4444', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('303', '45', '7', '5', '35', '-1', '-1', '-1', '-1', '-1', '-1', '6153', '5259', '3506', '5258', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('304', '38', '3', '7', '35', '-1', '-1', '-1', '-1', '-1', '-1', '8888', '3899', '6666', '4767', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('305', '45', '7', '6', '35', '-1', '-1', '-1', '-1', '-1', '-1', '6153', '5259', '3506', '5258', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('306', '45', '7', '32', '35', '-1', '-1', '-1', '-1', '-1', '-1', '6153', '5259', '3506', '5258', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('311', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `scalingstatdistributiondbc` VALUES ('331', '38', '3', '7', '5', '-1', '-1', '-1', '-1', '-1', '-1', '10518', '5258', '5259', '3506', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('332', '45', '7', '5', '43', '-1', '-1', '-1', '-1', '-1', '-1', '6153', '3997', '3997', '2629', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('333', '4', '7', '32', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '5996', '5996', '5258', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('334', '45', '7', '5', '6', '-1', '-1', '-1', '-1', '-1', '-1', '6153', '3997', '3997', '5259', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('335', '38', '7', '31', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '10518', '7888', '5259', '0', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('336', '45', '7', '5', '6', '-1', '-1', '-1', '-1', '-1', '-1', '6153', '3997', '3997', '5259', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('351', '3', '38', '7', '32', '-1', '-1', '-1', '-1', '-1', '-1', '5259', '7012', '7889', '3506', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('352', '3', '44', '7', '38', '-1', '-1', '-1', '-1', '-1', '-1', '5259', '3506', '7889', '7012', '0', '0', '0', '0', '0', '0', '80');
INSERT INTO `scalingstatdistributiondbc` VALUES ('371', '32', '31', '7', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '7266', '4106', '4789', '0', '0', '0', '0', '0', '0', '0', '80');
