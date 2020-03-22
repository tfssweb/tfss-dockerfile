CREATE DATABASE db_equipment default character set utf8 collate utf8_general_ci;
use db_equipment
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登陆名',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `user_status` varchar(255) DEFAULT NULL COMMENT '内容',
  `client_ip` varchar(255) DEFAULT NULL COMMENT '客户端ip',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'ceshi', null, '登陆成功', '127.0.0.1', '2016-11-13 22:35:00');
INSERT INTO `sys_log` VALUES ('2', 'ceshi', '管理员', '登陆成功', '127.0.0.1', '2016-11-13 22:37:50');
INSERT INTO `sys_log` VALUES ('3', 'ceshi', '管理员', '禁止登陆', '127.0.0.1', '2016-11-13 22:38:34');
INSERT INTO `sys_log` VALUES ('4', 'ceshi', '管理员', '登陆成功', '127.0.0.1', '2016-11-13 22:39:05');
INSERT INTO `sys_log` VALUES ('5', 'ceshi', '管理员', '登陆成功', '127.0.0.1', '2016-11-13 22:42:52');
INSERT INTO `sys_log` VALUES ('6', 'ceshi', '管理员', '登陆成功', '127.0.0.1', '2016-11-14 00:02:40');
INSERT INTO `sys_log` VALUES ('7', 'ceshi', '管理员', '登陆成功', '127.0.0.1', '2016-11-14 19:00:24');
INSERT INTO `sys_log` VALUES ('8', 'ceshi', '管理员', '登陆成功', '127.0.0.1', '2016-11-14 19:13:41');
INSERT INTO `sys_log` VALUES ('9', 'ceshi', '管理员', '登陆成功', '192.168.0.183', '2016-11-14 19:27:58');
INSERT INTO `sys_log` VALUES ('10', 'ceshi', '管理员', '登陆成功', '127.0.0.1', '2016-11-14 22:10:24');
INSERT INTO `sys_log` VALUES ('11', 'ceshi', '管理员', '登陆成功', '127.0.0.1', '2016-11-14 22:57:53');
INSERT INTO `sys_log` VALUES ('12', 'ceshi', '管理员', '禁止登陆', '127.0.0.1', '2016-11-14 23:55:59');
INSERT INTO `sys_log` VALUES ('13', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-14 23:56:06');
INSERT INTO `sys_log` VALUES ('14', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-15 11:35:54');
INSERT INTO `sys_log` VALUES ('15', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-15 23:45:16');
INSERT INTO `sys_log` VALUES ('16', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-16 00:19:30');
INSERT INTO `sys_log` VALUES ('17', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-16 19:28:11');
INSERT INTO `sys_log` VALUES ('18', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-16 20:25:37');
INSERT INTO `sys_log` VALUES ('19', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-17 22:03:54');
INSERT INTO `sys_log` VALUES ('20', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-17 22:28:50');
INSERT INTO `sys_log` VALUES ('21', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-17 23:33:42');
INSERT INTO `sys_log` VALUES ('22', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-17 23:34:49');
INSERT INTO `sys_log` VALUES ('23', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-18 18:50:30');
INSERT INTO `sys_log` VALUES ('24', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-18 20:35:47');
INSERT INTO `sys_log` VALUES ('25', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-18 23:21:01');
INSERT INTO `sys_log` VALUES ('26', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-18 23:42:52');
INSERT INTO `sys_log` VALUES ('27', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-19 00:43:43');
INSERT INTO `sys_log` VALUES ('28', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-20 16:21:24');
INSERT INTO `sys_log` VALUES ('29', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-20 17:30:47');
INSERT INTO `sys_log` VALUES ('30', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-20 17:46:13');
INSERT INTO `sys_log` VALUES ('31', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-20 18:00:49');
INSERT INTO `sys_log` VALUES ('32', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-20 19:07:49');
INSERT INTO `sys_log` VALUES ('33', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-20 19:32:54');
INSERT INTO `sys_log` VALUES ('34', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-20 19:57:24');
INSERT INTO `sys_log` VALUES ('35', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-20 19:59:08');
INSERT INTO `sys_log` VALUES ('36', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-20 20:52:58');
INSERT INTO `sys_log` VALUES ('37', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-20 20:57:21');
INSERT INTO `sys_log` VALUES ('38', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-20 22:48:43');
INSERT INTO `sys_log` VALUES ('39', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-21 00:06:20');
INSERT INTO `sys_log` VALUES ('40', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-21 00:30:19');
INSERT INTO `sys_log` VALUES ('41', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-21 21:20:29');
INSERT INTO `sys_log` VALUES ('42', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-21 21:43:10');
INSERT INTO `sys_log` VALUES ('43', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-21 22:29:24');
INSERT INTO `sys_log` VALUES ('44', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-21 22:56:59');
INSERT INTO `sys_log` VALUES ('45', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-21 22:58:30');
INSERT INTO `sys_log` VALUES ('46', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-21 23:00:26');
INSERT INTO `sys_log` VALUES ('47', 'shiyong', '使用者', '登陆成功', '127.0.0.1', '2016-11-21 23:14:04');
INSERT INTO `sys_log` VALUES ('48', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-21 23:41:39');
INSERT INTO `sys_log` VALUES ('49', 'shiyong', '使用者', '登陆成功', '127.0.0.1', '2016-11-21 23:51:24');
INSERT INTO `sys_log` VALUES ('50', 'admin', '管理员', '登陆成功', '127.0.0.1', '2016-11-22 23:16:03');
INSERT INTO `sys_log` VALUES ('51', 'admin', '管理员', '登陆成功', '0:0:0:0:0:0:0:1', '2017-06-28 11:25:56');
INSERT INTO `sys_log` VALUES ('52', 'admin', '管理员', '登陆成功', '0:0:0:0:0:0:0:1', '2017-06-28 11:30:01');
INSERT INTO `sys_log` VALUES ('53', 'admin', '管理员', '登陆成功', '0:0:0:0:0:0:0:1', '2017-06-28 11:33:22');
INSERT INTO `sys_log` VALUES ('54', 'admin', '管理员', '登陆成功', '0:0:0:0:0:0:0:1', '2017-06-28 11:36:00');

-- ----------------------------
-- Table structure for t_classroom
-- ----------------------------
DROP TABLE IF EXISTS `t_classroom`;
CREATE TABLE `t_classroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classroom` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_classroom
-- ----------------------------
INSERT INTO `t_classroom` VALUES ('1', '1304', '');
INSERT INTO `t_classroom` VALUES ('2', '2133', null);
INSERT INTO `t_classroom` VALUES ('3', '4322', null);
INSERT INTO `t_classroom` VALUES ('4', '12', '212');

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deptName` varchar(20) DEFAULT NULL,
  `deptStatus` int(255) DEFAULT '1',
  `create_at` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('2', '工程二部', '1', null, '工程二部。');
INSERT INTO `t_department` VALUES ('3', '工程三部', '1', null, '工程三部。');
INSERT INTO `t_department` VALUES ('4', '人事部', '1', '2016-11-14 19:17:56', '人事部');

-- ----------------------------
-- Table structure for t_equipment
-- ----------------------------
DROP TABLE IF EXISTS `t_equipment`;
CREATE TABLE `t_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `no` varchar(20) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `roomId` int(11) DEFAULT NULL,
  `stateName` varchar(255) DEFAULT NULL,
  `equstatus` int(11) DEFAULT '1' COMMENT '1、没删除0已删除',
  PRIMARY KEY (`id`),
  KEY `FK_t_equipment` (`typeId`),
  KEY `room` (`roomId`),
  CONSTRAINT `FK_t_equipment` FOREIGN KEY (`typeId`) REFERENCES `t_equipmenttype` (`id`),
  CONSTRAINT `room` FOREIGN KEY (`roomId`) REFERENCES `t_classroom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equipment
-- ----------------------------
INSERT INTO `t_equipment` VALUES ('1', '发电机', '001', '1', '1', '发电机。', '1', '正常', '1');
INSERT INTO `t_equipment` VALUES ('4', '333', '222', '2', '1', '2', '3', '正常', '1');
INSERT INTO `t_equipment` VALUES ('5', 'ceshi', 'ceshi', '2', '3', 'ceshi', '1', '报废', '1');

-- ----------------------------
-- Table structure for t_equipmenttype
-- ----------------------------
DROP TABLE IF EXISTS `t_equipmenttype`;
CREATE TABLE `t_equipmenttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equipmenttype
-- ----------------------------
INSERT INTO `t_equipmenttype` VALUES ('1', '强电型', '强电型。');
INSERT INTO `t_equipmenttype` VALUES ('2', '弱电型', '弱电');
INSERT INTO `t_equipmenttype` VALUES ('3', '凤飞飞', '凤飞飞');

-- ----------------------------
-- Table structure for t_equ_price
-- ----------------------------
DROP TABLE IF EXISTS `t_equ_price`;
CREATE TABLE `t_equ_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equName` varchar(255) DEFAULT NULL COMMENT '设备名',
  `price` double(10,0) DEFAULT NULL COMMENT '价格',
  `brand` varchar(255) DEFAULT NULL COMMENT '品牌',
  `model` varchar(255) DEFAULT NULL COMMENT '型号',
  `unit` varchar(255) DEFAULT NULL COMMENT '单位',
  `width` double(255,0) DEFAULT NULL COMMENT '宽',
  `high` double(255,0) DEFAULT NULL COMMENT '高',
  `weight` double(255,0) DEFAULT NULL COMMENT '重量',
  `power` double(255,0) DEFAULT NULL COMMENT '功率',
  `electricity` int(2) DEFAULT NULL COMMENT '1、直流2、交流',
  `create_time` varchar(255) DEFAULT NULL COMMENT '等记日期',
  `create_man` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equ_price
-- ----------------------------
INSERT INTO `t_equ_price` VALUES ('2', '2', '3', '1', '23', '2', '3', '22', '3', '22222', '1', '2016-11-21 00:47:57', '张三', '22');
INSERT INTO `t_equ_price` VALUES ('3', '1', '2', '2', '1', '3', '22', '1', '2', '1', '1', '2016-11-21 00:55:21', '张三', '2');
INSERT INTO `t_equ_price` VALUES ('4', 'd', '2', '1', '2', '2', '1', '2', '1', '2', '1', '2016-11-21 00:56:27', '张三', '22');
INSERT INTO `t_equ_price` VALUES ('5', '2', '1', '1', '2', '2', '1', '2', '2', '1', '1', '2016-11-21 00:59:59', '陈洪杰', '2');

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `feedtime` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
INSERT INTO `t_feedback` VALUES ('2', '33333333', 'admin', '2016-11-12 23:06:38', '333');

-- ----------------------------
-- Table structure for t_repair
-- ----------------------------
DROP TABLE IF EXISTS `t_repair`;
CREATE TABLE `t_repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipmentId` int(11) DEFAULT NULL,
  `userman` varchar(20) DEFAULT NULL,
  `repairman` varchar(20) DEFAULT NULL,
  `repairTime` datetime DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `finishState` int(11) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL COMMENT '损坏描述',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipmentId` (`equipmentId`),
  CONSTRAINT `t_repair_ibfk_1` FOREIGN KEY (`equipmentId`) REFERENCES `t_equipment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_repair
-- ----------------------------
INSERT INTO `t_repair` VALUES ('31', '1', '张三', '张三', '2016-11-20 18:50:02', '2016-11-20 21:32:29', '1', '2', '444444444', null);
INSERT INTO `t_repair` VALUES ('34', '4', '张三', '张三', '2016-11-20 22:04:08', '2016-11-20 22:08:49', '1', '2', '大爱大爱', '大大大');
INSERT INTO `t_repair` VALUES ('35', '1', '张三', '张三', '2016-11-20 22:08:23', '2016-11-20 22:08:47', '1', '2', '飞飞凤飞飞', '反反复复反复');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_at` varchar(255) DEFAULT NULL,
  `roleStatus` int(11) DEFAULT '1' COMMENT '2121',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '管理员', '管理员', '2016-11-21 23:00:40', '1');
INSERT INTO `t_role` VALUES ('2', '维修员', '维修员', '2016-11-12 20:02:56', '1');
INSERT INTO `t_role` VALUES ('3', '使用者', '这是使用者', '2016-11-21 23:01:08', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `trueName` varchar(20) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `regtime` varchar(20) DEFAULT NULL,
  `userSta` int(11) DEFAULT '1' COMMENT '用户状态值',
  PRIMARY KEY (`id`),
  KEY `FK_t_user` (`deptId`),
  KEY `role` (`roleId`),
  CONSTRAINT `dept` FOREIGN KEY (`deptId`) REFERENCES `t_department` (`id`),
  CONSTRAINT `role` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('10', 'ceshi', '123', 'ceshi', '1', '2', '2016-11-11 17:58:45', '1');
INSERT INTO `t_user` VALUES ('11', 'admin', 'admin', '张三', '1', '4', '2016-11-14 23:24:43', '1');
INSERT INTO `t_user` VALUES ('12', 'shiyong', '1234', '', '3', '2', '2016-11-21 23:13:54', '1');
