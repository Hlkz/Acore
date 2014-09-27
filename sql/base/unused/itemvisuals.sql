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
-- Table structure for table `itemvisuals`
--

DROP TABLE IF EXISTS `itemvisuals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemvisuals` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `VisualEffect1` int(10) NOT NULL DEFAULT '0',
  `VisualEffect2` int(10) NOT NULL DEFAULT '0',
  `VisualEffect3` int(10) NOT NULL DEFAULT '0',
  `VisualEffect4` int(10) NOT NULL DEFAULT '0',
  `VisualEffect5` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of itemvisuals
-- ----------------------------
INSERT INTO `itemvisuals` VALUES ('1', '207', '207', '207', '207', '207');
INSERT INTO `itemvisuals` VALUES ('2', '62', '62', '62', '62', '62');
INSERT INTO `itemvisuals` VALUES ('24', '1', '1', '1', '1', '1');
INSERT INTO `itemvisuals` VALUES ('25', '45', '45', '45', '45', '45');
INSERT INTO `itemvisuals` VALUES ('26', '0', '0', '0', '0', '46');
INSERT INTO `itemvisuals` VALUES ('27', '3', '3', '3', '3', '3');
INSERT INTO `itemvisuals` VALUES ('28', '90148992', '0', '0', '455344256', '47');
INSERT INTO `itemvisuals` VALUES ('29', '48', '48', '48', '48', '48');
INSERT INTO `itemvisuals` VALUES ('30', '49', '48', '48', '48', '48');
INSERT INTO `itemvisuals` VALUES ('31', '50', '50', '50', '50', '50');
INSERT INTO `itemvisuals` VALUES ('32', '0', '0', '0', '51', '0');
INSERT INTO `itemvisuals` VALUES ('33', '0', '0', '0', '52', '0');
INSERT INTO `itemvisuals` VALUES ('42', '2', '2', '2', '2', '2');
INSERT INTO `itemvisuals` VALUES ('61', '0', '0', '0', '81', '0');
INSERT INTO `itemvisuals` VALUES ('81', '0', '0', '0', '101', '0');
INSERT INTO `itemvisuals` VALUES ('101', '0', '121', '121', '121', '121');
INSERT INTO `itemvisuals` VALUES ('102', '122', '122', '122', '122', '122');
INSERT INTO `itemvisuals` VALUES ('103', '123', '123', '123', '123', '123');
INSERT INTO `itemvisuals` VALUES ('104', '124', '124', '124', '124', '124');
INSERT INTO `itemvisuals` VALUES ('105', '141', '141', '141', '141', '141');
INSERT INTO `itemvisuals` VALUES ('106', '126', '126', '126', '126', '126');
INSERT INTO `itemvisuals` VALUES ('107', '127', '127', '127', '127', '127');
INSERT INTO `itemvisuals` VALUES ('123', '142', '142', '142', '142', '142');
INSERT INTO `itemvisuals` VALUES ('124', '143', '143', '143', '143', '143');
INSERT INTO `itemvisuals` VALUES ('125', '125', '125', '125', '125', '125');
INSERT INTO `itemvisuals` VALUES ('126', '144', '144', '144', '144', '144');
INSERT INTO `itemvisuals` VALUES ('127', '0', '0', '0', '145', '145');
INSERT INTO `itemvisuals` VALUES ('128', '146', '146', '146', '146', '146');
INSERT INTO `itemvisuals` VALUES ('129', '147', '147', '147', '147', '147');
INSERT INTO `itemvisuals` VALUES ('130', '148', '148', '148', '148', '148');
INSERT INTO `itemvisuals` VALUES ('131', '0', '0', '0', '149', '0');
INSERT INTO `itemvisuals` VALUES ('132', '0', '0', '0', '150', '0');
INSERT INTO `itemvisuals` VALUES ('133', '0', '0', '0', '151', '0');
INSERT INTO `itemvisuals` VALUES ('134', '0', '0', '0', '152', '0');
INSERT INTO `itemvisuals` VALUES ('135', '0', '6553665', '100', '100973092', '212');
INSERT INTO `itemvisuals` VALUES ('137', '-1', '0', '153', '-1', '-1');
INSERT INTO `itemvisuals` VALUES ('138', '157', '157', '157', '157', '157');
INSERT INTO `itemvisuals` VALUES ('139', '158', '158', '158', '158', '158');
INSERT INTO `itemvisuals` VALUES ('140', '159', '159', '159', '159', '159');
INSERT INTO `itemvisuals` VALUES ('141', '-1', '-1', '160', '0', '0');
INSERT INTO `itemvisuals` VALUES ('142', '161', '161', '161', '161', '161');
INSERT INTO `itemvisuals` VALUES ('143', '-1', '6553665', '-1', '158', '158');
INSERT INTO `itemvisuals` VALUES ('144', '167', '167', '167', '167', '167');
INSERT INTO `itemvisuals` VALUES ('145', '168', '168', '168', '168', '168');
INSERT INTO `itemvisuals` VALUES ('146', '169', '169', '169', '169', '169');
INSERT INTO `itemvisuals` VALUES ('147', '170', '170', '170', '170', '170');
INSERT INTO `itemvisuals` VALUES ('148', '-1', '-1', '-1', '172', '172');
INSERT INTO `itemvisuals` VALUES ('149', '0', '6553665', '176', '176', '176');
INSERT INTO `itemvisuals` VALUES ('150', '65535', '6553665', '175', '175', '175');
INSERT INTO `itemvisuals` VALUES ('151', '0', '6553665', '100', '177', '-1');
INSERT INTO `itemvisuals` VALUES ('152', '-1', '6553665', '100', '105307920', '178');
INSERT INTO `itemvisuals` VALUES ('153', '65535', '6553665', '179', '179', '179');
INSERT INTO `itemvisuals` VALUES ('154', '65535', '6553665', '156', '-1', '156');
INSERT INTO `itemvisuals` VALUES ('155', '182', '182', '182', '182', '182');
INSERT INTO `itemvisuals` VALUES ('156', '50', '50', '183', '50', '183');
INSERT INTO `itemvisuals` VALUES ('157', '184', '184', '184', '184', '184');
INSERT INTO `itemvisuals` VALUES ('158', '185', '185', '185', '185', '185');
INSERT INTO `itemvisuals` VALUES ('159', '186', '186', '186', '186', '186');
INSERT INTO `itemvisuals` VALUES ('160', '187', '187', '187', '187', '187');
INSERT INTO `itemvisuals` VALUES ('161', '0', '6553665', '100', '107459124', '42');
INSERT INTO `itemvisuals` VALUES ('162', '0', '194', '194', '0', '-1');
INSERT INTO `itemvisuals` VALUES ('164', '193', '193', '193', '193', '193');
INSERT INTO `itemvisuals` VALUES ('165', '194', '194', '194', '194', '194');
INSERT INTO `itemvisuals` VALUES ('166', '124', '124', '195', '124', '195');
INSERT INTO `itemvisuals` VALUES ('167', '204', '203', '0', '-1', '-1');
INSERT INTO `itemvisuals` VALUES ('168', '0', '0', '0', '0', '10619576');
INSERT INTO `itemvisuals` VALUES ('169', '145', '145', '145', '145', '145');
INSERT INTO `itemvisuals` VALUES ('170', '0', '0', '0', '0', '205');
INSERT INTO `itemvisuals` VALUES ('171', '1971435606', '-932340761', '4195744', '137343496', '206');
INSERT INTO `itemvisuals` VALUES ('172', '0', '1234592', '2118235989', '2118236037', '158');
INSERT INTO `itemvisuals` VALUES ('173', '0', '2076439218', '135636', '142932288', '0');
INSERT INTO `itemvisuals` VALUES ('174', '-1', '153', '-1', '153', '-1');
INSERT INTO `itemvisuals` VALUES ('175', '0', '1221560', '2118235989', '159', '97979454');
INSERT INTO `itemvisuals` VALUES ('176', '1978510345', '-663957167', '1116144', '194', '194');
INSERT INTO `itemvisuals` VALUES ('178', '121', '121', '183', '121', '183');
INSERT INTO `itemvisuals` VALUES ('179', '124539216', '0', '1217768', '210', '-1');
INSERT INTO `itemvisuals` VALUES ('183', '212', '212', '212', '212', '212');
INSERT INTO `itemvisuals` VALUES ('184', '127', '3', '125', '48', '123');
INSERT INTO `itemvisuals` VALUES ('185', '177', '-1', '177', '1392576649', '177');
INSERT INTO `itemvisuals` VALUES ('186', '182', '3', '2', '3', '2');
