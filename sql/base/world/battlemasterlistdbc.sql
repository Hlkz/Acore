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
-- Table structure for table `battlemasterlistdbc`
--

DROP TABLE IF EXISTS `battlemasterlistdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battlemasterlistdbc` (
  `Id` int(4) NOT NULL DEFAULT '0',
  `Instance1` int(4) NOT NULL DEFAULT '0',
  `Instance2` int(4) NOT NULL DEFAULT '0',
  `Instance3` int(4) NOT NULL DEFAULT '0',
  `Instance4` int(4) NOT NULL DEFAULT '0',
  `Instance5` int(4) NOT NULL DEFAULT '0',
  `Instance6` int(4) NOT NULL DEFAULT '0',
  `Instance7` int(4) NOT NULL DEFAULT '0',
  `Instance8` int(4) NOT NULL DEFAULT '0',
  `InstanceType` int(4) NOT NULL DEFAULT '0',
  `JoinAsGroup` int(4) NOT NULL DEFAULT '0',
  `Name` varchar(300) DEFAULT '',
  `Name_loc2` varchar(300) DEFAULT '',
  `MaxGroupSize` int(4) NOT NULL DEFAULT '0',
  `HolidayWorldStateId` int(4) NOT NULL DEFAULT '0',
  `MinLevel` int(4) NOT NULL DEFAULT '0',
  `MaxLevel` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battlemasterlistdbc`
--

LOCK TABLES `battlemasterlistdbc` WRITE;
/*!40000 ALTER TABLE `battlemasterlistdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlemasterlistdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `battlemasterlistdbc`
--

INSERT INTO `battlemasterlistdbc` VALUES ('1', '30', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '3', '1', 'Alterac Valley', 'Vallée d\'Alterac', '5', '1941', '51', '80');
INSERT INTO `battlemasterlistdbc` VALUES ('2', '489', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '3', '1', 'Warsong Gulch', 'Goulet des Chanteguerres', '10', '1942', '10', '80');
INSERT INTO `battlemasterlistdbc` VALUES ('3', '529', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '3', '1', 'Arathi Basin', 'Bassin d\'Arathi', '15', '1943', '20', '80');
INSERT INTO `battlemasterlistdbc` VALUES ('4', '559', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '4', '1', 'Nagrand Arena', 'Arène de Nagrand', '5', '0', '10', '80');
INSERT INTO `battlemasterlistdbc` VALUES ('5', '562', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '4', '1', 'Blade\'s Edge Arena', 'Arène des Tranchantes', '5', '0', '10', '80');
INSERT INTO `battlemasterlistdbc` VALUES ('6', '559', '562', '572', '617', '618', '-1', '-1', '-1', '4', '1', 'All Arenas', 'Toutes les arènes', '5', '0', '10', '80');
INSERT INTO `battlemasterlistdbc` VALUES ('7', '566', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '3', '1', 'Eye of the Storm', 'L\'Œil du cyclone', '15', '2851', '61', '80');
INSERT INTO `battlemasterlistdbc` VALUES ('8', '572', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '4', '1', 'Ruins of Lordaeron', 'Ruines de Lordaeron', '5', '0', '10', '80');
INSERT INTO `battlemasterlistdbc` VALUES ('9', '607', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '3', '1', 'Strand of the Ancients', 'Rivage des Anciens', '15', '3695', '71', '80');
INSERT INTO `battlemasterlistdbc` VALUES ('10', '617', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '4', '1', 'Dalaran Sewers', 'Egouts de Dalaran', '5', '0', '10', '80');
INSERT INTO `battlemasterlistdbc` VALUES ('11', '618', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '4', '1', 'The Ring of Valor', 'L\'arène des valeureux', '5', '0', '10', '80');
INSERT INTO `battlemasterlistdbc` VALUES ('30', '628', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '3', '1', 'Isle of Conquest', 'Île des Conquérants', '5', '4273', '71', '80');
INSERT INTO `battlemasterlistdbc` VALUES ('32', '30', '489', '529', '566', '607', '628', '-1', '-1', '3', '1', 'Random Battleground', 'Champ de bataille aléatoire', '5', '0', '0', '0');
