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
-- Table structure for table `startup_strings`
--

DROP TABLE IF EXISTS `startup_strings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `startup_strings` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `InternalName` varchar(100) NOT NULL DEFAULT '',
  `Text` varchar(300) NOT NULL DEFAULT '',
  `Text_loc2` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startup_strings`
--

LOCK TABLES `startup_strings` WRITE;
/*!40000 ALTER TABLE `startup_strings` DISABLE KEYS */;
/*!40000 ALTER TABLE `startup_strings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `startup_strings`
--

INSERT INTO `startup_strings` VALUES ('1', 'MSG_TITLE_WOW', 'World of Warcraft', 'World of Warcraft');
INSERT INTO `startup_strings` VALUES ('2', 'MSG_GX_INIT_FAILED_D3D', 'World of Warcraft was unable to start up 3D acceleration. Please make sure DirectX 9.0c is installed and your video drivers are up-to-date.', 'World of Warcraft n\'a pu lancer l\'accélération 3D. Assurez-vous que DirectX 9.0c est installé et que vos pilotes graphiques sont à jour.');
INSERT INTO `startup_strings` VALUES ('3', 'MSG_GX_INIT_FAILED', 'World of Warcraft was unable to start up 3D acceleration.', 'World of Warcraft n\'a pu lancer l\'accélération 3D.');
INSERT INTO `startup_strings` VALUES ('4', 'MSG_HW_UNSUPPORTED', 'Your 3D accelerator card is not supported by World of Warcraft. Please install a 3D accelerator card with dual-TMU support.', 'Votre carte accélératrice 3D n\'est pas compatible avec World of Warcraft. Veuillez installer une carte accélératrice 3D avec deux unités de mappage des textures (TMU).');
INSERT INTO `startup_strings` VALUES ('5', 'MSG_HW_CHANGED', 'Hardware changed.  Reload default settings?', 'Matériel modifié. Charger les paramètres par défaut ?');
INSERT INTO `startup_strings` VALUES ('9', 'MSG_GLUEXML_UI_CORRUPT', 'Your login interface files are corrupt.  Please reinstall the game.', 'Vos fichiers d\'interface de connexion sont corrompus. Veuillez réinstaller le jeu.');
INSERT INTO `startup_strings` VALUES ('10', 'MSG_FRAMEXML_UI_CORRUPT', 'Your game interface files are corrupt.  Please remove your Interface\\FrameXML folder.', 'Vos fichiers d\'interface sont corrompus. Veuillez supprimer votre dossier Interface\\Frame\\XML.');
INSERT INTO `startup_strings` VALUES ('11', 'MSG_GX_NO_DEVICE', 'Failed to find a suitable display device.  Exiting program.', 'Impossible de trouver un dispositif d\'affichage adéquat. Fermeture du programme.');
INSERT INTO `startup_strings` VALUES ('12', 'MSG_REMOTE_DESKTOP', 'Running World of Warcraft through a Remote Desktop connection is not supported.  Exiting program.', 'World of Warcraft n\'est pas conçu pour fonctionner via une connexion de bureau virtuel distant. Fermeture du programme.');
