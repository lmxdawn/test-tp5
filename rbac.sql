/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : rbac

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-01-09 18:35:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lmx_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `lmx_auth_group`;
CREATE TABLE `lmx_auth_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组编号',
  `group_title` char(100) DEFAULT '' COMMENT '用户组中文名称',
  `group_status` tinyint(1) DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `group_rules` char(80) DEFAULT '' COMMENT '用户组拥有的规则id， 多个规则',
  `group_sort` int(255) DEFAULT NULL COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of lmx_auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for lmx_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `lmx_auth_group_access`;
CREATE TABLE `lmx_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组对应用户明细表';

-- ----------------------------
-- Records of lmx_auth_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for lmx_auth_group_rule
-- ----------------------------
DROP TABLE IF EXISTS `lmx_auth_group_rule`;
CREATE TABLE `lmx_auth_group_rule` (
  `group_id` int(11) DEFAULT NULL COMMENT '用户组编号（id）',
  `rule_id` int(255) DEFAULT NULL COMMENT '规则表编号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组角色对应表';

-- ----------------------------
-- Records of lmx_auth_group_rule
-- ----------------------------

-- ----------------------------
-- Table structure for lmx_auth_menu
-- ----------------------------
DROP TABLE IF EXISTS `lmx_auth_menu`;
CREATE TABLE `lmx_auth_menu` (
  `menu_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `parent_id` smallint(6) unsigned DEFAULT '0' COMMENT '父级ID',
  `menu_app` char(20) DEFAULT NULL COMMENT '应用名称',
  `menu_model` char(20) DEFAULT NULL COMMENT '控制器',
  `menu_action` char(20) DEFAULT NULL COMMENT '操作名称',
  `menu__param` char(50) DEFAULT NULL COMMENT 'url参数',
  `menu_type` tinyint(1) DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `menu_status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `menu_name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `menu_icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `menu_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `menu_sort` smallint(6) unsigned DEFAULT '0' COMMENT '排序ID',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `nav_id` int(11) DEFAULT '0' COMMENT 'nav ID ',
  `request` varchar(255) DEFAULT NULL COMMENT '请求方式（日志生成）',
  `log_rule` varchar(255) DEFAULT NULL COMMENT '日志规则',
  PRIMARY KEY (`menu_id`),
  KEY `status` (`menu_status`) USING BTREE,
  KEY `model` (`menu_model`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of lmx_auth_menu
-- ----------------------------
INSERT INTO `lmx_auth_menu` VALUES ('1', '0', 'index', 'auth', 'default', '', '0', '1', '系统管理', '', '', '10', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('2', '1', 'index', 'auth', 'default', '', '0', '1', '权限管理', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('3', '2', 'index', 'auth', 'role', '', '1', '1', '角色管理', '', '1', '0', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('4', '3', 'index', 'auth', 'roleAdd', '', '1', '0', '角色增加', '', '', '0', null, null, '0', '', '{id}');
INSERT INTO `lmx_auth_menu` VALUES ('5', '3', 'index', 'auth', 'roleEdit', '', '1', '0', '角色编辑', '', 'asdas', '0', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('6', '3', 'index', 'auth', 'roleDelete', '', '1', '0', '角色删除', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('7', '3', 'index', 'auth', 'authorize', '', '1', '0', '角色授权', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('8', '1', 'index', 'auth', 'default', '', '0', '1', '菜单管理', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('9', '8', 'index', 'auth', 'menu', '', '1', '1', '菜单列表', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('10', '9', 'index', 'auth', 'menuAdd', '', '1', '0', '菜单增加', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('11', '9', 'index', 'auth', 'menuEdit', '', '1', '0', '菜单修改', '', '', '0', null, null, '0', 'POST', '我的ID是{id} <br> 记入的目录{name}');
INSERT INTO `lmx_auth_menu` VALUES ('12', '9', 'index', 'auth', 'menuDelete', '', '1', '0', '菜单删除', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('13', '9', 'index', 'auth', 'menuOrder', '', '1', '0', '菜单排序', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('14', '2', 'index', 'admin', 'index', '', '1', '1', '用户管理', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('15', '0', 'index', 'index', 'sasd', '', '0', '1', '测试', '', '', '20', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('16', '15', 'index', 'index', 'asd', 'asd', '1', '1', '测试', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('17', '15', 'index', 'auth', 'menuEdit', 'dasd', '1', '1', '边缘', '', '11q1adas1adsasdfsdfdsd', '0', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('20', '2', 'index', 'auth', 'log', '', '1', '1', '行为日志', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('19', '16', 'index', 'auth', 'menuEdit', 'id=5', '1', '1', '测试5', '', 'dasd', '0', null, null, '0', 'GET', '{id}');
INSERT INTO `lmx_auth_menu` VALUES ('21', '20', 'index', 'auth', 'viewLog', '', '1', '0', '查看日志', '', '', '0', null, null, '0', '', '');
INSERT INTO `lmx_auth_menu` VALUES ('22', '20', 'index', 'auth', 'clear', '', '1', '0', '清空日志', '', '', '0', null, null, '0', '', '');

-- ----------------------------
-- Table structure for lmx_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `lmx_auth_rule`;
CREATE TABLE `lmx_auth_rule` (
  `rule_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则编号',
  `rule_name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `rule_title` char(20) DEFAULT '' COMMENT '规则中文名称',
  `rule_type` tinyint(1) DEFAULT '1' COMMENT '规则类型',
  `rule_status` tinyint(1) DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `rule_condition` char(100) DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  `rule_sort` int(10) DEFAULT NULL COMMENT '排序',
  `rule_group_name` varchar(255) DEFAULT NULL COMMENT '规则分组名称',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`rule_id`),
  UNIQUE KEY `name` (`rule_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of lmx_auth_rule
-- ----------------------------
