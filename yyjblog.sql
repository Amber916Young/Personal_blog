/*
 Navicat Premium Data Transfer

 Source Server         : yyjblog
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : yyjblog

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 05/06/2023 13:14:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `author` varchar(20) DEFAULT 'tothemoon',
  `type` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `publish_time` datetime DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `cover_url` varchar(255) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1' COMMENT '0 隐藏 1 显示 2推荐',
  `category` enum('article','photo','video') DEFAULT 'article',
  `videoId` varchar(40) DEFAULT NULL,
  `taglist` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author` (`author`),
  KEY `article_ibfk_2` (`type`),
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`type`) REFERENCES `types` (`name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83128 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (3312, '【leetcode】Reshape the Matrix', '一个m x n矩阵矩阵和两个整数r和c代表的行数和列数的想要重塑矩阵。重构后的矩阵应该以相同的行遍历顺序填充原始矩阵的所有元素。如果给定参数的重塑操作可行且合法，则输出新的重塑矩阵;否则，输出原始矩阵。', 'tothemoon', '代码', '2022-11-18 04:57:29', '2022-11-18 04:57:29', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/39a41acf25a9443f8d948861a2f9de18.jpg', '1', 'article', NULL, 'matrix,二维数组,矩阵');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (3369, '经典二维数组(矩阵)🤩 Number of Enclaves', '给出了一个m x n二进制矩阵网格，其中0表示海洋单元，1表示陆地单元...', 'tothemoon', '代码', '2022-11-18 04:54:18', '2022-11-18 04:54:18', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/00681e00e5a441d8bd1917f0f0362aed.jpg', '1', 'article', NULL, 'matrix,二维数组,矩阵');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (3405, '【leetcode】Word Search中等难度', '给定一个由字符板和字符串组成的m x n网格，如果网格中存在单词，则返回true。\n单词可以由连续相邻单元的字母构成，其中相邻单元水平或垂直相邻。同一个字母单元格不能使用多次。', 'tothemoon', '代码', '2022-11-18 04:57:39', '2022-11-18 04:57:39', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/88815ad318414238a7a198cc8491d125.jpeg', '1', 'article', NULL, 'matrix,二维数组,矩阵');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (3903, 'Graph图🌠 经典🥳 207 Course Schedule', 'Graph图🌠 经典🥳 207 Course Schedule', 'tothemoon', '代码', '2022-11-18 05:03:12', '2022-11-18 05:03:12', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/5b25f62eade2453190022b6f91710e1f.png', '1', 'article', NULL, 'graph,图');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (5135, '开胃小菜 🥝 401. Binary Watch', 'Java的bitcount我也是孤陋寡闻。我刚开始看到这个题，我想的就是用hashmap来做，我又去查了一下youtube，发现了bitcount这个方法！', 'tothemoon', '代码', '2022-11-18 05:03:40', '2022-11-18 05:03:40', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/547c1c3f852647dc89433f0e0563672b.jpeg', '1', 'article', NULL, 'bitcount');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (5661, '增加信心题⛽️ 202 happy number', '这是个简单题，但是仔细思考还是不简单的。emmm', 'tothemoon', '代码', '2022-05-20 06:26:39', '2022-05-20 06:26:39', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/4ed777cf3dde448581e13d15744a595f.jpeg', '1', 'article', NULL, NULL);
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (6614, '在docker中操作MongoDB', '这是NoSQL的实验，记录一下语法', 'tothemoon', '随笔', '2022-02-17 06:03:00', '2022-02-17 06:03:00', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/381cbbe7ba124b28a49424e2e88c1ece.jpg', '1', 'article', NULL, NULL);
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (8888, '【leetcode】minesweeper扫雷', '如果玩过扫雷，那就知道这道题的规则是什么了，不同的是一个位置有八个方向查找，一般我们做的矩阵都是四个方向。', 'tothemoon', '代码', '2022-11-18 04:57:13', '2022-11-18 04:57:13', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/94b51d26b8594140b137438cc770f23f.jpg', '1', 'article', NULL, 'matrix,二维数组,矩阵');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (9684, '经典Tree🌲Path nums 112 113 437', '经典tree题目，一般这种题目解法要么DFS要么BFS。', 'tothemoon', '代码', '2022-11-18 05:00:25', '2022-11-18 05:00:25', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/9e9d9860044344cf8c1e906494f5c6be.jpg', '1', 'article', NULL, 'Binary tree,tree,树,二分树');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (13591, '3sum以及3sumCloest', 'leetcode两到twoPointer题', 'tothemoon', '代码', '2022-11-18 05:04:14', '2022-11-18 05:04:14', NULL, 'https://s1.ax1x.com/2022/11/10/zSxBZD.png', '1', 'article', NULL, 'twoPointer,双指针');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (14150, 'Tree🌲  2265 Count Nodes Equal to Average of Subtree', '经典二叉树题目，太久没做了，直接抄答案了。给定二叉树的根，返回节点的值等于其子树的平均值的节点数。', 'tothemoon', '代码', '2022-11-18 05:00:10', '2022-11-18 05:00:10', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/77cbb6af310341009d2b0265ba1351aa.jpg', '1', 'article', NULL, 'Binary tree,tree,树,二分树');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (16095, '增加信心题⛽️ 682 Baseball Game', '做点简单题增加信心', 'tothemoon', '代码', '2022-05-20 06:26:39', '2022-05-20 06:26:39', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/52ae8b5de7834332bc097c30b3ce656f.jpeg', '1', 'article', NULL, NULL);
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (16979, 'Kadane\'s Algorithm 算法', 'Kadane\'s Algorithm 算法', 'tothemoon', '代码', '2022-11-18 05:03:53', '2022-11-18 05:03:53', '', 'https://s1.ax1x.com/2022/11/10/zSONB4.png', '1', 'article', NULL, 'Kadane\'s Algorithm');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (17122, '【leetcode】Spiral Matrix', '中等难度Given an m x n matrix, return all elements of the matrix in spiral order.', 'tothemoon', '代码', '2022-11-18 04:56:57', '2022-11-18 04:56:57', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/dc5cafc81cb54fe598f3f8ea6b58df1e.jpg', '1', 'article', NULL, 'matrix,二维数组,矩阵');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (17232, '【leetcode】Flipping an Image', '给定一个n × n的二值矩阵图像，水平翻转图像，然后倒置，并返回结果图像。\n水平翻转图像意味着图像的每一行都被翻转。', 'tothemoon', '代码', '2022-04-17 07:13:32', '2022-04-17 07:13:32', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/7bc5060a6b2645ec96bf194cd7440271.jpg', '1', 'article', NULL, NULL);
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (17490, 'Graph题目：1376. Time Needed to Inform All Employees', '依旧是Graph题目，这类题的模板是1）先建图，2）遍历，BFS和DFS是通用遍历模板。', 'tothemoon', '代码', '2022-09-21 06:45:01', '2022-09-21 06:45:01', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/be37266f1163438fb848061ec199b7d4.png', '1', 'article', NULL, NULL);
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (17783, '【leetcode】Shortest Path in Binary Matrix', '给定一个nxn的二进制矩阵网格，返回矩阵中最短的清除路径的长度。如果没有清除路径，则返回-1。矩阵可以访问的方向有八个（参考扫雷）', 'tothemoon', '代码', '2022-11-17 07:10:19', '2022-04-17 07:08:43', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/01156cf6f5754164a5b79de59ec25f69.jpg', '1', 'article', NULL, NULL);
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (17807, '【leetcode】Two Sum解法', '给定一个整数数组nums和一个整数目标，返回两个数字的索引，使它们相加到目标。可以假设每个输入都有一个解决方案，并且不能两次使用同一个元素。', 'tothemoon', '代码', '2022-01-01 04:39:17', '2022-01-01 04:39:17', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/9e2d7db67cdb429ba9c5a507d1168260.jpg', '1', 'article', NULL, NULL);
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (18421, 'Find K Pairs with Smallest Sums', 'PriorityQueue应用', 'tothemoon', '代码', '2022-11-11 04:25:39', '2022-11-11 04:25:39', NULL, 'https://s1.ax1x.com/2022/11/11/z9Tl9K.png', '1', 'article', NULL, NULL);
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (18964, '经典矩阵🥳 934 Shortest Bridge', '我真的很偏爱matrix的题目，又做到了和island数量相似的题目，不过多了一些限制条件', 'tothemoon', '代码', '2022-11-18 04:54:18', '2022-11-18 04:54:18', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/9f68cf7f09c4463895f23178b9bb380c.jpg', '1', 'article', NULL, 'matrix,二维数组,矩阵');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (19275, '经典二维数组(矩阵)🤩 Surrounded Regions', '给定一个包含“x”和“O”的m × n矩阵板，捕获所有被“x”围绕的4个方向的区域。\n一个区域是通过将周围区域的所有“O”翻转成“X”来捕获的。', 'tothemoon', '代码', '2022-11-18 04:54:18', '2022-11-18 04:54:18', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/08668f7d3a1d4d20a250cbd567c9dc14.jpg', '1', 'article', NULL, 'matrix,二维数组,矩阵');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (20028, '图🌠Graph study plan里四道相似的题目记录', '最近做Graph study plan里的题目，类型相似，记录一下，防止遗忘。【遗忘是常态】', 'tothemoon', '代码', '2022-11-18 05:03:12', '2022-11-18 05:03:12', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/8b38ee3ecc2644309833cc32fd3e6ddd.png', '1', 'article', NULL, 'graph,图');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (20649, '【leetcode】Convert 1D Array Into 2D Array', '给定一个索引为0的一维整数数组，以及两个整数m和n。您的任务是使用原始数组中的所有元素创建一个包含m行和n列的二维数组。', 'tothemoon', '代码', '2022-11-17 07:10:20', '2022-04-17 07:08:43', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/f908303e0a744926acb9d17e80ef1f58.jpg', '1', 'article', NULL, NULL);
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (21238, '我是一个情绪化的人', '我真的是个很情绪化的人，我不高兴我对所有人都没有耐心，一旦我发完火就开始后悔，这是个恶性循环', 'tothemoon', '随笔', '2022-11-17 07:15:01', '2022-11-17 07:15:01', '<p>yejia Yang</p><p>3 October 2021</p><h1 id=\"g1cv2\" style=\"text-align:center;\"><font color=\"#c24f4a\">The reasons why I am so emotional</font></h1><p style=\"text-align:center;\">Borderline Personality Disorder，BPD</p><p><br/></p><p>Long time in the past, I didn’t realise the fact why I am so emotional, write down is a great choose I suppose.</p><p><b>Personal reason:</b></p><p>I am a pessimist, although It doesn\'t look like that. Unfortunately, it is the fact. Something I get negative evaluations from someone who has a<b> close relationship</b> with me( I do not care the stranger one). At first, I am definitely angry, can not believe that they have an opposite point of view with me. The second stage, I feel lonely and snuggle in&nbsp; self-doubt, I wish somebody can comfort me, but usually there is no one. Lastly, it’s like a <b>vicious circle </b>which affect my daily life. I can not stop thinking about the processing. I image and change some unhappy memories in order to be relieved. I am a very contradictory person, I don’t want to show my shortcoming to show that I\'m strong. When you fall into negative emotions, each unhappy thing which happened in the past will pass through your brain like slides, you will feel desperate and depressed, like a tragic movie and you are the protagonist. When you can not get help timely, your action and you behaviour will like a not well-educated kid, complain all the time. The negative emotion occupy your reason after lose your ability of&nbsp; thinking. But I know I can not control myself, I always mess up, in few days, I comfort myself because I&nbsp; can not get any support. I know everyone is an independent individual. <b>Emotional value is a luxury.</b></p><p style=\"text-align:center;\"><b></b><img src=\"http://fileserver.youngbird97.top//statics/editor/b4d92ae02e1240688578ea9cb6632529.png\" style=\"max-width:100%;\" contenteditable=\"false\" width=\"50%\"/></p><p><b>What is the BPD?</b></p><p>The basic feature is a general pattern of interpersonal relationship, self-image and emotional instability and significant impulse.</p><p>Simply, sometime I show indifferent/enthusiasm, two different direction. I don’t know how to treat with my love, one year ago,I was broken up which is my forever negative memory, I am always worried about same thing happen again till now. I don’t think she is a good listener, maybe she is not a good companion. In the most time, I can not get any emotional support when I\'m down, I need help myself and I don\'t count on her anymore, The only one thing I wish——stop blaming me and laughing at me.&nbsp;</p><p>I love her indeed, but one-way never get a positive feedback. One year ago, I still can recall everything even she explained it’s her personality. I think if someone has a relationship with his/her best love, will he/she still show indifference? I never know the answer any more. In that time, we didn’t have a strong connection, I was too confident so that lost my soul. Oscar Wilde said ’I<i>n love, one always starts by deceiving oneself, and ends by deceiving others </i>’. Maybe&nbsp; I was too confident.</p><p>I read many books, watch many movies. I know why I am immature who acting like a&nbsp; uneducated child. <b>Spiritual dependence is a luxury.</b></p><p><b></b><br/></p><p><b>How do I adjust my mind</b><b>？</b></p><p>I have to admit that I don’t know. I need time maybe 3-5days, my several souls(in my brain) will help me balance it. In my dream,I commit suicide every time I encounter danger, such as fire accident. I\'m not as strong as I look. I need time.</p><p>I am confident that I am a good listener and a companion, I know my situation so I can avoid something sensitive to comfort others. But I shouldn’t be too confident, right? Somebody will laugh at me.</p><p>Maybe in the future, I grow up like real a human of sound mind and mature</p><p>\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n</p><p><font color=\"#ffffff\">. But who can know the future? Right? No-one can blame me anymore.</font></p>', 'http://fileserver.youngbird97.top//statics/ArticleCover/2e1b8a31a785454b947d26950643c735.jpg', '0', 'article', NULL, NULL);
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (22710, '二维数组(矩阵)🥳 Check if Every Row and Column Contains All Numbers', '如果每一行和每一列包含从1到n（包括1到n）的所有整数，则nxn矩阵有效。\n给定一个nxn整数矩阵，如果该矩阵有效，则返回true。否则，返回false。', 'tothemoon', '代码', '2022-11-18 04:54:18', '2022-11-18 04:54:18', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/380c735af5a34a66b5a800d3f1480f24.jpg', '1', 'article', NULL, 'matrix,二维数组,矩阵');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (23257, 'Graph图🌠 经典🥳 547 Number of Provinces', '有N个城市。其中有些城市是相连的，而有些则没有。如果城市a与城市b直接相连，而城市b与城市c直接相连，那么城市a就与城市c间接相连。一个省是一个由直接或间接连接的城市组成的集团，集团外没有其他城市。你会得到一个n x n的矩阵isConnected，其中isConnected[i][j]=1，如果第i个城市和第j个城市直接相连，isConnected[i][j]=0，否则返回省的总数。', 'tothemoon', '代码', '2022-04-18 05:03:12', '2022-04-18 05:03:12', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/4be58f7d61f2442f9c7c46368286c098.png', '1', 'article', NULL, 'graph,图');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (23653, '都柏林「Dublin」假装跨年💙', '30日决定去都柏林玩两天。首都并不大。去了国家画展，圣三一大学，还有购物一条街，', 'tothemoon', '摄影', '2022-01-04 22:31:23', '2022-01-04 22:31:23', NULL, 'http://fileserver.youngbird97.top//statics/photos23653/08165db0d61a4f229c696011536d3eae.jpeg', '1', 'photo', NULL, NULL);
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (27344, '经典矩阵🥳 861 Score After Flipping Matrix', '这道题就是找到反转后矩阵的最大分数', 'tothemoon', '代码', '2022-11-18 04:54:18', '2022-11-18 04:54:18', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/e582e56169c8452e8152c802a6171521.jpg', '1', 'article', NULL, 'matrix,二维数组,矩阵');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (28519, '经典二维数组🎻 DFS & BFS---Island Perimeter', '给定行x × col网格，表示一幅地图，网格[i][j] = 1表示土地，网格[i][j] = 0表示水。网格单元水平/垂直(而不是对角)连接。网格完全被水包围，并且只有一个岛(即一个或多个相连的陆地单元)。这个岛没有“湖”，这意味着里面的水没有和岛周围的水相连。一个单元格是边长为1的正方形。网格为矩形，宽高不超过100。确定岛的周长。', 'tothemoon', '代码', '2022-11-18 04:54:18', '2022-11-18 04:54:18', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/fa89217cdff74ff6bd0a373e5b84d382.jpg', '1', 'article', NULL, 'matrix,二维数组,矩阵');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (29014, 'A general approach to backtracking questions in Java', '【转载】Subsets, Permutations, Combination Sum, Palindrome Partitioning这几种类似的题目的解题答案，其中包括我原来写的部分，以及在熟悉递归后修改的代码。', 'tothemoon', '代码', '2022-11-18 04:56:41', '2022-11-18 04:56:41', '01:17:46', 'http://fileserver.youngbird97.top//statics/ArticleCover/e251117eeb2849408d23f8ec34a9213c.png', '1', 'article', NULL, 'backtracking,递归');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (29417, 'Tree🌲 经典BFS 102 103 107 127 三道相似的Binary Tree', '三道题一样的方法。给定二叉树的根，返回其节点值的自底向上顺序遍历。(即从左到右，从叶到根，一层一层)。', 'tothemoon', '代码', '2022-11-18 05:00:02', '2022-11-18 05:00:02', '', 'http://fileserver.youngbird97.top//statics/ArticleCover/8457041eac12472d9f094eb0d3c078f5.jpg', '1', 'article', NULL, 'Binary tree,tree,树,二分树');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (29648, '高威「galway」圣诞集市🎄', '21年12月20日,起一个大早搭大巴去高威逛一逛', 'tothemoon', '摄影', '2021-12-31 07:18:27', '2021-12-31 07:18:27', NULL, 'https://s1.ax1x.com/2022/11/12/zP0HAJ.jpg', '2', 'photo', NULL, NULL);
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (30050, '优先队列PriorityQueue例题', 'PriorityQueue以及Hashmap的应用', 'tothemoon', '代码', '2022-11-18 04:55:49', '2022-11-18 04:55:49', NULL, 'https://s1.ax1x.com/2022/11/10/z9Dxeg.png', '1', 'article', NULL, 'PriorityQueue,队列');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (50122, '泰国旅行🇹🇭2020-怀念没有疫情的日子', '希望明年能再去一次，因为短短的一周实在是不够尽兴', 'tothemoon', '旅行', '2022-11-12 03:24:38', '2022-11-12 03:24:38', '<iframe height=498 width=\"100%\" src=\"https://player.youku.com/embed/XNDgxNjkxMDYxMg==\" frameborder=0 allowfullscreen></iframe>', 'https://m.ykimg.com/054106015F44DEE9000001294B0BB116', '2', 'video', NULL, NULL);
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (61413, 'PriorityQueue题：1753 1962 2182', 'PriorityQueue应用5', 'tothemoon', '代码', '2022-11-18 04:55:49', '2022-11-18 04:55:49', NULL, 'https://s1.ax1x.com/2022/11/12/zP0hcV.png', '1', 'article', NULL, 'PriorityQueue,队列');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (77291, 'PriorityQueue题：786 1405 378 1439', 'PriorityQueue应用4', 'tothemoon', '代码', '2022-11-18 04:55:49', '2022-11-18 04:55:49', NULL, 'https://s1.ax1x.com/2022/11/12/zPdihq.png', '1', 'article', NULL, 'PriorityQueue,队列');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (82224, '优先队列PriorityQueue的一些方法', '主要涉及到如何重写比较器在存储并非简单的integer的情况下', 'tothemoon', '代码', '2022-11-18 04:55:49', '2022-11-18 04:55:49', NULL, 'https://s1.ax1x.com/2022/11/10/z9ahp8.jpg', '1', 'article', NULL, 'PriorityQueue,队列');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83093, 'PriorityQueue: Top K Frequent Words', 'PriorityQueue应用', 'tothemoon', '代码', '2022-11-18 04:59:07', '2022-11-18 04:59:07', NULL, 'https://s1.ax1x.com/2022/11/11/z9T3cD.png', '1', 'article', NULL, 'PriorityQueue,队列');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83095, '23岁生日快乐🎉🥳🥳🥳', '23岁生日快乐🎉🥳🥳🥳希望未来能陪在你身边', 'tothemoon', '生活', '2020-04-21 05:11:13', '2020-04-21 05:11:13', '<iframe height=498 width=510 src=\"https://player.youku.com/embed/XNDc0OTEzMTM1Mg==\" frameborder=0 allowfullscreen></iframe>', 'https://m.ykimg.com/054106015F0BC17D000001295A087CED', '0', 'video', NULL, NULL);
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83096, '🎉PriorityQueue 练习5⃣️---2099 2231 2233', 'PriorityQueue 练习5⃣️---2099 2231 2233', 'tothemoon', '代码', '2022-11-18 04:55:49', '2022-11-18 04:55:49', NULL, 'https://s1.ax1x.com/2022/11/13/zibseO.png', '1', 'article', NULL, 'PriorityQueue,队列');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83097, 'Binary Search二分查找🌈 ', '二分查找 704 278 2089 1351 1337 852', 'tothemoon', '代码', '2022-11-18 04:58:34', '2022-11-18 04:58:34', NULL, 'https://s1.ax1x.com/2022/11/13/zFS77t.png', '1', 'article', NULL, 'Binary Search,二分查找,BinarySearch');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83098, 'Binary Search二分查找2 🌈 面试题 missing number', '二分查找  268 1539 875 1060(会员题)', 'tothemoon', '代码', '2022-11-18 04:58:34', '2022-11-18 04:58:34', NULL, 'https://s1.ax1x.com/2022/11/13/zkGQDH.png', '1', 'article', NULL, 'Binary Search,二分查找,BinarySearch');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83099, '近期的精神状态：优秀', 'Listen to me 👂👂👂 thank you 🙏🙏🙏 Because of you 👉👉👉 Warm the four seasons 🌈🌈🌈 thank you 🙏🙏🙏 Thank you 👉👉👉 The world is more beautiful 🌏🌏🌏', 'tothemoon', '随笔', '2022-11-14 04:54:29', '2022-11-14 04:54:29', NULL, 'https://s1.ax1x.com/2022/11/14/zkBv1s.png', '1', 'article', NULL, NULL);
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83100, 'Binary Search二分查找🌈 No3  1482 1760 2358', 'Binary Search二分查找🌈 No3  1482 1760 2358', 'tothemoon', '代码', '2022-11-18 04:58:34', '2022-11-18 04:58:34', NULL, 'https://s1.ax1x.com/2022/11/14/zAoFFH.png', '1', 'article', NULL, 'Binary Search,二分查找,BinarySearch');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83101, '滑动窗口Sliding windows', '滑动窗口Sliding windows 两道会员题', 'tothemoon', '代码', '2022-11-18 05:02:01', '2022-11-18 05:02:01', NULL, 'https://s1.ax1x.com/2022/11/15/zA70zR.png', '1', 'article', NULL, 'Sliding window,slidingwindow,滑动窗口');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83102, '滑动窗口算法 Sliding window 🥳No2 1493, 1004, 487, 485, 2024', '滑动窗口Sliding windows 模板题', 'tothemoon', '代码', '2022-11-18 05:02:01', '2022-11-18 05:02:01', NULL, 'https://s1.ax1x.com/2022/11/15/zALvNT.png', '1', 'article', NULL, 'Sliding window,slidingwindow,滑动窗口');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83103, 'Binary Search二分查找🎄 No4 第四弹--模板刷题 ', 'Binary Search 模板题', 'tothemoon', '代码', '2022-11-18 04:58:34', '2022-11-18 04:58:34', NULL, 'https://s1.ax1x.com/2022/11/16/zVgASK.png', '1', 'article', NULL, 'Binary Search,二分查找,BinarySearch');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83104, 'Binary Search二分查找🎄 No5 第5⃣️弹--套路模板刷题 ', 'Binary Search 套路模板题', 'tothemoon', '代码', '2022-11-18 04:58:34', '2022-11-18 04:58:34', NULL, 'https://s1.ax1x.com/2022/11/16/zeeDEt.png', '1', 'article', NULL, 'Binary Search,二分查找,BinarySearch');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83105, 'Binary Search二分查找🥳 No6 经典好题【持续更新】540 33 74  852 Peak Element', 'Binary Search 540 33 81 ', 'tothemoon', '代码', '2022-11-18 04:58:34', '2022-11-18 04:58:34', NULL, 'https://s1.ax1x.com/2022/11/17/zmauZt.png', '1', 'article', NULL, 'Binary Search,二分查找,BinarySearch');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83106, 'Matrix二维数组 --- leetcode36 Sudoku', 'Matrix二维数组 --- leetcode36 Sudoku', 'tothemoon', '代码', '2022-11-18 04:54:18', '2022-11-18 04:54:18', NULL, 'https://s1.ax1x.com/2022/11/17/zmDWGV.png', '1', 'article', NULL, 'matrix,二维数组,矩阵');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83107, '经典Matrix二维数组 --- 48 Rotate Image', '经典Matrix二维数组 --- 48 Rotate Image', 'tothemoon', '代码', '2022-11-18 04:54:18', '2022-11-18 04:54:18', NULL, 'https://s1.ax1x.com/2022/11/17/zmcvbF.png', '1', 'article', NULL, 'matrix,二维数组,矩阵');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83108, '经典Matrix二维数组🔥--- DFS BFS题目🐝', '经典Matrix二维数组🔥大礼包合集，圣诞快乐', 'tothemoon', '代码', '2022-11-18 04:54:18', '2022-11-18 04:54:18', NULL, 'https://s1.ax1x.com/2022/11/17/zmWaPH.png', '1', 'article', NULL, 'matrix,二维数组,矩阵');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83109, '经典Matrix二维数组🔥994 1034 ', '经典Matrix二维数组🔥大礼包合集2，圣诞快乐', 'tothemoon', '代码', '2022-11-18 04:54:18', '2022-11-18 04:54:18', NULL, 'https://s1.ax1x.com/2022/11/18/zmHOYV.png', '1', 'article', NULL, 'matrix,二维数组,矩阵');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83110, 'Mysql 👩‍💻模糊查询，多相匹配，忽略大小写 ', 'Mysql 👩‍💻模糊查询，多相匹配，忽略大小写', 'tothemoon', '随笔', '2022-11-18 06:32:05', '2022-11-18 06:32:05', NULL, 'https://s1.ax1x.com/2022/11/18/zmXTIA.png', '1', 'article', NULL, 'Mysql,查询,匹配,忽略大小写');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83111, 'Matrix 二维数组 graph queue💥2101. Detonate the Maximum Bombs💣 欧几里得距离', 'Matrix 二维数组 💥2101. Detonate the Maximum Bombs💣', 'tothemoon', '代码', '2022-11-18 08:27:19', '2022-11-18 08:27:19', NULL, 'https://s1.ax1x.com/2022/11/18/zmvBN9.png', '1', 'article', NULL, 'matrix,二维数组,矩阵,graph ,queue,欧几里得,Euclidean');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83112, 'Matrix DP Array---1706. Where Will the Ball Fall', 'Matrix DP Array---1706. Where Will the Ball Fall', 'tothemoon', '代码', '2022-11-18 21:33:04', '2022-11-18 21:33:04', NULL, 'https://s1.ax1x.com/2022/11/18/zukATx.png', '1', 'article', NULL, 'matrix,二维数组,矩阵,Array,DP, Dynamic Programming, Depth-First Search , Matrix Simulation');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83113, '增加信心⛽️ Matrix 二维数组 832. Flipping an Image', '增加信心⛽️ Matrix 二维数组 832. Flipping an Image', 'tothemoon', '代码', '2022-11-19 02:58:56', '2022-11-19 02:58:56', NULL, 'https://s1.ax1x.com/2022/11/19/zuNm6J.png', '1', 'article', NULL, 'matrix,二维数组,矩阵,Array,Two pointers,Simulation');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83114, 'Matrix 二维数组🤖 Nearest Exit from Entrance in Maze🧱', 'Matrix 二维数组🤖 Nearest Exit from Entrance in Maze🧱', 'tothemoon', '代码', '2022-11-19 03:03:48', '2022-11-19 03:03:48', NULL, 'https://s1.ax1x.com/2022/11/19/zuNM01.png', '1', 'article', NULL, 'matrix,二维数组,矩阵,Array,Breadth-First Search,BFS');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83115, '🍀 Matrix binary search二分查找 Search a 2D Matrix 74 240', '🍀 Search a 2D Matrix', 'tothemoon', '代码', '2022-11-19 03:08:09', '2022-11-19 03:08:09', NULL, 'https://s1.ax1x.com/2022/11/19/zuN3tK.png', '1', 'article', NULL, 'matrix,二维数组,矩阵,Array,Binary Search,Divide and Conquer ');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83116, 'String 字符串 657.🤖️ Robot  Return to Origin', 'String 字符串 657.🤖️ Robot  Return to Origin', 'tothemoon', '代码', '2022-11-19 03:17:54', '2022-11-19 03:17:54', NULL, 'https://s1.ax1x.com/2022/11/19/zuNt6H.png', '1', 'article', NULL, 'String,字符串,Simulation');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83117, 'Matrix 二维数组🤖 对角线 1329. Sort the Matrix Diagonally', 'Matrix 二维数组🤖 对角线 1329. Sort the Matrix Diagonally', 'tothemoon', '代码', '2022-11-19 04:39:24', '2022-11-19 04:39:24', NULL, 'https://s1.ax1x.com/2022/11/19/zuUVEt.png', '1', 'article', NULL, 'matrix,二维数组,矩阵,Array,Simulation');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83118, 'Matrix 二维数组🌀1861. Rotating the Box', 'Matrix 二维数组🌀1861. Rotating the Box', 'tothemoon', '代码', '2022-11-19 04:49:38', '2022-11-19 04:49:38', NULL, 'https://s1.ax1x.com/2022/11/19/zuUZUP.png', '1', 'article', NULL, 'matrix,二维数组,矩阵,Array,two pointers');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83119, 'Matrix 经典 二维数组 DFS Backtracking 🔥1219. Path with Maximum Gold', 'Matrix 经典 二维数组 DFS Backtracking ', 'tothemoon', '代码', '2022-11-19 05:25:45', '2022-11-19 05:25:45', NULL, 'https://s1.ax1x.com/2022/11/19/zuUMvQ.png', '1', 'article', NULL, 'matrix,二维数组,矩阵,Array,Backtracking');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83120, 'Math🍳easy难度 1523. Count Odd Numbers in an Interval Range', '1523. Count Odd Numbers in an Interval Range', 'tothemoon', '代码', '2022-11-19 06:03:45', '2022-11-19 06:03:45', NULL, 'https://s1.ax1x.com/2022/11/19/zuUJU0.png', '1', 'article', NULL, 'Math');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83121, 'Binary Search二分查找 No7  162. Find Peak Element【经典 google】', 'Google 面试题', 'tothemoon', '代码', '2022-11-20 21:16:02', '2022-11-20 21:16:02', NULL, 'https://s1.ax1x.com/2022/11/20/zMh2r9.png', '1', 'article', NULL, 'Binary Search,二分查找,BinarySearch, google,面试题');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83122, 'Binary Search二分查找 No8  367. Valid Perfect Square 69 633 【模板题】', ' 367 69 633 ', 'tothemoon', '代码', '2022-11-21 03:23:17', '2022-11-21 03:23:17', NULL, 'https://s1.ax1x.com/2022/11/21/zQkUsg.png', '1', 'article', NULL, 'Binary Search,二分查找,BinarySearch, array');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83123, 'Array Greedy 🤑 976. Largest Perimeter Triangle 812. Largest Triangle Area ', ' 976. Largest Perimeter Triangle 812. Largest Triangle Area  ', 'tothemoon', '代码', '2022-11-21 04:41:26', '2022-11-21 04:41:26', NULL, 'https://s1.ax1x.com/2022/11/21/zQAi6S.png', '1', 'article', NULL, 'Math, Greedy, array');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83124, '【Math】1281. Subtract the Product and Sum of Digits of an Integer', ' 1281. Subtract the Product and Sum of Digits of an Integer', 'tothemoon', '代码', '2022-11-21 05:09:05', '2022-11-21 05:09:05', NULL, 'https://s1.ax1x.com/2022/11/21/zQAght.png', '1', 'article', NULL, 'Math');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83125, '【String Hash Table】205. Isomorphic Strings;290 Word Pattern', '205. Isomorphic Strings;290 Word Pattern', 'tothemoon', '代码', '2022-11-21 05:26:48', '2022-11-21 05:26:48', NULL, 'https://s1.ax1x.com/2022/11/21/zQAXcT.png', '1', 'article', NULL, 'String,HashTable');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83126, '[Two pointer DP] 392. Is Subsequence', '205. Isomorphic Strings;290 Word Pattern', 'tothemoon', '代码', '2022-11-21 06:16:25', '2022-11-21 06:16:25', NULL, 'https://s1.ax1x.com/2022/11/21/zQEM4I.png', '1', 'article', NULL, 'String,HashTable');
INSERT INTO `article` (`id`, `title`, `detail`, `author`, `type`, `create_time`, `publish_time`, `content`, `cover_url`, `status`, `category`, `videoId`, `taglist`) VALUES (83127, '【Algorithm 算法】字符串匹配的 KMP算法', '28 1910 两题', 'tothemoon', '代码', '2022-11-21 21:19:29', '2022-11-21 21:19:29', NULL, 'https://s1.ax1x.com/2022/11/21/zlUlVJ.png', '1', 'article', NULL, 'KMP算法,Algorithm, String,匹配');
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aid` int DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `cid` int DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  `avatar` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for customer_address
-- ----------------------------
DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE `customer_address` (
  `customer_addr_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `customer_id` int unsigned NOT NULL COMMENT 'customer_login表的自增ID',
  `zip` smallint NOT NULL COMMENT '邮编',
  `province` smallint NOT NULL COMMENT '地区表中省份的ID',
  `city` smallint NOT NULL COMMENT '地区表中城市的ID',
  `district` smallint NOT NULL COMMENT '地区表中的区ID',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '具体的地址门牌号',
  `is_default` tinyint NOT NULL COMMENT '是否默认',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`customer_addr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户地址表';

-- ----------------------------
-- Records of customer_address
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for default
-- ----------------------------
DROP TABLE IF EXISTS `default`;
CREATE TABLE `default` (
  `id` int NOT NULL AUTO_INCREMENT,
  `val_str` varchar(255) DEFAULT NULL,
  `val_int` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of default
-- ----------------------------
BEGIN;
INSERT INTO `default` (`id`, `val_str`, `val_int`, `type`) VALUES (1, NULL, NULL, 'index_cover_url');
COMMIT;

-- ----------------------------
-- Table structure for file_record
-- ----------------------------
DROP TABLE IF EXISTS `file_record`;
CREATE TABLE `file_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fileType` varchar(30) DEFAULT NULL,
  `fileName` varchar(200) DEFAULT NULL,
  `fileUrl` varchar(200) DEFAULT NULL,
  `mineType` varchar(30) DEFAULT NULL,
  `originalName` varchar(200) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `directory` varchar(30) DEFAULT NULL,
  `aid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of file_record
-- ----------------------------
BEGIN;
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (57, 'photos29648', '209b972b231d411a95c1025194ce122b.JPG', 'https://photo.tuchong.com/7194943/f/1141846321.jpg', 'image/jpeg', 'DSC07089.JPG', '2022-01-04 22:03:46', 'photos29648', 29648);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (58, 'photos29648', 'fb2c9bffeb0c4ce18426c7647fee1f25.JPG', 'https://photo.tuchong.com/7194943/f/1198076124.jpg', 'image/jpeg', 'DSC07092.JPG', '2022-01-04 22:03:51', 'photos29648', 29648);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (59, 'photos29648', '648bb37f1fc3415aba4e891bef93f2c0.JPG', 'https://photo.tuchong.com/7194943/f/1041313826.jpg', 'image/jpeg', 'DSC07100.JPG', '2022-01-04 22:03:54', 'photos29648', 29648);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (60, 'photos29648', '8c63eaaa9c2b444491d15ae4335f5fa8.JPG', 'https://photo.tuchong.com/7194943/f/1303195967.jpg', 'image/jpeg', 'DSC07108.JPG', '2022-01-04 22:03:57', 'photos29648', 29648);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (61, 'photos29648', 'be05b943bd71483b93d210d07255bb25.JPG', 'https://photo.tuchong.com/7194943/f/1081880614.jpg', 'image/jpeg', 'DSC07117.JPG', '2022-01-04 22:04:01', 'photos29648', 29648);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (62, 'photos29648', '85f6292657b544e4be40e629784c8513.JPG', 'https://photo.tuchong.com/7194943/f/1077227812.jpg', 'image/jpeg', 'DSC07123.JPG', '2022-01-04 22:04:04', 'photos29648', 29648);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (63, 'photos29648', 'ac5aeab2de4243b583e1a4af2d6d45d3.JPG', 'https://photo.tuchong.com/7194943/f/1241067746.jpg', 'image/jpeg', 'DSC07125.JPG', '2022-01-04 22:04:08', 'photos29648', 29648);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (64, 'photos29648', '3cdd6d68c165458db4ea05cf661517ed.JPG', 'https://photo.tuchong.com/7194943/f/958411081.jpg', 'image/jpeg', 'DSC07156.JPG', '2022-01-04 22:04:11', 'photos29648', 29648);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (65, 'photos29648', '946624fcb4344b5da450f70934a44ce6.JPG', 'https://photo.tuchong.com/7194943/f/831271332.jpg', 'image/jpeg', 'DSC07234.JPG', '2022-01-04 22:04:15', 'photos29648', 29648);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (66, 'photos29648', '8e5cda86841c464f8f6c6b7281b8c5da.JPG', 'https://photo.tuchong.com/7194943/f/713633916.jpg', 'image/jpeg', 'DSC07168.JPG', '2022-01-04 22:04:19', 'photos29648', 29648);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (67, 'photos29648', '76a6261b424a497fb3436e54e5d3990b.JPG', 'https://photo.tuchong.com/7194943/f/656748851.jpg', 'image/jpeg', 'DSC07210.JPG', '2022-01-04 22:04:23', 'photos29648', 29648);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (68, 'photos29648', '0acacb65c42149ff91d28e8d7fd059d3.JPG', 'http://fileserver.youngbird97.top//statics/photos29648/0acacb65c42149ff91d28e8d7fd059d3.JPG', 'image/jpeg', 'DSC07196.JPG', '2022-01-04 22:04:26', 'photos29648', 29648);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (69, 'photos29648', 'd5475644699d4f5d865c42f7e6db4bef.JPG', 'http://fileserver.youngbird97.top//statics/photos29648/d5475644699d4f5d865c42f7e6db4bef.JPG', 'image/jpeg', 'DSC07112.JPG', '2022-01-04 22:04:30', 'photos29648', 29648);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (70, 'photos23653', '43921aa2f8b04f96a5d23a9026c89700.jpeg', 'http://fileserver.youngbird97.top//statics/photos23653/43921aa2f8b04f96a5d23a9026c89700.jpeg', 'image/jpeg', 'WechatIMG457.jpeg', '2022-01-04 22:31:28', 'photos23653', 23653);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (71, 'photos23653', '545a73ac0bf641c88a718c18dc6e60de.jpeg', 'http://fileserver.youngbird97.top//statics/photos23653/545a73ac0bf641c88a718c18dc6e60de.jpeg', 'image/jpeg', 'WechatIMG458.jpeg', '2022-01-04 22:31:31', 'photos23653', 23653);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (72, 'photos23653', '08165db0d61a4f229c696011536d3eae.jpeg', 'http://fileserver.youngbird97.top//statics/photos23653/08165db0d61a4f229c696011536d3eae.jpeg', 'image/jpeg', 'WechatIMG462.jpeg', '2022-01-04 22:31:34', 'photos23653', 23653);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (73, 'photos23653', '7bad9ffbfd04488887b4cc1d64d7390f.jpeg', 'http://fileserver.youngbird97.top//statics/photos23653/7bad9ffbfd04488887b4cc1d64d7390f.jpeg', 'image/jpeg', 'WechatIMG464.jpeg', '2022-01-04 22:31:37', 'photos23653', 23653);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (74, 'photos23653', '0217effbb70f4d4eab9da04f55cba705.jpeg', 'http://fileserver.youngbird97.top//statics/photos23653/0217effbb70f4d4eab9da04f55cba705.jpeg', 'image/jpeg', 'WechatIMG465.jpeg', '2022-01-04 22:31:40', 'photos23653', 23653);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (75, 'photos23653', '720c7cba993f482fb04df39625f9f387.jpeg', 'http://fileserver.youngbird97.top//statics/photos23653/720c7cba993f482fb04df39625f9f387.jpeg', 'image/jpeg', 'WechatIMG466.jpeg', '2022-01-04 22:31:43', 'photos23653', 23653);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (76, 'photos23653', '1feceec14abc4fdca243ce8ab4e49ef7.jpeg', 'http://fileserver.youngbird97.top//statics/photos23653/1feceec14abc4fdca243ce8ab4e49ef7.jpeg', 'image/jpeg', 'WechatIMG468.jpeg', '2022-01-04 22:31:47', 'photos23653', 23653);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (77, 'photos23653', '68e534806c39407594ece1842c5b533e.jpeg', 'http://fileserver.youngbird97.top//statics/photos23653/68e534806c39407594ece1842c5b533e.jpeg', 'image/jpeg', 'WechatIMG469.jpeg', '2022-01-04 22:31:49', 'photos23653', 23653);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (78, 'photos23653', '8de76fad54b743adabe2a44a7597dc28.jpeg', 'http://fileserver.youngbird97.top//statics/photos23653/8de76fad54b743adabe2a44a7597dc28.jpeg', 'image/jpeg', 'WechatIMG472.jpeg', '2022-01-04 22:31:52', 'photos23653', 23653);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (79, 'ArticleCover', '9e2d7db67cdb429ba9c5a507d1168260.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/9e2d7db67cdb429ba9c5a507d1168260.jpg', 'image/jpeg', '未标题-1.jpg', '2022-01-04 23:10:13', 'ArticleCover17807', 17807);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (80, 'editor', '2a58243569354a39b096c42440f1f200.png', 'http://fileserver.youngbird97.top//statics/editor/2a58243569354a39b096c42440f1f200.png', 'image/png', 'image.png', '2022-01-20 00:44:55', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (81, 'ArticleCover', 'dc5cafc81cb54fe598f3f8ea6b58df1e.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/dc5cafc81cb54fe598f3f8ea6b58df1e.jpg', 'image/jpeg', 'cover.jpg', '2022-01-20 00:58:51', 'ArticleCover17122', 17122);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (82, 'editor', '4da6d03dfcd4442abefcfb4aaad486df.png', 'http://fileserver.youngbird97.top//statics/editor/4da6d03dfcd4442abefcfb4aaad486df.png', 'image/png', 'image.png', '2022-01-20 01:02:50', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (83, 'ArticleCover', 'acec86576fb14bf7b6679554460db105.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/acec86576fb14bf7b6679554460db105.jpg', 'image/jpeg', 'cover 拷贝.jpg', '2022-01-20 01:07:36', 'ArticleCover22185', 22185);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (84, 'editor', '36a19564d5aa4f80a5d422548fac1efe.png', 'http://fileserver.youngbird97.top//statics/editor/36a19564d5aa4f80a5d422548fac1efe.png', 'image/png', 'image.png', '2022-01-20 01:13:48', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (85, 'ArticleCover', 'fa89217cdff74ff6bd0a373e5b84d382.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/fa89217cdff74ff6bd0a373e5b84d382.jpg', 'image/jpeg', 'cover 拷贝.jpg', '2022-01-20 01:26:17', 'ArticleCover28519', 28519);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (86, 'editor', '918e69cd51a6481790622ea274fd1480.png', 'http://fileserver.youngbird97.top//statics/editor/918e69cd51a6481790622ea274fd1480.png', 'image/png', 'image.png', '2022-01-20 15:44:46', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (87, 'ArticleCover', '7bc5060a6b2645ec96bf194cd7440271.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/7bc5060a6b2645ec96bf194cd7440271.jpg', 'image/jpeg', 'cover 拷贝.jpg', '2022-01-20 15:45:49', 'ArticleCover17232', 17232);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (88, 'editor', 'd254a9a9d42642708c3108e9c94a9dcc.png', 'http://fileserver.youngbird97.top//statics/editor/d254a9a9d42642708c3108e9c94a9dcc.png', 'image/png', 'image.png', '2022-01-20 15:52:07', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (89, 'editor', 'c5a9a4d227f54224bc56c53fa04108d4.png', 'http://fileserver.youngbird97.top//statics/editor/c5a9a4d227f54224bc56c53fa04108d4.png', 'image/png', 'image.png', '2022-01-20 15:52:14', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (90, 'editor', '2f8ca80e6da240b98ec64703b6957006.png', 'http://fileserver.youngbird97.top//statics/editor/2f8ca80e6da240b98ec64703b6957006.png', 'image/png', 'image.png', '2022-01-20 15:58:37', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (91, 'ArticleCover', '39a41acf25a9443f8d948861a2f9de18.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/39a41acf25a9443f8d948861a2f9de18.jpg', 'image/jpeg', 'cover 拷贝.jpg', '2022-01-20 15:59:13', 'ArticleCover3312', 3312);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (92, 'editor', '670e25d0d3cb437b841e17f2cdcb6278.png', 'http://fileserver.youngbird97.top//statics/editor/670e25d0d3cb437b841e17f2cdcb6278.png', 'image/png', 'image.png', '2022-01-20 16:06:47', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (93, 'editor', '54bc1c3bdaa64896b2befdececce32f3.png', 'http://fileserver.youngbird97.top//statics/editor/54bc1c3bdaa64896b2befdececce32f3.png', 'image/png', 'image.png', '2022-01-20 16:06:53', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (94, 'editor', '0375ac38849e4eb29c8f3631d86a03ee.png', 'http://fileserver.youngbird97.top//statics/editor/0375ac38849e4eb29c8f3631d86a03ee.png', 'image/png', 'image.png', '2022-01-20 16:06:58', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (95, 'editor', '5901779fb5514f869537e54b66dfdfc1.PNG', 'http://fileserver.youngbird97.top//statics/editor/5901779fb5514f869537e54b66dfdfc1.PNG', 'image/png', 'IMG_0434 2.PNG', '2022-01-20 16:28:36', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (96, 'ArticleCover', '88815ad318414238a7a198cc8491d125.jpeg', 'http://fileserver.youngbird97.top//statics/ArticleCover/88815ad318414238a7a198cc8491d125.jpeg', 'image/jpeg', 'cover 拷贝 (1).jpeg', '2022-01-20 16:29:43', 'ArticleCover3405', 3405);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (97, 'editor', 'd434006032df4bc491e943b2921ec48e.png', 'http://fileserver.youngbird97.top//statics/editor/d434006032df4bc491e943b2921ec48e.png', 'image/png', 'image.png', '2022-01-20 18:49:31', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (98, 'editor', '7397678e0c134e1e9b02cbdaa958055f.png', 'http://fileserver.youngbird97.top//statics/editor/7397678e0c134e1e9b02cbdaa958055f.png', 'image/png', 'image.png', '2022-01-20 18:49:42', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (99, 'ArticleCover', '94b51d26b8594140b137438cc770f23f.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/94b51d26b8594140b137438cc770f23f.jpg', 'image/jpeg', 'cover 拷贝.jpg', '2022-01-20 18:58:01', 'ArticleCover8888', 8888);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (100, 'editor', '2d73006798504f1e82fce5eb5249c38b.png', 'http://fileserver.youngbird97.top//statics/editor/2d73006798504f1e82fce5eb5249c38b.png', 'image/png', 'image.png', '2022-01-20 19:51:46', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (101, 'editor', '003c70395fef4ff9b59d4df0f611593a.png', 'http://fileserver.youngbird97.top//statics/editor/003c70395fef4ff9b59d4df0f611593a.png', 'image/png', 'image.png', '2022-01-20 19:51:52', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (102, 'ArticleCover', '380c735af5a34a66b5a800d3f1480f24.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/380c735af5a34a66b5a800d3f1480f24.jpg', 'image/jpeg', 'cover 拷贝.jpg', '2022-01-20 19:54:51', 'ArticleCover22710', 22710);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (103, 'editor', 'b3191ec8184e4b5baae095f9c40f09b9.png', 'http://fileserver.youngbird97.top//statics/editor/b3191ec8184e4b5baae095f9c40f09b9.png', 'image/png', 'image.png', '2022-01-20 20:13:41', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (104, 'ArticleCover', 'f908303e0a744926acb9d17e80ef1f58.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/f908303e0a744926acb9d17e80ef1f58.jpg', 'image/jpeg', 'cover 拷贝.jpg', '2022-01-20 20:15:54', 'ArticleCover20649', 20649);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (105, 'editor', '578135dac74340729b4aebb5a04eb11f.png', 'http://fileserver.youngbird97.top//statics/editor/578135dac74340729b4aebb5a04eb11f.png', 'image/png', 'image.png', '2022-01-20 20:48:23', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (106, 'editor', 'f2cf0f78e1aa4c5182307a432c70e9fb.png', 'http://fileserver.youngbird97.top//statics/editor/f2cf0f78e1aa4c5182307a432c70e9fb.png', 'image/png', 'image.png', '2022-01-20 20:48:31', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (107, 'ArticleCover', '01156cf6f5754164a5b79de59ec25f69.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/01156cf6f5754164a5b79de59ec25f69.jpg', 'image/jpeg', 'cover 拷贝.jpg', '2022-01-20 20:54:02', 'ArticleCover17783', 17783);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (108, 'editor', '669780a1697e40a5b787d8c091c686f2.png', 'http://fileserver.youngbird97.top//statics/editor/669780a1697e40a5b787d8c091c686f2.png', 'image/png', 'image.png', '2022-01-21 11:44:25', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (109, 'editor', 'af117363409448cda00d653eb712f677.png', 'http://fileserver.youngbird97.top//statics/editor/af117363409448cda00d653eb712f677.png', 'image/png', 'image.png', '2022-01-21 11:50:42', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (110, 'ArticleCover', '08668f7d3a1d4d20a250cbd567c9dc14.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/08668f7d3a1d4d20a250cbd567c9dc14.jpg', 'image/jpeg', 'cover 拷贝.jpg', '2022-01-21 11:51:35', 'ArticleCover19275', 19275);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (111, 'editor', '492676f16cb949f8aee4262a6e7983f5.png', 'http://fileserver.youngbird97.top//statics/editor/492676f16cb949f8aee4262a6e7983f5.png', 'image/png', 'image.png', '2022-01-23 22:08:34', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (112, 'editor', '8ff079cac2754f8ba77e00e32a639d9d.png', 'http://fileserver.youngbird97.top//statics/editor/8ff079cac2754f8ba77e00e32a639d9d.png', 'image/png', 'image.png', '2022-01-23 22:08:46', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (113, 'editor', '036fde10ba6149669a15fe01f412363b.png', 'http://fileserver.youngbird97.top//statics/editor/036fde10ba6149669a15fe01f412363b.png', 'image/png', 'image.png', '2022-01-23 22:15:08', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (114, 'editor', 'eb07b5b4f7b1440a97b2ad72e4432fab.png', 'http://fileserver.youngbird97.top//statics/editor/eb07b5b4f7b1440a97b2ad72e4432fab.png', 'image/png', 'image.png', '2022-01-23 22:15:21', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (115, 'editor', '0ed6086802f74c739a2af43cf2cacd60.png', 'http://fileserver.youngbird97.top//statics/editor/0ed6086802f74c739a2af43cf2cacd60.png', 'image/png', 'image.png', '2022-01-23 22:15:28', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (116, 'ArticleCover', '00681e00e5a441d8bd1917f0f0362aed.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/00681e00e5a441d8bd1917f0f0362aed.jpg', 'image/jpeg', '1020.jpg', '2022-01-23 22:19:29', 'ArticleCover3369', 3369);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (117, 'editor', 'bce1b0bf76cd429c9832b2e75d4ec238.png', 'http://fileserver.youngbird97.top//statics/editor/bce1b0bf76cd429c9832b2e75d4ec238.png', 'image/png', 'image.png', '2022-01-23 22:24:37', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (118, 'editor', '517e01d162e54bb28e1d2206287fe980.png', 'http://fileserver.youngbird97.top//statics/editor/517e01d162e54bb28e1d2206287fe980.png', 'image/png', 'image.png', '2022-01-23 22:29:20', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (119, 'ArticleCover', '8457041eac12472d9f094eb0d3c078f5.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/8457041eac12472d9f094eb0d3c078f5.jpg', 'image/jpeg', 'cover127.jpg', '2022-01-23 22:38:48', 'ArticleCover29417', 29417);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (120, 'editor', 'fc9120e208bf4650a2db3b92bb1013a4.png', 'http://fileserver.youngbird97.top//statics/editor/fc9120e208bf4650a2db3b92bb1013a4.png', 'image/png', 'image.png', '2022-01-29 23:08:42', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (121, 'editor', '22293be2859a4bf8afd62754f9d09dae.png', 'http://fileserver.youngbird97.top//statics/editor/22293be2859a4bf8afd62754f9d09dae.png', 'image/png', 'image.png', '2022-01-29 23:10:12', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (122, 'editor', 'e7edfe4ad94b4a23a832e6da9751247e.png', 'http://fileserver.youngbird97.top//statics/editor/e7edfe4ad94b4a23a832e6da9751247e.png', 'image/png', 'image.png', '2022-01-29 23:17:49', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (123, 'editor', 'ccaf70f7070d4e60b5c62f075871a8cc.png', 'http://fileserver.youngbird97.top//statics/editor/ccaf70f7070d4e60b5c62f075871a8cc.png', 'image/png', 'image.png', '2022-01-29 23:18:00', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (124, 'editor', '78bc475d999544eabbb310602d81db3c.png', 'http://fileserver.youngbird97.top//statics/editor/78bc475d999544eabbb310602d81db3c.png', 'image/png', 'image.png', '2022-01-29 23:26:08', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (125, 'ArticleCover', '9e9d9860044344cf8c1e906494f5c6be.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/9e9d9860044344cf8c1e906494f5c6be.jpg', 'image/jpeg', 'tree3.jpg', '2022-01-29 23:46:51', 'ArticleCover9684', 9684);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (126, 'editor', 'b4d92ae02e1240688578ea9cb6632529.png', 'http://fileserver.youngbird97.top//statics/editor/b4d92ae02e1240688578ea9cb6632529.png', 'image/png', 'image.png', '2022-01-30 00:08:30', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (127, 'ArticleCover', '2e1b8a31a785454b947d26950643c735.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/2e1b8a31a785454b947d26950643c735.jpg', 'image/jpeg', 'www.jpg', '2022-01-30 00:15:04', 'ArticleCover21238', 21238);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (128, 'editor', '45a4e18917de4066b60d36f64083a9f9.png', 'http://fileserver.youngbird97.top//statics/editor/45a4e18917de4066b60d36f64083a9f9.png', 'image/png', 'image.png', '2022-02-10 15:37:51', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (129, 'editor', 'fcebb86e91714cc49059d7d6656fdabc.png', 'http://fileserver.youngbird97.top//statics/editor/fcebb86e91714cc49059d7d6656fdabc.png', 'image/png', 'image.png', '2022-02-10 15:40:25', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (130, 'editor', 'cde0fedeec7f4a65b96ca49d7fc31eb8.png', 'http://fileserver.youngbird97.top//statics/editor/cde0fedeec7f4a65b96ca49d7fc31eb8.png', 'image/png', 'image.png', '2022-02-10 15:40:51', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (131, 'editor', 'a168d80e3e1c493d94c6c2bb79529982.png', 'http://fileserver.youngbird97.top//statics/editor/a168d80e3e1c493d94c6c2bb79529982.png', 'image/png', 'image.png', '2022-02-10 15:41:06', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (132, 'editor', '392250c6bb464ba9a5a1a6aaeeb7a9db.png', 'http://fileserver.youngbird97.top//statics/editor/392250c6bb464ba9a5a1a6aaeeb7a9db.png', 'image/png', 'image.png', '2022-02-10 15:42:47', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (133, 'editor', '2131604bbcf94453985e91e6f82766e9.png', 'http://fileserver.youngbird97.top//statics/editor/2131604bbcf94453985e91e6f82766e9.png', 'image/png', 'image.png', '2022-02-10 15:51:25', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (134, 'editor', 'cbc71283bd264242b1fe07f3b01d16c7.png', 'http://fileserver.youngbird97.top//statics/editor/cbc71283bd264242b1fe07f3b01d16c7.png', 'image/png', 'image.png', '2022-02-10 15:51:47', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (135, 'editor', '92f5d97cf7b44b61a8dcb86277c25dd2.png', 'http://fileserver.youngbird97.top//statics/editor/92f5d97cf7b44b61a8dcb86277c25dd2.png', 'image/png', 'image.png', '2022-02-10 15:53:17', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (136, 'editor', '1ecb158f16ae46ab8bf29f6d2650d3a2.png', 'http://fileserver.youngbird97.top//statics/editor/1ecb158f16ae46ab8bf29f6d2650d3a2.png', 'image/png', 'image.png', '2022-02-10 15:54:28', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (137, 'editor', 'f1fbf22b480844929490d571d44c4ee1.png', 'http://fileserver.youngbird97.top//statics/editor/f1fbf22b480844929490d571d44c4ee1.png', 'image/png', 'image.png', '2022-02-10 15:55:17', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (138, 'editor', '2eab9f17b2b84bafbf9b27f7a6991f93.png', 'http://fileserver.youngbird97.top//statics/editor/2eab9f17b2b84bafbf9b27f7a6991f93.png', 'image/png', 'image.png', '2022-02-10 15:55:19', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (139, 'editor', '343c6d310b184e5cac6f8e0d0a287dba.png', 'http://fileserver.youngbird97.top//statics/editor/343c6d310b184e5cac6f8e0d0a287dba.png', 'image/png', 'image.png', '2022-02-10 15:56:43', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (140, 'ArticleCover', '381cbbe7ba124b28a49424e2e88c1ece.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/381cbbe7ba124b28a49424e2e88c1ece.jpg', 'image/jpeg', 'mongo.jpg', '2022-02-10 15:57:20', 'ArticleCover6614', 6614);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (141, 'ArticleCover', '9f68cf7f09c4463895f23178b9bb380c.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/9f68cf7f09c4463895f23178b9bb380c.jpg', 'image/jpeg', '934.jpg', '2022-04-17 21:01:54', 'ArticleCover18964', 18964);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (142, 'editor', '4802d784d2b749699cc323e63c20bffe.png', 'http://fileserver.youngbird97.top//statics/editor/4802d784d2b749699cc323e63c20bffe.png', 'image/png', 'image.png', '2022-04-18 22:20:12', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (143, 'editor', '12df31d1630e4dbeb9d8a6577c8598f9.jpeg', 'http://fileserver.youngbird97.top//statics/editor/12df31d1630e4dbeb9d8a6577c8598f9.jpeg', 'image/jpeg', 'IMG_BA6A928FDDBC-1.jpeg', '2022-04-18 22:21:02', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (144, 'editor', 'f89a77e3b6ec416ca5784f5ed6363d05.png', 'http://fileserver.youngbird97.top//statics/editor/f89a77e3b6ec416ca5784f5ed6363d05.png', 'image/png', 'image.png', '2022-04-18 22:27:16', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (145, 'ArticleCover', 'e582e56169c8452e8152c802a6171521.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/e582e56169c8452e8152c802a6171521.jpg', 'image/jpeg', '861.jpg', '2022-04-18 22:28:09', 'ArticleCover27344', 27344);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (146, 'editor', 'f8e9daabfbed42b480955733fc189e9c.png', 'http://fileserver.youngbird97.top//statics/editor/f8e9daabfbed42b480955733fc189e9c.png', 'image/png', 'image.png', '2022-04-20 17:46:16', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (147, 'editor', 'fd78135d1f15460184d2e6410577632b.png', 'http://fileserver.youngbird97.top//statics/editor/fd78135d1f15460184d2e6410577632b.png', 'image/png', 'image.png', '2022-04-20 17:55:59', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (148, 'editor', '556af3b35cd84a2084bf64fb9e604e56.png', 'http://fileserver.youngbird97.top//statics/editor/556af3b35cd84a2084bf64fb9e604e56.png', 'image/png', 'image.png', '2022-04-20 17:58:15', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (149, 'ArticleCover', '547c1c3f852647dc89433f0e0563672b.jpeg', 'http://fileserver.youngbird97.top//statics/ArticleCover/547c1c3f852647dc89433f0e0563672b.jpeg', 'image/jpeg', '401 (1).jpeg', '2022-04-20 17:58:35', 'ArticleCover5135', 5135);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (150, 'editor', '265bead2cb9f4358b14014c26f7f02c1.png', 'http://fileserver.youngbird97.top//statics/editor/265bead2cb9f4358b14014c26f7f02c1.png', 'image/png', 'image.png', '2022-04-21 12:34:49', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (151, 'ArticleCover', '52ae8b5de7834332bc097c30b3ce656f.jpeg', 'http://fileserver.youngbird97.top//statics/ArticleCover/52ae8b5de7834332bc097c30b3ce656f.jpeg', 'image/jpeg', '682 (1).jpeg', '2022-04-21 12:35:37', 'ArticleCover16095', 16095);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (152, 'ArticleCover', '4ed777cf3dde448581e13d15744a595f.jpeg', 'http://fileserver.youngbird97.top//statics/ArticleCover/4ed777cf3dde448581e13d15744a595f.jpeg', 'image/jpeg', '202 (1).jpeg', '2022-04-24 00:31:40', 'ArticleCover5661', 5661);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (153, 'editor', 'f2c4de1f562d4d6ebda18d7aa6cabede.png', 'http://fileserver.youngbird97.top//statics/editor/f2c4de1f562d4d6ebda18d7aa6cabede.png', 'image/png', 'image.png', '2022-09-07 13:31:49', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (154, 'editor', '3127f34e22ab4db09d36680293380142.png', 'http://fileserver.youngbird97.top//statics/editor/3127f34e22ab4db09d36680293380142.png', 'image/png', 'image.png', '2022-09-07 13:31:46', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (155, 'ArticleCover', '77cbb6af310341009d2b0265ba1351aa.jpg', 'http://fileserver.youngbird97.top//statics/ArticleCover/77cbb6af310341009d2b0265ba1351aa.jpg', 'image/jpeg', '2265.jpg', '2022-09-07 13:38:29', 'ArticleCover14150', 14150);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (156, 'ArticleCover', '4be58f7d61f2442f9c7c46368286c098.png', 'http://fileserver.youngbird97.top//statics/ArticleCover/4be58f7d61f2442f9c7c46368286c098.png', 'image/png', 'WechatIMG392.png', '2022-09-13 16:46:49', 'ArticleCover23257', 23257);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (157, 'ArticleCover', '8b38ee3ecc2644309833cc32fd3e6ddd.png', 'http://fileserver.youngbird97.top//statics/ArticleCover/8b38ee3ecc2644309833cc32fd3e6ddd.png', 'image/png', '11134444.png', '2022-09-15 23:18:50', 'ArticleCover20028', 20028);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (158, 'editor', '29cf2a6df32346b1b862d2033e7c93a0.png', 'http://fileserver.youngbird97.top//statics/editor/29cf2a6df32346b1b862d2033e7c93a0.png', 'image/png', 'image.png', '2022-09-15 23:22:42', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (159, 'ArticleCover', 'be37266f1163438fb848061ec199b7d4.png', 'http://fileserver.youngbird97.top//statics/ArticleCover/be37266f1163438fb848061ec199b7d4.png', 'image/png', '11223.png', '2022-09-15 23:26:39', 'ArticleCover17490', 17490);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (160, 'ArticleCover', 'e251117eeb2849408d23f8ec34a9213c.png', 'http://fileserver.youngbird97.top//statics/ArticleCover/e251117eeb2849408d23f8ec34a9213c.png', 'image/png', 'WechatIMG673.png', '2022-09-24 21:29:28', 'ArticleCover29014', 29014);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (161, 'ArticleCover', '5b25f62eade2453190022b6f91710e1f.png', 'http://fileserver.youngbird97.top//statics/ArticleCover/5b25f62eade2453190022b6f91710e1f.png', 'image/png', 'WechatIMG674.png', '2022-09-24 21:48:05', 'ArticleCover3903', 3903);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (162, 'editor', '7e887a5877404d26b76dc555c6473206.png', 'http://fileserver.youngbird97.top//statics/editor/7e887a5877404d26b76dc555c6473206.png', 'image/png', 'WechatIMG778.png', '2022-11-07 22:50:34', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (163, 'editor', '9baf003da0c54575a92f216ac47d5384.png', 'http://fileserver.youngbird97.top//statics/editor/9baf003da0c54575a92f216ac47d5384.png', 'image/png', 'WechatIMG779.png', '2022-11-07 22:50:48', 'editor0', 0);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (164, 'ArticleCover', '952543c524924e1bbe73831daa6cc65d.png', 'http://fileserver.youngbird97.top//statics/ArticleCover/952543c524924e1bbe73831daa6cc65d.png', 'image/png', 'WechatIMG777.png', '2022-11-07 22:59:48', 'ArticleCover17907', 17907);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (165, 'ArticleCover', '18e9deba40ee4e958fbe10760e018839.png', 'http://fileserver.youngbird97.top//statics/ArticleCover/18e9deba40ee4e958fbe10760e018839.png', 'image/png', 'WechatIMG780.png', '2022-11-07 23:20:28', 'ArticleCover5160', 5160);
INSERT INTO `file_record` (`id`, `fileType`, `fileName`, `fileUrl`, `mineType`, `originalName`, `upload_time`, `directory`, `aid`) VALUES (166, 'ArticleCover', 'f5818647093a42b4b3acc1bde478feca.png', 'http://fileserver.youngbird97.top//statics/ArticleCover/f5818647093a42b4b3acc1bde478feca.png', 'image/png', 'WechatIMG781.png', '2022-11-07 23:42:09', 'ArticleCover27804', 27804);
COMMIT;

-- ----------------------------
-- Table structure for helper
-- ----------------------------
DROP TABLE IF EXISTS `helper`;
CREATE TABLE `helper` (
  `source_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `new_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `file_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of helper
-- ----------------------------
BEGIN;
INSERT INTO `helper` (`source_file`, `new_file`, `file_no`, `create_time`, `id`) VALUES ('KFH00064_20221123_08-04-46.pdf', '1112302_20221123_08-04-46.pdf', '1112302', '2022-11-22 20:14:29', 1556);
INSERT INTO `helper` (`source_file`, `new_file`, `file_no`, `create_time`, `id`) VALUES ('KFH00064_20221123_08-12-19.pdf', '1112303_20221123_08-12-19.pdf', '1112303', '2022-11-22 20:14:29', 1557);
INSERT INTO `helper` (`source_file`, `new_file`, `file_no`, `create_time`, `id`) VALUES ('KFH00064_20221123_08-17-31.pdf', '1112307_20221123_08-17-31.pdf', '1112307', '2022-11-22 20:14:29', 1558);
INSERT INTO `helper` (`source_file`, `new_file`, `file_no`, `create_time`, `id`) VALUES ('KFH00064_20221123_08-20-39.pdf', '1112305_20221123_08-20-39.pdf', '1112305', '2022-11-22 20:14:29', 1559);
INSERT INTO `helper` (`source_file`, `new_file`, `file_no`, `create_time`, `id`) VALUES ('KFH00064_20221123_08-24-19.pdf', '1112304_20221123_08-24-19.pdf', '1112304', '2022-11-22 20:14:29', 1560);
INSERT INTO `helper` (`source_file`, `new_file`, `file_no`, `create_time`, `id`) VALUES ('KFH00064_20221123_08-26-53.pdf', '1112306_20221123_08-26-53.pdf', '1112306', '2022-11-22 20:14:29', 1561);
INSERT INTO `helper` (`source_file`, `new_file`, `file_no`, `create_time`, `id`) VALUES ('KFH00064_20221123_08-30-28.pdf', '1112301_20221123_08-30-28.pdf', '1112301', '2022-11-22 20:14:29', 1562);
INSERT INTO `helper` (`source_file`, `new_file`, `file_no`, `create_time`, `id`) VALUES ('KFH00064_20221123_08-38-34.pdf', '1112308_20221123_08-38-34.pdf', '1112308', '2022-11-22 20:14:29', 1563);
INSERT INTO `helper` (`source_file`, `new_file`, `file_no`, `create_time`, `id`) VALUES ('KFH00064_20221123_08-42-40.pdf', '1112309_20221123_08-42-40.pdf', '1112309', '2022-11-22 20:14:29', 1564);
INSERT INTO `helper` (`source_file`, `new_file`, `file_no`, `create_time`, `id`) VALUES ('KFH00064_20221123_08-48-53.pdf', '1112310_20221123_08-48-53.pdf', '1112310', '2022-11-22 20:14:29', 1565);
INSERT INTO `helper` (`source_file`, `new_file`, `file_no`, `create_time`, `id`) VALUES ('KFH00064_20221123_08-55-51.pdf', '1112311_20221123_08-55-51.pdf', '1112311', '2022-11-22 20:14:29', 1566);
INSERT INTO `helper` (`source_file`, `new_file`, `file_no`, `create_time`, `id`) VALUES ('KFH00064_20221123_09-32-41.pdf', '1112313_20221123_09-32-41.pdf', '1112313', '2022-11-22 20:14:29', 1567);
INSERT INTO `helper` (`source_file`, `new_file`, `file_no`, `create_time`, `id`) VALUES ('KFH00064_20221123_09-41-19.pdf', '1112312_20221123_09-41-19.pdf', '1112312', '2022-11-22 20:14:29', 1568);
COMMIT;

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of media
-- ----------------------------
BEGIN;
INSERT INTO `media` (`id`, `client_id`, `client_secret`, `type`, `token`) VALUES (1, 'a25f16728d599ad2', '7895cb4d0512328d65f990aa7696992e', 'youku', 'c184127bd627c14e5a0599de53546642');
COMMIT;

-- ----------------------------
-- Table structure for moment
-- ----------------------------
DROP TABLE IF EXISTS `moment`;
CREATE TABLE `moment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `publishTime` datetime DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '/img/index/headp.jpg',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'tothemoon',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of moment
-- ----------------------------
BEGIN;
INSERT INTO `moment` (`id`, `publishTime`, `avatar`, `content`, `username`) VALUES (1, '2022-09-07 13:50:39', '/img/index/headp.jpg', '论文收尾阶段，两份论文打印竟然要50欧，震惊一万年🤯。希望答辩的时候不要问我问题！！！！本社恐会紧张到丧失听力。', 'tothemoon');
INSERT INTO `moment` (`id`, `publishTime`, `avatar`, `content`, `username`) VALUES (2, '2022-05-12 13:51:38', '/img/index/headp.jpg', '柯南忠粉，再次回顾「天空中的遇难船」「水平线上的阴谋」「第十四个目标」......tons of....', 'tothemoon');
INSERT INTO `moment` (`id`, `publishTime`, `avatar`, `content`, `username`) VALUES (3, '2022-04-18 13:52:01', '/img/index/headp.jpg', '今晚上又看了一遍「风声」，十二年来我心里，没有一部谍战片能超越它！看完之后，疑惑为什么周迅王菲这么有魅力的女性会跟李亚鹏扯上关系？', 'tothemoon');
INSERT INTO `moment` (`id`, `publishTime`, `avatar`, `content`, `username`) VALUES (4, '2022-04-15 13:52:14', '/img/index/headp.jpg', '真心半解 The Half of It」青春橘片最佳，没有之一（个人排名）。要说是橘片，实际上刻画最多的是友情，这才是普通人的校园片啊！希望伍思薇导演能多肝点优秀片子！！', 'tothemoon');
INSERT INTO `moment` (`id`, `publishTime`, `avatar`, `content`, `username`) VALUES (5, '2022-04-13 13:52:36', '/img/index/headp.jpg', '「招魂3 The Conjuring: The Devil Made Me Do It」没有温子仁导演的招魂，水准就像是电锯惊魂8。不是所有导演有能力拍的。', 'tothemoon');
INSERT INTO `moment` (`id`, `publishTime`, `avatar`, `content`, `username`) VALUES (6, '2022-09-11 15:28:16', '/img/index/headp.jpg', '最小公倍数(JAVA version):     public int GCD(int a, int b){\n        while(b != 0 ){\n            int temp = b;\n            b = a%b;\n            a = temp;\n        }\n        return a;\n    }', 'tothemoon');
INSERT INTO `moment` (`id`, `publishTime`, `avatar`, `content`, `username`) VALUES (7, '2022-09-25 13:01:27', '/img/index/headp.jpg', 'https://leetcode.com/problems/palindrome-partitioning/ 【131. Palindrome Partitioning\n】', 'tothemoon');
INSERT INTO `moment` (`id`, `publishTime`, `avatar`, `content`, `username`) VALUES (8, '2022-10-29 22:02:22', '/img/index/headp.jpg', 'int[] res = ans.stream().mapToInt(Integer::intValue).toArray();  List数组转化为int数组，不需要循环添加数据', 'tothemoon');
INSERT INTO `moment` (`id`, `publishTime`, `avatar`, `content`, `username`) VALUES (9, '2022-10-30 12:48:10', '/img/index/headp.jpg', '        int[] n1 = new int[nums.length-1];\n        System.arraycopy(nums, 1, n1, 0, nums.length - 1);  used for modify int array(arr,start,newarr,end,len)', 'tothemoon');
COMMIT;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `jump` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (1, '菜单', 0, NULL, NULL, NULL);
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (2, '主页', 1, 'layui-icon-home', NULL, NULL);
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (3, '控制台', 2, NULL, '/', NULL);
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (5, '摄影图片管理', 6, NULL, 'web/photo/list', 'photo');
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (6, '网站维护', 1, 'layui-icon-app', NULL, 'app');
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (7, '文章列表', 6, NULL, 'app/content/list', 'list');
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (9, '评论管理', 6, NULL, 'app/content/comment', 'comment');
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (10, '消息中心', 6, NULL, 'app/message/', 'message');
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (14, '角色管理', 1, 'layui-icon-user', NULL, 'user');
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (15, '角色维护', 14, '', 'user/worker/worker', 'worker');
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (17, '角色管理', 14, NULL, 'user/administrators/role', 'administrators-rule');
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (18, '数据库管理', 1, 'layui-icon-template-1\r\n', NULL, 'client');
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (24, '权限菜单', 6, NULL, 'app/webmenu/list', 'webmenu');
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (31, '标签管理', 6, NULL, 'web/tags/list', 'tags');
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (32, '个人信息', 1, 'layui-icon-friends', NULL, NULL);
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (33, '我的资料', 32, NULL, 'set/user/info', 'user');
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (34, '修改密码', 32, NULL, 'set/user/password', 'user');
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (35, '设置', 1, 'layui-icon-set-fill', NULL, NULL);
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (36, '邮件设置', 35, NULL, 'set/system/email', 'system');
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (37, '网站设置', 35, NULL, 'set/system/website', 'system');
INSERT INTO `permission` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (38, '微信账户管理', 18, NULL, 'wx/weixin/list', NULL);
COMMIT;

-- ----------------------------
-- Table structure for permission_copy1
-- ----------------------------
DROP TABLE IF EXISTS `permission_copy1`;
CREATE TABLE `permission_copy1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `jump` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of permission_copy1
-- ----------------------------
BEGIN;
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (1, '菜单', 0, NULL, NULL, NULL);
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (2, '主页', 1, 'layui-icon-home', NULL, NULL);
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (3, '控制台', 2, NULL, '/', NULL);
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (5, '常见问题', 6, NULL, 'web/problem/list', 'problem');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (6, '网站维护', 1, 'layui-icon-app', NULL, 'app');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (7, '文章列表', 6, NULL, 'app/content/list', 'list');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (9, '评论管理', 6, NULL, 'app/content/comment', 'comment');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (10, '消息中心', 6, NULL, 'app/message/', 'message');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (11, '工单系统', 6, '', 'app/workorder/list', 'workorder');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (12, '高级', 1, 'layui-icon-senior', NULL, 'senior');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (13, '在线客服', 12, NULL, 'senior/im/list', 'im');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (14, '公司人员', 1, 'layui-icon-user', NULL, 'user');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (15, '员工维护', 14, '', 'user/worker/worker', 'worker');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (16, '值班系统', 14, NULL, 'user/duty/list', 'duty-system');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (17, '角色管理', 14, NULL, 'user/administrators/role', 'administrators-rule');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (18, '数据库管理', 1, 'layui-icon-template-1\r\n', NULL, 'client');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (19, '企业客户列表', 30, NULL, 'client/company/list', 'company');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (20, '用户列表', 30, NULL, 'client/users/list', 'users');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (21, '公众号维护', 1, 'layui-icon-login-wechat\r\n', NULL, NULL);
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (22, '菜单栏维护', 21, NULL, 'wx/wxmenu/list', 'wxmenu');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (23, '消息推送', 21, NULL, 'wx/wxmessage/list', 'wxmessage');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (24, '权限菜单', 6, NULL, 'app/webmenu/list', 'webmenu');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (25, '小程序客户维护', 30, NULL, 'client/clientInfo/list', 'clientInfo');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (26, 'GPS维护', 18, NULL, NULL, '');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (27, 'gps客户', 26, NULL, 'client/gps/gpsclient/list', 'gpsclient');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (28, 'gps系统', 26, NULL, 'client/gps/gpssystem/list', 'gpssystem');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (29, '远程连接表', 18, NULL, 'client/remote_mode/list', 'remote_mode');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (30, '客户管理', 18, NULL, NULL, NULL);
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (31, '标签管理', 6, NULL, 'web/tags/list', 'tags');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (32, '个人信息', 1, 'layui-icon-friends', NULL, NULL);
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (33, '我的资料', 32, NULL, 'set/user/info', 'user');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (34, '修改密码', 32, NULL, 'set/user/password', 'user');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (35, '设置', 1, 'layui-icon-set-fill', NULL, NULL);
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (36, '邮件设置', 35, NULL, 'set/system/email', 'system');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (37, '网站设置', 35, NULL, 'set/system/website', 'system');
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (38, '微信账户管理', 18, NULL, 'wx/weixin/list', NULL);
INSERT INTO `permission_copy1` (`id`, `title`, `pid`, `icon`, `jump`, `name`) VALUES (39, '公众号标签', 21, NULL, 'web/tags/list', 'tags');
COMMIT;

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roleid` int DEFAULT NULL,
  `permissionid` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
BEGIN;
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (1, 2, 1);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (3, 2, 14);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (4, 2, 32);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (5, 2, 33);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (6, 2, 34);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (7, 2, 14);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (8, 2, 17);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (45, 1, 1);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (46, 1, 2);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (47, 1, 3);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (48, 1, 6);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (49, 1, 5);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (50, 1, 7);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (51, 1, 9);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (52, 1, 10);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (53, 1, 11);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (54, 1, 24);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (55, 1, 31);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (56, 1, 12);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (57, 1, 13);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (58, 1, 14);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (59, 1, 15);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (60, 1, 16);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (61, 1, 17);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (62, 1, 18);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (63, 1, 26);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (64, 1, 27);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (65, 1, 28);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (66, 1, 29);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (67, 1, 30);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (68, 1, 19);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (69, 1, 20);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (70, 1, 25);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (71, 1, 38);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (72, 1, 21);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (73, 1, 22);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (74, 1, 23);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (75, 1, 32);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (76, 1, 33);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (77, 1, 34);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (78, 1, 35);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (79, 1, 36);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (80, 1, 37);
INSERT INTO `permission_role` (`id`, `roleid`, `permissionid`) VALUES (81, 1, 39);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rolename` varchar(20) NOT NULL,
  `limits` varchar(30) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `check` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`,`rolename`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` (`id`, `rolename`, `limits`, `descr`, `check`) VALUES (1, '超级管理员', '默认角色', '所有权限，不可删除', 'true');
INSERT INTO `role` (`id`, `rolename`, `limits`, `descr`, `check`) VALUES (2, '默认管理员', '默认角色', '默认权限，不可删除', 'true');
COMMIT;

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `roleid` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of role_user
-- ----------------------------
BEGIN;
INSERT INTO `role_user` (`id`, `username`, `roleid`) VALUES (6, 'tothemoon', 1);
INSERT INTO `role_user` (`id`, `username`, `roleid`) VALUES (7, 'li.', 1);
COMMIT;

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tags
-- ----------------------------
BEGIN;
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (6, 'jQuery', NULL, 'layui-bg-cyan');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (7, 'Spring', NULL, 'layui-bg-blue');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (8, '旅行', NULL, 'layui-bg-black');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (9, '泰国', NULL, 'layui-bg-gray');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (18, '爱尔兰', NULL, 'layui-bg-red');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (19, '圣诞集市', NULL, 'layui-bg-cyan');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (20, 'Leetcode', NULL, 'layui-bg-gray');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (21, 'BFS', NULL, 'layui-bg-red');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (22, 'Matrix矩阵', NULL, 'layui-bg-blue');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (23, 'DFS', NULL, 'layui-bg-red');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (24, 'Binary tree', NULL, 'layui-bg-green');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (25, 'queue', NULL, 'layui-bg-cyan');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (26, '随笔', NULL, 'layui-bg-red');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (27, 'MongoDB', NULL, 'layui-bg-red');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (28, 'docker', NULL, 'layui-bg-blue');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (29, 'NoSQL', NULL, 'layui-bg-orange');
INSERT INTO `tags` (`id`, `name`, `remark`, `label`) VALUES (30, 'Sliding windows', NULL, 'layui-bg-cyan');
COMMIT;

-- ----------------------------
-- Table structure for tags_article
-- ----------------------------
DROP TABLE IF EXISTS `tags_article`;
CREATE TABLE `tags_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aid` int NOT NULL,
  `tid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tags_article
-- ----------------------------
BEGIN;
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (166, 29648, 18);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (167, 29648, 19);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (168, 29648, 8);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (169, 23653, 18);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (170, 23653, 8);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (171, 17807, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (172, 17122, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (173, 22185, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (174, 5158, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (175, 28519, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (176, 17232, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (177, 3312, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (178, 3405, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (179, 8888, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (180, 22710, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (181, 20649, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (182, 17783, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (183, 17783, 21);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (184, 17783, 22);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (185, 19275, 23);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (186, 19275, 22);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (187, 19275, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (188, 3369, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (189, 3369, 22);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (190, 3369, 23);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (191, 29417, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (192, 29417, 24);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (193, 29417, 25);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (194, 29417, 21);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (195, 9684, 23);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (196, 9684, 24);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (197, 9684, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (198, 21238, 26);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (199, 6614, 29);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (200, 6614, 28);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (201, 6614, 27);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (202, 18964, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (203, 18964, 21);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (204, 18964, 23);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (205, 18964, 22);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (206, 27344, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (207, 27344, 22);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (208, 5135, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (209, 16095, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (210, 5661, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (211, 14150, 24);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (212, 14150, 23);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (213, 14150, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (214, 23257, 23);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (215, 23257, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (216, 20028, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (217, 20028, 21);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (218, 20028, 25);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (219, 17490, 21);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (220, 17490, 25);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (221, 17490, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (222, 29014, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (223, 3903, 21);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (224, 3903, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (225, 17907, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (226, 17907, 26);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (227, 5160, 20);
INSERT INTO `tags_article` (`id`, `aid`, `tid`) VALUES (228, 27804, 20);
COMMIT;

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `label_font` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of types
-- ----------------------------
BEGIN;
INSERT INTO `types` (`id`, `name`, `label`, `memo`, `label_font`, `remark`) VALUES (1, '摄影', 'background-color:#a872b7', 'photograthy', 'color:#a872b7', NULL);
INSERT INTO `types` (`id`, `name`, `label`, `memo`, `label_font`, `remark`) VALUES (2, '生活', 'background-color:#e6c728', 'lifestyle', 'color:#e6c728', NULL);
INSERT INTO `types` (`id`, `name`, `label`, `memo`, `label_font`, `remark`) VALUES (3, '视频', 'background-color:#4aaec2', 'video', 'color:#4aaec2', NULL);
INSERT INTO `types` (`id`, `name`, `label`, `memo`, `label_font`, `remark`) VALUES (4, '旅行', 'background-color:#15cdb4db', 'travel', 'color:#d25f7c', NULL);
INSERT INTO `types` (`id`, `name`, `label`, `memo`, `label_font`, `remark`) VALUES (5, '代码', 'background-color:#d25f7c', 'code', 'color:#d25f7c', NULL);
INSERT INTO `types` (`id`, `name`, `label`, `memo`, `label_font`, `remark`) VALUES (6, '冒险', 'background-color:#cd8c15', 'ad', 'd25f7c', NULL);
INSERT INTO `types` (`id`, `name`, `label`, `memo`, `label_font`, `remark`) VALUES (7, '随笔', 'background-color:#025cff', 'jottings', 'color:#e93343', NULL);
COMMIT;

-- ----------------------------
-- Table structure for userInfo
-- ----------------------------
DROP TABLE IF EXISTS `userInfo`;
CREATE TABLE `userInfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `wxID` varchar(300) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `head_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of userInfo
-- ----------------------------
BEGIN;
INSERT INTO `userInfo` (`id`, `username`, `password`, `position`, `openid`, `gender`, `age`, `email`, `loginTime`, `createTime`, `wxID`, `remark`, `head_url`) VALUES (1, 'tothemoon', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/img/index/headp.jpg');
COMMIT;

-- ----------------------------
-- View structure for view_article_tags
-- ----------------------------
DROP VIEW IF EXISTS `view_article_tags`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_article_tags` AS select `article`.`title` AS `title`,`article`.`id` AS `articleId`,`article`.`type` AS `type`,`article`.`category` AS `category`,`tags`.`name` AS `name`,`tags`.`label` AS `label`,`tags_article`.`aid` AS `aid`,`tags_article`.`tid` AS `tid`,`tags_article`.`id` AS `id` from ((`article` join `tags`) join `tags_article`) where ((`article`.`id` = `tags_article`.`aid`) and (`tags`.`id` = `tags_article`.`tid`));

-- ----------------------------
-- View structure for view_article_types
-- ----------------------------
DROP VIEW IF EXISTS `view_article_types`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_article_types` AS select `article`.`id` AS `id`,`article`.`title` AS `title`,`article`.`detail` AS `detail`,`article`.`author` AS `author`,`article`.`type` AS `type`,`article`.`taglist` AS `taglist`,`article`.`create_time` AS `create_time`,`article`.`publish_time` AS `publish_time`,`article`.`content` AS `content`,`article`.`cover_url` AS `cover_url`,`article`.`status` AS `status`,`types`.`name` AS `t_name`,`types`.`label` AS `t_label`,`types`.`memo` AS `memo`,`types`.`label_font` AS `label_font`,`article`.`category` AS `category`,`yangadmin`.`sys_user`.`name` AS `name`,`yangadmin`.`sys_user`.`nick_name` AS `nick_name`,`yangadmin`.`sys_user`.`avatar` AS `avatar` from ((`article` join `types`) join `yangadmin`.`sys_user`) where ((`article`.`type` = `types`.`name`) and (`article`.`author` = `yangadmin`.`sys_user`.`nick_name`));

SET FOREIGN_KEY_CHECKS = 1;
