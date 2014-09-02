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
-- Table structure for table `totemcategorydbc`
--

DROP TABLE IF EXISTS `totemcategorydbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `totemcategorydbc` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Name_loc2` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `NameFlags` int(10) NOT NULL DEFAULT '0',
  `CategoryType` int(10) NOT NULL DEFAULT '0',
  `CategoryMask` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ID` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `totemcategorydbc`
--

LOCK TABLES `totemcategorydbc` WRITE;
/*!40000 ALTER TABLE `totemcategorydbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `totemcategorydbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `totemcategorydbc`
--

INSERT INTO `totemcategorydbc` VALUES ('1', 'Skinning Knife (OLD)', 'Couteau à dépecer (OLD)', '16712190', '1', '1');
INSERT INTO `totemcategorydbc` VALUES ('2', 'Earth Totem', 'Totem de terre', '16712190', '2', '1');
INSERT INTO `totemcategorydbc` VALUES ('3', 'Air Totem', 'Totem d\'air', '16712190', '2', '2');
INSERT INTO `totemcategorydbc` VALUES ('4', 'Fire Totem', 'Totem de feu', '16712190', '2', '4');
INSERT INTO `totemcategorydbc` VALUES ('5', 'Water Totem', 'Totem d\'eau', '16712190', '2', '8');
INSERT INTO `totemcategorydbc` VALUES ('6', 'Runed Copper Rod', 'Bâtonnet runique en cuivre', '16712190', '3', '1');
INSERT INTO `totemcategorydbc` VALUES ('7', 'Runed Silver Rod', 'Bâtonnet runique en argent', '16712190', '3', '3');
INSERT INTO `totemcategorydbc` VALUES ('8', 'Runed Golden Rod', 'Bâtonnet runique en or', '16712190', '3', '7');
INSERT INTO `totemcategorydbc` VALUES ('9', 'Runed Truesilver Rod', 'Bâtonnet runique en vrai-argent', '16712190', '3', '15');
INSERT INTO `totemcategorydbc` VALUES ('10', 'Runed Arcanite Rod', 'Bâtonnet runique en arcanite', '16712190', '3', '31');
INSERT INTO `totemcategorydbc` VALUES ('11', 'Mining Pick (OLD)', 'Pioche de mineur (OLD)', '16712190', '21', '1');
INSERT INTO `totemcategorydbc` VALUES ('12', 'Philosopher\'s Stone', 'Pierre philosophale', '16712190', '22', '1');
INSERT INTO `totemcategorydbc` VALUES ('13', 'Blacksmith Hammer (OLD)', 'Marteau de forgeron (VIEUX)', '16712190', '23', '1');
INSERT INTO `totemcategorydbc` VALUES ('14', 'Arclight Spanner', 'Clé plate', '16712190', '24', '1');
INSERT INTO `totemcategorydbc` VALUES ('15', 'Gyromatic Micro-Adjustor', 'Micro-ajusteur gyromatique', '16712190', '24', '2');
INSERT INTO `totemcategorydbc` VALUES ('21', 'Master Totem', 'Totem maître', '16712190', '2', '15');
INSERT INTO `totemcategorydbc` VALUES ('41', 'Runed Fel Iron Rod', 'Bâtonnet runique en gangrefer', '16712190', '3', '63');
INSERT INTO `totemcategorydbc` VALUES ('62', 'Runed Adamantite Rod', 'Bâtonnet runique en adamantite', '16712190', '3', '127');
INSERT INTO `totemcategorydbc` VALUES ('63', 'Runed Eternium Rod', 'Bâtonnet runique en éternium', '16712190', '3', '255');
INSERT INTO `totemcategorydbc` VALUES ('81', 'Hollow Quill', 'Plume creuse', '16712190', '22', '4');
INSERT INTO `totemcategorydbc` VALUES ('101', 'Runed Azurite Rod', 'Bâtonnet runique en azurite', '16712190', '3', '511');
INSERT INTO `totemcategorydbc` VALUES ('121', 'Virtuoso Inking Set', 'Coffret de calligraphie de virtuose', '16712190', '24', '-2147483648');
INSERT INTO `totemcategorydbc` VALUES ('141', 'Drums', 'Tambours', '16712190', '24', '1073741824');
INSERT INTO `totemcategorydbc` VALUES ('161', 'Gnomish Army Knife', 'Couteau de l\'armée gnome', '16712190', '24', '63');
INSERT INTO `totemcategorydbc` VALUES ('162', 'Blacksmith Hammer', 'Marteau de forgeron', '16712190', '24', '4');
INSERT INTO `totemcategorydbc` VALUES ('165', 'Mining Pick', 'Pioche de mineur', '16712190', '24', '8');
INSERT INTO `totemcategorydbc` VALUES ('166', 'Skinning Knife', 'Couteau à dépecer', '16712190', '24', '16');
INSERT INTO `totemcategorydbc` VALUES ('167', 'Hammer Pick', 'Pioche-marteau', '16712190', '24', '12');
INSERT INTO `totemcategorydbc` VALUES ('168', 'Bladed Pickaxe', 'Pioche à lame', '16712190', '24', '24');
INSERT INTO `totemcategorydbc` VALUES ('169', 'Flint and Tinder', 'Silex et amadou', '16712190', '24', '32');
INSERT INTO `totemcategorydbc` VALUES ('189', 'Runed Cobalt Rod (DO NOT USE)', 'Bâtonnet runique en cobalt (NE PAS UTILISER)', '16712190', '3', '511');
INSERT INTO `totemcategorydbc` VALUES ('190', 'Runed Titanium Rod', 'Bâtonnet runique en titane', '16712190', '3', '1023');
