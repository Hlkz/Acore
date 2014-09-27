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
-- Table structure for table `loadingscreentaxisplines`
--

DROP TABLE IF EXISTS `loadingscreentaxisplines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loadingscreentaxisplines` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `TaxiPath` int(10) NOT NULL DEFAULT '0',
  `X1` float NOT NULL DEFAULT '0',
  `X2` float NOT NULL DEFAULT '0',
  `X3` float NOT NULL DEFAULT '0',
  `X4` float NOT NULL DEFAULT '0',
  `X5` float NOT NULL DEFAULT '0',
  `X6` float NOT NULL DEFAULT '0',
  `X7` float NOT NULL DEFAULT '0',
  `X8` float NOT NULL DEFAULT '0',
  `Y1` float NOT NULL DEFAULT '0',
  `Y2` float NOT NULL DEFAULT '0',
  `Y3` float NOT NULL DEFAULT '0',
  `Y4` float NOT NULL DEFAULT '0',
  `Y5` float NOT NULL DEFAULT '0',
  `Y6` float NOT NULL DEFAULT '0',
  `Y7` float NOT NULL DEFAULT '0',
  `Y8` float NOT NULL DEFAULT '0',
  `LegIndex` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loadingscreentaxisplines`
--

LOCK TABLES `loadingscreentaxisplines` WRITE;
/*!40000 ALTER TABLE `loadingscreentaxisplines` DISABLE KEYS */;
/*!40000 ALTER TABLE `loadingscreentaxisplines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `loadingscreentaxisplines`
--

INSERT INTO `loadingscreentaxisplines` VALUES ('101', '241', '0.534392', '0.652557', '0', '0', '0', '0', '0', '0', '0.376238', '0.19604', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `loadingscreentaxisplines` VALUES ('102', '241', '0.679012', '0.525573', '0', '0', '0', '0', '0', '0', '0.223762', '0.251485', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `loadingscreentaxisplines` VALUES ('123', '285', '0.571429', '0.439153', '0', '0', '0', '0', '0', '0', '0.384158', '0.423762', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `loadingscreentaxisplines` VALUES ('124', '285', '0.439153', '0.574956', '0', '0', '0', '0', '0', '0', '0.417822', '0.362376', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `loadingscreentaxisplines` VALUES ('143', '301', '0.749559', '0.768959', '0.779541', '0.744268', '0.768959', '0', '0', '0', '0.30099', '0.4', '0.522772', '0.621782', '0.704951', '0', '0', '0', '0');
INSERT INTO `loadingscreentaxisplines` VALUES ('144', '301', '0.779541', '0.740741', '0.693122', '0.663139', '0.675485', '0', '0', '0', '0.706931', '0.631683', '0.524752', '0.394059', '0.285149', '0', '0', '0', '1');
INSERT INTO `loadingscreentaxisplines` VALUES ('145', '292', '0.708995', '0.627866', '0.514991', '0.380952', '0', '0', '0', '0', '0.419802', '0.485149', '0.59604', '0.481188', '0', '0', '0', '0', '0');
INSERT INTO `loadingscreentaxisplines` VALUES ('146', '292', '0.349206', '0.419753', '0.506173', '0.640212', '0.680776', '0', '0', '0', '0.352475', '0.520792', '0.605941', '0.508911', '0.419802', '0', '0', '0', '1');
INSERT INTO `loadingscreentaxisplines` VALUES ('147', '295', '0.687831', '0.617284', '0.536155', '0.414462', '0.285714', '0.215168', '0', '0', '0.540594', '0.607921', '0.69901', '0.788119', '0.833663', '0.792079', '0', '0', '0');
INSERT INTO `loadingscreentaxisplines` VALUES ('148', '295', '0.213404', '0.342152', '0.432099', '0.578483', '0.643739', '0', '0', '0', '0.724752', '0.706931', '0.623762', '0.594059', '0.435644', '0', '0', '0', '1');
INSERT INTO `loadingscreentaxisplines` VALUES ('163', '302', '0.366843', '0.474427', '0.550265', '0.638448', '0', '0', '0', '0', '0.566337', '0.631683', '0.685149', '0.734653', '0', '0', '0', '0', '0');
INSERT INTO `loadingscreentaxisplines` VALUES ('164', '302', '0.719577', '0.680776', '0.622575', '0.52381', '0.458554', '0.366843', '0', '0', '0.774257', '0.79802', '0.786139', '0.681188', '0.619802', '0.564356', '0', '0', '1');
INSERT INTO `loadingscreentaxisplines` VALUES ('165', '967', '0.444444', '0.382716', '0.356261', '0.294533', '0.21164', '0.176367', '0', '0', '0.386139', '0.526733', '0.665347', '0.736634', '0.726733', '0.677228', '0', '0', '0');
INSERT INTO `loadingscreentaxisplines` VALUES ('166', '967', '0.19224', '0.275132', '0.356261', '0.409171', '0.534392', '0', '0', '0', '0.70099', '0.730693', '0.683168', '0.514852', '0.362376', '0', '0', '0', '1');
INSERT INTO `loadingscreentaxisplines` VALUES ('167', '965', '0.650794', '0.608466', '0.507937', '0', '0', '0', '0', '0', '0.338614', '0.522772', '0.663366', '0', '0', '0', '0', '0', '0');
INSERT INTO `loadingscreentaxisplines` VALUES ('168', '965', '0.446208', '0.414462', '0.5097', '0.636684', '0', '0', '0', '0', '0.671287', '0.526733', '0.350495', '0.291089', '0', '0', '0', '0', '1');
INSERT INTO `loadingscreentaxisplines` VALUES ('170', '737', '0.717813', '0', '0', '0', '0', '0', '0', '0', '0.683168', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `loadingscreentaxisplines` VALUES ('171', '964', '0.675485', '0', '0', '0', '0', '0', '0', '0', '0.435644', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `loadingscreentaxisplines` VALUES ('172', '964', '0.62963', '0.68254', '0', '0', '0', '0', '0', '0', '0.576238', '0.433663', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `loadingscreentaxisplines` VALUES ('173', '712', '0.398589', '0.356261', '0.319224', '0', '0', '0', '0', '0', '0.657426', '0.506931', '0.463366', '0', '0', '0', '0', '0', '0');
INSERT INTO `loadingscreentaxisplines` VALUES ('174', '712', '0.262787', '0.312169', '0', '0', '0', '0', '0', '0', '0.558416', '0.70495', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `loadingscreentaxisplines` VALUES ('175', '737', '0.700176', '0.756614', '0', '0', '0', '0', '0', '0', '0.714851', '0.671287', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `loadingscreentaxisplines` VALUES ('176', '737', '0.703704', '0.659612', '0', '0', '0', '0', '0', '0', '0.6', '0.659406', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `loadingscreentaxisplines` VALUES ('178', '810', '0.435626', '0.363316', '0.342152', '0', '0', '0', '0', '0', '0.665347', '0.548515', '0.382178', '0', '0', '0', '0', '0', '0');
INSERT INTO `loadingscreentaxisplines` VALUES ('179', '810', '0.377425', '0.45679', '0', '0', '0', '0', '0', '0', '0.413861', '0.639604', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `loadingscreentaxisplines` VALUES ('180', '964', '0.744268', '0.650794', '0.656085', '0', '0', '0', '0', '0', '0.421782', '0.473267', '0.605941', '0', '0', '0', '0', '0', '0');
INSERT INTO `loadingscreentaxisplines` VALUES ('181', '964', '0.64903', '0.671958', '0.663139', '0', '0', '0', '0', '0', '0.629703', '0.578218', '0.433663', '0', '0', '0', '0', '0', '1');
