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
-- Table structure for table `gmticketcategory`
--

DROP TABLE IF EXISTS `gmticketcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gmticketcategory` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(200) NOT NULL DEFAULT '',
  `Name_loc2` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gmticketcategory`
--

LOCK TABLES `gmticketcategory` WRITE;
/*!40000 ALTER TABLE `gmticketcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `gmticketcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `gmticketcategory`
--

INSERT INTO `gmticketcategory` VALUES ('0', '<not set>', '<non fixé>');
INSERT INTO `gmticketcategory` VALUES ('1', 'Stuck', 'Coincé');
INSERT INTO `gmticketcategory` VALUES ('2', 'Behavior/Harassment', 'Comportement/Harcèlement/Nommage');
INSERT INTO `gmticketcategory` VALUES ('3', 'Guild', 'Guilde');
INSERT INTO `gmticketcategory` VALUES ('4', 'Item', 'Objet');
INSERT INTO `gmticketcategory` VALUES ('5', 'Environmental', 'Environnement');
INSERT INTO `gmticketcategory` VALUES ('6', 'Non-Quest/Creep', 'Personnage non-joueur hors quête/Monstre errant');
INSERT INTO `gmticketcategory` VALUES ('7', 'Quest/Quest NPC', 'Quête/Personnage non-joueur de quête');
INSERT INTO `gmticketcategory` VALUES ('8', 'Technical', 'Problème technique');
INSERT INTO `gmticketcategory` VALUES ('9', 'Account/Billing', 'Compte et facturation');
INSERT INTO `gmticketcategory` VALUES ('10', 'Character', 'Votre personnage');
INSERT INTO `gmticketcategory` VALUES ('11', 'Arena/Honor item issues', 'Objets d\'arène/honneur');
INSERT INTO `gmticketcategory` VALUES ('12', 'Arena/Honor points issues', 'Points d\'arène/honneur');
INSERT INTO `gmticketcategory` VALUES ('13', 'Botting/Cheating/Hacking', 'Automatisation/Triche/Piratage');
INSERT INTO `gmticketcategory` VALUES ('14', 'Bug report', 'Signalement de bug');
INSERT INTO `gmticketcategory` VALUES ('15', 'Compromised account issue', 'Compte compromis');
INSERT INTO `gmticketcategory` VALUES ('16', 'Game suggestions', 'Suggestions de jeu');
INSERT INTO `gmticketcategory` VALUES ('17', 'Gameplay question', 'Expérience de jeu');
INSERT INTO `gmticketcategory` VALUES ('18', 'Guild bank issue', 'Banque de guilde');
INSERT INTO `gmticketcategory` VALUES ('19', 'Guild master issue', 'Maître de guilde');
INSERT INTO `gmticketcategory` VALUES ('20', 'Harassment', 'Harcèlement');
INSERT INTO `gmticketcategory` VALUES ('21', 'Inappropriate name Guild/Arena/Character/Pet', 'Nom de guilde/équipe d\'arène/personnage/familier innaproprié');
INSERT INTO `gmticketcategory` VALUES ('22', 'Known issue fix', 'Résolution de problème connu');
INSERT INTO `gmticketcategory` VALUES ('23', 'Latency/Lag report', 'Signalement de latence/ralentissement');
INSERT INTO `gmticketcategory` VALUES ('24', 'Looting issue/mistake', 'Butin/erreur d\'attribution');
INSERT INTO `gmticketcategory` VALUES ('25', 'Mail issue', 'Courrier');
INSERT INTO `gmticketcategory` VALUES ('26', 'Non in game related inquiry', 'Requête extérieure au jeu');
INSERT INTO `gmticketcategory` VALUES ('27', 'Parental controls/CAIS', 'Contrôle parental');
INSERT INTO `gmticketcategory` VALUES ('28', 'PCNC', 'Changement de nom de personnage');
INSERT INTO `gmticketcategory` VALUES ('29', 'PCT', 'TPP');
INSERT INTO `gmticketcategory` VALUES ('30', 'Restoration status/follow up', 'Statut et suivi de restauration');
INSERT INTO `gmticketcategory` VALUES ('31', 'Server/Instance issues', 'Serveur/Instance');
INSERT INTO `gmticketcategory` VALUES ('32', 'Spam', 'Spam');
INSERT INTO `gmticketcategory` VALUES ('33', 'Suicide case', 'Cas de suicide');
INSERT INTO `gmticketcategory` VALUES ('34', 'Suspension questions', 'Suspension');
INSERT INTO `gmticketcategory` VALUES ('35', 'Technical/Sound/Graphics issue', 'Problème technique/sonore/graphique');
INSERT INTO `gmticketcategory` VALUES ('36', 'UI issue', 'Problème d\'IU');
INSERT INTO `gmticketcategory` VALUES ('37', 'Scam Report', 'Escroquerie');
