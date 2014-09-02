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
  `Name` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `NameFlags` int(10) NOT NULL DEFAULT '0',
  `Name2` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Name2_loc2` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Name2Flags` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ID` (`Id`)
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

INSERT INTO `spellrangedbc` VALUES ('1', '0', '0', '0', '0', '0', 'Self Only', 'Personnel', '4259902', 'Self', 'Soi-même', '4259900');
INSERT INTO `spellrangedbc` VALUES ('2', '0', '0', '1084230000', '1084230000', '1', 'Combat Range', 'Portée de combat', '12648510', 'Combat', 'Combat', '12648508');
INSERT INTO `spellrangedbc` VALUES ('3', '0', '0', '1101000000', '1101000000', '0', 'Twenty yards', 'Portée courte', '4259902', 'Short', 'Court', '4259900');
INSERT INTO `spellrangedbc` VALUES ('4', '0', '0', '1106250000', '1106250000', '0', 'Medium Range', 'Portée moyenne', '4259902', 'Medium', 'Moyen', '4259900');
INSERT INTO `spellrangedbc` VALUES ('5', '0', '0', '1109390000', '1109390000', '0', 'Long Range', 'Portée longue', '4259902', 'Long', 'Long', '4259900');
INSERT INTO `spellrangedbc` VALUES ('6', '0', '0', '1120400000', '1120400000', '0', 'Vision Range', 'Portée de vue', '4259902', 'Vision', 'Vision', '4259900');
INSERT INTO `spellrangedbc` VALUES ('7', '0', '0', '1092620000', '1092620000', '0', 'Ten yards', 'Portée très courte', '4259902', 'Very Short', 'Très court', '4259900');
INSERT INTO `spellrangedbc` VALUES ('8', '1092616192', '1092616192', '1101000000', '1101000000', '0', 'Min Range 10, 20', 'Portée courte', '4259902', 'Short', 'Court', '4259900');
INSERT INTO `spellrangedbc` VALUES ('9', '1092616192', '1092616192', '1106250000', '1106250000', '0', 'Medium Range', 'Portée moyenne', '4259902', 'Medium', 'Moyen', '4259900');
INSERT INTO `spellrangedbc` VALUES ('10', '1092616192', '1092616192', '1109390000', '1109390000', '0', 'Long Range', 'Portée longue', '4259902', 'Long', 'Long', '4259900');
INSERT INTO `spellrangedbc` VALUES ('11', '0', '0', '1097860000', '1097860000', '0', 'Fifteen yards', 'Portée courte', '4259902', 'Shorter', 'Plus court', '4259900');
INSERT INTO `spellrangedbc` VALUES ('12', '0', '0', '1084230000', '1084230000', '0', 'Interact Range', 'Portée d\'interaction', '4259902', 'Interact', 'Interagir', '4259900');
INSERT INTO `spellrangedbc` VALUES ('13', '0', '0', '1195590000', '1195590000', '0', 'Anywhere', 'Partout', '4259902', 'Anywhere', 'Partout', '4259900');
INSERT INTO `spellrangedbc` VALUES ('14', '0', '0', '1114640000', '1114640000', '0', 'Extra Long Range', 'Portée très longue', '4259902', 'Extra Long', 'Extra-long', '4259900');
INSERT INTO `spellrangedbc` VALUES ('34', '0', '0', '1103630000', '1103630000', '0', 'Twenty-Five yards', 'Portée courte-moyenne', '4259902', 'Medium-Short', 'Moyen-court', '4259900');
INSERT INTO `spellrangedbc` VALUES ('35', '0', '0', '1108080000', '1108080000', '0', 'Medium-Long Range', 'Portée moyenne-longue', '4259902', 'Medium-Long', 'Moyen-long', '4259900');
INSERT INTO `spellrangedbc` VALUES ('36', '0', '0', '1110700000', '1110700000', '0', 'Longer Range', 'Portée longue', '4259900', 'Longer', 'Plus long', '4259900');
INSERT INTO `spellrangedbc` VALUES ('37', '0', '0', '1112010000', '1112010000', '0', 'Extended Range', 'Portée étendue', '4259900', 'Extended', 'Etendu', '4259900');
INSERT INTO `spellrangedbc` VALUES ('38', '1092616192', '1092616192', '1103630000', '1103630000', '0', 'Min-Range 10, 25', 'Portée moyenne étendue', '4259900', 'Extra Medium', 'Extra-moyen', '4259900');
INSERT INTO `spellrangedbc` VALUES ('54', '1084227584', '1084227584', '1106250000', '1106250000', '0', 'Monster Shoot', 'Tir monstrueux de Geoff', '2031676', 'Monster Shoot Range', 'Geoff', '2031676');
INSERT INTO `spellrangedbc` VALUES ('74', '0', '0', '1106250000', '1106250000', '2', 'Ranged Weapon', 'Arme à distance', '2031676', 'Ranged', 'A distance', '2031676');
INSERT INTO `spellrangedbc` VALUES ('94', '1090519040', '1090519040', '1109390000', '1109390000', '0', 'Sting', 'Aiguillon', '2031676', 'Sting', 'Aiguillon', '2031676');
INSERT INTO `spellrangedbc` VALUES ('95', '1090519040', '1090519040', '1103630000', '1103630000', '0', 'Charge', 'Charge', '2031676', 'Charge', 'Charge', '2031676');
INSERT INTO `spellrangedbc` VALUES ('96', '0', '0', '1073740000', '1073740000', '0', 'Trap', 'Piège', '2031676', 'Trap', 'Piège', '2031676');
INSERT INTO `spellrangedbc` VALUES ('114', '0', '0', '1108080000', '1108080000', '2', 'Hunter Range', 'Portée du Chasseur', '2031676', 'Hunter', 'Chasseur', '2031668');
INSERT INTO `spellrangedbc` VALUES ('134', '0', '0', '1117780000', '1117780000', '0', 'Tower 80', 'Tower 80', '2031664', 'Tower', 'Tower', '2031664');
INSERT INTO `spellrangedbc` VALUES ('135', '0', '0', '1120400000', '1120400000', '0', 'Tower 100', 'Tower 100', '2031664', 'Tower', 'Tower', '2031664');
INSERT INTO `spellrangedbc` VALUES ('136', '1106247680', '1106247680', '1117780000', '1117780000', '0', 'Thirty-to-80', 'Thirty-to-80', '1507360', 'Thirty-to-80', 'Thirty-to-80', '1507360');
INSERT INTO `spellrangedbc` VALUES ('137', '0', '0', '1090520000', '1090520000', '0', 'Eight yards', 'Eight yards', '1507360', 'Very Short', 'Very Short', '1507360');
INSERT INTO `spellrangedbc` VALUES ('139', '1084227584', '1084227584', '1110700000', '1110700000', '0', 'Long Range Hunter Shoot', 'Long Range Hunter Shoot', '65536', 'Hunter Long', 'Hunter Long', '65536');
INSERT INTO `spellrangedbc` VALUES ('140', '0', '0', '1086320000', '1086320000', '0', 'Six yards', 'Six yards', '65536', 'Six yards', 'Six yards', '65536');
INSERT INTO `spellrangedbc` VALUES ('141', '0', '0', '1088420000', '1088420000', '0', 'Seven yards', 'Seven yards', '65536', 'Seven yards', 'Seven yards', '65536');
INSERT INTO `spellrangedbc` VALUES ('150', '1090519040', '1090519040', '1120400000', '1120400000', '0', 'Valgarde 8/100', 'Valgarde 8/100', '65536', 'Valgarde', 'Valgarde', '65536');
INSERT INTO `spellrangedbc` VALUES ('151', '1084227584', '1084227584', '1110700000', '1110700000', '0', 'Long Range Hunter Shoot', 'Long Range Hunter Shoot', '65536', 'Hunter 45', 'Hunter 45', '65536');
INSERT INTO `spellrangedbc` VALUES ('152', '0', '0', '1125520000', '1125520000', '0', 'Super Long', 'Super Long', '65536', 'Super Long', 'Super Long', '65536');
INSERT INTO `spellrangedbc` VALUES ('153', '0', '0', '1114640000', '1114640000', '0', 'Charge, 60', 'Charge, 60', '65536', 'Huge Charge', 'Huge Charge', '65536');
INSERT INTO `spellrangedbc` VALUES ('154', '1092616192', '1092616192', '1117780000', '1117780000', '0', 'Tower 80, 10', 'Tower 80, 10', '65536', 'Tower 10', 'Tower 10', '65536');
INSERT INTO `spellrangedbc` VALUES ('155', '0', '0', '1110700000', '1110700000', '2', 'Hunter Range (Long)', 'Hunter Range (Long)', '65536', 'Hunter (Long)', 'Hunter (Long)', '65536');
INSERT INTO `spellrangedbc` VALUES ('156', '1106247680', '1106247680', '1128790000', '1128790000', '0', 'Boulder Range', 'Boulder Range', '65536', 'Boulder', 'Boulder', '65536');
INSERT INTO `spellrangedbc` VALUES ('157', '0', '0', '1119090000', '1119090000', '0', 'Ninety', 'Ninety', '65536', 'Ninety', 'Ninety', '65536');
INSERT INTO `spellrangedbc` VALUES ('158', '1097859072', '1097859072', '1125520000', '1125520000', '0', 'Super Long, 15 Min', 'Super Long, 15 Min', '65536', 'Super Long', 'Super Long', '65536');
INSERT INTO `spellrangedbc` VALUES ('159', '0', '0', '1109390000', '1120400000', '0', 'TEST - Long Range', 'TEST - Long Range', '65536', 'TestLong', 'TestLong', '65536');
INSERT INTO `spellrangedbc` VALUES ('160', '0', '0', '1106250000', '1109390000', '0', 'Medium/Long Range', 'Medium/Long Range', '65536', 'Medium/Long', 'Medium/Long', '65536');
INSERT INTO `spellrangedbc` VALUES ('161', '0', '0', '1101000000', '1109390000', '0', 'Short/Long Range', 'Short/Long Range', '65536', 'Short/Long', 'Short/Long', '65536');
INSERT INTO `spellrangedbc` VALUES ('162', '0', '0', '1101000000', '1106250000', '0', 'Medium/Short Range', 'Medium/Short Range', '65536', 'Medium/Short', 'Medium/Short', '65536');
INSERT INTO `spellrangedbc` VALUES ('163', '1090519040', '1090519040', '1106250000', '1106250000', '0', 'Death Grip', 'Death Grip', '65536', 'Death Grip', 'Death Grip', '65536');
INSERT INTO `spellrangedbc` VALUES ('164', '1092616192', '1092616192', '1116470000', '1116470000', '0', 'Catapult Range', 'Catapult Range', '65536', 'Catapult', 'Catapult', '65536');
INSERT INTO `spellrangedbc` VALUES ('165', '0', '0', '1096810000', '1096810000', '0', 'Fourteen yards', 'Fourteen yards', '65536', 'Shorter', 'Shorter', '65536');
INSERT INTO `spellrangedbc` VALUES ('166', '0', '0', '1095760000', '1095760000', '0', 'Thirteen yards', 'Thirteen yards', '65536', 'Shorter', 'Shorter', '65536');
INSERT INTO `spellrangedbc` VALUES ('167', '1109393408', '0', '1125520000', '1125520000', '0', 'Super Long (Min Range)', 'Super Long (Min Range)', '0', 'Super Long', 'Super Long', '0');
INSERT INTO `spellrangedbc` VALUES ('168', '0', '0', '1108870000', '1108870000', '0', 'Medium-Long Range (38)', 'Medium-Long Range (38)', '0', 'Medium-Long', 'Medium-Long', '0');
INSERT INTO `spellrangedbc` VALUES ('169', '0', '0', '1077940000', '1077940000', '0', 'Three Yards', 'Three Yards', '0', 'Three Yards', 'Three Yards', '0');
INSERT INTO `spellrangedbc` VALUES ('170', '0', '0', '1113330000', '1113330000', '0', 'Fifty Five Yards', 'Fifty Five Yards', '0', 'Extended', 'Extended', '0');
INSERT INTO `spellrangedbc` VALUES ('171', '1065353216', '1065353216', '1092620000', '1092620000', '0', 'Min Range 1, 10', 'Min Range 1, 10', '0', 'Very Short', 'Very Short', '0');
INSERT INTO `spellrangedbc` VALUES ('172', '0', '0', '1093660000', '1093660000', '0', 'Eleven yards', 'Eleven yards', '0', 'Shorter', 'Shorter', '0');
INSERT INTO `spellrangedbc` VALUES ('173', '1084227584', '1084227584', '1195590000', '1195590000', '0', 'Anywhere (Combat Min Range)', 'Anywhere (Combat Min Range)', '0', 'Hunter Long', 'Hunter Long', '0');
INSERT INTO `spellrangedbc` VALUES ('174', '0', '0', '1148850000', '1148850000', '0', 'U L T R A', 'U L T R A', '0', 'U L T R A', 'U L T R A', '0');
INSERT INTO `spellrangedbc` VALUES ('176', '0', '0', '1116470000', '1116470000', '0', 'Seventy yards', 'Seventy yards', '0', 'Extended', 'Extended', '0');
INSERT INTO `spellrangedbc` VALUES ('177', '1101004800', '1101004800', '1116470000', '1116470000', '0', 'Donut 20-70', 'Donut 20-70', '0', 'Donut 20-70', 'Donut 20-70', '0');
INSERT INTO `spellrangedbc` VALUES ('179', '1084227584', '1084227584', '1097860000', '1097860000', '0', 'Min Range 5, 15', 'Min Range 5, 15', '0', 'Shorter', 'Shorter', '0');
INSERT INTO `spellrangedbc` VALUES ('180', '1084227584', '1084227584', '1103630000', '1103630000', '0', 'Tournament - Ranged', 'Tournament - Ranged', '0', 'Argent Tournament - Ranged', 'Argent Tournament - Ranged', '0');
INSERT INTO `spellrangedbc` VALUES ('181', '0', '0', '1128790000', '1128790000', '0', 'Two-Hundred Yard Range', 'Two-Hundred Yard Range', '0', '200', '200', '0');
INSERT INTO `spellrangedbc` VALUES ('184', '1084227584', '1084227584', '1103630000', '1103630000', '0', 'Min Range 5, 25', 'Min Range 5, 25', '0', 'Medium', 'Medium', '0');
INSERT INTO `spellrangedbc` VALUES ('187', '0', '0', '1133900000', '1133900000', '0', 'Three Hundred Yards', 'Three Hundred Yards', '0', '300', '300', '0');
