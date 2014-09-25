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
-- Table structure for table `mapdbc`
--

DROP TABLE IF EXISTS `mapdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `InternalName` varchar(200) NOT NULL DEFAULT '',
  `MapType` int(10) NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  `IsBattleground` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(200) NOT NULL DEFAULT '',
  `Name_loc2` varchar(200) NOT NULL DEFAULT '',
  `LinkedZone` int(10) NOT NULL DEFAULT '0',
  `HordeIntro` varchar(800) NOT NULL DEFAULT '',
  `HordeIntro_loc2` varchar(800) NOT NULL DEFAULT '',
  `AllianceIntro` varchar(800) NOT NULL DEFAULT '',
  `AllianceIntro_loc2` varchar(800) NOT NULL DEFAULT '',
  `MultiMapId` int(10) NOT NULL DEFAULT '0',
  `BattlefieldMapIconScale` float NOT NULL DEFAULT '0',
  `EntranceMap` int(10) NOT NULL DEFAULT '0',
  `EntranceX` float NOT NULL DEFAULT '0',
  `EntranceY` float NOT NULL DEFAULT '0',
  `TimeOfDayOverride` int(10) NOT NULL DEFAULT '0',
  `Addon` int(10) NOT NULL DEFAULT '0',
  `UnkTime` int(10) NOT NULL DEFAULT '0',
  `MaxPlayers` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapdbc`
--

LOCK TABLES `mapdbc` WRITE;
/*!40000 ALTER TABLE `mapdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `mapdbc`
--

INSERT INTO `mapdbc` VALUES ('0', 'Azeroth', '0', '0', '0', 'Eastern Kingdoms', 'Royaumes de l\'est', '0', '', '', '', '', '4', '1', '-1', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('1', 'Kalimdor', '0', '0', '0', 'Kalimdor', 'Kalimdor', '0', '', '', '', '', '3', '1', '-1', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('13', 'test', '0', '2', '0', 'Testing', 'Test', '3817', '', '', '', '', '0', '1', '-1', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('25', 'ScottTest', '0', '2', '0', 'Scott Test', 'Test de Scott', '0', '', '', '', '', '0', '1', '-1', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('30', 'PVPZone01', '3', '0', '1', 'Alterac Valley', 'Vallée d\'Alterac', '0', 'Hidden within the Alterac Mountains, Alterac Valley is the home of Thrall\'s own clan of orcs, the Frostwolves.\r\n\r\nThe Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.\r\n\r\nThe territorial Frostwolves, unwilling to suffer the dwarven incursion, have rallied an army... an army eager for righteous slaughter.', 'Cachée dans les montagnes d’Alterac, la vallée d’Alterac est le domaine des Loups-de-givre, le clan natal de Thrall.\r\n\r\nLes nains Foudrepique, à la recherche de richesses et d’indices sur leur passé, y ont établi une tête de pont.\r\n\r\nLes Loups-de-givre, très attachés à leur territoire, ne tolèrent pas cette intrusion. Ils ont levé une armée… une armée qui rêve de massacres perpétrés au nom d’une juste cause.', 'Hidden within the Alterac Mountains, Alterac Valley is the home of Thrall\'s own clan of orcs, the Frostwolves.\r\n\r\nThe Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.\r\n\r\nThe territorial Frostwolves, unwilling to suffer the dwarven incursion, have rallied an army... an army eager for righteous slaughter.', 'Cachée dans les montagnes d’Alterac, la vallée d’Alterac est le domaine des Loups-de-givre, le clan natal de Thrall.\r\n\r\nLes nains Foudrepique, à la recherche de richesses et d’indices sur leur passé, y ont établi une tête de pont.\r\n\r\nLes Loups-de-givre, très attachés à leur territoire, ne tolèrent pas cette intrusion. Ils ont levé une armée… une armée qui rêve de massacres perpétrés au nom d’une juste cause.', '104', '1', '-1', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('33', 'Shadowfang', '1', '0', '0', 'Shadowfang Keep', 'Donjon d\'Ombrecroc', '0', '', '', '', '', '204', '1', '0', '-230.989', '1571.57', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('34', 'StormwindJail', '1', '0', '0', 'Stormwind Stockade', 'Prison de Hurlevent', '717', '', '', '', '', '194', '1', '0', '-8762.38', '848.01', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('35', 'StormwindPrison', '0', '0', '0', '<unused>StormwindPrison', '<inutilisé>Prison de Hurlevent', '717', '', '', '', '', '23', '1', '0', '-8762.48', '848.049', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('36', 'DeadminesInstance', '1', '0', '0', 'Deadmines', 'Mortemines', '0', '', '', '', '', '142', '1', '0', '-11207.8', '1681.15', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('37', 'PVPZone02', '0', '0', '1', 'Azshara Crater', 'Cratère d\'Azshara', '0', 'Crush the Alliance!', 'Ecrasez l\'Alliance !', 'Defend yourself from the onslaught of the Horde!', 'Défendez-vous contre l\'assaut de la Horde !', '25', '1', '-1', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('42', 'Collin', '0', '2', '0', 'Collin\'s Test', 'Test de Collin', '0', '', '', '', '', '0', '1', '-1', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('43', 'WailingCaverns', '1', '0', '0', 'Wailing Caverns', 'Cavernes des Lamentations', '718', '', '', '', '', '143', '1', '1', '-751.131', '-2209.24', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('44', 'Monastery', '1', '0', '0', '<unused> Monastery', '<inutilisé> Monastère', '0', '', '', '', '', '42', '1', '0', '2892.41', '-811.241', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('47', 'RazorfenKraulInstance', '1', '0', '0', 'Razorfen Kraul', 'Kraal de Tranchebauge', '0', '', '', '', '', '188', '1', '1', '-4459.45', '-1660.21', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('48', 'Blackfathom', '1', '0', '0', 'Blackfathom Deeps', 'Profondeurs de Brassenoire', '719', '', '', '', '', '196', '1', '1', '4249.12', '748.387', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('70', 'Uldaman', '1', '0', '0', 'Uldaman', 'Uldaman', '1337', '', '', '', '', '144', '1', '0', '-6060.18', '-2955', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('90', 'GnomeragonInstance', '1', '0', '0', 'Gnomeregan', 'Gnomeregan', '721', '', '', '', '', '193', '1', '0', '-5162.66', '931.599', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('109', 'SunkenTemple', '1', '0', '0', 'Sunken Temple', 'Temple englouti', '1477', '', '', '', '', '191', '1', '0', '-10170.1', '-3995.97', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('129', 'RazorfenDowns', '1', '0', '0', 'Razorfen Downs', 'Souilles de Tranchebauge', '0', '', '', '', '', '145', '1', '1', '-4662.88', '-2535.87', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('169', 'EmeraldDream', '2', '0', '0', 'Emerald Dream', 'Rêve d\'émeraude', '0', '', '', '', '', '0', '1', '-1', '0', '0', '-1', '0', '0', '40');
INSERT INTO `mapdbc` VALUES ('189', 'MonasteryInstances', '1', '0', '0', 'Scarlet Monastery', 'Monastère écarlate', '0', '', '', '', '', '190', '1', '0', '2892.24', '-811.264', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('209', 'TanarisInstance', '1', '0', '0', 'Zul\'Farrak', 'Zul\'Farrak', '0', '', '', '', '', '146', '1', '1', '-6790.58', '-2891.28', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('229', 'BlackRockSpire', '1', '0', '0', 'Blackrock Spire', 'Pic Rochenoire', '1583', '', '', '', '', '189', '1', '0', '-7522.53', '-1233.04', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('230', 'BlackrockDepths', '1', '0', '0', 'Blackrock Depths', 'Profondeurs de Rochenoire', '1584', '', '', '', '', '103', '1', '0', '-7178.1', '-928.64', '-1', '0', '0', '5');
INSERT INTO `mapdbc` VALUES ('249', 'OnyxiaLairInstance', '2', '0', '0', 'Onyxia\'s Lair', 'Repaire d\'Onyxia', '2159', '', '', '', '', '61', '1', '1', '-4753.31', '-3752.42', '-1', '0', '0', '40');
INSERT INTO `mapdbc` VALUES ('269', 'CavernsOfTime', '1', '1', '0', 'Opening of the Dark Portal', 'Ouverture de la Porte des ténèbres', '0', '', '', '', '', '212', '1', '1', '-8750.83', '-4193.51', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('289', 'SchoolofNecromancy', '1', '1', '0', 'Scholomance', 'Scholomance', '0', '', '', '', '', '102', '1', '0', '1274.78', '-2552.56', '-1', '0', '0', '5');
INSERT INTO `mapdbc` VALUES ('309', 'Zul\'gurub', '2', '1', '0', 'Zul\'Gurub', 'Zul\'Gurub', '1977', '', '', '', '', '161', '1', '0', '-11916.1', '-1224.58', '-1', '0', '68400', '20');
INSERT INTO `mapdbc` VALUES ('329', 'Stratholme', '1', '1', '0', 'Stratholme', 'Stratholme', '0', '', '', '', '', '101', '1', '0', '3392.32', '-3378.48', '-1', '0', '0', '5');
INSERT INTO `mapdbc` VALUES ('349', 'Mauradon', '1', '1', '0', 'Maraudon', 'Maraudon', '2100', '', '', '', '', '81', '1', '1', '-1432.7', '2924.98', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('369', 'DeeprunTram', '0', '1', '0', 'Deeprun Tram', 'Tram des profondeurs', '2257', '', '', '', '', '205', '1', '0', '-8349.22', '517.348', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('389', 'OrgrimmarInstance', '1', '1', '0', 'Ragefire Chasm', 'Gouffre de Ragefeu', '2437', '', '', '', '', '195', '1', '1', '1816.76', '-4423.37', '-1', '0', '0', '10');
INSERT INTO `mapdbc` VALUES ('409', 'MoltenCore', '2', '1', '0', 'Molten Core', 'Cœur du Magma', '2717', '', '', '', '', '192', '1', '0', '-7510.56', '-1036.7', '-1', '0', '0', '40');
INSERT INTO `mapdbc` VALUES ('429', 'DireMaul', '1', '1', '0', 'Dire Maul', 'Hache-tripes', '2557', '', '', '', '', '82', '1', '1', '-3908.03', '1130', '-1', '0', '0', '5');
INSERT INTO `mapdbc` VALUES ('449', 'AlliancePVPBarracks', '0', '1', '0', 'Alliance PVP Barracks', 'Baraquements Alliance JcJ', '2918', '', '', '', '', '181', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('450', 'HordePVPBarracks', '0', '1', '0', 'Horde PVP Barracks', 'Baraquements Horde JcJ', '2917', '', '', '', '', '182', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('451', 'development', '0', '15', '0', 'Development Land', 'Terre en développement', '0', '', '', '', '', '21', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('469', 'BlackwingLair', '2', '1', '0', 'Blackwing Lair', 'Repaire de l\'Aile noire', '2677', '', '', '', '', '141', '1', '0', '-7663.41', '-1218.67', '-1', '0', '0', '40');
INSERT INTO `mapdbc` VALUES ('489', 'PVPZone03', '3', '1', '1', 'Warsong Gulch', 'Goulet des Chanteguerres', '3277', 'A valley bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and the Alliance.\r\n\r\nOrcs use their Warsong Mill to cut lumber reaped from Ashenvale, provoking the night elves of Silverwing Hold.\r\n\r\nEager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.', 'Aux confins de la forêt d’Orneval et des Tarides, le goulet des Chanteguerres est le théâtre d’affrontements perpétuels.\r\n\r\nLes orcs y ont installé une scierie pour préparer le bois coupé dans Orneval, provoquant de fréquentes attaques des elfes de la nuit du fort d\'Aile-argent.\r\n\r\nDes représentants de tous les peuples d’Azeroth accourent pour aider leurs alliés.', 'A valley bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and the Alliance.\r\n\r\nOrcs use their Warsong Mill to cut lumber reaped from Ashenvale, provoking the night elves of Silverwing Hold.\r\n\r\nEager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.', 'Aux confins de la forêt d’Orneval et des Tarides, le goulet des Chanteguerres est le théâtre d’affrontements perpétuels.\r\n\r\nLes orcs y ont installé une scierie pour préparer le bois coupé dans Orneval, provoquant de fréquentes attaques des elfes de la nuit du fort d\'Aile-argent.\r\n\r\nDes représentants de tous les peuples d’Azeroth accourent pour aider leurs alliés.', '122', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('509', 'AhnQiraj', '2', '1', '0', 'Ruins of Ahn\'Qiraj', 'Ruines d\'Ahn\'Qiraj', '3429', '', '', '', '', '184', '1', '1', '-8114.46', '1526.37', '-1', '0', '68400', '20');
INSERT INTO `mapdbc` VALUES ('529', 'PVPZone04', '3', '1', '1', 'Arathi Basin', 'Bassin d\'Arathi', '3358', 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.\r\n\r\nThe Defiler\'s elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.\r\n\r\nMeanwhile, the League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.', 'Le bassin d’Arathi est l’un des principaux théâtres de la guerre entre humains et Réprouvés en Azeroth.\r\n\r\nLes soldats d\'élite des Profanateurs s’efforcent de couper les communications entre les humains et leurs alliés nains au sud.\r\n\r\nQuant à la Ligue d’Arathor, elle tente de récupérer les territoires perdus pour le compte de ses bienfaiteurs de Hurlevent.', 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.\r\n\r\nThe League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.\r\n\r\nMeanwhile, the Defiler\'s elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.', 'Le bassin d’Arathi est l’un des principaux théâtres de la guerre entre humains et Réprouvés en Azeroth.\r\n\r\nLa Ligue d’Arathor tente de récupérer les territoires perdus pour le compte de ses bienfaiteurs de Hurlevent.\r\n\r\nQuant aux Profanateurs, ces soldats d’élites s’efforcent de couper les communications entre les humains et leurs alliés nains au sud.', '183', '1.25', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('530', 'Expansion01', '0', '1', '0', 'Outland', 'Outreterre', '0', '', '', '', '', '198', '1', '0', '0', '0', '-1', '1', '0', '0');
INSERT INTO `mapdbc` VALUES ('531', 'AhnQirajTemple', '2', '0', '0', 'Ahn\'Qiraj Temple', 'Temple d\'Ahn\'Qiraj', '3428', '', '', '', '', '185', '1', '1', '-8111.72', '1526.79', '-1', '0', '0', '40');
INSERT INTO `mapdbc` VALUES ('532', 'Karazahn', '2', '1', '0', 'Karazhan', 'Karazhan', '3457', '', '', '', '', '200', '1', '0', '-11110.4', '-2004.06', '-1', '1', '0', '10');
INSERT INTO `mapdbc` VALUES ('533', 'Stratholme Raid', '2', '0', '0', 'Naxxramas', 'Naxxramas', '3456', '', '', '', '', '197', '1', '0', '0', '0', '-1', '2', '0', '25');
INSERT INTO `mapdbc` VALUES ('534', 'HyjalPast', '2', '1', '0', 'The Battle for Mount Hyjal', 'La bataille du mont Hyjal', '616', '', '', '', '', '212', '1', '1', '-8178.51', '-4182.05', '-1', '1', '0', '25');
INSERT INTO `mapdbc` VALUES ('540', 'HellfireMilitary', '1', '1', '0', 'Hellfire Citadel: The Shattered Halls', 'Citadelle des Flammes infernales : les Salles brisées', '3714', '', '', '', '', '199', '1', '530', '-306.758', '3064.44', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('542', 'HellfireDemon', '1', '1', '0', 'Hellfire Citadel: The Blood Furnace', 'Citadelle des Flammes infernales : la Fournaise du sang', '3713', '', '', '', '', '199', '1', '530', '-295.419', '3151.99', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('543', 'HellfireRampart', '1', '1', '0', 'Hellfire Citadel: Ramparts', 'Citadelle des Flammes infernales : les Remparts', '3562', '', '', '', '', '199', '1', '530', '-360.05', '3067.9', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('544', 'HellfireRaid', '2', '1', '0', 'Magtheridon\'s Lair', 'Repaire de Magtheridon', '3836', '', '', '', '', '208', '1', '530', '-330.234', '3106.64', '-1', '1', '0', '25');
INSERT INTO `mapdbc` VALUES ('545', 'CoilfangPumping', '1', '1', '0', 'Coilfang: The Steamvault', 'Glissecroc : le Caveau de la vapeur', '3715', '', '', '', '', '207', '1', '530', '764.219', '6915.08', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('546', 'CoilfangMarsh', '1', '1', '0', 'Coilfang: The Underbog', 'Glissecroc : la Basse-tourbière', '3716', '', '', '', '', '207', '1', '530', '764.628', '6768.07', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('547', 'CoilfangDraenei', '1', '1', '0', 'Coilfang: The Slave Pens', 'Glissecroc : les Enclos aux esclaves', '3717', '', '', '', '', '207', '1', '530', '742.158', '7011.33', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('548', 'CoilfangRaid', '2', '1', '0', 'Coilfang: Serpentshrine Cavern', 'Glissecroc : caverne du sanctuaire du Serpent', '3607', '', '', '', '', '207', '1', '530', '775.786', '6865.24', '-1', '1', '0', '25');
INSERT INTO `mapdbc` VALUES ('550', 'TempestKeepRaid', '2', '1', '0', 'Tempest Keep', 'Donjon de la Tempête', '3845', '', '', '', '', '206', '1', '0', '0', '0', '-1', '1', '0', '25');
INSERT INTO `mapdbc` VALUES ('552', 'TempestKeepArcane', '1', '1', '0', 'Tempest Keep: The Arcatraz', 'Donjon de la Tempête : l\'Arcatraz', '3848', '', '', '', '', '206', '1', '0', '0', '0', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('553', 'TempestKeepAtrium', '1', '1', '0', 'Tempest Keep: The Botanica', 'Donjon de la Tempête : la Botanica', '3847', '', '', '', '', '206', '1', '0', '0', '0', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('554', 'TempestKeepFactory', '1', '1', '0', 'Tempest Keep: The Mechanar', 'Donjon de la Tempête : le Méchanar', '3849', '', '', '', '', '206', '1', '0', '0', '0', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('555', 'AuchindounShadow', '1', '1', '0', 'Auchindoun: Shadow Labyrinth', 'Auchindoun : Labyrinthe des ombres', '3789', '', '', '', '', '201', '1', '530', '-3640.69', '4943.16', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('556', 'AuchindounDemon', '1', '1', '0', 'Auchindoun: Sethekk Halls', 'Auchindoun : Salles des Sethekk', '3791', '', '', '', '', '201', '1', '530', '-3361.86', '4665.59', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('557', 'AuchindounEthereal', '1', '1', '0', 'Auchindoun: Mana-Tombs', 'Auchindoun : Tombes-mana', '3792', '', '', '', '', '201', '1', '530', '-3089.52', '4942.76', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('558', 'AuchindounDraenei', '1', '1', '0', 'Auchindoun: Auchenai Crypts', 'Auchindoun : Cryptes Auchenaï', '3790', '', '', '', '', '201', '1', '530', '-3363.44', '5156.46', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('559', 'PVPZone05', '4', '1', '0', 'Nagrand Arena', 'Arène de Nagrand', '0', '', '', '', '', '219', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('560', 'HillsbradPast', '1', '1', '0', 'The Escape From Durnholde', 'L\'évasion de Fort-de-Durn', '267', '', '', '', '', '212', '1', '1', '-8309.81', '-4061.51', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('562', 'bladesedgearena', '4', '1', '0', 'Blade\'s Edge Arena', 'Arène des Tranchantes', '3702', '', '', '', '', '218', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('564', 'BlackTemple', '2', '1', '0', 'Black Temple', 'Temple noir', '0', '', '', '', '', '215', '1', '530', '-3644.53', '317.294', '-1', '1', '0', '25');
INSERT INTO `mapdbc` VALUES ('565', 'GruulsLair', '2', '1', '0', 'Gruul\'s Lair', 'Le repaire de Gruul', '3923', '', '', '', '', '213', '1', '530', '3525.45', '5144.15', '-1', '1', '0', '25');
INSERT INTO `mapdbc` VALUES ('566', 'NetherstormBG', '3', '1', '1', 'Eye of the Storm', 'L\'Œil du cyclone', '0', 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.\r\n\r\nThis battlefield is coveted by the blood elves for its rich energy deposits.\r\n\r\nThe draenei seek to claim it due to its proximity to the naaru\'s mysterious vessel, Tempest Keep.', 'Flottant en altitude au-dessus des terres dévastées du Raz-de-Néant se trouve l’île appelée l’Œil du cyclone.\r\n\r\nLes elfes de sang convoitent ce champ de bataille pour ses abondants gisements d’énergie, alors que les draeneï le revendiquent au nom de sa proximité avec le mystérieux vaisseau naaru : le donjon de la Tempête.', 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.\r\n\r\nThe draenei seek to claim it due to its proximity to the naaru\'s mysterious vessel, Tempest Keep.\r\n\r\nThis battlefield is coveted by the blood elves for its rich energy deposits.', 'Flottant en altitude au-dessus des terres dévastées du Raz-de-Néant se trouve l’île appelée l’Œil du cyclone.\r\n\r\nLes draeneï revendiquent ce champ de bataille au nom de sa proximité avec le mystérieux vaisseau naaru : le donjon de la Tempête, tandis que les elfes de sang le convoitent pour ses abondants gisements d’énergie.', '210', '1', '0', '0', '0', '-1', '1', '0', '0');
INSERT INTO `mapdbc` VALUES ('568', 'ZulAman', '2', '1', '0', 'Zul\'Aman', 'Zul\'Aman', '0', '', '', '', '', '214', '1', '530', '6851.02', '-7989.71', '-1', '1', '0', '10');
INSERT INTO `mapdbc` VALUES ('571', 'Northrend', '0', '29', '0', 'Northrend', 'Norfendre', '0', '', '', '', '', '216', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('572', 'PVPLordaeron', '4', '1', '0', 'Ruins of Lordaeron', 'Ruines de Lordaeron', '0', '', '', '', '', '217', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('573', 'ExteriorTest', '0', '15', '0', 'ExteriorTest', 'Test d\'extérieur', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('574', 'Valgarde70', '1', '13', '0', 'Utgarde Keep', 'Donjon d\'Utgarde', '0', '', '', '', '', '220', '1', '571', '1211.76', '-4868.42', '-1', '2', '0', '5');
INSERT INTO `mapdbc` VALUES ('575', 'UtgardePinnacle', '1', '13', '0', 'Utgarde Pinnacle', 'Cime d\'Utgarde', '0', '', '', '', '', '221', '1', '571', '1232.41', '-4860.95', '-1', '2', '0', '5');
INSERT INTO `mapdbc` VALUES ('576', 'Nexus70', '1', '1', '0', 'The Nexus', 'Le Nexus', '4265', '', '', '', '', '226', '1', '571', '3899.93', '6985.44', '-1', '2', '0', '5');
INSERT INTO `mapdbc` VALUES ('578', 'Nexus80', '1', '13', '0', 'The Oculus', 'L\'Oculus', '0', '', '', '', '', '227', '1', '571', '3865.92', '6983.94', '-1', '2', '0', '5');
INSERT INTO `mapdbc` VALUES ('580', 'SunwellPlateau', '2', '1', '0', 'The Sunwell', 'Le Puits de soleil', '0', '', '', '', '', '225', '1', '530', '12551.8', '-6774.56', '-1', '1', '0', '25');
INSERT INTO `mapdbc` VALUES ('582', 'Transport176244', '0', '1', '0', 'Transport: Rut\'theran to Auberdine', 'Transport : de Rut\'theran à Auberdine', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('584', 'Transport176231', '0', '1', '0', 'Transport: Menethil to Theramore', 'Transport : de Menethil à Theramore', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('585', 'Sunwell5ManFix', '1', '13', '0', 'Magister\'s Terrace', 'Terrasse des magistères', '0', '', '', '', '', '224', '1', '530', '12881.9', '-7343.1', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('586', 'Transport181645', '0', '1', '0', 'Transport: Exodar to Auberdine', 'Transport : de l\'Exodar à Auberdine', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('587', 'Transport177233', '0', '1', '0', 'Transport: Feathermoon Ferry', 'Transport : bac de Pennelune', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('588', 'Transport176310', '0', '1', '0', 'Transport: Menethil to Auberdine', 'Transport : de Menethil à Auberdine', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('589', 'Transport175080', '0', '1', '0', 'Transport: Orgrimmar to Grom\'Gol', 'Transport : d\'Orgrimmar à Grom\'Gol', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('590', 'Transport176495', '0', '1', '0', 'Transport: Grom\'Gol to Undercity', 'Transport : de Grom\'Gol à Fossoyeuse', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('591', 'Transport164871', '0', '1', '0', 'Transport: Undercity to Orgrimmar', 'Transport : de Fossoyeuse à Orgrimmar', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('592', 'Transport186238', '0', '1', '0', 'Transport: Borean Tundra Test', 'Transport : test de la toundra Boréenne', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('593', 'Transport20808', '0', '1', '0', 'Transport: Booty Bay to Ratchet', 'Transport : Baie-du-Butin à Cabestan', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('594', 'Transport187038', '0', '1', '0', 'Transport: Howling Fjord Sister Mercy (Quest)', 'Transport : Fjord hurlant Sœur Miséricorde (quête)', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('595', 'StratholmeCOT', '1', '1', '0', 'The Culling of Stratholme', 'L\'Épuration de Stratholme', '0', '', '', '', '', '222', '1', '1', '-8756.09', '-4457.42', '-1', '2', '0', '5');
INSERT INTO `mapdbc` VALUES ('596', 'Transport187263', '0', '1', '0', 'Transport: Naglfar', 'Transport: Naglfar', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('597', 'CraigTest', '0', '15', '0', 'Craig Test', 'Test de Craig', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('598', 'Sunwell5Man', '1', '1', '0', 'Sunwell Fix (Unused)', 'Correction du puits de soleil (inutilisé)', '0', '', '', '', '', '4', '1', '0', '0', '0', '-1', '1', '0', '5');
INSERT INTO `mapdbc` VALUES ('599', 'Ulduar70', '1', '13', '0', 'Halls of Stone', 'Les salles de Pierre', '0', '', '', '', '', '230', '1', '571', '8921.79', '-966.807', '-1', '2', '0', '5');
INSERT INTO `mapdbc` VALUES ('600', 'DrakTheronKeep', '1', '13', '0', 'Drak\'Tharon Keep', 'Donjon de Drak\'Tharon', '0', '', '', '', '', '228', '1', '571', '4774.58', '-2023.05', '-1', '2', '0', '5');
INSERT INTO `mapdbc` VALUES ('601', 'Azjol_Uppercity', '1', '13', '0', 'Azjol-Nerub', 'Azjol -Nérub', '0', '', '', '', '', '229', '1', '571', '3672.22', '2171.27', '-1', '2', '0', '5');
INSERT INTO `mapdbc` VALUES ('602', 'Ulduar80', '1', '13', '0', 'Halls of Lightning', 'Les salles de Foudre', '0', '', '', '', '', '231', '1', '571', '9185.09', '-1386.79', '-1', '2', '0', '5');
INSERT INTO `mapdbc` VALUES ('603', 'UlduarRaid', '2', '13', '0', 'Ulduar', 'Ulduar', '0', '', '', '', '', '244', '1', '571', '9359.37', '-1115.18', '0', '2', '0', '5');
INSERT INTO `mapdbc` VALUES ('604', 'GunDrak', '1', '13', '0', 'Gundrak', 'Gundrak', '0', '', '', '', '', '237', '1', '571', '6708.73', '-4654.9', '-1', '2', '0', '5');
INSERT INTO `mapdbc` VALUES ('605', 'development_nonweighted', '0', '17', '0', 'Development Land (non-weighted textures)', 'Terre en développement (textures sans pesanteur)', '0', '', '', '', '', '21', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('606', 'QA_DVD', '0', '31', '0', 'QA and DVD', 'AQ et DVD', '0', '', '', '', '', '21', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('607', 'NorthrendBG', '3', '29', '1', 'Strand of the Ancients', 'Rivage des Anciens', '0', 'To the south of Dragonblight lies the resting place of a legendary Titan artifact, known by the Alliance and Horde to possess critical information regarding the Titans and their methods.\r\n\r\nPrepare yourself for battle, for fate cannot determine success upon this Strand of the Ancients.', 'Un artéfact légendaire des titans repose au sud de la Désolation des dragons. La Horde et l’Alliance estiment qu’il renferme des informations capitales sur les titans et leurs méthodes.\r\n\r\nPréparez-vous au combat, car sur le rivage des Anciens, le destin ne compte pas.', 'To the south of Dragonblight lies the resting place of a legendary Titan artifact, known by the Alliance and Horde to possess critical information regarding the Titans and their methods.\r\n\r\nPrepare yourself for battle, for fate cannot determine success upon this Strand of the Ancients.', 'Un artéfact légendaire des titans repose au sud de la Désolation des dragons. La Horde et l’Alliance estiment qu’il renferme des informations capitales sur les titans et leurs méthodes.\r\n\r\nPréparez-vous au combat, car sur le rivage des Anciens, le destin ne compte pas.', '238', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('608', 'DalaranPrison', '1', '29', '0', 'Violet Hold', 'Le fort Pourpre', '0', '', '', '', '', '235', '1', '571', '5689.49', '498.047', '-1', '2', '0', '5');
INSERT INTO `mapdbc` VALUES ('609', 'DeathKnightStart', '0', '29', '0', 'Ebon Hold', 'Le fort d\'Ébène', '0', '', '', '', '', '233', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('610', 'Transport_Tirisfal _Vengeance_Landing', '0', '1', '0', 'Transport: Tirisfal to Vengeance Landing', 'Transport : de Tirisfal à l\'accostage de la Vengeance', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('612', 'Transport_Menethil_Valgarde', '0', '1', '0', 'Transport: Menethil to Valgarde', 'Transport : de Menethil à Valgarde', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('613', 'Transport_Orgrimmar_Warsong_Hold', '0', '1', '0', 'Transport: Orgrimmar to Warsong Hold', 'Transport : d\'Orgrimmar au bastion Chanteguerre', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('614', 'Transport_Stormwind_Valiance_Keep', '0', '1', '0', 'Transport: Stormwind to Valiance Keep', 'Transport : de Hurlevent au donjon de la Bravoure', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('615', 'ChamberOfAspectsBlack', '2', '29', '0', 'The Obsidian Sanctum', 'Le sanctum Obsidien', '0', '', '', '', '', '239', '1', '571', '3438.15', '260.401', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('616', 'NexusRaid', '2', '29', '0', 'The Eye of Eternity', 'L\'Œil de l\'éternité', '0', '', '', '', '', '236', '1', '571', '3869.98', '6984.33', '-1', '2', '0', '5');
INSERT INTO `mapdbc` VALUES ('617', 'DalaranArena', '4', '29', '0', 'Dalaran Sewers', 'Égouts de Dalaran', '0', '', '', '', '', '242', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('618', 'OrgrimmarArena', '4', '29', '0', 'The Ring of Valor', 'L\'arène des valeureux', '0', '', '', '', '', '240', '1', '0', '0', '0', '720', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('619', 'Azjol_LowerCity', '1', '29', '0', 'Ahn\'kahet: The Old Kingdom', 'Ahn\'kahet : l\'Ancien royaume', '0', '', '', '', '', '234', '1', '571', '3641.46', '2032.06', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('620', 'Transport_Moa\'ki_Unu\'pe', '0', '1', '0', 'Transport: Moa\'ki to Unu\'pe', 'Transport : Moa\'ki à Unu\'pe', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('621', 'Transport_Moa\'ki_Kamagua', '0', '1', '0', 'Transport: Moa\'ki to Kamagua', 'Transport : Moa\'ki à Kamagua', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('622', 'Transport192241', '0', '1', '0', 'Transport: Orgrim\'s Hammer', 'Transport : le Marteau d\'Orgrim', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('623', 'Transport192242', '0', '1', '0', 'Transport: The Skybreaker', 'Transport : le Brise-ciel', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('624', 'WintergraspRaid', '2', '61', '0', 'Vault of Archavon', 'Caveau d\'Archavon', '0', '', '', '', '', '243', '1', '571', '5488.12', '2840.33', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('628', 'IsleofConquest', '3', '29', '1', 'Isle of Conquest', 'Île des Conquérants', '0', 'The Isle of Conquest is a point of strategic importance for the Alliance and Horde campaigns in Northrend.\r\n\r\nServing as an ideal staging ground for operations in Icecrown, each side is determined to secure control of the island.\r\n\r\nWith the 7th Legion and the Kor\'kron Guard locked in deadly combat, both factions have issued a call to arms in hopes of tipping the scales in their favor and defeating the opposing general.', 'L\'île des Conquérants est un point stratégique très important pour la Horde et l\'Alliance en Norfendre.\r\n\r\nChaque camp est déterminé à prendre le contrôle de ce point de ravitaillement idéal pour les opérations dans la Couronne de glace.\r\n\r\nLa 7e Légion et la garde kor\'kronne s\'y affrontent dans un combat à mort. Les deux factions ont lancé un appel aux armes dans l\'espoir de faire pencher la balance en leur faveur et de vaincre le général ennemi.', 'The Isle of Conquest is a point of strategic importance for the Alliance and Horde campaigns in Northrend.\r\n\r\nServing as an ideal staging ground for operations in Icecrown, each side is determined to secure control of the island.\r\n\r\nWith the 7th Legion and the Kor\'kron Guard locked in deadly combat, both factions have issued a call to arms in hopes of tipping the scales in their favor and defeating the opposing general.', 'L\'île des Conquérants est un point stratégique très important pour la Horde et l\'Alliance en Norfendre.\r\n\r\nChaque camp est déterminé à prendre le contrôle de ce point de ravitaillement idéal pour les opérations dans la Couronne de glace.\r\n\r\nLa 7e Légion et la garde kor\'kronne s\'y affrontent dans un combat à mort. Les deux factions ont lancé un appel aux armes dans l\'espoir de faire pencher la balance en leur faveur et de vaincre le général ennemi.', '245', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('631', 'IcecrownCitadel', '2', '285', '0', 'Icecrown Citadel', 'Citadelle de la Couronne de glace', '0', '', '', '', '', '250', '1', '571', '5776.92', '2065.93', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('632', 'IcecrownCitadel5Man', '1', '29', '0', 'The Forge of Souls', 'La Forge des âmes', '0', '', '', '', '', '249', '1', '571', '5670.79', '2003.63', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('641', 'Transport_AllianceAirshipBG', '0', '1', '0', 'Transport: Alliance Airship BG', 'Transport : CB Vaisseau de l\'Alliance', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('642', 'Transport_HordeAirshipBG', '0', '1', '0', 'Transport: HordeAirshipBG', 'Transport : CB Vaisseau de la Horde', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('647', 'Transport_Orgrimmar_to_Thunderbluff', '0', '1', '0', 'Transport: Orgrimmar to Thunder Bluff', 'Transport : d\'Orgrimmar aux Pitons du Tonnerre', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('649', 'ArgentTournamentRaid', '2', '29', '0', 'Trial of the Crusader', 'L\'épreuve du croisé', '0', '', '', '', '', '246', '1', '571', '8515.29', '736.137', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('650', 'ArgentTournamentDungeon', '1', '29', '0', 'Trial of the Champion', 'L\'épreuve du champion', '0', '', '', '', '', '247', '1', '571', '8571.43', '792.221', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('658', 'QuarryofTears', '1', '29', '0', 'Pit of Saron', 'Fosse de Saron', '0', '', '', '', '', '252', '1', '571', '5592.06', '2010.27', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('668', 'HallsOfReflection', '1', '29', '0', 'Halls of Reflection', 'Salles des Reflets', '0', '', '', '', '', '253', '1', '571', '5628.88', '1973.29', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('672', 'Transport197347', '0', '1', '0', 'Transport: The Skybreaker (Icecrown Citadel Raid)', 'Transport : le Brise-ciel (raid de la citadelle de la Couronne de glace)', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('673', 'Transport197348', '0', '1', '0', 'Transport: Orgrim\'s Hammer (Icecrown Citadel Raid)', 'Transport : le Marteau d\'Orgrim (raid de la citadelle de la Couronne de glace)', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('712', 'Transport197349', '0', '1', '0', 'Transport: The Skybreaker (IC Dungeon)', 'Transport : le Brise-ciel (donjon de la Couronne de glace)', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('713', 'Transport197350', '0', '1', '0', 'Transport: Orgrim\'s Hammer (IC Dungeon)', 'Transport : le Marteau d\'Orgrim (donjon de la Couronne de glace)', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('718', 'Transport201834', '0', '1', '0', 'Trasnport: The Mighty Wind (Icecrown Citadel Raid)', 'Transport : le Grand vent (raid de la Couronne de glace)', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '2', '0', '0');
INSERT INTO `mapdbc` VALUES ('723', 'Stormwind', '0', '29', '0', 'Stormwind', 'Hurlevent', '0', '', '', '', '', '0', '1', '0', '0', '0', '-1', '0', '0', '0');
INSERT INTO `mapdbc` VALUES ('724', 'ChamberofAspectsRed', '2', '285', '0', 'The Ruby Sanctum', 'Le sanctum Rubis', '0', '', '', '', '', '254', '1', '0', '0', '0', '-1', '2', '0', '0');
