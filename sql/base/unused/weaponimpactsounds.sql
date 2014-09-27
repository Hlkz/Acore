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
-- Table structure for table `weaponimpactsounds`
--

DROP TABLE IF EXISTS `weaponimpactsounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weaponimpactsounds` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `WeaponSubClass` int(10) NOT NULL DEFAULT '0',
  `ParrySoundType` int(10) NOT NULL DEFAULT '0',
  `ImpactSound1` int(10) NOT NULL DEFAULT '0',
  `ImpactSound2` int(10) NOT NULL DEFAULT '0',
  `ImpactSound3` int(10) NOT NULL DEFAULT '0',
  `ImpactSound4` int(10) NOT NULL DEFAULT '0',
  `ImpactSound5` int(10) NOT NULL DEFAULT '0',
  `ImpactSound6` int(10) NOT NULL DEFAULT '0',
  `ImpactSound7` int(10) NOT NULL DEFAULT '0',
  `ImpactSound8` int(10) NOT NULL DEFAULT '0',
  `ImpactSound9` int(10) NOT NULL DEFAULT '0',
  `ImpactSound10` int(10) NOT NULL DEFAULT '0',
  `CritImpactSound1` int(10) NOT NULL DEFAULT '0',
  `CritImpactSound2` int(10) NOT NULL DEFAULT '0',
  `CritImpactSound3` int(10) NOT NULL DEFAULT '0',
  `CritImpactSound4` int(10) NOT NULL DEFAULT '0',
  `CritImpactSound5` int(10) NOT NULL DEFAULT '0',
  `CritImpactSound6` int(10) NOT NULL DEFAULT '0',
  `CritImpactSound7` int(10) NOT NULL DEFAULT '0',
  `CritImpactSound8` int(10) NOT NULL DEFAULT '0',
  `CritImpactSound9` int(10) NOT NULL DEFAULT '0',
  `CritImpactSound10` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weaponimpactsounds`
--

LOCK TABLES `weaponimpactsounds` WRITE;
/*!40000 ALTER TABLE `weaponimpactsounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `weaponimpactsounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `weaponimpactsounds`
--

INSERT INTO `weaponimpactsounds` VALUES ('1', '0', '1', '171', '173', '175', '3263', '3262', '1002', '1001', '3202', '3206', '3210', '172', '174', '176', '3263', '3262', '1002', '1001', '3203', '3207', '3210');
INSERT INTO `weaponimpactsounds` VALUES ('2', '1', '1', '157', '159', '161', '3263', '3262', '998', '997', '3204', '3208', '0', '158', '160', '162', '3263', '3262', '998', '997', '3205', '3209', '1211');
INSERT INTO `weaponimpactsounds` VALUES ('3', '2', '0', '143', '145', '147', '3263', '3262', '0', '0', '0', '0', '0', '144', '146', '148', '3263', '3262', '0', '0', '0', '0', '0');
INSERT INTO `weaponimpactsounds` VALUES ('4', '3', '0', '143', '145', '147', '3263', '3262', '0', '0', '0', '0', '0', '144', '146', '148', '3263', '3262', '0', '0', '0', '0', '0');
INSERT INTO `weaponimpactsounds` VALUES ('5', '4', '0', '941', '939', '945', '3263', '3262', '1000', '999', '3202', '3206', '3210', '942', '940', '946', '3263', '3262', '1000', '999', '3203', '3207', '3210');
INSERT INTO `weaponimpactsounds` VALUES ('6', '5', '0', '955', '953', '959', '3263', '3262', '996', '995', '3204', '3208', '1211', '956', '954', '960', '3263', '3262', '996', '995', '3205', '3209', '1211');
INSERT INTO `weaponimpactsounds` VALUES ('7', '6', '0', '955', '953', '959', '3263', '3262', '996', '996', '3204', '3208', '1211', '956', '954', '960', '3263', '3262', '996', '996', '3205', '3209', '1211');
INSERT INTO `weaponimpactsounds` VALUES ('8', '7', '1', '143', '145', '147', '3263', '3262', '1002', '1001', '3202', '3206', '3210', '144', '146', '148', '3263', '3262', '1002', '1001', '3203', '3207', '3210');
INSERT INTO `weaponimpactsounds` VALUES ('9', '8', '1', '129', '131', '133', '3263', '3262', '998', '997', '3204', '3208', '1211', '130', '132', '134', '3263', '3262', '998', '997', '3205', '3209', '1211');
INSERT INTO `weaponimpactsounds` VALUES ('10', '10', '0', '941', '939', '945', '3263', '3262', '1000', '999', '3204', '3208', '1211', '942', '940', '946', '3263', '3262', '1000', '999', '3205', '3209', '1211');
INSERT INTO `weaponimpactsounds` VALUES ('11', '11', '0', '143', '145', '147', '3263', '3262', '1000', '999', '3202', '3206', '3210', '144', '146', '148', '3263', '3262', '1000', '999', '3203', '3207', '3210');
INSERT INTO `weaponimpactsounds` VALUES ('12', '12', '0', '143', '145', '147', '3263', '3262', '996', '995', '3204', '3208', '1211', '144', '146', '148', '3263', '3262', '996', '995', '3205', '3209', '1211');
INSERT INTO `weaponimpactsounds` VALUES ('13', '13', '0', '1014', '1014', '1014', '3263', '3262', '1019', '1020', '3202', '3206', '3210', '1014', '1014', '1014', '3263', '3262', '1019', '1020', '3203', '3207', '3210');
INSERT INTO `weaponimpactsounds` VALUES ('14', '4', '1', '969', '967', '973', '3263', '3262', '1002', '1001', '3202', '3206', '3210', '970', '968', '974', '3263', '3262', '1002', '1001', '3203', '3207', '3210');
INSERT INTO `weaponimpactsounds` VALUES ('15', '5', '1', '983', '981', '987', '3263', '3262', '998', '997', '3204', '3208', '1211', '984', '982', '988', '3263', '3262', '998', '997', '3205', '3209', '1211');
INSERT INTO `weaponimpactsounds` VALUES ('16', '6', '1', '129', '131', '133', '3263', '3262', '998', '997', '3204', '3208', '1211', '130', '132', '134', '3263', '3262', '998', '997', '3205', '3209', '1211');
INSERT INTO `weaponimpactsounds` VALUES ('17', '7', '0', '143', '145', '147', '3263', '3262', '1000', '999', '3202', '3206', '3210', '144', '146', '148', '3263', '3262', '1000', '999', '3203', '3207', '3210');
INSERT INTO `weaponimpactsounds` VALUES ('18', '8', '0', '129', '131', '133', '3263', '3262', '996', '995', '3204', '3208', '1211', '130', '132', '134', '3263', '3262', '996', '995', '3205', '3209', '1211');
INSERT INTO `weaponimpactsounds` VALUES ('21', '15', '1', '1151', '1149', '1155', '3263', '3262', '1002', '1001', '3202', '3206', '3210', '1152', '1150', '1156', '3263', '3262', '0', '1001', '3203', '3207', '3210');
INSERT INTO `weaponimpactsounds` VALUES ('22', '15', '0', '1151', '1149', '1155', '3263', '3262', '1002', '1001', '3202', '3206', '3210', '1152', '1150', '1156', '3263', '3262', '0', '1001', '3203', '3207', '3210');
INSERT INTO `weaponimpactsounds` VALUES ('23', '10', '1', '969', '967', '973', '3263', '3262', '1002', '1001', '3204', '3208', '1211', '970', '968', '974', '3263', '3262', '1002', '1001', '3205', '3209', '1211');
INSERT INTO `weaponimpactsounds` VALUES ('24', '1', '0', '157', '159', '161', '3263', '3262', '998', '997', '3204', '3208', '1211', '158', '160', '162', '3263', '3262', '998', '997', '3205', '3209', '1211');
INSERT INTO `weaponimpactsounds` VALUES ('25', '0', '0', '171', '173', '175', '3263', '3262', '1002', '1001', '3202', '3206', '3210', '172', '174', '176', '3263', '3262', '1002', '1001', '3203', '3207', '3210');
INSERT INTO `weaponimpactsounds` VALUES ('26', '14', '0', '941', '939', '945', '3263', '3262', '1000', '999', '3202', '3206', '3210', '942', '940', '946', '3263', '3262', '1000', '999', '3203', '3207', '3210');
INSERT INTO `weaponimpactsounds` VALUES ('27', '14', '1', '969', '967', '973', '3263', '3262', '1002', '1001', '3202', '3206', '3210', '970', '968', '974', '3263', '3262', '1002', '1001', '3203', '3207', '3210');
INSERT INTO `weaponimpactsounds` VALUES ('28', '20', '0', '941', '939', '945', '3263', '3262', '1000', '999', '3204', '3208', '3210', '942', '940', '946', '3263', '3262', '1000', '999', '3205', '3209', '1211');
INSERT INTO `weaponimpactsounds` VALUES ('29', '20', '1', '969', '967', '973', '3263', '3262', '1002', '1001', '3204', '3208', '1211', '970', '968', '974', '3263', '3262', '1002', '1001', '3205', '3209', '1211');
INSERT INTO `weaponimpactsounds` VALUES ('68', '17', '0', '955', '953', '959', '3263', '3262', '996', '996', '3204', '3208', '1211', '956', '954', '960', '3263', '3262', '996', '996', '3205', '3209', '1211');
INSERT INTO `weaponimpactsounds` VALUES ('69', '17', '1', '129', '131', '133', '3263', '3262', '998', '997', '3204', '3208', '1211', '130', '132', '134', '3263', '3262', '998', '997', '3205', '3209', '1211');
INSERT INTO `weaponimpactsounds` VALUES ('88', '13', '1', '1014', '1014', '1014', '3263', '3262', '1019', '1019', '3202', '3206', '3210', '1014', '1014', '1014', '3263', '3262', '1019', '1019', '3203', '3207', '3210');
