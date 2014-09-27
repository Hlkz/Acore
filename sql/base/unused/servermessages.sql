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
-- Table structure for table `servermessages`
--

DROP TABLE IF EXISTS `servermessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servermessages` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Message` varchar(200) NOT NULL DEFAULT '',
  `Message_loc2` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servermessages`
--

LOCK TABLES `servermessages` WRITE;
/*!40000 ALTER TABLE `servermessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `servermessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `servermessages`
--

INSERT INTO `servermessages` VALUES ('1', '[SERVER] Shutdown in %s', '[SERVEUR] Arrêt dans %s.');
INSERT INTO `servermessages` VALUES ('2', '[SERVER] Restart in %s', '[SERVEUR] Redémarrage dans %s.');
INSERT INTO `servermessages` VALUES ('3', '%s', '%s');
INSERT INTO `servermessages` VALUES ('4', '[SERVER] Shutdown cancelled', '[SERVEUR] Arrêt annulé.');
INSERT INTO `servermessages` VALUES ('5', '[SERVER] Restart cancelled', '[SERVEUR] Redémarrage annulé.');
INSERT INTO `servermessages` VALUES ('6', '[SERVER] Battleground shutdown in %s', '[SERVEUR] Arrêt du champ de bataille dans %s.');
INSERT INTO `servermessages` VALUES ('7', '[SERVER] Battleground restart in %s', '[SERVEUR] Redémarrage du champ de bataille dans %s.');
INSERT INTO `servermessages` VALUES ('8', '[SERVER] Instance shutdown in %s', '[SERVEUR] Arrêt de l\'instance dans %s.');
INSERT INTO `servermessages` VALUES ('9', '[SERVER] Instance restart in %s', '[SERVEUR] Redémarrage de l\'instance dans %s.');
