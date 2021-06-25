/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : xtoon-cloud

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 25/06/2021 21:15:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(256) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
BEGIN;
INSERT INTO `oauth_client_details` VALUES ('client', NULL, '123456', 'all', 'password,refresh_token', '', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for org_employee
-- ----------------------------
DROP TABLE IF EXISTS `org_employee`;
CREATE TABLE `org_employee` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `emp_no` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '员工工号',
  `emp_name` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '员工姓名',
  `emp_sex` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '员工性别',
  `user_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户ID',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态 0启用，1禁用',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `tenant_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属租户',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='员工 ';

-- ----------------------------
-- Records of org_employee
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for org_employee_office
-- ----------------------------
DROP TABLE IF EXISTS `org_employee_office`;
CREATE TABLE `org_employee_office` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `emp_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '员工id',
  `officce_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '机构id',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `tenant_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属租户',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='员工附属机构关系 ';

-- ----------------------------
-- Records of org_employee_office
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for org_employee_post
-- ----------------------------
DROP TABLE IF EXISTS `org_employee_post`;
CREATE TABLE `org_employee_post` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `emp_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '员工id',
  `post_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '岗位id',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `tenant_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属租户',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='员工与岗位关系 ';

-- ----------------------------
-- Records of org_employee_post
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for org_office
-- ----------------------------
DROP TABLE IF EXISTS `org_office`;
CREATE TABLE `org_office` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `office_name` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '机构名称',
  `office_code` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '机构编码',
  `office_type` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '机构分类',
  `parent_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '父级ID',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态 0启用，1禁用',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `tenant_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属租户',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='组织机构 ';

-- ----------------------------
-- Records of org_office
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for org_post
-- ----------------------------
DROP TABLE IF EXISTS `org_post`;
CREATE TABLE `org_post` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `post_code` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '岗位编码',
  `post_name` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '岗位名称',
  `post_type` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '岗位类型',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态 0启用，1禁用',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `tenant_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属租户',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='岗位 ';

-- ----------------------------
-- Records of org_post
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_account`;
CREATE TABLE `sys_account` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `mobile` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号',
  `email` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `password` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='帐号 ';

-- ----------------------------
-- Records of sys_account
-- ----------------------------
BEGIN;
INSERT INTO `sys_account` VALUES ('1', '18555555555', NULL, '$2a$10$aMPvVwFvA/Y0K4/DJ8cznOSUjBtgyNqCqxaPSkbZxJjGvnPPK/jkK', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_account` VALUES ('1408403800320135170', '18666666666', '5258@qq.com', '$2a$10$h3NTJ.0mWGsHsb2TxTnWhe0J4vE7CbgNntJY4ONO5QkOR2qllLOQ6', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_account` VALUES ('1408411207922417666', '18777777777', '344@qq.com', '$2a$10$TXLmFu.moRbeSwGp.RF6GO25F2Zx0f0xKWSYKEX1rDuQi/0.qR3ce', NULL, '0', '1', '2021-06-25 21:06:14', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'uuid',
  `code` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='系统验证码 ';


-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `type_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '类型ID',
  `dict_label` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字典标签',
  `dict_value` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字段值',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态 0启用，1禁用',
  `tenant_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属租户',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='字典项 ';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `type_name` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '类型名称',
  `type_code` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '类型编码',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态 0启用，1禁用',
  `tenant_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属租户',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='字典类型 ';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `user_name` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
  `operation` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作',
  `method` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '方法',
  `params` text COLLATE utf8mb4_bin COMMENT '参数',
  `time` bigint(20) DEFAULT NULL COMMENT '执行时长（毫秒）',
  `ip` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ip地址',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `tenant_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属租户',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='日志 ';


-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `param_key` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'key',
  `param_value` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'value',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态 0启用，1禁用',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `tenant_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属租户',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='参数 ';

-- ----------------------------
-- Records of sys_param
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `parent_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '父级权限',
  `permission_name` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限名称',
  `permission_type` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限类型',
  `permission_level` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限级别',
  `permission_codes` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '授权编码',
  `menu_icon` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `menu_url` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单URL',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态 0启用，1禁用',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='菜单 ';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
BEGIN;
INSERT INTO `sys_permission` VALUES ('0', '-1', '所有菜单', '0', '1', NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1362320253140361218', '0', '系统管理', '0', '1', NULL, 'system', 0, NULL, '0', NULL, '0', 'system', '2021-02-18 16:37:14', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1362320893308592129', '1362320253140361218', '用户管理', '1', '1', NULL, 'admin', 0, 'sys/user', '0', NULL, '0', 'system', '2021-02-18 16:39:46', 'system', '2021-02-18 17:07:47');
INSERT INTO `sys_permission` VALUES ('1362321213669531650', '1362320253140361218', '角色管理', '1', '1', '', 'role', 1, 'sys/role', '0', NULL, '0', 'system', '2021-02-18 16:41:03', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1362321550283399170', '1362320253140361218', '权限管理', '1', '0', '', 'menu', 2, 'sys/menu', '0', NULL, '0', 'system', '2021-02-18 16:42:23', 'system', '2021-02-18 19:36:42');
INSERT INTO `sys_permission` VALUES ('1362321865267240961', '1362320253140361218', '租户管理', '1', '0', NULL, 'shouye', 3, 'sys/tenant', '0', NULL, '0', 'system', '2021-02-18 16:43:38', '超级管理员', '2021-02-27 14:45:44');
INSERT INTO `sys_permission` VALUES ('1362323350755500033', '1362320253140361218', '日志管理', '1', '1', NULL, 'log', 4, 'sys/log', '0', NULL, '0', 'system', '2021-02-18 16:49:32', '超级管理员', '2021-02-27 15:19:39');
INSERT INTO `sys_permission` VALUES ('1362324153734029314', '1362321550283399170', '所有菜单列表', '2', '0', 'sys:permission:list', NULL, 1, NULL, '0', NULL, '0', 'system', '2021-02-18 16:52:44', 'system', '2021-02-18 19:36:42');
INSERT INTO `sys_permission` VALUES ('1362324379337252865', '1362321550283399170', '菜单选择', '2', '0', 'sys:permission:select', NULL, 2, NULL, '0', NULL, '0', 'system', '2021-02-18 16:53:37', 'system', '2021-02-18 19:36:42');
INSERT INTO `sys_permission` VALUES ('1362324608593715201', '1362321550283399170', '权限详情', '2', '0', 'sys:permission:info', NULL, 3, NULL, '0', NULL, '0', 'system', '2021-02-18 16:54:32', 'system', '2021-02-18 19:36:42');
INSERT INTO `sys_permission` VALUES ('1362324808573935617', '1362321550283399170', '新增', '2', '0', 'sys:permission:save', NULL, 4, NULL, '0', NULL, '0', 'system', '2021-02-18 16:55:20', 'system', '2021-02-18 19:36:42');
INSERT INTO `sys_permission` VALUES ('1362324991982460929', '1362321550283399170', '更新', '2', '0', 'sys:permission:update', NULL, 5, NULL, '0', NULL, '0', 'system', '2021-02-18 16:56:04', 'system', '2021-02-18 19:36:42');
INSERT INTO `sys_permission` VALUES ('1362325121653563393', '1362321550283399170', '删除', '2', '0', 'sys:permission:delete', NULL, 6, NULL, '0', NULL, '0', 'system', '2021-02-18 16:56:34', 'system', '2021-02-18 19:36:42');
INSERT INTO `sys_permission` VALUES ('1362377009644195842', '1362321550283399170', '禁用', '2', '0', 'sys:permission:disable', '22', 0, NULL, '0', NULL, '0', 'system', '2021-02-18 20:22:45', 'system', '2021-02-18 20:24:30');
INSERT INTO `sys_permission` VALUES ('1362755127202639873', '1362321213669531650', '角色分页查询', '2', '1', 'sys:role:list', NULL, 0, NULL, '0', NULL, '0', 'system', '2021-02-19 21:25:16', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1362755335118483457', '1362321213669531650', '角色列表', '2', '1', 'sys:role:select', NULL, 1, NULL, '0', NULL, '0', 'system', '2021-02-19 21:26:05', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1362755413975592961', '1362321213669531650', '角色信息', '2', '1', 'sys:role:info', NULL, 1, NULL, '0', NULL, '0', 'system', '2021-02-19 21:26:24', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1362755490018324481', '1362321213669531650', '保存角色', '2', '1', 'sys:role:save', NULL, 2, NULL, '0', NULL, '0', 'system', '2021-02-19 21:26:42', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1362755572402843650', '1362321213669531650', '修改角色', '2', '1', 'sys:role:update', NULL, 3, NULL, '0', NULL, '0', 'system', '2021-02-19 21:27:02', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1362755671384223746', '1362321213669531650', '删除角色', '2', '1', 'sys:role:delete', NULL, 4, NULL, '0', NULL, '0', 'system', '2021-02-19 21:27:25', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1362755739877208065', '1362321213669531650', '禁用角色', '2', '1', 'sys:role:disable', NULL, 5, NULL, '0', NULL, '0', 'system', '2021-02-19 21:27:42', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1364445600617373697', '1362323350755500033', '分页查询日志', '2', '1', 'sys:log:list', NULL, 0, NULL, '0', NULL, '0', '超级管理员', '2021-02-24 13:22:36', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1364445923025133570', '1362320893308592129', '用户分页查询', '2', '1', 'sys:user:list', NULL, 0, NULL, '0', NULL, '0', '超级管理员', '2021-02-24 13:23:53', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1364446030516756481', '1362320893308592129', '用户信息', '2', '1', 'sys:user:info', NULL, 1, NULL, '0', NULL, '0', '超级管理员', '2021-02-24 13:24:19', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1364446380040691714', '1362320893308592129', '修改用户', '2', '1', 'sys:user:update', NULL, 2, NULL, '0', NULL, '0', '超级管理员', '2021-02-24 13:25:42', '超级管理员', '2021-02-24 13:31:17');
INSERT INTO `sys_permission` VALUES ('1364446467147997186', '1362320893308592129', '删除用户', '2', '1', 'sys:user:delete', NULL, 4, NULL, '0', NULL, '0', '超级管理员', '2021-02-24 13:26:03', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1364446617924837377', '1362320893308592129', '禁用用户', '2', '1', 'sys:user:disable', NULL, 5, NULL, '0', NULL, '0', '超级管理员', '2021-02-24 13:26:39', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1365315749635231746', '1362320893308592129', '用户保存', '2', '1', 'sys:user:save', '', 0, NULL, '0', NULL, '0', '超级管理员', '2021-02-26 23:00:16', '超级管理员', '2021-02-26 23:01:07');
INSERT INTO `sys_permission` VALUES ('1365562507946668034', '1362321865267240961', '租户分页查询', '2', '0', 'sys:tenant:list', '', 0, NULL, '0', NULL, '0', '超级管理员', '2021-02-27 15:20:47', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1365670028631916546', '1362321865267240961', '租户禁用', '2', '0', 'sys:tenant:disable', '', 0, NULL, '0', NULL, '0', '测试用户', '2021-02-27 22:28:02', NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1378568527153262594', '1362320253140361218', '测试菜单', '1', '0', '', '', 3, '111', '0', NULL, '1', '超级管理员', '2021-04-04 12:42:04', '超级管理员', '2021-04-04 12:42:28');
INSERT INTO `sys_permission` VALUES ('1392029950139265025', NULL, '用户管理', '1', '1', 'c,v', '', 0, 'index', '0', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392030721190731777', NULL, '用户管理', '1', '1', 'c,v', '', 0, 'index', '0', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392031350581923841', NULL, '用户管理', '1', '1', 'c,v', '', 0, 'index', '0', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392031954462920705', NULL, '用户管理', '1', '1', 'c,v', '', 0, 'index', '0', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392032093655072769', NULL, '用户管理', '1', '1', 'c,v', '', 0, 'index', '0', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392033768935624705', NULL, '用户管理', '1', '1', 'c,v', '', 0, 'index', '0', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392321438437900289', NULL, '用户管理', '1', '1', 'c,v', '', 0, 'index', '0', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392322262421557250', NULL, '用户管理', '1', '1', 'c,v', '', 0, 'index', '0', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392323337207734273', NULL, '用户管理', '1', '1', 'c,v', '', 0, 'index', '0', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392323762682134530', NULL, '用户管理', '1', '1', 'c,v', '', 0, 'index', '0', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392323981138272257', NULL, '用户管理', '1', '1', 'c,v', '', 0, 'index', '0', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392324441580593153', NULL, '用户管理', '1', '1', 'c,v', '', 0, 'index', '0', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392372237876678657', NULL, '用户管理', '1', '1', 'c,v', '', 0, 'index', '0', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392383563386683394', NULL, '用户管理', '1', '1', NULL, '', 0, 'index', '1', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392383563638341633', NULL, '用户管理', '1', '1', NULL, '', 0, 'index', '0', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392384701955637249', NULL, '用户管理', '1', '1', NULL, '', 0, 'index', '0', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392385152411291650', NULL, '用户管理', '1', '1', NULL, '', 0, 'index', '1', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1392385152809750529', '1392385152411291650', '用户管理', '1', '1', NULL, '', 0, 'index', '1', NULL, '1', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `role_code` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色编码',
  `role_name` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色名称',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态 0启用，1禁用',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `tenant_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属租户',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色 ';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', 'sysAdmin', '系统管理员', '0', '测试', '1', '0', '超级管理员', '2021-02-24 13:34:58', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1408403448585801730', 'test', '测试角色', '0', '', '1', '0', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `role_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色ID',
  `permission_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限ID',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `tenant_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属租户',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色权限';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_permission` VALUES ('1408403497369751553', '1408403448585801730', '1362320893308592129', NULL, '1', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES ('1408403497382334466', '1408403448585801730', '1364445923025133570', NULL, '1', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES ('1408403497386528770', '1408403448585801730', '1365315749635231746', NULL, '1', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES ('1408403497390723073', '1408403448585801730', '1364446030516756481', NULL, '1', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES ('1408403497394917378', '1408403448585801730', '1364446380040691714', NULL, '1', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES ('1408403497399111681', '1408403448585801730', '1364446467147997186', NULL, '1', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES ('1408403497403305986', '1408403448585801730', '1364446617924837377', NULL, '1', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES ('1408403497411694594', '1408403448585801730', '0', NULL, '1', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES ('1408403497415888897', '1408403448585801730', '1362320253140361218', NULL, '1', '0', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `tenant_code` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户编码',
  `tenant_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户名称',
  `creator_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者ID',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='租户 ';

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
BEGIN;
INSERT INTO `sys_tenant` VALUES ('1', 'xtoon', '享同科技', '1', '0', NULL, '0', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `account_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '帐号ID',
  `user_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
  `user_type` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户类型',
  `link_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '关联id',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `tenant_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属租户',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户 ';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', '1', '超级管理员', NULL, NULL, '0', NULL, '1', '0', '超级管理员', '2021-02-24 13:34:58', '1', '2021-04-23 16:38:13');
INSERT INTO `sys_user` VALUES ('1408403800345300994', '1408403800320135170', '18666666666', NULL, NULL, '0', NULL, '1', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES ('1408411207947583489', '1408411207922417666', '18777777777', NULL, NULL, '0', NULL, '1', '0', '1', '2021-06-25 21:06:14', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `user_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户ID',
  `role_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色ID',
  `remarks` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `tenant_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属租户',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  `created_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户角色 ';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1385513324290293761', '1', '1', NULL, '1', '0', '1', '2021-04-23 16:38:13', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('1408403865084383233', '1408403800345300994', '1408403448585801730', NULL, '1', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('1408411207985332225', '1408411207947583489', '1408403448585801730', NULL, '1', '0', '1', '2021-06-25 21:06:14', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
