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
-- Table structure for table `talenttabdbc`
--

DROP TABLE IF EXISTS `talenttabdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talenttabdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(128) NOT NULL DEFAULT '',
  `Name_loc2` varchar(128) NOT NULL DEFAULT '',
  `SpellIcon` int(10) NOT NULL DEFAULT '0',
  `RaceMask` int(10) NOT NULL DEFAULT '0',
  `ClassMask` int(10) NOT NULL DEFAULT '0',
  `PetTalentMask` int(10) NOT NULL DEFAULT '0',
  `TabPage` int(10) NOT NULL DEFAULT '0',
  `InternalName` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talenttabdbc`
--

LOCK TABLES `talenttabdbc` WRITE;
/*!40000 ALTER TABLE `talenttabdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `talenttabdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `talenttabdbc` from 3.3.5
--

INSERT INTO `talenttabdbc` VALUES ('81', 'Arcane', 'Arcanes', '125', '2047', '128', '0', '0', 'MageArcane');
INSERT INTO `talenttabdbc` VALUES ('161', 'Arms', 'Armes', '514', '2047', '1', '0', '0', 'WarriorArms');
INSERT INTO `talenttabdbc` VALUES ('182', 'Assassination', 'Assassinat', '514', '2047', '8', '0', '0', 'RogueAssassination');
INSERT INTO `talenttabdbc` VALUES ('201', 'Discipline', 'Discipline', '685', '2047', '16', '0', '0', 'PriestDiscipline');
INSERT INTO `talenttabdbc` VALUES ('261', 'Elemental', 'Elémentaire', '62', '2047', '64', '0', '0', 'ShamanElementalCombat');
INSERT INTO `talenttabdbc` VALUES ('283', 'Balance', 'Equilibre', '225', '2047', '1024', '0', '0', 'DruidBalance');
INSERT INTO `talenttabdbc` VALUES ('302', 'Affliction', 'Affliction', '88', '2047', '256', '0', '0', 'WarlockCurses');
INSERT INTO `talenttabdbc` VALUES ('361', 'Beast Mastery', 'Maîtrise des bêtes', '255', '2047', '4', '0', '0', 'HunterBeastMastery');
INSERT INTO `talenttabdbc` VALUES ('382', 'Holy', 'Sacré', '70', '2047', '2', '0', '0', 'PaladinHoly');
INSERT INTO `talenttabdbc` VALUES ('398', 'Blood', 'Sang', '2636', '-260097', '32', '0', '0', 'DeathKnightBlood');
INSERT INTO `talenttabdbc` VALUES ('409', 'Tenacity', 'Ténacité', '1559', '0', '0', '2', '0', 'HunterPetTenacity');
INSERT INTO `talenttabdbc` VALUES ('410', 'Ferocity', 'Férocité', '496', '0', '0', '1', '0', 'HunterPetFerocity');
INSERT INTO `talenttabdbc` VALUES ('411', 'Cunning', 'Ruse', '2223', '0', '0', '4', '0', 'HunterPetCunning');
INSERT INTO `talenttabdbc` VALUES ('41', 'Fire', 'Feu', '183', '2047', '128', '0', '1', 'MageFire');
INSERT INTO `talenttabdbc` VALUES ('164', 'Fury', 'Fureur', '561', '2047', '1', '0', '1', 'WarriorFury');
INSERT INTO `talenttabdbc` VALUES ('181', 'Combat', 'Combat', '243', '2047', '8', '0', '1', 'RogueCombat');
INSERT INTO `talenttabdbc` VALUES ('202', 'Holy', 'Sacré', '2873', '2047', '16', '0', '1', 'PriestHoly');
INSERT INTO `talenttabdbc` VALUES ('263', 'Enhancement', 'Amélioration', '19', '2047', '64', '0', '1', 'ShamanEnhancement');
INSERT INTO `talenttabdbc` VALUES ('281', 'Feral Combat', 'Combat farouche', '107', '2047', '1024', '0', '1', 'DruidFeralCombat');
INSERT INTO `talenttabdbc` VALUES ('303', 'Demonology', 'Démonologie', '90', '2047', '256', '0', '1', 'WarlockSummoning');
INSERT INTO `talenttabdbc` VALUES ('363', 'Marksmanship', 'Précision', '126', '2047', '4', '0', '1', 'HunterMarksmanship');
INSERT INTO `talenttabdbc` VALUES ('383', 'Protection', 'Protection', '291', '2047', '2', '0', '1', 'PaladinProtection');
INSERT INTO `talenttabdbc` VALUES ('399', 'Frost', 'Givre', '2632', '2047', '32', '0', '1', 'DeathKnightFrost');
INSERT INTO `talenttabdbc` VALUES ('61', 'Frost', 'Givre', '188', '2047', '128', '0', '2', 'MageFrost');
INSERT INTO `talenttabdbc` VALUES ('163', 'Protection', 'Protection', '1463', '2047', '1', '0', '2', 'WarriorProtection');
INSERT INTO `talenttabdbc` VALUES ('183', 'Subtlety', 'Finesse', '250', '2047', '8', '0', '2', 'RogueSubtlety');
INSERT INTO `talenttabdbc` VALUES ('203', 'Shadow', 'Ombre', '234', '2047', '16', '0', '2', 'PriestShadow');
INSERT INTO `talenttabdbc` VALUES ('262', 'Restoration', 'Restauration', '13', '2047', '64', '0', '2', 'ShamanRestoration');
INSERT INTO `talenttabdbc` VALUES ('282', 'Restoration', 'Restauration', '962', '2047', '1024', '0', '2', 'DruidRestoration');
INSERT INTO `talenttabdbc` VALUES ('301', 'Destruction', 'Destruction', '547', '2047', '256', '0', '2', 'WarlockDestruction');
INSERT INTO `talenttabdbc` VALUES ('362', 'Survival', 'Survie', '257', '2047', '4', '0', '2', 'HunterSurvival');
INSERT INTO `talenttabdbc` VALUES ('381', 'Retribution', 'Vindicte', '555', '2047', '2', '0', '2', 'PaladinCombat');
INSERT INTO `talenttabdbc` VALUES ('400', 'Unholy', 'Impie', '2633', '2047', '32', '0', '2', 'DeathKnightUnholy');
