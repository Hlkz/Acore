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
  `Name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Flags` int(4) DEFAULT '0',
  `Type` int(4) DEFAULT '0',
  `SoundId` int(10) NOT NULL DEFAULT '0',
  `SpellId` int(10) NOT NULL DEFAULT '0',
  `MaxDarkenDepth` float NOT NULL DEFAULT '0',
  `FogDarkenIntensity` float NOT NULL DEFAULT '0',
  `AmbDarkenIntensity` float NOT NULL DEFAULT '0',
  `DirDarkenIntensity` float NOT NULL DEFAULT '0',
  `LightID` int(10) NOT NULL DEFAULT '0',
  `ParticleScale` float NOT NULL DEFAULT '0',
  `ParticleMovement` int(10) NOT NULL DEFAULT '0',
  `ParticleTexSlots` int(10) NOT NULL DEFAULT '0',
  `LiquidMaterialID` int(10) NOT NULL DEFAULT '0',
  `Texture1` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Texture2` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Texture3` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `Texture4` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `Texture5` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `Texture6` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `Color1` int(10) NOT NULL DEFAULT '0',
  `Color2` int(10) NOT NULL DEFAULT '0',
  `UnkA1` float NOT NULL DEFAULT '0',
  `UnkA2` float NOT NULL DEFAULT '0',
  `UnkA3` float NOT NULL DEFAULT '0',
  `UnkA4` float NOT NULL DEFAULT '0',
  `UnkA5` float NOT NULL DEFAULT '0',
  `UnkA6` float NOT NULL DEFAULT '0',
  `UnkA7` float NOT NULL DEFAULT '0',
  `UnkA8` float NOT NULL DEFAULT '0',
  `UnkA9` float NOT NULL DEFAULT '0',
  `UnkA10` float NOT NULL DEFAULT '0',
  `UnkA11` float NOT NULL DEFAULT '0',
  `UnkA12` float NOT NULL DEFAULT '0',
  `UnkA13` float NOT NULL DEFAULT '0',
  `UnkA14` float NOT NULL DEFAULT '0',
  `UnkA15` float NOT NULL DEFAULT '0',
  `UnkA16` float NOT NULL DEFAULT '0',
  `UnkA17` float NOT NULL DEFAULT '0',
  `UnkA18` float NOT NULL DEFAULT '0',
  `UnkB1` int(10) NOT NULL DEFAULT '0',
  `UnkB2` int(10) NOT NULL DEFAULT '0',
  `UnkB3` int(10) NOT NULL DEFAULT '0',
  `UnkB4` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
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

INSERT INTO `liquidtypedbc` VALUES ('1', 'Water', '15', '0', '1111', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', 'XTextures\\river\\lake_a.%d.blp', 'proceduralRiverDepthTex', '', '', '', '', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('2', 'Ocean', '15', '1', '1114', '0', '30', '0.5', '0.5', '0.25', '0', '1', '0', '0', '1', 'XTextures\\ocean\\ocean_h.%d.blp', 'proceduralOceanDepthTex', '', '', '', '', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('3', 'Magma', '120', '2', '3072', '0', '0', '0', '0', '0', '7', '4', '1', '1', '2', 'XTextures\\lava\\lava.%d.blp', '', '', '', '', '', '0', '0', '0.025', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('4', 'Slime', '322', '3', '3880', '0', '0', '0', '0', '0', '6', '0', '0', '0', '2', 'XTextures\\slime\\slime.%d.blp', '', '', '', '', '', '0', '0', '0.025', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('5', 'Slow Water', '15', '0', '1112', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', 'XTextures\\river\\lake_a.%d.blp', 'proceduralRiverDepthTex', '', '', '', '', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('6', 'Slow Ocean', '15', '1', '1114', '0', '30', '0.5', '0.5', '0.25', '0', '1', '0', '0', '1', 'XTextures\\ocean\\ocean_h.%d.blp', 'proceduralOceanDepthTex', '', '', '', '', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('7', 'Slow Magma', '120', '2', '3052', '0', '0', '0', '0', '0', '7', '4', '1', '1', '2', 'XTextures\\lava\\lava.%d.blp', '', '', '', '', '', '0', '0', '0.025', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('8', 'Slow Slime', '322', '3', '3880', '0', '0', '0', '0', '0', '6', '0', '0', '0', '2', 'XTextures\\slime\\slime.%d.blp', '', '', '', '', '', '0', '0', '0.025', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('9', 'Fast Water', '15', '0', '1113', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', 'XTextures\\river\\fast_a.%d.blp', 'proceduralRiverDepthTex', '', '', '', '', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('10', 'Fast Ocean', '15', '1', '1114', '0', '30', '0.5', '0.5', '0.25', '0', '1', '0', '0', '1', 'XTextures\\ocean\\ocean_h.%d.blp', 'proceduralOceanDepthTex', '', '', '', '', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('11', 'Fast Magma', '120', '2', '3052', '0', '0', '0', '0', '0', '7', '4', '1', '1', '2', 'XTextures\\lava\\lava.%d.blp', '', '', '', '', '', '0', '0', '0.025', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('12', 'Fast Slime', '322', '3', '3880', '0', '0', '0', '0', '0', '6', '0', '0', '0', '2', 'XTextures\\slime\\slime.%d.blp', '', '', '', '', '', '0', '0', '0.025', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('13', 'WMO Water', '15', '0', '1111', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', 'XTextures\\river\\lake_a.%d.blp', 'proceduralWmoWaterTex', '', '', '', '', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('14', 'WMO Ocean', '527', '1', '1114', '0', '30', '0.5', '0.5', '0.25', '0', '1', '0', '0', '1', 'XTextures\\ocean\\ocean_h.%d.blp', 'proceduralOceanDepthTex', '', '', '', '', '0', '0', '0.25', '180', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('15', 'Green Lava', '120', '2', '3072', '0', '0', '0', '0', '0', '6', '4', '1', '1', '2', 'XTextures\\LavaGreen\\lavagreen.%d.blp', '', '', '', '', '', '0', '0', '0.025', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('17', 'WMO Water - Interior', '15', '0', '1111', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', 'XTextures\\river\\lake_a.%d.blp', 'proceduralWmoWaterTex', '', '', '', '', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('19', 'WMO Magma', '120', '2', '3072', '0', '0', '0', '0', '0', '7', '4', '1', '1', '2', 'XTextures\\lava\\lava.%d.blp', '', '', '', '', '', '0', '0', '0', '0.1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('20', 'WMO Slime', '322', '3', '3880', '0', '0', '0', '0', '0', '6', '0', '0', '0', '2', 'XTextures\\slime\\slime.%d.blp', '', '', '', '', '', '0', '0', '0', '0.1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('21', 'Naxxramas - Slime', '322', '3', '3880', '28801', '0', '0', '0', '0', '6', '0', '0', '0', '2', 'XTextures\\slime\\slime.%d.blp', '', '', '', '', '', '0', '0', '0.025', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('41', 'Coilfang Raid - Water', '15', '0', '1111', '37025', '0', '0', '0', '0', '0', '1', '0', '0', '1', 'XTextures\\river\\lake_a.%d.blp', 'proceduralRiverDepthTex', '', '', '', '', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('61', 'Hyjal Past - Water', '15', '0', '1111', '42201', '0', '0', '0', '0', '0', '1', '0', '0', '1', 'XTextures\\river\\lake_a.%d.blp', 'proceduralRiverDepthTex', '', '', '', '', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('81', 'Lake Wintergrasp - Water', '15', '0', '1112', '36444', '0', '0', '0', '0', '0', '1', '0', '0', '1', 'XTextures\\river\\lake_a.%d.blp', 'proceduralRiverDepthTex', '', '', '', '', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1250', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('100', 'Basic Procedural Water', '15', '1', '1114', '0', '30', '0.5', '0.5', '0', '0', '1', '0', '0', '3', 'XTextures\\procWater\\basicReflectionMap.blp', 'XTextures\\procWater\\basicReflectionMap.blp', 'XTextures\\procWater\\basicWaterHeightTex_%d.blp', 'XTextures\\procWater\\basicWaterHeightTex_%d.blp', 'proceduralOceanDepthTex', 'XTextures\\ocean\\ocean_h.%d.blp', '0', '0', '0.1', '0.5', '1.5', '2', '0', '0', '0', '0', '1', '1', '0', '300', '0.333', '0.2', '0.1', '0.2', '0.8', '0.2', '1', '1250', '1250', '1250');
INSERT INTO `liquidtypedbc` VALUES ('121', 'CoA Black - Magma', '120', '2', '3052', '57634', '0', '0', '0', '0', '7', '4', '1', '1', '2', 'XTextures\\lava\\lava.%d.blp', '', '', '', '', '', '0', '0', '0', '0.1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('141', 'Chamber Magma', '120', '2', '3072', '57634', '0', '0', '0', '0', '7', '4', '1', '1', '2', 'XTextures\\lava\\lava.%d.blp', '', '', '', '', '', '0', '0', '0', '0.1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `liquidtypedbc` VALUES ('181', 'Orange Slime', '15', '0', '1111', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', 'XTEXTURES\\LavaOrange\\LavaOrange.%d.blp', 'proceduralRiverDepthTex', '', '', '', '', '0', '0', '2', '0', '8.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1250', '0', '0');
