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
-- Table structure for table `mapdifficultydbc`
--

DROP TABLE IF EXISTS `mapdifficultydbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapdifficultydbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `MapId` int(10) NOT NULL DEFAULT '0',
  `Difficulty` int(10) NOT NULL DEFAULT '0',
  `AreaTriggerText` varchar(300) NOT NULL DEFAULT '',
  `AreaTriggerText_loc2` varchar(300) NOT NULL DEFAULT '',
  `ResetTime` int(10) NOT NULL DEFAULT '0',
  `MaxPlayers` int(10) NOT NULL DEFAULT '0',
  `DifficultyString` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapdifficultydbc`
--

LOCK TABLES `mapdifficultydbc` WRITE;
/*!40000 ALTER TABLE `mapdifficultydbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapdifficultydbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `mapdifficultydbc`
--

INSERT INTO `mapdifficultydbc` VALUES ('1', '0', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('2', '1', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('3', '13', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('4', '25', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('5', '29', '0', '', '', '0', '10', '');
INSERT INTO `mapdifficultydbc` VALUES ('6', '30', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('126', '30', '1', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('163', '30', '2', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('522', '30', '3', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('7', '33', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('8', '34', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('9', '35', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('10', '36', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('11', '37', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('12', '42', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('13', '43', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('14', '44', '0', '', '', '0', '10', '');
INSERT INTO `mapdifficultydbc` VALUES ('15', '47', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('16', '48', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('17', '70', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('18', '90', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('19', '109', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('20', '129', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('21', '169', '0', '', '', '0', '40', 'RAID_DIFFICULTY_40PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('22', '189', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('23', '209', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('24', '229', '0', '', '', '0', '15', '');
INSERT INTO `mapdifficultydbc` VALUES ('25', '230', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('26', '249', '0', 'You must be level 80 and in a raid group to enter.', 'Vous devez être de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '10', 'RAID_DIFFICULTY_10PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('323', '249', '1', 'You must be level 80 and in a raid group to enter.', 'Vous devez être de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('27', '269', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('127', '269', '1', 'Heroic Difficulty requires the Key of Time.', 'Le mode Héroïque requiert la clé du Temps.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('28', '289', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('29', '309', '0', '', '', '259200', '20', 'RAID_DIFFICULTY_20PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('30', '329', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('31', '349', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('32', '369', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('33', '389', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('34', '409', '0', '', '', '604800', '40', 'RAID_DIFFICULTY_40PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('35', '429', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('36', '449', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('37', '450', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('38', '451', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('39', '469', '0', '', '', '604800', '40', 'RAID_DIFFICULTY_40PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('40', '489', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('41', '509', '0', '', '', '259200', '20', 'RAID_DIFFICULTY_20PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('42', '529', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('43', '530', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('44', '531', '0', '', '', '604800', '40', 'RAID_DIFFICULTY_40PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('45', '532', '0', '', '', '604800', '10', 'RAID_DIFFICULTY_10PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('46', '533', '0', 'You must be level 80 and in a raid group to enter.', 'Vous devez être de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '10', 'RAID_DIFFICULTY_10PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('128', '533', '1', 'You must be level 80 and in a raid group to enter.', 'Vous devez être de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('47', '534', '0', '', '', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('48', '540', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('129', '540', '1', 'Heroic Difficulty requires the Flamewrought Key.', 'Le mode Héroïque requiert la clé en flammes forgées.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('49', '542', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('130', '542', '1', 'Heroic Difficulty requires the Flamewrought Key.', 'Le mode Héroïque requiert la clé en flammes forgées.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('50', '543', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('131', '543', '1', 'Heroic Difficulty requires the Flamewrought Key.', 'Le mode Héroïque requiert la clé en flammes forgées.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('51', '544', '0', '', '', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('52', '545', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('132', '545', '1', 'Heroic Difficulty requires the Reservoir Key.', 'Le mode Héroïque requiert la clé du réservoir.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('53', '546', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('133', '546', '1', 'Heroic Difficulty requires the Reservoir Key.', 'Le mode Héroïque requiert la clé du réservoir.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('54', '547', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('134', '547', '1', 'Heroic Difficulty requires the Reservoir Key.', 'Le mode Héroïque requiert la clé du réservoir.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('55', '548', '0', '', '', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('56', '550', '0', '', '', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('57', '552', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('135', '552', '1', 'Heroic Difficulty requires the Warpforged Key.', 'Le mode Héroïque requiert la clé dimensionnelle.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('58', '553', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('136', '553', '1', 'Heroic Difficulty requires the Warpforged Key.', 'Le mode Héroïque requiert la clé dimensionnelle.', '86400', '0', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('59', '554', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('137', '554', '1', 'Heroic Difficulty requires the Warpforged Key.', 'Le mode Héroïque requiert la clé dimensionnelle.', '86400', '0', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('60', '555', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('138', '555', '1', 'Heroic Difficulty requires the Auchenai Key.', 'Le mode Héroïque requiert la clé Auchenaï.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('61', '556', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('139', '556', '1', 'Heroic Difficulty requires the Auchenai Key.', 'Le mode Héroïque requiert la clé Auchenaï.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('62', '557', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('140', '557', '1', 'Heroic Difficulty requires the Auchenai Key.', 'Le mode Héroïque requiert la clé Auchenaï.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('63', '558', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('141', '558', '1', 'Heroic Difficulty requires the Auchenai Key.', 'Le mode Héroïque requiert la clé Auchenaï.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('64', '559', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('65', '560', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('142', '560', '1', 'Heroic Difficulty requires the Key of Time.', 'Le mode Héroïque requiert la clé du Temps.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('66', '562', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('67', '564', '0', '', '', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('68', '565', '0', '', '', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('69', '566', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('70', '568', '0', '', '', '259200', '10', 'RAID_DIFFICULTY_10PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('71', '571', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('72', '572', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('73', '573', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('74', '574', '0', 'You must be at least level 65 to enter.', 'Vous devez être au moins de niveau 65 pour entrer.', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('143', '574', '1', 'Heroic Difficulty requires you to be level 80.', 'Vous devez être de niveau 80 pour accéder au mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('75', '575', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('144', '575', '1', 'Heroic Difficulty requires you to be level 80.', 'Vous devez être de niveau 80 pour accéder au mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('76', '576', '0', 'You must be at least level 66 to enter.', 'Vous devez être au moins de niveau 66 pour entrer.', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('145', '576', '1', 'Heroic Difficulty requires you to be level 80.', 'Vous devez être de niveau 80 pour accéder au mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('77', '578', '0', 'You must be at least level 75 to enter.', 'Vous devez être au moins de niveau 75 pour entrer.', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('146', '578', '1', 'Heroic Difficulty requires you to be level 80.', 'Vous devez être de niveau 80 pour accéder au mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('78', '580', '0', '', '', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('79', '582', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('80', '584', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('81', '585', '0', '', '', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('147', '585', '1', 'Heroic Difficulty requires completion of the \"Hard to Kill\" quest.', 'Le mode Héroïque requiert d\'avoir terminé la quête « L\'increvable ».', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('82', '586', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('83', '587', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('84', '588', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('85', '589', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('86', '590', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('87', '591', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('88', '592', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('89', '593', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('90', '594', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('91', '595', '0', 'You must be at least level 75 to enter.', 'Vous devez être au moins de niveau 75 pour entrer.', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('148', '595', '1', 'Heroic Difficulty requires you to be level 80.', 'Vous devez être de niveau 80 pour accéder au mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('92', '596', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('93', '597', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('94', '598', '0', '', '', '0', '5', '');
INSERT INTO `mapdifficultydbc` VALUES ('149', '598', '1', 'Heroic Difficulty requires the Sunforged Key[PH].', 'Le mode Héroïque requiert la clé solforgée.', '86400', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('95', '599', '0', 'You must be at least level 72 to enter.', 'Vous devez être au moins de niveau 72 pour entrer.', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('150', '599', '1', 'Heroic Difficulty requires you to be level 80.', 'Vous devez être de niveau 80 pour accéder au mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('96', '600', '0', 'You must be at least level 69 to enter.', 'Vous devez être au moins de niveau 69 pour entrer.', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('151', '600', '1', 'Heroic Difficulty requires you to be level 80.', 'Vous devez être de niveau 80 pour accéder au mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('97', '601', '0', 'You must be at least level 67 to enter.', 'Vous devez être au moins de niveau 67 pour entrer.', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('152', '601', '1', 'Heroic Difficulty requires you to be level 80.', 'Vous devez être de niveau 80 pour accéder au mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('98', '602', '0', 'You must be at least level 75 to enter.', 'Vous devez être au moins de niveau 75 pour entrer.', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('153', '602', '1', 'Heroic Difficulty requires you to be level 80.', 'Vous devez être de niveau 80 pour accéder au mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('99', '603', '0', 'You must be level 80 and in a raid group to enter.', 'Vous devez être de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '10', 'RAID_DIFFICULTY_10PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('154', '603', '1', 'You must be level 80 and in a raid group to enter.', 'Vous devez être de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('100', '604', '0', 'You must be at least level 71 to enter.', 'Vous devez être au moins de niveau 71 pour entrer.', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('155', '604', '1', 'Heroic Difficulty requires you to be level 80.', 'Vous devez être de niveau 80 pour accéder au mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('101', '605', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('102', '606', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('103', '607', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('301', '607', '1', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('104', '608', '0', 'You must be at least level 70 to enter.', 'Vous devez être au moins de niveau 70 pour entrer.', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('156', '608', '1', 'Heroic Difficulty requires you to be level 80.', 'Vous devez être de niveau 80 pour accéder au mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('105', '609', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('106', '610', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('107', '612', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('108', '613', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('109', '614', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('110', '615', '0', 'You must be level 80 and in a raid group to enter.', 'Vous devez être de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '10', 'RAID_DIFFICULTY_10PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('157', '615', '1', 'You must be level 80 and in a raid group to enter.', 'Vous devez être de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('111', '616', '0', 'You must be at least level 80 and in a raid group to enter.', 'Vous devez être au moins de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '10', 'RAID_DIFFICULTY_10PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('158', '616', '1', 'You must be at least level 80 and in a raid group to enter.', 'Vous devez être au moins de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('112', '617', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('113', '618', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('114', '619', '0', 'You must be at least level 68 to enter.', 'Vous devez être au moins de niveau 68 pour entrer.', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('159', '619', '1', 'Heroic Difficulty requires you to be level 80.', 'Vous devez être de niveau 80 pour accéder au mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('115', '620', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('116', '621', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('117', '622', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('118', '623', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('119', '624', '0', 'You must be at least level 80, in control of Wintergrasp and in a raid group to enter.', 'Vous devez être au moins de niveau 80, avoir le contrôle de Joug-d\'hiver et faire partie d\'un groupe de raid pour entrer.', '604800', '10', 'RAID_DIFFICULTY_10PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('160', '624', '1', 'You must be at least level 80, in control of Wintergrasp and in a raid group to enter.', 'Vous devez être au moins de niveau 80, avoir le contrôle de Joug-d\'hiver et faire partie d\'un groupe de raid pour entrer.', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('120', '628', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('281', '628', '1', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('485', '631', '0', 'You must be at least level 80 and in a raid group to enter.', 'Vous devez être au moins de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '10', 'RAID_DIFFICULTY_10PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('486', '631', '1', 'You must be at least level 80 and in a raid group to enter.', 'Vous devez être au moins de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('487', '631', '2', 'You must have defeated The Lich King in the 10 Player raid before attempting 10 Player Heroic difficulty.', 'Vous devez avoir vaincu le roi-liche en raid 10 joueurs avant de pouvoir tenter le mode héroïque à 10 joueurs.', '604800', '10', 'RAID_DIFFICULTY_10PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('488', '631', '3', 'You must have defeated The Lich King in the 25 Player raid before attempting 25 Player Heroic difficulty.', 'Vous devez avoir vaincu le roi-liche en raid 25 joueurs avant de pouvoir tenter le mode héroïque à 25 joueurs.', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('481', '632', '0', 'You must be at least level 75 to enter.', 'Vous devez être au moins de niveau 75 pour entrer.', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('482', '632', '1', 'Heroic Difficulty requires you to be level 80.', 'Vous devez être de niveau 80 pour accéder au mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('121', '641', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('122', '642', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('123', '647', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('124', '649', '0', 'You must be at least level 80 and in a raid group to enter.', 'Vous devez être au moins de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '10', 'RAID_DIFFICULTY_10PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('161', '649', '1', 'You must be at least level 80 and in a raid group to enter.', 'Vous devez être au moins de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('221', '649', '2', 'You must be at least level 80 and in a raid group to enter.', 'Vous devez être au moins de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '10', 'RAID_DIFFICULTY_10PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('222', '649', '3', 'You must be at least level 80 and in a raid group to enter.', 'Vous devez être au moins de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '25', 'RAID_DIFFICULTY_25PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('125', '650', '0', 'You must be at least level 75 to enter.', 'Vous devez être au moins de niveau 75 pour entrer.', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('162', '650', '1', 'Heroic Difficulty requires you to be level 80.', 'Vous devez être de niveau 80 pour accéder au mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('483', '658', '0', 'You must complete the quest \"Echoes of Tortured Souls\" before entering the Pit of Saron.', 'Vous devez avoir terminé la quête « Les échos des âmes torturées » avant d\'entrer dans la fosse de Saron.', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('484', '658', '1', 'You must complete the quest \"Echoes of Tortured Souls\" and be level 80 before entering the Heroic difficulty of the Pit of Saron.', 'Vous devez avoir terminé la quête « Les échos des âmes torturées » et être de niveau 80 avant d\'entrer dans la fosse de Saron en mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('341', '668', '0', 'You must complete the quest \"Deliverance from the Pit\" before entering the Halls of Reflection.', 'Vous devez avoir terminé la quête « Libérés de la fosse » avant d\'entrer dans les salles des Reflets.', '0', '5', 'DUNGEON_DIFFICULTY_5PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('342', '668', '1', 'You must complete the quest \"Deliverance from the Pit\" and be level 80 before entering the Heroic difficulty of the Halls of Reflection.', 'Vous devez avoir terminé la quête « Libérés de la fosse » et être de niveau 80 avant d\'entrer dans les salles des Reflets en mode héroïque.', '86400', '5', 'DUNGEON_DIFFICULTY_5PLAYER_HEROIC');
INSERT INTO `mapdifficultydbc` VALUES ('642', '712', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('641', '713', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('701', '718', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('744', '723', '0', '', '', '0', '0', '');
INSERT INTO `mapdifficultydbc` VALUES ('750', '724', '0', 'You must be level 80 and in a raid group to enter.', 'Vous devez être de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '10', 'RAID_DIFFICULTY_10PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('751', '724', '1', 'You must be level 80 and in a raid group to enter.', 'Vous devez être de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('752', '724', '2', 'You must be level 80 and in a raid group to enter.', 'Vous devez être de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '10', 'RAID_DIFFICULTY_10PLAYER');
INSERT INTO `mapdifficultydbc` VALUES ('753', '724', '3', 'You must be level 80 and in a raid group to enter.', 'Vous devez être de niveau 80 et faire partie d\'un groupe de raid pour entrer.', '604800', '25', 'RAID_DIFFICULTY_25PLAYER');
