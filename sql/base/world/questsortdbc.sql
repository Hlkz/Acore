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
-- Table structure for table `questsortdbc`
--

DROP TABLE IF EXISTS `questsortdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questsortdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questsortdbc`
--

LOCK TABLES `questsortdbc` WRITE;
/*!40000 ALTER TABLE `questsortdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `questsortdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `questsortdbc`
--

INSERT INTO `questsortdbc` VALUES ('1', 'Epic', 'Épique');
INSERT INTO `questsortdbc` VALUES ('21', 'REUSE - old wailing caverns', 'REUSE - vieilles caves des lamentation');
INSERT INTO `questsortdbc` VALUES ('22', 'Seasonal', 'Saisonnier');
INSERT INTO `questsortdbc` VALUES ('23', 'REUSE - old undercity one', 'REUSE - vieille Fossoyeuse');
INSERT INTO `questsortdbc` VALUES ('24', 'Herbalism', 'Herboristerie');
INSERT INTO `questsortdbc` VALUES ('25', 'Battlegrounds', 'Champs de bataille');
INSERT INTO `questsortdbc` VALUES ('41', 'Day of the Dead', 'REUSE - vieil Uldaman');
INSERT INTO `questsortdbc` VALUES ('61', 'Warlock', 'Démoniste');
INSERT INTO `questsortdbc` VALUES ('81', 'Warrior', 'Guerrier');
INSERT INTO `questsortdbc` VALUES ('82', 'Shaman', 'Chaman');
INSERT INTO `questsortdbc` VALUES ('101', 'Fishing', 'Pêcheur');
INSERT INTO `questsortdbc` VALUES ('121', 'Blacksmithing', 'Forgeron');
INSERT INTO `questsortdbc` VALUES ('141', 'Paladin', 'Paladin');
INSERT INTO `questsortdbc` VALUES ('161', 'Mage', 'Mage');
INSERT INTO `questsortdbc` VALUES ('162', 'Rogue', 'Voleur');
INSERT INTO `questsortdbc` VALUES ('181', 'Alchemy', 'Alchimiste');
INSERT INTO `questsortdbc` VALUES ('182', 'Leatherworking', 'Travailleur du cuir');
INSERT INTO `questsortdbc` VALUES ('201', 'Engineering', 'Ingénieur');
INSERT INTO `questsortdbc` VALUES ('221', 'Treasure Map', 'Carte au trésor');
INSERT INTO `questsortdbc` VALUES ('241', 'Tournament', 'Tournoi');
INSERT INTO `questsortdbc` VALUES ('261', 'Hunter', 'Chasseur');
INSERT INTO `questsortdbc` VALUES ('262', 'Priest', 'Prêtre');
INSERT INTO `questsortdbc` VALUES ('263', 'Druid', 'Druide');
INSERT INTO `questsortdbc` VALUES ('264', 'Tailoring', 'Tailleur');
INSERT INTO `questsortdbc` VALUES ('284', 'Special', 'Spécial');
INSERT INTO `questsortdbc` VALUES ('304', 'Cooking', 'Cuisinier');
INSERT INTO `questsortdbc` VALUES ('324', 'First Aid', 'Secourisme');
INSERT INTO `questsortdbc` VALUES ('344', 'Legendary', 'Légendaire');
INSERT INTO `questsortdbc` VALUES ('364', 'Darkmoon Faire', 'Foire de Sombrelune');
INSERT INTO `questsortdbc` VALUES ('365', 'Ahn\'Qiraj War', 'Guerre d\'Ahn\'Qiraj');
INSERT INTO `questsortdbc` VALUES ('366', 'Lunar Festival', 'Fête lunaire');
INSERT INTO `questsortdbc` VALUES ('367', 'Reputation', 'Réputation');
INSERT INTO `questsortdbc` VALUES ('368', 'Invasion', 'Invasion');
INSERT INTO `questsortdbc` VALUES ('369', 'Midsummer', 'Solstice d\'été');
INSERT INTO `questsortdbc` VALUES ('370', 'Brewfest', 'Fête des Brasseurs');
INSERT INTO `questsortdbc` VALUES ('371', 'Inscription', 'Calligraphie');
INSERT INTO `questsortdbc` VALUES ('372', 'Death Knight', 'Chevalier de la mort');
INSERT INTO `questsortdbc` VALUES ('373', 'Jewelcrafting', 'Joaillerie');
INSERT INTO `questsortdbc` VALUES ('374', 'Noblegarden', 'Jardin des nobles');
INSERT INTO `questsortdbc` VALUES ('375', 'Pilgrim\'s Bounty', 'Bienfaits du pèlerin');
INSERT INTO `questsortdbc` VALUES ('376', 'Love is in the Air', 'De l\'amour dans l\'air');
