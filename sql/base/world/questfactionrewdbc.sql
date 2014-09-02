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
-- Table structure for table `questfactionrewdbc`
--

DROP TABLE IF EXISTS `questfactionrewdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questfactionrewdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `QuestRewFactionValue1` int(10) NOT NULL DEFAULT '0',
  `QuestRewFactionValue2` int(10) NOT NULL DEFAULT '0',
  `QuestRewFactionValue3` int(10) NOT NULL DEFAULT '0',
  `QuestRewFactionValue4` int(10) NOT NULL DEFAULT '0',
  `QuestRewFactionValue5` int(10) NOT NULL DEFAULT '0',
  `QuestRewFactionValue6` int(10) NOT NULL DEFAULT '0',
  `QuestRewFactionValue7` int(10) NOT NULL DEFAULT '0',
  `QuestRewFactionValue8` int(10) NOT NULL DEFAULT '0',
  `QuestRewFactionValue9` int(10) NOT NULL DEFAULT '0',
  `QuestRewFactionValue10` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ID` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questfactionrewdbc`
--

LOCK TABLES `questfactionrewdbc` WRITE;
/*!40000 ALTER TABLE `questfactionrewdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `questfactionrewdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `questfactionrewdbc`
--

INSERT INTO `questfactionrewdbc` VALUES ('1', '0', '10', '25', '75', '150', '250', '350', '500', '1000', '5');
INSERT INTO `questfactionrewdbc` VALUES ('2', '0', '-10', '-25', '-75', '-150', '-250', '-350', '-500', '-1000', '-5');
