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
-- Table structure for table `gmsurveyquestions`
--

DROP TABLE IF EXISTS `gmsurveyquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gmsurveyquestions` (
  `Id` int(10) NOT NULL DEFAULT '0',
  `Question` varchar(400) NOT NULL DEFAULT '',
  `Question_loc2` varchar(400) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gmsurveyquestions`
--

LOCK TABLES `gmsurveyquestions` WRITE;
/*!40000 ALTER TABLE `gmsurveyquestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `gmsurveyquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Records of `gmsurveyquestions`
--

INSERT INTO `gmsurveyquestions` VALUES ('28', 'Did the GM provide an appropriate answer or solution to your question/problem?', 'Le MJ a-t-il apporté une réponse ou une solution adaptée à votre question/problème ?');
INSERT INTO `gmsurveyquestions` VALUES ('29', 'How easy was it to understand and/or follow the information provided?', 'L’information fournie était-elle facile à comprendre et/ou à appliquer ?');
INSERT INTO `gmsurveyquestions` VALUES ('30', 'Was the GM knowledgeable, respectful, and empathetic during your interactions?', 'Au cours de vos échanges, le MJ était-il informé, poli et compréhensif ?');
INSERT INTO `gmsurveyquestions` VALUES ('31', 'How would you rate the response time to address your petition?', 'Quelle note donneriez-vous au temps de réponse à votre requête ?');
INSERT INTO `gmsurveyquestions` VALUES ('32', 'How would you rate the overall experience with the GM that assisted you with your petition?', 'Quelle note donneriez-vous quant à votre expérience avec le MJ qui vous a aidé dans votre requête ?');
INSERT INTO `gmsurveyquestions` VALUES ('33', 'Based on your support experience, how likely is it that you would recommend WoW to others?', 'En vous basant sur votre expérience de l\'assistance en jeu, recommanderiez-vous WoW à d’autres personnes ?');
INSERT INTO `gmsurveyquestions` VALUES ('35', 'Based on this customer service experience, how likely are you to recommend Blizzard products and services to a friend?', 'Suite à cette expérience avec le service clientèle de Blizzard, seriez-vous prêt à recommander les produits et services de Blizzard à vos amis ?');
INSERT INTO `gmsurveyquestions` VALUES ('36', 'Was your problem solved?', 'Votre problème est-il résolu ?');
INSERT INTO `gmsurveyquestions` VALUES ('37', 'My overall experience with Blizzard Customer Service was:', 'De manière générale, mon expérience avec le service clientèle de Blizzard était :');
INSERT INTO `gmsurveyquestions` VALUES ('38', 'My wait time for Blizzard Customer Service was:', 'Le délai de réponse du service d’assistance de Blizzard était :');
INSERT INTO `gmsurveyquestions` VALUES ('39', 'This Blizzard Representative’s professionalism was:', 'Le professionnalisme de ce représentant de Blizzard était :');
INSERT INTO `gmsurveyquestions` VALUES ('40', 'This Blizzard Representative’s communication skills were:', 'Les explications de ce représentant de Blizzard étaient :');
INSERT INTO `gmsurveyquestions` VALUES ('41', 'This Blizzard Representative’s overall service was:', 'De manière générale, l\'aide de ce représentant de Blizzard était :');
