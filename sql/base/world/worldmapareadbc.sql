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
-- Table structure for table `worldmapareadbc`
--

DROP TABLE IF EXISTS `worldmapareadbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worldmapareadbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Map` int(10) NOT NULL DEFAULT '0',
  `Area` int(10) NOT NULL DEFAULT '0',
  `InternalName` varchar(100) NOT NULL DEFAULT '',
  `LocLeft` float NOT NULL DEFAULT '0',
  `LocRight` float NOT NULL DEFAULT '0',
  `LocTop` float NOT NULL DEFAULT '0',
  `LocBottom` float NOT NULL DEFAULT '0',
  `DisplayMap` int(10) NOT NULL DEFAULT '0',
  `DungeonMap` int(10) NOT NULL DEFAULT '0',
  `ParentMap` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worldmapareadbc`
--

LOCK TABLES `worldmapareadbc` WRITE;
/*!40000 ALTER TABLE `worldmapareadbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `worldmapareadbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `worldmapareadbc`
--

INSERT INTO `worldmapareadbc` VALUES ('4', '1', '14', 'Durotar', '-1962.5', '-7250', '1808.33', '-1716.67', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('9', '1', '215', 'Mulgore', '2047.92', '-3089.58', '-272.917', '-3697.92', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('11', '1', '17', 'Barrens', '2622.92', '-7510.42', '1612.5', '-5143.75', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('13', '1', '0', 'Kalimdor', '17066.6', '-19733.2', '12799.9', '-11733.3', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('14', '0', '0', 'Azeroth', '18172', '-22569.2', '11176.3', '-15973.3', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('15', '0', '36', 'Alterac', '783.333', '-2016.67', '1500', '-366.667', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('16', '0', '45', 'Arathi', '-866.667', '-4466.67', '-133.333', '-2533.33', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('17', '0', '3', 'Badlands', '-2079.17', '-4566.67', '-5889.58', '-7547.92', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('19', '0', '4', 'BlastedLands', '-1241.67', '-4591.67', '-10566.7', '-12800', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('20', '0', '85', 'Tirisfal', '3033.33', '-1485.42', '3837.5', '825', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('21', '0', '130', 'Silverpine', '3450', '-750', '1666.67', '-1133.33', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('22', '0', '28', 'WesternPlaguelands', '416.667', '-3883.33', '3366.67', '500', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('23', '0', '139', 'EasternPlaguelands', '-2287.5', '-6318.75', '3704.17', '1016.67', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('24', '0', '267', 'Hilsbrad', '1066.67', '-2133.33', '400', '-1733.33', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('26', '0', '47', 'Hinterlands', '-1575', '-5425', '1466.67', '-1100', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('27', '0', '1', 'DunMorogh', '1802.08', '-3122.92', '-3877.08', '-7160.42', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('28', '0', '51', 'SearingGorge', '-322.917', '-2554.17', '-6100', '-7587.5', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('29', '0', '46', 'BurningSteppes', '-266.667', '-3195.83', '-7031.25', '-8983.33', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('30', '0', '12', 'Elwynn', '1535.42', '-1935.42', '-7939.58', '-10254.2', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('32', '0', '41', 'DeadwindPass', '-833.333', '-3333.33', '-9866.67', '-11533.3', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('34', '0', '10', 'Duskwood', '833.333', '-1866.67', '-9716.67', '-11516.7', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('35', '0', '38', 'LochModan', '-1993.75', '-4752.08', '-4487.5', '-6327.08', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('36', '0', '44', 'Redridge', '-1570.83', '-3741.67', '-8575', '-10022.9', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('37', '0', '33', 'Stranglethorn', '2220.83', '-4160.42', '-11168.8', '-15422.9', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('38', '0', '8', 'SwampOfSorrows', '-2222.92', '-4516.67', '-9620.83', '-11150', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('39', '0', '40', 'Westfall', '3016.67', '-483.333', '-9400', '-11733.3', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('40', '0', '11', 'Wetlands', '-389.583', '-4525', '-2147.92', '-4904.17', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('41', '1', '141', 'Teldrassil', '3814.58', '-1277.08', '11831.2', '8437.5', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('42', '1', '148', 'Darkshore', '2941.67', '-3608.33', '8333.33', '3966.67', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('43', '1', '331', 'Ashenvale', '1700', '-4066.67', '4672.92', '829.167', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('61', '1', '400', 'ThousandNeedles', '-433.333', '-4833.33', '-3966.67', '-6900', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('81', '1', '406', 'StonetalonMountains', '3245.83', '-1637.5', '2916.67', '-339.583', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('101', '1', '405', 'Desolace', '4233.33', '-262.5', '452.083', '-2545.83', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('121', '1', '357', 'Feralas', '5441.67', '-1508.33', '-2366.67', '-7000', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('141', '1', '15', 'Dustwallow', '-975', '-6225', '-2033.33', '-5533.33', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('161', '1', '440', 'Tanaris', '-218.75', '-7118.75', '-5875', '-10475', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('181', '1', '16', 'Aszhara', '-3277.08', '-8347.92', '5341.67', '1960.42', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('182', '1', '361', 'Felwood', '1641.67', '-4108.33', '7133.33', '3300', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('201', '1', '490', 'UngoroCrater', '533.333', '-3166.67', '-5966.67', '-8433.33', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('241', '1', '493', 'Moonglade', '-1381.25', '-3689.58', '8491.67', '6952.08', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('261', '1', '1377', 'Silithus', '2537.5', '-945.834', '-5958.33', '-8281.25', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('281', '1', '618', 'Winterspring', '-316.667', '-7416.67', '8533.33', '3800', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('301', '0', '1519', 'Stormwind', '1722.92', '-14.5833', '-7995.83', '-9154.17', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('321', '1', '1637', 'Ogrimmar', '-3680.6', '-5083.21', '2273.88', '1338.46', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('341', '0', '1537', 'Ironforge', '-713.591', '-1504.22', '-4569.24', '-5096.85', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('362', '1', '1638', 'ThunderBluff', '516.667', '-527.083', '-850', '-1545.83', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('381', '1', '1657', 'Darnassis', '2938.36', '1880.03', '10238.3', '9532.59', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('382', '0', '1497', 'Undercity', '873.193', '-86.1824', '1877.94', '1237.84', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('401', '30', '2597', 'AlteracValley', '1781.25', '-2456.25', '1085.42', '-1739.58', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('443', '489', '3277', 'WarsongGulch', '2041.67', '895.833', '1627.08', '862.5', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('461', '529', '3358', 'ArathiBasin', '1858.33', '102.083', '1508.33', '337.5', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('462', '530', '3430', 'EversongWoods', '-4487.5', '-9412.5', '11041.7', '7758.33', '0', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('463', '530', '3433', 'Ghostlands', '-5283.33', '-8583.33', '8266.67', '6066.67', '0', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('464', '530', '3524', 'AzuremystIsle', '-10500', '-14570.8', '-2793.75', '-5508.33', '1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('465', '530', '3483', 'Hellfire', '5539.58', '375', '1481.25', '-1962.5', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('466', '530', '0', 'Expansion01', '12996', '-4468.04', '5821.36', '-5821.36', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('467', '530', '3521', 'Zangarmarsh', '9475', '4447.92', '1935.42', '-1416.67', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('471', '530', '3557', 'TheExodar', '-11066.4', '-12123.1', '-3609.68', '-4314.37', '1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('473', '530', '3520', 'ShadowmoonValley', '4225', '-1275', '-1947.92', '-5614.58', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('475', '530', '3522', 'BladesEdgeMountains', '8845.83', '3420.83', '4408.33', '791.667', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('476', '530', '3525', 'BloodmystIsle', '-10075', '-13337.5', '-758.333', '-2933.33', '1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('477', '530', '3518', 'Nagrand', '10295.8', '4770.83', '41.6667', '-3641.67', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('478', '530', '3519', 'TerokkarForest', '7083.33', '1683.33', '-1000', '-4600', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('479', '530', '3523', 'Netherstorm', '5483.33', '-91.6667', '5456.25', '1739.58', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('480', '530', '3487', 'SilvermoonCity', '-6400.75', '-7612.21', '10153.7', '9346.94', '0', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('481', '530', '3703', 'ShattrathCity', '6135.26', '4829.01', '-1473.95', '-2344.79', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('482', '566', '3820', 'NetherstormArena', '2660.42', '389.583', '2918.75', '1404.17', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('485', '571', '0', 'Northrend', '9217.15', '-8534.25', '10593.4', '-1240.89', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('486', '571', '3537', 'BoreanTundra', '8570.83', '2806.25', '4897.92', '1054.17', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('488', '571', '65', 'Dragonblight', '3627.08', '-1981.25', '5575', '1835.42', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('490', '571', '394', 'GrizzlyHills', '-1110.42', '-6360.42', '5516.67', '2016.67', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('491', '571', '495', 'HowlingFjord', '-1397.92', '-7443.75', '3116.67', '-914.583', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('492', '571', '210', 'IcecrownGlacier', '5443.75', '-827.083', '9427.08', '5245.83', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('493', '571', '3711', 'SholazarBasin', '6929.17', '2572.92', '7287.5', '4383.33', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('495', '571', '67', 'TheStormPeaks', '1841.67', '-5270.83', '10197.9', '5456.25', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('496', '571', '66', 'ZulDrak', '-600', '-5593.75', '7668.75', '4339.58', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('499', '530', '4080', 'Sunwell', '-5302.08', '-8629.17', '13568.8', '11350', '0', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('501', '571', '4197', 'LakeWintergrasp', '4329.17', '1354.17', '5716.67', '3733.33', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('502', '609', '4298', 'ScarletEnclave', '-4047.92', '-7210.42', '3087.5', '979.167', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('504', '571', '4395', 'Dalaran', '0', '0', '0', '0', '-1', '27', '510');
INSERT INTO `worldmapareadbc` VALUES ('510', '571', '2817', 'CrystalsongForest', '1443.75', '-1279.17', '6502.08', '4687.5', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('512', '607', '4384', 'StrandoftheAncients', '787.5', '-956.25', '1883.33', '720.833', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('520', '576', '4265', 'TheNexus', '0', '0', '0', '0', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('521', '595', '4100', 'CoTStratholme', '2152.08', '327.083', '2297.92', '1081.25', '-1', '-1', '0');
INSERT INTO `worldmapareadbc` VALUES ('522', '619', '4494', 'Ahnkahet', '-233.333', '-1206.25', '850', '202.083', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('523', '574', '206', 'UtgardeKeep', '0', '0', '0', '0', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('524', '575', '1196', 'UtgardePinnacle', '3275', '-3275', '2166.67', '-2200', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('525', '602', '4272', 'HallsofLightning', '2500', '-900', '2200', '-66.6667', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('526', '599', '4264', 'Ulduar77', '2766.67', '-633.333', '2200', '-66.6667', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('527', '616', '4500', 'TheEyeofEternity', '2766.67', '-633.333', '2200', '-66.6667', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('528', '578', '4228', 'Nexus80', '2337.5', '-262.5', '1956.25', '222.917', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('529', '603', '4273', 'Ulduar', '1583.33', '-1704.17', '1168.75', '-1022.92', '-1', '-1', '0');
INSERT INTO `worldmapareadbc` VALUES ('530', '604', '4416', 'Gundrak', '1310.42', '166.667', '2122.92', '1360.42', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('531', '615', '4493', 'TheObsidianSanctum', '1133.33', '-29.1667', '3616.67', '2841.67', '-1', '0', '488');
INSERT INTO `worldmapareadbc` VALUES ('532', '624', '4603', 'VaultofArchavon', '1033.33', '-1566.67', '600', '-1133.33', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('533', '601', '4277', 'AzjolNerub', '1020.83', '-52.0833', '872.917', '158.333', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('534', '600', '4196', 'DrakTharonKeep', '-377.083', '-1004.17', '-168.75', '-587.5', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('535', '533', '3456', 'Naxxramas', '-2520.83', '-4377.08', '3597.92', '2360.42', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('536', '608', '4415', 'VioletHold', '983.333', '600', '2006.25', '1750', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('540', '628', '4710', 'IsleofConquest', '525', '-2125', '1708.33', '-58.3333', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('541', '571', '4742', 'HrothgarsLanding', '2797.92', '-879.167', '10781.2', '8329.17', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('542', '650', '4723', 'TheArgentColiseum', '2100', '-500', '2200', '466.667', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('543', '649', '4722', 'TheArgentColiseum', '2100', '-500', '2200', '466.667', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('601', '632', '4809', 'TheForgeofSouls', '7033.33', '-4366.67', '6466.67', '-1133.33', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('602', '658', '4813', 'PitofSaron', '839.583', '-693.75', '1256.25', '233.333', '-1', '0', '492');
INSERT INTO `worldmapareadbc` VALUES ('603', '668', '4820', 'HallsofReflection', '7033.33', '-5966.67', '6466.67', '-2200', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('604', '631', '4812', 'IcecrownCitadel', '6366.67', '-5833.33', '5933.33', '-2200', '-1', '0', '0');
INSERT INTO `worldmapareadbc` VALUES ('609', '724', '4987', 'TheRubySanctum', '902.083', '150', '3429.17', '2927.08', '-1', '0', '0');
