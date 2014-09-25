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
-- Table structure for table `spellradiusdbc`
--

DROP TABLE IF EXISTS `spellradiusdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spellradiusdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `RadiusMin` float NOT NULL DEFAULT '0',
  `RadiusPerLevel` float NOT NULL DEFAULT '0',
  `RadiusMax` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spellradiusdbc`
--

LOCK TABLES `spellradiusdbc` WRITE;
/*!40000 ALTER TABLE `spellradiusdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `spellradiusdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `spellradiusdbc`
--

INSERT INTO `spellradiusdbc` VALUES ('7', '2', '0', '2');
INSERT INTO `spellradiusdbc` VALUES ('8', '5', '0', '5');
INSERT INTO `spellradiusdbc` VALUES ('9', '20', '0', '20');
INSERT INTO `spellradiusdbc` VALUES ('10', '30', '0', '30');
INSERT INTO `spellradiusdbc` VALUES ('11', '45', '0', '45');
INSERT INTO `spellradiusdbc` VALUES ('12', '100', '0', '100');
INSERT INTO `spellradiusdbc` VALUES ('13', '10', '0', '10');
INSERT INTO `spellradiusdbc` VALUES ('14', '8', '0', '8');
INSERT INTO `spellradiusdbc` VALUES ('15', '3', '0', '3');
INSERT INTO `spellradiusdbc` VALUES ('16', '1', '0', '1');
INSERT INTO `spellradiusdbc` VALUES ('17', '13', '0', '13');
INSERT INTO `spellradiusdbc` VALUES ('18', '15', '0', '15');
INSERT INTO `spellradiusdbc` VALUES ('19', '18', '0', '18');
INSERT INTO `spellradiusdbc` VALUES ('20', '25', '0', '25');
INSERT INTO `spellradiusdbc` VALUES ('21', '35', '0', '35');
INSERT INTO `spellradiusdbc` VALUES ('22', '200', '0', '200');
INSERT INTO `spellradiusdbc` VALUES ('23', '40', '0', '40');
INSERT INTO `spellradiusdbc` VALUES ('24', '65', '0', '65');
INSERT INTO `spellradiusdbc` VALUES ('25', '70', '0', '70');
INSERT INTO `spellradiusdbc` VALUES ('26', '4', '0', '4');
INSERT INTO `spellradiusdbc` VALUES ('27', '50', '0', '50');
INSERT INTO `spellradiusdbc` VALUES ('28', '50000', '0', '50000');
INSERT INTO `spellradiusdbc` VALUES ('29', '6', '0', '6');
INSERT INTO `spellradiusdbc` VALUES ('30', '500', '0', '500');
INSERT INTO `spellradiusdbc` VALUES ('31', '80', '0', '80');
INSERT INTO `spellradiusdbc` VALUES ('32', '12', '0', '12');
INSERT INTO `spellradiusdbc` VALUES ('33', '99', '0', '99');
INSERT INTO `spellradiusdbc` VALUES ('35', '55', '0', '55');
INSERT INTO `spellradiusdbc` VALUES ('36', '0', '0', '0');
INSERT INTO `spellradiusdbc` VALUES ('37', '7', '0', '7');
INSERT INTO `spellradiusdbc` VALUES ('38', '21', '0', '21');
INSERT INTO `spellradiusdbc` VALUES ('39', '34', '0', '34');
INSERT INTO `spellradiusdbc` VALUES ('40', '9', '0', '9');
INSERT INTO `spellradiusdbc` VALUES ('41', '150', '0', '150');
INSERT INTO `spellradiusdbc` VALUES ('42', '11', '0', '11');
INSERT INTO `spellradiusdbc` VALUES ('43', '16', '0', '16');
INSERT INTO `spellradiusdbc` VALUES ('44', '0.5', '0', '0.5');
INSERT INTO `spellradiusdbc` VALUES ('45', '10', '0', '10');
INSERT INTO `spellradiusdbc` VALUES ('46', '5', '0', '10');
INSERT INTO `spellradiusdbc` VALUES ('47', '15', '0', '15');
INSERT INTO `spellradiusdbc` VALUES ('48', '60', '0', '60');
INSERT INTO `spellradiusdbc` VALUES ('49', '90', '0', '90');
INSERT INTO `spellradiusdbc` VALUES ('50', '15', '0', '15');
INSERT INTO `spellradiusdbc` VALUES ('51', '60', '0', '60');
INSERT INTO `spellradiusdbc` VALUES ('52', '5', '0', '5');
INSERT INTO `spellradiusdbc` VALUES ('53', '60', '0', '60');
INSERT INTO `spellradiusdbc` VALUES ('54', '50000', '0', '50000');
INSERT INTO `spellradiusdbc` VALUES ('55', '130', '0', '130');
INSERT INTO `spellradiusdbc` VALUES ('56', '38', '0', '38');
INSERT INTO `spellradiusdbc` VALUES ('57', '45', '0', '45');
INSERT INTO `spellradiusdbc` VALUES ('58', '50000', '0', '50000');
INSERT INTO `spellradiusdbc` VALUES ('59', '32', '0', '32');
INSERT INTO `spellradiusdbc` VALUES ('60', '44', '0', '44');
INSERT INTO `spellradiusdbc` VALUES ('61', '14', '0', '14');
INSERT INTO `spellradiusdbc` VALUES ('62', '47', '0', '47');
INSERT INTO `spellradiusdbc` VALUES ('63', '23', '0', '23');
INSERT INTO `spellradiusdbc` VALUES ('64', '3.5', '0', '3.5');
INSERT INTO `spellradiusdbc` VALUES ('65', '80', '0', '80');
