/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80100
 Source Host           : localhost:3306
 Source Schema         : ry_vue

 Target Server Type    : MySQL
 Target Server Version : 80100
 File Encoding         : 65001

 Date: 03/03/2025 13:49:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for engineering_budget
-- ----------------------------
DROP TABLE IF EXISTS `engineering_budget`;
CREATE TABLE `engineering_budget`  (
  `budget_id` int NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `parent_id` int NULL DEFAULT NULL COMMENT '父节点ID',
  `level` int NOT NULL COMMENT '层级',
  `project_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工程名字',
  `tunnel_cost` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '井巷工程费',
  `building_cost` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '建筑工程费',
  `installation_cost` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '安装工程费',
  `equipment_cost` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '设备购置费',
  `other_cost` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '其他费用',
  `total_cost` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '合计',
  `project_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工程状态',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '描述信息',
  `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`budget_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  CONSTRAINT `engineering_budget_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `engineering_budget` (`budget_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工程费用树形表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of engineering_budget
-- ----------------------------
INSERT INTO `engineering_budget` VALUES (1, NULL, 1, '第一部分工程费用', 14179.00, 4324.00, 3242.00, 2432.00, 234243.00, 258420.00, '0', '第一部分工程费用的总概算', '2024-09-25 00:00:00', '2024-11-05 10:18:44');
INSERT INTO `engineering_budget` VALUES (2, 1, 2, '采矿工程', 14179.00, 4324.00, 3242.00, 2315555.00, 234243.00, 258420.00, '1', '采矿工程', '2024-09-25 00:00:00', '2024-11-05 10:18:44');
INSERT INTO `engineering_budget` VALUES (3, 2, 3, '地下工程', 14179.00, 4324.00, 3242.00, 2432.00, 234243.00, 258420.00, '0', '地下工程', '2024-09-25 00:00:00', '2024-11-05 10:18:44');
INSERT INTO `engineering_budget` VALUES (4, 3, 4, '井下开拓工程', 14179.00, 4324.00, 3242.00, 2432.00, 234243.00, 258420.00, '1', '井下开拓工程', '2024-09-25 21:28:22', '2024-11-05 10:18:44');
INSERT INTO `engineering_budget` VALUES (5, 4, 5, '1号主井（φ5.2m）', 11258.00, 3424.00, 432.00, 234.00, 2134.00, 17482.00, '1', '1号主井（φ5.2m）', '2024-09-25 21:28:22', '2024-11-05 10:18:44');
INSERT INTO `engineering_budget` VALUES (6, 5, 6, '锁口段', 888.00, 0.00, 0.00, 0.00, 0.00, 888.00, '1', '锁口段', '2024-09-25 00:00:00', '2024-09-26 00:00:00');
INSERT INTO `engineering_budget` VALUES (7, 5, 6, '井颈上段', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '1', '井颈上段', '2024-09-25 21:28:22', '2024-09-26 08:41:08');
INSERT INTO `engineering_budget` VALUES (8, 5, 6, '井颈下段', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '1', '井颈下段', '2024-09-25 21:28:22', '2024-09-26 08:41:08');
INSERT INTO `engineering_budget` VALUES (9, 5, 6, '井筒（基岩段）', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '1', '井筒（基岩段）', '2024-09-25 21:28:22', '2024-09-26 08:41:09');
INSERT INTO `engineering_budget` VALUES (10, 5, 6, '井筒（破碎段）', 25.00, 0.00, 0.00, 0.00, 0.00, 25.00, '1', '井筒（破碎段）', '2024-09-25 00:00:00', '2024-11-05 00:00:00');
INSERT INTO `engineering_budget` VALUES (11, 5, 6, '马头门', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '1', '马头门', '2024-09-25 21:28:22', '2024-09-26 08:41:10');
INSERT INTO `engineering_budget` VALUES (12, 5, 6, '计量硐室', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '1', '计量硐室', '2024-09-25 21:28:22', '2024-09-26 08:41:11');
INSERT INTO `engineering_budget` VALUES (13, 5, 6, '井筒装备', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '1', '井筒装备', '2024-09-25 21:28:22', '2024-09-26 08:41:11');
INSERT INTO `engineering_budget` VALUES (14, 4, 5, '1#副井（Φ7.5）', 3242.00, 4324.00, 3242.00, 2432.00, 234243.00, 247483.00, '1', '1#副井（Φ7.5）', '2024-09-25 21:28:22', '2024-10-27 19:42:39');
INSERT INTO `engineering_budget` VALUES (15, 14, 6, '锁口段', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '1', '锁口段', '2024-09-25 21:28:22', '2024-09-26 08:41:13');
INSERT INTO `engineering_budget` VALUES (16, 14, 6, '井颈 1', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '1', '井颈 1', '2024-09-25 21:28:22', '2024-09-26 08:41:13');
INSERT INTO `engineering_budget` VALUES (17, 14, 6, '井颈 2', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '1', '井颈 2', '2024-09-25 21:28:22', '2024-09-26 08:41:14');
INSERT INTO `engineering_budget` VALUES (18, 14, 6, '井筒（基岩段）', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '1', '井筒（基岩段）', '2024-09-25 21:28:22', '2024-09-26 08:41:15');
INSERT INTO `engineering_budget` VALUES (19, 14, 6, '井筒（破碎段）', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '1', '井筒（破碎段）', '2024-09-25 21:28:22', '2024-09-26 08:41:27');
INSERT INTO `engineering_budget` VALUES (22, 5, 6, '井筒（测试）', 321.00, 3424.00, 432.00, 234.00, 2134.00, 6545.00, '0', '测试数据', '2024-10-27 18:04:43', '2024-10-27 18:04:43');
INSERT INTO `engineering_budget` VALUES (26, 14, 6, '井筒（测试）', 3242.00, 4324.00, 3242.00, 2432.00, 234243.00, 247483.00, '0', '测试数据', '2024-10-27 19:42:40', '2024-10-27 19:42:40');
INSERT INTO `engineering_budget` VALUES (28, 1, 2, '选矿工程', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '0', NULL, '2024-11-01 15:03:36', '2024-11-01 15:03:36');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 'engineering_budget', '工程费用树形表', '', '', 'EngineeringBudget', 'tree', 'element-plus', 'com.ruoyi.engineeringBudget', 'engineeringBudget', 'engineeringBudget', '工程概算', 'ruoyi', '0', '/', '{\"treeCode\":\"budget_id\",\"treeName\":\"project_name\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":2006}', 'admin', '2024-09-25 21:31:32', '', '2024-10-04 10:57:40', '工程概算');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (21, 3, 'budget_id', '节点ID', 'int', 'Long', 'budgetId', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-09-25 21:31:32', '', '2024-10-04 10:57:40');
INSERT INTO `gen_table_column` VALUES (22, 3, 'parent_id', '父节点ID', 'int', 'Long', 'parentId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 2, 'admin', '2024-09-25 21:31:32', '', '2024-10-04 10:57:40');
INSERT INTO `gen_table_column` VALUES (23, 3, 'level', '层级', 'int', 'Long', 'level', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 3, 'admin', '2024-09-25 21:31:32', '', '2024-10-04 10:57:40');
INSERT INTO `gen_table_column` VALUES (24, 3, 'project_name', '工程名字', 'varchar(50)', 'String', 'projectName', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-09-25 21:31:32', '', '2024-10-04 10:57:40');
INSERT INTO `gen_table_column` VALUES (25, 3, 'tunnel_cost', '井巷工程费', 'decimal(10,2)', 'BigDecimal', 'tunnelCost', '0', '0', '0', '1', '1', '1', '1', 'BETWEEN', 'input', '', 5, 'admin', '2024-09-25 21:31:32', '', '2024-10-04 10:57:40');
INSERT INTO `gen_table_column` VALUES (26, 3, 'building_cost', '建筑工程费', 'decimal(10,2)', 'BigDecimal', 'buildingCost', '0', '0', '0', '1', '1', '1', '1', 'BETWEEN', 'input', '', 6, 'admin', '2024-09-25 21:31:32', '', '2024-10-04 10:57:40');
INSERT INTO `gen_table_column` VALUES (27, 3, 'installation_cost', '安装工程费', 'decimal(10,2)', 'BigDecimal', 'installationCost', '0', '0', '0', '1', '1', '1', '1', 'BETWEEN', 'input', '', 7, 'admin', '2024-09-25 21:31:32', '', '2024-10-04 10:57:40');
INSERT INTO `gen_table_column` VALUES (28, 3, 'equipment_cost', '设备购置费', 'decimal(10,2)', 'BigDecimal', 'equipmentCost', '0', '0', '0', '1', '1', '1', '1', 'BETWEEN', 'input', '', 8, 'admin', '2024-09-25 21:31:32', '', '2024-10-04 10:57:40');
INSERT INTO `gen_table_column` VALUES (29, 3, 'other_cost', '其他费用', 'decimal(10,2)', 'BigDecimal', 'otherCost', '0', '0', '0', '1', '1', '1', '1', 'BETWEEN', 'input', '', 9, 'admin', '2024-09-25 21:31:32', '', '2024-10-04 10:57:40');
INSERT INTO `gen_table_column` VALUES (30, 3, 'total_cost', '合计', 'decimal(10,2)', 'BigDecimal', 'totalCost', '0', '0', '0', '1', '1', '1', '1', 'BETWEEN', 'input', '', 10, 'admin', '2024-09-25 21:31:32', '', '2024-10-04 10:57:40');
INSERT INTO `gen_table_column` VALUES (31, 3, 'description', '描述信息', 'text', 'String', 'description', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 12, 'admin', '2024-09-25 21:31:32', '', '2024-10-04 10:57:40');
INSERT INTO `gen_table_column` VALUES (32, 3, 'created_time', '创建时间', 'datetime', 'Date', 'createdTime', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'datetime', '', 13, 'admin', '2024-09-25 21:31:32', '', '2024-10-04 10:57:40');
INSERT INTO `gen_table_column` VALUES (33, 3, 'updated_time', '更新时间', 'datetime', 'Date', 'updatedTime', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'datetime', '', 14, 'admin', '2024-09-25 21:31:32', '', '2024-10-04 10:57:40');
INSERT INTO `gen_table_column` VALUES (34, 3, 'project_status', '工程状态', 'char(1)', 'String', 'projectStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 11, '', '2024-09-26 08:41:47', '', '2024-10-04 10:57:40');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-08-27 15:39:58', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-08-27 15:39:58', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-08-27 15:39:58', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-08-27 15:39:58', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-08-27 15:39:58', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-08-27 15:39:58', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-27 15:39:57', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-27 15:39:57', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-27 15:39:57', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-27 15:39:57', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-27 15:39:57', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-27 15:39:57', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-27 15:39:57', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-27 15:39:57', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-27 15:39:57', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-27 15:39:57', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '采矿工程', '0', 'project_type', NULL, 'default', 'N', '0', 'admin', '2024-09-24 20:41:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '地上工程', '1', 'project_type', NULL, 'default', 'N', '0', 'admin', '2024-09-24 20:42:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '地下工程', '2', 'project_type', NULL, 'default', 'N', '0', 'admin', '2024-09-24 20:42:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 4, '选矿工程', '3', 'project_type', NULL, 'default', 'N', '0', 'admin', '2024-09-24 20:43:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 5, '尾矿工程', '4', 'project_type', NULL, 'default', 'N', '0', 'admin', '2024-09-24 20:43:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 6, '供水设施', '5', 'project_type', NULL, 'default', 'N', '0', 'admin', '2024-09-24 20:43:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 7, '供热设施', '6', 'project_type', NULL, 'default', 'N', '0', 'admin', '2024-09-24 20:44:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 8, '供电设施', '7', 'project_type', NULL, 'default', 'N', '0', 'admin', '2024-09-24 20:45:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 9, '机修及辅助设施', '8', 'project_type', NULL, 'default', 'N', '0', 'admin', '2024-09-24 20:46:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 10, '通信系统', '9', 'project_type', NULL, 'default', 'N', '0', 'admin', '2024-09-24 20:46:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 11, '行政与生活福利设施', '10', 'project_type', NULL, 'default', 'N', '0', 'admin', '2024-09-24 20:48:01', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 12, '厂区及总图工程', '11', 'project_type', NULL, 'default', 'N', '0', 'admin', '2024-09-24 20:48:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 13, '备品备件购置费', '12', 'project_type', NULL, 'default', 'N', '0', 'admin', '2024-09-24 20:48:46', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '工程类型', 'project_type', '0', 'admin', '2024-09-24 20:36:35', 'admin', '2024-09-24 20:51:28', '工程类别');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-08-27 15:39:58', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 179 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-29 21:14:08');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '172.20.10.3', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 19:03:37');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '172.20.10.3', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 19:58:21');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 20:21:39');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '172.20.10.3', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 21:35:02');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '172.20.10.3', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 10:15:14');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '172.20.10.3', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 12:52:52');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 13:28:43');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 15:47:41');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 16:50:14');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '172.20.10.3', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 19:29:08');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '172.20.10.3', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 21:03:20');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '172.20.10.3', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 08:32:29');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '172.20.10.3', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 13:13:39');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '172.20.10.3', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 15:51:58');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '172.20.10.3', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 16:38:23');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 16:40:58');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 20:27:53');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 21:45:27');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 14:52:53');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-28 08:21:10');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-28 08:44:43');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-28 12:42:06');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 20:50:41');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 21:42:54');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 08:23:45');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 09:18:14');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 10:04:16');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 20:08:04');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 10:52:50');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 15:51:18');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-10-04 20:25:41');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 20:25:46');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 21:14:22');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 08:56:44');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-10-07 21:36:05');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-07 21:36:10');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 08:57:11');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:28:25');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 14:55:35');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 16:35:42');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 20:32:32');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 21:46:44');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 08:52:02');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-10-09 08:59:33');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 08:59:40');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-10-09 12:28:32');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 12:28:36');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 21:40:00');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-23 20:02:35');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-10-24 20:42:17');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-24 20:42:22');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-25 11:38:42');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2024-10-25 12:30:15');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-25 12:30:19');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-26 19:48:12');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-26 21:15:13');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-27 09:25:04');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-27 18:01:26');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-27 19:41:54');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 23:01:49');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-01 14:45:47');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-01 21:10:31');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2024-11-01 22:14:01');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-01 22:14:05');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-02 17:16:09');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-04 21:54:30');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-11-04 22:57:30');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-04 22:57:34');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-05 08:35:12');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-05 10:18:17');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-05 18:40:17');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-11 20:45:21');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-14 20:21:13');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-14 20:31:26');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-11-14 20:55:05');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-14 20:55:10');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-28 10:23:27');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-07 15:35:46');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2026 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-08-27 15:39:58', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-08-27 15:39:58', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-08-27 15:39:58', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-08-27 15:39:58', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-08-27 15:39:58', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-08-27 15:39:58', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-08-27 15:39:58', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-08-27 15:39:58', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-08-27 15:39:58', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-08-27 15:39:58', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-08-27 15:39:58', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-08-27 15:39:58', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-08-27 15:39:58', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-08-27 15:39:58', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-08-27 15:39:58', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-08-27 15:39:58', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-08-27 15:39:58', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-08-27 15:39:58', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-08-27 15:39:58', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-08-27 15:39:58', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-08-27 15:39:58', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-08-27 15:39:58', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-08-27 15:39:58', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-08-27 15:39:58', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '项目概算', 0, 5, 'budget', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'money', 'admin', '2024-09-24 21:12:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '工程概算', 2006, 1, 'engineeringBudget', 'engineeringBudget/engineeringBudget/index', NULL, '', 1, 0, 'C', '0', '0', 'engineeringBudget:engineeringBudget:list', '#', 'admin', '2024-09-26 16:09:06', '', NULL, '工程概算菜单');
INSERT INTO `sys_menu` VALUES (2021, '工程概算查询', 2020, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'engineeringBudget:engineeringBudget:query', '#', 'admin', '2024-09-26 16:09:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '工程概算新增', 2020, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'engineeringBudget:engineeringBudget:add', '#', 'admin', '2024-09-26 16:09:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '工程概算修改', 2020, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'engineeringBudget:engineeringBudget:edit', '#', 'admin', '2024-09-26 16:09:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '工程概算删除', 2020, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'engineeringBudget:engineeringBudget:remove', '#', 'admin', '2024-09-26 16:09:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '工程概算导出', 2020, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'engineeringBudget:engineeringBudget:export', '#', 'admin', '2024-09-26 16:09:06', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-08-27 15:39:58', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-08-27 15:39:58', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '工程概算总览', 1, 'com.ruoyi.engineering_total.controller.EngineeringTotalController.add()', 'POST', 1, 'admin', '研发部门', '/engineering_total/engineering_total', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [D:\\git\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\engineering_total\\EngineeringTotalMapper.xml]\r\n### The error may involve com.ruoyi.engineering_total.mapper.EngineeringTotalMapper.insertEngineeringTotal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into engineering_total\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-09-24 20:22:04', 141);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"engineering_total\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:24:26', 124);
INSERT INTO `sys_oper_log` VALUES (102, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"工程\",\"dictType\":\"project_type\",\"params\":{},\"remark\":\"工程类别\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:36:35', 20);
INSERT INTO `sys_oper_log` VALUES (103, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"采矿工程\",\"dictSort\":1,\"dictType\":\"project_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:41:42', 15);
INSERT INTO `sys_oper_log` VALUES (104, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"地上工程\",\"dictSort\":2,\"dictType\":\"project_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:42:06', 12);
INSERT INTO `sys_oper_log` VALUES (105, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"地下工程\",\"dictSort\":3,\"dictType\":\"project_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:42:36', 13);
INSERT INTO `sys_oper_log` VALUES (106, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"选矿工程\",\"dictSort\":4,\"dictType\":\"project_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:43:06', 11);
INSERT INTO `sys_oper_log` VALUES (107, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"尾矿工程\",\"dictSort\":5,\"dictType\":\"project_type\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:43:37', 14);
INSERT INTO `sys_oper_log` VALUES (108, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"供水设施\",\"dictSort\":6,\"dictType\":\"project_type\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:43:58', 9);
INSERT INTO `sys_oper_log` VALUES (109, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"供热设施\",\"dictSort\":7,\"dictType\":\"project_type\",\"dictValue\":\"6\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:44:55', 17);
INSERT INTO `sys_oper_log` VALUES (110, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"供电设施\",\"dictSort\":8,\"dictType\":\"project_type\",\"dictValue\":\"7\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:45:29', 12);
INSERT INTO `sys_oper_log` VALUES (111, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"机修及辅助设施\",\"dictSort\":9,\"dictType\":\"project_type\",\"dictValue\":\"8\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:46:09', 17);
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"通信系统\",\"dictSort\":10,\"dictType\":\"project_type\",\"dictValue\":\"9\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:46:28', 13);
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"行政与生活福利设施\",\"dictSort\":11,\"dictType\":\"project_type\",\"dictValue\":\"10\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:48:01', 10);
INSERT INTO `sys_oper_log` VALUES (114, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"厂区及总图工程\",\"dictSort\":12,\"dictType\":\"project_type\",\"dictValue\":\"11\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:48:30', 12);
INSERT INTO `sys_oper_log` VALUES (115, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"备品备件购置费\",\"dictSort\":13,\"dictType\":\"project_type\",\"dictValue\":\"12\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:48:46', 12);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:50:56', 18);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"engineering_total\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:50:59', 49);
INSERT INTO `sys_oper_log` VALUES (118, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-09-24 20:36:35\",\"dictId\":100,\"dictName\":\"工程类型\",\"dictType\":\"project_type\",\"params\":{},\"remark\":\"工程类别\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 20:51:28', 26);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"项目概算\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"budget\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 21:12:19', 25);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"工程概算\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"engineering\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 21:16:21', 12);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"engineering\",\"className\":\"EngineeringTotal\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"工程id\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-24 20:50:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProjectType\",\"columnComment\":\"工程类型\",\"columnId\":12,\"columnName\":\"project_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-24 20:50:59\",\"dictType\":\"project_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"projectType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TunnelTotal\",\"columnComment\":\"井巷工程费\",\"columnId\":13,\"columnName\":\"tunnel_total\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-24 20:50:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"tunnelTotal\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BuildingTotal\",\"columnComment\":\"建筑工程费\",\"columnId\":14,\"columnName\":\"building_total\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-24 20:50:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 21:24:06', 67);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"engineering_total\"}', NULL, 0, NULL, '2024-09-24 21:24:09', 316);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2007', '172.20.10.3', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 21:35:50', 112);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '172.20.10.3', '内网IP', '{\"children\":[],\"component\":\"engineering/engineering/index\",\"createTime\":\"2024-09-24 21:28:29\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"工程概算\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"engineering\",\"perms\":\"engineering:engineering:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 21:37:44', 20);
INSERT INTO `sys_oper_log` VALUES (125, '工程概算', 1, 'com.ruoyi.engineering.controller.EngineeringTotalController.add()', 'POST', 1, 'admin', '研发部门', '/engineering/engineering', '172.20.10.3', '内网IP', '{\"id\":5,\"params\":{},\"projectType\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 21:43:19', 24);
INSERT INTO `sys_oper_log` VALUES (126, '工程概算', 1, 'com.ruoyi.engineering.controller.EngineeringTotalController.add()', 'POST', 1, 'admin', '研发部门', '/engineering/engineering', '172.20.10.3', '内网IP', '{\"id\":6,\"params\":{},\"projectType\":\"4\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-25 12:58:41', 171);
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/2', '172.20.10.3', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-25 21:31:25', 188);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '172.20.10.3', '内网IP', '{\"tables\":\"engineering_budget\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-25 21:31:32', 97);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/engineering_budget', '172.20.10.3', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-26 08:41:47', 93);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '172.20.10.3', '内网IP', '{\"businessName\":\"engineeringBudget\",\"className\":\"EngineeringBudget\",\"columns\":[{\"capJavaField\":\"BudgetId\",\"columnComment\":\"节点ID\",\"columnId\":21,\"columnName\":\"budget_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"budgetId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 08:41:47\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父节点ID\",\"columnId\":22,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 08:41:47\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"层级\",\"columnId\":23,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 08:41:47\",\"usableColumn\":false},{\"capJavaField\":\"ProjectName\",\"columnComment\":\"工程名字\",\"columnId\":24,\"columnName\":\"project_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"ins', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-26 08:58:33', 142);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '172.20.10.3', '内网IP', '{\"tables\":\"engineering_budget\"}', NULL, 0, NULL, '2024-09-26 08:58:41', 427);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '172.20.10.3', '内网IP', '{\"businessName\":\"engineeringBudget\",\"className\":\"EngineeringBudget\",\"columns\":[{\"capJavaField\":\"BudgetId\",\"columnComment\":\"节点ID\",\"columnId\":21,\"columnName\":\"budget_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"budgetId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 08:58:33\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父节点ID\",\"columnId\":22,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 08:58:33\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"层级\",\"columnId\":23,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 08:58:33\",\"usableColumn\":false},{\"capJavaField\":\"ProjectName\",\"columnComment\":\"工程名字\",\"columnId\":24,\"columnName\":\"project_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-26 13:20:24', 93);
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '172.20.10.3', '内网IP', '{\"businessName\":\"engineeringBudget\",\"className\":\"EngineeringBudget\",\"columns\":[{\"capJavaField\":\"BudgetId\",\"columnComment\":\"节点ID\",\"columnId\":21,\"columnName\":\"budget_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"budgetId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 13:20:24\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父节点ID\",\"columnId\":22,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 13:20:24\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"层级\",\"columnId\":23,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 13:20:24\",\"usableColumn\":false},{\"capJavaField\":\"ProjectName\",\"columnComment\":\"工程名字\",\"columnId\":24,\"columnName\":\"project_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"project_type\",\"edit\":true,\"htmlType\":\"select\",\"incr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-26 13:21:03', 67);
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '172.20.10.3', '内网IP', '{\"businessName\":\"engineeringBudget\",\"className\":\"EngineeringBudget\",\"columns\":[{\"capJavaField\":\"BudgetId\",\"columnComment\":\"节点ID\",\"columnId\":21,\"columnName\":\"budget_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"budgetId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 13:21:03\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父节点ID\",\"columnId\":22,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 13:21:03\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"层级\",\"columnId\":23,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 13:21:03\",\"usableColumn\":false},{\"capJavaField\":\"ProjectName\",\"columnComment\":\"工程名字\",\"columnId\":24,\"columnName\":\"project_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"project_type\",\"edit\":true,\"htmlType\":\"select\",\"incr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-26 16:06:11', 68);
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '172.20.10.3', '内网IP', '{\"tables\":\"engineering_budget\"}', NULL, 0, NULL, '2024-09-26 16:06:14', 89);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"engineeringBudget\",\"className\":\"EngineeringBudget\",\"columns\":[{\"capJavaField\":\"BudgetId\",\"columnComment\":\"节点ID\",\"columnId\":21,\"columnName\":\"budget_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"budgetId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 16:06:11\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父节点ID\",\"columnId\":22,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 16:06:11\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"层级\",\"columnId\":23,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 16:06:11\",\"usableColumn\":false},{\"capJavaField\":\"ProjectName\",\"columnComment\":\"工程名字\",\"columnId\":24,\"columnName\":\"project_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"project_type\",\"edit\":true,\"htmlType\":\"select\",\"incr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-28 13:06:57', 124);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"engineeringBudget\",\"className\":\"EngineeringBudget\",\"columns\":[{\"capJavaField\":\"BudgetId\",\"columnComment\":\"节点ID\",\"columnId\":21,\"columnName\":\"budget_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"budgetId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-28 13:06:57\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父节点ID\",\"columnId\":22,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-28 13:06:57\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"层级\",\"columnId\":23,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-28 13:06:57\",\"usableColumn\":false},{\"capJavaField\":\"ProjectName\",\"columnComment\":\"工程名字\",\"columnId\":24,\"columnName\":\"project_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"project_type\",\"edit\":true,\"htmlType\":\"select\",\"incr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-28 13:07:51', 57);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"engineering_budget\"}', NULL, 0, NULL, '2024-09-28 13:07:58', 92);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"engineeringBudget\",\"className\":\"EngineeringBudget\",\"columns\":[{\"capJavaField\":\"BudgetId\",\"columnComment\":\"节点ID\",\"columnId\":21,\"columnName\":\"budget_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"budgetId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-28 13:07:51\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父节点ID\",\"columnId\":22,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-28 13:07:51\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"层级\",\"columnId\":23,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-28 13:07:51\",\"usableColumn\":false},{\"capJavaField\":\"ProjectName\",\"columnComment\":\"工程名字\",\"columnId\":24,\"columnName\":\"project_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-28 13:09:20', 61);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"engineering_budget\"}', NULL, 0, NULL, '2024-09-28 13:09:26', 100);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"engineeringBudget\",\"className\":\"EngineeringBudget\",\"columns\":[{\"capJavaField\":\"BudgetId\",\"columnComment\":\"节点ID\",\"columnId\":21,\"columnName\":\"budget_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"budgetId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-28 13:09:20\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父节点ID\",\"columnId\":22,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-28 13:09:20\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"层级\",\"columnId\":23,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-28 13:09:20\",\"usableColumn\":false},{\"capJavaField\":\"ProjectName\",\"columnComment\":\"工程名字\",\"columnId\":24,\"columnName\":\"project_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-28 13:24:23', 213);
INSERT INTO `sys_oper_log` VALUES (142, '工程概算', 2, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":1,\"buildingCost\":0,\"children\":[],\"createdTime\":\"2024-09-25\",\"description\":\"第一部分工程费用的总概算\",\"equipmentCost\":0,\"installationCost\":0,\"level\":1,\"otherCost\":0,\"params\":{},\"projectName\":\"第一部分工程费用\",\"projectStatus\":\"0\",\"totalCost\":0,\"tunnelCost\":0,\"updatedTime\":\"2024-09-26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-30 09:22:12', 56);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"engineering_budget\"}', NULL, 0, NULL, '2024-09-30 20:51:55', 814);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"engineeringBudget\",\"className\":\"EngineeringBudget\",\"columns\":[{\"capJavaField\":\"BudgetId\",\"columnComment\":\"节点ID\",\"columnId\":21,\"columnName\":\"budget_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"budgetId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-28 13:24:22\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父节点ID\",\"columnId\":22,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-28 13:24:22\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"层级\",\"columnId\":23,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-28 13:24:22\",\"usableColumn\":false},{\"capJavaField\":\"ProjectName\",\"columnComment\":\"工程名字\",\"columnId\":24,\"columnName\":\"project_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-25 21:31:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 10:57:40', 103);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"engineering_budget\"}', NULL, 0, NULL, '2024-10-04 10:59:02', 304);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"engineering_budget\"}', NULL, 0, NULL, '2024-10-04 17:01:44', 463);
INSERT INTO `sys_oper_log` VALUES (147, '工程概算', 2, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":2,\"buildingCost\":0,\"children\":[],\"createdTime\":\"2024-09-25\",\"description\":\"采矿工程\",\"equipmentCost\":2313123,\"installationCost\":0,\"level\":2,\"otherCost\":0,\"params\":{},\"parentId\":1,\"projectName\":\"采矿工程\",\"projectStatus\":\"0\",\"totalCost\":0,\"tunnelCost\":0,\"updatedTime\":\"2024-09-28\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-08 16:35:54', 51);
INSERT INTO `sys_oper_log` VALUES (148, '工程概算', 2, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":2,\"buildingCost\":0,\"children\":[],\"createdTime\":\"2024-09-25\",\"description\":\"采矿工程\",\"equipmentCost\":2313123,\"installationCost\":0,\"level\":2,\"otherCost\":0,\"params\":{},\"parentId\":1,\"projectName\":\"采矿工程\",\"projectStatus\":\"1\",\"totalCost\":0,\"tunnelCost\":0,\"updatedTime\":\"2024-09-28\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-08 16:50:08', 59);
INSERT INTO `sys_oper_log` VALUES (149, '工程概算', 2, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":3,\"buildingCost\":0,\"children\":[],\"createdTime\":\"2024-09-25\",\"description\":\"地下工程\",\"equipmentCost\":0,\"installationCost\":0,\"level\":3,\"otherCost\":0,\"params\":{},\"parentId\":2,\"projectName\":\"地下工程\",\"projectStatus\":\"0\",\"totalCost\":0,\"tunnelCost\":0,\"updatedTime\":\"2024-09-26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-08 17:11:11', 68);
INSERT INTO `sys_oper_log` VALUES (150, '工程概算', 2, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":2,\"buildingCost\":0,\"children\":[],\"createdTime\":\"2024-09-25\",\"description\":\"采矿工程\",\"equipmentCost\":2313123,\"installationCost\":0,\"level\":2,\"otherCost\":0,\"params\":{},\"parentId\":1,\"projectName\":\"采矿工程\",\"projectStatus\":\"0\",\"totalCost\":0,\"tunnelCost\":0,\"updatedTime\":\"2024-09-28\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-09 09:00:50', 107);
INSERT INTO `sys_oper_log` VALUES (151, '工程概算', 2, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":2,\"buildingCost\":0,\"children\":[],\"createdTime\":\"2024-09-25\",\"description\":\"采矿工程\",\"equipmentCost\":2313123,\"installationCost\":0,\"level\":2,\"otherCost\":0,\"params\":{},\"parentId\":1,\"projectName\":\"采矿工程\",\"projectStatus\":\"1\",\"totalCost\":0,\"tunnelCost\":0,\"updatedTime\":\"2024-09-28\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-09 09:03:03', 13);
INSERT INTO `sys_oper_log` VALUES (152, '工程概算', 2, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":2,\"buildingCost\":0,\"children\":[],\"createdTime\":\"2024-09-25\",\"description\":\"采矿工程\",\"equipmentCost\":2313123,\"installationCost\":0,\"level\":2,\"otherCost\":0,\"params\":{},\"parentId\":1,\"projectName\":\"采矿工程\",\"projectStatus\":\"0\",\"totalCost\":0,\"tunnelCost\":0,\"updatedTime\":\"2024-09-28\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-09 09:19:55', 128);
INSERT INTO `sys_oper_log` VALUES (153, '工程概算', 2, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":2,\"buildingCost\":0,\"children\":[],\"createdTime\":\"2024-09-25\",\"description\":\"采矿工程\",\"equipmentCost\":2313123,\"installationCost\":0,\"level\":2,\"otherCost\":0,\"params\":{},\"parentId\":1,\"projectName\":\"采矿工程\",\"projectStatus\":\"1\",\"totalCost\":0,\"tunnelCost\":0,\"updatedTime\":\"2024-09-28\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-09 09:20:55', 15);
INSERT INTO `sys_oper_log` VALUES (154, '定时任务', 5, 'com.ruoyi.quartz.controller.SysJobController.export()', 'POST', 1, 'admin', '研发部门', '/monitor/job/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-10-23 21:11:39', 931);
INSERT INTO `sys_oper_log` VALUES (155, '工程概算', 1, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"buildingCost\":1231,\"children\":[],\"description\":\"测试用例\",\"equipmentCost\":4234,\"installationCost\":2414,\"otherCost\":213,\"params\":{},\"parentId\":5,\"parentName\":\"1号主井（φ5.2m）\",\"projectName\":\"井筒（测试）\",\"projectStatus\":\"0\",\"totalCost\":11516,\"tunnelCost\":3424}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'level\' doesn\'t have a default value\r\n### The error may exist in file [D:\\git\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\engineeringBudget\\EngineeringBudgetMapper.xml]\r\n### The error may involve com.ruoyi.engineeringBudget.mapper.EngineeringBudgetMapper.insertEngineeringBudget-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into engineering_budget          ( parent_id,                          project_name,             tunnel_cost,             building_cost,             installation_cost,             equipment_cost,             other_cost,             total_cost,             project_status,             description )           values ( ?,                          ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'level\' doesn\'t have a default value\n; Field \'level\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'level\' doesn\'t have a default value', '2024-10-26 20:20:24', 303);
INSERT INTO `sys_oper_log` VALUES (156, '工程概算', 1, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":20,\"buildingCost\":342,\"children\":[],\"description\":\"测试数据\",\"equipmentCost\":3242,\"installationCost\":423,\"level\":6,\"otherCost\":324,\"params\":{},\"parentId\":14,\"parentName\":\"1#副井（Φ7.5）\",\"projectName\":\"井筒（测试）\",\"projectStatus\":\"0\",\"totalCost\":6763,\"tunnelCost\":2432}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'1#副井（Φ7.5）\'\r\n### The error may exist in file [D:\\git\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\engineeringBudget\\EngineeringBudgetMapper.xml]\r\n### The error may involve com.ruoyi.engineeringBudget.mapper.EngineeringBudgetMapper.updateSync-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update engineering_budget          SET project_name =project_name+?,             tunnel_cost = tunnel_cost+?,             building_cost =building_cost+?,             installation_cost =installation_cost+?,             equipment_cost = equipment_cost+?,             other_cost = other_cost+?,             total_cost = total_cost+?          where budget_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'1#副井（Φ7.5）\'\n; Data truncation: Truncated incorrect DOUBLE value: \'1#副井（Φ7.5）\'; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'1#副井（Φ7.5）\'', '2024-10-27 12:42:28', 523);
INSERT INTO `sys_oper_log` VALUES (157, '工程概算', 1, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":21,\"buildingCost\":342,\"children\":[],\"description\":\"测试数据\",\"equipmentCost\":3242,\"installationCost\":423,\"level\":6,\"otherCost\":324,\"params\":{},\"parentId\":14,\"parentName\":\"1#副井（Φ7.5）\",\"projectName\":\"井筒（测试）\",\"projectStatus\":\"0\",\"totalCost\":6763,\"tunnelCost\":2432}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'1#副井（Φ7.5）\'\r\n### The error may exist in file [D:\\git\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\engineeringBudget\\EngineeringBudgetMapper.xml]\r\n### The error may involve com.ruoyi.engineeringBudget.mapper.EngineeringBudgetMapper.updateSync-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update engineering_budget          SET project_name =project_name+?,             tunnel_cost = tunnel_cost+?,             building_cost =building_cost+?,             installation_cost =installation_cost+?,             equipment_cost = equipment_cost+?,             other_cost = other_cost+?,             total_cost = total_cost+?          where budget_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'1#副井（Φ7.5）\'\n; Data truncation: Truncated incorrect DOUBLE value: \'1#副井（Φ7.5）\'; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'1#副井（Φ7.5）\'', '2024-10-27 12:48:15', 22);
INSERT INTO `sys_oper_log` VALUES (158, '工程概算', 1, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":23,\"buildingCost\":3424,\"children\":[],\"description\":\"测试数据\",\"equipmentCost\":234,\"installationCost\":432,\"level\":6,\"otherCost\":2134,\"params\":{},\"parentId\":5,\"parentName\":\"1号主井（φ5.2m）\",\"projectName\":\"井筒（测试）\",\"projectStatus\":\"0\",\"totalCost\":6545,\"tunnelCost\":321}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-27 18:04:43', 80);
INSERT INTO `sys_oper_log` VALUES (159, '工程概算', 1, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":24,\"buildingCost\":423,\"children\":[],\"description\":\"测试数据\",\"equipmentCost\":2432,\"installationCost\":3242,\"level\":6,\"otherCost\":142342,\"params\":{},\"parentId\":14,\"parentName\":\"1#副井（Φ7.5）\",\"projectName\":\"井筒（测试）\",\"projectStatus\":\"0\",\"totalCost\":160780,\"tunnelCost\":12341}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'total_cost\' at row 1\r\n### The error may exist in file [D:\\git\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\engineeringBudget\\EngineeringBudgetMapper.xml]\r\n### The error may involve com.ruoyi.engineeringBudget.mapper.EngineeringBudgetMapper.updateSync-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update engineering_budget          SET tunnel_cost = tunnel_cost+?,             building_cost =building_cost+?,             installation_cost =installation_cost+?,             equipment_cost = equipment_cost+?,             other_cost = other_cost+?,             total_cost = total_cost+?          where budget_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'total_cost\' at row 1\n; Data truncation: Out of range value for column \'total_cost\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'total_cost\' at row 1', '2024-10-27 18:13:20', 4149);
INSERT INTO `sys_oper_log` VALUES (160, '工程概算', 1, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":25,\"buildingCost\":2241312,\"children\":[],\"description\":\"测试数据\",\"equipmentCost\":234243,\"installationCost\":423342,\"level\":6,\"otherCost\":423422,\"params\":{},\"parentId\":14,\"parentName\":\"1#副井（Φ7.5）\",\"projectName\":\"井筒（测试）\",\"projectStatus\":\"0\",\"totalCost\":3323550,\"tunnelCost\":1231}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'building_cost\' at row 1\r\n### The error may exist in file [D:\\git\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\engineeringBudget\\EngineeringBudgetMapper.xml]\r\n### The error may involve com.ruoyi.engineeringBudget.mapper.EngineeringBudgetMapper.updateSync-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update engineering_budget          SET tunnel_cost = tunnel_cost+?,             building_cost =building_cost+?,             installation_cost =installation_cost+?,             equipment_cost = equipment_cost+?,             other_cost = other_cost+?,             total_cost = total_cost+?          where budget_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'building_cost\' at row 1\n; Data truncation: Out of range value for column \'building_cost\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'building_cost\' at row 1', '2024-10-27 18:16:38', 145);
INSERT INTO `sys_oper_log` VALUES (161, '工程概算', 1, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":26,\"buildingCost\":4324,\"children\":[],\"description\":\"测试数据\",\"equipmentCost\":2432,\"installationCost\":3242,\"level\":6,\"otherCost\":234243,\"params\":{},\"parentId\":14,\"parentName\":\"1#副井（Φ7.5）\",\"projectName\":\"井筒（测试）\",\"projectStatus\":\"0\",\"totalCost\":247483,\"tunnelCost\":3242}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-27 19:42:40', 133);
INSERT INTO `sys_oper_log` VALUES (162, '工程概算', 2, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":6,\"buildingCost\":0,\"children\":[],\"createdTime\":\"2024-09-25\",\"description\":\"锁口段\",\"equipmentCost\":0,\"installationCost\":0,\"level\":6,\"otherCost\":0,\"params\":{},\"parentId\":5,\"projectName\":\"锁口段\",\"projectStatus\":\"1\",\"totalCost\":9999,\"tunnelCost\":9999,\"updatedTime\":\"2024-09-26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-01 14:53:01', 104);
INSERT INTO `sys_oper_log` VALUES (163, '工程概算', 2, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":6,\"buildingCost\":0,\"children\":[],\"createdTime\":\"2024-09-25\",\"description\":\"锁口段\",\"equipmentCost\":0,\"installationCost\":0,\"level\":6,\"otherCost\":0,\"params\":{},\"parentId\":5,\"projectName\":\"锁口段\",\"projectStatus\":\"1\",\"totalCost\":888,\"tunnelCost\":888,\"updatedTime\":\"2024-09-26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-01 14:53:23', 47);
INSERT INTO `sys_oper_log` VALUES (164, '工程概算', 1, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":27,\"buildingCost\":0,\"children\":[],\"equipmentCost\":0,\"installationCost\":0,\"level\":3,\"otherCost\":0,\"params\":{},\"parentId\":2,\"parentName\":\"采矿工程\",\"projectName\":\"选矿工程\",\"projectStatus\":\"0\",\"totalCost\":0,\"tunnelCost\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-01 15:02:10', 49);
INSERT INTO `sys_oper_log` VALUES (165, '工程概算', 1, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":28,\"buildingCost\":0,\"children\":[],\"equipmentCost\":0,\"installationCost\":0,\"level\":2,\"otherCost\":0,\"params\":{},\"parentId\":1,\"parentName\":\"第一部分工程费用\",\"projectName\":\"选矿工程\",\"projectStatus\":\"0\",\"totalCost\":0,\"tunnelCost\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-01 15:03:36', 22);
INSERT INTO `sys_oper_log` VALUES (166, '工程概算', 3, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.remove()', 'DELETE', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget/27', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-01 21:11:52', 18);
INSERT INTO `sys_oper_log` VALUES (167, '工程概算', 1, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"buildingCost\":0,\"children\":[],\"equipmentCost\":0,\"installationCost\":0,\"level\":7,\"otherCost\":0,\"params\":{},\"parentId\":22,\"parentName\":\"井筒（测试）\",\"projectStatus\":\"0\",\"totalCost\":0}', NULL, 1, 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLException: Field \'project_name\' doesn\'t have a default value\r\n### The error may exist in file [D:\\git\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\engineeringBudget\\EngineeringBudgetMapper.xml]\r\n### The error may involve com.ruoyi.engineeringBudget.mapper.EngineeringBudgetMapper.insertEngineeringBudget-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into engineering_budget          ( parent_id,             level,                                       building_cost,             installation_cost,             equipment_cost,             other_cost,             total_cost,             project_status )           values ( ?,             ?,                                       ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'project_name\' doesn\'t have a default value\n; Field \'project_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'project_name\' doesn\'t have a default value', '2024-11-01 21:16:09', 134);
INSERT INTO `sys_oper_log` VALUES (168, '工程概算', 1, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"buildingCost\":0,\"children\":[],\"equipmentCost\":0,\"installationCost\":0,\"level\":6,\"otherCost\":0,\"params\":{},\"parentId\":5,\"parentName\":\"1号主井（φ5.2m）\",\"projectStatus\":\"0\",\"totalCost\":0,\"tunnelCost\":0}', NULL, 1, 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLException: Field \'project_name\' doesn\'t have a default value\r\n### The error may exist in file [D:\\git\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\engineeringBudget\\EngineeringBudgetMapper.xml]\r\n### The error may involve com.ruoyi.engineeringBudget.mapper.EngineeringBudgetMapper.insertEngineeringBudget-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into engineering_budget          ( parent_id,             level,                          tunnel_cost,             building_cost,             installation_cost,             equipment_cost,             other_cost,             total_cost,             project_status )           values ( ?,             ?,                          ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'project_name\' doesn\'t have a default value\n; Field \'project_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'project_name\' doesn\'t have a default value', '2024-11-01 21:18:52', 56);
INSERT INTO `sys_oper_log` VALUES (169, '工程概算', 2, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":10,\"buildingCost\":0.00,\"children\":[],\"createdTime\":\"2024-09-25\",\"description\":\"井筒（破碎段）\",\"equipmentCost\":0.00,\"installationCost\":0.00,\"level\":6,\"otherCost\":0.00,\"params\":{},\"parentId\":5,\"parentName\":\"1号主井（φ5.2m）\",\"projectName\":\"井筒（破碎段）\",\"projectStatus\":\"1\",\"totalCost\":100.00,\"tunnelCost\":100.00,\"updatedTime\":\"2024-09-26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-05 10:18:31', 127);
INSERT INTO `sys_oper_log` VALUES (170, '工程概算', 2, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":10,\"buildingCost\":0.00,\"children\":[],\"createdTime\":\"2024-09-25\",\"description\":\"井筒（破碎段）\",\"equipmentCost\":0.00,\"installationCost\":0.00,\"level\":6,\"otherCost\":0.00,\"params\":{},\"parentId\":5,\"parentName\":\"1号主井（φ5.2m）\",\"projectName\":\"井筒（破碎段）\",\"projectStatus\":\"1\",\"totalCost\":-50.00,\"tunnelCost\":-50.00,\"updatedTime\":\"2024-09-26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-05 10:18:44', 44);
INSERT INTO `sys_oper_log` VALUES (171, '工程概算', 2, 'com.ruoyi.engineeringBudget.controller.EngineeringBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/engineeringBudget/engineeringBudget', '127.0.0.1', '内网IP', '{\"budgetId\":10,\"buildingCost\":0.00,\"children\":[],\"createdTime\":\"2024-09-25\",\"description\":\"井筒（破碎段）\",\"equipmentCost\":0.00,\"installationCost\":0.00,\"level\":6,\"otherCost\":0.00,\"params\":{},\"parentId\":5,\"parentName\":\"1号主井（φ5.2m）\",\"projectName\":\"井筒（破碎段）\",\"projectStatus\":\"1\",\"totalCost\":0.00,\"tunnelCost\":0.00,\"updatedTime\":\"2024-11-05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-05 10:20:32', 77);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-08-27 15:39:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-08-27 15:39:58', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-08-27 15:39:58', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-01-07 15:35:46', 'admin', '2024-08-27 15:39:57', '', '2025-01-07 15:35:46', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-08-27 15:39:57', 'admin', '2024-08-27 15:39:57', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
