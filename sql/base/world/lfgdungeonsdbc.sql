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
-- Table structure for table `lfgdungeonsdbc`
--

DROP TABLE IF EXISTS `lfgdungeonsdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lfgdungeonsdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `MinLevel` int(10) NOT NULL DEFAULT '0',
  `MaxLevel` int(10) NOT NULL DEFAULT '0',
  `RecLevel` int(10) NOT NULL DEFAULT '0',
  `RecMinLevel` int(10) NOT NULL DEFAULT '0',
  `RecMaxLevel` int(10) NOT NULL DEFAULT '0',
  `MapId` int(10) NOT NULL DEFAULT '0',
  `Difficulty` int(10) NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  `Type` int(10) NOT NULL DEFAULT '0',
  `Unk` int(10) NOT NULL DEFAULT '0',
  `IconName` varchar(100) NOT NULL DEFAULT '',
  `Expansion` int(10) NOT NULL DEFAULT '0',
  `Unk2` int(10) NOT NULL DEFAULT '0',
  `GroupType` int(10) NOT NULL DEFAULT '0',
  `Description` varchar(300) NOT NULL DEFAULT '',
  `Description_loc2` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lfgdungeonsdbc`
--

LOCK TABLES `lfgdungeonsdbc` WRITE;
/*!40000 ALTER TABLE `lfgdungeonsdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `lfgdungeonsdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `lfgdungeonsdbc`
--

INSERT INTO `lfgdungeonsdbc` VALUES ('1', 'Wailing Caverns', 'Cavernes des lamentations', '15', '25', '19', '17', '20', '43', '0', '3', '1', '-1', 'WAILINGCAVERNS', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('2', 'Scholomance', 'Scholomance', '55', '65', '60', '0', '0', '289', '0', '3', '1', '-1', 'SCHOLOMANCE', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('4', 'Ragefire Chasm', 'Gouffre de Ragefeu', '15', '21', '16', '15', '16', '389', '0', '3', '1', '0', 'RAGEFIRECHASM', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('6', 'Deadmines', 'Mortemines', '15', '25', '19', '17', '20', '36', '0', '3', '1', '-1', 'DEADMINES', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('8', 'Shadowfang Keep', 'Donjon d\'Ombrecroc', '16', '26', '20', '18', '21', '33', '0', '3', '1', '-1', 'SHADOWFANGKEEP', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('10', 'Blackfathom Deeps', 'Profondeurs de Brassenoire', '19', '29', '23', '21', '24', '48', '0', '3', '1', '-1', 'BLACKFATHOMDEEPS', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('12', 'Stormwind Stockade', 'Prison de Hurlevent', '20', '30', '24', '22', '25', '34', '0', '3', '1', '1', 'STORMWINDSTOCKADES', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('14', 'Gnomeregan', 'Gnomeregan', '23', '33', '27', '25', '28', '90', '0', '3', '1', '-1', 'GNOMEREGAN', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('16', 'Razorfen Kraul', 'Kraal de Tranchebauge', '22', '32', '26', '24', '27', '47', '0', '3', '1', '-1', 'RAZORFENKRAUL', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('18', 'Scarlet Monastery - Graveyard', 'Monastère écarlate - Cimetière', '27', '37', '31', '29', '32', '189', '0', '3', '1', '-1', 'SCARLETMONASTERY', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('20', 'Razorfen Downs', 'Souilles de Tranchebauge', '32', '42', '36', '34', '37', '129', '0', '3', '1', '-1', 'RAZORFENDOWNS', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('22', 'Uldaman', 'Uldaman', '35', '45', '39', '37', '40', '70', '0', '3', '1', '-1', 'ULDAMAN', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('24', 'Zul\'Farrak', 'Zul\'Farrak', '41', '51', '45', '43', '46', '209', '0', '3', '1', '-1', 'ZULFARAK', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('26', 'Maraudon - Orange Crystals', 'Maraudon - Cristaux oranges', '41', '51', '45', '43', '46', '349', '0', '3', '1', '-1', 'MARAUDON', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('28', 'Sunken Temple', 'Temple englouti', '45', '55', '49', '47', '50', '109', '0', '3', '1', '-1', 'SUNKENTEMPLE', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('30', 'Blackrock Depths - Prison', 'Profondeurs de Rochenoire - Prison', '47', '57', '51', '49', '52', '230', '0', '3', '1', '-1', 'BLACKROCKDEPTHS', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('32', 'Lower Blackrock Spire', 'Bas du pic Rochenoire', '55', '65', '58', '57', '58', '229', '0', '3', '1', '-1', 'BLACKROCKSPIRE', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('34', 'Dire Maul - East', 'Hache-tripes - est', '53', '63', '57', '55', '58', '429', '0', '3', '1', '-1', 'DIREMAUL', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('36', 'Dire Maul - West', 'Hache-tripes - ouest', '55', '65', '58', '58', '58', '429', '0', '3', '1', '-1', 'DIREMAUL', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('38', 'Dire Maul - North', 'Hache-tripes - nord', '55', '65', '60', '0', '0', '429', '0', '3', '1', '-1', 'DIREMAUL', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('40', 'Stratholme - Main Gate', 'Stratholme - Grande porte', '55', '65', '60', '0', '0', '329', '0', '3', '1', '-1', 'STRATHOLME', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('136', 'Hellfire Ramparts', 'Remparts des Flammes infernales', '57', '67', '63', '59', '62', '543', '0', '3', '1', '-1', 'HELLFIRECITADEL', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('137', 'Blood Furnace', 'Fournaise du sang', '59', '68', '64', '61', '63', '542', '0', '3', '1', '-1', 'HELLFIRECITADEL', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('138', 'Shattered Halls', 'Salles brisées', '67', '75', '70', '0', '0', '540', '0', '3', '1', '-1', 'HELLFIRECITADEL', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('140', 'Slave Pens', 'Enclos aux esclaves', '60', '69', '65', '62', '64', '547', '0', '3', '1', '-1', 'COILFANG', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('146', 'Underbog', 'Basse-tourbière', '61', '70', '66', '63', '65', '546', '0', '3', '1', '-1', 'COILFANG', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('147', 'The Steamvault', 'Caveau de la vapeur', '67', '75', '70', '0', '0', '545', '0', '3', '1', '-1', 'COILFANG', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('148', 'Mana-Tombs', 'Tombes-mana', '62', '71', '67', '64', '66', '557', '0', '3', '1', '-1', 'AUCHINDOUN', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('149', 'Auchenai Crypts', 'Cryptes Auchenaï', '63', '72', '68', '65', '67', '558', '0', '3', '1', '-1', 'AUCHINDOUN', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('150', 'Sethekk Halls', 'Salles des Sethekk', '65', '73', '69', '67', '68', '556', '0', '3', '1', '-1', 'AUCHINDOUN', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('151', 'Shadow Labyrinth', 'Labyrinthe des ombres', '67', '75', '70', '0', '0', '555', '0', '3', '1', '-1', 'AUCHINDOUN', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('163', 'Scarlet Monastery - Armory', 'Monastère écarlate - Armurerie', '32', '42', '36', '34', '37', '189', '0', '3', '1', '-1', 'SCARLETMONASTERY', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('164', 'Scarlet Monastery - Cathedral', 'Monastère écarlate - Cathédrale', '35', '45', '39', '37', '40', '189', '0', '3', '1', '-1', 'SCARLETMONASTERY', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('165', 'Scarlet Monastery - Library', 'Monastère écarlate - Bibliothèque', '30', '40', '34', '32', '35', '189', '0', '3', '1', '-1', 'SCARLETMONASTERY', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('170', 'The Escape From Durnholde', 'L\'évasion de Fort-de-Durn', '64', '73', '69', '66', '68', '560', '0', '3', '1', '-1', 'CAVERNSOFTIME', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('171', 'The Black Morass', 'Le Noir Marécage', '68', '75', '70', '0', '0', '269', '0', '3', '1', '-1', 'CAVERNSOFTIME', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('172', 'The Mechanar', 'Le Méchanar', '67', '75', '70', '0', '0', '554', '0', '3', '1', '-1', 'TEMPESTKEEP', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('173', 'The Botanica', 'La Botanica', '67', '75', '70', '0', '0', '553', '0', '3', '1', '-1', 'TEMPESTKEEP', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('174', 'The Arcatraz', 'L’Arcatraz', '68', '75', '70', '0', '0', '552', '0', '3', '1', '-1', 'TEMPESTKEEP', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('198', 'Magisters\' Terrace', 'Terrasse des Magistères', '68', '75', '70', '0', '0', '585', '0', '3', '1', '-1', 'MAGISTERSTERRACE', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('202', 'Utgarde Keep', 'Donjon d\'Utgarde', '68', '80', '72', '69', '72', '574', '0', '3', '1', '-1', 'UTGARDE', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('203', 'Utgarde Pinnacle', 'Cime d\'Utgarde', '77', '80', '80', '79', '80', '575', '0', '3', '1', '-1', 'UTGARDEPINNACLE', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('204', 'Azjol-Nerub', 'Azjol-Nérub', '70', '80', '74', '72', '74', '601', '0', '3', '1', '-1', 'AZJOLNERUB', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('206', 'The Oculus', 'L\'Oculus', '77', '80', '80', '79', '80', '578', '0', '3', '1', '-1', 'THEOCULUS', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('207', 'Halls of Lightning', 'Les salles de Foudre', '77', '80', '80', '79', '80', '602', '0', '3', '1', '-1', 'HALLSOFLIGHTNING', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('208', 'Halls of Stone', 'Les salles de Pierre', '75', '80', '78', '77', '79', '599', '0', '3', '1', '-1', 'HALLSOFSTONE', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('209', 'The Culling of Stratholme', 'L\'épuration de Stratholme', '77', '80', '80', '79', '80', '595', '0', '3', '1', '-1', 'CAVERNSOFTIME', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('214', 'Drak\'Tharon Keep', 'Donjon de Drak\'Tharon', '72', '80', '75', '74', '76', '600', '0', '3', '1', '-1', 'DRAKTHARON', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('216', 'Gundrak', 'Gundrak', '74', '80', '78', '76', '78', '604', '0', '3', '1', '-1', 'GUNDRAK', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('218', 'Ahn\'kahet: The Old Kingdom', 'Ahn\'kahet : l\'Ancien royaume', '71', '80', '75', '73', '75', '619', '0', '3', '1', '-1', 'AHNKALET', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('220', 'Violet Hold', 'Fort pourpre', '73', '80', '76', '75', '77', '608', '0', '3', '1', '-1', 'THEVIOLETHOLD', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('225', 'The Nexus', 'Le Nexus', '69', '80', '73', '71', '73', '576', '0', '3', '1', '-1', 'THENEXUS', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('245', 'Trial of the Champion', 'L\'épreuve du champion', '80', '80', '80', '79', '80', '650', '0', '3', '1', '-1', 'ARGENTDUNGEON', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('251', 'The Forge of Souls', 'La Forge des âmes', '80', '80', '80', '79', '80', '632', '0', '3', '1', '-1', 'THEFORGEOFSOULS', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('253', 'Pit of Saron', 'La fosse de Saron', '80', '80', '80', '79', '80', '658', '0', '3', '1', '-1', 'PITOFSARON', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('255', 'Halls of Reflection', 'Les salles des Reflets', '80', '80', '80', '79', '80', '668', '0', '3', '1', '-1', 'HALLSOFREFLECTION', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('272', 'Maraudon - Purple Crystals', 'Maraudon - Cristaux violets', '39', '49', '43', '41', '44', '349', '0', '3', '1', '-1', 'MARAUDON', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('273', 'Maraudon - Pristine Waters', 'Maraudon - Les eaux pures', '43', '53', '47', '45', '48', '349', '0', '3', '1', '-1', 'MARAUDON', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('274', 'Stratholme - Service Entrance', 'Stratholme - Entrée de service', '55', '65', '60', '0', '0', '329', '0', '3', '1', '-1', 'STRATHOLME', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('276', 'Blackrock Depths - Upper City', 'Profondeurs de Rochenoire - Ville haute', '51', '61', '55', '53', '56', '230', '0', '3', '1', '-1', 'BLACKROCKDEPTHS', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('285', 'The Headless Horseman', 'Le Cavalier sans tête', '78', '82', '80', '78', '82', '189', '0', '15', '1', '-1', 'HALLOWEEN', '0', '0', '11', 'Defeat the mad Headless Horseman before he burns down every last settlement in Azeroth.', 'Vaincre le Cavalier sans tête avant qu\'il brûle jusqu\'au dernier village en Azeroth.');
INSERT INTO `lfgdungeonsdbc` VALUES ('286', 'The Frost Lord Ahune', 'Le seigneur du Givre Ahune', '78', '82', '80', '78', '82', '547', '0', '15', '1', '-1', 'SUMMER', '1', '0', '11', 'Defeat Ahune, the Frost Lord, before he fully manifests in Azeroth and puts an end to Summer forever.', 'Vaincre Ahune, le seigneur du Givre, avant qu\'il se manifeste entièrement en Azeroth et qu\'il mette fin à l\'été à tout jamais.');
INSERT INTO `lfgdungeonsdbc` VALUES ('287', 'Coren Direbrew', 'Coren Navrebière', '78', '82', '80', '78', '82', '230', '0', '15', '1', '-1', 'BREW', '0', '0', '11', 'Defeat the jealous Coren Direbrew to stop his incessant attacks upon the Brewfest festivities.', 'Vaincre le jaloux Coren Navrebière pour mettre un terme à ses incessantes attaques pendant la fête des Brasseurs.');
INSERT INTO `lfgdungeonsdbc` VALUES ('288', 'The Crown Chemical Co.', 'Cie de Chimie La Royale', '78', '82', '80', '78', '82', '33', '0', '15', '1', '-1', 'LOVE', '0', '0', '11', 'Defeat the insidious undead apothecaries of the Crown Chemical Co. before they unleash their newest, horrific plague.', 'Vaincre les sournois apothicaires de La Royale avant qu\'ils ne libèrent leur nouvelle et épouvantable peste.');
INSERT INTO `lfgdungeonsdbc` VALUES ('42', 'Zul\'Gurub', 'Zul\'Gurub', '56', '83', '60', '57', '63', '309', '0', '0', '2', '-1', 'ZulGurub', '0', '0', '6', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('44', 'Upper Blackrock Spire', 'Sommet du pic Rochenoire', '56', '83', '60', '57', '63', '229', '0', '0', '2', '-1', 'BlackrockSpire', '0', '0', '6', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('46', 'Onyxia\'s Lair', 'Repaire d\'Onyxia', '80', '83', '80', '80', '83', '249', '0', '0', '2', '-1', '', '2', '0', '8', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('48', 'Molten Core', 'Cœur du magma', '60', '83', '60', '60', '63', '409', '0', '0', '2', '-1', 'MoltenCore', '0', '0', '6', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('50', 'Blackwing Lair', 'Repaire de l\'Aile noire', '60', '83', '60', '60', '63', '469', '0', '0', '2', '-1', 'BlackwingLair', '0', '0', '6', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('159', 'Naxxramas', 'Naxxramas', '80', '83', '80', '80', '83', '533', '0', '0', '2', '-1', 'NAXXRAMAS', '2', '0', '8', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('160', 'Ahn\'Qiraj Ruins', 'Ruines d\'Ahn\'Qiraj', '60', '83', '60', '60', '63', '509', '0', '0', '2', '-1', 'AQRuins', '0', '0', '6', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('161', 'Ahn\'Qiraj Temple', 'Temple d\'Ahn\'Qiraj', '60', '83', '60', '60', '63', '531', '0', '0', '2', '-1', 'AQTemple', '0', '0', '6', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('175', 'Karazhan', 'Karazhan', '70', '83', '70', '70', '73', '532', '0', '0', '2', '-1', 'Karazhan', '1', '0', '7', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('176', 'Magtheridon\'s Lair', 'Le repaire de Magtheridon', '70', '83', '70', '70', '73', '544', '0', '0', '2', '-1', 'HellfireCitadelRaid', '1', '0', '7', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('177', 'Gruul\'s Lair', 'Le repaire de Gruul', '70', '83', '70', '70', '73', '565', '0', '0', '2', '-1', 'GruulsLair', '1', '0', '7', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('193', 'Tempest Keep', 'Donjon de la Tempête', '70', '83', '70', '70', '73', '550', '0', '0', '2', '-1', 'TempestKeep', '1', '0', '7', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('194', 'Serpentshrine Cavern', 'Caverne du sanctuaire du Serpent', '70', '83', '70', '70', '73', '548', '0', '0', '2', '-1', 'SerpentshrineCavern', '1', '0', '7', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('195', 'Hyjal Past', 'Passé d\'Hyjal', '70', '83', '70', '70', '73', '534', '0', '0', '2', '-1', 'HyjalPast', '1', '0', '7', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('196', 'Black Temple', 'Temple noir', '70', '83', '70', '70', '73', '564', '0', '0', '2', '-1', 'BlackTemple', '1', '0', '7', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('197', 'Zul\'Aman', 'Zul\'Aman', '70', '83', '70', '70', '73', '568', '0', '0', '2', '-1', 'ZulAman', '1', '0', '7', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('199', 'The Sunwell', 'Le Puits de soleil', '70', '83', '70', '70', '73', '580', '0', '0', '2', '-1', 'Sunwell', '1', '0', '7', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('223', 'The Eye of Eternity', 'L\'Œil de l\'éternité', '80', '83', '80', '80', '83', '616', '0', '0', '2', '-1', 'MALYGOS', '2', '0', '8', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('224', 'The Obsidian Sanctum', 'Le sanctum Obsidien', '80', '83', '80', '80', '83', '615', '0', '0', '2', '-1', 'CHAMBEROFASPECTS', '2', '0', '8', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('227', 'Naxxramas', 'Naxxramas', '80', '83', '80', '80', '83', '533', '1', '0', '2', '-1', 'NAXXRAMAS', '2', '0', '9', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('237', 'The Eye of Eternity', 'L\'Œil de l\'éternité', '80', '83', '80', '80', '83', '616', '1', '0', '2', '-1', 'MALYGOS', '2', '0', '9', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('238', 'The Obsidian Sanctum', 'Le sanctum Obsidien', '80', '83', '80', '80', '83', '615', '1', '0', '2', '-1', 'CHAMBEROFASPECTS', '2', '0', '9', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('239', 'Vault of Archavon', 'Caveau d\'Archavon', '80', '83', '80', '80', '83', '624', '0', '0', '2', '-1', 'VAULTOFARCHAVON', '2', '0', '8', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('240', 'Vault of Archavon', 'Caveau d\'Archavon', '80', '83', '80', '80', '83', '624', '1', '0', '2', '-1', 'VAULTOFARCHAVON', '2', '0', '9', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('243', 'Ulduar', 'Ulduar', '80', '83', '80', '80', '83', '603', '0', '0', '2', '-1', 'ULDUAR', '2', '0', '8', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('244', 'Ulduar', 'Ulduar', '80', '83', '80', '80', '83', '603', '1', '0', '2', '-1', 'ULDUAR', '2', '0', '9', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('246', 'Trial of the Crusader', 'L\'épreuve du croisé', '80', '83', '80', '80', '83', '649', '0', '0', '2', '-1', 'ARGENTRAID', '2', '0', '8', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('247', 'Trial of the Grand Crusader', 'L\'épreuve du grand croisé', '80', '83', '80', '80', '83', '649', '2', '0', '2', '-1', 'ARGENTRAID', '2', '0', '8', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('248', 'Trial of the Crusader', 'L\'épreuve du croisé', '80', '83', '80', '80', '83', '649', '1', '0', '2', '-1', 'ARGENTRAID', '2', '0', '9', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('250', 'Trial of the Grand Crusader', 'L\'épreuve du grand croisé', '80', '83', '80', '80', '83', '649', '3', '0', '2', '-1', 'ARGENTRAID', '2', '0', '9', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('257', 'Onyxia\'s Lair', 'Repaire d\'Onyxia', '80', '83', '80', '80', '83', '249', '1', '0', '2', '-1', '', '2', '0', '9', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('279', 'Icecrown Citadel', 'Citadelle de la Couronne de glace', '80', '83', '80', '80', '83', '631', '0', '0', '2', '-1', 'ICECROWNCITADEL', '2', '0', '8', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('280', 'Icecrown Citadel', 'Citadelle de la Couronne de glace', '80', '83', '80', '80', '83', '631', '1', '0', '2', '-1', 'ICECROWNCITADEL', '2', '0', '9', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('293', 'Ruby Sanctum', 'Le sanctum Rubis', '80', '83', '80', '80', '83', '724', '0', '0', '2', '-1', 'RUBYSANCTUM', '2', '0', '8', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('294', 'Ruby Sanctum', 'Le sanctum Rubis', '80', '83', '80', '80', '83', '724', '1', '0', '2', '-1', 'RUBYSANCTUM', '2', '0', '9', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('58', 'Elwynn Forest', 'Forêt d\'Elwynn', '1', '14', '0', '0', '0', '-1', '0', '0', '4', '1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('60', 'Westfall', 'Marche de l\'Ouest', '8', '24', '0', '0', '0', '-1', '0', '0', '4', '1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('62', 'Duskwood', 'Bois de la pénombre', '18', '34', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('64', 'Dun Morogh', 'Dun Morogh', '1', '14', '0', '0', '0', '-1', '0', '0', '4', '1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('66', 'Loch Modan', 'Loch Modan', '8', '24', '0', '0', '0', '-1', '0', '0', '4', '1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('68', 'Wetlands', 'Les Paluns', '18', '34', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('70', 'Stranglethorn Vale', 'Vallée de Strangleronce', '28', '50', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('72', 'Blasted Lands', 'Terres foudroyées', '43', '60', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('74', 'Swamp of Sorrows', 'Marais des Chagrins', '33', '50', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('76', 'Redridge Mountains', 'Les Carmines', '13', '30', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('78', 'Burning Steppes', 'Steppes ardentes', '48', '60', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('80', 'Searing Gorge', 'Gorge des Vents brûlants', '43', '60', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('82', 'Badlands', 'Terres ingrates', '33', '50', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('84', 'Arathi Highlands', 'Hautes-terres d\'Arathi', '28', '44', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('86', 'Hillsbrad Foothills', 'Contreforts de Hautebrande', '18', '34', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('88', 'Hinterlands', 'Hinterlands', '38', '54', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('90', 'Western Plaguelands', 'Maleterres de l\'ouest', '48', '60', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('92', 'Eastern Plaguelands', 'Maleterres de l\'est', '53', '63', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('94', 'Tirisfal Glades', 'Clairières de Tirisfal', '1', '14', '0', '0', '0', '-1', '0', '0', '4', '0', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('96', 'Silverpine Forest', 'Forêt des Pins argentés', '8', '24', '0', '0', '0', '-1', '0', '0', '4', '0', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('98', 'Alterac Mountains', 'Montagnes d\'Alterac', '28', '44', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('100', 'Durotar', 'Durotar', '1', '14', '0', '0', '0', '-1', '0', '0', '4', '0', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('102', 'Mulgore', 'Mulgore', '1', '14', '0', '0', '0', '-1', '0', '0', '4', '0', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('104', 'The Barrens', 'Les Tarides', '8', '30', '0', '0', '0', '-1', '0', '0', '4', '0', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('106', 'Stonetalon Mountains', 'Les Serres-Rocheuses', '13', '32', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('108', 'Thousand Needles', 'Mille Pointes', '23', '40', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('110', 'Desolace', 'Désolace', '28', '44', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('112', 'Feralas', 'Féralas', '38', '54', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('114', 'Dustwallow Marsh', 'Marécage d\'Âprefange', '33', '50', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('116', 'Tanaris', 'Tanaris', '38', '54', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('118', 'Un\'Goro Crater', 'Cratère d\'Un\'Goro', '45', '60', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('120', 'Silithus', 'Silithus', '53', '60', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('122', 'Teldrassil', 'Teldrassil', '1', '14', '0', '0', '0', '-1', '0', '0', '4', '1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('124', 'Darkshore', 'Sombrivage', '8', '24', '0', '0', '0', '-1', '0', '0', '4', '1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('126', 'Ashenvale', 'Orneval', '18', '34', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('128', 'Felwood', 'Gangrebois', '46', '60', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('130', 'Azshara', 'Azshara', '43', '60', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('132', 'Winterspring', 'Berceau-de-l\'hiver', '53', '63', '0', '0', '0', '-1', '0', '0', '4', '-1', '', '0', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('152', 'Hellfire Peninsula', 'Péninsule des Flammes infernales', '57', '66', '0', '0', '0', '-1', '0', '0', '4', '-1', 'Outland', '1', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('153', 'Zangarmarsh', 'Marécage de Zangar', '58', '67', '0', '0', '0', '-1', '0', '0', '4', '-1', 'Outland', '1', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('154', 'Terokkar Forest', 'Forêt de Terokkar', '60', '68', '0', '0', '0', '-1', '0', '0', '4', '-1', 'Outland', '1', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('155', 'Nagrand', 'Nagrand', '62', '70', '0', '0', '0', '-1', '0', '0', '4', '-1', 'Outland', '1', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('156', 'Shadowmoon Valley', 'Vallée d\'Ombrelune', '65', '73', '0', '0', '0', '-1', '0', '0', '4', '-1', 'Outland', '1', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('157', 'Blade\'s Edge Mountains', 'Les Tranchantes', '63', '71', '0', '0', '0', '-1', '0', '0', '4', '-1', 'Outland', '1', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('158', 'Netherstorm', 'Raz-de-Néant', '65', '73', '0', '0', '0', '-1', '0', '0', '4', '-1', 'Outland', '1', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('166', 'Eversong Woods', 'Bois des Chants éternels', '1', '14', '0', '0', '0', '-1', '0', '0', '4', '0', '', '1', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('167', 'Azuremyst Isle', 'Île de Brume-azur', '1', '14', '0', '0', '0', '-1', '0', '0', '4', '1', '', '1', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('168', 'Ghostlands', 'Terres fantômes', '8', '24', '0', '0', '0', '-1', '0', '0', '4', '0', '', '1', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('169', 'Bloodmyst Isle', 'Île de Brume-sang', '8', '24', '0', '0', '0', '-1', '0', '0', '4', '1', '', '1', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('200', 'Isle of Quel\'Danas', 'Île de Quel\'Danas', '69', '72', '0', '0', '0', '530', '0', '0', '4', '-1', '', '1', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('228', 'Borean Tundra', 'Toundra Boréenne', '68', '72', '0', '0', '0', '571', '0', '0', '4', '-1', '', '2', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('229', 'Howling Fjord', 'Fjord Hurlant', '68', '72', '0', '0', '0', '571', '0', '0', '4', '-1', '', '2', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('230', 'Grizzly Hills', 'Les Grisonnes', '70', '74', '0', '0', '0', '571', '0', '0', '4', '-1', '', '2', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('231', 'Dragonblight', 'Désolation des dragons', '71', '75', '0', '0', '0', '571', '0', '0', '4', '-1', '', '2', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('232', 'Wintergrasp', 'Joug-d\'hiver', '77', '80', '0', '0', '0', '571', '0', '0', '4', '-1', '', '2', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('233', 'Zul\'Drak', 'Zul\'Drak', '73', '77', '0', '0', '0', '571', '0', '0', '4', '-1', '', '2', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('234', 'Sholazar Basin', 'Bassin de Sholazar', '75', '79', '0', '0', '0', '571', '0', '0', '4', '-1', '', '2', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('235', 'The Storm Peaks', 'Les pics Foudroyés', '77', '80', '0', '0', '0', '571', '0', '0', '4', '-1', '', '2', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('236', 'Icecrown', 'La Couronne de glace', '77', '80', '0', '0', '0', '571', '0', '0', '4', '-1', 'IcecrownCitadel', '2', '0', '0', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('178', 'Auchenai Crypts', 'Cryptes Auchenaï', '70', '75', '70', '70', '73', '558', '1', '3', '5', '-1', 'AUCHINDOUN', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('179', 'Mana-Tombs', 'Tombes-mana', '70', '75', '70', '70', '73', '557', '1', '3', '5', '-1', 'AUCHINDOUN', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('180', 'Sethekk Halls', 'Salles des Sethekk', '70', '75', '70', '70', '73', '556', '1', '3', '5', '-1', 'AUCHINDOUN', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('181', 'Shadow Labyrinth', 'Labyrinthe des ombres', '70', '75', '70', '70', '73', '555', '1', '3', '5', '-1', 'AUCHINDOUN', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('182', 'The Black Morass', 'Le Noir Marécage', '70', '75', '70', '70', '73', '269', '1', '3', '5', '-1', 'CAVERNSOFTIME', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('183', 'The Escape From Durnholde', 'L\'évasion de Fort-de-Durn', '70', '75', '70', '70', '73', '560', '1', '3', '5', '-1', 'CAVERNSOFTIME', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('184', 'Slave Pens', 'Enclos aux esclaves', '70', '75', '70', '70', '73', '547', '1', '3', '5', '-1', 'COILFANG', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('185', 'The Steamvault', 'Caveau de la vapeur', '70', '75', '70', '70', '73', '545', '1', '3', '5', '-1', 'COILFANG', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('186', 'Underbog', 'Basse-tourbière', '70', '75', '70', '70', '73', '546', '1', '3', '5', '-1', 'COILFANG', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('187', 'Blood Furnace', 'Fournaise du sang', '70', '75', '70', '70', '73', '542', '1', '3', '5', '-1', 'HELLFIRECITADEL', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('188', 'Hellfire Ramparts', 'Remparts des Flammes infernales', '70', '75', '70', '70', '73', '543', '1', '3', '5', '-1', 'HELLFIRECITADEL', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('189', 'Shattered Halls', 'Les Salles brisées', '70', '75', '70', '70', '73', '540', '1', '3', '5', '-1', 'HELLFIRECITADEL', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('190', 'The Arcatraz', 'L’Arcatraz', '70', '75', '70', '70', '73', '552', '1', '3', '5', '-1', 'TEMPESTKEEP', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('191', 'The Botanica', 'La Botanica', '70', '75', '70', '70', '73', '553', '1', '3', '5', '-1', 'TEMPESTKEEP', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('192', 'The Mechanar', 'Le Méchanar', '70', '75', '70', '70', '73', '554', '1', '3', '5', '-1', 'TEMPESTKEEP', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('201', 'Magisters\' Terrace', 'Terrasse des Magistères', '70', '75', '70', '70', '73', '585', '1', '3', '5', '-1', 'MAGISTERSTERRACE', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('205', 'Utgarde Pinnacle', 'Cime d\'Utgarde', '80', '83', '80', '80', '83', '575', '1', '3', '5', '-1', 'UTGARDEPINNACLE', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('210', 'The Culling of Stratholme', 'L\'épuration de Stratholme', '80', '83', '80', '80', '83', '595', '1', '3', '5', '-1', 'CAVERNSOFTIME', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('211', 'The Oculus', 'L\'Oculus', '80', '83', '80', '80', '83', '578', '1', '3', '5', '-1', 'THEOCULUS', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('212', 'Halls of Lightning', 'Salles de Foudre', '80', '83', '80', '80', '83', '602', '1', '3', '5', '-1', 'HALLSOFLIGHTNING', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('213', 'Halls of Stone', 'Salles de Pierre', '80', '83', '80', '80', '83', '599', '1', '3', '5', '-1', 'HALLSOFSTONE', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('215', 'Drak\'Tharon Keep', 'Donjon de Drak\'Tharon', '80', '83', '80', '80', '83', '600', '1', '3', '5', '-1', 'DRAKTHARON', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('217', 'Gundrak', 'Gundrak', '80', '83', '80', '80', '83', '604', '1', '3', '5', '-1', 'GUNDRAK', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('219', 'Ahn\'kahet: The Old Kingdom', 'Ahn\'kahet : l\'Ancien royaume', '80', '83', '80', '80', '83', '619', '1', '3', '5', '-1', 'AHNKALET', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('221', 'Violet Hold', 'Fort pourpre', '80', '83', '80', '80', '83', '608', '1', '3', '5', '-1', 'THEVIOLETHOLD', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('226', 'The Nexus', 'Le Nexus', '80', '83', '80', '80', '83', '576', '1', '3', '5', '-1', 'THENEXUS', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('241', 'Azjol-Nerub', 'Azjol-Nérub', '80', '83', '80', '80', '83', '601', '1', '3', '5', '-1', 'AZJOLNERUB', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('242', 'Utgarde Keep', 'Donjon d\'Utgarde', '80', '83', '80', '80', '83', '574', '1', '3', '5', '-1', 'UTGARDE', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('249', 'Trial of the Champion', 'L\'épreuve du champion', '80', '83', '80', '80', '83', '650', '1', '3', '5', '-1', 'ARGENTDUNGEON', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('252', 'The Forge of Souls', 'La Forge des âmes', '80', '83', '80', '80', '83', '632', '1', '3', '5', '-1', 'THEFORGEOFSOULS', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('254', 'Pit of Saron', 'La fosse de Saron', '80', '83', '80', '80', '83', '658', '1', '3', '5', '-1', 'PITOFSARON', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('256', 'Halls of Reflection', 'Les salles des Reflets', '80', '83', '80', '80', '83', '668', '1', '3', '5', '-1', 'HALLSOFREFLECTION', '2', '0', '5', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('258', 'Random Classic Dungeon', 'Donjon classique aléatoire', '15', '58', '55', '15', '58', '0', '0', '3', '6', '-1', '', '0', '0', '1', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('259', 'Random Burning Crusade Dungeon', 'Donjon aléatoire de The Burning Crusade', '59', '68', '65', '59', '68', '0', '0', '3', '6', '-1', '', '1', '0', '2', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('260', 'Random Burning Crusade Heroic', 'Donjon aléatoire héroïque de The Burning Crusade', '70', '73', '70', '70', '73', '0', '1', '3', '6', '-1', '', '1', '0', '3', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('261', 'Random Lich King Dungeon', 'Donjon aléatoire de Wrath of the Lich King', '69', '80', '80', '69', '80', '0', '0', '3', '6', '-1', '', '2', '0', '4', '', '');
INSERT INTO `lfgdungeonsdbc` VALUES ('262', 'Random Lich King Heroic', 'Donjon aléatoire héroïque de Wrath of the Lich King', '80', '83', '80', '80', '83', '0', '1', '3', '6', '-1', '', '2', '0', '5', '', '');
