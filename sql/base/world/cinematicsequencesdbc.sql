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
-- Table structure for table `cinematicsequencesdbc`
--

DROP TABLE IF EXISTS `cinematicsequencesdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinematicsequencesdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `SoundId` int(10) NOT NULL DEFAULT '0',
  `CinematicCamera` int(10) NOT NULL DEFAULT '0',
  `Camera1` int(10) NOT NULL DEFAULT '0',
  `Camera2` int(10) NOT NULL DEFAULT '0',
  `Camera3` int(10) NOT NULL DEFAULT '0',
  `Camera4` int(10) NOT NULL DEFAULT '0',
  `Camera5` int(10) NOT NULL DEFAULT '0',
  `Camera6` int(10) NOT NULL DEFAULT '0',
  `Camera7` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinematicsequencesdbc`
--

LOCK TABLES `cinematicsequencesdbc` WRITE;
/*!40000 ALTER TABLE `cinematicsequencesdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinematicsequencesdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `cinematicsequencesdbc`
--

INSERT INTO `cinematicsequencesdbc` VALUES ('1', '0', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cinematicsequencesdbc` VALUES ('2', '0', '2', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cinematicsequencesdbc` VALUES ('21', '0', '235', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cinematicsequencesdbc` VALUES ('41', '0', '234', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cinematicsequencesdbc` VALUES ('61', '0', '122', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cinematicsequencesdbc` VALUES ('81', '0', '142', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cinematicsequencesdbc` VALUES ('101', '0', '162', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cinematicsequencesdbc` VALUES ('121', '0', '182', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cinematicsequencesdbc` VALUES ('141', '0', '202', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cinematicsequencesdbc` VALUES ('161', '0', '224', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cinematicsequencesdbc` VALUES ('162', '0', '243', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cinematicsequencesdbc` VALUES ('163', '0', '244', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cinematicsequencesdbc` VALUES ('164', '0', '245', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cinematicsequencesdbc` VALUES ('165', '0', '246', '0', '0', '0', '0', '0', '0', '0');
