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
-- Table structure for table `bannedaddonsdbc`
--

DROP TABLE IF EXISTS `bannedaddonsdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bannedaddonsdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `NameMD51` int(10) NOT NULL DEFAULT '0',
  `NameMD52` int(10) NOT NULL DEFAULT '0',
  `NameMD53` int(10) NOT NULL DEFAULT '0',
  `NameMD54` int(10) NOT NULL DEFAULT '0',
  `VersionMD51` int(10) NOT NULL DEFAULT '0',
  `VersionMD52` int(10) NOT NULL DEFAULT '0',
  `VersionMD53` int(10) NOT NULL DEFAULT '0',
  `VersionMD54` int(10) NOT NULL DEFAULT '0',
  `Timestamp` int(10) NOT NULL DEFAULT '0',
  `State` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bannedaddonsdbc`
--

LOCK TABLES `bannedaddonsdbc` WRITE;
/*!40000 ALTER TABLE `bannedaddonsdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `bannedaddonsdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `bannedaddonsdbc`
--

INSERT INTO `bannedaddonsdbc` VALUES ('1', '-645128748', '78774415', '-1744207639', '2118318316', '-645128748', '78774415', '-1744207639', '2118318316', '1228172248', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('2', '-645128748', '78774415', '-1744207639', '2118318316', '-645128748', '78774415', '-1744207639', '2118318316', '1228172273', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('3', '-645128748', '78774415', '-1744207639', '2118318316', '-645128748', '78774415', '-1744207639', '2118318316', '1228172273', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('4', '-645128748', '78774415', '-1744207639', '2118318316', '-645128748', '78774415', '-1744207639', '2118318316', '1228172273', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('5', '-645128748', '78774415', '-1744207639', '2118318316', '-645128748', '78774415', '-1744207639', '2118318316', '1228172273', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('6', '-645128748', '78774415', '-1744207639', '2118318316', '-645128748', '78774415', '-1744207639', '2118318316', '1228172273', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('7', '-645128748', '78774415', '-1744207639', '2118318316', '-645128748', '78774415', '-1744207639', '2118318316', '1228172273', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('8', '-645128748', '78774415', '-1744207639', '2118318316', '-645128748', '78774415', '-1744207639', '2118318316', '1228172273', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('9', '-645128748', '78774415', '-1744207639', '2118318316', '-645128748', '78774415', '-1744207639', '2118318316', '1228172273', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('10', '-645128748', '78774415', '-1744207639', '2118318316', '-645128748', '78774415', '-1744207639', '2118318316', '1228172273', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('11', '-645128748', '78774415', '-1744207639', '2118318316', '-645128748', '78774415', '-1744207639', '2118318316', '1228172521', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('238', '0', '0', '0', '0', '0', '0', '0', '0', '1262701883', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('239', '0', '0', '0', '0', '0', '0', '0', '0', '1262701883', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('240', '0', '0', '0', '0', '0', '0', '0', '0', '1262701883', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('241', '0', '0', '0', '0', '0', '0', '0', '0', '1262701883', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('271', '0', '0', '0', '0', '0', '0', '0', '0', '1262704781', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('292', '0', '0', '0', '0', '0', '0', '0', '0', '1262704781', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('313', '0', '0', '0', '0', '0', '0', '0', '0', '1262704781', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('334', '0', '0', '0', '0', '0', '0', '0', '0', '1262704781', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('338', '0', '0', '0', '0', '0', '0', '0', '0', '1262706068', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('339', '0', '0', '0', '0', '0', '0', '0', '0', '1262706068', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('340', '0', '0', '0', '0', '0', '0', '0', '0', '1262706068', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('341', '0', '0', '0', '0', '0', '0', '0', '0', '1262772773', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('342', '0', '0', '0', '0', '0', '0', '0', '0', '1262772773', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('343', '0', '0', '0', '0', '0', '0', '0', '0', '1262773433', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('344', '0', '0', '0', '0', '0', '0', '0', '0', '1262773433', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('345', '0', '0', '0', '0', '0', '0', '0', '0', '1262780972', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('346', '0', '0', '0', '0', '0', '0', '0', '0', '1262780972', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('347', '0', '0', '0', '0', '0', '0', '0', '0', '1262780972', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('348', '0', '0', '0', '0', '0', '0', '0', '0', '1262780972', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('349', '0', '0', '0', '0', '0', '0', '0', '0', '1262780972', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('350', '0', '0', '0', '0', '0', '0', '0', '0', '1262780972', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('351', '0', '0', '0', '0', '0', '0', '0', '0', '1262780972', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('352', '0', '0', '0', '0', '0', '0', '0', '0', '1262780972', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('353', '0', '0', '0', '0', '0', '0', '0', '0', '1262780972', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('354', '0', '0', '0', '0', '0', '0', '0', '0', '1262780972', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('355', '0', '0', '0', '0', '0', '0', '0', '0', '1262780972', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('356', '0', '0', '0', '0', '0', '0', '0', '0', '1262781146', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('357', '0', '0', '0', '0', '0', '0', '0', '0', '1262781146', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('358', '0', '0', '0', '0', '0', '0', '0', '0', '1262781146', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('359', '0', '0', '0', '0', '0', '0', '0', '0', '1262781146', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('360', '0', '0', '0', '0', '0', '0', '0', '0', '1262781146', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('361', '0', '0', '0', '0', '0', '0', '0', '0', '1262781146', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('362', '0', '0', '0', '0', '0', '0', '0', '0', '1262781785', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('363', '0', '0', '0', '0', '0', '0', '0', '0', '1262781785', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('364', '0', '0', '0', '0', '0', '0', '0', '0', '1262781941', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('365', '0', '0', '0', '0', '0', '0', '0', '0', '1262781941', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('366', '0', '0', '0', '0', '0', '0', '0', '0', '1262782199', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('367', '0', '0', '0', '0', '0', '0', '0', '0', '1262782199', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('368', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('369', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('370', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('371', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('372', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('373', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('374', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('375', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('376', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('377', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('378', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('379', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('380', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('381', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('382', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('383', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('384', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('385', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('386', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('387', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('388', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('389', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('390', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('391', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('392', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('393', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('394', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('395', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('396', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('397', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('398', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('399', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('400', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('401', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('402', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('403', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('404', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('405', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('406', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('407', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('408', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('409', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('410', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('411', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('412', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('413', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('414', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('415', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('416', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('417', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('418', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('419', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
INSERT INTO `bannedaddonsdbc` VALUES ('420', '0', '0', '0', '0', '0', '0', '0', '0', '1262785851', '2');
