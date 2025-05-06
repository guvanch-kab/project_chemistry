-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               8.0.30 - MySQL Community Server - GPL
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных himiya_tdmi
DROP DATABASE IF EXISTS `himiya_tdmi`;
CREATE DATABASE IF NOT EXISTS `himiya_tdmi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `himiya_tdmi`;

-- Дамп структуры для таблица himiya_tdmi.amaly_data
DROP TABLE IF EXISTS `amaly_data`;
CREATE TABLE IF NOT EXISTS `amaly_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomeri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Bolum_ady` varchar(100) DEFAULT NULL,
  `Paragraf_no` varchar(10) NOT NULL,
  `Paragraf_ady` varchar(250) NOT NULL,
  `PDF_file_ady` text,
  `Surat` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы himiya_tdmi.amaly_data: ~1 rows (приблизительно)
DELETE FROM `amaly_data`;
INSERT INTO `amaly_data` (`id`, `nomeri`, `Bolum_ady`, `Paragraf_no`, `Paragraf_ady`, `PDF_file_ady`, `Surat`) VALUES
	(132, '1', 'Alkanlar we balkanlarr', '1.3', 'Alkanlar we gazlar', '68186610994a9-Muhammet zagran pasport.PDF', '681866109994b-1739294549146.jpg');

-- Дамп структуры для таблица himiya_tdmi.amaly_data_bolum
DROP TABLE IF EXISTS `amaly_data_bolum`;
CREATE TABLE IF NOT EXISTS `amaly_data_bolum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `belgi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы himiya_tdmi.amaly_data_bolum: ~3 rows (приблизительно)
DELETE FROM `amaly_data_bolum`;
INSERT INTO `amaly_data_bolum` (`id`, `belgi`) VALUES
	(1, '1'),
	(28, '2');

-- Дамп структуры для таблица himiya_tdmi.exam_result
DROP TABLE IF EXISTS `exam_result`;
CREATE TABLE IF NOT EXISTS `exam_result` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `exam_date` date NOT NULL,
  `result` varchar(10) NOT NULL,
  `correct_count` int NOT NULL,
  `incorrect_count` int NOT NULL,
  `caryek` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы himiya_tdmi.exam_result: ~3 rows (приблизительно)
DELETE FROM `exam_result`;
INSERT INTO `exam_result` (`id`, `user_id`, `student_name`, `exam_date`, `result`, `correct_count`, `incorrect_count`, `caryek`) VALUES
	(66, 20, 'Umut', '2025-02-28', '100', 2, 0, '2.Caryek'),
	(96, 26, 'Perhat', '2025-04-30', '100', 2, 0, '2.Caryek'),
	(100, 15, 'Kabulov', '2025-05-06', '100', 1, 0, '3.Caryek');

-- Дамп структуры для таблица himiya_tdmi.meseleler_data
DROP TABLE IF EXISTS `meseleler_data`;
CREATE TABLE IF NOT EXISTS `meseleler_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomeri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Bolum_ady` varchar(100) DEFAULT NULL,
  `Paragraf_no` varchar(10) NOT NULL,
  `Paragraf_ady` varchar(250) NOT NULL,
  `PDF_file_ady` text,
  `Surat` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы himiya_tdmi.meseleler_data: ~0 rows (приблизительно)
DELETE FROM `meseleler_data`;
INSERT INTO `meseleler_data` (`id`, `nomeri`, `Bolum_ady`, `Paragraf_no`, `Paragraf_ady`, `PDF_file_ady`, `Surat`) VALUES
	(132, '1', 'Alkanlar we balkanlarr', '1.3', 'Alkanlar we gazlar', '6818594cb64a5-Muhammet transkript.PDF', '6818596b1c2b0_1739294549146.jpg');

-- Дамп структуры для таблица himiya_tdmi.meseleler_data_bolum
DROP TABLE IF EXISTS `meseleler_data_bolum`;
CREATE TABLE IF NOT EXISTS `meseleler_data_bolum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `belgi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы himiya_tdmi.meseleler_data_bolum: ~2 rows (приблизительно)
DELETE FROM `meseleler_data_bolum`;
INSERT INTO `meseleler_data_bolum` (`id`, `belgi`) VALUES
	(9, '6'),
	(10, '1');

-- Дамп структуры для таблица himiya_tdmi.nazary_data
DROP TABLE IF EXISTS `nazary_data`;
CREATE TABLE IF NOT EXISTS `nazary_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomeri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Bolum_ady` varchar(100) DEFAULT NULL,
  `Paragraf_no` varchar(10) NOT NULL,
  `Paragraf_ady` varchar(250) NOT NULL,
  `Tema` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `PDF_file_ady` text,
  `Surat` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы himiya_tdmi.nazary_data: ~2 rows (приблизительно)
DELETE FROM `nazary_data`;
INSERT INTO `nazary_data` (`id`, `nomeri`, `Bolum_ady`, `Paragraf_no`, `Paragraf_ady`, `Tema`, `PDF_file_ady`, `Surat`) VALUES
	(67, '1', 'galogenler', '1.1', 'galogenler we duzlar', NULL, '681865af03fd9-Muhammet transkript.PDF', ''),
	(69, '2', 'orgAniki däl HiMiÝA ', '11.1', '  Element himiýasy. Himiki elementleriň ýaýranlygy', NULL, '681872e0840fb-PDF.js Express Evaluation License.pdf', '');

-- Дамп структуры для таблица himiya_tdmi.nazary_data_bolumler
DROP TABLE IF EXISTS `nazary_data_bolumler`;
CREATE TABLE IF NOT EXISTS `nazary_data_bolumler` (
  `id` int NOT NULL AUTO_INCREMENT,
  `belgi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы himiya_tdmi.nazary_data_bolumler: ~4 rows (приблизительно)
DELETE FROM `nazary_data_bolumler`;
INSERT INTO `nazary_data_bolumler` (`id`, `belgi`) VALUES
	(16, '1'),
	(17, '2'),
	(20, '4');

-- Дамп структуры для таблица himiya_tdmi.nazary_data_caryekler
DROP TABLE IF EXISTS `nazary_data_caryekler`;
CREATE TABLE IF NOT EXISTS `nazary_data_caryekler` (
  `id` int NOT NULL AUTO_INCREMENT,
  `caryekler` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы himiya_tdmi.nazary_data_caryekler: ~4 rows (приблизительно)
DELETE FROM `nazary_data_caryekler`;
INSERT INTO `nazary_data_caryekler` (`id`, `caryekler`) VALUES
	(8, '1.Caryek'),
	(9, '2.Caryek'),
	(10, '3.Caryek'),
	(11, '4.caryek');

-- Дамп структуры для таблица himiya_tdmi.questions
DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_text` text NOT NULL,
  `options` text NOT NULL,
  `answers_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `correct_answer` int NOT NULL,
  `caryek` varchar(100) NOT NULL,
  `question_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы himiya_tdmi.questions: ~3 rows (приблизительно)
DELETE FROM `questions`;
INSERT INTO `questions` (`id`, `question_text`, `options`, `answers_text`, `correct_answer`, `caryek`, `question_img`, `created_at`) VALUES
	(118, 'suw formulasy..?', '68157a0acc8f7_banner4.jpg,68157a0f198da_usecomp6.jpg', 'H2So4, HCL we...|apple, grapes', 1, '2.Caryek', '2.jpg', '2025-04-15 16:34:16'),
	(124, 'maccoffe or nescafe', '1744888097_usecomp6.jpg,1744888097_2.jpg', 'maccoffe is, may...|neascafemore than other, ...', 2, '2.Caryek', '1744888097_bir.jpg', '2025-04-17 11:08:17'),
	(125, 'Idris baba medresesi', '68191d9454e20_buhara-59_640x467.jpg,68191d9cea8d8_ingco10m.jpg', 'Ahal welayaty, Gokdepe|lebap welayaty, Halac etrap', 1, '4.caryek', 'idrisbaba.jpg', '2025-04-17 11:56:31'),
	(126, 'size of data...', '1746509156_ingco10m.jpg,1746509156_icki boyag 10 kg.jpg,1746509156_Без имеaи-12.jpg', 'MegaByte may be..|Kg may be..|Tonn may be... ', 3, '3.Caryek', '1746509156_12_55_11zon.jpg', '2025-05-06 05:25:56');

-- Дамп структуры для таблица himiya_tdmi.students
DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы himiya_tdmi.students: ~8 rows (приблизительно)
DELETE FROM `students`;
INSERT INTO `students` (`id`, `username`, `phone_number`, `user_password`) VALUES
	(12, 'Han', '63718035', '$2y$10$UE7xy55izISwtXpiR.ccG.5rL4OxG.TFB4EsDi3x4lVNeqLdMsw9C'),
	(13, 'guvanch', '61864959', '$2y$10$n2dhnxcH8SdglpZSr0jHjOFYqyoqG2rmtCXnGZP4STEVl7.KA8Guq'),
	(15, 'Kabulov', '65864959', '$2y$10$B7cQbsATpbKJYWJhCjcy6u2jBLaZzREH4Ji3yGppBjM7T34hq3Lxq'),
	(16, 'Babamyrat', '65865881', '$2y$10$3WdZ8c7VZil.DmkXDQ3bzO1CCrV4mszxOIuaosHuQPuF7tl.Mi1Ai'),
	(17, 'Hakan bey', '65202020', '$2y$10$KOPvT8ZYKDYURekErp5Xk.3LW48uAFNY7Oitft9Q9b6p/iv6zY5jm'),
	(18, 'Bilgisayar', '65020202', '$2y$10$BPg5jUCX8rlPaYVyB4uZa.Ebjc290BpGwmuo.OKF5v6DRxFxe8d0a'),
	(19, 'gul', '65981487', '$2y$10$MEKLglVfohqJuuARcGFmT.u9UJ.T4d5cszJNVt6jkKkfj3UyEnTNq'),
	(20, 'Umut', '4959', '$2y$10$Ft0aI0jeKY8ViNtANsR1zOBQz6jzFGT.6QHzXwogtzPWH3j3ksASm'),
	(21, 'gubba', '62303030', '$2y$10$6iYPAeLCRWcbpQ4EZpXm5.d8OTw.ggSwzdi7P9pUZYd8Ff5v6HxMq'),
	(22, 'mmm', '200)_', '$2y$10$DemxM0BBmsUWY9qI4o7iGej0SN9rRw4uwFdhHY0tHPVv7yzkUoU66'),
	(23, 'kabul', 'kabul', '$2y$10$NEdTOsRXl/65O6z90WaVQuFlNm.MAj8Avq8Y57gVnYpFLhsrplSJ6'),
	(24, 'kabbi', 'kabbi(@', '$2y$10$P3H3ujiC0yg/w53PIkdhLur6VH3CTA96MhppBt0mv2QsOOW3zK/wK'),
	(25, 'Alym', '63232323', '$2y$10$5/qoCEI0G2V/IBJNpTui9eIAv0AkIrAXzFTL2fvYlk5nTzuHCzpwu'),
	(26, 'Perhat', '65454545', '$2y$10$CgHMJjN7EBBcRiPGEgyAL.oYfzU8JQymhvsLGq4LhyrGkEJcLos5e');

-- Дамп структуры для таблица himiya_tdmi.tejribe_data
DROP TABLE IF EXISTS `tejribe_data`;
CREATE TABLE IF NOT EXISTS `tejribe_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomeri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Bolum_ady` varchar(100) DEFAULT NULL,
  `Paragraf_no` varchar(10) NOT NULL,
  `Paragraf_ady` varchar(250) NOT NULL,
  `PDF_file_ady` text,
  `Surat` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы himiya_tdmi.tejribe_data: ~1 rows (приблизительно)
DELETE FROM `tejribe_data`;

-- Дамп структуры для таблица himiya_tdmi.tejribe_data_bolum
DROP TABLE IF EXISTS `tejribe_data_bolum`;
CREATE TABLE IF NOT EXISTS `tejribe_data_bolum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `belgi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы himiya_tdmi.tejribe_data_bolum: ~3 rows (приблизительно)
DELETE FROM `tejribe_data_bolum`;
INSERT INTO `tejribe_data_bolum` (`id`, `belgi`) VALUES
	(1, '1'),
	(4, '2');

-- Дамп структуры для таблица himiya_tdmi.user_answers
DROP TABLE IF EXISTS `user_answers`;
CREATE TABLE IF NOT EXISTS `user_answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `question_id` int NOT NULL,
  `selected_answer` int NOT NULL,
  `senesi` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=616 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы himiya_tdmi.user_answers: ~188 rows (приблизительно)
DELETE FROM `user_answers`;
INSERT INTO `user_answers` (`id`, `user_id`, `question_id`, `selected_answer`, `senesi`) VALUES
	(393, 13, 27, 2, '2025-01-26 15:11:06'),
	(394, 13, 28, 3, '2025-01-26 15:11:11'),
	(395, 17, 27, 2, '2025-01-26 21:55:23'),
	(396, 17, 28, 2, '2025-01-26 21:55:45'),
	(397, 13, 28, 3, '2025-02-01 10:06:26'),
	(398, 13, 27, 2, '2025-02-01 10:06:30'),
	(399, 13, 28, 3, '2025-02-01 10:50:56'),
	(400, 13, 27, 2, '2025-02-01 10:51:00'),
	(401, 13, 28, 1, '2025-02-03 16:57:55'),
	(402, 13, 27, 3, '2025-02-03 16:57:57'),
	(403, 18, 27, 2, '2025-02-07 09:22:54'),
	(404, 18, 28, 2, '2025-02-07 09:22:57'),
	(405, 15, 28, 3, '2025-02-07 09:39:14'),
	(406, 15, 27, 2, '2025-02-07 09:39:20'),
	(407, 15, 25, 2, '2025-02-07 09:49:40'),
	(408, 15, 27, 2, '2025-02-07 09:50:54'),
	(409, 15, 28, 3, '2025-02-07 09:50:58'),
	(410, 18, 24, 1, '2025-02-07 09:51:54'),
	(411, 15, 32, 3, '2025-02-08 09:29:18'),
	(412, 15, 31, 2, '2025-02-08 09:29:24'),
	(413, 15, 30, 4, '2025-02-08 09:29:29'),
	(414, 15, 25, 3, '2025-02-08 09:29:36'),
	(415, 15, 28, 3, '2025-02-10 21:13:27'),
	(416, 15, 27, 1, '2025-02-10 21:13:47'),
	(417, 15, 29, 3, '2025-02-10 21:14:41'),
	(418, 15, 29, 3, '2025-02-12 09:37:54'),
	(419, 15, 28, 3, '2025-02-12 09:37:57'),
	(420, 15, 27, 2, '2025-02-12 09:37:59'),
	(421, 13, 25, 1, '2025-02-12 09:39:22'),
	(422, 13, 31, 3, '2025-02-12 09:39:26'),
	(423, 13, 30, 2, '2025-02-12 09:39:30'),
	(424, 13, 32, 3, '2025-02-12 09:39:35'),
	(425, 19, 32, 3, '2025-02-12 09:45:55'),
	(426, 19, 31, 4, '2025-02-12 09:45:58'),
	(427, 19, 25, 1, '2025-02-12 09:46:00'),
	(428, 19, 30, 2, '2025-02-12 09:46:03'),
	(429, 19, 31, 1, '2025-02-12 09:46:50'),
	(430, 19, 25, 3, '2025-02-12 09:46:54'),
	(431, 19, 30, 3, '2025-02-12 09:46:56'),
	(432, 19, 32, 3, '2025-02-12 09:46:58'),
	(433, 19, 25, 3, '2025-02-12 09:47:52'),
	(434, 19, 30, 3, '2025-02-12 09:47:55'),
	(435, 19, 31, 2, '2025-02-12 09:47:59'),
	(436, 19, 32, 3, '2025-02-12 09:48:00'),
	(437, 19, 27, 2, '2025-02-12 09:48:27'),
	(438, 19, 28, 3, '2025-02-12 09:48:28'),
	(439, 19, 29, 2, '2025-02-12 09:48:30'),
	(440, 15, 25, 3, '2025-02-12 09:48:54'),
	(441, 15, 30, 4, '2025-02-12 09:48:57'),
	(442, 15, 32, 3, '2025-02-12 09:48:58'),
	(443, 15, 31, 2, '2025-02-12 09:49:01'),
	(444, 19, 28, 1, '2025-02-12 10:00:55'),
	(445, 19, 29, 1, '2025-02-12 10:00:57'),
	(446, 19, 27, 1, '2025-02-12 10:00:59'),
	(447, 19, 24, 1, '2025-02-12 10:01:35'),
	(448, 15, 28, 2, '2025-02-12 10:02:06'),
	(449, 15, 27, 2, '2025-02-12 10:02:08'),
	(450, 15, 29, 2, '2025-02-12 10:02:10'),
	(451, 15, 30, 3, '2025-02-20 20:50:34'),
	(452, 15, 32, 3, '2025-02-20 20:51:00'),
	(453, 15, 31, 2, '2025-02-20 20:51:02'),
	(454, 15, 25, 3, '2025-02-20 20:51:07'),
	(455, 13, 32, 2, '2025-02-22 08:59:21'),
	(456, 13, 25, 3, '2025-02-22 08:59:23'),
	(457, 13, 30, 2, '2025-02-22 08:59:25'),
	(458, 13, 31, 3, '2025-02-22 08:59:26'),
	(459, 13, 33, 2, '2025-02-22 09:18:18'),
	(460, 13, 24, 1, '2025-02-22 09:18:23'),
	(461, 13, 33, 2, '2025-02-28 10:38:38'),
	(462, 13, 24, 1, '2025-02-28 10:38:44'),
	(463, 15, 38, 1, '2025-02-28 10:39:31'),
	(464, 15, 7, 2, '2025-02-28 10:39:35'),
	(465, 15, 39, 3, '2025-02-28 10:39:53'),
	(466, 15, 38, 1, '2025-02-28 11:23:26'),
	(467, 15, 7, 2, '2025-02-28 11:23:36'),
	(468, 15, 39, 4, '2025-02-28 11:23:41'),
	(469, 15, 7, 2, '2025-02-28 11:47:22'),
	(470, 15, 7, 2, '2025-02-28 12:06:04'),
	(471, 15, 7, 2, '2025-02-28 12:11:55'),
	(472, 15, 7, 2, '2025-02-28 12:14:42'),
	(473, 15, 39, 2, '2025-02-28 12:14:56'),
	(474, 15, 38, 1, '2025-02-28 12:15:20'),
	(475, 13, 7, 2, '2025-02-28 12:17:06'),
	(476, 13, 39, 4, '2025-02-28 12:18:00'),
	(477, 15, 7, 2, '2025-02-28 12:20:12'),
	(478, 15, 38, 2, '2025-02-28 12:20:40'),
	(479, 15, 7, 2, '2025-02-28 12:22:10'),
	(480, 15, 38, 1, '2025-02-28 12:22:17'),
	(481, 15, 39, 4, '2025-02-28 12:48:34'),
	(482, 15, 7, 2, '2025-02-28 12:48:49'),
	(483, 15, 39, 4, '2025-02-28 12:51:23'),
	(484, 15, 7, 2, '2025-02-28 12:51:26'),
	(485, 15, 38, 2, '2025-02-28 12:54:02'),
	(486, 15, 39, 4, '2025-02-28 13:00:45'),
	(487, 15, 39, 4, '2025-02-28 13:01:31'),
	(488, 15, 33, 2, '2025-02-28 13:05:46'),
	(489, 15, 24, 1, '2025-02-28 13:05:49'),
	(490, 15, 40, 2, '2025-02-28 13:06:20'),
	(491, 15, 24, 2, '2025-02-28 13:07:02'),
	(492, 15, 33, 2, '2025-02-28 13:07:05'),
	(493, 15, 40, 1, '2025-02-28 13:07:18'),
	(494, 13, 33, 2, '2025-02-28 13:08:22'),
	(495, 13, 24, 2, '2025-02-28 13:08:26'),
	(496, 13, 40, 2, '2025-02-28 13:08:29'),
	(497, 13, 41, 3, '2025-02-28 13:08:34'),
	(498, 13, 28, 3, '2025-02-28 18:28:29'),
	(499, 13, 45, 1, '2025-02-28 18:28:45'),
	(500, 13, 29, 3, '2025-02-28 18:28:57'),
	(501, 13, 44, 1, '2025-02-28 18:29:05'),
	(502, 13, 27, 2, '2025-02-28 18:29:12'),
	(503, 15, 30, 3, '2025-02-28 18:29:44'),
	(504, 15, 31, 3, '2025-02-28 18:29:48'),
	(505, 15, 32, 2, '2025-02-28 18:29:50'),
	(506, 15, 42, 2, '2025-02-28 18:30:07'),
	(507, 15, 43, 3, '2025-02-28 18:30:18'),
	(508, 15, 25, 1, '2025-02-28 18:30:22'),
	(509, 15, 40, 1, '2025-02-28 18:49:42'),
	(510, 15, 33, 2, '2025-02-28 18:49:44'),
	(511, 15, 24, 1, '2025-02-28 18:49:48'),
	(512, 15, 41, 1, '2025-02-28 18:50:19'),
	(513, 15, 38, 1, '2025-02-28 18:51:53'),
	(514, 13, 40, 2, '2025-02-28 18:52:18'),
	(515, 13, 24, 2, '2025-02-28 18:52:22'),
	(516, 13, 41, 1, '2025-02-28 18:52:27'),
	(517, 13, 33, 2, '2025-02-28 18:52:29'),
	(518, 13, 44, 1, '2025-02-28 18:52:55'),
	(519, 13, 29, 3, '2025-02-28 18:52:57'),
	(520, 13, 28, 2, '2025-02-28 18:52:59'),
	(521, 13, 27, 2, '2025-02-28 18:53:01'),
	(522, 13, 45, 1, '2025-02-28 18:53:05'),
	(523, 15, 45, 1, '2025-02-28 19:58:14'),
	(524, 15, 29, 2, '2025-02-28 19:58:16'),
	(525, 15, 44, 1, '2025-02-28 19:58:20'),
	(526, 15, 27, 3, '2025-02-28 19:58:21'),
	(527, 15, 28, 2, '2025-02-28 19:58:23'),
	(528, 15, 46, 1, '2025-02-28 19:58:26'),
	(529, 20, 28, 3, '2025-02-28 23:03:22'),
	(530, 20, 44, 4, '2025-02-28 23:03:47'),
	(531, 20, 45, 2, '2025-02-28 23:04:01'),
	(532, 20, 29, 3, '2025-02-28 23:04:04'),
	(533, 20, 27, 2, '2025-02-28 23:04:07'),
	(534, 20, 46, 1, '2025-02-28 23:04:12'),
	(535, 20, 24, 1, '2025-02-28 23:21:17'),
	(536, 20, 47, 1, '2025-02-28 23:21:26'),
	(537, 20, 24, 2, '2025-02-28 23:23:31'),
	(538, 20, 40, 1, '2025-02-28 23:24:02'),
	(539, 20, 47, 2, '2025-02-28 23:30:11'),
	(540, 20, 40, 2, '2025-02-28 23:32:58'),
	(541, 15, 46, 2, '2025-02-28 23:34:24'),
	(542, 15, 44, 1, '2025-02-28 23:34:32'),
	(543, 15, 45, 2, '2025-02-28 23:34:48'),
	(544, 20, 46, 1, '2025-02-28 23:42:55'),
	(545, 20, 44, 3, '2025-02-28 23:43:05'),
	(546, 15, 44, 1, '2025-02-28 23:51:26'),
	(547, 15, 46, 1, '2025-02-28 23:51:34'),
	(548, 20, 38, 1, '2025-03-03 14:02:24'),
	(549, 13, 47, 2, '2025-03-03 14:11:49'),
	(550, 15, 47, 2, '2025-03-03 14:18:56'),
	(551, 15, 46, 2, '2025-03-03 16:18:44'),
	(552, 15, 46, 2, '2025-03-03 16:23:50'),
	(553, 15, 45, 1, '2025-03-03 16:28:39'),
	(554, 15, 81, 2, '2025-04-02 21:07:30'),
	(555, 15, 80, 2, '2025-04-02 21:07:56'),
	(556, 15, 80, 2, '2025-04-02 21:25:26'),
	(557, 15, 81, 2, '2025-04-02 21:34:52'),
	(558, 15, 80, 2, '2025-04-02 21:35:08'),
	(559, 15, 80, 2, '2025-04-02 22:40:08'),
	(560, 15, 122, 2, '2025-04-16 05:40:52'),
	(561, 15, 121, 1, '2025-04-16 05:41:04'),
	(562, 15, 122, 1, '2025-04-16 05:43:13'),
	(563, 15, 121, 1, '2025-04-16 05:43:23'),
	(564, 15, 123, 1, '2025-04-16 06:11:49'),
	(565, 15, 118, 2, '2025-04-16 06:12:01'),
	(566, 15, 118, 1, '2025-04-17 14:03:13'),
	(567, 15, 123, 1, '2025-04-17 14:03:22'),
	(568, 15, 118, 2, '2025-04-17 14:09:07'),
	(569, 15, 124, 1, '2025-04-17 14:09:16'),
	(570, 15, 124, 2, '2025-04-17 14:40:36'),
	(571, 15, 118, 1, '2025-04-17 14:40:41'),
	(572, 15, 118, 1, '2025-04-17 14:50:45'),
	(573, 15, 120, 2, '2025-04-17 14:55:16'),
	(574, 15, 118, 2, '2025-04-17 14:58:52'),
	(575, 15, 124, 2, '2025-04-20 10:35:08'),
	(576, 15, 118, 2, '2025-04-20 12:50:15'),
	(577, 15, 124, 2, '2025-04-20 12:50:17'),
	(578, 15, 118, 1, '2025-04-26 13:48:24'),
	(579, 15, 124, 2, '2025-04-26 13:48:28'),
	(580, 21, 124, 1, '2025-04-26 14:38:58'),
	(581, 15, 118, 2, '2025-04-29 19:44:34'),
	(582, 15, 124, 1, '2025-04-29 19:44:39'),
	(583, 21, 118, 2, '2025-04-29 20:00:05'),
	(584, 21, 124, 1, '2025-04-29 20:00:09'),
	(585, 21, 124, 1, '2025-04-29 20:03:35'),
	(586, 15, 124, 2, '2025-04-29 20:04:45'),
	(587, 15, 118, 1, '2025-04-29 20:04:54'),
	(588, 15, 118, 2, '2025-04-29 20:07:29'),
	(589, 15, 124, 2, '2025-04-29 20:28:14'),
	(590, 15, 118, 1, '2025-04-29 20:28:20'),
	(591, 15, 118, 2, '2025-04-29 20:41:15'),
	(592, 15, 124, 1, '2025-04-29 20:41:25'),
	(593, 21, 125, 1, '2025-04-29 20:42:08'),
	(594, 21, 125, 2, '2025-04-29 20:44:08'),
	(595, 21, 124, 2, '2025-04-29 20:44:46'),
	(596, 15, 118, 2, '2025-04-29 21:11:38'),
	(597, 15, 124, 2, '2025-04-29 21:11:41'),
	(598, 21, 118, 2, '2025-04-29 21:14:15'),
	(599, 21, 124, 1, '2025-04-29 21:14:18'),
	(600, 15, 118, 1, '2025-04-29 22:13:49'),
	(601, 15, 124, 2, '2025-04-29 22:13:52'),
	(602, 15, 124, 2, '2025-04-30 10:12:31'),
	(603, 15, 118, 1, '2025-04-30 10:12:35'),
	(604, 25, 124, 1, '2025-04-30 13:58:19'),
	(605, 15, 124, 2, '2025-04-30 13:59:09'),
	(606, 15, 118, 1, '2025-04-30 13:59:14'),
	(607, 26, 118, 1, '2025-04-30 19:02:02'),
	(608, 26, 124, 2, '2025-04-30 19:02:20'),
	(609, 15, 124, 1, '2025-04-30 19:04:18'),
	(610, 15, 118, 1, '2025-04-30 19:04:25'),
	(611, 15, 125, 2, '2025-05-05 23:22:04'),
	(612, 15, 124, 2, '2025-05-06 08:22:31'),
	(613, 15, 118, 1, '2025-05-06 08:22:36'),
	(614, 15, 126, 3, '2025-05-06 08:27:07'),
	(615, 15, 126, 2, '2025-05-06 08:36:32');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
