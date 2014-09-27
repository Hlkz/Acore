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
-- Table structure for table `objecteffectpackageelem`
--

DROP TABLE IF EXISTS `objecteffectpackageelem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objecteffectpackageelem` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `PackageId` int(10) NOT NULL DEFAULT '0',
  `GroupId` int(10) NOT NULL DEFAULT '0',
  `StateType` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objecteffectpackageelem`
--

LOCK TABLES `objecteffectpackageelem` WRITE;
/*!40000 ALTER TABLE `objecteffectpackageelem` DISABLE KEYS */;
/*!40000 ALTER TABLE `objecteffectpackageelem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `objecteffectpackageelem`
--

INSERT INTO `objecteffectpackageelem` VALUES ('138', '61', '157', '34');
INSERT INTO `objecteffectpackageelem` VALUES ('141', '61', '169', '27');
INSERT INTO `objecteffectpackageelem` VALUES ('142', '61', '166', '24');
INSERT INTO `objecteffectpackageelem` VALUES ('143', '61', '165', '23');
INSERT INTO `objecteffectpackageelem` VALUES ('146', '61', '162', '20');
INSERT INTO `objecteffectpackageelem` VALUES ('147', '61', '163', '21');
INSERT INTO `objecteffectpackageelem` VALUES ('148', '61', '160', '19');
INSERT INTO `objecteffectpackageelem` VALUES ('149', '61', '161', '13');
INSERT INTO `objecteffectpackageelem` VALUES ('150', '61', '164', '22');
INSERT INTO `objecteffectpackageelem` VALUES ('151', '61', '170', '30');
INSERT INTO `objecteffectpackageelem` VALUES ('152', '61', '171', '26');
INSERT INTO `objecteffectpackageelem` VALUES ('153', '61', '172', '35');
INSERT INTO `objecteffectpackageelem` VALUES ('154', '12', '34', '3');
INSERT INTO `objecteffectpackageelem` VALUES ('158', '61', '173', '6');
INSERT INTO `objecteffectpackageelem` VALUES ('166', '81', '176', '8');
INSERT INTO `objecteffectpackageelem` VALUES ('169', '101', '181', '19');
INSERT INTO `objecteffectpackageelem` VALUES ('170', '101', '182', '13');
INSERT INTO `objecteffectpackageelem` VALUES ('171', '101', '183', '12');
INSERT INTO `objecteffectpackageelem` VALUES ('172', '101', '184', '22');
INSERT INTO `objecteffectpackageelem` VALUES ('173', '101', '185', '26');
INSERT INTO `objecteffectpackageelem` VALUES ('174', '101', '186', '27');
INSERT INTO `objecteffectpackageelem` VALUES ('175', '101', '187', '28');
INSERT INTO `objecteffectpackageelem` VALUES ('176', '101', '188', '29');
INSERT INTO `objecteffectpackageelem` VALUES ('177', '101', '189', '30');
INSERT INTO `objecteffectpackageelem` VALUES ('178', '101', '190', '31');
INSERT INTO `objecteffectpackageelem` VALUES ('179', '101', '191', '32');
INSERT INTO `objecteffectpackageelem` VALUES ('180', '101', '192', '33');
INSERT INTO `objecteffectpackageelem` VALUES ('181', '101', '195', '6');
INSERT INTO `objecteffectpackageelem` VALUES ('182', '101', '196', '7');
INSERT INTO `objecteffectpackageelem` VALUES ('183', '102', '197', '8');
INSERT INTO `objecteffectpackageelem` VALUES ('184', '102', '198', '40');
INSERT INTO `objecteffectpackageelem` VALUES ('185', '102', '199', '38');
INSERT INTO `objecteffectpackageelem` VALUES ('186', '102', '200', '37');
INSERT INTO `objecteffectpackageelem` VALUES ('192', '81', '175', '10');
INSERT INTO `objecteffectpackageelem` VALUES ('194', '122', '202', '38');
INSERT INTO `objecteffectpackageelem` VALUES ('195', '122', '203', '40');
INSERT INTO `objecteffectpackageelem` VALUES ('196', '122', '204', '37');
INSERT INTO `objecteffectpackageelem` VALUES ('197', '122', '205', '8');
INSERT INTO `objecteffectpackageelem` VALUES ('198', '122', '206', '10');
INSERT INTO `objecteffectpackageelem` VALUES ('201', '81', '159', '38');
INSERT INTO `objecteffectpackageelem` VALUES ('202', '81', '158', '37');
INSERT INTO `objecteffectpackageelem` VALUES ('221', '122', '241', '15');
INSERT INTO `objecteffectpackageelem` VALUES ('222', '122', '242', '14');
INSERT INTO `objecteffectpackageelem` VALUES ('223', '141', '247', '22');
INSERT INTO `objecteffectpackageelem` VALUES ('224', '141', '243', '27');
INSERT INTO `objecteffectpackageelem` VALUES ('225', '141', '244', '41');
INSERT INTO `objecteffectpackageelem` VALUES ('226', '141', '245', '41');
INSERT INTO `objecteffectpackageelem` VALUES ('227', '141', '246', '13');
INSERT INTO `objecteffectpackageelem` VALUES ('228', '141', '246', '20');
INSERT INTO `objecteffectpackageelem` VALUES ('229', '141', '246', '21');
INSERT INTO `objecteffectpackageelem` VALUES ('241', '141', '246', '19');
INSERT INTO `objecteffectpackageelem` VALUES ('242', '102', '261', '15');
INSERT INTO `objecteffectpackageelem` VALUES ('243', '102', '262', '17');
INSERT INTO `objecteffectpackageelem` VALUES ('244', '81', '263', '15');
INSERT INTO `objecteffectpackageelem` VALUES ('245', '81', '264', '14');
INSERT INTO `objecteffectpackageelem` VALUES ('246', '161', '265', '8');
INSERT INTO `objecteffectpackageelem` VALUES ('247', '161', '266', '24');
INSERT INTO `objecteffectpackageelem` VALUES ('248', '161', '267', '23');
INSERT INTO `objecteffectpackageelem` VALUES ('249', '161', '268', '10');
INSERT INTO `objecteffectpackageelem` VALUES ('250', '161', '269', '19');
INSERT INTO `objecteffectpackageelem` VALUES ('251', '161', '270', '13');
INSERT INTO `objecteffectpackageelem` VALUES ('252', '161', '270', '12');
INSERT INTO `objecteffectpackageelem` VALUES ('253', '161', '270', '21');
INSERT INTO `objecteffectpackageelem` VALUES ('254', '161', '270', '20');
INSERT INTO `objecteffectpackageelem` VALUES ('255', '161', '267', '36');
INSERT INTO `objecteffectpackageelem` VALUES ('256', '161', '269', '22');
INSERT INTO `objecteffectpackageelem` VALUES ('257', '161', '266', '35');
INSERT INTO `objecteffectpackageelem` VALUES ('281', '141', '243', '28');
INSERT INTO `objecteffectpackageelem` VALUES ('282', '141', '243', '29');
INSERT INTO `objecteffectpackageelem` VALUES ('283', '141', '243', '12');
INSERT INTO `objecteffectpackageelem` VALUES ('284', '141', '245', '23');
INSERT INTO `objecteffectpackageelem` VALUES ('321', '201', '281', '33');
INSERT INTO `objecteffectpackageelem` VALUES ('322', '61', '169', '33');
INSERT INTO `objecteffectpackageelem` VALUES ('365', '61', '169', '29');
INSERT INTO `objecteffectpackageelem` VALUES ('366', '61', '169', '28');
INSERT INTO `objecteffectpackageelem` VALUES ('367', '61', '169', '29');
INSERT INTO `objecteffectpackageelem` VALUES ('368', '61', '169', '28');
INSERT INTO `objecteffectpackageelem` VALUES ('381', '141', '160', '46');
INSERT INTO `objecteffectpackageelem` VALUES ('382', '141', '160', '46');
INSERT INTO `objecteffectpackageelem` VALUES ('421', '122', '321', '1');
INSERT INTO `objecteffectpackageelem` VALUES ('441', '221', '341', '17');
INSERT INTO `objecteffectpackageelem` VALUES ('442', '221', '342', '15');
INSERT INTO `objecteffectpackageelem` VALUES ('443', '221', '346', '13');
INSERT INTO `objecteffectpackageelem` VALUES ('444', '221', '346', '12');
INSERT INTO `objecteffectpackageelem` VALUES ('445', '221', '343', '18');
INSERT INTO `objecteffectpackageelem` VALUES ('446', '221', '343', '19');
INSERT INTO `objecteffectpackageelem` VALUES ('447', '221', '344', '40');
INSERT INTO `objecteffectpackageelem` VALUES ('448', '221', '345', '8');
INSERT INTO `objecteffectpackageelem` VALUES ('461', '241', '361', '12');
INSERT INTO `objecteffectpackageelem` VALUES ('462', '241', '362', '13');
INSERT INTO `objecteffectpackageelem` VALUES ('463', '241', '363', '23');
INSERT INTO `objecteffectpackageelem` VALUES ('464', '241', '364', '24');
INSERT INTO `objecteffectpackageelem` VALUES ('465', '241', '364', '35');
INSERT INTO `objecteffectpackageelem` VALUES ('466', '241', '361', '32');
INSERT INTO `objecteffectpackageelem` VALUES ('467', '241', '361', '31');
INSERT INTO `objecteffectpackageelem` VALUES ('468', '241', '361', '20');
INSERT INTO `objecteffectpackageelem` VALUES ('469', '241', '361', '21');
INSERT INTO `objecteffectpackageelem` VALUES ('470', '241', '362', '46');
INSERT INTO `objecteffectpackageelem` VALUES ('471', '241', '362', '33');
INSERT INTO `objecteffectpackageelem` VALUES ('472', '241', '362', '22');
INSERT INTO `objecteffectpackageelem` VALUES ('473', '241', '362', '19');
INSERT INTO `objecteffectpackageelem` VALUES ('481', '261', '381', '69');
INSERT INTO `objecteffectpackageelem` VALUES ('501', '261', '401', '70');
INSERT INTO `objecteffectpackageelem` VALUES ('502', '261', '402', '68');
INSERT INTO `objecteffectpackageelem` VALUES ('503', '12', '403', '5');
INSERT INTO `objecteffectpackageelem` VALUES ('504', '12', '404', '4');
INSERT INTO `objecteffectpackageelem` VALUES ('505', '281', '405', '68');
INSERT INTO `objecteffectpackageelem` VALUES ('521', '301', '421', '71');
INSERT INTO `objecteffectpackageelem` VALUES ('541', '321', '441', '71');
INSERT INTO `objecteffectpackageelem` VALUES ('561', '341', '461', '73');
INSERT INTO `objecteffectpackageelem` VALUES ('562', '341', '461', '71');
INSERT INTO `objecteffectpackageelem` VALUES ('563', '342', '462', '71');
INSERT INTO `objecteffectpackageelem` VALUES ('564', '342', '463', '73');
INSERT INTO `objecteffectpackageelem` VALUES ('565', '342', '464', '72');
INSERT INTO `objecteffectpackageelem` VALUES ('581', '342', '464', '71');
INSERT INTO `objecteffectpackageelem` VALUES ('582', '342', '464', '73');
INSERT INTO `objecteffectpackageelem` VALUES ('601', '361', '481', '71');
INSERT INTO `objecteffectpackageelem` VALUES ('621', '381', '501', '71');
INSERT INTO `objecteffectpackageelem` VALUES ('641', '301', '421', '72');
INSERT INTO `objecteffectpackageelem` VALUES ('661', '161', '269', '26');
INSERT INTO `objecteffectpackageelem` VALUES ('662', '161', '269', '30');
INSERT INTO `objecteffectpackageelem` VALUES ('663', '161', '270', '27');
INSERT INTO `objecteffectpackageelem` VALUES ('664', '161', '270', '28');
INSERT INTO `objecteffectpackageelem` VALUES ('665', '161', '270', '29');
INSERT INTO `objecteffectpackageelem` VALUES ('681', '161', '270', '25');
INSERT INTO `objecteffectpackageelem` VALUES ('682', '241', '361', '27');
INSERT INTO `objecteffectpackageelem` VALUES ('683', '241', '361', '29');
INSERT INTO `objecteffectpackageelem` VALUES ('684', '241', '361', '28');
INSERT INTO `objecteffectpackageelem` VALUES ('685', '241', '362', '30');
INSERT INTO `objecteffectpackageelem` VALUES ('686', '241', '361', '6');
INSERT INTO `objecteffectpackageelem` VALUES ('701', '401', '521', '27');
INSERT INTO `objecteffectpackageelem` VALUES ('721', '61', '221', '42');
INSERT INTO `objecteffectpackageelem` VALUES ('722', '61', '222', '41');
INSERT INTO `objecteffectpackageelem` VALUES ('741', '421', '541', '19');
INSERT INTO `objecteffectpackageelem` VALUES ('761', '241', '361', '26');
INSERT INTO `objecteffectpackageelem` VALUES ('802', '462', '282', '1');
INSERT INTO `objecteffectpackageelem` VALUES ('803', '461', '281', '1');
INSERT INTO `objecteffectpackageelem` VALUES ('804', '182', '581', '1');
INSERT INTO `objecteffectpackageelem` VALUES ('805', '181', '582', '1');
INSERT INTO `objecteffectpackageelem` VALUES ('821', '481', '581', '1');
INSERT INTO `objecteffectpackageelem` VALUES ('822', '482', '601', '68');
INSERT INTO `objecteffectpackageelem` VALUES ('823', '482', '602', '69');
INSERT INTO `objecteffectpackageelem` VALUES ('824', '482', '603', '70');
INSERT INTO `objecteffectpackageelem` VALUES ('825', '482', '602', '73');
INSERT INTO `objecteffectpackageelem` VALUES ('826', '482', '602', '71');
INSERT INTO `objecteffectpackageelem` VALUES ('834', '488', '608', '68');
INSERT INTO `objecteffectpackageelem` VALUES ('840', '491', '610', '1');
INSERT INTO `objecteffectpackageelem` VALUES ('841', '491', '611', '61');
INSERT INTO `objecteffectpackageelem` VALUES ('842', '491', '611', '66');
INSERT INTO `objecteffectpackageelem` VALUES ('843', '491', '611', '12');
INSERT INTO `objecteffectpackageelem` VALUES ('844', '491', '611', '22');
