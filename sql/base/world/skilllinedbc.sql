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
-- Table structure for table `skilllinedbc`
--

DROP TABLE IF EXISTS `skilllinedbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skilllinedbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `CategoryId` int(10) NOT NULL DEFAULT '0',
  `SkillCostId` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) NOT NULL DEFAULT '',
  `Description` varchar(400) NOT NULL DEFAULT '',
  `Description_loc2` varchar(400) NOT NULL DEFAULT '',
  `SpellIcon` int(10) NOT NULL DEFAULT '0',
  `AlternateVerb` varchar(100) NOT NULL DEFAULT '',
  `AlternateVerb_loc2` varchar(100) NOT NULL DEFAULT '',
  `CanLink` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skilllinedbc`
--

LOCK TABLES `skilllinedbc` WRITE;
/*!40000 ALTER TABLE `skilllinedbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `skilllinedbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `skilllinedbc`
--

INSERT INTO `skilllinedbc` VALUES ('6', '7', '0', 'Frost', 'Givre', '', '', '188', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('8', '7', '0', 'Fire', 'Feu', '', '', '183', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('26', '7', '0', 'Arms', 'Armes', '', '', '514', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('38', '7', '0', 'Combat', 'Combat', '', '', '243', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('39', '7', '0', 'Subtlety', 'Finesse', '', '', '250', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('43', '6', '0', 'Swords', 'Epées', 'Higher weapon skill increases your chance to hit.', 'Une compétence d’arme plus élévée augmente vos chances de toucher.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('44', '6', '0', 'Axes', 'Haches', 'Higher weapon skill increases your chance to hit.', 'Une compétence d’arme plus élévée augmente vos chances de toucher.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('45', '6', '0', 'Bows', 'Arcs', 'Higher weapon skill increases your chance to hit.', 'Une compétence d’arme plus élévée augmente vos chances de toucher.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('46', '6', '0', 'Guns', 'Armes à feu', 'Higher weapon skill increases your chance to hit.', 'Une compétence d’arme plus élévée augmente vos chances de toucher.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('50', '7', '0', 'Beast Mastery', 'Maîtrise des bêtes', '', '', '255', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('51', '7', '0', 'Survival', 'Survie', '', '', '257', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('54', '6', '0', 'Maces', 'Masse', 'Higher weapon skill increases your chance to hit.', 'Une compétence d’arme plus élévée augmente vos chances de toucher.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('55', '6', '0', 'Two-Handed Swords', 'Epées à deux mains', 'Higher weapon skill increases your chance to hit.', 'Une compétence d’arme plus élévée augmente vos chances de toucher.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('56', '7', '0', 'Holy', 'Sacré', '', '', '70', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('78', '7', '0', 'Shadow Magic', 'Magie de l\'ombre', '', '', '234', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('95', '6', '0', 'Defense', 'Défense', 'Higher defense improves your chance to dodge, parry, and block attacks, makes you harder to hit,  and makes monsters less likely to land a critical strike against you.', 'Une plus haute défense améliore vos chances d\'esquiver, de parer ou de bloquer, vous rend plus difficile à toucher et diminue les chances que les monstres vous infligent un coup critique.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('98', '10', '0', 'Language: Common', 'Langue : commun', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('101', '9', '0', 'Dwarven Racial', 'Raciale nain', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('109', '10', '0', 'Language: Orcish', 'Langue : orc', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('111', '10', '0', 'Language: Dwarven', 'Langue : nain', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('113', '10', '0', 'Language: Darnassian', 'Langue : darnassien', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('115', '10', '0', 'Language: Taurahe', 'Langue : taurahe', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('118', '6', '0', 'Dual Wield', 'Ambidextrie', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('124', '9', '0', 'Tauren Racial', 'Raciale tauren', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('125', '9', '0', 'Orc Racial', 'Raciale orc', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('126', '9', '0', 'Night Elf Racial', 'Raciale elfe de la nuit', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('129', '9', '0', 'First Aid', 'Secourisme', 'Higher first aid skill allows you to learn higher level first aid abilities.  First aid abilities can be found on trainers around the world as well as from quests and as drops from monsters.', 'Une compétence plus élevée en secourisme vous permet d\'apprendre à mieux soigner. Il est possible d\'augmenter cette compétence grâce à des professeurs, aux monstres que vous tuez ou en récompense de quêtes.', '504', '', '', '1');
INSERT INTO `skilllinedbc` VALUES ('134', '7', '0', 'Feral Combat', 'Combat farouche', '', '', '107', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('136', '6', '0', 'Staves', 'Bâtons', 'Higher weapon skill increases your chance to hit.', 'Une compétence d’arme plus élévée augmente vos chances de toucher.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('137', '10', '0', 'Language: Thalassian', 'Langue : thalassien', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('138', '10', '0', 'Language: Draconic', 'Langue : draconique', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('139', '10', '0', 'Language: Demon Tongue', 'Langue : démoniaque', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('140', '10', '0', 'Language: Titan', 'Langue : titan', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('141', '10', '0', 'Language: Old Tongue', 'Langue : langue ancienne', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('142', '9', '0', 'Survival', 'Survie', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('148', '9', '0', 'Horse Riding', 'Equitation', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('149', '9', '0', 'Wolf Riding', 'Monte de loup', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('150', '9', '0', 'Tiger Riding', 'Monte de tigre', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('152', '9', '0', 'Ram Riding', 'Monte de bélier', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('155', '9', '0', 'Swimming', 'Natation', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('160', '6', '0', 'Two-Handed Maces', 'Masses à deux mains', 'Higher weapon skill increases your chance to hit.', 'Une compétence d’arme plus élévée augmente vos chances de toucher.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('162', '6', '0', 'Unarmed', 'Mains nues', 'Higher skill increases your chance to hit.', 'Une compétence plus élevée augmente vos chances de toucher.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('163', '7', '0', 'Marksmanship', 'Précision', '', '', '126', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('164', '11', '0', 'Blacksmithing', 'Forge', 'Higher smithing skill allows you to learn higher level smithing plans.  Blacksmithing plans can be found on trainers around the world as well as from quests and monsters.', 'Un plus haut score dans la compétence forge vous permet d’apprendre des plans plus difficiles. Les plans pour forgerons se trouvent dans le monde entier auprès de maîtres aussi bien qu’en récompense de quêtes ou qu’en butin de monstres.', '335', 'Modify', 'Modifier', '1');
INSERT INTO `skilllinedbc` VALUES ('165', '11', '0', 'Leatherworking', 'Travail du cuir', 'Higher leatherworking skill allows you to learn higher level leatherworking patterns.  Leatherworking patterns can be found on trainers around the world as well as from quests and monsters.', 'Une compétence plus élevée dans le travail du cuir vous permet d\'apprendre des patrons plus difficiles. Ces patrons peuvent être trouvés auprès de maîtres un peu partout dans le monde, sur des monstres ou en récompense de quêtes.', '346', 'Emboss', 'Estamper', '1');
INSERT INTO `skilllinedbc` VALUES ('171', '11', '0', 'Alchemy', 'Alchimie', 'Higher alchemy skill allows you to learn higher level alchemy recipes.  Alchemy recipes can be found on trainers around the world as well as from quests and monsters.', 'Un plus haut score dans la compétence alchimie vous permet d’apprendre des recettes plus difficiles. Les recettes d\'alchimie se trouvent dans le monde entier auprès de maîtres aussi bien qu’en récompense de quêtes ou qu’en butin de monstres.', '339', 'Refill', 'Remplir', '1');
INSERT INTO `skilllinedbc` VALUES ('172', '6', '0', 'Two-Handed Axes', 'Haches à deux mains', 'Higher weapon skill increases your chance to hit.', 'Une compétence d’arme plus élévée augmente vos chances de toucher.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('173', '6', '0', 'Daggers', 'Dagues', 'Higher weapon skill increases your chance to hit.', 'Une compétence d’arme plus élévée augmente vos chances de toucher.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('176', '6', '0', 'Thrown', 'Armes de jet', 'Higher weapon skill increases your chance to hit.', 'Une compétence d’arme plus élévée augmente vos chances de toucher.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('182', '11', '0', 'Herbalism', 'Herboristerie', 'Higher herbalism skill allows you to harvest more difficult herbs around the world.  If you cannot harvest a specific herb, then increase your skill by harvesting easier to gather herbs in lower level areas.', 'Une compétence plus élevée en Herboristerie vous permet de récolter des herbes plus difficiles. Si vous ne pouvez pas récolter une herbe donnée, augmentez votre score en récoltant des herbes plus accessibles dans des zones de niveau inférieur.', '345', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('183', '12', '0', 'GENERIC (DND)', 'GENERIQUE (DND)', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('184', '7', '0', 'Retribution', 'Vindicte', '', '', '555', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('185', '9', '0', 'Cooking', 'Cuisine', 'Higher cooking skill allows you to learn higher level cooking recipes.  Recipes can be found on trainers around the world as well as from quests and as drops from monsters.', 'Un plus haut score dans la compétence cuisine vous permet d’apprendre des recettes plus difficiles. Les recettes de cuisine se trouvent dans le monde entier auprès de maîtres aussi bien qu’en récompense de quêtes ou qu’en butin de monstres.', '1467', '', '', '1');
INSERT INTO `skilllinedbc` VALUES ('186', '11', '0', 'Mining', 'Minage', 'Higher mining skill allows you to harvest more difficult minerals nodes around the world.  If you cannot harvest a specific mineral, then increase your skill by mining easier to mine minerals in lower level areas.', 'Une compétence plus élevée en minage vous permet de récolter des minerais plus difficiles. Si vous ne pouvez pas récolter un minerai donné, augmentez votre score en récoltant des minerais plus accessibles dans des zones de niveau inférieur.', '2418', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('188', '7', '0', 'Pet - Imp', 'Familier - diablotin', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('189', '7', '0', 'Pet - Felhunter', 'Familier - chasseur corrompu', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('197', '11', '0', 'Tailoring', 'Couture', 'Higher tailoring skill allows you to learn higher level tailoring patterns.  Tailoring patterns can be found on trainers around the world as well as from quests and monsters.', 'Un plus haut score dans la compétence couture vous permet d’apprendre des patrons plus difficiles. Les patrons de couture se trouvent dans le monde entier auprès de maîtres aussi bien qu’en récompense de quêtes ou qu’en butin de monstres.', '341', 'Embroider', 'Broder', '1');
INSERT INTO `skilllinedbc` VALUES ('202', '11', '0', 'Engineering', 'Ingénierie', 'Higher engineering skill allows you to learn higher level engineering schematics.  Schematics can be found on trainers around the world as well as from quests and monsters.', 'Un plus haut score dans la compétence ingénierie vous permet d’apprendre des schémas plus difficiles. Les schémas pour ingénieurs se trouvent dans le monde entier auprès de maîtres aussi bien qu’en récompense de quêtes ou qu’en butin de monstres.', '333', 'Tinker', 'Bricoler', '1');
INSERT INTO `skilllinedbc` VALUES ('203', '7', '0', 'Pet - Spider', 'Familier - araignée', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('204', '7', '0', 'Pet - Voidwalker', 'Familier - marcheur du Vide', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('205', '7', '0', 'Pet - Succubus', 'Familier - succube', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('206', '7', '0', 'Pet - Infernal', 'Familier - infernal', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('207', '7', '0', 'Pet - Doomguard', 'Familier - garde funeste', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('208', '7', '0', 'Pet - Wolf', 'Familier - loup', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('209', '7', '0', 'Pet - Cat', 'Familier - félin', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('210', '7', '0', 'Pet - Bear', 'Familier - ours', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('211', '7', '0', 'Pet - Boar', 'Familier - sanglier', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('212', '7', '0', 'Pet - Crocolisk', 'Familier - crocilisque', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('213', '7', '0', 'Pet - Carrion Bird', 'Familier - charognard', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('214', '7', '0', 'Pet - Crab', 'Familier - crabe', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('215', '7', '0', 'Pet - Gorilla', 'Familier - gorille', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('217', '7', '0', 'Pet - Raptor', 'Familier - raptor', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('218', '7', '0', 'Pet - Tallstrider', 'Familier - haut-trotteur', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('220', '9', '0', 'Racial - Undead', 'Racial - mort-vivant', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('226', '6', '0', 'Crossbows', 'Arbalètes', 'Higher weapon skill increases your chance to hit.', 'Une compétence d’arme plus élévée augmente vos chances de toucher.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('228', '6', '0', 'Wands', 'Baguettes', 'Higher weapon skill increases your chance to hit.', 'Une compétence d’arme plus élévée augmente vos chances de toucher.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('229', '6', '0', 'Polearms', 'Armes d\'hast', 'Higher weapon skill increases your chance to hit.', 'Une compétence d’arme plus élévée augmente vos chances de toucher.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('236', '7', '0', 'Pet - Scorpid', 'Familier - scorpide', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('237', '7', '0', 'Arcane', 'Arcanes', '', '', '125', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('251', '7', '0', 'Pet - Turtle', 'Familier - tortue', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('253', '7', '0', 'Assassination', 'Assassinat', '', '', '514', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('256', '7', '0', 'Fury', 'Fureur', '', '', '561', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('257', '7', '0', 'Protection', 'Protection', '', '', '276', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('267', '7', '0', 'Protection', 'Protection', '', '', '291', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('270', '7', '0', 'Pet - Generic Hunter', 'Familier - générique chasseur', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('293', '8', '0', 'Plate Mail', 'Armure en plaques', 'Allows the wearing of plate armor.', 'Permet de porter des armures de plaques.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('313', '10', '0', 'Language: Gnomish', 'Langue : gnome', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('315', '10', '0', 'Language: Troll', 'Langue : troll', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('333', '11', '0', 'Enchanting', 'Enchantement', 'Higher enchanting skill allows you to learn more powerful formulae.  Formulae can be found on trainers around the world as well as from quests and monsters.', 'Une compétence plus élevée en enchantement vous permet d\'apprendre des formules plus puissantes. Ces formules peuvent être trouvées auprès de maîtres un peu partout dans le monde, sur des monstres ou en récompense de quêtes.', '578', 'Enchant', 'Enchanter', '1');
INSERT INTO `skilllinedbc` VALUES ('354', '7', '0', 'Demonology', 'Démonologie', '', '', '90', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('355', '7', '0', 'Affliction', 'Affliction', '', '', '88', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('356', '9', '0', 'Fishing', 'Pêche', 'Higher fishing skill increases your chance of catching fish in bodies of water around the world.  If you are having trouble catching fish in a given area, move to a lower level area or purchase a fishing lure and try again.', 'Un plus haut score dans la compétence pêche augmente vos chances d\'attraper des poissons dans le monde. Si vous n\'arrivez pas à pêcher dans une zone spécifique, allez dans des zones de plus bas niveau ou utilisez des appâts.', '580', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('373', '7', '0', 'Enhancement', 'Amélioration', '', '', '19', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('374', '7', '0', 'Restoration', 'Restauration', '', '', '13', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('375', '7', '0', 'Elemental Combat', 'Combat élémentaire', '', '', '62', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('393', '11', '0', 'Skinning', 'Dépeçage', 'Higher skinning skill allows you to skin hides from higher level monsters around the world.    Once your skill is above 100, you can divide your skill by 5 to determine the highest level of monster you can skin.', 'Une compétence en dépeçage plus élevée vous permet de récolter les peaux de monstres plus puissants. Une fois que votre compétence dépasse 100, vous pouvez la diviser par 5 pour connaître le niveau maximum des monstres que vous pouvez dépecer.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('413', '8', '0', 'Mail', 'Mailles', 'Allows the wearing of mail armor.', 'Permet de porter des armures de mailles.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('414', '8', '0', 'Leather', 'Cuir', 'Allows the wearing of leather armor.', 'Permet de porter des armures en cuir.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('415', '8', '0', 'Cloth', 'Tissu', 'Allows the wearing of cloth armor.', 'Permet de porter des armures en tissu.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('433', '8', '0', 'Shield', 'Bouclier', 'Allows the use of shields.', 'Permet d’utiliser des boucliers.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('473', '6', '0', 'Fist Weapons', 'Armes de pugilat', 'Allows for the use of fist weapons.  Chance to hit is determined by the Unarmed skill.', 'Permet l\'utilisation des armes de pugilat. Les chances de toucher sont déterminées par la compétence Mains nues.', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('533', '9', '0', 'Raptor Riding', 'Monte de raptor', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('553', '9', '0', 'Mechanostrider Piloting', 'Pilotage de mécanotrotteur', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('554', '9', '0', 'Undead Horsemanship', 'Monte de cheval squelette', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('573', '7', '0', 'Restoration', 'Restauration', '', '', '962', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('574', '7', '0', 'Balance', 'Equilibre', '', '', '225', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('593', '7', '0', 'Destruction', 'Destruction', '', '', '547', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('594', '7', '0', 'Holy', 'Sacré', '', '', '70', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('613', '7', '0', 'Discipline', 'Discipline', '', '', '685', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('633', '7', '0', 'Lockpicking', 'Crochetage', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('653', '7', '0', 'Pet - Bat', 'Familier - chauve-souris', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('654', '7', '0', 'Pet - Hyena', 'Familier - hyène', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('655', '7', '0', 'Pet - Bird of Prey', 'Familier - oiseau de proie', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('656', '7', '0', 'Pet - Wind Serpent', 'Familier - serpent des vents', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('673', '10', '0', 'Language: Gutterspeak', 'Langue : bas-parler', '', '', '1', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('713', '9', '0', 'Kodo Riding', 'Monte de kodo', '', '', '317', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('733', '9', '0', 'Racial - Troll', 'Racial - troll', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('753', '9', '0', 'Racial - Gnome', 'Racial - gnome', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('754', '9', '0', 'Racial - Human', 'Racial - humain', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('755', '11', '0', 'Jewelcrafting', 'Joaillerie', 'Higher jewelcrafting skill allows you to learn higher level jewelcrafting plans.  Jewelcrafting plans can be found on trainers around the world as well as from quests and monsters.', 'Une compétence plus élevée en joaillerie vous permet d\'apprendre des dessins de joaillier plus difficiles. Ces dessins peuvent être trouvés auprès de maîtres un peu partout dans le monde, sur des monstres ou en récompense de quêtes.', '1768', 'Modify', 'Modifier', '1');
INSERT INTO `skilllinedbc` VALUES ('756', '9', '0', 'Blood Elf Racial', 'Raciale elfe de sang', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('758', '-1', '0', 'Pet - Event - Remote Control', 'Familier - Evénement - Télécommande', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('759', '10', '0', 'Language: Draenei', 'Langue : draeneï', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('760', '9', '0', 'Draenei Racial', 'Raciale draeneï', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('761', '7', '0', 'Pet - Felguard', 'Familier - gangregarde', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('762', '9', '0', 'Riding', 'Monte', 'Higher riding skill allows you to ride faster and more exotic beasts.', 'Un plus haut score dans la compétence monte vous permet de chevaucher plus vite et sur le dos de créatures plus exotiques.', '255', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('763', '7', '0', 'Pet - Dragonhawk', 'Familier - faucon-dragon', '', '', '1530', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('764', '7', '0', 'Pet - Nether Ray', 'Familier - raie du Néant', '', '', '1577', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('765', '7', '0', 'Pet - Sporebat', 'Familier - sporoptère', '', '', '2033', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('766', '7', '0', 'Pet - Warp Stalker', 'Familier - traqueur dimensionnel', '', '', '1952', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('767', '7', '0', 'Pet - Ravager', 'Familier - ravageur', '', '', '1585', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('768', '7', '0', 'Pet - Serpent', 'Familier - serpent', '', '', '2167', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('769', '7', '22', 'Internal', 'Interne', '', '', '1775', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('770', '7', '0', 'Blood', 'Sang', '', '', '2636', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('771', '7', '0', 'Frost', 'Givre', '', '', '2632', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('772', '7', '0', 'Unholy', 'Impie', '', '', '2633', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('773', '11', '0', 'Inscription', 'Calligraphie', 'Higher inscription skill allows you to learn more advanced inscriptions.  Inscriptions are acquired from learned scribes throughout the world.', 'Une compétence de calligraphie plus élevée vous permet d\'apprendre des calligraphies plus difficiles. Les calligraphies s\'apprennent dans le monde entier auprès de maîtres scribes.', '3267', 'Inscribe', 'Calligraphier', '1');
INSERT INTO `skilllinedbc` VALUES ('775', '7', '0', 'Pet - Moth', 'Familier - phalène', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('776', '7', '0', 'Runeforging', 'Runeforger', '', '', '2727', 'Engrave', 'Graver', '0');
INSERT INTO `skilllinedbc` VALUES ('777', '7', '0', 'Mounts', 'Montures', 'Your mounts.', 'Vos montures', '2224', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('778', '7', '0', 'Companions', 'Compagnons', 'Your companions.', 'Vos compagnons', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('780', '7', '0', 'Pet - Exotic Chimaera', 'Familier - chimère exotique', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('781', '7', '0', 'Pet - Exotic Devlisaur', 'Familieur - diablosaure exotique', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('782', '7', '0', 'Pet - Ghoul', 'Familier - goule', '', '', '221', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('783', '7', '0', 'Pet - Exotic Silithid', 'Familier - silithide exotique', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('784', '7', '0', 'Pet - Exotic Worm', 'Familier - ver exotique', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('785', '7', '0', 'Pet- Wasp', 'Familier - guêpe', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('786', '7', '0', 'Pet - Exotic Rhino', 'Familier - rhinocéros exotique', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('787', '7', '0', 'Pet - Exotic Core Hound', 'Familier - chien du Magma exotique', '', '', '0', '', '', '0');
INSERT INTO `skilllinedbc` VALUES ('788', '5', '0', 'Pet - Exotic Spirit Beast', 'Familier - esprit de bête exotique', '', '', '0', '', '', '0');
