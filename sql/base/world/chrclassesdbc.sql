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
-- Table structure for table `chrclassesdbc`
--

DROP TABLE IF EXISTS `chrclassesdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chrclassesdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Unused` int(10) NOT NULL DEFAULT '0',
  `PowerType` int(10) NOT NULL DEFAULT '0',
  `DispayPower` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(200) NOT NULL DEFAULT '',
  `Name_loc2` varchar(200) NOT NULL DEFAULT '',
  `Female` varchar(100) NOT NULL DEFAULT '',
  `Female_loc2` varchar(100) NOT NULL DEFAULT '',
  `Male` varchar(100) NOT NULL DEFAULT '',
  `Male_loc2` varchar(100) NOT NULL DEFAULT '',
  `FileName` varchar(100) NOT NULL DEFAULT '',
  `SpellFamily` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  `CinematicSequence` int(10) NOT NULL DEFAULT '0',
  `Expansion` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chrclassesdbc`
--

LOCK TABLES `chrclassesdbc` WRITE;
/*!40000 ALTER TABLE `chrclassesdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `chrclassesdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `chrclassesdbc`
--

INSERT INTO `chrclassesdbc` VALUES ('1', '0', '1', '1', 'Warrior', 'Guerrier', '', 'Guerrière', '', 'Guerrier', 'WARRIOR', '4', '50', '0', '0');
INSERT INTO `chrclassesdbc` VALUES ('2', '0', '0', '1', 'Paladin', 'Paladin', '', '', '', 'Paladin', 'PALADIN', '10', '58', '0', '0');
INSERT INTO `chrclassesdbc` VALUES ('3', '1', '0', '1', 'Hunter', 'Chasseur', '', 'Chasseresse', '', 'Chasseur', 'HUNTER', '9', '22', '0', '0');
INSERT INTO `chrclassesdbc` VALUES ('4', '1', '3', '1', 'Rogue', 'Voleur', '', 'Voleuse', '', 'Voleur', 'ROGUE', '8', '2', '0', '0');
INSERT INTO `chrclassesdbc` VALUES ('5', '0', '0', '1', 'Priest', 'Prêtre', '', 'Prêtresse', '', 'Prêtre', 'PRIEST', '6', '2', '0', '0');
INSERT INTO `chrclassesdbc` VALUES ('6', '9', '6', '1', 'Death Knight', 'Chevalier de la mort', '', '', '', 'Chevalier de la mort', 'DEATHKNIGHT', '15', '122', '165', '2');
INSERT INTO `chrclassesdbc` VALUES ('7', '1', '0', '1', 'Shaman', 'Chaman', '', 'Chamane', '', 'Chaman', 'SHAMAN', '11', '26', '0', '0');
INSERT INTO `chrclassesdbc` VALUES ('8', '0', '0', '1', 'Mage', 'Mage', '', 'Mage', '', 'Mage', 'MAGE', '3', '2', '0', '0');
INSERT INTO `chrclassesdbc` VALUES ('9', '0', '0', '126', 'Warlock', 'Démoniste', '', 'Démoniste', '', 'Démoniste', 'WARLOCK', '5', '6', '0', '0');
INSERT INTO `chrclassesdbc` VALUES ('11', '0', '0', '1', 'Druid', 'Druide', '', 'Druidesse', '', 'Druide', 'DRUID', '7', '10', '0', '0');
