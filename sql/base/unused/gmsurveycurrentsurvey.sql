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
-- Table structure for table `gmsurveycurrentsurvey`
--

DROP TABLE IF EXISTS `gmsurveycurrentsurvey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gmsurveycurrentsurvey` (
  `LangId` int(10) NOT NULL DEFAULT '0',
  `GMSurveyId` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LangId`),
  UNIQUE KEY `ID` (`LangId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gmsurveycurrentsurvey`
--

LOCK TABLES `gmsurveycurrentsurvey` WRITE;
/*!40000 ALTER TABLE `gmsurveycurrentsurvey` DISABLE KEYS */;
/*!40000 ALTER TABLE `gmsurveycurrentsurvey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `gmsurveycurrentsurvey`
--

INSERT INTO `gmsurveycurrentsurvey` VALUES ('0', '9');
INSERT INTO `gmsurveycurrentsurvey` VALUES ('1', '9');
INSERT INTO `gmsurveycurrentsurvey` VALUES ('2', '9');
INSERT INTO `gmsurveycurrentsurvey` VALUES ('3', '9');
INSERT INTO `gmsurveycurrentsurvey` VALUES ('4', '9');
INSERT INTO `gmsurveycurrentsurvey` VALUES ('5', '9');
INSERT INTO `gmsurveycurrentsurvey` VALUES ('6', '9');
INSERT INTO `gmsurveycurrentsurvey` VALUES ('7', '9');
INSERT INTO `gmsurveycurrentsurvey` VALUES ('8', '9');
