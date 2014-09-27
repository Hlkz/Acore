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
-- Table structure for table `dancemoves`
--

DROP TABLE IF EXISTS `dancemoves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dancemoves` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Type` int(10) NOT NULL DEFAULT '0',
  `Value` int(10) NOT NULL DEFAULT '0',
  `Fallback` int(10) NOT NULL DEFAULT '0',
  `Racemask` int(10) NOT NULL DEFAULT '0',
  `Internal` varchar(100) NOT NULL DEFAULT '',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `LockId` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dancemoves`
--

LOCK TABLES `dancemoves` WRITE;
/*!40000 ALTER TABLE `dancemoves` DISABLE KEYS */;
/*!40000 ALTER TABLE `dancemoves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `dancemoves`
--

INSERT INTO `dancemoves` VALUES ('1', '0', '65', '0', '0', 'Default fallback -EmoteTalkQuestion', 'Shrug', 'Bof', '0');
INSERT INTO `dancemoves` VALUES ('22', '0', '60', '1', '0', 'All - Talk', 'Talk', 'Parler', '0');
INSERT INTO `dancemoves` VALUES ('23', '0', '66', '1', '0', 'All - Bow', 'Bow', 'Incliner', '0');
INSERT INTO `dancemoves` VALUES ('24', '0', '67', '1', '0', 'All - Wave', 'Wave', 'Signe', '0');
INSERT INTO `dancemoves` VALUES ('25', '0', '68', '1', '0', 'All - Cheer', 'Cheer', 'Acclame', '0');
INSERT INTO `dancemoves` VALUES ('26', '0', '73', '1', '0', 'All - Rude', 'Rude', 'Impoli', '0');
INSERT INTO `dancemoves` VALUES ('27', '0', '74', '1', '0', 'All - Roar', 'Roar', 'Rugir', '0');
INSERT INTO `dancemoves` VALUES ('28', '0', '78', '1', '0', 'All - Chicken', 'Chicken', 'Poulet', '0');
INSERT INTO `dancemoves` VALUES ('41', '1', '160', '1', '0', 'All - FX - Frost Nova', 'Icy Finale', 'Final glacé', '1');
INSERT INTO `dancemoves` VALUES ('42', '2', '6908', '1', '64', 'Gnome - FemaleLaugh', '', '', '0');
INSERT INTO `dancemoves` VALUES ('61', '0', '213', '1', '0', 'Dance Ready', 'Ready', 'Prêt', '0');
INSERT INTO `dancemoves` VALUES ('62', '0', '214', '1', '512', 'Blood Elf - Female - Dance Var 2', 'DO NOT TRANSLATE', '', '0');
INSERT INTO `dancemoves` VALUES ('63', '0', '215', '1', '512', 'Blood Elf - Female - Dance Var 3', 'DO NOT TRANSLATE', '', '3');
INSERT INTO `dancemoves` VALUES ('64', '0', '216', '1', '512', 'Blood Elf - Female - Dance Var 4', 'DO NOT TRANSLATE', '', '0');
INSERT INTO `dancemoves` VALUES ('65', '0', '217', '1', '512', 'Blood Elf - Female - Dance Var 5', 'DO NOT TRANSLATE', '', '4');
INSERT INTO `dancemoves` VALUES ('66', '0', '218', '1', '512', 'Blood Elf - Female - Dance Var 6', 'DO NOT TRANSLATE', '', '0');
INSERT INTO `dancemoves` VALUES ('67', '0', '219', '1', '512', 'Blood Elf - Female - Dance Var 7', 'DO NOT TRANSLATE', '', '0');
INSERT INTO `dancemoves` VALUES ('68', '0', '220', '1', '512', 'Blood Elf - Female - Dance Var 8', 'DO NOT TRANSLATE', '', '2');
INSERT INTO `dancemoves` VALUES ('69', '0', '221', '1', '512', 'Blood Elf - Female - Dance Var 9', 'DO NOT TRANSLATE', '', '0');
INSERT INTO `dancemoves` VALUES ('70', '0', '222', '1', '512', 'Blood Elf - Female - Dance Var 10', 'DO NOT TRANSLATE', '', '0');
INSERT INTO `dancemoves` VALUES ('82', '3', '2', '1', '0', 'Hold - 2 Sec', 'Hold for two seconds', 'Maintenir pendant deux secondes', '0');
INSERT INTO `dancemoves` VALUES ('83', '3', '4', '1', '0', 'Hold - 4 Sec', 'Hold for four seconds', 'Maintenir pendant quatre secondes', '0');
INSERT INTO `dancemoves` VALUES ('84', '4', '5', '1', '0', 'Repeat - 5 Sec', 'Repeat for five seconds', 'Répéter pendant cinq secondes', '0');
INSERT INTO `dancemoves` VALUES ('85', '4', '10', '1', '0', 'Repeat - 10 Sec', 'Repeat for ten seconds', 'Répéter pendant dix secondes', '0');
