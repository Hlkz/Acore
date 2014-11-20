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
-- Table structure for table `skilltiers`
--

DROP TABLE IF EXISTS `skilltiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skilltiers` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `SkillValue1` int(10) NOT NULL DEFAULT '0',
  `SkillValue2` int(10) NOT NULL DEFAULT '0',
  `SkillValue3` int(10) NOT NULL DEFAULT '0',
  `SkillValue4` int(10) NOT NULL DEFAULT '0',
  `SkillValue5` int(10) NOT NULL DEFAULT '0',
  `SkillValue6` int(10) NOT NULL DEFAULT '0',
  `SkillValue7` int(10) NOT NULL DEFAULT '0',
  `SkillValue8` int(10) NOT NULL DEFAULT '0',
  `SkillValue9` int(10) NOT NULL DEFAULT '0',
  `SkillValue10` int(10) NOT NULL DEFAULT '0',
  `SkillValue11` int(10) NOT NULL DEFAULT '0',
  `SkillValue12` int(10) NOT NULL DEFAULT '0',
  `SkillValue13` int(10) NOT NULL DEFAULT '0',
  `SkillValue14` int(10) NOT NULL DEFAULT '0',
  `SkillValue15` int(10) NOT NULL DEFAULT '0',
  `SkillValue16` int(10) NOT NULL DEFAULT '0',
  `MaxValue1` int(10) NOT NULL DEFAULT '0',
  `MaxValue2` int(10) NOT NULL DEFAULT '0',
  `MaxValue3` int(10) NOT NULL DEFAULT '0',
  `MaxValue4` int(10) NOT NULL DEFAULT '0',
  `MaxValue5` int(10) NOT NULL DEFAULT '0',
  `MaxValue6` int(10) NOT NULL DEFAULT '0',
  `MaxValue7` int(10) NOT NULL DEFAULT '0',
  `MaxValue8` int(10) NOT NULL DEFAULT '0',
  `MaxValue9` int(10) NOT NULL DEFAULT '0',
  `MaxValue10` int(10) NOT NULL DEFAULT '0',
  `MaxValue11` int(10) NOT NULL DEFAULT '0',
  `MaxValue12` int(10) NOT NULL DEFAULT '0',
  `MaxValue13` int(10) NOT NULL DEFAULT '0',
  `MaxValue14` int(10) NOT NULL DEFAULT '0',
  `MaxValue15` int(10) NOT NULL DEFAULT '0',
  `MaxValue16` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skilltiers`
--

LOCK TABLES `skilltiers` WRITE;
/*!40000 ALTER TABLE `skilltiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `skilltiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `skilltiers`
--

INSERT INTO `skilltiers` VALUES ('2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '75', '150', '225', '300', '375', '450', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('21', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '300', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('22', '30', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('23', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '75', '150', '225', '300', '375', '450', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('24', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('41', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '75', '150', '225', '300', '375', '450', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('61', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '75', '150', '225', '300', '375', '450', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('62', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '75', '150', '225', '300', '375', '450', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('63', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '75', '150', '225', '300', '375', '450', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('81', '100', '400', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '75', '150', '225', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('121', '50', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('122', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('123', '75', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('124', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('125', '200', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('126', '60', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('127', '25', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('141', '120', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('142', '180', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('143', '60', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('161', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '75', '150', '225', '300', '375', '450', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('181', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '300', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('182', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '300', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('221', '30', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('222', '50', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `skilltiers` VALUES ('223', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '75', '150', '225', '300', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
