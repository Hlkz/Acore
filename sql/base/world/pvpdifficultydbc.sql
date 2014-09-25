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
-- Table structure for table `pvpdifficultydbc`
--

DROP TABLE IF EXISTS `pvpdifficultydbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pvpdifficultydbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `MapId` int(10) NOT NULL DEFAULT '0',
  `BracketId` int(10) NOT NULL DEFAULT '0',
  `MinLevel` int(10) NOT NULL DEFAULT '0',
  `MaxLevel` int(10) NOT NULL DEFAULT '0',
  `Difficulty` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pvpdifficultydbc`
--

LOCK TABLES `pvpdifficultydbc` WRITE;
/*!40000 ALTER TABLE `pvpdifficultydbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `pvpdifficultydbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `pvpdifficultydbc`
--

INSERT INTO `pvpdifficultydbc` VALUES ('1', '30', '0', '51', '60', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('2', '30', '1', '61', '70', '1');
INSERT INTO `pvpdifficultydbc` VALUES ('3', '30', '2', '71', '79', '2');
INSERT INTO `pvpdifficultydbc` VALUES ('4', '30', '3', '80', '85', '3');
INSERT INTO `pvpdifficultydbc` VALUES ('5', '489', '0', '10', '19', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('6', '489', '1', '20', '29', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('7', '489', '2', '30', '39', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('8', '489', '3', '40', '49', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('9', '489', '4', '50', '59', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('10', '489', '5', '60', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('11', '489', '6', '70', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('12', '489', '7', '80', '85', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('13', '529', '0', '20', '29', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('14', '529', '1', '30', '39', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('15', '529', '2', '40', '49', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('16', '529', '3', '50', '59', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('17', '529', '4', '60', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('18', '529', '5', '70', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('19', '529', '6', '80', '85', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('20', '559', '0', '10', '14', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('21', '559', '1', '15', '19', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('22', '559', '2', '20', '24', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('23', '559', '3', '25', '29', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('24', '559', '4', '30', '34', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('25', '559', '5', '35', '39', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('26', '559', '6', '40', '44', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('27', '559', '7', '45', '49', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('28', '559', '8', '50', '54', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('29', '559', '9', '55', '59', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('30', '559', '10', '60', '64', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('31', '559', '11', '65', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('32', '559', '12', '70', '74', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('33', '559', '13', '75', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('34', '559', '14', '80', '84', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('35', '559', '15', '85', '89', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('36', '562', '0', '10', '14', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('37', '562', '1', '15', '19', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('38', '562', '2', '20', '24', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('39', '562', '3', '25', '29', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('40', '562', '4', '30', '34', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('41', '562', '5', '35', '39', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('42', '562', '6', '40', '44', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('43', '562', '7', '45', '49', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('44', '562', '8', '50', '54', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('45', '562', '9', '55', '59', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('46', '562', '10', '60', '64', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('47', '562', '11', '65', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('48', '562', '12', '70', '74', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('49', '562', '13', '75', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('50', '562', '14', '80', '84', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('51', '562', '15', '85', '89', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('52', '566', '0', '61', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('53', '566', '1', '70', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('54', '566', '2', '80', '85', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('55', '572', '0', '10', '14', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('56', '572', '1', '15', '19', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('57', '572', '2', '20', '24', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('58', '572', '3', '25', '29', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('59', '572', '4', '30', '34', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('60', '572', '5', '35', '39', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('61', '572', '6', '40', '44', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('62', '572', '7', '45', '49', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('63', '572', '8', '50', '54', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('64', '572', '9', '55', '59', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('65', '572', '10', '60', '64', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('66', '572', '11', '65', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('67', '572', '12', '70', '74', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('68', '572', '13', '75', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('69', '572', '14', '80', '84', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('70', '572', '15', '85', '89', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('71', '607', '0', '71', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('72', '607', '1', '80', '84', '1');
INSERT INTO `pvpdifficultydbc` VALUES ('73', '607', '2', '85', '85', '2');
INSERT INTO `pvpdifficultydbc` VALUES ('74', '617', '0', '10', '14', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('75', '617', '1', '15', '19', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('76', '617', '2', '20', '24', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('77', '617', '3', '25', '29', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('78', '617', '4', '30', '34', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('79', '617', '5', '35', '39', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('80', '617', '6', '40', '44', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('81', '617', '7', '45', '49', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('82', '617', '8', '50', '54', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('83', '617', '9', '55', '59', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('84', '617', '10', '60', '64', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('85', '617', '11', '65', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('86', '617', '12', '70', '74', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('87', '617', '13', '75', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('88', '617', '14', '80', '84', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('89', '617', '15', '85', '89', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('90', '618', '0', '10', '14', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('91', '618', '1', '15', '19', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('92', '618', '2', '20', '24', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('93', '618', '3', '25', '29', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('94', '618', '4', '30', '34', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('95', '618', '5', '35', '39', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('96', '618', '6', '40', '44', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('97', '618', '7', '45', '49', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('98', '618', '8', '50', '54', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('99', '618', '9', '55', '59', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('100', '618', '10', '60', '64', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('101', '618', '11', '65', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('102', '618', '12', '70', '74', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('103', '618', '13', '75', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('104', '618', '14', '80', '84', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('105', '618', '15', '85', '89', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('106', '628', '0', '71', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('107', '628', '1', '80', '84', '1');
INSERT INTO `pvpdifficultydbc` VALUES ('108', '628', '2', '85', '89', '2');
