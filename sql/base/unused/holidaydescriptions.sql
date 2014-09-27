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
-- Table structure for table `holidaydescriptions`
--

DROP TABLE IF EXISTS `holidaydescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidaydescriptions` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Description` varchar(600) NOT NULL DEFAULT '',
  `Description_loc2` varchar(600) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidaydescriptions`
--

LOCK TABLES `holidaydescriptions` WRITE;
/*!40000 ALTER TABLE `holidaydescriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidaydescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `holidaydescriptions`
--

INSERT INTO `holidaydescriptions` VALUES ('1', 'The Darkmoon Faire is here, this time in idyllic Elwynn Forest.\r\n\r\nMeet Silas Darkmoon and his troupe, play games that test mind and nerve, and behold exotic sights from the four corners of Azeroth... and beyond!', 'La foire de Sombrelune est installée dans la sublime forêt d\'Elwynn.\r\n\r\nRendez visite à Silas Sombrelune et sa troupe, jouez à des jeux qui mettront à l\'épreuve votre esprit et vos nerfs, et découvrez des visions exotiques venues des quatre coins d\'Azeroth… et au-delà !');
INSERT INTO `holidaydescriptions` VALUES ('2', 'Azeroth celebrates!  Each racial capital holds fireworks shows every hour, all night long!', 'Azeroth est en fête ! Vous pouvez admirer un feu d’artifice toutes les heures dans les capitales, et ce pendant toute la nuit !');
INSERT INTO `holidaydescriptions` VALUES ('4', 'A fishing tournament, competed along the coasts of Stranglethorn Vale.  Catch as many tastyfish as you can!  \r\n\r\nWill you be the master fisherman who catches forty fish first and wins the grand prize?', 'Un tournoi de pêche qui se déroule le long des côtes de la vallée de Strangleronce. Pêchez autant de courbines que possible !\r\n\r\nSerez-vous le maître pêcheur, qui, le premier, attrapera quarante poissons et gagnera le grand prix ?');
INSERT INTO `holidaydescriptions` VALUES ('8', 'First celebrated by the dwarves, Brewfest now holds appeal among all the races of Azeroth!\r\n\r\nVisit the Alliance camp outside Ironforge, or the Horde camp outside Orgrimmar, and join the party!', 'D\'abord célébrée par les nains, la fête des Brasseurs attire aujourd\'hui toutes les races d\'Azeroth !\r\n\r\nRendez-vous dans le camp de l\'Alliance, à l\'extérieur de Forgefer, ou dans le camp de la Horde, à l\'extérieur d\'Orgrimmar, et joignez-vous à la fête !');
INSERT INTO `holidaydescriptions` VALUES ('9', 'Something is in the air in the major cities of Azeroth.  Many guards and townsfolk spend their days giving and receiving gifts to other amorous citizens.', 'Il y a quelque chose dans l\'air dans les capitales d\'Azeroth. Gardes et habitants passent leurs journées à donner des cadeaux à d\'autres citoyens amoureux et à en recevoir.');
INSERT INTO `holidaydescriptions` VALUES ('10', 'A time of merriment and celebration, dedicated to the hottest season of the year.', 'Un moment de joie et de fête, dédié à la plus chaude saison de l\'année.');
INSERT INTO `holidaydescriptions` VALUES ('11', 'After the sun sets, the end of Midsummer is celebrated, with an hourly firework extravaganza.\r\n\r\nTo watch the show, visit any capital city or Booty Bay.', 'Lorsque le soleil se couche, la fin du solstice est célébrée toutes les heures par des feux d\'artifice époustouflants.\r\n\r\nPour voir le spectacle, rendez-vous dans n\'importe quelle capitale ou à Baie-du-Butin.');
INSERT INTO `holidaydescriptions` VALUES ('12', 'Show an orphan what the hero\'s life is like!  Visit Orphan Matron Nightingale in Stormwind, Orphan Matron Battlewail in Orgrimmar, Orphan Matron Mercy in Shattrath, or Orphan Matron Aria in Dalaran and make a child\'s dream come true.', 'Montrez à un orphelin à quoi ressemble la vie d\'un héros ! Rendez visite à la directrice de l\'orphelinat Rossignol à Hurlevent, à la directrice de l\'orphelinat Plainteguerre à Orgrimmar, à Miss Hérikorde à Shattrath, ou à la directrice de l\'orphelinat Aria à Dalaran, et réalisez les rêves d\'un enfant !');
INSERT INTO `holidaydescriptions` VALUES ('13', 'Greatfather Winter is visiting the cities of Ironforge and Orgrimmar, courtesy of Smokywood Pastures.  And throughout Azeroth, it is the season to be jolly!', 'Le Grand-père Hiver se rend dans les villes de Forgefer et d\'Orgrimmar, avec l\'aimable autorisation des Gourmandises Fumebois. Et dans tout Azeroth, c\'est la saison de la bonne humeur !');
INSERT INTO `holidaydescriptions` VALUES ('14', 'The feast of Noblegarden has arrived.  The proving grounds of each race, the place where young heroes first test their strength, each holds cleverly hidden treasure eggs.  How many can you find?', 'La fête du Jardin des nobles est arrivée. Les terres où chaque jeune héros teste ses forces pour la première fois cachent toutes des œufs remplis de trésors. Combien arriverez-vous à en trouver ?');
INSERT INTO `holidaydescriptions` VALUES ('15', 'Hallow\'s End celebrates the break of the Forsaken from the Scourge.\r\n\r\nFun and mischief reign as the Innkeepers of Azeroth give treats, and tricks, to whomever asks.', 'La Sanssaint célèbre la séparation entre les Réprouvés et le Fléau.\r\n\r\nLa fête et l\'espièglerie règnent tandis que les aubergistes d\'Azeroth distribuent bonbons et blagues à qui le leur demande.');
INSERT INTO `holidaydescriptions` VALUES ('16', 'The Harvest Festival is a time to commemorate those  who have sacrificed their lives to help friends and allies.  Feasts are held outside Orgrimmar and Ironforge in honor of these fallen heroes.', 'La fête des Moissons permet de rendre hommage à ceux qui ont sacrifié leur vie pour aider leurs amis et leurs alliés. Des festins sont organisés à Orgrimmar et Forgefer en l\'honneur de ces héros disparus.');
INSERT INTO `holidaydescriptions` VALUES ('17', 'Every year the druids of Moonglade hold a celebration of their city\'s great triumph over an ancient evil. During the Lunar Festival, citizens of Azeroth have the opportunity to honor their elders by celebrating their sage wisdom, sharing in magnificent feasts, and of course... shooting fireworks!\r\n', 'Chaque année, les druides de Reflet-de-lune commémorent la victoire de leur cité sur un mal ancien. Pendant la fête lunaire, les citoyens d’Azeroth ont l’occasion de rendre hommage à leurs anciens en écoutant leurs avis, en participant à de splendides festins et bien entendu… en tirant des feux d’artifice !');
INSERT INTO `holidaydescriptions` VALUES ('18', 'Started by the dwarves, Brewfest is now a worldwide celebration of brews and good times.', 'Lancée par les nains, la fête des Brasseurs célèbre aujourd\'hui la bière et la fête partout dans le monde.');
INSERT INTO `holidaydescriptions` VALUES ('21', 'Captain Demeza sails to the goblin town of Booty Bay and recruits land-lovers into her buccaneer ranks.\r\n\r\nVisit her or her henchmen in the capital cities if the pirate\'s life is for you!', 'Le capitaine DeMeza fait voile sur la ville gobeline de Baie-du-Butin. Elle recrute des amoureux de la terre dans les rangs de ses boucaniers.\r\n\r\nSi vous vous sentez une âme de pirate, rendez visite au capitaine Demeza et à ses hommes de main dans les capitales !');
INSERT INTO `holidaydescriptions` VALUES ('22', 'The battle for Alterac Valley grows intense.  Greater honor is given to those who pledge sword to their liege and battle in Alterac.', 'La bataille pour la vallée d\'Alterac s\'intensifie. Un plus grand honneur est donné à ceux qui prêtent allégeance à leur seigneur et qui se battent à Alterac.');
INSERT INTO `holidaydescriptions` VALUES ('23', 'The battle for Arathi Basin grows intense.  Greater honor is given to those who pledge sword to their liege and battle in Arathi.', 'La bataille pour le bassin d\'Arathi s\'intensifie. Un plus grand honneur est donné à ceux qui prêtent allégeance à leur seigneur et qui se battent à Arathi.');
INSERT INTO `holidaydescriptions` VALUES ('24', 'The battle for the Eye of the Storm grows intense.  Greater honor is given to those who pledge sword to their liege and battle in the Eye.', 'La bataille pour l\'Œil du cyclone s\'intensifie. Un plus grand honneur est donné à ceux qui prêtent allégeance à leur seigneur et qui se battent dans l\'Œil.');
INSERT INTO `holidaydescriptions` VALUES ('25', 'The battle for Warsong Gulch grows intense.  Greater honor is given to those who pledge sword to their liege and battle in the Gulch.', 'La bataille pour le goulet des Chanteguerres s\'intensifie. Un plus grand honneur est donné à ceux qui prêtent allégeance à leur seigneur et qui se battent dans le goulet.');
INSERT INTO `holidaydescriptions` VALUES ('26', 'The Darkmoon Faire is here, this time at the foot of Thunder Bluff.\r\n\r\nMeet Silas Darkmoon and his troupe, play games that test mind and nerve, and behold exotic sights from the four corners of Azeroth... and beyond!', 'La foire de Sombrelune est installée au pied des Pitons du Tonnerre.\r\n\r\nRendez visite à Silas Sombrelune et sa troupe, jouez à des jeux qui mettront à l\'épreuve votre esprit et vos nerfs, et découvrez des visions exotiques venues des quatre coins d\'Azeroth… et au-delà !');
INSERT INTO `holidaydescriptions` VALUES ('27', 'The Darkmoon Faire is here, this time outside Shattrath City.\r\n\r\nMeet Silas Darkmoon and his troupe, play games that test mind and nerve, and behold exotic sights from the four corners of Azeroth... and beyond!', 'La foire de Sombrelune est installée à l\'extérieur de Shattrath.\r\n\r\nRendez visite à Silas Sombrelune et sa troupe, jouez à des jeux qui mettront à l\'épreuve votre esprit et vos nerfs, et découvrez des visions exotiques venues des quatre coins d\'Azeroth… et au-delà !');
INSERT INTO `holidaydescriptions` VALUES ('41', 'The battle for the Strand of the Ancients grows intense.  Greater honor is given to those who pledge sword to their liege and battle upon the Strand.', 'La bataille pour le rivage des Anciens s\'intensifie. Un plus grand honneur est donné à ceux qui prêtent allégeance à leur seigneur et qui se battent sur le rivage des Anciens.');
INSERT INTO `holidaydescriptions` VALUES ('61', 'The Wrath of the Lich King launches on November 13th.\r\n\r\nAlliance ships depart from Stormwind and Menethil Harbor.\r\n\r\nHorde Zeppelins leave from outside Orgrimmar and Undercity.\r\n\r\nSee you in Northrend...', 'Le départ pour le courroux du roi-liche se fera le 13 novembre.\r\n\r\nDes vaisseaux de l\'Alliance prendront la mer depuis les ports de Ménéthil et Hurlevent.\r\n\r\nDes zeppelins de la Horde largueront leurs amarres à l\'extérieur d\'Orgrimmar et de Fossoyeuse.\r\n\r\nÀ bientôt en Norfendre...');
INSERT INTO `holidaydescriptions` VALUES ('81', 'During the Day of the Dead, people gather in graveyards to celebrate with and cherish the spirits of those they have lost.\r\n\r\nOne can find the festivities in the cemeteries of any major city, where celebrants cook, dance, don costumes, and more.', 'À l\'occasion du Jour des morts, les gens se rassemblent dans les cimetières pour célébrer et chérir la mémoire de leurs proches disparus.\r\n\r\nLes festivités se déroulent dans les cimetières des grandes villes, où les participants se réunissent pour cuisiner, danser, ou encore pour se déguiser.');
INSERT INTO `holidaydescriptions` VALUES ('101', 'Pilgrim\'s Bounty is a time to reflect upon one\'s good fortune and share with all around you.', 'Les Bienfaits du pèlerin est un moment où l\'on se rappelle que la chance nous a souri, et où l\'on partage son repas avec tous ceux qui nous entourent.');
INSERT INTO `holidaydescriptions` VALUES ('121', 'The battle for the Isle of Conquest grows intense.  Greater honor is given to those who pledge sword to their liege and battle upon the Isle.', 'La bataille pour l\'île des Conquérants s\'intensifie. Un plus grand honneur est donné à ceux qui prêtent allégeance à leur seigneur et qui se battent sur l\'île.');
INSERT INTO `holidaydescriptions` VALUES ('141', 'Test test', 'Test test');
INSERT INTO `holidaydescriptions` VALUES ('161', 'The Kalu\'ak hold a fishing derby every few days in Northrend.  Be the first to catch a Blacktip Shark and win respect with the Kalu\'ak, and an amazing prize!', 'Les Kalu\'ak organisent un tournoi de pêche tous les quelques jours en Norfendre. Attrapez en premier un requin pointe-noire et gagnez le respect des Kalu\'ak, ainsi qu\'une incroyable récompense !');
