/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : a39c

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2013-02-22 00:33:58
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `character_rank`
-- ----------------------------
DROP TABLE IF EXISTS `character_rank`;
CREATE TABLE `character_rank` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `pvprank` int(10) unsigned NOT NULL DEFAULT '0',
  `pvplast` int(10) unsigned NOT NULL DEFAULT '0',
  `pvptotal` int(10) unsigned NOT NULL DEFAULT '0',
  `bgwin` int(10) unsigned NOT NULL DEFAULT '0',
  `arenawin` int(10) unsigned NOT NULL DEFAULT '0',
  `pvppoints` int(10) NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- ----------------------------
-- Records of character_rank
-- ----------------------------
