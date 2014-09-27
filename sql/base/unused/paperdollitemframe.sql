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
-- Table structure for table `paperdollitemframe`
--

DROP TABLE IF EXISTS `paperdollitemframe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paperdollitemframe` (
  `Slot` varchar(100) NOT NULL DEFAULT '',
  `Icon` varchar(200) NOT NULL DEFAULT '',
  `SlotId` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SlotId`),
  UNIQUE KEY `ID` (`Slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paperdollitemframe`
--

LOCK TABLES `paperdollitemframe` WRITE;
/*!40000 ALTER TABLE `paperdollitemframe` DISABLE KEYS */;
/*!40000 ALTER TABLE `paperdollitemframe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `paperdollitemframe`
--

INSERT INTO `paperdollitemframe` VALUES ('HeadSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Head.blp', '1');
INSERT INTO `paperdollitemframe` VALUES ('NeckSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Neck.blp', '2');
INSERT INTO `paperdollitemframe` VALUES ('ShoulderSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Shoulder.blp', '3');
INSERT INTO `paperdollitemframe` VALUES ('ShirtSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Shirt.blp', '4');
INSERT INTO `paperdollitemframe` VALUES ('ChestSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Chest.blp', '5');
INSERT INTO `paperdollitemframe` VALUES ('WaistSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Waist.blp', '6');
INSERT INTO `paperdollitemframe` VALUES ('LegsSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Legs.blp', '7');
INSERT INTO `paperdollitemframe` VALUES ('FeetSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Feet.blp', '8');
INSERT INTO `paperdollitemframe` VALUES ('WristSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Wrists.blp', '9');
INSERT INTO `paperdollitemframe` VALUES ('HandsSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Hands.blp', '10');
INSERT INTO `paperdollitemframe` VALUES ('Finger0Slot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Finger.blp', '11');
INSERT INTO `paperdollitemframe` VALUES ('Finger1Slot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Finger.blp', '12');
INSERT INTO `paperdollitemframe` VALUES ('Trinket0Slot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Trinket.blp', '13');
INSERT INTO `paperdollitemframe` VALUES ('Trinket1Slot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Trinket.blp', '14');
INSERT INTO `paperdollitemframe` VALUES ('BackSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Chest.blp', '15');
INSERT INTO `paperdollitemframe` VALUES ('MainHandSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-MainHand.blp', '16');
INSERT INTO `paperdollitemframe` VALUES ('SecondaryHandSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-SecondaryHand.blp', '17');
INSERT INTO `paperdollitemframe` VALUES ('RangedSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Ranged.blp', '18');
INSERT INTO `paperdollitemframe` VALUES ('TabardSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Tabard.blp', '19');
INSERT INTO `paperdollitemframe` VALUES ('Bag1', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '64');
INSERT INTO `paperdollitemframe` VALUES ('Bag2', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '65');
INSERT INTO `paperdollitemframe` VALUES ('Bag3', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '66');
INSERT INTO `paperdollitemframe` VALUES ('Bag4', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '67');
INSERT INTO `paperdollitemframe` VALUES ('Bag5', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '68');
INSERT INTO `paperdollitemframe` VALUES ('Bag6', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '69');
INSERT INTO `paperdollitemframe` VALUES ('Bag7', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '70');
INSERT INTO `paperdollitemframe` VALUES ('Bag8', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '71');
INSERT INTO `paperdollitemframe` VALUES ('Bag9', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '72');
INSERT INTO `paperdollitemframe` VALUES ('Bag10', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '73');
INSERT INTO `paperdollitemframe` VALUES ('Bag11', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '74');
INSERT INTO `paperdollitemframe` VALUES ('Bag12', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '75');
INSERT INTO `paperdollitemframe` VALUES ('Bag0Slot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '20');
INSERT INTO `paperdollitemframe` VALUES ('Bag1Slot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '21');
INSERT INTO `paperdollitemframe` VALUES ('Bag2Slot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '22');
INSERT INTO `paperdollitemframe` VALUES ('Bag3Slot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Bag.blp', '23');
INSERT INTO `paperdollitemframe` VALUES ('AmmoSlot', 'interface\\paperdoll\\UI-PaperDoll-Slot-Ranged.blp', '0');
