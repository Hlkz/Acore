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
-- Table structure for table `itemlimitcategorydbc`
--

DROP TABLE IF EXISTS `itemlimitcategorydbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemlimitcategorydbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `MaxCount` int(10) NOT NULL DEFAULT '0',
  `Mode` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemlimitcategorydbc`
--

LOCK TABLES `itemlimitcategorydbc` WRITE;
/*!40000 ALTER TABLE `itemlimitcategorydbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemlimitcategorydbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `itemlimitcategorydbc`
--

INSERT INTO `itemlimitcategorydbc` VALUES ('2', 'Jeweler\'s Gems', 'Gemmes de joaillier', '3', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('3', 'Healthstone', 'Pierre de soins', '1', '0');
INSERT INTO `itemlimitcategorydbc` VALUES ('4', 'Mana Gem', 'Gemme de mana', '1', '0');
INSERT INTO `itemlimitcategorydbc` VALUES ('6', 'Stormjewel', 'Joyau-tempête', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('7', 'Enchanted Pearl', 'Perle enchantée', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('8', 'Binding Light', 'Lien de lumière', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('9', 'Binding Stone', 'Lien de pierre', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('10', 'Death\'s Choice', 'Choix de la mort', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('11', 'Death\'s Verdict', 'Verdict de la mort', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('12', 'Eitrigg\'s Oath', 'Serment d\'Eitrigg', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('13', 'Fervor of the Frostborn', 'Ferveur des Givre-nés', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('14', 'Fetish of Volatile Power', 'Fétiche du pouvoir volatil', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('15', 'Juggernaut\'s Vitality', 'Vitalité du mastodonte', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('16', 'Reign of the Dead', 'Règne de la mort', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('17', 'Reign of the Unliving', 'Règne des non-vivants', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('18', 'Satrina\'s Impeding Scarab', 'Scarabée d\'obstruction de Satrina', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('19', 'Solace of the Defeated', 'Réconfort des vaincus', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('20', 'Solace of the Fallen', 'Réconfort des défunts', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('21', 'Talisman of Volatile Power', 'Talisman du pouvoir volatil', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('22', 'Vengeance of the Forsaken', 'Vengeance des Réprouvés', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('23', 'Victor\'s Call', 'Appel de la victoire', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('24', 'Band of Callous Aggression', 'Bague de l\'agression cruelle', '1', '0');
INSERT INTO `itemlimitcategorydbc` VALUES ('25', 'Band of Deplorable Violence', 'Bague de violence déplorable', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('26', 'Band of the Traitor King', 'Bague du roi traître', '1', '0');
INSERT INTO `itemlimitcategorydbc` VALUES ('27', 'Band of the Twin Val\'kyr', 'Bague des Val\'kyrs jumelles', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('28', 'Band of the Violent Temperment', 'Bague du tempérament violent', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('29', 'Carnivorous Band', 'Anneau carnivore', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('30', 'Circle of the Darkmender', 'Cercle du sombre réparateur', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('31', 'Firestorm Band', 'Bague tempête-de-feu', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('32', 'Firestorm Ring', 'Anneau tempête-de-feu', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('33', 'Gormok\'s Band', 'Bague de Gormok', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('34', 'Loop of the Twin Val\'kyr', 'Jonc des Val\'kyrs jumelles', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('35', 'Lurid Manifestation', 'Manifestation horrible', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('36', 'Planestalker Band', 'Bague du traqueur des plans', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('37', 'Planestalker Signet', 'Chevalière du traqueur des plans', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('38', 'Ring of Callous Aggression', 'Anneau de l\'agression cruelle', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('39', 'Ring of Callous Aggression', 'Anneau de l\'agression cruelle', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('40', 'Ring of the Darkmender', 'Anneau du sombre réparateur', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('41', 'Ring of the Violent Temperament', 'Anneau du tempérament violent', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('42', 'Signet of the Traitor King', 'Chevalière du roi traître', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('43', 'Test Ring Limit', 'Limite de l\'anneau test', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('44', 'Althor\'s Abacus', 'Boulier d\'Althor', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('45', 'Bauble of True Blood', 'Verroterie du sang véritable', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('46', 'Corpse Tongue Coin', 'Pièce du passeur', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('47', 'Deathbringer\'s Will', 'Volonté de porte-mort', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('48', 'Dislodged Foreign Object', 'Objet étranger déplacé', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('49', 'Phylactery of the Nameless Lich', 'Phylactère de la liche sans nom', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('50', 'Tiny Abomination in a Jar', 'Petite abomination en bouteille', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('51', 'Sindragosa\'s Flawless Fang', 'Croc parfait de Sindragosa', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('52', 'Abomination\'s Bloody Ring', 'Anneau sanglant d\'abomination', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('53', 'Signet of Putrefaction', 'Chevalière de putréfaction', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('54', 'Cerise Coiled Ring', 'Anneau torsadé cerise', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('55', 'Rotface\'s Rupturing Ring', 'Anneau de rupture de Trognepus', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('56', 'Saurfang\'s Cold-Forged Band', 'Anneau de Saurcroc forgé à froid', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('57', 'Seal of the Twilight Queen', 'Sceau de la reine du crépuscule', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('58', 'Thrice Fanged Signet', 'Chevalière aux trois crocs', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('59', 'Band of the Bone Colossus', 'Bague du colosse d\'os', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('60', 'Devium\'s Eternally Cold Ring', 'Anneau éternellement froid de Devium', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('61', 'Seal of Many Mouths', 'Sceau des bouches nombreuses', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('62', 'Frostbrood Sapphire Ring', 'Anneau en saphir couvegivre', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('63', 'Juggernaut Band', 'Bague de mastodonte', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('64', 'Loop of the Endless Labyrinth', 'Jonc de labyrinthe sans fin', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('65', 'Marrowgar\'s Frigid Eye', 'Oeil glacial de Gargamoelle', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('66', 'Memory of Malygos', 'Mémoire de Malygos', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('67', 'Might of Blight', 'Puissance de chancre', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('68', 'Ring of Maddening Whispers', 'Anneau de murmures exaspérants', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('69', 'Ring of Rapid Ascent', 'Anneau d\'ascension rapide', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('70', 'Skeleton Lord\'s Circle', 'Cercle de seigneur squelette', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('71', 'Valanar\'s Other Signet Ring', 'Autre chevalière de Valanar', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('72', 'Incarnadine Band of Mending', 'Bague de guérison incarnadine', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('73', 'Muradin\'s Spyglass', 'Longue-vue de Muradin', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('74', 'Sliver of Pure Ice', 'Esquille de glace pure', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('75', 'Unidentifiable Organ', 'Organe non identifiable', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('76', 'Whispering Fanged Skull', 'Crâne à crocs murmurant', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('77', 'Twilight Scale', 'Ecaille du crépuscule', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('78', 'Ring of Phased Regeneration', 'Anneau de régénération phasée', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('79', 'Saviana\'s Tribute', 'Offrande à Saviana', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('80', 'Signet of Twilight', 'Chevalière de crépuscule', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('81', 'Zarithrian\'s Offering', 'Offrande de Zarithrian', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('82', 'Sharpened Twilight Scale', 'Ecaille du crépuscule aiguisée', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('83', 'Petrified Twilight Scale', 'Ecaille du crépuscule pétrifiée', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('84', 'Glowing Twilight Scale', 'Ecaille du crépuscule luminescente', '1', '1');
INSERT INTO `itemlimitcategorydbc` VALUES ('85', 'Charred Twilight Scale', 'Ecaille du crépuscule carbonisée', '1', '1');
