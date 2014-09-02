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
  UNIQUE KEY `ID` (`Id`)
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

INSERT INTO `spellradiusdbc` VALUES ('7', '1073740000', '0', '1073740000');
INSERT INTO `spellradiusdbc` VALUES ('8', '1084230000', '0', '1084230000');
INSERT INTO `spellradiusdbc` VALUES ('9', '1101000000', '0', '1101000000');
INSERT INTO `spellradiusdbc` VALUES ('10', '1106250000', '0', '1106250000');
INSERT INTO `spellradiusdbc` VALUES ('11', '1110700000', '0', '1110700000');
INSERT INTO `spellradiusdbc` VALUES ('12', '1120400000', '0', '1120400000');
INSERT INTO `spellradiusdbc` VALUES ('13', '1092620000', '0', '1092620000');
INSERT INTO `spellradiusdbc` VALUES ('14', '1090520000', '0', '1090520000');
INSERT INTO `spellradiusdbc` VALUES ('15', '1077940000', '0', '1077940000');
INSERT INTO `spellradiusdbc` VALUES ('16', '1065350000', '0', '1065350000');
INSERT INTO `spellradiusdbc` VALUES ('17', '1095760000', '0', '1095760000');
INSERT INTO `spellradiusdbc` VALUES ('18', '1097860000', '0', '1097860000');
INSERT INTO `spellradiusdbc` VALUES ('19', '1099960000', '0', '1099960000');
INSERT INTO `spellradiusdbc` VALUES ('20', '1103630000', '0', '1103630000');
INSERT INTO `spellradiusdbc` VALUES ('21', '1108080000', '0', '1108080000');
INSERT INTO `spellradiusdbc` VALUES ('22', '1128790000', '0', '1128790000');
INSERT INTO `spellradiusdbc` VALUES ('23', '1109390000', '0', '1109390000');
INSERT INTO `spellradiusdbc` VALUES ('24', '1115820000', '0', '1115820000');
INSERT INTO `spellradiusdbc` VALUES ('25', '1116470000', '0', '1116470000');
INSERT INTO `spellradiusdbc` VALUES ('26', '1082130000', '0', '1082130000');
INSERT INTO `spellradiusdbc` VALUES ('27', '1112010000', '0', '1112010000');
INSERT INTO `spellradiusdbc` VALUES ('28', '1195590000', '0', '1195590000');
INSERT INTO `spellradiusdbc` VALUES ('29', '1086320000', '0', '1086320000');
INSERT INTO `spellradiusdbc` VALUES ('30', '1140460000', '0', '1140460000');
INSERT INTO `spellradiusdbc` VALUES ('31', '1117780000', '0', '1117780000');
INSERT INTO `spellradiusdbc` VALUES ('32', '1094710000', '0', '1094710000');
INSERT INTO `spellradiusdbc` VALUES ('33', '1120270000', '0', '1120270000');
INSERT INTO `spellradiusdbc` VALUES ('35', '1113330000', '0', '1113330000');
INSERT INTO `spellradiusdbc` VALUES ('36', '0', '0', '0');
INSERT INTO `spellradiusdbc` VALUES ('37', '1088420000', '0', '1088420000');
INSERT INTO `spellradiusdbc` VALUES ('38', '1101530000', '0', '1101530000');
INSERT INTO `spellradiusdbc` VALUES ('39', '1107820000', '0', '1107820000');
INSERT INTO `spellradiusdbc` VALUES ('40', '1091570000', '0', '1091570000');
INSERT INTO `spellradiusdbc` VALUES ('41', '1125520000', '0', '1125520000');
INSERT INTO `spellradiusdbc` VALUES ('42', '1093660000', '0', '1093660000');
INSERT INTO `spellradiusdbc` VALUES ('43', '1098910000', '0', '1098910000');
INSERT INTO `spellradiusdbc` VALUES ('44', '1056960000', '0', '1056960000');
INSERT INTO `spellradiusdbc` VALUES ('45', '1092620000', '0', '1092620000');
INSERT INTO `spellradiusdbc` VALUES ('46', '1084230000', '0', '1092620000');
INSERT INTO `spellradiusdbc` VALUES ('47', '1097860000', '0', '1097860000');
INSERT INTO `spellradiusdbc` VALUES ('48', '1114640000', '0', '1114640000');
INSERT INTO `spellradiusdbc` VALUES ('49', '1119090000', '0', '1119090000');
INSERT INTO `spellradiusdbc` VALUES ('50', '1097860000', '0', '1097860000');
INSERT INTO `spellradiusdbc` VALUES ('51', '1114640000', '0', '1114640000');
INSERT INTO `spellradiusdbc` VALUES ('52', '1084230000', '0', '1084230000');
INSERT INTO `spellradiusdbc` VALUES ('53', '1114640000', '0', '1114640000');
INSERT INTO `spellradiusdbc` VALUES ('54', '1195590000', '0', '1195590000');
INSERT INTO `spellradiusdbc` VALUES ('55', '1124200000', '0', '1124200000');
INSERT INTO `spellradiusdbc` VALUES ('56', '1108870000', '0', '1108870000');
INSERT INTO `spellradiusdbc` VALUES ('57', '1110700000', '0', '1110700000');
INSERT INTO `spellradiusdbc` VALUES ('58', '1195590000', '0', '1195590000');
INSERT INTO `spellradiusdbc` VALUES ('59', '1107300000', '0', '1107300000');
INSERT INTO `spellradiusdbc` VALUES ('60', '1110440000', '0', '1110440000');
INSERT INTO `spellradiusdbc` VALUES ('61', '1096810000', '0', '1096810000');
INSERT INTO `spellradiusdbc` VALUES ('62', '1111230000', '0', '1111230000');
INSERT INTO `spellradiusdbc` VALUES ('63', '1102580000', '0', '1102580000');
INSERT INTO `spellradiusdbc` VALUES ('64', '1080030000', '0', '1080030000');
INSERT INTO `spellradiusdbc` VALUES ('65', '1117780000', '0', '1117780000');
