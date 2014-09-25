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
-- Table structure for table `summonpropertiesdbc`
--

DROP TABLE IF EXISTS `summonpropertiesdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summonpropertiesdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Category` int(10) NOT NULL DEFAULT '0',
  `Faction` int(10) NOT NULL DEFAULT '0',
  `Type` int(10) NOT NULL DEFAULT '0',
  `Slot` int(10) NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summonpropertiesdbc`
--

LOCK TABLES `summonpropertiesdbc` WRITE;
/*!40000 ALTER TABLE `summonpropertiesdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `summonpropertiesdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `summonpropertiesdbc`
--

INSERT INTO `summonpropertiesdbc` VALUES ('41', '1', '0', '5', '5', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('61', '1', '0', '2', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('63', '1', '0', '4', '1', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('64', '0', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('65', '3', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('66', '0', '0', '0', '0', '1');
INSERT INTO `summonpropertiesdbc` VALUES ('67', '2', '0', '1', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('81', '1', '0', '4', '2', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('82', '1', '0', '4', '3', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('83', '1', '0', '4', '4', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('121', '1', '0', '0', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('161', '4', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('181', '1', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('182', '0', '0', '0', '5', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('183', '1', '106', '2', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('184', '1', '210', '2', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('185', '0', '210', '2', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('186', '0', '106', '2', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('187', '0', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('207', '2', '0', '1', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('208', '1', '0', '6', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('209', '1', '0', '7', '0', '512');
INSERT INTO `summonpropertiesdbc` VALUES ('227', '0', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('247', '5', '14', '0', '0', '1');
INSERT INTO `summonpropertiesdbc` VALUES ('267', '0', '0', '0', '5', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('287', '0', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('307', '1', '35', '5', '5', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('327', '4', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('328', '0', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('347', '1', '0', '0', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('367', '4', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('387', '1', '0', '5', '6', '514');
INSERT INTO `summonpropertiesdbc` VALUES ('407', '1', '0', '5', '0', '4');
INSERT INTO `summonpropertiesdbc` VALUES ('409', '1', '0', '1', '5', '4');
INSERT INTO `summonpropertiesdbc` VALUES ('410', '1', '0', '4', '1', '8');
INSERT INTO `summonpropertiesdbc` VALUES ('427', '3', '0', '1', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('428', '3', '1616', '0', '0', '4');
INSERT INTO `summonpropertiesdbc` VALUES ('429', '0', '0', '0', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('447', '1', '0', '2', '6', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('467', '4', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('469', '1', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('487', '1', '0', '2', '6', '770');
INSERT INTO `summonpropertiesdbc` VALUES ('488', '4', '0', '0', '0', '8');
INSERT INTO `summonpropertiesdbc` VALUES ('489', '1', '35', '8', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('490', '1', '0', '0', '0', '16');
INSERT INTO `summonpropertiesdbc` VALUES ('491', '0', '0', '0', '0', '8');
INSERT INTO `summonpropertiesdbc` VALUES ('492', '1', '0', '0', '0', '16');
INSERT INTO `summonpropertiesdbc` VALUES ('493', '4', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('494', '1', '0', '3', '0', '10');
INSERT INTO `summonpropertiesdbc` VALUES ('495', '0', '0', '0', '0', '9');
INSERT INTO `summonpropertiesdbc` VALUES ('496', '1', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('497', '0', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('507', '1', '0', '2', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('527', '0', '2089', '0', '0', '9');
INSERT INTO `summonpropertiesdbc` VALUES ('547', '1', '974', '0', '5', '8216');
INSERT INTO `summonpropertiesdbc` VALUES ('567', '1', '0', '0', '6', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('587', '0', '0', '0', '0', '8');
INSERT INTO `summonpropertiesdbc` VALUES ('607', '4', '0', '2', '6', '264');
INSERT INTO `summonpropertiesdbc` VALUES ('627', '1', '2064', '0', '0', '10');
INSERT INTO `summonpropertiesdbc` VALUES ('628', '0', '0', '0', '6', '8');
INSERT INTO `summonpropertiesdbc` VALUES ('629', '1', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('647', '1', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('648', '0', '0', '0', '0', '64');
INSERT INTO `summonpropertiesdbc` VALUES ('649', '1', '0', '2', '0', '66');
INSERT INTO `summonpropertiesdbc` VALUES ('667', '1', '0', '0', '0', '64');
INSERT INTO `summonpropertiesdbc` VALUES ('668', '0', '0', '0', '5', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('669', '2', '0', '1', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('687', '1', '0', '3', '0', '512');
INSERT INTO `summonpropertiesdbc` VALUES ('688', '1', '35', '2', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('689', '4', '0', '0', '0', '256');
INSERT INTO `summonpropertiesdbc` VALUES ('707', '0', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('708', '4', '0', '0', '0', '256');
INSERT INTO `summonpropertiesdbc` VALUES ('709', '0', '0', '0', '4', '1');
INSERT INTO `summonpropertiesdbc` VALUES ('710', '4', '0', '0', '0', '264');
INSERT INTO `summonpropertiesdbc` VALUES ('711', '2', '0', '3', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('712', '1', '0', '0', '0', '4');
INSERT INTO `summonpropertiesdbc` VALUES ('713', '1', '0', '2', '0', '514');
INSERT INTO `summonpropertiesdbc` VALUES ('714', '0', '0', '0', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('715', '0', '0', '0', '0', '320');
INSERT INTO `summonpropertiesdbc` VALUES ('716', '4', '0', '0', '0', '256');
INSERT INTO `summonpropertiesdbc` VALUES ('717', '0', '0', '0', '0', '1');
INSERT INTO `summonpropertiesdbc` VALUES ('718', '4', '0', '0', '0', '256');
INSERT INTO `summonpropertiesdbc` VALUES ('719', '0', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('720', '1', '0', '7', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('760', '4', '0', '0', '0', '264');
INSERT INTO `summonpropertiesdbc` VALUES ('780', '4', '0', '0', '6', '8');
INSERT INTO `summonpropertiesdbc` VALUES ('781', '1', '0', '0', '0', '80');
INSERT INTO `summonpropertiesdbc` VALUES ('801', '4', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('821', '1', '0', '2', '6', '10');
INSERT INTO `summonpropertiesdbc` VALUES ('822', '1', '0', '0', '6', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('823', '1', '0', '2', '1', '2120');
INSERT INTO `summonpropertiesdbc` VALUES ('824', '4', '0', '0', '0', '256');
INSERT INTO `summonpropertiesdbc` VALUES ('825', '2', '0', '1', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('826', '1', '0', '0', '0', '530');
INSERT INTO `summonpropertiesdbc` VALUES ('827', '4', '0', '0', '0', '264');
INSERT INTO `summonpropertiesdbc` VALUES ('828', '1', '0', '0', '1', '264');
INSERT INTO `summonpropertiesdbc` VALUES ('829', '1', '0', '2', '1', '514');
INSERT INTO `summonpropertiesdbc` VALUES ('830', '1', '0', '2', '0', '258');
INSERT INTO `summonpropertiesdbc` VALUES ('831', '1', '0', '2', '6', '9026');
INSERT INTO `summonpropertiesdbc` VALUES ('832', '1', '0', '7', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('833', '2', '0', '3', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('841', '1', '0', '6', '6', '10');
INSERT INTO `summonpropertiesdbc` VALUES ('842', '1', '0', '2', '0', '514');
INSERT INTO `summonpropertiesdbc` VALUES ('843', '4', '0', '0', '0', '16');
INSERT INTO `summonpropertiesdbc` VALUES ('844', '0', '0', '0', '0', '16');
INSERT INTO `summonpropertiesdbc` VALUES ('861', '4', '0', '0', '0', '256');
INSERT INTO `summonpropertiesdbc` VALUES ('881', '1', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('901', '1', '0', '0', '0', '2304');
INSERT INTO `summonpropertiesdbc` VALUES ('921', '2', '0', '1', '0', '256');
INSERT INTO `summonpropertiesdbc` VALUES ('941', '0', '0', '10', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('942', '1', '0', '0', '0', '272');
INSERT INTO `summonpropertiesdbc` VALUES ('943', '0', '0', '0', '0', '2048');
INSERT INTO `summonpropertiesdbc` VALUES ('944', '1', '0', '6', '0', '2306');
INSERT INTO `summonpropertiesdbc` VALUES ('961', '1', '0', '0', '0', '264');
INSERT INTO `summonpropertiesdbc` VALUES ('962', '1', '0', '0', '6', '3336');
INSERT INTO `summonpropertiesdbc` VALUES ('963', '1', '0', '0', '0', '2312');
INSERT INTO `summonpropertiesdbc` VALUES ('964', '1', '0', '0', '0', '2312');
INSERT INTO `summonpropertiesdbc` VALUES ('965', '1', '0', '0', '0', '2312');
INSERT INTO `summonpropertiesdbc` VALUES ('966', '1', '0', '0', '0', '2312');
INSERT INTO `summonpropertiesdbc` VALUES ('967', '1', '0', '0', '0', '2826');
INSERT INTO `summonpropertiesdbc` VALUES ('968', '1', '0', '0', '0', '8');
INSERT INTO `summonpropertiesdbc` VALUES ('981', '1', '35', '3', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('1001', '0', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('1021', '1', '0', '0', '0', '512');
INSERT INTO `summonpropertiesdbc` VALUES ('1041', '0', '35', '0', '0', '2048');
INSERT INTO `summonpropertiesdbc` VALUES ('1061', '0', '0', '0', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('1081', '4', '0', '9', '0', '256');
INSERT INTO `summonpropertiesdbc` VALUES ('1101', '1', '0', '2', '0', '6');
INSERT INTO `summonpropertiesdbc` VALUES ('1121', '0', '0', '0', '0', '3200');
INSERT INTO `summonpropertiesdbc` VALUES ('1141', '1', '0', '11', '0', '4096');
INSERT INTO `summonpropertiesdbc` VALUES ('1161', '2', '0', '1', '0', '18432');
INSERT INTO `summonpropertiesdbc` VALUES ('1162', '0', '0', '9', '0', '4096');
INSERT INTO `summonpropertiesdbc` VALUES ('1181', '0', '0', '9', '0', '2048');
INSERT INTO `summonpropertiesdbc` VALUES ('1201', '4', '0', '0', '0', '256');
INSERT INTO `summonpropertiesdbc` VALUES ('1202', '0', '0', '0', '0', '256');
INSERT INTO `summonpropertiesdbc` VALUES ('1221', '0', '0', '0', '0', '1');
INSERT INTO `summonpropertiesdbc` VALUES ('1241', '0', '0', '0', '0', '64');
INSERT INTO `summonpropertiesdbc` VALUES ('1261', '1', '0', '2', '0', '2562');
INSERT INTO `summonpropertiesdbc` VALUES ('1281', '4', '0', '0', '0', '8');
INSERT INTO `summonpropertiesdbc` VALUES ('1301', '3', '0', '0', '0', '2304');
INSERT INTO `summonpropertiesdbc` VALUES ('1302', '1', '0', '3', '6', '1032');
INSERT INTO `summonpropertiesdbc` VALUES ('1321', '4', '0', '0', '6', '8');
INSERT INTO `summonpropertiesdbc` VALUES ('1341', '1', '0', '5', '5', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('1342', '2', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('1343', '1', '0', '2', '0', '770');
INSERT INTO `summonpropertiesdbc` VALUES ('1361', '0', '0', '0', '0', '2048');
INSERT INTO `summonpropertiesdbc` VALUES ('1362', '0', '0', '0', '0', '2048');
INSERT INTO `summonpropertiesdbc` VALUES ('1381', '1', '0', '0', '0', '258');
INSERT INTO `summonpropertiesdbc` VALUES ('1401', '1', '35', '2', '1', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('1421', '1', '0', '5', '0', '2056');
INSERT INTO `summonpropertiesdbc` VALUES ('1442', '2', '0', '5', '0', '2056');
INSERT INTO `summonpropertiesdbc` VALUES ('1481', '1', '0', '0', '0', '264');
INSERT INTO `summonpropertiesdbc` VALUES ('1501', '0', '0', '0', '1', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('1502', '0', '0', '0', '2', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('1503', '0', '0', '0', '3', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('1504', '0', '0', '0', '4', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('1541', '4', '35', '10', '0', '2048');
INSERT INTO `summonpropertiesdbc` VALUES ('1561', '2', '0', '1', '0', '16384');
INSERT INTO `summonpropertiesdbc` VALUES ('1562', '2', '0', '1', '0', '16384');
INSERT INTO `summonpropertiesdbc` VALUES ('1581', '1', '0', '2', '0', '2050');
INSERT INTO `summonpropertiesdbc` VALUES ('1641', '4', '0', '0', '0', '264');
INSERT INTO `summonpropertiesdbc` VALUES ('1701', '1', '0', '0', '6', '2120');
INSERT INTO `summonpropertiesdbc` VALUES ('1721', '2', '0', '1', '0', '514');
INSERT INTO `summonpropertiesdbc` VALUES ('1761', '1', '0', '0', '0', '10');
INSERT INTO `summonpropertiesdbc` VALUES ('1781', '1', '0', '0', '0', '2056');
INSERT INTO `summonpropertiesdbc` VALUES ('1841', '1', '0', '5', '5', '256');
INSERT INTO `summonpropertiesdbc` VALUES ('1881', '0', '0', '0', '0', '32768');
INSERT INTO `summonpropertiesdbc` VALUES ('1961', '0', '0', '0', '0', '2048');
INSERT INTO `summonpropertiesdbc` VALUES ('1981', '0', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('2001', '0', '0', '0', '0', '2048');
INSERT INTO `summonpropertiesdbc` VALUES ('2002', '2', '0', '7', '6', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('2041', '1', '0', '3', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('2061', '1', '0', '0', '0', '8');
INSERT INTO `summonpropertiesdbc` VALUES ('2062', '1', '0', '7', '0', '6144');
INSERT INTO `summonpropertiesdbc` VALUES ('2081', '1', '0', '7', '0', '2058');
INSERT INTO `summonpropertiesdbc` VALUES ('2141', '1', '0', '2', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('2181', '0', '0', '12', '0', '4096');
INSERT INTO `summonpropertiesdbc` VALUES ('2221', '1', '0', '0', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('2301', '1', '0', '0', '0', '514');
INSERT INTO `summonpropertiesdbc` VALUES ('2381', '1', '0', '2', '0', '2050');
INSERT INTO `summonpropertiesdbc` VALUES ('2441', '0', '14', '0', '0', '1');
INSERT INTO `summonpropertiesdbc` VALUES ('2481', '0', '0', '0', '0', '4096');
INSERT INTO `summonpropertiesdbc` VALUES ('2581', '0', '0', '0', '0', '2048');
INSERT INTO `summonpropertiesdbc` VALUES ('2601', '4', '0', '0', '0', '4096');
INSERT INTO `summonpropertiesdbc` VALUES ('2621', '1', '0', '0', '0', '8');
INSERT INTO `summonpropertiesdbc` VALUES ('2641', '1', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('2661', '1', '0', '7', '0', '2');
INSERT INTO `summonpropertiesdbc` VALUES ('2742', '4', '0', '0', '0', '4360');
INSERT INTO `summonpropertiesdbc` VALUES ('2761', '5', '14', '0', '0', '1');
INSERT INTO `summonpropertiesdbc` VALUES ('2821', '0', '0', '0', '0', '0');
INSERT INTO `summonpropertiesdbc` VALUES ('2904', '1', '0', '0', '0', '530');
INSERT INTO `summonpropertiesdbc` VALUES ('2905', '0', '0', '0', '0', '2121');
INSERT INTO `summonpropertiesdbc` VALUES ('2908', '5', '14', '0', '0', '9');
INSERT INTO `summonpropertiesdbc` VALUES ('2909', '1', '0', '2', '0', '2826');
INSERT INTO `summonpropertiesdbc` VALUES ('2913', '0', '0', '7', '0', '4096');
INSERT INTO `summonpropertiesdbc` VALUES ('2915', '1', '0', '0', '0', '2056');
INSERT INTO `summonpropertiesdbc` VALUES ('2926', '0', '14', '0', '0', '5');
INSERT INTO `summonpropertiesdbc` VALUES ('2932', '4', '35', '0', '0', '2056');
INSERT INTO `summonpropertiesdbc` VALUES ('2933', '4', '0', '0', '0', '256');
INSERT INTO `summonpropertiesdbc` VALUES ('2935', '1', '0', '0', '0', '2560');
