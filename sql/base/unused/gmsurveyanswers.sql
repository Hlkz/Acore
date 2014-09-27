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
-- Table structure for table `gmsurveyanswers`
--

DROP TABLE IF EXISTS `gmsurveyanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gmsurveyanswers` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `SortIndex` int(10) NOT NULL DEFAULT '0',
  `GMSurveyQuestionId` int(10) NOT NULL DEFAULT '0',
  `Answer` varchar(100) NOT NULL DEFAULT '',
  `Answer_loc2` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gmsurveyanswers`
--

LOCK TABLES `gmsurveyanswers` WRITE;
/*!40000 ALTER TABLE `gmsurveyanswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `gmsurveyanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `gmsurveyanswers`
--

INSERT INTO `gmsurveyanswers` VALUES ('104', '0', '35', 'N/A', 'N/A');
INSERT INTO `gmsurveyanswers` VALUES ('105', '1', '35', '0', '0');
INSERT INTO `gmsurveyanswers` VALUES ('106', '2', '35', '1', '1');
INSERT INTO `gmsurveyanswers` VALUES ('107', '3', '35', '2', '2');
INSERT INTO `gmsurveyanswers` VALUES ('108', '4', '35', '3', '3');
INSERT INTO `gmsurveyanswers` VALUES ('109', '5', '35', '4', '4');
INSERT INTO `gmsurveyanswers` VALUES ('110', '6', '35', '5', '5');
INSERT INTO `gmsurveyanswers` VALUES ('111', '7', '35', '6', '6');
INSERT INTO `gmsurveyanswers` VALUES ('112', '8', '35', '7', '7');
INSERT INTO `gmsurveyanswers` VALUES ('113', '9', '35', '8', '8');
INSERT INTO `gmsurveyanswers` VALUES ('114', '10', '35', '9', '9');
INSERT INTO `gmsurveyanswers` VALUES ('120', '11', '35', '10', '10');
INSERT INTO `gmsurveyanswers` VALUES ('101', '0', '36', 'N/A', 'N/A');
INSERT INTO `gmsurveyanswers` VALUES ('102', '1', '36', 'Yes', 'Oui');
INSERT INTO `gmsurveyanswers` VALUES ('103', '2', '36', 'No', 'Non');
INSERT INTO `gmsurveyanswers` VALUES ('121', '0', '37', 'N/A', 'N/A');
INSERT INTO `gmsurveyanswers` VALUES ('115', '1', '37', 'Much worse', 'Très mauvaise');
INSERT INTO `gmsurveyanswers` VALUES ('116', '2', '37', 'Somewhat worse', 'Mauvaise');
INSERT INTO `gmsurveyanswers` VALUES ('117', '3', '37', 'About the same', 'Correcte');
INSERT INTO `gmsurveyanswers` VALUES ('118', '4', '37', 'Better', 'Satisfaisante');
INSERT INTO `gmsurveyanswers` VALUES ('119', '5', '37', 'Much better', 'Excellente');
INSERT INTO `gmsurveyanswers` VALUES ('154', '0', '38', 'N/A', 'N/A');
INSERT INTO `gmsurveyanswers` VALUES ('155', '1', '38', 'Much worse', 'Très mauvais');
INSERT INTO `gmsurveyanswers` VALUES ('156', '2', '38', 'Somewhat worse', 'Mauvais');
INSERT INTO `gmsurveyanswers` VALUES ('157', '3', '38', 'About the same', 'Correct');
INSERT INTO `gmsurveyanswers` VALUES ('152', '4', '38', 'Better', 'Satisfaisant');
INSERT INTO `gmsurveyanswers` VALUES ('153', '5', '38', 'Much better', 'Excellent');
INSERT INTO `gmsurveyanswers` VALUES ('160', '0', '39', 'N/A', 'N/A');
INSERT INTO `gmsurveyanswers` VALUES ('161', '1', '39', 'Much worse', 'Très mauvais');
INSERT INTO `gmsurveyanswers` VALUES ('162', '2', '39', 'Somewhat worse', 'Mauvais');
INSERT INTO `gmsurveyanswers` VALUES ('163', '3', '39', 'About the same', 'Correct');
INSERT INTO `gmsurveyanswers` VALUES ('158', '4', '39', 'Better', 'Satisfaisant');
INSERT INTO `gmsurveyanswers` VALUES ('159', '5', '39', 'Much better', 'Excellent');
INSERT INTO `gmsurveyanswers` VALUES ('166', '0', '40', 'N/A', 'N/A');
INSERT INTO `gmsurveyanswers` VALUES ('167', '1', '40', 'Much worse', 'Très mauvaises');
INSERT INTO `gmsurveyanswers` VALUES ('168', '2', '40', 'Somewhat worse', 'Mauvaises');
INSERT INTO `gmsurveyanswers` VALUES ('169', '3', '40', 'About the same', 'Correctes');
INSERT INTO `gmsurveyanswers` VALUES ('164', '4', '40', 'Better', 'Satisfaisantes');
INSERT INTO `gmsurveyanswers` VALUES ('165', '5', '40', 'Much better', 'Excellentes');
INSERT INTO `gmsurveyanswers` VALUES ('172', '0', '41', 'N/A', 'N/A');
INSERT INTO `gmsurveyanswers` VALUES ('173', '1', '41', 'Much worse', 'Très mauvaise');
INSERT INTO `gmsurveyanswers` VALUES ('174', '2', '41', 'Somewhat worse', 'Mauvaise');
INSERT INTO `gmsurveyanswers` VALUES ('175', '3', '41', 'About the same', 'Correcte');
INSERT INTO `gmsurveyanswers` VALUES ('170', '4', '41', 'Better', 'Satisfaisante');
INSERT INTO `gmsurveyanswers` VALUES ('171', '5', '41', 'Much better', 'Excellente');
