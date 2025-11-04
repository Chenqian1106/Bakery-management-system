/*
 Navicat Premium Dump SQL

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 80043 (8.0.43)
 Source Host           : localhost:3306
 Source Schema         : mianbaofang

 Target Server Type    : MySQL
 Target Server Version : 80043 (8.0.43)
 File Encoding         : 65001

 Date: 04/11/2025 21:09:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `emp_role` enum('MANAGER','STAFF') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'STAFF',
  `emp_account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `emp_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hire_date` date NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`emp_id`) USING BTREE,
  UNIQUE INDEX `emp_account`(`emp_account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '李华', 'MANAGER', 'lihua', '123456', '2024-01-01', '2025-11-04 21:07:14');
INSERT INTO `employee` VALUES (2, '王明', 'STAFF', 'wangming', '123456', '2024-03-10', '2025-11-04 21:07:14');
INSERT INTO `employee` VALUES (3, '张婷', 'STAFF', 'zhangting', '123456', '2024-04-15', '2025-11-04 21:07:14');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `inv_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT 0,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`inv_id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (1, 1, 98, '2025-11-04 21:07:14');
INSERT INTO `inventory` VALUES (2, 2, 194, '2025-11-04 21:07:14');
INSERT INTO `inventory` VALUES (3, 3, 147, '2025-11-04 21:07:14');
INSERT INTO `inventory` VALUES (4, 4, 120, '2025-11-04 21:07:14');
INSERT INTO `inventory` VALUES (5, 5, 80, '2025-11-04 21:07:14');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NOT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'ACTIVE',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '全麦吐司', '吐司', 18.00, '个', '健康全麦制作', 'ACTIVE', '2025-11-04 21:07:14');
INSERT INTO `product` VALUES (2, '红豆面包', '甜面包', 6.00, '个', '传统红豆馅', 'ACTIVE', '2025-11-04 21:07:14');
INSERT INTO `product` VALUES (3, '奶油可颂', '甜面包', 8.00, '个', '香酥黄油口味', 'ACTIVE', '2025-11-04 21:07:14');
INSERT INTO `product` VALUES (4, '葱香火腿包', '咸面包', 7.50, '个', '咸香可口', 'ACTIVE', '2025-11-04 21:07:14');
INSERT INTO `product` VALUES (5, '法式长棍', '吐司', 20.00, '条', '外脆内软法式风味', 'ACTIVE', '2025-11-04 21:07:14');

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales`  (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `emp_id` int NULL DEFAULT NULL,
  `total_amount` decimal(12, 2) NOT NULL,
  `payment_method` enum('CASH','WECHAT','ALIPAY') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'CASH',
  `sale_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sale_id`) USING BTREE,
  UNIQUE INDEX `order_no`(`order_no` ASC) USING BTREE,
  INDEX `emp_id`(`emp_id` ASC) USING BTREE,
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES (1, 'ORD20250101001', 2, 60.00, 'WECHAT', '2025-11-04 21:07:14', '门店早班销售');
INSERT INTO `sales` VALUES (2, 'ORD20250101002', 3, 36.00, 'CASH', '2025-11-04 21:07:14', '顾客购买红豆面包6个');

-- ----------------------------
-- Table structure for sales_item
-- ----------------------------
DROP TABLE IF EXISTS `sales_item`;
CREATE TABLE `sales_item`  (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` int NOT NULL,
  `unit_price` decimal(10, 2) NOT NULL,
  `line_total` decimal(12, 2) NOT NULL,
  PRIMARY KEY (`item_id`) USING BTREE,
  INDEX `sale_id`(`sale_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `sales_item_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sales_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sales_item
-- ----------------------------
INSERT INTO `sales_item` VALUES (1, 1, 1, 2, 18.00, 36.00);
INSERT INTO `sales_item` VALUES (2, 1, 3, 3, 8.00, 24.00);
INSERT INTO `sales_item` VALUES (3, 2, 2, 6, 6.00, 36.00);

-- ----------------------------
-- Table structure for sales_log
-- ----------------------------
DROP TABLE IF EXISTS `sales_log`;
CREATE TABLE `sales_log`  (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_type` enum('CREATE','CANCEL') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `emp_id` int NULL DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `emp_id`(`emp_id` ASC) USING BTREE,
  CONSTRAINT `sales_log_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sales_log
-- ----------------------------
INSERT INTO `sales_log` VALUES (1, 'ORD20250101001', 'CREATE', '2025-11-04 21:07:14', 2, '销售订单创建，总额60.00');
INSERT INTO `sales_log` VALUES (2, 'ORD20250101002', 'CREATE', '2025-11-04 21:07:14', 3, '销售订单创建，总额36.00');

-- ----------------------------
-- Triggers structure for table sales
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_sales_insert`;
delimiter ;;
CREATE TRIGGER `trg_sales_insert` AFTER INSERT ON `sales` FOR EACH ROW BEGIN
  INSERT INTO sales_log(order_no, action_type, emp_id, details)
  VALUES(NEW.order_no, 'CREATE', NEW.emp_id, CONCAT('销售订单创建，总额', NEW.total_amount));
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table sales
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_sales_delete`;
delimiter ;;
CREATE TRIGGER `trg_sales_delete` AFTER DELETE ON `sales` FOR EACH ROW BEGIN
  INSERT INTO sales_log(order_no, action_type, emp_id, details)
  VALUES(OLD.order_no, 'CANCEL', OLD.emp_id, CONCAT('销售订单取消，总额', OLD.total_amount));
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
