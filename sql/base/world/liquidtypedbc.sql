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
-- Table structure for table `liquidtypedbc`
--

DROP TABLE IF EXISTS `liquidtypedbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquidtypedbc` (
  `Id` int(4) NOT NULL DEFAULT '0',
  `Name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Flags` int(4) DEFAULT '0',
  `Type` int(4) DEFAULT '0',
  `SoundId` int(10) NOT NULL DEFAULT '0',
  `SpellId` int(10) NOT NULL DEFAULT '0',
  `MaxDarkenDepth` float DEFAULT NULL,
  `FogDarkenIntensity` float DEFAULT NULL,
  `AmbDarkenIntensity` float DEFAULT NULL,
  `DirDarkenIntensity` float DEFAULT NULL,
  `LightID` int(10) NOT NULL DEFAULT '0',
  `ParticleScale` float DEFAULT NULL,
  `ParticleMovement` int(10) NOT NULL DEFAULT '0',
  `ParticleTexSlots` int(10) NOT NULL DEFAULT '0',
  `LiquidMaterialID` int(10) NOT NULL DEFAULT '0',
  `Texture1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Texture2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Texture3` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `Texture4` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `Texture5` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `Texture6` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `Color1` int(10) NOT NULL DEFAULT '0',
  `Color2` int(10) NOT NULL DEFAULT '0',
  `UnkA1` float DEFAULT NULL,
  `UnkA2` float DEFAULT NULL,
  `UnkA3` float DEFAULT NULL,
  `UnkA4` float DEFAULT '0',
  `UnkA5` float DEFAULT '0',
  `UnkA6` float DEFAULT '0',
  `UnkA7` float DEFAULT '0',
  `UnkA8` float DEFAULT '0',
  `UnkA9` float DEFAULT NULL,
  `UnkA10` float DEFAULT NULL,
  `UnkA11` float DEFAULT '0',
  `UnkA12` float DEFAULT NULL,
  `UnkA13` float DEFAULT NULL,
  `UnkA14` float DEFAULT NULL,
  `UnkA15` float DEFAULT NULL,
  `UnkA16` float DEFAULT NULL,
  `UnkA17` float DEFAULT NULL,
  `UnkA18` float DEFAULT NULL,
  `UnkB1` int(10) NOT NULL DEFAULT '0',
  `UnkB2` int(10) NOT NULL DEFAULT '0',
  `UnkB3` int(10) NOT NULL DEFAULT '0',
  `UnkB4` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ID` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquidtypedbc`
--

LOCK TABLES `liquidtypedbc` WRITE;
/*!40000 ALTER TABLE `liquidtypedbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `liquidtypedbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `liquidtypedbc`
--

INSERT INTO `liquidtypedbc` VALUES ('1', 'Water', '15', '0', '1111', '0', '0', '0', '0', '0', '0', '1065350000', '0', '0', '1', 'XTextures\riverlake_a.%d.blp', 'proceduralRiverDepthTex', '0', '0', '0', '0', '0', '0', '1065350000', '0', '1065350000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('2', 'Ocean', '15', '1', '1114', '0', '1106250000', '1056960000', '1056960000', '1048580000', '0', '1065350000', '0', '0', '1', 'XTexturesoceanocean_h.%d.blp', 'proceduralOceanDepthTex', '0', '0', '0', '0', '0', '0', '1065350000', '0', '1065350000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('3', 'Magma', '120', '2', '3072', '0', '0', '0', '0', '0', '7', '1082130000', '1', '1', '2', 'XTextureslavalava.%d.blp', '', '0', '0', '0', '0', '0', '0', '1020050000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('4', 'Slime', '322', '3', '3880', '0', '0', '0', '0', '0', '6', '0', '0', '0', '2', 'XTexturesslimeslime.%d.blp', '', '0', '0', '0', '0', '0', '0', '1020050000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('5', 'Slow Water', '15', '0', '1112', '0', '0', '0', '0', '0', '0', '1065350000', '0', '0', '1', 'XTextures\riverlake_a.%d.blp', 'proceduralRiverDepthTex', '0', '0', '0', '0', '0', '0', '1065350000', '0', '1065350000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('6', 'Slow Ocean', '15', '1', '1114', '0', '1106250000', '1056960000', '1056960000', '1048580000', '0', '1065350000', '0', '0', '1', 'XTexturesoceanocean_h.%d.blp', 'proceduralOceanDepthTex', '0', '0', '0', '0', '0', '0', '1065350000', '0', '1065350000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('7', 'Slow Magma', '120', '2', '3052', '0', '0', '0', '0', '0', '7', '1082130000', '1', '1', '2', 'XTextureslavalava.%d.blp', '', '0', '0', '0', '0', '0', '0', '1020050000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('8', 'Slow Slime', '322', '3', '3880', '0', '0', '0', '0', '0', '6', '0', '0', '0', '2', 'XTexturesslimeslime.%d.blp', '', '0', '0', '0', '0', '0', '0', '1020050000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('9', 'Fast Water', '15', '0', '1113', '0', '0', '0', '0', '0', '0', '1065350000', '0', '0', '1', 'XTextures\riverfast_a.%d.blp', 'proceduralRiverDepthTex', '0', '0', '0', '0', '0', '0', '1065350000', '0', '1065350000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('10', 'Fast Ocean', '15', '1', '1114', '0', '1106250000', '1056960000', '1056960000', '1048580000', '0', '1065350000', '0', '0', '1', 'XTexturesoceanocean_h.%d.blp', 'proceduralOceanDepthTex', '0', '0', '0', '0', '0', '0', '1065350000', '0', '1065350000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('11', 'Fast Magma', '120', '2', '3052', '0', '0', '0', '0', '0', '7', '1082130000', '1', '1', '2', 'XTextureslavalava.%d.blp', '', '0', '0', '0', '0', '0', '0', '1020050000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('12', 'Fast Slime', '322', '3', '3880', '0', '0', '0', '0', '0', '6', '0', '0', '0', '2', 'XTexturesslimeslime.%d.blp', '', '0', '0', '0', '0', '0', '0', '1020050000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('13', 'WMO Water', '15', '0', '1111', '0', '0', '0', '0', '0', '0', '1065350000', '0', '0', '1', 'XTextures\riverlake_a.%d.blp', 'proceduralWmoWaterTex', '0', '0', '0', '0', '0', '0', '1065350000', '0', '1065350000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('14', 'WMO Ocean', '527', '1', '1114', '0', '1106250000', '1056960000', '1056960000', '1048580000', '0', '1065350000', '0', '0', '1', 'XTexturesoceanocean_h.%d.blp', 'proceduralOceanDepthTex', '0', '0', '0', '0', '0', '0', '1048580000', '1127480000', '1065350000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('15', 'Green Lava', '120', '2', '3072', '0', '0', '0', '0', '0', '6', '1082130000', '1', '1', '2', 'XTexturesLavaGreenlavagreen.%d.blp', '', '0', '0', '0', '0', '0', '0', '1020050000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('17', 'WMO Water - Interior', '15', '0', '1111', '0', '0', '0', '0', '0', '0', '1065350000', '0', '0', '1', 'XTextures\riverlake_a.%d.blp', 'proceduralWmoWaterTex', '0', '0', '0', '0', '0', '0', '1065350000', '0', '1065350000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('19', 'WMO Magma', '120', '2', '3072', '0', '0', '0', '0', '0', '7', '1082130000', '1', '1', '2', 'XTextureslavalava.%d.blp', '', '0', '0', '0', '0', '0', '0', '0', '1036830000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('20', 'WMO Slime', '322', '3', '3880', '0', '0', '0', '0', '0', '6', '0', '0', '0', '2', 'XTexturesslimeslime.%d.blp', '', '0', '0', '0', '0', '0', '0', '0', '1036830000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('21', 'Naxxramas - Slime', '322', '3', '3880', '28801', '0', '0', '0', '0', '6', '0', '0', '0', '2', 'XTexturesslimeslime.%d.blp', '', '0', '0', '0', '0', '0', '0', '1020050000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('41', 'Coilfang Raid - Water', '15', '0', '1111', '37025', '0', '0', '0', '0', '0', '1065350000', '0', '0', '1', 'XTextures\riverlake_a.%d.blp', 'proceduralRiverDepthTex', '0', '0', '0', '0', '0', '0', '1065350000', '0', '1065350000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('61', 'Hyjal Past - Water', '15', '0', '1111', '42201', '0', '0', '0', '0', '0', '1065350000', '0', '0', '1', 'XTextures\riverlake_a.%d.blp', 'proceduralRiverDepthTex', '0', '0', '0', '0', '0', '0', '1065350000', '0', '1065350000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('81', 'Lake Wintergrasp - Water', '15', '0', '1112', '36444', '0', '0', '0', '0', '0', '1065350000', '0', '0', '1', 'XTextures\riverlake_a.%d.blp', 'proceduralRiverDepthTex', '0', '0', '0', '0', '0', '0', '1065350000', '0', '1065350000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('100', 'Basic Procedural Water', '15', '1', '1114', '0', '1106250000', '1056960000', '1056960000', '0', '0', '1065350000', '0', '0', '3', 'XTexturesprocWaterasicReflectionMap.blp', 'XTexturesprocWaterasicReflectionMap.blp', '589', '589', '98', '67', '0', '0', '1036830000', '1056960000', '1069550000', '1073740000', '0', '0', '0', '0', '1065350000', '1065350000', '0', '1133900000', '1051360000', '1045220000', '1036830000', '1045220000', '1062000000', '1045220000', '1', '1250', '1250', '1250');
INSERT INTO `liquidtypedbc` VALUES ('121', 'CoA Black - Magma', '120', '2', '3052', '57634', '0', '0', '0', '0', '7', '1082130000', '1', '1', '2', 'XTextureslavalava.%d.blp', '', '0', '0', '0', '0', '0', '0', '0', '1036830000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('141', 'Chamber Magma', '120', '2', '3072', '57634', '0', '0', '0', '0', '7', '1082130000', '1', '1', '2', 'XTextureslavalava.%d.blp', '', '0', '0', '0', '0', '0', '0', '0', '1036830000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('181', 'Orange Slime', '15', '0', '1111', '0', '0', '0', '0', '0', '0', '1065350000', '0', '0', '1', 'XTEXTURESLavaOrangeLavaOrange.%d.blp', 'proceduralRiverDepthTex', '0', '0', '0', '0', '0', '0', '1073740000', '0', '1091040000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1250', '0', '0');
