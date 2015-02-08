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
-- Table structure for table `creature_addon`
--

DROP TABLE IF EXISTS `creature_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_addon` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `path_id` int(10) unsigned NOT NULL DEFAULT '0',
  `mount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bytes1` int(10) unsigned NOT NULL DEFAULT '0',
  `bytes2` int(10) unsigned NOT NULL DEFAULT '0',
  `emote` int(10) unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creature_addon`
--

LOCK TABLES `creature_addon` WRITE;
/*!40000 ALTER TABLE `creature_addon` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_addon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `creature_addon` from 5.4.8 (Kalimdor only)
--

INSERT INTO `creature_addon` VALUES ('176532', '0', '0', '0', '1', '71', '');
INSERT INTO `creature_addon` VALUES ('176525', '0', '0', '1', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('176524', '0', '0', '1', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('176522', '0', '0', '0', '1', '18', '');
INSERT INTO `creature_addon` VALUES ('176513', '0', '0', '0', '1', '18', '');
INSERT INTO `creature_addon` VALUES ('176505', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('176504', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('176502', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('176476', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('176475', '0', '0', '1', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('176378', '0', '0', '1', '1', '7', '');
INSERT INTO `creature_addon` VALUES ('175263', '0', '14561', '0', '0', '0', null);
INSERT INTO `creature_addon` VALUES ('175259', '0', '14561', '0', '0', '0', null);
INSERT INTO `creature_addon` VALUES ('175225', '0', '14561', '0', '0', '0', null);
INSERT INTO `creature_addon` VALUES ('174966', '0', '0', '0', '1', '0', '72660 70628');
INSERT INTO `creature_addon` VALUES ('174946', '0', '0', '0', '1', '0', '72660 70628');
INSERT INTO `creature_addon` VALUES ('174813', '0', '0', '0', '1', '0', '72660 70628');
INSERT INTO `creature_addon` VALUES ('174807', '0', '0', '0', '1', '0', '72660 70628');
INSERT INTO `creature_addon` VALUES ('174802', '0', '0', '0', '1', '0', '72660 70628');
INSERT INTO `creature_addon` VALUES ('174428', '0', '0', '0', '1', '0', '29266');
INSERT INTO `creature_addon` VALUES ('174378', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174354', '0', '0', '0', '1', '0', '29266');
INSERT INTO `creature_addon` VALUES ('174351', '0', '0', '0', '1', '0', '29266');
INSERT INTO `creature_addon` VALUES ('174309', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('174308', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('174302', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('174199', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174194', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174193', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174190', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174187', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174186', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174185', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174183', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174182', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174181', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174180', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174179', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174178', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174177', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174176', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174175', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174174', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174173', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174172', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174171', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174170', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174169', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174168', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174167', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174166', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174165', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174164', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174163', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174162', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174161', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174160', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174159', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174158', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174157', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174156', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174155', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174154', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174153', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174152', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174151', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174150', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174149', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174148', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174147', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174146', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174145', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174144', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174143', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174142', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174141', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174140', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174139', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174138', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174137', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174136', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174135', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174134', '0', '0', '0', '1', '10', '');
INSERT INTO `creature_addon` VALUES ('174014', '0', '0', '1', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('173958', '0', '0', '0', '1', '0', '29266');
INSERT INTO `creature_addon` VALUES ('173953', '0', '0', '0', '1', '0', '29266');
INSERT INTO `creature_addon` VALUES ('173948', '0', '0', '0', '1', '0', '29266');
INSERT INTO `creature_addon` VALUES ('173929', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173928', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173927', '0', '0', '8', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('173926', '0', '0', '0', '1', '69', '');
INSERT INTO `creature_addon` VALUES ('173924', '0', '0', '8', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('173923', '0', '0', '0', '1', '69', '');
INSERT INTO `creature_addon` VALUES ('173920', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173888', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173887', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173886', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173885', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173884', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173883', '0', '0', '0', '1', '69', '');
INSERT INTO `creature_addon` VALUES ('173882', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173880', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173879', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173877', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173876', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173875', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173874', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173873', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173871', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173870', '0', '0', '8', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('173869', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173868', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173866', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173865', '0', '0', '8', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('173864', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173863', '0', '0', '8', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('173862', '0', '0', '0', '1', '69', '');
INSERT INTO `creature_addon` VALUES ('173861', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173860', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173859', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173858', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173857', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173856', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173855', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173854', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173853', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173852', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173850', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173849', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173848', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173847', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('173846', '0', '0', '0', '1', '27', '');
INSERT INTO `creature_addon` VALUES ('156316', '1563160', '0', '0', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('138764', '0', '0', '65536', '257', '0', '85813');
INSERT INTO `creature_addon` VALUES ('138526', '0', '0', '65536', '1', '0', '60921');
INSERT INTO `creature_addon` VALUES ('138523', '0', '0', '65536', '1', '0', '49414');
INSERT INTO `creature_addon` VALUES ('138335', '0', '0', '65536', '1', '0', '49415');
INSERT INTO `creature_addon` VALUES ('138299', '0', '0', '65539', '1', '0', '82343 92564');
INSERT INTO `creature_addon` VALUES ('138297', '0', '0', '65544', '1', '0', '82343');
INSERT INTO `creature_addon` VALUES ('69', '0', '0', '7', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('68', '0', '0', '8', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('67', '0', '0', '8', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('66', '0', '0', '8', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('65', '0', '0', '8', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('64', '0', '0', '8', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('63', '0', '0', '8', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('62', '0', '0', '8', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('61', '0', '0', '8', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('60', '0', '0', '8', '1', '0', '');
INSERT INTO `creature_addon` VALUES ('59', '0', '0', '8', '1', '0', '');
