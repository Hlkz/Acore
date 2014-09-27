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
-- Table structure for table `itemvisualeffects`
--

DROP TABLE IF EXISTS `itemvisualeffects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemvisualeffects` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Model` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemvisualeffects`
--

LOCK TABLES `itemvisualeffects` WRITE;
/*!40000 ALTER TABLE `itemvisualeffects` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemvisualeffects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `itemvisualeffects`
--

INSERT INTO `itemvisualeffects` VALUES ('1', 'Spells\\Enchantments\\BlueGlow_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('2', 'Spells\\Enchantments\\BlueGlow_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('3', 'Spells\\Enchantments\\BlueFlame_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('42', 'Spells\\Enchantments\\SkullBalls.mdx');
INSERT INTO `itemvisualeffects` VALUES ('45', 'Spells\\Enchantments\\RedFlame_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('46', 'Spells\\Enchantments\\PoisonDrip.mdx');
INSERT INTO `itemvisualeffects` VALUES ('47', 'Spells\\Enchantments\\Sparkle_A.mdx');
INSERT INTO `itemvisualeffects` VALUES ('48', 'Spells\\Enchantments\\YellowGlow_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('49', 'Spells\\Enchantments\\Rune_Intellect.mdx');
INSERT INTO `itemvisualeffects` VALUES ('50', 'Spells\\Enchantments\\RedGlow_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('51', 'Spells\\Enchantments\\Shaman_Fire.mdx');
INSERT INTO `itemvisualeffects` VALUES ('52', 'Spells\\Enchantments\\Shaman_Frost.mdx');
INSERT INTO `itemvisualeffects` VALUES ('61', 'Spells\\Enchantments\\');
INSERT INTO `itemvisualeffects` VALUES ('62', 'Spells\\Enchantments\\BlueGlow_Med.mdx');
INSERT INTO `itemvisualeffects` VALUES ('81', 'Spells\\Enchantments\\Shaman_Rock.mdx');
INSERT INTO `itemvisualeffects` VALUES ('101', 'Spells\\Enchantments\\Shaman_Wind.mdx');
INSERT INTO `itemvisualeffects` VALUES ('121', 'Spells\\Enchantments\\RedGlow_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('122', 'Spells\\Enchantments\\YellowGlow_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('123', 'Spells\\Enchantments\\WhiteGlow_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('124', 'Spells\\Enchantments\\WhiteGlow_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('125', 'Spells\\Enchantments\\GreenGlow_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('126', 'Spells\\Enchantments\\GreenGlow_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('127', 'Spells\\Enchantments\\PurpleGlow_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('141', 'Spells\\Enchantments\\PurpleGlow_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('142', 'Spells\\Enchantments\\BlackGlow_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('143', 'Spells\\Enchantments\\BlackGlow_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('144', 'Spells\\Enchantments\\WhiteFlame_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('145', 'Spells\\Enchantments\\GreenFlame_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('146', 'Spells\\Enchantments\\PurpleFlame_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('147', 'Spells\\Enchantments\\YellowFlame_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('148', 'Spells\\Enchantments\\BlackFlame_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('149', 'Spells\\Enchantments\\Shaman_Purple.mdx');
INSERT INTO `itemvisualeffects` VALUES ('150', 'Spells\\Enchantments\\Shaman_Green.mdx');
INSERT INTO `itemvisualeffects` VALUES ('151', 'Spells\\Enchantments\\Shaman_Red.mdx');
INSERT INTO `itemvisualeffects` VALUES ('152', 'Spells\\Enchantments\\Shaman_Yellow.mdx');
INSERT INTO `itemvisualeffects` VALUES ('153', 'Spells\\Lightning_PreCast_Low_Hand.mdx');
INSERT INTO `itemvisualeffects` VALUES ('154', 'Spells\\Lightning_Cast_Hand.mdx');
INSERT INTO `itemvisualeffects` VALUES ('155', 'Spells\\Cyclone_Caster_State.mdx');
INSERT INTO `itemvisualeffects` VALUES ('156', 'Spells\\SlowingStrike_Cast_Hand.mdx');
INSERT INTO `itemvisualeffects` VALUES ('157', 'Spells\\Shadow_Strikes_State_Hand.mdx');
INSERT INTO `itemvisualeffects` VALUES ('158', 'Spells\\Fire_Blue_PreCast_Uber_Hand.mdx');
INSERT INTO `itemvisualeffects` VALUES ('159', 'Spells\\ShamanisticRage_State_Hand.mdx');
INSERT INTO `itemvisualeffects` VALUES ('160', 'Spells\\Fel_Fire_PreCast_Uber_Hand.mdx');
INSERT INTO `itemvisualeffects` VALUES ('161', 'Spells\\FaerieFire.mdx');
INSERT INTO `itemvisualeffects` VALUES ('162', 'Spells\\Firework_RomanCandle_Missle_01.mdx');
INSERT INTO `itemvisualeffects` VALUES ('163', 'Spells\\Shadow_Mend_Impact.mdx');
INSERT INTO `itemvisualeffects` VALUES ('164', 'Spells\\Shadow_Frost_Weapon_Effect.mdx');
INSERT INTO `itemvisualeffects` VALUES ('165', 'Spells\\Banish_Chest_Blue.mdx');
INSERT INTO `itemvisualeffects` VALUES ('166', 'Spells\\IncinerateBlue_Impact_Base.mdx');
INSERT INTO `itemvisualeffects` VALUES ('167', 'Spells\\BloodBold_Missile_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('168', 'Spells\\Fear_State_Head.mdx');
INSERT INTO `itemvisualeffects` VALUES ('169', 'Spells\\Fire_SmokeTrail.mdx');
INSERT INTO `itemvisualeffects` VALUES ('170', 'Spells\\Infernal_Smoke_Rec.mdx');
INSERT INTO `itemvisualeffects` VALUES ('171', 'Spells\\ArcanePower_State_Chest.mdx');
INSERT INTO `itemvisualeffects` VALUES ('172', 'Spells\\ConjureItem.mdx');
INSERT INTO `itemvisualeffects` VALUES ('173', 'Spells\\Cripple_State_Base.mdx');
INSERT INTO `itemvisualeffects` VALUES ('174', 'Spells\\CurseElements_Impact_Head.mdx');
INSERT INTO `itemvisualeffects` VALUES ('175', 'Spells\\DetectMagic_Recursive.mdx');
INSERT INTO `itemvisualeffects` VALUES ('176', 'Spells\\Dispel_Low_Recursive.mdx');
INSERT INTO `itemvisualeffects` VALUES ('177', 'Spells\\Holy_Precast_Low_Hand.mdx');
INSERT INTO `itemvisualeffects` VALUES ('178', 'Spells\\Vengeance_State_Hand.mdx');
INSERT INTO `itemvisualeffects` VALUES ('179', 'Spells\\Summon_Precast_Hand.mdx');
INSERT INTO `itemvisualeffects` VALUES ('182', 'Spells\\Enchantments\\MongooseGlow_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('183', 'Spells\\Enchantments\\SavageryGlow_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('184', 'Spells\\Enchantments\\SoulfrostGlow_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('185', 'Spells\\Enchantments\\SunfireGlow_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('186', 'Spells\\Enchantments\\BattlemasterGlow_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('187', 'Spells\\Enchantments\\SpellSurgeGlow_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('188', 'Spells\\DarkShade.mdx');
INSERT INTO `itemvisualeffects` VALUES ('189', 'Spells\\BlackMagic_Precast_Base.mdx');
INSERT INTO `itemvisualeffects` VALUES ('190', 'Spells\\Shadow_DotParticle.mdx');
INSERT INTO `itemvisualeffects` VALUES ('191', 'Spells\\ManaBurn_Chest.mdx');
INSERT INTO `itemvisualeffects` VALUES ('192', 'Spells\\BlackShot_Missile.mdx');
INSERT INTO `itemvisualeffects` VALUES ('193', 'Spells\\Enchantments\\ExecutionerGlow_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('194', 'Spells\\Enchantments\\DisintigrateGlow_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('195', 'Spells\\IcyEnchant_High.mdx');
INSERT INTO `itemvisualeffects` VALUES ('196', 'Creature\\kobold.mdx');
INSERT INTO `itemvisualeffects` VALUES ('197', 'creature\\kobold\\kobold.mdx');
INSERT INTO `itemvisualeffects` VALUES ('198', 'Creature\\Turkey\\turkey.mdx');
INSERT INTO `itemvisualeffects` VALUES ('199', 'spells\\Fireworks_RWB_01.mdx');
INSERT INTO `itemvisualeffects` VALUES ('200', 'creature\\Kiljaeden\\Kiljaeden.mdx');
INSERT INTO `itemvisualeffects` VALUES ('201', 'World\\Generic\\PVP\\Fires\\LowPolyFire.mdx');
INSERT INTO `itemvisualeffects` VALUES ('202', 'Spells\\FireStrike_Missile_Low.mdx');
INSERT INTO `itemvisualeffects` VALUES ('203', 'Spells\\Fire_PreCast_Uber_Hand.mdx');
INSERT INTO `itemvisualeffects` VALUES ('204', 'Spells\\Ice_Precast_Med_Hand.mdx');
INSERT INTO `itemvisualeffects` VALUES ('205', 'Spells\\AcidLiquidBreath.mdx');
INSERT INTO `itemvisualeffects` VALUES ('206', 'Spells\\PoisonShot_Missile.mdx');
INSERT INTO `itemvisualeffects` VALUES ('207', 'Spells\\DeathKnight_FrozenRuneWeapon_State.mdx');
INSERT INTO `itemvisualeffects` VALUES ('208', 'Spells\\LightningBolt_Impact_Chest.mdx');
INSERT INTO `itemvisualeffects` VALUES ('210', 'Spells\\LightningBolt_Missile.mdx');
INSERT INTO `itemvisualeffects` VALUES ('212', 'Spells\\FireShot_Missile.mdx');
INSERT INTO `itemvisualeffects` VALUES ('213', 'Spells\\Archimonde_Fire.mdx');
INSERT INTO `itemvisualeffects` VALUES ('215', 'Spells\\Holy_Missile_Low.mdx');
