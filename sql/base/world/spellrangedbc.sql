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
-- Table structure for table `spellrangedbc`
--

DROP TABLE IF EXISTS `spellrangedbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spellrangedbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `MinRangeHostile` int(10) NOT NULL DEFAULT '0',
  `MinRangeFriend` int(10) NOT NULL DEFAULT '0',
  `MaxRangeHostile` float NOT NULL DEFAULT '0',
  `MaxRangeFriend` float NOT NULL DEFAULT '0',
  `Type` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `Name2` varchar(100) NOT NULL DEFAULT '',
  `Name2_loc2` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spellrangedbc`
--

LOCK TABLES `spellrangedbc` WRITE;
/*!40000 ALTER TABLE `spellrangedbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `spellrangedbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `spellrangedbc`
--

INSERT INTO `spellrangedbc` VALUES ('1', '0', '0', '0', '0', '0', 'Self Only', 'Personnel', 'Self', 'Soi-même');
INSERT INTO `spellrangedbc` VALUES ('2', '0', '0', '5', '5', '1', 'Combat Range', 'Portée de combat', 'Combat', 'Combat');
INSERT INTO `spellrangedbc` VALUES ('3', '0', '0', '20', '20', '0', 'Twenty yards', 'Portée courte', 'Short', 'Court');
INSERT INTO `spellrangedbc` VALUES ('4', '0', '0', '30', '30', '0', 'Medium Range', 'Portée moyenne', 'Medium', 'Moyen');
INSERT INTO `spellrangedbc` VALUES ('5', '0', '0', '40', '40', '0', 'Long Range', 'Portée longue', 'Long', 'Long');
INSERT INTO `spellrangedbc` VALUES ('6', '0', '0', '100', '100', '0', 'Vision Range', 'Portée de vue', 'Vision', 'Vision');
INSERT INTO `spellrangedbc` VALUES ('7', '0', '0', '10', '10', '0', 'Ten yards', 'Portée très courte', 'Very Short', 'Très court');
INSERT INTO `spellrangedbc` VALUES ('8', '10', '10', '20', '20', '0', 'Min Range 10, 20', 'Portée courte', 'Short', 'Court');
INSERT INTO `spellrangedbc` VALUES ('9', '10', '10', '30', '30', '0', 'Medium Range', 'Portée moyenne', 'Medium', 'Moyen');
INSERT INTO `spellrangedbc` VALUES ('10', '10', '10', '40', '40', '0', 'Long Range', 'Portée longue', 'Long', 'Long');
INSERT INTO `spellrangedbc` VALUES ('11', '0', '0', '15', '15', '0', 'Fifteen yards', 'Portée courte', 'Shorter', 'Plus court');
INSERT INTO `spellrangedbc` VALUES ('12', '0', '0', '5', '5', '0', 'Interact Range', 'Portée d\'interaction', 'Interact', 'Interagir');
INSERT INTO `spellrangedbc` VALUES ('13', '0', '0', '50000', '50000', '0', 'Anywhere', 'Partout', 'Anywhere', 'Partout');
INSERT INTO `spellrangedbc` VALUES ('14', '0', '0', '60', '60', '0', 'Extra Long Range', 'Portée très longue', 'Extra Long', 'Extra-long');
INSERT INTO `spellrangedbc` VALUES ('34', '0', '0', '25', '25', '0', 'Twenty-Five yards', 'Portée courte-moyenne', 'Medium-Short', 'Moyen-court');
INSERT INTO `spellrangedbc` VALUES ('35', '0', '0', '35', '35', '0', 'Medium-Long Range', 'Portée moyenne-longue', 'Medium-Long', 'Moyen-long');
INSERT INTO `spellrangedbc` VALUES ('36', '0', '0', '45', '45', '0', 'Longer Range', 'Portée longue', 'Longer', 'Plus long');
INSERT INTO `spellrangedbc` VALUES ('37', '0', '0', '50', '50', '0', 'Extended Range', 'Portée étendue', 'Extended', 'Etendu');
INSERT INTO `spellrangedbc` VALUES ('38', '10', '10', '25', '25', '0', 'Min-Range 10, 25', 'Portée moyenne étendue', 'Extra Medium', 'Extra-moyen');
INSERT INTO `spellrangedbc` VALUES ('54', '5', '5', '30', '30', '0', 'Monster Shoot', 'Tir monstrueux de Geoff', 'Monster Shoot Range', 'Geoff');
INSERT INTO `spellrangedbc` VALUES ('74', '0', '0', '30', '30', '2', 'Ranged Weapon', 'Arme à distance', 'Ranged', 'A distance');
INSERT INTO `spellrangedbc` VALUES ('94', '8', '8', '40', '40', '0', 'Sting', 'Aiguillon', 'Sting', 'Aiguillon');
INSERT INTO `spellrangedbc` VALUES ('95', '8', '8', '25', '25', '0', 'Charge', 'Charge', 'Charge', 'Charge');
INSERT INTO `spellrangedbc` VALUES ('96', '0', '0', '2', '2', '0', 'Trap', 'Piège', 'Trap', 'Piège');
INSERT INTO `spellrangedbc` VALUES ('114', '0', '0', '35', '35', '2', 'Hunter Range', 'Portée du Chasseur', 'Hunter', 'Chasseur');
INSERT INTO `spellrangedbc` VALUES ('134', '0', '0', '80', '80', '0', 'Tower 80', 'Tower 80', 'Tower', 'Tower');
INSERT INTO `spellrangedbc` VALUES ('135', '0', '0', '100', '100', '0', 'Tower 100', 'Tower 100', 'Tower', 'Tower');
INSERT INTO `spellrangedbc` VALUES ('136', '30', '30', '80', '80', '0', 'Thirty-to-80', 'Thirty-to-80', 'Thirty-to-80', 'Thirty-to-80');
INSERT INTO `spellrangedbc` VALUES ('137', '0', '0', '8', '8', '0', 'Eight yards', 'Eight yards', 'Very Short', 'Very Short');
INSERT INTO `spellrangedbc` VALUES ('139', '5', '5', '45', '45', '0', 'Long Range Hunter Shoot', 'Long Range Hunter Shoot', 'Hunter Long', 'Hunter Long');
INSERT INTO `spellrangedbc` VALUES ('140', '0', '0', '6', '6', '0', 'Six yards', 'Six yards', 'Six yards', 'Six yards');
INSERT INTO `spellrangedbc` VALUES ('141', '0', '0', '7', '7', '0', 'Seven yards', 'Seven yards', 'Seven yards', 'Seven yards');
INSERT INTO `spellrangedbc` VALUES ('150', '8', '8', '100', '100', '0', 'Valgarde 8/100', 'Valgarde 8/100', 'Valgarde', 'Valgarde');
INSERT INTO `spellrangedbc` VALUES ('151', '5', '5', '45', '45', '0', 'Long Range Hunter Shoot', 'Long Range Hunter Shoot', 'Hunter 45', 'Hunter 45');
INSERT INTO `spellrangedbc` VALUES ('152', '0', '0', '150', '150', '0', 'Super Long', 'Super Long', 'Super Long', 'Super Long');
INSERT INTO `spellrangedbc` VALUES ('153', '0', '0', '60', '60', '0', 'Charge, 60', 'Charge, 60', 'Huge Charge', 'Huge Charge');
INSERT INTO `spellrangedbc` VALUES ('154', '10', '10', '80', '80', '0', 'Tower 80, 10', 'Tower 80, 10', 'Tower 10', 'Tower 10');
INSERT INTO `spellrangedbc` VALUES ('155', '0', '0', '45', '45', '2', 'Hunter Range (Long)', 'Hunter Range (Long)', 'Hunter (Long)', 'Hunter (Long)');
INSERT INTO `spellrangedbc` VALUES ('156', '30', '30', '200', '200', '0', 'Boulder Range', 'Boulder Range', 'Boulder', 'Boulder');
INSERT INTO `spellrangedbc` VALUES ('157', '0', '0', '90', '90', '0', 'Ninety', 'Ninety', 'Ninety', 'Ninety');
INSERT INTO `spellrangedbc` VALUES ('158', '15', '15', '150', '150', '0', 'Super Long, 15 Min', 'Super Long, 15 Min', 'Super Long', 'Super Long');
INSERT INTO `spellrangedbc` VALUES ('159', '0', '0', '40', '100', '0', 'TEST - Long Range', 'TEST - Long Range', 'TestLong', 'TestLong');
INSERT INTO `spellrangedbc` VALUES ('160', '0', '0', '30', '40', '0', 'Medium/Long Range', 'Medium/Long Range', 'Medium/Long', 'Medium/Long');
INSERT INTO `spellrangedbc` VALUES ('161', '0', '0', '20', '40', '0', 'Short/Long Range', 'Short/Long Range', 'Short/Long', 'Short/Long');
INSERT INTO `spellrangedbc` VALUES ('162', '0', '0', '20', '30', '0', 'Medium/Short Range', 'Medium/Short Range', 'Medium/Short', 'Medium/Short');
INSERT INTO `spellrangedbc` VALUES ('163', '8', '8', '30', '30', '0', 'Death Grip', 'Death Grip', 'Death Grip', 'Death Grip');
INSERT INTO `spellrangedbc` VALUES ('164', '10', '10', '70', '70', '0', 'Catapult Range', 'Catapult Range', 'Catapult', 'Catapult');
INSERT INTO `spellrangedbc` VALUES ('165', '0', '0', '14', '14', '0', 'Fourteen yards', 'Fourteen yards', 'Shorter', 'Shorter');
INSERT INTO `spellrangedbc` VALUES ('166', '0', '0', '13', '13', '0', 'Thirteen yards', 'Thirteen yards', 'Shorter', 'Shorter');
INSERT INTO `spellrangedbc` VALUES ('167', '40', '0', '150', '150', '0', 'Super Long (Min Range)', 'Super Long (Min Range)', 'Super Long', 'Super Long');
INSERT INTO `spellrangedbc` VALUES ('168', '0', '0', '38', '38', '0', 'Medium-Long Range (38)', 'Medium-Long Range (38)', 'Medium-Long', 'Medium-Long');
INSERT INTO `spellrangedbc` VALUES ('169', '0', '0', '3', '3', '0', 'Three Yards', 'Three Yards', 'Three Yards', 'Three Yards');
INSERT INTO `spellrangedbc` VALUES ('170', '0', '0', '55', '55', '0', 'Fifty Five Yards', 'Fifty Five Yards', 'Extended', 'Extended');
INSERT INTO `spellrangedbc` VALUES ('171', '1', '1', '10', '10', '0', 'Min Range 1, 10', 'Min Range 1, 10', 'Very Short', 'Very Short');
INSERT INTO `spellrangedbc` VALUES ('172', '0', '0', '11', '11', '0', 'Eleven yards', 'Eleven yards', 'Shorter', 'Shorter');
INSERT INTO `spellrangedbc` VALUES ('173', '5', '5', '50000', '50000', '0', 'Anywhere (Combat Min Range)', 'Anywhere (Combat Min Range)', 'Hunter Long', 'Hunter Long');
INSERT INTO `spellrangedbc` VALUES ('174', '0', '0', '1000', '1000', '0', 'U L T R A', 'U L T R A', 'U L T R A', 'U L T R A');
INSERT INTO `spellrangedbc` VALUES ('176', '0', '0', '70', '70', '0', 'Seventy yards', 'Seventy yards', 'Extended', 'Extended');
INSERT INTO `spellrangedbc` VALUES ('177', '20', '20', '70', '70', '0', 'Donut 20-70', 'Donut 20-70', 'Donut 20-70', 'Donut 20-70');
INSERT INTO `spellrangedbc` VALUES ('179', '5', '5', '15', '15', '0', 'Min Range 5, 15', 'Min Range 5, 15', 'Shorter', 'Shorter');
INSERT INTO `spellrangedbc` VALUES ('180', '5', '5', '25', '25', '0', 'Tournament - Ranged', 'Tournament - Ranged', 'Argent Tournament - Ranged', 'Argent Tournament - Ranged');
INSERT INTO `spellrangedbc` VALUES ('181', '0', '0', '200', '200', '0', 'Two-Hundred Yard Range', 'Two-Hundred Yard Range', '200', '200');
INSERT INTO `spellrangedbc` VALUES ('184', '5', '5', '25', '25', '0', 'Min Range 5, 25', 'Min Range 5, 25', 'Medium', 'Medium');
INSERT INTO `spellrangedbc` VALUES ('187', '0', '0', '300', '300', '0', 'Three Hundred Yards', 'Three Hundred Yards', '300', '300');
