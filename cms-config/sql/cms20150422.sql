/*
Navicat MySQL Data Transfer

Source Server         : cms
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-04-22 21:48:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cont_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `cont_attribute`;
CREATE TABLE `cont_attribute` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `HAS_IMG` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否上传图片。0：否，1：是',
  `HAS_OUT_LINK` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否外部链接。0：否，1：是。',
  `HAS_VEDIO` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否上传视频。0：否，1：是',
  `HAS_DETAIL` smallint(1) DEFAULT '0' COMMENT '是否显示详细内容',
  `HAS_ABOUT` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否显示简介。0：否，1：是',
  `HAS_EXT_ATTRIBUTE` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否设置动态属性。0：否，1：是',
  `HAS_KEYWORD` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否显示关键字。0：否，1：是',
  `HAS_SOURCE` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否显示来源。0：否，1：是',
  `HAS_SHOW_TIME` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否显示发布时间。0：否，1：是',
  `HAS_SEO` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否显示SEO优化标签。0：否，1：是',
  `HAS_TAG` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否显示特殊标签。0：否，1：是',
  `HAS_ORDER_OPT` smallint(1) DEFAULT '0' COMMENT '是否显示商品订单类选项，如价格，折扣，库存等',
  `HAS_AUTHOR` smallint(1) DEFAULT '0' COMMENT '是否显示作者。0：否，1：是',
  `NAME` varchar(50) NOT NULL COMMENT '内容类型名称',
  `REMARK` varchar(100) DEFAULT NULL COMMENT '备注',
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_USER` varchar(60) DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATE_USER` varchar(60) DEFAULT NULL,
  `STATUS` smallint(6) DEFAULT '1' COMMENT '状态。0：删除，1：正常；',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='栏目类型, 内容模板';

-- ----------------------------
-- Records of cont_attribute
-- ----------------------------
INSERT INTO `cont_attribute` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '特斯塔', 'werw', '2014-07-02 14:26:44', 'admin', '2014-07-02 14:26:44', 'admin', null);
INSERT INTO `cont_attribute` VALUES ('2', '1', '0', '0', '0', '0', '0', '1', '1', '0', '1', '1', '0', '0', 'trfdgsdfg', 'sdfgdg', '2014-07-03 16:07:54', null, '2014-07-03 16:07:54', null, '1');
INSERT INTO `cont_attribute` VALUES ('3', '0', '0', '0', '1', '0', '0', '0', '1', '0', '0', '0', '1', '0', 'teste', 'sdf', null, null, null, null, '1');
INSERT INTO `cont_attribute` VALUES ('4', '1', '0', '0', '1', '1', '0', '1', '1', '1', '1', '1', '0', '0', '通用内容类型', '', '2015-02-23 16:22:50', null, '2015-02-23 16:22:50', null, '1');
INSERT INTO `cont_attribute` VALUES ('5', '1', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', 'tttt', 'fdsd', '2015-03-09 21:25:43', null, '2015-03-09 21:25:43', null, '1');

-- ----------------------------
-- Table structure for `cont_content`
-- ----------------------------
DROP TABLE IF EXISTS `cont_content`;
CREATE TABLE `cont_content` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) NOT NULL COMMENT '标题',
  `ABOUT` varchar(200) DEFAULT NULL COMMENT '简介',
  `DEFAULT_IMG` varchar(200) DEFAULT NULL COMMENT '图片',
  `VEDIO` varchar(200) DEFAULT NULL COMMENT '视频链接',
  `AUDIO` varchar(200) DEFAULT NULL COMMENT '音频连接',
  `LINK` varchar(200) DEFAULT NULL COMMENT '超级链接',
  `TYPE_ID` bigint(20) NOT NULL COMMENT '栏目id',
  `TYPE_ID4` bigint(20) DEFAULT NULL COMMENT '四级栏目id',
  `TYPE_ID3` bigint(20) DEFAULT NULL COMMENT '三级栏目id',
  `TYPE_ID2` bigint(20) DEFAULT NULL COMMENT '该记录二级栏目id',
  `TYPE_ID1` bigint(20) DEFAULT NULL COMMENT '该记录一级栏目id',
  `ATTR_ID` bigint(20) DEFAULT NULL COMMENT '属性id. 既栏目/内容类型。 ',
  `TEMPLATE_ID` bigint(20) NOT NULL COMMENT '模板id',
  `AUTHOR` varchar(60) DEFAULT NULL COMMENT '发布人，作者',
  `PUBLISH_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `HAS_HOT` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否热点',
  `HAS_LATEST` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否最新',
  `HAS_TOP` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `META_TITLE` varchar(100) DEFAULT NULL COMMENT '内容页面title',
  `META_KEYWORDS` varchar(200) DEFAULT NULL COMMENT '内容页面关键词',
  `META_DESCRIPTION` varchar(200) DEFAULT NULL COMMENT '内容页面说明',
  `C_TAG` varchar(100) DEFAULT NULL COMMENT '标签',
  `KEYWORD` varchar(100) DEFAULT NULL COMMENT '内容关键词',
  `SORT` int(11) DEFAULT NULL COMMENT '内容排序',
  `SOURCE` varchar(50) DEFAULT NULL COMMENT '内容来源',
  `PRICE` decimal(11,2) DEFAULT NULL COMMENT '原价',
  `SALE_PRICE` decimal(11,2) DEFAULT NULL COMMENT '销售价',
  `STOCK` int(11) DEFAULT NULL COMMENT '库存',
  `DISCOUNT` decimal(5,2) DEFAULT NULL COMMENT '折扣',
  `BRAND` varchar(50) DEFAULT NULL COMMENT '品牌',
  `GOODS_URL` varchar(200) DEFAULT NULL COMMENT '原商品连接',
  `STATUS` smallint(2) NOT NULL COMMENT '状态。0：未发布；8：回收站/删除，9：发布',
  `TITLE_STYLE` varchar(50) DEFAULT NULL COMMENT '标题的style样式',
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_USER` varchar(60) DEFAULT NULL,
  `UPDATE_USER` varchar(60) DEFAULT NULL,
  `URL` varchar(50) NOT NULL COMMENT '/2015/03/2.html',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='内容表';

-- ----------------------------
-- Records of cont_content
-- ----------------------------
INSERT INTO `cont_content` VALUES ('1', '测试', '司法司法', '', '', null, '', '1', null, null, null, null, '1', '1', '', '2014-06-27 00:00:00', '0', '0', '0', '', '', '', null, '', null, '', null, '33.33', null, null, '', '', '9', null, '2015-02-23 14:18:24', '2015-02-23 14:18:24', null, null, '');
INSERT INTO `cont_content` VALUES ('2', 'yrty', 'hjhjgh546', 'erty', 'rt', null, 'http://ytry', '1', null, null, null, null, '1', '6', '456', '2014-07-08 17:06:26', '0', '0', '0', 'dfgs', 'sdf', 'dfgdfhh', null, 'hgjdfg', null, 'ytuty', null, null, null, null, null, null, '9', null, '2014-07-08 17:06:26', '2014-07-08 17:06:26', null, null, '');
INSERT INTO `cont_content` VALUES ('3', 'ewerwe', '990', 'hj46', '77', null, 'http://rtytrygfhfgh', '1', null, null, null, null, '1', '6', 'ty', '2014-07-08 17:06:27', '0', '0', '0', '22', '33', '44', null, '111', null, 'rtyrty', null, null, null, null, null, null, '9', null, '2014-07-08 17:06:27', '2014-07-08 17:06:27', null, null, '');
INSERT INTO `cont_content` VALUES ('4', '435', '56', '4', '5', null, 'http://3', '1', null, null, null, null, '1', '6', 'ft', '2014-07-08 17:06:29', '0', '1', '0', '6', '7', '6', null, '56', null, '345', null, null, null, null, null, null, '9', null, '2014-07-08 17:06:29', '2014-07-08 17:06:29', null, null, '');
INSERT INTO `cont_content` VALUES ('5', 'df', '677', '5', '4', null, 'http://34fg', '1', null, null, null, null, '1', '6', '2', '2014-07-08 17:06:30', '0', '1', '0', '546', '4', '456', null, '456', null, '435', null, null, null, null, null, null, '9', null, '2014-07-08 17:06:30', '2014-07-08 17:06:30', null, null, '');
INSERT INTO `cont_content` VALUES ('6', 'erte', '435345', 'erte', 'er', null, 'http://trete', '1', null, null, null, null, '1', '6', '345', '2014-07-08 17:06:31', '0', '1', '0', '3453', '3', '3', null, 'e53', null, '3453', null, null, null, null, null, null, '9', null, '2014-07-08 17:06:31', '2014-07-08 17:06:31', null, null, '');
INSERT INTO `cont_content` VALUES ('7', '435', '6867', '45', '44', null, 'http://4564', '1', null, null, null, null, '1', '6', '46', '2014-07-08 17:06:33', '1', '0', '0', '678', '678', '68', null, '678', null, '456', null, null, null, null, null, null, '9', null, '2014-07-08 17:06:33', '2014-07-08 17:06:33', null, null, '');
INSERT INTO `cont_content` VALUES ('8', 'ert', '2334', 'er', '3', null, 'http://ert', '1', null, null, null, null, '1', '6', '3', '2014-07-08 17:06:34', '0', '0', '1', '23', '5', '56', null, '234', null, '5', '7.00', '7.00', '9', null, '5', '0', '9', null, '2014-07-08 17:06:34', '2014-07-08 17:06:34', null, null, '');
INSERT INTO `cont_content` VALUES ('9', 'fdg', '4', '4', '4', null, 'http://4', '1', null, null, null, null, '1', '6', '23', '2014-07-08 17:06:36', '0', '0', '0', '4', '4', '4', null, '4', null, '4', '4.00', '4.00', '4', null, '4', '4', '9', null, '2014-07-08 17:06:36', '2014-07-08 17:06:36', null, null, '');
INSERT INTO `cont_content` VALUES ('10', 'er', '3', '3', '3', null, 'http://33', '1', null, null, null, null, '1', '6', '3', '2014-07-08 17:06:37', '1', '0', '0', '3', '3', '4', null, '3', null, '3', '3.00', '3.00', '3', null, '3', '3', '9', null, '2014-07-08 17:06:37', '2014-07-08 17:06:37', null, null, '');
INSERT INTO `cont_content` VALUES ('11', 'twer', '6', '4', '5', null, 'http://3', '2', null, null, null, null, '1', '6', '23', '2014-07-08 00:00:00', '0', '1', '0', '3', '3', '3', null, '3', null, '2', '3.00', '3.00', '3', null, '3', '3', '9', null, '2014-07-08 17:24:16', '2014-07-08 17:24:16', null, null, '');
INSERT INTO `cont_content` VALUES ('12', '453', '345', '', '', null, 'http://', '2', null, null, null, null, '1', '6', '3', '2014-07-08 17:06:40', '0', '1', '0', '3', '', '', null, '3', null, '3', '3.00', null, null, null, '3', '', '9', null, '2014-07-08 17:06:40', '2014-07-08 17:06:40', null, null, '');
INSERT INTO `cont_content` VALUES ('13', 'ert', '345', '', '', null, 'http://', '2', null, null, null, null, '1', '6', '3', '2014-07-08 17:06:41', '0', '0', '0', '', '', '', null, '', null, '3', null, null, null, null, '', '', '9', null, '2014-07-08 17:06:41', '2014-07-08 17:06:41', null, null, '');
INSERT INTO `cont_content` VALUES ('14', '3453', '345', '', '', null, 'http://', '2', null, null, null, null, '1', '6', '', '2014-07-08 17:06:43', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-08 17:06:43', '2014-07-08 17:06:43', null, null, '');
INSERT INTO `cont_content` VALUES ('15', 'asdfs', 'sdf', '', '', null, 'http://', '2', null, null, null, null, '1', '6', '', '2014-07-08 17:06:44', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-08 17:06:44', '2014-07-08 17:06:44', null, null, '');
INSERT INTO `cont_content` VALUES ('16', 'erter', 'ert', '', '', null, 'http://', '2', null, null, null, null, '1', '6', '', '2014-07-08 17:06:46', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-08 17:06:46', '2014-07-08 17:06:46', null, null, '');
INSERT INTO `cont_content` VALUES ('17', 'dsf', 'sdf', '', '', null, 'http://', '2', null, null, null, null, '1', '6', '', '2014-07-08 17:06:47', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-08 17:06:47', '2014-07-08 17:06:47', null, null, '');
INSERT INTO `cont_content` VALUES ('18', 'erterter', 'reter', '', '', null, 'http://', '1', null, null, null, null, '1', '6', '', '2014-07-08 00:00:00', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-10 13:52:00', '2014-07-10 13:52:00', null, null, '');
INSERT INTO `cont_content` VALUES ('19', 'ret', 'erte', '', '', null, 'http://', '1', null, null, null, null, '1', '6', '', '2014-07-08 17:09:41', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-08 17:09:41', '2014-07-08 17:09:41', null, null, '');
INSERT INTO `cont_content` VALUES ('20', 'tryrtyrt', 'retyrty', '', '', null, 'http://', '1', null, null, null, null, '1', '6', '', '2014-07-08 17:09:43', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-08 17:09:43', '2014-07-08 17:09:43', null, null, '');
INSERT INTO `cont_content` VALUES ('21', 'w4er4er', '43534', '', '', null, 'http://', '2', null, null, null, null, '1', '6', '', '2014-07-08 17:09:45', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-08 17:09:45', '2014-07-08 17:09:45', null, null, '');
INSERT INTO `cont_content` VALUES ('22', '3', '', '', '', null, 'http://', '2', null, null, null, null, '1', '6', '', '2014-07-08 17:09:48', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-08 17:09:48', '2014-07-08 17:09:48', null, null, '');
INSERT INTO `cont_content` VALUES ('23', '43', '', '', '', null, 'http://', '2', null, null, null, null, '1', '6', '', '2014-07-08 17:09:47', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-08 17:09:47', '2014-07-08 17:09:47', null, null, '');
INSERT INTO `cont_content` VALUES ('24', '44', '', '', '', null, 'http://', '2', null, null, null, null, '1', '6', '', '2014-07-08 17:09:49', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-08 17:09:49', '2014-07-08 17:09:49', null, null, '');
INSERT INTO `cont_content` VALUES ('25', '45', '', '', '', null, 'http://', '2', null, null, null, null, '1', '6', '', '2014-07-08 17:09:51', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-08 17:09:51', '2014-07-08 17:09:51', null, null, '');
INSERT INTO `cont_content` VALUES ('26', 'dsf', 'sdf', '', '', null, 'http://', '1', null, null, null, null, '1', '6', '', '2014-07-08 17:09:52', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-08 17:09:52', '2014-07-08 17:09:52', null, null, '');
INSERT INTO `cont_content` VALUES ('28', 'sdfsd', 'sdfs', '', '', null, 'http://', '1', null, null, null, null, '1', '6', '', '2014-07-08 17:09:53', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-08 17:09:53', '2014-07-08 17:09:53', null, null, '');
INSERT INTO `cont_content` VALUES ('29', 'werwrwer', 'werwr', '', '', null, 'http://', '2', null, null, null, null, '1', '6', '', '2014-07-08 17:09:56', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-08 17:09:56', '2014-07-08 17:09:56', null, null, '');
INSERT INTO `cont_content` VALUES ('30', 'ertre444', 'werwe', '', '', null, 'http://', '2', null, null, null, null, '1', '1', '', '2014-07-03 00:00:00', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-02 16:06:03', '2014-07-02 16:06:03', null, null, '');
INSERT INTO `cont_content` VALUES ('31', 'dfgdfg', 'ertert', '', '', null, 'http://', '2', null, null, null, null, '1', '1', '', '2014-07-30 00:00:00', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, '', '', '9', null, '2014-07-10 13:52:30', '2014-07-10 13:52:30', null, null, '');
INSERT INTO `cont_content` VALUES ('33', 'sdfasdf', 'werwerwerwe', '', '', null, 'http://', '1', null, null, null, null, '1', '1', '', '2014-07-17 00:00:00', '1', '0', '0', 'rty', 'rty', 'rtyrt', null, 'rtuw', null, '', null, null, null, null, '', '', '9', null, '2014-07-02 16:09:31', '2014-07-02 16:09:31', null, null, '');
INSERT INTO `cont_content` VALUES ('34', 'yretet345334446666888', 'ert4446666', '7', '6', null, '8', '2', null, null, null, null, '1', '1', '12312', '2014-07-17 00:00:00', '1', '0', '1', '55', '5', '6666', null, '', null, '21312', '2.00', '1.00', '0', null, 'f', '9', '9', null, '2014-07-03 10:46:37', '2014-07-03 10:46:37', null, null, '');
INSERT INTO `cont_content` VALUES ('43', 'ssafs', 'dewesdfsdf', '', '', null, '', '2', null, null, null, null, '1', '1', '233', '2014-07-09 00:00:00', '0', '0', '0', '', '', '', null, '', null, '23', null, null, null, null, '', '', '9', null, '2014-07-08 17:03:26', '2014-07-08 17:03:26', null, null, '');
INSERT INTO `cont_content` VALUES ('44', 'terterter', '345345', '', '', null, '', '1', null, null, null, null, '1', '6', '4', '2014-07-25 00:00:00', '0', '0', '0', '', '', '', null, '', null, '34', '3.00', '3.00', '3', null, '3', '', '9', null, '2014-07-08 17:10:16', '2014-07-08 17:10:16', null, null, '');
INSERT INTO `cont_content` VALUES ('45', 'terterter', '345345', '', '', null, '', '1', null, null, null, null, '1', '6', '4', '2014-07-25 00:00:00', '0', '0', '0', '', '', '', null, '', null, '34', '3.00', '3.00', '3', null, '3', '', '9', null, '2014-07-08 17:10:56', '2014-07-08 17:10:56', null, null, '');
INSERT INTO `cont_content` VALUES ('46', 'tessat55', 'sdfsadf', 'sddfs', null, null, null, '2', null, null, null, null, '4', '6', null, '2015-02-23 00:00:00', '0', '1', '1', 'd', 'r3', 'sdfds', null, null, null, 'dds', null, null, null, null, null, null, '9', null, '2015-02-23 14:50:47', '2015-02-23 14:50:47', null, null, '');
INSERT INTO `cont_content` VALUES ('47', 'tessat55', 'sdfsadf', 'sddfs', null, null, null, '2', null, null, null, null, '4', '6', null, '2015-02-23 00:00:00', '0', '1', '1', 'd', 'r3', 'sdfds', null, '', null, 'dds', null, null, null, null, null, null, '9', null, '2015-02-25 21:47:46', '2015-02-25 21:47:46', null, null, '');
INSERT INTO `cont_content` VALUES ('48', 'twet', 'ewrwe', '', null, null, null, '2', null, null, null, null, '4', '19', null, '2015-01-29 00:00:00', '0', '1', '0', '', '', '', null, '', null, 'e', null, null, null, null, null, null, '9', null, '2015-03-08 21:50:29', '2015-03-08 21:50:29', null, null, '');
INSERT INTO `cont_content` VALUES ('49', 'sfsdfdd', 'sdfdsd', 'sdf', null, null, null, '2', null, null, null, null, '4', '19', null, '2015-03-17 00:00:00', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-03-08 22:02:36', '2015-03-08 22:02:36', null, null, '/2015/03/0.html');
INSERT INTO `cont_content` VALUES ('50', '4444', 'teter', '', null, null, null, '2', null, null, null, null, '4', '19', null, '2015-03-04 00:00:00', '0', '0', '0', 'r', 'r', 'r', null, 'e', null, '', null, null, null, null, null, null, '9', null, '2015-03-08 22:54:59', '2015-03-08 22:54:59', null, null, '/2015/03/');
INSERT INTO `cont_content` VALUES ('51', 'werwer', 'werwr', '', null, null, null, '2', null, null, null, null, '4', '19', null, '2015-02-26 00:00:00', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-03-08 22:58:47', '2015-03-08 22:58:47', null, null, '/2015/03/');
INSERT INTO `cont_content` VALUES ('52', 'fwewe', 'werwe', '', null, null, null, '2', null, null, null, null, '4', '19', null, '2015-03-06 00:00:00', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-03-08 22:59:17', '2015-03-08 22:59:17', null, null, '/2015/03/');
INSERT INTO `cont_content` VALUES ('53', 'sfes', 'sdfsdfs', '', null, null, null, '2', null, null, null, null, '4', '19', null, '2015-03-14 00:00:00', '0', '0', '0', 'dsf', 'sdf', 'sdf', null, 'sdf', null, '', null, null, null, null, null, null, '9', null, '2015-03-09 20:58:51', '2015-03-09 20:58:51', null, null, '/2015/03/');
INSERT INTO `cont_content` VALUES ('54', 'asfefew', 'wefew', 'ew', null, null, null, '2', null, null, null, null, '4', '19', null, '2015-03-12 00:00:00', '0', '0', '0', 'wer', 'wer', 'wer', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-03-09 21:02:56', '2015-03-09 21:02:56', null, null, '/2015/03/');
INSERT INTO `cont_content` VALUES ('55', 'esddsfdsf11', 'sdfsf111sdfds', '', null, null, null, '2', null, null, null, null, '4', '19', null, '2015-03-06 00:00:00', '1', '0', '0', 'sdf1', 'e1', 'de1', null, 'sdf1', null, '', null, null, null, null, null, null, '9', null, '2015-03-13 20:20:35', '2015-03-13 20:20:35', null, null, '/2015/03/');
INSERT INTO `cont_content` VALUES ('56', 'hh', 'ggjk', '', null, null, null, '2', null, null, null, null, '4', '19', null, '2015-03-12 00:00:00', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-03-12 22:26:19', '2015-03-12 22:26:19', null, null, '/2015/03/');
INSERT INTO `cont_content` VALUES ('57', 'hh', 'ggjk', '', null, null, null, '2', null, null, null, null, '4', '19', null, '2015-03-12 00:00:00', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-03-12 22:28:42', '2015-03-12 22:28:42', null, null, '/2015/03/');
INSERT INTO `cont_content` VALUES ('58', 'erwer', 'werwe', 'wer', null, null, null, '3', null, null, null, null, '4', '19', null, '2015-03-12 22:33:34', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-03-12 22:33:44', '2015-03-12 22:33:44', null, null, '/2015/03/');
INSERT INTO `cont_content` VALUES ('59', 'sdfsd', 'sdfsd', 'sdf', null, null, null, '4', null, null, null, '4', '4', '19', null, '2015-04-17 21:20:16', '0', '0', '0', 'sdf', 'sdf', 'sdf', null, 'sdfsd', null, 'sdf', null, null, null, null, null, null, '9', null, '2015-04-22 21:20:27', '2015-04-22 21:20:27', null, null, '/2015/04/');
INSERT INTO `cont_content` VALUES ('60', '5sdfsdfdfddd', 'sdfsd', 'sdf', null, null, null, '6', null, null, '6', '5', '4', '6', null, '2015-04-22 21:23:48', '0', '0', '0', 'sdf', 'sdf', 'sdf', null, 'sdfsd', null, 'sdf', null, null, null, null, null, null, '9', null, '2015-04-22 21:23:48', '2015-04-22 21:23:48', null, null, '/2015/04/');
INSERT INTO `cont_content` VALUES ('61', '33sdfds', 'sdfs', 'sdf', null, null, null, '6', null, null, '6', '5', '4', '6', null, '2015-04-15 21:26:25', '1', '0', '1', 'sdas', 'asdas', 'asd', null, 'dfs', null, 'sdf', null, null, null, null, null, null, '9', null, '2015-04-22 21:26:57', '2015-04-22 21:26:57', null, null, '/2015/04/');

-- ----------------------------
-- Table structure for `cont_content_body`
-- ----------------------------
DROP TABLE IF EXISTS `cont_content_body`;
CREATE TABLE `cont_content_body` (
  `BODY_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CONTENT_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '内容id',
  `CONTENT_BODY` longtext COMMENT '内容',
  `EXT_ATTR_BODY` varchar(20000) DEFAULT NULL COMMENT '扩展属性值，长度暂不定义大对象',
  PRIMARY KEY (`BODY_ID`),
  UNIQUE KEY `INDEX_CONT_BODY_CONTID` (`CONTENT_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cont_content_body
-- ----------------------------
INSERT INTO `cont_content_body` VALUES ('1', '1', '<p>ertyretreyutr</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('2', '2', '<p>er</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('8', '34', '<p>444444444444</p>', null);
INSERT INTO `cont_content_body` VALUES ('12', '43', '<p>23</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('13', '44', '<p>454353</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('14', '45', '<p>454353</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('15', '11', '<p>dsfsd</p>', null);
INSERT INTO `cont_content_body` VALUES ('16', '18', '', null);
INSERT INTO `cont_content_body` VALUES ('17', '31', '<p>fg</p>', null);
INSERT INTO `cont_content_body` VALUES ('18', '47', '<p>fsdfsdfsd</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('19', '48', '<p>dsafasfasf</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('20', '49', '<p>sdfds</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('21', '50', '<p>ertert</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('22', '51', '<p>wrwrwer</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('23', '52', '<p>wrwrwer</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('24', '53', '<p>sdfsfsdfsd</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('25', '54', '<p>sdfsfsdfsd</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('26', '55', '<p>sdfsdhjgjhghgjjhjg</p>', null);
INSERT INTO `cont_content_body` VALUES ('27', '56', '<p>iu878</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('28', '57', '<p>iu878</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('29', '58', '<p>werwe</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('30', '59', '<p>sdfsd</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('31', '60', '<p>sdfsdfsd</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('32', '61', '<p>sdfdsfs</p>\n', null);

-- ----------------------------
-- Table structure for `cont_ext_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `cont_ext_attribute`;
CREATE TABLE `cont_ext_attribute` (
  `EXT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '动态扩展属性ID',
  `ATTR_ID` bigint(20) NOT NULL COMMENT '属性ID',
  `EXT_ATTR_NAME` varchar(50) NOT NULL COMMENT '扩展属性名字',
  `EXT_ATTR_TYPE` smallint(2) NOT NULL COMMENT '扩展属性控件类型',
  `EXT_DEFAULT_VALUE` varchar(200) DEFAULT NULL COMMENT '默认值',
  `EXT_ATTR_DESC` varchar(100) DEFAULT NULL COMMENT '扩展属性描述',
  `EXT_SORT` smallint(2) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`EXT_ID`,`ATTR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='动态属性/扩展熟悉';

-- ----------------------------
-- Records of cont_ext_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for `cont_ext_attr_value`
-- ----------------------------
DROP TABLE IF EXISTS `cont_ext_attr_value`;
CREATE TABLE `cont_ext_attr_value` (
  `VALUE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '属性值ID',
  `ATTR__ID` bigint(20) NOT NULL COMMENT '属性/栏目类型id',
  `CONTENT_ID` bigint(20) NOT NULL COMMENT '内容id',
  `EXT_ATTR_ID` bigint(20) NOT NULL COMMENT '扩展属性id',
  `ATTR_VALUE` bigint(20) NOT NULL COMMENT '属性值',
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容的动态属性值表。 保留表（暂时不用此表，把多行属性值转化为Json的一个值放到内容表的一个字段里面，减少数量行数量）';

-- ----------------------------
-- Records of cont_ext_attr_value
-- ----------------------------

-- ----------------------------
-- Table structure for `cont_type`
-- ----------------------------
DROP TABLE IF EXISTS `cont_type`;
CREATE TABLE `cont_type` (
  `ID` bigint(20) NOT NULL,
  `ABOUT` varchar(100) DEFAULT NULL COMMENT '简介',
  `TYPE_IMG` varchar(200) DEFAULT NULL COMMENT '上传图片',
  `TYPE_NAME` varchar(100) NOT NULL COMMENT '栏目名',
  `SHOW_NAME` varchar(100) NOT NULL COMMENT '前台显示的栏目名，一般同type_name',
  `PARENT_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '父栏目id',
  `REMARK` varchar(100) DEFAULT NULL COMMENT '备注',
  `FILE_DIR` varchar(100) DEFAULT NULL COMMENT '生成的栏目和内容文件目录(相对目录)',
  `FILE_NAME` varchar(100) DEFAULT NULL COMMENT '栏目文件名',
  `TYPE_SORT` smallint(2) DEFAULT NULL COMMENT '相同父类型下的排序字段',
  `ATTR_ID` bigint(20) DEFAULT NULL COMMENT '栏目类型/属性',
  `LIST_TEMPLATE` bigint(20) DEFAULT NULL COMMENT '列表模板',
  `CONTENT_TEMPLATE` bigint(20) DEFAULT NULL COMMENT '内容详细页模板',
  `TYPE_TEMPLATE` bigint(20) DEFAULT NULL COMMENT '栏目主页模板',
  `DEPTH` smallint(2) DEFAULT '1' COMMENT '深度',
  `STATUS` smallint(2) DEFAULT NULL COMMENT '状态。0：删除，1：禁用，2：正常',
  `CREATE_DATE` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_USER` varchar(60) DEFAULT NULL,
  `UPDATE_USER` varchar(60) DEFAULT NULL,
  `META_TITLE` varchar(100) DEFAULT NULL,
  `META_KEYWORDS` varchar(200) DEFAULT NULL,
  `META_DESCRIPTION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目/内容类型表';

-- ----------------------------
-- Records of cont_type
-- ----------------------------
INSERT INTO `cont_type` VALUES ('1', '减肥', null, '减肥', '减肥', '0', '减肥', null, null, null, '1', null, '6', '6', '1', null, '2014-07-08 17:00:38', '2014-07-08 17:00:38', null, null, null, null, null);
INSERT INTO `cont_type` VALUES ('2', '化妆', null, '化妆', '化妆', '0', '化妆', null, null, null, '4', null, '19', '6', '1', null, '2015-02-25 21:35:33', '2015-02-25 21:35:33', null, null, null, null, null);
INSERT INTO `cont_type` VALUES ('3', '刷机教程', null, '刷机教程', '刷机教程', '0', '刷机教程', null, null, null, '4', null, '19', '6', '1', null, '2015-03-12 20:28:24', '2015-03-12 20:28:33', null, null, '刷机教程', '刷机教程，ROOT,ROOM', '刷机教程，ROOT,ROOM');
INSERT INTO `cont_type` VALUES ('4', '手机软件', null, '手机软件', '手机软件', '0', '手机软件', null, null, null, '4', null, '19', '6', '1', null, '2015-03-12 20:30:03', '2015-03-12 20:30:06', null, null, '手机软件', '手机软件', '手机软件');
INSERT INTO `cont_type` VALUES ('5', '手机教程', null, '手机教程', '手机教程', '0', '手机教程', null, null, null, '4', null, '19', '6', '1', null, '2015-03-12 20:30:56', '2015-03-12 20:30:59', null, null, '手机教程', '手机教程', '手机教程');
INSERT INTO `cont_type` VALUES ('6', 't', null, 't', 't', '5', 't', null, null, null, '4', null, '6', '6', '2', null, '2015-04-22 21:22:53', '2015-04-22 21:22:53', null, null, null, null, null);

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(19) NOT NULL COMMENT '编号',
  `operator` varchar(30) NOT NULL COMMENT '操作员姓名',
  `operate_type` varchar(30) NOT NULL COMMENT '操作类型，枚举变量，引用名称',
  `remark` varchar(600) DEFAULT NULL COMMENT '操作说明',
  `create_time` datetime NOT NULL COMMENT '操作时间',
  `operate_page` varchar(30) DEFAULT NULL COMMENT '操作页面',
  `relevance_id` bigint(19) DEFAULT NULL COMMENT '关联对象id',
  `relevance_type` varchar(30) DEFAULT NULL COMMENT '关联类型 ORDERS 订单 GOODS商品 MEMBER会员'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_model`
-- ----------------------------
DROP TABLE IF EXISTS `sys_model`;
CREATE TABLE `sys_model` (
  `sys_model_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '模块编号',
  `model_name` varchar(100) NOT NULL COMMENT '模块名',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期yyyy-mm-dd hh:mm:ss,默认当前时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新日期yyyy-mm-dd hh:mm:ss,默认Null',
  `status` int(6) NOT NULL DEFAULT '1' COMMENT '状态 1：正常，2：禁用',
  `url` varchar(200) DEFAULT NULL COMMENT 'Url地址',
  `model_code` varchar(60) NOT NULL COMMENT '模块编码001001001',
  `type` int(6) NOT NULL COMMENT '类型1：菜单，2：页面',
  `depth` smallint(2) DEFAULT NULL,
  `url_ext1` varchar(200) DEFAULT NULL COMMENT '扩展url,应对一个功能多个请求连接时，大家不规范的写法出现时，可用扩展url',
  `url_ext2` varchar(200) DEFAULT NULL COMMENT '扩展url',
  `url_ext3` varchar(200) DEFAULT NULL COMMENT '扩展url',
  `sort` bigint(11) DEFAULT NULL COMMENT '排序号',
  `parent_id` bigint(11) DEFAULT NULL COMMENT '父节点id',
  PRIMARY KEY (`sys_model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='系统模块';

-- ----------------------------
-- Records of sys_model
-- ----------------------------
INSERT INTO `sys_model` VALUES ('1', '权限', '2014-06-09 00:00:00', '2014-06-09 00:00:00', '1', null, '001', '1', null, null, null, null, '5', '0');
INSERT INTO `sys_model` VALUES ('2', '操作员', '2014-06-09 00:00:00', '2014-06-09 00:00:00', '1', 'moss/user/index.htm', '001001', '1', null, null, null, null, '1', '1');
INSERT INTO `sys_model` VALUES ('3', '角色', '2014-06-09 00:00:00', '2014-06-09 00:00:00', '1', 'moss/role/index.htm', '001002', '1', null, null, null, null, '2', '1');
INSERT INTO `sys_model` VALUES ('8', '添加', '2014-06-09 00:00:00', '2014-06-09 00:00:00', '1', 'moss/role/create.htm', '001002001', '2', null, null, null, null, '1', '3');
INSERT INTO `sys_model` VALUES ('9', '修改', '2014-06-09 00:00:00', '2014-06-09 00:00:00', '1', 'moss/role/update.htm', '001002002', '2', null, null, null, null, '2', '3');
INSERT INTO `sys_model` VALUES ('10', '查看', '2014-06-09 00:00:00', '2014-06-09 00:00:00', '1', 'moss/role/list.htm', '001002003', '2', null, null, null, null, '3', '3');
INSERT INTO `sys_model` VALUES ('11', '删除', '2014-06-09 00:00:00', '2014-06-09 00:00:00', '1', 'moss/role/delete.htm', '001002004', '2', null, null, null, null, '4', '3');
INSERT INTO `sys_model` VALUES ('12', '添加', '2014-06-09 00:00:00', '2014-06-09 00:00:00', '1', 'moss/user/create.htm', '001001001', '2', null, null, null, null, '1', '2');
INSERT INTO `sys_model` VALUES ('13', '重置密码', '2014-06-09 00:00:00', '2014-06-09 00:00:00', '1', 'moss/user/updatePwd.htm', '001001002', '2', null, null, null, null, '2', '2');
INSERT INTO `sys_model` VALUES ('14', '查看', '2014-06-09 00:00:00', '2014-06-09 00:00:00', '1', 'moss/user/list.htm', '001001003', '2', null, null, null, null, '3', '2');
INSERT INTO `sys_model` VALUES ('15', '删除', '2014-06-09 00:00:00', '2014-06-09 00:00:00', '1', 'moss/user/delete.htm', '001001004', '2', null, null, null, null, '4', '2');
INSERT INTO `sys_model` VALUES ('16', '广告管理', '2014-06-24 15:58:13', '2014-06-09 00:00:00', '1', 'moss/advertise/toIndex.htm', '020', '1', null, null, null, null, '114', '0');
INSERT INTO `sys_model` VALUES ('17', '广告操作', '2014-06-24 16:00:39', '2014-06-09 00:00:00', '1', 'moss/advertise/saveAd.htm', '020001', '2', null, null, null, null, '135', '16');
INSERT INTO `sys_model` VALUES ('18', '广告复制', '2014-06-24 16:00:41', '2014-06-09 00:00:00', '1', null, '020002', '2', null, null, null, null, '137', '16');
INSERT INTO `sys_model` VALUES ('19', '广告删除', '2014-06-24 16:00:48', '2014-06-09 00:00:00', '1', 'moss/advertise/deleteAdv.htm', '020003', '2', null, null, null, null, '138', '16');
INSERT INTO `sys_model` VALUES ('25', '内容管理', '2014-06-24 15:58:34', '2014-06-24 15:56:14', '1', null, '003', '1', null, null, null, null, '3', '0');
INSERT INTO `sys_model` VALUES ('26', '栏目', '2014-06-24 16:02:13', '2014-06-24 15:59:29', '1', 'moss/type/index.htm', '003001', '1', null, null, null, null, '1', '25');
INSERT INTO `sys_model` VALUES ('35', '内容', '2014-06-24 16:02:43', '2014-06-24 16:02:46', '1', 'moss/cont/index.htm', '003002', '1', null, null, null, null, '2', '25');
INSERT INTO `sys_model` VALUES ('45', '类型', '2014-07-03 11:41:06', '2014-06-24 16:04:06', '1', 'moss/attr/index.htm', '003003', '1', null, null, null, null, '3', '25');
INSERT INTO `sys_model` VALUES ('55', '模板管理', '2014-07-03 11:15:31', '2014-07-03 11:15:28', '1', 'moss/template/index.htm', '003004', '1', null, null, null, null, '4', '25');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `sys_role_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `creator` varchar(60) DEFAULT NULL COMMENT '创建者 系统生成：System，管理员：Admin，其他为 操作员 LoginName',
  `role_name` varchar(10) DEFAULT NULL COMMENT '角色名',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建日期 yyyy-mm-dd hh:mm:ss,默认当前时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间 yyyy-mm-dd hh:mm:ss',
  PRIMARY KEY (`sys_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', 'test', '2014-06-19 13:04:43', '2014-06-19 13:04:43');
INSERT INTO `sys_role` VALUES ('2', 'admin', 'test2', '2014-06-19 13:42:25', '2014-06-19 14:05:38');

-- ----------------------------
-- Table structure for `sys_role_model`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_model`;
CREATE TABLE `sys_role_model` (
  `sys_model_id` bigint(11) NOT NULL COMMENT '模块编号id',
  `sys_role_id` bigint(11) NOT NULL COMMENT '角色编号id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期 yyyy-mm-dd hh:mm:ss,默认当前时间',
  `creator` varchar(60) NOT NULL COMMENT '创建者 系统生成：System，管理员：Admin，其他为 操作员 LoginName'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色模块关系';

-- ----------------------------
-- Records of sys_role_model
-- ----------------------------
INSERT INTO `sys_role_model` VALUES ('1551', '2', '2014-06-19 14:05:38', 'admin');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `sys_user_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键,Seq生成,从1开始',
  `login_name` varchar(60) NOT NULL COMMENT '操作员登录名. 唯一',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `password` varchar(100) NOT NULL COMMENT '密码 Sha后保存 ',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期 yyyy-mm-dd hh:mm:ss,默认当前时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新日期 yyyy-mm-dd hh:mm:ss,默认Null',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态 1：激活，2：禁用',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(60) NOT NULL COMMENT '创建者 系统生成：System，管理员：Admin，其他为 操作员 LoginName',
  `role_id` bigint(11) DEFAULT NULL COMMENT '系统角色ID',
  PRIMARY KEY (`sys_user_id`),
  UNIQUE KEY `INDEX_SYS_LOGIN_NAME` (`login_name`) USING HASH,
  KEY `INDEX_SYS_USER_ID` (`sys_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin', '0DPiKuNIrrVmD8IUCuw1hQxNqZc=', '2014-06-19 11:24:24', '2014-06-19 11:24:24', '1', 'admin', 'system', null);
INSERT INTO `sys_user` VALUES ('5', 'test', 'test', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 13:56:11', '2014-06-19 13:56:11', '1', null, 'admin', '1');
INSERT INTO `sys_user` VALUES ('6', 'test2', 'test2', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:03:50', '2014-06-19 14:03:50', '1', null, 'admin', '1');
INSERT INTO `sys_user` VALUES ('7', 't3', 't3', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:36:48', '2014-06-19 14:36:48', '1', null, 'admin', null);
INSERT INTO `sys_user` VALUES ('8', 't4', 't4', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:36:57', '2014-06-19 14:36:57', '1', null, 'admin', null);
INSERT INTO `sys_user` VALUES ('9', 't5', 't5', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:37:04', '2014-06-19 14:37:04', '1', null, 'admin', null);
INSERT INTO `sys_user` VALUES ('10', 't6', 't6', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:37:30', '2014-06-19 14:37:30', '1', null, 'admin', null);
INSERT INTO `sys_user` VALUES ('11', 't7', 't7', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:37:38', '2014-06-19 14:37:38', '1', null, 'admin', null);
INSERT INTO `sys_user` VALUES ('12', 't8', 't8', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:37:45', '2014-06-19 14:37:45', '1', null, 'admin', null);
INSERT INTO `sys_user` VALUES ('13', 't9', 't9', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:37:55', '2014-06-19 14:37:55', '1', null, 'admin', '1');
INSERT INTO `sys_user` VALUES ('14', 't10', 't10', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:38:07', '2014-06-19 14:38:07', '1', null, 'admin', '2');
INSERT INTO `sys_user` VALUES ('15', 't11', 't11', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:38:20', '2014-06-19 14:38:20', '1', null, 'admin', null);
INSERT INTO `sys_user` VALUES ('16', 't12', 't12', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:54:38', '2014-06-19 14:54:38', '1', null, 'admin', null);
INSERT INTO `sys_user` VALUES ('17', 't13', 't13', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:54:50', '2014-06-19 14:54:50', '1', null, 'admin', null);
INSERT INTO `sys_user` VALUES ('18', 't14', 't14', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:55:00', '2014-06-19 14:55:00', '1', null, 'admin', null);
INSERT INTO `sys_user` VALUES ('19', 't15', 't15', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:55:16', '2014-06-19 14:55:16', '1', null, 'admin', null);
INSERT INTO `sys_user` VALUES ('20', 't17', 't17', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:55:24', '2014-06-19 14:55:24', '1', null, 'admin', null);
INSERT INTO `sys_user` VALUES ('21', 't18', 't18', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2014-06-19 14:55:32', '2014-06-19 14:55:32', '1', null, 'admin', null);

-- ----------------------------
-- Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `name` varchar(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('2321', '1');
INSERT INTO `test` VALUES ('sdfsdf', '2');
INSERT INTO `test` VALUES ('erwe', '3');
INSERT INTO `test` VALUES ('4dsfsd', '4');
INSERT INTO `test` VALUES ('ewer', '5');
INSERT INTO `test` VALUES ('6sdf', '6');
INSERT INTO `test` VALUES ('serwer', '7');
INSERT INTO `test` VALUES ('rwer', '8');
INSERT INTO `test` VALUES ('gfdhgh', '9');
INSERT INTO `test` VALUES ('1023', '10');

-- ----------------------------
-- Table structure for `tmpt_template`
-- ----------------------------
DROP TABLE IF EXISTS `tmpt_template`;
CREATE TABLE `tmpt_template` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '模板Id',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '模板所属分组id',
  `TEMPLATE_NAME` varchar(50) NOT NULL COMMENT '模板名称',
  `FILE_DIR` varchar(100) DEFAULT NULL COMMENT '模板路径. 叶子节点时有值',
  `DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '描述',
  `STATUS` smallint(2) NOT NULL DEFAULT '1' COMMENT '状态.  0:删除； 1：正常',
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `HAS_LEAF` smallint(2) DEFAULT '0' COMMENT '是否是叶子节点; 0否，既文件夹；1是，既模板',
  `TEMPLATE_TYPE` smallint(2) DEFAULT '1' COMMENT '生成的模板类型。 0:文件夹; 1：html, 2；jsp; 3:',
  `UPDATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_USER` varchar(60) DEFAULT NULL COMMENT 'login_name',
  `UPDATE_USER` varchar(60) DEFAULT NULL COMMENT 'login_name',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='页面模板';

-- ----------------------------
-- Records of tmpt_template
-- ----------------------------
INSERT INTO `tmpt_template` VALUES ('3', '0', '2222', 'erw', 'erwe', '1', '2015-02-25 21:45:22', '0', '1', '2015-02-25 21:45:22', null, null);
INSERT INTO `tmpt_template` VALUES ('6', '3', 'ret', null, null, '1', '2015-02-23 19:32:40', '1', '1', '2015-02-23 19:32:40', null, null);
INSERT INTO `tmpt_template` VALUES ('18', '0', '通用模版', null, null, '1', '2015-02-25 21:29:09', '0', '0', '2015-02-25 21:29:09', null, null);
INSERT INTO `tmpt_template` VALUES ('19', '18', '通用内容', null, null, '1', '2015-03-13 20:20:06', '1', '1', '2015-03-13 20:20:06', null, null);

-- ----------------------------
-- Table structure for `tmpt_template_body`
-- ----------------------------
DROP TABLE IF EXISTS `tmpt_template_body`;
CREATE TABLE `tmpt_template_body` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TEMPLATE_ID` bigint(20) NOT NULL COMMENT '模板id',
  `TEMPLATE_BODY` longtext COMMENT '模板内容',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDEX_TMPT_BODY_TMPTID` (`TEMPLATE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='模板内容表';

-- ----------------------------
-- Records of tmpt_template_body
-- ----------------------------
INSERT INTO `tmpt_template_body` VALUES ('2', '6', 'trytrytr<@cms.contextPath />dg');
INSERT INTO `tmpt_template_body` VALUES ('5', '19', '<!DOCTYPE html>\n<html lang=\"zh-cn\">\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <meta name=\"description\" content=\"\">\n    <meta name=\"author\" content=\"\">\n   <!-- <link rel=\"icon\" href=\"../../favicon.ico\">-->\n\n    <title>Blog Template for Bootstrap</title>\n    <!-- Custom styles for this template -->\n   \n	  <link href=\"${staticRoot}/css/common_context.css\" rel=\"stylesheet\">\n\n  	\n	<!-- 新 Bootstrap 核心 CSS 文件 -->\n<link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css\">\n\n<!-- 可选的Bootstrap主题文件（一般不用引入） -->\n<link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap-theme.min.css\">\n\n    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->\n    <!--[if lt IE 9]>\n      <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\n      <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n    <![endif]-->\n  </head>\n\n  <body>\n\n    <div class=\"blog-masthead\">\n      <div class=\"container\">\n        <nav class=\"blog-nav\">\n            <a class=\"blog-nav-item active\" href=\"${contextPath}/list.htm\">首页</a>\n          <a class=\"blog-nav-item active\" href=\"${contextPath}/t/3/list.htm\">刷机教程</a>\n          <a class=\"blog-nav-item\" href=\"${contextPath}/t/4/list.htm\">手机软件</a>\n          <a class=\"blog-nav-item\" href=\"${contextPath}/t/5/list.htm\">手机教程</a>         \n        </nav>\n      </div>\n    </div>\n\n    <div class=\"container\">\n\n      <div class=\"blog-header\">\n        <h1 class=\"blog-title\">The Bootstrap Blog哈哈哈哈 苟富贵大范甘迪方法申达股份史蒂芬森的发</h1>\n        <p class=\"lead blog-description\">The official example template of creating a blog with Bootstrap.</p>\n      </div>\n\n      <div class=\"row\">\n\n        <div class=\"col-sm-8 blog-main\">\n\n         \n\n          <div class=\"blog-post\">\n            <h2 class=\"blog-post-title\">${c.title}</h2>\n            <p class=\"blog-post-meta\">${c.publish_time!\'\'}<!--by <a href=\"#\">ucShouji</a>--></p>\n\n           <div>${c.content_body}</div>\n          </div><!-- /.blog-post -->\n\n    \n\n        </div><!-- /.blog-main -->\n\n        <div class=\"col-sm-3 col-sm-offset-1 blog-sidebar\">\n          <div class=\"sidebar-module sidebar-module-inset\">\n            <h4>About</h4>\n            <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>\n          </div>\n          <div class=\"sidebar-module\">\n            <h4>Archives</h4>\n            <ol class=\"list-unstyled\">\n              <li><a href=\"#\">March 2014</a></li>\n              <li><a href=\"#\">February 2014</a></li>\n              <li><a href=\"#\">January 2014</a></li>\n              <li><a href=\"#\">December 2013</a></li>\n              <li><a href=\"#\">November 2013</a></li>\n              <li><a href=\"#\">October 2013</a></li>\n              <li><a href=\"#\">September 2013</a></li>\n              <li><a href=\"#\">August 2013</a></li>\n              <li><a href=\"#\">July 2013</a></li>\n              <li><a href=\"#\">June 2013</a></li>\n              <li><a href=\"#\">May 2013</a></li>\n              <li><a href=\"#\">April 2013</a></li>\n            </ol>\n          </div>\n          <div class=\"sidebar-module\">\n            <h4>Elsewhere</h4>\n            <ol class=\"list-unstyled\">\n              <li><a href=\"#\">GitHub</a></li>\n              <li><a href=\"#\">Twitter</a></li>\n              <li><a href=\"#\">Facebook</a></li>\n            </ol>\n          </div>\n        </div><!-- /.blog-sidebar -->\n\n      </div><!-- /.row -->\n\n    </div><!-- /.container -->\n\n<footer class=\"blog-footer\">\n      <p>Copyright © 2004-2015.</p>\n      <p>\n        <a href=\"#\">回顶部</a>\n      </p>\n    </footer>\n\n\n    <!-- Bootstrap core JavaScript\n    ================================================== -->\n    <!-- Placed at the end of the document so the pages load faster -->\n<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->\n<script src=\"http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js\"></script>\n\n<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->\n<script src=\"http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js\"></script>\n  </body>\n</html>');

-- ----------------------------
-- Table structure for `usr_member`
-- ----------------------------
DROP TABLE IF EXISTS `usr_member`;
CREATE TABLE `usr_member` (
  `MEMBER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`MEMBER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of usr_member
-- ----------------------------
