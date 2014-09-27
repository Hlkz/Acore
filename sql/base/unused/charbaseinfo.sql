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
-- Table structure for table `charbaseinfo`
--

DROP TABLE IF EXISTS `charbaseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charbaseinfo` (
  `Race` tinyint(3) NOT NULL DEFAULT '0',
  `Class` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Race`,`Class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of charbaseinfo
-- ----------------------------
INSERT INTO `charbaseinfo` VALUES ('1', '1');
INSERT INTO `charbaseinfo` VALUES ('1', '2');
INSERT INTO `charbaseinfo` VALUES ('1', '4');
INSERT INTO `charbaseinfo` VALUES ('1', '5');
INSERT INTO `charbaseinfo` VALUES ('1', '6');
INSERT INTO `charbaseinfo` VALUES ('1', '8');
INSERT INTO `charbaseinfo` VALUES ('1', '9');
INSERT INTO `charbaseinfo` VALUES ('2', '1');
INSERT INTO `charbaseinfo` VALUES ('2', '3');
INSERT INTO `charbaseinfo` VALUES ('2', '4');
INSERT INTO `charbaseinfo` VALUES ('2', '6');
INSERT INTO `charbaseinfo` VALUES ('2', '7');
INSERT INTO `charbaseinfo` VALUES ('2', '9');
INSERT INTO `charbaseinfo` VALUES ('3', '1');
INSERT INTO `charbaseinfo` VALUES ('3', '2');
INSERT INTO `charbaseinfo` VALUES ('3', '3');
INSERT INTO `charbaseinfo` VALUES ('3', '4');
INSERT INTO `charbaseinfo` VALUES ('3', '5');
INSERT INTO `charbaseinfo` VALUES ('3', '6');
INSERT INTO `charbaseinfo` VALUES ('4', '1');
INSERT INTO `charbaseinfo` VALUES ('4', '3');
INSERT INTO `charbaseinfo` VALUES ('4', '4');
INSERT INTO `charbaseinfo` VALUES ('4', '5');
INSERT INTO `charbaseinfo` VALUES ('4', '6');
INSERT INTO `charbaseinfo` VALUES ('4', '11');
INSERT INTO `charbaseinfo` VALUES ('5', '1');
INSERT INTO `charbaseinfo` VALUES ('5', '4');
INSERT INTO `charbaseinfo` VALUES ('5', '5');
INSERT INTO `charbaseinfo` VALUES ('5', '6');
INSERT INTO `charbaseinfo` VALUES ('5', '8');
INSERT INTO `charbaseinfo` VALUES ('5', '9');
INSERT INTO `charbaseinfo` VALUES ('6', '1');
INSERT INTO `charbaseinfo` VALUES ('6', '3');
INSERT INTO `charbaseinfo` VALUES ('6', '6');
INSERT INTO `charbaseinfo` VALUES ('6', '7');
INSERT INTO `charbaseinfo` VALUES ('6', '11');
INSERT INTO `charbaseinfo` VALUES ('7', '1');
INSERT INTO `charbaseinfo` VALUES ('7', '4');
INSERT INTO `charbaseinfo` VALUES ('7', '6');
INSERT INTO `charbaseinfo` VALUES ('7', '8');
INSERT INTO `charbaseinfo` VALUES ('7', '9');
INSERT INTO `charbaseinfo` VALUES ('8', '1');
INSERT INTO `charbaseinfo` VALUES ('8', '3');
INSERT INTO `charbaseinfo` VALUES ('8', '4');
INSERT INTO `charbaseinfo` VALUES ('8', '5');
INSERT INTO `charbaseinfo` VALUES ('8', '6');
INSERT INTO `charbaseinfo` VALUES ('8', '7');
INSERT INTO `charbaseinfo` VALUES ('8', '8');
INSERT INTO `charbaseinfo` VALUES ('10', '2');
INSERT INTO `charbaseinfo` VALUES ('10', '3');
INSERT INTO `charbaseinfo` VALUES ('10', '4');
INSERT INTO `charbaseinfo` VALUES ('10', '5');
INSERT INTO `charbaseinfo` VALUES ('10', '6');
INSERT INTO `charbaseinfo` VALUES ('10', '8');
INSERT INTO `charbaseinfo` VALUES ('10', '9');
INSERT INTO `charbaseinfo` VALUES ('11', '1');
INSERT INTO `charbaseinfo` VALUES ('11', '2');
INSERT INTO `charbaseinfo` VALUES ('11', '3');
INSERT INTO `charbaseinfo` VALUES ('11', '5');
INSERT INTO `charbaseinfo` VALUES ('11', '6');
INSERT INTO `charbaseinfo` VALUES ('11', '7');
INSERT INTO `charbaseinfo` VALUES ('11', '8');
