-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2025 at 08:12 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medchain_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

CREATE TABLE `audit_trail` (
  `log_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `log_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `details` text DEFAULT NULL,
  `current_hash` varchar(64) NOT NULL,
  `previous_hash` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_trail`
--

INSERT INTO `audit_trail` (`log_id`, `product_id`, `action`, `actor_id`, `log_timestamp`, `details`, `current_hash`, `previous_hash`) VALUES
(1, 1, 'PRODUCT_REGISTERED', 1, '2025-07-27 14:41:39', '{\"brand_name\":\"dolo650\",\"batch\":\"11\",\"quantity\":45}', '285b5b174485760cd6d6ef127877f288c92bf081acbf0ad210dc0d48e4d6469e', '0000000000000000000000000000000000000000000000000000000000000000'),
(2, 1, 'PRODUCT_DISPENSED_TO_DISTRIBUTOR', 1, '2025-07-28 07:54:56', '{\"product_id\":1,\"brand_name\":\"dolo650\",\"batch_number\":\"11\",\"dispensed_quantity\":25,\"remaining_quantity\":20,\"dispensed_at\":\"2025-07-28 13:24:56\"}', 'fe647c63e12e8facb73398b8b2a8968b6db0790e40ba32692073193d57f4975d', '285b5b174485760cd6d6ef127877f288c92bf081acbf0ad210dc0d48e4d6469e'),
(3, 1, 'PRODUCT_PICKED_UP_BY_DISTRIBUTOR', 8, '2025-07-28 07:55:55', '{\"product_id\":1,\"distributor_product_id\":1,\"picked_up_by_actor_id\":8,\"timestamp\":\"2025-07-28 13:25:55\"}', '9b67708ee18a3e994d3121d8f07721c10412aebdb921e79fcd141e1051fad4d8', 'fe647c63e12e8facb73398b8b2a8968b6db0790e40ba32692073193d57f4975d'),
(4, 1, 'PRODUCT_SOLD_TO_PHARMACIST', 8, '2025-07-28 07:56:25', '{\"product_id\":1,\"sold_by_distributor_id\":8,\"sold_to_pharmacist_id\":9,\"quantity\":25,\"timestamp\":\"2025-07-28 13:26:25\"}', 'a3c50af715911a40e56a49468fd0f71c9243cd29d960cc7f666164ab77ff6028', '9b67708ee18a3e994d3121d8f07721c10412aebdb921e79fcd141e1051fad4d8'),
(5, 1, 'PRODUCT_DISPENSED_TO_PATIENT', 9, '2025-07-28 07:59:32', '{\"product_id\":1,\"dispensed_by_pharmacist_id\":9,\"patient_id\":11,\"patient_name\":\"MUTTURAJ\",\"quantity\":20,\"timestamp\":\"2025-07-28 13:29:32\"}', '84fc67917af141dcb895475f3e5f1fed5a52ad88b7db617d05432c63f161db92', 'a3c50af715911a40e56a49468fd0f71c9243cd29d960cc7f666164ab77ff6028'),
(6, 1, 'PRODUCT_DISPENSED_TO_DISTRIBUTOR', 1, '2025-07-28 08:58:22', '{\"product_id\":1,\"brand_name\":\"dolo650\",\"batch_number\":\"11\",\"dispensed_quantity\":10,\"remaining_quantity\":10,\"dispensed_at\":\"2025-07-28 14:28:22\"}', 'e561639e1c16beca3c545ce9994dc29dafbb18237c8e2bfcb9d16ea0ae10f299', '84fc67917af141dcb895475f3e5f1fed5a52ad88b7db617d05432c63f161db92'),
(7, 2, 'PRODUCT_REGISTERED', 1, '2025-07-28 09:02:34', '{\"brand_name\":\"paracetamol\",\"batch\":\"10\",\"quantity\":10}', '157f7c38f682d28fc72fe6fdc48b11f655ef273d591f83ef035e777f13f31518', '0000000000000000000000000000000000000000000000000000000000000000'),
(8, 2, 'PRODUCT_DISPENSED_TO_DISTRIBUTOR', 1, '2025-07-28 10:17:42', '{\"product_id\":2,\"brand_name\":\"paracetamol\",\"batch_number\":\"10\",\"dispensed_quantity\":2,\"remaining_quantity\":8,\"dispensed_at\":\"2025-07-28 15:47:42\"}', '14c2536f9a6064464c0676519db862558661409c15408d70eac6a674174d06cc', '157f7c38f682d28fc72fe6fdc48b11f655ef273d591f83ef035e777f13f31518'),
(9, 2, 'PRODUCT_PICKED_UP_BY_DISTRIBUTOR', 8, '2025-07-28 10:19:59', '{\"product_id\":2,\"distributor_product_id\":3,\"picked_up_by_actor_id\":8,\"timestamp\":\"2025-07-28 15:49:59\"}', 'f71f97c694796bf4230068695d110d6bd41b0a6fc3d63fc21215f116432de500', '14c2536f9a6064464c0676519db862558661409c15408d70eac6a674174d06cc'),
(10, 1, 'PRODUCT_DISPENSED_TO_DISTRIBUTOR', 1, '2025-07-28 11:31:11', '{\"product_id\":1,\"brand_name\":\"dolo650\",\"batch_number\":\"11\",\"dispensed_quantity\":5,\"remaining_quantity\":5,\"dispensed_at\":\"2025-07-28 17:01:11\"}', '43fcdf296e0151edf0f6558dc265f71cafc2e8640bba153c42940cf452c4d1b9', 'e561639e1c16beca3c545ce9994dc29dafbb18237c8e2bfcb9d16ea0ae10f299'),
(11, 2, 'PRODUCT_SOLD_TO_PHARMACIST', 8, '2025-07-28 12:11:44', '{\"product_id\":2,\"sold_by_distributor_id\":8,\"sold_to_pharmacist_id\":9,\"quantity\":2,\"timestamp\":\"2025-07-28 17:41:44\"}', '678350f26c4f0924a21ffcdc0bdf366b96e37630b5f7771e0430f9016d86027a', 'f71f97c694796bf4230068695d110d6bd41b0a6fc3d63fc21215f116432de500'),
(12, 1, 'PRODUCT_PICKED_UP_BY_DISTRIBUTOR', 8, '2025-07-28 12:23:34', '{\"product_id\":1,\"distributor_product_id\":2,\"picked_up_by_actor_id\":8,\"timestamp\":\"2025-07-28 17:53:34\"}', '5d394664885040cb2fc1926c5ca9ef8d636fdc4ede65dafc84728daa3eb16e79', '43fcdf296e0151edf0f6558dc265f71cafc2e8640bba153c42940cf452c4d1b9'),
(13, 1, 'PRODUCT_SOLD_TO_PHARMACIST', 8, '2025-07-28 13:24:38', '{\"product_id\":1,\"sold_by_distributor_id\":8,\"sold_to_pharmacist_id\":4,\"quantity\":5,\"timestamp\":\"2025-07-28 18:54:38\"}', '27ce72a2c151dcddc6c944c689b6ae80b434665cd6afe82562b1840a01a8bcb5', '5d394664885040cb2fc1926c5ca9ef8d636fdc4ede65dafc84728daa3eb16e79'),
(14, 1, 'PRODUCT_DISPENSED_TO_DISTRIBUTOR', 1, '2025-07-28 13:26:03', '{\"product_id\":1,\"brand_name\":\"dolo650\",\"batch_number\":\"11\",\"dispensed_quantity\":5,\"remaining_quantity\":0,\"dispensed_at\":\"2025-07-28 18:56:03\"}', '57f18a6d6ddd2f7ceb9e3554120b964afe628ca602e0f898ba65584db11ee372', '27ce72a2c151dcddc6c944c689b6ae80b434665cd6afe82562b1840a01a8bcb5'),
(15, 1, 'PRODUCT_PICKED_UP_BY_DISTRIBUTOR', 8, '2025-07-28 13:26:19', '{\"product_id\":1,\"distributor_product_id\":4,\"picked_up_by_actor_id\":8,\"timestamp\":\"2025-07-28 18:56:19\"}', '0ffea02ad85ee8f579df27877db8d4fe04f4ca47e0c3f1e44b72946b5319317a', '57f18a6d6ddd2f7ceb9e3554120b964afe628ca602e0f898ba65584db11ee372'),
(16, 2, 'PRODUCT_DISPENSED_TO_PATIENT', 9, '2025-07-28 18:28:03', '{\"product_id\":2,\"dispensed_by_pharmacist_id\":9,\"patient_id\":11,\"patient_name\":\"MUTTURAJ\",\"quantity\":2,\"timestamp\":\"2025-07-28 23:58:03\"}', 'ac22cd7b10ba086a4e01f0dfc43c6a6698919ab4aeba9116ad9936bab6b8e6e5', '678350f26c4f0924a21ffcdc0bdf366b96e37630b5f7771e0430f9016d86027a'),
(17, 3, 'PRODUCT_REGISTERED', 1, '2025-08-04 06:02:48', '{\"brand_name\":\"omme\",\"batch\":\"232\",\"quantity\":100}', 'a9ffe2c66912b3d6564c4003d2a0a40b71a4def12acade914f7e82798eccaa21', '0000000000000000000000000000000000000000000000000000000000000000'),
(18, 3, 'PRODUCT_DISPENSED_TO_DISTRIBUTOR', 1, '2025-08-04 06:07:44', '{\"product_id\":3,\"brand_name\":\"omme\",\"batch_number\":\"232\",\"dispensed_quantity\":50,\"remaining_quantity\":50,\"dispensed_at\":\"2025-08-04 11:37:44\"}', '15695cc880d1db2ff16a6a2d522edbf4ba503652acff542afc54aa8ba7527eee', 'a9ffe2c66912b3d6564c4003d2a0a40b71a4def12acade914f7e82798eccaa21'),
(19, 3, 'PRODUCT_PICKED_UP_BY_DISTRIBUTOR', 8, '2025-08-04 06:08:43', '{\"product_id\":3,\"distributor_product_id\":6,\"picked_up_by_actor_id\":8,\"timestamp\":\"2025-08-04 11:38:43\"}', 'f69c46ad7b58eb6d5b0291b12ace8e260b30e939eb384bccf6c660740f16cdfc', '15695cc880d1db2ff16a6a2d522edbf4ba503652acff542afc54aa8ba7527eee');

-- --------------------------------------------------------

--
-- Table structure for table `distributor_products`
--

CREATE TABLE `distributor_products` (
  `distributor_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `dispensed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `pickup_status` enum('pending','picked_up','delivered') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `distributor_products`
--

INSERT INTO `distributor_products` (`distributor_product_id`, `product_id`, `quantity`, `dispensed_at`, `pickup_status`) VALUES
(2, 1, 5, '2025-07-28 08:58:22', 'picked_up'),
(4, 1, 5, '2025-07-28 11:31:11', 'picked_up'),
(5, 1, 5, '2025-07-28 13:26:03', 'pending'),
(6, 3, 50, '2025-08-04 06:07:44', 'picked_up');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `attempt_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `attempt_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `success` tinyint(1) DEFAULT 0,
  `failure_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`attempt_id`, `email`, `ip_address`, `attempt_time`, `success`, `failure_reason`) VALUES
(1, 'chickya009@gmail.com', '127.0.0.1', '2025-07-28 07:54:24', 1, NULL),
(2, '7chickooo@gmail.com', '127.0.0.1', '2025-07-28 07:55:50', 1, NULL),
(3, 'shrikantchavan0003@gmail.com', '127.0.0.1', '2025-07-28 07:57:16', 1, NULL),
(4, 'chickya009@gmail.com', '127.0.0.1', '2025-07-28 08:00:28', 1, NULL),
(5, '7chickooo@gmail.com', '127.0.0.1', '2025-07-28 10:19:47', 1, NULL),
(6, '7chickooo@gmail.com', '127.0.0.1', '2025-07-28 12:01:50', 1, NULL),
(7, 'shrikantchavan0003@gmail.com', '127.0.0.1', '2025-07-28 18:27:23', 1, NULL),
(8, 'chickya009@gmail.com', '127.0.0.1', '2025-07-28 18:28:48', 1, NULL),
(9, '7chickooo@gmail.com', '127.0.0.1', '2025-07-29 04:02:51', 1, NULL),
(10, '7chickooo@gmail.com', '127.0.0.1', '2025-08-01 18:33:20', 1, NULL),
(11, '7chickooo@gmail.com', '127.0.0.1', '2025-08-02 16:00:19', 1, NULL),
(12, '7chickooo@gmail.com', '127.0.0.1', '2025-08-04 06:08:29', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `priority` enum('Normal','Urgent') NOT NULL DEFAULT 'Normal',
  `message_content` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `sender_id`, `recipient_id`, `subject`, `priority`, `message_content`, `timestamp`, `read_status`) VALUES
(1, 9, 1, 'ok', 'Urgent', 'very ok', '2025-07-28 07:58:23', 1),
(2, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment to the following destination: Pune, Pune District, Maharashtra, India', '2025-07-28 11:03:32', 1),
(3, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment to the following destination: Pune, Pune District, Maharashtra, India', '2025-07-28 11:14:09', 1),
(4, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment to the following destination: Goa, India', '2025-07-28 11:24:20', 1),
(5, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment to the following destination: Belagavi, Karnataka, India', '2025-07-28 11:29:56', 1),
(6, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment to the following destination: Goa, India', '2025-07-28 12:00:48', 1),
(7, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68873caa9a5e38.03389591 to the following destination: Delhi, India.', '2025-07-28 12:05:54', 1),
(8, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68873caa9a5e38.03389591 to the following destination: Pune, Pune District, Maharashtra, India.', '2025-07-28 12:19:10', 1),
(9, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Pakistan.', '2025-07-28 12:24:19', 1),
(10, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Pune, Pune District, Maharashtra, India.', '2025-07-28 12:30:40', 1),
(11, 1, 8, 'URGENT: Route Deviation Alert', 'Urgent', 'Your vehicle for consignment ID med_68863aa3a20fb1.46460535 has deviated from the planned route. Please check the live map immediately.', '2025-07-28 12:31:56', 1),
(12, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Pune, Pune District, Maharashtra, India.', '2025-07-28 12:35:18', 1),
(13, 1, 8, 'URGENT: Route Deviation Alert', 'Urgent', 'Your vehicle for consignment ID med_68863aa3a20fb1.46460535 has deviated from the planned route. Please check the live map immediately.', '2025-07-28 12:35:26', 1),
(14, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Pune, Pune District, Maharashtra, India.', '2025-07-28 12:38:07', 1),
(15, 1, 8, 'URGENT: Route Deviation Alert', 'Urgent', 'Your vehicle for consignment ID med_68863aa3a20fb1.46460535 has deviated from the planned route. Please check the live map immediately.', '2025-07-28 12:38:19', 1),
(16, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Dharwad, Karnataka, India.', '2025-07-28 12:44:51', 1),
(17, 1, 8, 'URGENT: Route Deviation Alert', 'Urgent', 'Your vehicle for consignment ID med_68863aa3a20fb1.46460535 has deviated from the planned route. Please check the live map immediately.', '2025-07-28 12:45:01', 1),
(18, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Pune, Pune District, Maharashtra, India.', '2025-07-28 12:45:29', 1),
(19, 1, 8, 'URGENT: Route Deviation Alert', 'Urgent', 'Your vehicle for consignment ID med_68863aa3a20fb1.46460535 has deviated from the planned route. Please check the live map immediately.', '2025-07-28 12:45:34', 1),
(20, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Pune, Pune District, Maharashtra, India.', '2025-07-28 13:02:54', 1),
(21, 1, 8, 'URGENT: START_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 has deviated from the route.', '2025-07-28 13:03:02', 1),
(22, 1, 8, 'URGENT: STOP_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 is back on route.', '2025-07-28 13:03:22', 1),
(23, 1, 8, 'URGENT: START_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 has deviated from the route.', '2025-07-28 13:03:31', 1),
(24, 1, 8, 'URGENT: STOP_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 is back on route.', '2025-07-28 13:03:35', 1),
(25, 1, 8, 'URGENT: START_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 has deviated from the route.', '2025-07-28 13:03:37', 1),
(26, 1, 8, 'URGENT: STOP_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 is back on route.', '2025-07-28 13:03:39', 1),
(27, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Shrinagar, Gotegaon Tahsil, Narsinghpur, Madhya Pradesh, India.', '2025-07-28 13:14:28', 1),
(28, 1, 8, 'URGENT: START_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 has deviated from the route.', '2025-07-28 13:14:42', 1),
(29, 1, 8, 'URGENT: STOP_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 is back on route.', '2025-07-28 13:14:56', 1),
(30, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Chennai, Tamil Nadu, 600001, India.', '2025-07-28 13:19:30', 1),
(31, 1, 8, 'URGENT: START_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 has deviated from the route.', '2025-07-28 13:19:56', 1),
(32, 1, 8, 'URGENT: STOP_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 is back on route.', '2025-07-28 13:20:13', 1),
(33, 1, 8, 'URGENT: START_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 has deviated from the route.', '2025-07-28 13:22:15', 1),
(34, 1, 8, 'URGENT: STOP_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 is back on route.', '2025-07-28 13:22:17', 1),
(35, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Chennai, Tamil Nadu, 600001, India.', '2025-07-28 13:23:32', 1),
(36, 1, 8, 'URGENT: START_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 has deviated from the route.', '2025-07-28 13:23:51', 1),
(37, 1, 8, 'URGENT: STOP_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 is back on route.', '2025-07-28 13:24:03', 1),
(38, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Solapur District, Maharashtra, India.', '2025-07-28 18:24:01', 1),
(39, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Pune, Pune District, Maharashtra, India.', '2025-07-28 18:24:32', 1),
(40, 1, 8, 'URGENT: START_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 has deviated from the route.', '2025-07-28 18:24:58', 1),
(41, 1, 8, 'URGENT: STOP_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 is back on route.', '2025-07-28 18:25:01', 1),
(42, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Benguluru, Vijayawada - Machilipatnam Road, Poranki, Tadigadapa, Penamaluru, Krishna district, Andhra Pradesh, 521137, India.', '2025-07-29 03:59:08', 1),
(43, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Pune, Pune District, Maharashtra, India.', '2025-07-29 03:59:33', 1),
(44, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Pune, Pune District, Maharashtra, India.', '2025-07-29 04:00:20', 1),
(45, 1, 8, 'URGENT: START_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 has deviated from the route.', '2025-07-29 04:00:56', 1),
(46, 1, 8, 'URGENT: STOP_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 is back on route.', '2025-07-29 04:01:00', 1),
(47, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535  to the following destination: Pune, Pune District, Maharashtra, India.', '2025-08-01 18:32:17', 1),
(48, 1, 8, 'URGENT: START_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535  has deviated from the route.', '2025-08-01 18:34:09', 1),
(49, 1, 8, 'URGENT: STOP_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535  is back on route.', '2025-08-01 18:34:16', 1),
(50, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Pune, Pune District, Maharashtra, India.', '2025-08-02 15:59:29', 1),
(51, 1, 8, 'URGENT: START_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 has deviated from the route.', '2025-08-02 16:00:51', 1),
(52, 1, 8, 'URGENT: STOP_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68863aa3a20fb1.46460535 is back on route.', '2025-08-02 16:01:00', 1),
(53, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68863aa3a20fb1.46460535 to the following destination: Amritsar, Amritsar I Tahsil, Amritsar, Punjab, 143001, India.', '2025-08-02 16:14:15', 1),
(54, 1, 8, 'URGENT: New Delivery Instruction', 'Urgent', 'You have to deliver the consignment with Product ID: med_68904d085da5e5.14636425 to the following destination: Pune, Pune District, Maharashtra, India.', '2025-08-04 06:09:06', 1),
(55, 1, 8, 'URGENT: START_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68904d085da5e5.14636425 has deviated from the route.', '2025-08-04 06:09:52', 1),
(56, 1, 8, 'URGENT: STOP_ROUTE_DEVIATION_ALERT', 'Urgent', 'Vehicle for consignment ID med_68904d085da5e5.14636425 is back on route.', '2025-08-04 06:10:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist_products`
--

CREATE TABLE `pharmacist_products` (
  `pharmacist_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `pharmacist_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `received_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmacist_products`
--

INSERT INTO `pharmacist_products` (`pharmacist_product_id`, `product_id`, `pharmacist_id`, `quantity`, `received_at`) VALUES
(1, 1, 9, 5, '2025-07-28 07:56:25'),
(3, 1, 4, 5, '2025-07-28 13:24:38');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist_received_history`
--

CREATE TABLE `pharmacist_received_history` (
  `history_id` int(11) NOT NULL,
  `pharmacist_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_received` int(11) NOT NULL,
  `received_from_distributor_id` int(11) NOT NULL,
  `received_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmacist_received_history`
--

INSERT INTO `pharmacist_received_history` (`history_id`, `pharmacist_id`, `product_id`, `quantity_received`, `received_from_distributor_id`, `received_timestamp`) VALUES
(1, 9, 1, 25, 8, '2025-07-28 07:56:25'),
(2, 9, 2, 2, 8, '2025-07-28 12:11:44'),
(3, 4, 1, 5, 8, '2025-07-28 13:24:38');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `unique_identifier` varchar(255) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `generic_name` varchar(255) NOT NULL,
  `batch_number` varchar(100) NOT NULL,
  `product_code_sku` varchar(100) DEFAULT NULL,
  `manufacturer_name` varchar(255) NOT NULL,
  `manufacturing_license_number` varchar(100) DEFAULT NULL,
  `country_of_origin` varchar(100) DEFAULT NULL,
  `manufacturing_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `active_ingredients` text DEFAULT NULL,
  `excipients` text DEFAULT NULL,
  `formulation_type` varchar(100) DEFAULT NULL,
  `strength` varchar(100) DEFAULT NULL,
  `dosage_instructions` text DEFAULT NULL,
  `route_of_administration` varchar(100) DEFAULT NULL,
  `drug_license_number` varchar(100) DEFAULT NULL,
  `approval_authority` varchar(100) DEFAULT NULL,
  `approval_date` date DEFAULT NULL,
  `storage_conditions` varchar(255) DEFAULT NULL,
  `shelf_life` varchar(100) DEFAULT NULL,
  `mrp` decimal(10,2) DEFAULT NULL,
  `pack_size` varchar(100) DEFAULT NULL,
  `packaging_type` varchar(100) DEFAULT NULL,
  `therapeutic_category` varchar(255) DEFAULT NULL,
  `indications` text DEFAULT NULL,
  `contraindications` text DEFAULT NULL,
  `side_effects` text DEFAULT NULL,
  `precautions` text DEFAULT NULL,
  `interactions` text DEFAULT NULL,
  `stock_quantity` int(11) NOT NULL,
  `reorder_level` int(11) DEFAULT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `registration_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `unique_identifier`, `manufacturer_id`, `brand_name`, `generic_name`, `batch_number`, `product_code_sku`, `manufacturer_name`, `manufacturing_license_number`, `country_of_origin`, `manufacturing_date`, `expiry_date`, `active_ingredients`, `excipients`, `formulation_type`, `strength`, `dosage_instructions`, `route_of_administration`, `drug_license_number`, `approval_authority`, `approval_date`, `storage_conditions`, `shelf_life`, `mrp`, `pack_size`, `packaging_type`, `therapeutic_category`, `indications`, `contraindications`, `side_effects`, `precautions`, `interactions`, `stock_quantity`, `reorder_level`, `supplier_name`, `registration_timestamp`) VALUES
(1, 'med_68863aa3a20fb1.46460535', 1, 'dolo650', 'dolo', '11', '', 'Default Pharma Inc.', '', '', '2025-07-27', '2025-12-31', '', '', 'Tablet', '', '', '', '', '', '2025-07-27', '', '', 120.00, '', '', '', '', '', '', '', '', 0, 4, 'ok', '2025-07-27 14:41:39'),
(2, 'med_68873caa9a5e38.03389591', 1, 'paracetamol', 'paracetamol', '10', '', 'Default Pharma Inc.', '', '', '2025-07-28', '2027-12-12', '', '', 'Capsule', '20mg', '', '', '', '', '2025-07-02', '', '', 122.00, '10', '', '', '', '', '', '', '', 8, 1, 'ok', '2025-07-28 09:02:34'),
(3, 'med_68904d085da5e5.14636425', 1, 'omme', 'omme', '232', '', 'Default Pharma Inc.', '', '', '2025-08-04', '2025-08-30', '', '', 'Tablet', '23', '', '', '', '', '2025-08-04', '', '', 120.00, '', '', '', '', '', '', '', '', 50, 1, 'shrikant', '2025-08-04 06:02:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('manufacturer','distributor','pharmacist','patient','admin') NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `otp_expiry` datetime DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `role`, `full_name`, `email`, `otp`, `otp_expiry`, `phone`, `is_verified`, `created_at`, `last_login`) VALUES
(1, 'admin', '$2y$10$E.qA8c2J5C1j.yK9s4zL9eH2/d6L2s5n8a.rG8n3bX7zK4v.O1w.q', 'admin', 'System Administrator', 'admin@medchain.com', NULL, NULL, NULL, 0, '2025-07-21 13:18:22', NULL),
(2, 'manufacturer_a', '$2y$10$iP/k/wX8N.gC5.zG7hJ6j.X8r/a9e.fG4n.H2o.I1p.T5q.L3o.E4', 'manufacturer', 'Default Pharma Inc.', 'manufacturer@medchain.com', NULL, NULL, NULL, 0, '2025-07-21 13:18:22', NULL),
(3, 'distributor_x', '$2y$10$o.L8r.a9e.fG4n.H2o.I1p.T5q.L3o.E4iP/k/wX8N.gC5.zG7hJ6j', 'distributor', 'National Distributors', 'distributor@medchain.com', NULL, NULL, NULL, 0, '2025-07-21 13:18:22', NULL),
(4, 'pharmacist_y', '$2y$10$zG7hJ6j.X8r/a9e.fG4n.H2o.I1p.T5q.L3o.E4iP/k/wX8N.gC5.o', 'pharmacist', 'City Pharmacy', 'pharmacist@medchain.com', NULL, NULL, NULL, 0, '2025-07-21 13:18:22', NULL),
(6, 'GAUTAM', '$2y$10$buNGklpWgfNl7RGoSdllMOiY/VENTuvaCjz3t6ERuiPOCgrutsu/2', 'patient', 'MR GAUTAM', 'gautam@medchain.com', NULL, NULL, NULL, 0, '2025-07-21 13:18:22', NULL),
(8, 'Hanamant', '$2y$10$K39N1cmtcFruo1X2vEOHmOk4C5B/XJJVXs5efx2yEQV3whgv7nNgO', 'distributor', 'SHRIIKANT', '7chickooo@gmail.com', NULL, NULL, '9623967324', 1, '2025-07-21 13:37:52', '2025-08-04 06:08:29'),
(9, 'hubli_medical', '$2y$10$k1xFN5CRzw9I/9gPrJFnSuxhUQV/rp3.8ea5yMfSqfaLWgqbakJYu', 'pharmacist', 'Shree Gajanan medical store hubli', 'shrikantchavan0003@gmail.com', NULL, NULL, '9741898651', 1, '2025-07-21 14:36:38', '2025-07-28 18:27:23'),
(11, 'MUTTU', '$2y$10$/IWgr.pK/PPov22ZPhMuNehIS5PR0FhOlCPx.z7ZnuI7ewhASj/1O', 'patient', 'MUTTURAJ', 'chickya009@gmail.com', NULL, NULL, '9966332255', 1, '2025-07-21 15:03:08', '2025-07-28 18:28:48'),
(16, 'krishna', '$2y$10$Hc5qoaRDYH9wIekCxkIsCOoFvhGZBvoxUzyVU99Q2KdHeOlC4hzoK', 'patient', 'Krishna', 'krishnamj2003@gmail.com', NULL, NULL, '9986542330', 1, '2025-07-23 10:16:37', '2025-07-23 11:51:36');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `profile_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` text DEFAULT NULL,
  `license_number` varchar(100) DEFAULT NULL,
  `organization_name` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive','suspended') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_sessions`
--

INSERT INTO `user_sessions` (`session_id`, `user_id`, `role`, `ip_address`, `user_agent`, `created_at`, `expires_at`, `is_active`) VALUES
('02d39aa420338f21fd16c527b72a120d77d27301d8621580094ee00db5c5d60e', 8, 'distributor', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', '2025-07-28 12:01:50', '2025-07-29 08:31:50', 0),
('31e2618295d0a64ba09fc7e2967db38c76497ab25b32d3d8ed549a0fb96059f7', 9, 'pharmacist', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', '2025-07-28 07:57:16', '2025-07-29 04:27:16', 0),
('3be93a038d71eb6b4669dcc30659e946530a940dc9f5b080ffd8c8b06103de33', 8, 'distributor', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', '2025-07-28 07:55:50', '2025-07-29 04:25:50', 0),
('53b3f41a2d8f7b57627b510e578816851ca998917563fa6df01a4713c9785f46', 8, 'distributor', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', '2025-08-01 18:33:20', '2025-08-02 15:03:19', 0),
('575a840909113962758d18f468a7c59ad57aeefdb62d8ecfb66e74f5f368ee9b', 11, 'patient', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', '2025-07-28 07:54:24', '2025-07-29 04:24:24', 0),
('5f099f5a1b9c2cf456d30d353f92e4d9eb407ce1e38b6928220cd9ccbdbd7159', 8, 'distributor', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', '2025-07-29 04:02:51', '2025-07-30 00:32:51', 0),
('bc5b7ab9d3f2445369a236fbabfeab2bc223655bee1338f459f25956c7a415a2', 11, 'patient', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', '2025-07-28 08:00:28', '2025-07-29 04:30:28', 0),
('ce95c9a1487231381c58861f07e76ad0847174c33f8ab84e8717d848f45f20ea', 11, 'patient', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', '2025-07-28 18:28:48', '2025-07-29 14:58:48', 1),
('d05562ac8da1c9da5fce1c0167c18df6ea367c778378cf5e3668fbedacf3b411', 8, 'distributor', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', '2025-07-28 10:19:47', '2025-07-29 06:49:47', 0),
('eaec3f9315d95566c80879c82adcb6f4179a8a8c765a5b9c80bac0cf81d04d11', 8, 'distributor', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', '2025-08-04 06:08:29', '2025-08-05 02:38:29', 1),
('f2f1977983e9f0bd219b7b08c8a30a33b73883f2ad6a50608645412af7ea038b', 9, 'pharmacist', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', '2025-07-28 18:27:23', '2025-07-29 14:57:23', 0),
('f4dfb1b6e46247ba86b64ba35644de5e66a5932bd57fbaa7b2c577d1a39ef659', 8, 'distributor', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', '2025-08-02 16:00:19', '2025-08-03 12:30:19', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `actor_id` (`actor_id`);

--
-- Indexes for table `distributor_products`
--
ALTER TABLE `distributor_products`
  ADD PRIMARY KEY (`distributor_product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`attempt_id`),
  ADD KEY `idx_login_attempts_email` (`email`),
  ADD KEY `idx_login_attempts_ip` (`ip_address`),
  ADD KEY `idx_login_attempts_time` (`attempt_time`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `pharmacist_products`
--
ALTER TABLE `pharmacist_products`
  ADD PRIMARY KEY (`pharmacist_product_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `pharmacist_id` (`pharmacist_id`);

--
-- Indexes for table `pharmacist_received_history`
--
ALTER TABLE `pharmacist_received_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `pharmacist_id` (`pharmacist_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `unique_identifier` (`unique_identifier`),
  ADD KEY `manufacturer_id` (`manufacturer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_users_email` (`email`),
  ADD KEY `idx_users_role` (`role`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `unique_user_profile` (`user_id`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `idx_user_sessions_user_id` (`user_id`),
  ADD KEY `idx_user_sessions_expires` (`expires_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `distributor_products`
--
ALTER TABLE `distributor_products`
  MODIFY `distributor_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `attempt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `pharmacist_products`
--
ALTER TABLE `pharmacist_products`
  MODIFY `pharmacist_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pharmacist_received_history`
--
ALTER TABLE `pharmacist_received_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `distributor_products`
--
ALTER TABLE `distributor_products`
  ADD CONSTRAINT `distributor_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `pharmacist_products`
--
ALTER TABLE `pharmacist_products`
  ADD CONSTRAINT `pharmacist_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pharmacist_products_ibfk_2` FOREIGN KEY (`pharmacist_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
