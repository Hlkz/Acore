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
-- Table structure for table `cfg_categories`
--

DROP TABLE IF EXISTS `cfg_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_categories` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `LocaleMask` int(10) NOT NULL DEFAULT '0',
  `CharsetMask` int(10) NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfg_categories`
--

LOCK TABLES `cfg_categories` WRITE;
/*!40000 ALTER TABLE `cfg_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfg_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `cfg_categories`
--

INSERT INTO `cfg_categories` VALUES ('1', '0', '0', '0', 'Development', 'Développement');
INSERT INTO `cfg_categories` VALUES ('2', '0', '1', '0', 'United States', 'États-Unis');
INSERT INTO `cfg_categories` VALUES ('3', '0', '1', '0', 'Oceanic', 'Océanique');
INSERT INTO `cfg_categories` VALUES ('4', '0', '1', '0', 'Latin America', 'Amérique latine');
INSERT INTO `cfg_categories` VALUES ('5', '0', '1', '1', 'Tournament', 'Tournoi');
INSERT INTO `cfg_categories` VALUES ('6', '0', '10', '0', 'Korea', 'Corée');
INSERT INTO `cfg_categories` VALUES ('7', '0', '10', '1', 'Tournament', 'Tournoi');
INSERT INTO `cfg_categories` VALUES ('8', '205', '1', '0', 'English', 'English');
INSERT INTO `cfg_categories` VALUES ('9', '205', '1', '0', 'German', 'Deutsch');
INSERT INTO `cfg_categories` VALUES ('10', '205', '1', '0', 'French', 'Français');
INSERT INTO `cfg_categories` VALUES ('11', '205', '1', '0', 'Spanish', 'Español');
INSERT INTO `cfg_categories` VALUES ('12', '256', '4', '0', 'Russian', 'Russe');
INSERT INTO `cfg_categories` VALUES ('13', '205', '1', '1', 'Tournament', 'Tournoi');
INSERT INTO `cfg_categories` VALUES ('14', '0', '17', '0', 'Taiwan', 'Taïwan');
INSERT INTO `cfg_categories` VALUES ('15', '0', '17', '1', 'Tournament', 'Tournoi');
INSERT INTO `cfg_categories` VALUES ('16', '0', '17', '0', 'China', 'Chine');
INSERT INTO `cfg_categories` VALUES ('17', '0', '17', '0', 'CN1', 'CN1');
INSERT INTO `cfg_categories` VALUES ('18', '0', '17', '0', 'CN2', 'CN2');
INSERT INTO `cfg_categories` VALUES ('19', '0', '17', '0', 'CN3', 'CN3');
INSERT INTO `cfg_categories` VALUES ('20', '0', '17', '0', 'CN4', 'CN4');
INSERT INTO `cfg_categories` VALUES ('21', '0', '17', '0', 'CN5', 'CN5');
INSERT INTO `cfg_categories` VALUES ('22', '0', '17', '0', 'CN6', 'CN6');
INSERT INTO `cfg_categories` VALUES ('23', '0', '17', '0', 'CN7', 'CN7');
INSERT INTO `cfg_categories` VALUES ('24', '0', '17', '0', 'CN8', 'CN8');
INSERT INTO `cfg_categories` VALUES ('25', '0', '17', '1', 'Tournament', 'Tournoi');
INSERT INTO `cfg_categories` VALUES ('26', '0', '0', '0', 'Test Server', 'Serveur de test');
INSERT INTO `cfg_categories` VALUES ('27', '0', '0', '1', 'Tournament', 'Tournoi');
INSERT INTO `cfg_categories` VALUES ('28', '0', '0', '0', 'QA Server', 'Serveur QA');
INSERT INTO `cfg_categories` VALUES ('29', '0', '17', '0', 'CN9', 'CN9');
INSERT INTO `cfg_categories` VALUES ('30', '0', '0', '0', 'Test Server 2', 'Serveur de test 2');
INSERT INTO `cfg_categories` VALUES ('31', '0', '17', '0', 'CN10', 'CN10');
INSERT INTO `cfg_categories` VALUES ('32', '0', '17', '0', 'CTC', 'CTC');
INSERT INTO `cfg_categories` VALUES ('33', '0', '17', '0', 'CNC', 'CNC');
INSERT INTO `cfg_categories` VALUES ('34', '0', '17', '0', 'CN1/4', 'CN1/4');
INSERT INTO `cfg_categories` VALUES ('35', '0', '17', '0', 'CN2/6/9', 'CN2/6/9');
INSERT INTO `cfg_categories` VALUES ('36', '0', '17', '0', 'CN3/7', 'CN3/7');
INSERT INTO `cfg_categories` VALUES ('37', '0', '17', '0', 'CN5/8', 'CN5/8');
