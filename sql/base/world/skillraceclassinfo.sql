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
-- Table structure for table `skillraceclassinfo`
--

DROP TABLE IF EXISTS `skillraceclassinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skillraceclassinfo` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `SkillLine` int(10) NOT NULL DEFAULT '0',
  `Race` int(10) NOT NULL DEFAULT '0',
  `Class` int(10) NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  `MinLevel` int(10) NOT NULL DEFAULT '0',
  `SkillTier` int(10) NOT NULL DEFAULT '0',
  `SkillCostId` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skillraceclassinfo`
--

LOCK TABLES `skillraceclassinfo` WRITE;
/*!40000 ALTER TABLE `skillraceclassinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `skillraceclassinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `skillraceclassinfo`
--

INSERT INTO `skillraceclassinfo` VALUES ('57', '6', '-1', '128', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('301', '8', '-1', '128', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('107', '26', '-1', '1', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('82', '38', '-1', '8', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('75', '39', '-1', '8', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('140', '43', '1115', '1', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('328', '43', '3071', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('638', '43', '164', '1', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('872', '43', '32767', '8', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('880', '43', '1024', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('881', '43', '32767', '384', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('885', '43', '1029', '2', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('886', '43', '512', '2', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('910', '43', '262143', '32', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('117', '44', '166', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('335', '44', '2147483647', '74', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('628', '44', '1544', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('629', '44', '167', '1', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('630', '44', '1112', '1', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('912', '44', '262143', '32', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('126', '45', '650', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('127', '45', '32767', '13', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('133', '46', '36', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('134', '46', '32767', '9', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('635', '46', '1674', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('31', '50', '-1', '4', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('39', '51', '-1', '4', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('135', '54', '2147483647', '80', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('325', '54', '-1', '8', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('636', '54', '1133', '1', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('637', '54', '658', '1', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('643', '54', '8', '1024', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('644', '54', '32', '1024', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('888', '54', '261631', '2', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('889', '54', '512', '2', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('914', '54', '262143', '32', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('125', '55', '262143', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('626', '55', '163839', '1', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('884', '55', '512', '2', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('898', '55', '262143', '32', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('901', '55', '261631', '2', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('58', '56', '-1', '16', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('60', '78', '-1', '16', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('4', '95', '2147483647', '262111', '640', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('916', '95', '524287', '32', '640', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('59', '96', '2047', '1024', '1168', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('40', '98', '1101', '1535', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('41', '98', '674', '1503', '160', '0', '21', '0');
INSERT INTO `skillraceclassinfo` VALUES ('68', '101', '4', '1535', '1170', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('48', '109', '690', '1535', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('49', '109', '1101', '1503', '160', '0', '21', '0');
INSERT INTO `skillraceclassinfo` VALUES ('44', '111', '4', '1535', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('45', '111', '2043', '1503', '160', '0', '21', '0');
INSERT INTO `skillraceclassinfo` VALUES ('42', '113', '8', '1535', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('43', '113', '2039', '1503', '160', '0', '21', '0');
INSERT INTO `skillraceclassinfo` VALUES ('50', '115', '32', '1535', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('51', '115', '2015', '1503', '160', '0', '21', '0');
INSERT INTO `skillraceclassinfo` VALUES ('131', '118', '32767', '8', '146', '1', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('132', '118', '32767', '5', '146', '20', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('883', '118', '32767', '64', '402', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('913', '118', '262143', '32', '146', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('105', '120', '2047', '256', '1170', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('71', '124', '32', '1535', '1170', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('70', '125', '2', '1535', '146', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('69', '126', '8', '1535', '1170', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('86', '129', '-1', '262111', '128', '0', '63', '0');
INSERT INTO `skillraceclassinfo` VALUES ('925', '129', '-1', '32', '128', '0', '63', '0');
INSERT INTO `skillraceclassinfo` VALUES ('54', '130', '2047', '128', '1168', '4', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('25', '134', '-1', '1024', '1040', '10', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('138', '136', '32767', '1488', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('139', '136', '32767', '5', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('91', '137', '1535', '1503', '160', '0', '21', '0');
INSERT INTO `skillraceclassinfo` VALUES ('882', '137', '512', '1535', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('85', '138', '2047', '1535', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('84', '139', '2047', '1535', '160', '0', '21', '0');
INSERT INTO `skillraceclassinfo` VALUES ('93', '140', '2047', '1535', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('88', '141', '2047', '1535', '160', '0', '21', '0');
INSERT INTO `skillraceclassinfo` VALUES ('865', '142', '2047', '1535', '0', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('87', '148', '1', '1503', '1170', '0', '181', '0');
INSERT INTO `skillraceclassinfo` VALUES ('441', '148', '222', '1535', '1170', '0', '182', '0');
INSERT INTO `skillraceclassinfo` VALUES ('94', '149', '2', '1503', '1170', '0', '181', '0');
INSERT INTO `skillraceclassinfo` VALUES ('443', '149', '509', '1535', '1170', '0', '182', '0');
INSERT INTO `skillraceclassinfo` VALUES ('92', '150', '8', '1503', '1170', '0', '181', '0');
INSERT INTO `skillraceclassinfo` VALUES ('481', '150', '215', '1535', '1170', '0', '182', '0');
INSERT INTO `skillraceclassinfo` VALUES ('89', '152', '4', '1503', '1170', '0', '181', '0');
INSERT INTO `skillraceclassinfo` VALUES ('442', '152', '219', '1535', '1170', '0', '182', '0');
INSERT INTO `skillraceclassinfo` VALUES ('123', '160', '262143', '2', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('124', '160', '-1', '1024', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('624', '160', '32', '1', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('625', '160', '262111', '1', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('702', '160', '-1', '64', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('908', '160', '262143', '32', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('6', '162', '2147483647', '1503', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('922', '162', '262143', '32', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('33', '163', '-1', '4', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('243', '164', '2047', '1535', '160', '0', '41', '0');
INSERT INTO `skillraceclassinfo` VALUES ('899', '165', '2047', '1535', '160', '0', '41', '0');
INSERT INTO `skillraceclassinfo` VALUES ('241', '171', '2047', '1535', '160', '0', '41', '0');
INSERT INTO `skillraceclassinfo` VALUES ('122', '172', '163839', '2', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('621', '172', '6', '1', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('622', '172', '1529', '1', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('701', '172', '163839', '64', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('907', '172', '524287', '32', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('970', '172', '163839', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('129', '173', '32767', '264', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('323', '173', '32767', '208', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('631', '173', '520', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('632', '173', '1190', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('633', '173', '216', '1', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('634', '173', '1063', '1', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('641', '173', '32', '1024', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('642', '173', '8', '1024', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('142', '176', '-1', '8', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('143', '176', '-1', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('639', '176', '128', '1', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('640', '176', '262015', '1', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('28', '182', '2047', '1535', '160', '0', '2', '0');
INSERT INTO `skillraceclassinfo` VALUES ('5', '183', '-1', '262143', '1170', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('63', '184', '-1', '2', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('282', '185', '2047', '1535', '128', '0', '61', '0');
INSERT INTO `skillraceclassinfo` VALUES ('29', '186', '2047', '1535', '160', '0', '2', '0');
INSERT INTO `skillraceclassinfo` VALUES ('284', '197', '2047', '1535', '160', '0', '62', '0');
INSERT INTO `skillraceclassinfo` VALUES ('65', '198', '2047', '2', '1168', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('97', '199', '2047', '64', '1168', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('244', '202', '2047', '1535', '160', '0', '41', '0');
INSERT INTO `skillraceclassinfo` VALUES ('940', '205', '524287', '128', '2048', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('72', '220', '16', '1535', '1170', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('128', '226', '32767', '9', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('878', '226', '1024', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('879', '226', '31743', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('137', '227', '2047', '1029', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('144', '228', '-1', '400', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('136', '229', '32767', '1031', '128', '20', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('915', '229', '262143', '32', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('55', '237', '-1', '128', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('79', '238', '2047', '8', '1168', '4', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('81', '239', '2047', '8', '1168', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('76', '241', '2047', '8', '128', '40', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('149', '242', '2047', '8', '1168', '16', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('112', '243', '2047', '1', '1170', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('111', '244', '2047', '1', '1168', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('106', '245', '2047', '1', '1168', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('66', '246', '2047', '2', '1168', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('26', '247', '2047', '1024', '1168', '20', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('83', '252', '2047', '9', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('74', '253', '-1', '8', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('73', '254', '2047', '8', '1168', '10', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('108', '255', '2047', '1', '1168', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('109', '256', '-1', '1', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('110', '257', '-1', '1', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('113', '258', '2047', '1', '1168', '10', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('38', '260', '2047', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('35', '262', '2047', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('36', '263', '2047', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('37', '264', '2047', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('61', '267', '-1', '2', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('62', '268', '2047', '2', '1170', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('64', '269', '2047', '2', '1168', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('24', '272', '2047', '1024', '1168', '10', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('34', '273', '2047', '4', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('21', '293', '2047', '3', '128', '40', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('906', '293', '262143', '32', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('46', '313', '64', '1535', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('47', '313', '1983', '1503', '160', '0', '21', '0');
INSERT INTO `skillraceclassinfo` VALUES ('52', '315', '128', '1535', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('53', '315', '1919', '1503', '160', '0', '21', '0');
INSERT INTO `skillraceclassinfo` VALUES ('281', '333', '2047', '1535', '160', '0', '62', '0');
INSERT INTO `skillraceclassinfo` VALUES ('104', '353', '2047', '256', '1170', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('102', '354', '-1', '256', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('101', '355', '-1', '256', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('27', '356', '2047', '1535', '128', '0', '23', '0');
INSERT INTO `skillraceclassinfo` VALUES ('95', '373', '-1', '64', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('98', '374', '262143', '64', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('96', '375', '262143', '64', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('30', '393', '2047', '1535', '160', '0', '161', '0');
INSERT INTO `skillraceclassinfo` VALUES ('145', '413', '2047', '68', '128', '40', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('146', '413', '2047', '35', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('147', '414', '2047', '1135', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('148', '415', '2047', '1535', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('151', '416', '2047', '1', '192', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('155', '416', '2047', '2', '192', '0', '0', '1');
INSERT INTO `skillraceclassinfo` VALUES ('158', '416', '2047', '1088', '192', '0', '0', '1');
INSERT INTO `skillraceclassinfo` VALUES ('159', '416', '2047', '12', '192', '0', '0', '1');
INSERT INTO `skillraceclassinfo` VALUES ('271', '416', '2047', '400', '192', '0', '0', '2');
INSERT INTO `skillraceclassinfo` VALUES ('175', '418', '2047', '1', '384', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('178', '418', '2047', '2', '384', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('183', '418', '2047', '1284', '384', '0', '0', '1');
INSERT INTO `skillraceclassinfo` VALUES ('186', '418', '2047', '144', '384', '0', '0', '1');
INSERT INTO `skillraceclassinfo` VALUES ('270', '418', '2047', '72', '384', '0', '0', '1');
INSERT INTO `skillraceclassinfo` VALUES ('189', '419', '2047', '12', '640', '0', '0', '2');
INSERT INTO `skillraceclassinfo` VALUES ('191', '419', '2047', '1024', '640', '0', '0', '1');
INSERT INTO `skillraceclassinfo` VALUES ('193', '419', '2047', '144', '640', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('198', '419', '2047', '2', '640', '0', '0', '1');
INSERT INTO `skillraceclassinfo` VALUES ('200', '419', '2047', '1', '640', '0', '0', '2');
INSERT INTO `skillraceclassinfo` VALUES ('265', '419', '2047', '256', '640', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('266', '419', '2047', '64', '640', '0', '0', '1');
INSERT INTO `skillraceclassinfo` VALUES ('203', '420', '2047', '13', '1152', '0', '0', '2');
INSERT INTO `skillraceclassinfo` VALUES ('204', '420', '2047', '1026', '1152', '0', '0', '1');
INSERT INTO `skillraceclassinfo` VALUES ('205', '420', '2047', '272', '1152', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('268', '420', '2047', '128', '1152', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('269', '420', '2047', '64', '1152', '0', '0', '1');
INSERT INTO `skillraceclassinfo` VALUES ('246', '433', '2047', '67', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('272', '453', '2047', '3', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('330', '473', '4095', '1101', '130', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('381', '493', '8', '1535', '164', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('403', '515', '2047', '1503', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('445', '533', '128', '1535', '1170', '0', '181', '0');
INSERT INTO `skillraceclassinfo` VALUES ('446', '533', '95', '1503', '1170', '0', '182', '0');
INSERT INTO `skillraceclassinfo` VALUES ('461', '553', '64', '1503', '1170', '0', '181', '0');
INSERT INTO `skillraceclassinfo` VALUES ('501', '553', '4', '1535', '1170', '0', '182', '0');
INSERT INTO `skillraceclassinfo` VALUES ('463', '554', '16', '1503', '1170', '0', '181', '0');
INSERT INTO `skillraceclassinfo` VALUES ('464', '554', '207', '1535', '1170', '0', '182', '0');
INSERT INTO `skillraceclassinfo` VALUES ('521', '573', '-1', '1024', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('522', '574', '-1', '1024', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('541', '593', '-1', '256', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('544', '594', '-1', '2', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('581', '613', '-1', '16', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('601', '633', '-1', '8', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('741', '673', '16', '1535', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('742', '673', '2031', '1503', '160', '0', '21', '0');
INSERT INTO `skillraceclassinfo` VALUES ('781', '713', '255', '1535', '1170', '0', '181', '0');
INSERT INTO `skillraceclassinfo` VALUES ('841', '733', '128', '1535', '1170', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('861', '753', '64', '1535', '1170', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('862', '754', '1', '1535', '1170', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('866', '755', '2047', '1535', '160', '0', '41', '0');
INSERT INTO `skillraceclassinfo` VALUES ('867', '756', '512', '1535', '146', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('875', '759', '1024', '262143', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('876', '759', '1023', '-1', '0', '0', '21', '0');
INSERT INTO `skillraceclassinfo` VALUES ('877', '760', '1024', '1535', '146', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('890', '762', '2147483647', '262111', '144', '0', '223', '0');
INSERT INTO `skillraceclassinfo` VALUES ('934', '762', '524287', '32', '144', '0', '223', '0');
INSERT INTO `skillraceclassinfo` VALUES ('892', '769', '32767', '1535', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('896', '770', '-1', '32', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('897', '771', '262143', '32', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('951', '771', '2097151', '1535', '0', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('895', '772', '-1', '32', '1040', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('900', '773', '262143', '1535', '160', '0', '41', '0');
INSERT INTO `skillraceclassinfo` VALUES ('936', '776', '262143', '32', '128', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('938', '777', '524287', '1535', '2', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('939', '778', '524287', '1535', '2', '0', '0', '0');
INSERT INTO `skillraceclassinfo` VALUES ('947', '778', '2097151', '1535', '0', '0', '0', '0');
