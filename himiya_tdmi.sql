-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 02, 2025 at 07:06 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `himiya_tdmi`
--

-- --------------------------------------------------------

--
-- Table structure for table `amaly_data`
--

CREATE TABLE `amaly_data` (
  `id` int NOT NULL,
  `amaly_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Bolum_ady` varchar(100) DEFAULT NULL,
  `Paragraf_no` varchar(10) NOT NULL,
  `Paragraf_ady` varchar(250) NOT NULL,
  `PDF_file_ady` text,
  `Surat` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `amaly_data`
--

INSERT INTO `amaly_data` (`id`, `amaly_no`, `Bolum_ady`, `Paragraf_no`, `Paragraf_ady`, `PDF_file_ady`, `Surat`) VALUES
(60, '2', 'Fruits', '2.2', 'Apples and fruits', '1- Enpara Hesap Hareketleri.pdf', '5.jpg'),
(61, '3', '3.3', '33', 'Kitaplar, books', '681475405b26f-cv_Kabulov_Guvanch 2024.pdf', 'Yagshygul.jpg'),
(62, '1', 'Mendeleyew tablisa', '3.7', 'Mendeleyew tablisalary', 'cv_Kabulov_Guvanch 2024.pdf', '6814ecfc83042_Ahmet.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `amaly_data_bolum`
--

CREATE TABLE `amaly_data_bolum` (
  `id` int NOT NULL,
  `amaly_no` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `amaly_data_bolum`
--

INSERT INTO `amaly_data_bolum` (`id`, `amaly_no`) VALUES
(1, '1'),
(4, '2'),
(5, '3'),
(7, '4');

-- --------------------------------------------------------

--
-- Table structure for table `exam_result`
--

CREATE TABLE `exam_result` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `exam_date` date NOT NULL,
  `result` varchar(10) NOT NULL,
  `correct_count` int NOT NULL,
  `incorrect_count` int NOT NULL,
  `caryek` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `exam_result`
--

INSERT INTO `exam_result` (`id`, `user_id`, `student_name`, `exam_date`, `result`, `correct_count`, `incorrect_count`, `caryek`) VALUES
(66, 20, 'Umut', '2025-02-28', '100', 2, 0, '2.Caryek'),
(68, 20, 'Umut', '2025-03-03', '0', 0, 1, '1.Caryek'),
(89, 21, 'gubba', '2025-04-29', '100', 1, 0, '11'),
(90, 21, 'gubba', '2025-04-29', '0', 0, 1, '4.caryek'),
(93, 15, 'Kabulov', '2025-04-29', '100', 2, 0, '9'),
(95, 15, 'Kabulov', '2025-04-30', '100', 2, 0, '9'),
(96, 26, 'Perhat', '2025-04-30', '100', 2, 0, '2.Caryek'),
(97, 15, 'Kabulov', '2025-04-30', '50', 1, 1, '2.Caryek');

-- --------------------------------------------------------

--
-- Table structure for table `nazary_data`
--

CREATE TABLE `nazary_data` (
  `id` int NOT NULL,
  `Bolum_belgi` varchar(100) NOT NULL,
  `Bolum_ady` varchar(100) DEFAULT NULL,
  `Paragraf_no` varchar(10) NOT NULL,
  `Paragraf_ady` varchar(250) NOT NULL,
  `Tema` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PDF_file_ady` text,
  `Surat` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nazary_data`
--

INSERT INTO `nazary_data` (`id`, `Bolum_belgi`, `Bolum_ady`, `Paragraf_no`, `Paragraf_ady`, `Tema`, `PDF_file_ady`, `Surat`) VALUES
(53, '1.Bolum', 'MADDANYŇ GURLUŞYNYŇ ESASLARY', '1.9', 'Inert gaz we molekulalar', NULL, 'muhammet sat.pdf', '1739722107298.jpg'),
(54, '1.Bolum', 'MADDANYŇ GURLUŞYNYŇ ESASLARY', '1.2', 'Otnositel atom we molekulýar massa', NULL, 'DovletBabayewCV.pdf', '1739722107298.jpg'),
(55, '2.Bolum', 'MADDALARYŇ gregat ýagdaýy.', '3.1', 'Kristallar', NULL, '2022_ULUSLAARASI_OYRENCY_KONTENJANLARI.pdf', '2022_ULUSLAARASI_OYRENCY_KONTENJANLARI.pdf'),
(56, '2.Bolum', 'Maddalarda atom calisigi', '5', 'Atomlar we molukalalar gatnasygy', NULL, '1- Enpara Hesap Hareketleri.pdf', '2022_ULUSLAARASI_OYRENCY_KONTENJANLARI.pdf'),
(57, '3.Bolum', 'Galogenler', '5.1', 'Galagonler we gazlar', NULL, '6811fc524dda7-Muhammet transkript-2.pdf', '');

-- --------------------------------------------------------

--
-- Table structure for table `nazary_data_bolumler`
--

CREATE TABLE `nazary_data_bolumler` (
  `id` int NOT NULL,
  `bolumler` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nazary_data_bolumler`
--

INSERT INTO `nazary_data_bolumler` (`id`, `bolumler`) VALUES
(16, '1'),
(17, '2'),
(18, '3'),
(20, '4'),
(23, '5');

-- --------------------------------------------------------

--
-- Table structure for table `nazary_data_caryekler`
--

CREATE TABLE `nazary_data_caryekler` (
  `id` int NOT NULL,
  `caryekler` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nazary_data_caryekler`
--

INSERT INTO `nazary_data_caryekler` (`id`, `caryekler`) VALUES
(8, '1.Caryek'),
(9, '2.Caryek'),
(10, '3.Caryek'),
(11, '4.caryek');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int NOT NULL,
  `question_text` text NOT NULL,
  `options` text NOT NULL,
  `answers_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `correct_answer` int NOT NULL,
  `caryek` varchar(100) NOT NULL,
  `question_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question_text`, `options`, `answers_text`, `correct_answer`, `caryek`, `question_img`, `created_at`) VALUES
(118, 'suw formulasy..?', '681249dd43fba_1741245920_idrisbaba.jpg,1744734856_9.jpg', 'H2So4, HCL we...|Bir zatlar yaz', 1, '2.Caryek', '1744734856_8.jpg', '2025-04-15 16:34:16'),
(124, 'maccoffe or nescafe', '1744888097_usecomp6.jpg,1744888097_2.jpg', 'maccoffe is, may...|neascafemore than other, ...', 2, '2.Caryek', '1744888097_bir.jpg', '2025-04-17 11:08:17'),
(125, 'Idris baba medresesi', '1744890991_1.jpg,1744890991_usecomp9.jpg', 'Ahal welayaty, Gokdepe|lebap welayaty, Halac etrap', 1, '4.caryek', '1744890991_5.jpg', '2025-04-17 11:56:31');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int NOT NULL,
  `username` varchar(200) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `students`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE `user_answers` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `question_id` int NOT NULL,
  `selected_answer` int NOT NULL,
  `senesi` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_answers`
--

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
(610, 15, 118, 1, '2025-04-30 19:04:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amaly_data`
--
ALTER TABLE `amaly_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amaly_data_bolum`
--
ALTER TABLE `amaly_data_bolum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_result`
--
ALTER TABLE `exam_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nazary_data`
--
ALTER TABLE `nazary_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nazary_data_bolumler`
--
ALTER TABLE `nazary_data_bolumler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nazary_data_caryekler`
--
ALTER TABLE `nazary_data_caryekler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amaly_data`
--
ALTER TABLE `amaly_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `amaly_data_bolum`
--
ALTER TABLE `amaly_data_bolum`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `exam_result`
--
ALTER TABLE `exam_result`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `nazary_data`
--
ALTER TABLE `nazary_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `nazary_data_bolumler`
--
ALTER TABLE `nazary_data_bolumler`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `nazary_data_caryekler`
--
ALTER TABLE `nazary_data_caryekler`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=611;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
