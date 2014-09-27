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
-- Table structure for table `dungeonmap`
--

DROP TABLE IF EXISTS `dungeonmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dungeonmap` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Map` int(10) NOT NULL DEFAULT '0',
  `Layer` int(10) NOT NULL DEFAULT '0',
  `X` float NOT NULL DEFAULT '0',
  `Y` float NOT NULL DEFAULT '0',
  `Z` float NOT NULL DEFAULT '0',
  `O` float NOT NULL DEFAULT '0',
  `Area` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dungeonmap`
--

LOCK TABLES `dungeonmap` WRITE;
/*!40000 ALTER TABLE `dungeonmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `dungeonmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `dungeonmap`
--

INSERT INTO `dungeonmap` VALUES ('31', '0', '1', '-510', '424', '-40.3333', '582.333', '0');
INSERT INTO `dungeonmap` VALUES ('44', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `dungeonmap` VALUES ('28', '43', '1', '-410.946', '595.529', '-483.479', '187.504', '0');
INSERT INTO `dungeonmap` VALUES ('56', '533', '1', '-3734.1', '-2640.27', '2886.61', '3615.83', '488');
INSERT INTO `dungeonmap` VALUES ('57', '533', '2', '-4234.1', '-3140.27', '2886.61', '3615.83', '488');
INSERT INTO `dungeonmap` VALUES ('58', '533', '3', '-3787', '-2587', '2336', '3136', '488');
INSERT INTO `dungeonmap` VALUES ('59', '533', '4', '-4287.35', '-3087.02', '2336.61', '3136.83', '488');
INSERT INTO `dungeonmap` VALUES ('60', '533', '5', '-4400.09', '-2330.28', '2311.34', '3691.22', '488');
INSERT INTO `dungeonmap` VALUES ('73', '533', '6', '-5522.29', '-4866.35', '3379.25', '3816.54', '488');
INSERT INTO `dungeonmap` VALUES ('27', '571', '1', '222.495', '1052.51', '5513.33', '6066.67', '495');
INSERT INTO `dungeonmap` VALUES ('26', '571', '2', '352.646', '915.87', '5599.85', '5975.34', '495');
INSERT INTO `dungeonmap` VALUES ('1', '574', '1', '-310.406', '424.175', '25.6665', '515.388', '491');
INSERT INTO `dungeonmap` VALUES ('2', '574', '2', '-238.156', '242.925', '-16.3333', '304.387', '491');
INSERT INTO `dungeonmap` VALUES ('41', '574', '3', '-510.906', '225.675', '-75.3335', '415.721', '491');
INSERT INTO `dungeonmap` VALUES ('39', '575', '1', '-697.559', '-148.623', '186.92', '552.877', '491');
INSERT INTO `dungeonmap` VALUES ('40', '575', '2', '-747.558', '8.62196', '157.839', '661.958', '491');
INSERT INTO `dungeonmap` VALUES ('25', '576', '1', '-708.069', '393.212', '64.0755', '798.263', '486');
INSERT INTO `dungeonmap` VALUES ('42', '578', '1', '787.253', '1301.96', '877.071', '1220.21', '486');
INSERT INTO `dungeonmap` VALUES ('43', '578', '2', '712.253', '1376.96', '927.071', '1370.21', '486');
INSERT INTO `dungeonmap` VALUES ('45', '578', '3', '787.253', '1301.96', '927.071', '1270.21', '486');
INSERT INTO `dungeonmap` VALUES ('46', '578', '4', '897.259', '1191.96', '990.406', '1186.87', '486');
INSERT INTO `dungeonmap` VALUES ('34', '595', '1', '731.06', '1856.36', '1891.76', '2641.96', '161');
INSERT INTO `dungeonmap` VALUES ('53', '599', '1', '206.324', '1126.52', '762.444', '1375.91', '495');
INSERT INTO `dungeonmap` VALUES ('37', '600', '1', '-927.01', '-307.069', '-595.86', '-182.566', '496');
INSERT INTO `dungeonmap` VALUES ('38', '600', '2', '-1002.01', '-382.069', '-595.86', '-182.566', '496');
INSERT INTO `dungeonmap` VALUES ('47', '601', '1', '-30', '722.974', '292.142', '794.125', '488');
INSERT INTO `dungeonmap` VALUES ('48', '601', '2', '400', '692.974', '450.474', '645.79', '488');
INSERT INTO `dungeonmap` VALUES ('49', '601', '3', '462.125', '829.625', '395', '640', '488');
INSERT INTO `dungeonmap` VALUES ('54', '602', '1', '-282.549', '283.686', '1157.05', '1534.54', '495');
INSERT INTO `dungeonmap` VALUES ('55', '602', '2', '-538.549', '169.688', '959.72', '1431.88', '495');
INSERT INTO `dungeonmap` VALUES ('69', '603', '1', '-445.235', '224.216', '1392.71', '1839.01', '495');
INSERT INTO `dungeonmap` VALUES ('70', '603', '2', '-674.74', '653.721', '1679.04', '2564.68', '495');
INSERT INTO `dungeonmap` VALUES ('71', '603', '3', '-315.75', '594.75', '1612', '2219', '495');
INSERT INTO `dungeonmap` VALUES ('72', '603', '4', '1684.99', '3254.45', '2122.53', '3168.83', '495');
INSERT INTO `dungeonmap` VALUES ('98', '603', '5', '-310.014', '309.455', '1834.77', '2247.75', '495');
INSERT INTO `dungeonmap` VALUES ('36', '604', '1', '259.887', '1164.92', '1465.52', '2068.87', '496');
INSERT INTO `dungeonmap` VALUES ('52', '608', '1', '665.347', '921.576', '1813.35', '1984.17', '504');
INSERT INTO `dungeonmap` VALUES ('61', '616', '1', '1036.71', '1466.78', '611.128', '897.841', '486');
INSERT INTO `dungeonmap` VALUES ('50', '619', '1', '-1205.72', '-233.302', '200.405', '848.684', '488');
INSERT INTO `dungeonmap` VALUES ('63', '624', '1', '-812.519', '585.736', '-634.08', '298.09', '501');
INSERT INTO `dungeonmap` VALUES ('103', '631', '1', '1384.33', '2739.8', '-764.84', '138.807', '492');
INSERT INTO `dungeonmap` VALUES ('104', '631', '2', '1631', '2698', '-754.667', '-43.3333', '492');
INSERT INTO `dungeonmap` VALUES ('105', '631', '3', '2116.33', '2311.8', '-580.313', '-449.998', '492');
INSERT INTO `dungeonmap` VALUES ('106', '631', '4', '1993.57', '2767.28', '4012.41', '4528.22', '492');
INSERT INTO `dungeonmap` VALUES ('107', '631', '5', '2216.06', '3364.8', '4002.41', '4768.23', '492');
INSERT INTO `dungeonmap` VALUES ('108', '631', '6', '2586.57', '2960.28', '4455.75', '4704.88', '492');
INSERT INTO `dungeonmap` VALUES ('109', '631', '7', '-2271.55', '-1978.29', '410.292', '605.799', '492');
INSERT INTO `dungeonmap` VALUES ('110', '631', '8', '-2648.26', '-2400.33', '414.108', '579.396', '492');
INSERT INTO `dungeonmap` VALUES ('101', '632', '1', '1686.03', '3134.13', '4814.53', '5779.93', '492');
INSERT INTO `dungeonmap` VALUES ('94', '649', '1', '-41.2552', '328.731', '446.361', '693.019', '492');
INSERT INTO `dungeonmap` VALUES ('100', '649', '1', '-41.2552', '328.731', '446.361', '693.019', '492');
INSERT INTO `dungeonmap` VALUES ('95', '649', '2', '-211.26', '528.736', '433.024', '926.354', '492');
INSERT INTO `dungeonmap` VALUES ('96', '650', '1', '437.424', '807.41', '629.448', '876.106', '492');
INSERT INTO `dungeonmap` VALUES ('99', '650', '1', '437.424', '807.41', '629.448', '876.106', '492');
INSERT INTO `dungeonmap` VALUES ('102', '668', '1', '1469.99', '2349.01', '5126.99', '5713.01', '492');
