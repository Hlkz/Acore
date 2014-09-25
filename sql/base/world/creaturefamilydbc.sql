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
-- Table structure for table `creaturefamilydbc`
--

DROP TABLE IF EXISTS `creaturefamilydbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creaturefamilydbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `MinScale` float NOT NULL DEFAULT '0',
  `MinScaleLevel` int(10) NOT NULL DEFAULT '0',
  `MaxScale` float NOT NULL DEFAULT '0',
  `MaxScaleLevel` int(10) NOT NULL DEFAULT '0',
  `SkillLine_F6` int(10) NOT NULL DEFAULT '0',
  `SkillLine_F7` int(10) NOT NULL DEFAULT '0',
  `PetFoodMask` int(10) NOT NULL DEFAULT '0',
  `PetTalentType` int(10) NOT NULL DEFAULT '0',
  `CategoryEnumID` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `IconFile` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creaturefamilydbc`
--

LOCK TABLES `creaturefamilydbc` WRITE;
/*!40000 ALTER TABLE `creaturefamilydbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `creaturefamilydbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `creaturefamilydbc`
--

INSERT INTO `creaturefamilydbc` VALUES ('1', '0.7', '1', '1', '60', '208', '270', '1', '0', '23', 'Wolf', 'Loup', 'Interface\\Icons\\Ability_Hunter_Pet_Wolf');
INSERT INTO `creaturefamilydbc` VALUES ('2', '0.7', '1', '1.1', '60', '209', '270', '3', '0', '5', 'Cat', 'Félin', 'Interface\\Icons\\Ability_Hunter_Pet_Cat');
INSERT INTO `creaturefamilydbc` VALUES ('3', '0.4', '1', '0.6', '60', '203', '270', '1', '2', '17', 'Spider', 'Araignée', 'Interface\\Icons\\Ability_Hunter_Pet_Spider');
INSERT INTO `creaturefamilydbc` VALUES ('4', '0.6', '1', '1', '60', '210', '270', '63', '1', '1', 'Bear', 'Ours', 'Interface\\Icons\\Ability_Hunter_Pet_Bear');
INSERT INTO `creaturefamilydbc` VALUES ('5', '0.6', '1', '1', '60', '211', '270', '63', '1', '3', 'Boar', 'Sanglier', 'Interface\\Icons\\Ability_Hunter_Pet_Boar');
INSERT INTO `creaturefamilydbc` VALUES ('6', '0.4', '1', '0.6', '60', '212', '270', '3', '1', '7', 'Crocolisk', 'Crocilisque', 'Interface\\Icons\\Ability_Hunter_Pet_Crocolisk');
INSERT INTO `creaturefamilydbc` VALUES ('7', '0.5', '1', '0.9', '60', '213', '270', '3', '0', '4', 'Carrion Bird', 'Charognard', 'Interface\\Icons\\Ability_Hunter_Pet_Vulture');
INSERT INTO `creaturefamilydbc` VALUES ('8', '0.7', '1', '1.4', '60', '214', '270', '58', '1', '6', 'Crab', 'Crabe', 'Interface\\Icons\\Ability_Hunter_Pet_Crab');
INSERT INTO `creaturefamilydbc` VALUES ('9', '0.7', '1', '1', '60', '215', '270', '56', '1', '9', 'Gorilla', 'Gorille', 'Interface\\Icons\\Ability_Hunter_Pet_Gorilla');
INSERT INTO `creaturefamilydbc` VALUES ('11', '0.5', '1', '0.8', '60', '217', '270', '1', '0', '13', 'Raptor', 'Raptor', 'Interface\\Icons\\Ability_Hunter_Pet_Raptor');
INSERT INTO `creaturefamilydbc` VALUES ('12', '0.5', '1', '0.8', '60', '218', '270', '60', '0', '19', 'Tallstrider', 'Haut-trotteur', 'Interface\\Icons\\Ability_Hunter_Pet_TallStrider');
INSERT INTO `creaturefamilydbc` VALUES ('15', '0.7', '1', '0.7', '60', '189', '0', '0', '-1', '-1', 'Felhunter', 'Chasseur corrompu', '');
INSERT INTO `creaturefamilydbc` VALUES ('16', '0.8', '1', '0.8', '60', '204', '0', '0', '-1', '-1', 'Voidwalker', 'Marcheur du Vide', '');
INSERT INTO `creaturefamilydbc` VALUES ('17', '1', '1', '1', '60', '205', '0', '0', '-1', '-1', 'Succubus', 'Succube', '');
INSERT INTO `creaturefamilydbc` VALUES ('19', '1', '1', '1', '60', '207', '0', '0', '-1', '-1', 'Doomguard', 'Garde funeste', '');
INSERT INTO `creaturefamilydbc` VALUES ('20', '0.7', '1', '1', '60', '236', '270', '1', '1', '15', 'Scorpid', 'Scorpide', 'Interface\\Icons\\Ability_Hunter_Pet_Scorpid');
INSERT INTO `creaturefamilydbc` VALUES ('21', '0.5', '1', '0.72', '60', '251', '270', '58', '1', '21', 'Turtle', 'Tortue', 'Interface\\Icons\\Ability_Hunter_Pet_Turtle');
INSERT INTO `creaturefamilydbc` VALUES ('23', '0.5', '1', '0.5', '60', '188', '0', '0', '-1', '-1', 'Imp', 'Diablotin', '');
INSERT INTO `creaturefamilydbc` VALUES ('24', '0.4', '1', '0.63', '60', '653', '270', '49', '2', '0', 'Bat', 'Chauve-souris', 'Interface\\Icons\\Ability_Hunter_Pet_Bat');
INSERT INTO `creaturefamilydbc` VALUES ('25', '0.7', '1', '0.9', '60', '654', '270', '1', '0', '10', 'Hyena', 'Hyène', 'Interface\\Icons\\Ability_Hunter_Pet_Hyena');
INSERT INTO `creaturefamilydbc` VALUES ('26', '0.5', '1', '0.8', '60', '655', '270', '3', '2', '2', 'Bird of Prey', 'Oiseau de proie', 'Interface\\Icons\\Ability_Hunter_Pet_Owl');
INSERT INTO `creaturefamilydbc` VALUES ('27', '0.5', '1', '0.7', '60', '656', '270', '14', '2', '22', 'Wind Serpent', 'Serpent des vents', 'Interface\\Icons\\Ability_Hunter_Pet_WindSerpent');
INSERT INTO `creaturefamilydbc` VALUES ('28', '0', '0', '0', '0', '758', '0', '0', '-1', '-1', 'Remote Control', 'Télécommande', '');
INSERT INTO `creaturefamilydbc` VALUES ('29', '0.9', '1', '0.9', '60', '761', '0', '0', '-1', '-1', 'Felguard', 'Gangregarde', '');
INSERT INTO `creaturefamilydbc` VALUES ('30', '0.35', '1', '0.65', '60', '763', '270', '35', '2', '8', 'Dragonhawk', 'Faucon-dragon', 'Interface\\Icons\\Ability_Hunter_Pet_DragonHawk');
INSERT INTO `creaturefamilydbc` VALUES ('31', '0.65', '1', '0.9', '60', '767', '270', '1', '2', '14', 'Ravager', 'Ravageur', 'Interface\\Icons\\Ability_Hunter_Pet_Ravager');
INSERT INTO `creaturefamilydbc` VALUES ('32', '0.45', '1', '0.6', '60', '766', '270', '34', '1', '21', 'Warp Stalker', 'Traqueur dim.', 'Interface\\Icons\\Ability_Hunter_Pet_WarpStalker');
INSERT INTO `creaturefamilydbc` VALUES ('33', '0.6', '1', '0.9', '60', '765', '270', '60', '2', '18', 'Sporebat', 'Sporoptère', 'Interface\\Icons\\Ability_Hunter_Pet_Sporebat');
INSERT INTO `creaturefamilydbc` VALUES ('34', '0.35', '1', '0.55', '60', '764', '270', '17', '2', '12', 'Nether Ray', 'Raie du Néant', 'Interface\\Icons\\Ability_Hunter_Pet_NetherRay');
INSERT INTO `creaturefamilydbc` VALUES ('35', '0.6', '1', '0.8', '60', '768', '270', '1', '2', '16', 'Serpent', 'Serpent', 'Interface\\Icons\\Spell_Nature_GuardianWard');
INSERT INTO `creaturefamilydbc` VALUES ('37', '0.35', '1', '0.65', '60', '775', '270', '60', '0', '11', 'Moth', 'Phalène', 'Interface\\Icons\\Ability_Hunter_Pet_Moth');
INSERT INTO `creaturefamilydbc` VALUES ('38', '0.5', '1', '0.63', '60', '780', '270', '1', '2', '24', 'Chimaera', 'Chimère', 'Interface\\Icons\\Ability_Hunter_Pet_Chimera');
INSERT INTO `creaturefamilydbc` VALUES ('39', '0.3', '1', '0.5', '60', '781', '270', '1', '0', '25', 'Devilsaur', 'Diablosaure', 'Interface\\Icons\\Ability_Hunter_Pet_Devilsaur');
INSERT INTO `creaturefamilydbc` VALUES ('40', '1', '1', '1', '80', '782', '0', '0', '-1', '26', 'Ghoul', 'Goule', 'Interface\\Icons\\Ability_Creature_Cursed_05');
INSERT INTO `creaturefamilydbc` VALUES ('41', '0.7', '1', '1', '60', '783', '270', '17', '2', '63', 'Silithid', 'Silithide', 'Interface\\Icons\\Ability_Hunter_Pet_Silithid');
INSERT INTO `creaturefamilydbc` VALUES ('42', '0.7', '1', '1', '60', '784', '270', '28', '1', '62', 'Worm', 'Ver', 'Interface\\Icons\\Ability_Hunter_Pet_Worm');
INSERT INTO `creaturefamilydbc` VALUES ('43', '0.35', '1', '0.56', '60', '786', '270', '60', '1', '61', 'Rhino', 'Rhinocéros', 'Interface\\Icons\\Ability_Hunter_Pet_Rhino');
INSERT INTO `creaturefamilydbc` VALUES ('44', '0.4', '1', '0.6', '60', '785', '270', '60', '0', '60', 'Wasp', 'Guêpe', 'Interface\\Icons\\Ability_Hunter_Pet_Wasp');
INSERT INTO `creaturefamilydbc` VALUES ('45', '0.3', '1', '0.5', '60', '787', '270', '1', '0', '59', 'Core Hound', 'Chien du Magma', 'Interface\\Icons\\Ability_Hunter_Pet_CoreHound');
INSERT INTO `creaturefamilydbc` VALUES ('46', '0.7', '1', '1.1', '60', '788', '270', '3', '0', '58', 'Spirit Beast', 'Esprit de bête', 'Interface\\Icons\\Ability_Druid_PrimalPrecision');
