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
-- Table structure for table `itemsubclass`
--

DROP TABLE IF EXISTS `itemsubclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemsubclass` (
  `ItemClass` int(10) NOT NULL DEFAULT '0',
  `SubClass` int(10) NOT NULL DEFAULT '0',
  `PreRequisiteProficiency` int(10) NOT NULL DEFAULT '0',
  `PostRequisiteProficiency` int(10) NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  `DisplayFlags` int(10) NOT NULL DEFAULT '0',
  `WeaponParrySeq` int(10) NOT NULL DEFAULT '0',
  `WeaponReadySeq` int(10) NOT NULL DEFAULT '0',
  `WeaponAttackSeq` int(10) NOT NULL DEFAULT '0',
  `WeaponSwingSize` int(10) NOT NULL DEFAULT '0',
  `DisplayName` varchar(100) NOT NULL DEFAULT '',
  `DisplayName_loc2` varchar(100) NOT NULL DEFAULT '',
  `VerboseName` varchar(100) NOT NULL DEFAULT '',
  `VerboseName_loc2` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`ItemClass`,`SubClass`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemsubclass`
--

LOCK TABLES `itemsubclass` WRITE;
/*!40000 ALTER TABLE `itemsubclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemsubclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `itemsubclass`
--

INSERT INTO `itemsubclass` VALUES ('0', '0', '-1', '-1', '0', '3', '3', '2', '3', '0', 'Consumable', 'Autre', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '5', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Food & Drink', 'Autre', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '1', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Potion', 'Autre', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '2', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Elixir', 'Autre', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '3', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Flask', 'Autre', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '7', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Bandage', 'Autre', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '6', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Item Enhancement', 'Autre', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '4', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Scroll', 'Autre', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '8', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Other', 'Autre', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '0', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Bag', 'Sac de calligraphie', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '1', '-1', '-1', '0', '4', '0', '0', '3', '0', 'Soul Bag', 'Sac de calligraphie', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '2', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Herb Bag', 'Sac de calligraphie', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '3', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Enchanting Bag', 'Sac de calligraphie', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '4', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Engineering Bag', 'Sac de calligraphie', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '5', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Gem Bag', 'Sac de calligraphie', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '6', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Mining Bag', 'Sac de calligraphie', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '7', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Leatherworking Bag', 'Sac de calligraphie', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '8', '-1', '-1', '0', '0', '3', '0', '3', '0', 'Inscription Bag', 'Sac de calligraphie', '', '');
INSERT INTO `itemsubclass` VALUES ('2', '0', '-1', '1', '3', '0', '2', '2', '3', '1', 'Axe', 'Canne à pêche', 'One-Handed Axes', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '1', '0', '-1', '3', '0', '0', '0', '0', '2', 'Axe', 'Canne à pêche', 'Two-Handed Axes', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '2', '-1', '-1', '128', '0', '3', '3', '2', '1', 'Bow', 'Canne à pêche', 'Bows', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '3', '-1', '-1', '168', '0', '3', '4', '4', '1', 'Gun', 'Canne à pêche', 'Guns', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '4', '-1', '5', '3', '0', '2', '2', '3', '1', 'Mace', 'Canne à pêche', 'One-Handed Maces', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '5', '4', '-1', '3', '0', '0', '0', '0', '2', 'Mace', 'Canne à pêche', 'Two-Handed Maces', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '6', '-1', '-1', '3', '0', '1', '1', '1', '2', 'Polearm', 'Canne à pêche', 'Polearms', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '7', '-1', '8', '3', '0', '2', '2', '3', '1', 'Sword', 'Canne à pêche', 'One-Handed Swords', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '8', '7', '-1', '3', '0', '0', '0', '0', '2', 'Sword', 'Canne à pêche', 'Two-Handed Swords', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '9', '-1', '-1', '0', '3', '3', '2', '3', '1', 'Obsolete', 'Canne à pêche', '', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '10', '-1', '-1', '3', '0', '1', '1', '1', '2', 'Staff', 'Canne à pêche', 'Staves', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '11', '-1', '12', '0', '3', '3', '2', '3', '1', 'Exotic', 'Canne à pêche', 'One-Handed Exotics', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '12', '11', '-1', '0', '3', '3', '2', '3', '2', 'Exotic', 'Canne à pêche', 'Two-Handed Exotics', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '13', '-1', '-1', '5', '0', '3', '2', '3', '0', 'Fist Weapon', 'Canne à pêche', 'Fist Weapons', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '14', '-1', '-1', '2', '1', '3', '2', '3', '1', 'Miscellaneous', 'Canne à pêche', '', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '15', '-1', '-1', '3', '0', '2', '2', '3', '0', 'Dagger', 'Canne à pêche', 'Daggers', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '16', '-1', '-1', '16', '0', '3', '5', '5', '1', 'Thrown', 'Canne à pêche', 'Thrown', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '17', '-1', '-1', '3', '2', '1', '1', '1', '2', 'Spear', 'Canne à pêche', 'Spears', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '18', '-1', '-1', '160', '0', '3', '4', '4', '1', 'Crossbow', 'Canne à pêche', 'Crossbows', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '19', '-1', '-1', '256', '0', '3', '2', '3', '1', 'Wand', 'Canne à pêche', 'Wands', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('2', '20', '-1', '-1', '0', '0', '1', '1', '1', '2', 'Fishing Pole', 'Canne à pêche', 'Fishing Poles', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('3', '0', '-1', '-1', '0', '1', '0', '0', '0', '0', 'Red', 'Prismatique', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '1', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Blue', 'Prismatique', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '2', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Yellow', 'Prismatique', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '3', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Purple', 'Prismatique', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '4', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Green', 'Prismatique', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '5', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Orange', 'Prismatique', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '6', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Meta', 'Prismatique', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '7', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Simple', 'Prismatique', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '8', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Prismatic', 'Prismatique', '', '');
INSERT INTO `itemsubclass` VALUES ('4', '0', '-1', '-1', '512', '1', '0', '0', '3', '0', 'Miscellaneous', 'Cachet', '', 'Cachets');
INSERT INTO `itemsubclass` VALUES ('4', '1', '-1', '-1', '512', '0', '0', '0', '3', '0', 'Cloth', 'Cachet', 'Cloth', 'Cachets');
INSERT INTO `itemsubclass` VALUES ('4', '2', '-1', '-1', '512', '0', '0', '0', '3', '0', 'Leather', 'Cachet', 'Leather', 'Cachets');
INSERT INTO `itemsubclass` VALUES ('4', '3', '-1', '-1', '512', '0', '0', '0', '3', '0', 'Mail', 'Cachet', 'Mail', 'Cachets');
INSERT INTO `itemsubclass` VALUES ('4', '4', '-1', '-1', '512', '0', '0', '0', '3', '0', 'Plate', 'Cachet', 'Plate', 'Cachets');
INSERT INTO `itemsubclass` VALUES ('4', '5', '-1', '-1', '0', '2', '0', '0', '3', '0', 'Buckler(OBSOLETE)', 'Cachet', 'Bucklers', 'Cachets');
INSERT INTO `itemsubclass` VALUES ('4', '6', '5', '-1', '0', '0', '0', '0', '3', '0', 'Shield', 'Cachet', 'Shields', 'Cachets');
INSERT INTO `itemsubclass` VALUES ('4', '7', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Libram', 'Cachet', 'Librams', 'Cachets');
INSERT INTO `itemsubclass` VALUES ('4', '8', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Idol', 'Cachet', 'Idols', 'Cachets');
INSERT INTO `itemsubclass` VALUES ('4', '9', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Totem', 'Cachet', 'Totems', 'Cachets');
INSERT INTO `itemsubclass` VALUES ('4', '10', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Sigil', 'Cachet', 'Sigils', 'Cachets');
INSERT INTO `itemsubclass` VALUES ('5', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Reagent', 'Réactif', '', '');
INSERT INTO `itemsubclass` VALUES ('6', '0', '-1', '-1', '0', '3', '0', '0', '3', '0', 'Wand(OBSOLETE)', 'Arme de jet(OBSOLETE)', '', '');
INSERT INTO `itemsubclass` VALUES ('6', '1', '-1', '-1', '0', '2', '0', '0', '3', '0', 'Bolt(OBSOLETE)', 'Arme de jet(OBSOLETE)', '', '');
INSERT INTO `itemsubclass` VALUES ('6', '2', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Arrow', 'Arme de jet(OBSOLETE)', '', '');
INSERT INTO `itemsubclass` VALUES ('6', '3', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Bullet', 'Arme de jet(OBSOLETE)', '', '');
INSERT INTO `itemsubclass` VALUES ('6', '4', '-1', '-1', '64', '2', '3', '2', '3', '0', 'Thrown(OBSOLETE)', 'Arme de jet(OBSOLETE)', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '0', '-1', '-1', '0', '3', '3', '2', '3', '0', 'Trade Goods', 'Enchantement d\'arme', '', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('7', '10', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Elemental', 'Enchantement d\'arme', '', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('7', '5', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Cloth', 'Enchantement d\'arme', '', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('7', '6', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Leather', 'Enchantement d\'arme', '', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('7', '7', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Metal & Stone', 'Enchantement d\'arme', '', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('7', '8', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Meat', 'Enchantement d\'arme', '', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('7', '9', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Herb', 'Enchantement d\'arme', '', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('7', '12', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Enchanting', 'Enchantement d\'arme', '', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('7', '4', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Jewelcrafting', 'Enchantement d\'arme', '', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('7', '1', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Parts', 'Enchantement d\'arme', '', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('7', '3', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Devices', 'Enchantement d\'arme', '', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('7', '2', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Explosives', 'Enchantement d\'arme', '', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('7', '13', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Materials', 'Enchantement d\'arme', '', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('7', '11', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Other', 'Enchantement d\'arme', '', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('7', '14', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Armor Enchantment', 'Enchantement d\'arme', 'Armor Enchantment', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('7', '15', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Weapon Enchantment', 'Enchantement d\'arme', 'Weapon Enchantment', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('8', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Generic(OBSOLETE)', 'Générique(OBSOLETE)', '', '');
INSERT INTO `itemsubclass` VALUES ('9', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Book', 'Calligraphie', '', 'Calligraphie');
INSERT INTO `itemsubclass` VALUES ('9', '1', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Leatherworking', 'Calligraphie', '', 'Calligraphie');
INSERT INTO `itemsubclass` VALUES ('9', '2', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Tailoring', 'Calligraphie', '', 'Calligraphie');
INSERT INTO `itemsubclass` VALUES ('9', '3', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Engineering', 'Calligraphie', '', 'Calligraphie');
INSERT INTO `itemsubclass` VALUES ('9', '4', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Blacksmithing', 'Calligraphie', '', 'Calligraphie');
INSERT INTO `itemsubclass` VALUES ('9', '5', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Cooking', 'Calligraphie', '', 'Calligraphie');
INSERT INTO `itemsubclass` VALUES ('9', '6', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Alchemy', 'Calligraphie', '', 'Calligraphie');
INSERT INTO `itemsubclass` VALUES ('9', '7', '-1', '-1', '0', '1', '3', '2', '3', '0', 'First Aid', 'Calligraphie', '', 'Calligraphie');
INSERT INTO `itemsubclass` VALUES ('9', '8', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Enchanting', 'Calligraphie', '', 'Calligraphie');
INSERT INTO `itemsubclass` VALUES ('9', '9', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Fishing', 'Calligraphie', '', 'Calligraphie');
INSERT INTO `itemsubclass` VALUES ('9', '10', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Jewelcrafting', 'Calligraphie', '', 'Calligraphie');
INSERT INTO `itemsubclass` VALUES ('9', '11', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Inscription', 'Calligraphie', 'Inscription', 'Calligraphie');
INSERT INTO `itemsubclass` VALUES ('10', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Money(OBSOLETE)', 'Argent(OBSOLETE)', '', '');
INSERT INTO `itemsubclass` VALUES ('11', '0', '-1', '-1', '0', '7', '0', '0', '3', '0', 'Quiver(OBSOLETE)', 'Giberne', '', '');
INSERT INTO `itemsubclass` VALUES ('11', '1', '-1', '-1', '0', '7', '0', '0', '3', '0', 'Quiver(OBSOLETE)', 'Giberne', '', '');
INSERT INTO `itemsubclass` VALUES ('11', '2', '-1', '-1', '0', '4', '0', '0', '3', '0', 'Quiver', 'Giberne', '', '');
INSERT INTO `itemsubclass` VALUES ('11', '3', '-1', '-1', '0', '4', '0', '0', '3', '0', 'Ammo Pouch', 'Giberne', '', '');
INSERT INTO `itemsubclass` VALUES ('12', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Quest', 'Quête', '', '');
INSERT INTO `itemsubclass` VALUES ('13', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Key', 'Crochetage', '', '');
INSERT INTO `itemsubclass` VALUES ('13', '1', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Lockpick', 'Crochetage', '', '');
INSERT INTO `itemsubclass` VALUES ('14', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Permanent', 'Permanent', '', '');
INSERT INTO `itemsubclass` VALUES ('15', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Junk', 'Monture', '', 'Monture');
INSERT INTO `itemsubclass` VALUES ('15', '1', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Reagent', 'Monture', '', 'Monture');
INSERT INTO `itemsubclass` VALUES ('15', '2', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Pet', 'Monture', '', 'Monture');
INSERT INTO `itemsubclass` VALUES ('15', '3', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Holiday', 'Monture', '', 'Monture');
INSERT INTO `itemsubclass` VALUES ('15', '4', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Other', 'Monture', '', 'Monture');
INSERT INTO `itemsubclass` VALUES ('15', '5', '-1', '-1', '0', '0', '3', '2', '3', '0', 'Mount', 'Monture', 'Mount', 'Monture');
INSERT INTO `itemsubclass` VALUES ('16', '1', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Warrior', 'Druide', 'Warrior', 'Druide');
INSERT INTO `itemsubclass` VALUES ('16', '2', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Paladin', 'Druide', 'Paladin', 'Druide');
INSERT INTO `itemsubclass` VALUES ('16', '3', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Hunter', 'Druide', 'Hunter', 'Druide');
INSERT INTO `itemsubclass` VALUES ('16', '4', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Rogue', 'Druide', 'Rogue', 'Druide');
INSERT INTO `itemsubclass` VALUES ('16', '5', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Priest', 'Druide', 'Priest', 'Druide');
INSERT INTO `itemsubclass` VALUES ('16', '6', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Death Knight', 'Druide', 'Death Knight', 'Druide');
INSERT INTO `itemsubclass` VALUES ('16', '7', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Shaman', 'Druide', 'Shaman', 'Druide');
INSERT INTO `itemsubclass` VALUES ('16', '8', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Mage', 'Druide', 'Mage', 'Druide');
INSERT INTO `itemsubclass` VALUES ('16', '9', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Warlock', 'Druide', 'Warlock', 'Druide');
INSERT INTO `itemsubclass` VALUES ('16', '11', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Druid', 'Druide', 'Druid', 'Druide');
