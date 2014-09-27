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
-- Table structure for table `spellmechanic`
--

DROP TABLE IF EXISTS `spellmechanic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spellmechanic` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spellmechanic`
--

LOCK TABLES `spellmechanic` WRITE;
/*!40000 ALTER TABLE `spellmechanic` DISABLE KEYS */;
/*!40000 ALTER TABLE `spellmechanic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `spellmechanic`
--

INSERT INTO `spellmechanic` VALUES ('1', 'charmed', 'charmé(e)');
INSERT INTO `spellmechanic` VALUES ('2', 'disoriented', 'désorienté(e)');
INSERT INTO `spellmechanic` VALUES ('3', 'disarmed', 'désarmé(e)');
INSERT INTO `spellmechanic` VALUES ('4', 'distracted', 'distrait(e)');
INSERT INTO `spellmechanic` VALUES ('5', 'fleeing', 'en fuite');
INSERT INTO `spellmechanic` VALUES ('6', 'gripped', 'maladroit(e)');
INSERT INTO `spellmechanic` VALUES ('7', 'rooted', 'immobilisé(e)');
INSERT INTO `spellmechanic` VALUES ('8', 'slowed', 'ralenti(e)');
INSERT INTO `spellmechanic` VALUES ('9', 'silenced', 'réduit(e) au silence');
INSERT INTO `spellmechanic` VALUES ('10', 'asleep', 'endormi(e)');
INSERT INTO `spellmechanic` VALUES ('11', 'snared', 'piégé(e)');
INSERT INTO `spellmechanic` VALUES ('12', 'stunned', 'étourdi(e)');
INSERT INTO `spellmechanic` VALUES ('13', 'frozen', 'gelé(e)');
INSERT INTO `spellmechanic` VALUES ('14', 'incapacitated', 'stupéfié(e)');
INSERT INTO `spellmechanic` VALUES ('15', 'bleeding', 'sanguinolent(e)');
INSERT INTO `spellmechanic` VALUES ('16', 'healing', 'en soin');
INSERT INTO `spellmechanic` VALUES ('17', 'polymorphed', 'métamorphosé(e)');
INSERT INTO `spellmechanic` VALUES ('18', 'banished', 'banni(e)');
INSERT INTO `spellmechanic` VALUES ('19', 'shielded', 'protégé(e)');
INSERT INTO `spellmechanic` VALUES ('20', 'shackled', 'entravé(e)');
INSERT INTO `spellmechanic` VALUES ('21', 'mounted', 'monté(e)');
INSERT INTO `spellmechanic` VALUES ('22', 'infected', 'séduit(e)');
INSERT INTO `spellmechanic` VALUES ('23', 'turned', 'repoussé(e)');
INSERT INTO `spellmechanic` VALUES ('24', 'horrified', 'horrifié(e)');
INSERT INTO `spellmechanic` VALUES ('25', 'invulnerable', 'invulnérable');
INSERT INTO `spellmechanic` VALUES ('26', 'interrupted', 'interrompu(e)');
INSERT INTO `spellmechanic` VALUES ('27', 'dazed', 'hébété(e)');
INSERT INTO `spellmechanic` VALUES ('28', 'discovery', 'découverte');
INSERT INTO `spellmechanic` VALUES ('29', 'invulnerable', 'invulnérable');
INSERT INTO `spellmechanic` VALUES ('30', 'sapped', 'assommé(e)');
INSERT INTO `spellmechanic` VALUES ('31', 'enraged', 'enragé(e)');
