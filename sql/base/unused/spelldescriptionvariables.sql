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
-- Table structure for table `spelldescriptionvariables`
--

DROP TABLE IF EXISTS `spelldescriptionvariables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spelldescriptionvariables` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Text` varchar(600) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spelldescriptionvariables`
--

LOCK TABLES `spelldescriptionvariables` WRITE;
/*!40000 ALTER TABLE `spelldescriptionvariables` DISABLE KEYS */;
/*!40000 ALTER TABLE `spelldescriptionvariables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `spelldescriptionvariables`
--

INSERT INTO `spelldescriptionvariables` VALUES ('1', '$funny=$?s48165[${$m1/10}.5]?a66109[${13}][${($m1*3)+17}]\r\n$maybe=$?s48165[${1}.5][${$66109m2*4/$<funny>}.2]\r\n$storm=${0.14*$AP*$<maybe>}\r\n\r\n');
INSERT INTO `spelldescriptionvariables` VALUES ('28', '$min=$?s54825[${$m1/2}][${$m1}]\r\n$max=$?s54825[${$M1/2}][${$M1}]');
INSERT INTO `spelldescriptionvariables` VALUES ('29', '$junk=1');
INSERT INTO `spelldescriptionvariables` VALUES ('30', '$total=${$m1*5}');
INSERT INTO `spelldescriptionvariables` VALUES ('31', '$total=${$m1*5}');
INSERT INTO `spelldescriptionvariables` VALUES ('61', '$mana=$?s55441[${$16191m1+1}][${$16191m1}]');
INSERT INTO `spelldescriptionvariables` VALUES ('62', '$charges=$?s58673[${4+2}][${4}]');
INSERT INTO `spelldescriptionvariables` VALUES ('63', '$dur1=$?s56801[${6+2+5}][${6+2}]\r\n$dur2=$?s56801[${6+4+5}][${6+4}]\r\n$dur3=$?s56801[${6+6+5}][${6+6}]\r\n$dur4=$?s56801[${6+8+5}][${6+8}]\r\n$dur5=$?s56801[${6+10+5}][${6+10}]');
INSERT INTO `spelldescriptionvariables` VALUES ('64', '$bonus=$?s56807[${$m3*1.4}][${$m3}]');
INSERT INTO `spelldescriptionvariables` VALUES ('81', '$weapon=$?s58657[${$m2*1.2}][${$m2}]\r\n$bonus=$?s58657[${$m1*$m2/100*1.2}][${$m1*$m2/100}]');
INSERT INTO `spelldescriptionvariables` VALUES ('82', '$absorb=$?s58635[${$m1*$AR*0.01*(100+$58635m1)*0.01}][${$m1*$AR*0.01}]');
INSERT INTO `spelldescriptionvariables` VALUES ('83', '$percent=$?s56216[${$m1*(1+$56216m1/100)}][${$m1}]');
INSERT INTO `spelldescriptionvariables` VALUES ('84', '$damage=$?s63333[${$m1*1.15}][${$m1}]\r\n$healing=$?s63333[${$m1*1.15*1.5}][${$m1*1.5}]');
INSERT INTO `spelldescriptionvariables` VALUES ('86', '$images=$?s63093[${$63093m1+$55342m2}][${$55342m2}]');
INSERT INTO `spelldescriptionvariables` VALUES ('87', '$threat=$?s63326[${$m3*-1+$63326m1}][${$m3}]');
INSERT INTO `spelldescriptionvariables` VALUES ('101', '$chance=$?s55439[${$m2+$55439m1}][${$m2}]');
INSERT INTO `spelldescriptionvariables` VALUES ('102', '$bonus=${$m1*0.4}');
INSERT INTO `spelldescriptionvariables` VALUES ('121', '$duration=$?s56846[${3}][${5}]\r\n$mult=$?s56846[${4}][${2}]');
INSERT INTO `spelldescriptionvariables` VALUES ('162', '$mult=$?s55673[${1.2}][${1}]');
INSERT INTO `spelldescriptionvariables` VALUES ('164', '$glyph=$?s56810[${3}]$[${0}]\r\n$mult1=$?s14165[${25}][${0}]\r\n$mult=$?s14166[${50}][${$<mult1>}]');
INSERT INTO `spelldescriptionvariables` VALUES ('165', '$dur=$?s54818[${8}][${6}]');
INSERT INTO `spelldescriptionvariables` VALUES ('166', '$bonus=${$m1*0.5}');
INSERT INTO `spelldescriptionvariables` VALUES ('167', '$arctic1=$?s31674[${1.01}][${1}]\r\n$arctic2=$?s31675[${1.02}][${$<arctic1>}]\r\n$arctic3=$?s31676[${1.03}][${$<arctic2>}]\r\n$arctic4=$?s31677[${1.04}][${$<arctic3>}]\r\n$arctic5=$?s31678[${1.05}][${$<arctic4>}]\r\n$piercing1=$?s11151[${1.02}][${1}]\r\n$piercing2=$?s12952[${1.04}][${$<piercing1>}]\r\n$piercing3=$?s12953[${1.06}][${$<piercing2>}]\r\n$mult=${$<arctic5>*$<piercing3>}');
INSERT INTO `spelldescriptionvariables` VALUES ('169', '$mult1=$?s14162[${1.07}][${1.0}]\r\n$mult2=$?s14163[${1.14}][${$<mult1>}]\r\n$mult=$?s14164[${1.2}][${$<mult2>}]');
INSERT INTO `spelldescriptionvariables` VALUES ('170', '$heal=$?a63279[${$m1*1.2}][${$m1}]');
INSERT INTO `spelldescriptionvariables` VALUES ('171', '$aggression1=$?s18427[${103}][${100}]\r\n$aggression2=$?s18428[${106}][${$<aggression1>}]\r\n$aggression3=$?s18429[${109}][${$<aggression2>}]\r\n$aggression4=$?s61330[${112}][${$<aggression3>}]\r\n$percent=$?s61331[${115}][${$<aggression4>}]\r\n\r\n');
INSERT INTO `spelldescriptionvariables` VALUES ('172', '$opportunity1=$?s14057[${110}][${100}]\r\n$percent=$?s14072[${120}][${$<opportunity1>}]');
INSERT INTO `spelldescriptionvariables` VALUES ('175', '$tap1=$?s18182[${$18182m1*0.01+1}][${1}]\r\n$tap2=$?s18183[${$18183m1*0.01+1}][${$<tap1>}]\r\n$mult=${$<tap2>}\r\n');
INSERT INTO `spelldescriptionvariables` VALUES ('176', '$genesis1=$?s57810[${1+0.01*$57810m1}][${1}]\r\n$genesis2=$?s57811[${1+0.01*$57811m1}][${$<genesis1>}]\r\n$genesis3=$?s57812[${1+0.01*$57812m1}][${$<genesis2>}]\r\n$genesis4=$?s57813[${1+0.01*$57813m1}][${$<genesis3>}]\r\n$genesis5=$?s57814[${1+0.01*$57814m1}][${$<genesis4>}]\r\n$mult=${$<genesis5>}');
INSERT INTO `spelldescriptionvariables` VALUES ('181', '$base=($pl-1)*3+10\r\n$melee=${$AP*0.22}\r\n$spell=${$sp*0.376}\r\n$which=${$gt($<melee>,$<spell>)}');
