/*
Navicat MySQL Data Transfer

Source Server         : loalhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : manlike

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-09-01 17:34:21
*/

SET FOREIGN_KEY_CHECKS=0;
create database manlike;

use manlike;
-- ---------------------------
-- Table structure for man_admin
-- ----------------------------
DROP TABLE IF EXISTS `man_admin`;
CREATE TABLE `man_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(30) NOT NULL COMMENT '管理员账号',
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1启用0禁用2超管',
  `logintime` int(10) unsigned NOT NULL,
  `login_addr` varchar(200) NOT NULL COMMENT '登录地址',
  `login_ip` int(10) unsigned NOT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of man_admin
-- ----------------------------
INSERT INTO `man_admin` VALUES ('1', 'cpphp', '$2y$10$otkpYb8NzW65tgSAtQTW9ultN.yhXmsPeFe/j0nAnXKdC1IBqna/G', 'gzphper@163.com', '2', '1472718924', '广州', '3232241240');

-- ----------------------------
-- Table structure for man_users
-- ----------------------------
DROP TABLE IF EXISTS `man_users`;
CREATE TABLE `man_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) NOT NULL,
  `regtime` int(10) unsigned NOT NULL COMMENT '关注时间',
  `lastlogintime` int(10) unsigned NOT NULL COMMENT '最近登录时间',
  `openid` varchar(300) NOT NULL COMMENT '微信openid',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0禁用1启动',
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1普通用户2活跃用户3vip其他未定',
  `password` varchar(255) NOT NULL,
  `wechat` varchar(100) NOT NULL COMMENT '真实的微信账号 根据这个来交友',
  PRIMARY KEY (`id`),
  KEY `in_status` (`status`),
  KEY `in_openid` (`openid`(255)),
  KEY `in_nickname` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of man_users
-- ----------------------------

-- ----------------------------
-- Table structure for man_users_detail
-- ----------------------------
DROP TABLE IF EXISTS `man_users_detail`;
CREATE TABLE `man_users_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '关联用户表id',
  `headimg` varchar(300) NOT NULL COMMENT '微信头像',
  `descr` varchar(300) NOT NULL COMMENT '个人描述',
  `city` varchar(50) NOT NULL COMMENT '城市',
  `province` varchar(30) NOT NULL COMMENT '省份',
  `login_ip` int(10) unsigned NOT NULL COMMENT '登录时的ip',
  `qq` varchar(20) NOT NULL COMMENT 'qq号，用于交友',
  `phone` int(10) unsigned NOT NULL COMMENT '手机号',
  `email` varchar(100) NOT NULL,
  `isshow` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1不显示用户信息(qq手机)2显示',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `in_uid` (`uid`),
  KEY `in_headimg` (`headimg`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of man_users_detail
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
