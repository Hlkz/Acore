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
-- Table structure for table `soundsamplepreferences`
--

DROP TABLE IF EXISTS `soundsamplepreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soundsamplepreferences` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Unk1` int(10) NOT NULL DEFAULT '0',
  `Unk2` int(10) NOT NULL DEFAULT '0',
  `Unk3` int(10) NOT NULL DEFAULT '0',
  `Unk4` int(10) NOT NULL DEFAULT '0',
  `Unk5` int(10) NOT NULL DEFAULT '0',
  `Unk6` float NOT NULL DEFAULT '0',
  `Unk7` int(10) NOT NULL DEFAULT '0',
  `Unk8` float NOT NULL DEFAULT '0',
  `Unk9` float NOT NULL DEFAULT '0',
  `Unk10` int(10) NOT NULL DEFAULT '0',
  `Unk11` float NOT NULL DEFAULT '0',
  `Unk12` int(10) NOT NULL DEFAULT '0',
  `Unk13` float NOT NULL DEFAULT '0',
  `Unk14` float NOT NULL DEFAULT '0',
  `Unk15` float NOT NULL DEFAULT '0',
  `Unk16` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soundsamplepreferences`
--

LOCK TABLES `soundsamplepreferences` WRITE;
/*!40000 ALTER TABLE `soundsamplepreferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `soundsamplepreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `soundsamplepreferences`
--

INSERT INTO `soundsamplepreferences` VALUES ('1', '1000', '0', '1000', '0', '0', '1', '0', '1', '10', '0', '0', '0', '10', '-10000', '1', '0');
INSERT INTO `soundsamplepreferences` VALUES ('2', '1000', '0', '1000', '0', '0', '0', '0', '0.25', '1.5', '0', '1', '0', '1', '0', '1', '0');
