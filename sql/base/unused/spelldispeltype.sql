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
-- Table structure for table `spelldispeltype`
--

DROP TABLE IF EXISTS `spelldispeltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spelldispeltype` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `Mask` int(10) NOT NULL DEFAULT '0',
  `ImmunityPossible` int(10) NOT NULL DEFAULT '0',
  `InternalName` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spelldispeltype`
--

LOCK TABLES `spelldispeltype` WRITE;
/*!40000 ALTER TABLE `spelldispeltype` DISABLE KEYS */;
/*!40000 ALTER TABLE `spelldispeltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `spelldispeltype`
--

INSERT INTO `spelldispeltype` VALUES ('0', 'None', 'Aucun', '0', '0', '');
INSERT INTO `spelldispeltype` VALUES ('1', 'Magic', 'Magie', '0', '1', 'Magic');
INSERT INTO `spelldispeltype` VALUES ('2', 'Curse', 'Malédiction', '0', '1', 'Curse');
INSERT INTO `spelldispeltype` VALUES ('3', 'Disease', 'Maladie', '0', '1', 'Disease');
INSERT INTO `spelldispeltype` VALUES ('4', 'Poison', 'Poison', '0', '1', 'Poison');
INSERT INTO `spelldispeltype` VALUES ('5', 'Stealth', 'Camouflage', '0', '0', '');
INSERT INTO `spelldispeltype` VALUES ('6', 'Invisibility', 'Invisibilité', '0', '0', '');
INSERT INTO `spelldispeltype` VALUES ('7', 'All(M+C+D+P)', 'Tous (M+M+M+P)', '30', '0', '');
INSERT INTO `spelldispeltype` VALUES ('8', 'Special - npc only', 'Spécial – PNJ uniquement', '0', '0', '');
INSERT INTO `spelldispeltype` VALUES ('9', 'Enrage', 'Enrager', '0', '1', '');
INSERT INTO `spelldispeltype` VALUES ('10', 'ZG Trinkets', 'Bijoux ZG', '0', '0', '');
INSERT INTO `spelldispeltype` VALUES ('11', 'ZZOLD UNUSED', 'ZZOLD INUTILISE', '0', '0', '');
