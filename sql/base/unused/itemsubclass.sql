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
  `ItemClass` int(10) unsigned NOT NULL DEFAULT '0',
  `SubClass` int(10) unsigned NOT NULL DEFAULT '0',
  `PreRequisiteProficiency` int(10) NOT NULL DEFAULT '0',
  `PostRequisiteProficiency` int(10) NOT NULL DEFAULT '0',
  `Flags` int(10) NOT NULL DEFAULT '0',
  `DisplayFlags` int(10) NOT NULL DEFAULT '0',
  `WeaponParrySeq` int(10) NOT NULL DEFAULT '0',
  `WeaponReadySeq` int(10) NOT NULL DEFAULT '0',
  `WeaponAttackSeq` int(10) NOT NULL DEFAULT '0',
  `WeaponSwingSize` int(10) NOT NULL DEFAULT '0',
  `DisplayName` varchar(128) NOT NULL DEFAULT '',
  `DisplayName_loc2` varchar(128) NOT NULL DEFAULT '',
  `VerboseName` varchar(128) NOT NULL DEFAULT '',
  `VerboseName_loc2` varchar(128) NOT NULL DEFAULT '',
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

INSERT INTO `itemsubclass` VALUES ('0', '0', '-1', '-1', '0', '3', '3', '2', '3', '0', 'Consumable', 'Consommables', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '5', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Food & Drink', 'Nourriture & boissons', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '1', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Potion', 'Potion', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '2', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Elixir', 'Élixir', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '3', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Flask', 'Flacon', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '7', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Bandage', 'Bandage', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '6', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Item Enhancement', 'Amélioration d\'objet', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '4', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Scroll', 'Parchemin', '', '');
INSERT INTO `itemsubclass` VALUES ('0', '8', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Other', 'Autre', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '0', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Bag', 'Sac', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '1', '-1', '-1', '0', '4', '0', '0', '3', '0', 'Soul Bag', 'Sac d\'âme', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '2', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Herb Bag', 'Sac d\'herbes', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '3', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Enchanting Bag', 'Sac d\'enchanteur', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '4', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Engineering Bag', 'Sac d\'ingénieur', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '5', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Gem Bag', 'Sac de gemmes', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '6', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Mining Bag', 'Sac de mineur', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '7', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Leatherworking Bag', 'Sac de travail du cuir', '', '');
INSERT INTO `itemsubclass` VALUES ('1', '8', '-1', '-1', '0', '0', '3', '0', '3', '0', 'Inscription Bag', 'Sac de calligraphie', '', '');
INSERT INTO `itemsubclass` VALUES ('2', '0', '-1', '1', '3', '0', '2', '2', '3', '1', 'Axe', 'Hache', 'One-Handed Axes', 'Haches à une main');
INSERT INTO `itemsubclass` VALUES ('2', '1', '0', '-1', '3', '0', '0', '0', '0', '2', 'Axe', 'Hache', 'Two-Handed Axes', 'Haches à deux mains');
INSERT INTO `itemsubclass` VALUES ('2', '2', '-1', '-1', '128', '0', '3', '3', '2', '1', 'Bow', 'Arc', 'Bows', 'Arcs');
INSERT INTO `itemsubclass` VALUES ('2', '3', '-1', '-1', '168', '0', '3', '4', '4', '1', 'Gun', 'Arme à feu', 'Guns', 'Fusils');
INSERT INTO `itemsubclass` VALUES ('2', '4', '-1', '5', '3', '0', '2', '2', '3', '1', 'Mace', 'Masse', 'One-Handed Maces', 'Masses à une main');
INSERT INTO `itemsubclass` VALUES ('2', '5', '4', '-1', '3', '0', '0', '0', '0', '2', 'Mace', 'Masse', 'Two-Handed Maces', 'Masses à deux mains');
INSERT INTO `itemsubclass` VALUES ('2', '6', '-1', '-1', '3', '0', '1', '1', '1', '2', 'Polearm', 'Arme d\'hast', 'Polearms', 'Armes d\'hast');
INSERT INTO `itemsubclass` VALUES ('2', '7', '-1', '8', '3', '0', '2', '2', '3', '1', 'Sword', 'Epée', 'One-Handed Swords', 'Epées à une main');
INSERT INTO `itemsubclass` VALUES ('2', '8', '7', '-1', '3', '0', '0', '0', '0', '2', 'Sword', 'Epée', 'Two-Handed Swords', 'Epées à deux mains');
INSERT INTO `itemsubclass` VALUES ('2', '9', '-1', '-1', '0', '3', '3', '2', '3', '1', 'Obsolete', 'Obsolète', '', '');
INSERT INTO `itemsubclass` VALUES ('2', '10', '-1', '-1', '3', '0', '1', '1', '1', '2', 'Staff', 'Bâton', 'Staves', 'Bâtons');
INSERT INTO `itemsubclass` VALUES ('2', '11', '-1', '12', '0', '3', '3', '2', '3', '1', 'Exotic', 'Spéciale', 'One-Handed Exotics', 'Armes exotiques à une main');
INSERT INTO `itemsubclass` VALUES ('2', '12', '11', '-1', '0', '3', '3', '2', '3', '2', 'Exotic', 'Spéciale', 'Two-Handed Exotics', 'Armes exotiques à deux mains');
INSERT INTO `itemsubclass` VALUES ('2', '13', '-1', '-1', '5', '0', '3', '2', '3', '0', 'Fist Weapon', 'Arme de pugilat', 'Fist Weapons', 'Armes de pugilat');
INSERT INTO `itemsubclass` VALUES ('2', '14', '-1', '-1', '2', '1', '3', '2', '3', '1', 'Miscellaneous', 'Divers', '', '');
INSERT INTO `itemsubclass` VALUES ('2', '15', '-1', '-1', '3', '0', '2', '2', '3', '0', 'Dagger', 'Dague', 'Daggers', 'Dagues');
INSERT INTO `itemsubclass` VALUES ('2', '16', '-1', '-1', '16', '0', '3', '5', '5', '1', 'Thrown', 'Armes de jet', 'Thrown', 'Armes de jet');
INSERT INTO `itemsubclass` VALUES ('2', '17', '-1', '-1', '3', '2', '1', '1', '1', '2', 'Spear', 'Lance', 'Spears', 'Lances');
INSERT INTO `itemsubclass` VALUES ('2', '18', '-1', '-1', '160', '0', '3', '4', '4', '1', 'Crossbow', 'Arbalète', 'Crossbows', 'Arbalètes');
INSERT INTO `itemsubclass` VALUES ('2', '19', '-1', '-1', '256', '0', '3', '2', '3', '1', 'Wand', 'Baguette', 'Wands', 'Baguettes');
INSERT INTO `itemsubclass` VALUES ('2', '20', '-1', '-1', '0', '0', '1', '1', '1', '2', 'Fishing Pole', 'Canne à pêche', 'Fishing Poles', 'Cannes à pêche');
INSERT INTO `itemsubclass` VALUES ('3', '0', '-1', '-1', '0', '1', '0', '0', '0', '0', 'Red', 'Rouge', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '1', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Blue', 'Bleue', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '2', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Yellow', 'Jaune', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '3', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Purple', 'Violette', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '4', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Green', 'Verte', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '5', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Orange', 'Orange', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '6', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Meta', 'Méta', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '7', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Simple', 'Simple', '', '');
INSERT INTO `itemsubclass` VALUES ('3', '8', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Prismatic', 'Prismatique', '', '');
INSERT INTO `itemsubclass` VALUES ('4', '0', '-1', '-1', '512', '1', '0', '0', '3', '0', 'Miscellaneous', 'Divers', '', '');
INSERT INTO `itemsubclass` VALUES ('4', '1', '-1', '-1', '512', '0', '0', '0', '3', '0', 'Cloth', 'Tissu', 'Cloth', 'Tissu');
INSERT INTO `itemsubclass` VALUES ('4', '2', '-1', '-1', '512', '0', '0', '0', '3', '0', 'Leather', 'Cuir', 'Leather', 'Cuir');
INSERT INTO `itemsubclass` VALUES ('4', '3', '-1', '-1', '512', '0', '0', '0', '3', '0', 'Mail', 'Mailles', 'Mail', 'Mailles');
INSERT INTO `itemsubclass` VALUES ('4', '4', '-1', '-1', '512', '0', '0', '0', '3', '0', 'Plate', 'Plaques', 'Plate', 'Plaques');
INSERT INTO `itemsubclass` VALUES ('4', '5', '-1', '-1', '0', '2', '0', '0', '3', '0', 'Buckler(OBSOLETE)', 'Targe(OBSOLETE)', 'Bucklers', 'Targes');
INSERT INTO `itemsubclass` VALUES ('4', '6', '5', '-1', '0', '0', '0', '0', '3', '0', 'Shield', 'Bouclier', 'Shields', 'Boucliers');
INSERT INTO `itemsubclass` VALUES ('4', '7', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Libram', 'Libram', 'Librams', 'Librams');
INSERT INTO `itemsubclass` VALUES ('4', '8', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Idol', 'Idole', 'Idols', 'Idoles');
INSERT INTO `itemsubclass` VALUES ('4', '9', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Totem', 'Totem', 'Totems', 'Totems');
INSERT INTO `itemsubclass` VALUES ('4', '10', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Sigil', 'Cachet', 'Sigils', 'Cachets');
INSERT INTO `itemsubclass` VALUES ('5', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Reagent', 'Réactif', '', '');
INSERT INTO `itemsubclass` VALUES ('6', '0', '-1', '-1', '0', '3', '0', '0', '3', '0', 'Wand(OBSOLETE)', 'Baguette(OBSOLETE)', '', '');
INSERT INTO `itemsubclass` VALUES ('6', '1', '-1', '-1', '0', '2', '0', '0', '3', '0', 'Bolt(OBSOLETE)', 'Carreau(OBSOLETE)', '', '');
INSERT INTO `itemsubclass` VALUES ('6', '2', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Arrow', 'Flèche', '', '');
INSERT INTO `itemsubclass` VALUES ('6', '3', '-1', '-1', '0', '0', '0', '0', '3', '0', 'Bullet', 'Balle', '', '');
INSERT INTO `itemsubclass` VALUES ('6', '4', '-1', '-1', '64', '2', '3', '2', '3', '0', 'Thrown(OBSOLETE)', 'Arme de jet(OBSOLETE)', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '0', '-1', '-1', '0', '3', '3', '2', '3', '0', 'Trade Goods', 'Artisanat', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '10', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Elemental', 'Élémentaire', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '5', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Cloth', 'Tissu', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '6', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Leather', 'Cuir', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '7', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Metal & Stone', 'Métal & pierre', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '8', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Meat', 'Viande', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '9', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Herb', 'Herbes', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '12', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Enchanting', 'Enchantement', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '4', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Jewelcrafting', 'Joaillerie', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '1', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Parts', 'Eléments', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '3', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Devices', 'Appareils', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '2', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Explosives', 'Explosifs', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '13', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Materials', 'Matériaux', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '11', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Other', 'Autre', '', '');
INSERT INTO `itemsubclass` VALUES ('7', '14', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Armor Enchantment', 'Enchantement d\'armure', 'Armor Enchantment', 'Enchantement d\'armure');
INSERT INTO `itemsubclass` VALUES ('7', '15', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Weapon Enchantment', 'Enchantement d\'arme', 'Weapon Enchantment', 'Enchantement d\'arme');
INSERT INTO `itemsubclass` VALUES ('8', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Generic(OBSOLETE)', 'Générique(OBSOLETE)', '', '');
INSERT INTO `itemsubclass` VALUES ('9', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Book', 'Livre', '', '');
INSERT INTO `itemsubclass` VALUES ('9', '1', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Leatherworking', 'Travail du cuir', '', '');
INSERT INTO `itemsubclass` VALUES ('9', '2', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Tailoring', 'Couture', '', '');
INSERT INTO `itemsubclass` VALUES ('9', '3', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Engineering', 'Ingénierie', '', '');
INSERT INTO `itemsubclass` VALUES ('9', '4', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Blacksmithing', 'Forge', '', '');
INSERT INTO `itemsubclass` VALUES ('9', '5', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Cooking', 'Cuisine', '', '');
INSERT INTO `itemsubclass` VALUES ('9', '6', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Alchemy', 'Alchimie', '', '');
INSERT INTO `itemsubclass` VALUES ('9', '7', '-1', '-1', '0', '1', '3', '2', '3', '0', 'First Aid', 'Secourisme', '', '');
INSERT INTO `itemsubclass` VALUES ('9', '8', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Enchanting', 'Enchantement', '', '');
INSERT INTO `itemsubclass` VALUES ('9', '9', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Fishing', 'Pêche', '', '');
INSERT INTO `itemsubclass` VALUES ('9', '10', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Jewelcrafting', 'Joaillerie', '', '');
INSERT INTO `itemsubclass` VALUES ('9', '11', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Inscription', 'Calligraphie', 'Inscription', 'Calligraphie');
INSERT INTO `itemsubclass` VALUES ('10', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Money(OBSOLETE)', 'Argent(OBSOLETE)', '', '');
INSERT INTO `itemsubclass` VALUES ('11', '0', '-1', '-1', '0', '7', '0', '0', '3', '0', 'Quiver(OBSOLETE)', 'Carquois(OBSOLETE)', '', '');
INSERT INTO `itemsubclass` VALUES ('11', '1', '-1', '-1', '0', '7', '0', '0', '3', '0', 'Quiver(OBSOLETE)', 'Carquois(OBSOLETE)', '', '');
INSERT INTO `itemsubclass` VALUES ('11', '2', '-1', '-1', '0', '4', '0', '0', '3', '0', 'Quiver', 'Carquois', '', '');
INSERT INTO `itemsubclass` VALUES ('11', '3', '-1', '-1', '0', '4', '0', '0', '3', '0', 'Ammo Pouch', 'Giberne', '', '');
INSERT INTO `itemsubclass` VALUES ('12', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Quest', 'Quête', '', '');
INSERT INTO `itemsubclass` VALUES ('13', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Key', 'Clé', '', '');
INSERT INTO `itemsubclass` VALUES ('13', '1', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Lockpick', 'Crochetage', '', '');
INSERT INTO `itemsubclass` VALUES ('14', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Permanent', 'Permanent', '', '');
INSERT INTO `itemsubclass` VALUES ('15', '0', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Junk', 'Camelote', '', '');
INSERT INTO `itemsubclass` VALUES ('15', '1', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Reagent', 'Réactif', '', '');
INSERT INTO `itemsubclass` VALUES ('15', '2', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Pet', 'Familier', '', '');
INSERT INTO `itemsubclass` VALUES ('15', '3', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Holiday', 'Fête', '', '');
INSERT INTO `itemsubclass` VALUES ('15', '4', '-1', '-1', '0', '1', '3', '2', '3', '0', 'Other', 'Autre', '', '');
INSERT INTO `itemsubclass` VALUES ('15', '5', '-1', '-1', '0', '0', '3', '2', '3', '0', 'Mount', 'Monture', 'Mount', 'Monture');
INSERT INTO `itemsubclass` VALUES ('16', '1', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Warrior', 'Guerrier', 'Warrior', 'Guerrier');
INSERT INTO `itemsubclass` VALUES ('16', '2', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Paladin', 'Paladin', 'Paladin', 'Paladin');
INSERT INTO `itemsubclass` VALUES ('16', '3', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Hunter', 'Chasseur', 'Hunter', 'Chasseur');
INSERT INTO `itemsubclass` VALUES ('16', '4', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Rogue', 'Voleur', 'Rogue', 'Voleur');
INSERT INTO `itemsubclass` VALUES ('16', '5', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Priest', 'Prêtre', 'Priest', 'Prêtre');
INSERT INTO `itemsubclass` VALUES ('16', '6', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Death Knight', 'Ch. de la mort', 'Death Knight', 'Chevalier de la mort');
INSERT INTO `itemsubclass` VALUES ('16', '7', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Shaman', 'Chaman', 'Shaman', 'Chaman');
INSERT INTO `itemsubclass` VALUES ('16', '8', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Mage', 'Mage', 'Mage', 'Mage');
INSERT INTO `itemsubclass` VALUES ('16', '9', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Warlock', 'Démoniste', 'Warlock', 'Démoniste');
INSERT INTO `itemsubclass` VALUES ('16', '11', '-1', '-1', '0', '0', '0', '0', '0', '0', 'Druid', 'Druide', 'Druid', 'Druide');
