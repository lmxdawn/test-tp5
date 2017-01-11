/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : rbac

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-01-11 17:25:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lmx_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `lmx_auth_access`;
CREATE TABLE `lmx_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of lmx_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for lmx_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `lmx_auth_rule`;
CREATE TABLE `lmx_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则编号',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) DEFAULT '' COMMENT '规则中文名称',
  `type` tinyint(1) DEFAULT '1' COMMENT '规则类型',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `condition` char(100) DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  `listorder` int(10) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of lmx_auth_rule
-- ----------------------------
INSERT INTO `lmx_auth_rule` VALUES ('19', 'index/auth/edit', '嘿嘿', '1', '1', '', '0', '1484126618', '1484126652');
INSERT INTO `lmx_auth_rule` VALUES ('20', 'index/auth/edit1', '嘿嘿', '1', '1', '', '0', '1484126673', '1484126673');
INSERT INTO `lmx_auth_rule` VALUES ('21', 'index/auth/add', '哈哈', '1', '1', '', '0', '1484126685', '1484126685');

-- ----------------------------
-- Table structure for lmx_menu
-- ----------------------------
DROP TABLE IF EXISTS `lmx_menu`;
CREATE TABLE `lmx_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `parent_id` smallint(6) unsigned DEFAULT '0' COMMENT '父级ID',
  `app` char(20) DEFAULT NULL COMMENT '应用名称',
  `model` char(20) DEFAULT NULL COMMENT '控制器',
  `action` char(20) DEFAULT NULL COMMENT '操作名称',
  `param` char(50) DEFAULT NULL COMMENT 'url参数',
  `type` tinyint(1) DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `nav_id` int(11) DEFAULT '0' COMMENT 'nav ID ',
  `request` varchar(255) DEFAULT NULL COMMENT '请求方式（日志生成）',
  `log_rule` varchar(255) DEFAULT NULL COMMENT '日志规则',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE,
  KEY `model` (`model`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of lmx_menu
-- ----------------------------
INSERT INTO `lmx_menu` VALUES ('1', '0', 'index', 'auth', 'default', '', '0', '1', '系统管理', '', '', '10', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('2', '1', 'index', 'auth', 'default', '', '0', '1', '权限管理', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('3', '2', 'index', 'auth', 'role', '', '1', '1', '角色管理', '', '1', '0', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('4', '3', 'index', 'auth', 'roleAdd', '', '1', '0', '角色增加', '', '', '0', null, null, '0', '', '{id}');
INSERT INTO `lmx_menu` VALUES ('5', '3', 'index', 'auth', 'roleEdit', '', '1', '0', '角色编辑', '', 'asdas', '0', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('6', '3', 'index', 'auth', 'roleDelete', '', '1', '0', '角色删除', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('7', '3', 'index', 'auth', 'authorize', '', '1', '0', '角色授权', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('8', '1', 'index', 'auth', 'default', '', '0', '1', '菜单管理', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('9', '8', 'index', 'auth', 'menu', '', '1', '1', '菜单列表', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('10', '9', 'index', 'auth', 'menuAdd', '', '1', '0', '菜单增加', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('11', '9', 'index', 'auth', 'menuEdit', '', '1', '0', '菜单修改', '', '', '0', null, null, '0', 'POST', '我的ID是{id} <br> 记入的目录{name}');
INSERT INTO `lmx_menu` VALUES ('12', '9', 'index', 'auth', 'menuDelete', '', '1', '0', '菜单删除', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('13', '9', 'index', 'auth', 'menuOrder', '', '1', '0', '菜单排序', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('14', '2', 'index', 'admin', 'index', '', '1', '1', '用户管理', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('15', '0', 'index', 'index', 'sasd', '', '0', '1', '测试', '', '', '20', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('16', '15', 'index', 'index', 'asd', 'asd', '1', '1', '测试', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('17', '15', 'index', 'auth', 'menuEdit', 'dasd', '1', '1', '边缘', '', '11q1adas1adsasdfsdfdsd', '0', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('20', '2', 'index', 'auth', 'log', '', '1', '1', '行为日志', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_menu` VALUES ('19', '16', 'index', 'auth', 'menuEdit', 'id=5', '1', '1', '测试5', '', 'dasd', '0', null, null, '0', 'GET', '{id}');
INSERT INTO `lmx_menu` VALUES ('21', '20', 'index', 'auth', 'edit1', '', '1', '0', '嘿嘿', '', '', '0', null, '1484126673', '0', '', '');
INSERT INTO `lmx_menu` VALUES ('22', '20', 'index', 'auth', 'lmx123', '', '1', '0', '哈哈', '', '', '0', null, '1484044394', '0', '', '');
INSERT INTO `lmx_menu` VALUES ('51', '0', 'index', 'auth', 'lmx', null, '1', '0', '哈哈', null, null, '0', '1484039887', '1484043176', '0', null, null);
INSERT INTO `lmx_menu` VALUES ('52', '0', 'index', 'auth', 'lmx789', null, '1', '0', '哈哈', null, null, '0', '1484122117', '1484122117', '0', null, null);
INSERT INTO `lmx_menu` VALUES ('53', '0', 'index', 'auth', 'add', null, '1', '0', '哈哈', null, null, '0', '1484126685', '1484126685', '0', null, null);
INSERT INTO `lmx_menu` VALUES ('54', '0', 'index', 'auth', 'add', null, '1', '0', '哈哈', null, null, '0', '1484126702', '1484126702', '0', null, null);

-- ----------------------------
-- Table structure for lmx_role
-- ----------------------------
DROP TABLE IF EXISTS `lmx_role`;
CREATE TABLE `lmx_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of lmx_role
-- ----------------------------
INSERT INTO `lmx_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for lmx_role_user
-- ----------------------------
DROP TABLE IF EXISTS `lmx_role_user`;
CREATE TABLE `lmx_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of lmx_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for lmx_users
-- ----------------------------
DROP TABLE IF EXISTS `lmx_users`;
CREATE TABLE `lmx_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of lmx_users
-- ----------------------------
