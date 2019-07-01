/*
 Navicat Premium Data Transfer

 Source Server         : date
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 01/07/2019 11:56:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menuid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  `menuTypeid` int(11) NULL DEFAULT NULL,
  `storeid` int(11) NULL DEFAULT NULL,
  `num` int(2) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`menuid`) USING BTREE,
  INDEX `menuTypeid`(`menuTypeid`) USING BTREE,
  INDEX `storeid`(`storeid`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`menuTypeid`) REFERENCES `menutype` (`menutypeid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`storeid`) REFERENCES `store` (`storeid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '米饭', 0.30, 'http://n5.image.pg0.cn/T1pl_IBbJW1RCvBVdK.jpg', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 7, 1, 0);
INSERT INTO `menu` VALUES (2, '炒饭', 3.00, 'http://n2.image.pg0.cn/T12bZpB5_b1RCvBVdK.jpg', '2019-06-05 13:10:30', '2019-06-27 23:30:14', 7, 1, 0);
INSERT INTO `menu` VALUES (3, '粥', 1.00, 'http://n6.image.pg0.cn/T1OnJOBKhK1RCvBVdK.jpg', '2019-06-05 13:11:11', '2019-06-27 23:30:14', 4, 1, 0);
INSERT INTO `menu` VALUES (4, '面条', 2.20, 'http://n2.image.pg0.cn/T1DBVzBsZc1RCvBVdK.jpg', '2019-06-05 13:11:57', '2019-06-27 23:30:14', 5, 1, 0);
INSERT INTO `menu` VALUES (5, '米线', 2.20, 'http://n1.image.pg0.cn/T1cPAKBs_S1RCvBVdK.jpg', '2019-06-05 13:12:22', '2019-06-27 23:30:14', 5, 1, 0);
INSERT INTO `menu` VALUES (6, '饵丝', 2.20, 'http://n4.image.pg0.cn/T1jUKlB5AV1RCvBVdK.jpg', '2019-06-05 13:12:53', '2019-06-27 23:30:14', 5, 1, 0);
INSERT INTO `menu` VALUES (7, '粉', 2.20, 'http://n1.image.pg0.cn/T17kbzBjWt1RCvBVdK.jpg', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 5, 1, 0);
INSERT INTO `menu` VALUES (8, '辣子鸡块', 4.00, 'http://n1.image.pg0.cn/T1WeASBsdz1RCvBVdK.jpg', '2019-06-05 14:12:03', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (9, '韭黄炒蛋', 4.00, 'http://n4.image.pg0.cn/T1UxWlByJk1RCvBVdK.jpg', '2019-06-05 14:14:29', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (10, '荷兰豆肉片', 4.00, 'http://n6.image.pg0.cn/T1m9WABXW91RCvBVdK.jpg', '2019-06-05 14:14:55', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (11, '红烧大排', 4.00, 'http://n6.image.pg0.cn/T1PLWtBbKk1RCvBVdK.jpg', '2019-06-05 14:15:25', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (12, '香菇肉片', 4.00, 'http://n2.image.pg0.cn/T1kgDABTdk1RCvBVdK.jpg', '2019-06-05 14:15:49', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (13, '回锅肉', 4.00, 'http://n4.image.pg0.cn/T1V1Z7BK_N1RCvBVdK.jpg', '2019-06-05 14:16:31', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (14, '黄焖牛腩', 4.00, 'http://n3.image.pg0.cn/T1NqxgBTh11RCvBVdK.jpg', '2019-06-05 14:17:05', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (15, '宫爆鸡丁', 4.00, 'http://n1.image.pg0.cn/T13wLqBTY91RCvBVdK.jpg', '2019-06-05 14:17:42', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (16, '土豆炖牛楠', 4.00, 'http://n4.image.pg0.cn/T16hZwBmEQ1RCvBVdK.jpg', '2019-06-05 14:18:48', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (17, '红烧肉', 4.00, 'http://n6.image.pg0.cn/T1jMhKBvAI1RCvBVdK.jpg', '2019-06-05 14:18:53', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (18, '蒜泥空心菜', 2.00, 'http://n4.image.pg0.cn/T11zEnBbEO1RCvBVdK.jpg', '2019-06-05 14:19:13', '2019-06-27 23:30:14', 2, 1, 0);
INSERT INTO `menu` VALUES (19, '蕃茄炒蛋', 2.00, 'http://n2.image.pg0.cn/T1r8dlBKWS1RCvBVdK.jpg', '2019-06-05 14:22:44', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (20, '茄汁排条', 4.00, 'http://n5.image.pg0.cn/T12UxGBCAC1RCvBVdK.jpg', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (21, '香酥鸡腿', 4.00, 'http://n1.image.pg0.cn/T1SdJNB4WL1RCvBVdK.jpg', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (22, '莴笋肉丝', 4.00, 'http://n4.image.pg0.cn/T1tTd6Bsb41RCvBVdK.jpg', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (23, '双菇肉片', 4.00, 'http://n6.image.pg0.cn/T1yKYRBXhy1RCvBVdK.jpg', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (24, '酒香草头', 2.00, 'http://n1.image.pg0.cn/T1kIVMBgVQ1RCvBVdK.jpg', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 2, 1, 0);
INSERT INTO `menu` VALUES (25, '五香牛肉', 5.00, 'http://n6.image.pg0.cn/T1FiY4BgAL1RCvBVdK.jpg\r\n', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (26, '香酥鸡排', 4.00, 'http://n2.image.pg0.cn/T1tVYBBvx51RCvBVdK.jpg\r\n', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (28, '花菜炒肉片', 4.00, 'http://n6.image.pg0.cn/T1E7LfBjAL1RCvBVdK.jpg\r\n', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (29, '凉拌西红柿', 2.00, 'http://n6.image.pg0.cn/T1PaWSBjxL1RCvBVdK.jpg\r\n', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 2, 1, 0);
INSERT INTO `menu` VALUES (30, '红豆粥', 1.00, 'http://n2.image.pg0.cn/T1ujZlBmLO1RCvBVdK.jpg\r\n', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 4, 1, 0);
INSERT INTO `menu` VALUES (31, '油条', 1.00, 'http://n4.image.pg0.cn/T180WXB7EW1RCvBVdK.jpg', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 6, 1, 0);
INSERT INTO `menu` VALUES (32, '五香猪手', 4.00, 'http://n3.image.pg0.cn/T1gdKkBs_W1RCvBVdK.jpg\r\n', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (33, '青椒炒肉', 4.00, 'http://n5.image.pg0.cn/T1m9x4B4xV1RCvBVdK.jpg\r\n', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (34, '三色鸡丁', 4.00, 'http://n1.image.pg0.cn/T130xmBsCa1RCvBVdK.jpg\r\n', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (35, '蒜苔爆肚丝', 3.00, 'http://n3.image.pg0.cn/T1Ca_KB4Y31RCvBVdK.jpg\r\n', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (36, '杭白菜', 2.20, 'http://n4.image.pg0.cn/T1KgDnBCYS1RCvBVdK.jpg\r\n', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 2, 1, 0);
INSERT INTO `menu` VALUES (37, '咖哩鸡块', 4.00, 'http://n5.image.pg0.cn/T1CSZ6B4db1RCvBVdK.jpg\r\n', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (38, '走油大肉', 4.00, 'http://n3.image.pg0.cn/T17HhTBTDw1RCvBVdK.jpg\r\n', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (39, '芹菜牛肉', 5.00, 'http://n3.image.pg0.cn/T1D5J7BQdN1RCvBVdK.jpg\r\n', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 1, 1, 0);
INSERT INTO `menu` VALUES (40, '酸缸豆肉沫', 4.00, 'http://n3.image.pg0.cn/T1QJKOB5JV1RCvBVdK.jpg\r\n', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 4, 1, 0);
INSERT INTO `menu` VALUES (41, '青椒土豆丝', 2.00, 'http://n1.image.pg0.cn/T1eFKeBvWV1RCvBVdK.jpg\r\n', '2019-06-05 13:09:43', '2019-06-27 23:30:14', 2, 1, 0);
INSERT INTO `menu` VALUES (42, '汇源果汁', 3.50, 'http://n2.image.pg0.cn/T1tYx7BmJ91RCvBVdK.jpg', '2019-06-06 08:55:28', '2019-06-27 23:30:14', 3, 1, 0);
INSERT INTO `menu` VALUES (43, ' 包子   ', 1.00, 'http://n4.map.pg0.cn/T16pY_Bshv1RCvBVdK.jpg ', '2019-06-05 13:09:43', '2019-06-27 23:30:46', 6, 2, 0);
INSERT INTO `menu` VALUES (44, '  花卷  ', 1.00, 'http://n1.image.pg0.cn/T1h.ASB4_W1RCvBVdK.jpg   ', '2019-06-05 13:09:43', '2019-06-27 23:30:46', 6, 2, 0);
INSERT INTO `menu` VALUES (45, '  茶叶蛋  ', 1.50, 'http://n2.map.pg0.cn/T1PHY_BTKv1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-27 23:30:46', 6, 2, 0);
INSERT INTO `menu` VALUES (46, ' 红烧排骨   ', 5.00, 'http://n4.map.pg0.cn/T1gxDgBXZv1RCvBVdK.jpg   ', '2019-06-05 13:09:43', '2019-06-27 23:30:46', 1, 2, 0);
INSERT INTO `menu` VALUES (47, '  回锅肉  ', 5.00, 'http://n4.map.pg0.cn/T1_1CvB5_g1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-27 23:30:46', 1, 2, 0);
INSERT INTO `menu` VALUES (48, '  草鱼  ', 6.00, 'http://n4.image.pg0.cn/T1TUxnBgAz1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-27 23:30:46', 1, 2, 0);
INSERT INTO `menu` VALUES (49, '  炒时菜  ', 2.00, 'http://n2.image.pg0.cn/T1p7D5BmZO1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-27 23:30:46', 2, 2, 0);
INSERT INTO `menu` VALUES (50, '  炒青瓜  ', 1.50, 'http://n5.image.pg0.cn/T140AqBQZ91RCvBVdK.jpg   ', '2019-06-05 13:09:43', '2019-06-27 23:30:46', 2, 2, 0);
INSERT INTO `menu` VALUES (51, '  辣子鸡 ', 5.00, 'http://n5.image.pg0.cn/T1VrEsByhk1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-27 23:30:46', 1, 2, 0);
INSERT INTO `menu` VALUES (52, ' 卤鸡蛋   ', 2.00, 'http://n3.image.pg0.cn/T1TpAsB4YI1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-27 23:30:46', 6, 2, 0);
INSERT INTO `menu` VALUES (53, '   白粥 ', 1.00, 'http://n5.image.pg0.cn/T15BV5BQKk1RCvBVdK.jpg', '2019-06-05 13:09:43', '2019-06-27 23:30:46', 4, 2, 0);
INSERT INTO `menu` VALUES (54, '  扬州炒饭  ', 4.00, 'http://n1.map.pg0.cn/T1zfd_B7AT1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-21 02:43:00', 7, 3, 0);
INSERT INTO `menu` VALUES (55, ' 红烧牛肉面  ', 4.00, 'http://n3.image.pg0.cn/T1q_CyBgDO1RCvBVdK.jpg', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 5, 3, 0);
INSERT INTO `menu` VALUES (56, ' 豆浆   ', 1.00, 'http://n6.image.pg0.cn/T1baJQB4W11RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 4, 3, 0);
INSERT INTO `menu` VALUES (57, '  炸洋芋  ', 1.50, 'http://n6.image.pg0.cn/T1TpLZBmdP1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 6, 3, 0);
INSERT INTO `menu` VALUES (58, '  南瓜饼  ', 1.50, 'http://n6.image.pg0.cn/T14KxgB5hE1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 6, 3, 0);
INSERT INTO `menu` VALUES (59, '  海带汤  ', 1.00, 'http://n2.image.pg0.cn/T1wChTBCZx1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 4, 3, 0);
INSERT INTO `menu` VALUES (60, '  排骨汤  ', 4.00, 'http://n6.image.pg0.cn/T1STb5BmWV1RCvBVdK.jpg ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 4, 3, 0);
INSERT INTO `menu` VALUES (61, ' 牛肉面   ', 4.00, 'http://n3.image.pg0.cn/T1q_CyBgDO1RCvBVdK.jpg', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 5, 3, 0);
INSERT INTO `menu` VALUES (62, '  酱汁肘子  ', 6.00, 'http://n4.image.pg0.cn/T1ASAqBCLx1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 1, 3, 0);
INSERT INTO `menu` VALUES (63, '  酸菜肉  ', 4.00, 'http://n4.image.pg0.cn/T100ESBTKH1RCvBVdK.jpg   ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 1, 3, 0);
INSERT INTO `menu` VALUES (64, '  宫保鸡丁  ', 6.00, 'http://n4.map.pg0.cn/T1l1AvBjVv1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 1, 3, 0);
INSERT INTO `menu` VALUES (65, '  红烧豆腐  ', 2.00, 'http://n1.image.pg0.cn/T1Rb_cBsLm1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 2, 4, 0);
INSERT INTO `menu` VALUES (66, ' 米线   ', 2.20, 'http://n6.image.pg0.cn/T1Z3AqBQJc1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 5, 4, 0);
INSERT INTO `menu` VALUES (67, '  鱼香肉丝  ', 4.00, 'http://n1.map.pg0.cn/T1fwKvBXCT1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 1, 4, 0);
INSERT INTO `menu` VALUES (68, '  酸菜肉片  ', 4.00, 'http://n2.image.pg0.cn/T1s9VhBmYc1RCvBVdK.jpg ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 1, 4, 0);
INSERT INTO `menu` VALUES (69, ' 稀饭   ', 1.00, 'http://n1.image.pg0.cn/T1LiDjB_Kc1RCvBVdK.jpg ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 7, 4, 0);
INSERT INTO `menu` VALUES (70, '  热干面  ', 4.00, 'http://n3.image.pg0.cn/T1zDKgBvWc1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 5, 4, 0);
INSERT INTO `menu` VALUES (71, '  鸡蛋汤  ', 1.00, 'http://n6.image.pg0.cn/T13uAaBQEk1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 4, 4, 0);
INSERT INTO `menu` VALUES (72, '  面包  ', 1.50, 'http://n1.image.pg0.cn/T1EDKnB5Zt1RCvBVdK.jpg   ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 5, 4, 0);
INSERT INTO `menu` VALUES (73, ' 红烧鸡   ', 4.00, 'http://n1.image.pg0.cn/T1hRhmBmYH1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 1, 4, 0);
INSERT INTO `menu` VALUES (74, ' 黄瓜   ', 1.00, 'http://n5.image.pg0.cn/T1KshfBCAl1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 2, 4, 0);
INSERT INTO `menu` VALUES (75, '  玉米  ', 1.50, 'http://n6.image.pg0.cn/T1gSD_BvJk1RCvBVdK.jpg ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 2, 4, 0);
INSERT INTO `menu` VALUES (76, ' 青菜肉丝   ', 4.00, 'http://n2.image.pg0.cn/T1UvhlBmJA1RCvBVdK.jpg  ', '2019-06-05 13:09:43', '2019-06-13 23:38:23', 1, 4, 0);

-- ----------------------------
-- Table structure for menutype
-- ----------------------------
DROP TABLE IF EXISTS `menutype`;
CREATE TABLE `menutype`  (
  `menuTypeid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`menuTypeid`) USING BTREE,
  INDEX `menuTypeid`(`menuTypeid`) USING BTREE,
  INDEX `menuTypeid_2`(`menuTypeid`) USING BTREE,
  INDEX `menuTypeid_3`(`menuTypeid`) USING BTREE,
  INDEX `menuTypeid_4`(`menuTypeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menutype
-- ----------------------------
INSERT INTO `menutype` VALUES (1, '荤菜', '2019-06-05 14:05:34', '2019-06-05 14:05:36');
INSERT INTO `menutype` VALUES (2, '素菜', '2019-06-05 14:06:32', '2019-06-05 14:06:34');
INSERT INTO `menutype` VALUES (3, '饮品', '2019-06-05 12:51:51', '2019-06-05 12:51:54');
INSERT INTO `menutype` VALUES (4, '粥汤', '2019-06-05 12:52:42', '2019-06-05 12:52:44');
INSERT INTO `menutype` VALUES (5, '粉面', '2019-06-05 12:53:48', '2019-06-05 12:53:50');
INSERT INTO `menutype` VALUES (6, '小吃', '2019-06-05 12:54:44', '2019-06-05 12:54:47');
INSERT INTO `menutype` VALUES (7, '饭类', '2019-06-05 12:50:10', '2019-06-05 12:50:16');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `accountMoney` int(11) NOT NULL,
  `packing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storeid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`orderid`) USING BTREE,
  INDEX `storeid`(`storeid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`storeid`) REFERENCES `store` (`storeid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (44, 3, 'now', 'now', '', 1, 1, '2019-06-21 04:05:46', '2019-06-21 04:05:46');
INSERT INTO `order` VALUES (45, 6, 'packing', 'order', '08-00', 2, 5, '2019-06-21 11:02:35', '2019-06-21 11:02:35');
INSERT INTO `order` VALUES (46, 11, 'packing', 'order', '14-16', 2, 6, '2019-06-21 11:14:33', '2019-06-21 11:14:33');
INSERT INTO `order` VALUES (47, 4, 'packing', 'order', '10-00', 1, 3, '2019-06-27 23:08:19', '2019-06-27 23:08:19');
INSERT INTO `order` VALUES (48, 4, 'packing', 'order', '17-29', 1, 7, '2019-06-27 23:30:13', '2019-06-27 23:30:13');
INSERT INTO `order` VALUES (49, 16, 'packing', 'now', '', 2, 7, '2019-06-27 23:30:46', '2019-06-27 23:30:46');

-- ----------------------------
-- Table structure for ordermenu
-- ----------------------------
DROP TABLE IF EXISTS `ordermenu`;
CREATE TABLE `ordermenu`  (
  `ordermenuid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(11) NOT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ordermenuid`) USING BTREE,
  UNIQUE INDEX `ordermenuid`(`ordermenuid`) USING BTREE,
  INDEX `ordermenu_ibfk_1`(`orderid`) USING BTREE,
  CONSTRAINT `ordermenu_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `order` (`orderid`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordermenu
-- ----------------------------
INSERT INTO `ordermenu` VALUES (17, 44, '米饭', 0.30, 'http://n5.image.pg0.cn/T1pl_IBbJW1RCvBVdK.jpg', 1, '2019-06-21 04:05:46', '2019-06-21 04:05:46');
INSERT INTO `ordermenu` VALUES (18, 44, '炒饭', 3.00, 'http://n2.image.pg0.cn/T12bZpB5_b1RCvBVdK.jpg', 1, '2019-06-21 04:05:46', '2019-06-21 04:05:46');
INSERT INTO `ordermenu` VALUES (19, 45, '  茶叶蛋  ', 1.50, 'http://n2.map.pg0.cn/T1PHY_BTKv1RCvBVdK.jpg  ', 1, '2019-06-21 11:02:36', '2019-06-21 11:02:36');
INSERT INTO `ordermenu` VALUES (20, 45, '  花卷  ', 1.00, 'http://n1.image.pg0.cn/T1h.ASB4_W1RCvBVdK.jpg   ', 1, '2019-06-21 11:02:36', '2019-06-21 11:02:36');
INSERT INTO `ordermenu` VALUES (21, 45, ' 包子   ', 1.00, 'http://n4.map.pg0.cn/T16pY_Bshv1RCvBVdK.jpg ', 1, '2019-06-21 11:02:36', '2019-06-21 11:02:36');
INSERT INTO `ordermenu` VALUES (22, 45, ' 卤鸡蛋   ', 2.00, 'http://n3.image.pg0.cn/T1TpAsB4YI1RCvBVdK.jpg  ', 1, '2019-06-21 11:02:36', '2019-06-21 11:02:36');
INSERT INTO `ordermenu` VALUES (23, 46, ' 红烧排骨   ', 5.00, 'http://n4.map.pg0.cn/T1gxDgBXZv1RCvBVdK.jpg   ', 1, '2019-06-21 11:14:33', '2019-06-21 11:14:33');
INSERT INTO `ordermenu` VALUES (24, 46, '  炒时菜  ', 2.00, 'http://n2.image.pg0.cn/T1p7D5BmZO1RCvBVdK.jpg  ', 2, '2019-06-21 11:14:33', '2019-06-21 11:14:33');
INSERT INTO `ordermenu` VALUES (25, 46, ' 卤鸡蛋   ', 2.00, 'http://n3.image.pg0.cn/T1TpAsB4YI1RCvBVdK.jpg  ', 1, '2019-06-21 11:14:33', '2019-06-21 11:14:33');
INSERT INTO `ordermenu` VALUES (26, 47, '米饭', 0.30, 'http://n5.image.pg0.cn/T1pl_IBbJW1RCvBVdK.jpg', 1, '2019-06-27 23:08:19', '2019-06-27 23:08:19');
INSERT INTO `ordermenu` VALUES (27, 47, '酒香草头', 2.00, 'http://n1.image.pg0.cn/T1kIVMBgVQ1RCvBVdK.jpg', 1, '2019-06-27 23:08:19', '2019-06-27 23:08:19');
INSERT INTO `ordermenu` VALUES (28, 47, '凉拌西红柿', 2.00, 'http://n6.image.pg0.cn/T1PaWSBjxL1RCvBVdK.jpg\r\n', 1, '2019-06-27 23:08:19', '2019-06-27 23:08:19');
INSERT INTO `ordermenu` VALUES (29, 48, '面条', 2.20, 'http://n2.image.pg0.cn/T1DBVzBsZc1RCvBVdK.jpg', 1, '2019-06-27 23:30:14', '2019-06-27 23:30:14');
INSERT INTO `ordermenu` VALUES (30, 48, '红豆粥', 1.00, 'http://n2.image.pg0.cn/T1ujZlBmLO1RCvBVdK.jpg\r\n', 1, '2019-06-27 23:30:14', '2019-06-27 23:30:14');
INSERT INTO `ordermenu` VALUES (31, 48, '米饭', 0.30, 'http://n5.image.pg0.cn/T1pl_IBbJW1RCvBVdK.jpg', 1, '2019-06-27 23:30:14', '2019-06-27 23:30:14');
INSERT INTO `ordermenu` VALUES (32, 49, ' 红烧排骨   ', 5.00, 'http://n4.map.pg0.cn/T1gxDgBXZv1RCvBVdK.jpg   ', 1, '2019-06-27 23:30:46', '2019-06-27 23:30:46');
INSERT INTO `ordermenu` VALUES (33, 49, '  回锅肉  ', 5.00, 'http://n4.map.pg0.cn/T1_1CvB5_g1RCvBVdK.jpg  ', 1, '2019-06-27 23:30:46', '2019-06-27 23:30:46');
INSERT INTO `ordermenu` VALUES (34, 49, '  草鱼  ', 6.00, 'http://n4.image.pg0.cn/T1TUxnBgAz1RCvBVdK.jpg  ', 1, '2019-06-27 23:30:46', '2019-06-27 23:30:46');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `storeid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`storeid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES (1, '食堂一楼窗口', 'http://n1.image.pg0.cn/T1A6DlBsZk1RCvBVdK.jpg', '食堂一楼', '优', '2019-06-05 17:26:43', '2019-06-05 17:26:47');
INSERT INTO `store` VALUES (2, '食堂二楼窗口', 'http://n2.image.pg0.cn/T1pmC0B4ZT1RCvBVdK.jpg', '食堂二楼', '优', '2019-06-05 17:26:59', '2019-06-05 17:27:01');
INSERT INTO `store` VALUES (3, '菊花过桥米线', 'http://n5.image.pg0.cn/T1sSVsBjYA1RCvBVdK.jpg', '食堂二楼', '良', '2019-06-05 17:27:12', '2019-06-05 17:27:14');
INSERT INTO `store` VALUES (4, '冒菜', 'http://n4.map.pg0.cn/T1X1YvBjEg1RCvBVdK.jpg', '食堂二楼', '良', '2019-06-13 15:17:50', '2019-06-13 15:17:53');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'shuaiguos', '458657425@qq.com', '$2a$10$.ggvMyX2WrJkkX8UA/JAieMtmjL0TxgQoqxf/sp/WqxSlTR6rXdia', '2019-06-05 19:39:37', '2019-06-06 16:22:54');
INSERT INTO `user` VALUES (2, 'xuxu', '123@qq.com', '$2a$10$tCRjhSBpdg2AdQbSu6cxK.J25qJvesbI41KKLOH4Hs0oDC64m0Af2', '2019-06-06 18:15:52', '2019-06-06 18:17:09');
INSERT INTO `user` VALUES (3, 'xuxu', '127@qq.com', '$2a$10$hPDWmN2QsV0WNQx0wDzi/.dsQAEVVfGArtf2lCs00VFz2ZRi8ctmK', '2019-06-06 18:20:39', '2019-06-06 18:21:23');
INSERT INTO `user` VALUES (4, 'shuaiguos', '45865s7425@qq.com', '$2a$10$lETHxwiGy30DVyfrBVwduuazVTv2A8sLLZczRZ3PW5P96jdUZP8FW', '2019-06-09 17:20:02', '2019-06-09 17:20:02');
INSERT INTO `user` VALUES (5, 'fangzhiyuan', 'fzy@qq.com', '$2a$10$8A8FuaXD76Q2H8rukLv2Q.e/oEGXeeeO6z8PdwF37X0pwwOI5/7ym', '2019-06-21 02:30:36', '2019-06-21 02:30:36');
INSERT INTO `user` VALUES (6, '崔fer崔fer', '631242968@qq.com', '$2a$10$FETMM.Sq3uNFJi8t.LsVMu6aryC0OLEqwLwMKMgv0XNV0CNpobJrm', '2019-06-21 11:12:08', '2019-06-21 11:12:08');
INSERT INTO `user` VALUES (7, 'Xuxu', '1275488382@qq.com', '$2a$10$kWqt.E7RVgicQ/O.MZyzy.DcIQlnuGsv8t54xD7LcZntVxc0JdPV6', '2019-06-27 23:28:22', '2019-06-27 23:28:22');

SET FOREIGN_KEY_CHECKS = 1;
