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

-- Data exporting was unselected.
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

-- Data exporting was unselected.
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

-- Data exporting was unselected.
-- Dumping structure for table pixelprint.wp0e_pxstatusorder
DROP TABLE IF EXISTS `wp0e_pxstatusorder`;
CREATE TABLE IF NOT EXISTS `wp0e_pxstatusorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(90) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
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

-- Data exporting was unselected.
-- Dumping structure for table pixelprint.wp0e_pxusersrole
DROP TABLE IF EXISTS `wp0e_pxusersrole`;
CREATE TABLE IF NOT EXISTS `wp0e_pxusersrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role` varchar(50) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
