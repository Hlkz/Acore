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
-- Table structure for table `footstepterrainlookup`
--

DROP TABLE IF EXISTS `footstepterrainlookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footstepterrainlookup` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `GroundEffectDoodad` int(10) NOT NULL DEFAULT '0',
  `TerrainType` int(10) NOT NULL DEFAULT '0',
  `SoundDry` int(10) NOT NULL DEFAULT '0',
  `SoundWet` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footstepterrainlookup`
--

LOCK TABLES `footstepterrainlookup` WRITE;
/*!40000 ALTER TABLE `footstepterrainlookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `footstepterrainlookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `footstepterrainlookup`
--

INSERT INTO `footstepterrainlookup` VALUES ('21', '8', '2', '15168', '1063');
INSERT INTO `footstepterrainlookup` VALUES ('24', '8', '4', '652', '1058');
INSERT INTO `footstepterrainlookup` VALUES ('25', '8', '3', '653', '1057');
INSERT INTO `footstepterrainlookup` VALUES ('67', '8', '7', '651', '1069');
INSERT INTO `footstepterrainlookup` VALUES ('68', '8', '0', '650', '1054');
INSERT INTO `footstepterrainlookup` VALUES ('69', '8', '5', '649', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('70', '10', '2', '1137', '1054');
INSERT INTO `footstepterrainlookup` VALUES ('71', '10', '1', '1137', '1055');
INSERT INTO `footstepterrainlookup` VALUES ('72', '10', '3', '1138', '1057');
INSERT INTO `footstepterrainlookup` VALUES ('73', '10', '4', '1257', '1058');
INSERT INTO `footstepterrainlookup` VALUES ('75', '10', '5', '1139', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('76', '10', '6', '1140', '1060');
INSERT INTO `footstepterrainlookup` VALUES ('77', '10', '7', '1140', '1069');
INSERT INTO `footstepterrainlookup` VALUES ('78', '10', '8', '1137', '1062');
INSERT INTO `footstepterrainlookup` VALUES ('79', '11', '0', '1174', '1054');
INSERT INTO `footstepterrainlookup` VALUES ('80', '11', '1', '1174', '1055');
INSERT INTO `footstepterrainlookup` VALUES ('81', '11', '2', '1174', '1063');
INSERT INTO `footstepterrainlookup` VALUES ('82', '11', '3', '1174', '1057');
INSERT INTO `footstepterrainlookup` VALUES ('83', '11', '4', '1174', '1058');
INSERT INTO `footstepterrainlookup` VALUES ('84', '11', '5', '1174', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('85', '11', '6', '1174', '1060');
INSERT INTO `footstepterrainlookup` VALUES ('86', '11', '7', '1174', '1069');
INSERT INTO `footstepterrainlookup` VALUES ('87', '11', '8', '1174', '1062');
INSERT INTO `footstepterrainlookup` VALUES ('88', '11', '9', '1174', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('89', '8', '1', '650', '1055');
INSERT INTO `footstepterrainlookup` VALUES ('90', '8', '6', '651', '1060');
INSERT INTO `footstepterrainlookup` VALUES ('91', '8', '8', '650', '1062');
INSERT INTO `footstepterrainlookup` VALUES ('92', '8', '9', '651', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('94', '0', '0', '661', '1054');
INSERT INTO `footstepterrainlookup` VALUES ('95', '0', '1', '661', '1055');
INSERT INTO `footstepterrainlookup` VALUES ('96', '0', '2', '661', '1063');
INSERT INTO `footstepterrainlookup` VALUES ('97', '0', '3', '661', '1057');
INSERT INTO `footstepterrainlookup` VALUES ('98', '0', '4', '661', '1058');
INSERT INTO `footstepterrainlookup` VALUES ('99', '0', '5', '661', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('100', '0', '6', '661', '1060');
INSERT INTO `footstepterrainlookup` VALUES ('101', '0', '7', '661', '1069');
INSERT INTO `footstepterrainlookup` VALUES ('103', '0', '8', '661', '1062');
INSERT INTO `footstepterrainlookup` VALUES ('104', '0', '9', '661', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('105', '12', '0', '661', '1054');
INSERT INTO `footstepterrainlookup` VALUES ('106', '12', '1', '661', '1055');
INSERT INTO `footstepterrainlookup` VALUES ('107', '12', '2', '661', '1063');
INSERT INTO `footstepterrainlookup` VALUES ('108', '12', '3', '661', '1057');
INSERT INTO `footstepterrainlookup` VALUES ('109', '12', '4', '661', '1058');
INSERT INTO `footstepterrainlookup` VALUES ('110', '12', '5', '661', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('111', '12', '6', '661', '1060');
INSERT INTO `footstepterrainlookup` VALUES ('112', '12', '7', '661', '1069');
INSERT INTO `footstepterrainlookup` VALUES ('113', '12', '8', '661', '1062');
INSERT INTO `footstepterrainlookup` VALUES ('114', '12', '9', '661', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('115', '13', '0', '1182', '1054');
INSERT INTO `footstepterrainlookup` VALUES ('116', '13', '1', '1182', '1055');
INSERT INTO `footstepterrainlookup` VALUES ('117', '13', '2', '1182', '1063');
INSERT INTO `footstepterrainlookup` VALUES ('118', '13', '3', '1182', '1057');
INSERT INTO `footstepterrainlookup` VALUES ('119', '13', '4', '1182', '1058');
INSERT INTO `footstepterrainlookup` VALUES ('120', '13', '5', '1182', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('121', '13', '6', '1182', '1060');
INSERT INTO `footstepterrainlookup` VALUES ('122', '13', '7', '1182', '1069');
INSERT INTO `footstepterrainlookup` VALUES ('123', '13', '8', '1182', '1062');
INSERT INTO `footstepterrainlookup` VALUES ('124', '13', '9', '1182', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('125', '14', '0', '1265', '1054');
INSERT INTO `footstepterrainlookup` VALUES ('126', '14', '1', '1265', '1055');
INSERT INTO `footstepterrainlookup` VALUES ('127', '14', '2', '1265', '1063');
INSERT INTO `footstepterrainlookup` VALUES ('128', '14', '3', '1265', '1057');
INSERT INTO `footstepterrainlookup` VALUES ('129', '14', '4', '1265', '1058');
INSERT INTO `footstepterrainlookup` VALUES ('130', '14', '5', '1265', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('131', '14', '6', '1265', '1060');
INSERT INTO `footstepterrainlookup` VALUES ('132', '14', '7', '1265', '1069');
INSERT INTO `footstepterrainlookup` VALUES ('133', '14', '8', '1265', '1062');
INSERT INTO `footstepterrainlookup` VALUES ('134', '14', '9', '1265', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('157', '7', '0', '560', '1054');
INSERT INTO `footstepterrainlookup` VALUES ('158', '7', '1', '560', '1055');
INSERT INTO `footstepterrainlookup` VALUES ('159', '7', '2', '15168', '1063');
INSERT INTO `footstepterrainlookup` VALUES ('160', '7', '3', '564', '1057');
INSERT INTO `footstepterrainlookup` VALUES ('161', '7', '4', '563', '1058');
INSERT INTO `footstepterrainlookup` VALUES ('162', '7', '5', '649', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('163', '7', '6', '562', '1060');
INSERT INTO `footstepterrainlookup` VALUES ('164', '7', '7', '562', '1069');
INSERT INTO `footstepterrainlookup` VALUES ('165', '7', '8', '560', '1062');
INSERT INTO `footstepterrainlookup` VALUES ('166', '7', '9', '562', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('167', '6', '1', '2546', '2546');
INSERT INTO `footstepterrainlookup` VALUES ('168', '6', '1', '2546', '2546');
INSERT INTO `footstepterrainlookup` VALUES ('169', '6', '2', '2546', '2546');
INSERT INTO `footstepterrainlookup` VALUES ('170', '6', '3', '2546', '2546');
INSERT INTO `footstepterrainlookup` VALUES ('171', '6', '4', '2546', '2546');
INSERT INTO `footstepterrainlookup` VALUES ('172', '6', '5', '2546', '2546');
INSERT INTO `footstepterrainlookup` VALUES ('173', '6', '6', '2546', '2546');
INSERT INTO `footstepterrainlookup` VALUES ('174', '6', '7', '2546', '2546');
INSERT INTO `footstepterrainlookup` VALUES ('175', '6', '8', '2546', '2546');
INSERT INTO `footstepterrainlookup` VALUES ('176', '6', '9', '2546', '2546');
INSERT INTO `footstepterrainlookup` VALUES ('177', '16', '0', '2550', '1054');
INSERT INTO `footstepterrainlookup` VALUES ('178', '16', '1', '2550', '1055');
INSERT INTO `footstepterrainlookup` VALUES ('179', '16', '2', '2550', '1063');
INSERT INTO `footstepterrainlookup` VALUES ('180', '16', '3', '2550', '1057');
INSERT INTO `footstepterrainlookup` VALUES ('181', '16', '4', '2550', '1058');
INSERT INTO `footstepterrainlookup` VALUES ('182', '16', '5', '2550', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('183', '16', '6', '2550', '1060');
INSERT INTO `footstepterrainlookup` VALUES ('184', '16', '7', '2550', '1069');
INSERT INTO `footstepterrainlookup` VALUES ('185', '16', '8', '2550', '1062');
INSERT INTO `footstepterrainlookup` VALUES ('186', '16', '9', '1174', '0');
INSERT INTO `footstepterrainlookup` VALUES ('187', '10', '9', '1140', '0');
INSERT INTO `footstepterrainlookup` VALUES ('207', '17', '0', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('208', '17', '1', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('209', '17', '2', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('210', '17', '3', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('211', '17', '4', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('212', '17', '5', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('213', '17', '6', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('214', '17', '7', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('215', '17', '8', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('216', '17', '9', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('227', '37', '0', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('228', '37', '1', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('229', '37', '2', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('230', '37', '3', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('231', '37', '4', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('232', '37', '5', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('233', '37', '6', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('234', '37', '7', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('235', '37', '8', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('236', '37', '9', '3526', '0');
INSERT INTO `footstepterrainlookup` VALUES ('247', '57', '1', '732', '0');
INSERT INTO `footstepterrainlookup` VALUES ('248', '57', '2', '733', '0');
INSERT INTO `footstepterrainlookup` VALUES ('249', '57', '3', '733', '0');
INSERT INTO `footstepterrainlookup` VALUES ('250', '57', '4', '734', '0');
INSERT INTO `footstepterrainlookup` VALUES ('251', '57', '5', '735', '0');
INSERT INTO `footstepterrainlookup` VALUES ('252', '57', '6', '731', '0');
INSERT INTO `footstepterrainlookup` VALUES ('253', '57', '7', '731', '0');
INSERT INTO `footstepterrainlookup` VALUES ('254', '57', '8', '732', '0');
INSERT INTO `footstepterrainlookup` VALUES ('255', '57', '9', '731', '0');
INSERT INTO `footstepterrainlookup` VALUES ('267', '77', '1', '3860', '0');
INSERT INTO `footstepterrainlookup` VALUES ('268', '77', '2', '3860', '0');
INSERT INTO `footstepterrainlookup` VALUES ('269', '77', '3', '3860', '0');
INSERT INTO `footstepterrainlookup` VALUES ('270', '77', '4', '3860', '0');
INSERT INTO `footstepterrainlookup` VALUES ('271', '77', '5', '3860', '0');
INSERT INTO `footstepterrainlookup` VALUES ('272', '77', '6', '3860', '0');
INSERT INTO `footstepterrainlookup` VALUES ('273', '77', '7', '3860', '0');
INSERT INTO `footstepterrainlookup` VALUES ('274', '77', '8', '3860', '0');
INSERT INTO `footstepterrainlookup` VALUES ('275', '77', '9', '3860', '0');
INSERT INTO `footstepterrainlookup` VALUES ('307', '117', '1', '4321', '1063');
INSERT INTO `footstepterrainlookup` VALUES ('308', '117', '2', '4321', '1064');
INSERT INTO `footstepterrainlookup` VALUES ('309', '117', '3', '4321', '1065');
INSERT INTO `footstepterrainlookup` VALUES ('310', '117', '4', '4321', '1066');
INSERT INTO `footstepterrainlookup` VALUES ('311', '117', '5', '4321', '1067');
INSERT INTO `footstepterrainlookup` VALUES ('312', '117', '6', '4321', '1068');
INSERT INTO `footstepterrainlookup` VALUES ('313', '117', '7', '4321', '1069');
INSERT INTO `footstepterrainlookup` VALUES ('314', '117', '8', '4321', '1070');
INSERT INTO `footstepterrainlookup` VALUES ('315', '117', '9', '4321', '1071');
INSERT INTO `footstepterrainlookup` VALUES ('327', '137', '1', '5051', '0');
INSERT INTO `footstepterrainlookup` VALUES ('328', '137', '2', '5051', '0');
INSERT INTO `footstepterrainlookup` VALUES ('329', '137', '3', '5051', '0');
INSERT INTO `footstepterrainlookup` VALUES ('330', '137', '4', '5051', '0');
INSERT INTO `footstepterrainlookup` VALUES ('331', '137', '5', '5051', '0');
INSERT INTO `footstepterrainlookup` VALUES ('332', '137', '6', '5051', '0');
INSERT INTO `footstepterrainlookup` VALUES ('333', '137', '7', '5051', '0');
INSERT INTO `footstepterrainlookup` VALUES ('334', '137', '8', '5051', '0');
INSERT INTO `footstepterrainlookup` VALUES ('335', '137', '9', '5051', '0');
INSERT INTO `footstepterrainlookup` VALUES ('347', '157', '1', '5314', '0');
INSERT INTO `footstepterrainlookup` VALUES ('348', '157', '2', '5314', '0');
INSERT INTO `footstepterrainlookup` VALUES ('349', '157', '3', '5314', '0');
INSERT INTO `footstepterrainlookup` VALUES ('350', '157', '4', '5314', '0');
INSERT INTO `footstepterrainlookup` VALUES ('351', '157', '5', '5314', '0');
INSERT INTO `footstepterrainlookup` VALUES ('352', '157', '6', '5314', '0');
INSERT INTO `footstepterrainlookup` VALUES ('353', '157', '7', '5314', '0');
INSERT INTO `footstepterrainlookup` VALUES ('354', '157', '8', '5314', '0');
INSERT INTO `footstepterrainlookup` VALUES ('355', '157', '9', '5314', '0');
INSERT INTO `footstepterrainlookup` VALUES ('367', '177', '1', '5554', '0');
INSERT INTO `footstepterrainlookup` VALUES ('368', '177', '2', '5554', '0');
INSERT INTO `footstepterrainlookup` VALUES ('369', '177', '3', '5554', '0');
INSERT INTO `footstepterrainlookup` VALUES ('370', '177', '4', '5554', '0');
INSERT INTO `footstepterrainlookup` VALUES ('372', '177', '5', '5554', '0');
INSERT INTO `footstepterrainlookup` VALUES ('373', '177', '6', '5554', '0');
INSERT INTO `footstepterrainlookup` VALUES ('374', '177', '7', '5554', '0');
INSERT INTO `footstepterrainlookup` VALUES ('375', '177', '8', '5554', '0');
INSERT INTO `footstepterrainlookup` VALUES ('376', '177', '9', '5554', '0');
INSERT INTO `footstepterrainlookup` VALUES ('377', '117', '0', '4321', '0');
INSERT INTO `footstepterrainlookup` VALUES ('378', '10', '0', '1137', '0');
INSERT INTO `footstepterrainlookup` VALUES ('379', '77', '0', '3860', '0');
INSERT INTO `footstepterrainlookup` VALUES ('380', '177', '0', '5554', '0');
INSERT INTO `footstepterrainlookup` VALUES ('381', '137', '0', '5051', '0');
INSERT INTO `footstepterrainlookup` VALUES ('382', '157', '0', '5314', '0');
INSERT INTO `footstepterrainlookup` VALUES ('383', '178', '1', '10918', '1055');
INSERT INTO `footstepterrainlookup` VALUES ('384', '178', '8', '10918', '1062');
INSERT INTO `footstepterrainlookup` VALUES ('385', '178', '9', '10918', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('386', '178', '4', '563', '1058');
INSERT INTO `footstepterrainlookup` VALUES ('387', '178', '5', '649', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('388', '178', '2', '560', '1054');
INSERT INTO `footstepterrainlookup` VALUES ('389', '178', '7', '10918', '1060');
INSERT INTO `footstepterrainlookup` VALUES ('390', '178', '6', '10918', '1060');
INSERT INTO `footstepterrainlookup` VALUES ('391', '178', '3', '10918', '1057');
INSERT INTO `footstepterrainlookup` VALUES ('392', '181', '8', '735', '0');
INSERT INTO `footstepterrainlookup` VALUES ('395', '178', '0', '10918', '1054');
INSERT INTO `footstepterrainlookup` VALUES ('396', '186', '1', '12141', '0');
INSERT INTO `footstepterrainlookup` VALUES ('397', '186', '2', '12141', '0');
INSERT INTO `footstepterrainlookup` VALUES ('398', '186', '3', '12141', '0');
INSERT INTO `footstepterrainlookup` VALUES ('399', '186', '4', '12141', '0');
INSERT INTO `footstepterrainlookup` VALUES ('400', '186', '5', '12141', '0');
INSERT INTO `footstepterrainlookup` VALUES ('401', '186', '6', '12141', '0');
INSERT INTO `footstepterrainlookup` VALUES ('402', '186', '7', '12141', '0');
INSERT INTO `footstepterrainlookup` VALUES ('403', '186', '8', '12141', '0');
INSERT INTO `footstepterrainlookup` VALUES ('404', '186', '9', '12141', '0');
INSERT INTO `footstepterrainlookup` VALUES ('405', '187', '1', '14091', '0');
INSERT INTO `footstepterrainlookup` VALUES ('406', '187', '2', '14091', '0');
INSERT INTO `footstepterrainlookup` VALUES ('407', '187', '3', '14091', '0');
INSERT INTO `footstepterrainlookup` VALUES ('408', '187', '4', '14091', '0');
INSERT INTO `footstepterrainlookup` VALUES ('409', '187', '-1', '14091', '0');
INSERT INTO `footstepterrainlookup` VALUES ('410', '187', '7', '14091', '0');
INSERT INTO `footstepterrainlookup` VALUES ('411', '187', '6', '14091', '0');
INSERT INTO `footstepterrainlookup` VALUES ('412', '187', '8', '14091', '0');
INSERT INTO `footstepterrainlookup` VALUES ('413', '187', '9', '14091', '0');
INSERT INTO `footstepterrainlookup` VALUES ('414', '188', '1', '14092', '1054');
INSERT INTO `footstepterrainlookup` VALUES ('415', '188', '2', '14092', '1055');
INSERT INTO `footstepterrainlookup` VALUES ('416', '188', '3', '14092', '1056');
INSERT INTO `footstepterrainlookup` VALUES ('417', '188', '4', '14092', '1048');
INSERT INTO `footstepterrainlookup` VALUES ('419', '188', '5', '14092', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('420', '188', '6', '14092', '1059');
INSERT INTO `footstepterrainlookup` VALUES ('421', '188', '7', '14092', '1060');
INSERT INTO `footstepterrainlookup` VALUES ('422', '188', '8', '14092', '1061');
INSERT INTO `footstepterrainlookup` VALUES ('424', '188', '9', '14092', '1062');
