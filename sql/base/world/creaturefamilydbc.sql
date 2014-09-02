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
  `MaxScale` float NOT NULL,
  `MaxScaleLevel` int(10) NOT NULL DEFAULT '0',
  `SkillLine_F6` int(10) NOT NULL DEFAULT '0',
  `SkillLine_F7` int(10) NOT NULL DEFAULT '0',
  `PetFoodMask` int(10) NOT NULL DEFAULT '0',
  `PetTalentType` int(10) NOT NULL DEFAULT '0',
  `CategoryEnumID` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `IconFile` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ID` (`Id`)
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

INSERT INTO `creaturefamilydbc` VALUES ('1', '1060320000', '1', '1065350000', '60', '208', '270', '1', '0', '23', '0', 'Loup', 'InterfaceIconsAbility_Hunter_Pet_Wolf');
INSERT INTO `creaturefamilydbc` VALUES ('2', '1060320000', '1', '1066190000', '60', '209', '270', '3', '0', '5', '0', 'Félin', 'InterfaceIconsAbility_Hunter_Pet_Cat');
INSERT INTO `creaturefamilydbc` VALUES ('3', '1053610000', '1', '1058640000', '60', '203', '270', '1', '2', '17', '0', 'Araignée', 'InterfaceIconsAbility_Hunter_Pet_Spider');
INSERT INTO `creaturefamilydbc` VALUES ('4', '1058640000', '1', '1065350000', '60', '210', '270', '63', '1', '1', '0', 'Ours', 'InterfaceIconsAbility_Hunter_Pet_Bear');
INSERT INTO `creaturefamilydbc` VALUES ('5', '1058640000', '1', '1065350000', '60', '211', '270', '63', '1', '3', '0', 'Sanglier', 'InterfaceIconsAbility_Hunter_Pet_Boar');
INSERT INTO `creaturefamilydbc` VALUES ('6', '1053610000', '1', '1058640000', '60', '212', '270', '3', '1', '7', '0', 'Crocilisque', 'InterfaceIconsAbility_Hunter_Pet_Crocolisk');
INSERT INTO `creaturefamilydbc` VALUES ('7', '1056960000', '1', '1063680000', '60', '213', '270', '3', '0', '4', '0', 'Charognard', 'InterfaceIconsAbility_Hunter_Pet_Vulture');
INSERT INTO `creaturefamilydbc` VALUES ('8', '1060320000', '1', '1068710000', '60', '214', '270', '58', '1', '6', '0', 'Crabe', 'InterfaceIconsAbility_Hunter_Pet_Crab');
INSERT INTO `creaturefamilydbc` VALUES ('9', '1060320000', '1', '1065350000', '60', '215', '270', '56', '1', '9', '0', 'Gorille', 'InterfaceIconsAbility_Hunter_Pet_Gorilla');
INSERT INTO `creaturefamilydbc` VALUES ('11', '1056960000', '1', '1062000000', '60', '217', '270', '1', '0', '13', '0', 'Raptor', 'InterfaceIconsAbility_Hunter_Pet_Raptor');
INSERT INTO `creaturefamilydbc` VALUES ('12', '1056960000', '1', '1062000000', '60', '218', '270', '60', '0', '19', '0', 'Haut-trotteur', 'InterfaceIconsAbility_Hunter_Pet_TallStrider');
INSERT INTO `creaturefamilydbc` VALUES ('15', '1060320000', '1', '1060320000', '60', '189', '0', '0', '-1', '-1', '0', 'Chasseur corrompu', '');
INSERT INTO `creaturefamilydbc` VALUES ('16', '1062000000', '1', '1062000000', '60', '204', '0', '0', '-1', '-1', '0', 'Marcheur du Vide', '');
INSERT INTO `creaturefamilydbc` VALUES ('17', '1065350000', '1', '1065350000', '60', '205', '0', '0', '-1', '-1', '0', 'Succube', '');
INSERT INTO `creaturefamilydbc` VALUES ('19', '1065350000', '1', '1065350000', '60', '207', '0', '0', '-1', '-1', '0', 'Garde funeste', '');
INSERT INTO `creaturefamilydbc` VALUES ('20', '1060320000', '1', '1065350000', '60', '236', '270', '1', '1', '15', '0', 'Scorpide', 'InterfaceIconsAbility_Hunter_Pet_Scorpid');
INSERT INTO `creaturefamilydbc` VALUES ('21', '1056960000', '1', '1060660000', '60', '251', '270', '58', '1', '21', '0', 'Tortue', 'InterfaceIconsAbility_Hunter_Pet_Turtle');
INSERT INTO `creaturefamilydbc` VALUES ('23', '1056960000', '1', '1056960000', '60', '188', '0', '0', '-1', '-1', '0', 'Diablotin', '');
INSERT INTO `creaturefamilydbc` VALUES ('24', '1053610000', '1', '1059150000', '60', '653', '270', '49', '2', '0', '0', 'Chauve-souris', 'InterfaceIconsAbility_Hunter_Pet_Bat');
INSERT INTO `creaturefamilydbc` VALUES ('25', '1060320000', '1', '1063680000', '60', '654', '270', '1', '0', '10', '0', 'Hyène', 'InterfaceIconsAbility_Hunter_Pet_Hyena');
INSERT INTO `creaturefamilydbc` VALUES ('26', '1056960000', '1', '1062000000', '60', '655', '270', '3', '2', '2', '0', 'Oiseau de proie', 'InterfaceIconsAbility_Hunter_Pet_Owl');
INSERT INTO `creaturefamilydbc` VALUES ('27', '1056960000', '1', '1060320000', '60', '656', '270', '14', '2', '22', '0', 'Serpent des vents', 'InterfaceIconsAbility_Hunter_Pet_WindSerpent');
INSERT INTO `creaturefamilydbc` VALUES ('28', '0', '0', '0', '0', '758', '0', '0', '-1', '-1', '0', 'Télécommande', '');
INSERT INTO `creaturefamilydbc` VALUES ('29', '1063680000', '1', '1063680000', '60', '761', '0', '0', '-1', '-1', '0', 'Gangregarde', '');
INSERT INTO `creaturefamilydbc` VALUES ('30', '1051930000', '1', '1059480000', '60', '763', '270', '35', '2', '8', '0', 'Faucon-dragon', 'InterfaceIconsAbility_Hunter_Pet_DragonHawk');
INSERT INTO `creaturefamilydbc` VALUES ('31', '1059480000', '1', '1063680000', '60', '767', '270', '1', '2', '14', '0', 'Ravageur', 'InterfaceIconsAbility_Hunter_Pet_Ravager');
INSERT INTO `creaturefamilydbc` VALUES ('32', '1055290000', '1', '1058640000', '60', '766', '270', '34', '1', '21', '0', 'Traqueur dim.', 'InterfaceIconsAbility_Hunter_Pet_WarpStalker');
INSERT INTO `creaturefamilydbc` VALUES ('33', '1058640000', '1', '1063680000', '60', '765', '270', '60', '2', '18', '0', 'Sporoptère', 'InterfaceIconsAbility_Hunter_Pet_Sporebat');
INSERT INTO `creaturefamilydbc` VALUES ('34', '1051930000', '1', '1057800000', '60', '764', '270', '17', '2', '12', '0', 'Raie du Néant', 'InterfaceIconsAbility_Hunter_Pet_NetherRay');
INSERT INTO `creaturefamilydbc` VALUES ('35', '1058640000', '1', '1062000000', '60', '768', '270', '1', '2', '16', '0', 'Serpent', 'InterfaceIconsSpell_Nature_GuardianWard');
INSERT INTO `creaturefamilydbc` VALUES ('37', '1051930000', '1', '1059480000', '60', '775', '270', '60', '0', '11', '0', 'Phalène', 'InterfaceIconsAbility_Hunter_Pet_Moth');
INSERT INTO `creaturefamilydbc` VALUES ('38', '1056960000', '1', '1059150000', '60', '780', '270', '1', '2', '24', '0', 'Chimère', 'InterfaceIconsAbility_Hunter_Pet_Chimera');
INSERT INTO `creaturefamilydbc` VALUES ('39', '1050250000', '1', '1056960000', '60', '781', '270', '1', '0', '25', '0', 'Diablosaure', 'InterfaceIconsAbility_Hunter_Pet_Devilsaur');
INSERT INTO `creaturefamilydbc` VALUES ('40', '1065350000', '1', '1065350000', '80', '782', '0', '0', '-1', '26', '0', 'Goule', 'InterfaceIconsAbility_Creature_Cursed_05');
INSERT INTO `creaturefamilydbc` VALUES ('41', '1060320000', '1', '1065350000', '60', '783', '270', '17', '2', '63', '0', 'Silithide', 'InterfaceIconsAbility_Hunter_Pet_Silithid');
INSERT INTO `creaturefamilydbc` VALUES ('42', '1060320000', '1', '1065350000', '60', '784', '270', '28', '1', '62', '0', 'Ver', 'InterfaceIconsAbility_Hunter_Pet_Worm');
INSERT INTO `creaturefamilydbc` VALUES ('43', '1051930000', '1', '1057970000', '60', '786', '270', '60', '1', '61', '0', 'Rhinocéros', 'InterfaceIconsAbility_Hunter_Pet_Rhino');
INSERT INTO `creaturefamilydbc` VALUES ('44', '1053610000', '1', '1058640000', '60', '785', '270', '60', '0', '60', '0', 'Guêpe', 'InterfaceIconsAbility_Hunter_Pet_Wasp');
INSERT INTO `creaturefamilydbc` VALUES ('45', '1050250000', '1', '1056960000', '60', '787', '270', '1', '0', '59', '0', 'Chien du Magma', 'InterfaceIconsAbility_Hunter_Pet_CoreHound');
INSERT INTO `creaturefamilydbc` VALUES ('46', '1060320000', '1', '1066190000', '60', '788', '270', '3', '0', '58', '0', 'Esprit de bête', 'InterfaceIconsAbility_Druid_PrimalPrecision');
