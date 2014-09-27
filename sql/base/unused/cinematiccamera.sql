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
-- Table structure for table `cinematiccamera`
--

DROP TABLE IF EXISTS `cinematiccamera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinematiccamera` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Filepath` varchar(100) NOT NULL DEFAULT '',
  `Voiceover` int(10) NOT NULL DEFAULT '0',
  `X` float NOT NULL DEFAULT '0',
  `Y` float NOT NULL DEFAULT '0',
  `Z` float NOT NULL DEFAULT '0',
  `Rotation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinematiccamera`
--

LOCK TABLES `cinematiccamera` WRITE;
/*!40000 ALTER TABLE `cinematiccamera` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinematiccamera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `cinematiccamera`
--

INSERT INTO `cinematiccamera` VALUES ('1', 'Cameras\\PalantirOfAzora.mdx', '0', '-9282.42', '-3329.66', '116.341', '4.60767');
INSERT INTO `cinematiccamera` VALUES ('2', 'Cameras\\FlybyUndead.mdx', '3358', '1658.58', '1662.91', '141.234', '3.14159');
INSERT INTO `cinematiccamera` VALUES ('122', 'Cameras\\FlybyNightElf.mdx', '3800', '10474', '813.131', '1318.66', '3.735');
INSERT INTO `cinematiccamera` VALUES ('142', 'Cameras\\FlyByHuman.mdx', '3840', '-8945.52', '-118.786', '82.9306', '0.191986');
INSERT INTO `cinematiccamera` VALUES ('162', 'Cameras\\FlyByGnome.mdx', '3841', '-5784.35', '424.736', '426.592', '0.925025');
INSERT INTO `cinematiccamera` VALUES ('182', 'Cameras\\FlyByTroll.mdx', '4080', '-774.695', '-4911.21', '19.6127', '2.94961');
INSERT INTO `cinematiccamera` VALUES ('202', 'Cameras\\FlyByTauren.mdx', '4122', '-2873.26', '-266.821', '53.9164', '3.15905');
INSERT INTO `cinematiccamera` VALUES ('224', 'Cameras\\Scry_cam.mdx', '0', '-153.586', '-3450.84', '139.331', '3.35103');
INSERT INTO `cinematiccamera` VALUES ('234', 'Cameras\\FlyByDwarf.mdx', '3740', '-5579.16', '-455.776', '406.476', '4.71239');
INSERT INTO `cinematiccamera` VALUES ('235', 'Cameras\\FlybyOrc.mdx', '3760', '-603.411', '-4193.41', '41.092', '4.67748');
INSERT INTO `cinematiccamera` VALUES ('243', 'Cameras\\FlyByBloodElf.mdx', '9156', '8099.13', '-6942.68', '66.7039', '1.13446');
INSERT INTO `cinematiccamera` VALUES ('244', 'Cameras\\FlybyDraenei.mdx', '9155', '-3963.27', '-13938.7', '99.6888', '5.20108');
INSERT INTO `cinematiccamera` VALUES ('245', 'Cameras\\FlyBySunwell5Man.mdx', '12213', '-149.784', '-354.238', '-77.789', '5.34071');
INSERT INTO `cinematiccamera` VALUES ('246', 'Cameras\\FlyByDeathKnight.mdx', '12938', '2301.89', '-5346.32', '88.9573', '2.16421');
