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
-- Table structure for table `gtnpcmanacostscaler`
--

DROP TABLE IF EXISTS `gtnpcmanacostscaler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gtnpcmanacostscaler` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Value` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gtnpcmanacostscaler`
--

LOCK TABLES `gtnpcmanacostscaler` WRITE;
/*!40000 ALTER TABLE `gtnpcmanacostscaler` DISABLE KEYS */;
/*!40000 ALTER TABLE `gtnpcmanacostscaler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `gtnpcmanacostscaler`
--

INSERT INTO `gtnpcmanacostscaler` VALUES ('1', '0.193');
INSERT INTO `gtnpcmanacostscaler` VALUES ('2', '0.216');
INSERT INTO `gtnpcmanacostscaler` VALUES ('3', '0.264');
INSERT INTO `gtnpcmanacostscaler` VALUES ('4', '0.31');
INSERT INTO `gtnpcmanacostscaler` VALUES ('5', '0.31');
INSERT INTO `gtnpcmanacostscaler` VALUES ('6', '0.395');
INSERT INTO `gtnpcmanacostscaler` VALUES ('7', '0.436');
INSERT INTO `gtnpcmanacostscaler` VALUES ('8', '0.475');
INSERT INTO `gtnpcmanacostscaler` VALUES ('9', '0.514');
INSERT INTO `gtnpcmanacostscaler` VALUES ('10', '0.552');
INSERT INTO `gtnpcmanacostscaler` VALUES ('11', '0.588');
INSERT INTO `gtnpcmanacostscaler` VALUES ('12', '0.625');
INSERT INTO `gtnpcmanacostscaler` VALUES ('13', '0.661');
INSERT INTO `gtnpcmanacostscaler` VALUES ('14', '0.696');
INSERT INTO `gtnpcmanacostscaler` VALUES ('15', '0.766');
INSERT INTO `gtnpcmanacostscaler` VALUES ('16', '0.8');
INSERT INTO `gtnpcmanacostscaler` VALUES ('17', '0.835');
INSERT INTO `gtnpcmanacostscaler` VALUES ('18', '0.885');
INSERT INTO `gtnpcmanacostscaler` VALUES ('19', '0.919');
INSERT INTO `gtnpcmanacostscaler` VALUES ('20', '1');
INSERT INTO `gtnpcmanacostscaler` VALUES ('21', '1.034');
INSERT INTO `gtnpcmanacostscaler` VALUES ('22', '1.067');
INSERT INTO `gtnpcmanacostscaler` VALUES ('23', '1.101');
INSERT INTO `gtnpcmanacostscaler` VALUES ('24', '1.165');
INSERT INTO `gtnpcmanacostscaler` VALUES ('25', '1.229');
INSERT INTO `gtnpcmanacostscaler` VALUES ('26', '1.278');
INSERT INTO `gtnpcmanacostscaler` VALUES ('27', '1.328');
INSERT INTO `gtnpcmanacostscaler` VALUES ('28', '1.405');
INSERT INTO `gtnpcmanacostscaler` VALUES ('29', '1.522');
INSERT INTO `gtnpcmanacostscaler` VALUES ('30', '1.612');
INSERT INTO `gtnpcmanacostscaler` VALUES ('31', '1.662');
INSERT INTO `gtnpcmanacostscaler` VALUES ('32', '1.752');
INSERT INTO `gtnpcmanacostscaler` VALUES ('33', '1.805');
INSERT INTO `gtnpcmanacostscaler` VALUES ('34', '1.858');
INSERT INTO `gtnpcmanacostscaler` VALUES ('35', '1.964');
INSERT INTO `gtnpcmanacostscaler` VALUES ('36', '2.032');
INSERT INTO `gtnpcmanacostscaler` VALUES ('37', '2.126');
INSERT INTO `gtnpcmanacostscaler` VALUES ('38', '2.196');
INSERT INTO `gtnpcmanacostscaler` VALUES ('39', '2.292');
INSERT INTO `gtnpcmanacostscaler` VALUES ('40', '2.351');
INSERT INTO `gtnpcmanacostscaler` VALUES ('41', '2.446');
INSERT INTO `gtnpcmanacostscaler` VALUES ('42', '2.506');
INSERT INTO `gtnpcmanacostscaler` VALUES ('43', '2.626');
INSERT INTO `gtnpcmanacostscaler` VALUES ('44', '2.686');
INSERT INTO `gtnpcmanacostscaler` VALUES ('45', '2.782');
INSERT INTO `gtnpcmanacostscaler` VALUES ('46', '2.854');
INSERT INTO `gtnpcmanacostscaler` VALUES ('47', '2.95');
INSERT INTO `gtnpcmanacostscaler` VALUES ('48', '3.012');
INSERT INTO `gtnpcmanacostscaler` VALUES ('49', '3.074');
INSERT INTO `gtnpcmanacostscaler` VALUES ('50', '3.195');
INSERT INTO `gtnpcmanacostscaler` VALUES ('51', '3.269');
INSERT INTO `gtnpcmanacostscaler` VALUES ('52', '3.378');
INSERT INTO `gtnpcmanacostscaler` VALUES ('53', '3.475');
INSERT INTO `gtnpcmanacostscaler` VALUES ('54', '3.583');
INSERT INTO `gtnpcmanacostscaler` VALUES ('55', '3.658');
INSERT INTO `gtnpcmanacostscaler` VALUES ('56', '3.788');
INSERT INTO `gtnpcmanacostscaler` VALUES ('57', '3.863');
INSERT INTO `gtnpcmanacostscaler` VALUES ('58', '3.972');
INSERT INTO `gtnpcmanacostscaler` VALUES ('59', '4.048');
INSERT INTO `gtnpcmanacostscaler` VALUES ('60', '4.167');
INSERT INTO `gtnpcmanacostscaler` VALUES ('61', '4.266');
INSERT INTO `gtnpcmanacostscaler` VALUES ('62', '4.4');
INSERT INTO `gtnpcmanacostscaler` VALUES ('63', '4.514');
INSERT INTO `gtnpcmanacostscaler` VALUES ('64', '4.662');
INSERT INTO `gtnpcmanacostscaler` VALUES ('65', '4.768');
INSERT INTO `gtnpcmanacostscaler` VALUES ('66', '4.908');
INSERT INTO `gtnpcmanacostscaler` VALUES ('67', '5.016');
INSERT INTO `gtnpcmanacostscaler` VALUES ('68', '5.169');
INSERT INTO `gtnpcmanacostscaler` VALUES ('69', '5.292');
INSERT INTO `gtnpcmanacostscaler` VALUES ('70', '5.437');
INSERT INTO `gtnpcmanacostscaler` VALUES ('71', '5.593');
INSERT INTO `gtnpcmanacostscaler` VALUES ('72', '5.709');
INSERT INTO `gtnpcmanacostscaler` VALUES ('73', '5.858');
INSERT INTO `gtnpcmanacostscaler` VALUES ('74', '5.998');
INSERT INTO `gtnpcmanacostscaler` VALUES ('75', '6.15');
INSERT INTO `gtnpcmanacostscaler` VALUES ('76', '6.282');
INSERT INTO `gtnpcmanacostscaler` VALUES ('77', '6.415');
INSERT INTO `gtnpcmanacostscaler` VALUES ('78', '6.594');
INSERT INTO `gtnpcmanacostscaler` VALUES ('79', '6.762');
INSERT INTO `gtnpcmanacostscaler` VALUES ('80', '6.899');
INSERT INTO `gtnpcmanacostscaler` VALUES ('81', '7.082');
INSERT INTO `gtnpcmanacostscaler` VALUES ('82', '7.222');
INSERT INTO `gtnpcmanacostscaler` VALUES ('83', '7.376');
INSERT INTO `gtnpcmanacostscaler` VALUES ('84', '7.552');
INSERT INTO `gtnpcmanacostscaler` VALUES ('85', '7.697');
INSERT INTO `gtnpcmanacostscaler` VALUES ('86', '7.876');
INSERT INTO `gtnpcmanacostscaler` VALUES ('87', '8.024');
INSERT INTO `gtnpcmanacostscaler` VALUES ('88', '8.196');
INSERT INTO `gtnpcmanacostscaler` VALUES ('89', '8.347');
INSERT INTO `gtnpcmanacostscaler` VALUES ('90', '8.533');
INSERT INTO `gtnpcmanacostscaler` VALUES ('91', '8.741');
INSERT INTO `gtnpcmanacostscaler` VALUES ('92', '8.898');
INSERT INTO `gtnpcmanacostscaler` VALUES ('93', '9.055');
INSERT INTO `gtnpcmanacostscaler` VALUES ('94', '9.215');
INSERT INTO `gtnpcmanacostscaler` VALUES ('95', '9.408');
INSERT INTO `gtnpcmanacostscaler` VALUES ('96', '9.572');
INSERT INTO `gtnpcmanacostscaler` VALUES ('97', '9.736');
INSERT INTO `gtnpcmanacostscaler` VALUES ('98', '9.902');
INSERT INTO `gtnpcmanacostscaler` VALUES ('99', '10.091');
INSERT INTO `gtnpcmanacostscaler` VALUES ('100', '10.293');
