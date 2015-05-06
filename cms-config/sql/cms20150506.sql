/*
Navicat MySQL Data Transfer

Source Server         : cms
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-05-06 22:21:09
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
INSERT INTO `cont_attribute` VALUES ('2', '0', '0', '0', '1', '1', '0', '1', '1', '1', '1', '1', '0', '0', '通用笑话类型', '', '2015-05-06 21:35:42', null, '2015-05-06 21:35:42', null, '1');
INSERT INTO `cont_attribute` VALUES ('3', '0', '0', '0', '1', '0', '0', '0', '1', '0', '0', '0', '1', '0', 'teste', 'sdf', null, null, null, null, '1');
INSERT INTO `cont_attribute` VALUES ('4', '1', '0', '0', '1', '1', '0', '1', '1', '1', '1', '1', '0', '0', '通用内容类型', '', '2015-02-23 16:22:50', null, '2015-02-23 16:22:50', null, '1');
INSERT INTO `cont_attribute` VALUES ('5', '1', '0', '0', '1', '1', '0', '1', '1', '1', '1', '0', '0', '0', '通用下载类型', '', '2015-05-06 21:42:31', null, '2015-05-06 21:42:31', null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='内容表';

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

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
INSERT INTO `cont_type` VALUES ('1', '资讯', null, '资讯', '资讯', '0', '资讯', null, null, null, '4', null, '19', '6', '1', null, '2015-05-05 20:30:22', '2015-05-05 20:30:22', null, null, null, null, null);
INSERT INTO `cont_type` VALUES ('2', '架构', null, '架构', '架构', '0', '架构', null, null, null, '4', null, '19', '6', '1', null, '2015-04-26 15:23:16', '2015-04-26 15:23:16', null, null, null, null, null);
INSERT INTO `cont_type` VALUES ('3', 'SOA/Dubbo', null, 'SOA/Dubbo', 'SOA/Dubbo', '0', 'SOA/Dubbo', null, null, null, '4', null, '19', '6', '1', null, '2015-04-26 15:24:33', '2015-04-26 15:24:33', null, null, 'SOA-Dubbo', 'SOA,dubbo,dubbox', 'SOA,dubbo,dubbox');
INSERT INTO `cont_type` VALUES ('4', '消息', null, 'MQ', 'MQ', '0', 'MQ', null, null, null, '4', null, '19', '6', '1', null, '2015-04-26 15:25:53', '2015-04-26 15:25:53', null, null, 'MQ-消息', 'MQ，消息', 'MQ，消息');
INSERT INTO `cont_type` VALUES ('5', '大数据', null, '大数据', '大数据', '0', '大数据', null, null, null, '4', null, '19', '6', '1', null, '2015-04-26 15:27:59', '2015-04-26 15:27:59', null, null, '大数据', '大数据，spark,hodoop,storm', '大数据，spark,hodoop,storm');
INSERT INTO `cont_type` VALUES ('6', '架构文章', null, '架构要素', '架构要素', '2', '架构要素', null, null, null, '4', null, '19', '6', '2', null, '2015-05-06 22:01:14', '2015-05-06 22:01:14', null, null, '架构要素', '高并发，性能，伸缩性，扩展性', '高并发，性能，伸缩性，扩展性');
INSERT INTO `cont_type` VALUES ('7', '缓存', null, '缓存', '缓存', '0', '缓存', null, null, null, '4', null, '19', '6', '1', null, '2015-04-27 20:28:59', '2015-04-27 20:29:02', null, null, '缓存', '缓存，redis,memcahed', '缓存，redis,memcahed');
INSERT INTO `cont_type` VALUES ('8', '架构资料下载', null, '资料下载', '资料下载', '2', '资料下载', null, null, null, '5', null, '21', '6', '2', null, '2015-05-06 21:36:42', '2015-05-06 21:36:42', null, null, '资料下载', '架构师大会', '架构师大会');
INSERT INTO `cont_type` VALUES ('9', 'SOA文章', null, 'SOA文章', 'SOA文章', '3', 'SOA文章', null, null, null, '4', null, '19', '6', '2', null, '2015-04-27 20:35:42', '2015-04-27 20:35:42', null, null, 'SOA', 'SOA,dubbo,dubbox', 'SOA,dubbo,dubbox');
INSERT INTO `cont_type` VALUES ('10', 'SOA资料下载', null, 'SOA资料下载', 'SOA资料下载', '3', 'SOA资料下载', null, null, null, '5', null, '21', '6', '1', null, '2015-05-06 21:36:49', '2015-05-06 21:36:49', null, null, 'SOA资料下载', 'dubbo,SOA资料下载', 'dubbo,SOA资料下载');
INSERT INTO `cont_type` VALUES ('11', '云计算', null, '云计算', '云计算', '0', '云计算', null, null, null, '4', null, '19', '6', '1', null, '2015-04-27 20:40:55', '2015-04-27 20:41:01', null, null, '云计算', 'openstack,docker,vm,vmware', 'openstack,docker,vm,vmware');
INSERT INTO `cont_type` VALUES ('12', '程序员也有春天', null, '逗比', '逗比', '0', '笑话', null, null, null, '2', null, '22', '6', '1', null, '2015-05-06 21:36:52', '2015-05-06 21:36:52', null, null, '程序员笑话', '程序员笑话，笑话', '程序员笑话，程序员也有春天，休息一下再工作');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='页面模板';

-- ----------------------------
-- Records of tmpt_template
-- ----------------------------
INSERT INTO `tmpt_template` VALUES ('3', '0', '2222', 'erw', 'erwe', '1', '2015-02-25 21:45:22', '0', '1', '2015-02-25 21:45:22', null, null);
INSERT INTO `tmpt_template` VALUES ('6', '3', 'ret', null, null, '1', '2015-02-23 19:32:40', '1', '1', '2015-02-23 19:32:40', null, null);
INSERT INTO `tmpt_template` VALUES ('18', '0', '通用模版', null, null, '1', '2015-02-25 21:29:09', '0', '0', '2015-02-25 21:29:09', null, null);
INSERT INTO `tmpt_template` VALUES ('19', '18', '通用内容', null, null, '1', '2015-03-13 20:20:06', '1', '1', '2015-03-13 20:20:06', null, null);
INSERT INTO `tmpt_template` VALUES ('21', '18', '通用下载模板', null, null, '1', '2015-05-06 21:28:11', '1', '1', '2015-05-06 21:28:11', null, null);
INSERT INTO `tmpt_template` VALUES ('22', '18', '通用笑话模板', null, null, '1', '2015-05-06 21:27:53', '1', '1', '2015-05-06 21:27:53', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='模板内容表';

-- ----------------------------
-- Records of tmpt_template_body
-- ----------------------------
INSERT INTO `tmpt_template_body` VALUES ('2', '6', 'trytrytr<@cms.contextPath />dg');
INSERT INTO `tmpt_template_body` VALUES ('5', '19', '<!DOCTYPE html>\n<html lang=\"zh-cn\">\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <meta name=\"description\" content=\"\">\n    <meta name=\"author\" content=\"\">\n   <!-- <link rel=\"icon\" href=\"../../favicon.ico\">-->\n\n    <title>Blog Template for Bootstrap</title>\n    <!-- Custom styles for this template -->\n   \n	  <link href=\"${staticRoot}/css/common_context.css\" rel=\"stylesheet\">\n\n  	\n	<!-- 新 Bootstrap 核心 CSS 文件 -->\n<link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css\">\n\n<!-- 可选的Bootstrap主题文件（一般不用引入） -->\n<link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap-theme.min.css\">\n\n    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->\n    <!--[if lt IE 9]>\n      <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\n      <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n    <![endif]-->\n  </head>\n\n  <body>\n\n    <div class=\"blog-masthead\">\n      <div class=\"container\">\n        <nav class=\"blog-nav\">\n            <a class=\"blog-nav-item active\" href=\"${contextPath}/list.htm\">首页</a>\n          <a class=\"blog-nav-item active\" href=\"${contextPath}/t/3/list.htm\">刷机教程</a>\n          <a class=\"blog-nav-item\" href=\"${contextPath}/t/4/list.htm\">手机软件</a>\n          <a class=\"blog-nav-item\" href=\"${contextPath}/t/5/list.htm\">手机教程</a>         \n        </nav>\n      </div>\n    </div>\n\n    <div class=\"container\">\n\n      <div class=\"blog-header\">\n        <h1 class=\"blog-title\">The Bootstrap Blog哈哈哈哈 苟富贵大范甘迪方法申达股份史蒂芬森的发</h1>\n        <p class=\"lead blog-description\">The official example template of creating a blog with Bootstrap.</p>\n      </div>\n\n      <div class=\"row\">\n\n        <div class=\"col-sm-8 blog-main\">\n\n         \n\n          <div class=\"blog-post\">\n            <h2 class=\"blog-post-title\">${c.title}</h2>\n            <p class=\"blog-post-meta\">${c.publish_time!\'\'}<!--by <a href=\"#\">ucShouji</a>--></p>\n\n           <div>${c.content_body}</div>\n          </div><!-- /.blog-post -->\n\n    \n\n        </div><!-- /.blog-main -->\n\n        <div class=\"col-sm-3 col-sm-offset-1 blog-sidebar\">\n          <div class=\"sidebar-module sidebar-module-inset\">\n            <h4>About</h4>\n            <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>\n          </div>\n          <div class=\"sidebar-module\">\n            <h4>Archives</h4>\n            <ol class=\"list-unstyled\">\n              <li><a href=\"#\">March 2014</a></li>\n              <li><a href=\"#\">February 2014</a></li>\n              <li><a href=\"#\">January 2014</a></li>\n              <li><a href=\"#\">December 2013</a></li>\n              <li><a href=\"#\">November 2013</a></li>\n              <li><a href=\"#\">October 2013</a></li>\n              <li><a href=\"#\">September 2013</a></li>\n              <li><a href=\"#\">August 2013</a></li>\n              <li><a href=\"#\">July 2013</a></li>\n              <li><a href=\"#\">June 2013</a></li>\n              <li><a href=\"#\">May 2013</a></li>\n              <li><a href=\"#\">April 2013</a></li>\n            </ol>\n          </div>\n          <div class=\"sidebar-module\">\n            <h4>Elsewhere</h4>\n            <ol class=\"list-unstyled\">\n              <li><a href=\"#\">GitHub</a></li>\n              <li><a href=\"#\">Twitter</a></li>\n              <li><a href=\"#\">Facebook</a></li>\n            </ol>\n          </div>\n        </div><!-- /.blog-sidebar -->\n\n      </div><!-- /.row -->\n\n    </div><!-- /.container -->\n\n<footer class=\"blog-footer\">\n      <p>Copyright © 2004-2015.</p>\n      <p>\n        <a href=\"#\">回顶部</a>\n      </p>\n    </footer>\n\n\n    <!-- Bootstrap core JavaScript\n    ================================================== -->\n    <!-- Placed at the end of the document so the pages load faster -->\n<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->\n<script src=\"http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js\"></script>\n\n<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->\n<script src=\"http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js\"></script>\n  </body>\n</html>');
INSERT INTO `tmpt_template_body` VALUES ('7', '21', '<!DOCTYPE html>\n<html lang=\"zh-cn\">\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <meta name=\"description\" content=\"\">\n    <meta name=\"author\" content=\"\">\n   <!-- <link rel=\"icon\" href=\"../../favicon.ico\">-->\n\n    <title>Blog Template for Bootstrap</title>\n    <!-- Custom styles for this template -->\n   \n	  <link href=\"${staticRoot}/css/common_context.css\" rel=\"stylesheet\">\n\n  	\n	<!-- 新 Bootstrap 核心 CSS 文件 -->\n<link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css\">\n\n<!-- 可选的Bootstrap主题文件（一般不用引入） -->\n<link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap-theme.min.css\">\n\n    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->\n    <!--[if lt IE 9]>\n      <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\n      <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n    <![endif]-->\n  </head>\n\n  <body>\n\n    <div class=\"blog-masthead\">\n      <div class=\"container\">\n        <nav class=\"blog-nav\">\n            <a class=\"blog-nav-item active\" href=\"${contextPath}/list.htm\">首页</a>\n          <a class=\"blog-nav-item active\" href=\"${contextPath}/t/3/list.htm\">刷机教程</a>\n          <a class=\"blog-nav-item\" href=\"${contextPath}/t/4/list.htm\">手机软件</a>\n          <a class=\"blog-nav-item\" href=\"${contextPath}/t/5/list.htm\">手机教程</a>         \n        </nav>\n      </div>\n    </div>\n\n    <div class=\"container\">\n\n      <div class=\"blog-header\">\n        <h1 class=\"blog-title\">The Bootstrap Blog哈哈哈哈 苟富贵大范甘迪方法申达股份史蒂芬森的发</h1>\n        <p class=\"lead blog-description\">The official example template of creating a blog with Bootstrap.</p>\n      </div>\n\n      <div class=\"row\">\n\n        <div class=\"col-sm-8 blog-main\">\n\n         \n\n          <div class=\"blog-post\">\n            <h2 class=\"blog-post-title\">${c.title}</h2>\n            <p class=\"blog-post-meta\">${c.publish_time!\'\'}<!--by <a href=\"#\">ucShouji</a>--></p>\n\n           <div>${c.content_body}</div>\n          </div><!-- /.blog-post -->\n\n    \n\n        </div><!-- /.blog-main -->\n\n        <div class=\"col-sm-3 col-sm-offset-1 blog-sidebar\">\n          <div class=\"sidebar-module sidebar-module-inset\">\n            <h4>About</h4>\n            <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>\n          </div>\n          <div class=\"sidebar-module\">\n            <h4>Archives</h4>\n            <ol class=\"list-unstyled\">\n              <li><a href=\"#\">March 2014</a></li>\n              <li><a href=\"#\">February 2014</a></li>\n              <li><a href=\"#\">January 2014</a></li>\n              <li><a href=\"#\">December 2013</a></li>\n              <li><a href=\"#\">November 2013</a></li>\n              <li><a href=\"#\">October 2013</a></li>\n              <li><a href=\"#\">September 2013</a></li>\n              <li><a href=\"#\">August 2013</a></li>\n              <li><a href=\"#\">July 2013</a></li>\n              <li><a href=\"#\">June 2013</a></li>\n              <li><a href=\"#\">May 2013</a></li>\n              <li><a href=\"#\">April 2013</a></li>\n            </ol>\n          </div>\n          <div class=\"sidebar-module\">\n            <h4>Elsewhere</h4>\n            <ol class=\"list-unstyled\">\n              <li><a href=\"#\">GitHub</a></li>\n              <li><a href=\"#\">Twitter</a></li>\n              <li><a href=\"#\">Facebook</a></li>\n            </ol>\n          </div>\n        </div><!-- /.blog-sidebar -->\n\n      </div><!-- /.row -->\n\n    </div><!-- /.container -->\n\n<footer class=\"blog-footer\">\n      <p>Copyright © 2004-2015.</p>\n      <p>\n        <a href=\"#\">回顶部</a>\n      </p>\n    </footer>\n\n\n    <!-- Bootstrap core JavaScript\n    ================================================== -->\n    <!-- Placed at the end of the document so the pages load faster -->\n<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->\n<script src=\"http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js\"></script>\n\n<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->\n<script src=\"http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js\"></script>\n  </body>\n</html>');
INSERT INTO `tmpt_template_body` VALUES ('8', '22', '<!DOCTYPE html>\n<html lang=\"zh-cn\">\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <meta name=\"description\" content=\"\">\n    <meta name=\"author\" content=\"\">\n   <!-- <link rel=\"icon\" href=\"../../favicon.ico\">-->\n\n    <title>Blog Template for Bootstrap</title>\n    <!-- Custom styles for this template -->\n   \n	  <link href=\"${staticRoot}/css/common_context.css\" rel=\"stylesheet\">\n\n  	\n	<!-- 新 Bootstrap 核心 CSS 文件 -->\n<link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css\">\n\n<!-- 可选的Bootstrap主题文件（一般不用引入） -->\n<link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap-theme.min.css\">\n\n    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->\n    <!--[if lt IE 9]>\n      <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\n      <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n    <![endif]-->\n  </head>\n\n  <body>\n\n    <div class=\"blog-masthead\">\n      <div class=\"container\">\n        <nav class=\"blog-nav\">\n            <a class=\"blog-nav-item active\" href=\"${contextPath}/list.htm\">首页</a>\n          <a class=\"blog-nav-item active\" href=\"${contextPath}/t/3/list.htm\">刷机教程</a>\n          <a class=\"blog-nav-item\" href=\"${contextPath}/t/4/list.htm\">手机软件</a>\n          <a class=\"blog-nav-item\" href=\"${contextPath}/t/5/list.htm\">手机教程</a>         \n        </nav>\n      </div>\n    </div>\n\n    <div class=\"container\">\n\n      <div class=\"blog-header\">\n        <h1 class=\"blog-title\">The Bootstrap Blog哈哈哈哈 苟富贵大范甘迪方法申达股份史蒂芬森的发</h1>\n        <p class=\"lead blog-description\">The official example template of creating a blog with Bootstrap.</p>\n      </div>\n\n      <div class=\"row\">\n\n        <div class=\"col-sm-8 blog-main\">\n\n         \n\n          <div class=\"blog-post\">\n            <h2 class=\"blog-post-title\">${c.title}</h2>\n            <p class=\"blog-post-meta\">${c.publish_time!\'\'}<!--by <a href=\"#\">ucShouji</a>--></p>\n\n           <div>${c.content_body}</div>\n          </div><!-- /.blog-post -->\n\n    \n\n        </div><!-- /.blog-main -->\n\n        <div class=\"col-sm-3 col-sm-offset-1 blog-sidebar\">\n          <div class=\"sidebar-module sidebar-module-inset\">\n            <h4>About</h4>\n            <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>\n          </div>\n          <div class=\"sidebar-module\">\n            <h4>Archives</h4>\n            <ol class=\"list-unstyled\">\n              <li><a href=\"#\">March 2014</a></li>\n              <li><a href=\"#\">February 2014</a></li>\n              <li><a href=\"#\">January 2014</a></li>\n              <li><a href=\"#\">December 2013</a></li>\n              <li><a href=\"#\">November 2013</a></li>\n              <li><a href=\"#\">October 2013</a></li>\n              <li><a href=\"#\">September 2013</a></li>\n              <li><a href=\"#\">August 2013</a></li>\n              <li><a href=\"#\">July 2013</a></li>\n              <li><a href=\"#\">June 2013</a></li>\n              <li><a href=\"#\">May 2013</a></li>\n              <li><a href=\"#\">April 2013</a></li>\n            </ol>\n          </div>\n          <div class=\"sidebar-module\">\n            <h4>Elsewhere</h4>\n            <ol class=\"list-unstyled\">\n              <li><a href=\"#\">GitHub</a></li>\n              <li><a href=\"#\">Twitter</a></li>\n              <li><a href=\"#\">Facebook</a></li>\n            </ol>\n          </div>\n        </div><!-- /.blog-sidebar -->\n\n      </div><!-- /.row -->\n\n    </div><!-- /.container -->\n\n<footer class=\"blog-footer\">\n      <p>Copyright © 2004-2015.</p>\n      <p>\n        <a href=\"#\">回顶部</a>\n      </p>\n    </footer>\n\n\n    <!-- Bootstrap core JavaScript\n    ================================================== -->\n    <!-- Placed at the end of the document so the pages load faster -->\n<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->\n<script src=\"http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js\"></script>\n\n<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->\n<script src=\"http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js\"></script>\n  </body>\n</html>');

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
