/*
 Navicat Premium Dump SQL

 Source Server         : manager
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : system

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 18/11/2024 16:05:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'zhangsan', '123456', '张三', '', 'ADMIN', '13592049944', '291151092@qq.com');

-- ----------------------------
-- Table structure for advertise
-- ----------------------------
DROP TABLE IF EXISTS `advertise`;
CREATE TABLE `advertise`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '主图',
  `position_id` int NULL DEFAULT NULL COMMENT '职位ID',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '位置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '广告信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of advertise
-- ----------------------------
INSERT INTO `advertise` VALUES (4, 'http://localhost:9090/files/download/1730270765804-05d6dcd9e59d6c3122357be9901133e.png', 4, '中心大图');
INSERT INTO `advertise` VALUES (6, 'http://localhost:9090/files/download/1730270795018-488f35070cc7d0b6d0945cbd3f9c51073ac02fecc9479e3780c0fe17b37418f00945b742138a9e17.png.webp', 7, '左侧小图');
INSERT INTO `advertise` VALUES (7, 'http://localhost:9090/files/download/1730270872245-488f35070cc7d0b64964b50b0e6addabfb3df6182506fd7a80c0fe17b37418f00945b742138a9e17.png.webp', 5, '右侧大图');
INSERT INTO `advertise` VALUES (9, 'http://localhost:9090/files/download/1730273309482-488f35070cc7d0b64964b50b0e6addabfb3df6182506fd7a80c0fe17b37418f00945b742138a9e17.png.webp', 2, '左侧大图');
INSERT INTO `advertise` VALUES (10, 'http://localhost:9090/files/download/1730428672446-1730270795018-488f35070cc7d0b6d0945cbd3f9c51073ac02fecc9479e3780c0fe17b37418f00945b742138a9e17.png.webp', 8, '右侧小图');
INSERT INTO `advertise` VALUES (11, 'http://localhost:9090/files/download/1730428963719-1.png', 6, '中心小图');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `student_id` int NULL DEFAULT NULL COMMENT '学生ID',
  `position_id` int NULL DEFAULT NULL COMMENT '岗位ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '收藏信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (4, 1, 4);
INSERT INTO `collect` VALUES (5, 1, 7);
INSERT INTO `collect` VALUES (6, 1, 2);

-- ----------------------------
-- Table structure for employ
-- ----------------------------
DROP TABLE IF EXISTS `employ`;
CREATE TABLE `employ`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'logo',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '城市',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `industry_id` int NULL DEFAULT NULL COMMENT '行业id',
  `scale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '规模',
  `stage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '融资',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '企业信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employ
-- ----------------------------
INSERT INTO `employ` VALUES (1, 'meituan', '123456', '美团', 'http://localhost:9090/files/download/1730096261260-f173afd235236fbf3bfd66f3baafec383402.png', 'EMPLOY', '北京市', '北京市朝阳区', 9, '10000人以上', '已上市', '审核通过');
INSERT INTO `employ` VALUES (2, 'pdd', '123456', '拼多多', 'http://localhost:9090/files/download/1730096623379-下载.jpg', 'EMPLOY', '深圳', '深圳', 13, '10000人以上', '已上市', '审核通过');
INSERT INTO `employ` VALUES (3, 'huawei', '123456', '华为', 'http://localhost:9090/files/download/1730277219208-huawei.jpg', 'EMPLOY', '深圳', '深圳', 14, '1000-9999人', '不需要融资', '审核通过');
INSERT INTO `employ` VALUES (4, 'kedaxunfei', '123456', '科大讯飞', 'http://localhost:9090/files/download/1730096718664-下载 (2).jpg', 'EMPLOY', '上海', '上海', 10, '1000-9999人', '已上市', '审核通过');
INSERT INTO `employ` VALUES (5, 'tengxun', '123456', '腾讯', 'http://localhost:9090/files/download/1730096785864-下载.jpg', 'EMPLOY', '深圳', '深圳', 11, '1000-9999人', '已上市', '审核通过');
INSERT INTO `employ` VALUES (6, 'hp', '123456', '惠普', 'http://localhost:9090/files/download/1730108234469-OIP-C.jpg', 'EMPLOY', '北京', '北京', 9, '1000-9999人', '已上市', '审核通过');
INSERT INTO `employ` VALUES (7, 'boss', '123456', 'BOSS直聘', 'http://localhost:9090/files/download/1730278301273-boss.jpg', 'EMPLOY', '成都', '成都', 15, '1000-9999人', '已上市', '审核通过');

-- ----------------------------
-- Table structure for industry
-- ----------------------------
DROP TABLE IF EXISTS `industry`;
CREATE TABLE `industry`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '行业名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '行业描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '行业信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of industry
-- ----------------------------
INSERT INTO `industry` VALUES (9, '电子/硬件开发', '电子/硬件开发');
INSERT INTO `industry` VALUES (10, '人工智能/AI', '这是人工智能/AI');
INSERT INTO `industry` VALUES (11, '大数据/云计算', '这是大数据/云计算');
INSERT INTO `industry` VALUES (12, '在线教育', '这是在线教育');
INSERT INTO `industry` VALUES (13, '游戏', '这是在线教育');
INSERT INTO `industry` VALUES (14, '半导体/芯片', '这是半导体/芯片');
INSERT INTO `industry` VALUES (15, '社交网络/媒体', NULL);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '公告内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '今天天气真的不错', '今天好开心呀！因为天气很好，我又可以肆无忌惮的跟着武哥和青哥学习了！！真的好开心！', '2024-07-16 15:51:17');
INSERT INTO `notice` VALUES (2, '项目所有功能开发完毕！', '我的项目所有的功能都开发完啦！真的很有成就感！', '2024-07-16 15:52:22');
INSERT INTO `notice` VALUES (3, '项目功能都测试完成，准备上线！', '经过半个月的学习和练习，终于把这个项目完成了，可以打包上线了！', '2024-07-16 15:52:56');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '职位名称',
  `employ_id` int NULL DEFAULT NULL COMMENT '企业ID',
  `industry_id` int NULL DEFAULT NULL COMMENT '行业ID',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '求职类型',
  `experience` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '工作经验',
  `salary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '薪资待遇',
  `education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学历要求',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '职位标签',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '职位描述',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '职位状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '职位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (2, '惠普云测试工程师', 6, 9, '全职', '1到3年', '10-20k', '硕士', '惠普云测试工程师', '<p style=\"line-height: 2;\"><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-size: 15px;\">华为云数据库相关岗位，此岗位为OD岗位，入职后满足条件可转华为。</span></p><p style=\"line-height: 2;\"><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-size: 15px;\"><br>【岗位职责】<br>1. 负责华为云数据库的测试设计、测试验证与交付工作,保证产品高质量发布。<br>2. 负责华为云数据库的测试架构设计和开发,支撑自动化测试,提升测试质量和效率。<br>3. 支撑负责华为云数据库的性能/过载测试、可靠性/混沌测试、安全测试、客户化测试等。</span></p><p style=\"line-height: 2;\"><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-size: 15px;\"><br>【技能要求】<br>1. 熟悉测试基本的技术和方法,包括测试设计、测试执行、测试分析、测试工具、测试仿真、故障注入、自动化等。<br>2. 熟练掌握测试需求分析和设计方法,熟悉黑白盒测试流程,熟悉常见缺陷管理工具。<br>3. 熟悉自动化脚本的开发,熟练使用常用的自动化测试框架,具备独立的问题定位分析能力。<br>4. 有强烈的责任心和使命感,具备良好的沟通能力和团队合作意识。<br>5. 至少熟悉一种编程语言C、C++、java、Python、Go、shell等。</span></p><p style=\"line-height: 2;\"><img src=\"http://localhost:9090/files/download/1730193904603-OIP-C.jpg\" alt=\"\" data-href=\"\" style=\"\"></p>', '审核通过');
INSERT INTO `position` VALUES (3, '算法工程师', 3, 14, '全职', '3到5年', '20-50k', '博士', '算法', NULL, '审核通过');
INSERT INTO `position` VALUES (4, 'Web前端', 2, 13, '全职', '1到3年', '10-20k', '本科', 'Java/VUE', NULL, '审核通过');
INSERT INTO `position` VALUES (5, '游戏特效', 5, 11, '全职', '一年以内', '10-20k', '硕士', '大数据', '<p><span style=\"color: rgb(96, 98, 102); background-color: rgb(245, 247, 250); font-size: 14px;\">大数据</span></p>', '审核通过');
INSERT INTO `position` VALUES (6, '后端工程师', 1, 9, '全职', '1到3年', '10-20k', '硕士', '后端', NULL, '审核通过');
INSERT INTO `position` VALUES (7, '算法工程师', 4, 10, '全职', '3到5年', '20-50k', '博士', '算法', NULL, '审核通过');
INSERT INTO `position` VALUES (8, '人力', 7, 15, '全职', '应届生', '10-20k', '本科', '人力', NULL, '审核通过');

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简历名称',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `salary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '期望薪资',
  `education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学历',
  `experience` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '工作年限',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `edu_exps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '教育经历',
  `work_exps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '工作经历',
  `pro_exps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '项目经验',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '简历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES (7, 'Java', 'jqq', '男', '10-20k', '本科', '应届生', '1359944995', '291115112qq.com', '[{\"id\":\"1731631800728y865b3cmup\",\"school\":\"hhstu\",\"speciality\":\"软件工程\",\"education\":\"本科\",\"start\":\"2024-11-04\",\"end\":\"2024-11-27\",\"course\":\"软件工程\"}]', '[{\"id\":\"17316318266471fyxpf2c8ani\",\"employ\":\"1\",\"project\":\"1\",\"position\":\"1\",\"type\":\"全职\",\"start\":\"2024-11-12\",\"end\":\"2024-11-27\"}]', '[]', 1);

-- ----------------------------
-- Table structure for submit
-- ----------------------------
DROP TABLE IF EXISTS `submit`;
CREATE TABLE `submit`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `employ_id` int NULL DEFAULT NULL COMMENT '企业ID',
  `position_id` int NULL DEFAULT NULL COMMENT '岗位ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `resume_id` int NULL DEFAULT NULL COMMENT '简历ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '投递时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简历状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '简历投递表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of submit
-- ----------------------------
INSERT INTO `submit` VALUES (2, 1, 6, 1, 7, '2024-11-15 08:51:06', '已投递');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zhangsana', '123456', '张三啊', 'http://localhost:9090/files/download/1730097970666-下载.jpg', 'USER', '13592049944', '291151092@qq.com');
INSERT INTO `user` VALUES (2, 'lisi', '123456', '李四', NULL, 'USER', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
