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
-- Table structure for table `chrracesdbc`
--

DROP TABLE IF EXISTS `chrracesdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chrracesdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  `FactionId` int(10) NOT NULL DEFAULT '0',
  `Exploration` int(10) NOT NULL DEFAULT '0',
  `ModelMale` int(10) NOT NULL DEFAULT '0',
  `ModelFemale` int(10) NOT NULL DEFAULT '0',
  `ClientPrefix` varchar(100) NOT NULL DEFAULT '',
  `BaseLanguage` int(10) NOT NULL DEFAULT '0',
  `CreatureType` int(10) NOT NULL DEFAULT '0',
  `ResSicknessSpellId` int(10) NOT NULL DEFAULT '0',
  `SplashSoundId` int(10) NOT NULL DEFAULT '0',
  `InternalName` varchar(100) NOT NULL DEFAULT '',
  `CinematicSequence` int(10) NOT NULL DEFAULT '0',
  `TeamId` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `NameFemale` varchar(100) NOT NULL DEFAULT '',
  `NameFemale_loc2` varchar(100) NOT NULL DEFAULT '',
  `NameMale` varchar(100) NOT NULL DEFAULT '',
  `NameMale_loc2` varchar(100) NOT NULL DEFAULT '',
  `FacialHairCustomization1` varchar(100) NOT NULL DEFAULT '',
  `FacialHairCustomization2` varchar(100) NOT NULL DEFAULT '',
  `HairCustomization` varchar(100) NOT NULL DEFAULT '',
  `Expansion` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chrracesdbc`
--

LOCK TABLES `chrracesdbc` WRITE;
/*!40000 ALTER TABLE `chrracesdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `chrracesdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `chrracesdbc` from 3.3.5
--

/*
INSERT INTO `chrracesdbc` VALUES ('1', '12', '1', '4140', '49', '50', 'Hu', '7', '7', '15007', '1096', 'Human', '81', '0', 'Human', 'Humain', 'Human', 'Humaine', 'Human', 'Humain', 'NORMAL', 'PIERCINGS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('2', '12', '2', '4141', '51', '52', 'Or', '1', '7', '15007', '1096', 'Orc', '21', '1', 'Orc', 'Orc', 'Orc', 'Orque', 'Orc', 'Orc', 'NORMAL', 'PIERCINGS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('3', '12', '3', '4147', '53', '54', 'Dw', '7', '7', '15007', '1090', 'Dwarf', '41', '0', 'Dwarf', 'Nain', 'Dwarf', 'Naine', 'Dwarf', 'Nain', 'NORMAL', 'PIERCINGS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('4', '4', '4', '4145', '55', '56', 'Ni', '7', '7', '15007', '1096', 'NightElf', '61', '0', 'Night Elf', 'Elfe de la nuit', 'Night Elf', 'Elfe de la nuit', 'Night Elf', 'Elfe de la nuit', 'NORMAL', 'MARKINGS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('5', '12', '5', '4142', '57', '58', 'Sc', '1', '7', '15007', '1096', 'Scourge', '2', '1', 'Undead', 'Mort-vivant', 'Undead', 'Morte-vivante', 'Undead', 'Mort-vivant', 'FEATURES', 'FEATURES', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('6', '14', '6', '4143', '59', '60', 'Ta', '1', '7', '15007', '1096', 'Tauren', '141', '1', 'Tauren', 'Tauren', 'Tauren', 'Taurène', 'Tauren', 'Tauren', 'NORMAL', 'HAIR', 'HORNS', '0');
INSERT INTO `chrracesdbc` VALUES ('7', '12', '115', '4146', '1563', '1564', 'Gn', '7', '7', '15007', '1096', 'Gnome', '101', '0', 'Gnome', 'Gnome', 'Gnome', 'Gnome', 'Gnome', 'Gnome', 'NORMAL', 'EARRINGS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('8', '14', '116', '4144', '1478', '1479', 'Tr', '1', '7', '15007', '1096', 'Troll', '121', '1', 'Troll', 'Troll', 'Troll', 'Trollesse', 'Troll', 'Troll', 'TUSKS', 'TUSKS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('9', '1', '1', '0', '6894', '6895', 'Go', '7', '7', '15007', '1096', 'Goblin', '0', '2', 'Goblin', 'Gobelin', 'Goblin', 'Gobeline', 'Goblin', 'Gobelin', 'NORMAL', 'NONE', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('10', '12', '1610', '4142', '15476', '15475', 'Be', '1', '7', '15007', '1096', 'BloodElf', '162', '1', 'Blood Elf', 'Elfe de sang', 'Blood Elf', 'Elfe de sang', 'Blood Elf', 'Elfe de sang', 'NORMAL', 'EARRINGS', 'NORMAL', '1');
INSERT INTO `chrracesdbc` VALUES ('11', '14', '1629', '4140', '16125', '16126', 'Dr', '7', '7', '15007', '1096', 'Draenei', '163', '0', 'Draenei', 'Draeneï', 'Draenei', 'Draeneï', 'Draenei', 'Draeneï', 'NORMAL', 'HORNS', 'NORMAL', '1');
INSERT INTO `chrracesdbc` VALUES ('12', '5', '1', '0', '16981', '16980', 'Fo', '7', '7', '15007', '1096', 'FelOrc', '0', '2', 'Fel Orc', 'Gangr\'orc', 'Fel Orc', 'Gangr\'orque', 'Fel Orc', 'Gangr\'orc', 'NORMAL', 'NORMAL', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('13', '1', '1', '0', '17402', '17403', 'Na', '7', '7', '15007', '1096', 'Naga_', '0', '2', 'Naga', 'Naga', 'Naga', 'Naga', 'Naga', 'Naga', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('14', '5', '1', '0', '17576', '17577', 'Br', '7', '7', '15007', '1096', 'Broken', '0', '2', 'Broken', 'Roué', 'Broken', 'Rouée', 'Broken', 'Roué', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('15', '1', '1', '0', '17578', '17579', 'Sk', '7', '7', '15007', '1096', 'Skeleton', '0', '2', 'Skeleton', 'Squelette', 'Skeleton', 'Squelette', 'Skeleton', 'Squelette', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('16', '9', '1', '0', '21685', '21686', 'Vr', '7', '7', '15007', '1096', 'Vrykul', '0', '2', 'Vrykul', 'Vrykul', 'Vrykul', 'Vrykule', 'Vrykul', 'Vrykul', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('17', '1', '1', '0', '21780', '21781', 'Tu', '7', '7', '15007', '1096', 'Tuskarr', '0', '2', 'Tuskarr', 'Rohart', 'Tuskarr', 'Rohart', 'Tuskarr', 'Rohart', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('18', '15', '1', '0', '21963', '21964', 'Ft', '7', '7', '15007', '1096', 'ForestTroll', '0', '2', 'Forest Troll', 'Troll des forêts', 'Forest Troll', 'Trollesse des forêts', 'Forest Troll', 'Troll des forêts', 'TUSKS', 'TUSKS', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('19', '5', '1', '0', '26316', '26317', 'Wt', '7', '7', '15007', '1096', 'Taunka', '0', '2', 'Taunka', 'Taunka', 'Taunka', 'Taunka', 'Taunka', 'Taunka', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('20', '5', '1', '0', '26871', '26872', 'NS', '7', '7', '15007', '1096', 'NorthrendSkeleton', '0', '2', 'Northrend Skeleton', 'Squelette du Norfendre', 'Northrend Skeleton', 'Squelette du Norfendre', 'Northrend Skeleton', 'Squelette du Norfendre', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('21', '5', '1', '0', '26873', '26874', 'It', '7', '7', '15007', '1096', 'IceTroll', '0', '2', 'Ice Troll', 'Troll des glaces', 'Ice Troll', 'Trollesse des glaces', 'Ice Troll', 'Troll des glaces', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('22','214','2203','20683','29422','29423','Wo','7','7','15007','1096','Worgen','170','0','Worgen','Worgen','Worgen','Worgen','Worgen','Worgen','NORMAL','EARS','NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('23','109','1','4140','49','50','Hu','7','7','15007','1096','Human','0','0','Gilnean','Gilnéen','Gilnean','Gilnéenne','Gilnean','Gilnéen','NORMAL','PIERCINGS','NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('24','120852','2395','4140','38551','38552','Pa','42','7','15007','1096','Pandaren','259','2','Pandaren','Pandaren','Pandaren','Pandarène','Pandaren','Pandaren','NORMAL','EARRINGS','NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('25','80388','2401','4140','38551','38552','Pa','7','7','15007','1096','Pandaren','259','0','Pandaren','Pandaren','Pandaren','Pandarène','Pandaren','Pandaren','NORMAL','EARRINGS','NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('26','80388','2402','4140','38551','38552','Pa','1','7','15007','1096','Pandaren','259','1','Pandaren','Pandaren','Pandaren','Pandarène','Pandaren','Pandaren','NORMAL','EARRINGS','NORMAL', '0');
*/

--
-- Records of `chrracesdbc` for Aviana
--

-- INSERT INTO `chrracesdbc` VALUES ('1', '12', '1', '4140', '49', '50', 'Hu', '7', '7', '15007', '1096', 'Human', '81', '0', 'Human', 'Humain', 'Human', 'Humaine', 'Human', 'Humain', 'NORMAL', 'PIERCINGS', 'NORMAL', '0');
-- INSERT INTO `chrracesdbc` VALUES ('2', '12', '2', '4141', '51', '52', 'Or', '1', '7', '15007', '1096', 'Orc', '21', '1', 'Orc', 'Orc', 'Orc', 'Orque', 'Orc', 'Orc', 'NORMAL', 'PIERCINGS', 'NORMAL', '0');
-- INSERT INTO `chrracesdbc` VALUES ('3', '12', '1', '4147', '53', '54', 'Dw', '7', '7', '15007', '1090', 'Dwarf', '41', '0', 'Dwarf', 'Nain', 'Dwarf', 'Naine', 'Dwarf', 'Nain', 'NORMAL', 'PIERCINGS', 'NORMAL', '0');
-- INSERT INTO `chrracesdbc` VALUES ('4', '12', '1', '4145', '55', '56', 'Ni', '7', '7', '15007', '1096', 'NightElf', '61', '0', 'Night Elf', 'Elfe de la nuit', 'Night Elf', 'Elfe de la nuit', 'Night Elf', 'Elfe de la nuit', 'NORMAL', 'MARKINGS', 'NORMAL', '0');
-- INSERT INTO `chrracesdbc` VALUES ('5', '12', '2', '4142', '57', '58', 'Sc', '1', '7', '15007', '1096', 'Scourge', '2', '1', 'Undead', 'Mort-vivant', 'Undead', 'Morte-vivante', 'Undead', 'Mort-vivant', 'FEATURES', 'FEATURES', 'NORMAL', '0');
-- INSERT INTO `chrracesdbc` VALUES ('6', '14', '2', '4143', '59', '60', 'Ta', '1', '7', '15007', '1096', 'Tauren', '141', '1', 'Tauren', 'Tauren', 'Tauren', 'Taurène', 'Tauren', 'Tauren', 'NORMAL', 'HAIR', 'HORNS', '0');
-- INSERT INTO `chrracesdbc` VALUES ('7', '12', '1', '4146', '1563', '1564', 'Gn', '7', '7', '15007', '1096', 'Gnome', '101', '0', 'Gnome', 'Gnome', 'Gnome', 'Gnome', 'Gnome', 'Gnome', 'NORMAL', 'EARRINGS', 'NORMAL', '0');
-- INSERT INTO `chrracesdbc` VALUES ('8', '14', '2', '4144', '1478', '1479', 'Tr', '1', '7', '15007', '1096', 'Troll', '121', '1', 'Troll', 'Troll', 'Troll', 'Trollesse', 'Troll', 'Troll', 'TUSKS', 'TUSKS', 'NORMAL', '0');
-- INSERT INTO `chrracesdbc` VALUES ('10', '12', '2', '4142', '15476', '15475', 'Be', '1', '7', '15007', '1096', 'BloodElf', '162', '1', 'Blood Elf', 'Elfe de sang', 'Blood Elf', 'Elfe de sang', 'Blood Elf', 'Elfe de sang', 'NORMAL', 'EARRINGS', 'NORMAL', '0');
-- INSERT INTO `chrracesdbc` VALUES ('11', '14', '1', '4140', '16125', '16126', 'Dr', '7', '7', '15007', '1096', 'Draenei', '163', '0', 'Draenei', 'Draeneï', 'Draenei', 'Draeneï', 'Draenei', 'Draeneï', 'NORMAL', 'HORNS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('1', '12', '1', '4140', '55010', '55011', 'Hu', '7', '7', '15007', '1096', 'Human', '81', '0', 'Human', 'Humain', 'Human', 'Humaine', 'Human', 'Humain', 'NORMAL', 'PIERCINGS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('2', '12', '2', '4141', '55020', '55021', 'Or', '1', '7', '15007', '1096', 'Orc', '21', '1', 'Orc', 'Orc', 'Orc', 'Orque', 'Orc', 'Orc', 'NORMAL', 'PIERCINGS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('3', '12', '1', '4147', '55030', '55031', 'Dw', '7', '7', '15007', '1090', 'Dwarf', '41', '0', 'Dwarf', 'Nain', 'Dwarf', 'Naine', 'Dwarf', 'Nain', 'NORMAL', 'PIERCINGS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('4', '12', '1', '4145', '55040', '55041', 'Ni', '7', '7', '15007', '1096', 'NightElf', '61', '0', 'Night Elf', 'Elfe de la nuit', 'Night Elf', 'Elfe de la nuit', 'Night Elf', 'Elfe de la nuit', 'NORMAL', 'MARKINGS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('5', '12', '2', '4142', '55050', '55051', 'Sc', '1', '7', '15007', '1096', 'Scourge', '2', '1', 'Undead', 'Mort-vivant', 'Undead', 'Morte-vivante', 'Undead', 'Mort-vivant', 'FEATURES', 'FEATURES', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('6', '14', '2', '4143', '55060', '55061', 'Ta', '1', '7', '15007', '1096', 'Tauren', '141', '1', 'Tauren', 'Tauren', 'Tauren', 'Taurène', 'Tauren', 'Tauren', 'NORMAL', 'HAIR', 'HORNS', '0');
INSERT INTO `chrracesdbc` VALUES ('7', '12', '1', '4146', '55070', '55071', 'Gn', '7', '7', '15007', '1096', 'Gnome', '101', '0', 'Gnome', 'Gnome', 'Gnome', 'Gnome', 'Gnome', 'Gnome', 'NORMAL', 'EARRINGS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('8', '14', '2', '4144', '55080', '55081', 'Tr', '1', '7', '15007', '1096', 'Troll', '121', '1', 'Troll', 'Troll', 'Troll', 'Trollesse', 'Troll', 'Troll', 'TUSKS', 'TUSKS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('9', '1', '1', '0', '6894', '6895', 'Go', '7', '7', '15007', '1096', 'Goblin', '0', '2', 'Goblin', 'Gobelin', 'Goblin', 'Gobeline', 'Goblin', 'Gobelin', 'NORMAL', 'NONE', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('10', '12', '2', '4142', '55100', '55101', 'Be', '1', '7', '15007', '1096', 'BloodElf', '162', '1', 'Blood Elf', 'Elfe de sang', 'Blood Elf', 'Elfe de sang', 'Blood Elf', 'Elfe de sang', 'NORMAL', 'EARRINGS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('11', '14', '1', '4140', '55110', '55111', 'Dr', '7', '7', '15007', '1096', 'Draenei', '163', '0', 'Draenei', 'Draeneï', 'Draenei', 'Draeneï', 'Draenei', 'Draeneï', 'NORMAL', 'HORNS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('12', '5', '1', '0', '16981', '16980', 'Fo', '7', '7', '15007', '1096', 'FelOrc', '0', '2', 'Fel Orc', 'Gangr\'orc', 'Fel Orc', 'Gangr\'orque', 'Fel Orc', 'Gangr\'orc', 'NORMAL', 'NORMAL', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('13', '1', '1', '0', '17402', '17403', 'Na', '7', '7', '15007', '1096', 'Naga_', '0', '2', 'Naga', 'Naga', 'Naga', 'Naga', 'Naga', 'Naga', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('14', '5', '1', '0', '17576', '17577', 'Br', '7', '7', '15007', '1096', 'Broken', '0', '2', 'Broken', 'Roué', 'Broken', 'Rouée', 'Broken', 'Roué', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('15', '1', '1', '0', '17578', '17579', 'Sk', '7', '7', '15007', '1096', 'Skeleton', '0', '2', 'Skeleton', 'Squelette', 'Skeleton', 'Squelette', 'Skeleton', 'Squelette', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('16', '1', '1', '0', '21685', '21686', 'Vr', '7', '7', '15007', '1096', 'Vrykul', '0', '2', 'Vrykul', 'Vrykul', 'Vrykul', 'Vrykule', 'Vrykul', 'Vrykul', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('17', '1', '1', '0', '21780', '21781', 'Tu', '7', '7', '15007', '1096', 'Tuskarr', '0', '2', 'Tuskarr', 'Rohart', 'Tuskarr', 'Rohart', 'Tuskarr', 'Rohart', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('18', '5', '1', '0', '21963', '21964', 'Ft', '7', '7', '15007', '1096', 'ForestTroll', '0', '2', 'Forest Troll', 'Troll des forêts', 'Forest Troll', 'Trollesse des forêts', 'Forest Troll', 'Troll des forêts', 'TUSKS', 'TUSKS', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('19', '5', '1', '0', '26316', '26317', 'Wt', '7', '7', '15007', '1096', 'Taunka', '0', '2', 'Taunka', 'Taunka', 'Taunka', 'Taunka', 'Taunka', 'Taunka', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('20', '5', '1', '0', '26871', '26872', 'NS', '7', '7', '15007', '1096', 'NorthrendSkeleton', '0', '2', 'Northrend Skeleton', 'Squelette du Norfendre', 'Northrend Skeleton', 'Squelette du Norfendre', 'Northrend Skeleton', 'Squelette du Norfendre', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('21', '5', '1', '0', '26873', '26874', 'It', '7', '7', '15007', '1096', 'IceTroll', '0', '2', 'Ice Troll', 'Troll des glaces', 'Ice Troll', 'Trollesse des glaces', 'Ice Troll', 'Troll des glaces', 'Normal', 'Normal', 'Normal', '0');
INSERT INTO `chrracesdbc` VALUES ('22', '5', '2203', '20683', '29422', '29423', 'Wo', '7', '7', '15007', '1096', 'Worgen', '0', '2', 'Worgen', 'Worgen', 'Worgen', 'Worgen', 'Worgen', 'Worgen', 'NORMAL', 'EARS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('23', '5', '1', '4140', '49', '50', 'Hu', '7', '7', '15007', '1096', 'Human', '0', '2', 'Gilnean', 'Gilnéen', 'Gilnean', 'Gilnéenne', 'Gilnean', 'Gilnéen', 'NORMAL', 'PIERCINGS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('24', '5', '2395', '4140', '38551', '38552', 'Pa', '42', '7', '15007', '1096', 'Pandaren', '0', '2', 'Pandaren', 'Pandaren', 'Pandaren', 'Pandarène', 'Pandaren', 'Pandaren', 'NORMAL', 'EARRINGS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('25', '5', '2401', '4140', '38551', '38552', 'Pa', '7', '7', '15007', '1096', 'Pandaren', '0', '2', 'Pandaren', 'Pandaren', 'Pandaren', 'Pandarène', 'Pandaren', 'Pandaren', 'NORMAL', 'EARRINGS', 'NORMAL', '0');
INSERT INTO `chrracesdbc` VALUES ('26', '5', '2402', '4140', '38551', '38552', 'Pa', '1', '7', '15007', '1096', 'Pandaren', '0', '2', 'Pandaren', 'Pandaren', 'Pandaren', 'Pandarène', 'Pandaren', 'Pandaren', 'NORMAL', 'EARRINGS', 'NORMAL', '0');
