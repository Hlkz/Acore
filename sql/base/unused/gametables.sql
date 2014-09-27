-- MySQL dump 10.13  Distrib 5.6.9-rc, for Win64 (x86_64)
--
-- Host: localhost    Database: unused
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
-- Table structure for table `gametables`
--

DROP TABLE IF EXISTS `gametables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametables` (
  `Name` varchar(100) NOT NULL DEFAULT '',
  `NumRows` int(10) NOT NULL DEFAULT '0',
  `NumColumns` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Name`),
  UNIQUE KEY `ID` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametables`
--

LOCK TABLES `gametables` WRITE;
/*!40000 ALTER TABLE `gametables` DISABLE KEYS */;
/*!40000 ALTER TABLE `gametables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `gametables`
--

INSERT INTO `gametables` VALUES ('ExpByLevelDiff', '200', '1');
INSERT INTO `gametables` VALUES ('hpBonusByLevel', '11', '32');
INSERT INTO `gametables` VALUES ('ExpToNextLevel', '100', '1');
INSERT INTO `gametables` VALUES ('energyBonusByLevel', '11', '32');
INSERT INTO `gametables` VALUES ('MonsterACByLevel', '100', '1');
INSERT INTO `gametables` VALUES ('HPPerStaminaByClass', '1', '10');
INSERT INTO `gametables` VALUES ('StatPotionsPerLevelByClass', '5', '10');
INSERT INTO `gametables` VALUES ('RelativeACPerClass', '1', '10');
INSERT INTO `gametables` VALUES ('EnergyPerSpiritByClass', '1', '10');
INSERT INTO `gametables` VALUES ('RelativeClassBaseEnergy', '1', '10');
INSERT INTO `gametables` VALUES ('OCTLevelExperience', '100', '6');
INSERT INTO `gametables` VALUES ('OCTBaseHPByClass', '100', '11');
INSERT INTO `gametables` VALUES ('OCTNPCExpectedStamina', '100', '11');
INSERT INTO `gametables` VALUES ('OCTHPFromItems', '100', '11');
INSERT INTO `gametables` VALUES ('OCTNPCHPScaler', '100', '1');
INSERT INTO `gametables` VALUES ('OCTRaceStats', '5', '11');
INSERT INTO `gametables` VALUES ('OCTClassStats', '5', '11');
INSERT INTO `gametables` VALUES ('OCTNPCExpectedAgility', '100', '11');
INSERT INTO `gametables` VALUES ('OCTNPCExpectedIntellect', '100', '11');
INSERT INTO `gametables` VALUES ('OCTNPCExpectedStrength', '100', '11');
INSERT INTO `gametables` VALUES ('OCTChanceToDodge', '100', '11');
INSERT INTO `gametables` VALUES ('OCTChanceToBlock', '100', '11');
INSERT INTO `gametables` VALUES ('OCTChanceToEvade', '100', '11');
INSERT INTO `gametables` VALUES ('OCTNPCDpsScaler', '100', '1');
INSERT INTO `gametables` VALUES ('OCTHPPerStamina', '100', '11');
INSERT INTO `gametables` VALUES ('OCTBaseMPByClass', '100', '11');
INSERT INTO `gametables` VALUES ('OCTMPPerSpirit', '100', '11');
INSERT INTO `gametables` VALUES ('OCTNPCExpectedSpirit', '100', '11');
INSERT INTO `gametables` VALUES ('OCTMPFromItems', '100', '11');
INSERT INTO `gametables` VALUES ('OCTRegenHP', '100', '11');
INSERT INTO `gametables` VALUES ('OCTRegenMP', '100', '11');
INSERT INTO `gametables` VALUES ('OCTChanceToParry', '100', '11');
INSERT INTO `gametables` VALUES ('XPGroupBonus', '40', '2');
INSERT INTO `gametables` VALUES ('RegenHPPerSpt', '100', '11');
INSERT INTO `gametables` VALUES ('RegenMPPerSpt', '100', '11');
INSERT INTO `gametables` VALUES ('ResistanceInnateFire', '100', '11');
INSERT INTO `gametables` VALUES ('ResistanceInnateFrost', '100', '11');
INSERT INTO `gametables` VALUES ('ResistanceInnateHoly', '100', '11');
INSERT INTO `gametables` VALUES ('ResistanceInnateNature', '100', '11');
INSERT INTO `gametables` VALUES ('ResistanceInnateShadow', '100', '11');
INSERT INTO `gametables` VALUES ('BonusDamageFromStats', '5', '11');
INSERT INTO `gametables` VALUES ('OCTNPCExpectedResistHoly', '100', '11');
INSERT INTO `gametables` VALUES ('OCTNPCExpectedResistFire', '100', '11');
INSERT INTO `gametables` VALUES ('OCTNPCExpectedResistNature', '100', '11');
INSERT INTO `gametables` VALUES ('OCTNPCExpectedResistFrost', '100', '11');
INSERT INTO `gametables` VALUES ('OCTNPCExpectedResistShadow', '100', '11');
INSERT INTO `gametables` VALUES ('OCTNPCExpectedResistPhysical', '100', '11');
INSERT INTO `gametables` VALUES ('OCTMPPerIntellect', '100', '11');
INSERT INTO `gametables` VALUES ('NpcTotalHp', '100', '11');
INSERT INTO `gametables` VALUES ('RageGenScaler', '100', '1');
INSERT INTO `gametables` VALUES ('AttackPower', '100', '11');
INSERT INTO `gametables` VALUES ('NpcTotalMp', '100', '11');
INSERT INTO `gametables` VALUES ('ShapeshiftDPS', '100', '32');
INSERT INTO `gametables` VALUES ('PCBaseAgility', '22', '12');
INSERT INTO `gametables` VALUES ('PCBaseIntellect', '22', '12');
INSERT INTO `gametables` VALUES ('PCBaseSpirit', '22', '12');
INSERT INTO `gametables` VALUES ('PCBaseStamina', '22', '12');
INSERT INTO `gametables` VALUES ('PCBaseStrength', '22', '12');
INSERT INTO `gametables` VALUES ('ShieldBlockRegular', '300', '8');
INSERT INTO `gametables` VALUES ('ShieldBlockBuckler', '300', '8');
INSERT INTO `gametables` VALUES ('NPCManaCostScaler', '100', '1');
INSERT INTO `gametables` VALUES ('AttackPowerRanged', '100', '11');
INSERT INTO `gametables` VALUES ('ChanceToMeleeCrit', '100', '11');
INSERT INTO `gametables` VALUES ('ChanceToSpellCrit', '100', '11');
INSERT INTO `gametables` VALUES ('ChanceToMeleeCritBase', '1', '11');
INSERT INTO `gametables` VALUES ('ChanceToSpellCritBase', '1', '11');
INSERT INTO `gametables` VALUES ('ChanceToDodgeBase', '1', '11');
INSERT INTO `gametables` VALUES ('PCExpectedStrength', '100', '11');
INSERT INTO `gametables` VALUES ('PCExpectedStamina', '100', '11');
INSERT INTO `gametables` VALUES ('PCExpectedAgility', '100', '11');
INSERT INTO `gametables` VALUES ('PCExpectedIntellect', '100', '11');
INSERT INTO `gametables` VALUES ('PCExpectedSpirit', '100', '11');
INSERT INTO `gametables` VALUES ('PVPRanks', '18', '1');
INSERT INTO `gametables` VALUES ('NpcTotalHpExp1', '100', '11');
INSERT INTO `gametables` VALUES ('NpcDamageByClass', '100', '11');
INSERT INTO `gametables` VALUES ('NpcDamageByClassExp1', '100', '11');
INSERT INTO `gametables` VALUES ('CombatRatings', '100', '32');
INSERT INTO `gametables` VALUES ('NpcTotalHpExp2', '100', '11');
INSERT INTO `gametables` VALUES ('NpcDamageByClassExp2', '100', '11');
INSERT INTO `gametables` VALUES ('BarberShopCostBase', '100', '1');
INSERT INTO `gametables` VALUES ('NPCExpectedResistPhysExp1', '100', '11');
INSERT INTO `gametables` VALUES ('NPCExpectedResistPhysExp2', '100', '11');
INSERT INTO `gametables` VALUES ('OCTClassCombatRatingScalar', '32', '11');
INSERT INTO `gametables` VALUES ('NpcTotalHpExp3', '100', '11');
INSERT INTO `gametables` VALUES ('NpcDamageByClassExp3', '100', '11');
INSERT INTO `gametables` VALUES ('NPCExpectedResistPhysExp3', '100', '11');
INSERT INTO `gametables` VALUES ('SpellScaling', '100', '11');
