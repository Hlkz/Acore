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
-- Table structure for table `chatchannelsdbc`
--

DROP TABLE IF EXISTS `chatchannelsdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatchannelsdbc` (
  `ChannelId` int(10) NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  `FactionGroup` int(10) NOT NULL DEFAULT '0',
  `Pattern` varchar(100) NOT NULL DEFAULT '',
  `Pattern_loc2` varchar(100) NOT NULL DEFAULT '',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`ChannelId`),
  UNIQUE KEY `ID` (`ChannelId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatchannelsdbc`
--

LOCK TABLES `chatchannelsdbc` WRITE;
/*!40000 ALTER TABLE `chatchannelsdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatchannelsdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `chatchannelsdbc`
--

INSERT INTO `chatchannelsdbc` VALUES ('1', '524291', '0', 'General - %s', 'Général - %s', 'General', 'Général');
INSERT INTO `chatchannelsdbc` VALUES ('2', '59', '0', 'Trade - %s', 'Commerce - %s', 'Trade', 'Commerce');
INSERT INTO `chatchannelsdbc` VALUES ('22', '65539', '0', 'LocalDefense - %s', 'DéfenseLocale - %s', 'LocalDefense', 'DéfenseLocale');
INSERT INTO `chatchannelsdbc` VALUES ('23', '65540', '0', 'WorldDefense', 'DéfenseUniverselle', 'WorldDefense', 'DéfenseUniverselle');
INSERT INTO `chatchannelsdbc` VALUES ('25', '131122', '0', 'GuildRecruitment - %s', 'RecrutementDeGuilde - %s', 'GuildRecruitment', 'RecrutementDeGuilde');
INSERT INTO `chatchannelsdbc` VALUES ('26', '262201', '0', 'LookingForGroup', 'RechercheDeGroupe', 'LookingForGroup', 'RechercheDeGroupe');
