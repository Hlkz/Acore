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
-- Table structure for table `locktype`
--

DROP TABLE IF EXISTS `locktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locktype` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `ItemStateName` varchar(100) NOT NULL DEFAULT '',
  `ItemStateName_loc2` varchar(100) NOT NULL DEFAULT '',
  `ProcessName` varchar(100) NOT NULL DEFAULT '',
  `ProcessName_loc2` varchar(100) NOT NULL DEFAULT '',
  `InternalName` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locktype`
--

LOCK TABLES `locktype` WRITE;
/*!40000 ALTER TABLE `locktype` DISABLE KEYS */;
/*!40000 ALTER TABLE `locktype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `locktype`
--

INSERT INTO `locktype` VALUES ('1', 'Lockpicking', 'Crochetage', 'Locked Items', 'Objets verrouillés', 'Pick', 'Crocheter', 'PickLock');
INSERT INTO `locktype` VALUES ('2', 'Herbalism', 'Herboristerie', 'Herbs', 'Herbes', 'Gather', 'Collecter', 'GatherHerbs');
INSERT INTO `locktype` VALUES ('3', 'Mining', 'Minage', 'Ore Deposits', 'Gisements de minerai', 'Mine', 'Miner', 'Mine');
INSERT INTO `locktype` VALUES ('4', 'Disarm Trap', 'Désarmement de piège', 'Trap', 'Piège', 'Disarm', 'Désarmer', '');
INSERT INTO `locktype` VALUES ('5', 'Open', 'Ouverture', 'Unlocked Items', 'Objets déverrouillés', 'Open', 'Ouvrir', '');
INSERT INTO `locktype` VALUES ('6', 'Treasure (DND)', 'Trésor (DND)', 'Treasure', 'Trésor', '', '', '');
INSERT INTO `locktype` VALUES ('7', 'Calcified Elven Gems (DND)', 'Gemmes elfiques calcifiées (DND)', 'Calcified Elven Gems', 'Gemmes elfiques calcifiées', '', '', '');
INSERT INTO `locktype` VALUES ('8', 'Close', 'Fermeture', 'Unlocked Items', 'Objets déverrouillés', 'Close', 'Fermer', '');
INSERT INTO `locktype` VALUES ('9', 'Arm Trap', 'Pose de piège', 'Trap', 'Piège', 'Arm', 'Armer', '');
INSERT INTO `locktype` VALUES ('10', 'Quick Open', 'Ouverture rapide', 'Unlocked Items', 'Objets déverrouillés', 'Open', 'Ouvrir', '');
INSERT INTO `locktype` VALUES ('11', 'Quick Close', 'Fermeture rapide', 'Unlocked Items', 'Objets déverrouillés', 'Close', 'Fermer', '');
INSERT INTO `locktype` VALUES ('12', 'Open Tinkering', 'Ouverture (bricolage)', 'Unlocked Items', 'Objets déverrouillés', 'Open', 'Ouvrir', '');
INSERT INTO `locktype` VALUES ('13', 'Open Kneeling', 'Ouverture (à genoux)', 'Unlocked Items', 'Objets déverrouillés', 'Open', 'Ouvrir', '');
INSERT INTO `locktype` VALUES ('14', 'Open Attacking', 'Ouverture (en attaquant)', 'Unlocked Items', 'Objets déverrouillés', 'Open', 'Ouvrir', '');
INSERT INTO `locktype` VALUES ('15', 'Gahz\'ridian (DND)', 'Gahz\'ridienne (DND)', 'Gahz\'ridian', 'Gahz\'ridienne', '', '', '');
INSERT INTO `locktype` VALUES ('16', 'Blasting', 'Explosif', 'Locked Items', 'Objets verrouillés', 'Blast', 'Faire sauter', '');
INSERT INTO `locktype` VALUES ('17', 'PvP Open', 'Ouverture JcJ', 'Unlocked Items', 'Objets déverrouillés', 'Open', 'Ouvrir', '');
INSERT INTO `locktype` VALUES ('18', 'PvP Close', 'Fermeture JcJ', 'Unlocked Items', 'Objets déverrouillés', 'Close', 'Fermer', '');
INSERT INTO `locktype` VALUES ('19', 'Fishing (DND)', 'Pêche', 'Fish', 'Poisson', 'Fish', 'Pêcher', 'FishingCursor');
INSERT INTO `locktype` VALUES ('20', 'Inscription', 'Calligraphie', 'Tomes', 'Tomes', 'Decipher', 'Déchiffrer', '');
INSERT INTO `locktype` VALUES ('21', 'Open From Vehicle', 'Ouverture à partir d\'un véhicule', 'Unlocked Items', 'Objets déverrouillés', 'Open', 'Ouvrir', '');
