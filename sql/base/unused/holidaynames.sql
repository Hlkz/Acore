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
-- Table structure for table `holidaynames`
--

DROP TABLE IF EXISTS `holidaynames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidaynames` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidaynames`
--

LOCK TABLES `holidaynames` WRITE;
/*!40000 ALTER TABLE `holidaynames` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidaynames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `holidaynames`
--

INSERT INTO `holidaynames` VALUES ('1', 'Darkmoon Faire', 'Foire de Sombrelune');
INSERT INTO `holidaynames` VALUES ('5', 'Fireworks Celebration', 'Fêtes des artifices');
INSERT INTO `holidaynames` VALUES ('6', 'Stranglethorn Fishing Extravaganza', 'Concours de pêche de Strangleronce');
INSERT INTO `holidaynames` VALUES ('7', 'Brewfest', 'Fête des Brasseurs');
INSERT INTO `holidaynames` VALUES ('9', 'Love is in the Air', 'De l\'amour dans l\'air');
INSERT INTO `holidaynames` VALUES ('11', 'Midsummer Fire Festival', 'Fête du Feu du solstice d\'été');
INSERT INTO `holidaynames` VALUES ('12', 'Fireworks Spectacular', 'Féerie des artifices');
INSERT INTO `holidaynames` VALUES ('13', 'Children\'s Week', 'Semaine des enfants');
INSERT INTO `holidaynames` VALUES ('14', 'Feast of Winter Veil', 'Voile d\'hiver');
INSERT INTO `holidaynames` VALUES ('15', 'Noblegarden', 'Le Jardin des nobles');
INSERT INTO `holidaynames` VALUES ('16', 'Hallow\'s End', 'Sanssaint');
INSERT INTO `holidaynames` VALUES ('17', 'Harvest Festival', 'Fête des moissons');
INSERT INTO `holidaynames` VALUES ('18', 'Lunar Festival', 'Fête lunaire');
INSERT INTO `holidaynames` VALUES ('19', 'Brewfest', 'Fête des Brasseurs');
INSERT INTO `holidaynames` VALUES ('21', 'Pirates\' Day', 'Jour des pirates');
INSERT INTO `holidaynames` VALUES ('22', 'Call to Arms: Alterac Valley', 'Appel aux armes : vallée d\'Alterac');
INSERT INTO `holidaynames` VALUES ('23', 'Call to Arms: Arathi Basin', 'Appel aux armes : bassin d\'Arathi');
INSERT INTO `holidaynames` VALUES ('24', 'Call to Arms: Eye of the Storm', 'Appel aux armes : Œil du cyclone');
INSERT INTO `holidaynames` VALUES ('25', 'Call to Arms: Warsong Gulch', 'Appel aux armes : goulet des Chanteguerres');
INSERT INTO `holidaynames` VALUES ('41', 'Call to Arms: Strand of the Ancients', 'Appel aux armes : rivage des Anciens');
INSERT INTO `holidaynames` VALUES ('61', 'Wrath of the Lich King Launch', 'Lancement de Wrath of the Lich King');
INSERT INTO `holidaynames` VALUES ('81', 'Day of the Dead', 'Jour des morts');
INSERT INTO `holidaynames` VALUES ('101', 'Pilgrim\'s Bounty', 'Les Bienfaits du pèlerin');
INSERT INTO `holidaynames` VALUES ('121', 'Call to Arms: Isle of Conquest', 'Appel aux armes : île des Conquérants');
INSERT INTO `holidaynames` VALUES ('141', 'Mohawk Promotion', 'Promotion Punk');
INSERT INTO `holidaynames` VALUES ('161', 'Kalu\'ak Fishing Derby', 'Tournoi de pêche kalu\'ak');
