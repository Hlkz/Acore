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
-- Table structure for table `transportrotationdbc`
--

DROP TABLE IF EXISTS `transportrotationdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportrotationdbc` (
  `Id` int(4) NOT NULL DEFAULT '0',
  `TransportEntry` int(4) DEFAULT '0',
  `TimeSeg` int(4) DEFAULT '0',
  `X` float NOT NULL DEFAULT '0',
  `Y` float NOT NULL DEFAULT '0',
  `Z` float NOT NULL DEFAULT '0',
  `W` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportrotationdbc`
--

LOCK TABLES `transportrotationdbc` WRITE;
/*!40000 ALTER TABLE `transportrotationdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportrotationdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `transportrotationdbc`
--

INSERT INTO `transportrotationdbc` VALUES ('1142', '183407', '0', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('1143', '183407', '6633', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('1144', '183407', '6833', '0', '0', '0.003566', '0.999994');
INSERT INTO `transportrotationdbc` VALUES ('1145', '183407', '7333', '0', '0', '-0.005088', '0.999987');
INSERT INTO `transportrotationdbc` VALUES ('1146', '183407', '8167', '0', '0', '-0.000535', '1');
INSERT INTO `transportrotationdbc` VALUES ('1147', '183407', '43333', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('1141', '183490', '0', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('1221', '188521', '0', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('1222', '188521', '4000', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('1223', '188521', '28000', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('601', '191278', '0', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('602', '191278', '3000', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('558', '193459', '1600', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('559', '193459', '1633', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('560', '193459', '1667', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('549', '193460', '0', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('550', '193460', '33', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('551', '193460', '67', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('1', '194301', '0', '0', '0', '0', '-1');
INSERT INTO `transportrotationdbc` VALUES ('2', '194301', '7467', '0', '0.726931', '0', '-0.686711');
INSERT INTO `transportrotationdbc` VALUES ('3', '194301', '10933', '0', '0.999424', '0', '-0.033944');
INSERT INTO `transportrotationdbc` VALUES ('4', '194301', '12167', '0', '0.723559', '0', '0.690262');
INSERT INTO `transportrotationdbc` VALUES ('5', '194301', '15733', '0', '0.015733', '0', '0.999876');
INSERT INTO `transportrotationdbc` VALUES ('6', '194301', '21067', '0', '0.012665', '0', '0.99992');
INSERT INTO `transportrotationdbc` VALUES ('7', '194301', '22833', '-0.007798', '-0.00998', '-0.615656', '-0.787914');
INSERT INTO `transportrotationdbc` VALUES ('8', '194301', '25533', '-0.012425', '0.002456', '-0.98094', '0.193898');
INSERT INTO `transportrotationdbc` VALUES ('9', '194303', '0', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('10', '194303', '8233', '0.717614', '0', '0', '-0.696441');
INSERT INTO `transportrotationdbc` VALUES ('11', '194303', '10300', '-0.485169', '0.528755', '0.513154', '0.470854');
INSERT INTO `transportrotationdbc` VALUES ('12', '194303', '11533', '-0.675307', '0.057371', '0.734586', '0.032437');
INSERT INTO `transportrotationdbc` VALUES ('13', '194303', '15667', '-0.00878', '0.020834', '0.997787', '0.062526');
INSERT INTO `transportrotationdbc` VALUES ('14', '194303', '24767', '-0.384733', '0.214714', '0.789728', '0.426859');
INSERT INTO `transportrotationdbc` VALUES ('15', '194303', '27667', '-0.010178', '0.00338', '0.365398', '0.93079');
INSERT INTO `transportrotationdbc` VALUES ('21', '194345', '0', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('22', '194345', '37700', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('23', '194345', '38933', '0', '0', '0.001038', '0.999999');
INSERT INTO `transportrotationdbc` VALUES ('24', '194345', '39333', '0', '0', '0.008239', '0.999966');
INSERT INTO `transportrotationdbc` VALUES ('25', '194345', '40133', '0', '0', '0.032957', '0.999457');
INSERT INTO `transportrotationdbc` VALUES ('26', '194345', '40733', '0', '0', '0.056806', '0.998385');
INSERT INTO `transportrotationdbc` VALUES ('27', '194345', '41400', '0', '0', '0.090315', '0.995913');
INSERT INTO `transportrotationdbc` VALUES ('28', '194345', '42133', '0', '0', '0.13452', '0.990911');
INSERT INTO `transportrotationdbc` VALUES ('29', '194345', '43067', '0', '0', '0.197159', '0.980372');
INSERT INTO `transportrotationdbc` VALUES ('30', '194345', '44133', '0', '0', '0.274934', '0.961463');
INSERT INTO `transportrotationdbc` VALUES ('31', '194345', '45467', '0', '0', '0.37852', '0.925593');
INSERT INTO `transportrotationdbc` VALUES ('32', '194345', '48067', '0', '0', '0.575864', '0.817545');
INSERT INTO `transportrotationdbc` VALUES ('33', '194345', '49167', '0', '0', '0.654187', '0.756333');
INSERT INTO `transportrotationdbc` VALUES ('34', '194345', '51667', '0', '0', '0.816882', '0.576804');
INSERT INTO `transportrotationdbc` VALUES ('35', '194345', '52700', '0', '0', '0.868458', '0.495762');
INSERT INTO `transportrotationdbc` VALUES ('36', '194345', '54667', '0', '0', '0.940861', '0.338793');
INSERT INTO `transportrotationdbc` VALUES ('37', '194345', '55433', '0', '0', '0.96002', '0.279932');
INSERT INTO `transportrotationdbc` VALUES ('38', '194345', '56400', '0', '0', '0.977255', '0.212067');
INSERT INTO `transportrotationdbc` VALUES ('39', '194345', '57567', '0', '0', '0.990907', '0.134551');
INSERT INTO `transportrotationdbc` VALUES ('40', '194345', '58433', '0', '0', '0.996507', '0.083509');
INSERT INTO `transportrotationdbc` VALUES ('41', '194345', '59067', '0', '0', '0.998678', '0.051399');
INSERT INTO `transportrotationdbc` VALUES ('42', '194345', '59767', '0', '0', '0.999698', '0.024564');
INSERT INTO `transportrotationdbc` VALUES ('43', '194345', '60333', '0', '0', '0.999971', '0.007575');
INSERT INTO `transportrotationdbc` VALUES ('44', '194345', '60767', '0', '0', '1', '0.000648');
INSERT INTO `transportrotationdbc` VALUES ('45', '194345', '102167', '0', '0', '1', '-0.00083');
INSERT INTO `transportrotationdbc` VALUES ('46', '194345', '102567', '0', '0', '0.999965', '-0.00838');
INSERT INTO `transportrotationdbc` VALUES ('47', '194345', '103367', '0', '0', '0.999396', '-0.034756');
INSERT INTO `transportrotationdbc` VALUES ('48', '194345', '103900', '0', '0', '0.998345', '-0.057501');
INSERT INTO `transportrotationdbc` VALUES ('49', '194345', '104500', '0', '0', '0.995951', '-0.089901');
INSERT INTO `transportrotationdbc` VALUES ('50', '194345', '105233', '0', '0', '0.990513', '-0.137416');
INSERT INTO `transportrotationdbc` VALUES ('51', '194345', '106000', '0', '0', '0.981309', '-0.192438');
INSERT INTO `transportrotationdbc` VALUES ('52', '194345', '106800', '0', '0', '0.966671', '-0.256023');
INSERT INTO `transportrotationdbc` VALUES ('53', '194345', '108067', '0', '0', '0.931761', '-0.363073');
INSERT INTO `transportrotationdbc` VALUES ('54', '194345', '110767', '0', '0', '-0.811569', '0.584257');
INSERT INTO `transportrotationdbc` VALUES ('55', '194345', '111800', '0', '0', '-0.748694', '0.662916');
INSERT INTO `transportrotationdbc` VALUES ('56', '194345', '114200', '0', '0', '-0.561079', '0.827762');
INSERT INTO `transportrotationdbc` VALUES ('57', '194345', '115067', '0', '0', '-0.486966', '0.873421');
INSERT INTO `transportrotationdbc` VALUES ('58', '194345', '116700', '0', '0', '-0.347403', '0.937716');
INSERT INTO `transportrotationdbc` VALUES ('59', '194345', '117433', '0', '0', '-0.286473', '0.958088');
INSERT INTO `transportrotationdbc` VALUES ('60', '194345', '118300', '0', '0', '-0.220609', '0.975362');
INSERT INTO `transportrotationdbc` VALUES ('61', '194345', '119333', '0', '0', '-0.146763', '0.989172');
INSERT INTO `transportrotationdbc` VALUES ('62', '194345', '120300', '0', '0', '-0.086352', '0.996265');
INSERT INTO `transportrotationdbc` VALUES ('63', '194345', '120933', '0', '0', '-0.051492', '0.998673');
INSERT INTO `transportrotationdbc` VALUES ('64', '194345', '121567', '0', '0', '-0.024377', '0.999703');
INSERT INTO `transportrotationdbc` VALUES ('65', '194345', '122067', '0', '0', '-0.007881', '0.999969');
INSERT INTO `transportrotationdbc` VALUES ('66', '194345', '122467', '0', '0', '-0.000751', '1');
INSERT INTO `transportrotationdbc` VALUES ('67', '194345', '128333', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('81', '194350', '33', '0', '0', '0.000004', '1');
INSERT INTO `transportrotationdbc` VALUES ('82', '194350', '37733', '0', '0', '0.000004', '1');
INSERT INTO `transportrotationdbc` VALUES ('83', '194350', '38967', '0', '0', '0.001042', '0.999999');
INSERT INTO `transportrotationdbc` VALUES ('84', '194350', '39367', '0', '0', '0.008243', '0.999966');
INSERT INTO `transportrotationdbc` VALUES ('85', '194350', '40167', '0', '0', '0.032961', '0.999457');
INSERT INTO `transportrotationdbc` VALUES ('86', '194350', '40767', '0', '0', '0.056811', '0.998385');
INSERT INTO `transportrotationdbc` VALUES ('87', '194350', '41433', '0', '0', '0.090319', '0.995913');
INSERT INTO `transportrotationdbc` VALUES ('88', '194350', '42167', '0', '0', '0.134525', '0.99091');
INSERT INTO `transportrotationdbc` VALUES ('89', '194350', '43100', '0', '0', '0.197163', '0.980371');
INSERT INTO `transportrotationdbc` VALUES ('90', '194350', '44167', '0', '0', '0.274938', '0.961462');
INSERT INTO `transportrotationdbc` VALUES ('91', '194350', '45500', '0', '0', '0.378524', '0.925592');
INSERT INTO `transportrotationdbc` VALUES ('92', '194350', '48100', '0', '0', '0.575868', '0.817543');
INSERT INTO `transportrotationdbc` VALUES ('93', '194350', '49200', '0', '0', '0.65419', '0.75633');
INSERT INTO `transportrotationdbc` VALUES ('94', '194350', '51700', '0', '0', '0.816885', '0.576801');
INSERT INTO `transportrotationdbc` VALUES ('95', '194350', '52733', '0', '0', '0.86846', '0.495759');
INSERT INTO `transportrotationdbc` VALUES ('96', '194350', '54700', '0', '0', '0.940862', '0.338789');
INSERT INTO `transportrotationdbc` VALUES ('97', '194350', '55467', '0', '0', '0.960021', '0.279928');
INSERT INTO `transportrotationdbc` VALUES ('98', '194350', '56433', '0', '0', '0.977256', '0.212063');
INSERT INTO `transportrotationdbc` VALUES ('99', '194350', '57600', '0', '0', '0.990907', '0.134547');
INSERT INTO `transportrotationdbc` VALUES ('100', '194350', '58467', '0', '0', '0.996507', '0.083505');
INSERT INTO `transportrotationdbc` VALUES ('101', '194350', '59100', '0', '0', '0.998678', '0.051395');
INSERT INTO `transportrotationdbc` VALUES ('102', '194350', '59800', '0', '0', '0.999698', '0.02456');
INSERT INTO `transportrotationdbc` VALUES ('103', '194350', '60367', '0', '0', '0.999971', '0.007571');
INSERT INTO `transportrotationdbc` VALUES ('104', '194350', '60800', '0', '0', '1', '0.000644');
INSERT INTO `transportrotationdbc` VALUES ('105', '194350', '102200', '0', '0', '1', '-0.000834');
INSERT INTO `transportrotationdbc` VALUES ('106', '194350', '102600', '0', '0', '0.999965', '-0.008384');
INSERT INTO `transportrotationdbc` VALUES ('107', '194350', '103400', '0', '0', '0.999396', '-0.03476');
INSERT INTO `transportrotationdbc` VALUES ('108', '194350', '103933', '0', '0', '0.998345', '-0.057505');
INSERT INTO `transportrotationdbc` VALUES ('109', '194350', '104533', '0', '0', '0.99595', '-0.089906');
INSERT INTO `transportrotationdbc` VALUES ('110', '194350', '105267', '0', '0', '0.990513', '-0.13742');
INSERT INTO `transportrotationdbc` VALUES ('111', '194350', '106033', '0', '0', '0.981308', '-0.192442');
INSERT INTO `transportrotationdbc` VALUES ('112', '194350', '106833', '0', '0', '0.96667', '-0.256027');
INSERT INTO `transportrotationdbc` VALUES ('113', '194350', '108100', '0', '0', '0.931759', '-0.363077');
INSERT INTO `transportrotationdbc` VALUES ('114', '194350', '110800', '0', '0', '-0.811566', '0.584261');
INSERT INTO `transportrotationdbc` VALUES ('115', '194350', '111833', '0', '0', '-0.748691', '0.662919');
INSERT INTO `transportrotationdbc` VALUES ('116', '194350', '114233', '0', '0', '-0.561076', '0.827765');
INSERT INTO `transportrotationdbc` VALUES ('117', '194350', '115100', '0', '0', '-0.486962', '0.873423');
INSERT INTO `transportrotationdbc` VALUES ('118', '194350', '116733', '0', '0', '-0.347399', '0.937717');
INSERT INTO `transportrotationdbc` VALUES ('119', '194350', '117467', '0', '0', '-0.286469', '0.958089');
INSERT INTO `transportrotationdbc` VALUES ('120', '194350', '118333', '0', '0', '-0.220605', '0.975363');
INSERT INTO `transportrotationdbc` VALUES ('121', '194350', '119367', '0', '0', '-0.146759', '0.989172');
INSERT INTO `transportrotationdbc` VALUES ('122', '194350', '120333', '0', '0', '-0.086348', '0.996265');
INSERT INTO `transportrotationdbc` VALUES ('123', '194350', '120967', '0', '0', '-0.051488', '0.998674');
INSERT INTO `transportrotationdbc` VALUES ('124', '194350', '121600', '0', '0', '-0.024373', '0.999703');
INSERT INTO `transportrotationdbc` VALUES ('125', '194350', '122100', '0', '0', '-0.007877', '0.999969');
INSERT INTO `transportrotationdbc` VALUES ('126', '194350', '122500', '0', '0', '-0.000747', '1');
INSERT INTO `transportrotationdbc` VALUES ('127', '194350', '128367', '0', '0', '0.000004', '1');
INSERT INTO `transportrotationdbc` VALUES ('301', '194369', '0', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('302', '194369', '33', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('303', '194369', '37733', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('304', '194369', '38967', '0', '0', '0.001038', '0.999999');
INSERT INTO `transportrotationdbc` VALUES ('305', '194369', '39367', '0', '0', '0.008239', '0.999966');
INSERT INTO `transportrotationdbc` VALUES ('306', '194369', '40167', '0', '0', '0.032957', '0.999457');
INSERT INTO `transportrotationdbc` VALUES ('307', '194369', '40767', '0', '0', '0.056806', '0.998385');
INSERT INTO `transportrotationdbc` VALUES ('308', '194369', '41433', '0', '0', '0.090315', '0.995913');
INSERT INTO `transportrotationdbc` VALUES ('309', '194369', '42167', '0', '0', '0.13452', '0.990911');
INSERT INTO `transportrotationdbc` VALUES ('310', '194369', '43100', '0', '0', '0.197159', '0.980372');
INSERT INTO `transportrotationdbc` VALUES ('311', '194369', '44167', '0', '0', '0.274934', '0.961463');
INSERT INTO `transportrotationdbc` VALUES ('312', '194369', '45500', '0', '0', '0.37852', '0.925593');
INSERT INTO `transportrotationdbc` VALUES ('313', '194369', '48100', '0', '0', '0.575864', '0.817545');
INSERT INTO `transportrotationdbc` VALUES ('314', '194369', '49200', '0', '0', '0.654187', '0.756333');
INSERT INTO `transportrotationdbc` VALUES ('315', '194369', '51700', '0', '0', '0.816882', '0.576804');
INSERT INTO `transportrotationdbc` VALUES ('316', '194369', '52733', '0', '0', '0.868458', '0.495762');
INSERT INTO `transportrotationdbc` VALUES ('317', '194369', '54700', '0', '0', '0.940861', '0.338793');
INSERT INTO `transportrotationdbc` VALUES ('318', '194369', '55467', '0', '0', '0.96002', '0.279932');
INSERT INTO `transportrotationdbc` VALUES ('319', '194369', '56433', '0', '0', '0.977255', '0.212067');
INSERT INTO `transportrotationdbc` VALUES ('320', '194369', '57600', '0', '0', '0.990907', '0.134551');
INSERT INTO `transportrotationdbc` VALUES ('321', '194369', '58467', '0', '0', '0.996507', '0.083509');
INSERT INTO `transportrotationdbc` VALUES ('322', '194369', '59100', '0', '0', '0.998678', '0.051399');
INSERT INTO `transportrotationdbc` VALUES ('323', '194369', '59800', '0', '0', '0.999698', '0.024564');
INSERT INTO `transportrotationdbc` VALUES ('324', '194369', '60367', '0', '0', '0.999971', '0.007575');
INSERT INTO `transportrotationdbc` VALUES ('325', '194369', '60800', '0', '0', '1', '0.000648');
INSERT INTO `transportrotationdbc` VALUES ('326', '194369', '102200', '0', '0', '1', '-0.00083');
INSERT INTO `transportrotationdbc` VALUES ('327', '194369', '102600', '0', '0', '0.999965', '-0.00838');
INSERT INTO `transportrotationdbc` VALUES ('328', '194369', '103400', '0', '0', '0.999396', '-0.034756');
INSERT INTO `transportrotationdbc` VALUES ('329', '194369', '103933', '0', '0', '0.998345', '-0.057501');
INSERT INTO `transportrotationdbc` VALUES ('330', '194369', '104533', '0', '0', '0.995951', '-0.089901');
INSERT INTO `transportrotationdbc` VALUES ('331', '194369', '105267', '0', '0', '0.990513', '-0.137416');
INSERT INTO `transportrotationdbc` VALUES ('332', '194369', '106033', '0', '0', '0.981309', '-0.192438');
INSERT INTO `transportrotationdbc` VALUES ('333', '194369', '106833', '0', '0', '0.966671', '-0.256023');
INSERT INTO `transportrotationdbc` VALUES ('334', '194369', '108100', '0', '0', '0.931761', '-0.363073');
INSERT INTO `transportrotationdbc` VALUES ('335', '194369', '110800', '0', '0', '-0.811569', '0.584257');
INSERT INTO `transportrotationdbc` VALUES ('336', '194369', '111833', '0', '0', '-0.748694', '0.662916');
INSERT INTO `transportrotationdbc` VALUES ('337', '194369', '114233', '0', '0', '-0.561079', '0.827762');
INSERT INTO `transportrotationdbc` VALUES ('338', '194369', '115100', '0', '0', '-0.486966', '0.873421');
INSERT INTO `transportrotationdbc` VALUES ('339', '194369', '116733', '0', '0', '-0.347403', '0.937716');
INSERT INTO `transportrotationdbc` VALUES ('340', '194369', '117467', '0', '0', '-0.286473', '0.958088');
INSERT INTO `transportrotationdbc` VALUES ('341', '194369', '118333', '0', '0', '-0.220609', '0.975362');
INSERT INTO `transportrotationdbc` VALUES ('342', '194369', '119367', '0', '0', '-0.146763', '0.989172');
INSERT INTO `transportrotationdbc` VALUES ('343', '194369', '120333', '0', '0', '-0.086352', '0.996265');
INSERT INTO `transportrotationdbc` VALUES ('344', '194369', '120967', '0', '0', '-0.051492', '0.998673');
INSERT INTO `transportrotationdbc` VALUES ('345', '194369', '121600', '0', '0', '-0.024377', '0.999703');
INSERT INTO `transportrotationdbc` VALUES ('346', '194369', '122100', '0', '0', '-0.007881', '0.999969');
INSERT INTO `transportrotationdbc` VALUES ('347', '194369', '122500', '0', '0', '-0.000751', '1');
INSERT INTO `transportrotationdbc` VALUES ('348', '194369', '128367', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('393', '194440', '0', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('394', '194440', '42933', '0', '0', '0.025144', '0.999684');
INSERT INTO `transportrotationdbc` VALUES ('395', '194440', '48033', '0', '0', '0.380247', '0.924885');
INSERT INTO `transportrotationdbc` VALUES ('396', '194440', '52533', '0', '0', '0.875203', '0.483757');
INSERT INTO `transportrotationdbc` VALUES ('397', '194440', '56200', '0', '0', '0.999098', '0.042468');
INSERT INTO `transportrotationdbc` VALUES ('398', '194440', '105300', '0', '0', '0.999998', '-0.002058');
INSERT INTO `transportrotationdbc` VALUES ('399', '194440', '107100', '0', '0', '0.991232', '-0.132132');
INSERT INTO `transportrotationdbc` VALUES ('400', '194440', '114567', '0', '0', '-0.341502', '0.939881');
INSERT INTO `transportrotationdbc` VALUES ('401', '194440', '117367', '0', '0', '-0.043263', '0.999064');
INSERT INTO `transportrotationdbc` VALUES ('402', '194440', '128333', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('567', '194469', '0', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('568', '194469', '39467', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('569', '194469', '43767', '0', '0', '0.060287', '0.998181');
INSERT INTO `transportrotationdbc` VALUES ('570', '194469', '48367', '0', '0', '0.412416', '0.910996');
INSERT INTO `transportrotationdbc` VALUES ('571', '194469', '53167', '0', '0', '0.920281', '0.391259');
INSERT INTO `transportrotationdbc` VALUES ('572', '194469', '56300', '0', '0', '0.999383', '0.035128');
INSERT INTO `transportrotationdbc` VALUES ('573', '194469', '56533', '0', '0', '1', '0');
INSERT INTO `transportrotationdbc` VALUES ('574', '194469', '104800', '0', '0', '1', '0');
INSERT INTO `transportrotationdbc` VALUES ('575', '194469', '107067', '0', '0', '0.991694', '-0.128621');
INSERT INTO `transportrotationdbc` VALUES ('576', '194469', '114000', '0', '0', '-0.41663', '0.909076');
INSERT INTO `transportrotationdbc` VALUES ('577', '194469', '117467', '0', '0', '-0.035721', '0.999362');
INSERT INTO `transportrotationdbc` VALUES ('578', '194469', '119500', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('579', '194469', '122267', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('580', '194469', '128333', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('681', '194570', '0', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('682', '194570', '39467', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('683', '194570', '43767', '0', '0', '0.060287', '0.998181');
INSERT INTO `transportrotationdbc` VALUES ('684', '194570', '48367', '0', '0', '0.412416', '0.910996');
INSERT INTO `transportrotationdbc` VALUES ('685', '194570', '53167', '0', '0', '0.920281', '0.391259');
INSERT INTO `transportrotationdbc` VALUES ('686', '194570', '56300', '0', '0', '0.999383', '0.035128');
INSERT INTO `transportrotationdbc` VALUES ('687', '194570', '56533', '0', '0', '1', '0');
INSERT INTO `transportrotationdbc` VALUES ('688', '194570', '104800', '0', '0', '1', '0');
INSERT INTO `transportrotationdbc` VALUES ('689', '194570', '107067', '0', '0', '0.991694', '-0.128621');
INSERT INTO `transportrotationdbc` VALUES ('690', '194570', '114000', '0', '0', '-0.41663', '0.909076');
INSERT INTO `transportrotationdbc` VALUES ('691', '194570', '117467', '0', '0', '-0.035721', '0.999362');
INSERT INTO `transportrotationdbc` VALUES ('692', '194570', '119500', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('693', '194570', '122267', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('694', '194570', '128333', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('1595', '194675', '0', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('1596', '194675', '39467', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('1597', '194675', '43767', '0', '0', '0.060287', '0.998181');
INSERT INTO `transportrotationdbc` VALUES ('1598', '194675', '48367', '0', '0', '0.412416', '0.910996');
INSERT INTO `transportrotationdbc` VALUES ('1599', '194675', '53167', '0', '0', '0.920281', '0.391259');
INSERT INTO `transportrotationdbc` VALUES ('1600', '194675', '56300', '0', '0', '0.999383', '0.035128');
INSERT INTO `transportrotationdbc` VALUES ('1601', '194675', '56533', '0', '0', '1', '0');
INSERT INTO `transportrotationdbc` VALUES ('1602', '194675', '104800', '0', '0', '1', '0');
INSERT INTO `transportrotationdbc` VALUES ('1603', '194675', '107067', '0', '0', '0.991694', '-0.128621');
INSERT INTO `transportrotationdbc` VALUES ('1604', '194675', '114000', '0', '0', '-0.41663', '0.909076');
INSERT INTO `transportrotationdbc` VALUES ('1605', '194675', '117467', '0', '0', '-0.035721', '0.999362');
INSERT INTO `transportrotationdbc` VALUES ('1606', '194675', '119500', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('1607', '194675', '122267', '0', '0', '0', '1');
INSERT INTO `transportrotationdbc` VALUES ('1608', '194675', '128333', '0', '0', '0', '1');
