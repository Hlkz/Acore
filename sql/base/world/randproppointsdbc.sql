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
-- Table structure for table `randproppointsdbc`
--

DROP TABLE IF EXISTS `randproppointsdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `randproppointsdbc` (
  `ItemLevel` int(10) NOT NULL DEFAULT '0',
  `EpicPropertiesPoints1` int(10) NOT NULL DEFAULT '0',
  `EpicPropertiesPoints2` int(10) NOT NULL DEFAULT '0',
  `EpicPropertiesPoints3` int(10) NOT NULL DEFAULT '0',
  `EpicPropertiesPoints4` int(10) NOT NULL DEFAULT '0',
  `EpicPropertiesPoints5` int(10) NOT NULL DEFAULT '0',
  `RarePropertiesPoints1` int(10) NOT NULL DEFAULT '0',
  `RarePropertiesPoints2` int(10) NOT NULL DEFAULT '0',
  `RarePropertiesPoints3` int(10) NOT NULL DEFAULT '0',
  `RarePropertiesPoints4` int(10) NOT NULL DEFAULT '0',
  `RarePropertiesPoints5` int(10) NOT NULL DEFAULT '0',
  `UncommonPropertiesPoints1` int(10) NOT NULL DEFAULT '0',
  `UncommonPropertiesPoints2` int(10) NOT NULL DEFAULT '0',
  `UncommonPropertiesPoints3` int(10) NOT NULL DEFAULT '0',
  `UncommonPropertiesPoints4` int(10) NOT NULL DEFAULT '0',
  `UncommonPropertiesPoints5` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ItemLevel`),
  UNIQUE KEY `ID` (`ItemLevel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `randproppointsdbc`
--

LOCK TABLES `randproppointsdbc` WRITE;
/*!40000 ALTER TABLE `randproppointsdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `randproppointsdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `randproppointsdbc`
--

INSERT INTO `randproppointsdbc` VALUES ('1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `randproppointsdbc` VALUES ('2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `randproppointsdbc` VALUES ('3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `randproppointsdbc` VALUES ('4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `randproppointsdbc` VALUES ('5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `randproppointsdbc` VALUES ('6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `randproppointsdbc` VALUES ('7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `randproppointsdbc` VALUES ('8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `randproppointsdbc` VALUES ('9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `randproppointsdbc` VALUES ('10', '9', '7', '5', '4', '3', '5', '4', '3', '2', '2', '1', '1', '1', '0', '0');
INSERT INTO `randproppointsdbc` VALUES ('11', '10', '8', '6', '4', '3', '5', '4', '3', '2', '2', '2', '1', '1', '1', '0');
INSERT INTO `randproppointsdbc` VALUES ('12', '11', '8', '6', '5', '4', '6', '4', '3', '3', '2', '2', '2', '1', '1', '1');
INSERT INTO `randproppointsdbc` VALUES ('13', '12', '9', '7', '5', '4', '7', '5', '4', '3', '2', '3', '2', '1', '1', '1');
INSERT INTO `randproppointsdbc` VALUES ('14', '12', '9', '7', '5', '4', '7', '5', '4', '3', '2', '3', '2', '2', '1', '1');
INSERT INTO `randproppointsdbc` VALUES ('15', '13', '10', '7', '5', '4', '8', '6', '4', '3', '2', '4', '3', '2', '1', '1');
INSERT INTO `randproppointsdbc` VALUES ('16', '14', '10', '8', '6', '4', '8', '6', '5', '4', '3', '4', '3', '2', '2', '1');
INSERT INTO `randproppointsdbc` VALUES ('17', '14', '11', '8', '6', '5', '9', '7', '5', '4', '3', '5', '3', '3', '2', '1');
INSERT INTO `randproppointsdbc` VALUES ('18', '15', '11', '9', '7', '5', '9', '7', '5', '4', '3', '5', '4', '3', '2', '2');
INSERT INTO `randproppointsdbc` VALUES ('19', '16', '12', '9', '7', '5', '10', '8', '6', '4', '3', '6', '4', '3', '2', '2');
INSERT INTO `randproppointsdbc` VALUES ('20', '16', '12', '9', '7', '5', '11', '8', '6', '5', '3', '6', '5', '3', '3', '2');
INSERT INTO `randproppointsdbc` VALUES ('21', '17', '13', '9', '7', '5', '11', '8', '6', '5', '4', '7', '5', '4', '3', '2');
INSERT INTO `randproppointsdbc` VALUES ('22', '18', '13', '10', '7', '6', '12', '9', '7', '5', '4', '7', '5', '4', '3', '2');
INSERT INTO `randproppointsdbc` VALUES ('23', '18', '14', '11', '8', '6', '12', '9', '7', '5', '4', '8', '6', '4', '3', '2');
INSERT INTO `randproppointsdbc` VALUES ('24', '19', '14', '11', '8', '6', '13', '10', '7', '6', '4', '8', '6', '5', '3', '3');
INSERT INTO `randproppointsdbc` VALUES ('25', '20', '15', '11', '9', '7', '14', '10', '8', '6', '4', '9', '6', '5', '4', '3');
INSERT INTO `randproppointsdbc` VALUES ('26', '20', '16', '11', '9', '7', '14', '11', '8', '6', '5', '9', '7', '5', '4', '3');
INSERT INTO `randproppointsdbc` VALUES ('27', '21', '16', '12', '9', '7', '15', '11', '8', '6', '5', '10', '7', '5', '4', '3');
INSERT INTO `randproppointsdbc` VALUES ('28', '22', '16', '12', '9', '7', '15', '12', '9', '7', '5', '10', '8', '6', '4', '3');
INSERT INTO `randproppointsdbc` VALUES ('29', '23', '17', '13', '9', '7', '16', '12', '9', '7', '5', '11', '8', '6', '4', '3');
INSERT INTO `randproppointsdbc` VALUES ('30', '23', '18', '13', '10', '7', '17', '12', '9', '7', '5', '11', '8', '6', '5', '3');
INSERT INTO `randproppointsdbc` VALUES ('31', '24', '18', '14', '10', '7', '17', '13', '10', '7', '5', '12', '9', '6', '5', '4');
INSERT INTO `randproppointsdbc` VALUES ('32', '25', '18', '14', '11', '8', '18', '13', '10', '8', '6', '12', '9', '7', '5', '4');
INSERT INTO `randproppointsdbc` VALUES ('33', '25', '19', '14', '11', '8', '18', '14', '10', '8', '6', '13', '9', '7', '5', '4');
INSERT INTO `randproppointsdbc` VALUES ('34', '26', '20', '15', '11', '8', '19', '14', '11', '8', '6', '13', '10', '7', '5', '4');
INSERT INTO `randproppointsdbc` VALUES ('35', '27', '20', '15', '11', '9', '20', '15', '11', '8', '6', '14', '10', '8', '6', '4');
INSERT INTO `randproppointsdbc` VALUES ('36', '27', '20', '16', '11', '9', '20', '15', '11', '9', '6', '14', '11', '8', '6', '4');
INSERT INTO `randproppointsdbc` VALUES ('37', '28', '21', '16', '12', '9', '21', '16', '12', '9', '7', '15', '11', '8', '6', '5');
INSERT INTO `randproppointsdbc` VALUES ('38', '29', '22', '16', '12', '9', '21', '16', '12', '9', '7', '15', '11', '8', '6', '5');
INSERT INTO `randproppointsdbc` VALUES ('39', '29', '22', '16', '12', '9', '22', '16', '12', '9', '7', '16', '12', '9', '7', '5');
INSERT INTO `randproppointsdbc` VALUES ('40', '30', '23', '17', '13', '9', '23', '17', '13', '10', '7', '16', '12', '9', '7', '5');
INSERT INTO `randproppointsdbc` VALUES ('41', '31', '23', '18', '13', '10', '23', '17', '13', '10', '7', '17', '12', '9', '7', '5');
INSERT INTO `randproppointsdbc` VALUES ('42', '32', '24', '18', '13', '10', '24', '18', '13', '10', '8', '17', '13', '10', '7', '5');
INSERT INTO `randproppointsdbc` VALUES ('43', '32', '24', '18', '14', '10', '24', '18', '14', '10', '8', '18', '13', '10', '7', '6');
INSERT INTO `randproppointsdbc` VALUES ('44', '33', '25', '18', '14', '11', '25', '19', '14', '11', '8', '18', '14', '10', '8', '6');
INSERT INTO `randproppointsdbc` VALUES ('45', '34', '25', '19', '14', '11', '26', '19', '14', '11', '8', '19', '14', '10', '8', '6');
INSERT INTO `randproppointsdbc` VALUES ('46', '34', '25', '19', '14', '11', '26', '20', '15', '11', '8', '19', '14', '11', '8', '6');
INSERT INTO `randproppointsdbc` VALUES ('47', '35', '26', '20', '15', '11', '27', '20', '15', '11', '8', '20', '15', '11', '8', '6');
INSERT INTO `randproppointsdbc` VALUES ('48', '36', '27', '20', '15', '11', '27', '20', '15', '12', '9', '20', '15', '11', '8', '6');
INSERT INTO `randproppointsdbc` VALUES ('49', '36', '27', '20', '16', '11', '28', '21', '16', '12', '9', '21', '15', '12', '9', '6');
INSERT INTO `randproppointsdbc` VALUES ('50', '37', '28', '21', '16', '12', '28', '21', '16', '12', '9', '21', '16', '12', '9', '7');
INSERT INTO `randproppointsdbc` VALUES ('51', '38', '28', '21', '16', '12', '29', '22', '16', '12', '9', '22', '16', '12', '9', '7');
INSERT INTO `randproppointsdbc` VALUES ('52', '38', '29', '22', '16', '12', '30', '22', '17', '13', '9', '22', '17', '12', '9', '7');
INSERT INTO `randproppointsdbc` VALUES ('53', '39', '29', '22', '16', '12', '30', '23', '17', '13', '10', '23', '17', '13', '9', '7');
INSERT INTO `randproppointsdbc` VALUES ('54', '40', '30', '22', '17', '13', '31', '23', '17', '13', '10', '23', '17', '13', '10', '7');
INSERT INTO `randproppointsdbc` VALUES ('55', '41', '30', '23', '17', '13', '31', '24', '18', '13', '10', '24', '18', '13', '10', '7');
INSERT INTO `randproppointsdbc` VALUES ('56', '41', '31', '23', '18', '13', '32', '24', '18', '14', '10', '24', '18', '14', '10', '8');
INSERT INTO `randproppointsdbc` VALUES ('57', '42', '32', '23', '18', '13', '33', '24', '18', '14', '10', '25', '18', '14', '10', '8');
INSERT INTO `randproppointsdbc` VALUES ('58', '43', '32', '24', '18', '14', '33', '25', '19', '14', '11', '25', '19', '14', '11', '8');
INSERT INTO `randproppointsdbc` VALUES ('59', '43', '32', '25', '18', '14', '34', '25', '19', '14', '11', '26', '19', '14', '11', '8');
INSERT INTO `randproppointsdbc` VALUES ('60', '44', '33', '25', '18', '14', '34', '26', '19', '15', '11', '26', '20', '15', '11', '8');
INSERT INTO `randproppointsdbc` VALUES ('61', '45', '34', '25', '19', '14', '35', '26', '20', '15', '11', '27', '20', '15', '11', '8');
INSERT INTO `randproppointsdbc` VALUES ('62', '45', '34', '25', '19', '14', '36', '27', '20', '15', '11', '27', '20', '15', '11', '9');
INSERT INTO `randproppointsdbc` VALUES ('63', '46', '34', '26', '19', '14', '36', '27', '20', '15', '11', '28', '21', '15', '12', '9');
INSERT INTO `randproppointsdbc` VALUES ('64', '47', '35', '26', '20', '15', '37', '28', '21', '16', '12', '28', '21', '16', '12', '9');
INSERT INTO `randproppointsdbc` VALUES ('65', '47', '36', '27', '20', '15', '37', '28', '21', '16', '12', '29', '21', '16', '12', '9');
INSERT INTO `randproppointsdbc` VALUES ('66', '48', '36', '27', '20', '15', '38', '28', '21', '16', '12', '29', '22', '16', '12', '9');
INSERT INTO `randproppointsdbc` VALUES ('67', '49', '36', '27', '20', '16', '39', '29', '22', '16', '12', '30', '22', '17', '12', '9');
INSERT INTO `randproppointsdbc` VALUES ('68', '50', '37', '28', '21', '16', '39', '29', '22', '17', '12', '30', '23', '17', '13', '9');
INSERT INTO `randproppointsdbc` VALUES ('69', '50', '38', '28', '21', '16', '40', '30', '22', '17', '13', '31', '23', '17', '13', '10');
INSERT INTO `randproppointsdbc` VALUES ('70', '50', '38', '29', '21', '16', '40', '30', '23', '17', '13', '31', '23', '17', '13', '10');
INSERT INTO `randproppointsdbc` VALUES ('71', '52', '39', '29', '22', '16', '41', '31', '23', '17', '13', '32', '24', '18', '13', '10');
INSERT INTO `randproppointsdbc` VALUES ('72', '52', '39', '29', '22', '16', '42', '31', '23', '18', '13', '32', '24', '18', '14', '10');
INSERT INTO `randproppointsdbc` VALUES ('73', '52', '39', '30', '22', '17', '42', '32', '24', '18', '13', '33', '24', '18', '14', '10');
INSERT INTO `randproppointsdbc` VALUES ('74', '53', '40', '30', '23', '17', '43', '32', '24', '18', '14', '33', '25', '19', '14', '10');
INSERT INTO `randproppointsdbc` VALUES ('75', '54', '41', '30', '23', '17', '43', '32', '24', '18', '14', '34', '25', '19', '14', '11');
INSERT INTO `randproppointsdbc` VALUES ('76', '55', '41', '31', '23', '18', '44', '33', '25', '19', '14', '34', '26', '19', '14', '11');
INSERT INTO `randproppointsdbc` VALUES ('77', '55', '41', '31', '23', '18', '45', '33', '25', '19', '14', '35', '26', '19', '15', '11');
INSERT INTO `randproppointsdbc` VALUES ('78', '56', '42', '32', '24', '18', '45', '34', '25', '19', '14', '35', '26', '20', '15', '11');
INSERT INTO `randproppointsdbc` VALUES ('79', '57', '43', '32', '24', '18', '46', '34', '26', '19', '14', '36', '27', '20', '15', '11');
INSERT INTO `randproppointsdbc` VALUES ('80', '57', '43', '32', '25', '18', '46', '35', '26', '20', '15', '36', '27', '20', '15', '11');
INSERT INTO `randproppointsdbc` VALUES ('81', '58', '43', '33', '25', '18', '47', '35', '26', '20', '15', '37', '27', '21', '15', '12');
INSERT INTO `randproppointsdbc` VALUES ('82', '59', '44', '33', '25', '18', '47', '36', '27', '20', '15', '37', '28', '21', '16', '12');
INSERT INTO `randproppointsdbc` VALUES ('83', '59', '45', '34', '25', '19', '48', '36', '27', '20', '15', '38', '28', '21', '16', '12');
INSERT INTO `randproppointsdbc` VALUES ('84', '60', '45', '34', '25', '19', '49', '37', '27', '21', '15', '38', '29', '21', '16', '12');
INSERT INTO `randproppointsdbc` VALUES ('85', '61', '46', '34', '26', '19', '49', '37', '28', '21', '16', '39', '29', '22', '16', '12');
INSERT INTO `randproppointsdbc` VALUES ('86', '61', '46', '34', '26', '20', '50', '37', '28', '21', '16', '39', '29', '22', '16', '12');
INSERT INTO `randproppointsdbc` VALUES ('87', '62', '47', '35', '26', '20', '50', '38', '28', '21', '16', '40', '30', '22', '17', '12');
INSERT INTO `randproppointsdbc` VALUES ('88', '63', '47', '36', '27', '20', '51', '38', '29', '22', '16', '40', '30', '23', '17', '13');
INSERT INTO `randproppointsdbc` VALUES ('89', '64', '48', '36', '27', '20', '52', '39', '29', '22', '16', '41', '30', '23', '17', '13');
INSERT INTO `randproppointsdbc` VALUES ('90', '64', '48', '36', '27', '20', '52', '39', '29', '22', '17', '41', '31', '23', '17', '13');
INSERT INTO `randproppointsdbc` VALUES ('91', '65', '49', '36', '27', '21', '53', '40', '30', '22', '17', '42', '31', '23', '18', '13');
INSERT INTO `randproppointsdbc` VALUES ('92', '66', '50', '37', '28', '21', '53', '40', '30', '23', '17', '42', '32', '24', '18', '13');
INSERT INTO `randproppointsdbc` VALUES ('93', '66', '50', '37', '28', '21', '54', '41', '30', '23', '17', '43', '32', '24', '18', '13');
INSERT INTO `randproppointsdbc` VALUES ('94', '66', '50', '37', '28', '21', '54', '41', '30', '23', '17', '43', '32', '24', '18', '14');
INSERT INTO `randproppointsdbc` VALUES ('95', '67', '50', '37', '28', '21', '54', '41', '31', '23', '17', '44', '33', '24', '18', '14');
INSERT INTO `randproppointsdbc` VALUES ('96', '67', '50', '37', '28', '21', '55', '41', '31', '23', '17', '44', '33', '25', '19', '14');
INSERT INTO `randproppointsdbc` VALUES ('97', '67', '51', '38', '28', '21', '55', '42', '31', '24', '18', '45', '33', '25', '19', '14');
INSERT INTO `randproppointsdbc` VALUES ('98', '68', '51', '38', '29', '21', '56', '42', '31', '24', '18', '45', '34', '25', '19', '14');
INSERT INTO `randproppointsdbc` VALUES ('99', '68', '51', '38', '29', '22', '56', '42', '32', '24', '18', '46', '34', '26', '19', '14');
INSERT INTO `randproppointsdbc` VALUES ('100', '68', '51', '38', '29', '22', '57', '43', '32', '24', '18', '46', '35', '26', '19', '15');
INSERT INTO `randproppointsdbc` VALUES ('101', '69', '52', '38', '29', '22', '57', '43', '32', '24', '18', '47', '35', '26', '20', '15');
INSERT INTO `randproppointsdbc` VALUES ('102', '69', '52', '39', '29', '22', '57', '43', '32', '25', '18', '47', '35', '26', '20', '15');
INSERT INTO `randproppointsdbc` VALUES ('103', '69', '52', '39', '29', '22', '58', '44', '33', '25', '18', '48', '36', '27', '20', '15');
INSERT INTO `randproppointsdbc` VALUES ('104', '70', '52', '39', '30', '22', '58', '44', '33', '25', '19', '48', '36', '27', '20', '15');
INSERT INTO `randproppointsdbc` VALUES ('105', '70', '52', '39', '30', '22', '59', '44', '33', '25', '19', '49', '36', '27', '20', '15');
INSERT INTO `randproppointsdbc` VALUES ('106', '71', '52', '39', '30', '22', '59', '45', '33', '25', '19', '49', '37', '28', '21', '16');
INSERT INTO `randproppointsdbc` VALUES ('107', '71', '53', '40', '31', '22', '60', '45', '34', '26', '19', '50', '37', '28', '21', '16');
INSERT INTO `randproppointsdbc` VALUES ('108', '72', '53', '40', '31', '23', '60', '45', '34', '26', '19', '50', '38', '28', '21', '16');
INSERT INTO `randproppointsdbc` VALUES ('109', '73', '54', '40', '31', '23', '60', '46', '34', '26', '19', '51', '38', '28', '21', '16');
INSERT INTO `randproppointsdbc` VALUES ('110', '73', '54', '41', '31', '23', '61', '46', '34', '26', '19', '51', '38', '29', '22', '16');
INSERT INTO `randproppointsdbc` VALUES ('111', '74', '55', '41', '32', '23', '61', '46', '34', '26', '20', '52', '39', '29', '22', '16');
INSERT INTO `randproppointsdbc` VALUES ('112', '75', '56', '42', '32', '23', '62', '47', '35', '26', '20', '52', '39', '29', '22', '16');
INSERT INTO `randproppointsdbc` VALUES ('113', '75', '56', '42', '32', '24', '62', '47', '35', '27', '20', '53', '39', '30', '22', '17');
INSERT INTO `randproppointsdbc` VALUES ('114', '76', '57', '42', '33', '24', '63', '47', '35', '27', '20', '53', '40', '30', '22', '17');
INSERT INTO `randproppointsdbc` VALUES ('115', '77', '57', '43', '33', '24', '63', '48', '35', '27', '20', '54', '40', '30', '23', '17');
INSERT INTO `randproppointsdbc` VALUES ('116', '78', '58', '43', '33', '24', '67', '50', '38', '29', '21', '54', '41', '30', '23', '17');
INSERT INTO `randproppointsdbc` VALUES ('117', '78', '58', '44', '34', '25', '68', '51', '38', '29', '21', '55', '41', '31', '23', '17');
INSERT INTO `randproppointsdbc` VALUES ('118', '79', '59', '44', '34', '25', '69', '51', '38', '29', '22', '55', '41', '31', '23', '17');
INSERT INTO `randproppointsdbc` VALUES ('119', '80', '59', '44', '34', '25', '69', '52', '39', '30', '22', '56', '42', '31', '23', '18');
INSERT INTO `randproppointsdbc` VALUES ('120', '80', '60', '45', '35', '25', '70', '52', '39', '30', '22', '56', '42', '32', '24', '18');
INSERT INTO `randproppointsdbc` VALUES ('121', '81', '60', '45', '35', '26', '71', '52', '39', '30', '22', '61', '46', '34', '26', '19');
INSERT INTO `randproppointsdbc` VALUES ('122', '82', '61', '46', '35', '26', '71', '53', '40', '31', '22', '62', '46', '35', '27', '19');
INSERT INTO `randproppointsdbc` VALUES ('123', '83', '61', '46', '35', '26', '72', '53', '40', '31', '23', '63', '46', '35', '27', '20');
INSERT INTO `randproppointsdbc` VALUES ('124', '84', '62', '47', '36', '26', '73', '54', '40', '31', '23', '63', '47', '35', '27', '20');
INSERT INTO `randproppointsdbc` VALUES ('125', '84', '63', '47', '36', '27', '73', '54', '41', '31', '23', '64', '47', '36', '27', '20');
INSERT INTO `randproppointsdbc` VALUES ('126', '85', '63', '47', '36', '27', '74', '55', '41', '32', '23', '64', '48', '36', '28', '20');
INSERT INTO `randproppointsdbc` VALUES ('127', '86', '64', '48', '37', '27', '75', '56', '42', '32', '23', '65', '48', '36', '28', '20');
INSERT INTO `randproppointsdbc` VALUES ('128', '87', '64', '48', '37', '27', '75', '56', '42', '32', '24', '66', '49', '37', '28', '21');
INSERT INTO `randproppointsdbc` VALUES ('129', '88', '65', '49', '38', '28', '76', '57', '42', '33', '24', '66', '49', '37', '28', '21');
INSERT INTO `randproppointsdbc` VALUES ('130', '88', '66', '49', '38', '28', '77', '57', '43', '33', '24', '67', '50', '37', '29', '21');
INSERT INTO `randproppointsdbc` VALUES ('131', '89', '66', '50', '38', '28', '78', '58', '43', '33', '24', '67', '50', '38', '29', '21');
INSERT INTO `randproppointsdbc` VALUES ('132', '90', '67', '50', '39', '28', '78', '58', '44', '34', '25', '68', '51', '38', '29', '21');
INSERT INTO `randproppointsdbc` VALUES ('133', '91', '68', '51', '39', '29', '79', '59', '44', '34', '25', '69', '51', '38', '29', '22');
INSERT INTO `randproppointsdbc` VALUES ('134', '92', '68', '51', '39', '29', '80', '59', '44', '34', '25', '69', '52', '39', '30', '22');
INSERT INTO `randproppointsdbc` VALUES ('135', '93', '69', '52', '40', '29', '80', '60', '45', '35', '25', '70', '52', '39', '30', '22');
INSERT INTO `randproppointsdbc` VALUES ('136', '93', '69', '52', '40', '29', '81', '60', '45', '35', '26', '71', '52', '39', '30', '22');
INSERT INTO `randproppointsdbc` VALUES ('137', '94', '70', '53', '40', '30', '82', '61', '46', '35', '26', '71', '53', '40', '31', '22');
INSERT INTO `randproppointsdbc` VALUES ('138', '95', '71', '53', '41', '30', '83', '61', '46', '35', '26', '72', '53', '40', '31', '23');
INSERT INTO `randproppointsdbc` VALUES ('139', '96', '71', '54', '41', '30', '84', '62', '47', '36', '26', '73', '54', '40', '31', '23');
INSERT INTO `randproppointsdbc` VALUES ('140', '97', '72', '54', '42', '30', '84', '63', '47', '36', '27', '73', '54', '41', '31', '23');
INSERT INTO `randproppointsdbc` VALUES ('141', '98', '73', '55', '42', '31', '85', '63', '47', '36', '27', '74', '55', '41', '32', '23');
INSERT INTO `randproppointsdbc` VALUES ('142', '99', '73', '55', '42', '31', '86', '64', '48', '37', '27', '75', '56', '42', '32', '23');
INSERT INTO `randproppointsdbc` VALUES ('143', '100', '74', '56', '43', '31', '87', '64', '48', '37', '27', '75', '56', '42', '32', '24');
INSERT INTO `randproppointsdbc` VALUES ('144', '101', '75', '56', '43', '32', '88', '65', '49', '38', '28', '76', '57', '42', '33', '24');
INSERT INTO `randproppointsdbc` VALUES ('145', '102', '75', '57', '44', '32', '88', '66', '49', '38', '28', '77', '57', '43', '33', '24');
INSERT INTO `randproppointsdbc` VALUES ('146', '103', '76', '57', '44', '32', '89', '66', '50', '38', '28', '78', '58', '43', '33', '24');
INSERT INTO `randproppointsdbc` VALUES ('147', '104', '77', '58', '44', '33', '90', '67', '50', '39', '28', '78', '58', '44', '34', '25');
INSERT INTO `randproppointsdbc` VALUES ('148', '104', '78', '58', '45', '33', '91', '68', '51', '39', '29', '79', '59', '44', '34', '25');
INSERT INTO `randproppointsdbc` VALUES ('149', '105', '78', '59', '45', '33', '92', '68', '51', '39', '29', '80', '59', '44', '34', '25');
INSERT INTO `randproppointsdbc` VALUES ('150', '106', '79', '59', '46', '33', '93', '69', '52', '40', '29', '80', '60', '45', '35', '25');
INSERT INTO `randproppointsdbc` VALUES ('151', '107', '80', '60', '46', '34', '93', '69', '52', '40', '29', '81', '60', '45', '35', '26');
INSERT INTO `randproppointsdbc` VALUES ('152', '108', '81', '60', '46', '34', '94', '70', '53', '40', '30', '82', '61', '46', '35', '26');
INSERT INTO `randproppointsdbc` VALUES ('153', '109', '81', '61', '47', '34', '95', '71', '53', '41', '30', '83', '61', '46', '35', '26');
INSERT INTO `randproppointsdbc` VALUES ('154', '111', '82', '62', '47', '35', '96', '71', '54', '41', '30', '84', '62', '47', '36', '26');
INSERT INTO `randproppointsdbc` VALUES ('155', '112', '83', '62', '48', '35', '97', '72', '54', '42', '30', '84', '63', '47', '36', '27');
INSERT INTO `randproppointsdbc` VALUES ('156', '113', '84', '63', '48', '35', '98', '73', '55', '42', '31', '85', '63', '47', '36', '27');
INSERT INTO `randproppointsdbc` VALUES ('157', '114', '84', '63', '49', '36', '99', '73', '55', '42', '31', '86', '64', '48', '37', '27');
INSERT INTO `randproppointsdbc` VALUES ('158', '115', '85', '64', '49', '36', '100', '74', '56', '43', '31', '87', '64', '48', '37', '27');
INSERT INTO `randproppointsdbc` VALUES ('159', '116', '86', '65', '50', '36', '101', '75', '56', '43', '32', '88', '65', '49', '38', '28');
INSERT INTO `randproppointsdbc` VALUES ('160', '117', '87', '65', '50', '37', '102', '75', '57', '44', '32', '88', '66', '49', '38', '28');
INSERT INTO `randproppointsdbc` VALUES ('161', '118', '88', '66', '51', '37', '103', '76', '57', '44', '32', '89', '66', '50', '38', '28');
INSERT INTO `randproppointsdbc` VALUES ('162', '119', '88', '66', '51', '37', '104', '77', '58', '44', '33', '90', '67', '50', '39', '28');
INSERT INTO `randproppointsdbc` VALUES ('163', '120', '89', '67', '52', '38', '104', '78', '58', '45', '33', '91', '68', '51', '39', '29');
INSERT INTO `randproppointsdbc` VALUES ('164', '121', '90', '68', '52', '38', '105', '78', '59', '45', '33', '92', '68', '51', '39', '29');
INSERT INTO `randproppointsdbc` VALUES ('165', '122', '91', '68', '52', '38', '106', '79', '59', '46', '33', '93', '69', '52', '40', '29');
INSERT INTO `randproppointsdbc` VALUES ('166', '124', '92', '69', '53', '39', '107', '80', '60', '46', '34', '93', '69', '52', '40', '29');
INSERT INTO `randproppointsdbc` VALUES ('167', '125', '93', '69', '53', '39', '108', '81', '60', '46', '34', '94', '70', '53', '40', '30');
INSERT INTO `randproppointsdbc` VALUES ('168', '126', '94', '70', '54', '40', '109', '81', '61', '47', '34', '95', '71', '53', '41', '30');
INSERT INTO `randproppointsdbc` VALUES ('169', '127', '94', '71', '54', '40', '111', '82', '62', '47', '35', '96', '71', '54', '41', '30');
INSERT INTO `randproppointsdbc` VALUES ('170', '128', '95', '71', '55', '40', '112', '83', '62', '48', '35', '97', '72', '54', '42', '30');
INSERT INTO `randproppointsdbc` VALUES ('171', '129', '96', '72', '55', '41', '113', '84', '63', '48', '35', '98', '73', '55', '42', '31');
INSERT INTO `randproppointsdbc` VALUES ('172', '131', '97', '73', '56', '41', '114', '84', '63', '49', '36', '99', '73', '55', '42', '31');
INSERT INTO `randproppointsdbc` VALUES ('173', '132', '98', '73', '57', '41', '115', '85', '64', '49', '36', '100', '74', '56', '43', '31');
INSERT INTO `randproppointsdbc` VALUES ('174', '133', '99', '74', '57', '42', '116', '86', '65', '50', '36', '101', '75', '56', '43', '32');
INSERT INTO `randproppointsdbc` VALUES ('175', '134', '100', '75', '58', '42', '117', '87', '65', '50', '37', '102', '75', '57', '44', '32');
INSERT INTO `randproppointsdbc` VALUES ('176', '136', '101', '76', '58', '43', '118', '88', '66', '51', '37', '103', '76', '57', '44', '32');
INSERT INTO `randproppointsdbc` VALUES ('177', '137', '102', '76', '59', '43', '119', '88', '66', '51', '37', '104', '77', '58', '44', '33');
INSERT INTO `randproppointsdbc` VALUES ('178', '138', '103', '77', '59', '43', '120', '89', '67', '52', '38', '104', '78', '58', '45', '33');
INSERT INTO `randproppointsdbc` VALUES ('179', '139', '104', '78', '60', '44', '121', '90', '68', '52', '38', '105', '78', '59', '45', '33');
INSERT INTO `randproppointsdbc` VALUES ('180', '141', '105', '78', '60', '44', '122', '91', '68', '52', '38', '106', '79', '59', '46', '33');
INSERT INTO `randproppointsdbc` VALUES ('181', '142', '106', '79', '61', '45', '124', '92', '69', '53', '39', '107', '80', '60', '46', '34');
INSERT INTO `randproppointsdbc` VALUES ('182', '143', '107', '80', '61', '45', '125', '93', '69', '53', '39', '108', '81', '60', '46', '34');
INSERT INTO `randproppointsdbc` VALUES ('183', '145', '108', '81', '62', '46', '126', '94', '70', '54', '40', '109', '81', '61', '47', '34');
INSERT INTO `randproppointsdbc` VALUES ('184', '146', '109', '81', '63', '46', '127', '94', '71', '54', '40', '111', '82', '62', '47', '35');
INSERT INTO `randproppointsdbc` VALUES ('185', '148', '110', '82', '63', '46', '128', '95', '71', '55', '40', '112', '83', '62', '48', '35');
INSERT INTO `randproppointsdbc` VALUES ('186', '149', '111', '83', '64', '47', '129', '96', '72', '55', '41', '113', '84', '63', '48', '35');
INSERT INTO `randproppointsdbc` VALUES ('187', '150', '112', '84', '64', '47', '131', '97', '73', '56', '41', '114', '84', '63', '49', '36');
INSERT INTO `randproppointsdbc` VALUES ('188', '152', '113', '85', '65', '48', '132', '98', '73', '57', '41', '115', '85', '64', '49', '36');
INSERT INTO `randproppointsdbc` VALUES ('189', '153', '114', '85', '66', '48', '133', '99', '74', '57', '42', '116', '86', '65', '50', '36');
INSERT INTO `randproppointsdbc` VALUES ('190', '155', '115', '86', '66', '49', '134', '100', '75', '58', '42', '117', '87', '65', '50', '37');
INSERT INTO `randproppointsdbc` VALUES ('191', '156', '116', '87', '67', '49', '136', '101', '76', '58', '43', '118', '88', '66', '51', '37');
INSERT INTO `randproppointsdbc` VALUES ('192', '157', '117', '88', '67', '49', '137', '102', '76', '59', '43', '119', '88', '66', '51', '37');
INSERT INTO `randproppointsdbc` VALUES ('193', '159', '118', '89', '68', '50', '138', '103', '77', '59', '43', '120', '89', '67', '52', '38');
INSERT INTO `randproppointsdbc` VALUES ('194', '160', '119', '89', '69', '50', '139', '104', '78', '60', '44', '121', '90', '68', '52', '38');
INSERT INTO `randproppointsdbc` VALUES ('195', '162', '120', '90', '69', '51', '141', '105', '78', '60', '44', '122', '91', '68', '52', '38');
INSERT INTO `randproppointsdbc` VALUES ('196', '163', '121', '91', '70', '51', '142', '106', '79', '61', '45', '124', '92', '69', '53', '39');
INSERT INTO `randproppointsdbc` VALUES ('197', '165', '123', '92', '71', '52', '143', '107', '80', '61', '45', '125', '93', '69', '53', '39');
INSERT INTO `randproppointsdbc` VALUES ('198', '167', '124', '93', '71', '52', '145', '108', '81', '62', '46', '126', '94', '70', '54', '40');
INSERT INTO `randproppointsdbc` VALUES ('199', '168', '125', '94', '72', '53', '146', '109', '81', '63', '46', '127', '94', '71', '54', '40');
INSERT INTO `randproppointsdbc` VALUES ('200', '170', '126', '95', '73', '53', '148', '110', '82', '63', '46', '128', '95', '71', '55', '40');
INSERT INTO `randproppointsdbc` VALUES ('201', '171', '127', '95', '73', '54', '149', '111', '83', '64', '47', '129', '96', '72', '55', '41');
INSERT INTO `randproppointsdbc` VALUES ('202', '173', '128', '96', '74', '54', '150', '112', '84', '64', '47', '131', '97', '73', '56', '41');
INSERT INTO `randproppointsdbc` VALUES ('203', '174', '130', '97', '75', '55', '152', '113', '85', '65', '48', '132', '98', '73', '57', '41');
INSERT INTO `randproppointsdbc` VALUES ('204', '176', '131', '98', '75', '55', '153', '114', '85', '66', '48', '133', '99', '74', '57', '42');
INSERT INTO `randproppointsdbc` VALUES ('205', '178', '132', '99', '76', '56', '155', '115', '86', '66', '49', '134', '100', '75', '58', '42');
INSERT INTO `randproppointsdbc` VALUES ('206', '179', '133', '100', '77', '56', '156', '116', '87', '67', '49', '136', '101', '76', '58', '43');
INSERT INTO `randproppointsdbc` VALUES ('207', '181', '135', '101', '78', '57', '157', '117', '88', '67', '49', '137', '102', '76', '59', '43');
INSERT INTO `randproppointsdbc` VALUES ('208', '183', '136', '102', '78', '57', '159', '118', '89', '68', '50', '138', '103', '77', '59', '43');
INSERT INTO `randproppointsdbc` VALUES ('209', '184', '137', '103', '79', '58', '160', '119', '89', '69', '50', '139', '104', '78', '60', '44');
INSERT INTO `randproppointsdbc` VALUES ('210', '186', '138', '104', '80', '59', '162', '120', '90', '69', '51', '141', '105', '78', '60', '44');
INSERT INTO `randproppointsdbc` VALUES ('211', '188', '140', '105', '81', '59', '163', '121', '91', '70', '51', '142', '106', '79', '61', '45');
INSERT INTO `randproppointsdbc` VALUES ('212', '190', '141', '106', '81', '60', '165', '123', '92', '71', '52', '143', '107', '80', '61', '45');
INSERT INTO `randproppointsdbc` VALUES ('213', '191', '142', '107', '82', '60', '167', '124', '93', '71', '52', '145', '108', '81', '62', '46');
INSERT INTO `randproppointsdbc` VALUES ('214', '193', '144', '108', '83', '61', '168', '125', '94', '72', '53', '146', '109', '81', '63', '46');
INSERT INTO `randproppointsdbc` VALUES ('215', '195', '145', '109', '84', '61', '170', '126', '95', '73', '53', '148', '110', '82', '63', '46');
INSERT INTO `randproppointsdbc` VALUES ('216', '197', '146', '110', '84', '62', '171', '127', '95', '73', '54', '149', '111', '83', '64', '47');
INSERT INTO `randproppointsdbc` VALUES ('217', '199', '148', '111', '85', '62', '173', '128', '96', '74', '54', '150', '112', '84', '64', '47');
INSERT INTO `randproppointsdbc` VALUES ('218', '201', '149', '112', '86', '63', '174', '130', '97', '75', '55', '152', '113', '85', '65', '48');
INSERT INTO `randproppointsdbc` VALUES ('219', '202', '150', '113', '87', '64', '176', '131', '98', '75', '55', '153', '114', '85', '66', '48');
INSERT INTO `randproppointsdbc` VALUES ('220', '204', '152', '114', '88', '64', '178', '132', '99', '76', '56', '155', '115', '86', '66', '49');
INSERT INTO `randproppointsdbc` VALUES ('221', '206', '153', '115', '88', '65', '179', '133', '100', '77', '56', '156', '116', '87', '67', '49');
INSERT INTO `randproppointsdbc` VALUES ('222', '208', '155', '116', '89', '65', '181', '135', '101', '78', '57', '157', '117', '88', '67', '49');
INSERT INTO `randproppointsdbc` VALUES ('223', '210', '156', '117', '90', '66', '183', '136', '102', '78', '57', '159', '118', '89', '68', '50');
INSERT INTO `randproppointsdbc` VALUES ('224', '212', '158', '118', '91', '67', '184', '137', '103', '79', '58', '160', '119', '89', '69', '50');
INSERT INTO `randproppointsdbc` VALUES ('225', '214', '159', '119', '92', '67', '186', '138', '104', '80', '59', '162', '120', '90', '69', '51');
INSERT INTO `randproppointsdbc` VALUES ('226', '216', '161', '120', '93', '68', '188', '140', '105', '81', '59', '163', '121', '91', '70', '51');
INSERT INTO `randproppointsdbc` VALUES ('227', '218', '162', '122', '93', '69', '190', '141', '106', '81', '60', '165', '123', '92', '71', '52');
INSERT INTO `randproppointsdbc` VALUES ('228', '220', '164', '123', '94', '69', '191', '142', '107', '82', '60', '167', '124', '93', '71', '52');
INSERT INTO `randproppointsdbc` VALUES ('229', '222', '165', '124', '95', '70', '193', '144', '108', '83', '61', '168', '125', '94', '72', '53');
INSERT INTO `randproppointsdbc` VALUES ('230', '224', '167', '125', '96', '71', '195', '145', '109', '84', '61', '170', '126', '95', '73', '53');
INSERT INTO `randproppointsdbc` VALUES ('231', '226', '168', '126', '97', '71', '197', '146', '110', '84', '62', '171', '127', '95', '73', '54');
INSERT INTO `randproppointsdbc` VALUES ('232', '229', '170', '127', '98', '72', '199', '148', '111', '85', '62', '173', '128', '96', '74', '54');
INSERT INTO `randproppointsdbc` VALUES ('233', '231', '171', '129', '99', '73', '201', '149', '112', '86', '63', '174', '130', '97', '75', '55');
INSERT INTO `randproppointsdbc` VALUES ('234', '233', '173', '130', '100', '73', '202', '150', '113', '87', '64', '176', '131', '98', '75', '55');
INSERT INTO `randproppointsdbc` VALUES ('235', '235', '175', '131', '101', '74', '204', '152', '114', '88', '64', '178', '132', '99', '76', '56');
INSERT INTO `randproppointsdbc` VALUES ('236', '237', '176', '132', '102', '75', '206', '153', '115', '88', '65', '179', '133', '100', '77', '56');
INSERT INTO `randproppointsdbc` VALUES ('237', '239', '178', '133', '103', '75', '208', '155', '116', '89', '65', '181', '135', '101', '78', '57');
INSERT INTO `randproppointsdbc` VALUES ('238', '242', '180', '135', '104', '76', '210', '156', '117', '90', '66', '183', '136', '102', '78', '57');
INSERT INTO `randproppointsdbc` VALUES ('239', '244', '181', '136', '105', '77', '212', '158', '118', '91', '67', '184', '137', '103', '79', '58');
INSERT INTO `randproppointsdbc` VALUES ('240', '246', '183', '137', '106', '77', '214', '159', '119', '92', '67', '186', '138', '104', '80', '59');
INSERT INTO `randproppointsdbc` VALUES ('241', '249', '185', '138', '107', '78', '216', '161', '120', '93', '68', '188', '140', '105', '81', '59');
INSERT INTO `randproppointsdbc` VALUES ('242', '251', '186', '140', '108', '79', '218', '162', '122', '93', '69', '190', '141', '106', '81', '60');
INSERT INTO `randproppointsdbc` VALUES ('243', '253', '188', '141', '109', '80', '220', '164', '123', '94', '69', '191', '142', '107', '82', '60');
INSERT INTO `randproppointsdbc` VALUES ('244', '256', '190', '142', '110', '80', '222', '165', '124', '95', '70', '193', '144', '108', '83', '61');
INSERT INTO `randproppointsdbc` VALUES ('245', '258', '192', '144', '111', '81', '224', '167', '125', '96', '71', '195', '145', '109', '84', '61');
INSERT INTO `randproppointsdbc` VALUES ('246', '260', '193', '145', '112', '82', '226', '168', '126', '97', '71', '197', '146', '110', '84', '62');
INSERT INTO `randproppointsdbc` VALUES ('247', '263', '195', '146', '113', '83', '229', '170', '127', '98', '72', '199', '148', '111', '85', '62');
INSERT INTO `randproppointsdbc` VALUES ('248', '265', '197', '148', '114', '83', '231', '171', '129', '99', '73', '201', '149', '112', '86', '63');
INSERT INTO `randproppointsdbc` VALUES ('249', '268', '199', '149', '115', '84', '233', '173', '130', '100', '73', '202', '150', '113', '87', '64');
INSERT INTO `randproppointsdbc` VALUES ('250', '270', '201', '151', '116', '85', '235', '175', '131', '101', '74', '204', '152', '114', '88', '64');
INSERT INTO `randproppointsdbc` VALUES ('251', '273', '203', '152', '117', '86', '237', '176', '132', '102', '75', '206', '153', '115', '88', '65');
INSERT INTO `randproppointsdbc` VALUES ('252', '275', '205', '153', '118', '87', '239', '178', '133', '103', '75', '208', '155', '116', '89', '65');
INSERT INTO `randproppointsdbc` VALUES ('253', '278', '206', '155', '119', '87', '242', '180', '135', '104', '76', '210', '156', '117', '90', '66');
INSERT INTO `randproppointsdbc` VALUES ('254', '281', '208', '156', '120', '88', '244', '181', '136', '105', '77', '212', '158', '118', '91', '67');
INSERT INTO `randproppointsdbc` VALUES ('255', '283', '210', '158', '121', '89', '246', '183', '137', '106', '77', '214', '159', '119', '92', '67');
INSERT INTO `randproppointsdbc` VALUES ('256', '286', '212', '159', '123', '90', '249', '185', '138', '107', '78', '216', '161', '120', '93', '68');
INSERT INTO `randproppointsdbc` VALUES ('257', '289', '214', '161', '124', '91', '251', '186', '140', '108', '79', '218', '162', '122', '93', '69');
INSERT INTO `randproppointsdbc` VALUES ('258', '291', '216', '162', '125', '92', '253', '188', '141', '109', '80', '220', '164', '123', '94', '69');
INSERT INTO `randproppointsdbc` VALUES ('259', '294', '218', '164', '126', '92', '256', '190', '142', '110', '80', '222', '165', '124', '95', '70');
INSERT INTO `randproppointsdbc` VALUES ('260', '297', '220', '165', '127', '93', '258', '192', '144', '111', '81', '224', '167', '125', '96', '71');
INSERT INTO `randproppointsdbc` VALUES ('261', '299', '222', '167', '128', '94', '260', '193', '145', '112', '82', '226', '168', '126', '97', '71');
INSERT INTO `randproppointsdbc` VALUES ('262', '302', '225', '168', '130', '95', '263', '195', '146', '113', '83', '229', '170', '127', '98', '72');
INSERT INTO `randproppointsdbc` VALUES ('263', '305', '227', '170', '131', '96', '265', '197', '148', '114', '83', '231', '171', '129', '99', '73');
INSERT INTO `randproppointsdbc` VALUES ('264', '308', '229', '172', '132', '97', '268', '199', '149', '115', '84', '233', '173', '130', '100', '73');
INSERT INTO `randproppointsdbc` VALUES ('265', '311', '231', '173', '133', '98', '270', '201', '151', '116', '85', '235', '175', '131', '101', '74');
INSERT INTO `randproppointsdbc` VALUES ('266', '314', '233', '175', '134', '99', '273', '203', '152', '117', '86', '237', '176', '132', '102', '75');
INSERT INTO `randproppointsdbc` VALUES ('267', '317', '235', '176', '136', '100', '275', '205', '153', '118', '87', '239', '178', '133', '103', '75');
INSERT INTO `randproppointsdbc` VALUES ('268', '320', '237', '178', '137', '100', '278', '206', '155', '119', '87', '242', '180', '135', '104', '76');
INSERT INTO `randproppointsdbc` VALUES ('269', '323', '240', '180', '138', '101', '281', '208', '156', '120', '88', '244', '181', '136', '105', '77');
INSERT INTO `randproppointsdbc` VALUES ('270', '326', '242', '181', '140', '102', '283', '210', '158', '121', '89', '246', '183', '137', '106', '77');
INSERT INTO `randproppointsdbc` VALUES ('271', '329', '244', '183', '141', '103', '286', '212', '159', '123', '90', '249', '185', '138', '107', '78');
INSERT INTO `randproppointsdbc` VALUES ('272', '332', '246', '185', '142', '104', '289', '214', '161', '124', '91', '251', '186', '140', '108', '79');
INSERT INTO `randproppointsdbc` VALUES ('273', '335', '249', '187', '144', '105', '291', '216', '162', '125', '92', '253', '188', '141', '109', '80');
INSERT INTO `randproppointsdbc` VALUES ('274', '338', '251', '188', '145', '106', '294', '218', '164', '126', '92', '256', '190', '142', '110', '80');
INSERT INTO `randproppointsdbc` VALUES ('275', '341', '253', '190', '146', '107', '297', '220', '165', '127', '93', '258', '192', '144', '111', '81');
INSERT INTO `randproppointsdbc` VALUES ('276', '344', '256', '192', '148', '108', '299', '222', '167', '128', '94', '260', '193', '145', '112', '82');
INSERT INTO `randproppointsdbc` VALUES ('277', '348', '258', '194', '149', '109', '302', '225', '168', '130', '95', '263', '195', '146', '113', '83');
INSERT INTO `randproppointsdbc` VALUES ('278', '351', '261', '195', '150', '110', '305', '227', '170', '131', '96', '265', '197', '148', '114', '83');
INSERT INTO `randproppointsdbc` VALUES ('279', '354', '263', '197', '152', '111', '308', '229', '172', '132', '97', '268', '199', '149', '115', '84');
INSERT INTO `randproppointsdbc` VALUES ('280', '357', '266', '199', '153', '112', '311', '231', '173', '133', '98', '270', '201', '151', '116', '85');
INSERT INTO `randproppointsdbc` VALUES ('281', '361', '268', '201', '155', '113', '314', '233', '175', '134', '99', '273', '203', '152', '117', '86');
INSERT INTO `randproppointsdbc` VALUES ('282', '364', '271', '203', '156', '114', '317', '235', '176', '136', '100', '275', '205', '153', '118', '87');
INSERT INTO `randproppointsdbc` VALUES ('283', '368', '273', '205', '158', '116', '320', '237', '178', '137', '100', '278', '206', '155', '119', '87');
INSERT INTO `randproppointsdbc` VALUES ('284', '371', '276', '207', '159', '117', '323', '240', '180', '138', '101', '281', '208', '156', '120', '88');
INSERT INTO `randproppointsdbc` VALUES ('285', '375', '278', '209', '161', '118', '326', '242', '181', '140', '102', '283', '210', '158', '121', '89');
INSERT INTO `randproppointsdbc` VALUES ('286', '378', '281', '211', '162', '119', '329', '244', '183', '141', '103', '286', '212', '159', '123', '90');
INSERT INTO `randproppointsdbc` VALUES ('287', '382', '283', '213', '164', '120', '332', '246', '185', '142', '104', '289', '214', '161', '124', '91');
INSERT INTO `randproppointsdbc` VALUES ('288', '385', '286', '215', '165', '121', '335', '249', '187', '144', '105', '291', '216', '162', '125', '92');
INSERT INTO `randproppointsdbc` VALUES ('289', '389', '289', '217', '167', '122', '338', '251', '188', '145', '106', '294', '218', '164', '126', '92');
INSERT INTO `randproppointsdbc` VALUES ('290', '392', '291', '219', '168', '123', '341', '253', '190', '146', '107', '297', '220', '165', '127', '93');
INSERT INTO `randproppointsdbc` VALUES ('291', '396', '294', '221', '170', '124', '344', '256', '192', '148', '108', '299', '222', '167', '128', '94');
INSERT INTO `randproppointsdbc` VALUES ('292', '400', '297', '223', '171', '126', '348', '258', '194', '149', '109', '302', '225', '168', '130', '95');
INSERT INTO `randproppointsdbc` VALUES ('293', '404', '300', '225', '173', '127', '351', '261', '195', '150', '110', '305', '227', '170', '131', '96');
INSERT INTO `randproppointsdbc` VALUES ('294', '407', '303', '227', '175', '128', '354', '263', '197', '152', '111', '308', '229', '172', '132', '97');
INSERT INTO `randproppointsdbc` VALUES ('295', '411', '305', '229', '176', '129', '357', '266', '199', '153', '112', '311', '231', '173', '133', '98');
INSERT INTO `randproppointsdbc` VALUES ('296', '415', '308', '231', '178', '130', '361', '268', '201', '155', '113', '314', '233', '175', '134', '99');
INSERT INTO `randproppointsdbc` VALUES ('297', '419', '311', '233', '179', '132', '364', '271', '203', '156', '114', '317', '235', '176', '136', '100');
INSERT INTO `randproppointsdbc` VALUES ('298', '423', '314', '236', '181', '133', '368', '273', '205', '158', '116', '320', '237', '178', '137', '100');
INSERT INTO `randproppointsdbc` VALUES ('299', '427', '317', '238', '183', '134', '371', '276', '207', '159', '117', '323', '240', '180', '138', '101');
INSERT INTO `randproppointsdbc` VALUES ('300', '431', '320', '240', '185', '135', '375', '278', '209', '161', '118', '326', '242', '181', '140', '102');
