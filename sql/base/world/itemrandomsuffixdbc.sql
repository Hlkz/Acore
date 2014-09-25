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
-- Table structure for table `itemrandomsuffixdbc`
--

DROP TABLE IF EXISTS `itemrandomsuffixdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemrandomsuffixdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `InternalName` varchar(100) NOT NULL DEFAULT '',
  `EnchantId1` int(10) NOT NULL DEFAULT '0',
  `EnchantId2` int(10) NOT NULL DEFAULT '0',
  `EnchantId3` int(10) NOT NULL DEFAULT '0',
  `EnchantId4` int(10) NOT NULL DEFAULT '0',
  `EnchantId5` int(10) NOT NULL DEFAULT '0',
  `Prefix1` int(10) NOT NULL DEFAULT '0',
  `Prefix2` int(10) NOT NULL DEFAULT '0',
  `Prefix3` int(10) NOT NULL DEFAULT '0',
  `Prefix4` int(10) NOT NULL DEFAULT '0',
  `Prefix5` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemrandomsuffixdbc`
--

LOCK TABLES `itemrandomsuffixdbc` WRITE;
/*!40000 ALTER TABLE `itemrandomsuffixdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemrandomsuffixdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `itemrandomsuffixdbc`
--

INSERT INTO `itemrandomsuffixdbc` VALUES ('5', 'of the Monkey', 'du singe', 'Monkey', '2802', '2803', '0', '0', '0', '6666', '10000', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('6', 'of the Eagle', 'de l\'aigle', 'Eagle', '2804', '2803', '0', '0', '0', '6666', '10000', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('7', 'of the Bear', 'de l\'ours', 'Bear', '2803', '2805', '0', '0', '0', '10000', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('8', 'of the Whale', 'de la baleine', 'Whale', '2806', '2803', '0', '0', '0', '6666', '10000', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('9', 'of the Owl', 'de la chouette', 'Owl', '2804', '2806', '0', '0', '0', '6666', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('10', 'of the Gorilla', 'du gorille', 'Gorilla', '2804', '2805', '0', '0', '0', '6666', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('11', 'of the Falcon', 'de l\'épervier', 'Falcon', '2802', '2804', '0', '0', '0', '6666', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('12', 'of the Boar', 'du sanglier', 'Boar', '2806', '2805', '0', '0', '0', '6666', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('13', 'of the Wolf', 'du loup', 'Wolf', '2802', '2806', '0', '0', '0', '6666', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('14', 'of the Tiger', 'du tigre', 'Tiger', '2802', '2805', '0', '0', '0', '6666', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('15', 'of Spirit', 'd\'Esprit', 'Spirit', '2806', '0', '0', '0', '0', '10000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('16', 'of Stamina', 'd\'Endurance', 'Stamina', '2803', '0', '0', '0', '0', '15000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('17', 'of Strength', 'de Force', 'Strength', '2805', '0', '0', '0', '0', '10000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('18', 'of Agility', 'd\'Agilité', 'Agility', '2802', '0', '0', '0', '0', '10000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('19', 'of Intellect', 'd\'Intelligence', 'Intellect', '2804', '0', '0', '0', '0', '10000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('20', 'of Power', 'de puissance', 'Power', '2825', '0', '0', '0', '0', '20000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('21', 'of Spell Power', 'de puissance des sorts', 'Spell Power : Used to Be Arcane Wrath', '2824', '0', '0', '0', '0', '11700', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('22', 'of Spell Power', 'de puissance des sorts', 'Spell Power: Used to Be Fiery Wrath', '2824', '0', '0', '0', '0', '11700', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('23', 'of Spell Power', 'de puissance des sorts', 'Spell Power: Used to Be Frozen Wrath', '2824', '0', '0', '0', '0', '11700', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('24', 'of Spell Power', 'de puissance des sorts', 'Spell Power (used to be Nature\'s Wrath)', '2824', '0', '0', '0', '0', '11700', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('25', 'of Spell Power', 'de puissance des sorts', 'Spell Power: Used to Be Shadow Wrath', '2824', '0', '0', '0', '0', '11700', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('26', 'of Spell Power', 'de puissance des sorts', 'Spell Power', '2824', '0', '0', '0', '0', '11700', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('27', 'of Defense', 'de défense', 'Defense', '2813', '0', '0', '0', '0', '10000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('28', 'of Regeneration', 'de régénération', 'Regeneration', '2814', '0', '0', '0', '0', '4000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('29', 'of Eluding', 'd\'esquive', 'Eluding', '2815', '2802', '0', '0', '0', '6666', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('30', 'of Concentration', 'de concentration', 'Concentration', '2816', '0', '0', '0', '0', '4000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('31', 'of Arcane Protection', 'de protection contre les Arcanes', 'Arcane Protection', '2803', '2817', '0', '0', '0', '10000', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('32', 'of Fire Protection', 'de protection contre le Feu', 'Fire Protection', '2803', '2818', '0', '0', '0', '10000', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('33', 'of Frost Protection', 'de protection contre le Givre', 'Frost Protection', '2803', '2819', '0', '0', '0', '10000', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('34', 'of Nature Protection', 'de protection contre la Nature', 'Nature Protection', '2803', '2820', '0', '0', '0', '10000', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('35', 'of Shadow Protection', 'de protection contre l\'Ombre', 'Shadow Protection', '2803', '2821', '0', '0', '0', '10000', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('36', 'of the Sorcerer', 'du sorcier', 'Sorcerer', '2803', '2804', '2824', '0', '0', '7889', '5259', '6153', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('37', 'of the Physician', 'du médecin', 'Physician', '2803', '2804', '2824', '0', '0', '7889', '5259', '6153', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('38', 'of the Prophet', 'du prophète', 'Prophet', '2804', '2806', '2824', '0', '0', '5259', '5259', '6153', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('39', 'of the Invoker', 'de l\'invocateur', 'Invoker', '2804', '2824', '2822', '0', '0', '5259', '6153', '5259', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('40', 'of the Bandit', 'du bandit', 'Bandit', '2802', '2803', '2825', '0', '0', '5259', '7889', '10518', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('41', 'of the Beast', 'de la bête', 'Beast', '2805', '2802', '2803', '0', '0', '5259', '5259', '7889', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('42', 'of the Hierophant', 'du hiérophante', 'Hierophant', '2803', '2806', '2824', '0', '0', '7889', '5259', '6153', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('43', 'of the Soldier', 'du soldat', 'Soldier', '2805', '2803', '2823', '0', '0', '5259', '7889', '5259', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('44', 'of the Elder', 'des anciens', 'Elder', '2803', '2804', '2816', '0', '0', '7889', '5259', '2104', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('45', 'of the Champion', 'du champion', 'Champion', '2805', '2803', '2813', '0', '0', '5259', '7889', '5259', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('46', 'of the Test', 'du test', 'Test', '2798', '2799', '2800', '2802', '2806', '20', '20', '20', '5', '5');
INSERT INTO `itemrandomsuffixdbc` VALUES ('47', 'of Blocking', 'de blocage', 'Blocking', '2826', '2805', '0', '0', '0', '6666', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('48', 'of Paladin Testing', 'de l\'épreuve du paladin', 'Paladin Testing', '2805', '2906', '2824', '0', '0', '3506', '5234', '4102', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('49', 'of the Grove', 'du bosquet', 'Grove', '2805', '2802', '2803', '0', '0', '7266', '4106', '4790', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('50', 'of the Hunt', 'de la chasse', 'Hunt', '2825', '2802', '2804', '0', '0', '14532', '4106', '3193', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('51', 'of the Mind', 'de la raison', 'Mind', '2824', '2822', '2804', '0', '0', '8501', '4106', '3193', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('52', 'of the Crusade', 'de la croisade', 'Crusade', '2824', '2804', '2813', '0', '0', '8501', '4106', '3193', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('53', 'of the Vision', 'de la vision', 'Vision', '2824', '2804', '2803', '0', '0', '8501', '4106', '3193', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('54', 'of the Ancestor', 'de l\'ancêtre', 'Ancestor', '2805', '2823', '2803', '0', '0', '7266', '4106', '4790', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('55', 'of the Nightmare', 'du cauchemar', 'Nightmare', '2811', '2803', '2804', '0', '0', '8501', '6159', '3193', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('56', 'of the Battle', 'de la bataille', 'Battle', '2805', '2803', '2823', '0', '0', '7266', '6159', '3193', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('57', 'of the Shadow', 'de l\'Ombre', 'Shadow', '2825', '2802', '2803', '0', '0', '14532', '4106', '4790', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('58', 'of the Sun', 'du soleil', 'Sun', '2824', '2803', '2804', '0', '0', '6153', '5259', '5259', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('59', 'of the Moon', 'de la lune', 'Moon', '2804', '2803', '2806', '0', '0', '5259', '5259', '5259', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('60', 'of the Wild', 'du fauve', 'Wild', '2825', '2803', '2802', '0', '0', '10518', '5259', '5259', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('61', 'of Spell Power', 'de puissance des sorts', 'Spell Power (Resistance)', '2824', '0', '0', '0', '0', '2659', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('62', 'of Strength', 'de Force', 'Strength (resistance)', '2805', '0', '0', '0', '0', '5000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('63', 'of Agility', 'd\'Agilité', 'Agility (resistance)', '2802', '0', '0', '0', '0', '5000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('64', 'of Power', 'de puissance', 'Power (resistance)', '2825', '0', '0', '0', '0', '10000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('65', 'of Magic', 'de magie', 'Magic (resistance)', '2824', '0', '0', '0', '0', '5850', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('66', 'of the Knight', 'du chevalier', 'Knight', '2803', '2813', '2824', '0', '0', '7889', '5259', '6153', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('67', 'of the Seer', 'du voyant', 'Seer', '2803', '2822', '2824', '0', '0', '7889', '5259', '6153', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('68', 'of the Bear', 'de l\'ours', 'Bear (<60)', '2805', '2803', '0', '0', '0', '6666', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('69', 'of the Eagle', 'de l\'aigle', 'Eagle (<60)', '2803', '2804', '0', '0', '0', '6666', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('70', 'of the Ancestor', 'de l\'ancêtre', 'Ancestor (<60)', '2805', '2822', '2803', '0', '0', '7266', '4106', '3193', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('71', 'of the Bandit', 'du bandit', 'Bandit (<60)', '2802', '2803', '2825', '0', '0', '5259', '5259', '10518', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('72', 'of the Battle', 'de la bataille', 'Battle (<60)', '2805', '2803', '2822', '0', '0', '7266', '4106', '3193', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('73', 'of the Elder', 'des anciens', 'Elder (<60)', '2803', '2804', '2816', '0', '0', '5259', '5259', '2104', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('74', 'of the Beast', 'de la bête', 'Beast (<60)', '2805', '2802', '2803', '0', '0', '5259', '5259', '5259', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('75', 'of the Champion', 'du champion', 'Champion (<60)', '2805', '2803', '2813', '0', '0', '5259', '5259', '5259', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('76', 'of the Grove', 'du bosquet', 'Grove (<60)', '2805', '2802', '2803', '0', '0', '7266', '4106', '3193', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('77', 'of the Knight', 'du chevalier', 'Knight (<60)', '2803', '2813', '2824', '0', '0', '5259', '5259', '6153', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('78', 'of the Monkey', 'du singe', 'Monkey (<60)', '2802', '2803', '0', '0', '0', '6666', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('79', 'of the Moon', 'de la lune', 'Moon (<60)', '2804', '2803', '2806', '0', '0', '5259', '3506', '5259', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('80', 'of the Wild', 'du fauve', 'Wild (<60)', '2825', '2803', '2802', '0', '0', '10518', '3506', '5259', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('81', 'of the Whale', 'de la baleine', 'Whale (<60)', '2803', '2806', '0', '0', '0', '6666', '6666', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('82', 'of the Vision', 'de la vision', 'Vision (<60)', '2824', '2804', '2803', '0', '0', '8501', '4106', '2129', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('83', 'of the Sun', 'du soleil', 'Sun (<60)', '2824', '2803', '2804', '0', '0', '6153', '3506', '5259', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('84', 'of Stamina', 'd\'Endurance', 'Stamina (<60)', '2803', '0', '0', '0', '0', '10000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('85', 'of the Sorcerer', 'du sorcier', 'Sorcerer (<60)', '2803', '2804', '2824', '0', '0', '5259', '5259', '6153', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('86', 'of the Soldier', 'du soldat', 'Soldier (<60)', '2805', '2803', '2822', '0', '0', '5259', '5259', '5259', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('87', 'of the Shadow', 'de l\'Ombre', 'Shadow (<60)', '2825', '2802', '2803', '0', '0', '14532', '4106', '3193', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('88', 'of the Foreseer', 'du prévoyant', 'Foreseer', '2804', '3726', '2824', '0', '0', '5259', '5259', '6153', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('89', 'of the Thief', 'du voleur', 'Thief', '2803', '2825', '3726', '0', '0', '7889', '10518', '5259', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('90', 'of the Necromancer', 'du nécromancien', 'Necromancer', '2803', '3727', '2824', '0', '0', '7889', '5259', '6153', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('91', 'of the Marksman', 'du tireur d\'élite', 'Marksman', '2803', '2802', '3727', '0', '0', '7889', '5259', '5259', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('92', 'of the Squire', 'de l\'écuyer', 'Squire', '2803', '3727', '2805', '0', '0', '7889', '5259', '5259', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('93', 'of Restoration', 'de restauration', 'Restoration', '2803', '2824', '2816', '0', '0', '7889', '6153', '2103', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('94', '', '', 'Agility (Darkmoon Card)', '2802', '0', '0', '0', '0', '9000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('95', '', '', 'Strength (Darkmoon Card)', '2805', '0', '0', '0', '0', '9000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('96', '', '', 'Stamina (Darkmoon Card)', '2803', '0', '0', '0', '0', '13500', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('97', '', '', 'Intellect (Darkmoon Card)', '2804', '0', '0', '0', '0', '9000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('98', '', '', 'Spirit (Darkmoon Card)', '2806', '0', '0', '0', '0', '9000', '0', '0', '0', '0');
INSERT INTO `itemrandomsuffixdbc` VALUES ('99', 'of Speed', 'de vitesse', 'Haste', '3726', '0', '0', '0', '0', '10000', '0', '0', '0', '0');
