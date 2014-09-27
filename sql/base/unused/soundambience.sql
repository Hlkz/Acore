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
-- Table structure for table `soundambience`
--

DROP TABLE IF EXISTS `soundambience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soundambience` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `SoundDay` int(10) NOT NULL DEFAULT '0',
  `SoundNight` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soundambience`
--

LOCK TABLES `soundambience` WRITE;
/*!40000 ALTER TABLE `soundambience` DISABLE KEYS */;
/*!40000 ALTER TABLE `soundambience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `soundambience`
--

INSERT INTO `soundambience` VALUES ('21', '4162', '4162');
INSERT INTO `soundambience` VALUES ('22', '4163', '4204');
INSERT INTO `soundambience` VALUES ('24', '4164', '4165');
INSERT INTO `soundambience` VALUES ('25', '4166', '4167');
INSERT INTO `soundambience` VALUES ('26', '4168', '4168');
INSERT INTO `soundambience` VALUES ('27', '4169', '4169');
INSERT INTO `soundambience` VALUES ('28', '4170', '4171');
INSERT INTO `soundambience` VALUES ('29', '4172', '4173');
INSERT INTO `soundambience` VALUES ('30', '4174', '4175');
INSERT INTO `soundambience` VALUES ('31', '4176', '4177');
INSERT INTO `soundambience` VALUES ('32', '4178', '4179');
INSERT INTO `soundambience` VALUES ('33', '4180', '4181');
INSERT INTO `soundambience` VALUES ('34', '4182', '4182');
INSERT INTO `soundambience` VALUES ('35', '4183', '4184');
INSERT INTO `soundambience` VALUES ('36', '4185', '4186');
INSERT INTO `soundambience` VALUES ('37', '4187', '4188');
INSERT INTO `soundambience` VALUES ('38', '4189', '4190');
INSERT INTO `soundambience` VALUES ('39', '4191', '4192');
INSERT INTO `soundambience` VALUES ('40', '4193', '4194');
INSERT INTO `soundambience` VALUES ('41', '4195', '4195');
INSERT INTO `soundambience` VALUES ('42', '4196', '4197');
INSERT INTO `soundambience` VALUES ('43', '4198', '4199');
INSERT INTO `soundambience` VALUES ('44', '4200', '4201');
INSERT INTO `soundambience` VALUES ('45', '4202', '4203');
INSERT INTO `soundambience` VALUES ('46', '4205', '4206');
INSERT INTO `soundambience` VALUES ('47', '4207', '4208');
INSERT INTO `soundambience` VALUES ('48', '4210', '4211');
INSERT INTO `soundambience` VALUES ('49', '4212', '4213');
INSERT INTO `soundambience` VALUES ('50', '4214', '4214');
INSERT INTO `soundambience` VALUES ('51', '4215', '4215');
INSERT INTO `soundambience` VALUES ('52', '4216', '4216');
INSERT INTO `soundambience` VALUES ('53', '4217', '4217');
INSERT INTO `soundambience` VALUES ('54', '4218', '4218');
INSERT INTO `soundambience` VALUES ('55', '4220', '4220');
INSERT INTO `soundambience` VALUES ('56', '4219', '4219');
INSERT INTO `soundambience` VALUES ('57', '4221', '4221');
INSERT INTO `soundambience` VALUES ('58', '4223', '4223');
INSERT INTO `soundambience` VALUES ('59', '4224', '4224');
INSERT INTO `soundambience` VALUES ('60', '4225', '4225');
INSERT INTO `soundambience` VALUES ('70', '4234', '4234');
INSERT INTO `soundambience` VALUES ('71', '4235', '4235');
INSERT INTO `soundambience` VALUES ('90', '4256', '4256');
INSERT INTO `soundambience` VALUES ('110', '4322', '4322');
INSERT INTO `soundambience` VALUES ('130', '4334', '4334');
INSERT INTO `soundambience` VALUES ('150', '4375', '4375');
INSERT INTO `soundambience` VALUES ('170', '4394', '4394');
INSERT INTO `soundambience` VALUES ('190', '4515', '4515');
INSERT INTO `soundambience` VALUES ('210', '4994', '4994');
INSERT INTO `soundambience` VALUES ('230', '5034', '5034');
INSERT INTO `soundambience` VALUES ('250', '5555', '5555');
INSERT INTO `soundambience` VALUES ('270', '6597', '6597');
INSERT INTO `soundambience` VALUES ('271', '6599', '6599');
INSERT INTO `soundambience` VALUES ('290', '6754', '6754');
INSERT INTO `soundambience` VALUES ('291', '6755', '6755');
INSERT INTO `soundambience` VALUES ('310', '6854', '6854');
INSERT INTO `soundambience` VALUES ('330', '7359', '7359');
INSERT INTO `soundambience` VALUES ('350', '8112', '8112');
INSERT INTO `soundambience` VALUES ('351', '8472', '8471');
INSERT INTO `soundambience` VALUES ('352', '8530', '8530');
INSERT INTO `soundambience` VALUES ('353', '8532', '8532');
INSERT INTO `soundambience` VALUES ('354', '8539', '8539');
INSERT INTO `soundambience` VALUES ('355', '8565', '8565');
INSERT INTO `soundambience` VALUES ('356', '8670', '8670');
INSERT INTO `soundambience` VALUES ('357', '8675', '8675');
INSERT INTO `soundambience` VALUES ('358', '8676', '8676');
INSERT INTO `soundambience` VALUES ('359', '8677', '8677');
INSERT INTO `soundambience` VALUES ('360', '8678', '8678');
INSERT INTO `soundambience` VALUES ('361', '8679', '8679');
INSERT INTO `soundambience` VALUES ('362', '8680', '8680');
INSERT INTO `soundambience` VALUES ('363', '8695', '8696');
INSERT INTO `soundambience` VALUES ('364', '8748', '8749');
INSERT INTO `soundambience` VALUES ('365', '8750', '8751');
INSERT INTO `soundambience` VALUES ('366', '8948', '8949');
INSERT INTO `soundambience` VALUES ('367', '8950', '8950');
INSERT INTO `soundambience` VALUES ('368', '8951', '8952');
INSERT INTO `soundambience` VALUES ('369', '8953', '8954');
INSERT INTO `soundambience` VALUES ('370', '8956', '8956');
INSERT INTO `soundambience` VALUES ('371', '8962', '8962');
INSERT INTO `soundambience` VALUES ('372', '8963', '8963');
INSERT INTO `soundambience` VALUES ('373', '8981', '8981');
INSERT INTO `soundambience` VALUES ('374', '9004', '9004');
INSERT INTO `soundambience` VALUES ('375', '9005', '9005');
INSERT INTO `soundambience` VALUES ('376', '9010', '9011');
INSERT INTO `soundambience` VALUES ('377', '9014', '9014');
INSERT INTO `soundambience` VALUES ('378', '9015', '9015');
INSERT INTO `soundambience` VALUES ('379', '9016', '9016');
INSERT INTO `soundambience` VALUES ('380', '9017', '9017');
INSERT INTO `soundambience` VALUES ('381', '9022', '9022');
INSERT INTO `soundambience` VALUES ('382', '9023', '9023');
INSERT INTO `soundambience` VALUES ('383', '9025', '9025');
INSERT INTO `soundambience` VALUES ('384', '9026', '9026');
INSERT INTO `soundambience` VALUES ('385', '9027', '9027');
INSERT INTO `soundambience` VALUES ('386', '9028', '9028');
INSERT INTO `soundambience` VALUES ('387', '9030', '9030');
INSERT INTO `soundambience` VALUES ('388', '9029', '9029');
INSERT INTO `soundambience` VALUES ('389', '9034', '9034');
INSERT INTO `soundambience` VALUES ('390', '9033', '9033');
INSERT INTO `soundambience` VALUES ('392', '9048', '9049');
INSERT INTO `soundambience` VALUES ('393', '9050', '9050');
INSERT INTO `soundambience` VALUES ('394', '9051', '9052');
INSERT INTO `soundambience` VALUES ('395', '9061', '9062');
INSERT INTO `soundambience` VALUES ('396', '9071', '9071');
INSERT INTO `soundambience` VALUES ('397', '9126', '9127');
INSERT INTO `soundambience` VALUES ('398', '9131', '9132');
INSERT INTO `soundambience` VALUES ('399', '9133', '9133');
INSERT INTO `soundambience` VALUES ('400', '9148', '9148');
INSERT INTO `soundambience` VALUES ('401', '9984', '9984');
INSERT INTO `soundambience` VALUES ('402', '9990', '9990');
INSERT INTO `soundambience` VALUES ('403', '9996', '9996');
INSERT INTO `soundambience` VALUES ('404', '9997', '9997');
INSERT INTO `soundambience` VALUES ('405', '10000', '10000');
INSERT INTO `soundambience` VALUES ('406', '10140', '10140');
INSERT INTO `soundambience` VALUES ('407', '10141', '10141');
INSERT INTO `soundambience` VALUES ('408', '10142', '10142');
INSERT INTO `soundambience` VALUES ('409', '10143', '10143');
INSERT INTO `soundambience` VALUES ('410', '10144', '10145');
INSERT INTO `soundambience` VALUES ('411', '10162', '10162');
INSERT INTO `soundambience` VALUES ('412', '10337', '10337');
INSERT INTO `soundambience` VALUES ('413', '10377', '10377');
INSERT INTO `soundambience` VALUES ('414', '10398', '10398');
INSERT INTO `soundambience` VALUES ('415', '10399', '10399');
INSERT INTO `soundambience` VALUES ('416', '10481', '10481');
INSERT INTO `soundambience` VALUES ('417', '10567', '10567');
INSERT INTO `soundambience` VALUES ('418', '10568', '10568');
INSERT INTO `soundambience` VALUES ('419', '10569', '10569');
INSERT INTO `soundambience` VALUES ('420', '10570', '10570');
INSERT INTO `soundambience` VALUES ('421', '10588', '10588');
INSERT INTO `soundambience` VALUES ('422', '10587', '10587');
INSERT INTO `soundambience` VALUES ('423', '10819', '10819');
INSERT INTO `soundambience` VALUES ('424', '10956', '10956');
INSERT INTO `soundambience` VALUES ('425', '10957', '10957');
INSERT INTO `soundambience` VALUES ('426', '10958', '10958');
INSERT INTO `soundambience` VALUES ('427', '10970', '10970');
INSERT INTO `soundambience` VALUES ('428', '11647', '11647');
INSERT INTO `soundambience` VALUES ('429', '11838', '11839');
INSERT INTO `soundambience` VALUES ('430', '11878', '11878');
INSERT INTO `soundambience` VALUES ('432', '11900', '11900');
INSERT INTO `soundambience` VALUES ('433', '12250', '12250');
INSERT INTO `soundambience` VALUES ('434', '12251', '12251');
INSERT INTO `soundambience` VALUES ('435', '12316', '12316');
INSERT INTO `soundambience` VALUES ('436', '12317', '12317');
INSERT INTO `soundambience` VALUES ('437', '12546', '12557');
INSERT INTO `soundambience` VALUES ('438', '12547', '12555');
INSERT INTO `soundambience` VALUES ('439', '12553', '12556');
INSERT INTO `soundambience` VALUES ('440', '12554', '12554');
INSERT INTO `soundambience` VALUES ('441', '12688', '12689');
INSERT INTO `soundambience` VALUES ('442', '12690', '12690');
INSERT INTO `soundambience` VALUES ('443', '12691', '12691');
INSERT INTO `soundambience` VALUES ('444', '12740', '12740');
INSERT INTO `soundambience` VALUES ('445', '12741', '12741');
INSERT INTO `soundambience` VALUES ('446', '12752', '12752');
INSERT INTO `soundambience` VALUES ('447', '12753', '12753');
INSERT INTO `soundambience` VALUES ('448', '12754', '12754');
INSERT INTO `soundambience` VALUES ('449', '12755', '12755');
INSERT INTO `soundambience` VALUES ('450', '12757', '12757');
INSERT INTO `soundambience` VALUES ('451', '12702', '12702');
INSERT INTO `soundambience` VALUES ('452', '12763', '12763');
INSERT INTO `soundambience` VALUES ('453', '12768', '12768');
INSERT INTO `soundambience` VALUES ('454', '12769', '12769');
INSERT INTO `soundambience` VALUES ('455', '12770', '12770');
INSERT INTO `soundambience` VALUES ('456', '12772', '12772');
INSERT INTO `soundambience` VALUES ('457', '12778', '12777');
INSERT INTO `soundambience` VALUES ('458', '12776', '12776');
INSERT INTO `soundambience` VALUES ('459', '12789', '12789');
INSERT INTO `soundambience` VALUES ('460', '12693', '12693');
INSERT INTO `soundambience` VALUES ('461', '12864', '12865');
INSERT INTO `soundambience` VALUES ('462', '4160', '4160');
INSERT INTO `soundambience` VALUES ('463', '13111', '13112');
INSERT INTO `soundambience` VALUES ('464', '13113', '13113');
INSERT INTO `soundambience` VALUES ('465', '13126', '13126');
INSERT INTO `soundambience` VALUES ('466', '13157', '13157');
INSERT INTO `soundambience` VALUES ('467', '13318', '13318');
INSERT INTO `soundambience` VALUES ('468', '13316', '13317');
INSERT INTO `soundambience` VALUES ('469', '13340', '13340');
INSERT INTO `soundambience` VALUES ('470', '13374', '13374');
INSERT INTO `soundambience` VALUES ('471', '13375', '13376');
INSERT INTO `soundambience` VALUES ('472', '13377', '13377');
INSERT INTO `soundambience` VALUES ('473', '13378', '13378');
INSERT INTO `soundambience` VALUES ('474', '13379', '13379');
INSERT INTO `soundambience` VALUES ('475', '13380', '13380');
INSERT INTO `soundambience` VALUES ('476', '13381', '13381');
INSERT INTO `soundambience` VALUES ('477', '13382', '13382');
INSERT INTO `soundambience` VALUES ('478', '13383', '13383');
INSERT INTO `soundambience` VALUES ('479', '13384', '13384');
INSERT INTO `soundambience` VALUES ('480', '13385', '13385');
INSERT INTO `soundambience` VALUES ('481', '13736', '13736');
INSERT INTO `soundambience` VALUES ('482', '13875', '13875');
INSERT INTO `soundambience` VALUES ('485', '15288', '15288');
INSERT INTO `soundambience` VALUES ('486', '15289', '15289');
INSERT INTO `soundambience` VALUES ('487', '15290', '15290');
INSERT INTO `soundambience` VALUES ('488', '15291', '15291');
INSERT INTO `soundambience` VALUES ('489', '15292', '15292');
INSERT INTO `soundambience` VALUES ('490', '15293', '15293');
INSERT INTO `soundambience` VALUES ('491', '15294', '15294');
INSERT INTO `soundambience` VALUES ('492', '15295', '15295');
INSERT INTO `soundambience` VALUES ('493', '15296', '15296');
INSERT INTO `soundambience` VALUES ('495', '15960', '15960');
INSERT INTO `soundambience` VALUES ('496', '15992', '15992');
INSERT INTO `soundambience` VALUES ('497', '16005', '16005');
INSERT INTO `soundambience` VALUES ('499', '16495', '16495');
INSERT INTO `soundambience` VALUES ('500', '16496', '16496');
INSERT INTO `soundambience` VALUES ('501', '16497', '16497');
INSERT INTO `soundambience` VALUES ('502', '16498', '16498');
INSERT INTO `soundambience` VALUES ('503', '16543', '16543');
INSERT INTO `soundambience` VALUES ('504', '17434', '17434');
INSERT INTO `soundambience` VALUES ('505', '17488', '17488');
