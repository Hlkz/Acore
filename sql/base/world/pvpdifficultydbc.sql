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
  `MapId` int(10) NOT NULL DEFAULT '0',
  `BracketId` int(10) NOT NULL DEFAULT '0',
  `MinLevel` int(10) NOT NULL DEFAULT '0',
  `MaxLevel` int(10) NOT NULL DEFAULT '0',
  `Difficulty` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MapId`,`BracketId`,`MinLevel`,`MaxLevel`)
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

INSERT INTO `pvpdifficultydbc` VALUES ('30', '0', '51', '60', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('30', '1', '61', '70', '1');
INSERT INTO `pvpdifficultydbc` VALUES ('30', '2', '71', '79', '2');
INSERT INTO `pvpdifficultydbc` VALUES ('30', '3', '80', '85', '3');
INSERT INTO `pvpdifficultydbc` VALUES ('489', '0', '10', '19', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('489', '1', '20', '29', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('489', '2', '30', '39', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('489', '3', '40', '49', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('489', '4', '50', '59', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('489', '5', '60', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('489', '6', '70', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('489', '7', '80', '85', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('529', '0', '20', '29', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('529', '1', '30', '39', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('529', '2', '40', '49', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('529', '3', '50', '59', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('529', '4', '60', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('529', '5', '70', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('529', '6', '80', '85', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '0', '10', '14', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '1', '15', '19', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '2', '20', '24', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '3', '25', '29', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '4', '30', '34', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '5', '35', '39', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '6', '40', '44', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '7', '45', '49', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '8', '50', '54', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '9', '55', '59', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '10', '60', '64', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '11', '65', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '12', '70', '74', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '13', '75', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '14', '80', '84', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('559', '15', '85', '89', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '0', '10', '14', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '1', '15', '19', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '2', '20', '24', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '3', '25', '29', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '4', '30', '34', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '5', '35', '39', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '6', '40', '44', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '7', '45', '49', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '8', '50', '54', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '9', '55', '59', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '10', '60', '64', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '11', '65', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '12', '70', '74', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '13', '75', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '14', '80', '84', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('562', '15', '85', '89', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('566', '0', '61', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('566', '1', '70', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('566', '2', '80', '85', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '0', '10', '14', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '1', '15', '19', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '2', '20', '24', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '3', '25', '29', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '4', '30', '34', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '5', '35', '39', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '6', '40', '44', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '7', '45', '49', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '8', '50', '54', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '9', '55', '59', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '10', '60', '64', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '11', '65', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '12', '70', '74', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '13', '75', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '14', '80', '84', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('572', '15', '85', '89', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('607', '0', '71', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('607', '1', '80', '84', '1');
INSERT INTO `pvpdifficultydbc` VALUES ('607', '2', '85', '85', '2');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '0', '10', '14', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '1', '15', '19', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '2', '20', '24', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '3', '25', '29', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '4', '30', '34', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '5', '35', '39', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '6', '40', '44', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '7', '45', '49', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '8', '50', '54', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '9', '55', '59', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '10', '60', '64', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '11', '65', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '12', '70', '74', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '13', '75', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '14', '80', '84', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('617', '15', '85', '89', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '0', '10', '14', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '1', '15', '19', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '2', '20', '24', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '3', '25', '29', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '4', '30', '34', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '5', '35', '39', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '6', '40', '44', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '7', '45', '49', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '8', '50', '54', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '9', '55', '59', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '10', '60', '64', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '11', '65', '69', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '12', '70', '74', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '13', '75', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '14', '80', '84', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('618', '15', '85', '89', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('628', '0', '71', '79', '0');
INSERT INTO `pvpdifficultydbc` VALUES ('628', '1', '80', '84', '1');
INSERT INTO `pvpdifficultydbc` VALUES ('628', '2', '85', '89', '2');
