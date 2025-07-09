/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : db_school_trade

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2025-07-04 10:22:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sh_address
-- ----------------------------
DROP TABLE IF EXISTS `sh_address`;
CREATE TABLE `sh_address` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `consignee_name` varchar(32) NOT NULL COMMENT '收货人姓名',
  `consignee_phone` varchar(16) NOT NULL COMMENT '收货人手机号',
  `province_name` varchar(32) NOT NULL COMMENT '省',
  `city_name` varchar(32) NOT NULL COMMENT '市',
  `region_name` varchar(32) NOT NULL COMMENT '区',
  `detail_address` varchar(64) NOT NULL COMMENT '详细地址',
  `default_flag` tinyint NOT NULL COMMENT '是否默认地址',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sh_address
-- ----------------------------
INSERT INTO `sh_address` VALUES ('30', '陈xx', '17777777777', '天津市', '市辖区', '和平区', '浙江省杭州市余杭区xx街道xx小区', '1', '11');
INSERT INTO `sh_address` VALUES ('31', '陈xx', '18888888888', '北京市', '市辖区', '西城区', '北京xx路xx小区', '1', '12');
INSERT INTO `sh_address` VALUES ('32', 'aaa', '11111111111', '北京市', '市辖区', '东城区', 'gugong', '1', '13');

-- ----------------------------
-- Table structure for sh_admin
-- ----------------------------
DROP TABLE IF EXISTS `sh_admin`;
CREATE TABLE `sh_admin` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) NOT NULL COMMENT '管理员账号',
  `admin_password` varchar(16) NOT NULL COMMENT '密码',
  `admin_name` varchar(8) NOT NULL COMMENT '管理员名字',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_number` (`account_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sh_admin
-- ----------------------------
INSERT INTO `sh_admin` VALUES ('1', 'admin', '123456', '超级管理员');
INSERT INTO `sh_admin` VALUES ('13', '1866666666', '123456', 'admin');

-- ----------------------------
-- Table structure for sh_favorite
-- ----------------------------
DROP TABLE IF EXISTS `sh_favorite`;
CREATE TABLE `sh_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键id',
  `create_time` datetime NOT NULL COMMENT '加入收藏的时间',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置物主键id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`idle_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sh_favorite
-- ----------------------------
INSERT INTO `sh_favorite` VALUES ('48', '2025-04-05 14:29:40', '12', '112');

-- ----------------------------
-- Table structure for sh_idle_item
-- ----------------------------
DROP TABLE IF EXISTS `sh_idle_item`;
CREATE TABLE `sh_idle_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `idle_name` varchar(64) NOT NULL COMMENT '闲置物名称',
  `idle_details` varchar(2048) NOT NULL COMMENT '详情',
  `picture_list` varchar(1024) NOT NULL COMMENT '图集',
  `idle_price` decimal(10,2) NOT NULL COMMENT '价格',
  `idle_place` varchar(32) NOT NULL COMMENT '发货地区',
  `idle_label` int NOT NULL COMMENT '分类标签',
  `release_time` datetime NOT NULL COMMENT '发布时间',
  `idle_status` tinyint NOT NULL COMMENT '状态（发布1、下架2、删除0）',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sh_idle_item
-- ----------------------------
INSERT INTO `sh_idle_item` VALUES ('106', '电脑', '电脑', '[\"http://localhost:8080/image?imageName=file17044644744561006个人博客.jpg\"]', '3000.00', '阳泉市', '1', '2025-01-05 14:21:16', '2', '11');
INSERT INTO `sh_idle_item` VALUES ('107', '电视机', '电视机', '[\"http://localhost:8080/image?imageName=file17044645972761007电影.jpg\"]', '5999.00', '长治市', '2', '2025-01-05 14:23:19', '0', '11');
INSERT INTO `sh_idle_item` VALUES ('108', '空调', '空调', '[\"http://localhost:8080/image?imageName=file17044646299941008停车场.jpg\"]', '1000.00', '景德镇市', '2', '2025-01-05 14:23:51', '0', '11');
INSERT INTO `sh_idle_item` VALUES ('109', '历史书', '历史书', '[\"http://localhost:8080/image?imageName=file17044646674121009音乐.jpg\"]', '20.00', '乌海市', '4', '2025-01-05 14:24:33', '0', '11');
INSERT INTO `sh_idle_item` VALUES ('110', '帐篷', '帐篷', '[\"http://localhost:8080/image?imageName=file17044647092251010社团.jpg\"]', '100.00', '秦皇岛市', '3', '2025-01-05 14:25:22', '0', '11');
INSERT INTO `sh_idle_item` VALUES ('111', '自行车', '自行车', '[\"http://localhost:8080/image?imageName=file17044647567061011考试.jpg\"]', '599.00', '市辖区', '5', '2025-01-05 14:26:00', '0', '11');
INSERT INTO `sh_idle_item` VALUES ('112', '衣服', '衣服', '[\"http://localhost:8080/image?imageName=file17044647909181012图书馆.png\"]', '199.00', '长治市', '5', '2025-01-05 14:26:38', '0', '11');
INSERT INTO `sh_idle_item` VALUES ('114', '充电器', '手机充电器', '[\"http://localhost:8080/image?imageName=file173632734574010049137910224_1507092412.jpg\"]', '0.58', '秦皇岛市', '1', '2025-01-08 09:09:08', '0', '11');
INSERT INTO `sh_idle_item` VALUES ('115', '手机', 'iPhone16', '[\"http://localhost:8080/image?imageName=file17363274246821005OIP-C (2).jpg\"]', '3999.00', '市辖区', '1', '2025-01-08 09:10:40', '0', '11');
INSERT INTO `sh_idle_item` VALUES ('116', '自行车', '车子', '[\"http://localhost:8080/image?imageName=file17515423493441002c0c149f9e30a7fa0ee806e098d251d8.png\"]', '50.00', '市辖区', '5', '2025-07-03 11:32:31', '1', '12');
INSERT INTO `sh_idle_item` VALUES ('117', '书', 'book', '[\"http://localhost:8080/image?imageName=file17515941004561002生成登录背景图 (1).png\"]', '5.00', '市辖区', '4', '2025-07-04 01:55:04', '2', '12');
INSERT INTO `sh_idle_item` VALUES ('118', '书2', '多读书', '[\"http://localhost:8080/image?imageName=file17515941413071003生成登录背景图 (2).png\"]', '6.00', '市辖区', '4', '2025-07-04 01:55:42', '1', '12');
INSERT INTO `sh_idle_item` VALUES ('119', '手机', '买到就是赚到', '[\"http://localhost:8080/image?imageName=file17515942744061004de83c09b6d5e19dc473f4958612afbd.png\"]', '2000.00', '高雄市', '1', '2025-07-04 01:57:58', '1', '12');
INSERT INTO `sh_idle_item` VALUES ('120', '小车车', '跑得快，省时间', '[\"http://localhost:8080/image?imageName=file17515944900251005cea64d98918dee769be6af0e5100b7e.png\"]', '288.00', '大同市', '2', '2025-07-04 02:02:08', '1', '12');
INSERT INTO `sh_idle_item` VALUES ('121', '户外测试', '户外', '[\"http://localhost:8080/image?imageName=file175159459439710067d01881fb456fcf539049ac96d61f39.png\"]', '166.00', '晋城市', '3', '2025-07-04 02:03:20', '1', '12');

-- ----------------------------
-- Table structure for sh_message
-- ----------------------------
DROP TABLE IF EXISTS `sh_message`;
CREATE TABLE `sh_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置主键id',
  `content` varchar(256) NOT NULL COMMENT '留言内容',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `to_user` bigint NOT NULL COMMENT '所回复的用户',
  `to_message` bigint DEFAULT NULL COMMENT '所回复的留言',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id_index` (`user_id`) USING BTREE,
  KEY `idle_id_index` (`idle_id`) USING BTREE,
  KEY `to_user_index` (`to_user`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sh_message
-- ----------------------------
INSERT INTO `sh_message` VALUES ('48', '11', '112', '多少钱', '2025-01-05 14:26:48', '11', null);
INSERT INTO `sh_message` VALUES ('49', '11', '111', '这个可以便宜点么？', '2025-01-05 14:27:03', '11', null);
INSERT INTO `sh_message` VALUES ('50', '11', '111', '可以', '2025-01-05 14:27:19', '11', '49');
INSERT INTO `sh_message` VALUES ('51', '11', '107', '东西怎么买啊？人在哪？', '2025-01-06 00:32:51', '11', null);
INSERT INTO `sh_message` VALUES ('52', '11', '105', '东西怎么买？', '2025-01-06 00:33:54', '11', null);
INSERT INTO `sh_message` VALUES ('53', '12', '114', '宝贝在吗', '2025-01-08 10:06:17', '11', null);
INSERT INTO `sh_message` VALUES ('54', '11', '114', '在的', '2025-01-08 10:07:36', '12', '53');
INSERT INTO `sh_message` VALUES ('55', '11', '114', 'hello', '2025-01-08 10:21:34', '11', null);
INSERT INTO `sh_message` VALUES ('56', '12', '120', '欢迎购买！！！', '2025-07-04 02:02:26', '12', null);

-- ----------------------------
-- Table structure for sh_order
-- ----------------------------
DROP TABLE IF EXISTS `sh_order`;
CREATE TABLE `sh_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_number` varchar(32) NOT NULL COMMENT '订单编号',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置物品主键id',
  `order_price` decimal(10,2) NOT NULL COMMENT '订单总价',
  `payment_status` tinyint NOT NULL COMMENT '支付状态',
  `payment_way` varchar(16) DEFAULT NULL COMMENT '支付方式',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `order_status` tinyint NOT NULL COMMENT '订单状态',
  `is_deleted` tinyint DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sh_order
-- ----------------------------
INSERT INTO `sh_order` VALUES ('90', '175154008924210002', '13', '110', '100.00', '0', null, '2025-07-03 10:54:49', null, '0', null);
INSERT INTO `sh_order` VALUES ('91', '175154095569310002', '13', '107', '5999.00', '0', null, '2025-07-03 11:09:16', null, '4', null);
INSERT INTO `sh_order` VALUES ('92', '175154116023010003', '13', '106', '3000.00', '1', '支付宝', '2025-07-03 11:12:40', '2025-07-03 11:12:45', '1', null);
INSERT INTO `sh_order` VALUES ('93', '175154250433910004', '13', '109', '20.00', '1', '支付宝', '2025-07-03 11:35:04', '2025-07-03 11:35:08', '1', null);
INSERT INTO `sh_order` VALUES ('94', '175159428715810002', '12', '107', '5999.00', '0', null, '2025-07-04 01:58:07', null, '4', null);
INSERT INTO `sh_order` VALUES ('95', '175159541860910002', '13', '117', '5.00', '1', '支付宝', '2025-07-04 02:16:59', '2025-07-04 02:17:14', '1', null);

-- ----------------------------
-- Table structure for sh_order_address
-- ----------------------------
DROP TABLE IF EXISTS `sh_order_address`;
CREATE TABLE `sh_order_address` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `consignee_name` varchar(32) NOT NULL COMMENT '收货人',
  `consignee_phone` varchar(32) NOT NULL COMMENT '电话',
  `detail_address` varchar(128) NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `orderId` (`order_id`) USING BTREE,
  KEY `order_id_index` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sh_order_address
-- ----------------------------
INSERT INTO `sh_order_address` VALUES ('21', '86', '陈xx', '18888888888', '北京市市辖区西城区北京xx路xx小区');
INSERT INTO `sh_order_address` VALUES ('22', '85', '陈xx', '18888888888', '北京市市辖区西城区北京xx路xx小区');
INSERT INTO `sh_order_address` VALUES ('23', '87', '陈xx', '18888888888', '北京市市辖区西城区北京xx路xx小区');
INSERT INTO `sh_order_address` VALUES ('24', '88', '陈xx', '18888888888', '北京市市辖区西城区北京xx路xx小区');
INSERT INTO `sh_order_address` VALUES ('25', '89', '陈xx', '18888888888', '北京市市辖区西城区北京xx路xx小区');
INSERT INTO `sh_order_address` VALUES ('26', '92', 'aaa', '11111111111', '北京市市辖区东城区gugong');
INSERT INTO `sh_order_address` VALUES ('27', '93', 'aaa', '11111111111', '北京市市辖区东城区gugong');
INSERT INTO `sh_order_address` VALUES ('28', '94', '陈xx', '18888888888', '北京市市辖区西城区北京xx路xx小区');
INSERT INTO `sh_order_address` VALUES ('29', '95', 'aaa', '11111111111', '北京市市辖区东城区gugong');

-- ----------------------------
-- Table structure for sh_user
-- ----------------------------
DROP TABLE IF EXISTS `sh_user`;
CREATE TABLE `sh_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) NOT NULL COMMENT '账号（手机号）',
  `user_password` varchar(16) NOT NULL COMMENT '登录密码',
  `nickname` varchar(32) NOT NULL COMMENT '昵称',
  `avatar` varchar(256) NOT NULL COMMENT '头像',
  `sign_in_time` datetime NOT NULL COMMENT '注册时间',
  `user_status` tinyint DEFAULT NULL COMMENT '状态（1代表封禁）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_number` (`account_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sh_user
-- ----------------------------
INSERT INTO `sh_user` VALUES ('11', '17777777777', '111111', 'user', 'http://localhost:8080/image?imageName=file1736330384756100620180523140227_uvzic.jpg', '2025-01-05 13:20:06', null);
INSERT INTO `sh_user` VALUES ('12', '18888888888', '111111', 'user2', 'http://localhost:8080/image?imageName=file17363305660571008OIP-C (1).jpg', '2025-01-05 14:29:24', null);
INSERT INTO `sh_user` VALUES ('13', '11111111111', '111111', '111', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', '2025-07-03 10:53:08', null);
