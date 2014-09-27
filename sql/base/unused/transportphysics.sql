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
-- Table structure for table `transportphysics`
--

DROP TABLE IF EXISTS `transportphysics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportphysics` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `WaveAmp` float NOT NULL DEFAULT '0',
  `WaveTimeScale` float NOT NULL DEFAULT '0',
  `RollAmp` float NOT NULL DEFAULT '0',
  `RollTimeScale` float NOT NULL DEFAULT '0',
  `PitchAmp` float NOT NULL DEFAULT '0',
  `PitchTimeScale` float NOT NULL DEFAULT '0',
  `MaxBank` float NOT NULL DEFAULT '0',
  `MaxBankTurnSpeed` float NOT NULL DEFAULT '0',
  `SpeedDampThresh` float NOT NULL DEFAULT '0',
  `SpeedDamp` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportphysics`
--

LOCK TABLES `transportphysics` WRITE;
/*!40000 ALTER TABLE `transportphysics` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportphysics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `transportphysics`
--

INSERT INTO `transportphysics` VALUES ('1', '0.5', '0.5', '0.1', '0.25', '0.05', '0.1', '0.05', '0.7', '25', '0.1');
INSERT INTO `transportphysics` VALUES ('21', '3.3', '1.1', '2', '2.5', '0.88', '1.9', '2', '3.5', '25', '0.1');
INSERT INTO `transportphysics` VALUES ('61', '0.35', '3.5', '0.1', '0.2', '0.02', '0.05', '0.04', '0.65', '25', '0.1');
