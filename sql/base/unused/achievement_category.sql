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
-- Table structure for table `achievement_category`
--

DROP TABLE IF EXISTS `achievement_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievement_category` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `ParentId` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `SortOrder` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement_category`
--

LOCK TABLES `achievement_category` WRITE;
/*!40000 ALTER TABLE `achievement_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievement_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `achievement_category`
--

INSERT INTO `achievement_category` VALUES ('92', '-1', 'General', 'Général', '1');
INSERT INTO `achievement_category` VALUES ('123', '122', 'Arenas', 'Arènes', '1');
INSERT INTO `achievement_category` VALUES ('130', '1', 'Character', 'Personnage', '1');
INSERT INTO `achievement_category` VALUES ('135', '128', 'Creatures', 'Créatures', '1');
INSERT INTO `achievement_category` VALUES ('140', '130', 'Wealth', 'Richesse', '1');
INSERT INTO `achievement_category` VALUES ('152', '21', 'Rated Arenas', 'Arènes cotées', '1');
INSERT INTO `achievement_category` VALUES ('160', '155', 'Lunar Festival', 'Fête lunaire', '1');
INSERT INTO `achievement_category` VALUES ('165', '95', 'Arena', 'Arène', '1');
INSERT INTO `achievement_category` VALUES ('170', '169', 'Cooking', 'Cuisine', '1');
INSERT INTO `achievement_category` VALUES ('178', '132', 'Secondary Skills', 'Compétences secondaires', '1');
INSERT INTO `achievement_category` VALUES ('14777', '97', 'Eastern Kingdoms', 'Royaumes de l\'est', '1');
INSERT INTO `achievement_category` VALUES ('14808', '168', 'Classic', 'Classique', '1');
INSERT INTO `achievement_category` VALUES ('14821', '14807', 'Classic', 'Classique', '1');
INSERT INTO `achievement_category` VALUES ('14861', '96', 'Classic', 'Classique', '1');
INSERT INTO `achievement_category` VALUES ('14864', '201', 'Classic', 'Classique', '1');
INSERT INTO `achievement_category` VALUES ('96', '-1', 'Quests', 'Quêtes', '2');
INSERT INTO `achievement_category` VALUES ('124', '122', 'Battlegrounds', 'Champs de bataille', '2');
INSERT INTO `achievement_category` VALUES ('136', '128', 'Honorable Kills', 'Victoires honorables', '2');
INSERT INTO `achievement_category` VALUES ('141', '1', 'Combat', 'Combat', '2');
INSERT INTO `achievement_category` VALUES ('145', '130', 'Consumables', 'Consommables', '2');
INSERT INTO `achievement_category` VALUES ('153', '21', 'Battlegrounds', 'Champs de bataille', '2');
INSERT INTO `achievement_category` VALUES ('171', '169', 'Fishing', 'Pêche', '2');
INSERT INTO `achievement_category` VALUES ('173', '132', 'Professions', 'Métiers', '2');
INSERT INTO `achievement_category` VALUES ('187', '155', 'Love is in the Air', 'De l\'amour dans l\'air', '2');
INSERT INTO `achievement_category` VALUES ('14778', '97', 'Kalimdor', 'Kalimdor', '2');
INSERT INTO `achievement_category` VALUES ('14801', '95', 'Alterac Valley', 'Vallée d\'Alterac', '2');
INSERT INTO `achievement_category` VALUES ('14805', '168', 'The Burning Crusade', 'The Burning Crusade', '2');
INSERT INTO `achievement_category` VALUES ('14822', '14807', 'The Burning Crusade', 'The Burning Crusade', '2');
INSERT INTO `achievement_category` VALUES ('14862', '96', 'The Burning Crusade', 'The Burning Crusade', '2');
INSERT INTO `achievement_category` VALUES ('14865', '201', 'The Burning Crusade', 'The Burning Crusade', '2');
INSERT INTO `achievement_category` VALUES ('97', '-1', 'Exploration', 'Exploration', '3');
INSERT INTO `achievement_category` VALUES ('125', '122', 'Dungeons', 'Donjons', '3');
INSERT INTO `achievement_category` VALUES ('128', '1', 'Kills', 'Victimes', '3');
INSERT INTO `achievement_category` VALUES ('137', '128', 'Killing Blows', 'Coups fatals', '3');
INSERT INTO `achievement_category` VALUES ('147', '130', 'Reputation', 'Réputation', '3');
INSERT INTO `achievement_category` VALUES ('154', '21', 'World', 'En extérieur', '3');
INSERT INTO `achievement_category` VALUES ('159', '155', 'Noblegarden', 'Jardin des nobles', '3');
INSERT INTO `achievement_category` VALUES ('172', '169', 'First Aid', 'Secourisme', '3');
INSERT INTO `achievement_category` VALUES ('14779', '97', 'Outland', 'Outreterre', '3');
INSERT INTO `achievement_category` VALUES ('14802', '95', 'Arathi Basin', 'Bassin d\'Arathi', '3');
INSERT INTO `achievement_category` VALUES ('14806', '168', 'Lich King Dungeon', 'Donjons de Wrath of the Lich King', '3');
INSERT INTO `achievement_category` VALUES ('14823', '14807', 'Wrath of the Lich King', 'Wrath of the Lich King', '3');
INSERT INTO `achievement_category` VALUES ('14863', '96', 'Wrath of the Lich King', 'Wrath of the Lich King', '3');
INSERT INTO `achievement_category` VALUES ('14866', '201', 'Wrath of the Lich King', 'Wrath of the Lich King', '3');
INSERT INTO `achievement_category` VALUES ('95', '-1', 'Player vs. Player', 'Joueur contre Joueur', '4');
INSERT INTO `achievement_category` VALUES ('122', '1', 'Deaths', 'Morts', '4');
INSERT INTO `achievement_category` VALUES ('126', '122', 'World', 'En extérieur', '4');
INSERT INTO `achievement_category` VALUES ('163', '155', 'Children\'s Week', 'Semaine des enfants', '4');
INSERT INTO `achievement_category` VALUES ('191', '130', 'Gear', 'Équipement', '4');
INSERT INTO `achievement_category` VALUES ('14780', '97', 'Northrend', 'Norfendre', '4');
INSERT INTO `achievement_category` VALUES ('14803', '95', 'Eye of the Storm', 'Œil du cyclone', '4');
INSERT INTO `achievement_category` VALUES ('14921', '168', 'Lich King Heroic', 'Donj. héro. de Lich King', '4');
INSERT INTO `achievement_category` VALUES ('14963', '14807', 'Secrets of Ulduar', 'Les secrets d\'Ulduar', '4');
INSERT INTO `achievement_category` VALUES ('127', '122', 'Resurrection', 'Résurrection', '5');
INSERT INTO `achievement_category` VALUES ('133', '1', 'Quests', 'Quêtes', '5');
INSERT INTO `achievement_category` VALUES ('161', '155', 'Midsummer', 'Solstice d\'été', '5');
INSERT INTO `achievement_category` VALUES ('168', '-1', 'Dungeons & Raids', 'Donjons & raids', '5');
INSERT INTO `achievement_category` VALUES ('14804', '95', 'Warsong Gulch', 'Goulet des Chanteguerres', '5');
INSERT INTO `achievement_category` VALUES ('14922', '168', 'Lich King 10-Player Raid', 'Raids à 10 de Lich King', '5');
INSERT INTO `achievement_category` VALUES ('15021', '14807', 'Call of the Crusade', 'L\'appel de la Croisade', '5');
INSERT INTO `achievement_category` VALUES ('162', '155', 'Brewfest', 'Fête des Brasseurs', '6');
INSERT INTO `achievement_category` VALUES ('169', '-1', 'Professions', 'Métiers', '6');
INSERT INTO `achievement_category` VALUES ('14807', '1', 'Dungeons & Raids', 'Donjons & raids', '6');
INSERT INTO `achievement_category` VALUES ('14881', '95', 'Strand of the Ancients', 'Rivage des Anciens', '6');
INSERT INTO `achievement_category` VALUES ('14923', '168', 'Lich King 25-Player Raid', 'Raids à 25 de Lich King', '6');
INSERT INTO `achievement_category` VALUES ('15062', '14807', 'Fall of the Lich King', 'La chute du roi-liche', '6');
INSERT INTO `achievement_category` VALUES ('132', '1', 'Skills', 'Compétences', '7');
INSERT INTO `achievement_category` VALUES ('158', '155', 'Hallow\'s End', 'Sanssaint', '7');
INSERT INTO `achievement_category` VALUES ('201', '-1', 'Reputation', 'Réputation', '7');
INSERT INTO `achievement_category` VALUES ('14901', '95', 'Wintergrasp', 'Joug-d\'hiver', '7');
INSERT INTO `achievement_category` VALUES ('14961', '168', 'Secrets of Ulduar 10-Player Raid', 'Secrets d\'Ulduar, raid à 10', '7');
INSERT INTO `achievement_category` VALUES ('134', '1', 'Travel', 'Voyages', '8');
INSERT INTO `achievement_category` VALUES ('155', '-1', 'World Events', 'Évènements mondiaux', '8');
INSERT INTO `achievement_category` VALUES ('14962', '168', 'Secrets of Ulduar 25-Player Raid', 'Secrets d\'Ulduar, raid à 25', '8');
INSERT INTO `achievement_category` VALUES ('14981', '155', 'Pilgrim\'s Bounty', 'Bienfaits du pèlerin', '8');
INSERT INTO `achievement_category` VALUES ('15003', '95', 'Isle of Conquest', 'L\'île des Conquérants', '8');
INSERT INTO `achievement_category` VALUES ('81', '-1', 'Feats of Strength', 'Tours de force', '9');
INSERT INTO `achievement_category` VALUES ('131', '1', 'Social', 'Social', '9');
INSERT INTO `achievement_category` VALUES ('156', '155', 'Winter Veil', 'Voile d\'hiver', '9');
INSERT INTO `achievement_category` VALUES ('15001', '168', 'Call of the Crusade 10-Player Raid', 'L\'appel de la Croisade, raid à 10', '9');
INSERT INTO `achievement_category` VALUES ('1', '-1', 'Statistics', 'Statistiques', '10');
INSERT INTO `achievement_category` VALUES ('21', '1', 'Player vs. Player', 'Joueur contre Joueur', '10');
INSERT INTO `achievement_category` VALUES ('14941', '155', 'Argent Tournament', 'Tournoi d\'Argent', '10');
INSERT INTO `achievement_category` VALUES ('15002', '168', 'Call of the Crusade 25-Player Raid', 'L\'appel de la Croisade, raid à 25', '10');
INSERT INTO `achievement_category` VALUES ('15041', '168', 'Fall of the Lich King 10-Player Raid', 'La chute du roi-liche, raid à 10', '11');
INSERT INTO `achievement_category` VALUES ('15042', '168', 'Fall of the Lich King 25-Player Raid', 'La chute du roi-liche, raid à 25', '12');
