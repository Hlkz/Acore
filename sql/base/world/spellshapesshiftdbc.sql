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
-- Table structure for table `spellshapesshiftdbc`
--

DROP TABLE IF EXISTS `spellshapesshiftdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spellshapesshiftdbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `ButtonPosition` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `NameFlags` int(10) NOT NULL DEFAULT '0',
  `Flags1` int(10) NOT NULL DEFAULT '0',
  `CreatureType` int(10) NOT NULL DEFAULT '0',
  `Unk1` int(10) NOT NULL DEFAULT '0',
  `AttackSpeed` int(10) NOT NULL DEFAULT '0',
  `ModelIdAlliance` int(10) NOT NULL DEFAULT '0',
  `ModelIdHorde` int(10) NOT NULL DEFAULT '0',
  `Unk2` int(10) NOT NULL DEFAULT '0',
  `Unk3` int(10) NOT NULL DEFAULT '0',
  `StanceSpell1` int(10) NOT NULL DEFAULT '0',
  `StanceSpell2` int(10) NOT NULL DEFAULT '0',
  `StanceSpell3` int(10) NOT NULL DEFAULT '0',
  `StanceSpell4` int(10) NOT NULL DEFAULT '0',
  `StanceSpell5` int(10) NOT NULL DEFAULT '0',
  `StanceSpell6` int(10) NOT NULL DEFAULT '0',
  `StanceSpell7` int(10) NOT NULL DEFAULT '0',
  `StanceSpell8` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ID` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spellshapesshiftdbc`
--

LOCK TABLES `spellshapesshiftdbc` WRITE;
/*!40000 ALTER TABLE `spellshapesshiftdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `spellshapesshiftdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `spellshapesshiftdbc`
--

INSERT INTO `spellshapesshiftdbc` VALUES ('1', '1', 'Cat Form', 'Forme de félin', '16712190', '760', '1', '1534', '1000', '892', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('2', '2', 'Tree of Life Form', 'Forme d\'arbre de vie', '16712190', '2257', '4', '0', '0', '864', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('3', '0', 'Travel Form', 'Forme de voyage', '16712190', '216', '1', '0', '0', '918', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('4', '0', 'Aquatic Form', 'Forme aquatique', '16712190', '216', '1', '0', '0', '2428', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('5', '3', 'Bear Form', 'Forme d’ours', '16712190', '728', '1', '496', '2500', '2281', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('6', '0', 'Ambient', 'Ambiant', '16712190', '0', '0', '0', '0', '328', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('7', '0', 'Ghoul', 'Goule', '16712190', '9689', '6', '0', '0', '25527', '0', '0', '0', '6603', '47468', '47481', '47482', '47480', '0', '47484', '47496');
INSERT INTO `spellshapesshiftdbc` VALUES ('8', '3', 'Dire Bear Form', 'Forme d’ours redoutable', '16712190', '728', '1', '496', '2500', '2281', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('9', '0', 'Steve\'s Ghoul', 'Goule de Steve', '16712190', '128', '-1', '0', '0', '24994', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('10', '0', 'Tharon\'ja Skeleton', 'Squelette de Tharon\'ja', '16712190', '1034', '6', '0', '0', '9784', '0', '0', '0', '50799', '49613', '49609', '49617', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('11', '0', 'Darkmoon - Test of Strength', 'Sombrelune - épreuve de force', '16712190', '1226', '-1', '0', '0', '0', '0', '0', '0', '62022', '62023', '62024', '62025', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('12', '0', 'BLB Player', 'Joueur BLB', '16712190', '0', '-1', '0', '0', '0', '0', '0', '0', '44029', '44752', '44083', '44010', '44012', '44817', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('13', '2', 'Shadow Dance', 'Danse de l\'ombre', '16712190', '1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('14', '0', 'Creature - Bear', 'Créature - Ours', '16712190', '0', '1', '0', '0', '2281', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('15', '0', 'Creature - Cat', 'Créature - Félin', '16712190', '0', '1', '0', '0', '892', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('16', '0', 'Ghost Wolf', 'Loup fantôme', '16712190', '216', '1', '0', '0', '4613', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('17', '1', 'Battle Stance', 'Posture de combat', '16712190', '7', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('18', '2', 'Defensive Stance', 'Posture défensive', '16712190', '7', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('19', '3', 'Berserker Stance', 'Posture berserker', '16712190', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('20', '0', 'Test', 'Test', '16712190', '0', '-1', '0', '0', '0', '0', '0', '0', '6603', '20577', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('21', '0', 'Zombie', 'Zombie', '16712190', '5150', '6', '0', '0', '26942', '0', '0', '0', '57596', '51230', '56560', '43949', '56528', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('22', '0', 'Metamorphosis', 'Métamorphose', '16712190', '216', '3', '0', '0', '25277', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('23', '0', '', '', '16712188', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('24', '0', '', '', '16712188', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('25', '0', 'Undead', 'Mort-vivant', '16712190', '205', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('26', '0', 'Frenzy', 'Frénésie', '16712190', '216', '1', '0', '0', '17170', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('27', '0', 'Flight Form, Epic', 'Forme de vol, épique', '16712190', '8', '1', '0', '0', '21243', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('28', '1', 'Shadowform', 'Forme d\'ombre', '16712190', '9', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('29', '0', 'Flight Form', 'Forme de vol', '16712190', '8', '1', '0', '0', '20857', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('30', '1', 'Stealth', 'Camouflage', '16712190', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('31', '4', 'Moonkin Form', 'Forme de sélénien', '16712190', '2753', '-1', '0', '0', '15374', '15375', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spellshapesshiftdbc` VALUES ('32', '0', 'Spirit of Redemption', 'Esprit de rédemption', '16712190', '16640', '-1', '0', '0', '16031', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
