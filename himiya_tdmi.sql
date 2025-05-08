-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 08, 2025 at 10:10 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


DROP DATABASE IF EXISTS `himiya_tdmi`;
CREATE DATABASE IF NOT EXISTS `himiya_tdmi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE himiya_tdmi;


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
  `nomeri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Bolum_ady` varchar(100) DEFAULT NULL,
  `Paragraf_no` varchar(10) NOT NULL,
  `Paragraf_ady` varchar(250) NOT NULL,
  `PDF_file_ady` text,
  `Surat` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amaly_data_bolum`
--

CREATE TABLE `amaly_data_bolum` (
  `id` int NOT NULL,
  `belgi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `amaly_data_bolum`
--

INSERT INTO `amaly_data_bolum` (`id`, `belgi`) VALUES
(1, '1'),
(28, '2'),
(30, '3'),
(31, '4');

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
(96, 26, 'Perhat', '2025-04-30', '100', 2, 0, '2.Caryek'),
(100, 15, 'Kabulov', '2025-05-06', '100', 1, 0, '3.Caryek'),
(102, 15, 'Kabulov', '2025-05-07', '100', 3, 0, '2.Caryek'),
(103, 26, 'Perhat', '2025-05-07', '0', 0, 1, '4.caryek'),
(108, 21, 'gubba', '2025-05-07', '67', 2, 1, '2.Caryek');

-- --------------------------------------------------------

--
-- Table structure for table `meseleler_data`
--

CREATE TABLE `meseleler_data` (
  `id` int NOT NULL,
  `nomeri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Bolum_ady` varchar(100) DEFAULT NULL,
  `Paragraf_no` varchar(10) NOT NULL,
  `Paragraf_ady` varchar(250) NOT NULL,
  `PDF_file_ady` text,
  `Surat` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meseleler_data_bolum`
--

CREATE TABLE `meseleler_data_bolum` (
  `id` int NOT NULL,
  `belgi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `meseleler_data_bolum`
--

INSERT INTO `meseleler_data_bolum` (`id`, `belgi`) VALUES
(9, '6'),
(10, '1'),
(11, '2');

-- --------------------------------------------------------

--
-- Table structure for table `nazary_data`
--

CREATE TABLE `nazary_data` (
  `id` int NOT NULL,
  `nomeri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Bolum_ady` varchar(100) DEFAULT NULL,
  `Paragraf_no` varchar(10) NOT NULL,
  `Paragraf_ady` varchar(250) NOT NULL,
  `Tema` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PDF_file_ady` text,
  `Surat` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nazary_data_bolumler`
--

CREATE TABLE `nazary_data_bolumler` (
  `id` int NOT NULL,
  `belgi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nazary_data_bolumler`
--

INSERT INTO `nazary_data_bolumler` (`id`, `belgi`) VALUES
(16, '1'),
(17, '2'),
(20, '4');

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
(118, 'suw formulasy..?', '68157a0acc8f7_banner4.jpg,68157a0f198da_usecomp6.jpg', 'H2So4, HCL we...|apple, grapes', 1, '2.Caryek', '2.jpg', '2025-04-15 16:34:16'),
(124, 'maccoffe or nescafe', '1744888097_usecomp6.jpg,1744888097_2.jpg', 'maccoffe is, may...|neascafemore than other, ...', 2, '2.Caryek', '1744888097_bir.jpg', '2025-04-17 11:08:17'),
(125, 'Idris baba medresesi', '68191d9454e20_buhara-59_640x467.jpg,68191d9cea8d8_ingco10m.jpg', 'Ahal welayaty, Gokdepe|lebap welayaty, Halac etrap', 1, '4.caryek', 'idrisbaba.jpg', '2025-04-17 11:56:31'),
(126, 'size of data...', '1746509156_ingco10m.jpg,1746509156_icki boyag 10 kg.jpg,1746509156_Без имеaи-12.jpg', 'MegaByte may be..|Kg may be..|Tonn may be... ', 3, '3.Caryek', '1746509156_12_55_11zon.jpg', '2025-05-06 05:25:56'),
(128, 'Tıbb el-Cedid eseri bilen haysi bilim pudagy gorkezilen?', '1746628130_mugallym1.jpg,1746628130_mugallym2.jpg,1746628130_681abfd70082d_blog1.jpg,1746628130_681ac0058d02f_blog2.jpg', 'Fizka|Astronomiya|Himiya|Fizika, Himiya', 3, '2.Caryek', '1746628130_book.jpg', '2025-05-07 14:28:50');

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
-- Table structure for table `tejribe_data`
--

CREATE TABLE `tejribe_data` (
  `id` int NOT NULL,
  `nomeri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Bolum_ady` varchar(100) DEFAULT NULL,
  `Paragraf_no` varchar(10) NOT NULL,
  `Paragraf_ady` varchar(250) NOT NULL,
  `PDF_file_ady` text,
  `Surat` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tejribe_data`
--

INSERT INTO `tejribe_data` (`id`, `nomeri`, `Bolum_ady`, `Paragraf_no`, `Paragraf_ady`, `PDF_file_ady`, `Surat`) VALUES
(84, '1', 'teeeej', '5.5', 'jhjhjh', '681ac59b2ec0d-Appointment Confirmation .pdf', '681ac63024569_5x6_kabulov.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tejribe_data_bolum`
--

CREATE TABLE `tejribe_data_bolum` (
  `id` int NOT NULL,
  `belgi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tejribe_data_bolum`
--

INSERT INTO `tejribe_data_bolum` (`id`, `belgi`) VALUES
(1, '1'),
(4, '2');

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
(616, 15, 118, 1, '2025-05-07 17:29:26'),
(617, 15, 128, 3, '2025-05-07 17:29:38'),
(618, 15, 124, 2, '2025-05-07 17:29:43'),
(619, 26, 125, 2, '2025-05-07 17:43:44'),
(620, 15, 118, 1, '2025-05-07 17:44:03'),
(621, 15, 124, 2, '2025-05-07 17:44:06'),
(622, 15, 128, 2, '2025-05-07 17:44:09'),
(623, 15, 128, 4, '2025-05-07 17:47:45'),
(624, 15, 118, 2, '2025-05-07 17:47:48'),
(625, 15, 124, 2, '2025-05-07 17:47:50'),
(626, 25, 124, 1, '2025-05-07 17:48:18'),
(627, 25, 128, 3, '2025-05-07 17:48:21'),
(628, 25, 118, 1, '2025-05-07 17:48:24'),
(629, 26, 118, 1, '2025-05-07 18:40:10'),
(630, 26, 124, 2, '2025-05-07 18:40:13'),
(631, 26, 128, 1, '2025-05-07 18:40:16'),
(632, 21, 128, 2, '2025-05-07 18:41:24'),
(633, 21, 124, 2, '2025-05-07 18:41:26'),
(634, 21, 118, 1, '2025-05-07 18:41:29');

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
-- Indexes for table `meseleler_data`
--
ALTER TABLE `meseleler_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meseleler_data_bolum`
--
ALTER TABLE `meseleler_data_bolum`
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
-- Indexes for table `tejribe_data`
--
ALTER TABLE `tejribe_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tejribe_data_bolum`
--
ALTER TABLE `tejribe_data_bolum`
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `amaly_data_bolum`
--
ALTER TABLE `amaly_data_bolum`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `exam_result`
--
ALTER TABLE `exam_result`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `meseleler_data`
--
ALTER TABLE `meseleler_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `meseleler_data_bolum`
--
ALTER TABLE `meseleler_data_bolum`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `nazary_data`
--
ALTER TABLE `nazary_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `nazary_data_bolumler`
--
ALTER TABLE `nazary_data_bolumler`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `nazary_data_caryekler`
--
ALTER TABLE `nazary_data_caryekler`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tejribe_data`
--
ALTER TABLE `tejribe_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `tejribe_data_bolum`
--
ALTER TABLE `tejribe_data_bolum`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=635;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
