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
-- Table structure for table `skilllinecategory`
--

DROP TABLE IF EXISTS `skilllinecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skilllinecategory` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `DisplayOrder` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skilllinecategory`
--

LOCK TABLES `skilllinecategory` WRITE;
/*!40000 ALTER TABLE `skilllinecategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `skilllinecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `skilllinecategory`
--

INSERT INTO `skilllinecategory` VALUES ('5', 'Attributes', 'Caractéristiques', '1');
INSERT INTO `skilllinecategory` VALUES ('6', 'Weapon Skills', 'Compétences d’armes', '5');
INSERT INTO `skilllinecategory` VALUES ('7', 'Class Skills', 'Compétences de classe', '2');
INSERT INTO `skilllinecategory` VALUES ('8', 'Armor Proficiencies', 'Armures utilisables', '6');
INSERT INTO `skilllinecategory` VALUES ('9', 'Secondary Skills', 'Compétences secondaires', '4');
INSERT INTO `skilllinecategory` VALUES ('10', 'Languages', 'Langues', '7');
INSERT INTO `skilllinecategory` VALUES ('11', 'Professions', 'Métiers', '3');
INSERT INTO `skilllinecategory` VALUES ('12', 'Not Displayed', 'Non affiché', '8');
