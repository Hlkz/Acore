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
-- Table structure for table `itemgroupsounds`
--

DROP TABLE IF EXISTS `itemgroupsounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemgroupsounds` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Pickup` int(10) NOT NULL DEFAULT '0',
  `Putdown` int(10) NOT NULL DEFAULT '0',
  `Unk1` int(10) NOT NULL DEFAULT '0',
  `Unk2` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemgroupsounds`
--

LOCK TABLES `itemgroupsounds` WRITE;
/*!40000 ALTER TABLE `itemgroupsounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemgroupsounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `itemgroupsounds`
--

INSERT INTO `itemgroupsounds` VALUES ('1', '273', '274', '275', '0');
INSERT INTO `itemgroupsounds` VALUES ('2', '274', '0', '274', '0');
INSERT INTO `itemgroupsounds` VALUES ('3', '273', '0', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('4', '0', '0', '275', '0');
INSERT INTO `itemgroupsounds` VALUES ('5', '0', '0', '273', '0');
INSERT INTO `itemgroupsounds` VALUES ('6', '0', '0', '274', '0');
INSERT INTO `itemgroupsounds` VALUES ('7', '1185', '1202', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('8', '1191', '1213', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('9', '1190', '1207', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('10', '1195', '1212', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('11', '1188', '1206', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('12', '1198', '1217', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('13', '1217', '1216', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('14', '1193', '1210', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('15', '1189', '1208', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('16', '1186', '1203', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('17', '1197', '1215', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('18', '1183', '1200', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('19', '1184', '1201', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('20', '1192', '1209', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('21', '1196', '1214', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('22', '1194', '1211', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('23', '1187', '1205', '0', '0');
INSERT INTO `itemgroupsounds` VALUES ('24', '1221', '1204', '0', '0');
