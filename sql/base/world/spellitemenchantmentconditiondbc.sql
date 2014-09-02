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
-- Table structure for table `spellitemenchantmentconditiondbc`
--

DROP TABLE IF EXISTS `spellitemenchantmentconditiondbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spellitemenchantmentconditiondbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Color1` int(10) NOT NULL DEFAULT '0',
  `Color2` int(10) NOT NULL DEFAULT '0',
  `Color3` int(10) NOT NULL DEFAULT '0',
  `Color4` int(10) NOT NULL DEFAULT '0',
  `Color5` int(10) NOT NULL DEFAULT '0',
  `LTOperand1` int(10) NOT NULL DEFAULT '0',
  `LTOperand2` int(10) NOT NULL DEFAULT '0',
  `LTOperand3` int(10) NOT NULL DEFAULT '0',
  `LTOperand4` int(10) NOT NULL DEFAULT '0',
  `LTOperand5` int(10) NOT NULL DEFAULT '0',
  `Comparator1` int(10) NOT NULL DEFAULT '0',
  `Comparator2` int(10) NOT NULL DEFAULT '0',
  `Comparator3` int(10) NOT NULL DEFAULT '0',
  `Comparator4` int(10) NOT NULL DEFAULT '0',
  `Comparator5` int(10) NOT NULL DEFAULT '0',
  `CompareColor1` int(10) NOT NULL DEFAULT '0',
  `CompareColor2` int(10) NOT NULL DEFAULT '0',
  `CompareColor3` int(10) NOT NULL DEFAULT '0',
  `CompareColor4` int(10) NOT NULL DEFAULT '0',
  `CompareColor5` int(10) NOT NULL DEFAULT '0',
  `Value1` int(10) NOT NULL DEFAULT '0',
  `Value2` int(10) NOT NULL DEFAULT '0',
  `Value3` int(10) NOT NULL DEFAULT '0',
  `Value4` int(10) NOT NULL DEFAULT '0',
  `Value5` int(10) NOT NULL DEFAULT '0',
  `Logic1` int(10) NOT NULL DEFAULT '0',
  `Logic2` int(10) NOT NULL DEFAULT '0',
  `Logic3` int(10) NOT NULL DEFAULT '0',
  `Logic4` int(10) NOT NULL DEFAULT '0',
  `Logic5` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ID` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spellitemenchantmentconditiondbc`
--

LOCK TABLES `spellitemenchantmentconditiondbc` WRITE;
/*!40000 ALTER TABLE `spellitemenchantmentconditiondbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `spellitemenchantmentconditiondbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `spellitemenchantmentconditiondbc`
--

INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1280', '0', '67108864', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('28', '1', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '131584', '50462720', '0', '0', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('30', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '768', '196608', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('32', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '768', '196608', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('33', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1280', '0', '50331648', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('34', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '768', '262144', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('35', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1280', '0', '83886080', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('36', '2', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '84215040', '0', '33554432', '33554432', '33554432', '0', '0', '16777216', '1');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('42', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1280', '0', '50331648', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('43', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '768', '196608', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('61', '3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('62', '3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('63', '3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('64', '2', '4', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '84215040', '0', '33554432', '33554432', '33554432', '0', '0', '16777216', '1');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('65', '2', '4', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '84215040', '0', '33554432', '33554432', '33554432', '0', '0', '16777216', '1');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('66', '2', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '84215040', '0', '33554432', '33554432', '33554432', '0', '0', '16777216', '1');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('67', '2', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '84215040', '0', '33554432', '33554432', '33554432', '0', '0', '16777216', '1');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('81', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1280', '0', '33554432', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('121', '4', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('122', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1280', '0', '50331648', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('141', '2', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('142', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1280', '0', '33554432', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('143', '2', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '84215040', '0', '16777216', '16777216', '16777216', '0', '0', '16777216', '1');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('144', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1280', '0', '50331648', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('145', '2', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('146', '2', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('147', '2', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '84215040', '0', '16777216', '16777216', '16777216', '0', '0', '16777216', '1');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('148', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1280', '0', '50331648', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('149', '2', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '84215040', '0', '16777216', '16777216', '16777216', '0', '0', '16777216', '1');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('150', '3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('151', '2', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '84215040', '0', '16777216', '16777216', '16777216', '0', '0', '16777216', '1');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('152', '4', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('153', '2', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('154', '4', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('155', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('156', '2', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('157', '4', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('158', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('159', '2', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '84215040', '0', '16777216', '16777216', '16777216', '0', '0', '16777216', '1');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('161', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1280', '0', '33554432', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('181', '2', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('182', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('188', '4', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('189', '4', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('190', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1280', '0', '50331648', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('191', '3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '328960', '0', '33554432', '16777216', '0', '0', '0', '16777216', '0');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('192', '2', '4', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '84215040', '0', '16777216', '16777216', '16777216', '0', '0', '16777216', '1');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('193', '2', '4', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '84215040', '0', '16777216', '16777216', '16777216', '0', '0', '16777216', '1');
INSERT INTO `spellitemenchantmentconditiondbc` VALUES ('194', '2', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '84215040', '0', '16777216', '16777216', '16777216', '0', '0', '16777216', '1');
