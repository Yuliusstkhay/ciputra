/*
 Navicat Premium Data Transfer

 Source Server         : Ciputra-Live
 Source Server Type    : MariaDB
 Source Server Version : 100331
 Source Host           : localhost:3306
 Source Schema         : ciputra

 Target Server Type    : MariaDB
 Target Server Version : 100331
 File Encoding         : 65001

 Date: 06/12/2021 16:15:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auto_numbers
-- ----------------------------
DROP TABLE IF EXISTS `auto_numbers`;
CREATE TABLE `auto_numbers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of auto_numbers
-- ----------------------------
BEGIN;
INSERT INTO `auto_numbers` VALUES (1, '397d74140a0071ee0aa3a8f9c9617eb6', 4, '2021-11-05 09:24:10', '2021-11-29 04:03:25');
INSERT INTO `auto_numbers` VALUES (2, '41f67449c969b30a23efd8c1aa9c5ca4', 7, '2021-11-07 09:52:01', '2021-11-29 04:03:40');
INSERT INTO `auto_numbers` VALUES (3, 'f3197d8bb5f42d47e7f8d79c03f4894e', 4, '2021-11-07 14:28:36', '2021-11-29 04:04:10');
INSERT INTO `auto_numbers` VALUES (4, '1e57a0082b2a461a6cdec8c05ea1bdaa', 1, '2021-11-08 01:40:32', '2021-11-08 01:40:32');
INSERT INTO `auto_numbers` VALUES (5, '79b52a458e649d2d320b176f0f678bae', 6, '2021-11-08 03:32:34', '2021-11-29 04:24:33');
INSERT INTO `auto_numbers` VALUES (10, 'd06b5ef6d562c6bdf431ccf6fda00341', 3, '2021-11-08 04:27:37', '2021-11-22 22:53:53');
INSERT INTO `auto_numbers` VALUES (11, '2f178c58f54077eb1921fb1c28b33bb6', 51, '2021-11-08 13:34:02', '2021-12-06 08:27:33');
INSERT INTO `auto_numbers` VALUES (12, '5773343f28b8bf386db0eb4e54ba02f0', 12, '2021-11-11 07:58:47', '2021-11-30 02:27:39');
INSERT INTO `auto_numbers` VALUES (18, 'd592e7bc633d9c4f6236a38742c1549c', 7, '2021-11-14 13:51:10', '2021-11-30 02:48:19');
INSERT INTO `auto_numbers` VALUES (19, '1be50536393af8ab0a3febd13aef27d1', 7, '2021-11-17 03:26:31', '2021-11-30 02:32:32');
INSERT INTO `auto_numbers` VALUES (20, '0fe437aa5c5ec53a9c847bfae68614cd', 693, '2021-11-17 05:25:42', '2021-12-04 10:58:42');
INSERT INTO `auto_numbers` VALUES (21, '1ff1c077e2a99245cc307c7710f1b78b', 87, '2021-11-21 03:44:02', '2021-11-30 02:37:00');
INSERT INTO `auto_numbers` VALUES (22, '2cec4e10596c0292af7617336f7d3bef', 18, '2021-11-21 22:08:44', '2021-11-30 02:37:27');
INSERT INTO `auto_numbers` VALUES (25, '9d281d2666f3a8921218a50032beebab', 227, '2021-11-22 03:49:39', '2021-11-30 02:39:48');
INSERT INTO `auto_numbers` VALUES (36, '1a93df37b417cc315063724fc1c48749', 689, '2021-11-22 21:09:46', '2021-11-30 02:40:49');
INSERT INTO `auto_numbers` VALUES (37, '4b678dc5c1d528e153080df8426e38da', 86, '2021-11-27 14:46:18', '2021-11-30 02:40:49');
INSERT INTO `auto_numbers` VALUES (38, '3e146737772cc2c5b6872be123d4a47f', 24, '2021-11-27 14:46:18', '2021-11-30 02:40:49');
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for m_assessment
-- ----------------------------
DROP TABLE IF EXISTS `m_assessment`;
CREATE TABLE `m_assessment` (
  `assessment_id` varchar(50) NOT NULL,
  `assessment_name` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT 0,
  `dt_record` timestamp NULL DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  `universitas_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`assessment_id`) USING BTREE,
  KEY `m_assessment_universitas_id_foreign` (`universitas_id`),
  CONSTRAINT `m_assessment_universitas_id_foreign` FOREIGN KEY (`universitas_id`) REFERENCES `m_universitas` (`universitas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_assessment
-- ----------------------------
BEGIN;
INSERT INTO `m_assessment` VALUES ('ASM.1.0001', 'Tugas', 0, '2021-11-08 03:32:34', 'admin@mail.com', '2021-11-08 03:58:29', NULL, '1');
INSERT INTO `m_assessment` VALUES ('ASM.1.0002', 'Quiz 1', 0, '2021-11-08 03:32:50', 'admin@mail.com', '2021-11-08 03:32:50', NULL, '1');
INSERT INTO `m_assessment` VALUES ('ASM.1.0003', 'Quiz 2', 0, '2021-11-08 03:32:53', 'admin@mail.com', '2021-11-08 03:32:53', NULL, '1');
INSERT INTO `m_assessment` VALUES ('ASM.1.0004', 'UTS', 0, '2021-11-08 03:32:55', 'admin@mail.com', '2021-11-08 03:32:55', NULL, '1');
INSERT INTO `m_assessment` VALUES ('ASM.1.0005', 'UAS', 0, '2021-11-26 12:46:53', 'admin@mail.com', '2021-11-26 12:46:53', NULL, '1');
INSERT INTO `m_assessment` VALUES ('ASM.1.0006', 'Presentasi', 0, '2021-11-29 04:24:33', 'admin@mail.com', '2021-11-29 04:24:33', NULL, '1');
COMMIT;

-- ----------------------------
-- Table structure for m_bidang_studi
-- ----------------------------
DROP TABLE IF EXISTS `m_bidang_studi`;
CREATE TABLE `m_bidang_studi` (
  `bidang_studi_id` varchar(50) NOT NULL,
  `bidang_studi_name` varchar(255) DEFAULT NULL,
  `fakultas_id` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT 0,
  `dt_record` timestamp NULL DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bidang_studi_id`) USING BTREE,
  KEY `fakultas_id` (`fakultas_id`) USING BTREE,
  CONSTRAINT `m_bidang_studi_ibfk_1` FOREIGN KEY (`fakultas_id`) REFERENCES `m_fakultas` (`fakultas_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_bidang_studi
-- ----------------------------
BEGIN;
INSERT INTO `m_bidang_studi` VALUES ('1', 'Accounting', '1', 0, NULL, NULL, '2021-11-29 08:15:49', NULL);
INSERT INTO `m_bidang_studi` VALUES ('10', 'Culinary Business', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_bidang_studi` VALUES ('11', 'Food Technology Program', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_bidang_studi` VALUES ('12', 'Informatika', '4', 0, NULL, NULL, '2021-11-30 01:43:41', NULL);
INSERT INTO `m_bidang_studi` VALUES ('13', 'Information Systems for Business (ERP & Data Science)', '4', 0, NULL, NULL, '2021-11-30 01:46:54', NULL);
INSERT INTO `m_bidang_studi` VALUES ('14', 'Kedokteran', '5', 0, NULL, NULL, '2021-11-30 01:43:02', NULL);
INSERT INTO `m_bidang_studi` VALUES ('15', 'Ilmu Komunikasi - Digital Public Relations', '5', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_bidang_studi` VALUES ('16', 'Psychology', '6', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_bidang_studi` VALUES ('17', 'Fakultas Entrepreneurship dan Humaniora (FEH)', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_bidang_studi` VALUES ('2', 'International Business Management - Regular Class', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_bidang_studi` VALUES ('3', 'International Business Management - International Class', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_bidang_studi` VALUES ('4', 'Performance of Art & Sport Management', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_bidang_studi` VALUES ('5', 'Program Pascasarjana Magister Manajemen', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_bidang_studi` VALUES ('6', 'Visual Communication Design', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_bidang_studi` VALUES ('7', 'Interior Architecture - Architecture & Property', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_bidang_studi` VALUES ('8', 'Fashion Product Design & Business', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_bidang_studi` VALUES ('9', 'Hotel and Tourism Business - Digital & Ecotourism', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_bidang_studi` VALUES ('BS.1.00001', 'uji coba 231', 'FS.1.001', 0, '2021-11-07 09:52:01', 'admin@mail.com', '2021-11-07 10:19:17', NULL);
INSERT INTO `m_bidang_studi` VALUES ('BS.1.00002', 'test 1233', 'FS.1.002', 0, '2021-11-07 09:55:33', 'admin@mail.com', '2021-11-07 10:22:36', NULL);
INSERT INTO `m_bidang_studi` VALUES ('BS.1.00003', 'zxcxz', 'FS.1.002', 0, '2021-11-07 09:56:19', 'admin@mail.com', '2021-11-07 09:56:19', NULL);
INSERT INTO `m_bidang_studi` VALUES ('BS.1.00004', 'asdasda', 'FS.1.002', 0, '2021-11-07 09:57:53', 'admin@mail.com', '2021-11-07 09:57:53', NULL);
INSERT INTO `m_bidang_studi` VALUES ('BS.1.00005', 'xvxvvc', 'FS.1.002', 0, '2021-11-07 10:00:15', 'admin@mail.com', '2021-11-07 10:00:15', NULL);
INSERT INTO `m_bidang_studi` VALUES ('BS.1.00006', 'Information of Technology', 'FS.1.003', 0, '2021-11-26 09:44:16', 'admin@mail.com', '2021-11-26 09:44:16', NULL);
INSERT INTO `m_bidang_studi` VALUES ('BS.1.00007', 'Tes Program Studi', 'FS.1.004', 0, '2021-11-29 04:03:40', 'admin@mail.com', '2021-11-29 04:03:40', NULL);
COMMIT;

-- ----------------------------
-- Table structure for m_default_no
-- ----------------------------
DROP TABLE IF EXISTS `m_default_no`;
CREATE TABLE `m_default_no` (
  `transaction_name` varchar(50) NOT NULL,
  `module_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `default_no` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `table_data` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `field` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `notes` text CHARACTER SET utf8 DEFAULT NULL,
  `dt_record` datetime DEFAULT NULL,
  `user_record` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `dt_modified` datetime DEFAULT NULL,
  `user_modified` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`transaction_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of m_default_no
-- ----------------------------
BEGIN;
INSERT INTO `m_default_no` VALUES ('Assessment', 'M09', 'A.[Auto5]', 'm_assessment', 'assessmen t_id', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_default_no` VALUES ('Dosen', 'M05', 'D.[YY][MM].[Auto5]', 'm_dosen_mahasiswa', 'id', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_default_no` VALUES ('Fakultas', 'M02', 'F.[Auto3]', 'm_fakultas', 'fakultas_id', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_default_no` VALUES ('Jadwal Kuliah', 'M08', '[semester_id].[program_studi_id].[Auto3]', 'm_jadwal_kuliah', 'jadwal_kuliah_id', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_default_no` VALUES ('Mahasiswa', 'M06', 'M.[YY][MM].[Auto5]', 'm_dosen_mahasiswa', 'id', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_default_no` VALUES ('Mata Kuliah', 'M04', '[program_studi_id].[Auto3]', 'm_mata_kuliah', 'mata_kuliah_id', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_default_no` VALUES ('Penilaian', 'P00', 'P.[jadwal_kuliah_id]', 't_penilaian_header', 'penilaian_id', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_default_no` VALUES ('Penilaian Assessment', 'P01', 'A.[Auto2].[penilaian_id]', 't_penilaian_assessment', 'id', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_default_no` VALUES ('Program Studi', 'M03', '[fakultas_id].[Auto3]', 'm_program_studi', 'program_studi_id', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_default_no` VALUES ('Role', 'U01', 'R.[Auto5]', 'm_role', 'role_id', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_default_no` VALUES ('Semester', 'M07', 'S.[Gasal/Genap][YY/YY+1]', 'm_semester', 'semester_id', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_default_no` VALUES ('Universitas', 'M01', 'U.[Auto5]', 'm_universitas', 'universitas_id', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for m_dosen_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `m_dosen_mahasiswa`;
CREATE TABLE `m_dosen_mahasiswa` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nip` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `bidang_studi_id` varchar(50) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `tipe` int(1) DEFAULT NULL COMMENT '0 = dosen, 1 = mahasiswa',
  `status` int(1) DEFAULT 0,
  `dt_record` timestamp NULL DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique_nip` (`nip`),
  UNIQUE KEY `unique_email` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_dosen_mahasiswa
-- ----------------------------
BEGIN;
INSERT INTO `m_dosen_mahasiswa` VALUES ('1', 'Prof. Dr. Christina Whidya Utami, M.M., CLC., CPM (Asia)', '1973.09.26.2015.05.2.001', 'cwutami@ciputra.com', '2', 'Dean', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('2', 'Dr. Tommy Christian Efrata, S.E., M.Sc.', '1984.05.24.2017.03.1.001', 'tcefrata@ciputra.com', '2', 'Head', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('3', 'Dr. Timotius Febry Christian, S.T., M.T.', '1980.08.13.2016.09.1.001', 'tfchristian@ciputra.com', '2', 'Head', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('4', 'Auditia Setiobudi, S.E., MBA', '1995.03.25.2017.04.2.001', 'asetiobudi@ciputra.com', '2', 'Head', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('5', 'Krismi Budi Sienatra, S.E., M.M.CFP', '1993.11.30.2015.05.1.001', 'kbsienatra@ciputra.com', '2', 'Lecturer', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('6', 'Dr. Christian Herdinata, S.E., M.M., CFP., QWP., AEPP.', '1986.02.14.2015.04.1.001', 'cherdinata@ciputra.com', '2', 'Lecturer', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('7', 'Donna Febrianti', '0102220001', 'dfebrianti@ciputra.com', '2', NULL, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('8', 'Alex Setiawan', '0102220002', 'asetiawan@ciputra.com', '2', NULL, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000002', 'Agus Hendrawan', '12345678', 'hendrawanagus15@gmail.com', 'BS.1.00002', NULL, 1, 0, '2021-11-08 13:35:39', 'admin@mail.com', '2021-11-08 15:09:58', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000003', 'agus hendrawan', '1111111333333', 'travelsyaofficial@gmail.com', 'BS.1.00002', 'dosen pengampu', 0, 0, '2021-11-09 14:17:46', 'admin@mail.com', '2021-11-09 14:32:34', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000004', 'bagus hermawan', '988228338', 'bagushermawan@gmail.com', 'BS.1.00002', 'dosen', 0, 0, '2021-11-24 13:44:29', 'asetiobudi@ciputra.com', '2021-11-24 13:44:29', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000005', 'mandra', '666666666', 'mandra@gmail.com', 'BS.1.00002', NULL, 1, 0, '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000006', 'Dr. Ir. Janti, M.Eng.Sc., M.Com.IB.', '22345', 'janti@ciputra.com', 'BS.1.00006', 'dosen', 0, 0, '2021-11-26 09:47:35', 'admin@mail.com', '2021-11-26 09:47:35', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000007', 'Febe Yuanita, S.E. M.M.', '11122333', 'febe@ciputra.com', 'BS.1.00006', 'dosen', 0, 0, '2021-11-26 09:56:44', 'admin@mail.com', '2021-11-26 09:56:44', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000008', 'Laij Victor, S.E., CMA.', '22334455', 'laij@ciputra.com', 'BS.1.00006', 'dosen', 0, 0, '2021-11-26 09:57:27', 'admin@mail.com', '2021-11-26 09:57:27', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000009', 'Dona', '454545', 'dona@ciputra.com', 'BS.1.00006', NULL, 1, 0, '2021-11-26 09:59:13', 'admin@mail.com', '2021-11-26 09:59:13', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000010', 'Bagus', '5556666', 'bagus@ciputra.com', 'BS.1.00006', NULL, 1, 0, '2021-11-26 10:00:55', 'admin@mail.com', '2021-11-26 10:00:55', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000011', 'bagas', '777666', 'bagas@ciputra.com', 'BS.1.00006', NULL, 1, 0, '2021-11-26 10:01:16', 'admin@mail.com', '2021-11-26 10:01:16', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000012', 'hendrik', '8988988', 'hendrik@ciputra.com', 'BS.1.00006', NULL, 1, 0, '2021-11-26 10:01:42', 'admin@mail.com', '2021-11-26 10:01:42', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000013', 'Tes Dosen 1', '123.123.001', 'tesdosen1@gmail.com', 'BS.1.00007', 'Lecturer', 0, 0, '2021-11-29 04:07:44', 'admin@mail.com', '2021-11-29 04:07:44', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000014', 'Tes Dosen 2', '123.123.002', 'tesdosen2@gmail.com', 'BS.1.00007', 'Lecturer', 0, 0, '2021-11-29 04:08:11', 'admin@mail.com', '2021-11-29 04:08:11', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000015', 'Tes Dosen 3', '123.123.003', 'tesdosen3@gmail.com', 'BS.1.00007', 'Lecturer', 0, 0, '2021-11-29 04:08:29', 'admin@mail.com', '2021-11-29 04:08:29', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000016', 'Tes Dosen 4', '123.123.004', 'tesdosen4@gmail.com', 'BS.1.00007', 'Lecturer', 0, 0, '2021-11-29 04:09:14', 'admin@mail.com', '2021-11-29 04:09:14', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000017', 'Tes Dosen 5', '123.123.005', 'tesdosen5@gmail.com', 'BS.1.00007', 'Lecturer', 0, 0, '2021-11-29 04:09:33', 'admin@mail.com', '2021-11-29 04:09:33', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000018', 'Tes Dosen 6', '123.123.006', 'tesdosen6@gmail.com', 'BS.1.00007', 'Lecturer', 0, 0, '2021-11-29 04:09:58', 'admin@mail.com', '2021-11-29 04:09:58', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000019', 'Tes Dosen 7', '123.123.007', 'tesdosen7@gmail.com', 'BS.1.00007', 'Lecturer', 0, 0, '2021-11-29 04:10:21', 'admin@mail.com', '2021-11-29 04:10:21', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000020', 'Tes Dosen 8', '123.123.008', 'tesdosen8@gmail.com', 'BS.1.00007', 'Lecturer', 0, 0, '2021-11-29 04:10:49', 'admin@mail.com', '2021-11-29 04:10:49', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000021', 'Tes Dosen 9', '123.123.009', 'tesdosen9@gmail.com', 'BS.1.00007', 'Lecturer', 0, 0, '2021-11-29 04:11:13', 'admin@mail.com', '2021-11-29 04:11:13', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000022', 'Tes Dosen 10', '123.123.010', 'tesdosen10@gmail.com', 'BS.1.00007', 'Lecturer', 0, 0, '2021-11-29 04:11:38', 'admin@mail.com', '2021-11-29 04:11:38', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000023', 'Tes Mahasiswa 1', '2321100001', 'tesmahasiswa1@gmail.com', 'BS.1.00007', NULL, 1, 0, '2021-11-29 04:18:20', 'admin@mail.com', '2021-11-29 04:18:20', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000024', 'Tes Mahasiswa 2', '2321100002', 'tesmahasiswa2@gmail.com', 'BS.1.00007', NULL, 1, 0, '2021-11-29 04:20:02', 'admin@mail.com', '2021-11-29 04:20:02', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000025', 'Tes Mahasiswa 3', '2321100003', 'tesmahasiswa3@gmail.com', 'BS.1.00007', NULL, 1, 0, '2021-11-29 04:20:32', 'admin@mail.com', '2021-11-29 04:20:32', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000026', 'Tes Mahasiswa 4', '2321100004', 'tesmahasiswa4@gmail.com', 'BS.1.00007', NULL, 1, 0, '2021-11-29 04:20:55', 'admin@mail.com', '2021-11-29 04:20:55', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000027', 'Tes Mahasiswa 5', '2321100005', 'tesmahasiswa5@gmail.com', 'BS.1.00007', NULL, 1, 0, '2021-11-29 04:21:17', 'admin@mail.com', '2021-11-29 04:21:17', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000028', 'Tes Mahasiswa 6', '2321100006', 'tesmahasiswa6@gmail.com', 'BS.1.00007', NULL, 1, 0, '2021-11-29 04:21:38', 'admin@mail.com', '2021-11-29 04:21:38', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000029', 'Tes Mahasiswa 7', '2321100007', 'tesmahasiswa7@gmail.com', 'BS.1.00007', NULL, 1, 0, '2021-11-29 04:21:57', 'admin@mail.com', '2021-11-29 04:21:57', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000030', 'Tes Mahasiswa 8', '2321100008', 'tesmahasiswa8@gmail.com', 'BS.1.00007', NULL, 1, 0, '2021-11-29 04:22:15', 'admin@mail.com', '2021-11-29 04:22:15', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000031', 'Tes Mahasiswa 9', '2321100009', 'tesmahasiswa9@gmail.com', 'BS.1.00007', NULL, 1, 0, '2021-11-29 04:23:00', 'admin@mail.com', '2021-11-29 04:23:00', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000032', 'Tes Mahasiswa 10', '2321100010', 'tesmahasiswa10@gmail.com', 'BS.1.00007', NULL, 1, 0, '2021-11-29 04:23:21', 'admin@mail.com', '2021-11-29 04:23:21', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000033', 'Stephanus Eko Wahyudi, S.T., M.Mm.', '1973.09.26.2014.05.1.001', 'sewahyudi@ciputra.com', '12', 'Head of Department, Assistant Professor', 0, 0, '2021-11-30 01:57:50', 'admin@mail.com', '2021-11-30 01:57:50', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000034', 'Trianggoro Wiradinata, Ph.D.', '1973.09.26.2013.05.1.002', 'twiradinata@ciputra.com', '12', 'Dean, Associate Professor', 0, 0, '2021-11-30 01:58:59', 'admin@mail.com', '2021-11-30 01:58:59', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000035', 'Ir. Daniel M. Wonohadidjojo, M.Eng.', '1966.09.26.2008.05.1.001', 'dmwonohadidjojo@ciputra.com', '12', 'Associate Professor', 0, 0, '2021-11-30 01:59:54', 'admin@mail.com', '2021-11-30 01:59:54', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000036', 'Caecilia Citra Lestari, S.Kom., M.Kom.', '1978.09.26.2008.05.2.001', 'cclestari@ciputra.com', '12', 'Assistant Professor', 0, 0, '2021-11-30 02:00:46', 'admin@mail.com', '2021-11-30 02:00:46', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000037', 'Yuwono Marta Dinata, S.T., M.Eng.', '1988.09.26.2017.05.1.001', 'ymdinata@ciputra.com', '12', 'Assistant Professor', 0, 0, '2021-11-30 02:01:32', 'admin@mail.com', '2021-11-30 02:01:32', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000038', 'Mychael Maoeretz Engel, S.Kom., M.Cs.', '1991.09.26.2018.05.1.001', 'mmengel@ciputra.com', '12', 'Assistant Professor', 0, 0, '2021-11-30 02:02:19', 'admin@mail.com', '2021-11-30 02:02:19', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000039', 'Dipl.-Inf. Laura Mahendratta Tjahjono', '1990.09.26.2008.05.2.001', 'lmtjahjono@ciputra.com', '12', 'Lecturer', 0, 0, '2021-11-30 02:03:05', 'admin@mail.com', '2021-11-30 02:03:05', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000040', 'Dr. Ir. Tony Antonio, M.Eng.', '1961.09.26.2000.05.1.001', 'tantonio@ciputra.com', '12', 'Chairman of University Senate', 0, 0, '2021-11-30 02:04:21', 'admin@mail.com', '2021-11-30 02:04:21', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000041', 'Mahasiswa 1', '123.21.100.001', 'mahasiswa1@gmail.com', '12', NULL, 1, 0, '2021-11-30 02:05:51', 'admin@mail.com', '2021-11-30 02:05:51', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000042', 'Mahasiswa 2', '123.21.100.002', 'mahasiswa2@gmail.com', '12', NULL, 1, 0, '2021-11-30 02:06:22', 'admin@mail.com', '2021-11-30 02:06:22', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000043', 'Mahasiswa 3', '123.21.100.003', 'mahasiswa3@gmail.com', '12', NULL, 1, 0, '2021-11-30 02:06:45', 'admin@mail.com', '2021-11-30 02:06:45', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000044', 'Mahasiswa 4', '123.21.100.004', 'mahasiswa4@gmail.com', '12', NULL, 1, 0, '2021-11-30 02:07:04', 'admin@mail.com', '2021-11-30 02:07:04', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000045', 'Mahasiswa 5', '123.21.100.005', 'mahasiswa5@gmail.com', '12', NULL, 1, 0, '2021-11-30 02:07:21', 'admin@mail.com', '2021-11-30 02:07:21', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000046', 'Mahasiswa 6', '123.21.100.006', 'mahasiswa6@gmail.com', '12', NULL, 1, 0, '2021-11-30 02:07:39', 'admin@mail.com', '2021-11-30 02:07:39', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000047', 'Mahasiswa 7', '123.21.100.007', 'mahasiswa7@gmail.com', '12', NULL, 1, 0, '2021-11-30 02:07:55', 'admin@mail.com', '2021-11-30 02:07:55', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000048', 'Mahasiswa 8', '123.21.100.008', 'mahasiswa8@gmail.com', '12', NULL, 1, 0, '2021-11-30 02:08:10', 'admin@mail.com', '2021-11-30 02:08:10', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000049', 'Mahasiswa 9', '123.21.100.009', 'mahasiswa9@gmail.com', '12', NULL, 1, 0, '2021-11-30 02:08:26', 'admin@mail.com', '2021-11-30 02:08:26', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000050', 'Mahasiswa 10', '123.21.100.010', 'mahasiswa10@gmail.com', '12', NULL, 1, 0, '2021-11-30 02:08:41', 'admin@mail.com', '2021-11-30 02:08:41', NULL);
INSERT INTO `m_dosen_mahasiswa` VALUES ('DM.1.000051', 'Tes', '123.123.123', 'tesmahasiswaacc@ciputra.com', '1', NULL, 1, 0, '2021-12-06 08:27:33', 'admin@mail.com', '2021-12-06 08:27:33', NULL);
COMMIT;

-- ----------------------------
-- Table structure for m_fakultas
-- ----------------------------
DROP TABLE IF EXISTS `m_fakultas`;
CREATE TABLE `m_fakultas` (
  `fakultas_id` varchar(50) NOT NULL,
  `fakultas_name` varchar(255) DEFAULT NULL,
  `universitas_id` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT 0,
  `dt_record` timestamp NULL DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fakultas_id`) USING BTREE,
  KEY `universitas_id` (`universitas_id`) USING BTREE,
  CONSTRAINT `m_fakultas_ibfk_1` FOREIGN KEY (`universitas_id`) REFERENCES `m_universitas` (`universitas_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_fakultas
-- ----------------------------
BEGIN;
INSERT INTO `m_fakultas` VALUES ('1', 'School of Businesss and Management', '1', 0, NULL, NULL, '2021-11-29 08:13:10', NULL);
INSERT INTO `m_fakultas` VALUES ('2', 'School of Creative Industry', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_fakultas` VALUES ('3', 'School of Tourism', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_fakultas` VALUES ('4', 'School of Information Technology', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_fakultas` VALUES ('5', 'School of Medicine', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_fakultas` VALUES ('6', 'School of Communication Science and Media Businesses', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_fakultas` VALUES ('7', 'School of Psychology', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_fakultas` VALUES ('8', 'School of Entrepreneurship and Humanities', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_fakultas` VALUES ('FS.1.001', 'barusan', '1', 1, '2021-11-05 09:24:10', 'admin@mail.com', '2021-11-30 01:44:08', NULL);
INSERT INTO `m_fakultas` VALUES ('FS.1.002', 'test 12345', '1', 1, '2021-11-05 09:26:48', 'admin@mail.com', '2021-11-30 01:44:11', NULL);
INSERT INTO `m_fakultas` VALUES ('FS.1.003', 'Sistem Informasi', '1', 1, '2021-11-26 09:43:37', 'admin@mail.com', '2021-11-30 01:44:20', NULL);
INSERT INTO `m_fakultas` VALUES ('FS.1.004', 'Tes Fakultas', '1', 0, '2021-11-29 04:03:25', 'admin@mail.com', '2021-11-29 06:58:46', NULL);
COMMIT;

-- ----------------------------
-- Table structure for m_function
-- ----------------------------
DROP TABLE IF EXISTS `m_function`;
CREATE TABLE `m_function` (
  `function_id` varchar(50) NOT NULL,
  `function_name` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `dt_record` datetime DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` datetime DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`function_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_function
-- ----------------------------
BEGIN;
INSERT INTO `m_function` VALUES ('01', 'View', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_function` VALUES ('02', 'Insert', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_function` VALUES ('03', 'Update', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_function` VALUES ('04', 'Void', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_function` VALUES ('05', 'Print', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_function` VALUES ('06', 'Add Peserta', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_function` VALUES ('07', 'Download', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for m_jadwal_kuliah
-- ----------------------------
DROP TABLE IF EXISTS `m_jadwal_kuliah`;
CREATE TABLE `m_jadwal_kuliah` (
  `jadwal_kuliah_id` varchar(50) NOT NULL,
  `mata_kuliah_id` varchar(255) DEFAULT NULL,
  `dosen_mahasiswa_id` varchar(50) DEFAULT NULL,
  `paralel` varchar(2) DEFAULT NULL,
  `semester_id` varchar(50) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT 0,
  `dt_record` timestamp NULL DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`jadwal_kuliah_id`) USING BTREE,
  KEY `mata_kuliah_id` (`mata_kuliah_id`) USING BTREE,
  KEY `dosen_mahasiswa_id` (`dosen_mahasiswa_id`) USING BTREE,
  KEY `semester_id` (`semester_id`) USING BTREE,
  CONSTRAINT `m_jadwal_kuliah_ibfk_1` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `m_mata_kuliah` (`mata_kuliah_id`) ON UPDATE CASCADE,
  CONSTRAINT `m_jadwal_kuliah_ibfk_2` FOREIGN KEY (`dosen_mahasiswa_id`) REFERENCES `m_dosen_mahasiswa` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `m_jadwal_kuliah_ibfk_3` FOREIGN KEY (`semester_id`) REFERENCES `m_semester` (`semester_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_jadwal_kuliah
-- ----------------------------
BEGIN;
INSERT INTO `m_jadwal_kuliah` VALUES ('BS.1.00002', 'MK.1.00001', 'DM.1.000003', 'D', '1', 'senin (20.00-24.00)\nselasa(20.00-24.00)\nRabu (19.00-23.00)', 0, '2021-11-11 08:48:01', 'admin@mail.com', '2021-11-11 12:57:18', NULL);
INSERT INTO `m_jadwal_kuliah` VALUES ('BS.1.00003', '40', '1', 'A', '1', 'Senin - Jumat (20.00-24.00)', 0, '2021-11-12 12:29:54', 'admin@mail.com', '2021-12-06 06:36:13', NULL);
INSERT INTO `m_jadwal_kuliah` VALUES ('BS.1.00004', 'MK.1.00002', 'DM.1.000004', 'A', '1', 'senin 1.00', 0, '2021-11-25 04:55:09', 'asetiobudi@ciputra.com', '2021-11-25 04:55:09', NULL);
INSERT INTO `m_jadwal_kuliah` VALUES ('BS.1.00005', 'MK.1.00003', 'DM.1.000006', 'A', '1', 'senin-selasa 09.00-12.00\nrabu 10.00-13.00', 0, '2021-11-26 11:10:38', 'janti@ciputra.com', '2021-11-26 11:10:38', NULL);
INSERT INTO `m_jadwal_kuliah` VALUES ('BS.1.00006', 'MK.1.00004', 'DM.1.000013', 'A', '1', 'Senin Rabu 09.00 - 11.00', 0, '2021-11-29 04:25:19', 'admin@mail.com', '2021-11-29 04:25:19', NULL);
INSERT INTO `m_jadwal_kuliah` VALUES ('BS.1.00007', 'MK.1.00004', 'DM.1.000014', 'B', '1', 'Selasa Kamis 09.00 - 11.00', 0, '2021-11-29 04:25:36', 'admin@mail.com', '2021-11-29 04:25:36', NULL);
INSERT INTO `m_jadwal_kuliah` VALUES ('BS.1.00008', '314', 'DM.1.000033', 'A', '1', 'Senin Rabu 09.00 - 11.00', 0, '2021-11-30 02:09:23', 'admin@mail.com', '2021-11-30 02:09:23', NULL);
INSERT INTO `m_jadwal_kuliah` VALUES ('BS.1.00009', '314', 'DM.1.000034', 'B', '1', 'Senin Rabu 09.00 - 11.00', 0, '2021-11-30 02:09:42', 'admin@mail.com', '2021-11-30 02:09:42', NULL);
INSERT INTO `m_jadwal_kuliah` VALUES ('BS.1.00010', '314', 'DM.1.000035', 'C', '1', 'Selasa Kamis 13.00 - 15.00', 0, '2021-11-30 02:10:05', 'admin@mail.com', '2021-11-30 02:10:05', NULL);
INSERT INTO `m_jadwal_kuliah` VALUES ('BS.1.00011', '313', 'DM.1.000037', 'A', '1', 'Jumat 08.00 - 11.00', 0, '2021-11-30 02:10:42', 'admin@mail.com', '2021-11-30 02:10:42', NULL);
INSERT INTO `m_jadwal_kuliah` VALUES ('BS.1.00012', '313', 'DM.1.000035', 'B', '1', 'Selasa Kamis 11.00 - 13.00', 0, '2021-11-30 02:27:39', 'admin@mail.com', '2021-11-30 02:27:39', NULL);
COMMIT;

-- ----------------------------
-- Table structure for m_jadwal_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `m_jadwal_mahasiswa`;
CREATE TABLE `m_jadwal_mahasiswa` (
  `jadwal_kuliah_id` varchar(50) NOT NULL,
  `dosen_mahasiswa_id` varchar(50) NOT NULL,
  `index` int(11) NOT NULL,
  `status` int(1) DEFAULT 0,
  `dt_record` timestamp NULL DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`jadwal_kuliah_id`,`dosen_mahasiswa_id`,`index`) USING BTREE,
  KEY `jadwal_kuliah_id` (`jadwal_kuliah_id`) USING BTREE,
  KEY `dosen_mahasiswa_id` (`dosen_mahasiswa_id`) USING BTREE,
  CONSTRAINT `m_jadwal_mahasiswa_ibfk_1` FOREIGN KEY (`jadwal_kuliah_id`) REFERENCES `m_jadwal_kuliah` (`jadwal_kuliah_id`) ON UPDATE CASCADE,
  CONSTRAINT `m_jadwal_mahasiswa_ibfk_2` FOREIGN KEY (`dosen_mahasiswa_id`) REFERENCES `m_dosen_mahasiswa` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_jadwal_mahasiswa
-- ----------------------------
BEGIN;
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00003', '7', 3, 0, '2021-11-12 14:25:49', 'admin@mail.com', '2021-11-12 14:25:49', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00003', '8', 4, 0, '2021-12-06 06:35:41', 'admin@mail.com', '2021-12-06 06:35:41', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00004', 'DM.1.000002', 1, 0, '2021-11-25 04:58:12', 'asetiobudi@ciputra.com', '2021-11-25 04:58:12', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00004', 'DM.1.000005', 2, 0, '2021-11-25 04:58:12', 'asetiobudi@ciputra.com', '2021-11-25 04:58:12', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00005', 'DM.1.000009', 1, 0, '2021-11-26 13:02:12', 'janti@ciputra.com', '2021-11-26 13:02:12', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00005', 'DM.1.000010', 2, 0, '2021-11-26 13:02:12', 'janti@ciputra.com', '2021-11-26 13:02:12', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00005', 'DM.1.000011', 3, 0, '2021-11-26 13:02:12', 'janti@ciputra.com', '2021-11-26 13:02:12', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00005', 'DM.1.000012', 4, 0, '2021-11-26 13:02:12', 'janti@ciputra.com', '2021-11-26 13:02:12', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00006', 'DM.1.000023', 1, 0, '2021-11-29 04:31:35', 'admin@mail.com', '2021-11-29 04:31:35', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00006', 'DM.1.000024', 2, 0, '2021-11-29 04:31:35', 'admin@mail.com', '2021-11-29 04:31:35', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00006', 'DM.1.000025', 3, 0, '2021-11-29 04:31:35', 'admin@mail.com', '2021-11-29 04:31:35', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00006', 'DM.1.000026', 4, 0, '2021-11-29 04:31:35', 'admin@mail.com', '2021-11-29 04:31:35', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00006', 'DM.1.000027', 5, 0, '2021-11-29 04:31:35', 'admin@mail.com', '2021-11-29 04:31:35', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00006', 'DM.1.000028', 6, 0, '2021-11-29 04:31:35', 'admin@mail.com', '2021-11-29 04:31:35', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00006', 'DM.1.000029', 7, 0, '2021-11-29 04:31:35', 'admin@mail.com', '2021-11-29 04:31:35', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00006', 'DM.1.000030', 8, 0, '2021-11-29 04:31:35', 'admin@mail.com', '2021-11-29 04:31:35', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00006', 'DM.1.000031', 9, 0, '2021-11-29 04:31:35', 'admin@mail.com', '2021-11-29 04:31:35', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00006', 'DM.1.000032', 10, 0, '2021-11-29 04:31:35', 'admin@mail.com', '2021-11-29 04:31:35', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00007', 'DM.1.000023', 1, 0, '2021-11-29 07:36:23', 'admin@mail.com', '2021-11-29 07:36:23', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00007', 'DM.1.000024', 2, 0, '2021-11-29 07:36:23', 'admin@mail.com', '2021-11-29 07:36:23', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00007', 'DM.1.000025', 3, 0, '2021-11-29 07:36:23', 'admin@mail.com', '2021-11-29 07:36:23', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00007', 'DM.1.000026', 4, 0, '2021-11-29 07:36:23', 'admin@mail.com', '2021-11-29 07:36:23', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00007', 'DM.1.000027', 5, 0, '2021-11-29 07:36:23', 'admin@mail.com', '2021-11-29 07:36:23', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00007', 'DM.1.000028', 6, 0, '2021-11-29 07:36:23', 'admin@mail.com', '2021-11-29 07:36:23', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00007', 'DM.1.000029', 7, 0, '2021-11-29 07:36:23', 'admin@mail.com', '2021-11-29 07:36:23', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00007', 'DM.1.000030', 8, 0, '2021-11-29 07:36:23', 'admin@mail.com', '2021-11-29 07:36:23', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00007', 'DM.1.000031', 9, 0, '2021-11-29 07:36:23', 'admin@mail.com', '2021-11-29 07:36:23', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00007', 'DM.1.000032', 10, 0, '2021-11-29 07:36:23', 'admin@mail.com', '2021-11-29 07:36:23', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00008', 'DM.1.000041', 1, 0, '2021-11-30 02:34:13', 'admin@mail.com', '2021-11-30 02:34:13', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00008', 'DM.1.000042', 2, 0, '2021-11-30 02:34:13', 'admin@mail.com', '2021-11-30 02:34:13', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00008', 'DM.1.000043', 3, 0, '2021-11-30 02:34:13', 'admin@mail.com', '2021-11-30 02:34:13', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00008', 'DM.1.000044', 4, 0, '2021-11-30 02:34:13', 'admin@mail.com', '2021-11-30 02:34:13', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00008', 'DM.1.000045', 5, 0, '2021-11-30 02:34:13', 'admin@mail.com', '2021-11-30 02:34:13', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00008', 'DM.1.000046', 6, 0, '2021-11-30 02:34:13', 'admin@mail.com', '2021-11-30 02:34:13', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00008', 'DM.1.000047', 7, 0, '2021-11-30 02:34:13', 'admin@mail.com', '2021-11-30 02:34:13', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00008', 'DM.1.000048', 8, 0, '2021-11-30 02:34:13', 'admin@mail.com', '2021-11-30 02:34:13', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00008', 'DM.1.000049', 9, 0, '2021-11-30 02:34:13', 'admin@mail.com', '2021-11-30 02:34:13', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00008', 'DM.1.000050', 10, 0, '2021-11-30 02:34:13', 'admin@mail.com', '2021-11-30 02:34:13', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00012', 'DM.1.000041', 1, 0, '2021-11-30 02:28:06', 'admin@mail.com', '2021-11-30 02:28:06', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00012', 'DM.1.000042', 2, 0, '2021-11-30 02:28:06', 'admin@mail.com', '2021-11-30 02:28:06', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00012', 'DM.1.000043', 3, 0, '2021-11-30 02:28:06', 'admin@mail.com', '2021-11-30 02:28:06', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00012', 'DM.1.000044', 4, 0, '2021-11-30 02:28:06', 'admin@mail.com', '2021-11-30 02:28:06', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00012', 'DM.1.000045', 5, 0, '2021-11-30 02:28:06', 'admin@mail.com', '2021-11-30 02:28:06', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00012', 'DM.1.000046', 6, 0, '2021-11-30 02:28:06', 'admin@mail.com', '2021-11-30 02:28:06', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00012', 'DM.1.000047', 7, 0, '2021-11-30 02:28:06', 'admin@mail.com', '2021-11-30 02:28:06', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00012', 'DM.1.000048', 8, 0, '2021-11-30 02:28:06', 'admin@mail.com', '2021-11-30 02:28:06', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00012', 'DM.1.000049', 9, 0, '2021-11-30 02:28:06', 'admin@mail.com', '2021-11-30 02:28:06', NULL);
INSERT INTO `m_jadwal_mahasiswa` VALUES ('BS.1.00012', 'DM.1.000050', 10, 0, '2021-11-30 02:28:21', 'admin@mail.com', '2021-11-30 02:28:21', NULL);
COMMIT;

-- ----------------------------
-- Table structure for m_mata_kuliah
-- ----------------------------
DROP TABLE IF EXISTS `m_mata_kuliah`;
CREATE TABLE `m_mata_kuliah` (
  `mata_kuliah_id` varchar(50) NOT NULL,
  `mata_kuliah_name` varchar(255) DEFAULT NULL,
  `bidang_studi_id` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT 0,
  `dt_record` timestamp NULL DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mata_kuliah_id`) USING BTREE,
  KEY `bidang_studi_id` (`bidang_studi_id`) USING BTREE,
  CONSTRAINT `m_mata_kuliah_ibfk_1` FOREIGN KEY (`bidang_studi_id`) REFERENCES `m_bidang_studi` (`bidang_studi_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_mata_kuliah
-- ----------------------------
BEGIN;
INSERT INTO `m_mata_kuliah` VALUES ('1', 'The World of Accounting', '1', 0, NULL, NULL, '2021-12-06 02:19:08', NULL);
INSERT INTO `m_mata_kuliah` VALUES ('10', 'Bahasa Indonesia\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('100', 'Statistics for Business', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('101', 'Becoming Indonesia', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('102', 'Elective Course of Cluster 1-Exploring Entrepreneurship', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('103', 'Elective Course of Cluster 1-Family Business', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('104', 'Export Import Management', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('105', 'Entrepreneurial Innovation for Sustainability', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('106', 'Organisational Behaviour', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('107', 'Elective Course of Cluster 2-Entrepreneurial Financem', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('108', 'Elective Course of Cluster 3-Global Marketing Strategy,', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('109', 'Marketing Research & Strategy', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('11', 'Management Information System\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('110', 'Business Growth', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('111', 'Risk & Investment Management', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('112', 'Research Methodology', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('113', 'Religion', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('114', 'International Corporate Strategy', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('115', 'Integrated Real Business Practice (Internship)', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('116', 'Management Information System', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('117', 'Service Management', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('118', 'Strategic Management', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('119', 'Business Insight and Ethics on Community', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('12', 'Business Law\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('120', 'Cross Culture Management', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('121', 'Final Project', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('122', 'Applied Photography', '6', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('123', 'Film Production', '6', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('124', 'Graphic on Product', '6', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('125', 'Packaging', '6', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('126', 'Basic Illustration', '6', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('127', 'Advertising and Media', '6', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('128', 'Creative Writing', '6', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('129', '3D Modeling', '6', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('13', 'Intermediate Single Entity Accounting\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('130', 'Entrepreneurship 1', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('131', 'Entrepreneurial Interior Architecture Studio 1', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('132', 'Technology for Interior Architecture 1', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('133', 'Interior Architecture Communication and Presentation 1', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('134', 'History and Theory of Interior Architecture 1', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('135', 'Basic Natural Science', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('136', 'Entrepreneurship 2', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('137', 'Entrepreneurial Interior Architecture Studio 2', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('138', 'Technology for Interior Architecture 2', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('139', 'Interior Architecture Communication and Presentation 2', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('14', 'Investment Management', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('140', 'History and Theory of Interior Architecture 2', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('141', 'Basic Cultural Social Science', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('142', 'Entrepreneurship 3', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('143', 'Entrepreneurial Interior Architecture Studio 3', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('144', 'Entrepreneurial Interior Architecture Product Studio 1', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('145', 'Technology for Interior Architecture 3', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('146', 'Interior Architecture Communication and Presentation 3', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('147', 'Pancasila', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('148', 'Entrepreneurship 4', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('149', 'Entrepreneurial Interior Architecture Studio 4', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('15', 'Budgeting', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('150', 'Entrepreneurial Interior Architecture Product Studio 4', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('151', 'Technology for Interior Architecture 4', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('152', 'Citizenship', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('153', 'Entrepreneurship 5', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('154', 'Entrepreneurial Interior Architecture Studio 5', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('155', 'Entrepreneurial Interior Architecture Product Studio 3', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('156', 'Technology for Interior Architecture 5', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('157', 'Religion', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('158', 'Value Creation for Entrepreneurial Interior Architecture 1', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('159', 'Entrepreneurial Interior Architecture Studio 6', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('16', 'Pancasila', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('160', 'Technology for Interior Architecture 6', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('161', 'Ethics and Project Management for Entrepreneurial Interior Architecture', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('162', 'Entrepreneurial Interior Architecture Research Methods', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('163', 'Bahasa Indonesia', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('164', 'Value Creation for Entrepreneurial Interior Architecture 2', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('165', 'Apprentice for Entrepreneurial Interior Architecture', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('166', 'Entrepreneurial Interior Architecture Research Project', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('167', 'Entrepreneurial Interior Architecture Final Studio', '7', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('168', 'Fashion Textile and Material 1', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('169', 'Basic Fashion Design 1', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('17', 'Accounting Information System\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('170', 'Fashion Production 1', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('171', 'Art and Culture', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('172', 'Fashion Textile and material II', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('173', 'Basic Fashion Design II', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('174', 'Fashion and Society', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('175', 'Fashion Industry Practices', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('176', 'Fashion textile and material III', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('177', 'Fashion Product Design 1', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('178', 'Fashion Production III', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('179', 'Fashion Trend Analysis', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('18', 'Strategic Management', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('180', 'Fashion Product Design II', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('181', 'Fashion Production IV: CAD', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('182', 'Fashion Communication', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('183', 'Fashion Product Design III', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('184', 'Fashion Production V', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('185', 'Design Appreciation', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('186', 'Fashion Industry Practices 2', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('187', 'Fashion Product Design IV', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('188', 'Fashion Production VI', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('189', 'Research Methodology', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('19', 'Corporate Group Accounting', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('190', 'Fashion Industry Placement', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('191', 'Fashion Textile & Material IV', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('192', 'Fashion Product Design V', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('193', 'Portfolio', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('194', 'Final Project', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('195', 'Entrepreneurship Essentials', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('196', 'Bahasa Indonesia', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('197', 'Civics', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('198', 'Agama', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('199', 'Pancasila', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('2', 'Business Mathematics\nBusiness Mathematics\nBusiness Mathematics\nBusiness Mathematics\nBusiness Mathematics\nBusiness Mathematics\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('20', 'Tax law\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('200', 'Ethics', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('201', 'Fashion Accessories', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('202', 'Decorative Techniques for Garment', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('203', 'Eco Printing & Natural Dyeing', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('204', 'National Culture and Literature', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('205', 'Fashion & Sustainability', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('206', 'Digital Fashion Illustration', '8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('207', 'Service Management', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('208', 'Hospitality Business 1', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('209', 'Tourism & Hospitality Business', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('21', 'Strategic Management Accounting\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('210', 'National Tourism Geography', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('211', 'Cross Culture Understanding', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('212', 'Basic Natural Science', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('213', 'Entrepreneurship 1', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('214', 'Hospitality & Food Service Business', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('215', 'Tourism Business Policy', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('216', 'Hospitality Branding', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('217', 'Hospitality Business Communication', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('218', 'Hospitality Business 2', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('219', 'Basic Social & Cultural Science', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('22', 'Auditing Theory', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('220', 'Entrepreneurship 2', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('221', 'Hospitality Business Operations', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('222', 'Basic Hospitality Innovation', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('223', 'Hospitality Information Management Systems', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('224', 'Leisure Business', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('225', 'International Tourism Geography', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('226', 'Entrepreneurship 3', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('227', 'MICE Business', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('228', 'Hospitality Marketing Management', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('229', 'Advanced Hospitality Innovation', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('23', 'Becoming Indonesia\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('230', 'Elective Cross Department Subject', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('231', 'Entrepreneurship 4', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('232', 'International Field Trip Management', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('233', 'Room Division Management', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('234', 'Hospitality Facilities Management & Design', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('235', 'Cargo & Shipping Business', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('236', 'Innovative Travel Agent Management', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('237', 'Entrepreneurship 5', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('238', 'Hospitality Business Plan & Feasibility Study', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('239', 'Research Methodology', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('24', 'Advance Corporate Group Accounting', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('240', 'Business Franchising', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('241', 'Airlines & Cruise Business', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('242', 'Human Resource Management', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('243', 'Internship', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('244', 'Travel Writing Business', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('245', 'Business Ethics', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('246', 'Final Project', '9', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('247', 'Entrepreneurship 1', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('248', 'Tourism Subjects', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('249', 'Hospitality Enterprise 1 (Pastry & Beverage)', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('25', 'Taxation', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('250', 'Entrepreneurship 2', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('251', 'Tourism Subjects', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('252', 'Hospitality Enterprise 2 (Service & Cooking)', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('253', 'Entrepreneruship 3', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('254', 'Business Subjects', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('255', 'Basic Hospitality Innovation (Local Cuisine)', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('256', 'Entrepreneurship 4', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('257', 'Business Subjects', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('258', 'Advanced Hospitality Innovation (International Cuisine)', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('259', 'Entrepreneurship 5', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('26', 'Public Sector Accounting\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('260', 'Beverage Art', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('261', 'Cuisine Art', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('262', 'Pastry Art', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('263', 'F&B Venture Creation', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('264', 'F&B Management', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('265', 'Healthy Subjects', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('266', 'Internship-Running Business & Industrial Placement', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('267', 'Final Project', '10', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('268', 'Basic Food Biology', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('269', 'Basic Food Chemistry', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('27', 'Auditing Practice\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('270', 'Basic Food Physics and Physical Chemistry', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('271', 'Food Materials Science', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('272', 'Analytical Chemistry in Food Science', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('273', 'Basic Biochemistry for Food Science', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('274', 'Basic Microbiology for Food Science', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('275', 'Food Processing and Preservation', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('276', 'Postharvest Physiology and Technology', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('277', 'Food Chemistry and Biochemistry', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('278', 'Food Management', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('279', 'Food Microbiology', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('28', 'Statistics', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('280', 'Operation Unit', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('281', 'Sensory Analysis', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('282', 'Food Analysis', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('283', 'Food Engineering', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('284', 'Food Ingredients and Additives', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('285', 'Food Packaging and Shelf Life', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('286', 'Research Methodology', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('287', 'Public Health and Nutritional Assessment', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('288', 'Food Quality and Waste Management', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('289', 'Food Biotechnology', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('29', 'Financial Statement Analysis\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('290', 'Food Ethics, Legislation and Politics', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('291', 'Socio Food Implementation', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('292', 'Food Industry Work & Experience', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('293', 'Food Plant Design & Plant Management', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('294', 'Preliminary Research', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('295', 'International Journal Writing', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('296', 'Bachelor Thesis', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('297', 'Entrepreneurship Essentials', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('298', 'Bahasa Indonesia', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('299', 'Civics', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('3', 'Management', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('30', 'Research Methodology\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('300', 'Pancasila', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('301', 'Becoming Indonesian', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('302', 'Religion', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('303', 'Technology of Fish & Animal Processing', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('304', 'Technology of Plant Processing', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('305', 'Technology of Herbs Spices and Stimulants', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('306', 'Technology of Fermentation', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('307', 'Functional Foods', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('308', 'Technology of Edible Fats and Oils', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('309', 'Technology of Water and Beverage', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('31', 'Internal audit', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('310', 'Flour and Bakery Technology', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('311', 'Technology of Sugar and Confectionary', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('312', 'Snack Food', '11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('313', 'Entrepreneurship Essentials', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('314', 'Algorithm and Programming', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('315', 'Introduction to ICT', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('316', 'Operating System', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('317', 'Bahasa Indonesia', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('318', 'Web Programming', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('319', 'Programming Techniques', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('32', 'Religion', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('320', 'Multimedia', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('321', 'Basic Mathematics', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('322', 'Civics', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('323', 'Web Development', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('324', 'Mobile Apps Development', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('325', 'Databases', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('326', 'Discrete Mathematics', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('327', 'Game Design', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('328', 'Becoming Indonesian', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('329', 'Computer Networks', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('33', 'Accounting Theory\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('330', 'Advanced Mobile Apps Development', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('331', 'Internet of Things', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('332', 'Artificial Intelligence', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('333', 'Pancasila', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('334', 'Statistics and Probability', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('335', 'Technopreneurship Product Development', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('336', 'Big Data', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('337', 'Religion', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('338', 'Academic Writing for Informatics', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('339', 'Research Methodology', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('34', 'Digital Business and Intelligence', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('340', 'Advanced Technopreneurship Product Development', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('341', 'Computer Graphics', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('342', 'Internship', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('343', 'Internship Product Development', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('344', 'Applied Ethics', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('345', 'Final Project', '12', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('346', 'Algorithms and Programming Languages', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('347', 'Information Systems Concept', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('348', 'Behavior in Organizations', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('349', 'Applied mathematics', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('35', 'Management Control System\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('350', 'E-Businees and Digital Customer Relationship Management', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('351', 'Application Development', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('352', 'Database Design', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('353', 'ERP system', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('354', 'Operating Systems & Cloud Computing', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('355', 'Web Development & UX Design', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('356', 'Statistics For Business', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('357', 'Database Implementation', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('358', 'Data Science for Business Analytics', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('359', 'System Design and Analysis', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('36', 'Final Project ', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('360', 'Data Warehousing', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('361', 'Business Data Communications', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('362', 'Data Driven Entrepreneurship', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('363', 'Data & Web Mining', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('364', 'Research methodology', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('365', 'Business Intelligence', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('366', 'Big Data Analytics & Decision Support Systems', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('367', 'Practical Work: Professional Development', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('368', 'Job Training: Technical Development', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('369', 'Information Systems Strategic Design', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('37', 'Professional Ethics\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('370', 'Thesis', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('371', 'Entrepreneurship Essentials', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('372', 'Citizenship', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('373', 'Indonesia', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('374', 'Pancasila', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('375', 'Become Indonesia', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('376', 'Religion', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('377', 'Professional ethics', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('378', 'IT Service Management', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('379', 'IT Governance and Audit', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('38', 'Internship', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('380', 'Managerial Skills', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('381', 'Social Media Mining', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('382', 'Mobile Computing', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('383', 'Database Administrator', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('384', 'Software engineering', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('385', 'IT Security and Risk Management', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('386', 'System Implementation and Trial', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('387', 'Supply Chain Management', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('388', 'Advanced Programming', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('389', 'Introduction of accounting', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('39', 'Pancasila', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('390', 'Accounting information system', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('391', 'Engineering Data', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('392', 'Natural Language Processing', '13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('393', 'Pancasila', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('394', 'Primary Health Care Management I (MPKP I)', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('395', 'Social Innovator I', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('396', 'Biomedical Block 1 & learning strategies', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('397', 'Biomedical Block 2', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('398', 'Biomedical Block 3', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('399', 'Civics', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('4', 'Civics', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('40', 'Entrepreneurship Essentials\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('400', 'Social Innovator II', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('401', 'MPKP II', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('402', 'Biomedical Block 4', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('403', 'Biomedical Block 5', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('404', 'Biomedical Block 6', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('405', 'Biomedical Block 7', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('406', 'Religion', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('407', 'Social Innovator III', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('408', 'MPKP III', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('409', 'Introduction Block to Diagnosis & Therapy', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('41', 'Business Management\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('410', 'Digestivus Block', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('411', 'Endocrine, Metabolism, and Nutrition Blocks', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('412', 'Social Innovator IV', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('413', 'MPKP IV', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('414', 'Respiratory Block', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('415', 'Cardiovascular Block', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('416', 'Musculoskeletal block', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('417', 'Sensing Block', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('418', 'Medical Ethics and Humanities', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('419', 'Social Innovator V', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('42', 'Principles of Accounting\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('420', 'MPKP V', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('421', 'Hematoimmunology Block', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('422', 'Urogenital Block', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('423', 'Tropical Disease Block', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('424', 'Bahasa Indonesia', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('425', 'Research Methodology & Biostatistics', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('426', 'Reproductive Block', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('427', 'Child Health Block', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('428', 'Integument Block', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('429', 'Inter-Professional Education', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('43', 'Business Inspiring and Communication', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('430', 'Final Project 1', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('431', 'Nerve Block', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('432', 'Psychiatric Block', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('433', 'Geriatric and Palliative Blocks', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('434', 'Preventive & Community Medicine Blocks', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('435', 'Final Project 2', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('436', 'Judiciary & Medicolegal Medicine Blocks', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('437', 'Emergency department (surgical-medical-pediatric)', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('438', 'Anesthesiology & Reanimation Block', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('439', 'Medical Pharmacy Block', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('44', 'Economics for Business\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('440', 'Internal Medicine', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('441', 'Children’s Health Sciences', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('442', 'Neurology', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('443', 'Mental Health Sciences', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('444', 'Radiology', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('445', 'Ophthalmology', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('446', 'Skin & Sex Disease', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('447', 'Obstetrics & gynecology', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('448', 'Surgery', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('449', 'Medicine & justice', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('45', 'Entrepreneurial Venture Creation', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('450', 'ENT', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('451', 'Physical medicine & medical rehabilitation', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('452', 'Public Health Sciences', '14', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('453', 'Entrepreneurship 1', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('454', 'Basic Social and Cultural Sciences', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('455', 'English', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('456', 'Principals of Social Sciences', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('457', 'Introduction to Communication Sciences', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('458', 'Sociological Theories', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('459', 'Entrepreneurship 2', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('46', 'Financial Management', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('460', 'Basic Natural Sciences', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('461', 'Theories and Models of Communication', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('462', 'Organizational Communication', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('463', 'Interpersonal and Group Communication', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('464', 'Mass Communication', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('465', 'Entrepreneurship 3', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('466', 'Citizenship', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('467', 'Introduction to Broadcasting', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('468', 'Introduction to Marketing Management', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('469', 'News Media and Society', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('47', 'Bahasa Indonesia\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('470', 'Creativity and Innovation', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('471', 'Entrepreneurship 4', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('472', 'Pancasila', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('473', 'Integrated Marketing Communication', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('474', 'Media Business Management', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('475', 'Newscasting and Announcing', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('476', 'Creative Message Production', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('477', 'Research Methodology and Statistics', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('478', 'Entrepreneurship 5', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('479', 'Bahasa Indonesia', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('48', 'International Business\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('480', 'Intercultural Communication', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('481', 'Broadcasting Programming', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('482', 'Event management and sponsorship', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('483', 'Photography and Editing', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('484', 'Public Speaking', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('485', 'Entrepreneurship 6', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('486', 'Religion', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('487', 'Cinematography', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('488', 'News Production', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('489', 'Social Marketing Communication', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('49', 'Marketing Management', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('490', 'Research Methodology for Communication', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('491', 'Entrepreneurship 7', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('492', 'Customer Retention Marketing', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('493', 'Communication and Multimedia Technology', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('494', 'Communication Ethics', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('495', 'Internship', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('496', 'Thesis', '15', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('497', 'Mental Process and Biopsychology', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('498', 'Psychology of Personality', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('499', 'Developmental psychology', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('5', 'Economics for Business\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('50', 'Entrepreneurial Venture Execution\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('500', 'Bahasa Indonesia', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('501', 'Entrepreneurship Essentials', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('502', 'Personal and Career Development', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('503', 'Psychology Ethics', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('504', 'Observation and Interview', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('505', 'Social Psychology', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('506', 'Civics', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('507', 'Marriage and Family Psychology', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('508', 'Quantitative Research Methodology', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('509', 'Personality Assessment 1', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('51', 'Cost Management', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('510', 'Counseling Psychology and Psychotherapy', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('511', 'Psychoeducation Innovations and Behavior Modifications', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('512', 'Becoming Indonesian', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('513', 'Educational Psychology', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('514', 'Experimental Psychology', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('515', 'Individual Cognitive Assessment', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('516', 'Innovation Training and Development', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('517', 'Pancasila', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('518', 'Work Psychology and Entrepreneurship;', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('519', 'Construction of Measuring Instrument', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('52', 'Human Capital Management\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('520', 'Classical Cognitive Assessment', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('521', 'Innovation in Environmental Psychology and Ergonomics', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('522', 'Religion', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('523', 'Psychopathology and Abnormalities', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('524', 'Qualitative Research Methodology', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('525', 'Personality Assessment 2', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('526', 'Social Intervention Innovations', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('527', 'Internship 1: On-The-Job Training', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('528', 'Internship 2: Psychological Innovation in Practice', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('529', 'Thesis', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('53', 'Operational Management', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('530', 'Sexual Psychology', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('531', 'Forensic Psychology', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('532', 'Human Capital Management', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('533', 'Psychology of Children with Special Needs', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('534', 'School Guidance and Counseling', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('535', 'Consumer Psychology', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('536', 'Positive Psychology', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('537', 'Dating & Violence', '16', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('538', 'Entrepreneurship Essentials', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('539', 'Social Innovation', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('54', 'Civics', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('540', 'Entrepreneurship Cluster', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('541', 'Corporate Entrepreneurship Essentials', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('542', 'Corporate Entrepreneurship Innovation', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('543', 'Corporate Entrepreneurship Implementation', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('544', 'Organizing Thematic Performance', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('545', 'Event Management and Sponsorship', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('546', 'Financial Aspect in Art-Sport Performance', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('547', 'Optimizing Social Media', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('548', 'Utilizing E-Commerce', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('549', 'Marketing Analytic', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('55', 'Consumer Behavior\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('550', 'Entrepreneurship Global Innovation', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('551', 'Entrepreneurship Innovation Implementation', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('552', 'Entrepreneurship Scale-Up', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('553', 'Digital Imaging', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('554', 'Graphic Design', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('555', 'Illustration', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('556', 'Lifestyle (Gaya Hidup Sehat)', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('557', 'Wellness (Keseimbangan Hidup)', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('558', 'Leisure (Relaksasi)', '17', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('56', 'Entrepreneurial Innovation\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('57', 'Budgeting', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('58', 'Statistics for Business\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('59', 'Becoming Indonesian\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('6', 'Entrepreneurship Essentials', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('60', 'Exploring Entrepreneurship ', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('61', 'Managing Art & Sport Project\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('62', 'Export-Import Management\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('63', 'Entrepreneurial Innovation for Sustainability\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('64', 'Organizational Behavior\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('65', 'Entrepreneurial Finance', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('66', 'Art and Sport Legal Regulations\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('67', 'Global Marketing Strategy ', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('68', 'Introduction to Art and Sport Business\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('69', 'Marketing Research & Strategy', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('7', 'Single Entity Accounting\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('70', 'Business Growth\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('71', 'Risk & Investment Management\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('72', 'Research Methodology\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('73', 'Religion', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('74', 'International Corporate Strategy\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('75', 'Integrated Real Business Practice (Internship)\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('76', 'Management Information System\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('77', 'Service Management\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('78', 'Strategic Management\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('79', 'Business Insight and Ethics on Community\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('8', 'Corporate Finance\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('80', 'Cross-Culture Management\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('81', 'Final Project\n\n', '2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('82', 'Civics', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('83', 'Entrepreneurship Essentials', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('84', 'Business Management', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('85', 'Principles of Accounting', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('86', 'Business Inspiring and Communication', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('87', 'Economics for Business', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('88', 'Entrepreneurial Venture Creation', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('89', 'Financial Management', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('9', 'Cost Accounting\n', '1', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('90', 'Indonesian Language', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('91', 'International Business', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('92', 'Marketing Management', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('93', 'Entrepreneurial Venture Execution', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('94', 'Cost Management', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('95', 'Human Capital Management', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('96', 'Operation Management', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('97', 'Pancasila', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('98', 'Consumer Behaviour', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('99', 'Budgeting', '3', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_mata_kuliah` VALUES ('MK.1.00001', 'tessss 123', 'BS.1.00002', 0, '2021-11-07 14:28:36', 'admin@mail.com', '2021-11-07 14:56:21', NULL);
INSERT INTO `m_mata_kuliah` VALUES ('MK.1.00002', 'test12333', 'BS.1.00002', 0, '2021-11-23 15:06:17', 'asetiobudi@ciputra.com', '2021-11-23 15:06:17', NULL);
INSERT INTO `m_mata_kuliah` VALUES ('MK.1.00003', 'Bahasa Pemrograman', 'BS.1.00006', 0, '2021-11-26 10:02:14', 'admin@mail.com', '2021-11-26 10:02:14', NULL);
INSERT INTO `m_mata_kuliah` VALUES ('MK.1.00004', 'Tes Mata Kuliah', 'BS.1.00007', 0, '2021-11-29 04:04:10', 'admin@mail.com', '2021-11-29 08:18:12', NULL);
COMMIT;

-- ----------------------------
-- Table structure for m_module
-- ----------------------------
DROP TABLE IF EXISTS `m_module`;
CREATE TABLE `m_module` (
  `module_id` varchar(50) NOT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `parent_id` varchar(50) DEFAULT NULL,
  `sub_parent` varchar(100) DEFAULT NULL,
  `module_routes` varchar(100) NOT NULL,
  `notes` text DEFAULT NULL,
  `icon_class` varchar(100) DEFAULT NULL,
  `module_sequence` int(11) DEFAULT NULL,
  `dt_record` datetime DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` datetime DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  `is_visible` bit(1) DEFAULT b'1',
  PRIMARY KEY (`module_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_module
-- ----------------------------
BEGIN;
INSERT INTO `m_module` VALUES ('M00', 'Master', NULL, NULL, ' ', 'Master', 'c-teal-500 ti-view-list-alt', NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('M01', 'Universitas', 'M00', NULL, 'universitasShow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('M02', 'Fakultas', 'M00', NULL, 'fakultasShow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('M03', 'Program Studi', 'M00', NULL, 'programStudiShow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('M04', 'Mata Kuliah', 'M00', NULL, 'mataKuliahShow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('M05', 'Dosen', 'M00', NULL, 'dosenShow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('M06', 'Mahasiswa', 'M00', NULL, 'mahasiswaShow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('M07', 'Semester', 'M00', NULL, 'semesterShow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('M08', 'Jadwal Kuliah', 'M00', NULL, 'jadwalKuliahShow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('M09', 'Assessment', 'M00', NULL, 'assessmentShow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('P00', 'Penilaian', NULL, NULL, ' ', 'Penilaian', 'c-teal-500 ti-pencil', NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('P01', 'Penilaian Assessment', 'P00', NULL, 'penilaianAssessmentShow', 'Penilaian', NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('R00', 'Report', NULL, NULL, ' ', 'Report', 'c-teal-500 ti-files', NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('R01', 'Global Report', 'R00', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('R02', 'Assessment Report', 'R00', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('R03', 'Detail Report', 'R00', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('U00', 'User Management', NULL, NULL, ' ', 'User Management', 'c-teal-500 ti-share', NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('U01', 'Role', 'U00', NULL, 'roleShow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `m_module` VALUES ('U02', 'User', 'U00', NULL, 'userShow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
COMMIT;

-- ----------------------------
-- Table structure for m_module_function
-- ----------------------------
DROP TABLE IF EXISTS `m_module_function`;
CREATE TABLE `m_module_function` (
  `module_function_id` varchar(50) NOT NULL,
  `module_id` varchar(50) DEFAULT NULL,
  `function_id` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `dt_record` datetime DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` datetime DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`module_function_id`) USING BTREE,
  KEY `module_id` (`module_id`) USING BTREE,
  KEY `function_id` (`function_id`) USING BTREE,
  CONSTRAINT `m_module_function_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `m_module` (`module_id`) ON UPDATE CASCADE,
  CONSTRAINT `m_module_function_ibfk_2` FOREIGN KEY (`function_id`) REFERENCES `m_function` (`function_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_module_function
-- ----------------------------
BEGIN;
INSERT INTO `m_module_function` VALUES ('M01.01', 'M01', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M01.02', 'M01', '02', 'Insert', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M01.03', 'M01', '03', 'Update', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M01.04', 'M01', '04', 'Void', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M02.01', 'M02', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M02.02', 'M02', '02', 'Insert', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M02.03', 'M02', '03', 'Update', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M02.04', 'M02', '04', 'Void', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M03.01', 'M03', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M03.02', 'M03', '02', 'Insert', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M03.03', 'M03', '03', 'Update', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M03.04', 'M03', '04', 'Void', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M04.01', 'M04', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M04.02', 'M04', '02', 'Insert', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M04.03', 'M04', '03', 'Update', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M04.04', 'M04', '04', 'Void', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M05.01', 'M05', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M05.02', 'M05', '02', 'Insert', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M05.03', 'M05', '03', 'Update', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M05.04', 'M05', '04', 'Void', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M06.01', 'M06', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M06.02', 'M06', '02', 'Insert', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M06.03', 'M06', '03', 'Update', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M06.04', 'M06', '04', 'Void', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M07.01', 'M07', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M07.02', 'M07', '02', 'Insert', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M07.03', 'M07', '03', 'Update', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M07.04', 'M07', '04', 'Void', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M08.01', 'M08', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M08.02', 'M08', '02', 'Insert', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M08.03', 'M08', '03', 'Update', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M08.04', 'M08', '04', 'Void', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M08.06', 'M08', '06', 'Add Peserta', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M09.01', 'M09', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M09.02', 'M09', '02', 'Insert', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M09.03', 'M09', '03', 'Update', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('M09.04', 'M09', '04', 'Void', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('P00.01', 'P00', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('P00.02', 'P00', '03', 'Update', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('P01.01', 'P01', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('P01.02', 'P01', '02', 'Insert', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('P01.03', 'P01', '03', 'Update', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('P01.04', 'P01', '04', 'Void', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('R01.01', 'R01', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('R01.07', 'R01', '07', 'Download', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('R02.01', 'R02', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('R03.01', 'R03', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('U01.01', 'U01', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('U01.02', 'U01', '02', 'Insert', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('U01.03', 'U01', '03', 'Update', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('U01.04', 'U01', '04', 'Void', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('U02.01', 'U02', '01', 'View', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('U02.02', 'U02', '02', 'Insert', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('U02.03', 'U02', '03', 'Update', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('U02.04', 'U02', '04', 'Void', NULL, NULL, NULL, NULL);
INSERT INTO `m_module_function` VALUES ('U02.05', 'U02', '05', 'Print', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for m_role
-- ----------------------------
DROP TABLE IF EXISTS `m_role`;
CREATE TABLE `m_role` (
  `role_id` varchar(255) NOT NULL,
  `role_name` varchar(255) DEFAULT '',
  `universitas_id` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `notes` text DEFAULT NULL,
  `dt_record` datetime DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` datetime DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  `is_admin` int(11) NOT NULL DEFAULT 0,
  `is_dosen` int(11) NOT NULL DEFAULT 0,
  `is_mahasiswa` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_role
-- ----------------------------
BEGIN;
INSERT INTO `m_role` VALUES ('RL.1.001', 'Admin', '1', 0, NULL, '2021-11-14 13:51:10', 'admin@mail.com', '2021-11-14 13:51:10', NULL, 1, 0, 0);
INSERT INTO `m_role` VALUES ('RL.1.002', 'Dosen', '1', 0, 'test', '2021-11-14 13:56:25', 'admin@mail.com', '2021-11-29 03:56:22', NULL, 0, 1, 0);
INSERT INTO `m_role` VALUES ('RL.1.003', 'Mahasiswa', '1', 0, NULL, '2021-11-24 10:00:19', 'asetiobudi@ciputra.com', '2021-11-29 03:56:58', NULL, 0, 0, 1);
INSERT INTO `m_role` VALUES ('RL.1.004', 'test', '1', 1, NULL, '2021-11-25 05:51:19', 'asetiobudi@ciputra.com', '2021-11-29 06:45:54', NULL, 1, 0, 0);
INSERT INTO `m_role` VALUES ('RL.1.005', 'tesr', '1', 1, 'asdasd', '2021-11-25 05:51:42', 'asetiobudi@ciputra.com', '2021-11-29 06:43:05', NULL, 1, 0, 0);
INSERT INTO `m_role` VALUES ('RL.1.006', 'Tes', '1', 1, NULL, '2021-11-26 09:43:07', 'admin@mail.com', '2021-11-30 03:11:57', NULL, 0, 0, 1);
INSERT INTO `m_role` VALUES ('RL.1.007', 'Head of Department', '1', 0, NULL, '2021-11-30 02:48:19', 'admin@mail.com', '2021-11-30 02:48:19', NULL, 0, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for m_role_access
-- ----------------------------
DROP TABLE IF EXISTS `m_role_access`;
CREATE TABLE `m_role_access` (
  `role_id` varchar(50) NOT NULL,
  `module_function_id` varchar(50) NOT NULL,
  `dt_record` datetime DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` datetime DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`,`module_function_id`) USING BTREE,
  KEY `module_function_id` (`module_function_id`) USING BTREE,
  CONSTRAINT `m_role_access_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `m_role` (`role_id`) ON UPDATE CASCADE,
  CONSTRAINT `m_role_access_ibfk_2` FOREIGN KEY (`module_function_id`) REFERENCES `m_module_function` (`module_function_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_role_access
-- ----------------------------
BEGIN;
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M01.01', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M01.02', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M01.03', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M01.04', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M02.01', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M02.02', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M02.03', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M02.04', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M03.01', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M03.02', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M03.03', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M03.04', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M04.01', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M04.02', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M04.03', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M04.04', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M05.01', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M05.02', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M05.03', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M05.04', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M06.01', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M06.02', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M06.03', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M06.04', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M07.01', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M07.02', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M07.03', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M07.04', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M08.01', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M08.02', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M08.03', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M08.04', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M08.06', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M09.01', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M09.02', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M09.03', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'M09.04', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'R01.01', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'R01.07', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'R02.01', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'R03.01', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'U01.01', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'U01.02', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'U01.03', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'U02.01', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'U02.02', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'U02.03', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'U02.04', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.001', 'U02.05', '2021-11-29 04:30:49', 'admin@mail.com', '2021-11-29 04:30:49', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.002', 'P01.01', '2021-11-29 03:56:22', 'admin@mail.com', '2021-11-29 03:56:22', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.002', 'P01.02', '2021-11-29 03:56:22', 'admin@mail.com', '2021-11-29 03:56:22', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.002', 'P01.03', '2021-11-29 03:56:22', 'admin@mail.com', '2021-11-29 03:56:22', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.002', 'P01.04', '2021-11-29 03:56:22', 'admin@mail.com', '2021-11-29 03:56:22', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.002', 'R01.01', '2021-11-29 03:56:22', 'admin@mail.com', '2021-11-29 03:56:22', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.002', 'R01.07', '2021-11-29 03:56:22', 'admin@mail.com', '2021-11-29 03:56:22', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.002', 'R02.01', '2021-11-29 03:56:22', 'admin@mail.com', '2021-11-29 03:56:22', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.002', 'R03.01', '2021-11-29 03:56:22', 'admin@mail.com', '2021-11-29 03:56:22', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.003', 'P01.01', '2021-11-29 03:56:58', 'admin@mail.com', '2021-11-29 03:56:58', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.003', 'P01.03', '2021-11-29 03:56:58', 'admin@mail.com', '2021-11-29 03:56:58', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.004', 'M01.01', '2021-11-29 06:44:44', 'admin@mail.com', '2021-11-29 06:44:44', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.004', 'M01.02', '2021-11-29 06:44:44', 'admin@mail.com', '2021-11-29 06:44:44', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.004', 'M01.03', '2021-11-29 06:44:44', 'admin@mail.com', '2021-11-29 06:44:44', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.004', 'M01.04', '2021-11-29 06:44:44', 'admin@mail.com', '2021-11-29 06:44:44', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.005', 'M01.01', '2021-11-25 05:51:58', 'asetiobudi@ciputra.com', '2021-11-25 05:51:58', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.005', 'M01.02', '2021-11-25 05:51:58', 'asetiobudi@ciputra.com', '2021-11-25 05:51:58', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.005', 'M01.03', '2021-11-25 05:51:58', 'asetiobudi@ciputra.com', '2021-11-25 05:51:58', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.005', 'M01.04', '2021-11-25 05:51:58', 'asetiobudi@ciputra.com', '2021-11-25 05:51:58', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.006', 'P01.01', '2021-11-30 03:11:39', 'admin@mail.com', '2021-11-30 03:11:39', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.006', 'P01.02', '2021-11-30 03:11:39', 'admin@mail.com', '2021-11-30 03:11:39', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.006', 'P01.03', '2021-11-30 03:11:39', 'admin@mail.com', '2021-11-30 03:11:39', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.006', 'P01.04', '2021-11-30 03:11:39', 'admin@mail.com', '2021-11-30 03:11:39', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.007', 'M02.01', '2021-11-30 02:48:19', 'admin@mail.com', '2021-11-30 02:48:19', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.007', 'M03.01', '2021-11-30 02:48:19', 'admin@mail.com', '2021-11-30 02:48:19', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.007', 'M04.01', '2021-11-30 02:48:19', 'admin@mail.com', '2021-11-30 02:48:19', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.007', 'M05.01', '2021-11-30 02:48:19', 'admin@mail.com', '2021-11-30 02:48:19', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.007', 'M06.01', '2021-11-30 02:48:19', 'admin@mail.com', '2021-11-30 02:48:19', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.007', 'M07.01', '2021-11-30 02:48:19', 'admin@mail.com', '2021-11-30 02:48:19', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.007', 'M08.01', '2021-11-30 02:48:19', 'admin@mail.com', '2021-11-30 02:48:19', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.007', 'M09.01', '2021-11-30 02:48:19', 'admin@mail.com', '2021-11-30 02:48:19', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.007', 'R01.01', '2021-11-30 02:48:19', 'admin@mail.com', '2021-11-30 02:48:19', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.007', 'R01.07', '2021-11-30 02:48:19', 'admin@mail.com', '2021-11-30 02:48:19', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.007', 'R02.01', '2021-11-30 02:48:19', 'admin@mail.com', '2021-11-30 02:48:19', NULL);
INSERT INTO `m_role_access` VALUES ('RL.1.007', 'R03.01', '2021-11-30 02:48:19', 'admin@mail.com', '2021-11-30 02:48:19', NULL);
COMMIT;

-- ----------------------------
-- Table structure for m_semester
-- ----------------------------
DROP TABLE IF EXISTS `m_semester`;
CREATE TABLE `m_semester` (
  `semester_id` varchar(50) NOT NULL,
  `semester_name` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT 0,
  `dt_record` timestamp NULL DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  `universitas_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`semester_id`) USING BTREE,
  KEY `m_semester_universitas_id_foreign` (`universitas_id`),
  CONSTRAINT `m_semester_universitas_id_foreign` FOREIGN KEY (`universitas_id`) REFERENCES `m_universitas` (`universitas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_semester
-- ----------------------------
BEGIN;
INSERT INTO `m_semester` VALUES ('1', 'Gasal 2021/2022', 0, NULL, NULL, NULL, NULL, '1');
INSERT INTO `m_semester` VALUES ('2', 'Genap 2021/2022', 1, NULL, NULL, '2021-11-29 04:23:35', NULL, '1');
INSERT INTO `m_semester` VALUES ('3', 'Gasal 2022/2023', 1, NULL, NULL, NULL, NULL, '1');
INSERT INTO `m_semester` VALUES ('4', 'Genap 2022/2023', 1, NULL, NULL, '2021-11-29 04:23:54', NULL, '1');
INSERT INTO `m_semester` VALUES ('SMR.1.0001', 'Gasal 2023/2024', 1, '2021-11-08 01:40:32', 'admin@mail.com', '2021-11-29 04:24:04', NULL, '1');
COMMIT;

-- ----------------------------
-- Table structure for m_universitas
-- ----------------------------
DROP TABLE IF EXISTS `m_universitas`;
CREATE TABLE `m_universitas` (
  `universitas_id` varchar(50) NOT NULL,
  `universitas_name` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT 0,
  `dt_record` timestamp NULL DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`universitas_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_universitas
-- ----------------------------
BEGIN;
INSERT INTO `m_universitas` VALUES ('1', 'Universitas Ciputra', 0, NULL, NULL, NULL, NULL);
INSERT INTO `m_universitas` VALUES ('UNV00001', 'Stikom123', 0, '2021-11-08 04:27:37', 'admin@mail.com', '2021-11-08 04:40:20', NULL);
INSERT INTO `m_universitas` VALUES ('UNV00002', 'test', 0, '2021-11-22 22:53:34', 'cwutami@ciputra.com', '2021-11-22 22:53:34', NULL);
INSERT INTO `m_universitas` VALUES ('UNV00003', 'test12345', 0, '2021-11-22 22:53:54', 'cwutami@ciputra.com', '2021-11-22 22:54:03', NULL);
COMMIT;

-- ----------------------------
-- Table structure for m_user
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user` (
  `user_id` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` int(255) DEFAULT NULL COMMENT '0 = dosen | 1 = mahasiswa | 2 = superadmin',
  `universitas_id` varchar(50) DEFAULT NULL,
  `is_locked` int(11) DEFAULT 0 COMMENT '0 = Not Locked | 1 = Locked \\\\ Note : Jika attempt 3 x gagal make user akan di lock',
  `notes` text DEFAULT NULL,
  `remember_token` text DEFAULT NULL,
  `dt_record` datetime DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` datetime DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `universitas_id` (`universitas_id`) USING BTREE,
  KEY `m_user_role_id_foreign` (`role_id`),
  CONSTRAINT `m_user_ibfk_1` FOREIGN KEY (`universitas_id`) REFERENCES `m_universitas` (`universitas_id`) ON UPDATE CASCADE,
  CONSTRAINT `m_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `m_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_user
-- ----------------------------
BEGIN;
INSERT INTO `m_user` VALUES ('admin@mail.com', '$2a$12$J870BmXjuXqpLfUgFbzrve3kFvxwKQOxKp1U4MDrqZqilG8jpsWR2', 2, '1', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'RL.1.001');
INSERT INTO `m_user` VALUES ('asetiobudi@ciputra.com', '$2a$12$J870BmXjuXqpLfUgFbzrve3kFvxwKQOxKp1U4MDrqZqilG8jpsWR2', 0, '1', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'RL.1.001');
INSERT INTO `m_user` VALUES ('bagas@ciputra.com', '$2y$10$q7THdKhy.CLa52bEInxWWOMJCjTctqFmDqPZNB3g7kcpwp5iQAiFq', 1, '1', 0, NULL, NULL, '2021-11-26 10:01:16', NULL, '2021-11-26 10:01:16', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('bagus@ciputra.com', '$2y$10$f3RrF5FgGZKdBdrwPI5aselfH78zwe/JtKszln/n3HNFwQ6/VmQ4y', 1, '1', 0, NULL, NULL, '2021-11-26 10:00:55', NULL, '2021-11-26 10:00:55', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('bagushendra@gmail.com', '$2y$10$dHJiqrJzYFnGjWTxjg1W7.SS382AsWMMXZqS4imq20E/SzdICLn3a', 2, '1', 0, NULL, NULL, '2021-11-15 02:09:12', NULL, '2021-11-15 02:09:12', NULL, 'RL.1.001');
INSERT INTO `m_user` VALUES ('bagushermawan@gmail.com', '$2y$10$8qi1z6h.CoLxX6D6twIbquu31WtmryM82gtFA.LCKC4qOyOLT6/wS', 0, '1', 0, NULL, NULL, '2021-11-24 13:44:29', NULL, '2021-11-24 13:44:29', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('bgs@mail.com', '$2y$10$p1arPwExfRYFRpK.tfg7l.5g08kK96KSoVMax6q4lXj3e1t70dD3e', 2, '1', 1, NULL, NULL, '2021-11-15 02:20:46', NULL, '2021-11-15 06:30:54', NULL, 'RL.1.001');
INSERT INTO `m_user` VALUES ('cclestari@ciputra.com', '$2y$10$rjHytpNnDUPdvNIkjh20qu6QPno7WHxVtgW2x0eT9hLzF/yE0C3vC', 0, '1', 0, NULL, NULL, '2021-11-30 02:00:46', NULL, '2021-11-30 02:00:46', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('cwutami@ciputra.com', '$2a$12$J870BmXjuXqpLfUgFbzrve3kFvxwKQOxKp1U4MDrqZqilG8jpsWR2', 0, '1', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'RL.1.001');
INSERT INTO `m_user` VALUES ('dmwonohadidjojo@ciputra.com', '$2y$10$yywGAhwpiNfsp7ZN62Qo2uovqBvI8n2VFtfRBrg.KP4wKHLqW1Nom', 0, '1', 0, NULL, NULL, '2021-11-30 01:59:54', NULL, '2021-11-30 01:59:54', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('dona@ciputra.com', '$2y$10$tdVrE2u3bSOn6j4Jy99JKO6ZzqM9QaW0LFAD4dZX9tLchBxiF5C5C', 1, '1', 0, NULL, NULL, '2021-11-26 09:59:13', NULL, '2021-11-26 09:59:13', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('febe@ciputra.com', '$2y$10$Cij.qPcEhIQYVoGrW48qjuvlmS0ymzYFrr/ljrsvJqWJV/iIYm55i', 0, '1', 0, NULL, NULL, '2021-11-26 09:56:44', NULL, '2021-11-26 09:56:44', NULL, 'RL.1.006');
INSERT INTO `m_user` VALUES ('genesys@gmail.com', '$2y$10$1oB3zen4TYZtIfOkWd2f1uS3WHgp7OIaF5JyWLGY1PehYSx6FnuwC', 2, '1', 0, NULL, NULL, '2021-11-29 07:11:01', NULL, '2021-11-29 07:11:01', NULL, 'RL.1.001');
INSERT INTO `m_user` VALUES ('hendrawanagus15@gmail.com', '$2y$10$SoygWMr45ax3J4wKny0Je.hrvEUh9v37oM2tCEAcxIh1iGLtN59g6', 1, '1', 0, NULL, NULL, '2021-11-08 13:35:39', NULL, '2021-11-08 13:35:39', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('hendrik@ciputra.com', '$2y$10$k9q3ae8TIP8fbLa3xAR/8.4PMHbWfqp2OznWzEHL9mriFi6A9WJOC', 1, '1', 0, NULL, NULL, '2021-11-26 10:01:42', NULL, '2021-11-26 10:01:42', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('janti@ciputra.com', '$2y$10$MTWmtruLDkpLr09ZKZh3LuKTQVNenUTVnwvT487Xrhqp4bojBf/pO', 0, '1', 0, NULL, NULL, '2021-11-26 09:47:35', NULL, '2021-11-26 09:47:35', NULL, 'RL.1.006');
INSERT INTO `m_user` VALUES ('laij@ciputra.com', '$2y$10$gMxu2740ntVcUohFeJGTxeON2gXoLvsyDIkvWSUIJsz6dCqhGagG.', 0, '1', 0, NULL, NULL, '2021-11-26 09:57:27', NULL, '2021-11-26 09:57:27', NULL, 'RL.1.006');
INSERT INTO `m_user` VALUES ('lmtjahjono@ciputra.com', '$2y$10$K.vJBNm9NXFDvWFsmKpWROUwM6s0MUKlNEYstHqy/CY7wb5bHZ7/y', 0, '1', 0, NULL, NULL, '2021-11-30 02:03:05', NULL, '2021-11-30 02:03:05', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('mahasiswa10@gmail.com', '$2y$10$UIBWPUBL58/ZDbK9842lKez8m..aR1e3I.9nd99MPyL2789TqWDhi', 1, '1', 0, NULL, NULL, '2021-11-30 02:08:41', NULL, '2021-11-30 02:08:41', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('mahasiswa1@gmail.com', '$2y$10$Xy7QJPac5xAV.44EXkYZK.M/Pw2frI82VKAKjtq2YcMqgXtI/tK6C', 1, '1', 0, NULL, NULL, '2021-11-30 02:05:51', NULL, '2021-11-30 02:05:51', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('mahasiswa2@gmail.com', '$2y$10$WibjSE7zVOJRglVmKDU3.u.rNwv2PKHphtYv3uW/ZwVSB05BVZ/66', 1, '1', 0, NULL, NULL, '2021-11-30 02:06:22', NULL, '2021-11-30 02:06:22', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('mahasiswa3@gmail.com', '$2y$10$/44K4WxrPaKL5Y2sY4W2X.pI7oHP2vmfB7kSgwazgfSztVlN3vLma', 1, '1', 0, NULL, NULL, '2021-11-30 02:06:45', NULL, '2021-11-30 02:06:45', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('mahasiswa4@gmail.com', '$2y$10$tNVeTnxb.UCTvL0Os5wBcOP7dOVLm0jhLUhDtlYPiVJoBlDbM8ZzK', 1, '1', 0, NULL, NULL, '2021-11-30 02:07:05', NULL, '2021-11-30 02:07:05', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('mahasiswa5@gmail.com', '$2y$10$BFrg1zrq5dK.tyCpzb/Wzu1Eo8dCtNaYynsl1zME3mxzPxO8X5/2m', 1, '1', 0, NULL, NULL, '2021-11-30 02:07:21', NULL, '2021-11-30 02:07:21', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('mahasiswa6@gmail.com', '$2y$10$GBRlafj2fB2N9FnH2A.Vk.0iLdTy/hpfIw0XqRFpNp3kFxB039SMK', 1, '1', 0, NULL, NULL, '2021-11-30 02:07:40', NULL, '2021-11-30 02:07:40', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('mahasiswa7@gmail.com', '$2y$10$pAbj2aeYeLRXIRrt488CZeNb32RR/4XYOr5nLUL7x9GuSdotsPMay', 1, '1', 0, NULL, NULL, '2021-11-30 02:07:55', NULL, '2021-11-30 02:07:55', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('mahasiswa8@gmail.com', '$2y$10$V0AlPbcev6Jm/YoD/rTWb.tqzvJuOK0amjiv72G0dY..CdRiBFtXK', 1, '1', 0, NULL, NULL, '2021-11-30 02:08:10', NULL, '2021-11-30 02:08:10', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('mahasiswa9@gmail.com', '$2y$10$nf5tbYbwJcbrhAT4vDbXi.M/R62tJAn5UzlhuRFOVshPBPAgR31A.', 1, '1', 0, NULL, NULL, '2021-11-30 02:08:26', NULL, '2021-11-30 02:08:26', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('mandra@gmail.com', '$2y$10$F2zNCErB.ME24BmIPea6.eztI4/cyaGK2/pjMwLDA7z58PBTFp3/2', 1, '1', 0, NULL, NULL, '2021-11-25 01:03:20', NULL, '2021-11-25 01:03:20', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('mmengel@ciputra.com', '$2y$10$P2KzXkWcKjskXxkd9CWY..0OiXsv69NikmykmjG77/xuJjmoeiR3e', 0, '1', 0, NULL, NULL, '2021-11-30 02:02:19', NULL, '2021-11-30 02:02:19', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('sewahyudi@ciputra.com', '$2y$10$ubKoxo24WzPj0j/3qCxtEe89IiBT5tIYWeOHpbedKR7DqKdKUL1H6', 0, '1', 0, NULL, NULL, '2021-11-30 01:57:50', NULL, '2021-11-30 01:57:50', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('tantonio@ciputra.com', '$2y$10$umvbS5YUsEaZVQFrYUwUseDi4F1JSE4F/kNfMMnAzRGDAZqOmiXqy', 0, '1', 0, NULL, NULL, '2021-11-30 02:04:21', NULL, '2021-11-30 02:04:21', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('tesdosen10@gmail.com', '$2y$10$gYNDWEUGfokl/F2abIx.meCKZDhIF21l0rPiA4s2W0yb3M8NlQo7G', 0, '1', 0, NULL, NULL, '2021-11-29 04:11:38', NULL, '2021-11-29 04:11:38', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('tesdosen1@gmail.com', '$2y$10$u6s.PZAYcO51T9hwu/bFyOWe7iKyKZvxJPNLUDvQOuyW9WAHUI0Ge', 0, '1', 0, NULL, NULL, '2021-11-29 04:07:44', NULL, '2021-11-29 08:10:07', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('tesdosen2@gmail.com', '$2y$10$JK2dip1wSumolbKKvwe.q.vc.6D4LFLrVfV9EZv2IjPb3sI9M.Bnu', 0, '1', 0, NULL, NULL, '2021-11-29 04:08:11', NULL, '2021-11-29 04:08:11', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('tesdosen3@gmail.com', '$2y$10$8tPP.Z629P5j9aTzCatceufFN6m2vQpBbAiP53Le98I48RCXlRaBK', 0, '1', 0, NULL, NULL, '2021-11-29 04:08:29', NULL, '2021-11-29 04:08:29', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('tesdosen4@gmail.com', '$2y$10$uNy9TkJmU5iGRugz5Y6.bez5I0f4nXVpY/UusD9TbGb.K/Y4PMbdC', 0, '1', 0, NULL, NULL, '2021-11-29 04:09:14', NULL, '2021-11-29 04:09:14', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('tesdosen5@gmail.com', '$2y$10$QqIWb2vFVZzHw2R6ls2c2u5sgsKLlLLEC1jmPYu2dBF7miC1GMTnu', 0, '1', 0, NULL, NULL, '2021-11-29 04:09:33', NULL, '2021-11-29 04:09:33', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('tesdosen6@gmail.com', '$2y$10$O2Ojfia42KGlWweU1yWESe0fWZk0Cfsa8AQYRmfZGipj7eXdSaGFS', 0, '1', 0, NULL, NULL, '2021-11-29 04:09:58', NULL, '2021-11-29 04:09:58', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('tesdosen7@gmail.com', '$2y$10$Wls16a.UnDkr374kYdzoce7WA6ECY0yI1zeemFw74HyKg4UOXx1/m', 0, '1', 0, NULL, NULL, '2021-11-29 04:10:21', NULL, '2021-11-29 04:10:21', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('tesdosen8@gmail.com', '$2y$10$9Zsic5BhxqF.9.yFJgZJHur9j8jsQ1me32nMsGKKiKWd8/5uaBFJ6', 0, '1', 0, NULL, NULL, '2021-11-29 04:10:49', NULL, '2021-11-29 04:10:49', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('tesdosen9@gmail.com', '$2y$10$6X3BsANoVs.vAqrYUQfzW.PIY1P8Oskzowyb82snc8zmigKkYW2NC', 0, '1', 0, NULL, NULL, '2021-11-29 04:11:13', NULL, '2021-11-29 04:11:13', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('tesmahasiswa10@gmail.com', '$2y$10$gfDqtShvo2dh6pq0XXv6bee39m.2L3Iv1/XInEFNWQJKUNzo.IWjG', 1, '1', 0, NULL, NULL, '2021-11-29 04:23:21', NULL, '2021-11-29 04:23:21', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('tesmahasiswa1@gmail.com', '$2y$10$UvALAVR5hJDDskbwxbalcui7PRc.DaxMhcEbXaD/x4XZsrmTtgq36', 1, '1', 0, NULL, NULL, '2021-11-29 04:18:20', NULL, '2021-11-29 07:20:32', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('tesmahasiswa2@gmail.com', '$2y$10$cRgfILna23NXzsFlgLuJk.mGtQvg.jqEXyUCS5KHVpqgqYbz68eze', 1, '1', 0, NULL, NULL, '2021-11-29 04:20:02', NULL, '2021-11-29 04:20:02', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('tesmahasiswa3@gmail.com', '$2y$10$AOL.0Yj8RrO9qP8CaWpSTeN7qHgimEHHsbY671G.XJwaZL6s4nJKq', 1, '1', 0, NULL, NULL, '2021-11-29 04:20:32', NULL, '2021-11-29 04:20:32', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('tesmahasiswa4@gmail.com', '$2y$10$DGySC0uuJKwwITuPISVoq.fh3CR/hAJQ2wBQfbdoVdD12Bv4fMQvm', 1, '1', 0, NULL, NULL, '2021-11-29 04:20:55', NULL, '2021-11-29 04:20:55', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('tesmahasiswa5@gmail.com', '$2y$10$Jv9y3UWLdT/6x5u/kGkdeujed85tuXkcGw5Meu4bZsOBjLzm7HE5e', 1, '1', 0, NULL, NULL, '2021-11-29 04:21:17', NULL, '2021-11-29 04:21:17', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('tesmahasiswa6@gmail.com', '$2y$10$LHl1H7mmmPRN/e5D72L2fenF7QTtcQTpJ7NLEFCQWO1TbJuP5Y5Eq', 1, '1', 0, NULL, NULL, '2021-11-29 04:21:38', NULL, '2021-11-29 04:21:38', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('tesmahasiswa7@gmail.com', '$2y$10$pP5wL/MTnm3GNPrUmd3uxOY2EIr/TcRO3wtIAShV7O5s.DjSMTrE2', 1, '1', 0, NULL, NULL, '2021-11-29 04:21:57', NULL, '2021-11-29 04:21:57', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('tesmahasiswa8@gmail.com', '$2y$10$QaXUvRfkY8DRhyCX/t04tuuJtnkujjzI5/D7PZsZ/xxnK29JQ9SQi', 1, '1', 0, NULL, NULL, '2021-11-29 04:22:15', NULL, '2021-11-29 04:22:15', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('tesmahasiswa9@gmail.com', '$2y$10$vNn531ra1BRv6F52.KLujuaoZNxFwM1TII3lrIHdr1sMe3kHgcKHW', 1, '1', 0, NULL, NULL, '2021-11-29 04:23:01', NULL, '2021-11-29 04:23:01', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('tesmahasiswaacc@ciputra.com', '$2y$10$9KX3b8PG2lov68BPVA7Sa.Yqm0cNhp.efbPbaH73u5ADJGtkGeNcm', 1, '1', 0, NULL, NULL, '2021-12-06 08:27:33', NULL, '2021-12-06 08:27:33', NULL, 'RL.1.003');
INSERT INTO `m_user` VALUES ('travelsyaofficial@gmail.com', '$2y$10$.xBqKRxjwbg18nHOeQ.wwu1J1isEEm9Ge5.K8np5TMEsmZ2prd4NK', 0, '1', 0, NULL, NULL, '2021-11-09 14:17:47', NULL, '2021-11-09 14:17:47', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('twiradinata@ciputra.com', '$2y$10$Rtn.cWzUzXkIdr/6fPT4kuE7XoPHn2pwO/NwhoXWxacQw9W8FgUZq', 0, '1', 0, NULL, NULL, '2021-11-30 01:58:59', NULL, '2021-11-30 01:58:59', NULL, 'RL.1.002');
INSERT INTO `m_user` VALUES ('ymdinata@ciputra.com', '$2y$10$KATfSzFojL49bEmVdnU8wuosK1oy2.i8VlU7jpQgSmSQc4wry4PQK', 0, '1', 0, NULL, NULL, '2021-11-30 02:01:32', NULL, '2021-11-30 02:01:32', NULL, 'RL.1.002');
COMMIT;

-- ----------------------------
-- Table structure for m_user_access
-- ----------------------------
DROP TABLE IF EXISTS `m_user_access`;
CREATE TABLE `m_user_access` (
  `user_id` varchar(50) NOT NULL,
  `fakultas_id` varchar(50) DEFAULT NULL,
  `module_function_id` varchar(50) NOT NULL,
  `dt_record` datetime DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` datetime DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`module_function_id`),
  KEY `fakultas_id` (`fakultas_id`) USING BTREE,
  KEY `module_function_id` (`module_function_id`) USING BTREE,
  CONSTRAINT `m_user_access_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `m_user_access_ibfk_2` FOREIGN KEY (`fakultas_id`) REFERENCES `m_fakultas` (`fakultas_id`) ON UPDATE CASCADE,
  CONSTRAINT `m_user_access_ibfk_3` FOREIGN KEY (`module_function_id`) REFERENCES `m_module_function` (`module_function_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of m_user_access
-- ----------------------------
BEGIN;
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M02.01', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M02.02', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M02.03', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M02.04', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M03.01', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M03.02', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M03.03', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M03.04', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M04.01', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M04.02', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M04.03', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M04.04', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M05.01', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M05.02', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M05.03', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M05.04', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M06.01', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M06.02', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M06.03', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M06.04', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M07.01', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M07.02', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M07.03', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M07.04', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M08.01', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M08.02', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M08.03', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M08.04', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M08.06', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M09.01', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M09.02', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M09.03', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'M09.04', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'R01.01', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'R01.07', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'R02.01', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'R03.01', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'U01.01', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'U01.02', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'U01.03', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'U01.04', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'U02.01', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'U02.02', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'U02.03', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'U02.04', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('admin@mail.com', NULL, 'U02.05', '2021-12-02 01:41:33', 'admin@mail.com', '2021-12-02 01:41:33', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M03.01', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M03.02', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M03.03', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M03.04', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M04.01', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M04.02', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M04.03', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M04.04', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M05.01', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M05.02', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M05.03', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M05.04', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M06.01', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M06.02', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M06.03', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M06.04', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M07.01', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M07.02', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M07.03', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M07.04', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M08.01', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M08.02', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M08.03', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M08.04', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M08.06', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M09.01', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M09.02', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M09.03', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'M09.04', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'R01.01', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'R01.07', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'R02.01', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'R03.01', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'U01.01', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'U01.02', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'U01.03', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'U01.04', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'U02.01', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'U02.02', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'U02.03', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('asetiobudi@ciputra.com', NULL, 'U02.04', '2021-11-25 04:57:35', 'asetiobudi@ciputra.com', '2021-11-25 04:57:35', NULL);
INSERT INTO `m_user_access` VALUES ('bagas@ciputra.com', NULL, 'P01.01', '2021-11-26 10:01:16', 'admin@mail.com', '2021-11-26 10:01:16', NULL);
INSERT INTO `m_user_access` VALUES ('bagas@ciputra.com', NULL, 'P01.03', '2021-11-26 10:01:16', 'admin@mail.com', '2021-11-26 10:01:16', NULL);
INSERT INTO `m_user_access` VALUES ('bagus@ciputra.com', NULL, 'P01.01', '2021-11-26 10:00:55', 'admin@mail.com', '2021-11-26 10:00:55', NULL);
INSERT INTO `m_user_access` VALUES ('bagus@ciputra.com', NULL, 'P01.03', '2021-11-26 10:00:55', 'admin@mail.com', '2021-11-26 10:00:55', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M01.01', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M01.02', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M01.03', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M01.04', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M02.01', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M02.02', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M02.03', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M02.04', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M03.01', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M03.02', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M03.03', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M03.04', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M04.01', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M04.02', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M04.03', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M04.04', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M05.01', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M05.02', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M05.03', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M05.04', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M06.01', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M06.02', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M06.03', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M06.04', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M07.01', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M07.02', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M07.03', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M07.04', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M08.01', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M08.02', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M08.03', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M08.04', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M09.01', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M09.02', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M09.03', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'M09.04', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'U01.01', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'U01.02', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'U01.03', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'U02.01', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'U02.02', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'U02.03', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'U02.04', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushendra@gmail.com', NULL, 'U02.05', '2021-11-15 02:09:12', 'admin@mail.com', '2021-11-15 02:09:12', NULL);
INSERT INTO `m_user_access` VALUES ('bagushermawan@gmail.com', NULL, 'M04.01', '2021-11-30 02:49:28', 'admin@mail.com', '2021-11-30 02:49:28', NULL);
INSERT INTO `m_user_access` VALUES ('bagushermawan@gmail.com', NULL, 'M04.02', '2021-11-30 02:49:28', 'admin@mail.com', '2021-11-30 02:49:28', NULL);
INSERT INTO `m_user_access` VALUES ('bagushermawan@gmail.com', NULL, 'M04.03', '2021-11-30 02:49:28', 'admin@mail.com', '2021-11-30 02:49:28', NULL);
INSERT INTO `m_user_access` VALUES ('bagushermawan@gmail.com', NULL, 'M04.04', '2021-11-30 02:49:28', 'admin@mail.com', '2021-11-30 02:49:28', NULL);
INSERT INTO `m_user_access` VALUES ('bagushermawan@gmail.com', NULL, 'M05.01', '2021-11-30 02:49:28', 'admin@mail.com', '2021-11-30 02:49:28', NULL);
INSERT INTO `m_user_access` VALUES ('bagushermawan@gmail.com', NULL, 'M05.02', '2021-11-30 02:49:28', 'admin@mail.com', '2021-11-30 02:49:28', NULL);
INSERT INTO `m_user_access` VALUES ('bagushermawan@gmail.com', NULL, 'M05.03', '2021-11-30 02:49:28', 'admin@mail.com', '2021-11-30 02:49:28', NULL);
INSERT INTO `m_user_access` VALUES ('bagushermawan@gmail.com', NULL, 'M05.04', '2021-11-30 02:49:28', 'admin@mail.com', '2021-11-30 02:49:28', NULL);
INSERT INTO `m_user_access` VALUES ('bagushermawan@gmail.com', NULL, 'M07.01', '2021-11-30 02:49:28', 'admin@mail.com', '2021-11-30 02:49:28', NULL);
INSERT INTO `m_user_access` VALUES ('bagushermawan@gmail.com', NULL, 'M08.01', '2021-11-30 02:49:28', 'admin@mail.com', '2021-11-30 02:49:28', NULL);
INSERT INTO `m_user_access` VALUES ('bagushermawan@gmail.com', NULL, 'M08.02', '2021-11-30 02:49:28', 'admin@mail.com', '2021-11-30 02:49:28', NULL);
INSERT INTO `m_user_access` VALUES ('bagushermawan@gmail.com', NULL, 'M08.03', '2021-11-30 02:49:28', 'admin@mail.com', '2021-11-30 02:49:28', NULL);
INSERT INTO `m_user_access` VALUES ('bagushermawan@gmail.com', NULL, 'M08.04', '2021-11-30 02:49:28', 'admin@mail.com', '2021-11-30 02:49:28', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M02.01', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M02.02', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M02.03', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M02.04', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M03.01', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M03.02', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M03.03', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M03.04', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M04.01', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M04.02', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M04.03', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M04.04', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M05.01', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M05.02', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M05.03', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M05.04', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M06.01', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M06.02', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M06.03', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M06.04', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M07.01', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M07.02', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M07.03', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M07.04', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M08.01', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M08.02', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M08.03', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M08.04', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M09.01', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M09.02', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M09.03', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'M09.04', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'U01.01', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'U01.02', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'U01.03', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'U02.01', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'U02.02', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'U02.03', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'U02.04', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('bgs@mail.com', NULL, 'U02.05', '2021-11-15 03:33:43', 'admin@mail.com', '2021-11-15 03:33:43', NULL);
INSERT INTO `m_user_access` VALUES ('cclestari@ciputra.com', NULL, 'P01.01', '2021-11-30 02:00:46', 'admin@mail.com', '2021-11-30 02:00:46', NULL);
INSERT INTO `m_user_access` VALUES ('cclestari@ciputra.com', NULL, 'P01.02', '2021-11-30 02:00:46', 'admin@mail.com', '2021-11-30 02:00:46', NULL);
INSERT INTO `m_user_access` VALUES ('cclestari@ciputra.com', NULL, 'P01.03', '2021-11-30 02:00:46', 'admin@mail.com', '2021-11-30 02:00:46', NULL);
INSERT INTO `m_user_access` VALUES ('cclestari@ciputra.com', NULL, 'P01.04', '2021-11-30 02:00:46', 'admin@mail.com', '2021-11-30 02:00:46', NULL);
INSERT INTO `m_user_access` VALUES ('cclestari@ciputra.com', NULL, 'R01.01', '2021-11-30 02:00:46', 'admin@mail.com', '2021-11-30 02:00:46', NULL);
INSERT INTO `m_user_access` VALUES ('cclestari@ciputra.com', NULL, 'R01.07', '2021-11-30 02:00:46', 'admin@mail.com', '2021-11-30 02:00:46', NULL);
INSERT INTO `m_user_access` VALUES ('cclestari@ciputra.com', NULL, 'R02.01', '2021-11-30 02:00:46', 'admin@mail.com', '2021-11-30 02:00:46', NULL);
INSERT INTO `m_user_access` VALUES ('cclestari@ciputra.com', NULL, 'R03.01', '2021-11-30 02:00:46', 'admin@mail.com', '2021-11-30 02:00:46', NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M01.01', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M01.02', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M01.03', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M01.04', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M02.01', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M02.02', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M02.03', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M02.04', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M03.01', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M03.02', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M03.03', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M03.04', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M04.01', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M04.02', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M04.03', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M04.04', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M05.01', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M05.02', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M05.03', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M05.04', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M06.01', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M06.02', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M06.03', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M06.04', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M07.01', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M07.02', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M07.03', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M07.04', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M08.01', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M08.02', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M08.03', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M08.04', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M09.01', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M09.02', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M09.03', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'M09.04', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'R01.01', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'R01.07', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'R02.01', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'R03.01', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'U01.01', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'U01.02', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'U01.03', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'U01.04', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'U02.01', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'U02.02', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'U02.03', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('cwutami@ciputra.com', NULL, 'U02.04', NULL, NULL, NULL, NULL);
INSERT INTO `m_user_access` VALUES ('dmwonohadidjojo@ciputra.com', NULL, 'P01.01', '2021-11-30 01:59:54', 'admin@mail.com', '2021-11-30 01:59:54', NULL);
INSERT INTO `m_user_access` VALUES ('dmwonohadidjojo@ciputra.com', NULL, 'P01.02', '2021-11-30 01:59:54', 'admin@mail.com', '2021-11-30 01:59:54', NULL);
INSERT INTO `m_user_access` VALUES ('dmwonohadidjojo@ciputra.com', NULL, 'P01.03', '2021-11-30 01:59:54', 'admin@mail.com', '2021-11-30 01:59:54', NULL);
INSERT INTO `m_user_access` VALUES ('dmwonohadidjojo@ciputra.com', NULL, 'P01.04', '2021-11-30 01:59:54', 'admin@mail.com', '2021-11-30 01:59:54', NULL);
INSERT INTO `m_user_access` VALUES ('dmwonohadidjojo@ciputra.com', NULL, 'R01.01', '2021-11-30 01:59:54', 'admin@mail.com', '2021-11-30 01:59:54', NULL);
INSERT INTO `m_user_access` VALUES ('dmwonohadidjojo@ciputra.com', NULL, 'R01.07', '2021-11-30 01:59:54', 'admin@mail.com', '2021-11-30 01:59:54', NULL);
INSERT INTO `m_user_access` VALUES ('dmwonohadidjojo@ciputra.com', NULL, 'R02.01', '2021-11-30 01:59:54', 'admin@mail.com', '2021-11-30 01:59:54', NULL);
INSERT INTO `m_user_access` VALUES ('dmwonohadidjojo@ciputra.com', NULL, 'R03.01', '2021-11-30 01:59:54', 'admin@mail.com', '2021-11-30 01:59:54', NULL);
INSERT INTO `m_user_access` VALUES ('dona@ciputra.com', NULL, 'P01.01', '2021-11-26 09:59:13', 'admin@mail.com', '2021-11-26 09:59:13', NULL);
INSERT INTO `m_user_access` VALUES ('dona@ciputra.com', NULL, 'P01.03', '2021-11-26 09:59:13', 'admin@mail.com', '2021-11-26 09:59:13', NULL);
INSERT INTO `m_user_access` VALUES ('febe@ciputra.com', NULL, 'M04.01', '2021-11-26 09:56:44', 'admin@mail.com', '2021-11-26 09:56:44', NULL);
INSERT INTO `m_user_access` VALUES ('febe@ciputra.com', NULL, 'M04.02', '2021-11-26 09:56:44', 'admin@mail.com', '2021-11-26 09:56:44', NULL);
INSERT INTO `m_user_access` VALUES ('febe@ciputra.com', NULL, 'M04.03', '2021-11-26 09:56:44', 'admin@mail.com', '2021-11-26 09:56:44', NULL);
INSERT INTO `m_user_access` VALUES ('febe@ciputra.com', NULL, 'M04.04', '2021-11-26 09:56:44', 'admin@mail.com', '2021-11-26 09:56:44', NULL);
INSERT INTO `m_user_access` VALUES ('febe@ciputra.com', NULL, 'M08.01', '2021-11-26 09:56:44', 'admin@mail.com', '2021-11-26 09:56:44', NULL);
INSERT INTO `m_user_access` VALUES ('febe@ciputra.com', NULL, 'M08.02', '2021-11-26 09:56:44', 'admin@mail.com', '2021-11-26 09:56:44', NULL);
INSERT INTO `m_user_access` VALUES ('febe@ciputra.com', NULL, 'M08.03', '2021-11-26 09:56:44', 'admin@mail.com', '2021-11-26 09:56:44', NULL);
INSERT INTO `m_user_access` VALUES ('febe@ciputra.com', NULL, 'M08.04', '2021-11-26 09:56:44', 'admin@mail.com', '2021-11-26 09:56:44', NULL);
INSERT INTO `m_user_access` VALUES ('febe@ciputra.com', NULL, 'M08.06', '2021-11-26 09:56:44', 'admin@mail.com', '2021-11-26 09:56:44', NULL);
INSERT INTO `m_user_access` VALUES ('febe@ciputra.com', NULL, 'P01.01', '2021-11-26 09:56:44', 'admin@mail.com', '2021-11-26 09:56:44', NULL);
INSERT INTO `m_user_access` VALUES ('febe@ciputra.com', NULL, 'P01.02', '2021-11-26 09:56:44', 'admin@mail.com', '2021-11-26 09:56:44', NULL);
INSERT INTO `m_user_access` VALUES ('febe@ciputra.com', NULL, 'P01.03', '2021-11-26 09:56:44', 'admin@mail.com', '2021-11-26 09:56:44', NULL);
INSERT INTO `m_user_access` VALUES ('febe@ciputra.com', NULL, 'P01.04', '2021-11-26 09:56:44', 'admin@mail.com', '2021-11-26 09:56:44', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M01.01', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M01.02', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M01.03', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M01.04', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M02.01', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M02.02', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M02.03', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M02.04', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M03.01', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M03.02', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M03.03', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M03.04', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M04.01', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M04.02', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M04.03', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M04.04', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M05.01', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M05.02', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M05.03', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M05.04', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M06.01', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M06.02', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M06.03', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M06.04', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M07.01', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M07.02', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M07.03', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M07.04', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M08.01', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M08.02', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M08.03', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M08.04', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M08.06', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M09.01', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M09.02', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M09.03', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'M09.04', '2021-11-29 07:11:01', 'admin@mail.com', '2021-11-29 07:11:01', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'P01.01', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'P01.02', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'P01.03', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'P01.04', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'R01.01', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'R01.07', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'R02.01', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'R03.01', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'U01.01', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'U01.02', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'U01.03', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'U01.04', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'U02.01', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'U02.02', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'U02.03', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'U02.04', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('genesys@gmail.com', NULL, 'U02.05', '2021-11-29 07:11:02', 'admin@mail.com', '2021-11-29 07:11:02', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M02.01', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M02.02', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M02.03', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M02.04', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M03.01', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M03.02', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M03.03', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M03.04', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M07.01', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M07.02', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M07.03', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M07.04', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M09.01', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M09.02', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M09.03', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrawanagus15@gmail.com', NULL, 'M09.04', '2021-11-25 01:12:03', 'asetiobudi@ciputra.com', '2021-11-25 01:12:03', NULL);
INSERT INTO `m_user_access` VALUES ('hendrik@ciputra.com', NULL, 'P01.01', '2021-11-26 10:01:42', 'admin@mail.com', '2021-11-26 10:01:42', NULL);
INSERT INTO `m_user_access` VALUES ('hendrik@ciputra.com', NULL, 'P01.03', '2021-11-26 10:01:42', 'admin@mail.com', '2021-11-26 10:01:42', NULL);
INSERT INTO `m_user_access` VALUES ('janti@ciputra.com', NULL, 'M04.01', '2021-11-28 05:55:31', 'admin@mail.com', '2021-11-28 05:55:31', NULL);
INSERT INTO `m_user_access` VALUES ('janti@ciputra.com', NULL, 'M04.02', '2021-11-28 05:55:31', 'admin@mail.com', '2021-11-28 05:55:31', NULL);
INSERT INTO `m_user_access` VALUES ('janti@ciputra.com', NULL, 'M04.03', '2021-11-28 05:55:31', 'admin@mail.com', '2021-11-28 05:55:31', NULL);
INSERT INTO `m_user_access` VALUES ('janti@ciputra.com', NULL, 'M04.04', '2021-11-28 05:55:31', 'admin@mail.com', '2021-11-28 05:55:31', NULL);
INSERT INTO `m_user_access` VALUES ('janti@ciputra.com', NULL, 'M08.01', '2021-11-28 05:55:31', 'admin@mail.com', '2021-11-28 05:55:31', NULL);
INSERT INTO `m_user_access` VALUES ('janti@ciputra.com', NULL, 'M08.02', '2021-11-28 05:55:31', 'admin@mail.com', '2021-11-28 05:55:31', NULL);
INSERT INTO `m_user_access` VALUES ('janti@ciputra.com', NULL, 'M08.03', '2021-11-28 05:55:31', 'admin@mail.com', '2021-11-28 05:55:31', NULL);
INSERT INTO `m_user_access` VALUES ('janti@ciputra.com', NULL, 'M08.04', '2021-11-28 05:55:31', 'admin@mail.com', '2021-11-28 05:55:31', NULL);
INSERT INTO `m_user_access` VALUES ('janti@ciputra.com', NULL, 'M08.06', '2021-11-28 05:55:31', 'admin@mail.com', '2021-11-28 05:55:31', NULL);
INSERT INTO `m_user_access` VALUES ('janti@ciputra.com', NULL, 'P01.01', '2021-11-28 05:55:31', 'admin@mail.com', '2021-11-28 05:55:31', NULL);
INSERT INTO `m_user_access` VALUES ('janti@ciputra.com', NULL, 'P01.02', '2021-11-28 05:55:31', 'admin@mail.com', '2021-11-28 05:55:31', NULL);
INSERT INTO `m_user_access` VALUES ('janti@ciputra.com', NULL, 'P01.03', '2021-11-28 05:55:31', 'admin@mail.com', '2021-11-28 05:55:31', NULL);
INSERT INTO `m_user_access` VALUES ('janti@ciputra.com', NULL, 'P01.04', '2021-11-28 05:55:31', 'admin@mail.com', '2021-11-28 05:55:31', NULL);
INSERT INTO `m_user_access` VALUES ('janti@ciputra.com', NULL, 'R01.01', '2021-11-28 05:55:31', 'admin@mail.com', '2021-11-28 05:55:31', NULL);
INSERT INTO `m_user_access` VALUES ('janti@ciputra.com', NULL, 'R01.07', '2021-11-28 05:55:31', 'admin@mail.com', '2021-11-28 05:55:31', NULL);
INSERT INTO `m_user_access` VALUES ('laij@ciputra.com', NULL, 'M04.01', '2021-11-26 09:57:27', 'admin@mail.com', '2021-11-26 09:57:27', NULL);
INSERT INTO `m_user_access` VALUES ('laij@ciputra.com', NULL, 'M04.02', '2021-11-26 09:57:27', 'admin@mail.com', '2021-11-26 09:57:27', NULL);
INSERT INTO `m_user_access` VALUES ('laij@ciputra.com', NULL, 'M04.03', '2021-11-26 09:57:27', 'admin@mail.com', '2021-11-26 09:57:27', NULL);
INSERT INTO `m_user_access` VALUES ('laij@ciputra.com', NULL, 'M04.04', '2021-11-26 09:57:27', 'admin@mail.com', '2021-11-26 09:57:27', NULL);
INSERT INTO `m_user_access` VALUES ('laij@ciputra.com', NULL, 'M08.01', '2021-11-26 09:57:27', 'admin@mail.com', '2021-11-26 09:57:27', NULL);
INSERT INTO `m_user_access` VALUES ('laij@ciputra.com', NULL, 'M08.02', '2021-11-26 09:57:27', 'admin@mail.com', '2021-11-26 09:57:27', NULL);
INSERT INTO `m_user_access` VALUES ('laij@ciputra.com', NULL, 'M08.03', '2021-11-26 09:57:27', 'admin@mail.com', '2021-11-26 09:57:27', NULL);
INSERT INTO `m_user_access` VALUES ('laij@ciputra.com', NULL, 'M08.04', '2021-11-26 09:57:28', 'admin@mail.com', '2021-11-26 09:57:28', NULL);
INSERT INTO `m_user_access` VALUES ('laij@ciputra.com', NULL, 'M08.06', '2021-11-26 09:57:28', 'admin@mail.com', '2021-11-26 09:57:28', NULL);
INSERT INTO `m_user_access` VALUES ('laij@ciputra.com', NULL, 'P01.01', '2021-11-26 09:57:28', 'admin@mail.com', '2021-11-26 09:57:28', NULL);
INSERT INTO `m_user_access` VALUES ('laij@ciputra.com', NULL, 'P01.02', '2021-11-26 09:57:28', 'admin@mail.com', '2021-11-26 09:57:28', NULL);
INSERT INTO `m_user_access` VALUES ('laij@ciputra.com', NULL, 'P01.03', '2021-11-26 09:57:28', 'admin@mail.com', '2021-11-26 09:57:28', NULL);
INSERT INTO `m_user_access` VALUES ('laij@ciputra.com', NULL, 'P01.04', '2021-11-26 09:57:28', 'admin@mail.com', '2021-11-26 09:57:28', NULL);
INSERT INTO `m_user_access` VALUES ('lmtjahjono@ciputra.com', NULL, 'P01.01', '2021-11-30 02:03:05', 'admin@mail.com', '2021-11-30 02:03:05', NULL);
INSERT INTO `m_user_access` VALUES ('lmtjahjono@ciputra.com', NULL, 'P01.02', '2021-11-30 02:03:05', 'admin@mail.com', '2021-11-30 02:03:05', NULL);
INSERT INTO `m_user_access` VALUES ('lmtjahjono@ciputra.com', NULL, 'P01.03', '2021-11-30 02:03:05', 'admin@mail.com', '2021-11-30 02:03:05', NULL);
INSERT INTO `m_user_access` VALUES ('lmtjahjono@ciputra.com', NULL, 'P01.04', '2021-11-30 02:03:05', 'admin@mail.com', '2021-11-30 02:03:05', NULL);
INSERT INTO `m_user_access` VALUES ('lmtjahjono@ciputra.com', NULL, 'R01.01', '2021-11-30 02:03:05', 'admin@mail.com', '2021-11-30 02:03:05', NULL);
INSERT INTO `m_user_access` VALUES ('lmtjahjono@ciputra.com', NULL, 'R01.07', '2021-11-30 02:03:05', 'admin@mail.com', '2021-11-30 02:03:05', NULL);
INSERT INTO `m_user_access` VALUES ('lmtjahjono@ciputra.com', NULL, 'R02.01', '2021-11-30 02:03:05', 'admin@mail.com', '2021-11-30 02:03:05', NULL);
INSERT INTO `m_user_access` VALUES ('lmtjahjono@ciputra.com', NULL, 'R03.01', '2021-11-30 02:03:05', 'admin@mail.com', '2021-11-30 02:03:05', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa10@gmail.com', NULL, 'P01.01', '2021-11-30 02:08:41', 'admin@mail.com', '2021-11-30 02:08:41', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa10@gmail.com', NULL, 'P01.03', '2021-11-30 02:08:41', 'admin@mail.com', '2021-11-30 02:08:41', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa1@gmail.com', NULL, 'P01.01', '2021-11-30 02:05:51', 'admin@mail.com', '2021-11-30 02:05:51', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa1@gmail.com', NULL, 'P01.03', '2021-11-30 02:05:51', 'admin@mail.com', '2021-11-30 02:05:51', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa2@gmail.com', NULL, 'P01.01', '2021-11-30 02:06:22', 'admin@mail.com', '2021-11-30 02:06:22', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa2@gmail.com', NULL, 'P01.03', '2021-11-30 02:06:22', 'admin@mail.com', '2021-11-30 02:06:22', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa3@gmail.com', NULL, 'P01.01', '2021-11-30 02:06:45', 'admin@mail.com', '2021-11-30 02:06:45', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa3@gmail.com', NULL, 'P01.03', '2021-11-30 02:06:45', 'admin@mail.com', '2021-11-30 02:06:45', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa4@gmail.com', NULL, 'P01.01', '2021-11-30 02:07:05', 'admin@mail.com', '2021-11-30 02:07:05', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa4@gmail.com', NULL, 'P01.03', '2021-11-30 02:07:05', 'admin@mail.com', '2021-11-30 02:07:05', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa5@gmail.com', NULL, 'P01.01', '2021-11-30 02:07:21', 'admin@mail.com', '2021-11-30 02:07:21', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa5@gmail.com', NULL, 'P01.03', '2021-11-30 02:07:21', 'admin@mail.com', '2021-11-30 02:07:21', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa6@gmail.com', NULL, 'P01.01', '2021-11-30 02:07:40', 'admin@mail.com', '2021-11-30 02:07:40', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa6@gmail.com', NULL, 'P01.03', '2021-11-30 02:07:40', 'admin@mail.com', '2021-11-30 02:07:40', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa7@gmail.com', NULL, 'P01.01', '2021-11-30 02:07:55', 'admin@mail.com', '2021-11-30 02:07:55', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa7@gmail.com', NULL, 'P01.03', '2021-11-30 02:07:55', 'admin@mail.com', '2021-11-30 02:07:55', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa8@gmail.com', NULL, 'P01.01', '2021-11-30 02:08:10', 'admin@mail.com', '2021-11-30 02:08:10', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa8@gmail.com', NULL, 'P01.03', '2021-11-30 02:08:10', 'admin@mail.com', '2021-11-30 02:08:10', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa9@gmail.com', NULL, 'P01.01', '2021-11-30 02:08:26', 'admin@mail.com', '2021-11-30 02:08:26', NULL);
INSERT INTO `m_user_access` VALUES ('mahasiswa9@gmail.com', NULL, 'P01.03', '2021-11-30 02:08:26', 'admin@mail.com', '2021-11-30 02:08:26', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M02.01', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M02.02', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M02.03', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M02.04', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M03.01', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M03.02', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M03.03', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M03.04', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M07.01', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M07.02', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M07.03', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M07.04', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M09.01', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M09.02', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M09.03', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mandra@gmail.com', NULL, 'M09.04', '2021-11-25 01:03:20', 'asetiobudi@ciputra.com', '2021-11-25 01:03:20', NULL);
INSERT INTO `m_user_access` VALUES ('mmengel@ciputra.com', NULL, 'P01.01', '2021-11-30 02:02:19', 'admin@mail.com', '2021-11-30 02:02:19', NULL);
INSERT INTO `m_user_access` VALUES ('mmengel@ciputra.com', NULL, 'P01.02', '2021-11-30 02:02:19', 'admin@mail.com', '2021-11-30 02:02:19', NULL);
INSERT INTO `m_user_access` VALUES ('mmengel@ciputra.com', NULL, 'P01.03', '2021-11-30 02:02:19', 'admin@mail.com', '2021-11-30 02:02:19', NULL);
INSERT INTO `m_user_access` VALUES ('mmengel@ciputra.com', NULL, 'P01.04', '2021-11-30 02:02:19', 'admin@mail.com', '2021-11-30 02:02:19', NULL);
INSERT INTO `m_user_access` VALUES ('mmengel@ciputra.com', NULL, 'R01.01', '2021-11-30 02:02:19', 'admin@mail.com', '2021-11-30 02:02:19', NULL);
INSERT INTO `m_user_access` VALUES ('mmengel@ciputra.com', NULL, 'R01.07', '2021-11-30 02:02:19', 'admin@mail.com', '2021-11-30 02:02:19', NULL);
INSERT INTO `m_user_access` VALUES ('mmengel@ciputra.com', NULL, 'R02.01', '2021-11-30 02:02:19', 'admin@mail.com', '2021-11-30 02:02:19', NULL);
INSERT INTO `m_user_access` VALUES ('mmengel@ciputra.com', NULL, 'R03.01', '2021-11-30 02:02:19', 'admin@mail.com', '2021-11-30 02:02:19', NULL);
INSERT INTO `m_user_access` VALUES ('sewahyudi@ciputra.com', NULL, 'P01.01', '2021-11-30 01:57:50', 'admin@mail.com', '2021-11-30 01:57:50', NULL);
INSERT INTO `m_user_access` VALUES ('sewahyudi@ciputra.com', NULL, 'P01.02', '2021-11-30 01:57:50', 'admin@mail.com', '2021-11-30 01:57:50', NULL);
INSERT INTO `m_user_access` VALUES ('sewahyudi@ciputra.com', NULL, 'P01.03', '2021-11-30 01:57:50', 'admin@mail.com', '2021-11-30 01:57:50', NULL);
INSERT INTO `m_user_access` VALUES ('sewahyudi@ciputra.com', NULL, 'P01.04', '2021-11-30 01:57:50', 'admin@mail.com', '2021-11-30 01:57:50', NULL);
INSERT INTO `m_user_access` VALUES ('sewahyudi@ciputra.com', NULL, 'R01.01', '2021-11-30 01:57:50', 'admin@mail.com', '2021-11-30 01:57:50', NULL);
INSERT INTO `m_user_access` VALUES ('sewahyudi@ciputra.com', NULL, 'R01.07', '2021-11-30 01:57:50', 'admin@mail.com', '2021-11-30 01:57:50', NULL);
INSERT INTO `m_user_access` VALUES ('sewahyudi@ciputra.com', NULL, 'R02.01', '2021-11-30 01:57:50', 'admin@mail.com', '2021-11-30 01:57:50', NULL);
INSERT INTO `m_user_access` VALUES ('sewahyudi@ciputra.com', NULL, 'R03.01', '2021-11-30 01:57:50', 'admin@mail.com', '2021-11-30 01:57:50', NULL);
INSERT INTO `m_user_access` VALUES ('tantonio@ciputra.com', NULL, 'P01.01', '2021-11-30 02:04:21', 'admin@mail.com', '2021-11-30 02:04:21', NULL);
INSERT INTO `m_user_access` VALUES ('tantonio@ciputra.com', NULL, 'P01.02', '2021-11-30 02:04:21', 'admin@mail.com', '2021-11-30 02:04:21', NULL);
INSERT INTO `m_user_access` VALUES ('tantonio@ciputra.com', NULL, 'P01.03', '2021-11-30 02:04:21', 'admin@mail.com', '2021-11-30 02:04:21', NULL);
INSERT INTO `m_user_access` VALUES ('tantonio@ciputra.com', NULL, 'P01.04', '2021-11-30 02:04:21', 'admin@mail.com', '2021-11-30 02:04:21', NULL);
INSERT INTO `m_user_access` VALUES ('tantonio@ciputra.com', NULL, 'R01.01', '2021-11-30 02:04:21', 'admin@mail.com', '2021-11-30 02:04:21', NULL);
INSERT INTO `m_user_access` VALUES ('tantonio@ciputra.com', NULL, 'R01.07', '2021-11-30 02:04:21', 'admin@mail.com', '2021-11-30 02:04:21', NULL);
INSERT INTO `m_user_access` VALUES ('tantonio@ciputra.com', NULL, 'R02.01', '2021-11-30 02:04:21', 'admin@mail.com', '2021-11-30 02:04:21', NULL);
INSERT INTO `m_user_access` VALUES ('tantonio@ciputra.com', NULL, 'R03.01', '2021-11-30 02:04:21', 'admin@mail.com', '2021-11-30 02:04:21', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen10@gmail.com', NULL, 'P01.01', '2021-11-29 04:11:38', 'admin@mail.com', '2021-11-29 04:11:38', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen10@gmail.com', NULL, 'P01.02', '2021-11-29 04:11:38', 'admin@mail.com', '2021-11-29 04:11:38', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen10@gmail.com', NULL, 'P01.03', '2021-11-29 04:11:38', 'admin@mail.com', '2021-11-29 04:11:38', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen10@gmail.com', NULL, 'P01.04', '2021-11-29 04:11:38', 'admin@mail.com', '2021-11-29 04:11:38', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen10@gmail.com', NULL, 'R01.01', '2021-11-29 04:11:38', 'admin@mail.com', '2021-11-29 04:11:38', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen10@gmail.com', NULL, 'R01.07', '2021-11-29 04:11:38', 'admin@mail.com', '2021-11-29 04:11:38', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen10@gmail.com', NULL, 'R02.01', '2021-11-29 04:11:38', 'admin@mail.com', '2021-11-29 04:11:38', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen10@gmail.com', NULL, 'R03.01', '2021-11-29 04:11:38', 'admin@mail.com', '2021-11-29 04:11:38', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen1@gmail.com', NULL, 'P01.01', '2021-11-29 04:07:44', 'admin@mail.com', '2021-11-29 04:07:44', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen1@gmail.com', NULL, 'P01.02', '2021-11-29 04:07:44', 'admin@mail.com', '2021-11-29 04:07:44', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen1@gmail.com', NULL, 'P01.03', '2021-11-29 04:07:44', 'admin@mail.com', '2021-11-29 04:07:44', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen1@gmail.com', NULL, 'P01.04', '2021-11-29 04:07:44', 'admin@mail.com', '2021-11-29 04:07:44', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen1@gmail.com', NULL, 'R01.01', '2021-11-29 04:07:44', 'admin@mail.com', '2021-11-29 04:07:44', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen1@gmail.com', NULL, 'R01.07', '2021-11-29 04:07:44', 'admin@mail.com', '2021-11-29 04:07:44', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen1@gmail.com', NULL, 'R02.01', '2021-11-29 04:07:44', 'admin@mail.com', '2021-11-29 04:07:44', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen1@gmail.com', NULL, 'R03.01', '2021-11-29 04:07:44', 'admin@mail.com', '2021-11-29 04:07:44', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen2@gmail.com', NULL, 'P01.01', '2021-11-29 04:08:11', 'admin@mail.com', '2021-11-29 04:08:11', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen2@gmail.com', NULL, 'P01.02', '2021-11-29 04:08:11', 'admin@mail.com', '2021-11-29 04:08:11', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen2@gmail.com', NULL, 'P01.03', '2021-11-29 04:08:11', 'admin@mail.com', '2021-11-29 04:08:11', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen2@gmail.com', NULL, 'P01.04', '2021-11-29 04:08:11', 'admin@mail.com', '2021-11-29 04:08:11', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen2@gmail.com', NULL, 'R01.01', '2021-11-29 04:08:11', 'admin@mail.com', '2021-11-29 04:08:11', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen2@gmail.com', NULL, 'R01.07', '2021-11-29 04:08:11', 'admin@mail.com', '2021-11-29 04:08:11', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen2@gmail.com', NULL, 'R02.01', '2021-11-29 04:08:11', 'admin@mail.com', '2021-11-29 04:08:11', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen2@gmail.com', NULL, 'R03.01', '2021-11-29 04:08:11', 'admin@mail.com', '2021-11-29 04:08:11', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen3@gmail.com', NULL, 'P01.01', '2021-11-29 04:08:29', 'admin@mail.com', '2021-11-29 04:08:29', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen3@gmail.com', NULL, 'P01.02', '2021-11-29 04:08:29', 'admin@mail.com', '2021-11-29 04:08:29', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen3@gmail.com', NULL, 'P01.03', '2021-11-29 04:08:29', 'admin@mail.com', '2021-11-29 04:08:29', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen3@gmail.com', NULL, 'P01.04', '2021-11-29 04:08:29', 'admin@mail.com', '2021-11-29 04:08:29', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen3@gmail.com', NULL, 'R01.01', '2021-11-29 04:08:29', 'admin@mail.com', '2021-11-29 04:08:29', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen3@gmail.com', NULL, 'R01.07', '2021-11-29 04:08:29', 'admin@mail.com', '2021-11-29 04:08:29', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen3@gmail.com', NULL, 'R02.01', '2021-11-29 04:08:29', 'admin@mail.com', '2021-11-29 04:08:29', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen3@gmail.com', NULL, 'R03.01', '2021-11-29 04:08:29', 'admin@mail.com', '2021-11-29 04:08:29', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen4@gmail.com', NULL, 'P01.01', '2021-11-29 04:09:14', 'admin@mail.com', '2021-11-29 04:09:14', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen4@gmail.com', NULL, 'P01.02', '2021-11-29 04:09:14', 'admin@mail.com', '2021-11-29 04:09:14', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen4@gmail.com', NULL, 'P01.03', '2021-11-29 04:09:14', 'admin@mail.com', '2021-11-29 04:09:14', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen4@gmail.com', NULL, 'P01.04', '2021-11-29 04:09:14', 'admin@mail.com', '2021-11-29 04:09:14', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen4@gmail.com', NULL, 'R01.01', '2021-11-29 04:09:14', 'admin@mail.com', '2021-11-29 04:09:14', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen4@gmail.com', NULL, 'R01.07', '2021-11-29 04:09:14', 'admin@mail.com', '2021-11-29 04:09:14', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen4@gmail.com', NULL, 'R02.01', '2021-11-29 04:09:14', 'admin@mail.com', '2021-11-29 04:09:14', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen4@gmail.com', NULL, 'R03.01', '2021-11-29 04:09:14', 'admin@mail.com', '2021-11-29 04:09:14', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen5@gmail.com', NULL, 'P01.01', '2021-11-29 04:09:33', 'admin@mail.com', '2021-11-29 04:09:33', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen5@gmail.com', NULL, 'P01.02', '2021-11-29 04:09:33', 'admin@mail.com', '2021-11-29 04:09:33', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen5@gmail.com', NULL, 'P01.03', '2021-11-29 04:09:33', 'admin@mail.com', '2021-11-29 04:09:33', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen5@gmail.com', NULL, 'P01.04', '2021-11-29 04:09:33', 'admin@mail.com', '2021-11-29 04:09:33', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen5@gmail.com', NULL, 'R01.01', '2021-11-29 04:09:33', 'admin@mail.com', '2021-11-29 04:09:33', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen5@gmail.com', NULL, 'R01.07', '2021-11-29 04:09:33', 'admin@mail.com', '2021-11-29 04:09:33', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen5@gmail.com', NULL, 'R02.01', '2021-11-29 04:09:33', 'admin@mail.com', '2021-11-29 04:09:33', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen5@gmail.com', NULL, 'R03.01', '2021-11-29 04:09:33', 'admin@mail.com', '2021-11-29 04:09:33', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen6@gmail.com', NULL, 'P01.01', '2021-11-29 04:09:58', 'admin@mail.com', '2021-11-29 04:09:58', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen6@gmail.com', NULL, 'P01.02', '2021-11-29 04:09:58', 'admin@mail.com', '2021-11-29 04:09:58', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen6@gmail.com', NULL, 'P01.03', '2021-11-29 04:09:58', 'admin@mail.com', '2021-11-29 04:09:58', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen6@gmail.com', NULL, 'P01.04', '2021-11-29 04:09:58', 'admin@mail.com', '2021-11-29 04:09:58', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen6@gmail.com', NULL, 'R01.01', '2021-11-29 04:09:58', 'admin@mail.com', '2021-11-29 04:09:58', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen6@gmail.com', NULL, 'R01.07', '2021-11-29 04:09:58', 'admin@mail.com', '2021-11-29 04:09:58', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen6@gmail.com', NULL, 'R02.01', '2021-11-29 04:09:58', 'admin@mail.com', '2021-11-29 04:09:58', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen6@gmail.com', NULL, 'R03.01', '2021-11-29 04:09:58', 'admin@mail.com', '2021-11-29 04:09:58', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen7@gmail.com', NULL, 'P01.01', '2021-11-29 04:10:21', 'admin@mail.com', '2021-11-29 04:10:21', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen7@gmail.com', NULL, 'P01.02', '2021-11-29 04:10:21', 'admin@mail.com', '2021-11-29 04:10:21', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen7@gmail.com', NULL, 'P01.03', '2021-11-29 04:10:21', 'admin@mail.com', '2021-11-29 04:10:21', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen7@gmail.com', NULL, 'P01.04', '2021-11-29 04:10:21', 'admin@mail.com', '2021-11-29 04:10:21', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen7@gmail.com', NULL, 'R01.01', '2021-11-29 04:10:21', 'admin@mail.com', '2021-11-29 04:10:21', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen7@gmail.com', NULL, 'R01.07', '2021-11-29 04:10:21', 'admin@mail.com', '2021-11-29 04:10:21', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen7@gmail.com', NULL, 'R02.01', '2021-11-29 04:10:21', 'admin@mail.com', '2021-11-29 04:10:21', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen7@gmail.com', NULL, 'R03.01', '2021-11-29 04:10:21', 'admin@mail.com', '2021-11-29 04:10:21', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen8@gmail.com', NULL, 'P01.01', '2021-11-29 04:10:49', 'admin@mail.com', '2021-11-29 04:10:49', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen8@gmail.com', NULL, 'P01.02', '2021-11-29 04:10:49', 'admin@mail.com', '2021-11-29 04:10:49', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen8@gmail.com', NULL, 'P01.03', '2021-11-29 04:10:49', 'admin@mail.com', '2021-11-29 04:10:49', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen8@gmail.com', NULL, 'P01.04', '2021-11-29 04:10:49', 'admin@mail.com', '2021-11-29 04:10:49', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen8@gmail.com', NULL, 'R01.01', '2021-11-29 04:10:49', 'admin@mail.com', '2021-11-29 04:10:49', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen8@gmail.com', NULL, 'R01.07', '2021-11-29 04:10:49', 'admin@mail.com', '2021-11-29 04:10:49', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen8@gmail.com', NULL, 'R02.01', '2021-11-29 04:10:49', 'admin@mail.com', '2021-11-29 04:10:49', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen8@gmail.com', NULL, 'R03.01', '2021-11-29 04:10:49', 'admin@mail.com', '2021-11-29 04:10:49', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen9@gmail.com', NULL, 'P01.01', '2021-11-29 04:11:13', 'admin@mail.com', '2021-11-29 04:11:13', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen9@gmail.com', NULL, 'P01.02', '2021-11-29 04:11:13', 'admin@mail.com', '2021-11-29 04:11:13', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen9@gmail.com', NULL, 'P01.03', '2021-11-29 04:11:13', 'admin@mail.com', '2021-11-29 04:11:13', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen9@gmail.com', NULL, 'P01.04', '2021-11-29 04:11:13', 'admin@mail.com', '2021-11-29 04:11:13', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen9@gmail.com', NULL, 'R01.01', '2021-11-29 04:11:13', 'admin@mail.com', '2021-11-29 04:11:13', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen9@gmail.com', NULL, 'R01.07', '2021-11-29 04:11:13', 'admin@mail.com', '2021-11-29 04:11:13', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen9@gmail.com', NULL, 'R02.01', '2021-11-29 04:11:13', 'admin@mail.com', '2021-11-29 04:11:13', NULL);
INSERT INTO `m_user_access` VALUES ('tesdosen9@gmail.com', NULL, 'R03.01', '2021-11-29 04:11:13', 'admin@mail.com', '2021-11-29 04:11:13', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa10@gmail.com', NULL, 'P01.01', '2021-11-29 04:23:21', 'admin@mail.com', '2021-11-29 04:23:21', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa10@gmail.com', NULL, 'P01.03', '2021-11-29 04:23:21', 'admin@mail.com', '2021-11-29 04:23:21', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa1@gmail.com', NULL, 'P01.01', '2021-11-29 04:18:20', 'admin@mail.com', '2021-11-29 04:18:20', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa1@gmail.com', NULL, 'P01.03', '2021-11-29 04:18:20', 'admin@mail.com', '2021-11-29 04:18:20', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa2@gmail.com', NULL, 'P01.01', '2021-11-29 04:20:02', 'admin@mail.com', '2021-11-29 04:20:02', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa2@gmail.com', NULL, 'P01.03', '2021-11-29 04:20:02', 'admin@mail.com', '2021-11-29 04:20:02', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa3@gmail.com', NULL, 'P01.01', '2021-11-29 04:20:32', 'admin@mail.com', '2021-11-29 04:20:32', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa3@gmail.com', NULL, 'P01.03', '2021-11-29 04:20:32', 'admin@mail.com', '2021-11-29 04:20:32', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa4@gmail.com', NULL, 'P01.01', '2021-11-29 04:20:55', 'admin@mail.com', '2021-11-29 04:20:55', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa4@gmail.com', NULL, 'P01.03', '2021-11-29 04:20:55', 'admin@mail.com', '2021-11-29 04:20:55', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa5@gmail.com', NULL, 'P01.01', '2021-11-29 04:21:17', 'admin@mail.com', '2021-11-29 04:21:17', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa5@gmail.com', NULL, 'P01.03', '2021-11-29 04:21:17', 'admin@mail.com', '2021-11-29 04:21:17', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa6@gmail.com', NULL, 'P01.01', '2021-11-29 04:21:38', 'admin@mail.com', '2021-11-29 04:21:38', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa6@gmail.com', NULL, 'P01.03', '2021-11-29 04:21:38', 'admin@mail.com', '2021-11-29 04:21:38', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa7@gmail.com', NULL, 'P01.01', '2021-11-29 04:21:57', 'admin@mail.com', '2021-11-29 04:21:57', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa7@gmail.com', NULL, 'P01.03', '2021-11-29 04:21:57', 'admin@mail.com', '2021-11-29 04:21:57', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa8@gmail.com', NULL, 'P01.01', '2021-11-29 04:22:15', 'admin@mail.com', '2021-11-29 04:22:15', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa8@gmail.com', NULL, 'P01.03', '2021-11-29 04:22:15', 'admin@mail.com', '2021-11-29 04:22:15', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa9@gmail.com', NULL, 'P01.01', '2021-11-29 04:23:01', 'admin@mail.com', '2021-11-29 04:23:01', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswa9@gmail.com', NULL, 'P01.03', '2021-11-29 04:23:01', 'admin@mail.com', '2021-11-29 04:23:01', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswaacc@ciputra.com', NULL, 'P01.01', '2021-12-06 08:27:33', 'admin@mail.com', '2021-12-06 08:27:33', NULL);
INSERT INTO `m_user_access` VALUES ('tesmahasiswaacc@ciputra.com', NULL, 'P01.03', '2021-12-06 08:27:33', 'admin@mail.com', '2021-12-06 08:27:33', NULL);
INSERT INTO `m_user_access` VALUES ('twiradinata@ciputra.com', NULL, 'P01.01', '2021-11-30 01:58:59', 'admin@mail.com', '2021-11-30 01:58:59', NULL);
INSERT INTO `m_user_access` VALUES ('twiradinata@ciputra.com', NULL, 'P01.02', '2021-11-30 01:58:59', 'admin@mail.com', '2021-11-30 01:58:59', NULL);
INSERT INTO `m_user_access` VALUES ('twiradinata@ciputra.com', NULL, 'P01.03', '2021-11-30 01:58:59', 'admin@mail.com', '2021-11-30 01:58:59', NULL);
INSERT INTO `m_user_access` VALUES ('twiradinata@ciputra.com', NULL, 'P01.04', '2021-11-30 01:58:59', 'admin@mail.com', '2021-11-30 01:58:59', NULL);
INSERT INTO `m_user_access` VALUES ('twiradinata@ciputra.com', NULL, 'R01.01', '2021-11-30 01:58:59', 'admin@mail.com', '2021-11-30 01:58:59', NULL);
INSERT INTO `m_user_access` VALUES ('twiradinata@ciputra.com', NULL, 'R01.07', '2021-11-30 01:58:59', 'admin@mail.com', '2021-11-30 01:58:59', NULL);
INSERT INTO `m_user_access` VALUES ('twiradinata@ciputra.com', NULL, 'R02.01', '2021-11-30 01:58:59', 'admin@mail.com', '2021-11-30 01:58:59', NULL);
INSERT INTO `m_user_access` VALUES ('twiradinata@ciputra.com', NULL, 'R03.01', '2021-11-30 01:58:59', 'admin@mail.com', '2021-11-30 01:58:59', NULL);
INSERT INTO `m_user_access` VALUES ('ymdinata@ciputra.com', NULL, 'P01.01', '2021-11-30 02:01:32', 'admin@mail.com', '2021-11-30 02:01:32', NULL);
INSERT INTO `m_user_access` VALUES ('ymdinata@ciputra.com', NULL, 'P01.02', '2021-11-30 02:01:32', 'admin@mail.com', '2021-11-30 02:01:32', NULL);
INSERT INTO `m_user_access` VALUES ('ymdinata@ciputra.com', NULL, 'P01.03', '2021-11-30 02:01:32', 'admin@mail.com', '2021-11-30 02:01:32', NULL);
INSERT INTO `m_user_access` VALUES ('ymdinata@ciputra.com', NULL, 'P01.04', '2021-11-30 02:01:32', 'admin@mail.com', '2021-11-30 02:01:32', NULL);
INSERT INTO `m_user_access` VALUES ('ymdinata@ciputra.com', NULL, 'R01.01', '2021-11-30 02:01:32', 'admin@mail.com', '2021-11-30 02:01:32', NULL);
INSERT INTO `m_user_access` VALUES ('ymdinata@ciputra.com', NULL, 'R01.07', '2021-11-30 02:01:32', 'admin@mail.com', '2021-11-30 02:01:32', NULL);
INSERT INTO `m_user_access` VALUES ('ymdinata@ciputra.com', NULL, 'R02.01', '2021-11-30 02:01:32', 'admin@mail.com', '2021-11-30 02:01:32', NULL);
INSERT INTO `m_user_access` VALUES ('ymdinata@ciputra.com', NULL, 'R03.01', '2021-11-30 02:01:32', 'admin@mail.com', '2021-11-30 02:01:32', NULL);
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2017_08_03_055212_create_auto_numbers', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (6, '2021_11_08_000509_add_university_semester', 2);
INSERT INTO `migrations` VALUES (7, '2021_11_08_021937_add_column_universitas_assesment', 3);
INSERT INTO `migrations` VALUES (8, '2021_11_14_133951_add_column_role', 4);
INSERT INTO `migrations` VALUES (9, '2021_11_14_233912_add_column_user_role', 5);
INSERT INTO `migrations` VALUES (11, '2021_11_26_081053_create_penilaian_nilai_tahap1', 6);
INSERT INTO `migrations` VALUES (12, '2021_11_26_092431_create_penilaian_nilai_tahap2', 6);
COMMIT;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_penilaian_assessment
-- ----------------------------
DROP TABLE IF EXISTS `t_penilaian_assessment`;
CREATE TABLE `t_penilaian_assessment` (
  `id` varchar(50) NOT NULL,
  `penilaian_id` varchar(50) NOT NULL,
  `assessment_id` varchar(50) NOT NULL,
  `kriteria_penilaian` varchar(255) DEFAULT NULL,
  `value` decimal(25,2) DEFAULT NULL,
  `value_persentase_pengampu` decimal(25,2) DEFAULT NULL,
  `value_persentasi_penilai` decimal(25,2) DEFAULT NULL,
  `value_persentase_mahasiswa` decimal(25,2) DEFAULT NULL,
  `dt_record` timestamp NULL DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`penilaian_id`,`assessment_id`) USING BTREE,
  KEY `penilaian_id` (`penilaian_id`) USING BTREE,
  KEY `assessment_id` (`assessment_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  CONSTRAINT `t_penilaian_assessment_ibfk_1` FOREIGN KEY (`penilaian_id`) REFERENCES `t_penilaian_header` (`penilaian_id`) ON UPDATE CASCADE,
  CONSTRAINT `t_penilaian_assessment_ibfk_2` FOREIGN KEY (`assessment_id`) REFERENCES `m_assessment` (`assessment_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_penilaian_assessment
-- ----------------------------
BEGIN;
INSERT INTO `t_penilaian_assessment` VALUES ('1', 'PNL.1.00002', 'ASM.1.0001', 'testtt', 50.00, 50.00, 30.00, 20.00, NULL, NULL, NULL, NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('2', 'PNL.1.00002', 'ASM.1.0002', 'tssss', 30.00, 40.00, 30.00, 30.00, NULL, NULL, NULL, NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('3', 'PNL.1.00002', 'ASM.1.0003', 'reess', 20.00, 50.00, 50.00, 0.00, NULL, NULL, NULL, NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('4', 'PNL.1.00003', 'ASM.1.0001', 'test', 30.00, 50.00, 20.00, 30.00, NULL, NULL, '2021-11-22 04:13:30', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00001', 'PNL.1.00003', 'ASM.1.0002', 'tst123', 70.00, 0.00, 50.00, 50.00, '2021-11-21 22:08:44', 'admin@mail.com', '2021-11-22 04:13:30', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00002', 'PNL.1.00004', 'ASM.1.0001', 'mampu mengerjakan', 30.00, 50.00, 30.00, 20.00, '2021-11-26 13:17:49', 'janti@ciputra.com', '2021-12-04 10:58:53', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00003', 'PNL.1.00004', 'ASM.1.0002', 'mampu mengerjakan', 20.00, 55.00, 25.00, 20.00, '2021-11-26 13:17:49', 'janti@ciputra.com', '2021-12-04 10:58:53', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00004', 'PNL.1.00004', 'ASM.1.0004', 'mampu mengerjakan', 30.00, 50.00, 30.00, 20.00, '2021-11-26 13:17:50', 'janti@ciputra.com', '2021-12-04 10:58:53', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00005', 'PNL.1.00004', 'ASM.1.0005', 'mampu mengerjakan', 20.00, 50.00, 50.00, 0.00, '2021-11-26 13:17:50', 'janti@ciputra.com', '2021-12-04 10:58:53', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00006', 'PNL.1.00005', 'ASM.1.0001', 'Lorem ipsum dolor sub amet', 5.00, 100.00, 0.00, 0.00, '2021-11-29 04:34:08', 'tesdosen1@gmail.com', '2021-11-29 04:34:08', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00007', 'PNL.1.00005', 'ASM.1.0002', 'Lorem ipsum dolor sub amet', 10.00, 100.00, 0.00, 0.00, '2021-11-29 04:34:08', 'tesdosen1@gmail.com', '2021-11-29 04:34:08', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00008', 'PNL.1.00005', 'ASM.1.0003', 'Lorem ipsum dolor sub amet', 15.00, 100.00, 0.00, 0.00, '2021-11-29 04:34:08', 'tesdosen1@gmail.com', '2021-11-29 04:34:08', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00009', 'PNL.1.00005', 'ASM.1.0004', 'Lorem ipsum dolor sub amet', 20.00, 70.00, 30.00, 0.00, '2021-11-29 04:34:08', 'tesdosen1@gmail.com', '2021-11-29 04:34:08', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00010', 'PNL.1.00005', 'ASM.1.0005', 'Lorem ipsum dolor sub amet', 30.00, 100.00, 0.00, 0.00, '2021-11-29 04:34:08', 'tesdosen1@gmail.com', '2021-11-29 04:34:08', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00011', 'PNL.1.00005', 'ASM.1.0006', 'Lorem ipsum dolor sub amet', 20.00, 50.00, 30.00, 20.00, '2021-11-29 04:34:08', 'tesdosen1@gmail.com', '2021-11-29 04:34:08', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00012', 'PNL.1.00006', 'ASM.1.0001', NULL, 20.00, 60.00, 40.00, 0.00, '2021-11-29 07:39:53', 'tesdosen2@gmail.com', '2021-12-03 06:46:01', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00013', 'PNL.1.00006', 'ASM.1.0004', NULL, 30.00, 100.00, 0.00, 0.00, '2021-11-29 07:39:53', 'tesdosen2@gmail.com', '2021-12-03 06:46:01', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00014', 'PNL.1.00006', 'ASM.1.0005', NULL, 50.00, 100.00, 0.00, 0.00, '2021-11-29 07:39:53', 'tesdosen2@gmail.com', '2021-12-03 06:46:01', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00015', 'PNL.1.00007', 'ASM.1.0001', 'Lorem ipsum', 20.00, 100.00, 0.00, 0.00, '2021-11-30 02:37:27', 'sewahyudi@ciputra.com', '2021-11-30 03:06:49', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00016', 'PNL.1.00007', 'ASM.1.0004', 'Lorem ipsum', 20.00, 60.00, 40.00, 0.00, '2021-11-30 02:37:27', 'sewahyudi@ciputra.com', '2021-11-30 03:06:49', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00017', 'PNL.1.00007', 'ASM.1.0005', 'Lorem ipsum', 30.00, 100.00, 0.00, 0.00, '2021-11-30 02:37:27', 'sewahyudi@ciputra.com', '2021-11-30 03:06:49', NULL);
INSERT INTO `t_penilaian_assessment` VALUES ('BS.1.00018', 'PNL.1.00007', 'ASM.1.0006', 'Lorem ipsum', 30.00, 50.00, 30.00, 20.00, '2021-11-30 02:37:27', 'sewahyudi@ciputra.com', '2021-11-30 03:06:49', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_penilaian_assessment_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_penilaian_assessment_detail`;
CREATE TABLE `t_penilaian_assessment_detail` (
  `penilaian_assessment_id` varchar(50) NOT NULL,
  `item_penilaian` varchar(255) NOT NULL,
  `id` varchar(50) NOT NULL DEFAULT '',
  `value_persentase` decimal(25,2) DEFAULT NULL,
  `dt_record` timestamp NULL DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 0 COMMENT '0 = dosen 1=mahasiswa',
  `status_penilai` int(11) DEFAULT NULL COMMENT '0=pengampu, 1=penilai, 2 =mahasiswa',
  `dosen_mahasiswa_id` varchar(50) NOT NULL DEFAULT '',
  `nilai` decimal(25,2) DEFAULT NULL,
  `catatan_nilai` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`penilaian_assessment_id`,`item_penilaian`,`dosen_mahasiswa_id`,`id`),
  KEY `penilaian_assessment_id` (`penilaian_assessment_id`) USING BTREE,
  KEY `dosen_mahasiswa_id` (`dosen_mahasiswa_id`) USING BTREE,
  KEY `id` (`id`),
  CONSTRAINT `t_penilaian_assessment_detail_ibfk_1` FOREIGN KEY (`penilaian_assessment_id`) REFERENCES `t_penilaian_assessment` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_penilaian_assessment_detail_ibfk_2` FOREIGN KEY (`dosen_mahasiswa_id`) REFERENCES `m_dosen_mahasiswa` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_penilaian_assessment_detail
-- ----------------------------
BEGIN;
INSERT INTO `t_penilaian_assessment_detail` VALUES ('1', 'testmakan', '1', 40.00, NULL, NULL, NULL, NULL, 0, NULL, 'DM.1.000003', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('4', 'tugas 1', 'PSD.1.00013', 50.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 0, 0, '1', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('4', 'tugas 1', 'PSD.1.00014', 50.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 21:10:41', NULL, 0, 1, '4', 75.00, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('4', 'tugas 1', 'PSD.1.00015', 50.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 1, 2, '7', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('4', 'tugas 1', 'PSD.1.00016', 50.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 1, 2, '8', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('4', 'tugas 2', 'PSD.1.00009', 20.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 0, 0, '1', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('4', 'tugas 2', 'PSD.1.00010', 20.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 21:10:41', NULL, 0, 1, '4', 90.00, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('4', 'tugas 2', 'PSD.1.00011', 20.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 1, 2, '7', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('4', 'tugas 2', 'PSD.1.00012', 20.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 1, 2, '8', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('4', 'tugas 3', 'PSD.1.00001', 30.00, '2021-11-22 03:49:39', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 0, 0, '1', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('4', 'tugas 3', 'PSD.1.00002', 30.00, '2021-11-22 03:49:39', 'admin@mail.com', '2021-11-22 21:10:41', NULL, 0, 1, '4', 82.50, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('4', 'tugas 3', 'PSD.1.00003', 30.00, '2021-11-22 03:49:39', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 1, 2, '7', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('4', 'tugas 3', 'PSD.1.00004', 30.00, '2021-11-22 03:49:39', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 1, 2, '8', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00001', 'quis 1', 'PSD.1.00021', 50.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 0, 0, '1', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00001', 'quis 1', 'PSD.1.00022', 50.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 0, 1, '2', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00001', 'quis 1', 'PSD.1.00023', 50.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 1, 2, '7', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00001', 'quis 1', 'PSD.1.00024', 50.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 1, 2, '8', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00001', 'quis 2', 'PSD.1.00017', 30.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 0, 0, '1', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00001', 'quis 2', 'PSD.1.00018', 30.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 0, 1, '2', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00001', 'quis 2', 'PSD.1.00019', 30.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 1, 2, '7', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00001', 'quis 2', 'PSD.1.00020', 30.00, '2021-11-22 03:58:30', 'admin@mail.com', '2021-11-22 03:58:30', NULL, 1, 2, '8', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00001', 'quis 3', 'PSD.1.00005', 20.00, '2021-11-22 03:49:39', 'admin@mail.com', '2021-11-22 03:49:39', NULL, 0, NULL, '1', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00001', 'quis 3', 'PSD.1.00006', 20.00, '2021-11-22 03:49:39', 'admin@mail.com', '2021-11-22 03:49:39', NULL, 0, NULL, '2', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00001', 'quis 3', 'PSD.1.00007', 20.00, '2021-11-22 03:49:39', 'admin@mail.com', '2021-11-22 03:49:39', NULL, 1, NULL, '7', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00001', 'quis 3', 'PSD.1.00008', 20.00, '2021-11-22 03:49:39', 'admin@mail.com', '2021-11-22 03:49:39', NULL, 1, NULL, '8', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 1', 'PSD.1.00025', 20.00, '2021-11-26 13:48:40', 'janti@ciputra.com', '2021-11-26 13:48:40', NULL, 0, 0, 'DM.1.000006', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 1', 'PSD.1.00026', 20.00, '2021-11-26 13:48:40', 'janti@ciputra.com', '2021-11-26 13:48:40', NULL, 0, 1, 'DM.1.000007', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 1', 'PSD.1.00027', 20.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 1, 'DM.1.000008', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 1', 'PSD.1.00028', 20.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000009', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 1', 'PSD.1.00029', 20.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000010', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 1', 'PSD.1.00030', 20.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000011', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 1', 'PSD.1.00031', 20.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000012', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 2', 'PSD.1.00032', 10.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 0, 'DM.1.000006', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 2', 'PSD.1.00033', 10.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 1, 'DM.1.000007', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 2', 'PSD.1.00034', 10.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 1, 'DM.1.000008', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 2', 'PSD.1.00035', 10.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000009', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 2', 'PSD.1.00036', 10.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000010', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 2', 'PSD.1.00037', 10.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000011', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 2', 'PSD.1.00038', 10.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000012', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 3', 'PSD.1.00039', 20.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 0, 'DM.1.000006', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 3', 'PSD.1.00040', 20.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 1, 'DM.1.000007', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 3', 'PSD.1.00041', 20.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 1, 'DM.1.000008', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 3', 'PSD.1.00042', 20.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000009', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 3', 'PSD.1.00043', 20.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000010', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 3', 'PSD.1.00044', 20.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000011', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 3', 'PSD.1.00045', 20.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000012', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 4', 'PSD.1.00046', 15.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 0, 'DM.1.000006', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 4', 'PSD.1.00047', 15.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 1, 'DM.1.000007', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 4', 'PSD.1.00048', 15.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 1, 'DM.1.000008', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 4', 'PSD.1.00049', 15.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000009', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 4', 'PSD.1.00050', 15.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000010', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 4', 'PSD.1.00051', 15.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000011', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 4', 'PSD.1.00052', 15.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000012', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 5', 'PSD.1.00053', 35.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 0, 'DM.1.000006', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 5', 'PSD.1.00054', 35.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 1, 'DM.1.000007', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 5', 'PSD.1.00055', 35.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 1, 'DM.1.000008', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 5', 'PSD.1.00056', 35.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000009', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 5', 'PSD.1.00057', 35.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000010', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 5', 'PSD.1.00058', 35.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000011', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00002', 'Tugas 5', 'PSD.1.00059', 35.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000012', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00003', 'Quiz', 'PSD.1.00060', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 0, 'DM.1.000006', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00003', 'Quiz', 'PSD.1.00061', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 1, 'DM.1.000007', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00003', 'Quiz', 'PSD.1.00062', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 1, 'DM.1.000008', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00003', 'Quiz', 'PSD.1.00063', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000009', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00003', 'Quiz', 'PSD.1.00064', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000010', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00003', 'Quiz', 'PSD.1.00065', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000011', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00003', 'Quiz', 'PSD.1.00066', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000012', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00004', 'UTS', 'PSD.1.00067', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 0, 'DM.1.000006', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00004', 'UTS', 'PSD.1.00068', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 1, 'DM.1.000007', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00004', 'UTS', 'PSD.1.00069', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 1, 'DM.1.000008', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00004', 'UTS', 'PSD.1.00070', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000009', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00004', 'UTS', 'PSD.1.00071', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000010', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00004', 'UTS', 'PSD.1.00072', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000011', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00004', 'UTS', 'PSD.1.00073', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 1, 2, 'DM.1.000012', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00005', 'UAS', 'PSD.1.00074', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 0, 'DM.1.000006', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00005', 'UAS', 'PSD.1.00075', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 1, 'DM.1.000007', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00005', 'UAS', 'PSD.1.00076', 100.00, '2021-11-26 13:48:41', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL, 0, 1, 'DM.1.000008', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00006', 'Tugas 1', 'PSD.1.00077', 10.00, '2021-11-29 04:36:54', 'tesdosen1@gmail.com', '2021-11-29 04:36:54', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00006', 'Tugas 2', 'PSD.1.00078', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00006', 'Tugas 3', 'PSD.1.00079', 20.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00006', 'Tugas 4', 'PSD.1.00080', 25.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00006', 'Tugas 5', 'PSD.1.00081', 30.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00007', 'Quiz 1', 'PSD.1.00082', 100.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00008', 'Soal 1', 'PSD.1.00083', 1.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00008', 'Soal 10', 'PSD.1.00092', 25.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00008', 'Soal 2', 'PSD.1.00084', 2.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00008', 'Soal 3', 'PSD.1.00085', 4.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00008', 'Soal 4', 'PSD.1.00086', 5.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00008', 'Soal 5', 'PSD.1.00087', 6.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00008', 'Soal 6', 'PSD.1.00088', 10.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00008', 'Soal 7', 'PSD.1.00089', 12.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00008', 'Soal 8', 'PSD.1.00090', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00008', 'Soal 9', 'PSD.1.00091', 20.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00009', 'UTS', 'PSD.1.00093', 100.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00009', 'UTS', 'PSD.1.00094', 100.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 1, 'DM.1.000014', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00010', 'UAS', 'PSD.1.00095', 100.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Materi Presentasi', 'PSD.1.00096', 35.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Materi Presentasi', 'PSD.1.00097', 35.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 1, 'DM.1.000014', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Materi Presentasi', 'PSD.1.00098', 35.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 1, 'DM.1.000015', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Materi Presentasi', 'PSD.1.00099', 35.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 1, 'DM.1.000016', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Materi Presentasi', 'PSD.1.00100', 35.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000023', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Materi Presentasi', 'PSD.1.00101', 35.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000024', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Materi Presentasi', 'PSD.1.00102', 35.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000025', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Materi Presentasi', 'PSD.1.00103', 35.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000026', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Materi Presentasi', 'PSD.1.00104', 35.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000027', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Materi Presentasi', 'PSD.1.00105', 35.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000028', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Materi Presentasi', 'PSD.1.00106', 35.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000029', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Materi Presentasi', 'PSD.1.00107', 35.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000030', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Materi Presentasi', 'PSD.1.00108', 35.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000031', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Materi Presentasi', 'PSD.1.00109', 35.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000032', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Penyampaian Materi', 'PSD.1.00138', 40.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Penyampaian Materi', 'PSD.1.00139', 40.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 1, 'DM.1.000014', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Penyampaian Materi', 'PSD.1.00140', 40.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 1, 'DM.1.000015', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Penyampaian Materi', 'PSD.1.00141', 40.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 1, 'DM.1.000016', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Penyampaian Materi', 'PSD.1.00142', 40.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000023', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Penyampaian Materi', 'PSD.1.00143', 40.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000024', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Penyampaian Materi', 'PSD.1.00144', 40.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000025', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Penyampaian Materi', 'PSD.1.00145', 40.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000026', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Penyampaian Materi', 'PSD.1.00146', 40.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000027', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Penyampaian Materi', 'PSD.1.00147', 40.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000028', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Penyampaian Materi', 'PSD.1.00148', 40.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000029', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Penyampaian Materi', 'PSD.1.00149', 40.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000030', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Penyampaian Materi', 'PSD.1.00150', 40.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000031', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Penyampaian Materi', 'PSD.1.00151', 40.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000032', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sikap Presentasi', 'PSD.1.00124', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sikap Presentasi', 'PSD.1.00125', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 1, 'DM.1.000014', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sikap Presentasi', 'PSD.1.00126', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 1, 'DM.1.000015', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sikap Presentasi', 'PSD.1.00127', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 1, 'DM.1.000016', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sikap Presentasi', 'PSD.1.00128', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000023', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sikap Presentasi', 'PSD.1.00129', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000024', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sikap Presentasi', 'PSD.1.00130', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000025', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sikap Presentasi', 'PSD.1.00131', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000026', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sikap Presentasi', 'PSD.1.00132', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000027', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sikap Presentasi', 'PSD.1.00133', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000028', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sikap Presentasi', 'PSD.1.00134', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000029', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sikap Presentasi', 'PSD.1.00135', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000030', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sikap Presentasi', 'PSD.1.00136', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000031', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sikap Presentasi', 'PSD.1.00137', 15.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000032', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sistematika Bahasa', 'PSD.1.00110', 10.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 0, 'DM.1.000013', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sistematika Bahasa', 'PSD.1.00111', 10.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 1, 'DM.1.000014', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sistematika Bahasa', 'PSD.1.00112', 10.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 1, 'DM.1.000015', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sistematika Bahasa', 'PSD.1.00113', 10.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 0, 1, 'DM.1.000016', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sistematika Bahasa', 'PSD.1.00114', 10.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000023', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sistematika Bahasa', 'PSD.1.00115', 10.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000024', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sistematika Bahasa', 'PSD.1.00116', 10.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000025', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sistematika Bahasa', 'PSD.1.00117', 10.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000026', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sistematika Bahasa', 'PSD.1.00118', 10.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000027', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sistematika Bahasa', 'PSD.1.00119', 10.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000028', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sistematika Bahasa', 'PSD.1.00120', 10.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000029', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sistematika Bahasa', 'PSD.1.00121', 10.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000030', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sistematika Bahasa', 'PSD.1.00122', 10.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000031', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00011', 'Sistematika Bahasa', 'PSD.1.00123', 10.00, '2021-11-29 04:36:55', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL, 1, 2, 'DM.1.000032', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00012', 'Tugas 1', 'PSD.1.00152', 10.00, '2021-11-29 07:41:24', 'tesdosen2@gmail.com', '2021-11-29 07:41:24', NULL, 0, 0, 'DM.1.000014', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00012', 'Tugas 1', 'PSD.1.00153', 10.00, '2021-11-29 07:41:24', 'tesdosen2@gmail.com', '2021-11-29 07:41:24', NULL, 0, 1, 'DM.1.000020', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00012', 'Tugas 1', 'PSD.1.00154', 10.00, '2021-11-29 07:41:24', 'tesdosen2@gmail.com', '2021-11-29 07:41:24', NULL, 0, 1, 'DM.1.000021', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00012', 'Tugas 2', 'PSD.1.00155', 20.00, '2021-11-29 07:41:24', 'tesdosen2@gmail.com', '2021-11-29 07:41:24', NULL, 0, 0, 'DM.1.000014', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00012', 'Tugas 2', 'PSD.1.00156', 20.00, '2021-11-29 07:41:24', 'tesdosen2@gmail.com', '2021-11-29 07:41:24', NULL, 0, 1, 'DM.1.000020', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00012', 'Tugas 2', 'PSD.1.00157', 20.00, '2021-11-29 07:41:24', 'tesdosen2@gmail.com', '2021-11-29 07:41:24', NULL, 0, 1, 'DM.1.000021', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00012', 'Tugas 3', 'PSD.1.00158', 70.00, '2021-11-29 07:41:24', 'tesdosen2@gmail.com', '2021-11-29 07:41:24', NULL, 0, 0, 'DM.1.000014', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00012', 'Tugas 3', 'PSD.1.00159', 70.00, '2021-11-29 07:41:24', 'tesdosen2@gmail.com', '2021-11-29 07:41:24', NULL, 0, 1, 'DM.1.000020', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00012', 'Tugas 3', 'PSD.1.00160', 70.00, '2021-11-29 07:41:24', 'tesdosen2@gmail.com', '2021-11-29 07:41:24', NULL, 0, 1, 'DM.1.000021', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00013', 'UTS', 'PSD.1.00161', 100.00, '2021-11-29 07:41:24', 'tesdosen2@gmail.com', '2021-11-29 07:41:24', NULL, 0, 0, 'DM.1.000014', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00014', 'UAS', 'PSD.1.00162', 100.00, '2021-11-29 07:41:24', 'tesdosen2@gmail.com', '2021-11-29 07:41:24', NULL, 0, 0, 'DM.1.000014', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00015', 'Tugas 1', 'PSD.1.00163', 20.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 0, 'DM.1.000033', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00015', 'Tugas 2', 'PSD.1.00164', 35.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 0, 'DM.1.000033', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00015', 'Tugas 3', 'PSD.1.00165', 45.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 0, 'DM.1.000033', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00016', 'Soal 1', 'PSD.1.00166', 50.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 0, 'DM.1.000033', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00016', 'Soal 1', 'PSD.1.00167', 50.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 1, 'DM.1.000034', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00016', 'Soal 2', 'PSD.1.00168', 50.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 0, 'DM.1.000033', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00016', 'Soal 2', 'PSD.1.00169', 50.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 1, 'DM.1.000034', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00017', 'Essay', 'PSD.1.00171', 60.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 0, 'DM.1.000033', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00017', 'Pilihan Ganda', 'PSD.1.00170', 40.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 0, 'DM.1.000033', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Materi Presentasi', 'PSD.1.00172', 30.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 0, 'DM.1.000033', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Materi Presentasi', 'PSD.1.00173', 30.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 1, 'DM.1.000034', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Materi Presentasi', 'PSD.1.00174', 30.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 1, 'DM.1.000035', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Materi Presentasi', 'PSD.1.00175', 30.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 1, 'DM.1.000036', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Materi Presentasi', 'PSD.1.00176', 30.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000041', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Materi Presentasi', 'PSD.1.00177', 30.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000042', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Materi Presentasi', 'PSD.1.00178', 30.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000043', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Materi Presentasi', 'PSD.1.00179', 30.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000044', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Materi Presentasi', 'PSD.1.00180', 30.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000045', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Materi Presentasi', 'PSD.1.00181', 30.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000046', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Materi Presentasi', 'PSD.1.00182', 30.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000047', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Materi Presentasi', 'PSD.1.00183', 30.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000048', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Materi Presentasi', 'PSD.1.00184', 30.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000049', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Materi Presentasi', 'PSD.1.00185', 30.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000050', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Penyampaian Materi', 'PSD.1.00186', 35.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 0, 'DM.1.000033', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Penyampaian Materi', 'PSD.1.00187', 35.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 1, 'DM.1.000034', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Penyampaian Materi', 'PSD.1.00188', 35.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 1, 'DM.1.000035', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Penyampaian Materi', 'PSD.1.00189', 35.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 1, 'DM.1.000036', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Penyampaian Materi', 'PSD.1.00190', 35.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000041', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Penyampaian Materi', 'PSD.1.00191', 35.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000042', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Penyampaian Materi', 'PSD.1.00192', 35.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000043', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Penyampaian Materi', 'PSD.1.00193', 35.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000044', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Penyampaian Materi', 'PSD.1.00194', 35.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000045', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Penyampaian Materi', 'PSD.1.00195', 35.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000046', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Penyampaian Materi', 'PSD.1.00196', 35.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000047', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Penyampaian Materi', 'PSD.1.00197', 35.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000048', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Penyampaian Materi', 'PSD.1.00198', 35.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000049', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Penyampaian Materi', 'PSD.1.00199', 35.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000050', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sikap Presentasi', 'PSD.1.00200', 10.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 0, 'DM.1.000033', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sikap Presentasi', 'PSD.1.00201', 10.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 1, 'DM.1.000034', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sikap Presentasi', 'PSD.1.00202', 10.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 1, 'DM.1.000035', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sikap Presentasi', 'PSD.1.00203', 10.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 1, 'DM.1.000036', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sikap Presentasi', 'PSD.1.00204', 10.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000041', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sikap Presentasi', 'PSD.1.00205', 10.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000042', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sikap Presentasi', 'PSD.1.00206', 10.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000043', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sikap Presentasi', 'PSD.1.00207', 10.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000044', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sikap Presentasi', 'PSD.1.00208', 10.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000045', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sikap Presentasi', 'PSD.1.00209', 10.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000046', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sikap Presentasi', 'PSD.1.00210', 10.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000047', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sikap Presentasi', 'PSD.1.00211', 10.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000048', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sikap Presentasi', 'PSD.1.00212', 10.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000049', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sikap Presentasi', 'PSD.1.00213', 10.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000050', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sistematika Bahasa', 'PSD.1.00214', 25.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 0, 'DM.1.000033', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sistematika Bahasa', 'PSD.1.00215', 25.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 1, 'DM.1.000034', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sistematika Bahasa', 'PSD.1.00216', 25.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 1, 'DM.1.000035', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sistematika Bahasa', 'PSD.1.00217', 25.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 0, 1, 'DM.1.000036', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sistematika Bahasa', 'PSD.1.00218', 25.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000041', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sistematika Bahasa', 'PSD.1.00219', 25.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000042', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sistematika Bahasa', 'PSD.1.00220', 25.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000043', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sistematika Bahasa', 'PSD.1.00221', 25.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000044', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sistematika Bahasa', 'PSD.1.00222', 25.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000045', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sistematika Bahasa', 'PSD.1.00223', 25.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000046', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sistematika Bahasa', 'PSD.1.00224', 25.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000047', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sistematika Bahasa', 'PSD.1.00225', 25.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000048', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sistematika Bahasa', 'PSD.1.00226', 25.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000049', NULL, NULL);
INSERT INTO `t_penilaian_assessment_detail` VALUES ('BS.1.00018', 'Sistematika Bahasa', 'PSD.1.00227', 25.00, '2021-11-30 02:39:48', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL, 1, 2, 'DM.1.000050', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_penilaian_dosen_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_penilaian_dosen_detail`;
CREATE TABLE `t_penilaian_dosen_detail` (
  `id` varchar(50) NOT NULL,
  `penilaian_id` varchar(50) NOT NULL,
  `dosen_mahasiswa_id` varchar(50) NOT NULL COMMENT 'dosen saja',
  `status` int(1) DEFAULT 0,
  `dt_record` timestamp NULL DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`penilaian_id`,`dosen_mahasiswa_id`) USING BTREE,
  KEY `penilaian_id` (`penilaian_id`) USING BTREE,
  KEY `dosen_mahasiswa_id` (`dosen_mahasiswa_id`) USING BTREE,
  CONSTRAINT `t_penilaian_dosen_detail_ibfk_1` FOREIGN KEY (`penilaian_id`) REFERENCES `t_penilaian_header` (`penilaian_id`) ON UPDATE CASCADE,
  CONSTRAINT `t_penilaian_dosen_detail_ibfk_2` FOREIGN KEY (`dosen_mahasiswa_id`) REFERENCES `m_dosen_mahasiswa` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_penilaian_dosen_detail
-- ----------------------------
BEGIN;
INSERT INTO `t_penilaian_dosen_detail` VALUES ('PNLD.1.00086', 'PNL.1.00002', 'DM.1.000003', 0, '2021-11-18 07:50:37', 'admin@mail.com', '2021-11-18 07:50:37', NULL);
INSERT INTO `t_penilaian_dosen_detail` VALUES ('PNLD.1.00630', 'PNL.1.00003', '1', 0, '2021-11-22 21:16:07', 'asetiobudi@ciputra.com', '2021-11-22 21:16:07', NULL);
INSERT INTO `t_penilaian_dosen_detail` VALUES ('PNLD.1.00631', 'PNL.1.00003', '2', 0, '2021-11-22 21:16:07', 'asetiobudi@ciputra.com', '2021-11-22 21:16:07', NULL);
INSERT INTO `t_penilaian_dosen_detail` VALUES ('PNLD.1.00641', 'PNL.1.00005', 'DM.1.000014', 0, '2021-11-29 04:32:04', 'tesdosen1@gmail.com', '2021-11-29 04:32:04', NULL);
INSERT INTO `t_penilaian_dosen_detail` VALUES ('PNLD.1.00642', 'PNL.1.00005', 'DM.1.000015', 0, '2021-11-29 04:32:04', 'tesdosen1@gmail.com', '2021-11-29 04:32:04', NULL);
INSERT INTO `t_penilaian_dosen_detail` VALUES ('PNLD.1.00643', 'PNL.1.00005', 'DM.1.000016', 0, '2021-11-29 04:32:04', 'tesdosen1@gmail.com', '2021-11-29 04:32:04', NULL);
INSERT INTO `t_penilaian_dosen_detail` VALUES ('PNLD.1.00665', 'PNL.1.00007', 'DM.1.000034', 0, '2021-11-30 03:06:44', 'sewahyudi@ciputra.com', '2021-11-30 03:06:44', NULL);
INSERT INTO `t_penilaian_dosen_detail` VALUES ('PNLD.1.00666', 'PNL.1.00007', 'DM.1.000035', 0, '2021-11-30 03:06:44', 'sewahyudi@ciputra.com', '2021-11-30 03:06:44', NULL);
INSERT INTO `t_penilaian_dosen_detail` VALUES ('PNLD.1.00667', 'PNL.1.00007', 'DM.1.000036', 0, '2021-11-30 03:06:44', 'sewahyudi@ciputra.com', '2021-11-30 03:06:44', NULL);
INSERT INTO `t_penilaian_dosen_detail` VALUES ('PNLD.1.00670', 'PNL.1.00006', 'DM.1.000020', 0, '2021-12-03 06:45:58', 'tesdosen2@gmail.com', '2021-12-03 06:45:58', NULL);
INSERT INTO `t_penilaian_dosen_detail` VALUES ('PNLD.1.00671', 'PNL.1.00006', 'DM.1.000021', 0, '2021-12-03 06:45:58', 'tesdosen2@gmail.com', '2021-12-03 06:45:58', NULL);
INSERT INTO `t_penilaian_dosen_detail` VALUES ('PNLD.1.00692', 'PNL.1.00004', 'DM.1.000007', 0, '2021-12-04 10:58:42', 'janti@ciputra.com', '2021-12-04 10:58:42', NULL);
INSERT INTO `t_penilaian_dosen_detail` VALUES ('PNLD.1.00693', 'PNL.1.00004', 'DM.1.000008', 0, '2021-12-04 10:58:42', 'janti@ciputra.com', '2021-12-04 10:58:42', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_penilaian_dosen_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `t_penilaian_dosen_mahasiswa`;
CREATE TABLE `t_penilaian_dosen_mahasiswa` (
  `penilaian_id` varchar(50) NOT NULL,
  `assessment_id` varchar(50) NOT NULL,
  `kelompok_mahasiswa` varchar(255) NOT NULL DEFAULT '',
  `dosen_mahasiswa_id` varchar(50) NOT NULL,
  `id` varchar(50) NOT NULL,
  `status_jabatan` int(11) DEFAULT 0 COMMENT '0= mahasiswa 1 = dosen',
  `dt_record` timestamp NULL DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dosen_mahasiswa_id`,`id`,`penilaian_id`,`assessment_id`),
  KEY `dosen_mahasiswa_id` (`dosen_mahasiswa_id`) USING BTREE,
  KEY `penilaian_dosen_id` (`penilaian_id`) USING BTREE,
  KEY `penilaian_assessment_id` (`assessment_id`) USING BTREE,
  CONSTRAINT `t_penilaian_dosen_assessment` FOREIGN KEY (`assessment_id`) REFERENCES `m_assessment` (`assessment_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `t_penilaian_dosen_mahasiswa_ibfk_1` FOREIGN KEY (`dosen_mahasiswa_id`) REFERENCES `m_dosen_mahasiswa` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_penilaian_dosen_penilaian` FOREIGN KEY (`penilaian_id`) REFERENCES `t_penilaian_header` (`penilaian_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_penilaian_dosen_mahasiswa
-- ----------------------------
BEGIN;
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00003', 'ASM.1.0001', '', '1', 'PMD.1.00014', 1, '2021-11-21 13:43:04', 'admin@mail.com', '2021-11-21 13:43:04', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00003', 'ASM.1.0003', '', '1', 'PMD.1.00028', 1, '2021-11-21 21:42:09', 'admin@mail.com', '2021-11-21 21:42:09', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00003', 'ASM.1.0002', '', '1', 'PMD.1.00034', 1, '2021-11-21 22:06:43', 'admin@mail.com', '2021-11-21 22:06:43', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00003', 'ASM.1.0003', '', '2', 'PMD.1.00029', 1, '2021-11-21 21:42:10', 'admin@mail.com', '2021-11-21 21:42:10', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00003', 'ASM.1.0002', '', '2', 'PMD.1.00035', 1, '2021-11-21 22:06:43', 'admin@mail.com', '2021-11-21 22:06:43', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00003', 'ASM.1.0001', '', '4', 'PMD.1.00015', 1, '2021-11-21 13:43:04', 'admin@mail.com', '2021-11-21 13:43:04', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00003', 'ASM.1.0002', 'kelompok 1', '7', 'PMD.1.00007', 0, '2021-11-21 09:39:29', 'admin@mail.com', '2021-11-21 09:39:29', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00003', 'ASM.1.0001', 'Kelompok 1', '7', 'PMD.1.00017', 0, '2021-11-21 14:02:45', 'admin@mail.com', '2021-11-21 14:02:45', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00003', 'ASM.1.0002', 'kelompok 1', '8', 'PMD.1.00006', 0, '2021-11-21 09:39:29', 'admin@mail.com', '2021-11-21 09:39:29', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00003', 'ASM.1.0001', 'Kelompok 1', '8', 'PMD.1.00016', 0, '2021-11-21 14:02:44', 'admin@mail.com', '2021-11-21 14:02:44', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0001', '', 'DM.1.000007', 'PMD.1.00038', 1, '2021-11-26 13:10:55', 'janti@ciputra.com', '2021-11-26 13:10:55', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0002', '', 'DM.1.000007', 'PMD.1.00044', 1, '2021-11-26 13:16:16', 'janti@ciputra.com', '2021-11-26 13:16:16', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0004', '', 'DM.1.000007', 'PMD.1.00050', 1, '2021-11-26 13:17:02', 'janti@ciputra.com', '2021-11-26 13:17:02', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0005', '', 'DM.1.000007', 'PMD.1.00056', 1, '2021-11-26 13:17:43', 'janti@ciputra.com', '2021-11-26 13:17:43', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0001', '', 'DM.1.000008', 'PMD.1.00039', 1, '2021-11-26 13:10:55', 'janti@ciputra.com', '2021-11-26 13:10:55', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0002', '', 'DM.1.000008', 'PMD.1.00045', 1, '2021-11-26 13:16:16', 'janti@ciputra.com', '2021-11-26 13:16:16', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0004', '', 'DM.1.000008', 'PMD.1.00051', 1, '2021-11-26 13:17:02', 'janti@ciputra.com', '2021-11-26 13:17:02', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0005', '', 'DM.1.000008', 'PMD.1.00057', 1, '2021-11-26 13:17:43', 'janti@ciputra.com', '2021-11-26 13:17:43', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0001', 'kelompok 1', 'DM.1.000009', 'PMD.1.00040', 0, '2021-11-26 13:11:09', 'janti@ciputra.com', '2021-11-26 13:11:09', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0002', 'kelompok 1', 'DM.1.000009', 'PMD.1.00046', 0, '2021-11-26 13:16:37', 'janti@ciputra.com', '2021-11-26 13:16:37', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0004', 'kelompok 1', 'DM.1.000009', 'PMD.1.00052', 0, '2021-11-26 13:17:25', 'janti@ciputra.com', '2021-11-26 13:17:25', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0001', 'kelompok 1', 'DM.1.000010', 'PMD.1.00041', 0, '2021-11-26 13:11:09', 'janti@ciputra.com', '2021-11-26 13:11:09', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0002', 'kelompok 1', 'DM.1.000010', 'PMD.1.00047', 0, '2021-11-26 13:16:37', 'janti@ciputra.com', '2021-11-26 13:16:37', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0004', 'kelompok 1', 'DM.1.000010', 'PMD.1.00053', 0, '2021-11-26 13:17:25', 'janti@ciputra.com', '2021-11-26 13:17:25', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0001', 'kelompok 1', 'DM.1.000011', 'PMD.1.00042', 0, '2021-11-26 13:11:09', 'janti@ciputra.com', '2021-11-26 13:11:09', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0002', 'kelompok 1', 'DM.1.000011', 'PMD.1.00048', 0, '2021-11-26 13:16:37', 'janti@ciputra.com', '2021-11-26 13:16:37', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0004', 'kelompok 1', 'DM.1.000011', 'PMD.1.00054', 0, '2021-11-26 13:17:25', 'janti@ciputra.com', '2021-11-26 13:17:25', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0001', 'kelompok 1', 'DM.1.000012', 'PMD.1.00043', 0, '2021-11-26 13:11:09', 'janti@ciputra.com', '2021-11-26 13:11:09', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0002', 'kelompok 1', 'DM.1.000012', 'PMD.1.00049', 0, '2021-11-26 13:16:37', 'janti@ciputra.com', '2021-11-26 13:16:37', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00004', 'ASM.1.0004', 'kelompok 1', 'DM.1.000012', 'PMD.1.00055', 0, '2021-11-26 13:17:25', 'janti@ciputra.com', '2021-11-26 13:17:25', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00005', 'ASM.1.0004', '', 'DM.1.000014', 'PMD.1.00058', 1, '2021-11-29 04:33:13', 'tesdosen1@gmail.com', '2021-11-29 04:33:13', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00005', 'ASM.1.0006', '', 'DM.1.000014', 'PMD.1.00059', 1, '2021-11-29 04:33:29', 'tesdosen1@gmail.com', '2021-11-29 04:33:29', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00005', 'ASM.1.0006', '', 'DM.1.000015', 'PMD.1.00060', 1, '2021-11-29 04:33:29', 'tesdosen1@gmail.com', '2021-11-29 04:33:29', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00005', 'ASM.1.0006', '', 'DM.1.000016', 'PMD.1.00061', 1, '2021-11-29 04:33:29', 'tesdosen1@gmail.com', '2021-11-29 04:33:29', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00006', 'ASM.1.0001', '', 'DM.1.000020', 'PMD.1.00072', 1, '2021-11-29 07:40:01', 'tesdosen2@gmail.com', '2021-11-29 07:40:01', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00006', 'ASM.1.0001', '', 'DM.1.000021', 'PMD.1.00073', 1, '2021-11-29 07:40:01', 'tesdosen2@gmail.com', '2021-11-29 07:40:01', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00005', 'ASM.1.0006', 'Kelompok 1', 'DM.1.000023', 'PMD.1.00062', 0, '2021-11-29 04:33:51', 'tesdosen1@gmail.com', '2021-11-29 04:33:51', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00005', 'ASM.1.0006', 'Kelompok 2', 'DM.1.000024', 'PMD.1.00067', 0, '2021-11-29 04:34:00', 'tesdosen1@gmail.com', '2021-11-29 04:34:00', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00005', 'ASM.1.0006', 'Kelompok 1', 'DM.1.000025', 'PMD.1.00063', 0, '2021-11-29 04:33:51', 'tesdosen1@gmail.com', '2021-11-29 04:33:51', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00005', 'ASM.1.0006', 'Kelompok 2', 'DM.1.000026', 'PMD.1.00068', 0, '2021-11-29 04:34:00', 'tesdosen1@gmail.com', '2021-11-29 04:34:00', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00005', 'ASM.1.0006', 'Kelompok 1', 'DM.1.000027', 'PMD.1.00064', 0, '2021-11-29 04:33:51', 'tesdosen1@gmail.com', '2021-11-29 04:33:51', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00005', 'ASM.1.0006', 'Kelompok 2', 'DM.1.000028', 'PMD.1.00069', 0, '2021-11-29 04:34:00', 'tesdosen1@gmail.com', '2021-11-29 04:34:00', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00005', 'ASM.1.0006', 'Kelompok 1', 'DM.1.000029', 'PMD.1.00065', 0, '2021-11-29 04:33:51', 'tesdosen1@gmail.com', '2021-11-29 04:33:51', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00005', 'ASM.1.0006', 'Kelompok 2', 'DM.1.000030', 'PMD.1.00070', 0, '2021-11-29 04:34:00', 'tesdosen1@gmail.com', '2021-11-29 04:34:00', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00005', 'ASM.1.0006', 'Kelompok 1', 'DM.1.000031', 'PMD.1.00066', 0, '2021-11-29 04:33:51', 'tesdosen1@gmail.com', '2021-11-29 04:33:51', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00005', 'ASM.1.0006', 'Kelompok 2', 'DM.1.000032', 'PMD.1.00071', 0, '2021-11-29 04:34:00', 'tesdosen1@gmail.com', '2021-11-29 04:34:00', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00007', 'ASM.1.0004', '', 'DM.1.000034', 'PMD.1.00074', 1, '2021-11-30 02:35:50', 'sewahyudi@ciputra.com', '2021-11-30 02:35:50', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00007', 'ASM.1.0006', '', 'DM.1.000034', 'PMD.1.00075', 1, '2021-11-30 02:36:24', 'sewahyudi@ciputra.com', '2021-11-30 02:36:24', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00007', 'ASM.1.0006', '', 'DM.1.000035', 'PMD.1.00076', 1, '2021-11-30 02:36:24', 'sewahyudi@ciputra.com', '2021-11-30 02:36:24', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00007', 'ASM.1.0006', '', 'DM.1.000036', 'PMD.1.00077', 1, '2021-11-30 02:36:24', 'sewahyudi@ciputra.com', '2021-11-30 02:36:24', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00007', 'ASM.1.0006', 'Kelompok 1', 'DM.1.000041', 'PMD.1.00078', 0, '2021-11-30 02:36:49', 'sewahyudi@ciputra.com', '2021-11-30 02:36:49', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00007', 'ASM.1.0006', 'Kelompok 2', 'DM.1.000042', 'PMD.1.00083', 0, '2021-11-30 02:37:00', 'sewahyudi@ciputra.com', '2021-11-30 02:37:00', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00007', 'ASM.1.0006', 'Kelompok 1', 'DM.1.000043', 'PMD.1.00079', 0, '2021-11-30 02:36:49', 'sewahyudi@ciputra.com', '2021-11-30 02:36:49', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00007', 'ASM.1.0006', 'Kelompok 2', 'DM.1.000044', 'PMD.1.00084', 0, '2021-11-30 02:37:00', 'sewahyudi@ciputra.com', '2021-11-30 02:37:00', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00007', 'ASM.1.0006', 'Kelompok 1', 'DM.1.000045', 'PMD.1.00080', 0, '2021-11-30 02:36:49', 'sewahyudi@ciputra.com', '2021-11-30 02:36:49', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00007', 'ASM.1.0006', 'Kelompok 2', 'DM.1.000046', 'PMD.1.00085', 0, '2021-11-30 02:37:00', 'sewahyudi@ciputra.com', '2021-11-30 02:37:00', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00007', 'ASM.1.0006', 'Kelompok 1', 'DM.1.000047', 'PMD.1.00081', 0, '2021-11-30 02:36:49', 'sewahyudi@ciputra.com', '2021-11-30 02:36:49', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00007', 'ASM.1.0006', 'Kelompok 2', 'DM.1.000048', 'PMD.1.00086', 0, '2021-11-30 02:37:00', 'sewahyudi@ciputra.com', '2021-11-30 02:37:00', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00007', 'ASM.1.0006', 'Kelompok 1', 'DM.1.000049', 'PMD.1.00082', 0, '2021-11-30 02:36:49', 'sewahyudi@ciputra.com', '2021-11-30 02:36:49', NULL);
INSERT INTO `t_penilaian_dosen_mahasiswa` VALUES ('PNL.1.00007', 'ASM.1.0006', 'Kelompok 2', 'DM.1.000050', 'PMD.1.00087', 0, '2021-11-30 02:37:00', 'sewahyudi@ciputra.com', '2021-11-30 02:37:00', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_penilaian_header
-- ----------------------------
DROP TABLE IF EXISTS `t_penilaian_header`;
CREATE TABLE `t_penilaian_header` (
  `penilaian_id` varchar(50) NOT NULL,
  `jadwal_kuliah_id` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT 0 COMMENT '1 = done',
  `status_transaksi` int(11) DEFAULT 0 COMMENT '1 = void 0 = unvoid',
  `dt_record` timestamp NULL DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_modified` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`penilaian_id`) USING BTREE,
  KEY `jadwal_kuliah_id` (`jadwal_kuliah_id`) USING BTREE,
  CONSTRAINT `t_penilaian_header_ibfk_1` FOREIGN KEY (`jadwal_kuliah_id`) REFERENCES `m_jadwal_kuliah` (`jadwal_kuliah_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_penilaian_header
-- ----------------------------
BEGIN;
INSERT INTO `t_penilaian_header` VALUES ('PNL.1.00002', 'BS.1.00002', 1, 0, '2021-11-17 03:26:58', 'admin@mail.com', '2021-11-17 03:26:58', NULL);
INSERT INTO `t_penilaian_header` VALUES ('PNL.1.00003', 'BS.1.00003', 1, 0, '2021-11-20 03:50:42', 'admin@mail.com', '2021-11-22 21:21:04', NULL);
INSERT INTO `t_penilaian_header` VALUES ('PNL.1.00004', 'BS.1.00005', 1, 0, '2021-11-26 12:08:37', 'janti@ciputra.com', '2021-11-26 13:48:41', NULL);
INSERT INTO `t_penilaian_header` VALUES ('PNL.1.00005', 'BS.1.00006', 1, 0, '2021-11-29 04:26:35', 'tesdosen1@gmail.com', '2021-11-29 04:36:55', NULL);
INSERT INTO `t_penilaian_header` VALUES ('PNL.1.00006', 'BS.1.00007', 1, 0, '2021-11-29 07:30:16', 'tesdosen2@gmail.com', '2021-11-29 07:41:24', NULL);
INSERT INTO `t_penilaian_header` VALUES ('PNL.1.00007', 'BS.1.00008', 1, 0, '2021-11-30 02:32:32', 'sewahyudi@ciputra.com', '2021-11-30 02:39:48', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_penilaian_mahasiswa_nilai
-- ----------------------------
DROP TABLE IF EXISTS `t_penilaian_mahasiswa_nilai`;
CREATE TABLE `t_penilaian_mahasiswa_nilai` (
  `id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `penilaian_assessment_detail_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `mahasiswa_dosen_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `nilai` decimal(25,2) DEFAULT NULL,
  `persen` decimal(25,2) DEFAULT NULL,
  `hasil` decimal(25,2) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `user_record` varchar(255) DEFAULT NULL,
  `dt_record` datetime DEFAULT NULL,
  `user_modified` varchar(255) DEFAULT NULL,
  `dt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_assessment_detail_penilaian` (`penilaian_assessment_detail_id`),
  KEY `fk_mahasiswa_dosen_penilaian` (`mahasiswa_dosen_id`),
  KEY `idx_mahasiswa_nilai` (`id`) USING BTREE,
  CONSTRAINT `fk_assessment_detail_penilaian` FOREIGN KEY (`penilaian_assessment_detail_id`) REFERENCES `t_penilaian_assessment_detail` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mahasiswa_dosen_penilaian` FOREIGN KEY (`mahasiswa_dosen_id`) REFERENCES `m_dosen_mahasiswa` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_penilaian_mahasiswa_nilai
-- ----------------------------
BEGIN;
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00001', 'PSD.1.00014', '7', 80.00, NULL, NULL, 'bagus', 'asetiobudi@ciputra.com', '2021-11-22 21:09:46', NULL, '2021-11-22 21:10:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00002', 'PSD.1.00010', '7', 90.00, NULL, NULL, 'bagus', 'asetiobudi@ciputra.com', '2021-11-22 21:09:46', NULL, '2021-11-22 21:10:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00003', 'PSD.1.00002', '7', 85.00, NULL, NULL, 'bagus', 'asetiobudi@ciputra.com', '2021-11-22 21:09:46', NULL, '2021-11-22 21:10:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00004', 'PSD.1.00014', '8', 70.00, NULL, NULL, 'mantap', 'asetiobudi@ciputra.com', '2021-11-22 21:09:46', NULL, '2021-11-22 21:10:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00005', 'PSD.1.00010', '8', 90.00, NULL, NULL, 'mantap', 'asetiobudi@ciputra.com', '2021-11-22 21:09:46', NULL, '2021-11-22 21:10:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00006', 'PSD.1.00002', '8', 80.00, NULL, NULL, 'mantap', 'asetiobudi@ciputra.com', '2021-11-22 21:09:46', NULL, '2021-11-22 21:10:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00007', 'PSD.1.00025', 'DM.1.000009', 80.00, 20.00, 16.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:18', NULL, '2021-11-27 15:26:19');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00008', 'PSD.1.00032', 'DM.1.000009', 90.00, 10.00, 9.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:18', NULL, '2021-11-27 15:26:19');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00009', 'PSD.1.00039', 'DM.1.000009', 80.00, 20.00, 16.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:18', NULL, '2021-11-27 15:26:20');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00010', 'PSD.1.00046', 'DM.1.000009', 90.00, 15.00, 13.50, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:18', NULL, '2021-11-27 15:26:20');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00011', 'PSD.1.00053', 'DM.1.000009', 80.00, 35.00, 28.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:18', NULL, '2021-11-27 15:26:20');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00012', 'PSD.1.00025', 'DM.1.000010', 80.00, 20.00, 16.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:19', NULL, '2021-11-27 15:26:20');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00013', 'PSD.1.00032', 'DM.1.000010', 90.00, 10.00, 9.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:19', NULL, '2021-11-27 15:26:20');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00014', 'PSD.1.00039', 'DM.1.000010', 80.00, 20.00, 16.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:19', NULL, '2021-11-27 15:26:20');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00015', 'PSD.1.00046', 'DM.1.000010', 80.00, 15.00, 12.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:19', NULL, '2021-11-27 15:26:20');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00016', 'PSD.1.00053', 'DM.1.000010', 80.00, 35.00, 28.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:19', NULL, '2021-11-27 15:26:20');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00017', 'PSD.1.00025', 'DM.1.000011', 80.00, 20.00, 16.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:19', NULL, '2021-11-27 15:26:20');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00018', 'PSD.1.00032', 'DM.1.000011', 80.00, 10.00, 8.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:19', NULL, '2021-11-27 15:26:20');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00019', 'PSD.1.00039', 'DM.1.000011', 80.00, 20.00, 16.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:19', NULL, '2021-11-27 15:26:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00020', 'PSD.1.00046', 'DM.1.000011', 80.00, 15.00, 12.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:20', NULL, '2021-11-27 15:26:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00021', 'PSD.1.00053', 'DM.1.000011', 80.00, 35.00, 28.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:20', NULL, '2021-11-27 15:26:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00022', 'PSD.1.00025', 'DM.1.000012', 80.00, 20.00, 16.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:20', NULL, '2021-11-27 15:26:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00023', 'PSD.1.00032', 'DM.1.000012', 90.00, 10.00, 9.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:20', NULL, '2021-11-27 15:26:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00024', 'PSD.1.00039', 'DM.1.000012', 80.00, 20.00, 16.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:20', NULL, '2021-11-27 15:26:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00025', 'PSD.1.00046', 'DM.1.000012', 70.00, 15.00, 10.50, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:20', NULL, '2021-11-27 15:26:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00026', 'PSD.1.00053', 'DM.1.000012', 100.00, 35.00, 35.00, 'undefined', 'janti@ciputra.com', '2021-11-27 14:46:20', NULL, '2021-11-27 15:26:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00027', 'PSD.1.00060', 'DM.1.000009', 80.00, 100.00, 80.00, 'undefined', 'janti@ciputra.com', '2021-11-27 15:26:57', NULL, '2021-11-27 15:26:57');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00028', 'PSD.1.00060', 'DM.1.000010', 90.00, 100.00, 90.00, 'undefined', 'janti@ciputra.com', '2021-11-27 15:26:57', NULL, '2021-11-27 15:26:57');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00029', 'PSD.1.00060', 'DM.1.000011', 70.00, 100.00, 70.00, 'undefined', 'janti@ciputra.com', '2021-11-27 15:26:57', NULL, '2021-11-27 15:26:57');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00030', 'PSD.1.00060', 'DM.1.000012', 90.00, 100.00, 90.00, 'undefined', 'janti@ciputra.com', '2021-11-27 15:26:57', NULL, '2021-11-27 15:26:57');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00031', 'PSD.1.00067', 'DM.1.000009', 80.00, 100.00, 80.00, 'undefined', 'janti@ciputra.com', '2021-11-27 15:28:13', NULL, '2021-11-27 15:28:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00032', 'PSD.1.00067', 'DM.1.000010', 75.00, 100.00, 75.00, 'undefined', 'janti@ciputra.com', '2021-11-27 15:28:13', NULL, '2021-11-27 15:28:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00033', 'PSD.1.00067', 'DM.1.000011', 90.00, 100.00, 90.00, 'undefined', 'janti@ciputra.com', '2021-11-27 15:28:13', NULL, '2021-11-27 15:28:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00034', 'PSD.1.00067', 'DM.1.000012', 89.00, 100.00, 89.00, 'undefined', 'janti@ciputra.com', '2021-11-27 15:28:13', NULL, '2021-11-27 15:28:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00035', 'PSD.1.00074', 'DM.1.000009', 70.00, 100.00, 70.00, 'undefined', 'janti@ciputra.com', '2021-11-27 15:28:34', NULL, '2021-11-27 15:28:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00036', 'PSD.1.00074', 'DM.1.000010', 80.00, 100.00, 80.00, 'undefined', 'janti@ciputra.com', '2021-11-27 15:28:34', NULL, '2021-11-27 15:28:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00037', 'PSD.1.00074', 'DM.1.000011', 90.00, 100.00, 90.00, 'undefined', 'janti@ciputra.com', '2021-11-27 15:28:34', NULL, '2021-11-27 15:28:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00038', 'PSD.1.00074', 'DM.1.000012', 95.00, 100.00, 95.00, 'undefined', 'janti@ciputra.com', '2021-11-27 15:28:34', NULL, '2021-11-27 15:28:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00039', 'PSD.1.00026', 'DM.1.000009', 60.00, 20.00, 12.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:41', NULL, '2021-11-27 15:31:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00040', 'PSD.1.00033', 'DM.1.000009', 55.00, 10.00, 5.50, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:41', NULL, '2021-11-27 15:31:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00041', 'PSD.1.00040', 'DM.1.000009', 70.00, 20.00, 14.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:41', NULL, '2021-11-27 15:31:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00042', 'PSD.1.00047', 'DM.1.000009', 87.00, 15.00, 13.05, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:41', NULL, '2021-11-27 15:31:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00043', 'PSD.1.00054', 'DM.1.000009', 88.00, 35.00, 30.80, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:41', NULL, '2021-11-27 15:31:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00044', 'PSD.1.00026', 'DM.1.000010', 80.00, 20.00, 16.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:41', NULL, '2021-11-27 15:31:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00045', 'PSD.1.00033', 'DM.1.000010', 90.00, 10.00, 9.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:42', NULL, '2021-11-27 15:31:42');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00046', 'PSD.1.00040', 'DM.1.000010', 70.00, 20.00, 14.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:42', NULL, '2021-11-27 15:31:42');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00047', 'PSD.1.00047', 'DM.1.000010', 80.00, 15.00, 12.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:42', NULL, '2021-11-27 15:31:42');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00048', 'PSD.1.00054', 'DM.1.000010', 80.00, 35.00, 28.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:42', NULL, '2021-11-27 15:31:42');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00049', 'PSD.1.00026', 'DM.1.000011', 80.00, 20.00, 16.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:42', NULL, '2021-11-27 15:31:42');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00050', 'PSD.1.00033', 'DM.1.000011', 85.00, 10.00, 8.50, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:42', NULL, '2021-11-27 15:31:42');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00051', 'PSD.1.00040', 'DM.1.000011', 90.00, 20.00, 18.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:42', NULL, '2021-11-27 15:31:42');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00052', 'PSD.1.00047', 'DM.1.000011', 99.00, 15.00, 14.85, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:42', NULL, '2021-11-27 15:31:42');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00053', 'PSD.1.00054', 'DM.1.000011', 97.00, 35.00, 33.95, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:42', NULL, '2021-11-27 15:31:42');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00054', 'PSD.1.00026', 'DM.1.000012', 70.00, 20.00, 14.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:42', NULL, '2021-11-27 15:31:42');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00055', 'PSD.1.00033', 'DM.1.000012', 60.00, 10.00, 6.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:43', NULL, '2021-11-27 15:31:43');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00056', 'PSD.1.00040', 'DM.1.000012', 90.00, 20.00, 18.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:43', NULL, '2021-11-27 15:31:43');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00057', 'PSD.1.00047', 'DM.1.000012', 70.00, 15.00, 10.50, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:43', NULL, '2021-11-27 15:31:43');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00058', 'PSD.1.00054', 'DM.1.000012', 90.00, 35.00, 31.50, 'undefined', 'febe@ciputra.com', '2021-11-27 15:31:43', NULL, '2021-11-27 15:31:43');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00059', 'PSD.1.00061', 'DM.1.000009', 90.00, 100.00, 90.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:34:04', NULL, '2021-11-27 15:34:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00060', 'PSD.1.00061', 'DM.1.000010', 70.00, 100.00, 70.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:34:04', NULL, '2021-11-27 15:34:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00061', 'PSD.1.00061', 'DM.1.000011', 80.00, 100.00, 80.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:34:05', NULL, '2021-11-27 15:34:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00062', 'PSD.1.00061', 'DM.1.000012', 80.00, 100.00, 80.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:34:05', NULL, '2021-11-27 15:34:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00063', 'PSD.1.00068', 'DM.1.000009', 80.00, 100.00, 80.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:34:40', NULL, '2021-11-27 15:34:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00064', 'PSD.1.00068', 'DM.1.000010', 70.00, 100.00, 70.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:34:40', NULL, '2021-11-27 15:34:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00065', 'PSD.1.00068', 'DM.1.000011', 80.00, 100.00, 80.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:34:40', NULL, '2021-11-27 15:34:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00066', 'PSD.1.00068', 'DM.1.000012', 70.00, 100.00, 70.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:34:40', NULL, '2021-11-27 15:34:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00067', 'PSD.1.00075', 'DM.1.000009', 80.00, 100.00, 80.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:35:03', NULL, '2021-11-27 15:35:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00068', 'PSD.1.00075', 'DM.1.000010', 80.00, 100.00, 80.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:35:03', NULL, '2021-11-27 15:35:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00069', 'PSD.1.00075', 'DM.1.000011', 80.00, 100.00, 80.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:35:03', NULL, '2021-11-27 15:35:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00070', 'PSD.1.00075', 'DM.1.000012', 90.00, 100.00, 90.00, 'undefined', 'febe@ciputra.com', '2021-11-27 15:35:03', NULL, '2021-11-27 15:35:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00071', 'PSD.1.00027', 'DM.1.000009', 70.00, 20.00, 14.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:37', NULL, '2021-11-27 15:36:37');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00072', 'PSD.1.00034', 'DM.1.000009', 90.00, 10.00, 9.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:37', NULL, '2021-11-27 15:36:37');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00073', 'PSD.1.00041', 'DM.1.000009', 80.00, 20.00, 16.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:38', NULL, '2021-11-27 15:36:38');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00074', 'PSD.1.00048', 'DM.1.000009', 90.00, 15.00, 13.50, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:38', NULL, '2021-11-27 15:36:38');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00075', 'PSD.1.00055', 'DM.1.000009', 80.00, 35.00, 28.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:38', NULL, '2021-11-27 15:36:38');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00076', 'PSD.1.00027', 'DM.1.000010', 80.00, 20.00, 16.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:38', NULL, '2021-11-27 15:36:38');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00077', 'PSD.1.00034', 'DM.1.000010', 80.00, 10.00, 8.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:38', NULL, '2021-11-27 15:36:38');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00078', 'PSD.1.00041', 'DM.1.000010', 90.00, 20.00, 18.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:39', NULL, '2021-11-27 15:36:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00079', 'PSD.1.00048', 'DM.1.000010', 80.00, 15.00, 12.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:39', NULL, '2021-11-27 15:36:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00080', 'PSD.1.00055', 'DM.1.000010', 80.00, 35.00, 28.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:39', NULL, '2021-11-27 15:36:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00081', 'PSD.1.00027', 'DM.1.000011', 90.00, 20.00, 18.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:39', NULL, '2021-11-27 15:36:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00082', 'PSD.1.00034', 'DM.1.000011', 90.00, 10.00, 9.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:39', NULL, '2021-11-27 15:36:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00083', 'PSD.1.00041', 'DM.1.000011', 90.00, 20.00, 18.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:39', NULL, '2021-11-27 15:36:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00084', 'PSD.1.00048', 'DM.1.000011', 90.00, 15.00, 13.50, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:39', NULL, '2021-11-27 15:36:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00085', 'PSD.1.00055', 'DM.1.000011', 90.00, 35.00, 31.50, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:39', NULL, '2021-11-27 15:36:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00086', 'PSD.1.00027', 'DM.1.000012', 60.00, 20.00, 12.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:40', NULL, '2021-11-27 15:36:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00087', 'PSD.1.00034', 'DM.1.000012', 50.00, 10.00, 5.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:40', NULL, '2021-11-27 15:36:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00088', 'PSD.1.00041', 'DM.1.000012', 90.00, 20.00, 18.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:40', NULL, '2021-11-27 15:36:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00089', 'PSD.1.00048', 'DM.1.000012', 80.00, 15.00, 12.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:40', NULL, '2021-11-27 15:36:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00090', 'PSD.1.00055', 'DM.1.000012', 80.00, 35.00, 28.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:36:40', NULL, '2021-11-27 15:36:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00091', 'PSD.1.00062', 'DM.1.000009', 90.00, 100.00, 90.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:37:58', NULL, '2021-11-27 15:37:58');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00092', 'PSD.1.00062', 'DM.1.000010', 80.00, 100.00, 80.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:37:58', NULL, '2021-11-27 15:37:58');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00093', 'PSD.1.00062', 'DM.1.000011', 80.00, 100.00, 80.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:37:58', NULL, '2021-11-27 15:37:58');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00094', 'PSD.1.00062', 'DM.1.000012', 80.00, 100.00, 80.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:37:58', NULL, '2021-11-27 15:37:58');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00095', 'PSD.1.00069', 'DM.1.000009', 70.00, 100.00, 70.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:38:44', NULL, '2021-11-27 15:38:44');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00096', 'PSD.1.00069', 'DM.1.000010', 85.00, 100.00, 85.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:38:44', NULL, '2021-11-27 15:38:44');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00097', 'PSD.1.00069', 'DM.1.000011', 80.00, 100.00, 80.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:38:44', NULL, '2021-11-27 15:38:44');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00098', 'PSD.1.00069', 'DM.1.000012', 90.00, 100.00, 90.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:38:45', NULL, '2021-11-27 15:38:45');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00099', 'PSD.1.00076', 'DM.1.000009', 80.00, 100.00, 80.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:39:41', NULL, '2021-11-27 15:39:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00100', 'PSD.1.00076', 'DM.1.000010', 90.00, 100.00, 90.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:39:41', NULL, '2021-11-27 15:39:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00101', 'PSD.1.00076', 'DM.1.000011', 80.00, 100.00, 80.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:39:41', NULL, '2021-11-27 15:39:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00102', 'PSD.1.00076', 'DM.1.000012', 70.00, 100.00, 70.00, 'undefined', 'laij@ciputra.com', '2021-11-27 15:39:41', NULL, '2021-11-27 15:39:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00103', 'PSD.1.00028', 'DM.1.000010', 70.00, 20.00, 14.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:22', NULL, '2021-11-27 15:45:22');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00104', 'PSD.1.00035', 'DM.1.000010', 90.00, 10.00, 9.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:22', NULL, '2021-11-27 15:45:22');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00105', 'PSD.1.00042', 'DM.1.000010', 90.00, 20.00, 18.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:22', NULL, '2021-11-27 15:45:22');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00106', 'PSD.1.00049', 'DM.1.000010', 80.00, 15.00, 12.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:22', NULL, '2021-11-27 15:45:22');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00107', 'PSD.1.00056', 'DM.1.000010', 80.00, 35.00, 28.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:22', NULL, '2021-11-27 15:45:22');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00108', 'PSD.1.00028', 'DM.1.000011', 80.00, 20.00, 16.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:22', NULL, '2021-11-27 15:45:22');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00109', 'PSD.1.00035', 'DM.1.000011', 80.00, 10.00, 8.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:23', NULL, '2021-11-27 15:45:23');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00110', 'PSD.1.00042', 'DM.1.000011', 90.00, 20.00, 18.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:23', NULL, '2021-11-27 15:45:23');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00111', 'PSD.1.00049', 'DM.1.000011', 87.00, 15.00, 13.05, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:23', NULL, '2021-11-27 15:45:23');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00112', 'PSD.1.00056', 'DM.1.000011', 90.00, 35.00, 31.50, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:23', NULL, '2021-11-27 15:45:23');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00113', 'PSD.1.00028', 'DM.1.000012', 80.00, 20.00, 16.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:23', NULL, '2021-11-27 15:45:23');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00114', 'PSD.1.00035', 'DM.1.000012', 80.00, 10.00, 8.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:23', NULL, '2021-11-27 15:45:23');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00115', 'PSD.1.00042', 'DM.1.000012', 80.00, 20.00, 16.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:24', NULL, '2021-11-27 15:45:24');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00116', 'PSD.1.00049', 'DM.1.000012', 80.00, 15.00, 12.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:24', NULL, '2021-11-27 15:45:24');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00117', 'PSD.1.00056', 'DM.1.000012', 80.00, 35.00, 28.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:24', NULL, '2021-11-27 15:45:24');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00118', 'PSD.1.00063', 'DM.1.000010', 80.00, 100.00, 80.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:45', NULL, '2021-11-27 15:45:45');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00119', 'PSD.1.00063', 'DM.1.000011', 80.00, 100.00, 80.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:45', NULL, '2021-11-27 15:45:45');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00120', 'PSD.1.00063', 'DM.1.000012', 90.00, 100.00, 90.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:45:45', NULL, '2021-11-27 15:45:45');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00121', 'PSD.1.00070', 'DM.1.000010', 80.00, 100.00, 80.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:46:04', NULL, '2021-11-27 15:46:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00122', 'PSD.1.00070', 'DM.1.000011', 80.00, 100.00, 80.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:46:04', NULL, '2021-11-27 15:46:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00123', 'PSD.1.00070', 'DM.1.000012', 80.00, 100.00, 80.00, 'undefined', 'dona@ciputra.com', '2021-11-27 15:46:04', NULL, '2021-11-27 15:46:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00124', 'PSD.1.00029', 'DM.1.000009', 80.00, 20.00, 16.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:47:40', NULL, '2021-11-27 15:47:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00125', 'PSD.1.00036', 'DM.1.000009', 90.00, 10.00, 9.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:47:40', NULL, '2021-11-27 15:47:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00126', 'PSD.1.00043', 'DM.1.000009', 70.00, 20.00, 14.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:47:40', NULL, '2021-11-27 15:47:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00127', 'PSD.1.00050', 'DM.1.000009', 85.00, 15.00, 12.75, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:47:40', NULL, '2021-11-27 15:47:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00128', 'PSD.1.00057', 'DM.1.000009', 90.00, 35.00, 31.50, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:47:40', NULL, '2021-11-27 15:47:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00129', 'PSD.1.00029', 'DM.1.000011', 80.00, 20.00, 16.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:47:40', NULL, '2021-11-27 15:47:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00130', 'PSD.1.00036', 'DM.1.000011', 75.00, 10.00, 7.50, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:47:41', NULL, '2021-11-27 15:47:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00131', 'PSD.1.00043', 'DM.1.000011', 80.00, 20.00, 16.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:47:41', NULL, '2021-11-27 15:47:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00132', 'PSD.1.00050', 'DM.1.000011', 80.00, 15.00, 12.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:47:41', NULL, '2021-11-27 15:47:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00133', 'PSD.1.00057', 'DM.1.000011', 80.00, 35.00, 28.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:47:41', NULL, '2021-11-27 15:47:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00134', 'PSD.1.00029', 'DM.1.000012', 90.00, 20.00, 18.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:47:42', NULL, '2021-11-27 15:47:42');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00135', 'PSD.1.00036', 'DM.1.000012', 90.00, 10.00, 9.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:47:42', NULL, '2021-11-27 15:47:42');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00136', 'PSD.1.00043', 'DM.1.000012', 90.00, 20.00, 18.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:47:42', NULL, '2021-11-27 15:47:42');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00137', 'PSD.1.00050', 'DM.1.000012', 90.00, 15.00, 13.50, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:47:43', NULL, '2021-11-27 15:47:43');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00138', 'PSD.1.00057', 'DM.1.000012', 90.00, 35.00, 31.50, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:47:43', NULL, '2021-11-27 15:47:43');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00139', 'PSD.1.00064', 'DM.1.000009', 80.00, 100.00, 80.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:48:00', NULL, '2021-11-27 15:48:00');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00140', 'PSD.1.00064', 'DM.1.000011', 85.00, 100.00, 85.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:48:00', NULL, '2021-11-27 15:48:00');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00141', 'PSD.1.00064', 'DM.1.000012', 75.00, 100.00, 75.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:48:00', NULL, '2021-11-27 15:48:00');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00142', 'PSD.1.00071', 'DM.1.000009', 80.00, 100.00, 80.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:48:21', NULL, '2021-11-27 15:48:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00143', 'PSD.1.00071', 'DM.1.000011', 80.00, 100.00, 80.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:48:21', NULL, '2021-11-27 15:48:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00144', 'PSD.1.00071', 'DM.1.000012', 85.00, 100.00, 85.00, 'undefined', 'bagus@ciputra.com', '2021-11-27 15:48:21', NULL, '2021-11-27 15:48:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00145', 'PSD.1.00030', 'DM.1.000009', 80.00, 20.00, 16.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:33', NULL, '2021-11-27 15:49:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00146', 'PSD.1.00037', 'DM.1.000009', 90.00, 10.00, 9.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:33', NULL, '2021-11-27 15:49:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00147', 'PSD.1.00044', 'DM.1.000009', 80.00, 20.00, 16.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:33', NULL, '2021-11-27 15:49:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00148', 'PSD.1.00051', 'DM.1.000009', 90.00, 15.00, 13.50, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:33', NULL, '2021-11-27 15:49:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00149', 'PSD.1.00058', 'DM.1.000009', 80.00, 35.00, 28.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:33', NULL, '2021-11-27 15:49:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00150', 'PSD.1.00030', 'DM.1.000010', 80.00, 20.00, 16.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:34', NULL, '2021-11-27 15:49:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00151', 'PSD.1.00037', 'DM.1.000010', 80.00, 10.00, 8.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:34', NULL, '2021-11-27 15:49:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00152', 'PSD.1.00044', 'DM.1.000010', 80.00, 20.00, 16.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:34', NULL, '2021-11-27 15:49:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00153', 'PSD.1.00051', 'DM.1.000010', 90.00, 15.00, 13.50, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:34', NULL, '2021-11-27 15:49:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00154', 'PSD.1.00058', 'DM.1.000010', 80.00, 35.00, 28.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:34', NULL, '2021-11-27 15:49:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00155', 'PSD.1.00030', 'DM.1.000012', 75.00, 20.00, 15.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:34', NULL, '2021-11-27 15:49:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00156', 'PSD.1.00037', 'DM.1.000012', 75.00, 10.00, 7.50, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:35', NULL, '2021-11-27 15:49:35');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00157', 'PSD.1.00044', 'DM.1.000012', 75.00, 20.00, 15.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:35', NULL, '2021-11-27 15:49:35');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00158', 'PSD.1.00051', 'DM.1.000012', 75.00, 15.00, 11.25, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:35', NULL, '2021-11-27 15:49:35');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00159', 'PSD.1.00058', 'DM.1.000012', 75.00, 35.00, 26.25, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:35', NULL, '2021-11-27 15:49:35');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00160', 'PSD.1.00065', 'DM.1.000009', 90.00, 100.00, 90.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:55', NULL, '2021-11-27 15:49:55');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00161', 'PSD.1.00065', 'DM.1.000010', 80.00, 100.00, 80.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:55', NULL, '2021-11-27 15:49:55');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00162', 'PSD.1.00065', 'DM.1.000012', 70.00, 100.00, 70.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:49:55', NULL, '2021-11-27 15:49:55');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00163', 'PSD.1.00072', 'DM.1.000009', 80.00, 100.00, 80.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:50:09', NULL, '2021-11-27 15:50:09');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00164', 'PSD.1.00072', 'DM.1.000010', 80.00, 100.00, 80.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:50:09', NULL, '2021-11-27 15:50:09');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00165', 'PSD.1.00072', 'DM.1.000012', 80.00, 100.00, 80.00, 'undefined', 'bagas@ciputra.com', '2021-11-27 15:50:09', NULL, '2021-11-27 15:50:09');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00166', 'PSD.1.00077', 'DM.1.000023', 91.00, 10.00, 9.10, 'Catatan Tugas Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00167', 'PSD.1.00078', 'DM.1.000023', 95.00, 15.00, 14.25, 'Catatan Tugas Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00168', 'PSD.1.00079', 'DM.1.000023', 87.00, 20.00, 17.40, 'Catatan Tugas Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00169', 'PSD.1.00080', 'DM.1.000023', 98.00, 25.00, 24.50, 'Catatan Tugas Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00170', 'PSD.1.00081', 'DM.1.000023', 73.00, 30.00, 21.90, 'Catatan Tugas Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00171', 'PSD.1.00077', 'DM.1.000024', 90.00, 10.00, 9.00, 'Catatan Tugas Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00172', 'PSD.1.00078', 'DM.1.000024', 91.00, 15.00, 13.65, 'Catatan Tugas Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00173', 'PSD.1.00079', 'DM.1.000024', 92.00, 20.00, 18.40, 'Catatan Tugas Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00174', 'PSD.1.00080', 'DM.1.000024', 93.00, 25.00, 23.25, 'Catatan Tugas Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00175', 'PSD.1.00081', 'DM.1.000024', 94.00, 30.00, 28.20, 'Catatan Tugas Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00176', 'PSD.1.00077', 'DM.1.000025', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00177', 'PSD.1.00078', 'DM.1.000025', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00178', 'PSD.1.00079', 'DM.1.000025', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00179', 'PSD.1.00080', 'DM.1.000025', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00180', 'PSD.1.00081', 'DM.1.000025', 0.00, 30.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00181', 'PSD.1.00077', 'DM.1.000026', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00182', 'PSD.1.00078', 'DM.1.000026', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00183', 'PSD.1.00079', 'DM.1.000026', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00184', 'PSD.1.00080', 'DM.1.000026', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00185', 'PSD.1.00081', 'DM.1.000026', 0.00, 30.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00186', 'PSD.1.00077', 'DM.1.000027', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00187', 'PSD.1.00078', 'DM.1.000027', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00188', 'PSD.1.00079', 'DM.1.000027', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00189', 'PSD.1.00080', 'DM.1.000027', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00190', 'PSD.1.00081', 'DM.1.000027', 0.00, 30.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00191', 'PSD.1.00077', 'DM.1.000028', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00192', 'PSD.1.00078', 'DM.1.000028', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00193', 'PSD.1.00079', 'DM.1.000028', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00194', 'PSD.1.00080', 'DM.1.000028', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00195', 'PSD.1.00081', 'DM.1.000028', 0.00, 30.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00196', 'PSD.1.00077', 'DM.1.000029', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00197', 'PSD.1.00078', 'DM.1.000029', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00198', 'PSD.1.00079', 'DM.1.000029', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00199', 'PSD.1.00080', 'DM.1.000029', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00200', 'PSD.1.00081', 'DM.1.000029', 0.00, 30.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00201', 'PSD.1.00077', 'DM.1.000030', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00202', 'PSD.1.00078', 'DM.1.000030', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00203', 'PSD.1.00079', 'DM.1.000030', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00204', 'PSD.1.00080', 'DM.1.000030', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00205', 'PSD.1.00081', 'DM.1.000030', 0.00, 30.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00206', 'PSD.1.00077', 'DM.1.000031', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00207', 'PSD.1.00078', 'DM.1.000031', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00208', 'PSD.1.00079', 'DM.1.000031', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00209', 'PSD.1.00080', 'DM.1.000031', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00210', 'PSD.1.00081', 'DM.1.000031', 0.00, 30.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00211', 'PSD.1.00077', 'DM.1.000032', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00212', 'PSD.1.00078', 'DM.1.000032', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00213', 'PSD.1.00079', 'DM.1.000032', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:37');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00214', 'PSD.1.00080', 'DM.1.000032', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:37');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00215', 'PSD.1.00081', 'DM.1.000032', 0.00, 30.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:01', NULL, '2021-11-30 03:18:37');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00216', 'PSD.1.00082', 'DM.1.000023', 82.00, 100.00, 82.00, 'Catatan Quiz 1 Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:38:30', NULL, '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00217', 'PSD.1.00082', 'DM.1.000024', 90.00, 100.00, 90.00, 'Catatan Quiz 1 Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:38:30', NULL, '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00218', 'PSD.1.00082', 'DM.1.000025', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:30', NULL, '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00219', 'PSD.1.00082', 'DM.1.000026', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:30', NULL, '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00220', 'PSD.1.00082', 'DM.1.000027', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:30', NULL, '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00221', 'PSD.1.00082', 'DM.1.000028', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:30', NULL, '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00222', 'PSD.1.00082', 'DM.1.000029', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:30', NULL, '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00223', 'PSD.1.00082', 'DM.1.000030', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:30', NULL, '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00224', 'PSD.1.00082', 'DM.1.000031', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:30', NULL, '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00225', 'PSD.1.00082', 'DM.1.000032', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:38:30', NULL, '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00226', 'PSD.1.00083', 'DM.1.000023', 100.00, 1.00, 1.00, 'Catatan Quiz 2 Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00227', 'PSD.1.00092', 'DM.1.000023', 65.00, 25.00, 16.25, 'Catatan Quiz 2 Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00228', 'PSD.1.00084', 'DM.1.000023', 80.00, 2.00, 1.60, 'Catatan Quiz 2 Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00229', 'PSD.1.00085', 'DM.1.000023', 75.00, 4.00, 3.00, 'Catatan Quiz 2 Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00230', 'PSD.1.00086', 'DM.1.000023', 95.00, 5.00, 4.75, 'Catatan Quiz 2 Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00231', 'PSD.1.00087', 'DM.1.000023', 90.00, 6.00, 5.40, 'Catatan Quiz 2 Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00232', 'PSD.1.00088', 'DM.1.000023', 50.00, 10.00, 5.00, 'Catatan Quiz 2 Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00233', 'PSD.1.00089', 'DM.1.000023', 65.00, 12.00, 7.80, 'Catatan Quiz 2 Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00234', 'PSD.1.00090', 'DM.1.000023', 50.00, 15.00, 7.50, 'Catatan Quiz 2 Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00235', 'PSD.1.00091', 'DM.1.000023', 70.00, 20.00, 14.00, 'Catatan Quiz 2 Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00236', 'PSD.1.00083', 'DM.1.000024', 90.00, 1.00, 0.90, 'Catatan Quiz 2 Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00237', 'PSD.1.00092', 'DM.1.000024', 99.00, 25.00, 24.75, 'Catatan Quiz 2 Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00238', 'PSD.1.00084', 'DM.1.000024', 91.00, 2.00, 1.82, 'Catatan Quiz 2 Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00239', 'PSD.1.00085', 'DM.1.000024', 92.00, 4.00, 3.68, 'Catatan Quiz 2 Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00240', 'PSD.1.00086', 'DM.1.000024', 93.00, 5.00, 4.65, 'Catatan Quiz 2 Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00241', 'PSD.1.00087', 'DM.1.000024', 94.00, 6.00, 5.64, 'Catatan Quiz 2 Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00242', 'PSD.1.00088', 'DM.1.000024', 95.00, 10.00, 9.50, 'Catatan Quiz 2 Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00243', 'PSD.1.00089', 'DM.1.000024', 96.00, 12.00, 11.52, 'Catatan Quiz 2 Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00244', 'PSD.1.00090', 'DM.1.000024', 97.00, 15.00, 14.55, 'Catatan Quiz 2 Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00245', 'PSD.1.00091', 'DM.1.000024', 98.00, 20.00, 19.60, 'Catatan Quiz 2 Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00246', 'PSD.1.00083', 'DM.1.000025', 0.00, 1.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00247', 'PSD.1.00092', 'DM.1.000025', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00248', 'PSD.1.00084', 'DM.1.000025', 0.00, 2.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00249', 'PSD.1.00085', 'DM.1.000025', 0.00, 4.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00250', 'PSD.1.00086', 'DM.1.000025', 0.00, 5.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00251', 'PSD.1.00087', 'DM.1.000025', 0.00, 6.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00252', 'PSD.1.00088', 'DM.1.000025', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00253', 'PSD.1.00089', 'DM.1.000025', 0.00, 12.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00254', 'PSD.1.00090', 'DM.1.000025', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00255', 'PSD.1.00091', 'DM.1.000025', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00256', 'PSD.1.00083', 'DM.1.000026', 0.00, 1.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00257', 'PSD.1.00092', 'DM.1.000026', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00258', 'PSD.1.00084', 'DM.1.000026', 0.00, 2.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00259', 'PSD.1.00085', 'DM.1.000026', 0.00, 4.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00260', 'PSD.1.00086', 'DM.1.000026', 0.00, 5.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00261', 'PSD.1.00087', 'DM.1.000026', 0.00, 6.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00262', 'PSD.1.00088', 'DM.1.000026', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00263', 'PSD.1.00089', 'DM.1.000026', 0.00, 12.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00264', 'PSD.1.00090', 'DM.1.000026', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00265', 'PSD.1.00091', 'DM.1.000026', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00266', 'PSD.1.00083', 'DM.1.000027', 0.00, 1.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00267', 'PSD.1.00092', 'DM.1.000027', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00268', 'PSD.1.00084', 'DM.1.000027', 0.00, 2.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00269', 'PSD.1.00085', 'DM.1.000027', 0.00, 4.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00270', 'PSD.1.00086', 'DM.1.000027', 0.00, 5.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00271', 'PSD.1.00087', 'DM.1.000027', 0.00, 6.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00272', 'PSD.1.00088', 'DM.1.000027', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00273', 'PSD.1.00089', 'DM.1.000027', 0.00, 12.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00274', 'PSD.1.00090', 'DM.1.000027', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00275', 'PSD.1.00091', 'DM.1.000027', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00276', 'PSD.1.00083', 'DM.1.000028', 0.00, 1.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00277', 'PSD.1.00092', 'DM.1.000028', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00278', 'PSD.1.00084', 'DM.1.000028', 0.00, 2.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00279', 'PSD.1.00085', 'DM.1.000028', 0.00, 4.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:30', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00280', 'PSD.1.00086', 'DM.1.000028', 0.00, 5.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00281', 'PSD.1.00087', 'DM.1.000028', 0.00, 6.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00282', 'PSD.1.00088', 'DM.1.000028', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00283', 'PSD.1.00089', 'DM.1.000028', 0.00, 12.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00284', 'PSD.1.00090', 'DM.1.000028', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00285', 'PSD.1.00091', 'DM.1.000028', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00286', 'PSD.1.00083', 'DM.1.000029', 0.00, 1.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00287', 'PSD.1.00092', 'DM.1.000029', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00288', 'PSD.1.00084', 'DM.1.000029', 0.00, 2.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00289', 'PSD.1.00085', 'DM.1.000029', 0.00, 4.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00290', 'PSD.1.00086', 'DM.1.000029', 0.00, 5.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00291', 'PSD.1.00087', 'DM.1.000029', 0.00, 6.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00292', 'PSD.1.00088', 'DM.1.000029', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00293', 'PSD.1.00089', 'DM.1.000029', 0.00, 12.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00294', 'PSD.1.00090', 'DM.1.000029', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00295', 'PSD.1.00091', 'DM.1.000029', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00296', 'PSD.1.00083', 'DM.1.000030', 0.00, 1.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00297', 'PSD.1.00092', 'DM.1.000030', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00298', 'PSD.1.00084', 'DM.1.000030', 0.00, 2.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00299', 'PSD.1.00085', 'DM.1.000030', 0.00, 4.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00300', 'PSD.1.00086', 'DM.1.000030', 0.00, 5.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00301', 'PSD.1.00087', 'DM.1.000030', 0.00, 6.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00302', 'PSD.1.00088', 'DM.1.000030', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00303', 'PSD.1.00089', 'DM.1.000030', 0.00, 12.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00304', 'PSD.1.00090', 'DM.1.000030', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00305', 'PSD.1.00091', 'DM.1.000030', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00306', 'PSD.1.00083', 'DM.1.000031', 0.00, 1.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00307', 'PSD.1.00092', 'DM.1.000031', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00308', 'PSD.1.00084', 'DM.1.000031', 0.00, 2.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00309', 'PSD.1.00085', 'DM.1.000031', 0.00, 4.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00310', 'PSD.1.00086', 'DM.1.000031', 0.00, 5.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00311', 'PSD.1.00087', 'DM.1.000031', 0.00, 6.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00312', 'PSD.1.00088', 'DM.1.000031', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00313', 'PSD.1.00089', 'DM.1.000031', 0.00, 12.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00314', 'PSD.1.00090', 'DM.1.000031', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00315', 'PSD.1.00091', 'DM.1.000031', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00316', 'PSD.1.00083', 'DM.1.000032', 0.00, 1.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00317', 'PSD.1.00092', 'DM.1.000032', 0.00, 25.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00318', 'PSD.1.00084', 'DM.1.000032', 0.00, 2.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00319', 'PSD.1.00085', 'DM.1.000032', 0.00, 4.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00320', 'PSD.1.00086', 'DM.1.000032', 0.00, 5.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00321', 'PSD.1.00087', 'DM.1.000032', 0.00, 6.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00322', 'PSD.1.00088', 'DM.1.000032', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00323', 'PSD.1.00089', 'DM.1.000032', 0.00, 12.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00324', 'PSD.1.00090', 'DM.1.000032', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00325', 'PSD.1.00091', 'DM.1.000032', 0.00, 20.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:31', NULL, '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00326', 'PSD.1.00093', 'DM.1.000023', 90.00, 100.00, 90.00, 'Catatan UTS Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:39:50', NULL, '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00327', 'PSD.1.00093', 'DM.1.000024', 90.00, 100.00, 90.00, 'Catatan UTS Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:39:50', NULL, '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00328', 'PSD.1.00093', 'DM.1.000025', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:50', NULL, '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00329', 'PSD.1.00093', 'DM.1.000026', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:50', NULL, '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00330', 'PSD.1.00093', 'DM.1.000027', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:50', NULL, '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00331', 'PSD.1.00093', 'DM.1.000028', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:50', NULL, '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00332', 'PSD.1.00093', 'DM.1.000029', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:50', NULL, '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00333', 'PSD.1.00093', 'DM.1.000030', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:51', NULL, '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00334', 'PSD.1.00093', 'DM.1.000031', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:51', NULL, '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00335', 'PSD.1.00093', 'DM.1.000032', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:39:51', NULL, '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00336', 'PSD.1.00095', 'DM.1.000023', 83.00, 100.00, 83.00, 'Catatan UAS Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:40:21', NULL, '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00337', 'PSD.1.00095', 'DM.1.000024', 90.00, 100.00, 90.00, 'Catatan UAS Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:40:21', NULL, '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00338', 'PSD.1.00095', 'DM.1.000025', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:40:21', NULL, '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00339', 'PSD.1.00095', 'DM.1.000026', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:40:21', NULL, '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00340', 'PSD.1.00095', 'DM.1.000027', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:40:21', NULL, '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00341', 'PSD.1.00095', 'DM.1.000028', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:40:21', NULL, '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00342', 'PSD.1.00095', 'DM.1.000029', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:40:21', NULL, '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00343', 'PSD.1.00095', 'DM.1.000030', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:40:21', NULL, '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00344', 'PSD.1.00095', 'DM.1.000031', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:40:21', NULL, '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00345', 'PSD.1.00095', 'DM.1.000032', 0.00, 100.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:40:21', NULL, '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00346', 'PSD.1.00096', 'DM.1.000023', 87.00, 35.00, 30.45, 'Catatan Presentasi Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00347', 'PSD.1.00138', 'DM.1.000023', 85.00, 40.00, 34.00, 'Catatan Presentasi Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00348', 'PSD.1.00124', 'DM.1.000023', 90.00, 15.00, 13.50, 'Catatan Presentasi Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00349', 'PSD.1.00110', 'DM.1.000023', 95.00, 10.00, 9.50, 'Catatan Presentasi Dosen 1 Mahasiswa 1', 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00350', 'PSD.1.00096', 'DM.1.000024', 90.00, 35.00, 31.50, 'Catatan Presentasi Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00351', 'PSD.1.00138', 'DM.1.000024', 93.00, 40.00, 37.20, 'Catatan Presentasi Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00352', 'PSD.1.00124', 'DM.1.000024', 92.00, 15.00, 13.80, 'Catatan Presentasi Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00353', 'PSD.1.00110', 'DM.1.000024', 91.00, 10.00, 9.10, 'Catatan Presentasi Dosen 1 Mahasiswa 2', 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00354', 'PSD.1.00096', 'DM.1.000025', 0.00, 35.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00355', 'PSD.1.00138', 'DM.1.000025', 0.00, 40.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00356', 'PSD.1.00124', 'DM.1.000025', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00357', 'PSD.1.00110', 'DM.1.000025', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00358', 'PSD.1.00096', 'DM.1.000026', 0.00, 35.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00359', 'PSD.1.00138', 'DM.1.000026', 0.00, 40.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00360', 'PSD.1.00124', 'DM.1.000026', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00361', 'PSD.1.00110', 'DM.1.000026', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00362', 'PSD.1.00096', 'DM.1.000027', 0.00, 35.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00363', 'PSD.1.00138', 'DM.1.000027', 0.00, 40.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:06', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00364', 'PSD.1.00124', 'DM.1.000027', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00365', 'PSD.1.00110', 'DM.1.000027', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00366', 'PSD.1.00096', 'DM.1.000028', 0.00, 35.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00367', 'PSD.1.00138', 'DM.1.000028', 0.00, 40.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:05');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00368', 'PSD.1.00124', 'DM.1.000028', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00369', 'PSD.1.00110', 'DM.1.000028', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00370', 'PSD.1.00096', 'DM.1.000029', 0.00, 35.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00371', 'PSD.1.00138', 'DM.1.000029', 0.00, 40.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00372', 'PSD.1.00124', 'DM.1.000029', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00373', 'PSD.1.00110', 'DM.1.000029', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00374', 'PSD.1.00096', 'DM.1.000030', 0.00, 35.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00375', 'PSD.1.00138', 'DM.1.000030', 0.00, 40.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00376', 'PSD.1.00124', 'DM.1.000030', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00377', 'PSD.1.00110', 'DM.1.000030', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00378', 'PSD.1.00096', 'DM.1.000031', 0.00, 35.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00379', 'PSD.1.00138', 'DM.1.000031', 0.00, 40.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00380', 'PSD.1.00124', 'DM.1.000031', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00381', 'PSD.1.00110', 'DM.1.000031', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00382', 'PSD.1.00096', 'DM.1.000032', 0.00, 35.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00383', 'PSD.1.00138', 'DM.1.000032', 0.00, 40.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00384', 'PSD.1.00124', 'DM.1.000032', 0.00, 15.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00385', 'PSD.1.00110', 'DM.1.000032', 0.00, 10.00, 0.00, NULL, 'tesdosen1@gmail.com', '2021-11-29 04:41:07', NULL, '2021-11-30 03:20:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00386', 'PSD.1.00094', 'DM.1.000023', 85.00, 100.00, 85.00, 'Catatan UTS Dosen 2 Mahasiswa 1', 'tesdosen2@gmail.com', '2021-11-29 04:43:05', NULL, '2021-11-30 03:15:48');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00387', 'PSD.1.00094', 'DM.1.000024', 100.00, 100.00, 100.00, 'Catatan UTS Dosen 2 Mahasiswa 2', 'tesdosen2@gmail.com', '2021-11-29 04:43:06', NULL, '2021-11-30 03:15:48');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00388', 'PSD.1.00094', 'DM.1.000025', 0.00, 100.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:06', NULL, '2021-11-30 03:15:48');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00389', 'PSD.1.00094', 'DM.1.000026', 0.00, 100.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:06', NULL, '2021-11-30 03:15:48');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00390', 'PSD.1.00094', 'DM.1.000027', 0.00, 100.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:06', NULL, '2021-11-30 03:15:48');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00391', 'PSD.1.00094', 'DM.1.000028', 0.00, 100.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:06', NULL, '2021-11-30 03:15:48');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00392', 'PSD.1.00094', 'DM.1.000029', 0.00, 100.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:06', NULL, '2021-11-30 03:15:48');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00393', 'PSD.1.00094', 'DM.1.000030', 0.00, 100.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:06', NULL, '2021-11-30 03:15:48');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00394', 'PSD.1.00094', 'DM.1.000031', 0.00, 100.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:06', NULL, '2021-11-30 03:15:48');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00395', 'PSD.1.00094', 'DM.1.000032', 0.00, 100.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:06', NULL, '2021-11-30 03:15:48');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00396', 'PSD.1.00097', 'DM.1.000023', 83.00, 35.00, 29.05, 'Catatan Presentasi Dosen 2 Mahasiswa 1', 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00397', 'PSD.1.00139', 'DM.1.000023', 89.00, 40.00, 35.60, 'Catatan Presentasi Dosen 2 Mahasiswa 1', 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00398', 'PSD.1.00125', 'DM.1.000023', 92.00, 15.00, 13.80, 'Catatan Presentasi Dosen 2 Mahasiswa 1', 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00399', 'PSD.1.00111', 'DM.1.000023', 93.00, 10.00, 9.30, 'Catatan Presentasi Dosen 2 Mahasiswa 1', 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00400', 'PSD.1.00097', 'DM.1.000024', 94.00, 35.00, 32.90, 'Catatan Presentasi Dosen 2 Mahasiswa 2', 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00401', 'PSD.1.00139', 'DM.1.000024', 97.00, 40.00, 38.80, 'Catatan Presentasi Dosen 2 Mahasiswa 2', 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00402', 'PSD.1.00125', 'DM.1.000024', 96.00, 15.00, 14.40, 'Catatan Presentasi Dosen 2 Mahasiswa 2', 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00403', 'PSD.1.00111', 'DM.1.000024', 95.00, 10.00, 9.50, 'Catatan Presentasi Dosen 2 Mahasiswa 2', 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00404', 'PSD.1.00097', 'DM.1.000025', 0.00, 35.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00405', 'PSD.1.00139', 'DM.1.000025', 0.00, 40.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00406', 'PSD.1.00125', 'DM.1.000025', 0.00, 15.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00407', 'PSD.1.00111', 'DM.1.000025', 0.00, 10.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00408', 'PSD.1.00097', 'DM.1.000026', 0.00, 35.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00409', 'PSD.1.00139', 'DM.1.000026', 0.00, 40.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00410', 'PSD.1.00125', 'DM.1.000026', 0.00, 15.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00411', 'PSD.1.00111', 'DM.1.000026', 0.00, 10.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00412', 'PSD.1.00097', 'DM.1.000027', 0.00, 35.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00413', 'PSD.1.00139', 'DM.1.000027', 0.00, 40.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00414', 'PSD.1.00125', 'DM.1.000027', 0.00, 15.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00415', 'PSD.1.00111', 'DM.1.000027', 0.00, 10.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00416', 'PSD.1.00097', 'DM.1.000028', 0.00, 35.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00417', 'PSD.1.00139', 'DM.1.000028', 0.00, 40.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00418', 'PSD.1.00125', 'DM.1.000028', 0.00, 15.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00419', 'PSD.1.00111', 'DM.1.000028', 0.00, 10.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00420', 'PSD.1.00097', 'DM.1.000029', 0.00, 35.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00421', 'PSD.1.00139', 'DM.1.000029', 0.00, 40.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00422', 'PSD.1.00125', 'DM.1.000029', 0.00, 15.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00423', 'PSD.1.00111', 'DM.1.000029', 0.00, 10.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00424', 'PSD.1.00097', 'DM.1.000030', 0.00, 35.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00425', 'PSD.1.00139', 'DM.1.000030', 0.00, 40.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00426', 'PSD.1.00125', 'DM.1.000030', 0.00, 15.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00427', 'PSD.1.00111', 'DM.1.000030', 0.00, 10.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00428', 'PSD.1.00097', 'DM.1.000031', 0.00, 35.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00429', 'PSD.1.00139', 'DM.1.000031', 0.00, 40.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00430', 'PSD.1.00125', 'DM.1.000031', 0.00, 15.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:39', NULL, '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00431', 'PSD.1.00111', 'DM.1.000031', 0.00, 10.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:40', NULL, '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00432', 'PSD.1.00097', 'DM.1.000032', 0.00, 35.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:40', NULL, '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00433', 'PSD.1.00139', 'DM.1.000032', 0.00, 40.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:40', NULL, '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00434', 'PSD.1.00125', 'DM.1.000032', 0.00, 15.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:40', NULL, '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00435', 'PSD.1.00111', 'DM.1.000032', 0.00, 10.00, 0.00, NULL, 'tesdosen2@gmail.com', '2021-11-29 04:43:40', NULL, '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00436', 'PSD.1.00098', 'DM.1.000023', 90.00, 35.00, 31.50, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00437', 'PSD.1.00140', 'DM.1.000023', 83.00, 40.00, 33.20, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00438', 'PSD.1.00126', 'DM.1.000023', 95.00, 15.00, 14.25, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 04:44:41');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00439', 'PSD.1.00112', 'DM.1.000023', 96.00, 10.00, 9.60, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00440', 'PSD.1.00098', 'DM.1.000024', 98.00, 35.00, 34.30, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00441', 'PSD.1.00140', 'DM.1.000024', 90.00, 40.00, 36.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00442', 'PSD.1.00126', 'DM.1.000024', 100.00, 15.00, 15.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00443', 'PSD.1.00112', 'DM.1.000024', 99.00, 10.00, 9.90, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00444', 'PSD.1.00098', 'DM.1.000025', 0.00, 35.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00445', 'PSD.1.00140', 'DM.1.000025', 0.00, 40.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00446', 'PSD.1.00126', 'DM.1.000025', 0.00, 15.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00447', 'PSD.1.00112', 'DM.1.000025', 0.00, 10.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00448', 'PSD.1.00098', 'DM.1.000026', 0.00, 35.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00449', 'PSD.1.00140', 'DM.1.000026', 0.00, 40.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00450', 'PSD.1.00126', 'DM.1.000026', 0.00, 15.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00451', 'PSD.1.00112', 'DM.1.000026', 0.00, 10.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00452', 'PSD.1.00098', 'DM.1.000027', 0.00, 35.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00453', 'PSD.1.00140', 'DM.1.000027', 0.00, 40.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00454', 'PSD.1.00126', 'DM.1.000027', 0.00, 15.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00455', 'PSD.1.00112', 'DM.1.000027', 0.00, 10.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00456', 'PSD.1.00098', 'DM.1.000028', 0.00, 35.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00457', 'PSD.1.00140', 'DM.1.000028', 0.00, 40.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:33');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00458', 'PSD.1.00126', 'DM.1.000028', 0.00, 15.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00459', 'PSD.1.00112', 'DM.1.000028', 0.00, 10.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00460', 'PSD.1.00098', 'DM.1.000029', 0.00, 35.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00461', 'PSD.1.00140', 'DM.1.000029', 0.00, 40.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00462', 'PSD.1.00126', 'DM.1.000029', 0.00, 15.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:41', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00463', 'PSD.1.00112', 'DM.1.000029', 0.00, 10.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:42', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00464', 'PSD.1.00098', 'DM.1.000030', 0.00, 35.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:42', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00465', 'PSD.1.00140', 'DM.1.000030', 0.00, 40.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:42', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00466', 'PSD.1.00126', 'DM.1.000030', 0.00, 15.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:42', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00467', 'PSD.1.00112', 'DM.1.000030', 0.00, 10.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:42', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00468', 'PSD.1.00098', 'DM.1.000031', 0.00, 35.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:42', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00469', 'PSD.1.00140', 'DM.1.000031', 0.00, 40.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:42', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00470', 'PSD.1.00126', 'DM.1.000031', 0.00, 15.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:42', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00471', 'PSD.1.00112', 'DM.1.000031', 0.00, 10.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:42', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00472', 'PSD.1.00098', 'DM.1.000032', 0.00, 35.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:42', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00473', 'PSD.1.00140', 'DM.1.000032', 0.00, 40.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:42', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00474', 'PSD.1.00126', 'DM.1.000032', 0.00, 15.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:42', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00475', 'PSD.1.00112', 'DM.1.000032', 0.00, 10.00, 0.00, 'undefined', 'tesdosen3@gmail.com', '2021-11-29 04:44:42', NULL, '2021-11-29 06:23:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00476', 'PSD.1.00099', 'DM.1.000023', 85.00, 35.00, 29.75, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:32', NULL, '2021-11-29 04:45:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00477', 'PSD.1.00141', 'DM.1.000023', 81.00, 40.00, 32.40, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:32', NULL, '2021-11-29 06:24:31');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00478', 'PSD.1.00127', 'DM.1.000023', 93.00, 15.00, 13.95, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:32', NULL, '2021-11-29 04:45:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00479', 'PSD.1.00113', 'DM.1.000023', 90.00, 10.00, 9.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:32', NULL, '2021-11-29 06:24:31');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00480', 'PSD.1.00099', 'DM.1.000024', 91.00, 35.00, 31.85, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:32', NULL, '2021-11-29 06:24:31');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00481', 'PSD.1.00141', 'DM.1.000024', 94.00, 40.00, 37.60, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:32', NULL, '2021-11-29 06:24:31');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00482', 'PSD.1.00127', 'DM.1.000024', 93.00, 15.00, 13.95, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:32', NULL, '2021-11-29 06:24:31');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00483', 'PSD.1.00113', 'DM.1.000024', 92.00, 10.00, 9.20, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:32', NULL, '2021-11-29 06:24:31');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00484', 'PSD.1.00099', 'DM.1.000025', 0.00, 35.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:32', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00485', 'PSD.1.00141', 'DM.1.000025', 0.00, 40.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:32', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00486', 'PSD.1.00127', 'DM.1.000025', 0.00, 15.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:32', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00487', 'PSD.1.00113', 'DM.1.000025', 0.00, 10.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:32', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00488', 'PSD.1.00099', 'DM.1.000026', 0.00, 35.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00489', 'PSD.1.00141', 'DM.1.000026', 0.00, 40.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00490', 'PSD.1.00127', 'DM.1.000026', 0.00, 15.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00491', 'PSD.1.00113', 'DM.1.000026', 0.00, 10.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00492', 'PSD.1.00099', 'DM.1.000027', 0.00, 35.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00493', 'PSD.1.00141', 'DM.1.000027', 0.00, 40.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00494', 'PSD.1.00127', 'DM.1.000027', 0.00, 15.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00495', 'PSD.1.00113', 'DM.1.000027', 0.00, 10.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00496', 'PSD.1.00099', 'DM.1.000028', 0.00, 35.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00497', 'PSD.1.00141', 'DM.1.000028', 0.00, 40.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00498', 'PSD.1.00127', 'DM.1.000028', 0.00, 15.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00499', 'PSD.1.00113', 'DM.1.000028', 0.00, 10.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00500', 'PSD.1.00099', 'DM.1.000029', 0.00, 35.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00501', 'PSD.1.00141', 'DM.1.000029', 0.00, 40.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00502', 'PSD.1.00127', 'DM.1.000029', 0.00, 15.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00503', 'PSD.1.00113', 'DM.1.000029', 0.00, 10.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00504', 'PSD.1.00099', 'DM.1.000030', 0.00, 35.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00505', 'PSD.1.00141', 'DM.1.000030', 0.00, 40.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00506', 'PSD.1.00127', 'DM.1.000030', 0.00, 15.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00507', 'PSD.1.00113', 'DM.1.000030', 0.00, 10.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00508', 'PSD.1.00099', 'DM.1.000031', 0.00, 35.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00509', 'PSD.1.00141', 'DM.1.000031', 0.00, 40.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00510', 'PSD.1.00127', 'DM.1.000031', 0.00, 15.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00511', 'PSD.1.00113', 'DM.1.000031', 0.00, 10.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00512', 'PSD.1.00099', 'DM.1.000032', 0.00, 35.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00513', 'PSD.1.00141', 'DM.1.000032', 0.00, 40.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00514', 'PSD.1.00127', 'DM.1.000032', 0.00, 15.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00515', 'PSD.1.00113', 'DM.1.000032', 0.00, 10.00, 0.00, 'undefined', 'tesdosen4@gmail.com', '2021-11-29 04:45:33', NULL, '2021-11-29 06:24:32');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00516', 'PSD.1.00101', 'DM.1.000026', 95.00, 35.00, 33.25, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00517', 'PSD.1.00143', 'DM.1.000026', 88.00, 40.00, 35.20, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00518', 'PSD.1.00129', 'DM.1.000026', 96.00, 15.00, 14.40, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00519', 'PSD.1.00115', 'DM.1.000026', 100.00, 10.00, 10.00, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00520', 'PSD.1.00101', 'DM.1.000028', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00521', 'PSD.1.00143', 'DM.1.000028', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00522', 'PSD.1.00129', 'DM.1.000028', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00523', 'PSD.1.00115', 'DM.1.000028', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00524', 'PSD.1.00101', 'DM.1.000030', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00525', 'PSD.1.00143', 'DM.1.000030', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00526', 'PSD.1.00129', 'DM.1.000030', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00527', 'PSD.1.00115', 'DM.1.000030', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00528', 'PSD.1.00101', 'DM.1.000032', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00529', 'PSD.1.00143', 'DM.1.000032', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00530', 'PSD.1.00129', 'DM.1.000032', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00531', 'PSD.1.00115', 'DM.1.000032', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa2@gmail.com', '2021-11-29 04:46:34', NULL, '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00532', 'PSD.1.00102', 'DM.1.000023', 95.00, 35.00, 33.25, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:10', NULL, '2021-11-29 04:57:28');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00533', 'PSD.1.00144', 'DM.1.000023', 88.00, 40.00, 35.20, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:10', NULL, '2021-11-29 04:57:28');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00534', 'PSD.1.00130', 'DM.1.000023', 96.00, 15.00, 14.40, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:10', NULL, '2021-11-29 04:57:28');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00535', 'PSD.1.00116', 'DM.1.000023', 100.00, 10.00, 10.00, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:10', NULL, '2021-11-29 04:57:28');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00536', 'PSD.1.00102', 'DM.1.000027', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:10', NULL, '2021-11-29 04:57:28');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00537', 'PSD.1.00144', 'DM.1.000027', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:11', NULL, '2021-11-29 04:57:28');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00538', 'PSD.1.00130', 'DM.1.000027', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:11', NULL, '2021-11-29 04:57:28');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00539', 'PSD.1.00116', 'DM.1.000027', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:11', NULL, '2021-11-29 04:57:28');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00540', 'PSD.1.00102', 'DM.1.000029', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:11', NULL, '2021-11-29 04:57:28');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00541', 'PSD.1.00144', 'DM.1.000029', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:11', NULL, '2021-11-29 04:57:29');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00542', 'PSD.1.00130', 'DM.1.000029', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:11', NULL, '2021-11-29 04:57:29');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00543', 'PSD.1.00116', 'DM.1.000029', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:11', NULL, '2021-11-29 04:57:29');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00544', 'PSD.1.00102', 'DM.1.000031', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:11', NULL, '2021-11-29 04:57:29');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00545', 'PSD.1.00144', 'DM.1.000031', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:11', NULL, '2021-11-29 04:57:29');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00546', 'PSD.1.00130', 'DM.1.000031', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:11', NULL, '2021-11-29 04:57:29');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00547', 'PSD.1.00116', 'DM.1.000031', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa3@gmail.com', '2021-11-29 04:47:11', NULL, '2021-11-29 04:57:29');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00548', 'PSD.1.00103', 'DM.1.000024', 95.00, 35.00, 33.25, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00549', 'PSD.1.00145', 'DM.1.000024', 98.00, 40.00, 39.20, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00550', 'PSD.1.00131', 'DM.1.000024', 97.00, 15.00, 14.55, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00551', 'PSD.1.00117', 'DM.1.000024', 96.00, 10.00, 9.60, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00552', 'PSD.1.00103', 'DM.1.000028', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00553', 'PSD.1.00145', 'DM.1.000028', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00554', 'PSD.1.00131', 'DM.1.000028', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00555', 'PSD.1.00117', 'DM.1.000028', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00556', 'PSD.1.00103', 'DM.1.000030', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:19');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00557', 'PSD.1.00145', 'DM.1.000030', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:19');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00558', 'PSD.1.00131', 'DM.1.000030', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:19');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00559', 'PSD.1.00117', 'DM.1.000030', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:19');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00560', 'PSD.1.00103', 'DM.1.000032', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:19');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00561', 'PSD.1.00145', 'DM.1.000032', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:19');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00562', 'PSD.1.00131', 'DM.1.000032', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:19');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00563', 'PSD.1.00117', 'DM.1.000032', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa4@gmail.com', '2021-11-29 04:47:55', NULL, '2021-11-29 06:29:19');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00564', 'PSD.1.00104', 'DM.1.000023', 93.00, 35.00, 32.55, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:58:06');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00565', 'PSD.1.00146', 'DM.1.000023', 87.00, 40.00, 34.80, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:59:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00566', 'PSD.1.00132', 'DM.1.000023', 98.00, 15.00, 14.70, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:59:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00567', 'PSD.1.00118', 'DM.1.000023', 98.00, 10.00, 9.80, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:59:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00568', 'PSD.1.00104', 'DM.1.000025', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:59:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00569', 'PSD.1.00146', 'DM.1.000025', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:59:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00570', 'PSD.1.00132', 'DM.1.000025', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:59:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00571', 'PSD.1.00118', 'DM.1.000025', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:59:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00572', 'PSD.1.00104', 'DM.1.000029', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:59:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00573', 'PSD.1.00146', 'DM.1.000029', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:59:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00574', 'PSD.1.00132', 'DM.1.000029', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:59:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00575', 'PSD.1.00118', 'DM.1.000029', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:59:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00576', 'PSD.1.00104', 'DM.1.000031', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:59:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00577', 'PSD.1.00146', 'DM.1.000031', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:59:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00578', 'PSD.1.00132', 'DM.1.000031', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:59:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00579', 'PSD.1.00118', 'DM.1.000031', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa5@gmail.com', '2021-11-29 04:48:43', NULL, '2021-11-29 04:59:18');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00580', 'PSD.1.00106', 'DM.1.000023', 90.00, 35.00, 31.50, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:01', NULL, '2021-11-29 05:00:01');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00581', 'PSD.1.00148', 'DM.1.000023', 82.00, 40.00, 32.80, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:01', NULL, '2021-11-29 05:00:01');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00582', 'PSD.1.00134', 'DM.1.000023', 99.00, 15.00, 14.85, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:01', NULL, '2021-11-29 05:00:01');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00583', 'PSD.1.00120', 'DM.1.000023', 99.00, 10.00, 9.90, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:01', NULL, '2021-11-29 05:00:01');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00584', 'PSD.1.00106', 'DM.1.000025', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:01', NULL, '2021-11-29 05:00:01');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00585', 'PSD.1.00148', 'DM.1.000025', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:01', NULL, '2021-11-29 05:00:01');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00586', 'PSD.1.00134', 'DM.1.000025', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:01', NULL, '2021-11-29 05:00:01');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00587', 'PSD.1.00120', 'DM.1.000025', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:01', NULL, '2021-11-29 05:00:01');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00588', 'PSD.1.00106', 'DM.1.000027', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:01', NULL, '2021-11-29 05:00:01');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00589', 'PSD.1.00148', 'DM.1.000027', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:01', NULL, '2021-11-29 05:00:01');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00590', 'PSD.1.00134', 'DM.1.000027', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:01', NULL, '2021-11-29 05:00:01');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00591', 'PSD.1.00120', 'DM.1.000027', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:01', NULL, '2021-11-29 05:00:01');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00592', 'PSD.1.00106', 'DM.1.000031', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:01', NULL, '2021-11-29 05:00:01');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00593', 'PSD.1.00148', 'DM.1.000031', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:01', NULL, '2021-11-29 05:00:01');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00594', 'PSD.1.00134', 'DM.1.000031', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:02', NULL, '2021-11-29 05:00:02');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00595', 'PSD.1.00120', 'DM.1.000031', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa7@gmail.com', '2021-11-29 05:00:02', NULL, '2021-11-29 05:00:02');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00596', 'PSD.1.00108', 'DM.1.000023', 91.00, 35.00, 31.85, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00597', 'PSD.1.00150', 'DM.1.000023', 90.00, 40.00, 36.00, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00598', 'PSD.1.00136', 'DM.1.000023', 95.00, 15.00, 14.25, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00599', 'PSD.1.00122', 'DM.1.000023', 96.00, 10.00, 9.60, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00600', 'PSD.1.00108', 'DM.1.000025', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00601', 'PSD.1.00150', 'DM.1.000025', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00602', 'PSD.1.00136', 'DM.1.000025', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00603', 'PSD.1.00122', 'DM.1.000025', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00604', 'PSD.1.00108', 'DM.1.000027', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00605', 'PSD.1.00150', 'DM.1.000027', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00606', 'PSD.1.00136', 'DM.1.000027', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00607', 'PSD.1.00122', 'DM.1.000027', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00608', 'PSD.1.00108', 'DM.1.000029', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00609', 'PSD.1.00150', 'DM.1.000029', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00610', 'PSD.1.00136', 'DM.1.000029', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00611', 'PSD.1.00122', 'DM.1.000029', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa9@gmail.com', '2021-11-29 05:00:50', NULL, '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00612', 'PSD.1.00105', 'DM.1.000024', 99.00, 35.00, 34.65, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00613', 'PSD.1.00147', 'DM.1.000024', 91.00, 40.00, 36.40, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00614', 'PSD.1.00133', 'DM.1.000024', 90.00, 15.00, 13.50, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00615', 'PSD.1.00119', 'DM.1.000024', 100.00, 10.00, 10.00, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00616', 'PSD.1.00105', 'DM.1.000026', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00617', 'PSD.1.00147', 'DM.1.000026', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00618', 'PSD.1.00133', 'DM.1.000026', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00619', 'PSD.1.00119', 'DM.1.000026', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00620', 'PSD.1.00105', 'DM.1.000030', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00621', 'PSD.1.00147', 'DM.1.000030', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00622', 'PSD.1.00133', 'DM.1.000030', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00623', 'PSD.1.00119', 'DM.1.000030', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00624', 'PSD.1.00105', 'DM.1.000032', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00625', 'PSD.1.00147', 'DM.1.000032', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00626', 'PSD.1.00133', 'DM.1.000032', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00627', 'PSD.1.00119', 'DM.1.000032', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa6@gmail.com', '2021-11-29 06:27:16', NULL, '2021-11-29 06:27:16');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00628', 'PSD.1.00107', 'DM.1.000024', 92.00, 35.00, 32.20, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:21', NULL, '2021-11-29 06:28:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00629', 'PSD.1.00149', 'DM.1.000024', 95.00, 40.00, 38.00, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:21', NULL, '2021-11-29 06:28:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00630', 'PSD.1.00135', 'DM.1.000024', 94.00, 15.00, 14.10, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:21', NULL, '2021-11-29 06:28:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00631', 'PSD.1.00121', 'DM.1.000024', 93.00, 10.00, 9.30, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:21', NULL, '2021-11-29 06:28:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00632', 'PSD.1.00107', 'DM.1.000026', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:21', NULL, '2021-11-29 06:28:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00633', 'PSD.1.00149', 'DM.1.000026', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:21', NULL, '2021-11-29 06:28:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00634', 'PSD.1.00135', 'DM.1.000026', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:21', NULL, '2021-11-29 06:28:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00635', 'PSD.1.00121', 'DM.1.000026', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:21', NULL, '2021-11-29 06:28:21');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00636', 'PSD.1.00107', 'DM.1.000028', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:22', NULL, '2021-11-29 06:28:22');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00637', 'PSD.1.00149', 'DM.1.000028', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:22', NULL, '2021-11-29 06:28:22');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00638', 'PSD.1.00135', 'DM.1.000028', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:22', NULL, '2021-11-29 06:28:22');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00639', 'PSD.1.00121', 'DM.1.000028', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:22', NULL, '2021-11-29 06:28:22');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00640', 'PSD.1.00107', 'DM.1.000032', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:22', NULL, '2021-11-29 06:28:22');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00641', 'PSD.1.00149', 'DM.1.000032', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:22', NULL, '2021-11-29 06:28:22');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00642', 'PSD.1.00135', 'DM.1.000032', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:22', NULL, '2021-11-29 06:28:22');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00643', 'PSD.1.00121', 'DM.1.000032', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa8@gmail.com', '2021-11-29 06:28:22', NULL, '2021-11-29 06:28:22');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00644', 'PSD.1.00109', 'DM.1.000024', 96.00, 35.00, 33.60, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:39', NULL, '2021-11-29 06:30:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00645', 'PSD.1.00151', 'DM.1.000024', 99.00, 40.00, 39.60, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:39', NULL, '2021-11-29 06:30:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00646', 'PSD.1.00137', 'DM.1.000024', 98.00, 15.00, 14.70, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:39', NULL, '2021-11-29 06:30:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00647', 'PSD.1.00123', 'DM.1.000024', 97.00, 10.00, 9.70, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:39', NULL, '2021-11-29 06:30:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00648', 'PSD.1.00109', 'DM.1.000026', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:39', NULL, '2021-11-29 06:30:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00649', 'PSD.1.00151', 'DM.1.000026', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:39', NULL, '2021-11-29 06:30:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00650', 'PSD.1.00137', 'DM.1.000026', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:39', NULL, '2021-11-29 06:30:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00651', 'PSD.1.00123', 'DM.1.000026', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:39', NULL, '2021-11-29 06:30:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00652', 'PSD.1.00109', 'DM.1.000028', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:39', NULL, '2021-11-29 06:30:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00653', 'PSD.1.00151', 'DM.1.000028', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:39', NULL, '2021-11-29 06:30:39');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00654', 'PSD.1.00137', 'DM.1.000028', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:40', NULL, '2021-11-29 06:30:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00655', 'PSD.1.00123', 'DM.1.000028', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:40', NULL, '2021-11-29 06:30:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00656', 'PSD.1.00109', 'DM.1.000030', 0.00, 35.00, 0.00, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:40', NULL, '2021-11-29 06:30:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00657', 'PSD.1.00151', 'DM.1.000030', 0.00, 40.00, 0.00, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:40', NULL, '2021-11-29 06:30:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00658', 'PSD.1.00137', 'DM.1.000030', 0.00, 15.00, 0.00, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:40', NULL, '2021-11-29 06:30:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00659', 'PSD.1.00123', 'DM.1.000030', 0.00, 10.00, 0.00, 'undefined', 'tesmahasiswa10@gmail.com', '2021-11-29 06:30:40', NULL, '2021-11-29 06:30:40');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00660', 'PSD.1.00163', 'DM.1.000041', 90.00, 20.00, 18.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00661', 'PSD.1.00164', 'DM.1.000041', NULL, 35.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00662', 'PSD.1.00165', 'DM.1.000041', 0.00, 45.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00663', 'PSD.1.00163', 'DM.1.000042', 98.00, 20.00, 19.60, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00664', 'PSD.1.00164', 'DM.1.000042', 0.00, 35.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00665', 'PSD.1.00165', 'DM.1.000042', 0.00, 45.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00666', 'PSD.1.00163', 'DM.1.000043', 76.00, 20.00, 15.20, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00667', 'PSD.1.00164', 'DM.1.000043', 0.00, 35.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00668', 'PSD.1.00165', 'DM.1.000043', 0.00, 45.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00669', 'PSD.1.00163', 'DM.1.000044', 0.00, 20.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00670', 'PSD.1.00164', 'DM.1.000044', 0.00, 35.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00671', 'PSD.1.00165', 'DM.1.000044', 0.00, 45.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00672', 'PSD.1.00163', 'DM.1.000045', 0.00, 20.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00673', 'PSD.1.00164', 'DM.1.000045', 0.00, 35.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00674', 'PSD.1.00165', 'DM.1.000045', 0.00, 45.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00675', 'PSD.1.00163', 'DM.1.000046', 0.00, 20.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00676', 'PSD.1.00164', 'DM.1.000046', 0.00, 35.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00677', 'PSD.1.00165', 'DM.1.000046', 0.00, 45.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00678', 'PSD.1.00163', 'DM.1.000047', 0.00, 20.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00679', 'PSD.1.00164', 'DM.1.000047', 0.00, 35.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00680', 'PSD.1.00165', 'DM.1.000047', 0.00, 45.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00681', 'PSD.1.00163', 'DM.1.000048', 0.00, 20.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00682', 'PSD.1.00164', 'DM.1.000048', 0.00, 35.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00683', 'PSD.1.00165', 'DM.1.000048', 0.00, 45.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00684', 'PSD.1.00163', 'DM.1.000049', 0.00, 20.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00685', 'PSD.1.00164', 'DM.1.000049', 0.00, 35.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00686', 'PSD.1.00165', 'DM.1.000049', 0.00, 45.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00687', 'PSD.1.00163', 'DM.1.000050', 0.00, 20.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00688', 'PSD.1.00164', 'DM.1.000050', 0.00, 35.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_mahasiswa_nilai` VALUES ('PMN.1.00689', 'PSD.1.00165', 'DM.1.000050', 0.00, 45.00, 0.00, NULL, 'sewahyudi@ciputra.com', '2021-11-30 02:40:49', NULL, '2021-11-30 02:40:49');
COMMIT;

-- ----------------------------
-- Table structure for t_penilaian_nilai_tahap1
-- ----------------------------
DROP TABLE IF EXISTS `t_penilaian_nilai_tahap1`;
CREATE TABLE `t_penilaian_nilai_tahap1` (
  `tahap1_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penilaian_assessment_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `mahasiswa_dosen_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `nilai_awal` decimal(25,2) NOT NULL DEFAULT 0.00,
  `persen` decimal(25,2) NOT NULL DEFAULT 0.00,
  `nilai_akhir` decimal(25,2) NOT NULL DEFAULT 0.00,
  `user_record` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_modified` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dt_record` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dt_modified` datetime NOT NULL,
  PRIMARY KEY (`tahap1_id`),
  KEY `t_penilaian_nilai_tahap1_penilaian_assessment_id_foreign` (`penilaian_assessment_id`),
  KEY `t_penilaian_nilai_tahap1_mahasiswa_dosen_id_foreign` (`mahasiswa_dosen_id`),
  CONSTRAINT `t_penilaian_nilai_tahap1_mahasiswa_dosen_id_foreign` FOREIGN KEY (`mahasiswa_dosen_id`) REFERENCES `m_dosen_mahasiswa` (`id`),
  CONSTRAINT `t_penilaian_nilai_tahap1_penilaian_assessment_id_foreign` FOREIGN KEY (`penilaian_assessment_id`) REFERENCES `t_penilaian_assessment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_penilaian_nilai_tahap1
-- ----------------------------
BEGIN;
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00001', 'BS.1.00002', 'DM.1.000009', 75.68, 30.00, 22.70, 'janti@ciputra.com', NULL, '2021-11-27 22:49:34', '2021-11-27 15:49:34');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00002', 'BS.1.00002', 'DM.1.000010', 75.48, 30.00, 22.64, 'janti@ciputra.com', NULL, '2021-11-27 22:49:34', '2021-11-27 15:49:34');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00003', 'BS.1.00002', 'DM.1.000011', 78.27, 30.00, 23.48, 'janti@ciputra.com', NULL, '2021-11-27 22:47:42', '2021-11-27 15:47:42');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00004', 'BS.1.00002', 'DM.1.000012', 82.83, 30.00, 24.85, 'janti@ciputra.com', NULL, '2021-11-27 22:49:35', '2021-11-27 15:49:35');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00005', 'BS.1.00003', 'DM.1.000009', 77.83, 20.00, 15.57, 'janti@ciputra.com', NULL, '2021-11-27 22:49:55', '2021-11-27 15:49:55');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00006', 'BS.1.00003', 'DM.1.000010', 78.92, 20.00, 15.78, 'janti@ciputra.com', NULL, '2021-11-27 22:49:55', '2021-11-27 15:49:55');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00007', 'BS.1.00003', 'DM.1.000011', 69.50, 20.00, 13.90, 'janti@ciputra.com', NULL, '2021-11-27 22:48:00', '2021-11-27 15:48:00');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00008', 'BS.1.00003', 'DM.1.000012', 85.17, 20.00, 17.03, 'janti@ciputra.com', NULL, '2021-11-27 22:49:55', '2021-11-27 15:49:55');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00009', 'BS.1.00004', 'DM.1.000009', 73.17, 30.00, 21.95, 'janti@ciputra.com', NULL, '2021-11-27 22:50:09', '2021-11-27 15:50:09');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00010', 'BS.1.00004', 'DM.1.000010', 71.42, 30.00, 21.43, 'janti@ciputra.com', NULL, '2021-11-27 22:50:09', '2021-11-27 15:50:09');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00011', 'BS.1.00004', 'DM.1.000011', 79.67, 30.00, 23.90, 'janti@ciputra.com', NULL, '2021-11-27 22:48:21', '2021-11-27 15:48:21');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00012', 'BS.1.00004', 'DM.1.000012', 84.83, 30.00, 25.45, 'janti@ciputra.com', NULL, '2021-11-27 22:50:09', '2021-11-27 15:50:09');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00013', 'BS.1.00005', 'DM.1.000009', 75.00, 20.00, 15.00, 'janti@ciputra.com', NULL, '2021-11-27 22:39:41', '2021-11-27 15:39:41');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00014', 'BS.1.00005', 'DM.1.000010', 82.50, 20.00, 16.50, 'janti@ciputra.com', NULL, '2021-11-27 22:39:41', '2021-11-27 15:39:41');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00015', 'BS.1.00005', 'DM.1.000011', 85.00, 20.00, 17.00, 'janti@ciputra.com', NULL, '2021-11-27 22:39:41', '2021-11-27 15:39:41');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00016', 'BS.1.00005', 'DM.1.000012', 87.50, 20.00, 17.50, 'janti@ciputra.com', NULL, '2021-11-27 22:39:41', '2021-11-27 15:39:41');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00017', 'BS.1.00006', 'DM.1.000023', 87.15, 5.00, 4.36, 'tesdosen1@gmail.com', NULL, '2021-11-29 04:38:01', '2021-11-29 04:38:01');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00018', 'BS.1.00006', 'DM.1.000024', 92.50, 5.00, 4.63, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:36', '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00019', 'BS.1.00006', 'DM.1.000025', 0.00, 5.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:36', '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00020', 'BS.1.00006', 'DM.1.000026', 0.00, 5.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:36', '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00021', 'BS.1.00006', 'DM.1.000027', 0.00, 5.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:36', '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00022', 'BS.1.00006', 'DM.1.000028', 0.00, 5.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:36', '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00023', 'BS.1.00006', 'DM.1.000029', 0.00, 5.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:36', '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00024', 'BS.1.00006', 'DM.1.000030', 0.00, 5.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:36', '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00025', 'BS.1.00006', 'DM.1.000031', 0.00, 5.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:36', '2021-11-30 03:18:36');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00026', 'BS.1.00006', 'DM.1.000032', 0.00, 5.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:37', '2021-11-30 03:18:37');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00027', 'BS.1.00007', 'DM.1.000023', 82.00, 10.00, 8.20, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:53', '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00028', 'BS.1.00007', 'DM.1.000024', 90.00, 10.00, 9.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:53', '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00029', 'BS.1.00007', 'DM.1.000025', 0.00, 10.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:53', '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00030', 'BS.1.00007', 'DM.1.000026', 0.00, 10.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:53', '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00031', 'BS.1.00007', 'DM.1.000027', 0.00, 10.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:53', '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00032', 'BS.1.00007', 'DM.1.000028', 0.00, 10.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:53', '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00033', 'BS.1.00007', 'DM.1.000029', 0.00, 10.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:53', '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00034', 'BS.1.00007', 'DM.1.000030', 0.00, 10.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:53', '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00035', 'BS.1.00007', 'DM.1.000031', 0.00, 10.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:53', '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00036', 'BS.1.00007', 'DM.1.000032', 0.00, 10.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:18:53', '2021-11-30 03:18:53');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00037', 'BS.1.00008', 'DM.1.000023', 66.30, 15.00, 9.95, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:13', '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00038', 'BS.1.00008', 'DM.1.000024', 96.61, 15.00, 14.49, 'tesdosen1@gmail.com', NULL, '2021-11-29 06:33:10', '2021-11-29 06:33:10');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00039', 'BS.1.00008', 'DM.1.000025', 0.00, 15.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:13', '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00040', 'BS.1.00008', 'DM.1.000026', 0.00, 15.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:13', '2021-11-30 03:19:13');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00041', 'BS.1.00008', 'DM.1.000027', 0.00, 15.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:14', '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00042', 'BS.1.00008', 'DM.1.000028', 0.00, 15.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:14', '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00043', 'BS.1.00008', 'DM.1.000029', 0.00, 15.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:14', '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00044', 'BS.1.00008', 'DM.1.000030', 0.00, 15.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:14', '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00045', 'BS.1.00008', 'DM.1.000031', 0.00, 15.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:14', '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00046', 'BS.1.00008', 'DM.1.000032', 0.00, 15.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:14', '2021-11-30 03:19:14');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00047', 'BS.1.00009', 'DM.1.000023', 88.50, 20.00, 17.70, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:40', '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00048', 'BS.1.00009', 'DM.1.000024', 93.00, 20.00, 18.60, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:40', '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00049', 'BS.1.00009', 'DM.1.000025', 0.00, 20.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:40', '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00050', 'BS.1.00009', 'DM.1.000026', 0.00, 20.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:40', '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00051', 'BS.1.00009', 'DM.1.000027', 0.00, 20.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:40', '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00052', 'BS.1.00009', 'DM.1.000028', 0.00, 20.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:40', '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00053', 'BS.1.00009', 'DM.1.000029', 0.00, 20.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:40', '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00054', 'BS.1.00009', 'DM.1.000030', 0.00, 20.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:40', '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00055', 'BS.1.00009', 'DM.1.000031', 0.00, 20.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:40', '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00056', 'BS.1.00009', 'DM.1.000032', 0.00, 20.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:40', '2021-11-30 03:19:40');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00057', 'BS.1.00010', 'DM.1.000023', 83.00, 30.00, 24.90, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:52', '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00058', 'BS.1.00010', 'DM.1.000024', 90.00, 30.00, 27.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:52', '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00059', 'BS.1.00010', 'DM.1.000025', 0.00, 30.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:52', '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00060', 'BS.1.00010', 'DM.1.000026', 0.00, 30.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:52', '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00061', 'BS.1.00010', 'DM.1.000027', 0.00, 30.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:52', '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00062', 'BS.1.00010', 'DM.1.000028', 0.00, 30.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:52', '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00063', 'BS.1.00010', 'DM.1.000029', 0.00, 30.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:52', '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00064', 'BS.1.00010', 'DM.1.000030', 0.00, 30.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:52', '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00065', 'BS.1.00010', 'DM.1.000031', 0.00, 30.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:52', '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00066', 'BS.1.00010', 'DM.1.000032', 0.00, 30.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-30 03:19:52', '2021-11-30 03:19:52');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00067', 'BS.1.00011', 'DM.1.000023', 88.14, 20.00, 17.63, 'tesdosen1@gmail.com', NULL, '2021-11-29 05:00:50', '2021-11-29 05:00:50');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00068', 'BS.1.00011', 'DM.1.000024', 93.26, 20.00, 18.65, 'tesdosen1@gmail.com', NULL, '2021-11-29 06:30:39', '2021-11-29 06:30:39');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00069', 'BS.1.00011', 'DM.1.000025', 0.00, 20.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-12-02 02:30:03', '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00070', 'BS.1.00011', 'DM.1.000026', 4.64, 20.00, 0.93, 'tesdosen1@gmail.com', NULL, '2021-11-29 04:46:34', '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00071', 'BS.1.00011', 'DM.1.000027', 0.00, 20.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-12-02 02:30:03', '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00072', 'BS.1.00011', 'DM.1.000028', 0.00, 20.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-12-02 02:30:03', '2021-12-02 02:30:03');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00073', 'BS.1.00011', 'DM.1.000029', 0.00, 20.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-12-02 02:30:04', '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00074', 'BS.1.00011', 'DM.1.000030', 0.00, 20.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-12-02 02:30:04', '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00075', 'BS.1.00011', 'DM.1.000031', 0.00, 20.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-12-02 02:30:04', '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00076', 'BS.1.00011', 'DM.1.000032', 0.00, 20.00, 0.00, 'tesdosen1@gmail.com', NULL, '2021-12-02 02:30:04', '2021-12-02 02:30:04');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00077', 'BS.1.00015', 'DM.1.000041', 18.00, 20.00, 3.60, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00078', 'BS.1.00015', 'DM.1.000042', 19.60, 20.00, 3.92, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00079', 'BS.1.00015', 'DM.1.000043', 15.20, 20.00, 3.04, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00080', 'BS.1.00015', 'DM.1.000044', 0.00, 20.00, 0.00, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00081', 'BS.1.00015', 'DM.1.000045', 0.00, 20.00, 0.00, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00082', 'BS.1.00015', 'DM.1.000046', 0.00, 20.00, 0.00, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00083', 'BS.1.00015', 'DM.1.000047', 0.00, 20.00, 0.00, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00084', 'BS.1.00015', 'DM.1.000048', 0.00, 20.00, 0.00, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00085', 'BS.1.00015', 'DM.1.000049', 0.00, 20.00, 0.00, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap1` VALUES ('THP.1.00086', 'BS.1.00015', 'DM.1.000050', 0.00, 20.00, 0.00, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
COMMIT;

-- ----------------------------
-- Table structure for t_penilaian_nilai_tahap2
-- ----------------------------
DROP TABLE IF EXISTS `t_penilaian_nilai_tahap2`;
CREATE TABLE `t_penilaian_nilai_tahap2` (
  `tahap2_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penilaian_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `mahasiswa_dosen_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `nilai_akhir` decimal(25,2) NOT NULL DEFAULT 0.00,
  `user_record` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_modified` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dt_record` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dt_modified` datetime NOT NULL,
  PRIMARY KEY (`tahap2_id`),
  KEY `t_penilaian_nilai_tahap2_penilaian_id_foreign` (`penilaian_id`),
  KEY `t_penilaian_nilai_tahap2_mahasiswa_dosen_id_foreign` (`mahasiswa_dosen_id`),
  CONSTRAINT `t_penilaian_nilai_tahap2_mahasiswa_dosen_id_foreign` FOREIGN KEY (`mahasiswa_dosen_id`) REFERENCES `m_dosen_mahasiswa` (`id`),
  CONSTRAINT `t_penilaian_nilai_tahap2_penilaian_id_foreign` FOREIGN KEY (`penilaian_id`) REFERENCES `t_penilaian_header` (`penilaian_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_penilaian_nilai_tahap2
-- ----------------------------
BEGIN;
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00001', 'PNL.1.00004', 'DM.1.000009', 75.22, 'janti@ciputra.com', NULL, '2021-11-27 22:50:09', '2021-11-27 15:50:09');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00002', 'PNL.1.00004', 'DM.1.000010', 76.35, 'janti@ciputra.com', NULL, '2021-11-27 22:50:09', '2021-11-27 15:50:09');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00003', 'PNL.1.00004', 'DM.1.000011', 78.28, 'janti@ciputra.com', NULL, '2021-11-27 22:48:21', '2021-11-27 15:48:21');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00004', 'PNL.1.00004', 'DM.1.000012', 84.83, 'janti@ciputra.com', NULL, '2021-11-27 22:50:09', '2021-11-27 15:50:09');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00005', 'PNL.1.00005', 'DM.1.000023', 82.74, 'tesdosen1@gmail.com', NULL, '2021-11-29 05:05:32', '2021-11-29 05:05:32');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00006', 'PNL.1.00005', 'DM.1.000024', 92.37, 'tesdosen1@gmail.com', NULL, '2021-11-29 06:33:10', '2021-11-29 06:33:10');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00007', 'PNL.1.00005', 'DM.1.000025', 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-29 04:38:01', '2021-11-29 04:38:01');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00008', 'PNL.1.00005', 'DM.1.000026', 0.93, 'tesdosen1@gmail.com', NULL, '2021-11-29 04:46:34', '2021-11-29 04:46:34');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00009', 'PNL.1.00005', 'DM.1.000027', 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-29 04:38:01', '2021-11-29 04:38:01');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00010', 'PNL.1.00005', 'DM.1.000028', 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-29 06:29:19', '2021-11-29 06:29:19');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00011', 'PNL.1.00005', 'DM.1.000029', 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-29 04:38:01', '2021-11-29 04:38:01');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00012', 'PNL.1.00005', 'DM.1.000030', 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-29 04:38:01', '2021-11-29 04:38:01');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00013', 'PNL.1.00005', 'DM.1.000031', 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-29 04:38:01', '2021-11-29 04:38:01');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00014', 'PNL.1.00005', 'DM.1.000032', 0.00, 'tesdosen1@gmail.com', NULL, '2021-11-29 04:38:01', '2021-11-29 04:38:01');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00015', 'PNL.1.00007', 'DM.1.000041', 3.60, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00016', 'PNL.1.00007', 'DM.1.000042', 3.92, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00017', 'PNL.1.00007', 'DM.1.000043', 3.04, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00018', 'PNL.1.00007', 'DM.1.000044', 0.00, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00019', 'PNL.1.00007', 'DM.1.000045', 0.00, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00020', 'PNL.1.00007', 'DM.1.000046', 0.00, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00021', 'PNL.1.00007', 'DM.1.000047', 0.00, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00022', 'PNL.1.00007', 'DM.1.000048', 0.00, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00023', 'PNL.1.00007', 'DM.1.000049', 0.00, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
INSERT INTO `t_penilaian_nilai_tahap2` VALUES ('THP.1.00024', 'PNL.1.00007', 'DM.1.000050', 0.00, 'sewahyudi@ciputra.com', NULL, '2021-11-30 02:40:49', '2021-11-30 02:40:49');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
