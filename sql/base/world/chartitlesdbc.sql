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
-- Table structure for table `chartitlesdbc`
--

DROP TABLE IF EXISTS `chartitlesdbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chartitlesdbc` (
  `Id` int(4) NOT NULL DEFAULT '0',
  `UnkRef` int(4) NOT NULL DEFAULT '0',
  `Male` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `Male_loc2` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `Female` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `Female_loc2` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `TitleMask` int(4) NOT NULL DEFAULT '0',
  `InGameOrder` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chartitlesdbc`
--

LOCK TABLES `chartitlesdbc` WRITE;
/*!40000 ALTER TABLE `chartitlesdbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `chartitlesdbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `chartitlesdbc`
--

INSERT INTO `chartitlesdbc` VALUES ('1', '5879', 'Private %s', 'Soldat %s', 'Private %s', 'Soldat %s', '16712190', '1');
INSERT INTO `chartitlesdbc` VALUES ('2', '5880', 'Corporal %s', 'Caporal %s', 'Corporal %s', 'Caporal %s', '16712190', '2');
INSERT INTO `chartitlesdbc` VALUES ('3', '5881', 'Sergeant %s', 'Sergent %s', 'Sergeant %s', 'Sergent %s', '16712190', '3');
INSERT INTO `chartitlesdbc` VALUES ('4', '5882', 'Master Sergeant %s', 'Sergent-chef %s', 'Master Sergeant %s', 'Sergent-chef %s', '16712190', '4');
INSERT INTO `chartitlesdbc` VALUES ('5', '5883', 'Sergeant Major %s', 'Sergent-major %s', 'Sergeant Major %s', 'Sergent-major %s', '16712190', '5');
INSERT INTO `chartitlesdbc` VALUES ('6', '5884', 'Knight %s', 'Chevalier %s', 'Knight %s', 'Chevalier %s', '16712190', '6');
INSERT INTO `chartitlesdbc` VALUES ('7', '5885', 'Knight-Lieutenant %s', 'Chevalier-lieutenant %s', 'Knight-Lieutenant %s', 'Chevalier-lieutenant %s', '16712190', '7');
INSERT INTO `chartitlesdbc` VALUES ('8', '5886', 'Knight-Captain %s', 'Chevalier-capitaine %s', 'Knight-Captain %s', 'Chevalier-capitaine %s', '16712190', '8');
INSERT INTO `chartitlesdbc` VALUES ('9', '5887', 'Knight-Champion %s', 'Chevalier-champion %s', 'Knight-Champion %s', 'Chevalier-champion %s', '16712190', '9');
INSERT INTO `chartitlesdbc` VALUES ('10', '5888', 'Lieutenant Commander %s', 'Lieutenant-commandant %s', 'Lieutenant Commander %s', 'Lieutenant-commandant %s', '16712190', '10');
INSERT INTO `chartitlesdbc` VALUES ('11', '5889', 'Commander %s', 'Commandant %s', 'Commander %s', 'Commandant %s', '16712190', '11');
INSERT INTO `chartitlesdbc` VALUES ('12', '5890', 'Marshal %s', 'Maréchal %s', 'Marshal %s', 'Maréchal %s', '16712190', '12');
INSERT INTO `chartitlesdbc` VALUES ('13', '5891', 'Field Marshal %s', 'Grand maréchal %s', 'Field Marshal %s', 'Grand maréchal %s', '16712190', '13');
INSERT INTO `chartitlesdbc` VALUES ('14', '5892', 'Grand Marshal %s', 'Connétable %s', 'Grand Marshal %s', 'Connétable %s', '16712190', '14');
INSERT INTO `chartitlesdbc` VALUES ('15', '5893', 'Scout %s', 'Eclaireur %s', 'Scout %s', 'Eclaireur %s', '16712190', '15');
INSERT INTO `chartitlesdbc` VALUES ('16', '5894', 'Grunt %s', 'Grunt %s', 'Grunt %s', 'Grunt %s', '16712190', '16');
INSERT INTO `chartitlesdbc` VALUES ('17', '5895', 'Sergeant %s', 'Sergent %s', 'Sergeant %s', 'Sergent %s', '16712190', '17');
INSERT INTO `chartitlesdbc` VALUES ('18', '5896', 'Senior Sergeant %s', 'Sergent-chef %s', 'Senior Sergeant %s', 'Sergent-chef %s', '16712190', '18');
INSERT INTO `chartitlesdbc` VALUES ('19', '5897', 'First Sergeant %s', 'Adjudant %s', 'First Sergeant %s', 'Adjudant %s', '16712190', '19');
INSERT INTO `chartitlesdbc` VALUES ('20', '5898', 'Stone Guard %s', 'Garde de pierre %s', 'Stone Guard %s', 'Garde de pierre %s', '16712190', '20');
INSERT INTO `chartitlesdbc` VALUES ('21', '5899', 'Blood Guard %s', 'Garde de sang %s', 'Blood Guard %s', 'Garde de sang %s', '16712190', '21');
INSERT INTO `chartitlesdbc` VALUES ('22', '5900', 'Legionnaire %s', 'Légionnaire %s', 'Legionnaire %s', 'Légionnaire %s', '16712190', '22');
INSERT INTO `chartitlesdbc` VALUES ('23', '5901', 'Centurion %s', 'Centurion %s', 'Centurion %s', 'Centurion %s', '16712190', '23');
INSERT INTO `chartitlesdbc` VALUES ('24', '5902', 'Champion %s', 'Champion %s', 'Champion %s', 'Championne %s', '16712190', '24');
INSERT INTO `chartitlesdbc` VALUES ('25', '5903', 'Lieutenant General %s', 'Lieutenant-général %s', 'Lieutenant General %s', 'Lieutenant-général %s', '16712190', '25');
INSERT INTO `chartitlesdbc` VALUES ('26', '5904', 'General %s', 'Général %s', 'General %s', 'Général %s', '16712190', '26');
INSERT INTO `chartitlesdbc` VALUES ('27', '5905', 'Warlord %s', 'Seigneur de guerre %s', 'Warlord %s', 'Seigneur de guerre %s', '16712190', '27');
INSERT INTO `chartitlesdbc` VALUES ('28', '5906', 'High Warlord %s', 'Grand seigneur de guerre %s', 'High Warlord %s', 'Grand seigneur de guerre %s', '16712190', '28');
INSERT INTO `chartitlesdbc` VALUES ('42', '0', 'Gladiator %s', 'Gladiateur %s', 'Gladiator %s', 'Gladiateur %s', '16712190', '29');
INSERT INTO `chartitlesdbc` VALUES ('43', '0', 'Duelist %s', 'Duelliste %s', 'Duelist %s', 'Duelliste %s', '16712190', '30');
INSERT INTO `chartitlesdbc` VALUES ('44', '0', 'Rival %s', 'Rival %s', 'Rival %s', 'Rivale %s', '16712190', '31');
INSERT INTO `chartitlesdbc` VALUES ('45', '0', 'Challenger %s', 'Compétiteur %s', 'Challenger %s', 'Compétitrice %s', '16712190', '32');
INSERT INTO `chartitlesdbc` VALUES ('46', '6341', 'Scarab Lord %s', 'Seigneur scarabée %s', 'Scarab Lord %s', 'Seigneur scarabée %s', '16712190', '33');
INSERT INTO `chartitlesdbc` VALUES ('47', '6407', 'Conqueror %s', 'Conquérant %s', 'Conqueror %s', 'Conquérante %s', '16712190', '34');
INSERT INTO `chartitlesdbc` VALUES ('48', '6406', 'Justicar %s', 'Justicier %s', 'Justicar %s', 'Justicière %s', '16712190', '35');
INSERT INTO `chartitlesdbc` VALUES ('53', '6686', '%s, Champion of the Naaru', '%s, champion des naaru', '%s, Champion of the Naaru', '%s, championne des naaru', '16712190', '36');
INSERT INTO `chartitlesdbc` VALUES ('62', '0', 'Merciless Gladiator %s', 'Gladiateur impitoyable %s', 'Merciless Gladiator %s', 'Gladiateur impitoyable %s', '16712190', '37');
INSERT INTO `chartitlesdbc` VALUES ('63', '6806', '%s of the Shattered Sun', '%s du Soleil brisé', '%s of the Shattered Sun', '%s du Soleil brisé', '16712190', '38');
INSERT INTO `chartitlesdbc` VALUES ('64', '6944', '%s, Hand of A\'dal', '%s, Main d\'A\'dal', '%s, Hand of A\'dal', '%s, Main d\'A\'dal', '16712190', '39');
INSERT INTO `chartitlesdbc` VALUES ('71', '0', 'Vengeful Gladiator %s', 'Gladiateur vengeur %s', 'Vengeful Gladiator %s', 'Gladiateur vengeur %s', '16712190', '40');
INSERT INTO `chartitlesdbc` VALUES ('72', '7530', 'Battlemaster %s', 'Maître de guerre %s', 'Battlemaster %s', 'Maître de guerre %s', '16712190', '41');
INSERT INTO `chartitlesdbc` VALUES ('74', '7533', 'Elder %s', 'Ancien %s', 'Elder %s', 'Ancienne %s', '16712190', '43');
INSERT INTO `chartitlesdbc` VALUES ('75', '7534', 'Flame Warden %s', 'Gardien des flammes %s', 'Flame Warden %s', 'Gardienne des flammes %s', '16712190', '44');
INSERT INTO `chartitlesdbc` VALUES ('76', '7535', 'Flame Keeper %s', 'Garde-flammes %s', 'Flame Keeper %s', 'Garde-flammes %s', '16712190', '45');
INSERT INTO `chartitlesdbc` VALUES ('77', '7565', '%s the Exalted', '%s l\'exalté', '%s the Exalted', '%s l\'exaltée', '16712190', '46');
INSERT INTO `chartitlesdbc` VALUES ('78', '7695', '%s the Explorer', '%s l\'explorateur', '%s the Explorer', '%s l\'exploratrice', '16712190', '47');
INSERT INTO `chartitlesdbc` VALUES ('79', '7748', '%s the Diplomat', '%s le diplomate', '%s the Diplomat', '%s la diplomate', '16712190', '48');
INSERT INTO `chartitlesdbc` VALUES ('80', '0', 'Brutal Gladiator %s', 'Gladiateur brutal %s', 'Brutal Gladiator %s', 'Gladiateur brutal %s', '16712190', '49');
INSERT INTO `chartitlesdbc` VALUES ('81', '7759', '%s the Seeker', 'Chercheur %s', '%s the Seeker', 'Chercheuse %s', '16712190', '42');
INSERT INTO `chartitlesdbc` VALUES ('82', '7749', 'Arena Master %s', 'Maître de l\'arène %s', 'Arena Master %s', 'Maître de l\'arène %s', '16712190', '50');
INSERT INTO `chartitlesdbc` VALUES ('83', '7750', 'Salty %s', 'Loup de mer %s', 'Salty %s', 'Louve de mer %s', '16712190', '51');
INSERT INTO `chartitlesdbc` VALUES ('84', '7754', 'Chef %s', 'Chef %s', 'Chef %s', 'Chef %s', '16712190', '52');
INSERT INTO `chartitlesdbc` VALUES ('85', '7703', '%s the Supreme', '%s le suprême', '%s the Supreme', '%s la suprême', '16712190', '53');
INSERT INTO `chartitlesdbc` VALUES ('86', '7703', '%s of the Ten Storms', '%s des dix tempêtes', '%s of the Ten Storms', '%s des dix tempêtes', '16712190', '54');
INSERT INTO `chartitlesdbc` VALUES ('87', '7703', '%s of the Emerald Dream', '%s du Rêve d\'émeraude', '%s of the Emerald Dream', '%s du Rêve d\'émeraude', '16712190', '55');
INSERT INTO `chartitlesdbc` VALUES ('89', '7703', 'Prophet %s', 'Prophète %s', 'Prophet %s', 'Prophète %s', '16712190', '57');
INSERT INTO `chartitlesdbc` VALUES ('90', '7703', '%s the Malefic', '%s le maléfique', '%s the Malefic', '%s la maléfique', '16712190', '58');
INSERT INTO `chartitlesdbc` VALUES ('91', '7703', 'Stalker %s', 'Traqueur %s', 'Stalker %s', 'Traqueuse %s', '16712190', '59');
INSERT INTO `chartitlesdbc` VALUES ('92', '7703', '%s of the Ebon Blade', '%s de la Lame d\'ébène', '%s of the Ebon Blade', '%s de la Lame d\'ébène', '16712190', '60');
INSERT INTO `chartitlesdbc` VALUES ('93', '7703', 'Archmage %s', 'Archimage %s', 'Archmage %s', 'Archimage %s', '16712190', '61');
INSERT INTO `chartitlesdbc` VALUES ('94', '7703', 'Warbringer %s', 'Porteguerre %s', 'Warbringer %s', 'Porteguerre %s', '16712190', '62');
INSERT INTO `chartitlesdbc` VALUES ('95', '7703', 'Assassin %s', 'Assassin %s', 'Assassin %s', 'Assassin %s', '16712190', '63');
INSERT INTO `chartitlesdbc` VALUES ('96', '7703', 'Grand Master Alchemist %s', 'Grand maître alchimiste %s', 'Grand Master Alchemist %s', 'Grand maître alchimiste %s', '16712190', '64');
INSERT INTO `chartitlesdbc` VALUES ('97', '7703', 'Grand Master Blacksmith %s', 'Grand maître forgeron %s', 'Grand Master Blacksmith %s', 'Grand maître forgeron %s', '16712190', '65');
INSERT INTO `chartitlesdbc` VALUES ('98', '7703', 'Iron Chef %s', 'Cordon bleu %s', 'Iron Chef %s', 'Cordon bleu %s', '16712190', '66');
INSERT INTO `chartitlesdbc` VALUES ('99', '7703', 'Grand Master Enchanter %s', 'Grand maître enchanteur %s', 'Grand Master Enchanter %s', 'Grand maître enchanteur %s', '16712190', '67');
INSERT INTO `chartitlesdbc` VALUES ('100', '7703', 'Grand Master Engineer %s', 'Grand maître ingénieur %s', 'Grand Master Engineer %s', 'Grand maître ingénieur %s', '16712190', '68');
INSERT INTO `chartitlesdbc` VALUES ('101', '7703', 'Doctor %s', 'Docteur %s', 'Doctor %s', 'Docteur %s', '16712190', '69');
INSERT INTO `chartitlesdbc` VALUES ('102', '7703', 'Grand Master Angler %s', 'Grand maître pêcheur %s', 'Grand Master Angler %s', 'Grand maître pêcheur %s', '16712190', '70');
INSERT INTO `chartitlesdbc` VALUES ('103', '7703', 'Grand Master Herbalist %s', 'Grand maître herboriste %s', 'Grand Master Herbalist %s', 'Grand maître herboriste %s', '16712190', '71');
INSERT INTO `chartitlesdbc` VALUES ('104', '7703', 'Grand Master Scribe %s', 'Grand maître scribe %s', 'Grand Master Scribe %s', 'Grand maître scribe %s', '16712190', '72');
INSERT INTO `chartitlesdbc` VALUES ('105', '7703', 'Grand Master Jewelcrafter %s', 'Grand maître joaillier %s', 'Grand Master Jewelcrafter %s', 'Grand maître joaillier %s', '16712190', '73');
INSERT INTO `chartitlesdbc` VALUES ('106', '7703', 'Grand Master Leatherworker %s', 'Grand maître travailleur du cuir %s', 'Grand Master Leatherworker %s', 'Grand maître travailleur du cuir %s', '16712190', '74');
INSERT INTO `chartitlesdbc` VALUES ('107', '7703', 'Grand Master Miner %s', 'Grand maître mineur %s', 'Grand Master Miner %s', 'Grand maître mineur %s', '16712190', '75');
INSERT INTO `chartitlesdbc` VALUES ('108', '7703', 'Grand Master Skinner %s', 'Grand maître dépeceur %s', 'Grand Master Skinner %s', 'Grand maître dépeceur %s', '16712190', '76');
INSERT INTO `chartitlesdbc` VALUES ('109', '7703', 'Grand Master Tailor %s', 'Grand maître tailleur %s', 'Grand Master Tailor %s', 'Grand maître tailleur %s', '16712190', '77');
INSERT INTO `chartitlesdbc` VALUES ('110', '7703', '%s of Quel\'Thalas', '%s de Quel\'Thalas', '%s of Quel\'Thalas', '%s de Quel\'Thalas', '16712190', '78');
INSERT INTO `chartitlesdbc` VALUES ('111', '7703', '%s of Argus', '%s d\'Argus', '%s of Argus', '%s d\'Argus', '16712190', '79');
INSERT INTO `chartitlesdbc` VALUES ('112', '7703', '%s of Khaz Modan', '%s de Khaz Modan', '%s of Khaz Modan', '%s de Khaz Modan', '16712190', '80');
INSERT INTO `chartitlesdbc` VALUES ('113', '8236', '%s of Gnomeregan', '%s de Gnomeregan', '%s of Gnomeregan', '%s de Gnomeregan', '16712190', '81');
INSERT INTO `chartitlesdbc` VALUES ('114', '7703', '%s the Lion Hearted', '%s au cœur de lion', '%s the Lion Hearted', '%s au cœur de lion', '16712190', '82');
INSERT INTO `chartitlesdbc` VALUES ('115', '7703', '%s, Champion of Elune', '%s, champion d\'Elune', '%s, Champion of Elune', '%s, championne d\'Elune', '16712190', '83');
INSERT INTO `chartitlesdbc` VALUES ('116', '7703', '%s, Hero of Orgrimmar', '%s, héros d\'Orgrimmar', '%s, Hero of Orgrimmar', '%s, héroïne d\'Orgrimmar', '16712190', '84');
INSERT INTO `chartitlesdbc` VALUES ('117', '7703', 'Plainsrunner %s', '%s le coureur des plaines', 'Plainsrunner %s', '%s la coureuse des plaines', '16712190', '85');
INSERT INTO `chartitlesdbc` VALUES ('118', '7703', '%s of the Darkspear', '%s des Sombrelances', '%s of the Darkspear', '%s des Sombrelances', '16712190', '86');
INSERT INTO `chartitlesdbc` VALUES ('119', '7703', '%s the Forsaken', '%s le réprouvé', '%s the Forsaken', '%s la réprouvée', '16712190', '87');
INSERT INTO `chartitlesdbc` VALUES ('120', '7812', '%s the Magic Seeker', '%s le cherche-magie', '%s the Magic Seeker', '%s la cherche-magie', '16712190', '88');
INSERT INTO `chartitlesdbc` VALUES ('121', '7813', 'Twilight Vanquisher %s', 'Vainqueur du crépuscule %s', 'Twilight Vanquisher %s', 'Vainqueur du crépuscule %s', '16712190', '89');
INSERT INTO `chartitlesdbc` VALUES ('122', '7814', '%s, Conqueror of Naxxramas', '%s, conquérant de Naxxramas', '%s, Conqueror of Naxxramas', '%s, conquérante de Naxxramas', '16712190', '90');
INSERT INTO `chartitlesdbc` VALUES ('123', '7815', '%s, Hero of Northrend', '%s, héros du Norfendre', '%s, Hero of Northrend', '%s, héroïne du Norfendre', '16712190', '91');
INSERT INTO `chartitlesdbc` VALUES ('124', '7820', '%s the Hallowed', '%s le Sanssaint', '%s the Hallowed', '%s la Sanssainte', '16712190', '92');
INSERT INTO `chartitlesdbc` VALUES ('125', '7849', 'Loremaster %s', 'Maître des traditions %s', 'Loremaster %s', 'Maître des traditions %s', '16712190', '93');
INSERT INTO `chartitlesdbc` VALUES ('126', '7853', '%s of the Alliance', '%s de l\'Alliance', '%s of the Alliance', '%s de l\'Alliance', '16712190', '94');
INSERT INTO `chartitlesdbc` VALUES ('127', '7854', '%s of the Horde', '%s de la Horde', '%s of the Horde', '%s de la Horde', '16712190', '95');
INSERT INTO `chartitlesdbc` VALUES ('128', '7856', '%s the Flawless Victor', '%s l\'infaillible vainqueur', '%s the Flawless Victor', '%s l\'infaillible vainqueur', '16712190', '96');
INSERT INTO `chartitlesdbc` VALUES ('129', '7857', '%s, Champion of the Frozen Wastes', '%s, champion des terres gelées', '%s, Champion of the Frozen Wastes', '%s, championne des terres gelées', '16712190', '97');
INSERT INTO `chartitlesdbc` VALUES ('130', '7858', 'Ambassador %s', 'Ambassadeur %s', 'Ambassador %s', 'Ambassadrice %s', '16712190', '98');
INSERT INTO `chartitlesdbc` VALUES ('131', '7859', '%s the Argent Champion', '%s, champion d\'argent', '%s the Argent Champion', '%s, championne d\'argent', '16712190', '99');
INSERT INTO `chartitlesdbc` VALUES ('132', '7860', '%s, Guardian of Cenarius', '%s, gardien de Cénarius', '%s, Guardian of Cenarius', '%s, gardienne de Cénarius', '16712190', '100');
INSERT INTO `chartitlesdbc` VALUES ('133', '7861', 'Brewmaster %s', 'Maître brasseur %s', 'Brewmaster %s', 'Maître brasseur %s', '16712190', '101');
INSERT INTO `chartitlesdbc` VALUES ('134', '7864', 'Merrymaker %s', '%s le joyeux', 'Merrymaker %s', '%s la joyeuse', '16712190', '102');
INSERT INTO `chartitlesdbc` VALUES ('135', '7875', '%s the Love Fool', '%s au cœur d\'artichaut', '%s the Love Fool', '%s au cœur d\'artichaut', '16712190', '103');
INSERT INTO `chartitlesdbc` VALUES ('137', '7893', 'Matron %s', 'Marraine %s', 'Matron %s', 'Marraine %s', '16712190', '104');
INSERT INTO `chartitlesdbc` VALUES ('138', '7894', 'Patron %s', 'Parrain %s', 'Patron %s', 'Parrain %s', '16712190', '105');
INSERT INTO `chartitlesdbc` VALUES ('139', '7964', 'Obsidian Slayer %s', '%s, tueur de l\'obsidien', 'Obsidian Slayer %s', '%s, tueuse de l\'obsidien', '16712190', '106');
INSERT INTO `chartitlesdbc` VALUES ('140', '7965', '%s of the Nightfall', '%s du crépuscule', '%s of the Nightfall', '%s du crépuscule', '16712190', '107');
INSERT INTO `chartitlesdbc` VALUES ('141', '7990', '%s the Immortal', '%s l\'immortel', '%s the Immortal', '%s l\'immortelle', '16712190', '108');
INSERT INTO `chartitlesdbc` VALUES ('142', '7991', '%s the Undying', '%s l\'increvable', '%s the Undying', '%s l\'increvable', '16712190', '109');
INSERT INTO `chartitlesdbc` VALUES ('143', '7997', '%s Jenkins', '%s Jenkins', '%s Jenkins', '%s Jenkins', '16712190', '110');
INSERT INTO `chartitlesdbc` VALUES ('144', '8045', 'Bloodsail Admiral %s', 'Amiral de la Voile sanglante %s', 'Bloodsail Admiral %s', 'Amiral de la Voile sanglante %s', '16712190', '111');
INSERT INTO `chartitlesdbc` VALUES ('145', '8121', '%s the Insane', '%s le grand malade', '%s the Insane', '%s la grande malade', '16712190', '112');
INSERT INTO `chartitlesdbc` VALUES ('146', '8237', '%s of the Exodar', '%s de l\'Exodar', '%s of the Exodar', '%s de l\'Exodar', '16712190', '113');
INSERT INTO `chartitlesdbc` VALUES ('147', '8238', '%s of Darnassus', '%s de Darnassus', '%s of Darnassus', '%s de Darnassus', '16712190', '114');
INSERT INTO `chartitlesdbc` VALUES ('148', '8239', '%s of Ironforge', '%s de Forgefer', '%s of Ironforge', '%s de Forgefer', '16712190', '115');
INSERT INTO `chartitlesdbc` VALUES ('149', '8240', '%s of Stormwind', '%s de Hurlevent', '%s of Stormwind', '%s de Hurlevent', '16712190', '116');
INSERT INTO `chartitlesdbc` VALUES ('150', '8241', '%s of Orgrimmar', '%s d\'Orgrimmar', '%s of Orgrimmar', '%s d\'Orgrimmar', '16712190', '117');
INSERT INTO `chartitlesdbc` VALUES ('151', '8242', '%s of Sen\'jin', '%s de Sen\'jin', '%s of Sen\'jin', '%s de Sen\'jin', '16712190', '118');
INSERT INTO `chartitlesdbc` VALUES ('152', '8243', '%s of Silvermoon', '%s de Lune-d\'argent', '%s of Silvermoon', '%s de Lune-d\'argent', '16712190', '119');
INSERT INTO `chartitlesdbc` VALUES ('153', '8244', '%s of Thunder Bluff', '%s des Pitons du Tonnerre', '%s of Thunder Bluff', '%s des Pitons du Tonnerre', '16712190', '120');
INSERT INTO `chartitlesdbc` VALUES ('154', '8245', '%s of the Undercity', '%s de Fossoyeuse', '%s of the Undercity', '%s de Fossoyeuse', '16712190', '121');
INSERT INTO `chartitlesdbc` VALUES ('155', '8303', '%s the Noble', 'Noble %s', '%s the Noble', 'Noble %s', '16712190', '122');
INSERT INTO `chartitlesdbc` VALUES ('156', '8332', 'Crusader %s', 'Croisé %s', 'Crusader %s', 'Croisée %s', '16712190', '123');
INSERT INTO `chartitlesdbc` VALUES ('157', '0', 'Deadly Gladiator %s', 'Gladiateur fatal %s', 'Deadly Gladiator %s', 'Gladiateur fatal %s', '16712190', '56');
INSERT INTO `chartitlesdbc` VALUES ('158', '8450', '%s, Death\'s Demise', '%s, faucheur de la Mort', '%s, Death\'s Demise', '%s, faucheuse de la Mort', '16712190', '124');
INSERT INTO `chartitlesdbc` VALUES ('159', '8451', '%s the Celestial Defender', '%s le défenseur céleste', '%s the Celestial Defender', '%s le défenseur céleste', '16712190', '125');
INSERT INTO `chartitlesdbc` VALUES ('160', '8453', '%s, Conqueror of Ulduar', '%s, conquérant d\'Ulduar', '%s, Conqueror of Ulduar', '%s, conquérante d\'Ulduar', '16712190', '126');
INSERT INTO `chartitlesdbc` VALUES ('161', '8452', '%s, Champion of Ulduar', '%s, champion d\'Ulduar', '%s, Champion of Ulduar', '%s, championne d\'Ulduar', '16712190', '127');
INSERT INTO `chartitlesdbc` VALUES ('163', '0', 'Vanquisher %s', 'Vainqueur %s', 'Vanquisher %s', 'Vainqueur %s', '16712190', '128');
INSERT INTO `chartitlesdbc` VALUES ('164', '8467', 'Starcaller %s', 'Mande-étoile %s', 'Starcaller %s', 'Mande-étoile %s', '16712190', '129');
INSERT INTO `chartitlesdbc` VALUES ('165', '8468', '%s the Astral Walker', '%s le marcheur astral', '%s the Astral Walker', '%s la marcheuse astrale', '16712190', '130');
INSERT INTO `chartitlesdbc` VALUES ('166', '8469', '%s, Herald of the Titans', '%s, héraut des titans', '%s, Herald of the Titans', '%s, héraut des titans', '16712190', '131');
INSERT INTO `chartitlesdbc` VALUES ('167', '0', 'Furious Gladiator %s', 'Gladiateur furieux %s', 'Furious Gladiator %s', 'Gladiateur furieux %s', '16712190', '132');
INSERT INTO `chartitlesdbc` VALUES ('168', '8596', '%s the Pilgrim', '%s le pèlerin', '%s the Pilgrim', '%s la pèlerine', '16712190', '133');
INSERT INTO `chartitlesdbc` VALUES ('169', '0', 'Relentless Gladiator %s', 'Gladiateur implacable %s', 'Relentless Gladiator %s', 'Gladiateur implacable %s', '16712190', '134');
INSERT INTO `chartitlesdbc` VALUES ('170', '8777', 'Grand Crusader %s', 'Grand croisé %s', 'Grand Crusader %s', 'Grande croisée %s', '16712190', '135');
INSERT INTO `chartitlesdbc` VALUES ('171', '8778', '%s the Argent Defender', '%s le défenseur d\'argent', '%s the Argent Defender', '%s le défenseur d\'argent', '16712190', '136');
INSERT INTO `chartitlesdbc` VALUES ('172', '8977', '%s the Patient', '%s l\'assidu', '%s the Patient', '%s l\'assidue', '16712190', '137');
INSERT INTO `chartitlesdbc` VALUES ('173', '9043', '%s the Light of Dawn', '%s, lumière de l\'aube', '%s the Light of Dawn', '%s, lumière de l\'aube', '16712190', '138');
INSERT INTO `chartitlesdbc` VALUES ('174', '9045', '%s, Bane of the Fallen King', '%s, tourment du roi déchu', '%s, Bane of the Fallen King', '%s, tourment du roi déchu', '16712190', '139');
INSERT INTO `chartitlesdbc` VALUES ('175', '9046', '%s the Kingslayer', '%s le régicide', '%s the Kingslayer', '%s la régicide', '16712190', '140');
INSERT INTO `chartitlesdbc` VALUES ('176', '9138', '%s of the Ashen Verdict', '%s du Verdict des cendres', '%s of the Ashen Verdict', '%s du Verdict des cendres', '16712190', '141');
INSERT INTO `chartitlesdbc` VALUES ('177', '0', 'Wrathful Gladiator %s', 'Gladiateur courroucé %s', 'Wrathful Gladiator %s', 'Gladiateur courroucé %s', '16712190', '142');
