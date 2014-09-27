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
-- Table structure for table `itemclass`
--

DROP TABLE IF EXISTS `itemclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemclass` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `SubClass` int(10) NOT NULL DEFAULT '0',
  `IsWeapon` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemclass`
--

LOCK TABLES `itemclass` WRITE;
/*!40000 ALTER TABLE `itemclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `itemclass`
--

INSERT INTO `itemclass` VALUES ('0', '0', '0', 'Consumable', 'Consommable');
INSERT INTO `itemclass` VALUES ('1', '1', '0', 'Container', 'Conteneur');
INSERT INTO `itemclass` VALUES ('2', '2', '1', 'Weapon', 'Arme');
INSERT INTO `itemclass` VALUES ('3', '3', '0', 'Gem', 'Gemme');
INSERT INTO `itemclass` VALUES ('4', '4', '0', 'Armor', 'Armure');
INSERT INTO `itemclass` VALUES ('5', '5', '0', 'Reagent', 'Composant');
INSERT INTO `itemclass` VALUES ('6', '6', '0', 'Projectile', 'Projectile');
INSERT INTO `itemclass` VALUES ('7', '7', '0', 'Trade Goods', 'Artisanat');
INSERT INTO `itemclass` VALUES ('8', '8', '0', 'Generic(OBSOLETE)', 'Générique(OBSOLETE)');
INSERT INTO `itemclass` VALUES ('9', '9', '0', 'Recipe', 'Recette');
INSERT INTO `itemclass` VALUES ('10', '10', '0', 'Money', 'Argent');
INSERT INTO `itemclass` VALUES ('11', '6', '0', 'Quiver', 'Carquois');
INSERT INTO `itemclass` VALUES ('12', '0', '0', 'Quest', 'Quête');
INSERT INTO `itemclass` VALUES ('13', '0', '0', 'Key', 'Clé');
INSERT INTO `itemclass` VALUES ('14', '1', '0', 'Permanent(OBSOLETE)', 'Permanent(OBSOLETE)');
INSERT INTO `itemclass` VALUES ('15', '0', '0', 'Miscellaneous', 'Divers');
INSERT INTO `itemclass` VALUES ('16', '12', '0', 'Glyph', 'Glyphe');
