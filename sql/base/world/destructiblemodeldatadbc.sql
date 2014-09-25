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
-- Table structure for table `destructiblemodeldatadbc`
--

DROP TABLE IF EXISTS `destructiblemodeldatadbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destructiblemodeldatadbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `DamagedUnk1` int(10) NOT NULL DEFAULT '0',
  `DamagedUnk2` int(10) NOT NULL DEFAULT '0',
  `DamagedDisplayId` int(10) NOT NULL DEFAULT '0',
  `DamagedUnk3` int(10) NOT NULL DEFAULT '0',
  `DestroyedUnk1` int(10) NOT NULL DEFAULT '0',
  `DestroyedUnk2` int(10) NOT NULL DEFAULT '0',
  `DestroyedDisplayId` int(10) NOT NULL DEFAULT '0',
  `DestroyedUnk3` int(10) NOT NULL DEFAULT '0',
  `RebuildingUnk1` int(10) NOT NULL DEFAULT '0',
  `RebuildingUnk2` int(10) NOT NULL DEFAULT '0',
  `RebuildingDisplayId` int(10) NOT NULL DEFAULT '0',
  `RebuildingUnk3` int(10) NOT NULL DEFAULT '0',
  `SmokeUnk1` int(10) NOT NULL DEFAULT '0',
  `SmokeUnk2` int(10) NOT NULL DEFAULT '0',
  `SmokeDisplayId` int(10) NOT NULL DEFAULT '0',
  `SmokeUnk3` int(10) NOT NULL DEFAULT '0',
  `Unk4` int(10) NOT NULL DEFAULT '0',
  `Unk5` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destructiblemodeldatadbc`
--

LOCK TABLES `destructiblemodeldatadbc` WRITE;
/*!40000 ALTER TABLE `destructiblemodeldatadbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `destructiblemodeldatadbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `destructiblemodeldatadbc`
--

INSERT INTO `destructiblemodeldatadbc` VALUES ('25', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('26', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '1', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('27', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '1', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('28', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '1', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('29', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '1', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('30', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '1', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('31', '0', '0', '7897', '1', '0', '0', '7874', '1', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('32', '0', '0', '7908', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('33', '0', '0', '7908', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('34', '0', '0', '7912', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('35', '0', '0', '7912', '1', '0', '2', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('36', '0', '0', '7913', '1', '3', '2', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('37', '0', '0', '8166', '1', '0', '0', '8167', '1', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('38', '0', '0', '8166', '1', '0', '0', '8167', '1', '0', '0', '0', '0', '9', '8', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('39', '0', '0', '8169', '2', '1', '0', '7898', '1', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('40', '0', '0', '8186', '1', '0', '0', '7908', '1', '0', '0', '0', '0', '11', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('41', '0', '0', '8198', '1', '0', '0', '0', '0', '0', '0', '0', '0', '12', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('42', '0', '0', '8198', '1', '0', '0', '7855', '1', '0', '0', '0', '0', '13', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('43', '0', '0', '8198', '1', '0', '0', '7855', '1', '0', '0', '0', '0', '14', '8', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('44', '0', '0', '8209', '1', '2', '0', '8210', '1', '2', '0', '0', '0', '15', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('45', '0', '0', '8209', '1', '2', '0', '8210', '1', '2', '0', '0', '0', '16', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('46', '0', '0', '8246', '1', '1', '1', '0', '0', '0', '0', '0', '0', '17', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('47', '0', '0', '8246', '1', '1', '1', '0', '0', '0', '0', '0', '0', '18', '0', '0', '1', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('48', '0', '0', '8249', '1', '1', '1', '0', '0', '0', '0', '0', '0', '19', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('49', '0', '0', '8249', '1', '1', '1', '0', '0', '0', '0', '0', '0', '20', '0', '0', '1', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('50', '0', '0', '8387', '0', '0', '0', '8386', '1', '0', '0', '0', '0', '21', '8', '0', '1', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('51', '0', '0', '8593', '0', '0', '0', '8591', '1', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('52', '0', '0', '8593', '0', '0', '0', '8591', '1', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('53', '0', '0', '8593', '0', '0', '0', '8591', '1', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('54', '1', '0', '8169', '2', '1', '0', '7898', '1', '0', '0', '0', '0', '22', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('55', '1', '0', '8173', '2', '1', '0', '7875', '1', '0', '0', '0', '0', '23', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('56', '1', '0', '8584', '2', '1', '0', '8585', '1', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('57', '1', '0', '8584', '1', '0', '0', '8585', '1', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('58', '3', '0', '7540', '1', '3', '2', '7541', '1', '0', '0', '7809', '0', '0', '5', '6331', '0', '1', '25');
INSERT INTO `destructiblemodeldatadbc` VALUES ('59', '0', '0', '9003', '1', '0', '0', '9003', '1', '0', '0', '0', '0', '22', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('60', '0', '0', '8997', '0', '0', '0', '9000', '0', '0', '0', '0', '0', '22', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('61', '0', '0', '8996', '0', '0', '0', '9003', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('62', '0', '0', '8997', '0', '0', '0', '9000', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('63', '0', '0', '9060', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '0', '1', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('65', '0', '0', '9257', '1', '0', '0', '9258', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0');
INSERT INTO `destructiblemodeldatadbc` VALUES ('67', '0', '0', '9257', '1', '0', '0', '9258', '1', '0', '0', '9258', '1', '0', '8', '0', '1', '4', '0');
