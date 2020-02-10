/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : jiudian

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 10/02/2020 15:03:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `admin_pwd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '123456',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
BEGIN;
INSERT INTO `t_admin` VALUES (1, 'admin', '123456');
COMMIT;

-- ----------------------------
-- Table structure for t_book_a_room
-- ----------------------------
DROP TABLE IF EXISTS `t_book_a_room`;
CREATE TABLE `t_book_a_room` (
  `room_id` varchar(25) NOT NULL,
  `count_date` int(11) DEFAULT NULL,
  `user_name` varchar(25) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `preset_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_book_a_room
-- ----------------------------
BEGIN;
INSERT INTO `t_book_a_room` VALUES ('4301', 2, 'zyg', '1827838661', '2019-06-26 15:58:23');
INSERT INTO `t_book_a_room` VALUES ('5202', 2, 'zyg', '1827838661', '2019-06-26 16:03:59');
COMMIT;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `ser_num` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `room_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `release_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ser_num`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
BEGIN;
INSERT INTO `t_comment` VALUES (1, 'zyg', '1301', '体验很好', '2019-06-11 16:04:27');
INSERT INTO `t_comment` VALUES (2, '章鱼哥', '1301', 'very good', '2019-06-11 22:56:38');
INSERT INTO `t_comment` VALUES (7, 'zyg', '1301', 'dsfddv', '2019-06-12 10:58:47');
INSERT INTO `t_comment` VALUES (8, 'zyg', '1301', '很好，很舒服', '2019-06-12 11:00:16');
INSERT INTO `t_comment` VALUES (9, 'zyg', '1301', '很好', '2019-06-14 09:51:50');
INSERT INTO `t_comment` VALUES (10, 'zyg', '1301', '嗨嗨，nice', '2019-06-14 09:55:05');
INSERT INTO `t_comment` VALUES (11, '章鱼哥', '1301', '......', '2019-06-18 16:49:13');
INSERT INTO `t_comment` VALUES (12, 'zyg', '1301', 'nice', '2019-06-18 16:49:33');
INSERT INTO `t_comment` VALUES (13, 'ggg', '5203', '这个房间很吊', '2019-06-18 21:10:51');
INSERT INTO `t_comment` VALUES (14, 'zyg', '1301', 'hgcnb', '2019-06-18 22:08:16');
INSERT INTO `t_comment` VALUES (15, 'zyg', '2804', '很好！', '2019-06-20 19:41:52');
INSERT INTO `t_comment` VALUES (16, 'zxcv', '1301', 'nice', '2019-06-26 15:53:37');
COMMIT;

-- ----------------------------
-- Table structure for t_liuyan
-- ----------------------------
DROP TABLE IF EXISTS `t_liuyan`;
CREATE TABLE `t_liuyan` (
  `user_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `liuyan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ser_num` bigint(20) NOT NULL AUTO_INCREMENT,
  `release_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ser_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `ser_num` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `notice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `release_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ser_num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
BEGIN;
INSERT INTO `t_notice` VALUES (1, 1, '即日起：所有客房打8折', '2019-06-07 18:52:09');
INSERT INTO `t_notice` VALUES (2, 1, '即日起：豪华房优惠100元', '2019-06-09 23:04:50');
COMMIT;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `room_id` varchar(20) NOT NULL,
  `user_name` varchar(25) DEFAULT NULL,
  `ID` varchar(18) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `prepay` decimal(10,2) DEFAULT NULL,
  `payment` decimal(10,2) DEFAULT NULL,
  `change` decimal(10,2) DEFAULT NULL,
  `ser_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
BEGIN;
INSERT INTO `t_order` VALUES ('1302', 'zyg', '564456', '2019-06-13 19:59:47', '2019-06-14 01:21:30', 240.00, 300.00, NULL, 'cb670bee8dd211e991387eb7195666fe');
INSERT INTO `t_order` VALUES ('1303', 'zyg', '5434', '2019-06-09 20:13:07', '2019-06-14 01:20:54', 150.00, 250.00, NULL, 'a5c04aac8dd411e991387eb7195666fe');
INSERT INTO `t_order` VALUES ('2804', 'zyg', '5464', '2019-06-14 09:59:46', NULL, 263.00, NULL, NULL, '159ac5288e4811e9a2b8e050eeb8d2f2');
INSERT INTO `t_order` VALUES ('3202', 'zyg', '54424', '2019-06-14 08:05:38', '2019-06-14 10:00:06', 4522.00, 250.00, NULL, '23fda2628e3811e9b32a3e18bc66cbc9');
COMMIT;

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `room_id` varchar(20) NOT NULL,
  `room_type` varchar(20) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '环境优美，LED光影时尚造型格调装饰，装备顶级影音设备，床褥舒适。',
  `photo_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '/img/jiudian4.jpg',
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room
-- ----------------------------
BEGIN;
INSERT INTO `t_room` VALUES ('1301', '情侣房', 64, '环境优美，LED光影时尚造型格调装饰，装备顶级影音设备，床褥舒适。', '/img/jiudian1.jpg', 200.00);
INSERT INTO `t_room` VALUES ('2804', '情侣房', 54, '环境优美，LED光影时尚造型格调装饰，装备顶级影音设备，床褥舒适。', '/img/jiudian2.jpg', 200.00);
INSERT INTO `t_room` VALUES ('3202', '大床房', 60, '环境优美，LED光影时尚造型格调装饰，装备顶级影音设备，床褥舒适。', '/img/jiudian3.jpg', 300.00);
INSERT INTO `t_room` VALUES ('3205', '大床房', 60, '环境优美，LED光影时尚造型格调装饰，装备顶级影音设备，床褥舒适。', '/img/jiudian4.jpg', 300.00);
INSERT INTO `t_room` VALUES ('3206', '大床房', 60, '环境优美，LED光影时尚造型格调装饰，装备顶级影音设备，床褥舒适。', '/img/jiudian5.jpg', 300.00);
INSERT INTO `t_room` VALUES ('4301', '商务房', 72, '环境优美，LED光影时尚造型格调装饰，装备顶级影音设备，床褥舒适。', '/img/jiudian8.jpg', 400.00);
INSERT INTO `t_room` VALUES ('5201', '单人间', 40, '环境优美，LED光影时尚造型格调装饰，装备顶级影音设备，床褥舒适。', '/img/jiudian6.gif', 100.00);
INSERT INTO `t_room` VALUES ('5202', '单人间', 40, '环境优美，LED光影时尚造型格调装饰，装备顶级影音设备，床褥舒适。', '/img/jiudian7.jpg', 100.00);
INSERT INTO `t_room` VALUES ('5203', '单人间', 40, '环境优美，LED光影时尚造型格调装饰，装备顶级影音设备，床褥舒适。', '/img/jiudian8.jpg', 100.00);
COMMIT;

-- ----------------------------
-- Table structure for t_room_type
-- ----------------------------
DROP TABLE IF EXISTS `t_room_type`;
CREATE TABLE `t_room_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room_type
-- ----------------------------
BEGIN;
INSERT INTO `t_room_type` VALUES (1, '大床房');
INSERT INTO `t_room_type` VALUES (2, '单人间');
INSERT INTO `t_room_type` VALUES (3, '情侣房');
INSERT INTO `t_room_type` VALUES (4, '双人间');
INSERT INTO `t_room_type` VALUES (5, '商务房');
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_pwd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '123456',
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `QQ` varchar(20) DEFAULT NULL,
  `photo_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '/Users/stone/Downloads/学习图片/默认头像.png',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES (5, 'zyg', '123456', '', '', '', '', '');
INSERT INTO `t_user` VALUES (6, '章鱼哥', '123456', '', '', '', '', '');
INSERT INTO `t_user` VALUES (7, 'ggg', '123', '', 'ggg', '', '', '');
INSERT INTO `t_user` VALUES (8, 'zxcv', '123456', '', '', '', '', '');
COMMIT;

-- ----------------------------
-- Triggers structure for table t_order
-- ----------------------------
DROP TRIGGER IF EXISTS `uuid_to_orderId`;
delimiter ;;
CREATE TRIGGER `uuid_to_orderId` BEFORE INSERT ON `t_order` FOR EACH ROW set NEW.ser_num = REPLACE(UUID(),'-','')
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
