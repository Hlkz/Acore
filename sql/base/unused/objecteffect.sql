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
-- Table structure for table `objecteffect`
--

DROP TABLE IF EXISTS `objecteffect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objecteffect` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Group` int(10) NOT NULL DEFAULT '0',
  `TriggerType` int(10) NOT NULL DEFAULT '0',
  `EventType` int(10) NOT NULL DEFAULT '0',
  `EffectRecType` int(10) NOT NULL DEFAULT '0',
  `EffectRecId` int(10) NOT NULL DEFAULT '0',
  `Attachment` int(10) NOT NULL DEFAULT '0',
  `OffsetX` float NOT NULL DEFAULT '0',
  `OffsetY` float NOT NULL DEFAULT '0',
  `OffsetZ` float NOT NULL DEFAULT '0',
  `ModifierId` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objecteffect`
--

LOCK TABLES `objecteffect` WRITE;
/*!40000 ALTER TABLE `objecteffect` DISABLE KEYS */;
/*!40000 ALTER TABLE `objecteffect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `objecteffect`
--

INSERT INTO `objecteffect` VALUES ('52', 'Vr_elevator_lift_Accellerate', '34', '1', '1', '1', '15285', '0', '10', '0', '85', '0');
INSERT INTO `objecteffect` VALUES ('228', 'Engine', '157', '2', '0', '1', '12176', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('229', 'Engine', '158', '2', '0', '1', '13810', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('230', 'Engine', '159', '2', '0', '1', '13812', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('231', 'Engine', '160', '2', '0', '1', '12178', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('232', 'Engine', '161', '2', '0', '1', '12181', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('233', 'Gear Shift', '162', '1', '0', '1', '12177', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('234', 'Gear Shift', '163', '1', '0', '1', '12177', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('235', 'Engine', '164', '2', '0', '1', '12181', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('236', 'Take Off', '165', '1', '0', '1', '12175', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('237', 'Land', '166', '1', '0', '1', '12174', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('238', 'Engine', '167', '2', '0', '1', '12171', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('239', 'Engine', '168', '2', '0', '1', '12171', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('240', 'Engine', '169', '2', '0', '1', '12171', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('241', 'Gear Shift', '161', '1', '0', '1', '12173', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('242', 'Gear Shift', '164', '1', '0', '1', '12173', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('243', 'Gear Shift', '157', '1', '0', '1', '12173', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('244', 'Engine', '163', '2', '0', '1', '12178', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('245', 'Engine', '162', '2', '0', '1', '12178', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('246', 'Engine', '170', '2', '0', '1', '12172', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('247', 'Gear Shift', '170', '1', '0', '1', '12173', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('248', 'Engine', '171', '2', '0', '1', '12172', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('250', 'Gear Shift', '168', '1', '0', '1', '12173', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('251', 'Gear Shift', '167', '1', '0', '1', '12173', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('252', 'Engine', '165', '2', '0', '1', '12194', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('253', 'Engine', '166', '2', '0', '1', '12172', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('254', 'Land', '172', '1', '0', '1', '12174', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('255', 'Engine', '172', '2', '0', '1', '12171', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('256', 'Engine', '173', '2', '0', '1', '12194', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('258', 'Catapult Arm', '175', '1', '0', '1', '13809', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('260', 'Catapult Arm', '176', '1', '0', '1', '13807', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('265', 'Engine', '181', '2', '0', '1', '12301', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('266', 'RocketMountWalk', '182', '2', '0', '1', '12302', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('267', 'Engine', '183', '2', '0', '1', '12303', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('268', 'Engine', '184', '2', '0', '1', '12304', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('269', 'Engine', '185', '2', '0', '1', '12308', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('270', 'Engine', '186', '2', '0', '1', '12315', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('271', 'Engine', '187', '2', '0', '1', '12315', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('272', 'Engine', '188', '2', '0', '1', '12315', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('273', 'Engine', '189', '2', '0', '1', '12304', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('274', 'Engine', '190', '2', '0', '1', '12314', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('275', 'Engine', '191', '2', '0', '1', '12313', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('276', 'Engine', '192', '2', '0', '1', '12315', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('277', 'Boost', '187', '1', '0', '1', '12310', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('278', 'Boost', '188', '1', '0', '1', '12311', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('279', 'Engine', '193', '2', '0', '1', '12315', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('280', 'Engine', '194', '2', '0', '1', '12308', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('281', 'Engine', '195', '2', '0', '1', '12303', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('282', 'Engine', '196', '2', '0', '1', '12308', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('283', 'SiegeVehicle_AttackThrown', '197', '1', '0', '1', '13891', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('284', 'SiegeVehicle_attackUnarmed', '198', '1', '0', '1', '13892', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('285', 'SiegeVehicle_Idle', '199', '2', '0', '1', '13894', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('286', 'SiegeVehicleSlow_Fast', '200', '2', '0', '1', '13895', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('287', 'SiegeVehicleSlow_FastGear', '200', '1', '0', '1', '14719', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('290', 'Gear Shift', '158', '1', '0', '1', '14719', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('291', 'Engine', '202', '2', '0', '1', '13883', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('292', 'Smack', '203', '1', '0', '1', '13881', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('293', 'Engine', '204', '2', '0', '1', '13885', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('294', 'Gear Shift', '204', '1', '0', '1', '14719', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('295', 'Launch', '205', '1', '0', '1', '13880', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('296', 'Load', '206', '1', '0', '1', '13884', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('303', 'Special', '221', '1', '0', '1', '16003', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('304', 'special', '222', '1', '0', '1', '12179', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('323', 'Death', '241', '1', '0', '1', '13882', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('324', 'Wound', '242', '1', '0', '1', '13886', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('325', 'FlyingMachineCreature_VehicleRun', '243', '2', '0', '1', '13814', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('326', 'FlyingMachineCreature_VehicleSGroundDown', '244', '1', '0', '1', '13815', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('327', 'FlyingMachineCreature_VehicleSitGroundUp', '245', '1', '0', '1', '13816', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('329', 'FlyingMachineCreature_VehicleWalkBackwards', '247', '2', '0', '1', '13818', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('330', 'GearShift', '246', '1', '0', '1', '14720', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('331', 'GearShift', '243', '1', '0', '1', '14720', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('332', 'GearShift', '247', '1', '0', '1', '14720', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('343', 'Death', '261', '1', '0', '1', '13893', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('344', 'SiegeVehicleWounds', '262', '1', '0', '1', '13896', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('346', 'Wintergrasp_Catapult_Death', '263', '1', '0', '1', '13808', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('347', 'Wintergrasp_Catapult_Wound', '264', '1', '0', '1', '13813', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('348', 'Attack Thrown', '265', '1', '0', '1', '13897', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('349', 'Jump End', '266', '1', '0', '1', '13898', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('350', 'Jump Start', '267', '1', '0', '1', '13899', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('351', 'Load Thrown', '268', '1', '0', '1', '13900', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('352', 'Stand', '269', '2', '0', '1', '13901', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('353', 'Walk Run', '270', '2', '0', '1', '13902', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('354', 'Gear', '270', '1', '0', '1', '14719', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('355', 'Run', '267', '2', '0', '1', '13902', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('356', 'Run', '266', '2', '0', '1', '13902', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('384', 'Stand', '246', '2', '0', '1', '13817', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('443', 'Off Vehicle', '321', '2', '0', '1', '12748', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('463', 'Flame Leviathan Wound', '341', '1', '0', '1', '15378', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('464', 'Flame Leviathan Death', '342', '1', '0', '1', '15381', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('465', 'Flame Leviathan Idle', '343', '2', '0', '1', '15380', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('466', 'Flame Leviathan Attack Unarmed', '344', '1', '0', '1', '15382', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('467', 'Flame Leviathan Attack Thrown', '345', '1', '0', '1', '15383', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('468', 'Flame Leviathan Walk run', '346', '2', '0', '1', '15379', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('469', 'Flame Leviathan Gearshift', '346', '1', '0', '1', '14719', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('523', 'MimironHeadMount_Run', '361', '2', '0', '1', '15830', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('524', 'GearShiftAir', '361', '1', '0', '1', '14720', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('525', 'MimironHeadMount_Walk', '362', '2', '0', '1', '15831', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('526', 'GearShiftGround', '362', '1', '0', '1', '14719', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('527', 'MimironHeadMount_JumpStart', '363', '1', '0', '1', '15832', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('528', 'MimironHeadMount_JumpEnd', '364', '1', '0', '1', '15833', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('529', 'Walk', '364', '2', '0', '1', '15831', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('530', 'SwimIdle', '365', '2', '0', '1', '15830', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('543', 'Orc_Fortress_Elevator01_Moving', '381', '2', '0', '1', '15277', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('563', 'Loop', '33', '2', '0', '1', '12176', '0', '10', '0', '85', '121');
INSERT INTO `objecteffect` VALUES ('564', 'Orc_Fortress_Elevator01_Decellerate', '401', '1', '0', '1', '15276', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('565', 'Orc_Fortress_Elevator01_Accellerate', '402', '1', '0', '1', '15275', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('566', 'Vr_elevator_lift_Decellerate', '403', '3', '0', '1', '15286', '0', '10', '0', '85', '0');
INSERT INTO `objecteffect` VALUES ('567', 'Vr_elevator_lift_Moving', '404', '2', '0', '1', '15879', '0', '10', '0', '85', '0');
INSERT INTO `objecteffect` VALUES ('568', 'Vr_elevator_lift_Moving', '403', '2', '0', '1', '15287', '0', '10', '0', '85', '123');
INSERT INTO `objecteffect` VALUES ('569', 'Vr_elevator_lift_Moving', '34', '2', '0', '1', '15287', '0', '10', '0', '85', '124');
INSERT INTO `objecteffect` VALUES ('571', 'GateClose', '405', '1', '0', '1', '10998', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('583', 'InMotion', '421', '2', '0', '1', '15902', '0', '0', '27', '0', '141');
INSERT INTO `objecteffect` VALUES ('603', 'Gear Loop', '441', '2', '0', '1', '13978', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('623', 'Loop', '461', '2', '0', '1', '13977', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('624', 'Open (center)', '462', '1', '0', '1', '13973', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('625', 'Close (center)', '463', '1', '0', '1', '13974', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('626', 'Open Loop (center)', '464', '2', '0', '1', '15903', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('643', 'Open Loop (west)', '464', '2', '0', '1', '15903', '0', '0', '30', '0', '0');
INSERT INTO `objecteffect` VALUES ('644', 'Open Loop (east)', '464', '2', '0', '1', '15903', '0', '0', '-30', '0', '0');
INSERT INTO `objecteffect` VALUES ('663', 'Open', '481', '1', '0', '1', '15859', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('683', 'Open', '501', '1', '0', '1', '15325', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('703', 'Fire', '421', '2', '0', '1', '15916', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('723', 'VrykulTransportShip_Inmotion', '521', '2', '0', '1', '15281', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('743', 'hf_elevator_lift_Loop', '541', '2', '0', '1', '15274', '0', '0', '0', '0', '161');
INSERT INTO `objecteffect` VALUES ('783', 'HordeGunShip (IceCrown)', '282', '2', '0', '1', '15013', '0', '0', '0', '0', '181');
INSERT INTO `objecteffect` VALUES ('784', 'LargePropellers_A (IceCrown)', '281', '2', '0', '1', '16534', '0', '0', '0', '0', '182');
INSERT INTO `objecteffect` VALUES ('786', 'ND_AllianceGunship_Always', '582', '2', '0', '1', '17187', '0', '0', '0', '0', '184');
INSERT INTO `objecteffect` VALUES ('803', 'HordeGunshipState_00 (Small)', '581', '2', '0', '1', '17188', '0', '0', '0', '0', '201');
INSERT INTO `objecteffect` VALUES ('804', 'IceCrown_Elevator02_Start', '601', '1', '0', '1', '17207', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('805', 'IceCrown_Elevator02_Moving', '602', '2', '0', '1', '17209', '0', '0', '0', '0', '202');
INSERT INTO `objecteffect` VALUES ('806', 'IceCrown_Elevator02_Stop', '603', '1', '0', '1', '17208', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('807', 'Icecrown_Elevator_Start', '602', '1', '0', '1', '17207', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('808', 'IcecrownElevatorStop', '602', '3', '0', '1', '17208', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('814', 'DeeprunTram_Start', '608', '1', '0', '1', '17473', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('815', 'DeeprunTram_Stop', '608', '3', '0', '1', '17474', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('816', 'Loop', '608', '2', '0', '1', '17469', '0', '0', '0', '-10', '0');
INSERT INTO `objecteffect` VALUES ('819', 'South', '609', '2', '0', '1', '15344', '0', '-6', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('820', 'North', '609', '2', '0', '1', '15344', '0', '6', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('821', 'West', '609', '2', '0', '1', '15344', '0', '0', '6', '0', '0');
INSERT INTO `objecteffect` VALUES ('822', 'East', '609', '2', '0', '1', '15344', '0', '0', '-6', '0', '0');
INSERT INTO `objecteffect` VALUES ('823', 'Loop', '610', '2', '0', '1', '17478', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('824', 'Flap', '611', '2', '0', '1', '17477', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('826', 'Flap (Copy)', '611', '2', '0', '1', '17477', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('827', 'Flap (Copy2)', '611', '2', '0', '1', '17477', '0', '0', '0', '0', '0');
INSERT INTO `objecteffect` VALUES ('828', 'Flap (Copy 3)', '611', '2', '0', '1', '17477', '0', '0', '0', '0', '0');
