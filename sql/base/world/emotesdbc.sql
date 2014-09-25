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
-- Table structure for table `emotesdbc`
--

DROP TABLE IF EXISTS `emotesdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emotesdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `AnimationId` int(10) NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  `EmoteType` int(10) NOT NULL DEFAULT '0',
  `UnitStandState` int(10) NOT NULL DEFAULT '0',
  `SoundId` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emotesdbc`
--

LOCK TABLES `emotesdbc` WRITE;
/*!40000 ALTER TABLE `emotesdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `emotesdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `emotesdbc`
--

INSERT INTO `emotesdbc` VALUES ('0', 'ONESHOT_NONE', '0', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('1', 'ONESHOT_TALK(DNR)', '60', '140', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('2', 'ONESHOT_BOW', '66', '18433', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('3', 'ONESHOT_WAVE(DNR)', '67', '2048', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('4', 'ONESHOT_CHEER(DNR)', '68', '2048', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('5', 'ONESHOT_EXCLAMATION(DNR)', '64', '164', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('6', 'ONESHOT_QUESTION', '65', '148', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('7', 'ONESHOT_EAT', '61', '2048', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('10', 'STATE_DANCE', '69', '28801', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('11', 'ONESHOT_LAUGH', '70', '2432', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('12', 'STATE_SLEEP', '0', '25090', '1', '3', '0');
INSERT INTO `emotesdbc` VALUES ('13', 'STATE_SIT', '0', '25090', '1', '1', '0');
INSERT INTO `emotesdbc` VALUES ('14', 'ONESHOT_RUDE(DNR)', '73', '1', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('15', 'ONESHOT_ROAR(DNR)', '74', '4', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('16', 'ONESHOT_KNEEL', '75', '16384', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('17', 'ONESHOT_KISS', '76', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('18', 'ONESHOT_CRY', '77', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('19', 'ONESHOT_CHICKEN', '78', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('20', 'ONESHOT_BEG', '79', '16384', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('21', 'ONESHOT_APPLAUD', '80', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('22', 'ONESHOT_SHOUT(DNR)', '81', '2240', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('23', 'ONESHOT_FLEX', '82', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('24', 'ONESHOT_SHY(DNR)', '83', '16384', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('25', 'ONESHOT_POINT(DNR)', '84', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('26', 'STATE_STAND', '0', '25090', '1', '0', '0');
INSERT INTO `emotesdbc` VALUES ('27', 'STATE_READYUNARMED', '25', '26624', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('28', 'STATE_WORK_SHEATHED', '62', '24576', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('29', 'STATE_POINT(DNR)', '84', '16384', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('30', 'STATE_NONE', '0', '16384', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('33', 'ONESHOT_WOUND', '9', '1024', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('34', 'ONESHOT_WOUNDCRITICAL', '10', '1024', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('35', 'ONESHOT_ATTACKUNARMED', '16', '17412', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('36', 'ONESHOT_ATTACK1H', '17', '17412', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('37', 'ONESHOT_ATTACK2HTIGHT', '18', '17412', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('38', 'ONESHOT_ATTACK2HLOOSE', '19', '17412', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('39', 'ONESHOT_PARRYUNARMED', '20', '17412', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('43', 'ONESHOT_PARRYSHIELD', '24', '17412', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('44', 'ONESHOT_READYUNARMED', '25', '1024', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('45', 'ONESHOT_READY1H', '26', '1024', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('48', 'ONESHOT_READYBOW', '29', '1024', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('50', 'ONESHOT_SPELLPRECAST', '31', '17408', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('51', 'ONESHOT_SPELLCAST', '32', '17408', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('53', 'ONESHOT_BATTLEROAR', '55', '1024', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('54', 'ONESHOT_SPECIALATTACK1H', '57', '17412', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('60', 'ONESHOT_KICK', '95', '17408', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('61', 'ONESHOT_ATTACKTHROWN', '107', '17408', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('64', 'STATE_STUN', '14', '19456', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('65', 'STATE_DEAD', '0', '26114', '1', '7', '0');
INSERT INTO `emotesdbc` VALUES ('66', 'ONESHOT_SALUTE', '113', '2048', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('68', 'STATE_KNEEL', '0', '25090', '1', '8', '0');
INSERT INTO `emotesdbc` VALUES ('69', 'STATE_USESTANDING', '63', '26624', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('70', 'ONESHOT_WAVE_NOSHEATHE', '67', '4', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('71', 'ONESHOT_CHEER_NOSHEATHE', '68', '4', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('92', 'ONESHOT_EAT_NOSHEATHE', '199', '4', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('93', 'STATE_STUN_NOSHEATHE', '137', '16388', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('94', 'ONESHOT_DANCE', '69', '16384', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('113', 'ONESHOT_SALUTE_NOSHEATH', '210', '4', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('133', 'STATE_USESTANDING_NOSHEATHE', '138', '8192', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('153', 'ONESHOT_LAUGH_NOSHEATHE', '70', '4', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('173', 'STATE_WORK', '136', '24580', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('193', 'STATE_SPELLPRECAST', '31', '16384', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('213', 'ONESHOT_READYRIFLE', '48', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('214', 'STATE_READYRIFLE', '48', '8192', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('233', 'STATE_WORK_MINING', '136', '8192', '2', '0', '3782');
INSERT INTO `emotesdbc` VALUES ('234', 'STATE_WORK_CHOPWOOD', '136', '8192', '2', '0', '3202');
INSERT INTO `emotesdbc` VALUES ('253', 'STATE_APPLAUD', '80', '24576', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('254', 'ONESHOT_LIFTOFF', '192', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('273', 'ONESHOT_YES(DNR)', '185', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('274', 'ONESHOT_NO(DNR)', '186', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('275', 'ONESHOT_TRAIN(DNR)', '195', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('293', 'ONESHOT_LAND', '200', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('313', 'STATE_AT_EASE', '0', '0', '1', '2', '0');
INSERT INTO `emotesdbc` VALUES ('333', 'STATE_READY1H', '26', '24576', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('353', 'STATE_SPELLKNEELSTART', '140', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('373', 'STAND_STATE_SUBMERGED', '202', '0', '1', '0', '0');
INSERT INTO `emotesdbc` VALUES ('374', 'ONESHOT_SUBMERGE', '201', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('375', 'STATE_READY2H', '27', '24576', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('376', 'STATE_READYBOW', '29', '8192', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('377', 'ONESHOT_MOUNTSPECIAL', '94', '49153', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('378', 'STATE_TALK', '60', '24576', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('379', 'STATE_FISHING', '134', '24577', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('380', 'ONESHOT_FISHING', '133', '20484', '0', '0', '3354');
INSERT INTO `emotesdbc` VALUES ('381', 'ONESHOT_LOOT', '50', '17412', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('382', 'STATE_WHIRLWIND', '126', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('383', 'STATE_DROWNED', '132', '16384', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('384', 'STATE_HOLD_BOW', '109', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('385', 'STATE_HOLD_RIFLE', '110', '16384', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('386', 'STATE_HOLD_THROWN', '111', '16384', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('387', 'ONESHOT_DROWN', '131', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('388', 'ONESHOT_STOMP', '181', '16384', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('389', 'ONESHOT_ATTACKOFF', '87', '17408', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('390', 'ONESHOT_ATTACKOFFPIERCE', '88', '17408', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('391', 'STATE_ROAR', '74', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('392', 'STATE_LAUGH', '70', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('393', 'ONESHOT_CREATURE_SPECIAL', '130', '1024', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('394', 'ONESHOT_JUMPLANDRUN', '187', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('395', 'ONESHOT_JUMPEND', '39', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('396', 'ONESHOT_TALK_NOSHEATHE', '208', '136', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('397', 'ONESHOT_POINT_NOSHEATHE', '209', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('398', 'STATE_CANNIBALIZE', '203', '16384', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('399', 'ONESHOT_JUMPSTART', '37', '1024', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('400', 'STATE_DANCESPECIAL', '211', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('401', 'ONESHOT_DANCESPECIAL', '211', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('402', 'ONESHOT_CUSTOMSPELL01', '213', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('403', 'ONESHOT_CUSTOMSPELL02', '214', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('404', 'ONESHOT_CUSTOMSPELL03', '215', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('405', 'ONESHOT_CUSTOMSPELL04', '216', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('406', 'ONESHOT_CUSTOMSPELL05', '217', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('407', 'ONESHOT_CUSTOMSPELL06', '218', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('408', 'ONESHOT_CUSTOMSPELL07', '219', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('409', 'ONESHOT_CUSTOMSPELL08', '220', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('410', 'ONESHOT_CUSTOMSPELL09', '221', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('411', 'ONESHOT_CUSTOMSPELL10', '222', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('412', 'STATE_EXCLAIM', '64', '4104', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('413', 'STATE_DANCE_CUSTOM', '0', '28801', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('415', 'STATE_SIT_CHAIR_MED', '103', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('416', 'STATE_CUSTOM_SPELL_01', '213', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('417', 'STATE_CUSTOM_SPELL_02', '214', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('418', 'STATE_EAT', '61', '0', '2', '0', '-1');
INSERT INTO `emotesdbc` VALUES ('419', 'STATE_CUSTOM_SPELL_04', '216', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('420', 'STATE_CUSTOM_SPELL_03', '215', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('421', 'STATE_CUSTOM_SPELL_05', '217', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('422', 'STATE_SPELLEFFECT_HOLD', '158', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('423', 'STATE_EAT_NO_SHEATHE', '199', '20996', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('424', 'STATE_MOUNT', '91', '56', '1', '0', '0');
INSERT INTO `emotesdbc` VALUES ('425', 'STATE_READY2HL', '28', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('426', 'STATE_SIT_CHAIR_HIGH', '104', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('427', 'STATE_FALL', '40', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('428', 'STATE_LOOT', '188', '4096', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('429', 'STATE_SUBMERGED', '202', '16384', '2', '1', '0');
INSERT INTO `emotesdbc` VALUES ('430', 'ONESHOT_COWER(DNR)', '225', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('431', 'STATE_COWER', '225', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('432', 'ONESHOT_USESTANDING', '63', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('433', 'STATE_STEALTH_STAND', '120', '16384', '2', '0', '3325');
INSERT INTO `emotesdbc` VALUES ('434', 'ONESHOT_OMNICAST_GHOUL (W/SOUND', '54', '0', '0', '0', '410');
INSERT INTO `emotesdbc` VALUES ('435', 'ONESHOT_ATTACKBOW', '46', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('436', 'ONESHOT_ATTACKRIFLE', '49', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('437', 'STATE_SWIM_IDLE', '41', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('438', 'STATE_ATTACK_UNARMED', '16', '0', '2', '0', '3782');
INSERT INTO `emotesdbc` VALUES ('439', 'ONESHOT_SPELLCAST (W/SOUND)', '32', '8448', '0', '0', '3202');
INSERT INTO `emotesdbc` VALUES ('440', 'ONESHOT_DODGE', '30', '17412', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('441', 'ONESHOT_PARRY1H', '21', '17412', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('442', 'ONESHOT_PARRY2H', '22', '17412', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('443', 'ONESHOT_PARRY2HL', '28', '17412', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('444', 'STATE_FLYFALL', '269', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('445', 'ONESHOT_FLYDEATH', '230', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('446', 'STATE_FLY_FALL', '269', '512', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('447', 'ONESHOT_FLY_SIT_GROUND_DOWN', '325', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('448', 'ONESHOT_FLY_SIT_GROUND_UP', '327', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('449', 'ONESHOT_EMERGE', '224', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('450', 'ONESHOT_DRAGONSPIT', '182', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('451', 'STATE_SPECIALUNARMED', '118', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('452', 'ONESHOT_FLYGRAB', '455', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('453', 'STATE_FLYGRABCLOSED', '456', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('454', 'ONESHOT_FLYGRABTHROWN', '457', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('455', 'STATE_FLY_SIT_GROUND', '326', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('456', 'STATE_WALKBACKWARDS', '13', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('457', 'ONESHOT_FLYTALK', '289', '8', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('458', 'ONESHOT_FLYATTACK1H', '246', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('459', 'STATE_CUSTOMSPELL08', '220', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('460', 'ONESHOT_FLY_DRAGONSPIT', '411', '0', '0', '0', '7274');
INSERT INTO `emotesdbc` VALUES ('461', 'STATE_SIT_CHAIR_LOW', '102', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('462', 'ONE_SHOT_STUN', '14', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('463', 'ONESHOT_SPELLCAST_OMNI', '54', '0', '0', '0', '0');
INSERT INTO `emotesdbc` VALUES ('465', 'STATE_READYTHROWN', '108', '4096', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('466', 'ONESHOT_WORK_CHOPWOOD', '62', '8192', '0', '0', '3202');
INSERT INTO `emotesdbc` VALUES ('467', 'ONESHOT_WORK_MINING', '62', '8192', '0', '0', '3782');
INSERT INTO `emotesdbc` VALUES ('468', 'STATE_SPELL_CHANNEL_OMNI', '125', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('469', 'STATE_SPELL_CHANNEL_DIRECTED', '124', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('470', 'STAND_STATE_NONE', '0', '514', '1', '0', '0');
INSERT INTO `emotesdbc` VALUES ('471', 'STATE_READYJOUST', '476', '0', '1', '0', '0');
INSERT INTO `emotesdbc` VALUES ('473', 'STATE_STRANGULATE', '474', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('474', 'STATE_READYSPELLOMNI', '52', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('475', 'STATE_HOLD_JOUST', '478', '0', '2', '0', '0');
INSERT INTO `emotesdbc` VALUES ('476', 'ONESHOT_CRY (JAINA PROUDMOORE ONLY)', '77', '0', '0', '0', '16651');
