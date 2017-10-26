/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50157
Source Host           : localhost:3306
Source Database       : tjsqyygl

Target Server Type    : MYSQL
Target Server Version : 50157
File Encoding         : 65001

Date: 2016-09-25 20:18:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bl`
-- ----------------------------
DROP TABLE IF EXISTS `bl`;
CREATE TABLE `bl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blno` varchar(255) DEFAULT NULL,
  `keshi` varchar(255) DEFAULT NULL,
  `isyb` varchar(255) DEFAULT NULL,
  `bingr` varchar(255) DEFAULT NULL,
  `sfid` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `jwbs` varchar(255) DEFAULT NULL,
  `zs` varchar(255) DEFAULT NULL,
  `zdjg` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bl
-- ----------------------------
INSERT INTO `bl` VALUES ('11', '201512271820000001', '内科', '是', '张三', '420983199311214719', '男', '2015-12-16', '无', '发烧', '发烧', 'test18', '2016-09-27 21:13:00');
INSERT INTO `bl` VALUES ('12', '201512272112040003', '外科', '否', '', '', '', '', '', '', '', '', '2016-09-27 21:13:00');
INSERT INTO `bl` VALUES ('13', '201512272112470005', '内科', '是', '李四', '400000000000000000000', '女', '2015-11-10', '无', '感冒', '感冒', 'test18', '2016-09-27 21:13:00');
INSERT INTO `bl` VALUES ('14', '20160925190300', '中医科', '是', '张三风', '123123123123123123', '男', '2016-08-31', '无', '皮肤痒', '湿疹。', 'doctor', '2016-09-25 19:03:06');
INSERT INTO `bl` VALUES ('15', '20160925201400', '耳鼻喉科', '是', '李莉', '222333111222333111', '女', '2016-08-28', '无', '喉咙疼', '感冒', 'D001', '2016-09-25 20:14:28');

-- ----------------------------
-- Table structure for `kucun`
-- ----------------------------
DROP TABLE IF EXISTS `kucun`;
CREATE TABLE `kucun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yaopin` varchar(255) DEFAULT NULL,
  `rkdate` varchar(255) DEFAULT NULL,
  `tnum` varchar(255) DEFAULT NULL,
  `pichi` varchar(255) DEFAULT NULL,
  `totprice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kucun
-- ----------------------------
INSERT INTO `kucun` VALUES ('1', '清开灵', '2016-09-27', '32', 'pt001', '1000');
INSERT INTO `kucun` VALUES ('4', '氨酚咖敏片', '2016-09-27', '100', 'pt100', '2000');
INSERT INTO `kucun` VALUES ('5', '阿司匹林', '2016-09-27', '30', 'pt102', '600');
INSERT INTO `kucun` VALUES ('6', '白加黑', '2016-09-25', '100', '1', '1200');
INSERT INTO `kucun` VALUES ('7', '银杏叶片', '2016-09-25', '10', '123', '380');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `userid` tinyint(11) NOT NULL COMMENT '操作者的id',
  `tname` varchar(255) DEFAULT NULL COMMENT '操作者的姓名',
  `blno` varchar(255) DEFAULT NULL COMMENT '相关病历号',
  `savetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sfid` varchar(255) DEFAULT NULL COMMENT '相关用户的身份证号',
  `oper` varchar(256) DEFAULT NULL COMMENT '相关操作',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '1', '小胡', null, '2015-11-28 11:14:33', null, '登录');
INSERT INTO `log` VALUES ('2', '9', '老张', '201511011101010', '2015-11-28 11:42:11', '40432424234234', '修改');
INSERT INTO `log` VALUES ('3', '9', '老张', '', '2015-11-28 14:50:36', '', '登录');
INSERT INTO `log` VALUES ('4', '1', '小胡', '', '2015-11-28 14:56:35', '', '登录');
INSERT INTO `log` VALUES ('5', '9', '老张', '', '2015-11-28 16:08:29', '', '登录');
INSERT INTO `log` VALUES ('6', '9', '老张', '', '2015-11-28 16:15:48', '', '登录');
INSERT INTO `log` VALUES ('7', '1', '小胡', '', '2015-11-28 16:16:23', '', '登录');
INSERT INTO `log` VALUES ('8', '9', '老张', '', '2015-11-28 16:18:58', '', '登录');
INSERT INTO `log` VALUES ('9', '9', '老张', '', '2015-11-28 16:27:20', '', '登录');
INSERT INTO `log` VALUES ('10', '9', '老张', '', '2015-11-28 16:30:33', '', '登录');
INSERT INTO `log` VALUES ('11', '1', '小胡', '', '2015-11-28 16:33:42', '', '登录');
INSERT INTO `log` VALUES ('12', '9', '老张', '', '2015-11-28 16:37:53', '', '登录');
INSERT INTO `log` VALUES ('13', '10', '老李', '', '2015-11-28 16:38:27', '', '登录');
INSERT INTO `log` VALUES ('14', '9', '老张', '', '2015-11-28 16:40:09', '', '登录');
INSERT INTO `log` VALUES ('15', '8', '老王', '', '2015-11-28 16:50:31', '', '登录');
INSERT INTO `log` VALUES ('16', '1', '小胡', '', '2015-11-29 22:54:40', '', '登录');
INSERT INTO `log` VALUES ('17', '10', '老李', '', '2015-11-29 22:55:52', '', '登录');
INSERT INTO `log` VALUES ('18', '9', '老张', '', '2015-11-29 22:56:29', '', '登录');
INSERT INTO `log` VALUES ('19', '10', '老李', '', '2015-11-29 22:58:53', '', '登录');
INSERT INTO `log` VALUES ('20', '10', '老李', '', '2015-11-29 23:39:45', '', '登录');
INSERT INTO `log` VALUES ('21', '10', '老李', '', '2015-11-29 23:53:09', '', '登录');
INSERT INTO `log` VALUES ('22', '10', '老李', '', '2015-12-01 20:00:31', '', '登录');
INSERT INTO `log` VALUES ('23', '10', '老李', '', '2015-12-01 20:02:17', '', '登录');
INSERT INTO `log` VALUES ('24', '1', '小胡', '', '2015-12-26 12:30:57', '', '登录');
INSERT INTO `log` VALUES ('25', '1', '小胡', '', '2015-12-26 12:52:44', '', '登录');
INSERT INTO `log` VALUES ('26', '1', '小胡', '', '2015-12-26 12:57:38', '', '登录');
INSERT INTO `log` VALUES ('27', '1', 'admin', '', '2015-12-26 14:11:45', '', '登录');
INSERT INTO `log` VALUES ('28', '1', 'admin', '', '2015-12-26 23:53:35', '', '登录');
INSERT INTO `log` VALUES ('29', '1', 'admin', '', '2015-12-27 16:27:35', '', '登录');
INSERT INTO `log` VALUES ('30', '1', 'admin', '', '2015-12-27 16:27:36', '', '登录');
INSERT INTO `log` VALUES ('31', '1', 'admin', '', '2015-12-27 16:29:45', '', '登录');
INSERT INTO `log` VALUES ('32', '15', '张伟', '', '2015-12-27 16:29:58', '', '登录');
INSERT INTO `log` VALUES ('33', '1', 'admin', '', '2015-12-27 17:00:38', '', '登录');
INSERT INTO `log` VALUES ('34', '1', 'admin', '', '2015-12-27 17:01:13', '', '登录');
INSERT INTO `log` VALUES ('35', '15', '张伟', '', '2015-12-27 17:52:20', '', '登录');
INSERT INTO `log` VALUES ('36', '18', '老刘', '', '2015-12-27 18:04:10', '', '登录');
INSERT INTO `log` VALUES ('38', '1', 'admin', '', '2015-12-27 18:09:11', '', '登录');
INSERT INTO `log` VALUES ('39', '15', '张伟', '', '2015-12-27 18:19:42', '', '登录');
INSERT INTO `log` VALUES ('40', '15', 'test12', '201512271820000001', '2015-12-27 18:20:11', '', '创建病例');
INSERT INTO `log` VALUES ('41', '1', 'admin', '', '2015-12-27 18:20:32', '', '登录');
INSERT INTO `log` VALUES ('42', '1', 'admin', '', '2015-12-27 18:21:14', '', '登录');
INSERT INTO `log` VALUES ('43', '18', '老刘', '', '2015-12-27 18:21:28', '', '登录');
INSERT INTO `log` VALUES ('45', '18', 'test18', '201512271820000001', '2015-12-27 18:25:41', '', '创建处方');
INSERT INTO `log` VALUES ('46', '1', 'admin', '', '2015-12-27 18:25:53', '', '登录');
INSERT INTO `log` VALUES ('47', '1', 'admin', '', '2015-12-27 19:30:36', '', '登录');
INSERT INTO `log` VALUES ('48', '15', '张伟', '', '2015-12-27 19:31:02', '', '登录');
INSERT INTO `log` VALUES ('49', '15', '张伟', '', '2015-12-27 21:11:54', '', '登录');
INSERT INTO `log` VALUES ('50', '15', 'test12', '201512272112040003', '2015-12-27 21:12:22', '', '创建病例');
INSERT INTO `log` VALUES ('51', '15', 'test12', '201512272112470005', '2015-12-27 21:13:00', '', '创建病例');
INSERT INTO `log` VALUES ('52', '18', '老刘', '', '2015-12-27 21:18:55', '', '登录');
INSERT INTO `log` VALUES ('53', '18', 'test18', '201512272112470005', '2015-12-27 21:19:48', '400000000000000000000', '修改病历');
INSERT INTO `log` VALUES ('54', '1', 'admin', '', '2015-12-27 21:20:47', '', '登录');
INSERT INTO `log` VALUES ('55', '8', '老王', '', '2015-12-27 21:23:46', '', '登录');
INSERT INTO `log` VALUES ('56', '8', 'K001', '', '2015-12-27 21:34:52', '', '药品入库');
INSERT INTO `log` VALUES ('57', '1', 'admin', '', '2015-12-31 13:50:08', '', '登录');
INSERT INTO `log` VALUES ('58', '1', 'admin', '', '2015-12-31 13:53:15', '', '登录');
INSERT INTO `log` VALUES ('59', '9', '老张', '', '2015-12-31 14:53:11', '', '登录');
INSERT INTO `log` VALUES ('60', '1', 'admin', '', '2015-12-31 15:24:29', '', '登录');
INSERT INTO `log` VALUES ('61', '10', '老李', '', '2015-12-31 15:38:43', '', '登录');
INSERT INTO `log` VALUES ('62', '8', '老王', '', '2015-12-31 15:39:13', '', '登录');
INSERT INTO `log` VALUES ('63', '1', 'admin', '', '2016-01-16 18:38:07', '', '登录');
INSERT INTO `log` VALUES ('64', '9', '老张', '', '2016-01-16 18:39:05', '', '登录');
INSERT INTO `log` VALUES ('65', '8', '老王', '', '2016-01-16 18:40:32', '', '登录');
INSERT INTO `log` VALUES ('66', '1', 'admin', '', '2016-09-25 19:00:31', '', '登录');
INSERT INTO `log` VALUES ('67', '12', '打算', '', '2016-09-25 19:00:58', '', '登录');
INSERT INTO `log` VALUES ('68', '10', '老李', '', '2016-09-25 19:02:31', '', '登录');
INSERT INTO `log` VALUES ('69', '1', 'admin', '', '2016-09-25 19:03:31', '', '登录');
INSERT INTO `log` VALUES ('70', '21', '刘亦菲', '', '2016-09-25 19:04:28', '', '登录');
INSERT INTO `log` VALUES ('71', '10', '老李', '', '2016-09-25 19:07:13', '', '登录');
INSERT INTO `log` VALUES ('72', '10', '老李', '', '2016-09-25 19:38:04', '', '登录');
INSERT INTO `log` VALUES ('73', '10', '老李', '', '2016-09-25 19:45:53', '', '登录');
INSERT INTO `log` VALUES ('74', '10', '老李', '', '2016-09-25 19:51:45', '', '登录');
INSERT INTO `log` VALUES ('75', '10', '老李', '', '2016-09-25 19:52:42', '', '登录');
INSERT INTO `log` VALUES ('76', '10', '老李', '', '2016-09-25 19:55:41', '', '登录');
INSERT INTO `log` VALUES ('77', '8', '老王', '', '2016-09-25 19:57:05', '', '登录');
INSERT INTO `log` VALUES ('78', '1', 'admin', '', '2016-09-25 20:11:39', '', '登录');
INSERT INTO `log` VALUES ('79', '8', '老王', '', '2016-09-25 20:12:38', '', '登录');
INSERT INTO `log` VALUES ('80', '10', '老李', '', '2016-09-25 20:14:01', '', '登录');
INSERT INTO `log` VALUES ('81', '9', '老张', '', '2016-09-25 20:14:48', '', '登录');
INSERT INTO `log` VALUES ('82', '10', '老李', '', '2016-09-25 20:15:44', '', '登录');
INSERT INTO `log` VALUES ('83', '9', '老张', '', '2016-09-25 20:16:08', '', '登录');
INSERT INTO `log` VALUES ('84', '10', '老李', '', '2016-09-25 20:16:40', '', '登录');

-- ----------------------------
-- Table structure for `shoufei`
-- ----------------------------
DROP TABLE IF EXISTS `shoufei`;
CREATE TABLE `shoufei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blno` varchar(255) DEFAULT NULL,
  `yaopinxx` varchar(255) DEFAULT NULL,
  `totprice` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoufei
-- ----------------------------
INSERT INTO `shoufei` VALUES ('2', '201304131639550007', '三九胃太 - 单价:22 - 数量:1 ~ 清开灵 - 单价:11 - 数量:2', '44', '已取药');
INSERT INTO `shoufei` VALUES ('4', '201512271820000001', '清开灵 - 单价:11 - 数量:2 ~ 清开灵 - 单价:11 - 数量:4', '66', '已取药');
INSERT INTO `shoufei` VALUES ('5', '20160925190300', '布洛芬颗粒 - 单价:16 - 数量:1', '16', '已取药');
INSERT INTO `shoufei` VALUES ('6', '20160925201400', '白加黑 - 单价:10 - 数量:1', '10', '已取药');

-- ----------------------------
-- Table structure for `sysuser`
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  `utype` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `addrs` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT 'no.jpg',
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('1', 'admin', '123456', '管理员', 'admin', '男', '13733422488', '131313@qq.com', '1312312312', 'no.jpg', '2016-09-25 19:04:17');
INSERT INTO `sysuser` VALUES ('8', 'K001', '123456', '库管人员', '老王', '女', '02911111111', '123@123.com', '三号楼', 'no.jpg', '2016-09-25 19:04:17');
INSERT INTO `sysuser` VALUES ('9', 'D001', '123456', '医生', '老张', '女', '02911111111', '132@123.com', '山东济南友谊', 'no.jpg', '2016-09-25 19:04:17');
INSERT INTO `sysuser` VALUES ('10', 'C001', '123456', '窗口人员', '老李', '女', '02911111111', '1d23@qq.com', '深圳市', 'no.jpg', '2016-09-25 19:04:17');
INSERT INTO `sysuser` VALUES ('12', 'test', '123456', '医生', '打算', '男', '111000001010', '54543534', '3131231231', 'no.jpg', '2016-09-25 19:04:17');
INSERT INTO `sysuser` VALUES ('20', '测试', '123456', '管理员', '姓名', '女', '13132131', '3123123@qq.com', '深圳', 'no.jpg', '2016-09-25 19:04:17');
INSERT INTO `sysuser` VALUES ('21', 'doctor', '123456', '医生', '刘亦菲', '女', '88881234', 'lyf@qq.com', '本院', 'no.jpg', '2016-09-25 19:04:17');
INSERT INTO `sysuser` VALUES ('22', 'C002', '123456', '窗口人员', '收费员', '女', '68123123', 'c003@qq.com', '本院', '', '2016-09-25 20:12:14');

-- ----------------------------
-- Table structure for `yaopin`
-- ----------------------------
DROP TABLE IF EXISTS `yaopin`;
CREATE TABLE `yaopin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yname` varchar(255) DEFAULT NULL,
  `factory` varchar(255) DEFAULT NULL,
  `syz` varchar(255) DEFAULT NULL,
  `jj` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `isyb` varchar(255) DEFAULT NULL,
  `ybprice` varchar(255) DEFAULT NULL,
  `bei` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yaopin
-- ----------------------------
INSERT INTO `yaopin` VALUES ('3', '清开灵', '哈药一厂', '火气大', '无', '12', '是', '11', '可以', '201304131609050001.jpg');
INSERT INTO `yaopin` VALUES ('4', '氨酚咖敏片', '哇哈哈制药厂', '主治用于感冒、发热、头痛、神经痛及风湿痛等症。', '1.对氨基比林、咖啡因、马来酸氯苯那敏过敏者禁用。', '20', '是', '15', '口服。一次1片，一日3次或遵医嘱 -----用于感冒、发热、 800 头痛、神经痛及风湿痛等 ', '201511281255130002.jpg');
INSERT INTO `yaopin` VALUES ('5', '布洛芬颗粒', '齐齐哈尔', '轻到中度的偏头痛发作期的治疗，偏头痛的预防性治疗。', '有潜在的消化性溃疡患者应慎用此药', '20', '是', '16', '轻或中等疼痛及痛经的止痛，一次0.2～0.4g，每4～6小时1次。成人用药最大限量一般为每日2.4g。', '201512272129580007.jpg');
INSERT INTO `yaopin` VALUES ('6', '阿司匹林', '哈药一厂', '用于发热、疼痛及类风湿关节炎等 ', '非甾体抗炎药过敏者禁用 ', '35', '否', '', '解热、镇痛，每日按体表面积1.5g/平方米，分4～6次口服，或每次按体重5—10mg/kg，或每次每岁60mg，必要时4～6小时1次。', '');
INSERT INTO `yaopin` VALUES ('7', '白加黑', '哈药集团', '感冒', '孕妇禁用', '12', '是', '10', '白天服白片；晚上吃黑片。', '');
INSERT INTO `yaopin` VALUES ('8', '银杏叶片', '扬子江药业', '头晕', '孕妇禁用', '38', '是', '36', '每日一次，一次1颗', '');

-- ----------------------------
-- Table structure for `yongyao`
-- ----------------------------
DROP TABLE IF EXISTS `yongyao`;
CREATE TABLE `yongyao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blno` varchar(255) DEFAULT NULL,
  `yaoping` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yongyao
-- ----------------------------
INSERT INTO `yongyao` VALUES ('13', '201512271820000001', '清开灵 - 单价:11', '2', '已取药');
INSERT INTO `yongyao` VALUES ('14', '201512271820000001', '清开灵 - 单价:11', '4', '已取药');
INSERT INTO `yongyao` VALUES ('15', '20160925190300', '布洛芬颗粒 - 单价:16', '1', '已取药');
INSERT INTO `yongyao` VALUES ('16', '20160925201400', '白加黑 - 单价:10', '1', '已取药');
