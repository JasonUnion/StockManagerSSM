/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_stock_manager_ssm

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-03-09 18:07:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `authority`
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `authority_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `authority_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=591 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('148', '2', '35');
INSERT INTO `authority` VALUES ('149', '2', '36');
INSERT INTO `authority` VALUES ('150', '2', '25');
INSERT INTO `authority` VALUES ('151', '2', '1');
INSERT INTO `authority` VALUES ('152', '2', '14');
INSERT INTO `authority` VALUES ('153', '2', '15');
INSERT INTO `authority` VALUES ('531', '1', '1');
INSERT INTO `authority` VALUES ('532', '1', '5');
INSERT INTO `authority` VALUES ('533', '1', '17');
INSERT INTO `authority` VALUES ('534', '1', '18');
INSERT INTO `authority` VALUES ('535', '1', '19');
INSERT INTO `authority` VALUES ('536', '1', '20');
INSERT INTO `authority` VALUES ('537', '1', '13');
INSERT INTO `authority` VALUES ('538', '1', '21');
INSERT INTO `authority` VALUES ('539', '1', '22');
INSERT INTO `authority` VALUES ('540', '1', '23');
INSERT INTO `authority` VALUES ('541', '1', '35');
INSERT INTO `authority` VALUES ('542', '1', '36');
INSERT INTO `authority` VALUES ('543', '1', '14');
INSERT INTO `authority` VALUES ('544', '1', '15');
INSERT INTO `authority` VALUES ('545', '1', '24');
INSERT INTO `authority` VALUES ('546', '1', '25');
INSERT INTO `authority` VALUES ('547', '1', '26');
INSERT INTO `authority` VALUES ('548', '1', '31');
INSERT INTO `authority` VALUES ('549', '1', '32');
INSERT INTO `authority` VALUES ('550', '1', '33');
INSERT INTO `authority` VALUES ('551', '1', '34');
INSERT INTO `authority` VALUES ('552', '1', '37');
INSERT INTO `authority` VALUES ('553', '1', '38');
INSERT INTO `authority` VALUES ('554', '1', '39');
INSERT INTO `authority` VALUES ('555', '1', '40');
INSERT INTO `authority` VALUES ('556', '1', '41');
INSERT INTO `authority` VALUES ('557', '1', '42');
INSERT INTO `authority` VALUES ('558', '1', '43');
INSERT INTO `authority` VALUES ('559', '1', '44');
INSERT INTO `authority` VALUES ('560', '1', '45');
INSERT INTO `authority` VALUES ('561', '1', '46');
INSERT INTO `authority` VALUES ('562', '1', '75');
INSERT INTO `authority` VALUES ('563', '1', '47');
INSERT INTO `authority` VALUES ('564', '1', '48');
INSERT INTO `authority` VALUES ('565', '1', '50');
INSERT INTO `authority` VALUES ('566', '1', '51');
INSERT INTO `authority` VALUES ('567', '1', '52');
INSERT INTO `authority` VALUES ('568', '1', '49');
INSERT INTO `authority` VALUES ('569', '1', '53');
INSERT INTO `authority` VALUES ('570', '1', '54');
INSERT INTO `authority` VALUES ('571', '1', '55');
INSERT INTO `authority` VALUES ('572', '1', '56');
INSERT INTO `authority` VALUES ('573', '1', '57');
INSERT INTO `authority` VALUES ('574', '1', '58');
INSERT INTO `authority` VALUES ('575', '1', '59');
INSERT INTO `authority` VALUES ('576', '1', '60');
INSERT INTO `authority` VALUES ('577', '1', '61');
INSERT INTO `authority` VALUES ('578', '1', '62');
INSERT INTO `authority` VALUES ('579', '1', '63');
INSERT INTO `authority` VALUES ('580', '1', '64');
INSERT INTO `authority` VALUES ('581', '1', '65');
INSERT INTO `authority` VALUES ('582', '1', '66');
INSERT INTO `authority` VALUES ('583', '1', '67');
INSERT INTO `authority` VALUES ('584', '1', '68');
INSERT INTO `authority` VALUES ('585', '1', '69');
INSERT INTO `authority` VALUES ('586', '1', '70');
INSERT INTO `authority` VALUES ('587', '1', '71');
INSERT INTO `authority` VALUES ('588', '1', '72');
INSERT INTO `authority` VALUES ('589', '1', '73');
INSERT INTO `authority` VALUES ('590', '1', '74');

-- ----------------------------
-- Table structure for `c3p0testtable`
-- ----------------------------
DROP TABLE IF EXISTS `c3p0testtable`;
CREATE TABLE `c3p0testtable` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c3p0testtable
-- ----------------------------

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('13', '用户名为admin的用户登录时输入验证码错误!', '2018-12-16 18:17:30');
INSERT INTO `log` VALUES ('14', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:22:56');
INSERT INTO `log` VALUES ('15', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:37:15');
INSERT INTO `log` VALUES ('16', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:40:21');
INSERT INTO `log` VALUES ('17', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 19:11:49');
INSERT INTO `log` VALUES ('18', '用户名为{admin}，的用户成功修改密码!', '2018-12-16 19:13:32');
INSERT INTO `log` VALUES ('19', '用户名为{admin}，的用户成功修改密码!', '2018-12-16 19:14:01');
INSERT INTO `log` VALUES ('20', '用户名为{猿来入此}，角色为{普通用户}的用户登录成功!', '2018-12-16 19:17:46');
INSERT INTO `log` VALUES ('21', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-04 18:33:35');
INSERT INTO `log` VALUES ('22', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-04 18:39:00');
INSERT INTO `log` VALUES ('23', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-04 19:12:32');
INSERT INTO `log` VALUES ('24', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-04 19:13:45');
INSERT INTO `log` VALUES ('25', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-04 19:14:44');
INSERT INTO `log` VALUES ('26', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-04 19:15:53');
INSERT INTO `log` VALUES ('27', '用户名为admin的用户登录时输入验证码错误!', '2019-03-04 19:34:41');
INSERT INTO `log` VALUES ('28', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-04 19:34:48');
INSERT INTO `log` VALUES ('29', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-04 20:53:11');
INSERT INTO `log` VALUES ('30', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-04 21:07:32');
INSERT INTO `log` VALUES ('31', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-04 21:09:13');
INSERT INTO `log` VALUES ('32', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-04 21:37:56');
INSERT INTO `log` VALUES ('33', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-04 21:39:29');
INSERT INTO `log` VALUES ('34', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-05 21:21:19');
INSERT INTO `log` VALUES ('35', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-05 21:30:29');
INSERT INTO `log` VALUES ('36', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-05 21:56:28');
INSERT INTO `log` VALUES ('37', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-06 19:18:05');
INSERT INTO `log` VALUES ('38', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-06 19:32:59');
INSERT INTO `log` VALUES ('39', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-06 19:33:25');
INSERT INTO `log` VALUES ('40', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-06 20:29:06');
INSERT INTO `log` VALUES ('41', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-06 22:57:00');
INSERT INTO `log` VALUES ('42', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-06 22:58:40');
INSERT INTO `log` VALUES ('43', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-06 22:59:56');
INSERT INTO `log` VALUES ('44', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-06 23:01:46');
INSERT INTO `log` VALUES ('45', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-06 23:07:41');
INSERT INTO `log` VALUES ('46', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-06 23:10:43');
INSERT INTO `log` VALUES ('47', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-06 23:12:01');
INSERT INTO `log` VALUES ('48', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-07 18:06:58');
INSERT INTO `log` VALUES ('49', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-07 18:43:15');
INSERT INTO `log` VALUES ('50', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-07 18:52:58');
INSERT INTO `log` VALUES ('51', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-07 18:54:54');
INSERT INTO `log` VALUES ('52', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-07 18:58:42');
INSERT INTO `log` VALUES ('53', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-07 19:08:39');
INSERT INTO `log` VALUES ('54', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-07 19:36:51');
INSERT INTO `log` VALUES ('55', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-07 19:55:40');
INSERT INTO `log` VALUES ('56', '用户名为admin的用户登录时输入验证码错误!', '2019-03-07 19:58:23');
INSERT INTO `log` VALUES ('57', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-07 19:58:32');
INSERT INTO `log` VALUES ('58', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-07 21:13:43');
INSERT INTO `log` VALUES ('59', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-07 21:36:17');
INSERT INTO `log` VALUES ('60', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-07 21:38:50');
INSERT INTO `log` VALUES ('61', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-07 22:34:44');
INSERT INTO `log` VALUES ('62', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-07 22:36:24');
INSERT INTO `log` VALUES ('63', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-07 22:46:56');
INSERT INTO `log` VALUES ('64', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-08 17:48:42');
INSERT INTO `log` VALUES ('65', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-08 17:59:38');
INSERT INTO `log` VALUES ('66', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-08 18:03:14');
INSERT INTO `log` VALUES ('67', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-08 18:26:26');
INSERT INTO `log` VALUES ('68', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-08 18:41:02');
INSERT INTO `log` VALUES ('69', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-08 19:23:34');
INSERT INTO `log` VALUES ('70', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-08 19:28:38');
INSERT INTO `log` VALUES ('71', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-08 20:17:08');
INSERT INTO `log` VALUES ('72', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-08 20:19:04');
INSERT INTO `log` VALUES ('73', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-08 20:25:21');
INSERT INTO `log` VALUES ('74', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-08 20:28:17');
INSERT INTO `log` VALUES ('75', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-08 20:29:54');
INSERT INTO `log` VALUES ('76', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-08 21:19:54');
INSERT INTO `log` VALUES ('77', '用户名为admin的用户登录时输入验证码错误!', '2019-03-09 10:34:10');
INSERT INTO `log` VALUES ('78', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 10:34:19');
INSERT INTO `log` VALUES ('79', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 11:05:13');
INSERT INTO `log` VALUES ('80', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 11:07:16');
INSERT INTO `log` VALUES ('81', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 11:09:04');
INSERT INTO `log` VALUES ('82', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 11:58:26');
INSERT INTO `log` VALUES ('83', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 11:59:51');
INSERT INTO `log` VALUES ('84', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 12:01:25');
INSERT INTO `log` VALUES ('85', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 12:28:06');
INSERT INTO `log` VALUES ('86', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 13:10:14');
INSERT INTO `log` VALUES ('87', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 13:14:52');
INSERT INTO `log` VALUES ('88', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 13:18:50');
INSERT INTO `log` VALUES ('89', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 13:35:26');
INSERT INTO `log` VALUES ('90', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 14:20:06');
INSERT INTO `log` VALUES ('91', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 15:07:02');
INSERT INTO `log` VALUES ('92', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 15:42:32');
INSERT INTO `log` VALUES ('93', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 15:49:26');
INSERT INTO `log` VALUES ('94', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 16:09:12');
INSERT INTO `log` VALUES ('95', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 16:22:16');
INSERT INTO `log` VALUES ('96', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 16:54:19');
INSERT INTO `log` VALUES ('97', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 16:58:00');
INSERT INTO `log` VALUES ('98', '用户名为admin的用户登录时输入验证码错误!', '2019-03-09 17:01:50');
INSERT INTO `log` VALUES ('99', '用户名为admin的用户登录时输入验证码错误!', '2019-03-09 17:01:58');
INSERT INTO `log` VALUES ('100', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 17:02:06');
INSERT INTO `log` VALUES ('101', '用户名为admin的用户登录时输入验证码错误!', '2019-03-09 17:06:49');
INSERT INTO `log` VALUES ('102', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 17:06:56');
INSERT INTO `log` VALUES ('103', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 17:11:01');
INSERT INTO `log` VALUES ('104', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 17:13:14');
INSERT INTO `log` VALUES ('105', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 17:25:47');
INSERT INTO `log` VALUES ('106', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 17:38:34');
INSERT INTO `log` VALUES ('107', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 17:41:13');
INSERT INTO `log` VALUES ('108', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-03-09 17:47:49');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL DEFAULT '-1',
  `name` varchar(32) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '系统设置', '', 'icon-advancedsettings');
INSERT INTO `menu` VALUES ('5', '1', '菜单管理', '../admin/menu/list', 'icon-chart-organisation');
INSERT INTO `menu` VALUES ('13', '1', '角色管理', '../admin/role/list', 'icon-group-key');
INSERT INTO `menu` VALUES ('14', '0', '用户管理', '', 'icon-group-gear');
INSERT INTO `menu` VALUES ('15', '14', '用户列表', '../admin/user/list', 'icon-group');
INSERT INTO `menu` VALUES ('17', '5', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('18', '5', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('19', '5', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('20', '5', '添加按钮', 'openAddMenu()', 'icon-add');
INSERT INTO `menu` VALUES ('21', '13', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('22', '13', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('23', '13', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('24', '15', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('25', '15', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('26', '15', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('31', '0', '系统日志', '', 'icon-table-cell');
INSERT INTO `menu` VALUES ('32', '31', '日志列表', '../admin/log/list', 'icon-page-white-text');
INSERT INTO `menu` VALUES ('33', '32', '添加日志', 'openAdd()', 'icon-add1');
INSERT INTO `menu` VALUES ('34', '32', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('35', '1', '修改密码', 'edit_password', 'icon-lock-edit');
INSERT INTO `menu` VALUES ('36', '35', '修改密码', 'openAdd()', 'icon-lock-edit');
INSERT INTO `menu` VALUES ('37', '0', '供应商管理', '', 'icon-user-brown');
INSERT INTO `menu` VALUES ('38', '37', '供应商列表', '../admin/supplier/list', 'icon-vcard');
INSERT INTO `menu` VALUES ('39', '38', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('40', '38', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('41', '38', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('42', '0', '商品管理', '', 'icon-medal-bronze-1');
INSERT INTO `menu` VALUES ('43', '42', '商品列表', '../admin/product/list', 'icon-table-cell');
INSERT INTO `menu` VALUES ('44', '43', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('45', '43', '编辑', 'openEdit()', 'icon-book-edit');
INSERT INTO `menu` VALUES ('46', '43', '删除', 'remove()', 'icon-DeleteRed');
INSERT INTO `menu` VALUES ('47', '0', '进货管理', '', 'icon-package-add');
INSERT INTO `menu` VALUES ('48', '47', '进货列表', '../admin/order_in/list', 'icon-text-padding-top');
INSERT INTO `menu` VALUES ('49', '47', '库存盘点', '../admin/stock/list', 'icon-brick-edit');
INSERT INTO `menu` VALUES ('50', '48', '添加进货单', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('51', '48', '支付进货单', 'openEdit()', 'icon-cart-edit');
INSERT INTO `menu` VALUES ('52', '48', '查看进货单', 'openView()', 'icon-eye');
INSERT INTO `menu` VALUES ('53', '49', '调整库存', 'openEdit()', 'icon-book-addresses-edit');
INSERT INTO `menu` VALUES ('54', '49', '删除库存', 'remove()', 'icon-DeleteRed');
INSERT INTO `menu` VALUES ('55', '0', '进货退货', '', 'icon-basket-delete');
INSERT INTO `menu` VALUES ('56', '55', '进货退货列表', '../admin/order_in_reback/list', 'icon-mail');
INSERT INTO `menu` VALUES ('57', '56', '添加退货单', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('58', '56', '查看退货单', 'openView()', 'icon-eye');
INSERT INTO `menu` VALUES ('59', '56', '支付退货单', 'openEdit()', 'icon-coins');
INSERT INTO `menu` VALUES ('60', '0', '销售管理', '', 'icon-coins');
INSERT INTO `menu` VALUES ('61', '60', '销售列表', '../admin/sell/list', 'icon-database-table');
INSERT INTO `menu` VALUES ('62', '61', '添加销售单', 'openAdd()', 'icon-coins-add');
INSERT INTO `menu` VALUES ('63', '61', '查看销售单', 'openView()', 'icon-eye');
INSERT INTO `menu` VALUES ('64', '61', '支付销售单', 'openEdit()', 'icon-tag-blue-edit');
INSERT INTO `menu` VALUES ('65', '0', '销售退货', '', 'icon-arrow-rotate-clockwise');
INSERT INTO `menu` VALUES ('66', '65', '销售退货列表', '../admin/sell_reback/list', 'icon-build');
INSERT INTO `menu` VALUES ('67', '66', '添加退货单', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('68', '66', '支付退货单', 'openEdit()', 'icon-database-edit');
INSERT INTO `menu` VALUES ('69', '66', '查看退货单', 'openView()', 'icon-eye');
INSERT INTO `menu` VALUES ('70', '0', '统计分析', '', 'icon-chart-bar');
INSERT INTO `menu` VALUES ('71', '70', '销售统计', '../admin/stats/stats', 'icon-chart-curve');
INSERT INTO `menu` VALUES ('72', '71', '按日统计', 'statsDay()', 'icon-chart-curve-add');
INSERT INTO `menu` VALUES ('73', '71', '按月统计', 'statsMonth()', 'icon-chart-curve-link');
INSERT INTO `menu` VALUES ('74', '71', '按年统计', 'statsYear()', 'icon-chart-curve-go');
INSERT INTO `menu` VALUES ('75', '43', '导入商品', 'openImport()', 'icon-upload');

-- ----------------------------
-- Table structure for `order_in`
-- ----------------------------
DROP TABLE IF EXISTS `order_in`;
CREATE TABLE `order_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` float(11,2) DEFAULT NULL,
  `productNum` int(5) NOT NULL,
  `payType` int(2) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '0',
  `operator` varchar(32) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_in
-- ----------------------------
INSERT INTO `order_in` VALUES ('13', '1408426.00', '182', '4', '1', 'admin', '进的高科技产品。', '2019-03-08 18:47:04');
INSERT INTO `order_in` VALUES ('14', '8064.00', '222', '2', '1', 'admin', '生活用品。', '2019-03-08 18:48:02');
INSERT INTO `order_in` VALUES ('15', '55104.00', '10', '1', '0', 'admin', '进了全量商品！', '2019-03-08 18:48:46');
INSERT INTO `order_in` VALUES ('16', '155335.00', '1004', '4', '1', 'admin', '进货一大批！', '2019-03-08 21:35:30');
INSERT INTO `order_in` VALUES ('17', '5291.00', '4', '2', '0', 'admin', '进货三种商品！', '2019-03-09 17:29:13');
INSERT INTO `order_in` VALUES ('18', '29828.00', '8', '0', '0', 'admin', '', '2019-03-09 17:44:49');

-- ----------------------------
-- Table structure for `order_in_detail`
-- ----------------------------
DROP TABLE IF EXISTS `order_in_detail`;
CREATE TABLE `order_in_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderInId` int(11) NOT NULL,
  `productName` varchar(128) NOT NULL,
  `price` float(8,2) NOT NULL,
  `productNum` int(5) NOT NULL,
  `money` float(8,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderInId` (`orderInId`),
  CONSTRAINT `order_in_detail_ibfk_1` FOREIGN KEY (`orderInId`) REFERENCES `order_in` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_in_detail
-- ----------------------------
INSERT INTO `order_in_detail` VALUES ('18', '13', '洗衣机', '4399.00', '10', '43990');
INSERT INTO `order_in_detail` VALUES ('19', '13', '电视机', '2988.00', '122', '364536');
INSERT INTO `order_in_detail` VALUES ('20', '13', '智能机器人', '19998.00', '50', '999900');
INSERT INTO `order_in_detail` VALUES ('21', '14', '男士长袖', '66.00', '100', '6600');
INSERT INTO `order_in_detail` VALUES ('22', '14', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '122', '1464');
INSERT INTO `order_in_detail` VALUES ('23', '15', 'Java实战开发教程', '128.00', '2', '256');
INSERT INTO `order_in_detail` VALUES ('24', '15', '洗衣机', '4399.00', '2', '8798');
INSERT INTO `order_in_detail` VALUES ('25', '15', '电视机', '2988.00', '2', '5976');
INSERT INTO `order_in_detail` VALUES ('26', '15', '智能机器人', '19998.00', '2', '39996');
INSERT INTO `order_in_detail` VALUES ('27', '15', '男士长袖', '66.00', '1', '66');
INSERT INTO `order_in_detail` VALUES ('28', '15', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '1', '12');
INSERT INTO `order_in_detail` VALUES ('29', '16', 'Java实战开发教程', '128.00', '999', '127872');
INSERT INTO `order_in_detail` VALUES ('30', '16', '男士长袖', '66.00', '1', '66');
INSERT INTO `order_in_detail` VALUES ('31', '16', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '1', '12');
INSERT INTO `order_in_detail` VALUES ('32', '16', '洗衣机', '4399.00', '1', '4399');
INSERT INTO `order_in_detail` VALUES ('33', '16', '电视机', '2988.00', '1', '2988');
INSERT INTO `order_in_detail` VALUES ('34', '16', '智能机器人', '19998.00', '1', '19998');
INSERT INTO `order_in_detail` VALUES ('35', '17', '男士长袖', '66.00', '1', '66');
INSERT INTO `order_in_detail` VALUES ('36', '17', '电视机', '2988.00', '1', '2988');
INSERT INTO `order_in_detail` VALUES ('37', '17', 'Iphone XR 128G', '238.00', '1', '238');
INSERT INTO `order_in_detail` VALUES ('38', '17', '笔记本电脑', '1999.00', '1', '1999');
INSERT INTO `order_in_detail` VALUES ('39', '18', 'Java实战开发教程', '128.00', '1', '128');
INSERT INTO `order_in_detail` VALUES ('40', '18', '男士长袖', '66.00', '1', '66');
INSERT INTO `order_in_detail` VALUES ('41', '18', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '1', '12');
INSERT INTO `order_in_detail` VALUES ('42', '18', '洗衣机', '4399.00', '1', '4399');
INSERT INTO `order_in_detail` VALUES ('43', '18', '电视机', '2988.00', '1', '2988');
INSERT INTO `order_in_detail` VALUES ('44', '18', '智能机器人', '19998.00', '1', '19998');
INSERT INTO `order_in_detail` VALUES ('45', '18', 'Iphone XR 128G', '238.00', '1', '238');
INSERT INTO `order_in_detail` VALUES ('46', '18', '笔记本电脑', '1999.00', '1', '1999');

-- ----------------------------
-- Table structure for `order_in_reback`
-- ----------------------------
DROP TABLE IF EXISTS `order_in_reback`;
CREATE TABLE `order_in_reback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` float(11,2) DEFAULT NULL,
  `productNum` int(5) NOT NULL,
  `payType` int(2) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '0',
  `operator` varchar(32) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_in_reback
-- ----------------------------
INSERT INTO `order_in_reback` VALUES ('17', '408.00', '5', '2', '1', 'admin', '退货五个商品！', '2019-03-08 21:31:47');
INSERT INTO `order_in_reback` VALUES ('18', '27591.00', '6', '0', '1', 'admin', '每类都退一个！', '2019-03-08 21:33:41');
INSERT INTO `order_in_reback` VALUES ('19', '2065.00', '2', '0', '0', 'admin', '', '2019-03-09 17:45:12');

-- ----------------------------
-- Table structure for `order_in_reback_detail`
-- ----------------------------
DROP TABLE IF EXISTS `order_in_reback_detail`;
CREATE TABLE `order_in_reback_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderInRebackId` int(11) NOT NULL,
  `productName` varchar(128) NOT NULL,
  `price` float(8,2) NOT NULL,
  `productNum` int(5) NOT NULL,
  `money` float(8,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderInId` (`orderInRebackId`),
  CONSTRAINT `order_in_reback_detail_ibfk_1` FOREIGN KEY (`orderInRebackId`) REFERENCES `order_in_reback` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_in_reback_detail
-- ----------------------------
INSERT INTO `order_in_reback_detail` VALUES ('31', '17', 'Java实战开发教程', '128.00', '3', '384');
INSERT INTO `order_in_reback_detail` VALUES ('32', '17', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '2', '24');
INSERT INTO `order_in_reback_detail` VALUES ('33', '18', '男士长袖', '66.00', '1', '66');
INSERT INTO `order_in_reback_detail` VALUES ('34', '18', 'Java实战开发教程', '128.00', '1', '128');
INSERT INTO `order_in_reback_detail` VALUES ('35', '18', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '1', '12');
INSERT INTO `order_in_reback_detail` VALUES ('36', '18', '洗衣机', '4399.00', '1', '4399');
INSERT INTO `order_in_reback_detail` VALUES ('37', '18', '电视机', '2988.00', '1', '2988');
INSERT INTO `order_in_reback_detail` VALUES ('38', '18', '智能机器人', '19998.00', '1', '19998');
INSERT INTO `order_in_reback_detail` VALUES ('39', '19', '男士长袖', '66.00', '1', '66');
INSERT INTO `order_in_reback_detail` VALUES ('40', '19', '笔记本电脑', '1999.00', '1', '1999');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplierId` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `place` varchar(128) CHARACTER SET utf32 DEFAULT NULL,
  `spec` varchar(64) DEFAULT NULL,
  `pk` varchar(64) DEFAULT NULL,
  `unit` varchar(32) DEFAULT NULL,
  `price` float(8,2) NOT NULL,
  `remark` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplierId` (`supplierId`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '2', 'Java实战开发教程', '上海', '2G网盘资源', '网盘', '个', '128.00', '猿来入此项目实战开发教程及源码');
INSERT INTO `product` VALUES ('2', '3', '男士长袖', '杭州', '尺寸176', '袋装', '件', '66.00', '阿里巴巴男士长袖');
INSERT INTO `product` VALUES ('3', '4', '义乌市震昊编织袋无纺布袋有限公司', '义务', '长120ml', '袋装', '件', '12.00', '袋子');
INSERT INTO `product` VALUES ('4', '4', '洗衣机', '北京', '100*300*189mm', '箱装', '台', '4399.00', '百度出的智能洗衣机。');
INSERT INTO `product` VALUES ('5', '10', '电视机', '深圳', '300*500*198mm', '盒装', '台', '2988.00', '腾讯出的智能电视机。');
INSERT INTO `product` VALUES ('6', '3', '智能机器人', '杭州', '100*200*300', '箱装', '个', '19998.00', '阿里巴巴出的叼炸天智能机器人。');
INSERT INTO `product` VALUES ('9', '2', 'Iphone XR 128G', '上海', '3*3*7', '盒装', '台', '238.00', '测试导入商品');
INSERT INTO `product` VALUES ('10', '2', '笔记本电脑', '广东', '67*88*78', '箱装', '台', '1999.00', '笔记本电脑');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '超级管理员拥有一切权限！');
INSERT INTO `role` VALUES ('2', '普通用户', '普通用户，请自由授权！');

-- ----------------------------
-- Table structure for `sell`
-- ----------------------------
DROP TABLE IF EXISTS `sell`;
CREATE TABLE `sell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` float(11,2) DEFAULT NULL,
  `productNum` int(5) NOT NULL,
  `payType` int(2) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '0',
  `operator` varchar(32) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sell
-- ----------------------------
INSERT INTO `sell` VALUES ('17', '256.00', '2', '2', '1', 'admin', '卖了猿来入此的教程！', '2017-06-01 11:12:22');
INSERT INTO `sell` VALUES ('18', '27591.00', '6', '1', '1', 'admin', '卖了一大批货！', '2018-07-02 11:14:22');
INSERT INTO `sell` VALUES ('19', '14092.00', '111', '2', '0', 'admin', '购买！', '2019-01-24 13:29:08');
INSERT INTO `sell` VALUES ('20', '41683.00', '117', '4', '0', 'admin', '', '2019-02-13 13:29:41');
INSERT INTO `sell` VALUES ('21', '7477.00', '5', '1', '0', 'admin', '购买商品', '2019-03-09 13:30:09');
INSERT INTO `sell` VALUES ('22', '30852.00', '16', '0', '0', 'admin', '进货', '2019-03-09 17:39:07');
INSERT INTO `sell` VALUES ('23', '31236.00', '19', '0', '0', 'admin', '', '2019-03-09 17:41:31');

-- ----------------------------
-- Table structure for `sell_detail`
-- ----------------------------
DROP TABLE IF EXISTS `sell_detail`;
CREATE TABLE `sell_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sellId` int(11) NOT NULL,
  `productName` varchar(128) NOT NULL,
  `price` float(8,2) NOT NULL,
  `productNum` int(5) NOT NULL,
  `money` float(8,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderInId` (`sellId`),
  CONSTRAINT `sell_detail_ibfk_1` FOREIGN KEY (`sellId`) REFERENCES `sell` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sell_detail
-- ----------------------------
INSERT INTO `sell_detail` VALUES ('35', '17', 'Java实战开发教程', '128.00', '2', '256');
INSERT INTO `sell_detail` VALUES ('36', '18', 'Java实战开发教程', '128.00', '1', '128');
INSERT INTO `sell_detail` VALUES ('37', '18', '洗衣机', '4399.00', '1', '4399');
INSERT INTO `sell_detail` VALUES ('38', '18', '电视机', '2988.00', '1', '2988');
INSERT INTO `sell_detail` VALUES ('39', '18', '智能机器人', '19998.00', '1', '19998');
INSERT INTO `sell_detail` VALUES ('40', '18', '男士长袖', '66.00', '1', '66');
INSERT INTO `sell_detail` VALUES ('41', '18', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '1', '12');
INSERT INTO `sell_detail` VALUES ('42', '19', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '1', '12');
INSERT INTO `sell_detail` VALUES ('43', '19', 'Java实战开发教程', '128.00', '110', '14080');
INSERT INTO `sell_detail` VALUES ('44', '20', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '2', '24');
INSERT INTO `sell_detail` VALUES ('45', '20', 'Java实战开发教程', '128.00', '111', '14208');
INSERT INTO `sell_detail` VALUES ('46', '20', '智能机器人', '19998.00', '1', '19998');
INSERT INTO `sell_detail` VALUES ('47', '20', '洗衣机', '4399.00', '1', '4399');
INSERT INTO `sell_detail` VALUES ('48', '20', '电视机', '2988.00', '1', '2988');
INSERT INTO `sell_detail` VALUES ('49', '20', '男士长袖', '66.00', '1', '66');
INSERT INTO `sell_detail` VALUES ('50', '21', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '2', '24');
INSERT INTO `sell_detail` VALUES ('51', '21', '洗衣机', '4399.00', '1', '4399');
INSERT INTO `sell_detail` VALUES ('52', '21', '电视机', '2988.00', '1', '2988');
INSERT INTO `sell_detail` VALUES ('53', '21', '男士长袖', '66.00', '1', '66');
INSERT INTO `sell_detail` VALUES ('54', '22', '洗衣机', '4399.00', '1', '4399');
INSERT INTO `sell_detail` VALUES ('55', '22', '电视机', '2988.00', '1', '2988');
INSERT INTO `sell_detail` VALUES ('56', '22', '智能机器人', '19998.00', '1', '19998');
INSERT INTO `sell_detail` VALUES ('57', '22', '男士长袖', '66.00', '1', '66');
INSERT INTO `sell_detail` VALUES ('58', '22', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '1', '12');
INSERT INTO `sell_detail` VALUES ('59', '22', 'Java实战开发教程', '128.00', '9', '1152');
INSERT INTO `sell_detail` VALUES ('60', '22', 'Iphone XR 128G', '238.00', '1', '238');
INSERT INTO `sell_detail` VALUES ('61', '22', '笔记本电脑', '1999.00', '1', '1999');
INSERT INTO `sell_detail` VALUES ('62', '23', '洗衣机', '4399.00', '1', '4399');
INSERT INTO `sell_detail` VALUES ('63', '23', '电视机', '2988.00', '1', '2988');
INSERT INTO `sell_detail` VALUES ('64', '23', '智能机器人', '19998.00', '1', '19998');
INSERT INTO `sell_detail` VALUES ('65', '23', '男士长袖', '66.00', '1', '66');
INSERT INTO `sell_detail` VALUES ('66', '23', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '1', '12');
INSERT INTO `sell_detail` VALUES ('67', '23', 'Java实战开发教程', '128.00', '12', '1536');
INSERT INTO `sell_detail` VALUES ('68', '23', 'Iphone XR 128G', '238.00', '1', '238');
INSERT INTO `sell_detail` VALUES ('69', '23', '笔记本电脑', '1999.00', '1', '1999');

-- ----------------------------
-- Table structure for `sell_reback`
-- ----------------------------
DROP TABLE IF EXISTS `sell_reback`;
CREATE TABLE `sell_reback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` float(11,2) DEFAULT NULL,
  `productNum` int(5) NOT NULL,
  `payType` int(2) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '0',
  `operator` varchar(32) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sell_reback
-- ----------------------------
INSERT INTO `sell_reback` VALUES ('19', '12.00', '1', '0', '1', 'admin', '退货！', '2017-06-01 12:05:15');
INSERT INTO `sell_reback` VALUES ('20', '28755.00', '16', '1', '0', 'admin', '客户退了一批货！', '2018-07-02 12:06:12');
INSERT INTO `sell_reback` VALUES ('21', '233076.00', '79', '2', '0', 'admin', '质量问题，退货！', '2019-02-13 14:43:29');
INSERT INTO `sell_reback` VALUES ('22', '24409.00', '3', '1', '0', 'admin', '退货', '2019-03-09 14:43:52');
INSERT INTO `sell_reback` VALUES ('23', '78.00', '2', '0', '0', 'admin', '', '2019-03-09 17:48:31');
INSERT INTO `sell_reback` VALUES ('24', '78.00', '2', '0', '0', 'admin', '', '2019-03-09 17:49:18');

-- ----------------------------
-- Table structure for `sell_reback_detail`
-- ----------------------------
DROP TABLE IF EXISTS `sell_reback_detail`;
CREATE TABLE `sell_reback_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sellRebackId` int(11) NOT NULL,
  `productName` varchar(128) NOT NULL,
  `price` float(8,2) NOT NULL,
  `productNum` int(5) NOT NULL,
  `money` float(8,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderInId` (`sellRebackId`),
  CONSTRAINT `sell_reback_detail_ibfk_1` FOREIGN KEY (`sellRebackId`) REFERENCES `sell_reback` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sell_reback_detail
-- ----------------------------
INSERT INTO `sell_reback_detail` VALUES ('42', '19', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '1', '12');
INSERT INTO `sell_reback_detail` VALUES ('43', '20', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '2', '24');
INSERT INTO `sell_reback_detail` VALUES ('44', '20', '洗衣机', '4399.00', '1', '4399');
INSERT INTO `sell_reback_detail` VALUES ('45', '20', '电视机', '2988.00', '1', '2988');
INSERT INTO `sell_reback_detail` VALUES ('46', '20', '智能机器人', '19998.00', '1', '19998');
INSERT INTO `sell_reback_detail` VALUES ('47', '20', '男士长袖', '66.00', '1', '66');
INSERT INTO `sell_reback_detail` VALUES ('48', '20', 'Java实战开发教程', '128.00', '10', '1280');
INSERT INTO `sell_reback_detail` VALUES ('49', '21', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '1', '12');
INSERT INTO `sell_reback_detail` VALUES ('50', '21', '电视机', '2988.00', '78', '233064');
INSERT INTO `sell_reback_detail` VALUES ('51', '22', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '1', '12');
INSERT INTO `sell_reback_detail` VALUES ('52', '22', '智能机器人', '19998.00', '1', '19998');
INSERT INTO `sell_reback_detail` VALUES ('53', '22', '洗衣机', '4399.00', '1', '4399');
INSERT INTO `sell_reback_detail` VALUES ('54', '23', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '1', '12');
INSERT INTO `sell_reback_detail` VALUES ('55', '23', '男士长袖', '66.00', '1', '66');
INSERT INTO `sell_reback_detail` VALUES ('56', '24', '义乌市震昊编织袋无纺布袋有限公司', '12.00', '1', '12');
INSERT INTO `sell_reback_detail` VALUES ('57', '24', '男士长袖', '66.00', '1', '66');

-- ----------------------------
-- Table structure for `stock`
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `productNum` int(8) NOT NULL,
  `sellNum` int(8) NOT NULL DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('4', '4', '10', '1', '2019-03-08 18:47:04');
INSERT INTO `stock` VALUES ('5', '5', '200', '1', '2019-03-08 18:47:04');
INSERT INTO `stock` VALUES ('6', '6', '51', '1', '2019-03-08 18:47:04');
INSERT INTO `stock` VALUES ('7', '2', '100', '1', '2019-03-08 18:48:02');
INSERT INTO `stock` VALUES ('8', '3', '121', '1', '2019-03-08 18:48:02');
INSERT INTO `stock` VALUES ('9', '1', '765', '12', '2019-03-08 18:48:46');
INSERT INTO `stock` VALUES ('10', '9', '11', '1', '2019-03-09 17:29:13');
INSERT INTO `stock` VALUES ('11', '10', '10', '1', '2019-03-09 17:29:13');

-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `tel` varchar(32) NOT NULL,
  `address` varchar(128) NOT NULL,
  `contactName` varchar(32) NOT NULL,
  `contactPhone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('2', '猿来入此', '021-25656565', '上海 浦东', '猿来入此站长', '13918655656');
INSERT INTO `supplier` VALUES ('3', '阿里巴巴', '020-56565656', '浙江 杭州 西湖河畔', '马云', '13818181818');
INSERT INTO `supplier` VALUES ('4', '百度', '010-12123232', '北京 朝阳区', '李彦宏', '13616816888');
INSERT INTO `supplier` VALUES ('10', '腾讯', '035-45465464', '深圳', '马化腾', '1357878787');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `roleId` int(11) NOT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `sex` int(1) NOT NULL DEFAULT '0',
  `age` int(3) NOT NULL DEFAULT '0',
  `address` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '1', '/StockManagerSSM/resources/upload/1552123215881.png', '1', '1', '上海市浦东新区浦东南路1835号');
INSERT INTO `user` VALUES ('13', '猿来入此', '123456', '2', '/StockManagerSSM/resources/upload/1552116101099.jpg', '1', '1', '猿来入此');
