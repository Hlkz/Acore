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
-- Table structure for table `holidaysdbc`
--

DROP TABLE IF EXISTS `holidaysdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidaysdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Duration1` int(10) NOT NULL DEFAULT '0',
  `Duration2` int(10) NOT NULL DEFAULT '0',
  `Duration3` int(10) NOT NULL DEFAULT '0',
  `Duration4` int(10) NOT NULL DEFAULT '0',
  `Duration5` int(10) NOT NULL DEFAULT '0',
  `Duration6` int(10) NOT NULL DEFAULT '0',
  `Duration7` int(10) NOT NULL DEFAULT '0',
  `Duration8` int(10) NOT NULL DEFAULT '0',
  `Duration9` int(10) NOT NULL DEFAULT '0',
  `Duration10` int(10) NOT NULL DEFAULT '0',
  `Date1` float(10,0) NOT NULL,
  `Date2` float(10,0) NOT NULL,
  `Date3` float(10,0) NOT NULL,
  `Date4` float(10,0) NOT NULL,
  `Date5` float(10,0) NOT NULL,
  `Date6` float(10,0) NOT NULL,
  `Date7` float(10,0) NOT NULL,
  `Date8` float(10,0) NOT NULL,
  `Date9` float(10,0) NOT NULL,
  `Date10` float(10,0) NOT NULL,
  `Date11` float(10,0) NOT NULL,
  `Date12` float(10,0) NOT NULL,
  `Date13` float(10,0) NOT NULL,
  `Date14` int(10) NOT NULL DEFAULT '0',
  `Date15` int(10) NOT NULL DEFAULT '0',
  `Date16` int(10) NOT NULL DEFAULT '0',
  `Date17` int(10) NOT NULL DEFAULT '0',
  `Date18` int(10) NOT NULL DEFAULT '0',
  `Date19` int(10) NOT NULL DEFAULT '0',
  `Date20` int(10) NOT NULL DEFAULT '0',
  `Date21` int(10) NOT NULL DEFAULT '0',
  `Date22` int(10) NOT NULL DEFAULT '0',
  `Date23` int(10) NOT NULL DEFAULT '0',
  `Date24` int(10) NOT NULL DEFAULT '0',
  `Date25` int(10) NOT NULL DEFAULT '0',
  `Date26` int(10) NOT NULL DEFAULT '0',
  `Region` int(10) NOT NULL DEFAULT '0',
  `Looping` int(10) NOT NULL DEFAULT '0',
  `CalendarFlags1` int(10) NOT NULL DEFAULT '0',
  `CalendarFlags2` int(10) NOT NULL DEFAULT '0',
  `CalendarFlags3` int(10) NOT NULL DEFAULT '0',
  `CalendarFlags4` int(10) NOT NULL DEFAULT '0',
  `CalendarFlags5` int(10) NOT NULL DEFAULT '0',
  `CalendarFlags6` int(10) NOT NULL DEFAULT '0',
  `CalendarFlags7` int(10) NOT NULL DEFAULT '0',
  `CalendarFlags8` int(10) NOT NULL DEFAULT '0',
  `CalendarFlags9` int(10) NOT NULL DEFAULT '0',
  `CalendarFlags10` int(10) NOT NULL DEFAULT '0',
  `HolidayNameId` int(10) NOT NULL DEFAULT '0',
  `HolidayDescriptionId` int(10) NOT NULL DEFAULT '0',
  `TextureFilename` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Priority` int(10) NOT NULL DEFAULT '0',
  `CalendarFilterType` int(10) NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidaysdbc`
--

LOCK TABLES `holidaysdbc` WRITE;
/*!40000 ALTER TABLE `holidaysdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidaysdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `holidaysdbc`
--

INSERT INTO `holidaysdbc` VALUES ('62', '18', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '12', '11', '', '0', '-1', '1');
INSERT INTO `holidaysdbc` VALUES ('141', '432', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '14', '13', 'Calendar_WinterVeil', '75', '-1', '1');
INSERT INTO `holidaysdbc` VALUES ('181', '168', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '14', 'Calendar_Noblegarden', '2', '-1', '1');
INSERT INTO `holidaysdbc` VALUES ('201', '168', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13', '12', 'Calendar_ChildrensWeek', '2', '-1', '1');
INSERT INTO `holidaysdbc` VALUES ('283', '96', '912', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '22', '22', '', '0', '2', '1');
INSERT INTO `holidaysdbc` VALUES ('284', '96', '912', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '25', '25', '', '0', '2', '1');
INSERT INTO `holidaysdbc` VALUES ('285', '96', '912', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '23', '23', '', '0', '2', '1');
INSERT INTO `holidaysdbc` VALUES ('301', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '6', '4', 'Calendar_FishingExtravaganza', '0', '0', '0');
INSERT INTO `holidaysdbc` VALUES ('321', '168', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '17', '16', 'Calendar_HarvestFestival', '2', '-1', '1');
INSERT INTO `holidaysdbc` VALUES ('324', '335', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '16', '15', 'Calendar_HallowsEnd', '3', '-1', '1');
INSERT INTO `holidaysdbc` VALUES ('327', '504', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '18', '17', 'Calendar_LunarFestival', '3', '-1', '1');
INSERT INTO `holidaysdbc` VALUES ('335', '120', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9', '9', 'Calendar_LoveInTheAir', '2', '-1', '1');
INSERT INTO `holidaysdbc` VALUES ('341', '336', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '11', '10', 'Calendar_Midsummer', '2', '-1', '1');
INSERT INTO `holidaysdbc` VALUES ('353', '96', '912', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '24', '24', '', '0', '2', '1');
INSERT INTO `holidaysdbc` VALUES ('372', '168', '384', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '7', '8', 'Calendar_Brewfest', '2', '-1', '1');
INSERT INTO `holidaysdbc` VALUES ('374', '48', '168', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', 'Calendar_DarkmoonFaireElwynn', '1', '1', '0');
INSERT INTO `holidaysdbc` VALUES ('375', '48', '168', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '1', '26', 'Calendar_DarkmoonFaireMulgore', '1', '1', '0');
INSERT INTO `holidaysdbc` VALUES ('376', '48', '168', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '1', '27', 'Calendar_DarkmoonFaireTerokkar', '1', '1', '0');
INSERT INTO `holidaysdbc` VALUES ('398', '24', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '21', '21', 'Calendar_PiratesDay', '0', '-1', '1');
INSERT INTO `holidaysdbc` VALUES ('400', '96', '912', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '41', '41', '', '0', '2', '1');
INSERT INTO `holidaysdbc` VALUES ('404', '167', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '101', '101', 'Calendar_HarvestFestival', '2', '-1', '1');
INSERT INTO `holidaysdbc` VALUES ('406', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '61', '61', 'Calendar_WotLKLaunch', '0', '-1', '0');
INSERT INTO `holidaysdbc` VALUES ('409', '47', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '81', '81', 'Calendar_DayOfTheDead', '2', '-1', '1');
INSERT INTO `holidaysdbc` VALUES ('420', '96', '912', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '121', '121', '', '0', '2', '1');
INSERT INTO `holidaysdbc` VALUES ('423', '336', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9', '9', 'Calendar_LoveInTheAir', '2', '-1', '1');
INSERT INTO `holidaysdbc` VALUES ('424', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '161', '161', 'Calendar_FishingExtravaganza', '0', '0', '0');
