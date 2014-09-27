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
-- Table structure for table `objecteffectpackage`
--

DROP TABLE IF EXISTS `objecteffectpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objecteffectpackage` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objecteffectpackage`
--

LOCK TABLES `objecteffectpackage` WRITE;
/*!40000 ALTER TABLE `objecteffectpackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `objecteffectpackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `objecteffectpackage`
--

INSERT INTO `objecteffectpackage` VALUES ('12', 'vr_elevator_lift');
INSERT INTO `objecteffectpackage` VALUES ('61', 'Flying Machine Mount');
INSERT INTO `objecteffectpackage` VALUES ('81', 'Wintergrasp Catapult');
INSERT INTO `objecteffectpackage` VALUES ('101', 'Rocket Mount');
INSERT INTO `objecteffectpackage` VALUES ('102', 'SiegeVehicle');
INSERT INTO `objecteffectpackage` VALUES ('122', 'Wintergrasp Demolisher');
INSERT INTO `objecteffectpackage` VALUES ('141', 'FlyingMachineCreature_Vehicle');
INSERT INTO `objecteffectpackage` VALUES ('161', 'MotorCycle');
INSERT INTO `objecteffectpackage` VALUES ('181', 'ND_AllianceGunship');
INSERT INTO `objecteffectpackage` VALUES ('182', 'HordeGunShip');
INSERT INTO `objecteffectpackage` VALUES ('201', 'TeleportTestPackage');
INSERT INTO `objecteffectpackage` VALUES ('221', 'Flame Leviathan (Siege Tank)');
INSERT INTO `objecteffectpackage` VALUES ('241', 'MimironHeadMount');
INSERT INTO `objecteffectpackage` VALUES ('261', 'Orc_Fortress_Elevator01');
INSERT INTO `objecteffectpackage` VALUES ('281', 'vr_elevator_gate');
INSERT INTO `objecteffectpackage` VALUES ('301', 'UlduarRaid_GnomeWing_TransportWMO');
INSERT INTO `objecteffectpackage` VALUES ('321', 'Org_Arena_Gear');
INSERT INTO `objecteffectpackage` VALUES ('341', 'Org_Arena_Pulley');
INSERT INTO `objecteffectpackage` VALUES ('342', 'OrgrimmarArena_FireFX');
INSERT INTO `objecteffectpackage` VALUES ('361', 'UL_train_turnaround');
INSERT INTO `objecteffectpackage` VALUES ('381', 'UL_SigilDoor01');
INSERT INTO `objecteffectpackage` VALUES ('401', 'Vrykul_Transport_Ship');
INSERT INTO `objecteffectpackage` VALUES ('421', 'hf_elevator_lift');
INSERT INTO `objecteffectpackage` VALUES ('461', 'ND_AllianceGunship (Ice Crown)');
INSERT INTO `objecteffectpackage` VALUES ('462', 'HordeGunShip (IceCrown)');
INSERT INTO `objecteffectpackage` VALUES ('481', 'HordeGunShip (Small)');
INSERT INTO `objecteffectpackage` VALUES ('482', 'IceCrown_Elevator02');
INSERT INTO `objecteffectpackage` VALUES ('488', 'DeepRunTram');
INSERT INTO `objecteffectpackage` VALUES ('491', 'FlyingCarpetMount');
