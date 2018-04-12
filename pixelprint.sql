-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.17-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table pixelprint.wp0e_pxlog
DROP TABLE IF EXISTS `wp0e_pxlog`;
CREATE TABLE IF NOT EXISTS `wp0e_pxlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(50) DEFAULT '0',
  `update` datetime DEFAULT CURRENT_TIMESTAMP,
  `operator` char(50) DEFAULT '0',
  `ket` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;

-- Dumping data for table pixelprint.wp0e_pxlog: ~234 rows (approximately)
/*!40000 ALTER TABLE `wp0e_pxlog` DISABLE KEYS */;
REPLACE INTO `wp0e_pxlog` (`id`, `orderid`, `update`, `operator`, `ket`) VALUES
	(1, '10', '2018-04-09 14:23:23', '7', 'New StatusOrder : Outdoor'),
	(2, '10', '2018-04-09 14:23:52', '7', 'New StatusOrder : Outdoor'),
	(3, '10', '2018-04-09 14:24:01', '7', 'New StatusOrder : 012313'),
	(4, '10', '2018-04-09 15:32:17', '7', 'New StatusOrder : A3'),
	(5, '9', '2018-04-09 15:34:39', '7', 'New StatusOrder : Outdoor'),
	(6, '10', '2018-04-09 15:36:19', '7', 'New StatusOrder : Offset'),
	(7, '10', '2018-04-09 15:37:15', '7', 'New StatusOrder : Offset'),
	(8, '9', '2018-04-09 15:37:23', '7', 'New StatusOrder : Offset'),
	(9, '8', '2018-04-09 15:37:26', '7', 'New StatusOrder : Offset'),
	(10, '10', '2018-04-09 15:41:12', '7', 'New StatusOrder : Sudah Diambil'),
	(11, '10', '2018-04-09 15:44:06', '8', 'New StatusOrder : Lainnya'),
	(12, '10', '2018-04-09 15:44:57', '8', 'New StatusOrder : Offset'),
	(13, '10', '2018-04-09 15:45:06', '8', 'New StatusOrder : Indoor'),
	(14, '9', '2018-04-09 15:45:47', '8', 'New StatusOrder : Lainnya'),
	(15, '9', '2018-04-10 01:41:47', '7', 'New StatusOrder : 123314'),
	(16, '15', '2018-04-10 06:14:19', '13', 'New StatusOrder : 04-00288'),
	(17, '15', '2018-04-10 06:14:26', '13', 'New StatusOrder : Design'),
	(18, '15', '2018-04-10 06:14:32', '13', 'New StatusOrder : Design'),
	(19, '15', '2018-04-10 06:14:59', '13', 'New StatusOrder : Design'),
	(20, '15', '2018-04-10 06:16:20', '12', 'New StatusOrder : Lainnya'),
	(21, '14', '2018-04-10 06:17:33', '12', 'New StatusOrder : Indoor'),
	(22, '16', '2018-04-10 06:51:51', '13', 'New StatusOrder : 04-00289'),
	(23, '16', '2018-04-10 06:58:00', '12', 'New StatusOrder : A3'),
	(24, '17', '2018-04-10 07:04:49', '15', 'New StatusOrder : 04-00290'),
	(25, '17', '2018-04-10 07:04:51', '15', 'New StatusOrder : Design'),
	(26, '17', '2018-04-10 07:05:02', '15', 'New StatusOrder : A3'),
	(27, '19', '2018-04-10 07:11:34', '15', 'New StatusOrder : 04-00291'),
	(28, '19', '2018-04-10 07:11:40', '15', 'New StatusOrder : A3'),
	(29, '18', '2018-04-10 07:13:42', '15', 'New StatusOrder : 04-00292'),
	(30, '21', '2018-04-10 07:13:43', '16', 'New StatusOrder : A3'),
	(31, '20', '2018-04-10 07:13:45', '16', 'New StatusOrder : A3'),
	(32, '19', '2018-04-10 07:13:45', '15', 'New StatusOrder : Indoor'),
	(33, '19', '2018-04-10 07:13:51', '15', 'New StatusOrder : A3'),
	(34, '18', '2018-04-10 07:13:54', '15', 'New StatusOrder : Indoor'),
	(35, '21', '2018-04-10 07:16:36', '15', 'New StatusOrder : 04-00293'),
	(36, '21', '2018-04-10 07:16:38', '15', 'New StatusOrder : A3'),
	(37, '20', '2018-04-10 07:16:48', '15', 'New StatusOrder : 04-00293'),
	(38, '20', '2018-04-10 07:16:50', '15', 'New StatusOrder : A3'),
	(39, '21', '2018-04-10 07:16:55', '15', 'New StatusOrder : A3'),
	(40, '21', '2018-04-10 07:19:59', '15', 'New StatusOrder : A3'),
	(41, '22', '2018-04-10 07:24:18', '15', 'New StatusOrder : 04-00294'),
	(42, '22', '2018-04-10 07:24:20', '15', 'New StatusOrder : A3'),
	(43, '21', '2018-04-10 07:24:25', '15', 'New StatusOrder : A3'),
	(44, '18', '2018-04-10 07:24:35', '10', 'New StatusOrder : Indoor'),
	(45, '22', '2018-04-10 07:25:59', '15', 'New StatusOrder : A3'),
	(46, '14', '2018-04-10 07:31:06', '17', 'New StatusOrder : Sudah Diambil'),
	(47, '23', '2018-04-10 07:38:00', '15', 'New StatusOrder : 04-00295'),
	(48, '23', '2018-04-10 07:38:02', '15', 'New StatusOrder : Design'),
	(49, '23', '2018-04-10 07:38:07', '15', 'New StatusOrder : Outdoor'),
	(50, '10', '2018-04-10 07:39:38', '20', 'New StatusOrder : Ready'),
	(51, '15', '2018-04-10 07:43:21', '17', 'New StatusOrder : Ready'),
	(52, '24', '2018-04-10 07:45:42', '15', 'New StatusOrder : 04-00296'),
	(53, '24', '2018-04-10 07:45:47', '15', 'New StatusOrder : Outdoor'),
	(54, '25', '2018-04-10 07:49:57', '10', 'New StatusOrder : A3'),
	(55, '25', '2018-04-10 07:50:31', '15', 'New StatusOrder : 04-00297'),
	(56, '25', '2018-04-10 07:50:34', '15', 'New StatusOrder : A3'),
	(57, '18', '2018-04-10 07:55:01', '17', 'New StatusOrder : Outdoor'),
	(58, '7', '2018-04-10 07:55:02', '17', 'New StatusOrder : Outdoor'),
	(59, '26', '2018-04-10 08:01:20', '13', 'New StatusOrder : 04-00298'),
	(60, '26', '2018-04-10 08:01:23', '13', 'New StatusOrder : Design'),
	(61, '26', '2018-04-10 08:01:24', '13', 'New StatusOrder : Design'),
	(62, '26', '2018-04-10 08:01:30', '13', 'New StatusOrder : Sudah Diambil'),
	(63, '28', '2018-04-10 08:03:28', '13', 'New StatusOrder : 004-00299'),
	(64, '27', '2018-04-10 08:03:44', '13', 'New StatusOrder : 04-00299'),
	(65, '28', '2018-04-10 08:03:52', '13', 'New StatusOrder : A3'),
	(66, '27', '2018-04-10 08:03:54', '13', 'New StatusOrder : A3'),
	(67, '32', '2018-04-10 08:12:23', '16', 'New StatusOrder : A3'),
	(68, '31', '2018-04-10 08:13:51', '13', 'New StatusOrder : 04-00301'),
	(69, '31', '2018-04-10 08:13:56', '13', 'New StatusOrder : A3'),
	(70, '30', '2018-04-10 08:14:04', '13', 'New StatusOrder : 04-00300'),
	(71, '30', '2018-04-10 08:14:10', '13', 'New StatusOrder : Outdoor'),
	(72, '29', '2018-04-10 08:14:20', '13', 'New StatusOrder : 04-00300'),
	(73, '29', '2018-04-10 08:14:25', '13', 'New StatusOrder : Outdoor'),
	(74, '32', '2018-04-10 08:16:50', '13', 'New StatusOrder : 04-00302'),
	(75, '32', '2018-04-10 08:16:55', '13', 'New StatusOrder : A3'),
	(76, '33', '2018-04-10 08:24:59', '16', 'New StatusOrder : A3'),
	(77, '34', '2018-04-10 08:58:57', '15', 'New StatusOrder : 04-00304'),
	(78, '34', '2018-04-10 08:59:01', '15', 'New StatusOrder : Outdoor'),
	(79, '33', '2018-04-10 08:59:14', '15', 'New StatusOrder : 04-00303'),
	(80, '33', '2018-04-10 08:59:17', '15', 'New StatusOrder : A3'),
	(81, '33', '2018-04-10 08:59:21', '15', 'New StatusOrder : A3'),
	(82, '24', '2018-04-10 09:00:56', '19', 'New StatusOrder : Lainnya'),
	(83, '35', '2018-04-10 09:14:41', '13', 'New StatusOrder : 04-00305'),
	(84, '36', '2018-04-10 09:14:55', '13', 'New StatusOrder : 04-00305'),
	(85, '35', '2018-04-10 09:15:08', '13', 'New StatusOrder : A3'),
	(86, '15', '2018-04-10 09:16:12', '13', 'New StatusOrder : Ready'),
	(87, '17', '2018-04-10 09:17:14', '13', 'New StatusOrder : Sudah Diambil'),
	(88, '15', '2018-04-10 09:17:24', '13', 'New StatusOrder : Lainnya'),
	(89, '16', '2018-04-10 09:17:36', '13', 'New StatusOrder : Sudah Diambil'),
	(90, '21', '2018-04-10 09:18:14', '13', 'New StatusOrder : Sudah Diambil'),
	(91, '20', '2018-04-10 09:18:15', '13', 'New StatusOrder : Sudah Diambil'),
	(92, '19', '2018-04-10 09:18:22', '13', 'New StatusOrder : Sudah Diambil'),
	(93, '37', '2018-04-10 09:24:06', '10', 'New StatusOrder : A3'),
	(94, '38', '2018-04-10 09:25:39', '13', 'New StatusOrder : 04-00306'),
	(95, '38', '2018-04-10 09:25:54', '13', 'New StatusOrder : Lainnya'),
	(96, '39', '2018-04-10 09:30:46', '13', 'New StatusOrder : 04-00307'),
	(97, '37', '2018-04-10 09:31:25', '13', 'New StatusOrder : 04-00308'),
	(98, '39', '2018-04-10 09:32:17', '13', 'New StatusOrder : A3'),
	(99, '39', '2018-04-10 09:32:19', '13', 'New StatusOrder : A3'),
	(100, '40', '2018-04-10 09:35:29', '13', 'New StatusOrder : 04-00309'),
	(101, '41', '2018-04-10 09:35:38', '13', 'New StatusOrder : 04-00309'),
	(102, '42', '2018-04-10 09:37:20', '13', 'New StatusOrder : 000310'),
	(103, '43', '2018-04-10 09:37:38', '13', 'New StatusOrder : 04-00311'),
	(104, '43', '2018-04-10 09:43:12', '13', 'New StatusOrder : A3'),
	(105, '42', '2018-04-10 09:43:18', '13', 'New StatusOrder : Design'),
	(106, '41', '2018-04-10 09:43:35', '13', 'New StatusOrder : A3'),
	(107, '40', '2018-04-10 09:43:36', '13', 'New StatusOrder : A3'),
	(108, '39', '2018-04-10 09:43:37', '13', 'New StatusOrder : A3'),
	(109, '43', '2018-04-10 09:43:43', '13', 'New StatusOrder : A3'),
	(110, '42', '2018-04-10 09:43:44', '13', 'New StatusOrder : Design'),
	(111, '40', '2018-04-10 09:43:46', '13', 'New StatusOrder : A3'),
	(112, '44', '2018-04-10 09:50:45', '16', 'New StatusOrder : Indoor'),
	(113, '45', '2018-04-10 10:29:49', '16', 'New StatusOrder : A3'),
	(114, '46', '2018-04-10 10:29:51', '16', 'New StatusOrder : A3'),
	(115, '46', '2018-04-10 10:33:16', '13', 'New StatusOrder : 04-00314'),
	(116, '45', '2018-04-10 10:33:25', '13', 'New StatusOrder : 04-00314'),
	(117, '44', '2018-04-10 10:33:44', '13', 'New StatusOrder : 04-00312'),
	(118, '46', '2018-04-10 10:34:02', '13', 'New StatusOrder : A3'),
	(119, '45', '2018-04-10 10:34:04', '13', 'New StatusOrder : A3'),
	(120, '54', '2018-04-10 11:36:57', '16', 'New StatusOrder : Outdoor'),
	(121, '53', '2018-04-10 11:36:59', '16', 'New StatusOrder : Outdoor'),
	(122, '52', '2018-04-10 11:37:01', '16', 'New StatusOrder : Outdoor'),
	(123, '51', '2018-04-10 11:37:04', '16', 'New StatusOrder : Outdoor'),
	(124, '50', '2018-04-10 11:37:06', '16', 'New StatusOrder : Outdoor'),
	(125, '49', '2018-04-10 11:37:18', '16', 'New StatusOrder : Outdoor'),
	(126, '54', '2018-04-10 11:49:46', '13', 'New StatusOrder : 04-00313'),
	(127, '53', '2018-04-10 11:50:04', '13', 'New StatusOrder : 04-00313'),
	(128, '52', '2018-04-10 11:50:12', '13', 'New StatusOrder : 04-00313'),
	(129, '51', '2018-04-10 11:50:20', '13', 'New StatusOrder : 04-00313'),
	(130, '50', '2018-04-10 11:50:25', '13', 'New StatusOrder : 04-00313'),
	(131, '55', '2018-04-10 11:52:18', '13', 'New StatusOrder : 04-00315'),
	(132, '55', '2018-04-10 11:52:23', '13', 'New StatusOrder : A3'),
	(133, '48', '2018-04-10 11:55:55', '13', 'New StatusOrder : 04-00316'),
	(134, '47', '2018-04-10 11:56:06', '13', 'New StatusOrder : 04-00316'),
	(135, '49', '2018-04-10 11:56:15', '13', 'New StatusOrder : 04-00317'),
	(136, '49', '2018-04-10 12:39:21', '20', 'New StatusOrder : Lainnya'),
	(137, '49', '2018-04-10 12:39:22', '20', 'New StatusOrder : Lainnya'),
	(138, '34', '2018-04-10 12:39:41', '20', 'New StatusOrder : Lainnya'),
	(139, '30', '2018-04-10 12:39:48', '20', 'New StatusOrder : Lainnya'),
	(140, '29', '2018-04-10 12:39:53', '20', 'New StatusOrder : Lainnya'),
	(141, '23', '2018-04-10 12:40:15', '20', 'New StatusOrder : Ready'),
	(142, '54', '2018-04-10 13:18:11', '20', 'New StatusOrder : Lainnya'),
	(143, '53', '2018-04-10 13:18:16', '20', 'New StatusOrder : Lainnya'),
	(144, '52', '2018-04-10 13:18:19', '20', 'New StatusOrder : Lainnya'),
	(145, '51', '2018-04-10 13:18:23', '20', 'New StatusOrder : Lainnya'),
	(146, '50', '2018-04-10 13:18:28', '20', 'New StatusOrder : Lainnya'),
	(147, '50', '2018-04-10 13:18:29', '20', 'New StatusOrder : Lainnya'),
	(148, '18', '2018-04-10 13:18:52', '20', 'New StatusOrder : Indoor'),
	(149, '62', '2018-04-11 02:01:31', '19', 'New StatusOrder : Outdoor'),
	(150, '61', '2018-04-11 02:01:33', '19', 'New StatusOrder : Outdoor'),
	(151, '62', '2018-04-11 02:05:59', '15', 'New StatusOrder : 04-322'),
	(152, '61', '2018-04-11 02:06:12', '15', 'New StatusOrder : 04-00322'),
	(153, '63', '2018-04-11 02:08:19', '15', 'New StatusOrder : 04-00321'),
	(154, '60', '2018-04-11 02:08:32', '15', 'New StatusOrder : 04-00320'),
	(155, '59', '2018-04-11 02:08:44', '15', 'New StatusOrder : 04-00320'),
	(156, '58', '2018-04-11 02:09:00', '15', 'New StatusOrder : 04-00319'),
	(157, '57', '2018-04-11 02:09:09', '15', 'New StatusOrder : 04-00319'),
	(158, '56', '2018-04-11 02:09:19', '15', 'New StatusOrder : 04-00318'),
	(159, '57', '2018-04-11 02:09:27', '15', 'New StatusOrder : A3'),
	(160, '58', '2018-04-11 02:09:34', '15', 'New StatusOrder : A3'),
	(161, '59', '2018-04-11 02:09:42', '15', 'New StatusOrder : A3'),
	(162, '60', '2018-04-11 02:09:47', '15', 'New StatusOrder : Indoor'),
	(163, '63', '2018-04-11 02:09:53', '15', 'New StatusOrder : A3'),
	(164, '62', '2018-04-11 02:09:59', '15', 'New StatusOrder : Outdoor'),
	(165, '62', '2018-04-11 02:30:31', '19', 'New StatusOrder : Ready'),
	(166, '61', '2018-04-11 02:30:32', '19', 'New StatusOrder : Ready'),
	(167, '7', '2018-04-11 02:32:46', '19', 'New StatusOrder : Ready'),
	(168, '64', '2018-04-11 06:04:13', '13', 'New StatusOrder : 04-00343'),
	(169, '64', '2018-04-11 06:04:17', '13', 'New StatusOrder : A3'),
	(170, '65', '2018-04-11 06:16:39', '13', 'New StatusOrder : 04-00344'),
	(171, '66', '2018-04-11 06:17:19', '13', 'New StatusOrder : 04-00345'),
	(172, '67', '2018-04-11 06:17:40', '13', 'New StatusOrder : 04-00345'),
	(173, '68', '2018-04-11 07:15:53', '13', 'New StatusOrder : 04-00346'),
	(174, '68', '2018-04-11 07:16:01', '13', 'New StatusOrder : A3'),
	(175, '69', '2018-04-11 07:16:21', '13', 'New StatusOrder : 04-00347'),
	(176, '70', '2018-04-11 07:16:45', '13', 'New StatusOrder : 04-00348'),
	(177, '71', '2018-04-11 07:16:59', '13', 'New StatusOrder : 04-00348'),
	(178, '72', '2018-04-11 08:07:57', '13', 'New StatusOrder : 04-00349'),
	(179, '75', '2018-04-11 08:19:56', '13', 'New StatusOrder : 04-00353'),
	(180, '74', '2018-04-11 08:20:02', '13', 'New StatusOrder : 04-00353'),
	(181, '75', '2018-04-11 08:20:15', '13', 'New StatusOrder : A3'),
	(182, '74', '2018-04-11 08:20:16', '13', 'New StatusOrder : A3'),
	(183, '76', '2018-04-11 08:21:14', '16', 'New StatusOrder : Outdoor'),
	(184, '65', '2018-04-11 08:21:40', '16', 'New StatusOrder : A3'),
	(185, '76', '2018-04-11 08:24:23', '13', 'New StatusOrder : 04-00354'),
	(186, '78', '2018-04-11 08:43:28', '16', 'New StatusOrder : Indoor'),
	(187, '77', '2018-04-11 08:43:33', '16', 'New StatusOrder : Indoor'),
	(188, '76', '2018-04-11 08:48:26', '19', 'New StatusOrder : Lainnya'),
	(189, '71', '2018-04-11 08:48:59', '16', 'New StatusOrder : Outdoor'),
	(190, '79', '2018-04-11 09:41:03', '13', 'New StatusOrder : 04-00356'),
	(191, '80', '2018-04-11 09:41:13', '13', 'New StatusOrder : 04-00356'),
	(192, '81', '2018-04-11 09:41:36', '13', 'New StatusOrder : 04-00356'),
	(193, '82', '2018-04-11 09:58:41', '16', 'New StatusOrder : Outdoor'),
	(194, '70', '2018-04-11 10:04:16', '16', 'New StatusOrder : Indoor'),
	(195, '73', '2018-04-11 10:18:27', '16', 'New StatusOrder : A3'),
	(196, '82', '2018-04-11 10:32:18', '13', 'New StatusOrder : 04-00358'),
	(197, '83', '2018-04-11 10:32:32', '13', 'New StatusOrder : 04-00360'),
	(198, '85', '2018-04-11 10:36:41', '16', 'New StatusOrder : A3'),
	(199, '85', '2018-04-11 10:36:43', '13', 'New StatusOrder : 04-00361'),
	(200, '84', '2018-04-11 10:36:46', '16', 'New StatusOrder : A3'),
	(201, '83', '2018-04-11 10:36:49', '16', 'New StatusOrder : A3'),
	(202, '84', '2018-04-11 10:36:50', '13', 'New StatusOrder : 04-00361'),
	(203, '86', '2018-04-11 11:31:57', '13', 'New StatusOrder : 04-00362'),
	(204, '86', '2018-04-11 11:32:02', '13', 'New StatusOrder : A3'),
	(205, '73', '2018-04-11 11:32:21', '13', 'New StatusOrder : 04-00359'),
	(206, '81', '2018-04-11 11:40:16', '12', 'New StatusOrder : A3'),
	(207, '80', '2018-04-11 11:40:19', '12', 'New StatusOrder : A3'),
	(208, '79', '2018-04-11 11:40:21', '12', 'New StatusOrder : A3'),
	(209, '72', '2018-04-11 11:40:27', '12', 'New StatusOrder : A3'),
	(210, '87', '2018-04-11 11:40:31', '16', 'New StatusOrder : A3'),
	(211, '69', '2018-04-11 11:40:35', '12', 'New StatusOrder : Indoor'),
	(212, '67', '2018-04-11 11:40:41', '12', 'New StatusOrder : Outdoor'),
	(213, '56', '2018-04-11 11:40:48', '12', 'New StatusOrder : A3'),
	(214, '48', '2018-04-11 11:40:52', '12', 'New StatusOrder : Outdoor'),
	(215, '48', '2018-04-11 11:40:57', '12', 'New StatusOrder : Outdoor'),
	(216, '47', '2018-04-11 11:40:58', '12', 'New StatusOrder : Outdoor'),
	(217, '36', '2018-04-11 11:41:05', '12', 'New StatusOrder : Lainnya'),
	(218, '88', '2018-04-11 12:00:00', '16', 'New StatusOrder : A3'),
	(219, '89', '2018-04-11 12:01:24', '12', 'New StatusOrder : A3'),
	(220, '90', '2018-04-11 13:11:07', '16', 'New StatusOrder : A3'),
	(221, '87', '2018-04-11 13:43:35', '13', 'New StatusOrder : 04-00365'),
	(222, '88', '2018-04-11 13:43:51', '13', 'New StatusOrder : 04-00367'),
	(223, '89', '2018-04-11 13:44:35', '13', 'New StatusOrder : 04-00366'),
	(224, '90', '2018-04-11 13:44:50', '13', 'New StatusOrder : 04-00368'),
	(225, '91', '2018-04-11 13:46:37', '13', 'New StatusOrder : 04-00369'),
	(226, '91', '2018-04-11 13:51:12', '12', 'New StatusOrder : A3'),
	(227, '92', '2018-04-11 13:51:12', '12', 'New StatusOrder : A3'),
	(228, '93', '2018-04-11 13:51:12', '12', 'New StatusOrder : Outdoor'),
	(229, '92', '2018-04-12 05:49:57', '6', 'New StatusOrder : 04-00370'),
	(230, '92', '2018-04-12 05:52:01', '6', 'New StatusOrder : '),
	(231, NULL, '2018-04-12 05:56:56', '1', 'New StatusOrder : Lainnya'),
	(232, NULL, '2018-04-12 05:58:59', '1', 'New StatusOrder : Lainnya'),
	(233, NULL, '2018-04-12 06:00:38', '1', 'New StatusOrder : Lainnya'),
	(234, NULL, '2018-04-12 06:02:47', '1', 'New StatusOrder : Lainnya');
/*!40000 ALTER TABLE `wp0e_pxlog` ENABLE KEYS */;

-- Dumping structure for table pixelprint.wp0e_pxmycustomer
DROP TABLE IF EXISTS `wp0e_pxmycustomer`;
CREATE TABLE IF NOT EXISTS `wp0e_pxmycustomer` (
  `idcust` int(11) NOT NULL AUTO_INCREMENT,
  `namacustomer` varchar(120) DEFAULT '0',
  `alamat` tinytext,
  `kota` varchar(50) DEFAULT NULL,
  `hp` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcust`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- Dumping data for table pixelprint.wp0e_pxmycustomer: ~100 rows (approximately)
/*!40000 ALTER TABLE `wp0e_pxmycustomer` DISABLE KEYS */;
REPLACE INTO `wp0e_pxmycustomer` (`idcust`, `namacustomer`, `alamat`, `kota`, `hp`, `email`) VALUES
	(4, 'Bpk Agus', 'Surabaya', NULL, '8222', 'bpkagus@gmail.com'),
	(5, 'Eric tjung', 'Gbp c1/24aj', NULL, '8175416888', 'eric@yahoo.com'),
	(6, 'asda', 'asdada', NULL, '1231313', 'asda@yahoo.com'),
	(7, 'adadsad', 'asdadsa', NULL, '312131', 'dsaads@yahoo.com'),
	(8, 'novi', 'adhahsdl', NULL, '912379187', 'asjkdh@yahoo.com'),
	(9, '1212', 'qweqew', NULL, '1321313', 'da@yahoo.com'),
	(10, 'cecilia', 'manyar', NULL, '85555', 'cecilia@gmail.com'),
	(11, 'cecilia', 'manyar', NULL, '85555', 'cecilia@gmail.com'),
	(12, 'tedi', 'abc', NULL, '85773894147', 'abc@gmail.com'),
	(13, 'Hendrik Wibisono', 'penjaringan timur 5 pc5', NULL, '87821222228', 'MADE@komp1'),
	(14, 'Afif', 'jl.kelantan n0.12 perak timur sby', NULL, '81295909566', 'muhammad_4fif@yahoo.com'),
	(15, 'handoko', 'ngagel madya utara 3 no 18', NULL, '85100896051', 'devi@com3'),
	(16, 'ardiansyah', 'gresik kota baru', NULL, '85755683588', 'gkada@gmail.com'),
	(17, 'azwar', 'gresik', NULL, '2345543', 'farhan@komp5'),
	(18, 'azwar', 'gresik', NULL, '2345543', 'farhan@komp5'),
	(19, 'Nurcholis', 'margomulyo', NULL, '89677003534', 'rahasia@gmail.com'),
	(20, 'Pentagon', 'kosong', NULL, '0', 'gktau@gmail.com'),
	(21, 'BAMBANG S WIDODO', 'ABC', NULL, '123', 'MADE@KOMP1'),
	(22, 'EIGER MERR', 'MERR', NULL, '123', 'DEVI@COM3'),
	(23, 'UNTUNG', 'abc', NULL, '82232373464', 'devi@com3'),
	(24, 'ALFAT SAIFUDDIN', 'ABC', NULL, '123', 'MADE@KOMP2'),
	(25, 'ALFAT SAIFUDDIN', 'ABC', NULL, '123', 'MADE@KOMP2'),
	(26, 'HORE', 'ABC', NULL, '123', 'MADE@KOMP2'),
	(27, 'HORE', 'ABC', NULL, '123', 'MADE@KOMP2'),
	(28, 'UNTUNG', 'ABC', NULL, '123', 'MADE@KOMP2'),
	(29, 'Belanja Rak', NULL, NULL, '81232654', 'fff@hh.com'),
	(30, 'johanes', NULL, NULL, '8122235', 'jj@gg.com'),
	(31, 'NUNUK', 'ABC', NULL, '123', 'MADE@KOMP2'),
	(32, 'NUNUK', 'ABC', NULL, '123', 'MADE@KOMP2'),
	(33, 'NUNUK', 'ABC', NULL, '123', 'MADE@KOMP2'),
	(34, 'NUNUK', 'ABC', NULL, '123', 'MADE@KOMP2'),
	(35, 'NUNUK', 'ABC', NULL, '123', 'MADE@KOMP2'),
	(36, 'RIANTO', 'ABC', NULL, '123', 'MADE@KOMP1'),
	(37, 'RIANTO', 'ABC', NULL, '123', 'MADE@KOMP1'),
	(38, 'devi pixel', 'pixelprint', NULL, '81235616544', 'devi@comp3'),
	(39, 'Heru Laser Cut', NULL, NULL, '123456789', 'abcdefg@gmail.com'),
	(40, 'SIGIT', NULL, NULL, '123', 'MADE@KOMP2'),
	(41, 'Fandi', NULL, NULL, '8152546321', 'farhan@komp5'),
	(42, 'Fandi', NULL, NULL, '8152546321', 'farhan@komp5'),
	(43, 'ILMI', NULL, NULL, '123', 'MADE@KOMP2'),
	(44, 'FEKA', 'kupang segunting 5 no 2c', NULL, '81329523211', 'devi@com3'),
	(45, 'Aira', NULL, NULL, '821541641', 'farhan@komp5'),
	(46, 'Suherman', NULL, NULL, '3158466621', 'farhan@komp5'),
	(47, 'Suherman', NULL, NULL, '3158466621', 'farhan@komp5'),
	(48, 'Suherman', NULL, NULL, '3158466621', 'farhan@komp5'),
	(49, 'Suherman', NULL, NULL, '3158466621', 'farhan@komp5'),
	(50, 'Suherman', NULL, NULL, '3158466621', 'farhan@komp5'),
	(51, 'Suherman', NULL, NULL, '3158466621', 'farhan@komp5'),
	(52, 'Suherman', NULL, NULL, '3158466621', 'farhan@komp5'),
	(53, 'INDOLION', NULL, NULL, '123', 'ANDIKA@KOMP4'),
	(54, 'INDOLION', NULL, NULL, '123', 'ANDIKA@KOMP4'),
	(55, 'INDOLION', NULL, NULL, '123', 'ANDIKA@KOMP4'),
	(56, 'Eiger Merr', NULL, NULL, '315555555', 'farhan@komp5'),
	(57, '86', NULL, NULL, '31555555', 'farhan@komp5'),
	(58, '86', NULL, NULL, '31555555', 'farhan@komp5'),
	(59, '86', NULL, NULL, '31555555', 'farhan@komp5'),
	(60, '86', NULL, NULL, '31555555', 'farhan@komp5'),
	(61, '86', NULL, NULL, '31555555', 'farhan@komp5'),
	(62, '86', NULL, NULL, '31555555', 'farhan@komp5'),
	(63, 'FERI DWI ANDIKA', NULL, NULL, '123', 'MADE@KOMP2'),
	(64, 'Syaiful Anwar', NULL, NULL, '3122222', 'farhan@komp5'),
	(65, 'Gondrong (pixel)', NULL, NULL, '3100555555', 'Farhan@komp5'),
	(66, 'Gondrong (pixel)', NULL, NULL, '3100555555', 'Farhan@komp5'),
	(67, 'SUNSTAR MOTOR SIDOARJO', NULL, NULL, '123', 'MADE@KOMP2'),
	(68, 'SUNSTAR MOTOR SIDOARJO', NULL, NULL, '123', 'MADE@KOMP2'),
	(69, 'PENTAGON', NULL, NULL, '123', 'MADE@KOMP2'),
	(70, 'PENTAGON', NULL, NULL, '123', 'MADE@KOMP2'),
	(71, 'Sam', NULL, NULL, '3111', 'farhan@komp4'),
	(72, 'Mike', NULL, NULL, '81216874664', 'farhan@komp5'),
	(73, 'Ulva Pixel (Mila)', NULL, NULL, '3155555', 'farhan@komp5'),
	(74, 'DODI', NULL, NULL, '123', 'MADE@KOMP2'),
	(75, 'DODI', NULL, NULL, '123', 'MADE@KOMP2'),
	(76, 'DEFANY', NULL, NULL, '123', 'MADE@KOMP2'),
	(77, 'BRENDA', NULL, NULL, '123', 'MADE@KOMP2'),
	(78, 'Irene', NULL, NULL, '8121685838', 'farhan@komp5'),
	(79, 'Irene', NULL, NULL, '8121685838', 'farhan@komp5'),
	(80, 'PT KARYA NIAGA ABADI', NULL, NULL, '123', 'MADE@KOMP2'),
	(81, 'Melisa Kohar', NULL, NULL, '5122222222', 'Farhan@komp5'),
	(82, 'Indra', 'Ngagel jaya utara no 129', NULL, '81337378059', 'indrarahardyan83@gmail.com'),
	(83, 'Indra', 'Ngagel jaya utara no 129', NULL, '81337378059', 'indrarahardyan83@gmail.com'),
	(84, 'Lee', NULL, NULL, '81357546758', 'farhan@komp5'),
	(85, 'Vuvahealth', NULL, NULL, '31111111111', 'farhan@komp5'),
	(86, 'Vivahealth', NULL, NULL, '31111111111', 'farhan@komp5'),
	(87, 'ESTER', NULL, NULL, '123', 'MADE@KOMP2'),
	(88, 'ESTER', NULL, NULL, '123', 'MADE@KOMP2'),
	(89, 'ESTER', NULL, NULL, '123', 'MADE@KOMP2'),
	(90, 'Mita', NULL, NULL, '82257643245', 'farhan@komp5'),
	(91, 'Rizky', NULL, NULL, '85731845540', 'farhan@komp5'),
	(92, 'Choirul', NULL, NULL, '85730285858', 'farhan@komp5'),
	(93, 'Choirul', NULL, NULL, '85730285858', 'farhan@komp5'),
	(94, 'LINA', NULL, NULL, '123', 'MADE@KOMP2'),
	(95, 'Donny', NULL, NULL, '355555', 'farhan@komp5'),
	(96, 'Sulis Oase', NULL, NULL, '3155555555', 'farhan@komp5'),
	(97, 'FENI', NULL, NULL, '123', 'MADE@KOM2'),
	(98, 'Wendy', NULL, NULL, '31555555555', 'farhan@komp5'),
	(99, 'AMANDA', NULL, NULL, '123', 'MADE@KOMP2'),
	(100, 'MELVINA', NULL, NULL, '1234', 'MADE@KOMP2'),
	(101, 'MELVINA', NULL, NULL, '1234', 'MADE@KOMP2'),
	(102, 'Agus', 'Surabaya', NULL, '8222', 'ajshajhsaj@susanto.com'),
	(103, 'ashajs', 'SUrabaya', NULL, '8989', 'asjaksjka@gmail.com');
/*!40000 ALTER TABLE `wp0e_pxmycustomer` ENABLE KEYS */;

-- Dumping structure for table pixelprint.wp0e_pxmyorder
DROP TABLE IF EXISTS `wp0e_pxmyorder`;
CREATE TABLE IF NOT EXISTS `wp0e_pxmyorder` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `nomorso` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `namapelanggan` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `orderitem` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `orderjml` int(11) DEFAULT '0',
  `orderketerangan` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `orderdeadline` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `orderdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `orderstatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderopr` int(11) DEFAULT '1',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;

-- Dumping data for table pixelprint.wp0e_pxmyorder: ~89 rows (approximately)
/*!40000 ALTER TABLE `wp0e_pxmyorder` DISABLE KEYS */;
REPLACE INTO `wp0e_pxmyorder` (`orderid`, `nomorso`, `namapelanggan`, `orderitem`, `orderjml`, `orderketerangan`, `orderdeadline`, `orderdate`, `orderstatus`, `orderopr`) VALUES
	(7, 'SO-00034', 'Bpk Agus', 'banner', 2, 'Jam 09:30 di ambil', '2018-04-08 17:00:00', '2018-04-08 02:37:17', '7', 1),
	(8, '007', 'Eric tjung', 'BAnner lores', NULL, 'Minta besok selesai', '2018-04-08 17:00:00', '2018-04-08 02:46:20', '6', 10),
	(9, '123314', 'asda', 'adsadsa', 12313, 'sdadad', '2018-04-10 17:00:00', '2018-04-09 07:19:39', '11', 1),
	(10, '012313', 'adadsad', 'adad', 1313, 'adsadad', '2018-04-10 17:00:00', '2018-04-09 07:20:58', '7', 1),
	(11, '0', 'novi', 'kajhdsak', 1231, 'adasda', '2018-04-09 17:00:00', '2018-04-09 08:56:06', '1', 9),
	(12, '0', '1212', 'qweqe', 1, 'adsadad', '2018-04-13 17:00:00', '2018-04-09 18:42:36', '1', 9),
	(13, '0', 'cecilia', 'bontak', 1, 'ditunggu', '2018-04-09 17:00:00', '2018-04-09 21:40:10', '1', 11),
	(14, '0', 'cecilia', 'stc vinil', 1, 'ditunggu', '2018-04-09 17:00:00', '2018-04-09 21:40:26', '8', 11),
	(15, '04-00288', 'tedi', 'Gantungan kunci 20persegi', 20, 'rabu malam', '2018-04-10 17:00:00', '2018-04-09 23:11:26', '11', 12),
	(16, '04-00289', 'Hendrik Wibisono', 'JASA PRINT DECAL', 62, 'DITUNGGU', '2018-04-09 17:00:00', '2018-04-09 23:49:33', '8', 12),
	(17, '04-00290', 'Afif', 'bontak', 17, 'coba 1 dulu (ditunggu)', '2018-04-09 17:00:00', '2018-04-09 23:59:38', '8', 11),
	(18, '04-00292', 'handoko', 'paket xbanner 0.6x1.6m (LUSTER)', 2, 'JAM 15.00', '2018-04-10 17:00:00', '2018-04-10 00:06:42', '3', 10),
	(19, '04-00291', 'ardiansyah', 'ap 310', 100, 'ditunggu coba 1 dulu yaa', '2018-04-09 17:00:00', '2018-04-10 00:07:34', '8', 11),
	(20, '04-00293', 'azwar', 'AP120', 100, 'di tunggu', '2018-04-09 17:00:00', '2018-04-10 00:11:31', '8', 16),
	(21, '04-00293', 'azwar', 'bontak', 20, 'di tunggu', '2018-04-09 17:00:00', '2018-04-10 00:11:50', '8', 16),
	(22, '04-00294', 'Nurcholis', 'bontak', 1, 'saiki yaah', '2018-04-09 17:00:00', '2018-04-10 00:22:34', '5', 11),
	(23, '04-00295', 'Pentagon', '(200 x 120 = 1x)  (600 x 115 = 1x) lores lebihan', 2, '280gr lores.. gk jelas tanya ya', '2018-04-09 17:00:00', '2018-04-10 00:34:50', '7', 11),
	(24, '04-00296', 'BAMBANG S WIDODO', '280 HIRESS', 1, 'RABU MALAM', '2018-04-10 17:00:00', '2018-04-10 00:43:32', '11', 12),
	(25, '04-00297', 'EIGER MERR', 'AP 260 GR_2 FILE', 2, 'DI ENTENI REK', '2018-04-09 17:00:00', '2018-04-10 00:47:41', '5', 10),
	(26, '04-00298', 'UNTUNG', 'ap 150 gr_1x', 1, 'di tunggu ya', '2018-04-09 17:00:00', '2018-04-10 00:51:17', '8', 10),
	(27, '04-00299', 'ALFAT SAIFUDDIN', 'V SUSU', 2, 'DITUNGGU', '2018-04-09 17:00:00', '2018-04-10 00:57:54', '5', 12),
	(28, '004-00299', 'ALFAT SAIFUDDIN', 'AP260', 1, 'DITUNGGU', '2018-04-09 17:00:00', '2018-04-10 00:58:11', '5', 12),
	(29, '04-00300', 'HORE', '280 LOW 3X1M', 1, NULL, '2018-04-10 01:06:40', '2018-04-10 01:06:40', '11', 12),
	(30, '04-00300', 'HORE', '3X1M LAYOUT', 1, NULL, '2018-04-10 01:07:08', '2018-04-10 01:07:08', '11', 12),
	(31, '04-00301', 'UNTUNG', 'BONTAK', 1, 'DITUNGGU', '2018-04-09 17:00:00', '2018-04-10 01:11:17', '5', 12),
	(32, '04-00302', 'Belanja Rak', 'AP260', 7, 'Laser Cutting ( di tunggu )', '2018-04-09 17:00:00', '2018-04-10 01:11:54', '5', 16),
	(33, '04-00303', 'johanes', 'AP260', 30, NULL, '2018-04-09 17:00:00', '2018-04-10 01:24:44', '5', 16),
	(34, '04-00304', 'NUNUK', '280 HIRESS 50X100CM', 1, NULL, '2018-04-10 01:28:55', '2018-04-10 01:28:55', '11', 12),
	(35, '04-00305', 'RIANTO', 'V SUSU + POTONG', 11, NULL, '2018-04-10 02:02:58', '2018-04-10 02:02:58', '5', 12),
	(36, '04-00305', 'RIANTO', 'GANTUNGAN KUNCI UK5', 160, NULL, '2018-04-10 02:03:27', '2018-04-10 02:03:27', '11', 12),
	(37, '04-00308', 'devi pixel', 'AP 150 GR_7X dan 3x', 10, 'di tunggu yah', '2018-04-09 17:00:00', '2018-04-10 02:21:58', '5', 10),
	(38, '04-00306', 'Heru Laser Cut', 'Laser Cutting', NULL, 'Ditunggu', '2018-04-09 17:00:00', '2018-04-10 02:22:36', '11', 12),
	(39, '04-00307', 'SIGIT', 'X BANNER 60X160 OUTDOOR', 2, NULL, '2018-04-10 02:23:27', '2018-04-10 02:23:27', '5', 12),
	(40, '04-00309', 'Fandi', 'Kartu Nama (beda file)', 3, NULL, '2018-04-10 17:00:00', '2018-04-10 02:23:51', '5', 16),
	(41, '04-00309', 'Fandi', 'Vinyl susu', 1, NULL, '2018-04-10 17:00:00', '2018-04-10 02:25:13', '5', 16),
	(42, '000310', 'ILMI', '340 120X160CM', 1, NULL, '2018-04-10 02:32:04', '2018-04-10 02:32:04', '1', 12),
	(43, '04-00311', 'FEKA', 'bontac_20x', 20, 'di enteni rek', '2018-04-09 17:00:00', '2018-04-10 02:32:28', '5', 10),
	(44, '04-00312', 'Aira', 'One Way 169x122 (2 file)', 1, 'Di enteni yo rek', '2018-04-10 17:00:00', '2018-04-10 02:50:20', '3', 16),
	(45, '04-00314', 'Suherman', 'bontak', 5, 'di tunggu', '2018-04-09 17:00:00', '2018-04-10 03:22:06', '5', 16),
	(46, '04-00314', 'Suherman', 'bontax', 3, 'di tunggu (+cutting 18)', '2018-04-09 17:00:00', '2018-04-10 03:23:37', '5', 16),
	(47, '04-00316', 'INDOLION', '1X1M', 1, NULL, '2018-04-10 04:04:13', '2018-04-10 04:04:13', '4', 12),
	(48, '04-00316', 'INDOLION', '1X1M B', 1, NULL, '2018-04-10 04:05:46', '2018-04-10 04:05:46', '4', 12),
	(49, '04-00317', 'Eiger Merr', 'Roll Banner (Vinyl)', 1, 'bahan vinyl', '2018-04-10 17:00:00', '2018-04-10 04:08:39', '11', 16),
	(50, '04-00313', '86', 'Banner 50x300', 2, NULL, '2018-04-09 17:00:00', '2018-04-10 04:34:44', '11', 16),
	(51, '04-00313', '86', 'Banner 50x400', 2, NULL, '2018-04-09 17:00:00', '2018-04-10 04:35:07', '11', 16),
	(52, '04-00313', '86', 'Banner 74x75', 2, NULL, '2018-04-09 17:00:00', '2018-04-10 04:35:22', '11', 16),
	(53, '04-00313', '86', 'Banner 85,6x120', 2, NULL, '2018-04-09 17:00:00', '2018-04-10 04:35:53', '11', 16),
	(54, '04-00313', '86', 'Banner A 50x300', 2, NULL, '2018-04-09 17:00:00', '2018-04-10 04:36:26', '11', 16),
	(55, '04-00315', 'FERI DWI ANDIKA', 'V SUSU', 3, 'DITUNGGU', '2018-04-09 17:00:00', '2018-04-10 04:48:22', '5', 12),
	(56, '04-00318', 'Syaiful Anwar', 'AP210', 4, '+ disain 1jam', '2018-04-10 17:00:00', '2018-04-10 05:02:20', '5', 16),
	(57, '04-00319', 'Gondrong (pixel)', 'Bontak', 1, NULL, '2018-04-09 17:00:00', '2018-04-10 05:36:28', '5', 16),
	(58, '04-00319', 'Gondrong (pixel)', 'vinyl', 1, NULL, '2018-04-09 17:00:00', '2018-04-10 05:36:37', '5', 16),
	(59, '04-00320', 'SUNSTAR MOTOR SIDOARJO', 'AP120 + POTONG', 50, NULL, '2018-04-10 05:37:43', '2018-04-10 05:37:43', '5', 12),
	(60, '04-00320', 'SUNSTAR MOTOR SIDOARJO', 'X BANNER 60X160 INDOOR', 1, NULL, '2018-04-10 05:37:59', '2018-04-10 05:37:59', '3', 12),
	(61, '04-00322', 'PENTAGON', '280 LOW 180X60CM', 1, NULL, '2018-04-10 06:34:34', '2018-04-10 06:34:34', '7', 12),
	(62, '04-322', 'PENTAGON', '280 LOW 300X150CM', 1, NULL, '2018-04-10 06:34:51', '2018-04-10 06:34:51', '7', 12),
	(63, '04-00321', 'Sam', 'Vinyl susu', 1, 'di tunggu', '2018-04-09 17:00:00', '2018-04-10 06:50:59', '5', 12),
	(64, '04-00343', 'Mike', 'HVS', 5, '+ potong A5', '2018-04-10 17:00:00', '2018-04-10 23:00:51', '5', 16),
	(65, '04-00344', 'Ulva Pixel (Mila)', 'Transparant', 18, 'Punya Ulva', '2018-04-10 17:00:00', '2018-04-10 23:10:58', '5', 16),
	(66, '04-00345', 'DODI', 'JASA DESAIN', 1, NULL, '2018-04-10 23:14:56', '2018-04-10 23:14:56', '1', 12),
	(67, '04-00345', 'DODI', '280 HIRESS 70X100CM', 1, NULL, '2018-04-10 23:15:46', '2018-04-10 23:15:46', '4', 12),
	(68, '04-00346', 'DEFANY', 'LINEN + POTONG (JD2)', 2, NULL, '2018-04-10 23:39:11', '2018-04-10 23:39:11', '5', 12),
	(69, '04-00347', 'BRENDA', 'JASA PRINT OSCAR 130X105CM AVANGER', 1, NULL, '2018-04-10 23:43:52', '2018-04-10 23:43:52', '3', 12),
	(70, '04-00348', 'Irene', 'X Banner (60x160) Indoor', 1, 'desain 1 jam', '2018-04-11 17:00:00', '2018-04-11 00:14:43', '3', 16),
	(71, '04-00348', 'Irene', 'Banner 200 x 100', 1, '', '2018-04-11 17:00:00', '2018-04-11 00:15:03', '4', 16),
	(72, '04-00349', 'PT KARYA NIAGA ABADI', 'AP210 - PROOF DULU', 9, NULL, '2018-04-11 00:28:26', '2018-04-11 00:28:26', '5', 12),
	(73, '04-00359', 'Melisa Kohar', 'Tiket Gelang LMO', 233, '+ Disain - Perekat', '2018-04-13 17:00:00', '2018-04-11 01:08:47', '5', 16),
	(74, '04-00353', 'Indra', 'ap 120', 80, '+ potong jadi 4', '2018-04-10 17:00:00', '2018-04-11 01:12:25', '5', 11),
	(75, '04-00353', 'Indra', 'bontak', 2, '', '2018-04-10 17:00:00', '2018-04-11 01:12:45', '5', 11),
	(76, '04-00354', 'Lee', 'Banner Hires', 1, NULL, '2018-04-11 17:00:00', '2018-04-11 01:20:18', '11', 16),
	(77, '0', 'Vuvahealth', 'Albatroz Indoor (197x50)', 2, 'Beda file', '2018-04-15 17:00:00', '2018-04-11 01:42:49', '3', 16),
	(78, '0', 'Vivahealth', 'Albatroz Indoor (199x50)', 1, '', '2018-04-15 17:00:00', '2018-04-11 01:43:12', '3', 16),
	(79, '04-00356', 'ESTER', 'JASA DESAIN + AMBIL FILE', 1, NULL, '2018-04-10 17:00:00', '2018-04-11 02:27:34', '5', 12),
	(80, '04-00356', 'ESTER', 'BONTAK + CUTT (JD30)', 3, NULL, '2018-04-11 17:00:00', '2018-04-11 02:29:30', '5', 12),
	(81, '04-00356', 'ESTER', 'BONTAK', 40, NULL, '2018-04-11 17:00:00', '2018-04-11 02:29:56', '5', 12),
	(82, '04-00358', 'Mita', 'Banner 60x80', 2, '+ Disain 1 jam', '2018-04-11 17:00:00', '2018-04-11 02:57:49', '4', 16),
	(83, '04-00360', 'Rizky', 'AP150', 4, 'Ditunggu', '2018-04-10 17:00:00', '2018-04-11 03:27:24', '5', 16),
	(84, '04-00361', 'Choirul', 'Transparant', 1, NULL, '2018-04-10 17:00:00', '2018-04-11 03:34:47', '5', 16),
	(85, '04-00361', 'Choirul', 'Bontak', 1, 'Di tunggu', '2018-04-10 17:00:00', '2018-04-11 03:35:00', '5', 16),
	(86, '04-00362', 'LINA', 'AP260', 2, NULL, '2018-04-10 17:00:00', '2018-04-11 04:28:38', '5', 12),
	(87, '04-00365', 'Donny', 'AP120', 2, NULL, '2018-04-10 17:00:00', '2018-04-11 04:40:13', '5', 16),
	(88, '04-00367', 'Sulis Oase', 'AP260', 6, NULL, '2018-04-11 17:00:00', '2018-04-11 04:59:51', '5', 16),
	(89, '04-00366', 'FENI', 'BONTAK + CUTT', 3, NULL, '2018-04-10 17:00:00', '2018-04-11 05:01:17', '5', 12),
	(90, '04-00368', 'Wendy', 'AP120', 1, 'di tunggu', '2018-04-10 17:00:00', '2018-04-11 06:09:40', '5', 16),
	(91, '04-00369', 'AMANDA', 'AP 150', 17, 'PROOF DULU', '2018-04-10 17:00:00', '2018-04-11 06:41:15', '5', 12),
	(92, '04-00370', 'MELVINA', 'BONTAK', 4, NULL, '2018-04-11 17:00:00', '2018-04-11 06:50:04', '1', 12),
	(93, '0', 'MELVINA', '280 HIRESS 120X45CM', 1, NULL, '2018-04-11 17:00:00', '2018-04-11 06:50:44', '4', 12),
	(94, '0', 'Agus', 'JHAJAJ', 2, 'kajska', '2018-04-13 00:00:00', '2018-04-12 05:31:08', '1', 7),
	(95, '0', 'ashajs', 'asjaksja', 2, 'aksjaksja', '2018-04-13 00:00:00', '2018-04-12 05:40:08', '1', 7);
/*!40000 ALTER TABLE `wp0e_pxmyorder` ENABLE KEYS */;

-- Dumping structure for table pixelprint.wp0e_pxstatusorder
DROP TABLE IF EXISTS `wp0e_pxstatusorder`;
CREATE TABLE IF NOT EXISTS `wp0e_pxstatusorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(90) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table pixelprint.wp0e_pxstatusorder: ~11 rows (approximately)
/*!40000 ALTER TABLE `wp0e_pxstatusorder` DISABLE KEYS */;
REPLACE INTO `wp0e_pxstatusorder` (`id`, `status`) VALUES
	(1, 'Design'),
	(2, 'Kasir'),
	(3, 'Indoor'),
	(4, 'Outdoor'),
	(5, 'A3'),
	(6, 'Offset'),
	(7, 'Ready'),
	(8, 'Diambil'),
	(9, 'Laser Cutting'),
	(10, 'Finishing'),
	(11, 'Lainnya');
/*!40000 ALTER TABLE `wp0e_pxstatusorder` ENABLE KEYS */;

-- Dumping structure for table pixelprint.wp0e_pxusers
DROP TABLE IF EXISTS `wp0e_pxusers`;
CREATE TABLE IF NOT EXISTS `wp0e_pxusers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `level` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pixelprint.wp0e_pxusers: ~4 rows (approximately)
/*!40000 ALTER TABLE `wp0e_pxusers` DISABLE KEYS */;
REPLACE INTO `wp0e_pxusers` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `level`) VALUES
	(1, 'Administrator', 'admin@pixel.co.id', 'pixel1234', NULL, '2018-03-25 09:35:48', '2018-03-25 09:35:53', 10),
	(6, 'Kasir1', 'kasir1@pixel.co.id', '12345', '2b30bd3f7b98a258', '2018-04-08 10:14:21', '2018-04-08 10:14:21', 3),
	(7, 'Design', 'Design1@pixel.co.id', '12345', '3ba1230f893bfc33', '2018-04-09 22:05:10', '2018-04-09 22:05:10', 1),
	(12, 'Operator1', 'Operator1@pixel.co.id', '1212121', '5a8ca1816650d8c0', '2018-04-10 19:45:34', '2018-04-10 19:45:34', 0);
/*!40000 ALTER TABLE `wp0e_pxusers` ENABLE KEYS */;

-- Dumping structure for table pixelprint.wp0e_pxusersrole
DROP TABLE IF EXISTS `wp0e_pxusersrole`;
CREATE TABLE IF NOT EXISTS `wp0e_pxusersrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role` varchar(50) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table pixelprint.wp0e_pxusersrole: ~4 rows (approximately)
/*!40000 ALTER TABLE `wp0e_pxusersrole` DISABLE KEYS */;
REPLACE INTO `wp0e_pxusersrole` (`id`, `user_role`, `id_role`) VALUES
	(1, 'Administrator', 10),
	(2, 'Kasir', 3),
	(3, 'Design', 1),
	(4, 'Operator', 0);
/*!40000 ALTER TABLE `wp0e_pxusersrole` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;