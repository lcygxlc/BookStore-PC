/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : mybatis

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 12/03/2022 14:57:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address`  (
  `addr_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `addr_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addr_city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addr_area` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addr_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addr_receiver` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addr_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addr_isdefault` tinyint NOT NULL,
  PRIMARY KEY (`addr_id`) USING BTREE,
  INDEX `addr_userid`(`user_id`) USING BTREE,
  CONSTRAINT `addr_userid` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_address
-- ----------------------------
INSERT INTO `t_address` VALUES (16, 5, '吉林', '长春', '高新', '高新', '王五', '15512345676', 0);
INSERT INTO `t_address` VALUES (18, 5, '吉林', '长春', '高新', '高新', '赵六', '15512345678', 0);
INSERT INTO `t_address` VALUES (40, 16, '辽宁', '大连', '甘井子', '陵水街道', '李女士', '10086', 0);
INSERT INTO `t_address` VALUES (43, 1, '辽宁', '大连', '高新园', '软件园路8号', '王先生', '18788889999', 0);

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `cate_id` int NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cate_pic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (1, '美容美妆', '/images/cate/1.png');
INSERT INTO `t_category` VALUES (2, '运动户外', '/images/cate/2.png');
INSERT INTO `t_category` VALUES (3, '母婴用品', '/images/cate/3.png');
INSERT INTO `t_category` VALUES (4, '进口美食', '/images/cate/4.png');
INSERT INTO `t_category` VALUES (5, '潮流奢品', '/images/cate/5.png');
INSERT INTO `t_category` VALUES (6, '服饰箱包', '/images/cate/6.png');
INSERT INTO `t_category` VALUES (7, '家居日用', '/images/cate/7.png');
INSERT INTO `t_category` VALUES (8, '个人护理', '/images/cate/8.png');
INSERT INTO `t_category` VALUES (9, '食品饮料', '/images/cate/9.png');
INSERT INTO `t_category` VALUES (10, '电子数码', '/images/cate/10.png');
INSERT INTO `t_category` VALUES (11, '钟表首饰', '/images/cate/11.png');
INSERT INTO `t_category` VALUES (12, '营养保健', '/images/cate/11.png');

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods`  (
  `goods_id` int NOT NULL AUTO_INCREMENT,
  `cate_id` int NOT NULL,
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goods_disc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goods_price` float NOT NULL,
  `goods_discount` float NULL DEFAULT NULL,
  `goods_stock` int NOT NULL,
  `goods_origin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_material` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_postalfee` float NULL DEFAULT NULL,
  `goods_date` date NULL DEFAULT NULL,
  `goods_sales` int NULL DEFAULT NULL,
  `goods_pic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`goods_id`) USING BTREE,
  INDEX `cate_id`(`cate_id`) USING BTREE,
  CONSTRAINT `cate_id` FOREIGN KEY (`cate_id`) REFERENCES `t_category` (`cate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES (1, 1, '雅诗兰黛DW持妆粉底液', '油皮亲妈持久不脱妆遮瑕控油防晒 24小时真正持妆 长效控油 持久遮瑕 可遮盖瑕疵 防晒 妆容更持久 轻松打造精致持久哑光底妆', 410, 100, 0, '上海', 'Estee Lauder/雅诗兰黛', 12, '2016-01-01', 56, '/images/goods/1_1.jpg');
INSERT INTO `t_goods` VALUES (2, 1, '科颜氏亚马逊白泥清洁面膜', '深层清洁去黑头 收缩毛孔 平衡油脂分泌 活肤滋润 清洁肌肤 水润饱满 深层清洁', 315, 50, 0, '杭州', 'Kiehl\'s/科颜氏', 10, '2016-01-29', 67, '/images/goods/1_2.jpg');
INSERT INTO `t_goods` VALUES (3, 1, '兰蔻大粉水新清滢柔肤水', '400ml 补水保湿 舒缓泛红 防止肌肤干燥 换季敏感 妆后易干纹 起皮 卡粉 暗沉 没有光泽 缺乏弹性 一抹吸收 肌肤畅饮喝饱水', 435, 32, 0, '苏州', 'Lancome/兰蔻', 12, '2016-01-30', 78, '/images/goods/1_3.jpg');
INSERT INTO `t_goods` VALUES (4, 1, '凯朵立体双效眉笔', '双头眉粉笔扁头芯防水不脱色 不易晕染 新手挚爱 立体自然 fang\'shui不脱色 眉尾不掉线 自然百搭 一支多用 打造自然生动眉', 119, 30, 0, '杭州', 'KATE/凯朵', 12, '2016-01-30', 5, '/images/goods/1_4.jpg');
INSERT INTO `t_goods` VALUES (5, 1, '悦木之源灵芝精华水', '菌菇爽肤 湿敷水补 保湿正品 强韧肌底 易吸收 悦粉挚爱 稳定透亮 内外强韧', 330, 33, 0, '上海', 'origins/悦木之源', 12, '2016-01-30', 23, '/images/goods/1_5.jpg');
INSERT INTO `t_goods` VALUES (6, 1, '雅诗兰黛眼霜小棕瓶眼精华', '修护抗皱 紧致轮廓 淡化细纹泡泡眼 立体紧致科技 抚眼纹 收眼袋 保湿补水 淡化细纹 提拉紧致', 600, 399, 12, '杭州', 'Estee Lauder/雅诗兰黛', 12, '2016-01-30', 23, '/images/goods/1_6.jpg');
INSERT INTO `t_goods` VALUES (7, 1, '俏漫品牌化妆品套装', '正品玻尿酸护肤品女水乳保湿补水学生霜旗舰店 买2送1同款 送试用装 补水保湿，改善暗沉', 178, 20, 12, '杭州', 'Qiom/俏漫', 12, '2016-01-30', 0, '/images/goods/1_7.jpg');
INSERT INTO `t_goods` VALUES (8, 1, '全自动卷发棒', 'lena全自动卷发棒懒人卷发神器大卷大波浪电动旋转负离子不伤发女 全自动旋转懒人卷发棒 1000W双通道负离子', 178, 18, 56, '杭州', 'lena', 12, '2016-01-30', 34, '/images/goods/1_8.jpg');
INSERT INTO `t_goods` VALUES (9, 2, '硅胶搓澡巾', '男女强力搓背搓泥搓灰神器长条后背去死皮洗澡沐浴刷子 双面功能 容易清洗 速干 无菌硅胶', 158, 20, 0, '杭州', 'GUCAT/谷猫', 12, '2016-01-30', 0, '/images/goods/2_1.jpg');
INSERT INTO `t_goods` VALUES (10, 2, '干花气泡弹沐浴球', '家品干花气泡弹沐浴球泡澡球泡泡浴 身体护理 浴盐金桂悠香 自然芬芳清爽怡人', 19, 3, 56, '杭州', 'OCE（女装）', 12, '2016-01-30', 34, '/images/goods/2_2.jpg');
INSERT INTO `t_goods` VALUES (11, 2, '老寒腿滑膜关节炎康复护托', '医用护膝保暖半月板损伤男女髌骨固定男老寒腿滑膜关节炎康复 大小松紧可调 四根弹簧条支撑 OK布面料', 238, 17, 99, '杭州', 'Ober', 12, '2016-01-30', 222, '/images/goods/2_3.jpg');
INSERT INTO `t_goods` VALUES (12, 2, '甲沟专用指甲剪刀', '甲沟专用指甲剪刀鹰嘴脚趾甲剪套装鹰嘴钳尖嘴神器修脚工具钳子炎 修脚刀套装 甲沟专用 二代升级 更尖更锋利', 98, 20, 0, '杭州', '索朗 Sunlum', 12, '2016-01-30', 23, '/images/goods/2_4.jpg');
INSERT INTO `t_goods` VALUES (13, 2, '热敷缓解疲劳按摩器', '艾诗摩尔润眼仪护眼仪雾化仪眼部护理按摩仪器 纳米雾化润眼 热敷缓解疲劳 适合多种护眼液', 999, 100, 7, '杭州', 'ASHMORE/艾诗摩尔', 12, '2016-01-30', 1, '/images/goods/2_5.jpg');
INSERT INTO `t_goods` VALUES (14, 2, '纯天然脱味马油面霜', '日本进口正品爆款高保湿滋润补水祛痘修复纯天然脱味马油面霜女 保湿 润肤 祛痘 补水 改善肤质', 299, 30, 10, '杭州', 'MUNIMAYU纯马油', 12, '2016-01-30', 3, '/images/goods/2_6.jpg');
INSERT INTO `t_goods` VALUES (15, 2, '上班骑通勤代步单车', '永久牌自行车女轻便上班骑通勤代步单车24寸26学生大人成人成年男 性价比之王 同样价格 不同品质', 498, 33, 0, '杭州', 'FOREVER/永久', 12, '2016-01-30', 97, '/images/goods/2_7.jpg');
INSERT INTO `t_goods` VALUES (16, 2, '斯伯丁5号儿童篮球', '正品青少年小学生幼儿园少儿专用PU耐磨74-582Y  五号儿童宝宝蓝球 官方授权 包邮送大礼包', 199, 59, 0, '杭州', 'Spalding/斯伯丁', 12, '2016-01-30', 90, '/images/goods/2_8.jpg');
INSERT INTO `t_goods` VALUES (17, 3, '双肩外出妈咪包', '十月结晶妈咪包辣妈双肩外出背包大容量妈妈包母婴包2020新款时尚 优质EVA材质 防水保温 多功能设计', 388, 23, 0, '杭州', '十月结晶', 12, '2016-01-30', 45, '/images/goods/3_1.jpg');
INSERT INTO `t_goods` VALUES (18, 3, '甲醛清除剂', '甲醛清除剂光触媒除甲醛母婴急住新房家用家具治理去味神器强力型  自动分解除醛 母婴安全', 668, 18, 9, '杭州', 'eotton', 12, '2016-01-28', 56, '/images/goods/3_2.jpg');
INSERT INTO `t_goods` VALUES (19, 3, '专用女士一次性内裤', '全棉时代母婴用品一次性内裤产妇月子产后纯棉无菌大码旅行内裤女 纯棉专利面料 双层裆部 出差旅行 EO灭菌', 116, 16, 0, '杭州', 'Purcotton/全棉时代', 12, '2016-01-30', 78, '/images/goods/3_3.jpg');
INSERT INTO `t_goods` VALUES (20, 3, '美的led遥控母婴灯', '美的led小夜灯充电式婴儿喂奶床头灯卧室睡眠灯遥控母婴灯 启悦 手提小夜灯 停电应急', 318, 18, 0, '杭州', 'Midea/美的', 12, '2016-01-30', 111, '/images/goods/3_4.jpg');
INSERT INTO `t_goods` VALUES (21, 3, '母婴适用软包装面巾纸', '洁柔纸巾母婴适用抽纸套装3层24包 面巾餐巾纸卫生纸家用实惠装柔', 160, 33, 0, '杭州', '洁柔', 12, '2016-01-30', 97, '/images/goods/3_5.jpg');
INSERT INTO `t_goods` VALUES (22, 3, '立体型防溢乳垫', '十月结晶防溢乳垫一次性溢乳垫超薄哺乳期母婴防漏奶垫乳贴100片 送30片同款乳垫+10抽湿巾', 68, 8, 0, '杭州', '十月结晶', 12, '2016-01-30', 90, '/images/goods/3_6.jpg');
INSERT INTO `t_goods` VALUES (23, 3, 'Babyface母婴抽纸', '洁柔婴儿抽纸家用实惠装整箱旗舰店官网宝宝专用母婴幼儿超柔纸巾 100抽30包整箱', 79, 23, 0, '杭州', '洁柔', 12, '2016-01-30', 45, '/images/goods/3_7.jpg');
INSERT INTO `t_goods` VALUES (24, 3, '新生儿衣服套装礼盒大全', '新生儿衣服套装礼盒大全刚出生宝宝母婴用品初生婴儿春秋满月礼物 优选有机棉小孩衣服玩具摇铃送礼套装', 668, 18, 9, '杭州', 'eotton', 12, '2016-01-28', 56, '/images/goods/3_8.jpg');
INSERT INTO `t_goods` VALUES (25, 4, '太湖花果茶酒', '苏州桥水果酒青梅杨梅桑葚茶酒桃花桂花酿玫瑰桃花醉女士低度甜酒 太湖花果茶酒12种以上口味任选', 89, 23, 6, '杭州', '苏州桥', 12, '2016-01-28', 76, '/images/goods/4_1.jpg');
INSERT INTO `t_goods` VALUES (26, 4, '乌龙茶威士忌', 'NOVELTEA诺味冷萃茶酒乌龙茶洋酒威士忌女生喝的酒少女生低度果酒', 299, 19, 0, '杭州', 'NOVELTEA/诺味', 12, '2016-01-28', 888, '/images/goods/4_2.jpg');
INSERT INTO `t_goods` VALUES (27, 4, '三十年惠泉(纪念版)黄酒', '惠泉珍藏系列三十年纪念版清爽型半甜黄酒688ml', 1680, 188, 0, '上海', '惠泉', 12, '2016-01-28', 77, '/images/goods/4_3.jpg');
INSERT INTO `t_goods` VALUES (28, 4, '野生黑灵芝片', '250克长白山紫灵芝林下灵芝黑灵芝片茶酒宜配术后恢复营养品野生', 199, 17, 0, '上海', '靠山庄', 12, '2016-01-28', 21, '/images/goods/4_4.jpg');
INSERT INTO `t_goods` VALUES (29, 4, '青海黑枸杞', '黑枸杞子正品青海非宁夏新货免洗构苟特级男肾茶泡水茶酒灌装 青海品质 原产正宗', 129, 29, 0, '上海', '鲜颗', 12, '2016-01-28', 33, '/images/goods/4_5.jpg');
INSERT INTO `t_goods` VALUES (30, 4, '250克葛根茶', '葛根片250克纯正天然葛根茶正品农家柴葛根粉块解 茶酒葛根汤 产自中国葛粉之乡 柴葛丁', 399, 59, 0, '上海', '承天府', 12, '2016-01-28', 46, '/images/goods/4_6.jpg');
INSERT INTO `t_goods` VALUES (31, 4, '蒜味虾片240g', '韩国进口零食garlic shrimp趣莱福虾片蒜味巨型膨化薯片超大  趣莱福蒜味虾片巨大抱抱袋', 129, 16, 0, '上海', '趣莱福', 12, '2016-01-28', 33, '/images/goods/4_7.jpg');
INSERT INTO `t_goods` VALUES (32, 4, '精装鸡蛋卷', '中国香港【奇华饼家】牛油手工鸡蛋卷礼盒72支装进口零食品年货 原装进口 畅享装12支*6袋', 136, 12, 0, '上海', '奇华饼家', 12, '2016-01-28', 46, '/images/goods/4_8.jpg');
INSERT INTO `t_goods` VALUES (33, 5, '防飞灰创意烟灰缸', '烟灰缸创意个性潮流奢华高档带盖客厅家用办公大 北欧ins风防飞灰 抖音同款 专利设计 支持定制', 399, 19, 5, '上海', '尚威（替烟产品）', 12, '2016-01-28', 7, '/images/goods/5_1.jpg');
INSERT INTO `t_goods` VALUES (34, 5, '陶瓷奢华女表', '夏季新品陶瓷奢华女表防水韩版女士手表时装表时尚潮流满钻石英表 水钻刻度 高硬度 潮流时尚 日本进口机芯', 249, 18, 0, '上海', 'KOVONSH/卡凡诗', 12, '2016-01-28', 1, '/images/goods/5_2.jpg');
INSERT INTO `t_goods` VALUES (35, 5, '辅酶Q10胶囊', '自然之宝辅酶q10美国原装进口coq10辅酶素ql0心脏保健品200mg80粒 保护心脏 缓解心慌心悸 关爱爸妈心健康', 558, 58, 6, '上海', 'Nature’s Bounty/自然之宝', 12, '2016-01-28', 8, '/images/goods/5_3.jpg');
INSERT INTO `t_goods` VALUES (36, 5, '女士复合维生素', '澳洲swisse斯维诗女士复合维生素片多维女性进口多种综合保健品 50种营养素 补充每日所需 焕发自信魅力', 678, 100, 0, '北京', 'swisse wellness pty ltd', 12, '2016-01-23', 0, '/images/goods/5_4.jpg');
INSERT INTO `t_goods` VALUES (37, 5, '维生素E软胶囊', '康恩贝维生素E软胶囊ve油外用面部维e外涂脸部可搭美容祛斑保健品 萃取自大豆油 高含量 高活性', 158, 18, 0, '北京', 'CONBA/康恩贝', 12, '2016-01-23', 0, '/images/goods/5_5.jpg');
INSERT INTO `t_goods` VALUES (38, 5, '同仁堂肉苁蓉', '同仁堂正品肉苁蓉新疆阿拉善鲜干片男性用泡茶泡水锁阳淫羊藿粉  同仁堂肉苁蓉 一天1片 领券减10元', 199, 19, 12, '杭州', '同仁堂', 12, '2016-01-23', 12, '/images/goods/5_6.jpg');
INSERT INTO `t_goods` VALUES (39, 5, '半干型糯米黄酒', '绍兴越景黄酒 十五年陈酿花雕酒 6瓶整箱礼盒装糯米加饭酒老酒 买1箱送精美酒具 蓝花布 宜兴陶坛', 362, 32, 12, '杭州', '越景', 12, '2016-01-23', 12, '/images/goods/5_7.jpg');
INSERT INTO `t_goods` VALUES (40, 5, '冠芳山楂树下山楂汁', '整箱山楂汁350ml*15瓶果味果汁解腻开胃官方年货 山楂树下 关晓彤同款', 119, 19, 12, '杭州', '冠芳', 12, '2016-01-23', 12, '/images/goods/5_8.jpg');
INSERT INTO `t_goods` VALUES (45, 12, '美国惠氏Centrum善存女士复合维生素', '厂名：辉瑞厂址：美国波多黎各厂家联系方式：0储藏方法：请置放于阴凉干燥处保质期：730 天品牌: CENTRUM/善存系列: 善存女士复合维生素产地: 美国适用性别: 女', 189, 109, 5, '波多黎各', '维生素', 10, '2021-03-10', 309, '/images/goods/12_1.jpg');
INSERT INTO `t_goods` VALUES (46, 12, '汤臣倍健蛋白粉 蛋白质粉600g', '品牌： 汤臣倍健（BY-HEALTH）商品毛重：1.48kg商品产地：中国珠海蓝帽标识：保健食品（食健字）适用人群：中老年，成人，男士，女士主要成分：蛋白粉', 400, 339, 6, '珠海', '蛋白质', 10, '2021-03-10', 90, '/images/goods/12_2.jpg');
INSERT INTO `t_goods` VALUES (47, 12, '牦牛骨髓壮骨粉骨折营养品补品', '生产许可证编号：SC12636098200051厂名：江西樟树市正康医药生物科技有限公司厂址：江西省宜春市樟树市城北工业园厂家联系方式：0795-7330233配料表：大豆蛋白粉、大豆分离蛋白、乳清蛋白粉、胶原蛋白粉、牦牛骨髓粉（1%）等储藏方法：密封，置于阴凉干燥处保质期：730 天品牌: 正康惠仁系列: 固体饮料省份: 江西城市: 宜春产地: 中国大陆地区', 168, 98, 4, '宜春', '钙', 10, '2021-03-10', 30, '/images/goods/12_3.jpg');
INSERT INTO `t_goods` VALUES (53, 11, '天王星挂钟', '商品名称：天王星Q8723-1商品编号：100002142935商品毛重：1.19kg商品产地：中国广东机芯：石英显示类型：指针风格：简约尺寸：14英寸', 138, 128, 5, '广东', '金', 10, '2021-03-10', 56, '/images/goods/11_1.jpg');
INSERT INTO `t_goods` VALUES (54, 11, 'Cartier卡地亚Trinity系列 玫瑰金黄金白金', '品牌: Cartier/卡地亚售后服务: 其他贵金属成色: 18K金颜色分类: 三色金规格: 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 44 66 45货号: B4086100', 8100, 7100, 5, '山东', '石英', 10, '2021-03-10', 324, '/images/goods/11_2.jpg');
INSERT INTO `t_goods` VALUES (55, 11, '轻奢挂钟客厅免打孔静音时钟表', '商品名称：Canovoe2565商品编号：10025159559238商品毛重：1.08kg货号：2565机芯：石英外壳材质：塑料适用场景：办公室，酒店，客厅', 118, 99, 5, '北欧', '石英', 10, '2021-03-10', 166, '/images/goods/11_3.jpg');
INSERT INTO `t_goods` VALUES (62, 10, '乐士利雅电子相册高清数码相框', '产品名称：LSLY/乐士利雅 DPF-H19Z...数码相框品牌: LSLY/乐士利雅型号: DPF-H19Z300数码相框自带内存容量: 无容量颜色分类: 15.6寸钢化玻璃（白色） 15.6寸钢化玻璃（黑色） 19寸面壳款（白色） 19寸面壳款（黑色） 19寸钢化玻璃（白色） 19寸钢化玻璃（黑色） 22寸面壳款（白色） 22寸面壳款（黑色） 22寸钢化玻璃（白色） 22寸钢化玻璃（黑色） 24寸面壳款（白色） 24寸面壳款（黑色） 24寸钢化玻璃（黑色）生产企业: 北京乐士利雅科技有限公司', 1700, 999, 5, '中国大陆', '电子', 10, '2021-03-10', 78, '/images/goods/10_1.jpg');
INSERT INTO `t_goods` VALUES (63, 10, '荣耀耳机原装正品am115半入耳式', '产品名称：honor/荣耀 荣耀am115耳机线控耳机品牌: honor/荣耀型号: 荣耀AM115耳机产地: 中国大陆颜色分类: AM115 普通款-入耳式（盒装带防伪） AM116 金属款-入耳式（盒装带防伪） AM33 【Tpye-c接口】白色经典款套餐类型: 官方标配生产企业: 华为技术有限公司佩戴方式: 入耳式线控耳机性质: 原装', 49, 25, 5, '广东', '电子', 10, '2021-03-10', 88, '/images/goods/10_2.jpg');
INSERT INTO `t_goods` VALUES (64, 10, '海邦电钢琴88键重锤家用', '品牌: 海邦（乐器）型号: HB-122Q颜色分类: 初级款-木纹黑【初学入门】加盖 初级款-木纹白【初学入门】加盖 升级款-重锤-木纹黑【多功能】 升级款-重锤-木纹白【多功能】 赠送app 跟弹 视频教程【买琴 送教程】 【新手零基础 快速学会】亮灯学习 指示辅助 收藏加购【送尤克里里 12种豪礼】 初级款-木纹黑【初学入门】 初级款-木纹白【初学入门】 高箱 真纲级-烤漆黑【加高加厚 真钢音色】蓝牙 升级款-重锤-烤漆白【多功能】 升级款-重锤-烤漆黑【多功能】 高箱 真纲级-烤漆粉【亮灯跟弹 快速上手】蓝牙 演奏级-重锤-烤漆黑【真钢音色】 豪华 大立式-古典烤漆白【媲美钢琴 加大喇叭】 升级款 翻-重锤-烤漆白【多功能】 高性价比【多功能 考级专用】 高箱 真纲级-烤漆白【加高加厚 真钢音色】蓝牙 高箱 真纲级-烤漆粉【加高加厚 真钢音色】蓝牙 老师 强烈推荐款【媲美钢琴 十级专用】 升级款 翻-重锤-烤漆黑【多功能】 高箱 真纲级-烤漆黑【亮灯跟弹 快速上手】蓝牙 高箱 真纲级-烤漆白【亮灯跟弹 快速上手】蓝牙 【限5台 秒1998元】真纲级-高箱【加高加厚】黑 演奏级-重锤-烤漆白【真钢音色】 豪华 大立式-古典烤漆黑【媲美钢琴 加大喇叭】价格区间: 1001-3000元最大复音数: 128个音色数: 201种以上踏板数: 三个键盘类型: 逐级配重键盘是否有导购视频: 有', 3010, 1400, 5, '天津', '电子', 10, '2021-03-10', 99, '/images/goods/10_3.jpg');
INSERT INTO `t_goods` VALUES (65, 9, '知味观纯藕粉300克 杭州特产西湖藕粉', '生产许可证编号：SC11333011001024产品标准号：GB/T 25733厂名：杭州万隆果干食品有限公司厂址：浙江省杭州市余杭区乔司街道方桥村厂家联系方式：18958030030配料表：详见包装储藏方法：阴凉、干燥通风处保存保质期：360 天食品添加剂：详见包装品牌: 知味观系列: 西湖纯藕粉产地: 中国大陆', 40, 32, 5, '杭州', '莲藕', 10, '2021-03-10', 40, '/images/goods/9_1.jpg');
INSERT INTO `t_goods` VALUES (66, 9, '喜多多 牛奶花生370g*6罐整箱', '生产许可证编号：SC10935058201141厂名：福建省泉州喜多多食品有限公司厂址：福建泉州市东石井林开发区井林村安东路3-11厂家联系方式：400-026-6777配料表：水，花生仁，白砂糖，糯米浆，奶粉等储藏方法：置于阴凉干燥处保质期：720 天品牌: 喜多多规格: 370牛奶花生产地: 中国大陆省份: 福建省城市: 泉州市', 42, 36, 5, '泉州', '花生', 10, '2021-03-10', 38, '/images/goods/9_2.jpg');
INSERT INTO `t_goods` VALUES (67, 9, '嘉顿加拿饼干400g铁罐装', '生产许可证编号：SC10844190002126产品标准号：GB/T20980厂名：华嘉食品有限公司厂址：东莞市体育路1号厂家联系方式：0769-22464101配料表：详情请看配料表储藏方法：请贮存于阴凉干爽之处保质期：365 天品牌: GARDEN/嘉顿系列: 加拿400g口味: 加拿饼罐装400g*1 加拿400g*2产地: 中国大陆', 65, 58, 6, '中国大陆', '小麦', 10, '2021-03-10', 52, '/images/goods/9_3.jpg');
INSERT INTO `t_goods` VALUES (68, 8, 'Topgo德国指甲刀套装家用剪指甲钳', '品牌: 桃花谷颜色分类: 真空电镀升级版【黑红皮套】 真空电镀升级版【黑色皮套】 ABS鹰嘴钳+真空电镀升级版【黑色皮套】 ABS鹰嘴钳+碳钢工艺指甲刀套装/弯头剪【曜黑皮套】 耳道清洁2件套+碳钢工艺指甲刀套装/弯头剪【曜黑】 碳钢工艺指甲刀套装/弯头剪【曜黑皮套】 碳钢工艺指甲刀套装/弯头剪【黑漾红】 玫瑰金9件套【米黄皮套】 玫瑰金9件套【浅绿皮套】 锌合金指甲刀升级9件套【黑色皮套】 修甲10件套【黑色皮套】 手足护理12件套【黑色皮套】商品类型: 个人洗漱/清洁/护理货号: HG18013适用对象: 通用', 52, 40, 5, '中国大陆', '金属', 10, '2021-03-10', 21, '/images/goods/8_1.jpg');
INSERT INTO `t_goods` VALUES (69, 8, 'AloeFresh口喷去口臭口气清新剂', '产品名称：瑷芦清 口气清新喷雾15ml品牌: 瑷芦清型号: 口气清新喷雾15ml产地: 其他净含量: 15mL适用对象: 通用规格类型: 常规单品', 99, 89, 5, '意大利', '清新剂', 10, '2021-03-10', 72, '/images/goods/8_2.jpg');
INSERT INTO `t_goods` VALUES (70, 8, '密森洗头梳头皮梳洗发按摩梳刷', '品牌: 密森（洗护）颜色分类: 浅绿色 粉红色商品类型: 个人洗漱/清洁/护理货号: 2020091501梳子种类: 气囊按摩梳', 79, 49, 5, '上海', '塑料', 10, '2021-03-10', 43, '/images/goods/8_3.jpg');
INSERT INTO `t_goods` VALUES (71, 7, '厨房置物架落地多层夹缝架烤箱微波炉锅碗碟储物架', '品牌: 宝爵（家居）功能: 其他/other材质: 金属风格: 北欧风格安装方式: 免打孔流行元素: 纯色颜色分类: 网板架】2网1板】三层：50CM 网板架】3网1板】四层：50CM 网板架】2网2板】四层：50CM 网板架】4网1板】五层：50CM 网板架】3网2板】五层：50CM 网板架】2网1板】三层：58CM 网板架】3网1板】四层：58CM 网板架】2网2板】四层：58CM 网板架】4网1板】五层：58CM 网板架】3网2板】五层：58CM 黑色】加粗】落地调节款】带护拦】三层：58CM 黑色】加粗】落地调节款】带护拦】三层：63CM 黑色】加粗】落地调节款】带护拦】三层：71CM 黑色】加粗】落地调节款】带护拦】三层：81CM 黑色】加粗】落地调节款】带护拦】四层：58CM 黑色】加粗】落地调节款】带护拦】四层：63CM 黑色】加粗】落地调节款】带护拦】四层：71CM 黑色】加粗】落地调节款】带护拦】四层：81CM 黑色】加粗】落地调节款】带护拦】五层：58CM 黑色】加粗】落地调节款】带护拦】五层：63CM 黑色】加粗】落地调节款】带护拦】五层：71CM 黑色】加粗】落地调节款】带护拦】五层：81CM置物用品类型: 微波炉', 996, 498, 5, '佛山', '塑料', 10, '2021-03-10', 49, '/images/goods/7_1.jpg');
INSERT INTO `t_goods` VALUES (72, 7, '舒适拎塑料袋提手 买菜手提方便袋书包防勒手', '品牌: 尚品格尚产地: 中国大陆颜色分类: 硅胶提菜器3个装（北欧粉） 硅胶提菜器3个装（北欧蓝） 硅胶提菜器3个装（北欧绿） 硅胶提菜器3个装（混色） 塑料提菜器1个装（黑色） 塑料提菜器1个装（红色） 塑料提菜器1个装（蓝色） 塑料提菜器1个装（紫色） 塑料提菜器2个装（黑色） 塑料提菜器2个装（红色） 塑料提菜器2个装（蓝色） 塑料提菜器2个装（紫色） 铝合金提菜器1个装（金色） 铝合金提菜器1个装（蓝色） 铝合金提菜器1个装（绿色） 铝合金提菜器1个装（紫色） 手提袋吊4个装（颜色随机）货号: 33202-98566', 20, 13, 5, '宿迁', '塑料', 10, '2021-03-10', 55, '/images/goods/7_2.jpg');
INSERT INTO `t_goods` VALUES (73, 7, '2个装加厚马桶垫坐垫家用冬季纽扣款坐便套', '品牌: HANO材质: 腈纶件数: 2件流行元素: 纯色颜色分类: 粉色2个装 蓝色2个装 咖啡2个装 桔色2个装 嫩绿2个装 喜庆红2个装 皮红2个装 军绿2个装 紫色2个装 紫红2个装 米黄2个装 卡其2个装 粉色+咖啡 粉色+米黄 粉色+军绿 粉色+桔色 随机2个不同色 粉色+紫色 粉色+嫩绿 卡其+米黄 军绿+嫩绿 卡其+咖啡 粉色+蓝色 粉色+紫红货号: LGZNK马桶套类型: 外套式马桶套', 42, 21, 5, '嘉兴', '棉', 10, '2021-03-10', 26, '/images/goods/7_3.jpg');
INSERT INTO `t_goods` VALUES (74, 6, '大容量轻便旅行包包女手提运动斜挎包', '品牌: rarapop质地: 牛津纺图案: 条纹风格: 日韩箱包尺寸: 50CM*32CM*20CM性别: 女流行元素: 撞色颜色分类: 经典条纹-灰色9339 经典条纹-墨绿9339 经典条纹-卡其9339 经典条纹-宝蓝9339 高档绒布-米色9339 高档绒布-咖啡色9339 高档绒布-橄榄绿9339 高档绒布-松花绿9339内部结构: 拉链暗袋 手机袋 证件袋', 598, 139, 5, '广州', '涤纶', 10, '2021-03-10', 98, '/images/goods/6_1.jpg');
INSERT INTO `t_goods` VALUES (75, 6, '密码箱子女行李箱学生万向轮', '品牌: UNIWALKER/尤尼沃尔科质地: PU闭合方式: 锁扣图案: 格子风格: 小清新成色: 全新尺寸: 20寸 登机箱 新品送礼品十 22寸 登机箱 新品送礼品十 24寸 托运箱 新品送礼品十 26寸 托运箱 新品送礼品十性别: 女颜色分类: 蓝色风铃 蓝色风铃套装 蓝色', 998, 738, 5, '苏州', '涤纶', 10, '2021-03-10', 92, '/images/goods/6_2.jpg');
INSERT INTO `t_goods` VALUES (76, 6, '风衣女中长款英伦风赫本女装', '品牌: 迪芬·璐嘉适用年龄: 30-34周岁尺码: M/160 L/165 XL/170 XXL/175 XXXL/180图案: 纯色风格: 通勤通勤: 韩版领子: 连帽衣门襟: 单排扣颜色分类: 黑色', 1380, 439, 5, '嘉兴', '毛呢', 10, '2021-03-10', 52, '/images/goods/6_3.jpg');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `order_status` int NOT NULL,
  `order_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_postalfee` float NOT NULL,
  `order_date` date NOT NULL,
  `order_postcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_postname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `uid`(`user_id`) USING BTREE,
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 175 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 6144 kB; (`goods_id`) REFER `mybatis/t_goods`; ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (73, '20160202123137246067', 1, 2, '辽宁 大连 甘井子区 软件园路8号117 (张三收) 13345678902', 10, '2016-02-02', '', '');
INSERT INTO `t_order` VALUES (90, '20160202155239781000', 1, 2, '辽宁 大连 甘井子区 软件园路8号117 (张三收) 13345678902', 12, '2016-02-02', '', '');
INSERT INTO `t_order` VALUES (91, '20160202155300248085', 1, 6, '辽宁 大连 甘井子区 软件园路8号117 (张三收) 13345678902', 12, '2016-02-02', 'fasdf', 'fasf');
INSERT INTO `t_order` VALUES (92, '20160202155350125072', 1, 3, '辽宁 大连 甘井子区 软件园路8号117 (张三收) 13345678902', 12, '2016-02-02', '', '');
INSERT INTO `t_order` VALUES (97, '20160202172704199043', 1, 8, '辽宁 大连 甘井子区 软件园路8号117 (张三收) 13345678902', 12, '2016-02-02', '', '');
INSERT INTO `t_order` VALUES (99, '20160203090941327048', 1, 2, '辽宁 大连 甘井子区 软件园路8号117 (张三收) 13345678902', 12, '2016-02-03', '', '');
INSERT INTO `t_order` VALUES (100, '20160203094114820018', 1, 2, '辽宁 大连 甘井子区 软件园路8号117 (张三收) 13345678902', 12, '2016-02-03', '', '');
INSERT INTO `t_order` VALUES (101, '20160203110916755010', 1, 2, '辽宁 大连 甘井子区 软件园路8号117 (张三收) 13345678902', 12, '2016-02-03', '', '');
INSERT INTO `t_order` VALUES (102, '20160203110926188028', 1, 2, '辽宁 大连 甘井子区 软件园路8号117 (张三收) 13345678902', 12, '2016-02-03', '', '');
INSERT INTO `t_order` VALUES (103, '20160202155146375062', 1, 8, '啊啊啊', 1, '2016-02-10', NULL, NULL);
INSERT INTO `t_order` VALUES (110, '20160212093545949027', 4, 8, '2 2 2 2 (2收) 3', 11, '2016-02-12', '32412341234123', '顺丰快递');
INSERT INTO `t_order` VALUES (113, '20170624091920523008', 32, 3, '辽宁 大连 甘井子 软件园路8号 (王洪岩收) 10086', 12, '2017-06-24', '', '');
INSERT INTO `t_order` VALUES (114, '20170811082128061021', 4, 0, '2 2 2 2 (2收) 3', 12, '2017-08-11', '', '');
INSERT INTO `t_order` VALUES (115, '20170827140205536022', 1, 0, '辽宁 大连 甘井子区 软件园路8号117 (张三收) 13345678902', 12, '2017-08-27', '', '');
INSERT INTO `t_order` VALUES (116, '20170827164759735011', 1, 0, '辽宁 大连 甘井子区 软件园路8号117 (张三收) 13345678902', 10, '2017-08-27', '', '');
INSERT INTO `t_order` VALUES (117, '20170827164818926033', 1, 0, '辽宁 大连 甘井子区 软件园路8号117 (张三收) 13345678902', 12, '2017-08-27', '', '');
INSERT INTO `t_order` VALUES (118, '20170827165316810036', 1, 0, '辽宁 大连 甘井子区 软件园路8号117 (张三收) 13345678902', 12, '2017-08-27', '', '');
INSERT INTO `t_order` VALUES (119, '20170827181554717019', 1, 0, '辽宁 大连 \r\n													甘井子区 软件园路8号117 (张三收) \r\n													13345678902', 12, '2017-08-27', '', '');
INSERT INTO `t_order` VALUES (120, '20170828081159248041', 1, 0, '辽宁 大连 \r\n													甘井子区 软件园路8号117 (张三收) \r\n													13345678902', 12, '2017-08-28', '', '');
INSERT INTO `t_order` VALUES (121, '20170829083600405001', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王收) \r\n													10010', 12, '2017-08-29', '', '');
INSERT INTO `t_order` VALUES (122, '20170830091401997012', 1, 1, '1 1 \r\n													1 1 (1收) \r\n													1', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (123, '20170830091510579085', 1, 0, '1 1 \r\n													1 1 (1收) \r\n													1', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (124, '20170830093849828090', 1, 0, '辽宁 大连 \r\n													甘井子 软件园路 (王先生收) \r\n													10086', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (129, '20170830094305839003', 1, 0, '1 1 \r\n													1 1 (1收) \r\n													1', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (130, '20170830094413329082', 1, 0, '1 1 \r\n													1 1 (1æ¶) \r\n													1', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (131, '20170830094539889082', 1, 0, '1 1 \r\n													1 1 (1收) \r\n													1', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (132, '20170830094647749032', 1, 0, '辽宁 大连 \r\n													甘井子  (收) \r\n													', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (133, '20170830100229634059', 1, 1, '辽宁 大连 \r\n													甘井子  (收) \r\n													', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (134, '20170830100348271060', 1, 0, 'è¾½å® å¤§è¿ \r\n													çäºå­  (æ¶) \r\n													', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (135, '20170830100401090078', 1, 0, 'è¾½å® å¤§è¿ \r\n													çäºå­  (æ¶) \r\n													18788889999', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (136, '20170830100443006058', 1, 9, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (137, '20170830101753239004', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (138, '20170830102114509050', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (139, '20170830102900467029', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (140, '20170830103515781073', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (141, '20170830103703990042', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (142, '20170830103706070051', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (143, '20170830103741620096', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-08-30', '', '');
INSERT INTO `t_order` VALUES (151, '20170831080931148068', 1, 1, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-08-31', '', '');
INSERT INTO `t_order` VALUES (152, '20170831082039569023', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-08-31', '', '');
INSERT INTO `t_order` VALUES (153, '20170831082109959002', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-08-31', '', '');
INSERT INTO `t_order` VALUES (154, '20170831091018274095', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-08-31', '', '');
INSERT INTO `t_order` VALUES (155, '20170831091821267050', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-08-31', '', '');
INSERT INTO `t_order` VALUES (156, '20170901075919436014', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-09-01', '', '');
INSERT INTO `t_order` VALUES (157, '20170901080454772066', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-09-01', '', '');
INSERT INTO `t_order` VALUES (161, '20170904080417931081', 1, 9, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-09-04', '', '');
INSERT INTO `t_order` VALUES (162, '20170904080437882083', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-09-04', '', '');
INSERT INTO `t_order` VALUES (163, '20170904080451758024', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-09-04', '', '');
INSERT INTO `t_order` VALUES (164, '20170904080845465093', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2017-09-04', '', '');
INSERT INTO `t_order` VALUES (165, '20210303131947432008', 1, 1, '辽宁 大连 高新园 软件园路8号 (王先生收) 18788889999', 12, '2021-03-03', '', '');
INSERT INTO `t_order` VALUES (166, '20210308141450396032', 4, 1, '2 2 \r\n													2 2 (2收) \r\n													3', 12, '2021-03-08', '', '');
INSERT INTO `t_order` VALUES (167, '20210309165716656018', 4, 1, '2 2 \r\n													2 2 (2收) \r\n													3', 12, '2021-03-09', '', '');
INSERT INTO `t_order` VALUES (168, '20210310082244228063', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2021-03-10', '', '');
INSERT INTO `t_order` VALUES (169, '20210310104141821038', 1, 0, '辽宁 大连 \r\n													高新园 软件园路8号 (王先生收) \r\n													18788889999', 12, '2021-03-10', '', '');
INSERT INTO `t_order` VALUES (170, '20210310171413715025', 4, 0, '2 2 \r\n													2 2 (2收) \r\n													3', 12, '2021-03-10', '', '');
INSERT INTO `t_order` VALUES (171, '20210310171422580090', 4, 1, '2 2 \r\n													2 2 (2收) \r\n													3', 12, '2021-03-10', '', '');
INSERT INTO `t_order` VALUES (172, '20210310181508845082', 4, 0, '2 2 \r\n													2 2 (2收) \r\n													3', 12, '2021-03-10', '', '');
INSERT INTO `t_order` VALUES (173, '20210310181646998033', 4, 1, '2 2 \r\n													2 2 (2收) \r\n													3', 12, '2021-03-10', '', '');
INSERT INTO `t_order` VALUES (174, '20210311125506067058', 4, 0, '2 2 \r\n													2 2 (2收) \r\n													3', 10, '2021-03-11', '', '');
INSERT INTO `t_order` VALUES (175, '20220312145400188083', 1, 0, '', 12, '2022-03-12', '', '');
INSERT INTO `t_order` VALUES (176, '20220312145456779028', 1, 0, '', 10, '2022-03-12', '', '');

-- ----------------------------
-- Table structure for t_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_orderdetail`;
CREATE TABLE `t_orderdetail`  (
  `odetail_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `goods_id` int NULL DEFAULT NULL,
  `odetail_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `odetail_price` float NOT NULL,
  `odetail_num` int NOT NULL,
  `odetail_pic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`odetail_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `t_orderdetail_ibfk_2`(`goods_id`) USING BTREE,
  CONSTRAINT `t_orderdetail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_orderdetail_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`goods_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 215 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_orderdetail
-- ----------------------------
INSERT INTO `t_orderdetail` VALUES (16, 73, 23, '男装 军旅式短茄克23', 177, 13, 'undefined');
INSERT INTO `t_orderdetail` VALUES (17, 73, 1, '女装 军旅式短茄克1', 233, 13, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (18, 73, 3, '女装 军旅式短茄克3', 32, 1, 'undefined');
INSERT INTO `t_orderdetail` VALUES (19, 73, 6, '女装 军旅式短茄克6', 122, 1, 'undefined');
INSERT INTO `t_orderdetail` VALUES (20, 73, 7, '女装 军旅式短茄克7', 134, 1, 'undefined');
INSERT INTO `t_orderdetail` VALUES (21, 73, 8, '女装 军旅式短茄克8', 134, 2, 'undefined');
INSERT INTO `t_orderdetail` VALUES (22, 73, 9, '女装 军旅式短茄克9', 177, 1, 'undefined');
INSERT INTO `t_orderdetail` VALUES (23, 73, 10, '女装 军旅式短茄克10', 177, 1, 'undefined');
INSERT INTO `t_orderdetail` VALUES (24, 73, 12, '女装 军旅式短茄克12', 177, 1, 'undefined');
INSERT INTO `t_orderdetail` VALUES (25, 73, 13, '女装 军旅式短茄克13', 177, 1, 'undefined');
INSERT INTO `t_orderdetail` VALUES (26, 73, 14, '女装 军旅式短茄克14', 177, 1, 'undefined');
INSERT INTO `t_orderdetail` VALUES (27, 73, 15, '女装 军旅式短茄克15', 177, 1, 'undefined');
INSERT INTO `t_orderdetail` VALUES (28, 73, 16, '女装 军旅式短茄克16', 177, 1, 'undefined');
INSERT INTO `t_orderdetail` VALUES (29, 73, 2, '女装 军旅式短茄克2', 243, 1, 'undefined');
INSERT INTO `t_orderdetail` VALUES (30, 73, 1, '女装 军旅式短茄克1', 233, 2, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (119, 90, 23, '男装 军旅式短茄克23', 177, 1, 'undefined');
INSERT INTO `t_orderdetail` VALUES (120, 91, 23, '男装 军旅式短茄克23', 177, 1, 'undefined');
INSERT INTO `t_orderdetail` VALUES (121, 92, 6, '女装 军旅式短茄克6', 122, 1, 'undefined');
INSERT INTO `t_orderdetail` VALUES (126, 97, 3, '女装 军旅式短茄克3', 32, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (128, 99, 1, '女装 军旅式短茄克1', 233, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (129, 100, 7, '女装 军旅式短茄克7', 134, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (130, 101, 1, '女装 军旅式短茄克1', 233, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (131, 102, 22, '男装 军旅式短茄克22', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (132, 103, 1, '女装 军旅夹克', 233, 3, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (133, 103, 1, '女装 军旅夹克', 233, 3, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (135, 103, 2, '女装 军旅短夹克', 233, 5, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (151, 110, NULL, '测试', 222, 5, '/images/goods/pics/14552392714730.jpg');
INSERT INTO `t_orderdetail` VALUES (154, 113, 1, '女装 军旅式短茄克1', 233, 2, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (155, 114, 14, '女装 军旅式短茄克14', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (156, 115, 17, '女装 军旅式短茄克17', 23, 2, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (157, 115, 18, '女装 军旅式短茄克18', 17, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (158, 116, 2, '女装 军旅式短茄克2', 243, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (159, 117, 19, '女装 军旅式短茄克19', 23, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (160, 118, 22, '男装 军旅式短茄克22', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (161, 119, 22, '男装 军旅式短茄克22', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (162, 120, 18, '女装 军旅式短茄克18', 17, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (163, 121, 17, '女装 军旅式短茄克17', 23, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (164, 122, 23, '男装 军旅式短夹克23', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (165, 123, 14, '女装 军旅式短夹克14', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (166, 124, 23, '男装 军旅式短夹克23', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (171, 129, 23, '男装 军旅式短夹克23', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (172, 130, 23, '男装 军旅式短夹克23', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (173, 131, 23, '男装 军旅式短夹克23', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (174, 132, 10, '女装 军旅式短夹克10', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (175, 133, 23, '男装 军旅式短夹克23', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (176, 134, 23, '男装 军旅式短夹克23', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (177, 135, 23, '男装 军旅式短夹克23', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (178, 136, 23, '男装 军旅式短夹克23', 177, 3, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (179, 137, 23, '男装 军旅式短夹克23', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (180, 138, 14, '女装 军旅式短夹克14', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (181, 139, 14, '女装 军旅式短夹克14', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (182, 140, 14, '女装 军旅式短夹克14', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (183, 141, 14, '女装 军旅式短夹克14', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (184, 142, 14, '女装 军旅式短夹克14', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (185, 143, 14, '女装 军旅式短夹克14', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (190, 151, 10, '女装 军旅式短夹克10', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (191, 152, 3, '女装 军旅式短夹克3', 32, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (192, 153, 3, '女装 军旅式短夹克3', 32, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (193, 154, 10, '女装 军旅式短夹克10', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (194, 155, 6, '女装 军旅式短夹克6', 122, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (195, 156, 18, '女装 军旅式短夹克18', 17, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (196, 157, 18, '女装 军旅式短夹克18', 17, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (200, 161, 14, '女装 军旅式短夹克14', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (201, 162, 14, '女装 军旅式短夹克14', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (202, 163, 14, '女装 军旅式短夹克14', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (203, 164, 14, '女装 军旅式短夹克14', 177, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (204, 165, 22, '男装 军旅式短夹克22', 177, 1, '/images/goods/1_1.jpg');
INSERT INTO `t_orderdetail` VALUES (205, 166, 1, '女装 军旅式短夹克1', 233, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (206, 167, 4, '凯朵立体双效眉笔', 30, 4, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (207, 168, 1, '雅诗兰黛DW持妆粉底液', 100, 1, '/images/goods/2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (208, 169, 27, '自然堂雪域套装护肤品补水保湿水乳', 218, 1, '/images/goods/3_2.jpg');
INSERT INTO `t_orderdetail` VALUES (209, 170, 27, '自然堂雪域套装护肤品补水保湿水乳', 218, 1, '/images/goods/3_2.jpg');
INSERT INTO `t_orderdetail` VALUES (210, 171, 27, '自然堂雪域套装护肤品补水保湿水乳', 218, 1, '/images/goods/3_2.jpg');
INSERT INTO `t_orderdetail` VALUES (211, 172, 27, '自然堂雪域套装护肤品补水保湿水乳', 218, 1, '/images/goods/3_2.jpg');
INSERT INTO `t_orderdetail` VALUES (212, 173, 27, '自然堂雪域套装护肤品补水保湿水乳', 218, 1, '/images/goods/3_2.jpg');
INSERT INTO `t_orderdetail` VALUES (213, 174, 27, '自然堂雪域套装护肤品补水保湿水乳', 218, 1, '/images/goods/3_2.jpg');
INSERT INTO `t_orderdetail` VALUES (214, 174, 45, '美国惠氏Centrum善存女士复合维生素', 109, 1, '/images/goods/pics/12_1.jpg');
INSERT INTO `t_orderdetail` VALUES (215, 175, 22, '立体型防溢乳垫', 8, 1, '/images/goods/pics/3_6_2.jpg');
INSERT INTO `t_orderdetail` VALUES (216, 176, 2, '科颜氏亚马逊白泥清洁面膜', 50, 2, '/images/goods/pics/1_2_1.jpg');
INSERT INTO `t_orderdetail` VALUES (217, 176, 75, '密码箱子女行李箱学生万向轮', 738, 5, '/images/goods/pics/6_2.jpg');

-- ----------------------------
-- Table structure for t_pic
-- ----------------------------
DROP TABLE IF EXISTS `t_pic`;
CREATE TABLE `t_pic`  (
  `pic_id` int NOT NULL AUTO_INCREMENT,
  `goods_id` int NOT NULL,
  `pic_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE,
  INDEX `go_id`(`goods_id`) USING BTREE,
  CONSTRAINT `go_id` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`goods_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 212 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pic
-- ----------------------------
INSERT INTO `t_pic` VALUES (1, 1, '/images/goods/pics/1_1_1.jpg');
INSERT INTO `t_pic` VALUES (2, 1, '/images/goods/pics/1_1_2.jpg');
INSERT INTO `t_pic` VALUES (3, 1, '/images/goods/pics/1_1_3.jpg');
INSERT INTO `t_pic` VALUES (4, 2, '/images/goods/pics/1_2_1.jpg');
INSERT INTO `t_pic` VALUES (5, 2, '/images/goods/pics/1_2_2.jpg');
INSERT INTO `t_pic` VALUES (6, 2, '/images/goods/pics/1_2_3.jpg');
INSERT INTO `t_pic` VALUES (7, 3, '/images/goods/pics/1_3_1.jpg');
INSERT INTO `t_pic` VALUES (8, 3, '/images/goods/pics/1_3_2.jpg');
INSERT INTO `t_pic` VALUES (9, 3, '/images/goods/pics/1_3_3.jpg');
INSERT INTO `t_pic` VALUES (10, 4, '/images/goods/pics/1_4_1.jpg');
INSERT INTO `t_pic` VALUES (11, 4, '/images/goods/pics/1_4_2.jpg');
INSERT INTO `t_pic` VALUES (12, 4, '/images/goods/pics/1_4_3.png');
INSERT INTO `t_pic` VALUES (13, 5, '/images/goods/pics/1_5_1.jpg');
INSERT INTO `t_pic` VALUES (14, 5, '/images/goods/pics/1_5_2.jpg');
INSERT INTO `t_pic` VALUES (15, 5, '/images/goods/pics/1_5_3.jpg');
INSERT INTO `t_pic` VALUES (16, 6, '/images/goods/pics/1_6_1.jpg');
INSERT INTO `t_pic` VALUES (17, 6, '/images/goods/pics/1_6_2.jpg');
INSERT INTO `t_pic` VALUES (18, 6, '/images/goods/pics/1_6_3.jpg');
INSERT INTO `t_pic` VALUES (19, 7, '/images/goods/pics/1_7_1.jpg');
INSERT INTO `t_pic` VALUES (20, 7, '/images/goods/pics/1_7_2.jpg');
INSERT INTO `t_pic` VALUES (21, 7, '/images/goods/pics/1_7_3.jpg');
INSERT INTO `t_pic` VALUES (22, 8, '/images/goods/pics/1_8_1.jpg');
INSERT INTO `t_pic` VALUES (23, 8, '/images/goods/pics/1_8_2.jpg');
INSERT INTO `t_pic` VALUES (24, 8, '/images/goods/pics/1_8_3.jpg');
INSERT INTO `t_pic` VALUES (25, 9, '/images/goods/pics/2_1_1.jpg');
INSERT INTO `t_pic` VALUES (26, 9, '/images/goods/pics/2_1_2.jpg');
INSERT INTO `t_pic` VALUES (27, 9, '/images/goods/pics/2_1_3.jpg');
INSERT INTO `t_pic` VALUES (28, 10, '/images/goods/pics/2_2_1.jpg');
INSERT INTO `t_pic` VALUES (29, 10, '/images/goods/pics/2_2_2.jpg');
INSERT INTO `t_pic` VALUES (30, 10, '/images/goods/pics/2_2_3.jpg');
INSERT INTO `t_pic` VALUES (31, 11, '/images/goods/pics/2_3_1.jpg');
INSERT INTO `t_pic` VALUES (32, 11, '/images/goods/pics/2_3_2.jpg');
INSERT INTO `t_pic` VALUES (33, 11, '/images/goods/pics/2_3_3.jpg');
INSERT INTO `t_pic` VALUES (34, 12, '/images/goods/pics/2_4_1.jpg');
INSERT INTO `t_pic` VALUES (35, 12, '/images/goods/pics/2_4_2.jpg');
INSERT INTO `t_pic` VALUES (36, 12, '/images/goods/pics/2_4_3.jpg');
INSERT INTO `t_pic` VALUES (37, 13, '/images/goods/pics/2_5_1.jpg');
INSERT INTO `t_pic` VALUES (38, 13, '/images/goods/pics/2_5_2.jpg');
INSERT INTO `t_pic` VALUES (39, 13, '/images/goods/pics/2_5_3.jpg');
INSERT INTO `t_pic` VALUES (40, 14, '/images/goods/pics/2_6_1.jpg');
INSERT INTO `t_pic` VALUES (41, 14, '/images/goods/pics/2_6_2.jpg');
INSERT INTO `t_pic` VALUES (42, 14, '/images/goods/pics/2_6_3.jpg');
INSERT INTO `t_pic` VALUES (43, 15, '/images/goods/pics/2_7_1.jpg');
INSERT INTO `t_pic` VALUES (44, 15, '/images/goods/pics/2_7_2.jpg');
INSERT INTO `t_pic` VALUES (45, 15, '/images/goods/pics/2_7_3.jpg');
INSERT INTO `t_pic` VALUES (46, 16, '/images/goods/pics/2_8_1.jpg');
INSERT INTO `t_pic` VALUES (47, 16, '/images/goods/pics/2_8_2.jpg');
INSERT INTO `t_pic` VALUES (48, 16, '/images/goods/pics/2_8_3.jpg');
INSERT INTO `t_pic` VALUES (49, 17, '/images/goods/pics/3_1_1.jpg');
INSERT INTO `t_pic` VALUES (50, 17, '/images/goods/pics/3_1_2.jpg');
INSERT INTO `t_pic` VALUES (51, 17, '/images/goods/pics/3_1_3.jpg');
INSERT INTO `t_pic` VALUES (52, 18, '/images/goods/pics/3_2_1.jpg');
INSERT INTO `t_pic` VALUES (53, 18, '/images/goods/pics/3_2_2.jpg');
INSERT INTO `t_pic` VALUES (54, 18, '/images/goods/pics/3_2_3.gif');
INSERT INTO `t_pic` VALUES (55, 19, '/images/goods/pics/3_3_1.jpg');
INSERT INTO `t_pic` VALUES (56, 19, '/images/goods/pics/3_3_2.jpg');
INSERT INTO `t_pic` VALUES (57, 19, '/images/goods/pics/3_3_3.jpg');
INSERT INTO `t_pic` VALUES (58, 20, '/images/goods/pics/3_4_1.jpg');
INSERT INTO `t_pic` VALUES (59, 20, '/images/goods/pics/3_4_2.jpg');
INSERT INTO `t_pic` VALUES (60, 20, '/images/goods/pics/3_4_3.jpg');
INSERT INTO `t_pic` VALUES (61, 21, '/images/goods/pics/3_5_1.jpg');
INSERT INTO `t_pic` VALUES (62, 21, '/images/goods/pics/3_5_2.jpg');
INSERT INTO `t_pic` VALUES (63, 21, '/images/goods/pics/3_5_3.jpg');
INSERT INTO `t_pic` VALUES (64, 22, '/images/goods/pics/3_6_1.jpg');
INSERT INTO `t_pic` VALUES (65, 22, '/images/goods/pics/3_6_2.jpg');
INSERT INTO `t_pic` VALUES (66, 22, '/images/goods/pics/3_6_3.jpg');
INSERT INTO `t_pic` VALUES (67, 23, '/images/goods/pics/3_7_1.jpg');
INSERT INTO `t_pic` VALUES (68, 23, '/images/goods/pics/3_7_2.jpg');
INSERT INTO `t_pic` VALUES (69, 23, '/images/goods/pics/3_7_3.jpg');
INSERT INTO `t_pic` VALUES (70, 24, '/images/goods/pics/3_8_1.jpg');
INSERT INTO `t_pic` VALUES (71, 24, '/images/goods/pics/3_8_2.jpg');
INSERT INTO `t_pic` VALUES (72, 24, '/images/goods/pics/3_8_3.jpg');
INSERT INTO `t_pic` VALUES (73, 25, '/images/goods/pics/4_1_1.jpg');
INSERT INTO `t_pic` VALUES (74, 25, '/images/goods/pics/4_1_2.jpg');
INSERT INTO `t_pic` VALUES (75, 25, '/images/goods/pics/4_1_3.jpg');
INSERT INTO `t_pic` VALUES (76, 26, '/images/goods/pics/4_2_1.jpg');
INSERT INTO `t_pic` VALUES (77, 26, '/images/goods/pics/4_2_2.jpg');
INSERT INTO `t_pic` VALUES (78, 26, '/images/goods/pics/4_2_3.jpg');
INSERT INTO `t_pic` VALUES (79, 27, '/images/goods/pics/4_3_1.jpg');
INSERT INTO `t_pic` VALUES (80, 27, '/images/goods/pics/4_3_2.jpg');
INSERT INTO `t_pic` VALUES (81, 27, '/images/goods/pics/4_3_3.png');
INSERT INTO `t_pic` VALUES (82, 28, '/images/goods/pics/4_4_1.gif');
INSERT INTO `t_pic` VALUES (83, 28, '/images/goods/pics/4_4_2.jpg');
INSERT INTO `t_pic` VALUES (84, 28, '/images/goods/pics/4_4_3.gif');
INSERT INTO `t_pic` VALUES (85, 29, '/images/goods/pics/4_5_1.png');
INSERT INTO `t_pic` VALUES (86, 29, '/images/goods/pics/4_5_2.png');
INSERT INTO `t_pic` VALUES (87, 29, '/images/goods/pics/4_5_3.png');
INSERT INTO `t_pic` VALUES (88, 30, '/images/goods/pics/4_6_1.jpg');
INSERT INTO `t_pic` VALUES (89, 30, '/images/goods/pics/4_6_2.jpg');
INSERT INTO `t_pic` VALUES (90, 30, '/images/goods/pics/4_6_3.jpg');
INSERT INTO `t_pic` VALUES (91, 31, '/images/goods/pics/4_7_1.jpg');
INSERT INTO `t_pic` VALUES (92, 31, '/images/goods/pics/4_7_2.jpg');
INSERT INTO `t_pic` VALUES (93, 31, '/images/goods/pics/4_7_3.jpg');
INSERT INTO `t_pic` VALUES (94, 32, '/images/goods/pics/4_8_1.jpg');
INSERT INTO `t_pic` VALUES (95, 32, '/images/goods/pics/4_8_2.jpg');
INSERT INTO `t_pic` VALUES (96, 32, '/images/goods/pics/4_8_3.jpg');
INSERT INTO `t_pic` VALUES (97, 33, '/images/goods/pics/5_1_1.jpg');
INSERT INTO `t_pic` VALUES (98, 33, '/images/goods/pics/5_1_2.jpg');
INSERT INTO `t_pic` VALUES (99, 33, '/images/goods/pics/5_1_3.jpg');
INSERT INTO `t_pic` VALUES (100, 34, '/images/goods/pics/5_2_1.jpg');
INSERT INTO `t_pic` VALUES (101, 34, '/images/goods/pics/5_2_2.jpg');
INSERT INTO `t_pic` VALUES (102, 34, '/images/goods/pics/5_2_3.jpg');
INSERT INTO `t_pic` VALUES (103, 35, '/images/goods/pics/5_3_1.jpg');
INSERT INTO `t_pic` VALUES (104, 35, '/images/goods/pics/5_3_2.jpg');
INSERT INTO `t_pic` VALUES (105, 35, '/images/goods/pics/5_3_3.jpg');
INSERT INTO `t_pic` VALUES (106, 36, '/images/goods/pics/5_4_1.jpg');
INSERT INTO `t_pic` VALUES (107, 36, '/images/goods/pics/5_4_2.jpg');
INSERT INTO `t_pic` VALUES (108, 37, '/images/goods/pics/5_5_1.jpg');
INSERT INTO `t_pic` VALUES (109, 37, '/images/goods/pics/5_5_2.jpg');
INSERT INTO `t_pic` VALUES (110, 37, '/images/goods/pics/5_5_3.jpg');
INSERT INTO `t_pic` VALUES (111, 38, '/images/goods/pics/5_6_1.jpg');
INSERT INTO `t_pic` VALUES (112, 38, '/images/goods/pics/5_6_2.jpg');
INSERT INTO `t_pic` VALUES (113, 39, '/images/goods/pics/5_7_1.jpg');
INSERT INTO `t_pic` VALUES (114, 39, '/images/goods/pics/5_7_2.jpg');
INSERT INTO `t_pic` VALUES (115, 39, '/images/goods/pics/5_7_3.jpg');
INSERT INTO `t_pic` VALUES (116, 40, '/images/goods/pics/5_8_1.jpg');
INSERT INTO `t_pic` VALUES (117, 40, '/images/goods/pics/5_8_2.jpg');
INSERT INTO `t_pic` VALUES (118, 45, '/images/goods/pics/12_1.jpg');
INSERT INTO `t_pic` VALUES (119, 46, '/images/goods/pics/12_2.jpg');
INSERT INTO `t_pic` VALUES (120, 47, '/images/goods/pics/12_3.jpg');
INSERT INTO `t_pic` VALUES (126, 53, '/images/goods/pics/11_1.jpg');
INSERT INTO `t_pic` VALUES (127, 54, '/images/goods/pics/11_2.jpg');
INSERT INTO `t_pic` VALUES (128, 55, '/images/goods/pics/11_3.jpg');
INSERT INTO `t_pic` VALUES (134, 65, '/images/goods/pics/9_1.jpg');
INSERT INTO `t_pic` VALUES (135, 65, '/images/goods/pics/9_1_1.jpg');
INSERT INTO `t_pic` VALUES (136, 65, '/images/goods/pics/9_1_2.jpg');
INSERT INTO `t_pic` VALUES (137, 65, '/images/goods/pics/9_1_3.jpg');
INSERT INTO `t_pic` VALUES (138, 66, '/images/goods/pics/9_2.jpg');
INSERT INTO `t_pic` VALUES (139, 66, '/images/goods/pics/9_2_1.jpg');
INSERT INTO `t_pic` VALUES (140, 66, '/images/goods/pics/9_2_2.jpg');
INSERT INTO `t_pic` VALUES (141, 66, '/images/goods/pics/9_2_3.jpg');
INSERT INTO `t_pic` VALUES (142, 67, '/images/goods/pics/9_3.jpg');
INSERT INTO `t_pic` VALUES (143, 67, '/images/goods/pics/9_3_1.jpg');
INSERT INTO `t_pic` VALUES (144, 67, '/images/goods/pics/9_3_2.jpg');
INSERT INTO `t_pic` VALUES (145, 67, '/images/goods/pics/9_3_3.jpg');
INSERT INTO `t_pic` VALUES (146, 68, '/images/goods/pics/8_1.jpg');
INSERT INTO `t_pic` VALUES (147, 68, '/images/goods/pics/8_1_1.jpg');
INSERT INTO `t_pic` VALUES (148, 68, '/images/goods/pics/8_1_2.jpg');
INSERT INTO `t_pic` VALUES (149, 68, '/images/goods/pics/8_1_3.jpg');
INSERT INTO `t_pic` VALUES (150, 69, '/images/goods/pics/8_2.jpg');
INSERT INTO `t_pic` VALUES (151, 69, '/images/goods/pics/8_2_1.jpg');
INSERT INTO `t_pic` VALUES (152, 69, '/images/goods/pics/8_2_2.jpg');
INSERT INTO `t_pic` VALUES (153, 69, '/images/goods/pics/8_2_3.jpg');
INSERT INTO `t_pic` VALUES (154, 70, '/images/goods/pics/8_3.jpg');
INSERT INTO `t_pic` VALUES (155, 70, '/images/goods/pics/8_3_1.jpg');
INSERT INTO `t_pic` VALUES (156, 70, '/images/goods/pics/8_3_2.jpg');
INSERT INTO `t_pic` VALUES (157, 70, '/images/goods/pics/8_3_3.jpg');
INSERT INTO `t_pic` VALUES (158, 71, '/images/goods/pics/7_1.jpg');
INSERT INTO `t_pic` VALUES (159, 71, '/images/goods/pics/7_1_1.jpg');
INSERT INTO `t_pic` VALUES (160, 71, '/images/goods/pics/7_1_2.jpg');
INSERT INTO `t_pic` VALUES (161, 71, '/images/goods/pics/7_1_3.jpg');
INSERT INTO `t_pic` VALUES (162, 72, '/images/goods/pics/7_2.jpg');
INSERT INTO `t_pic` VALUES (163, 72, '/images/goods/pics/7_2_1.jpg');
INSERT INTO `t_pic` VALUES (164, 72, '/images/goods/pics/7_2_2.jpg');
INSERT INTO `t_pic` VALUES (165, 72, '/images/goods/pics/7_2_3.jpg');
INSERT INTO `t_pic` VALUES (166, 73, '/images/goods/pics/7_3.jpg');
INSERT INTO `t_pic` VALUES (167, 73, '/images/goods/pics/7_3_1.jpg');
INSERT INTO `t_pic` VALUES (168, 73, '/images/goods/pics/7_3_2.jpg');
INSERT INTO `t_pic` VALUES (169, 73, '/images/goods/pics/7_3_3.jpg');
INSERT INTO `t_pic` VALUES (170, 74, '/images/goods/pics/6_1.jpg');
INSERT INTO `t_pic` VALUES (171, 74, '/images/goods/pics/6_1_1.jpg');
INSERT INTO `t_pic` VALUES (172, 74, '/images/goods/pics/6_1_2.jpg');
INSERT INTO `t_pic` VALUES (173, 74, '/images/goods/pics/6_1_3.jpg');
INSERT INTO `t_pic` VALUES (174, 75, '/images/goods/pics/6_2.jpg');
INSERT INTO `t_pic` VALUES (175, 75, '/images/goods/pics/6_2_1.jpg');
INSERT INTO `t_pic` VALUES (176, 75, '/images/goods/pics/6_2_2.jpg');
INSERT INTO `t_pic` VALUES (177, 75, '/images/goods/pics/6_2_3.jpg');
INSERT INTO `t_pic` VALUES (178, 76, '/images/goods/pics/6_3.jpg');
INSERT INTO `t_pic` VALUES (179, 76, '/images/goods/pics/6_3_1.jpg');
INSERT INTO `t_pic` VALUES (180, 76, '/images/goods/pics/6_3_2.jpg');
INSERT INTO `t_pic` VALUES (181, 76, '/images/goods/pics/6_3_3.jpg');
INSERT INTO `t_pic` VALUES (182, 53, '/images/goods/pics/11_1_1.jpg');
INSERT INTO `t_pic` VALUES (183, 53, '/images/goods/pics/11_1_2.jpg');
INSERT INTO `t_pic` VALUES (184, 53, '/images/goods/pics/11_1_3.jpg');
INSERT INTO `t_pic` VALUES (185, 54, '/images/goods/pics/11_2_1.jpg');
INSERT INTO `t_pic` VALUES (186, 54, '/images/goods/pics/11_2_2.jpg');
INSERT INTO `t_pic` VALUES (187, 54, '/images/goods/pics/11_2_3.jpg');
INSERT INTO `t_pic` VALUES (188, 55, '/images/goods/pics/11_3_1.jpg');
INSERT INTO `t_pic` VALUES (189, 55, '/images/goods/pics/11_3_2.jpg');
INSERT INTO `t_pic` VALUES (190, 55, '/images/goods/pics/11_3_3.jpg');
INSERT INTO `t_pic` VALUES (191, 45, '/images/goods/pics/12_1_1.jpg');
INSERT INTO `t_pic` VALUES (192, 45, '/images/goods/pics/12_1_2.jpg');
INSERT INTO `t_pic` VALUES (193, 45, '/images/goods/pics/12_1_3.jpg');
INSERT INTO `t_pic` VALUES (194, 46, '/images/goods/pics/12_2_1.jpg');
INSERT INTO `t_pic` VALUES (195, 46, '/images/goods/pics/12_2_2.jpg');
INSERT INTO `t_pic` VALUES (196, 46, '/images/goods/pics/12_2_3.jpg');
INSERT INTO `t_pic` VALUES (197, 47, '/images/goods/pics/12_3_1.jpg');
INSERT INTO `t_pic` VALUES (198, 47, '/images/goods/pics/12_3_2.jpg');
INSERT INTO `t_pic` VALUES (199, 47, '/images/goods/pics/12_3_3.jpg');
INSERT INTO `t_pic` VALUES (200, 62, '/images/goods/pics/10_1.jpg');
INSERT INTO `t_pic` VALUES (201, 62, '/images/goods/pics/10_1_1.jpg');
INSERT INTO `t_pic` VALUES (202, 62, '/images/goods/pics/10_1_2.jpg');
INSERT INTO `t_pic` VALUES (203, 62, '/images/goods/pics/10_1_3.jpg');
INSERT INTO `t_pic` VALUES (204, 63, '/images/goods/pics/10_2.jpg');
INSERT INTO `t_pic` VALUES (205, 63, '/images/goods/pics/10_2_1.jpg');
INSERT INTO `t_pic` VALUES (206, 63, '/images/goods/pics/10_2_2.jpg');
INSERT INTO `t_pic` VALUES (207, 63, '/images/goods/pics/10_2_3.jpg');
INSERT INTO `t_pic` VALUES (208, 64, '/images/goods/pics/10_3.jpg');
INSERT INTO `t_pic` VALUES (209, 64, '/images/goods/pics/10_3_1.jpg');
INSERT INTO `t_pic` VALUES (210, 64, '/images/goods/pics/10_3_2.jpg');
INSERT INTO `t_pic` VALUES (211, 64, '/images/goods/pics/10_3_3.jpg');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_pass` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_age` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_sex` tinyint NOT NULL,
  `user_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_rank` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'user', '123', '22', 1, 'user@163.com', 0);
INSERT INTO `t_user` VALUES (2, 'admin1', '123', '23', 0, 'admin1@163.com', 1);
INSERT INTO `t_user` VALUES (3, 'admin2', '123', '22', 0, 'admin2@163.com', 1);
INSERT INTO `t_user` VALUES (4, 'admin', '123', '21', 1, 'admin@163.com', 1);
INSERT INTO `t_user` VALUES (5, 'why', '123', '23', 1, '11@163.com', 1);
INSERT INTO `t_user` VALUES (6, '22', '22', '22', 1, NULL, 0);
INSERT INTO `t_user` VALUES (7, '33', '33', '33', 0, NULL, 0);
INSERT INTO `t_user` VALUES (8, '44', '44', '44', 1, NULL, 0);
INSERT INTO `t_user` VALUES (9, '55', '55', '55', 0, NULL, 0);
INSERT INTO `t_user` VALUES (10, '66', '66', '66', 1, NULL, 0);
INSERT INTO `t_user` VALUES (11, '77', '77', '77', 1, NULL, 0);
INSERT INTO `t_user` VALUES (12, '88', '88', '88', 1, NULL, 0);
INSERT INTO `t_user` VALUES (13, '99', '99', '99', 0, NULL, 0);
INSERT INTO `t_user` VALUES (14, '00', '00', '0', 0, NULL, 0);
INSERT INTO `t_user` VALUES (16, '123', '123', '11', 0, NULL, 0);
INSERT INTO `t_user` VALUES (32, 'sevon', '123', '26', 0, '', 0);

-- ----------------------------
-- Triggers structure for table t_order
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_updateStockAndSales`;
delimiter ;;
CREATE TRIGGER `tri_updateStockAndSales` AFTER UPDATE ON `t_order` FOR EACH ROW begin
 declare sname varchar(50);
 declare cname varchar(50);
 declare odid int; 
 declare gid int;
 declare n int;
 declare s int;
 DECLARE done INT DEFAULT false;
 DECLARE cur1 CURSOR FOR (SELECT odetail_id FROM t_orderdetail WHERE order_id=new.order_id);
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  set s = (select order_status from t_order where order_id=new.order_id);
  OPEN cur1; 
  read_loop:LOOP
  FETCH cur1 INTO odid;
  IF done 
   THEN LEAVE read_loop;
  END IF;
    set sname = (select odetail_size from t_orderdetail where odetail_id=odid); 
    set cname = (select odetail_color from t_orderdetail where odetail_id=odid); 
    set n = (select odetail_num from t_orderdetail where odetail_id=odid);
    set gid = (select goods_id from t_orderdetail where odetail_id=odid);
  if s=5 then
   update t_stock set sales_num = sales_num + n where goods_id = gid and size_name=sname and color_name=cname;
  elseif s=4 then
   update t_stock set stock_num = stock_num - n where goods_id = gid and size_name=sname and color_name=cname;
  elseif s=8 then
   update t_stock set stock_num = stock_num + n where goods_id = gid and size_name=sname and color_name=cname;
  end if;
  
  END LOOP; 
  CLOSE cur1;  
 end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
