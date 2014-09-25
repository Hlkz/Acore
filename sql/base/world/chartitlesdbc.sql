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
  `Male` varchar(300) DEFAULT NULL,
  `Male_loc2` varchar(300) DEFAULT NULL,
  `Female` varchar(300) DEFAULT NULL,
  `Female_loc2` varchar(300) DEFAULT NULL,
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

INSERT INTO `chartitlesdbc` VALUES ('1', '5879', 'Private %s', 'Soldat %s', 'Private %s', 'Soldat %s', '1');
INSERT INTO `chartitlesdbc` VALUES ('2', '5880', 'Corporal %s', 'Caporal %s', 'Corporal %s', 'Caporal %s', '2');
INSERT INTO `chartitlesdbc` VALUES ('3', '5881', 'Sergeant %s', 'Sergent %s', 'Sergeant %s', 'Sergent %s', '3');
INSERT INTO `chartitlesdbc` VALUES ('4', '5882', 'Master Sergeant %s', 'Sergent-chef %s', 'Master Sergeant %s', 'Sergent-chef %s', '4');
INSERT INTO `chartitlesdbc` VALUES ('5', '5883', 'Sergeant Major %s', 'Sergent-major %s', 'Sergeant Major %s', 'Sergent-major %s', '5');
INSERT INTO `chartitlesdbc` VALUES ('6', '5884', 'Knight %s', 'Chevalier %s', 'Knight %s', 'Chevalier %s', '6');
INSERT INTO `chartitlesdbc` VALUES ('7', '5885', 'Knight-Lieutenant %s', 'Chevalier-lieutenant %s', 'Knight-Lieutenant %s', 'Chevalier-lieutenant %s', '7');
INSERT INTO `chartitlesdbc` VALUES ('8', '5886', 'Knight-Captain %s', 'Chevalier-capitaine %s', 'Knight-Captain %s', 'Chevalier-capitaine %s', '8');
INSERT INTO `chartitlesdbc` VALUES ('9', '5887', 'Knight-Champion %s', 'Chevalier-champion %s', 'Knight-Champion %s', 'Chevalier-champion %s', '9');
INSERT INTO `chartitlesdbc` VALUES ('10', '5888', 'Lieutenant Commander %s', 'Lieutenant-commandant %s', 'Lieutenant Commander %s', 'Lieutenant-commandant %s', '10');
INSERT INTO `chartitlesdbc` VALUES ('11', '5889', 'Commander %s', 'Commandant %s', 'Commander %s', 'Commandant %s', '11');
INSERT INTO `chartitlesdbc` VALUES ('12', '5890', 'Marshal %s', 'Maréchal %s', 'Marshal %s', 'Maréchal %s', '12');
INSERT INTO `chartitlesdbc` VALUES ('13', '5891', 'Field Marshal %s', 'Grand maréchal %s', 'Field Marshal %s', 'Grand maréchal %s', '13');
INSERT INTO `chartitlesdbc` VALUES ('14', '5892', 'Grand Marshal %s', 'Connétable %s', 'Grand Marshal %s', 'Connétable %s', '14');
INSERT INTO `chartitlesdbc` VALUES ('15', '5893', 'Scout %s', 'Eclaireur %s', 'Scout %s', 'Eclaireur %s', '15');
INSERT INTO `chartitlesdbc` VALUES ('16', '5894', 'Grunt %s', 'Grunt %s', 'Grunt %s', 'Grunt %s', '16');
INSERT INTO `chartitlesdbc` VALUES ('17', '5895', 'Sergeant %s', 'Sergent %s', 'Sergeant %s', 'Sergent %s', '17');
INSERT INTO `chartitlesdbc` VALUES ('18', '5896', 'Senior Sergeant %s', 'Sergent-chef %s', 'Senior Sergeant %s', 'Sergent-chef %s', '18');
INSERT INTO `chartitlesdbc` VALUES ('19', '5897', 'First Sergeant %s', 'Adjudant %s', 'First Sergeant %s', 'Adjudant %s', '19');
INSERT INTO `chartitlesdbc` VALUES ('20', '5898', 'Stone Guard %s', 'Garde de pierre %s', 'Stone Guard %s', 'Garde de pierre %s', '20');
INSERT INTO `chartitlesdbc` VALUES ('21', '5899', 'Blood Guard %s', 'Garde de sang %s', 'Blood Guard %s', 'Garde de sang %s', '21');
INSERT INTO `chartitlesdbc` VALUES ('22', '5900', 'Legionnaire %s', 'Légionnaire %s', 'Legionnaire %s', 'Légionnaire %s', '22');
INSERT INTO `chartitlesdbc` VALUES ('23', '5901', 'Centurion %s', 'Centurion %s', 'Centurion %s', 'Centurion %s', '23');
INSERT INTO `chartitlesdbc` VALUES ('24', '5902', 'Champion %s', 'Champion %s', 'Champion %s', 'Championne %s', '24');
INSERT INTO `chartitlesdbc` VALUES ('25', '5903', 'Lieutenant General %s', 'Lieutenant-général %s', 'Lieutenant General %s', 'Lieutenant-général %s', '25');
INSERT INTO `chartitlesdbc` VALUES ('26', '5904', 'General %s', 'Général %s', 'General %s', 'Général %s', '26');
INSERT INTO `chartitlesdbc` VALUES ('27', '5905', 'Warlord %s', 'Seigneur de guerre %s', 'Warlord %s', 'Seigneur de guerre %s', '27');
INSERT INTO `chartitlesdbc` VALUES ('28', '5906', 'High Warlord %s', 'Grand seigneur de guerre %s', 'High Warlord %s', 'Grand seigneur de guerre %s', '28');
INSERT INTO `chartitlesdbc` VALUES ('42', '0', 'Gladiator %s', 'Gladiateur %s', 'Gladiator %s', 'Gladiateur %s', '29');
INSERT INTO `chartitlesdbc` VALUES ('43', '0', 'Duelist %s', 'Duelliste %s', 'Duelist %s', 'Duelliste %s', '30');
INSERT INTO `chartitlesdbc` VALUES ('44', '0', 'Rival %s', 'Rival %s', 'Rival %s', 'Rivale %s', '31');
INSERT INTO `chartitlesdbc` VALUES ('45', '0', 'Challenger %s', 'Compétiteur %s', 'Challenger %s', 'Compétitrice %s', '32');
INSERT INTO `chartitlesdbc` VALUES ('46', '6341', 'Scarab Lord %s', 'Seigneur scarabée %s', 'Scarab Lord %s', 'Seigneur scarabée %s', '33');
INSERT INTO `chartitlesdbc` VALUES ('47', '6407', 'Conqueror %s', 'Conquérant %s', 'Conqueror %s', 'Conquérante %s', '34');
INSERT INTO `chartitlesdbc` VALUES ('48', '6406', 'Justicar %s', 'Justicier %s', 'Justicar %s', 'Justicière %s', '35');
INSERT INTO `chartitlesdbc` VALUES ('53', '6686', '%s, Champion of the Naaru', '%s, champion des naaru', '%s, Champion of the Naaru', '%s, championne des naaru', '36');
INSERT INTO `chartitlesdbc` VALUES ('62', '0', 'Merciless Gladiator %s', 'Gladiateur impitoyable %s', 'Merciless Gladiator %s', 'Gladiateur impitoyable %s', '37');
INSERT INTO `chartitlesdbc` VALUES ('63', '6806', '%s of the Shattered Sun', '%s du Soleil brisé', '%s of the Shattered Sun', '%s du Soleil brisé', '38');
INSERT INTO `chartitlesdbc` VALUES ('64', '6944', '%s, Hand of A\'dal', '%s, Main d\'A\'dal', '%s, Hand of A\'dal', '%s, Main d\'A\'dal', '39');
INSERT INTO `chartitlesdbc` VALUES ('71', '0', 'Vengeful Gladiator %s', 'Gladiateur vengeur %s', 'Vengeful Gladiator %s', 'Gladiateur vengeur %s', '40');
INSERT INTO `chartitlesdbc` VALUES ('72', '7530', 'Battlemaster %s', 'Maître de guerre %s', 'Battlemaster %s', 'Maître de guerre %s', '41');
INSERT INTO `chartitlesdbc` VALUES ('74', '7533', 'Elder %s', 'Ancien %s', 'Elder %s', 'Ancienne %s', '43');
INSERT INTO `chartitlesdbc` VALUES ('75', '7534', 'Flame Warden %s', 'Gardien des flammes %s', 'Flame Warden %s', 'Gardienne des flammes %s', '44');
INSERT INTO `chartitlesdbc` VALUES ('76', '7535', 'Flame Keeper %s', 'Garde-flammes %s', 'Flame Keeper %s', 'Garde-flammes %s', '45');
INSERT INTO `chartitlesdbc` VALUES ('77', '7565', '%s the Exalted', '%s l\'exalté', '%s the Exalted', '%s l\'exaltée', '46');
INSERT INTO `chartitlesdbc` VALUES ('78', '7695', '%s the Explorer', '%s l\'explorateur', '%s the Explorer', '%s l\'exploratrice', '47');
INSERT INTO `chartitlesdbc` VALUES ('79', '7748', '%s the Diplomat', '%s le diplomate', '%s the Diplomat', '%s la diplomate', '48');
INSERT INTO `chartitlesdbc` VALUES ('80', '0', 'Brutal Gladiator %s', 'Gladiateur brutal %s', 'Brutal Gladiator %s', 'Gladiateur brutal %s', '49');
INSERT INTO `chartitlesdbc` VALUES ('81', '7759', '%s the Seeker', 'Chercheur %s', '%s the Seeker', 'Chercheuse %s', '42');
INSERT INTO `chartitlesdbc` VALUES ('82', '7749', 'Arena Master %s', 'Maître de l\'arène %s', 'Arena Master %s', 'Maître de l\'arène %s', '50');
INSERT INTO `chartitlesdbc` VALUES ('83', '7750', 'Salty %s', 'Loup de mer %s', 'Salty %s', 'Louve de mer %s', '51');
INSERT INTO `chartitlesdbc` VALUES ('84', '7754', 'Chef %s', 'Chef %s', 'Chef %s', 'Chef %s', '52');
INSERT INTO `chartitlesdbc` VALUES ('85', '7703', '%s the Supreme', '%s le suprême', '%s the Supreme', '%s la suprême', '53');
INSERT INTO `chartitlesdbc` VALUES ('86', '7703', '%s of the Ten Storms', '%s des dix tempêtes', '%s of the Ten Storms', '%s des dix tempêtes', '54');
INSERT INTO `chartitlesdbc` VALUES ('87', '7703', '%s of the Emerald Dream', '%s du Rêve d\'émeraude', '%s of the Emerald Dream', '%s du Rêve d\'émeraude', '55');
INSERT INTO `chartitlesdbc` VALUES ('89', '7703', 'Prophet %s', 'Prophète %s', 'Prophet %s', 'Prophète %s', '57');
INSERT INTO `chartitlesdbc` VALUES ('90', '7703', '%s the Malefic', '%s le maléfique', '%s the Malefic', '%s la maléfique', '58');
INSERT INTO `chartitlesdbc` VALUES ('91', '7703', 'Stalker %s', 'Traqueur %s', 'Stalker %s', 'Traqueuse %s', '59');
INSERT INTO `chartitlesdbc` VALUES ('92', '7703', '%s of the Ebon Blade', '%s de la Lame d\'ébène', '%s of the Ebon Blade', '%s de la Lame d\'ébène', '60');
INSERT INTO `chartitlesdbc` VALUES ('93', '7703', 'Archmage %s', 'Archimage %s', 'Archmage %s', 'Archimage %s', '61');
INSERT INTO `chartitlesdbc` VALUES ('94', '7703', 'Warbringer %s', 'Porteguerre %s', 'Warbringer %s', 'Porteguerre %s', '62');
INSERT INTO `chartitlesdbc` VALUES ('95', '7703', 'Assassin %s', 'Assassin %s', 'Assassin %s', 'Assassin %s', '63');
INSERT INTO `chartitlesdbc` VALUES ('96', '7703', 'Grand Master Alchemist %s', 'Grand maître alchimiste %s', 'Grand Master Alchemist %s', 'Grand maître alchimiste %s', '64');
INSERT INTO `chartitlesdbc` VALUES ('97', '7703', 'Grand Master Blacksmith %s', 'Grand maître forgeron %s', 'Grand Master Blacksmith %s', 'Grand maître forgeron %s', '65');
INSERT INTO `chartitlesdbc` VALUES ('98', '7703', 'Iron Chef %s', 'Cordon bleu %s', 'Iron Chef %s', 'Cordon bleu %s', '66');
INSERT INTO `chartitlesdbc` VALUES ('99', '7703', 'Grand Master Enchanter %s', 'Grand maître enchanteur %s', 'Grand Master Enchanter %s', 'Grand maître enchanteur %s', '67');
INSERT INTO `chartitlesdbc` VALUES ('100', '7703', 'Grand Master Engineer %s', 'Grand maître ingénieur %s', 'Grand Master Engineer %s', 'Grand maître ingénieur %s', '68');
INSERT INTO `chartitlesdbc` VALUES ('101', '7703', 'Doctor %s', 'Docteur %s', 'Doctor %s', 'Docteur %s', '69');
INSERT INTO `chartitlesdbc` VALUES ('102', '7703', 'Grand Master Angler %s', 'Grand maître pêcheur %s', 'Grand Master Angler %s', 'Grand maître pêcheur %s', '70');
INSERT INTO `chartitlesdbc` VALUES ('103', '7703', 'Grand Master Herbalist %s', 'Grand maître herboriste %s', 'Grand Master Herbalist %s', 'Grand maître herboriste %s', '71');
INSERT INTO `chartitlesdbc` VALUES ('104', '7703', 'Grand Master Scribe %s', 'Grand maître scribe %s', 'Grand Master Scribe %s', 'Grand maître scribe %s', '72');
INSERT INTO `chartitlesdbc` VALUES ('105', '7703', 'Grand Master Jewelcrafter %s', 'Grand maître joaillier %s', 'Grand Master Jewelcrafter %s', 'Grand maître joaillier %s', '73');
INSERT INTO `chartitlesdbc` VALUES ('106', '7703', 'Grand Master Leatherworker %s', 'Grand maître travailleur du cuir %s', 'Grand Master Leatherworker %s', 'Grand maître travailleur du cuir %s', '74');
INSERT INTO `chartitlesdbc` VALUES ('107', '7703', 'Grand Master Miner %s', 'Grand maître mineur %s', 'Grand Master Miner %s', 'Grand maître mineur %s', '75');
INSERT INTO `chartitlesdbc` VALUES ('108', '7703', 'Grand Master Skinner %s', 'Grand maître dépeceur %s', 'Grand Master Skinner %s', 'Grand maître dépeceur %s', '76');
INSERT INTO `chartitlesdbc` VALUES ('109', '7703', 'Grand Master Tailor %s', 'Grand maître tailleur %s', 'Grand Master Tailor %s', 'Grand maître tailleur %s', '77');
INSERT INTO `chartitlesdbc` VALUES ('110', '7703', '%s of Quel\'Thalas', '%s de Quel\'Thalas', '%s of Quel\'Thalas', '%s de Quel\'Thalas', '78');
INSERT INTO `chartitlesdbc` VALUES ('111', '7703', '%s of Argus', '%s d\'Argus', '%s of Argus', '%s d\'Argus', '79');
INSERT INTO `chartitlesdbc` VALUES ('112', '7703', '%s of Khaz Modan', '%s de Khaz Modan', '%s of Khaz Modan', '%s de Khaz Modan', '80');
INSERT INTO `chartitlesdbc` VALUES ('113', '8236', '%s of Gnomeregan', '%s de Gnomeregan', '%s of Gnomeregan', '%s de Gnomeregan', '81');
INSERT INTO `chartitlesdbc` VALUES ('114', '7703', '%s the Lion Hearted', '%s au cœur de lion', '%s the Lion Hearted', '%s au cœur de lion', '82');
INSERT INTO `chartitlesdbc` VALUES ('115', '7703', '%s, Champion of Elune', '%s, champion d\'Elune', '%s, Champion of Elune', '%s, championne d\'Elune', '83');
INSERT INTO `chartitlesdbc` VALUES ('116', '7703', '%s, Hero of Orgrimmar', '%s, héros d\'Orgrimmar', '%s, Hero of Orgrimmar', '%s, héroïne d\'Orgrimmar', '84');
INSERT INTO `chartitlesdbc` VALUES ('117', '7703', 'Plainsrunner %s', '%s le coureur des plaines', 'Plainsrunner %s', '%s la coureuse des plaines', '85');
INSERT INTO `chartitlesdbc` VALUES ('118', '7703', '%s of the Darkspear', '%s des Sombrelances', '%s of the Darkspear', '%s des Sombrelances', '86');
INSERT INTO `chartitlesdbc` VALUES ('119', '7703', '%s the Forsaken', '%s le réprouvé', '%s the Forsaken', '%s la réprouvée', '87');
INSERT INTO `chartitlesdbc` VALUES ('120', '7812', '%s the Magic Seeker', '%s le cherche-magie', '%s the Magic Seeker', '%s la cherche-magie', '88');
INSERT INTO `chartitlesdbc` VALUES ('121', '7813', 'Twilight Vanquisher %s', 'Vainqueur du crépuscule %s', 'Twilight Vanquisher %s', 'Vainqueur du crépuscule %s', '89');
INSERT INTO `chartitlesdbc` VALUES ('122', '7814', '%s, Conqueror of Naxxramas', '%s, conquérant de Naxxramas', '%s, Conqueror of Naxxramas', '%s, conquérante de Naxxramas', '90');
INSERT INTO `chartitlesdbc` VALUES ('123', '7815', '%s, Hero of Northrend', '%s, héros du Norfendre', '%s, Hero of Northrend', '%s, héroïne du Norfendre', '91');
INSERT INTO `chartitlesdbc` VALUES ('124', '7820', '%s the Hallowed', '%s le Sanssaint', '%s the Hallowed', '%s la Sanssainte', '92');
INSERT INTO `chartitlesdbc` VALUES ('125', '7849', 'Loremaster %s', 'Maître des traditions %s', 'Loremaster %s', 'Maître des traditions %s', '93');
INSERT INTO `chartitlesdbc` VALUES ('126', '7853', '%s of the Alliance', '%s de l\'Alliance', '%s of the Alliance', '%s de l\'Alliance', '94');
INSERT INTO `chartitlesdbc` VALUES ('127', '7854', '%s of the Horde', '%s de la Horde', '%s of the Horde', '%s de la Horde', '95');
INSERT INTO `chartitlesdbc` VALUES ('128', '7856', '%s the Flawless Victor', '%s l\'infaillible vainqueur', '%s the Flawless Victor', '%s l\'infaillible vainqueur', '96');
INSERT INTO `chartitlesdbc` VALUES ('129', '7857', '%s, Champion of the Frozen Wastes', '%s, champion des terres gelées', '%s, Champion of the Frozen Wastes', '%s, championne des terres gelées', '97');
INSERT INTO `chartitlesdbc` VALUES ('130', '7858', 'Ambassador %s', 'Ambassadeur %s', 'Ambassador %s', 'Ambassadrice %s', '98');
INSERT INTO `chartitlesdbc` VALUES ('131', '7859', '%s the Argent Champion', '%s, champion d\'argent', '%s the Argent Champion', '%s, championne d\'argent', '99');
INSERT INTO `chartitlesdbc` VALUES ('132', '7860', '%s, Guardian of Cenarius', '%s, gardien de Cénarius', '%s, Guardian of Cenarius', '%s, gardienne de Cénarius', '100');
INSERT INTO `chartitlesdbc` VALUES ('133', '7861', 'Brewmaster %s', 'Maître brasseur %s', 'Brewmaster %s', 'Maître brasseur %s', '101');
INSERT INTO `chartitlesdbc` VALUES ('134', '7864', 'Merrymaker %s', '%s le joyeux', 'Merrymaker %s', '%s la joyeuse', '102');
INSERT INTO `chartitlesdbc` VALUES ('135', '7875', '%s the Love Fool', '%s au cœur d\'artichaut', '%s the Love Fool', '%s au cœur d\'artichaut', '103');
INSERT INTO `chartitlesdbc` VALUES ('137', '7893', 'Matron %s', 'Marraine %s', 'Matron %s', 'Marraine %s', '104');
INSERT INTO `chartitlesdbc` VALUES ('138', '7894', 'Patron %s', 'Parrain %s', 'Patron %s', 'Parrain %s', '105');
INSERT INTO `chartitlesdbc` VALUES ('139', '7964', 'Obsidian Slayer %s', '%s, tueur de l\'obsidien', 'Obsidian Slayer %s', '%s, tueuse de l\'obsidien', '106');
INSERT INTO `chartitlesdbc` VALUES ('140', '7965', '%s of the Nightfall', '%s du crépuscule', '%s of the Nightfall', '%s du crépuscule', '107');
INSERT INTO `chartitlesdbc` VALUES ('141', '7990', '%s the Immortal', '%s l\'immortel', '%s the Immortal', '%s l\'immortelle', '108');
INSERT INTO `chartitlesdbc` VALUES ('142', '7991', '%s the Undying', '%s l\'increvable', '%s the Undying', '%s l\'increvable', '109');
INSERT INTO `chartitlesdbc` VALUES ('143', '7997', '%s Jenkins', '%s Jenkins', '%s Jenkins', '%s Jenkins', '110');
INSERT INTO `chartitlesdbc` VALUES ('144', '8045', 'Bloodsail Admiral %s', 'Amiral de la Voile sanglante %s', 'Bloodsail Admiral %s', 'Amiral de la Voile sanglante %s', '111');
INSERT INTO `chartitlesdbc` VALUES ('145', '8121', '%s the Insane', '%s le grand malade', '%s the Insane', '%s la grande malade', '112');
INSERT INTO `chartitlesdbc` VALUES ('146', '8237', '%s of the Exodar', '%s de l\'Exodar', '%s of the Exodar', '%s de l\'Exodar', '113');
INSERT INTO `chartitlesdbc` VALUES ('147', '8238', '%s of Darnassus', '%s de Darnassus', '%s of Darnassus', '%s de Darnassus', '114');
INSERT INTO `chartitlesdbc` VALUES ('148', '8239', '%s of Ironforge', '%s de Forgefer', '%s of Ironforge', '%s de Forgefer', '115');
INSERT INTO `chartitlesdbc` VALUES ('149', '8240', '%s of Stormwind', '%s de Hurlevent', '%s of Stormwind', '%s de Hurlevent', '116');
INSERT INTO `chartitlesdbc` VALUES ('150', '8241', '%s of Orgrimmar', '%s d\'Orgrimmar', '%s of Orgrimmar', '%s d\'Orgrimmar', '117');
INSERT INTO `chartitlesdbc` VALUES ('151', '8242', '%s of Sen\'jin', '%s de Sen\'jin', '%s of Sen\'jin', '%s de Sen\'jin', '118');
INSERT INTO `chartitlesdbc` VALUES ('152', '8243', '%s of Silvermoon', '%s de Lune-d\'argent', '%s of Silvermoon', '%s de Lune-d\'argent', '119');
INSERT INTO `chartitlesdbc` VALUES ('153', '8244', '%s of Thunder Bluff', '%s des Pitons du Tonnerre', '%s of Thunder Bluff', '%s des Pitons du Tonnerre', '120');
INSERT INTO `chartitlesdbc` VALUES ('154', '8245', '%s of the Undercity', '%s de Fossoyeuse', '%s of the Undercity', '%s de Fossoyeuse', '121');
INSERT INTO `chartitlesdbc` VALUES ('155', '8303', '%s the Noble', 'Noble %s', '%s the Noble', 'Noble %s', '122');
INSERT INTO `chartitlesdbc` VALUES ('156', '8332', 'Crusader %s', 'Croisé %s', 'Crusader %s', 'Croisée %s', '123');
INSERT INTO `chartitlesdbc` VALUES ('157', '0', 'Deadly Gladiator %s', 'Gladiateur fatal %s', 'Deadly Gladiator %s', 'Gladiateur fatal %s', '56');
INSERT INTO `chartitlesdbc` VALUES ('158', '8450', '%s, Death\'s Demise', '%s, faucheur de la Mort', '%s, Death\'s Demise', '%s, faucheuse de la Mort', '124');
INSERT INTO `chartitlesdbc` VALUES ('159', '8451', '%s the Celestial Defender', '%s le défenseur céleste', '%s the Celestial Defender', '%s le défenseur céleste', '125');
INSERT INTO `chartitlesdbc` VALUES ('160', '8453', '%s, Conqueror of Ulduar', '%s, conquérant d\'Ulduar', '%s, Conqueror of Ulduar', '%s, conquérante d\'Ulduar', '126');
INSERT INTO `chartitlesdbc` VALUES ('161', '8452', '%s, Champion of Ulduar', '%s, champion d\'Ulduar', '%s, Champion of Ulduar', '%s, championne d\'Ulduar', '127');
INSERT INTO `chartitlesdbc` VALUES ('163', '0', 'Vanquisher %s', 'Vainqueur %s', 'Vanquisher %s', 'Vainqueur %s', '128');
INSERT INTO `chartitlesdbc` VALUES ('164', '8467', 'Starcaller %s', 'Mande-étoile %s', 'Starcaller %s', 'Mande-étoile %s', '129');
INSERT INTO `chartitlesdbc` VALUES ('165', '8468', '%s the Astral Walker', '%s le marcheur astral', '%s the Astral Walker', '%s la marcheuse astrale', '130');
INSERT INTO `chartitlesdbc` VALUES ('166', '8469', '%s, Herald of the Titans', '%s, héraut des titans', '%s, Herald of the Titans', '%s, héraut des titans', '131');
INSERT INTO `chartitlesdbc` VALUES ('167', '0', 'Furious Gladiator %s', 'Gladiateur furieux %s', 'Furious Gladiator %s', 'Gladiateur furieux %s', '132');
INSERT INTO `chartitlesdbc` VALUES ('168', '8596', '%s the Pilgrim', '%s le pèlerin', '%s the Pilgrim', '%s la pèlerine', '133');
INSERT INTO `chartitlesdbc` VALUES ('169', '0', 'Relentless Gladiator %s', 'Gladiateur implacable %s', 'Relentless Gladiator %s', 'Gladiateur implacable %s', '134');
INSERT INTO `chartitlesdbc` VALUES ('170', '8777', 'Grand Crusader %s', 'Grand croisé %s', 'Grand Crusader %s', 'Grande croisée %s', '135');
INSERT INTO `chartitlesdbc` VALUES ('171', '8778', '%s the Argent Defender', '%s le défenseur d\'argent', '%s the Argent Defender', '%s le défenseur d\'argent', '136');
INSERT INTO `chartitlesdbc` VALUES ('172', '8977', '%s the Patient', '%s l\'assidu', '%s the Patient', '%s l\'assidue', '137');
INSERT INTO `chartitlesdbc` VALUES ('173', '9043', '%s the Light of Dawn', '%s, lumière de l\'aube', '%s the Light of Dawn', '%s, lumière de l\'aube', '138');
INSERT INTO `chartitlesdbc` VALUES ('174', '9045', '%s, Bane of the Fallen King', '%s, tourment du roi déchu', '%s, Bane of the Fallen King', '%s, tourment du roi déchu', '139');
INSERT INTO `chartitlesdbc` VALUES ('175', '9046', '%s the Kingslayer', '%s le régicide', '%s the Kingslayer', '%s la régicide', '140');
INSERT INTO `chartitlesdbc` VALUES ('176', '9138', '%s of the Ashen Verdict', '%s du Verdict des cendres', '%s of the Ashen Verdict', '%s du Verdict des cendres', '141');
INSERT INTO `chartitlesdbc` VALUES ('177', '0', 'Wrathful Gladiator %s', 'Gladiateur courroucé %s', 'Wrathful Gladiator %s', 'Gladiateur courroucé %s', '142');
