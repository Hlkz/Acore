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
-- Table structure for table `helmetgeosetvisdata`
--

DROP TABLE IF EXISTS `helmetgeosetvisdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helmetgeosetvisdata` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `HairFlags` int(10) NOT NULL DEFAULT '0',
  `Facial1Flags` int(10) NOT NULL DEFAULT '0',
  `Facial2Flags` int(10) NOT NULL DEFAULT '0',
  `Facial3Flags` int(10) NOT NULL DEFAULT '0',
  `EarsFlags` int(10) NOT NULL DEFAULT '0',
  `Unk1` int(10) NOT NULL DEFAULT '0',
  `Unk2` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helmetgeosetvisdata`
--

LOCK TABLES `helmetgeosetvisdata` WRITE;
/*!40000 ALTER TABLE `helmetgeosetvisdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `helmetgeosetvisdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `helmetgeosetvisdata`
--

INSERT INTO `helmetgeosetvisdata` VALUES ('245', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('246', '-65', '0', '128', '4', '-1297', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('247', '0', '-33', '-65', '-289', '0', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('248', '-65', '-33', '-65', '-289', '-273', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('249', '-65', '0', '128', '0', '2112', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('265', '-65', '0', '0', '0', '-3575', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('285', '4094', '4094', '4094', '4094', '4094', '256', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('305', '3518', '0', '0', '2204', '64', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('306', '3518', '1502', '1534', '1246', '3310', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('307', '3518', '0', '128', '1052', '2286', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('325', '958', '0', '0', '1022', '64', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('345', '3518', '64', '3230', '140', '2254', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('365', '0', '0', '128', '0', '0', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('366', '4030', '0', '128', '4', '0', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('367', '3518', '0', '0', '1086', '0', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('368', '-1', '-33', '-1', '-1', '-1', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('369', '0', '62430', '62398', '65246', '0', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('370', '0', '0', '0', '0', '0', '0', '-1');
INSERT INTO `helmetgeosetvisdata` VALUES ('371', '0', '0', '0', '0', '-1', '-1', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('372', '0', '0', '0', '0', '-1', '0', '0');
INSERT INTO `helmetgeosetvisdata` VALUES ('376', '4194238', '0', '128', '4', '4194302', '1024', '0');
