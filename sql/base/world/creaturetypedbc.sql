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
-- Table structure for table `creaturetypedbc`
--

DROP TABLE IF EXISTS `creaturetypedbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creaturetypedbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `NoExperience` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creaturetypedbc`
--

LOCK TABLES `creaturetypedbc` WRITE;
/*!40000 ALTER TABLE `creaturetypedbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `creaturetypedbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `creaturetypedbc`
--

INSERT INTO `creaturetypedbc` VALUES ('1', 'Beast', 'Bête', '0');
INSERT INTO `creaturetypedbc` VALUES ('2', 'Dragonkin', 'Draconien', '0');
INSERT INTO `creaturetypedbc` VALUES ('3', 'Demon', 'Démon', '0');
INSERT INTO `creaturetypedbc` VALUES ('4', 'Elemental', 'Elémentaire', '0');
INSERT INTO `creaturetypedbc` VALUES ('5', 'Giant', 'Géant', '0');
INSERT INTO `creaturetypedbc` VALUES ('6', 'Undead', 'Mort-vivant', '0');
INSERT INTO `creaturetypedbc` VALUES ('7', 'Humanoid', 'Humanoïde', '0');
INSERT INTO `creaturetypedbc` VALUES ('8', 'Critter', 'Bestiole', '1');
INSERT INTO `creaturetypedbc` VALUES ('9', 'Mechanical', 'Machine', '0');
INSERT INTO `creaturetypedbc` VALUES ('10', 'Not specified', 'Non spécifié', '0');
INSERT INTO `creaturetypedbc` VALUES ('11', 'Totem', 'Totem', '0');
INSERT INTO `creaturetypedbc` VALUES ('12', 'Non-combat Pet', 'Familier pacifique', '1');
INSERT INTO `creaturetypedbc` VALUES ('13', 'Gas Cloud', 'Nuage de gaz', '1');
