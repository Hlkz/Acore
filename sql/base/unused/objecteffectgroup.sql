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
-- Table structure for table `objecteffectgroup`
--

DROP TABLE IF EXISTS `objecteffectgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objecteffectgroup` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objecteffectgroup`
--

LOCK TABLES `objecteffectgroup` WRITE;
/*!40000 ALTER TABLE `objecteffectgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `objecteffectgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `objecteffectgroup`
--

INSERT INTO `objecteffectgroup` VALUES ('33', 'vr_elevator_lift_always');
INSERT INTO `objecteffectgroup` VALUES ('34', 'vr_elevator_lift_accelerating');
INSERT INTO `objecteffectgroup` VALUES ('157', 'FlyingMachineMount_Sprint');
INSERT INTO `objecteffectgroup` VALUES ('158', 'WintergraspCatapult_Moving');
INSERT INTO `objecteffectgroup` VALUES ('159', 'WintergraspCatapult_NotMoving');
INSERT INTO `objecteffectgroup` VALUES ('160', 'FlyingMachineMount_Stand');
INSERT INTO `objecteffectgroup` VALUES ('161', 'FlyingMachineMount_Walk');
INSERT INTO `objecteffectgroup` VALUES ('162', 'FlyingMachineMount_ShuffleLeft');
INSERT INTO `objecteffectgroup` VALUES ('163', 'FlyingMachineMount_ShuffleRight');
INSERT INTO `objecteffectgroup` VALUES ('164', 'FlyingMachineMount_WalkBackwards');
INSERT INTO `objecteffectgroup` VALUES ('165', 'FlyingMachineMount_JumpStart');
INSERT INTO `objecteffectgroup` VALUES ('166', 'FlyingMachineMount_JumpEnd');
INSERT INTO `objecteffectgroup` VALUES ('167', 'FlyingMachineMount_SwimRight');
INSERT INTO `objecteffectgroup` VALUES ('168', 'FlyingMachineMount_SwimLeft');
INSERT INTO `objecteffectgroup` VALUES ('169', 'FlyingMachineMount_Swim');
INSERT INTO `objecteffectgroup` VALUES ('170', 'FlyingMachineMount_SwimBackwards');
INSERT INTO `objecteffectgroup` VALUES ('171', 'FlyingMachineMount_SwimIdle');
INSERT INTO `objecteffectgroup` VALUES ('172', 'FlyingMachineMount_JumpLandRun');
INSERT INTO `objecteffectgroup` VALUES ('173', 'FlyingMachineMount_Ascending');
INSERT INTO `objecteffectgroup` VALUES ('175', 'WintergraspCatapult_LoadThrown');
INSERT INTO `objecteffectgroup` VALUES ('176', 'WintergraspCatapult_AttackThrown');
INSERT INTO `objecteffectgroup` VALUES ('181', 'RocketMount_Stand');
INSERT INTO `objecteffectgroup` VALUES ('182', 'RocketMount_Walk');
INSERT INTO `objecteffectgroup` VALUES ('183', 'RocketMount_Run');
INSERT INTO `objecteffectgroup` VALUES ('184', 'RocketMount_WalkBackwards');
INSERT INTO `objecteffectgroup` VALUES ('185', 'RocketMount_SwimIdle');
INSERT INTO `objecteffectgroup` VALUES ('186', 'RocketMount_Swim');
INSERT INTO `objecteffectgroup` VALUES ('187', 'RocketMount_SwimLeft');
INSERT INTO `objecteffectgroup` VALUES ('188', 'RocketMount_SwimRight');
INSERT INTO `objecteffectgroup` VALUES ('189', 'RocketMount_SwimBackwards');
INSERT INTO `objecteffectgroup` VALUES ('190', 'RocketMount_RunLeft');
INSERT INTO `objecteffectgroup` VALUES ('191', 'RocketMount_RunRight');
INSERT INTO `objecteffectgroup` VALUES ('192', 'RocketMount_Fly');
INSERT INTO `objecteffectgroup` VALUES ('193', 'RocketMount_JumpStart');
INSERT INTO `objecteffectgroup` VALUES ('194', 'RocketMount_JumpEnd');
INSERT INTO `objecteffectgroup` VALUES ('195', 'RocketMount_Ascending');
INSERT INTO `objecteffectgroup` VALUES ('196', 'RocketMount_Descending');
INSERT INTO `objecteffectgroup` VALUES ('197', 'SiegeVehicle_AttackThrown');
INSERT INTO `objecteffectgroup` VALUES ('198', 'SiegeVehicle_AttackUnarmed');
INSERT INTO `objecteffectgroup` VALUES ('199', 'SiegeVehicle_Idle');
INSERT INTO `objecteffectgroup` VALUES ('200', 'SiegeVehicleSlow_Fast');
INSERT INTO `objecteffectgroup` VALUES ('202', 'WintergraspDemolisher_NotMoving');
INSERT INTO `objecteffectgroup` VALUES ('203', 'WintergraspDemolisher_AttackUnarmed');
INSERT INTO `objecteffectgroup` VALUES ('204', 'WintergraspDemolisher_Moving');
INSERT INTO `objecteffectgroup` VALUES ('205', 'WintergraspDemolisher_AttackThrown');
INSERT INTO `objecteffectgroup` VALUES ('206', 'WintergraspDemolisher_LoadThrown');
INSERT INTO `objecteffectgroup` VALUES ('221', 'FlyingMachineMount_SwimIdleVar1');
INSERT INTO `objecteffectgroup` VALUES ('222', 'FlyingMachineMount_StandVar1');
INSERT INTO `objecteffectgroup` VALUES ('241', 'WintergraspDemolisherdeath');
INSERT INTO `objecteffectgroup` VALUES ('242', 'WintergraspDemolisherWound');
INSERT INTO `objecteffectgroup` VALUES ('243', 'FlyingMachineCreature_VehicleRun');
INSERT INTO `objecteffectgroup` VALUES ('244', 'FlyingMachineCreature_VehicleSGroundDown');
INSERT INTO `objecteffectgroup` VALUES ('245', 'FlyingMachineCreature_VehicleSitGroundUp');
INSERT INTO `objecteffectgroup` VALUES ('246', 'FlyingMachineCreature_VehicleWalk');
INSERT INTO `objecteffectgroup` VALUES ('247', 'FlyingMachineCreature_VehicleWalkBackwards');
INSERT INTO `objecteffectgroup` VALUES ('261', 'SiegeVehicleDeath');
INSERT INTO `objecteffectgroup` VALUES ('262', 'SiegeVehicleWounds');
INSERT INTO `objecteffectgroup` VALUES ('263', 'Wintergrasp_Catapult_Death');
INSERT INTO `objecteffectgroup` VALUES ('264', 'Wintergrasp_Catapult_Wound');
INSERT INTO `objecteffectgroup` VALUES ('265', 'MotorCycleAttackThrown');
INSERT INTO `objecteffectgroup` VALUES ('266', 'MotorCycleJumpEnd');
INSERT INTO `objecteffectgroup` VALUES ('267', 'MotorCycleJumpStart');
INSERT INTO `objecteffectgroup` VALUES ('268', 'MotorCycleLoadThrown');
INSERT INTO `objecteffectgroup` VALUES ('269', 'MotorCycleStand');
INSERT INTO `objecteffectgroup` VALUES ('270', 'MotorCycleWalkRun');
INSERT INTO `objecteffectgroup` VALUES ('281', 'ND_AllianceGunship_Always');
INSERT INTO `objecteffectgroup` VALUES ('282', 'HordeGunShipState');
INSERT INTO `objecteffectgroup` VALUES ('321', 'Off_Vehicle');
INSERT INTO `objecteffectgroup` VALUES ('341', 'Flame Leviathan Wound');
INSERT INTO `objecteffectgroup` VALUES ('342', 'Flame Leviathan Death');
INSERT INTO `objecteffectgroup` VALUES ('343', 'Flame Leviathan Idle');
INSERT INTO `objecteffectgroup` VALUES ('344', 'Flame Leviathan Attack Unarmed');
INSERT INTO `objecteffectgroup` VALUES ('345', 'Flame Leviathan Attack Thrown');
INSERT INTO `objecteffectgroup` VALUES ('346', 'Flame Leviathan Walk Run');
INSERT INTO `objecteffectgroup` VALUES ('361', 'MimironHeadMount_Run');
INSERT INTO `objecteffectgroup` VALUES ('362', 'MimironHeadMount_Walk');
INSERT INTO `objecteffectgroup` VALUES ('363', 'MimironHeadMount_JumpStart');
INSERT INTO `objecteffectgroup` VALUES ('364', 'MimironHeadMount_JumpEnd');
INSERT INTO `objecteffectgroup` VALUES ('365', 'SwimIdle');
INSERT INTO `objecteffectgroup` VALUES ('381', 'Orc_Fortress_Elevator01');
INSERT INTO `objecteffectgroup` VALUES ('401', 'Orc_Fortress_Elevator01_Decellerate');
INSERT INTO `objecteffectgroup` VALUES ('402', 'Orc_Fortress_Elevator01_Accellerate');
INSERT INTO `objecteffectgroup` VALUES ('403', 'Vr_elevator_lift_Decellerate');
INSERT INTO `objecteffectgroup` VALUES ('404', 'Vr_elevator_lift_Moving');
INSERT INTO `objecteffectgroup` VALUES ('405', 'Gate');
INSERT INTO `objecteffectgroup` VALUES ('421', 'UlduarRaid_GnomeWing_Transport_InMotion');
INSERT INTO `objecteffectgroup` VALUES ('441', 'Org_Arena_Gear_Open');
INSERT INTO `objecteffectgroup` VALUES ('461', 'Org_Arena_Pulley_Loop');
INSERT INTO `objecteffectgroup` VALUES ('462', 'Org_Arena_Firedoor_Open');
INSERT INTO `objecteffectgroup` VALUES ('463', 'Org_Arena_Firedoor_Close');
INSERT INTO `objecteffectgroup` VALUES ('464', 'Org_Arena_Firedoor_Opened');
INSERT INTO `objecteffectgroup` VALUES ('481', 'Ul_train_turnaround_Open');
INSERT INTO `objecteffectgroup` VALUES ('501', 'UL_SigilDoor01_Open');
INSERT INTO `objecteffectgroup` VALUES ('521', 'VrykulTransportShip_InMotion');
INSERT INTO `objecteffectgroup` VALUES ('541', 'hf_elevator_lift_Loop');
INSERT INTO `objecteffectgroup` VALUES ('581', 'HordeGunship_00');
INSERT INTO `objecteffectgroup` VALUES ('582', 'ND_AllianceGunship_Always_0');
INSERT INTO `objecteffectgroup` VALUES ('601', 'IceCrown_Elevator02_Start');
INSERT INTO `objecteffectgroup` VALUES ('602', 'IceCrown_Elevator02_ShipMoving');
INSERT INTO `objecteffectgroup` VALUES ('603', 'IceCrown_Elevator02_Stop');
INSERT INTO `objecteffectgroup` VALUES ('608', 'DeepRunTram_Loop');
INSERT INTO `objecteffectgroup` VALUES ('609', 'FlyingCarpetMount_Test');
INSERT INTO `objecteffectgroup` VALUES ('610', 'Flying Carpet - Magic Loop');
INSERT INTO `objecteffectgroup` VALUES ('611', 'Flying Carpet - Periodic');
