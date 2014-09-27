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
-- Table structure for table `sheathesoundlookups`
--

DROP TABLE IF EXISTS `sheathesoundlookups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sheathesoundlookups` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `UnkItemClass` int(10) NOT NULL DEFAULT '0',
  `UnkItemSubClass` int(10) NOT NULL DEFAULT '0',
  `UnkType` int(10) NOT NULL DEFAULT '0',
  `UnkIsWeapon` int(10) NOT NULL DEFAULT '0',
  `SheathSound` int(10) NOT NULL DEFAULT '0',
  `UnSheathSound` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sheathesoundlookups`
--

LOCK TABLES `sheathesoundlookups` WRITE;
/*!40000 ALTER TABLE `sheathesoundlookups` DISABLE KEYS */;
/*!40000 ALTER TABLE `sheathesoundlookups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `sheathesoundlookups`
--

INSERT INTO `sheathesoundlookups` VALUES ('1', '4', '5', '0', '0', '696', '701');
INSERT INTO `sheathesoundlookups` VALUES ('2', '4', '6', '0', '0', '696', '701');
INSERT INTO `sheathesoundlookups` VALUES ('3', '2', '0', '1', '1', '698', '700');
INSERT INTO `sheathesoundlookups` VALUES ('4', '2', '1', '1', '1', '698', '700');
INSERT INTO `sheathesoundlookups` VALUES ('5', '2', '2', '1', '1', '698', '700');
INSERT INTO `sheathesoundlookups` VALUES ('6', '2', '3', '1', '1', '698', '700');
INSERT INTO `sheathesoundlookups` VALUES ('7', '2', '4', '1', '1', '698', '700');
INSERT INTO `sheathesoundlookups` VALUES ('8', '2', '5', '1', '1', '698', '700');
INSERT INTO `sheathesoundlookups` VALUES ('9', '2', '6', '1', '1', '698', '700');
INSERT INTO `sheathesoundlookups` VALUES ('10', '2', '7', '1', '1', '698', '700');
INSERT INTO `sheathesoundlookups` VALUES ('11', '2', '8', '1', '1', '698', '700');
INSERT INTO `sheathesoundlookups` VALUES ('12', '2', '9', '1', '1', '698', '700');
INSERT INTO `sheathesoundlookups` VALUES ('13', '2', '10', '1', '1', '698', '700');
INSERT INTO `sheathesoundlookups` VALUES ('14', '2', '11', '1', '1', '698', '700');
INSERT INTO `sheathesoundlookups` VALUES ('15', '2', '12', '1', '1', '698', '700');
INSERT INTO `sheathesoundlookups` VALUES ('16', '2', '13', '1', '1', '698', '700');
INSERT INTO `sheathesoundlookups` VALUES ('17', '2', '14', '1', '1', '698', '700');
INSERT INTO `sheathesoundlookups` VALUES ('18', '2', '0', '2', '1', '697', '699');
INSERT INTO `sheathesoundlookups` VALUES ('19', '2', '1', '2', '1', '697', '699');
INSERT INTO `sheathesoundlookups` VALUES ('20', '2', '2', '2', '1', '697', '699');
INSERT INTO `sheathesoundlookups` VALUES ('21', '2', '3', '2', '1', '697', '699');
INSERT INTO `sheathesoundlookups` VALUES ('22', '2', '4', '2', '1', '697', '699');
INSERT INTO `sheathesoundlookups` VALUES ('23', '2', '5', '2', '1', '697', '699');
INSERT INTO `sheathesoundlookups` VALUES ('24', '2', '6', '2', '1', '697', '699');
INSERT INTO `sheathesoundlookups` VALUES ('25', '2', '7', '2', '1', '697', '699');
INSERT INTO `sheathesoundlookups` VALUES ('26', '2', '8', '2', '1', '697', '699');
INSERT INTO `sheathesoundlookups` VALUES ('27', '2', '9', '2', '1', '697', '699');
INSERT INTO `sheathesoundlookups` VALUES ('28', '2', '10', '2', '1', '697', '699');
INSERT INTO `sheathesoundlookups` VALUES ('29', '2', '11', '2', '1', '697', '699');
INSERT INTO `sheathesoundlookups` VALUES ('30', '2', '12', '2', '1', '697', '699');
INSERT INTO `sheathesoundlookups` VALUES ('31', '2', '13', '2', '1', '697', '699');
INSERT INTO `sheathesoundlookups` VALUES ('32', '2', '14', '2', '1', '697', '699');
INSERT INTO `sheathesoundlookups` VALUES ('33', '2', '0', '0', '1', '697', '699');
