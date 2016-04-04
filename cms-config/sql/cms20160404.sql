/*
Navicat MySQL Data Transfer

Source Server         : cms
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-04-04 12:19:47
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
  `CREATE_DATE` timestamp NULL DEFAULT NULL,
  `CREATE_USER` varchar(60) DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `UPDATE_USER` varchar(60) DEFAULT NULL,
  `STATUS` smallint(6) DEFAULT '1' COMMENT '状态。0：删除，1：正常；',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='栏目类型, 内容模板';

-- ----------------------------
-- Records of cont_attribute
-- ----------------------------
INSERT INTO `cont_attribute` VALUES ('1', '1', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '测试', 'werw', '2015-05-16 12:49:03', 'admin', '2015-05-16 12:49:03', null, null);
INSERT INTO `cont_attribute` VALUES ('2', '1', '0', '0', '1', '1', '0', '0', '1', '1', '0', '0', '0', '0', '通用笑话类型', '', '2015-05-06 21:35:42', null, '2015-05-24 09:59:36', null, '1');
INSERT INTO `cont_attribute` VALUES ('3', '0', '0', '0', '1', '0', '0', '0', '1', '0', '0', '0', '1', '0', 'teste', 'sdf', null, null, null, null, '1');
INSERT INTO `cont_attribute` VALUES ('4', '1', '0', '0', '1', '1', '0', '1', '1', '1', '1', '1', '0', '0', '通用内容类型', '', '2015-02-23 16:22:50', null, '2015-02-23 16:22:50', null, '1');
INSERT INTO `cont_attribute` VALUES ('5', '1', '0', '0', '1', '1', '0', '1', '1', '1', '1', '0', '0', '0', '通用下载类型', '', '2015-05-06 21:42:31', null, '2015-05-06 21:42:31', null, '1');
INSERT INTO `cont_attribute` VALUES ('6', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'ceshi', '', '2015-05-20 19:13:31', null, '2015-05-20 19:13:31', null, '1');

-- ----------------------------
-- Table structure for `cont_content`
-- ----------------------------
DROP TABLE IF EXISTS `cont_content`;
CREATE TABLE `cont_content` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) NOT NULL COMMENT '标题',
  `ABOUT` varchar(400) DEFAULT NULL COMMENT '简介',
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
  `META_DESCRIPTION` varchar(300) DEFAULT NULL COMMENT '内容页面说明',
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
  `CREATE_DATE` timestamp NULL DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `CREATE_USER` varchar(60) DEFAULT NULL,
  `UPDATE_USER` varchar(60) DEFAULT NULL,
  `URL` varchar(50) NOT NULL COMMENT '/2015/03/2.html',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='内容表';

-- ----------------------------
-- Records of cont_content
-- ----------------------------
INSERT INTO `cont_content` VALUES ('1', 'sdfs', 'sdf', '', null, null, null, '1', null, null, null, '1', '4', '6', null, '2015-04-27 22:12:16', '1', '0', '0', '', '', '', null, 'sd', null, '', null, null, null, null, null, null, '9', null, '2015-04-27 22:12:25', '2015-04-27 22:12:25', null, null, '/2015/04/');
INSERT INTO `cont_content` VALUES ('2', '32423', 'sdfsf', '', null, null, null, '1', null, null, null, '1', '4', '6', null, '2015-04-09 22:12:31', '1', '0', '0', '23', '3', '3', null, '3', null, '', null, null, null, null, null, null, '9', null, '2015-05-03 11:08:01', '2015-05-03 11:08:01', null, null, '/2015/04/');
INSERT INTO `cont_content` VALUES ('3', 'adfsad', 'sdfsdf', '', null, null, null, '1', null, null, null, '1', '4', '6', null, '2015-05-14 11:09:39', '0', '0', '0', 'd', 'd', 'd', null, 'sdf', null, 'sdf', null, null, null, null, null, null, '9', null, '2015-05-03 11:09:52', '2015-05-03 11:09:52', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('4', 'sdfsd', 'afsdfsd', '', null, null, null, '1', null, null, null, '1', '4', '6', null, '2015-05-08 11:10:01', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-05 20:38:11', '2015-05-05 20:38:11', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('5', 'adsfsdf', 'wer', '', null, null, null, '1', null, null, null, '1', '4', '19', null, '2015-05-05 20:39:39', '0', '0', '0', '', '', '', null, 'wer', null, 'ew', null, null, null, null, null, null, '9', null, '2015-05-05 20:39:49', '2015-05-05 20:39:49', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('6', 'werwe', 'werw', '', null, null, null, '1', null, null, null, '1', '4', '19', null, '2015-05-19 20:40:07', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-05 20:40:14', '2015-05-05 20:40:14', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('7', 'werwerw', 'e', '', null, null, null, '1', null, null, null, '1', '4', '19', null, '2015-05-19 20:40:07', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-05 20:40:18', '2015-05-05 20:40:18', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('8', 'werrtert', '', '', null, null, null, '1', null, null, null, '1', '4', '19', null, '2015-05-06 20:40:22', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-05 20:40:27', '2015-05-05 20:40:27', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('9', 'sdfsd', 'sdf', '', null, null, null, '1', null, null, null, '1', '4', '19', null, '2015-05-05 20:43:16', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-05 20:43:20', '2015-05-05 20:43:20', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('10', 'asdfsdf', '', '', null, null, null, '1', null, null, null, '1', '4', '19', null, '2015-05-05 20:43:16', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-05 20:43:24', '2015-05-05 20:43:24', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('11', 'adfadsfsad', '', '', null, null, null, '1', null, null, null, '1', '4', '19', null, '2015-05-05 20:43:16', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-05 20:43:28', '2015-05-05 20:43:28', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('12', 'adfsadfas', '', '', null, null, null, '1', null, null, null, '1', '4', '19', null, '2015-05-05 20:43:16', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-05 20:43:31', '2015-05-05 20:43:31', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('13', 'adfafasdf', '', '', null, null, null, '1', null, null, null, '1', '4', '19', null, '2015-05-05 20:43:16', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-05 20:43:35', '2015-05-05 20:43:35', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('14', 'adsfsadfsad', '', '', null, null, null, '1', null, null, null, '1', '4', '19', null, '2015-05-05 20:43:16', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-05 20:43:39', '2015-05-05 20:43:39', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('15', 'sdfsdf', '', '/200x150.jpg', null, null, null, '1', null, null, null, '1', '4', '19', null, '2015-05-05 21:20:06', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-05 21:42:30', '2015-05-05 21:42:30', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('16', 'sdff', '', '', null, null, null, '1', null, null, null, '1', '4', '19', null, '2015-05-12 21:22:21', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-05 21:23:01', '2015-05-05 21:23:01', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('17', 'sdff', '', '', null, null, null, '1', null, null, null, '1', '4', '19', null, '2015-05-12 21:22:21', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-05 21:23:04', '2015-05-05 21:23:04', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('18', 'sddfsfsd', 'sdfasfsd', '', null, null, null, '8', null, null, '8', '2', '5', '21', null, '2015-05-06 21:40:11', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-06 21:40:19', '2015-05-06 21:40:19', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('19', 'fggg', 'fgdf', '', null, null, null, '8', null, null, '8', '2', '5', '21', null, '2015-05-06 21:40:32', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-06 21:40:37', '2015-05-06 21:40:37', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('20', 'sdfasds', 'sdfsdf', '', null, null, null, '6', null, null, '6', '2', '4', '6', null, '2015-05-20 21:41:18', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-06 22:01:32', '2015-05-06 22:01:32', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('21', '在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的', '在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒', '', null, null, null, '1', null, null, null, '1', '4', '19', null, '2015-05-09 16:50:41', '0', '0', '0', '', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-16 21:30:44', '2015-05-16 21:30:44', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('22', '魏汝稳认为不不不', '顺丰速递', '士大夫', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-05-16 12:09:01', '0', '0', '0', '', '', '', null, '', null, '中国', null, null, null, null, null, null, '9', null, '2015-05-16 12:09:37', '2015-05-16 12:09:37', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('23', '魏汝稳认为不不不', '顺丰速递', '士大夫', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-05-16 12:09:01', '0', '0', '0', '第三方', '第三方', '爽肤水地方', null, '', null, '中国', null, null, null, null, null, null, '9', null, '2015-05-16 12:10:40', '2015-05-16 12:10:40', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('24', '魏汝稳认为不不不', '顺丰速递', '士大夫', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-05-16 12:09:01', '0', '0', '0', '第三方', '第三方', '爽肤水地方', null, '', null, '中国', null, null, null, null, null, null, '9', null, '2015-05-16 12:11:00', '2015-05-16 12:11:00', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('25', '魏汝稳认为不不不', '顺丰速递', '士大夫', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-05-16 12:09:01', '0', '0', '0', '第三方', '第三方', '爽肤水地方', null, '', null, '中国', null, null, null, null, null, null, '9', null, '2015-05-16 12:13:10', '2015-05-16 12:13:10', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('26', '魏汝稳认为不不不', '顺丰速递sdfsdfsfsdfsd线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发', '士大夫', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-05-16 12:09:01', '0', '0', '0', '第三方', '第三方', '爽肤水地方', null, '', null, '中国', null, null, null, null, null, null, '9', null, '2015-05-20 22:00:56', '2015-05-20 22:00:56', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('27', 'sdfa史蒂芬森发生啊水电费', '啊手动阀首发式发生法三发', '', null, null, null, '5', null, null, null, '5', '4', '19', null, '2015-04-19 22:00:10', '0', '0', '0', '士大夫', '胜多负少', '士大夫', null, '士大夫似的', null, '', null, null, null, null, null, null, '9', null, '2015-05-19 22:00:50', '2015-05-19 22:00:50', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('28', '啊手动阀士大夫', '啊史蒂芬森地方', '', null, null, null, '5', null, null, null, '5', '4', '19', null, '2015-05-19 22:00:58', '0', '0', '0', '士大夫', '士大夫', '士大夫', null, '胜多负少', null, '', null, null, null, null, null, null, '9', null, '2015-05-19 22:01:17', '2015-05-19 22:01:17', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('29', '啊士大夫似的', '啊士大夫撒地方啊手动阀士大夫', '', null, null, null, '11', null, null, null, '11', '4', '19', null, '2015-04-19 22:01:38', '0', '0', '0', '啊士大夫撒的', '啊多发', '啊大法师', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-19 22:01:56', '2015-05-19 22:01:56', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('30', '啊大法师啊读书法士大夫法士大夫法士大夫', '啊手动阀士大夫', '', null, null, null, '11', null, null, null, '11', '4', '19', null, '2015-04-19 22:02:01', '1', '0', '0', '阿三地方', '啊多方式戴菲菲', '啊时代发上', null, '啊时代发上', null, '', null, null, null, null, null, null, '9', null, '2015-05-19 22:30:19', '2015-05-24 16:09:27', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('31', 'asdfsadfas', 'sdfsfasfsad', '', null, null, null, '13', null, null, null, '13', '4', '19', null, '2015-04-19 22:13:16', '0', '0', '0', 'sdf', 'sdf', 'sdf', null, 'sdf', null, '', null, null, null, null, null, null, '9', null, '2015-05-19 22:13:27', '2015-05-19 22:13:27', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('32', 'dfgasgsdfg示范点仿盛大', '啊似懂非懂是否', '', null, null, null, '4', null, null, null, '4', '4', '19', null, '2015-04-19 22:13:36', '0', '0', '0', '士大夫', '士大夫', '士大夫', null, '士大夫', null, '', null, null, null, null, null, null, '9', null, '2015-05-19 22:13:51', '2015-05-19 22:13:51', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('33', '啊说到底发生点飞洒的发三的', '啊读书法手动阀', '', null, null, null, '9', null, null, '9', '3', '4', '19', null, '2015-04-19 22:14:07', '0', '0', '0', '啊手动阀上的', '阿三地方', '啊水电费', null, '阿三地方', null, '', null, null, null, null, null, null, '9', null, '2015-05-19 22:14:19', '2015-05-19 22:14:19', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('34', 'sdfsdf', 'sdfsadf', null, null, null, null, '12', null, null, null, '12', '2', '22', null, '2015-04-19 22:20:32', '0', '0', '0', 'sdf', 'sdf', 'sdf', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-19 22:20:41', '2015-05-19 22:20:41', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('35', 'sadfsd史蒂芬森多方式并不', 'sdfsdf', '', null, null, null, '7', null, null, null, '7', '4', '19', null, '2015-04-19 22:20:51', '0', '0', '0', '士大夫撒法', '士大夫似的', '士大夫似的', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-19 22:21:08', '2015-05-19 22:21:08', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('36', '史蒂芬森打发 士大夫', '手动发士大夫', '', null, null, null, '7', null, null, null, '7', '4', '19', null, '2015-04-19 22:21:20', '0', '0', '0', '士大夫似的', '士大夫', '士大夫似的', null, '士大夫', null, '', null, null, null, null, null, null, '9', null, '2015-05-19 22:21:56', '2015-05-19 22:21:56', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('37', '百度在人工智能基准测试中取得了全球第一', '据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机。Minwa 超级计算机通过扫描 ImageNet 取得了这一成绩，这是一 ...', '/100x75.jpg', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-22 20:37:27', '0', '0', '0', '百度在人工智能基准测试中取得了全球第一', '人工智能基准测试;超级计算机', '据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机', null, '人工智能', null, 'dataguru', null, null, null, null, null, null, '9', null, null, null, null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('38', '百度在人工智能基准测试中取得了全球第一', '据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机。Minwa 超级计算机通过扫描 ImageNet 取得了这一成绩，这是一 ...', '/100x75.jpg', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-22 20:37:27', '0', '0', '0', '百度在人工智能基准测试中取得了全球第一', '人工智能基准测试;超级计算机', '据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机', null, '人工智能', null, 'dataguru', null, null, null, null, null, null, '9', null, null, null, null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('39', '百度在人工智能基准测试中取得了全球第一', '据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机。Minwa 超级计算机通过扫描 ImageNet 取得了这一成绩，这是一 ...', '/100x75.jpg', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-05-22 20:48:58', '0', '0', '0', '百度在人工智能基准测试中取得了全球第一', '人工智能基准测试;超级计算机', '据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机', null, '人工智能', null, '', null, null, null, null, null, null, '9', null, null, null, null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('40', '百度在人工智能基准测试中取得了全球第一', '据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机。Minwa 超级计算机通过扫描 ImageNet 取得了这一成绩，这是一 ...', '/upload/2015-05/1432300337258.jpg100x75.jpg', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-05-22 21:14:51', '0', '0', '0', '百度在人工智能基准测试中取得了全球第一', '人工智能基准测试;超级计算机', '据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机', null, '人工智能', null, 'dataguru', null, null, null, null, null, null, '9', null, '2015-05-22 21:12:21', '2015-05-22 21:12:21', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('41', '百度在人工智能基准测试中取得了全球第', '据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机。Minwa 超级计算机通过扫描 ImageNet 取得了这一成绩，这是一 ...', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-05-22 21:14:54', '0', '0', '0', '百度在人工智能基准测试中取得了全球第一', '人工智能基准测试;超级计算机', '据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机', null, '人工智能', null, 'dataguru', null, null, null, null, null, null, '9', null, '2015-05-22 21:12:43', '2015-05-24 08:16:40', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('42', '45345', '35345', '34', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-24 08:30:30', '0', '0', '0', '4', '4', '5', null, '4', null, '345', null, null, null, null, null, null, '9', null, '2015-05-24 08:30:41', '2015-05-24 08:30:41', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('43', 'rwerwe', '23', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-24 08:46:42', '0', '0', '0', '3', '3', '3', null, '32', null, '3', null, null, null, null, null, null, '9', null, '2015-05-24 08:46:54', '2015-05-24 08:46:54', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('44', 'werwe', 'wer', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-24 08:49:40', '0', '0', '0', 'wer', 'wer', 'wer', null, 'ewr', null, '', null, null, null, null, null, null, '9', null, '2015-05-24 08:51:12', '2015-05-24 08:51:12', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('45', 'sdfsad', 'asdfasd', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-24 08:52:33', '0', '0', '0', 'ewer', 'wer', 'ewr', null, 'sdf', null, '', null, null, null, null, null, null, '9', null, '2015-05-24 08:52:47', '2015-05-24 08:52:47', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('46', '3324', 'dsfsdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-24 08:58:09', '0', '0', '0', 'sdf', 'sdf', 'sdf', null, 'sdf', null, '', null, null, null, null, null, null, '9', null, '2015-05-24 08:58:23', '2015-05-24 08:58:23', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('47', 'rewr', 'werwe', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-24 09:00:27', '0', '0', '0', 'wer', 'ewr', 'er', null, 'wer', null, '', null, null, null, null, null, null, '9', null, '2015-05-24 09:00:41', '2015-05-24 09:00:41', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('48', 'wer', 'werwersdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-24 09:02:18', '1', '0', '0', 'wer', 'wr', 'wer', null, 'wer', null, '', null, null, null, null, null, null, '9', null, '2015-05-24 09:02:28', '2015-05-24 10:04:24', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('49', 'sfsdf', 'sdfsd', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-24 09:03:56', '0', '0', '0', 'd', 'd', 'e', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-24 09:04:06', '2015-05-24 09:04:06', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('50', 'sdfsd', 'sdf', 'sdf', null, null, null, '12', null, null, null, '12', '2', '22', null, '2015-04-24 09:59:51', '0', '0', '0', null, null, null, null, null, null, '', null, null, null, null, null, null, '9', null, '2015-05-24 10:00:01', '2015-05-24 10:00:01', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('51', 'xfdsf', 'sdf', 'dsf', null, null, null, '12', null, null, null, '12', '2', '22', null, '2015-04-24 10:02:56', '0', '0', '0', null, null, null, null, null, null, '', null, null, null, null, null, null, '9', null, '2015-05-24 10:03:09', '2015-05-24 10:03:09', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('52', 'dsfs', 'sdf', 'dsf', null, null, null, '12', null, null, null, '12', '2', '22', null, '2015-04-24 10:03:10', '0', '0', '0', null, null, null, null, null, null, '', null, null, null, null, null, null, '9', null, '2015-05-24 10:03:16', '2015-05-24 10:03:16', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('53', 'dfsdsd', 'sdf', 'sdfsd', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-24 10:03:42', '0', '0', '0', 'dfsdsd', 'dsf', 'fs', null, 'sd', null, '', null, null, null, null, null, null, '9', null, '2015-05-24 10:03:52', '2015-05-24 10:03:52', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('54', 'sdfsadf', 'sdf', 'sdf', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-24 10:05:49', '1', '1', '1', 'sdfsadf', 'dsf', 'sd', null, 'sdf', null, '', null, null, null, null, null, null, '9', null, '2015-05-24 10:06:08', '2015-05-25 21:15:22', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('55', 'fasfsdafsd', 'sdfasfsdfsdsfsdfsdffsdfsd', '', null, null, null, '10', null, null, null, '10', '5', '21', null, '2015-04-24 17:30:15', '0', '0', '0', 'fasfsdafsd', 'ds', 'sdf', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-24 17:31:07', '2015-05-24 17:31:07', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('56', 'dfsdfsdfsdddddddddddddddddddddddd', 'dsfsdf', '', null, null, null, '10', null, null, null, '10', '5', '21', null, '2015-04-24 17:31:09', '0', '0', '0', 'dfsdfsdfsdddddddddddddddddddddddd', 'sdf', 'sdf', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-24 17:33:03', '2015-05-24 17:33:03', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('57', 'rwerwe', 'wer', 'wer', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-25 21:14:07', '0', '0', '0', 'rwerwe', 'wer', 'wer', null, 'ewr', null, 'ewr', null, null, null, null, null, null, '9', null, '2015-05-25 21:14:21', '2015-05-25 21:14:21', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('58', 'r', 'erte', 'retert', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-25 21:23:14', '1', '1', '1', 'r', '3', '3', null, '33', null, '', null, null, null, null, null, null, '9', null, '2015-05-25 21:23:26', '2015-05-25 21:23:26', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('59', 'ewwer', 'werwe', 'wer', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-25 21:23:28', '0', '0', '0', 'ewwer', 'wer', 'wer', null, 'wer', null, '', null, null, null, null, null, null, '9', null, '2015-05-25 21:29:03', '2015-05-25 21:29:03', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('60', '111', 'werwe', 'ewr', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-25 21:55:16', '0', '0', '0', '111', 'e', 'e', null, 'ew', null, '', null, null, null, null, null, null, '9', null, '2015-05-25 21:55:28', '2015-05-26 18:38:53', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('61', 'werwe', 'werew', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 20:58:35', '0', '0', '0', 'werwe', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 20:58:42', '2015-05-28 20:58:42', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('62', 'wertert', 'erte', 're', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 20:58:43', '0', '0', '0', 'wertert', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 20:58:48', '2015-05-28 20:58:48', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('63', 'rty', 'rtyrty', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 20:58:49', '0', '0', '0', 'rty', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 20:58:56', '2015-05-28 20:58:56', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('64', 'tyutyu', 'tyu', 'etert', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 20:58:56', '0', '0', '0', 'tyutyu', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 20:59:03', '2015-05-28 20:59:03', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('65', 'dsfgsd', 'sdfsdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 20:59:03', '0', '0', '0', 'dsfgsd', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 20:59:10', '2015-05-28 20:59:10', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('66', 'dfgdf', 'dfgdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 20:59:11', '0', '0', '0', 'dfgdf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 20:59:16', '2015-05-28 20:59:16', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('67', 'sfdgdg', 'dfgdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 20:59:17', '0', '0', '0', 'sfdgdg', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 20:59:21', '2015-05-28 20:59:21', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('68', 'retewrt', 'erter', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 20:59:22', '0', '0', '0', 'retewrt', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 20:59:48', '2015-05-28 20:59:48', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('69', 'dgsfdgsdf', 'sdfg', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 20:59:48', '0', '0', '0', 'dgsfdgsdf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 20:59:52', '2015-05-28 20:59:52', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('70', 'sdfgsdfg', 'sdfgsdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 20:59:53', '0', '0', '0', 'sdfgsdfg', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 20:59:58', '2015-05-28 20:59:58', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('71', 'ccvbcv', 'cvb', 'cvb', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 20:59:59', '0', '0', '0', 'ccvbcv', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:00:04', '2015-05-28 21:00:04', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('72', 'xcvbxcv', 'xcvbxcvb', 'xcvb', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:00:14', '0', '0', '0', 'xcvbxcv', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:00:21', '2015-05-28 21:00:21', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('73', 'xvcbxcv', 'xcvb', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:00:22', '0', '0', '0', 'xvcbxcv', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:00:26', '2015-05-28 21:00:26', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('74', 'xcvbxvv', 'xcvvbxcv', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:00:27', '0', '0', '0', 'xcvbxvv', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:00:32', '2015-05-28 21:00:32', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('75', 'xvcbxcvv', 'xcvbxcv', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:00:33', '0', '0', '0', 'xvcbxcvv', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:00:39', '2015-05-28 21:00:39', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('76', 'xvcbxcv', 'xcvbxcvb', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:00:40', '0', '0', '0', 'xvcbxcv', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:00:46', '2015-05-28 21:00:46', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('77', 'cxvbxcvb', 'cvbcxvb', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:00:47', '0', '0', '0', 'cxvbxcvb', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:00:51', '2015-05-28 21:00:51', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('78', 'xvcbcxv', 'cvbcxv', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:00:52', '0', '0', '0', 'xvcbcxv', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:00:57', '2015-05-28 21:00:57', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('79', 'xcvbxcvb', 'cxvbxcv', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:00:58', '0', '0', '0', 'xcvbxcvb', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:01:03', '2015-05-28 21:01:03', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('80', 'xcvbxcvb', 'cxvbxcvb', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:01:04', '0', '0', '0', 'xcvbxcvb', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:01:09', '2015-05-28 21:01:09', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('81', 'sdfsdsdfsad', 'sdfsd', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:01:10', '0', '0', '0', 'sdfsdsdfsad', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:01:20', '2015-05-28 21:01:20', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('82', 'sdfsd', 'sdfsdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:01:21', '0', '0', '0', 'sdfsd', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:01:34', '2015-05-28 21:01:34', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('83', 'dsfsd', 'sdfsdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:01:35', '0', '0', '0', 'dsfsd', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:01:41', '2015-05-28 21:01:41', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('84', 'sdafds', 'sdfsd', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:01:41', '0', '0', '0', 'sdafds', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:01:46', '2015-05-28 21:01:46', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('85', 'sadfsd', 'sdfsdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:01:47', '0', '0', '0', 'sadfsd', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:01:52', '2015-05-28 21:01:52', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('86', 'asddfsd', 'sadfsadf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:01:53', '0', '0', '0', 'asddfsd', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:01:57', '2015-05-28 21:01:57', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('87', 'sadfsadf', 'dfafasdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:01:58', '0', '0', '0', 'sadfsadf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:02:04', '2015-05-28 21:02:04', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('88', 'adsfsda', 'sadfsad', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:02:05', '0', '0', '0', 'adsfsda', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:02:10', '2015-05-28 21:02:10', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('89', 'dsfsadf', 'asdfsdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:02:11', '0', '0', '0', 'dsfsadf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:02:19', '2015-05-28 21:02:19', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('90', 'asdfasdf', 'dsf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:02:19', '0', '0', '0', 'asdfasdf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:02:27', '2015-05-28 21:02:27', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('91', 'saf', 'adf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:02:28', '0', '0', '0', 'saf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:02:37', '2015-05-28 21:02:37', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('92', 'adsf', '', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:02:38', '0', '0', '0', 'adsf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:02:46', '2015-05-28 21:02:46', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('93', 'sdfsadf', '', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:02:47', '0', '0', '0', 'sdfsadf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:02:57', '2015-05-28 21:02:57', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('94', 'sdfa', 'sdfsdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:02:58', '0', '0', '0', 'sdfa', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:03:08', '2015-05-28 21:03:08', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('95', 'sdfasf', 'sdfasdsdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:03:09', '0', '0', '0', 'sdfasf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:03:15', '2015-05-28 21:03:15', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('96', 'addsf', 'sdfdsf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:03:16', '0', '0', '0', 'addsf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:03:22', '2015-05-28 21:03:22', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('97', 'adfdasf', 'dfsd', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:03:23', '0', '0', '0', 'adfdasf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:03:28', '2015-05-28 21:03:28', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('98', 'asdfdsf', 'sdfsdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:03:30', '0', '0', '0', 'asdfdsf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:03:43', '2015-05-28 21:03:43', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('99', 'sdfsdfsd', 'dfsadf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:03:44', '0', '0', '0', 'sdfsdfsd', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:03:51', '2015-05-28 21:03:51', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('100', 'adsfsadf', 'asdfasdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:03:52', '0', '0', '0', 'adsfsadf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:03:57', '2015-05-28 21:03:57', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('101', 'adfasdf', 'asdfasdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:03:58', '0', '0', '0', 'adfasdf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:04:03', '2015-05-28 21:04:03', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('102', 'asdfasdf', 'adsfadsfads', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:04:04', '0', '0', '0', 'asdfasdf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:04:10', '2015-05-28 21:04:10', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('103', 'sdafsadf', 'sadfsdaf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:04:10', '0', '0', '0', 'sdafsadf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:04:15', '2015-05-28 21:04:15', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('104', 'adsfasd', 'adsfadsf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:04:17', '0', '0', '0', 'adsfasd', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:04:21', '2015-05-28 21:04:21', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('105', 'asdfasdf', 'asdfasd', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:04:22', '0', '0', '0', 'asdfasdf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:04:28', '2015-05-28 21:04:28', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('106', 'asdfasdf', 'dsfadsf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:04:29', '0', '0', '0', 'asdfasdf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:04:36', '2015-05-28 21:04:36', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('107', 'sdgaasgasf', 'sadfasdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:04:37', '0', '0', '0', 'sdgaasgasf', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:04:44', '2015-05-28 21:04:44', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('108', 'sdafsda', 'sdfasdf', '', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 21:04:45', '0', '0', '0', 'sdafsda', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 21:04:51', '2015-06-03 06:49:36', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('109', 'dsfgdfg', 'dfgdsf', '/upload/2015-05/1432821870381.jpg150x100.jpg', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 22:04:23', '0', '0', '0', 'dsfgdfg', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 22:04:32', '2015-05-28 22:04:32', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('110', 'sddfas', 'dsafasd', '/upload/2015-05/1432821903513.jpg150x100.jpg', null, null, null, '1', null, null, null, '1', '4', '23', null, '2015-04-28 22:04:55', '0', '0', '0', 'sddfas', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-05-28 22:05:04', '2015-05-31 10:29:01', null, null, '/2015/05/');
INSERT INTO `cont_content` VALUES ('111', 'erter', 'ert', '/upload/2015-06/1433728935915.pngnull', null, null, null, '5', null, null, null, '5', '4', '19', null, '2015-06-08 09:51:20', '0', '0', '0', 'erter', '', '', null, '', null, '', null, null, null, null, null, null, '9', null, '2015-06-08 09:51:33', '2015-06-08 10:04:14', null, null, '/2015/06/');

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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cont_content_body
-- ----------------------------
INSERT INTO `cont_content_body` VALUES ('1', '1', '<p>dsfsd</p>\n', null);
INSERT INTO `cont_content_body` VALUES ('2', '2', '<html>\n <head></head>\n <body>\n  <p><img alt=\"习近平在庆祝\" src=\"http://localhost:8080/cms-static/2015-05/1430622481113.jpg\"></p> \n  <p>4月28日，2015年庆祝“五一”国际劳动节暨表彰全国劳动模范和先进工作者大会在北京人民大会堂隆重举行。中共中央总书记、国家主席、中央军委主席习近平发表重要讲话。 新华社记者 鞠鹏 摄</p> \n  <p>新华网北京4月28日电</p> \n  <p><strong>在庆祝“五一”国际劳动节暨表彰全国劳动模范和先进工作者大会上的讲话</strong></p> \n  <p>（2015年4月28日）</p> \n  <p>习近平</p> \n  <p>同志们：</p> \n  <p>今天，我们在这里隆重集会，纪念全世界工人阶级和劳动群众的盛大节日——“五一”国际劳动节，表彰全国劳动模范和先进工作者，目的是弘扬劳模精神，弘扬劳动精神，弘扬我国工人阶级和广大劳动群众的伟大品格。</p> \n  <p>首先，我代表党中央、国务院，向全国各族工人、农民、知识分子和其他各阶层劳动群众，向人民解放军指战员、武警部队官兵和公安民警，向香港同胞、澳门同胞、台湾同胞和海外侨胞，致以节日的祝贺！向为改革开放和社会主义现代化建设作出突出贡献的劳动模范和先进工作者，致以崇高的敬意！在这里，我代表中国工人阶级和广大劳动群众，向全世界工人阶级和广大劳动群众，致以诚挚的问候！</p> \n  <p>“五一”国际劳动节，是全世界劳动人民共同的节日。从恩格斯领导成立的第二国际明确将1890年5月1日定为第一个国际劳动节起，历史车轮已走过125年。我们党历来高度重视通过纪念“五一”国际劳动节，启发职工群众觉悟，教育引导劳动群众，团结带领工人阶级和广大劳动群众为民族独立、人民解放和国家富强、人民幸福而奋斗。新中国成立后，我国工人阶级成为国家的领导阶级，我国工人阶级和广大劳动群众成为国家的主人，我们纪念“五一”国际劳动节具有了新的时代意义。</p> \n  <p>我们所处的时代是催人奋进的伟大时代，我们进行的事业是前无古人的伟大事业，我们正在从事的中国特色社会主义事业是全体人民的共同事业。全面建成小康社会，进而建成富强民主文明和谐的社会主义现代化国家，根本上靠劳动、靠劳动者创造。因此，无论时代条件如何变化，我们始终都要崇尚劳动、尊重劳动者，始终重视发挥工人阶级和广大劳动群众的主力军作用。这就是我们今天纪念“五一”国际劳动节的重大意义。</p> \n  <p>同志们！</p> \n  <p>党的十八大以来，党中央从坚持和发展中国特色社会主义全局出发，提出并形成了全面建成小康社会、全面深化改革、全面依法治国、全面从严治党的战略布局，确立了新形势下党和国家各项工作的战略目标和战略举措，为实现“</p>\n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('3', '3', '<html>\n <head></head>\n <body>\n  <p>asdfsdf</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('4', '4', '<html>\n <head></head>\n <body>\n  <p><img alt=\"习近平在庆祝\" src=\"http://localhost:8080/cms-static/upload/2015-05/1430829490730.jpg\"></p> \n  <p>4月28日，2015年庆祝“五一”国际劳动节暨表彰全国劳动模范和先进工作者大会在北京人民大会堂隆重举行。中共中央总书记、国家主席、中央军委主席习近平发表重要讲话。 新华社记者 鞠鹏 摄</p> \n  <p>新华网北京4月28日电</p> \n  <p><strong>在庆祝“五一”国际劳动节暨表彰全国劳动模范和先进工作者大会上的讲话</strong></p> \n  <p>（2015年4月28日）</p> \n  <p>习近平</p> \n  <p>同志们：</p> \n  <p>今天，我们在这里隆重集会，纪念全世界工人阶级和劳动群众的盛大节日——“五一”国际劳动节，表彰全国劳动模范和先进工作者，目的是弘扬劳模精神，弘扬劳动精神，弘扬我国工人阶级和广大劳动群众的伟大品格。</p> \n  <p>首先，我代表党中央、国务院，向全国各族工人、农民、知识分子和其他各阶层劳动群众，向人民解放军指战员、武警部队官兵和公安民警，向香港同胞、澳门同胞、台湾同胞和海外侨胞，致以节日的祝贺！向为改革开放和社会主义现代化建设作出突出贡献的劳动模范和先进工作者，致以崇高的敬意！在这里，我代表中国工人阶级和广大劳动群众，向全世界工人阶级和广大劳动群众，致以诚挚的问候！</p> \n  <p>“五一”国际劳动节，是全世界劳动人民共同的节日。从恩格斯领导成立的第二国际明确将1890年5月1日定为第一个国际劳动节起，历史车轮已走过125年。我们党历来高度重视通过纪念“五一”国际劳动节，启发职工群众觉悟，教育引导劳动群众，团结带领工人阶级和广大劳动群众为民族独立、人民解放和国家富强、人民幸福而奋斗。新中国成立后，我国工人阶级成为国家的领导阶级，我国工人阶级和广大劳动群众成为国家的主人，我们纪念“五一”国际劳动节具有了新的时代意义。</p> \n  <p>我们所处的时代是催人奋进的伟大时代，我们进行的事业是前无古人的伟大事业，我们正在从事的中国特色社会主义事业是全体人民的共同事业。全面建成小康社会，进而建成富强民主文明和谐的社会主义现代化国家，根本上靠劳动、靠劳动者创造。因此，无论时代条件如何变化，我们始终都要崇尚劳动、尊重劳动者，始终重视发挥工人阶级和广大劳动群众的主力军作用。这就是我们今天纪念“五一”国际劳动节的重大意义。</p> \n  <p>同志们！</p> \n  <p>党的十八大以来，党中央从坚持和发展中国特色社会主义全局出发，提出并形成了全面建成小康社会、全面深化改革、全面依法治国、全面从严治党的战略布局，确立了新形势下党和国家各项工作的战略目标和战略举措，为实现“</p>\n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('5', '5', '<html>\n <head></head>\n <body>\n  <p>werwe</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('6', '6', '<html>\n <head></head>\n <body>\n  <p>werwewer</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('7', '7', '<html>\n <head></head>\n <body>\n  <p>werwewer</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('8', '8', '<html>\n <head></head>\n <body>\n  <p>werwewer</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('9', '9', '<html>\n <head></head>\n <body>\n  <p>werwewer</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('10', '10', '<html>\n <head></head>\n <body>\n  <p>werwewer</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('11', '11', '<html>\n <head></head>\n <body>\n  <p>werwewer</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('12', '12', '<html>\n <head></head>\n <body>\n  <p>werwewer</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('13', '13', '<html>\n <head></head>\n <body>\n  <p>werwewer</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('14', '14', '<html>\n <head></head>\n <body>\n  <p>werwewer</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('15', '15', '<html>\n <head></head>\n <body>\n  <p><img alt=\"习近平在庆祝\" src=\"http://localhost:8080/cms-static/upload/2015-05/1430833349962.jpg\"></p> \n  <p>4月28日，2015年庆祝“五一”国际劳动节暨表彰全国劳动模范和先进工作者大会在北京人民大会堂隆重举行。中共中央总书记、国家主席、中央军委主席习近平发表重要讲话。 新华社记者 鞠鹏 摄</p> \n  <p>新华网北京4月28日电</p> \n  <p><strong>在庆祝“五一”国际劳动节暨表彰全国劳动模范和先进工作者大会上的讲话</strong></p> \n  <p>（2015年4月28日）</p> \n  <p>习近平</p> \n  <p>同志们：</p> \n  <p>今天，我们在这里隆重集会，纪念全世界工人阶级和劳动群众的盛大节日——“五一”国际劳动节，表彰全国劳动模范和先进工作者，目的是弘扬劳模精神，弘扬劳动精神，弘扬我国工人阶级和广大劳动群众的伟大品格。</p> \n  <p>首先，我代表党中央、国务院，向全国各族工人、农民、知识分子和其他各阶层劳动群众，向人民解放军指战员、武警部队官兵和公安民警，向香港同胞、澳门同胞、台湾同胞和海外侨胞，致以节日的祝贺！向为改革开放和社会主义现代化建设作出突出贡献的劳动模范和先进工作者，致以崇高的敬意！在这里，我代表中国工人阶级和广大劳动群众，向全世界工人阶级和广大劳动群众，致以诚挚的问候！</p> \n  <p>“五一”国际劳动节，是全世界劳动人民共同的节日。从恩格斯领导成立的第二国际明确将1890年5月1日定为第一个国际劳动节起，历史车轮已走过125年。我们党历来高度重视通过纪念“五一”国际劳动节，启发职工群众觉悟，教育引导劳动群众，团结带领工人阶级和广大劳动群众为民族独立、人民解放和国家富强、人民幸福而奋斗。新中国成立后，我国工人阶级成为国家的领导阶级，我国工人阶级和广大劳动群众成为国家的主人，我们纪念“五一”国际劳动节具有了新的时代意义。</p> \n  <p>我们所处的时代是催人奋进的伟大时代，我们进行的事业是前无古人的伟大事业，我们正在从事的中国特色社会主义事业是全体人民的共同事业。全面建成小康社会，进而建成富强民主文明和谐的社会主义现代化国家，根本上靠劳动、靠劳动者创造。因此，无论时代条件如何变化，我们始终都要崇尚劳动、尊重劳动者，始终重视发挥工人阶级和广大劳动群众的主力军作用。这就是我们今天纪念“五一”国际劳动节的重大意义。</p> \n  <p>同志们！</p> \n  <p>党的十八大以来，党中央从坚持和发展中国特色社会主义全局出发，提出并形成了全面建成小康社会、全面深化改革、全面依法治国、全面从严治党的战略布局，确立了新形势下党和国家各项工作的战略目标和战略举措，为实现“</p>\n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('16', '16', '<html>\n <head></head>\n <body>\n  <p><img alt=\"习近平在庆祝\" src=\"http://localhost:8080/cms-static/upload/2015-05/1430832179243.jpg\"></p> \n  <p>4月28日，2015年庆祝“五一”国际劳动节暨表彰全国劳动模范和先进工作者大会在北京人民大会堂隆重举行。中共中央总书记、国家主席、中央军委主席习近平发表重要讲话。 新华社记者 鞠鹏 摄</p> \n  <p>新华网北京4月28日电</p> \n  <p><strong>在庆祝“五一”国际劳动节暨表彰全国劳动模范和先进工作者大会上的讲话</strong></p> \n  <p>（2015年4月28日）</p> \n  <p>习近平</p> \n  <p>同志们：</p> \n  <p>今天，我们在这里隆重集会，纪念全世界工人阶级和劳动群众的盛大节日——“五一”国际劳动节，表彰全国劳动模范和先进工作者，目的是弘扬劳模精神，弘扬劳动精神，弘扬我国工人阶级和广大劳动群众的伟大品格。</p> \n  <p>首先，我代表党中央、国务院，向全国各族工人、农民、知识分子和其他各阶层劳动群众，向人民解放军指战员、武警部队官兵和公安民警，向香港同胞、澳门同胞、台湾同胞和海外侨胞，致以节日的祝贺！向为改革开放和社会主义现代化建设作出突出贡献的劳动模范和先进工作者，致以崇高的敬意！在这里，我代表中国工人阶级和广大劳动群众，向全世界工人阶级和广大劳动群众，致以诚挚的问候！</p> \n  <p>“五一”国际劳动节，是全世界劳动人民共同的节日。从恩格斯领导成立的第二国际明确将1890年5月1日定为第一个国际劳动节起，历史车轮已走过125年。我们党历来高度重视通过纪念“五一”国际劳动节，启发职工群众觉悟，教育引导劳动群众，团结带领工人阶级和广大劳动群众为民族独立、人民解放和国家富强、人民幸福而奋斗。新中国成立后，我国工人阶级成为国家的领导阶级，我国工人阶级和广大劳动群众成为国家的主人，我们纪念“五一”国际劳动节具有了新的时代意义。</p> \n  <p>我们所处的时代是催人奋进的伟大时代，我们进行的事业是前无古人的伟大事业，我们正在从事的中国特色社会主义事业是全体人民的共同事业。全面建成小康社会，进而建成富强民主文明和谐的社会主义现代化国家，根本上靠劳动、靠劳动者创造。因此，无论时代条件如何变化，我们始终都要崇尚劳动、尊重劳动者，始终重视发挥工人阶级和广大劳动群众的主力军作用。这就是我们今天纪念“五一”国际劳动节的重大意义。</p> \n  <p>同志们！</p> \n  <p>党的十八大以来，党中央从坚持和发展中国特色社会主义全局出发，提出并形成了全面建成小康社会、全面深化改革、全面依法治国、全面从严治党的战略布局，确立了新形势下党和国家各项工作的战略目标和战略举措，为实现“</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('17', '17', '<html>\n <head></head>\n <body>\n  <p><img alt=\"习近平在庆祝\" src=\"http://localhost:8080/cms-static/upload/2015-05/1430832183887.jpg\"></p> \n  <p>4月28日，2015年庆祝“五一”国际劳动节暨表彰全国劳动模范和先进工作者大会在北京人民大会堂隆重举行。中共中央总书记、国家主席、中央军委主席习近平发表重要讲话。 新华社记者 鞠鹏 摄</p> \n  <p>新华网北京4月28日电</p> \n  <p><strong>在庆祝“五一”国际劳动节暨表彰全国劳动模范和先进工作者大会上的讲话</strong></p> \n  <p>（2015年4月28日）</p> \n  <p>习近平</p> \n  <p>同志们：</p> \n  <p>今天，我们在这里隆重集会，纪念全世界工人阶级和劳动群众的盛大节日——“五一”国际劳动节，表彰全国劳动模范和先进工作者，目的是弘扬劳模精神，弘扬劳动精神，弘扬我国工人阶级和广大劳动群众的伟大品格。</p> \n  <p>首先，我代表党中央、国务院，向全国各族工人、农民、知识分子和其他各阶层劳动群众，向人民解放军指战员、武警部队官兵和公安民警，向香港同胞、澳门同胞、台湾同胞和海外侨胞，致以节日的祝贺！向为改革开放和社会主义现代化建设作出突出贡献的劳动模范和先进工作者，致以崇高的敬意！在这里，我代表中国工人阶级和广大劳动群众，向全世界工人阶级和广大劳动群众，致以诚挚的问候！</p> \n  <p>“五一”国际劳动节，是全世界劳动人民共同的节日。从恩格斯领导成立的第二国际明确将1890年5月1日定为第一个国际劳动节起，历史车轮已走过125年。我们党历来高度重视通过纪念“五一”国际劳动节，启发职工群众觉悟，教育引导劳动群众，团结带领工人阶级和广大劳动群众为民族独立、人民解放和国家富强、人民幸福而奋斗。新中国成立后，我国工人阶级成为国家的领导阶级，我国工人阶级和广大劳动群众成为国家的主人，我们纪念“五一”国际劳动节具有了新的时代意义。</p> \n  <p>我们所处的时代是催人奋进的伟大时代，我们进行的事业是前无古人的伟大事业，我们正在从事的中国特色社会主义事业是全体人民的共同事业。全面建成小康社会，进而建成富强民主文明和谐的社会主义现代化国家，根本上靠劳动、靠劳动者创造。因此，无论时代条件如何变化，我们始终都要崇尚劳动、尊重劳动者，始终重视发挥工人阶级和广大劳动群众的主力军作用。这就是我们今天纪念“五一”国际劳动节的重大意义。</p> \n  <p>同志们！</p> \n  <p>党的十八大以来，党中央从坚持和发展中国特色社会主义全局出发，提出并形成了全面建成小康社会、全面深化改革、全面依法治国、全面从严治党的战略布局，确立了新形势下党和国家各项工作的战略目标和战略举措，为实现“</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('18', '18', '<html>\n <head></head>\n <body>\n  <p>sdfasd</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('19', '19', '<html>\n <head></head>\n <body>\n  <p>sdfasddsfg</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('20', '20', '<html>\n <head></head>\n <body>\n  <p>sadfsfsd</p>\n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('21', '21', '<html>\n <head></head>\n <body>\n  <p>在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的</p>\n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('22', '22', '<html>\n <head></head>\n <body>\n  <p>阿方索地方</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('23', '23', '<html>\n <head></head>\n <body>\n  <p>阿方索地方</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('24', '24', '<html>\n <head></head>\n <body>\n  <p>阿方索地方</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('25', '25', '<html>\n <head></head>\n <body>\n  <p>阿方索地方</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('26', '26', '<html>\n <head></head>\n <body>\n  <p>阿方索地方在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的 在线充值现场阿萨上的啊上的萨芬冯绍峰三的发撒的</p>\n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('27', '27', '<html>\n <head></head>\n <body>\n  <p>撒大法师大法师法三的啊时代发生啊时代发上</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('28', '28', '<html>\n <head></head>\n <body>\n  <p>撒大法师大法师法三的啊时代发生啊时代发上阿斯顿发生</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('29', '29', '<html>\n <head></head>\n <body>\n  <p>啊手动阀士大夫啊手动阀是否</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('30', '30', '<html>\n <head></head>\n <body>\n  <p><img alt=\"\" src=\"http://localhost:8080/cms-static/upload/default/images/2QA0B3)2FM57%7DF%256VHL(%5B%60N.jpg\" style=\"height:853px; width:640px\">啊大法师法是否</p>\n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('31', '31', '<html>\n <head></head>\n <body>\n  <p>sdfsdfasdfads</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('32', '32', '<html>\n <head></head>\n <body>\n  <p>士大夫撒法撒</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('33', '33', '<html>\n <head></head>\n <body>\n  <p>啊读书法士大夫</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('34', '34', '<html>\n <head></head>\n <body>\n  <p>sdfsdf</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('35', '35', '<html>\n <head></head>\n <body>\n  <p>士大夫撒的发布版本</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('36', '36', '<html>\n <head></head>\n <body>\n  <p>撒电风扇地方上的</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('37', '37', '<html>\n <head></head>\n <body>\n  <p><strong>摘要</strong>: 据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机。Minwa 超级计算机通过扫描 ImageNet 取得了这一成绩，这是一 ...</p> \n  <p>据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机。</p> \n  <p><img alt=\"人工智能\" src=\"http://localhost:8080/cms-static/upload/2015-05/1432298786755.jpg\" style=\"height:214px; width:200px\"></p> \n  <p>Minwa 超级计算机通过扫描 ImageNet 取得了这一成绩，这是一个超过百万张图片的数据库，需要将其分类到1000个不同的类别里面。这意味着计算机需要学习法国面包和烤肉卷之间的区别，更棘手的是，甚至还要能区分来克兰小猎犬和猎狐犬之间的不同！（百度的 Minwa 包含36个服务器节点，每个节点由2个六核英特尔Xeon E5-2620处理器和4个NVIDIA Tesla K40m GPU构成。Minwa超级电脑有1.7TB设备内存和6.9TB主内存，今年初它在ImageNet测试中的错误率为5.98%。）</p> \n  <p>&nbsp;</p> \n  <p>在五年前，计算机在这方面想要超越人类似乎还很遥远，但是最近几个月以来，来自微软、谷歌，以及现在的百度的计算机已经能做的比人更好了。</p> \n  <p>&nbsp;</p> \n  <p>通过练习，人类能正确识别除了大约 5% 之外的所有 ImageNet 图片。而现在，微软已经取得了 4.94% 的错误率的成绩，谷歌达到了 4.8%，百度则表示它将错误率降到了 4.58%！</p> \n  <p>&nbsp;</p> \n  <p>百度和其它公司通过该测试所用的深度学习算法最近才从学术界飞跃到硅谷，但是它们已经开始在我们的日常生活中产生了影响。</p> \n  <p>&nbsp;</p> \n  <p>两年前，谷歌使用深度学习来大幅提升 Android 手机的语音识别系统。而百度则在使用一个更大的超级计算机来分析14000小时的语音数据，以提升它的中英文语音识别能力。</p> \n  <p>&nbsp;</p> \n  <p>“我对整个社区在计算机视觉方面取得的进展感到非常兴奋！” 百度首席科学家吴恩达说，“计算机能如此好的理解图像，不像一年前，它能做更多的事情了！”。</p> \n  <p>&nbsp;</p> \n  <p>在未来的18个月，百度计划打造一个更大的、计算能力可达 7Pflop/s 的超级计算机！虽然这比不上世界上最顶级的超级计算机，但是依然能够排进全球前十。</p> \n  <p>&nbsp;</p> \n  <p>深度学习站在了这项发展潮流的巅峰，越来越多的财大气粗的公司们雇佣顶尖的人工智能专家、积累庞大的数据、然后用大量的计算机资源来分析它们。</p> \n  <p>&nbsp;</p> \n  <p>“有趣的是，处理 ImageNet 图像排名前三的队伍无一例外的都是具有大量计算机资源的大型技术公司，”吴恩达说。他的公司设计这个超级计算机的技术来自中国及其硅谷实验室建造 Minwa 的经验，他补充道。</p> \n  <p>&nbsp;</p> \n  <p>来自 Facebook 的 Yann LeCun 领导着类似的团队，他说他的公司也在部署大型计算资源，不过他没有提到 Facebook 的计算机系统规模大小。</p> \n  <p>&nbsp;</p> \n  <p>对于深度计算方面的能力， 谷歌、微软和百度把 ImageNet 测试当做一个“基准测试”，Yann LeCun 说。人们越来越关注更大的数据集和更有挑战性的任务，比如，目标检测和定位等。</p> \n  <p>&nbsp;</p> \n  <p>（原文：http://blogs.wsj.com/digits/2015/05/12/baidu-leads-in-artificial-intelligence-benchmark/ &nbsp; 作者： ROBERT MCMILLAN</p> \n  <p>译文：LCTT https://linux.cn/article-5436-1.html &nbsp; &nbsp;译者： wxy）</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('38', '38', '<html>\n <head></head>\n <body>\n  <p><strong>摘要</strong>: 据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机。Minwa 超级计算机通过扫描 ImageNet 取得了这一成绩，这是一 ...</p> \n  <p>据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机。</p> \n  <p><img alt=\"人工智能\" src=\"http://localhost:8080/cms-static/upload/2015-05/1432298825758.jpg\" style=\"height:214px; width:200px\"></p> \n  <p>Minwa 超级计算机通过扫描 ImageNet 取得了这一成绩，这是一个超过百万张图片的数据库，需要将其分类到1000个不同的类别里面。这意味着计算机需要学习法国面包和烤肉卷之间的区别，更棘手的是，甚至还要能区分来克兰小猎犬和猎狐犬之间的不同！（百度的 Minwa 包含36个服务器节点，每个节点由2个六核英特尔Xeon E5-2620处理器和4个NVIDIA Tesla K40m GPU构成。Minwa超级电脑有1.7TB设备内存和6.9TB主内存，今年初它在ImageNet测试中的错误率为5.98%。）</p> \n  <p>&nbsp;</p> \n  <p>在五年前，计算机在这方面想要超越人类似乎还很遥远，但是最近几个月以来，来自微软、谷歌，以及现在的百度的计算机已经能做的比人更好了。</p> \n  <p>&nbsp;</p> \n  <p>通过练习，人类能正确识别除了大约 5% 之外的所有 ImageNet 图片。而现在，微软已经取得了 4.94% 的错误率的成绩，谷歌达到了 4.8%，百度则表示它将错误率降到了 4.58%！</p> \n  <p>&nbsp;</p> \n  <p>百度和其它公司通过该测试所用的深度学习算法最近才从学术界飞跃到硅谷，但是它们已经开始在我们的日常生活中产生了影响。</p> \n  <p>&nbsp;</p> \n  <p>两年前，谷歌使用深度学习来大幅提升 Android 手机的语音识别系统。而百度则在使用一个更大的超级计算机来分析14000小时的语音数据，以提升它的中英文语音识别能力。</p> \n  <p>&nbsp;</p> \n  <p>“我对整个社区在计算机视觉方面取得的进展感到非常兴奋！” 百度首席科学家吴恩达说，“计算机能如此好的理解图像，不像一年前，它能做更多的事情了！”。</p> \n  <p>&nbsp;</p> \n  <p>在未来的18个月，百度计划打造一个更大的、计算能力可达 7Pflop/s 的超级计算机！虽然这比不上世界上最顶级的超级计算机，但是依然能够排进全球前十。</p> \n  <p>&nbsp;</p> \n  <p>深度学习站在了这项发展潮流的巅峰，越来越多的财大气粗的公司们雇佣顶尖的人工智能专家、积累庞大的数据、然后用大量的计算机资源来分析它们。</p> \n  <p>&nbsp;</p> \n  <p>“有趣的是，处理 ImageNet 图像排名前三的队伍无一例外的都是具有大量计算机资源的大型技术公司，”吴恩达说。他的公司设计这个超级计算机的技术来自中国及其硅谷实验室建造 Minwa 的经验，他补充道。</p> \n  <p>&nbsp;</p> \n  <p>来自 Facebook 的 Yann LeCun 领导着类似的团队，他说他的公司也在部署大型计算资源，不过他没有提到 Facebook 的计算机系统规模大小。</p> \n  <p>&nbsp;</p> \n  <p>对于深度计算方面的能力， 谷歌、微软和百度把 ImageNet 测试当做一个“基准测试”，Yann LeCun 说。人们越来越关注更大的数据集和更有挑战性的任务，比如，目标检测和定位等。</p> \n  <p>&nbsp;</p> \n  <p>（原文：http://blogs.wsj.com/digits/2015/05/12/baidu-leads-in-artificial-intelligence-benchmark/ &nbsp; 作者： ROBERT MCMILLAN</p> \n  <p>译文：LCTT https://linux.cn/article-5436-1.html &nbsp; &nbsp;译者： wxy）</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('39', '39', '<html>\n <head></head>\n <body>\n  <p><strong>摘要</strong>: 据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机。Minwa 超级计算机通过扫描 ImageNet 取得了这一成绩，这是一 ...</p> \n  <p>据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机。</p> \n  <p><img alt=\"人工智能\" src=\"http://localhost:8080/cms-static/upload/2015-05/1432298977152.jpg\" style=\"height:214px; width:200px\"></p> \n  <p>Minwa 超级计算机通过扫描 ImageNet 取得了这一成绩，这是一个超过百万张图片的数据库，需要将其分类到1000个不同的类别里面。这意味着计算机需要学习法国面包和烤肉卷之间的区别，更棘手的是，甚至还要能区分来克兰小猎犬和猎狐犬之间的不同！（百度的 Minwa 包含36个服务器节点，每个节点由2个六核英特尔Xeon E5-2620处理器和4个NVIDIA Tesla K40m GPU构成。Minwa超级电脑有1.7TB设备内存和6.9TB主内存，今年初它在ImageNet测试中的错误率为5.98%。）</p> \n  <p>&nbsp;</p> \n  <p>在五年前，计算机在这方面想要超越人类似乎还很遥远，但是最近几个月以来，来自微软、谷歌，以及现在的百度的计算机已经能做的比人更好了。</p> \n  <p>&nbsp;</p> \n  <p>通过练习，人类能正确识别除了大约 5% 之外的所有 ImageNet 图片。而现在，微软已经取得了 4.94% 的错误率的成绩，谷歌达到了 4.8%，百度则表示它将错误率降到了 4.58%！</p> \n  <p>&nbsp;</p> \n  <p>百度和其它公司通过该测试所用的深度学习算法最近才从学术界飞跃到硅谷，但是它们已经开始在我们的日常生活中产生了影响。</p> \n  <p>&nbsp;</p> \n  <p>两年前，谷歌使用深度学习来大幅提升 Android 手机的语音识别系统。而百度则在使用一个更大的超级计算机来分析14000小时的语音数据，以提升它的中英文语音识别能力。</p> \n  <p>&nbsp;</p> \n  <p>“我对整个社区在计算机视觉方面取得的进展感到非常兴奋！” 百度首席科学家吴恩达说，“计算机能如此好的理解图像，不像一年前，它能做更多的事情了！”。</p> \n  <p>&nbsp;</p> \n  <p>在未来的18个月，百度计划打造一个更大的、计算能力可达 7Pflop/s 的超级计算机！虽然这比不上世界上最顶级的超级计算机，但是依然能够排进全球前十。</p> \n  <p>&nbsp;</p> \n  <p>深度学习站在了这项发展潮流的巅峰，越来越多的财大气粗的公司们雇佣顶尖的人工智能专家、积累庞大的数据、然后用大量的计算机资源来分析它们。</p> \n  <p>&nbsp;</p> \n  <p>“有趣的是，处理 ImageNet 图像排名前三的队伍无一例外的都是具有大量计算机资源的大型技术公司，”吴恩达说。他的公司设计这个超级计算机的技术来自中国及其硅谷实验室建造 Minwa 的经验，他补充道。</p> \n  <p>&nbsp;</p> \n  <p>来自 Facebook 的 Yann LeCun 领导着类似的团队，他说他的公司也在部署大型计算资源，不过他没有提到 Facebook 的计算机系统规模大小。</p> \n  <p>&nbsp;</p> \n  <p>对于深度计算方面的能力， 谷歌、微软和百度把 ImageNet 测试当做一个“基准测试”，Yann LeCun 说。人们越来越关注更大的数据集和更有挑战性的任务，比如，目标检测和定位等。</p> \n  <p>&nbsp;</p> \n  <p>（原文：http://blogs.wsj.com/digits/2015/05/12/baidu-leads-in-artificial-intelligence-benchmark/ &nbsp; 作者： ROBERT MCMILLAN</p> \n  <p>译文：LCTT https://linux.cn/article-5436-1.html &nbsp; &nbsp;译者： wxy）</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('40', '40', '<html>\n <head></head>\n <body>\n  <p><strong>摘要</strong>: 据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机。Minwa 超级计算机通过扫描 ImageNet 取得了这一成绩，这是一 ...</p> \n  <p>据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机。</p> \n  <p><img alt=\"人工智能\" src=\"http://localhost:8080/cms-static/upload/2015-05/1432300337258.jpg\" style=\"height:214px; width:200px\"></p> \n  <p>Minwa 超级计算机通过扫描 ImageNet 取得了这一成绩，这是一个超过百万张图片的数据库，需要将其分类到1000个不同的类别里面。这意味着计算机需要学习法国面包和烤肉卷之间的区别，更棘手的是，甚至还要能区分来克兰小猎犬和猎狐犬之间的不同！（百度的 Minwa 包含36个服务器节点，每个节点由2个六核英特尔Xeon E5-2620处理器和4个NVIDIA Tesla K40m GPU构成。Minwa超级电脑有1.7TB设备内存和6.9TB主内存，今年初它在ImageNet测试中的错误率为5.98%。）</p> \n  <p>&nbsp;</p> \n  <p>在五年前，计算机在这方面想要超越人类似乎还很遥远，但是最近几个月以来，来自微软、谷歌，以及现在的百度的计算机已经能做的比人更好了。</p> \n  <p>&nbsp;</p> \n  <p>通过练习，人类能正确识别除了大约 5% 之外的所有 ImageNet 图片。而现在，微软已经取得了 4.94% 的错误率的成绩，谷歌达到了 4.8%，百度则表示它将错误率降到了 4.58%！</p> \n  <p>&nbsp;</p> \n  <p>百度和其它公司通过该测试所用的深度学习算法最近才从学术界飞跃到硅谷，但是它们已经开始在我们的日常生活中产生了影响。</p> \n  <p>&nbsp;</p> \n  <p>两年前，谷歌使用深度学习来大幅提升 Android 手机的语音识别系统。而百度则在使用一个更大的超级计算机来分析14000小时的语音数据，以提升它的中英文语音识别能力。</p> \n  <p>&nbsp;</p> \n  <p>“我对整个社区在计算机视觉方面取得的进展感到非常兴奋！” 百度首席科学家吴恩达说，“计算机能如此好的理解图像，不像一年前，它能做更多的事情了！”。</p> \n  <p>&nbsp;</p> \n  <p>在未来的18个月，百度计划打造一个更大的、计算能力可达 7Pflop/s 的超级计算机！虽然这比不上世界上最顶级的超级计算机，但是依然能够排进全球前十。</p> \n  <p>&nbsp;</p> \n  <p>深度学习站在了这项发展潮流的巅峰，越来越多的财大气粗的公司们雇佣顶尖的人工智能专家、积累庞大的数据、然后用大量的计算机资源来分析它们。</p> \n  <p>&nbsp;</p> \n  <p>“有趣的是，处理 ImageNet 图像排名前三的队伍无一例外的都是具有大量计算机资源的大型技术公司，”吴恩达说。他的公司设计这个超级计算机的技术来自中国及其硅谷实验室建造 Minwa 的经验，他补充道。</p> \n  <p>&nbsp;</p> \n  <p>来自 Facebook 的 Yann LeCun 领导着类似的团队，他说他的公司也在部署大型计算资源，不过他没有提到 Facebook 的计算机系统规模大小。</p> \n  <p>&nbsp;</p> \n  <p>对于深度计算方面的能力， 谷歌、微软和百度把 ImageNet 测试当做一个“基准测试”，Yann LeCun 说。人们越来越关注更大的数据集和更有挑战性的任务，比如，目标检测和定位等。</p> \n  <p>&nbsp;</p> \n  <p>（原文：http://blogs.wsj.com/digits/2015/05/12/baidu-leads-in-artificial-intelligence-benchmark/ &nbsp; 作者： ROBERT MCMILLAN</p> \n  <p>译文：LCTT https://linux.cn/article-5436-1.html &nbsp; &nbsp;译者： wxy）</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('41', '41', '<html>\n <head></head>\n <body>\n  <p><strong>摘要</strong>: 据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机。Minwa 超级计算机通过扫描 ImageNet 取得了这一成绩，这是一 ...</p> \n  <p>据《华尔街日报》报道，百度公司发布消息称，它取得了近来备受关注的人工智能基准测试的全球最好成绩。这归功于百度研发的秘密武器： Minwa 超级计算机。</p> \n  <p>&nbsp;</p> \n  <p>Minwa 超级计算机通过扫描 ImageNet 取得了这一成绩，这是一个超过百万张图片的数据库，需要将其分类到1000个不同的类别里面。这意味着计算机需要学习法国面包和烤肉卷之间的区别，更棘手的是，甚至还要能区分来克兰小猎犬和猎狐犬之间的不同！（百度的 Minwa 包含36个服务器节点，每个节点由2个六核英特尔Xeon E5-2620处理器和4个NVIDIA Tesla K40m GPU构成。Minwa超级电脑有1.7TB设备内存和6.9TB主内存，今年初它在ImageNet测试中的错误率为5.98%。）</p> \n  <p>&nbsp;</p> \n  <p>在五年前，计算机在这方面想要超越人类似乎还很遥远，但是最近几个月以来，来自微软、谷歌，以及现在的百度的计算机已经能做的比人更好了。</p> \n  <p>&nbsp;</p> \n  <p>通过练习，人类能正确识别除了大约 5% 之外的所有 ImageNet 图片。而现在，微软已经取得了 4.94% 的错误率的成绩，谷歌达到了 4.8%，百度则表示它将错误率降到了 4.58%！</p> \n  <p>&nbsp;</p> \n  <p>百度和其它公司通过该测试所用的深度学习算法最近才从学术界飞跃到硅谷，但是它们已经开始在我们的日常生活中产生了影响。</p> \n  <p>&nbsp;</p> \n  <p>两年前，谷歌使用深度学习来大幅提升 Android 手机的语音识别系统。而百度则在使用一个更大的超级计算机来分析14000小时的语音数据，以提升它的中英文语音识别能力。</p> \n  <p>&nbsp;</p> \n  <p>“我对整个社区在计算机视觉方面取得的进展感到非常兴奋！” 百度首席科学家吴恩达说，“计算机能如此好的理解图像，不像一年前，它能做更多的事情了！”。</p> \n  <p>&nbsp;</p> \n  <p>在未来的18个月，百度计划打造一个更大的、计算能力可达 7Pflop/s 的超级计算机！虽然这比不上世界上最顶级的超级计算机，但是依然能够排进全球前十。</p> \n  <p>&nbsp;</p> \n  <p>深度学习站在了这项发展潮流的巅峰，越来越多的财大气粗的公司们雇佣顶尖的人工智能专家、积累庞大的数据、然后用大量的计算机资源来分析它们。</p> \n  <p>&nbsp;</p> \n  <p>“有趣的是，处理 ImageNet 图像排名前三的队伍无一例外的都是具有大量计算机资源的大型技术公司，”吴恩达说。他的公司设计这个超级计算机的技术来自中国及其硅谷实验室建造 Minwa 的经验，他补充道。</p> \n  <p>&nbsp;</p> \n  <p>来自 Facebook 的 Yann LeCun 领导着类似的团队，他说他的公司也在部署大型计算资源，不过他没有提到 Facebook 的计算机系统规模大小。</p> \n  <p>&nbsp;</p> \n  <p>对于深度计算方面的能力， 谷歌、微软和百度把 ImageNet 测试当做一个“基准测试”，Yann LeCun 说。人们越来越关注更大的数据集和更有挑战性的任务，比如，目标检测和定位等。</p> \n  <p>&nbsp;</p> \n  <p>（原文：http://blogs.wsj.com/digits/2015/05/12/baidu-leads-in-artificial-intelligence-benchmark/ &nbsp; 作者： ROBERT MCMILLAN</p> \n  <p>译文：LCTT https://linux.cn/article-5436-1.html &nbsp; &nbsp;译者： wxy）</p>\n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('42', '42', '<html>\n <head></head>\n <body>\n  <p>3453453</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('43', '43', '<html>\n <head></head>\n <body>\n  <p>3232</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('44', '44', '<html>\n <head></head>\n <body>\n  <p>werwer</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('45', '45', '<html>\n <head></head>\n <body>\n  <p>sdfasf</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('46', '46', '<html>\n <head></head>\n <body>\n  <p>sdf</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('47', '47', '<html>\n <head></head>\n <body>\n  <p>werwer</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('48', '48', '<html>\n <head></head>\n <body>\n  <p>werwer</p>\n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('49', '49', '<html>\n <head></head>\n <body>\n  <p>sdfsdf</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('50', '50', '<html>\n <head></head>\n <body>\n  <p>sdfsdf</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('51', '51', '<html>\n <head></head>\n <body>\n  <p>sdf</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('52', '52', '<html>\n <head></head>\n <body>\n  <p>sfsdf</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('53', '53', '<html>\n <head></head>\n <body>\n  <p>sdfsdf</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('54', '54', '<html>\n <head></head>\n <body>\n  <p>sdaf</p>\n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('55', '55', '<html>\n <head></head>\n <body>\n  <p>sddfasddfasfasdasdfsdfsdfsfsfsdfsdsdfsdf</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('56', '56', '<html>\n <head></head>\n <body>\n  <p>sdfsdfdsf</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('57', '57', '<html>\n <head></head>\n <body>\n  <p>werwerwe</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('58', '58', '<html>\n <head></head>\n <body>\n  <p>33333333333</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('59', '59', '<html>\n <head></head>\n <body>\n  <p>werwe</p> \n </body>\n</html>', null);
INSERT INTO `cont_content_body` VALUES ('60', '60', '<p>werwerwerwe</p>', null);
INSERT INTO `cont_content_body` VALUES ('61', '61', '<p>wer</p>', null);
INSERT INTO `cont_content_body` VALUES ('62', '62', '<p>erter</p>', null);
INSERT INTO `cont_content_body` VALUES ('63', '63', '<p>rttytrtuytu</p>', null);
INSERT INTO `cont_content_body` VALUES ('64', '64', '<p>rttyrty</p>', null);
INSERT INTO `cont_content_body` VALUES ('65', '65', '<p>sdfsdfs</p>', null);
INSERT INTO `cont_content_body` VALUES ('66', '66', '<p>dfgdfg</p>', null);
INSERT INTO `cont_content_body` VALUES ('67', '67', '<p>dfgdsfg</p>', null);
INSERT INTO `cont_content_body` VALUES ('68', '68', '<p>ertwer</p>', null);
INSERT INTO `cont_content_body` VALUES ('69', '69', '<p>sdfgsdfgsdf</p>', null);
INSERT INTO `cont_content_body` VALUES ('70', '70', '<p>sdfgsdfg</p>', null);
INSERT INTO `cont_content_body` VALUES ('71', '71', '<p>cvbcv</p>', null);
INSERT INTO `cont_content_body` VALUES ('72', '72', '<p>xcvbxcvb</p>', null);
INSERT INTO `cont_content_body` VALUES ('73', '73', '<p>cvbcv</p>', null);
INSERT INTO `cont_content_body` VALUES ('74', '74', '<p>xcvbxcv</p>', null);
INSERT INTO `cont_content_body` VALUES ('75', '75', '<p>xvbxcvb</p>', null);
INSERT INTO `cont_content_body` VALUES ('76', '76', '<p>xvcbxcvb</p>', null);
INSERT INTO `cont_content_body` VALUES ('77', '77', '<p>xcvbxcvb</p>', null);
INSERT INTO `cont_content_body` VALUES ('78', '78', '<p>xcvbxcvb</p>', null);
INSERT INTO `cont_content_body` VALUES ('79', '79', '<p>xcvbxcvbxcv</p>', null);
INSERT INTO `cont_content_body` VALUES ('80', '80', '<p>xcvbcxvb</p>', null);
INSERT INTO `cont_content_body` VALUES ('81', '81', '<p>sdfsdfsda</p>', null);
INSERT INTO `cont_content_body` VALUES ('82', '82', '<p>sdfsdfsd</p>', null);
INSERT INTO `cont_content_body` VALUES ('83', '83', '<p>sddfsdfsdf</p>', null);
INSERT INTO `cont_content_body` VALUES ('84', '84', '<p>sdfsdfsd</p>', null);
INSERT INTO `cont_content_body` VALUES ('85', '85', '<p>sdfsdfsd</p>', null);
INSERT INTO `cont_content_body` VALUES ('86', '86', '<p>sdfsadfasd</p>', null);
INSERT INTO `cont_content_body` VALUES ('87', '87', '<p>adfasd</p>', null);
INSERT INTO `cont_content_body` VALUES ('88', '88', '<p>sdfsdf</p>', null);
INSERT INTO `cont_content_body` VALUES ('89', '89', '<p>sdf</p>', null);
INSERT INTO `cont_content_body` VALUES ('90', '90', '<p>sdfasdd</p>', null);
INSERT INTO `cont_content_body` VALUES ('91', '91', '<p>sfa</p>', null);
INSERT INTO `cont_content_body` VALUES ('92', '92', '<p>adsfsda</p>', null);
INSERT INTO `cont_content_body` VALUES ('93', '93', '<p>sdfsda</p>', null);
INSERT INTO `cont_content_body` VALUES ('94', '94', '<p>sfaasd</p>', null);
INSERT INTO `cont_content_body` VALUES ('95', '95', '<p>sdadfsdaf</p>', null);
INSERT INTO `cont_content_body` VALUES ('96', '96', '<p>sdfsdf</p>', null);
INSERT INTO `cont_content_body` VALUES ('97', '97', '<p>sdfsadfsd</p>', null);
INSERT INTO `cont_content_body` VALUES ('98', '98', '<p>sdfsdfsdfsd</p>', null);
INSERT INTO `cont_content_body` VALUES ('99', '99', '<p>fasdfadsfads</p>', null);
INSERT INTO `cont_content_body` VALUES ('100', '100', '<p>sadfasdfasdf</p>', null);
INSERT INTO `cont_content_body` VALUES ('101', '101', '<p>dsafasdfasd</p>', null);
INSERT INTO `cont_content_body` VALUES ('102', '102', '<p>adfsdafsad</p>', null);
INSERT INTO `cont_content_body` VALUES ('103', '103', '<p>dsfasdfasdf</p>', null);
INSERT INTO `cont_content_body` VALUES ('104', '104', '<p>dasfasdfasd</p>', null);
INSERT INTO `cont_content_body` VALUES ('105', '105', '<p>sdafasdf</p>', null);
INSERT INTO `cont_content_body` VALUES ('106', '106', '<p>dsfsdaf</p>', null);
INSERT INTO `cont_content_body` VALUES ('107', '107', '<p>asdfasdfasdf</p>', null);
INSERT INTO `cont_content_body` VALUES ('108', '108', '<p>asdfasdfadsf</p>', null);
INSERT INTO `cont_content_body` VALUES ('109', '109', '<p><strong>国总统巴拉克·奥巴马(Barack Obama) 400000美元</strong></p>\n<p style=\"text-align: center;\">&nbsp;</p>\n<div class=\"detail-img-wp\"> \n <div class=\"detail-img-in\">\n  <strong><img src=\"http://localhost:8080/cms-static/upload/2015-05/1432821870381.jpg\" style=\"height:301px; width:440px\" alt=\"\"></strong>\n </div> \n</div>\n<p>&nbsp;</p>\n<p>美国第44任总统巴拉克·奥巴马（Barack Obama）的基本工资是400000美元一年。他还获得50000美元年度费用帐户，100000美元非税旅行账户，和19000美元娱乐费用。</p>', null);
INSERT INTO `cont_content_body` VALUES ('110', '110', '<p><strong>国总统巴拉克·奥巴马(Barack Obama) 400000美元</strong></p>\n<p style=\"text-align: center;\">&nbsp;</p>\n<div class=\"detail-img-wp\"> \n <div class=\"detail-img-in\">\n  <strong><img alt=\"\" src=\"http://localhost:8080/cms-static/upload/2015-05/1432821903513.jpg\" style=\"height:301px; width:440px\"></strong>\n </div> \n</div>\n<p>&nbsp;</p>\n<p>美国第44任总统巴拉克·奥巴马（Barack Obama）的基本工资是400000美元一年。他还获得50000美元年度费用帐户，100000美元非税旅行账户，和19000美元娱乐费用。</p>', null);
INSERT INTO `cont_content_body` VALUES ('111', '111', '<p>YARN是开源项目Hadoop的一个资源管理系统，最初设计是为了解决Hadoop中MapReduce计算框架中的资源管理问题，但是现在它已经是一个更加通用的资源管理系统，可以把MapReduce计算框架作为一个应用程序运行在YARN系统之上，通过YARN来管理资源。如果你的应用程序也需要借助YARN的资源管理功能，你也可以实现YARN提供的编程API，将你的应用程序运行于YARN之上，将资源的分配与回收统一交给YARN去管理，可以大大简化资源管理功能的开发。当前，也有很多应用程序已经可以构建于YARN之上，如Storm、Spark等计算框架。</p>\n<p><strong>YARN整体架构</strong></p>\n<p>YARN是基于Master/Slave模式的分布式架构，我们先看一下，YARN的架构设计，如图所示（来自官网文档）：<br> <img alt=\"yarn-high-level-architecture\" src=\"http://shiyanjun.cn/wp-content/uploads/2015/06/yarn-high-level-architecture.png\" style=\"height:396px; width:498px\"><br> 上图，从逻辑上定义了YARN系统的核心组件和主要交互流程，各个组件说明如下：</p>\n<ul> \n <li>YARN Client</li> \n</ul>\n<p>YARN Client提交Application到RM，它会首先创建一个Application上下文件对象，并设置AM必需的资源请求信息，然后提交到RM。YARN Client也可以与RM通信，获取到一个已经提交并运行的Application的状态信息等，具体详见后面ApplicationClientProtocol协议的分析说明。</p>\n<ul> \n <li>ResourceManager（RM）</li> \n</ul>\n<p>RM是YARN集群的Master，负责管理整个集群的资源和资源分配。RM作为集群资源的管理和调度的角色，如果存在单点故障，则整个集群的资源都无法使用。在2.4.0版本才新增了RM HA的特性，这样就增加了RM的可用性。</p>\n<ul> \n <li>NodeManager（NM）</li> \n</ul>\n<p>NM是YARN集群的Slave，是集群中实际拥有实际资源的工作节点。我们提交Job以后，会将组成Job的多个Task调度到对应的NM上进行执行。Hadoop集群中，为了获得分布式计算中的Locality特性，会将DN和NM在同一个节点上运行，这样对应的HDFS上的Block可能就在本地，而无需在网络间进行数据的传输。</p>\n<ul> \n <li>Container</li> \n</ul>\n<p>Container是YARN集群中资源的抽象，将NM上的资源进行量化，根据需要组装成一个个Container，然后服务于已授权资源的计算任务。计算任务在完成计算后，系统会回收资源，以供后续计算任务申请使用。Container包含两种资源：内存和CPU，后续Hadoop版本可能会增加硬盘、网络等资源。</p>\n<ul> \n <li>ApplicationMaster（AM）</li> \n</ul>\n<p>AM主要管理和监控部署在YARN集群上的Application，以MapReduce为例，MapReduce Application是一个用来处理MapReduce计算的服务框架程序，为用户编写的MapReduce程序提供运行时支持。通常我们在编写的一个MapReduce程序可能包含多个Map Task或Reduce Task，而各个Task的运行管理与监控都是由这个MapReduce Application来负责，比如运行Task的资源申请，由AM向RM申请；启动/停止NM上某Task的对应的Container，由AM向NM请求来完成。</p>\n<p>下面，我们基于Hadoop 2.6.0的YARN源码，来探讨YARN内部实现原理。</p>\n<p><strong>YARN协议</strong></p>\n<p>YARN是一个分布式资源管理系统，它包含了分布的多个组件，我们可以通过这些组件之间设计的交互协议来说明，如图所示：<br> <img alt=\"yarn-protocols\" src=\"http://shiyanjun.cn/wp-content/uploads/2015/06/yarn-protocols.png\" style=\"height:526px; width:876px\"><br> 下面我们来详细看看各个协议实现的功能：</p>\n<ul> \n <li>ApplicationClientProtocol（Client -&gt; RM）</li> \n</ul>\n<table border=\"1\" cellpadding=\"2\" cellspacing=\"0\" style=\"border:thin solid rgb(134, 134, 134); width:100%\"> \n <tbody> \n  <tr> \n   <td style=\"width: 30%; text-align: center;\"><strong>协议方法</strong></td> \n   <td style=\"width: 70%; text-align: center;\"><strong>功能描述</strong></td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getNewApplication</td> \n   <td style=\"width: 70%;\">获取一个新的ApplicationId，例如返回的ApplicationId为application_1418024756741</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">submitApplication</td> \n   <td style=\"width: 70%;\">提交一个Application到RM</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">forceKillApplication</td> \n   <td style=\"width: 70%;\">终止一个已经提交的Application</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getApplicationReport</td> \n   <td style=\"width: 70%;\">获取一个Application的状态报告信息ApplicationReport，包括用户、队列、名称、AM所在节点、AM的RPC端口、跟踪URL、AM状态、诊断信息（如果出错的话）、启动时间、提交Application的Client（如果启用安全策略）</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getClusterMetrics</td> \n   <td style=\"width: 70%;\">获取YARN集群信息，如节点数量</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getApplications</td> \n   <td style=\"width: 70%;\">获取Application状态报告信息，和getApplicationReport类似，只不过增加了过滤器功能</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getClusterNodes</td> \n   <td style=\"width: 70%;\">获取集群内所有节点的状态报告信息</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getQueueInfo</td> \n   <td style=\"width: 70%;\">获取队列信息</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getQueueUserAcls</td> \n   <td style=\"width: 70%;\">获取当前用户的队列ACL信息</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getDelegationToken</td> \n   <td style=\"width: 70%;\">获取访问令牌信息，用于Container与RM端服务交互</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">renewDelegationToken</td> \n   <td style=\"width: 70%;\">更新已存在的访问令牌信息</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">cancelDelegationToken</td> \n   <td style=\"width: 70%;\">取消访问令牌</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">moveApplicationAcrossQueues</td> \n   <td style=\"width: 70%;\">将Application移动到另一个队列中</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getApplicationAttemptReport</td> \n   <td style=\"width: 70%;\">获取Application Attempt状态报告信息ApplicationAttemptReport</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getApplicationAttemptReport</td> \n   <td style=\"width: 70%;\">获取Application Attempt状态报告信息，和getApplicationAttemptReport类似，只不过增加了过滤器功能</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getContainerReport</td> \n   <td style=\"width: 70%;\">根据ContainerId获取Container状态报告信息ContainerReport，例如Container名称为container_e17_1410901177871_0001_01_000005，各个段的含义：container_e&lt;epoch&gt;_&lt;clusterTimestamp&gt;_&lt;appId&gt;_&lt;attemptId&gt;_&lt;containerId&gt;</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getContainers</td> \n   <td style=\"width: 70%;\">根据ApplicationAttemptId获取一个Application Attempt所使用的Container的状态报告信息，例如Container名称为container_1410901177871_0001_01_000005</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">submitReservation</td> \n   <td style=\"width: 70%;\">预定资源，以备在特殊情况下能够从集群获取到资源来运行程序，例如预留出资源供AM启动</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">updateReservation</td> \n   <td style=\"width: 70%;\">更新预定资源</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">deleteReservation</td> \n   <td style=\"width: 70%;\">删除预定</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getNodeToLabels</td> \n   <td style=\"width: 70%;\">获取节点对应的Label集合</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getClusterNodeLabels</td> \n   <td style=\"width: 70%;\">获取集群中所有节点的Label</td> \n  </tr> \n </tbody> \n</table>\n<ul> \n <li>ResourceTracker（NM -&gt; RM）</li> \n</ul>\n<table border=\"1\" cellpadding=\"2\" cellspacing=\"0\" style=\"border:thin solid rgb(134, 134, 134); width:100%\"> \n <tbody> \n  <tr> \n   <td style=\"width: 30%; text-align: center;\"><strong>协议方法</strong></td> \n   <td style=\"width: 70%; text-align: center;\"><strong>功能描述</strong></td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">registerNodeManager</td> \n   <td style=\"width: 70%;\">NM向RM注册</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">nodeHeartbeat</td> \n   <td style=\"width: 70%;\">NM向RM发送心跳状态报告</td> \n  </tr> \n </tbody> \n</table>\n<ul> \n <li>ApplicationMasterProtocol（AM -&gt; RM）</li> \n</ul>\n<table border=\"1\" cellpadding=\"2\" cellspacing=\"0\" style=\"border:thin solid rgb(134, 134, 134); width:100%\"> \n <tbody> \n  <tr> \n   <td style=\"width: 30%; text-align: center;\"><strong>协议方法</strong></td> \n   <td style=\"width: 70%; text-align: center;\"><strong>功能描述</strong></td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">registerApplicationMaster</td> \n   <td style=\"width: 70%;\">AM向RM注册</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">finishApplicationMaster</td> \n   <td style=\"width: 70%;\">AM通知RM已经完成（成功/失败）</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">allocate</td> \n   <td style=\"width: 70%;\">AM向RM申请资源</td> \n  </tr> \n </tbody> \n</table>\n<ul> \n <li>ContainerManagementProtocol（AM -&gt; NM）</li> \n</ul>\n<table border=\"1\" cellpadding=\"2\" cellspacing=\"0\" style=\"border:thin solid rgb(134, 134, 134); width:100%\"> \n <tbody> \n  <tr> \n   <td style=\"width: 30%; text-align: center;\"><strong>协议方法</strong></td> \n   <td style=\"width: 70%; text-align: center;\"><strong>功能描述</strong></td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">startContainers</td> \n   <td style=\"width: 70%;\">M向NM请求启动Container</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">stopContainers</td> \n   <td style=\"width: 70%;\">AM向NM请求停止Container</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getContainerStatuses</td> \n   <td style=\"width: 70%;\">AM向NM请求查询当前Container的状态</td> \n  </tr> \n </tbody> \n</table>\n<ul> \n <li>ResourceManagerAdministrationProtocol（RM Admin -&gt; RM）</li> \n</ul>\n<table border=\"1\" cellpadding=\"2\" cellspacing=\"0\" style=\"border:thin solid rgb(134, 134, 134); width:100%\"> \n <tbody> \n  <tr> \n   <td style=\"width: 30%; text-align: center;\"><strong>协议方法</strong></td> \n   <td style=\"width: 70%; text-align: center;\"><strong>功能描述</strong></td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getGroupsForUser</td> \n   <td style=\"width: 70%;\">获取用户所在用户组，该协议继承自GetUserMappingsProtocol</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">refreshQueues</td> \n   <td style=\"width: 70%;\">刷新队列配置</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">refreshNodes</td> \n   <td style=\"width: 70%;\">刷新节点配置</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">refreshSuperUserGroupsConfiguration</td> \n   <td style=\"width: 70%;\">刷新超级用户组配置</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">refreshUserToGroupsMappings</td> \n   <td style=\"width: 70%;\">刷新用户-&gt;用户组映射信息</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">refreshAdminAcls</td> \n   <td style=\"width: 70%;\">刷新Admin的ACL信息</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">refreshServiceAcls</td> \n   <td style=\"width: 70%;\">刷新服务级别信息（SLA）</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">updateNodeResource</td> \n   <td style=\"width: 70%;\">更新在RM端维护的RMNode资源信息</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">addToClusterNodeLabels</td> \n   <td style=\"width: 70%;\">向集群中节点添加Label</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">removeFromClusterNodeLabels</td> \n   <td style=\"width: 70%;\">移除集群中节点Label</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">replaceLabelsOnNode</td> \n   <td style=\"width: 70%;\">替换集群中节点Label</td> \n  </tr> \n </tbody> \n</table>\n<ul> \n <li>HAServiceProtocol（Active RM HA Framework Standby RM）</li> \n</ul>\n<table border=\"1\" cellpadding=\"2\" cellspacing=\"0\" style=\"border:thin solid rgb(134, 134, 134); width:100%\"> \n <tbody> \n  <tr> \n   <td style=\"width: 30%; text-align: center;\"><strong>协议方法</strong></td> \n   <td style=\"width: 70%; text-align: center;\"><strong>功能描述</strong></td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">monitorHealth</td> \n   <td style=\"width: 70%;\">HA Framework监控服务的健康状态</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">transitionToActive</td> \n   <td style=\"width: 70%;\">使RM转移到Active状态</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">transitionToStandby</td> \n   <td style=\"width: 70%;\">使RM转移到Standby状态</td> \n  </tr> \n  <tr> \n   <td style=\"width: 30%;\">getServiceStatus</td> \n   <td style=\"width: 70%;\">获取服务状态信息</td> \n  </tr> \n </tbody> \n</table>\n<p><strong>YARN RPC实现</strong></p>\n<p>1.X版本的Hadoop使用默认实现的Writable协议作为RPC协议，而在2.X版本，重写了RPC框架，改成默认使用Protobuf协议作为Hadoop的默认RPC通信协议。 YARN RPC的实现，如下面类图所示：<br> <img alt=\"yarn-rpc\" src=\"http://shiyanjun.cn/wp-content/uploads/2015/06/yarn-rpc.png\" style=\"height:545px; width:857px\"><br> 通过上图可以看出，RpcEngine有两个实现：WritableRpcEngine和ProtobufRpcEngine，默认使用ProtobufRpcEngine，我们可以选择使用1.X默认的RPC通信协议，甚至可以自定义实现。</p>\n<p><strong>ResourceManager内部原理</strong></p>\n<p>RM是YARN分布式系统的主节点，ResourceManager服务进程内部有很多组件提供其他服务，包括对外RPC服务，已经维护内部一些对象状态的服务等，RM的内部结构如图所示：<br> <img alt=\"yarn-rm-internal-architecture\" src=\"http://shiyanjun.cn/wp-content/uploads/2015/06/yarn-rm-internal-architecture-1024x561.png\" style=\"height:561px; width:1024px\"><br> 上图中RM内部各个组件（Dispatcher/EventHandler/Service）的功能，可以查看源码。<br> 这里，说一下ResourceScheduler组件，它是RM内部最重要的一个组件，用它来实现资源的分配与回收，它提供了一定算法，在运行时可以根据算法提供的策略来对资源进行调度。YARN内部有3种资源调度策略的实现：FifoScheduler、FairScheduler、CapacityScheduler，其中默认实现为CapacityScheduler。CapacityScheduler实现了资源更加细粒度的分配，可以设置多级队列，每个队列都有一定的容量，即对队列设置资源上限和下限，然后对每一级别队列分别再采用合适的调度策略（如FIFO）进行调度。<br> 如果我们想实现自己的资源调度策略，可以直接实现YARN的资源调度接口ResourceScheduler，然后修改yarn-site.xml中的配置项yarn.resourcemanager.scheduler.class即可。</p>\n<p><strong>NodeManager内部原理</strong></p>\n<p>NM是YARN系统中实际持有资源的从节点，也是实际用户程序运行的宿主节点，内部结构如图所示：<br> <img alt=\"yarn-nm-internal-architecture\" src=\"http://shiyanjun.cn/wp-content/uploads/2015/06/yarn-nm-internal-architecture-1024x408.png\" style=\"height:408px; width:1024px\"><br> 上图中NM内部各个组件（Dispatcher/EventHandler/Service）的功能，可以查看源码，不再累述。</p>\n<p><strong>事件处理机制</strong></p>\n<p>事件处理可以分成2大类，一类是同步处理事件，事件处理过程会阻塞调用进程，通常这样的事件处理逻辑非常简单，不会长时间阻塞；另一类就是异步处理处理事件，通常在接收到事件以后，会有一个用来派发事件的Dispatcher，将事件发到对应的事件队列中，这采用生产者-消费者模式，消费者这会监视着队列，并从取出事件进行异步处理。<br> YARN中到处可以见到事件处理，其中比较特殊一点的就是将状态机（StateMachine）作为一个事件处理器，从而通过事件来触发特定对象状态的变迁，通过这种方式来管理对象状态。我们先看一下YARN中时间处理的机制，以ResourceManager端为例，如下图所示：<br> <img alt=\"yarn-rm-eventhandler\" src=\"http://shiyanjun.cn/wp-content/uploads/2015/06/yarn-rm-eventhandler.png\" style=\"height:438px; width:767px\"><br> 产生的事件通过Dispatcher进行派发并进行处理，如果EventHandler处理逻辑比较简单，直接同步处理，否则可能会采用异步处理的方式。在EventHandler处理的过程中，还可能产生新的事件Event，然后再次通过RM的Dispatcher进行派发，而后处理。</p>\n<p><strong>状态机</strong></p>\n<p>我们以RM端管理的RMAppImpl对象为例，它表示一个Application运行过程中，在RM端的所维护的Application的状态，该对象对应的所有状态及其状态转移路径，如下图所示：<br> <img alt=\"statemachine-RMAppImpl\" src=\"http://shiyanjun.cn/wp-content/uploads/2015/06/statemachine-RMAppImpl.png\" style=\"height:509px; width:833px\"><br> 在上图中如果加上触发状态转移的事件及其类型，可能整个图会显得很乱，所以这里，我详细画了一个分图，用来说明，每一个状态的变化都是有哪种类型的事件触发的，根据这个图，可以方便地阅读源码，如下图所示：<br> <img alt=\"RMAppImpl\" src=\"http://shiyanjun.cn/wp-content/uploads/2015/06/RMAppImpl.png\" style=\"height:3119px; width:852px\"></p>', null);

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
  `CREATE_DATE` timestamp NULL DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
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
INSERT INTO `cont_type` VALUES ('1', '资讯', null, '资讯', '资讯', '0', '资讯', null, 'news', null, '4', null, '23', '6', '1', null, '2015-05-09 17:13:16', '2015-05-09 17:13:16', null, null, '技术新闻资讯', '大数据，架构，云计算新闻', '大数据，架构，云计算最新新闻');
INSERT INTO `cont_type` VALUES ('2', '架构', null, '架构', '架构', '0', '架构', null, '', null, '4', null, '19', '6', '1', null, '2015-05-07 20:15:56', '2015-05-07 20:15:56', null, null, '大型互联网架构', '大型互联网架构，业务架构，系统架构，高性能，高可靠，可扩展，伸缩性', '大型互联网架构，业务架构，系统架构，高性能，高可靠，可扩展，伸缩性');
INSERT INTO `cont_type` VALUES ('3', 'SOA/Dubbo', null, 'SOA/Dubbo', 'SOA/Dubbo', '0', 'SOA/Dubbo', null, '', null, '4', null, '19', '6', '1', null, '2015-05-07 20:15:35', '2015-05-07 20:15:35', null, null, 'SOA-Dubbo', 'SOA,dubbo,dubbox', 'SOA,dubbo,dubbox');
INSERT INTO `cont_type` VALUES ('4', '消息', null, 'MQ', 'MQ', '0', 'MQ', null, 'mq', null, '4', null, '19', '6', '1', null, '2015-05-07 20:12:34', '2015-05-07 20:12:34', null, null, 'MQ-消息', 'MQ，消息', 'MQ，消息');
INSERT INTO `cont_type` VALUES ('5', '大数据', null, '大数据', '大数据', '0', '大数据', null, 'bigdata', null, '4', null, '19', '6', '1', null, '2015-05-07 20:12:55', '2015-05-07 20:12:55', null, null, '大数据', '大数据，spark,hodoop,storm', '大数据，spark,hodoop,storm');
INSERT INTO `cont_type` VALUES ('6', '架构文章', null, '架构要素', '架构要素', '2', '架构要素', null, 'jiagou', null, '4', null, '19', '6', '2', null, '2015-05-07 20:15:47', '2015-05-07 20:15:47', null, null, '架构要素', '高并发，性能，伸缩性，扩展性', '高并发，性能，伸缩性，扩展性');
INSERT INTO `cont_type` VALUES ('7', '缓存', null, '缓存', '缓存', '0', '缓存', null, 'cache', null, '4', null, '19', '6', '1', null, '2015-05-07 20:13:28', '2015-05-07 20:13:28', null, null, '缓存', '缓存，redis,memcahed', '缓存，redis,memcahed');
INSERT INTO `cont_type` VALUES ('8', '架构资料下载', null, '资料下载', '资料下载', '2', '资料下载', null, 'jiagou_xiazai', null, '5', null, '21', '6', '2', null, '2015-05-07 20:16:05', '2015-05-07 20:16:05', null, null, '资料下载', '架构师大会', '架构师大会');
INSERT INTO `cont_type` VALUES ('9', 'SOA文章', null, 'SOA文章', 'SOA文章', '3', 'SOA文章', null, 'soa', null, '4', null, '19', '6', '2', null, '2015-05-07 20:14:46', '2015-05-07 20:14:46', null, null, 'SOA', 'SOA,dubbo,dubbox', 'SOA,dubbo,dubbox');
INSERT INTO `cont_type` VALUES ('10', 'SOA资料下载', null, 'SOA资料下载', 'SOA资料下载', '3', 'SOA资料下载', null, 'soa_xiazai', null, '5', null, '21', '6', '1', null, '2015-05-09 18:55:12', '2015-05-09 18:55:12', null, null, 'SOA资料下载', 'SOA,dubbo,dubbox资料下载', 'SOA,dubbo,dubbox资料下载');
INSERT INTO `cont_type` VALUES ('11', '云计算', null, '云计算', '云计算', '0', '云计算', null, 'yun', null, '4', null, '19', '6', '1', null, '2015-05-07 20:14:49', '2015-05-07 20:14:49', null, null, '云计算', 'openstack,docker,vm,vmware', 'openstack,docker,vm,vmware');
INSERT INTO `cont_type` VALUES ('12', '程序员也有春天', null, '逗比', '逗比', '0', '笑话', null, 'jock', null, '2', null, '22', '6', '1', null, '2015-05-07 20:14:55', '2015-05-07 20:14:55', null, null, '程序员笑话', '程序员笑话，笑话', '程序员笑话，程序员也有春天，休息一下再工作');
INSERT INTO `cont_type` VALUES ('13', '存储', null, '数据库/NoSql', '数据库/NoSql', '0', '数据库/NoSql', null, 'store', null, '4', null, '19', '6', '1', null, '2015-05-07 20:11:38', '2015-05-07 20:11:38', null, null, '数据库/NoSql', 'mysql,oracle,postgre,mongodb,mycat,cobar,mariadb', 'mysql,oracle,postgre,mongodb,mycat,cobar,mariadb等数据库nosql的最新使用教程和技巧');

-- ----------------------------
-- Table structure for `spider_config`
-- ----------------------------
DROP TABLE IF EXISTS `spider_config`;
CREATE TABLE `spider_config` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `node_name` varchar(50) NOT NULL COMMENT '采集节点名',
  `node_perant_id` bigint(19) DEFAULT NULL COMMENT '采集节点父节点。采集节点也是数状。可以和栏目对应 暂时不支持。预留字段。',
  `list_url` varchar(100) DEFAULT NULL COMMENT '采集列表页地址',
  `content_base_url` varchar(100) DEFAULT NULL COMMENT '内容根地址',
  `img_base_url` varchar(100) DEFAULT NULL COMMENT '图片地址前缀',
  `type_ids` varchar(100) DEFAULT NULL COMMENT '入库栏目;逗号分割',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `has_save_img_to_local` tinyint(1) DEFAULT '0' COMMENT '是否保存图片到本地',
  `content_source` varchar(255) DEFAULT NULL COMMENT '信息来源',
  `job_time` varchar(50) NOT NULL COMMENT '采集间隔时间。分钟',
  `filter_source` varchar(200) DEFAULT NULL COMMENT '内容替换。源',
  `filter_targer` varchar(200) DEFAULT NULL COMMENT '内容替换。替换为',
  `ad_filter` varchar(200) DEFAULT NULL COMMENT '广告过滤规则',
  `conter_abort` varchar(250) DEFAULT NULL COMMENT '获取内容简介。多少个字。内容页采集设置时，如果内容简介抓取项为空，则这里设置的有效，从文章中自动截取',
  `list_links_area_rule` varchar(100) DEFAULT NULL COMMENT '列表页内容链接区正则（jgroup）',
  `list_link_rule` varchar(100) DEFAULT NULL COMMENT '列表页内容链接正则（jgroup）',
  `title_img_rule` varchar(100) DEFAULT NULL COMMENT '标题图片正则（jgroup）。如果标题图片在内容页，则不填。',
  `title_rule` varchar(100) DEFAULT NULL COMMENT '内容标题正则（jgroup）',
  `content_title_img_rule` varchar(100) DEFAULT NULL COMMENT '内容标题图片正则（jgroup）',
  `content_abort_rule` varchar(100) DEFAULT NULL COMMENT '内容简介正则（jgroup）',
  `content_rule` varchar(100) DEFAULT NULL COMMENT '内容正则（jgroup）',
  `CREATE_DATE` timestamp NULL DEFAULT NULL,
  `CREATE_USER` varchar(60) DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `UPDATE_USER` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of spider_config
-- ----------------------------

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
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建日期yyyy-mm-dd hh:mm:ss,默认当前时间',
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='系统模块';

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
INSERT INTO `sys_model` VALUES ('56', '爬虫配置', '2016-04-04 10:18:52', '2016-04-04 10:18:56', '1', 'moss/spider/index.htm', '060', '1', null, null, null, null, '10', '0');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `sys_role_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `creator` varchar(60) DEFAULT NULL COMMENT '创建者 系统生成：System，管理员：Admin，其他为 操作员 LoginName',
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色名',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建日期 yyyy-mm-dd hh:mm:ss,默认当前时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间 yyyy-mm-dd hh:mm:ss',
  PRIMARY KEY (`sys_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', 'test', '2014-06-19 13:04:43', '2014-06-19 13:04:43');
INSERT INTO `sys_role` VALUES ('2', 'admin', 'test2', '2014-06-19 13:42:25', '2014-06-19 14:05:38');
INSERT INTO `sys_role` VALUES ('3', 'admin', '内容录入', '2015-05-16 10:29:09', '2015-05-16 11:51:07');

-- ----------------------------
-- Table structure for `sys_role_model`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_model`;
CREATE TABLE `sys_role_model` (
  `sys_model_id` bigint(11) NOT NULL COMMENT '模块编号id',
  `sys_role_id` bigint(11) NOT NULL COMMENT '角色编号id',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建日期 yyyy-mm-dd hh:mm:ss,默认当前时间',
  `creator` varchar(60) NOT NULL COMMENT '创建者 系统生成：System，管理员：Admin，其他为 操作员 LoginName'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色模块关系';

-- ----------------------------
-- Records of sys_role_model
-- ----------------------------
INSERT INTO `sys_role_model` VALUES ('1551', '2', '2014-06-19 14:05:38', 'admin');
INSERT INTO `sys_role_model` VALUES ('25', '1', '2015-05-16 10:29:09', 'admin');
INSERT INTO `sys_role_model` VALUES ('35', '1', '2015-05-16 10:29:09', 'admin');
INSERT INTO `sys_role_model` VALUES ('25', '3', '2015-05-16 11:51:07', 'admin');
INSERT INTO `sys_role_model` VALUES ('35', '3', '2015-05-16 11:51:07', 'admin');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='系统用户';

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
INSERT INTO `sys_user` VALUES ('22', 'panzhanhui82', 'panzhanhui82', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '2015-05-16 11:52:00', '2015-05-16 11:52:00', '1', null, 'admin', '3');

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
  `CREATE_DATE` timestamp NULL DEFAULT NULL,
  `HAS_LEAF` smallint(2) DEFAULT '0' COMMENT '是否是叶子节点; 0否，既文件夹；1是，既模板',
  `TEMPLATE_TYPE` smallint(2) DEFAULT '1' COMMENT '生成的模板类型。 0:文件夹; 1：html, 2；jsp; 3:',
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `CREATE_USER` varchar(60) DEFAULT NULL COMMENT 'login_name',
  `UPDATE_USER` varchar(60) DEFAULT NULL COMMENT 'login_name',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='页面模板';

-- ----------------------------
-- Records of tmpt_template
-- ----------------------------
INSERT INTO `tmpt_template` VALUES ('3', '0', '测试', null, null, '1', '2015-05-16 12:37:02', '0', '1', '2015-05-16 12:37:02', null, null);
INSERT INTO `tmpt_template` VALUES ('6', '3', 'test', null, null, '1', '2015-05-16 12:36:50', '1', '1', '2015-06-03 06:45:02', null, null);
INSERT INTO `tmpt_template` VALUES ('18', '0', '通用模版', null, null, '1', '2015-02-25 21:29:09', '0', '0', '2015-02-25 21:29:09', null, null);
INSERT INTO `tmpt_template` VALUES ('19', '18', '通用内容', null, null, '1', '2015-05-20 21:57:41', '1', '1', '2015-05-31 10:03:30', null, null);
INSERT INTO `tmpt_template` VALUES ('21', '18', '通用下载模板', null, null, '1', '2015-05-20 21:56:59', '1', '1', '2015-05-31 10:03:45', null, null);
INSERT INTO `tmpt_template` VALUES ('22', '18', '通用笑话模板', null, null, '1', '2015-05-20 21:59:16', '1', '1', '2015-06-06 13:20:05', null, null);
INSERT INTO `tmpt_template` VALUES ('23', '18', '通用新闻内容模版', null, null, '1', '2015-05-20 22:00:38', '1', '1', '2015-05-31 10:04:11', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='模板内容表';

-- ----------------------------
-- Records of tmpt_template_body
-- ----------------------------
INSERT INTO `tmpt_template_body` VALUES ('2', '6', 'trytrytr<cms.contextPath />dg');
INSERT INTO `tmpt_template_body` VALUES ('5', '19', '<!DOCTYPE html>\n<html lang=\"zh-cn\">\n  <head>\n   <@cms.cmeta />\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <!--<meta name=\"author\" content=\"\">-->\n    <link rel=\"shortcut icon\" href=\"${staticRoot}/favicon.ico\">\n\n	<!-- 新 Bootstrap 核心 CSS 文件 -->\n    <link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css\">\n\n     <!-- 可选的Bootstrap主题文件（一般不用引入）\n    <link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap-theme.min.css\"> -->\n    <!-- Custom styles for this template -->\n   <link href=\"${staticRoot}/css/common_context.css\" rel=\"stylesheet\">\n\n    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->\n    <!--[if lt IE 9]>\n      <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\n      <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n    <![endif]-->\n<style>\n.bdsharebuttonbox{\nfloat:right;\nmargin-top: 0px;\n}\n</style>\n  </head>\n\n  <body>\n\n    <@cms.header />\n\n    <div class=\"container\">\n\n      <div class=\"blog-header\">\n<!--\n        <h1 class=\"blog-title\">The Bootstrap Blog哈哈哈哈 苟富贵大范甘迪方法申达股份史蒂芬森的发</h1>\n        <p class=\"lead blog-description\">The official example template of creating a blog with Bootstrap.</p>\n-->\n      </div>\n\n      <div class=\"row\">\n\n        <div class=\"col-sm-8 blog-main\">\n\n         \n\n          <div class=\"blog-post\">\n             <h2 class=\"blog-post-title\">${c.title}</h2>\n            <div class=\"blog-post-meta\"><div style=\"float:left;margin: 8px;\">${c.publish_time!\'\'}    作者： jiagou4</div> <@cms.share /></div>\n<div style=\"clear: both;\"></div>\n           <div>${c.content_body}</div>\n<@cms.share />\n          </div><!-- /.blog-post -->\n\n    \n\n        </div><!-- /.blog-main -->\n\n        <div class=\"col-sm-4 blog-sidebar\">\n          <div id=\"_newContent\">\n \n          </div>\n          <div id=\"_hotContent\" class=\"sidebar-module\"></div>\n          <div class=\"sidebar-module\">\n            <h4>Elsewhere</h4>\n            <ol class=\"list-unstyled\">\n              <li><a href=\"#\">GitHub</a></li>\n              <li><a href=\"#\">Twitter</a></li>\n              <li><a href=\"#\">Facebook</a></li>\n            </ol>\n          </div>\n        </div><!-- /.blog-sidebar -->\n\n      </div><!-- /.row -->\n\n    </div><!-- /.container -->\n\n<@cms.footer />\n\n\n    <!-- Bootstrap core JavaScript\n    ================================================== -->\n    <!-- Placed at the end of the document so the pages load faster -->\n<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->\n<script src=\"http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js\"></script>\n\n<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->\n<script src=\"http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js\"></script>\n<script src=\"${staticRoot}/js/jiagou4.js\"></script>\n<script>\nnewContent(\"_newContent\", \'${c.type_id}\', 6);\nhotContent(\"_hotContent\", \'${c.type_id}\', 6);\n\n</script>\n<@cms.shareJs />\n	<@cms.tongji />\n  </body>\n\n</html>');
INSERT INTO `tmpt_template_body` VALUES ('7', '21', '<!DOCTYPE html>\n<html lang=\"zh-cn\">\n  <head>\n   <@cms.cmeta />\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <!--<meta name=\"author\" content=\"\">-->\n    <link rel=\"shortcut icon\" href=\"${staticRoot}/favicon.ico\">\n\n    <title>Blog Template for Bootstrap</title>\n\n	<!-- 新 Bootstrap 核心 CSS 文件 -->\n    <link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css\">\n\n    <!-- 可选的Bootstrap主题文件（一般不用引入）     <link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap-theme.min.css\">-->\n\n    <!-- Custom styles for this template -->\n    <link href=\"${staticRoot}/css/common_context.css\" rel=\"stylesheet\">\n\n    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->\n    <!--[if lt IE 9]>\n      <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\n      <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n    <![endif]-->\n<style>\n.bdsharebuttonbox{\nfloat:right;\nmargin-top: 0px;\n}\n</style>\n  </head>\n\n  <body>\n\n     <@cms.header />\n\n    <div class=\"container\">\n\n      <div class=\"blog-header\">\n<!--\n        <h1 class=\"blog-title\">The Bootstrap Blog哈哈哈哈 苟富贵大范甘迪方法申达股份史蒂芬森的发</h1>\n        <p class=\"lead blog-description\">The official example template of creating a blog with Bootstrap.</p>\n-->\n      </div>\n\n      <div class=\"row\">\n\n        <div class=\"col-sm-8 blog-main\">\n\n         \n\n          <div class=\"blog-post\">\n             <h2 class=\"blog-post-title\">${c.title}</h2>\n            <div class=\"blog-post-meta\"><div style=\"float:left;margin: 8px;\">${c.publish_time!\'\'}    作者： jiagou4</div> <@cms.share /></div>\n<div style=\"clear: both;\"></div>\n           <div>${c.content_body}</div>\n<@cms.share />\n          </div><!-- /.blog-post -->\n\n    \n\n        </div><!-- /.blog-main -->\n\n        <div class=\"col-sm-4 blog-sidebar\">\n           <div id=\"_newContent\">\n \n          </div>\n\n           <div class=\"sidebar-module\">\n            <h4>Elsewhere</h4>\n            <ol class=\"list-unstyled\">\n              <li><a href=\"#\">GitHub</a></li>\n              <li><a href=\"#\">Twitter</a></li>\n              <li><a href=\"#\">Facebook</a></li>\n            </ol>\n          </div>\n        </div><!-- /.blog-sidebar -->\n\n      </div><!-- /.row -->\n\n    </div><!-- /.container -->\n\n<@cms.footer />\n\n\n    <!-- Bootstrap core JavaScript\n    ================================================== -->\n    <!-- Placed at the end of the document so the pages load faster -->\n<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->\n<script src=\"http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js\"></script>\n\n<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->\n<script src=\"http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js\"></script>\n<script src=\"${staticRoot}/js/jiagou4.js\"></script>\n<script>\nnewContent(\"_newContent\", \'${c.type_id}\', 6);\n</script>\n<@cms.shareJs />\n	<@cms.tongji />\n  </body>\n</html>');
INSERT INTO `tmpt_template_body` VALUES ('8', '22', '<!DOCTYPE html>\n<html lang=\"zh-cn\">\n  <head>\n   <@cms.cmeta2 />\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n   <!--  <meta name=\"author\" content=\"\">-->\n   <link rel=\"shortcut icon\" href=\"${staticRoot}/favicon.ico\">\n	\n    <!-- 新 Bootstrap 核心 CSS 文件 -->\n    <link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css\">\n\n    <!-- 可选的Bootstrap主题文件（一般不用引入）\n    <link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap-theme.min.css\"> -->\n    <!-- Custom styles for this template -->\n    <link href=\"${staticRoot}/css/common_context.css\" rel=\"stylesheet\">\n\n    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->\n    <!--[if lt IE 9]>\n      <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\n      <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n    <![endif]-->\n<style>\n.bdsharebuttonbox{\nfloat:right;\nmargin-top: 0px;\n}\n</style>\n  </head>\n\n  <body>\n\n    <@cms.header />\n\n    <div class=\"container\">\n\n      <div class=\"blog-header\">\n<!--\n        <h1 class=\"blog-title\">The Bootstrap Blog哈哈哈哈 苟富贵大范甘迪方法申达股份史蒂芬森的发</h1>\n        <p class=\"lead blog-description\">The official example template of creating a blog with Bootstrap.</p>\n-->\n      </div>\n\n      <div class=\"row\">\n\n        <div class=\"col-sm-8 blog-main\">\n\n         \n\n          <div class=\"blog-post\">\n              <h2 class=\"blog-post-title\">${c.title}</h2>\n            <div class=\"blog-post-meta\"><div style=\"float:left;margin: 8px;\">${c.publish_time!\'\'}    作者： jiagou4</div> <@cms.share /></div>\n<div style=\"clear: both;\"></div>\n           <div>${c.content_body}</div>\n<@cms.share />\n          </div><!-- /.post -->\n\n    \n\n        </div><!-- /.main -->\n\n        <div class=\"col-sm-4 blog-sidebar\">\n<div class=\"sidebar-module\">\n          <a href=\"http://s.click.taobao.com/Iik6P4y\">\n          <img alt=\"天猫年中大促\" src=\"http://gtms04.alicdn.com/tps/i4/TB1abJFIXXXXXcAXFXXQO4D5VXX-440-180.jpg\" width=\"350px\">\n           </a>\n          </div>         \n\n        </div><!-- /.leftsidebar -->\n\n      </div><!-- /.row -->\n\n    </div><!-- /.container -->\n\n<@cms.footer />\n\n\n    <!-- Bootstrap core JavaScript\n    ================================================== -->\n    <!-- Placed at the end of the document so the pages load faster -->\n<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->\n<script src=\"http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js\"></script>\n\n<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->\n<script src=\"http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js\"></script>\n\n<@cms.shareJs />\n	<@cms.tongji />\n  </body>\n</html>');
INSERT INTO `tmpt_template_body` VALUES ('9', '23', '<!DOCTYPE html>\n<html lang=\"zh-cn\">\n  <head>\n<@cms.cmeta />\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n   <!--  <meta name=\"author\" content=\"\"> -->\n    <link rel=\"shortcut icon\" href=\"${staticRoot}/favicon.ico\">\n	\n    <!-- 新 Bootstrap 核心 CSS 文件 -->\n    <link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css\">\n\n    <!-- 可选的Bootstrap主题文件（一般不用引入）    <link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap-theme.min.css\"> -->\n\n    <!-- Custom styles for this template -->\n    <link href=\"${staticRoot}/css/common_context.css\" rel=\"stylesheet\">\n\n    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->\n    <!--[if lt IE 9]>\n      <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\n      <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n    <![endif]-->\n\n<style>\n.bdsharebuttonbox{\nfloat:right;\nmargin-top: 0px;\n}\n</style>\n  </head>\n\n  <body>\n\n     <@cms.header />\n    <div class=\"container\">\n\n      <div class=\"blog-header\">\n        <!--  <h1 class=\"blog-title\">The Bootstrap Blog哈哈哈哈 苟富贵大范甘迪方法申达股份史蒂芬森的发</h1>\n        <p class=\"lead blog-description\">The official example template of creating a blog with Bootstrap.</p>-->\n      </div>\n\n      <div class=\"row\">\n\n        <div class=\"col-sm-8 blog-main\">\n\n         \n\n          <div class=\"blog-post\">\n            <h2 class=\"blog-post-title\">${c.title}</h2>\n            <div class=\"blog-post-meta\"><div style=\"float:left;margin: 8px;\">${c.publish_time!\'\'}    作者： jiagou4</div> <@cms.share /></div>\n<div style=\"clear: both;\"></div>\n           <div>${c.content_body}</div>\n<@cms.share />\n          </div><!-- /.blog-post -->\n\n    \n\n        </div><!-- /.blog-main -->\n\n        <div class=\"col-sm-4 blog-sidebar\">\n         <div id=\"_newContent\">\n \n          </div>\n          <div id=\"_hotContent\" class=\"sidebar-module\"></div>\n          <div class=\"sidebar-module\">\n            <h4>Elsewhere</h4>\n            <ol class=\"list-unstyled\">\n              <li><a href=\"#\">GitHub</a></li>\n              <li><a href=\"#\">Twitter</a></li>\n              <li><a href=\"#\">Facebook</a></li>\n            </ol>\n          </div>\n        </div><!-- /.blog-sidebar -->\n\n      </div><!-- /.row -->\n\n    </div><!-- /.container -->\n\n<@cms.footer />\n\n\n    <!-- Bootstrap core JavaScript\n    ================================================== -->\n    <!-- Placed at the end of the document so the pages load faster -->\n<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->\n<script src=\"http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js\"></script>\n\n<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->\n<script src=\"http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js\"></script>\n<script src=\"${staticRoot}/js/jiagou4.js\"></script>\n<script>\nnewContent(\"_newContent\", \'${c.type_id}\', 6);\nhotContent(\"_hotContent\", \'${c.type_id}\', 6);\n</script>\n\n<@cms.shareJs />\n	<@cms.tongji />\n  </body>\n</html>');

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
