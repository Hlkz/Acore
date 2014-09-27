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
-- Table structure for table `wowerror_strings`
--

DROP TABLE IF EXISTS `wowerror_strings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wowerror_strings` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Text` varchar(400) NOT NULL DEFAULT '',
  `Text_loc2` varchar(400) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wowerror_strings`
--

LOCK TABLES `wowerror_strings` WRITE;
/*!40000 ALTER TABLE `wowerror_strings` DISABLE KEYS */;
/*!40000 ALTER TABLE `wowerror_strings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `wowerror_strings`
--

INSERT INTO `wowerror_strings` VALUES ('1', 'APP_TITLE', 'WowError', 'ErreurWow');
INSERT INTO `wowerror_strings` VALUES ('2', 'WOWERROR', 'WOWERROR', 'ERREURWOW');
INSERT INTO `wowerror_strings` VALUES ('3', 'HEADER', 'The following data will be sent to Blizzard when you click Send\nThough you can opt not to send this information, doing so will help us to improve the game.', 'Les informations suivantes seront envoyées à Blizzard lorsque vous cliquerez sur Envoyer\nBien que vous ne soyez pas obligé de nous les envoyer, ces informations nous seront utiles.');
INSERT INTO `wowerror_strings` VALUES ('4', 'SEND', 'Send', 'Envoyer');
INSERT INTO `wowerror_strings` VALUES ('5', 'CANCEL', 'Cancel', 'Annuler');
INSERT INTO `wowerror_strings` VALUES ('6', 'SEND_ERROR', 'Error sending data', 'Erreur lors de l\'envoi des données');
INSERT INTO `wowerror_strings` VALUES ('7', 'PRESS_SEND', 'Press Send to Send', 'Appuyer sur Envoyer pour nous le faire parvenir');
INSERT INTO `wowerror_strings` VALUES ('8', 'SEND_CONNECTING', 'Connecting', 'Connexion en cours');
INSERT INTO `wowerror_strings` VALUES ('9', 'SEND_SENDING', 'Sending', 'Envoi en cours');
INSERT INTO `wowerror_strings` VALUES ('10', 'SEND_DONE', 'Send successful', 'Envoi terminé');
INSERT INTO `wowerror_strings` VALUES ('11', 'SEND_CANT_CONNECT', 'Can not connect to server', 'Impossible de se connecter au serveur');
INSERT INTO `wowerror_strings` VALUES ('12', 'DONE', 'Done', 'Terminer');
INSERT INTO `wowerror_strings` VALUES ('13', 'DESCRIBE', 'Describe what you were doing when the crash occurred', 'Décrivez ce que vous étiez en train de faire lorsque l\'erreur est survenue');
