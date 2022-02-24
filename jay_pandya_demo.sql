-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2022 at 08:48 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jay_pandya_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_22_153738_create_shops_table', 2),
(6, '2022_02_22_154342_create_products_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `shop_id`, `name`, `price`, `stock`, `video`, `created_at`, `updated_at`) VALUES
(1, 1, 'iphone 12', '30000', '5', NULL, '2022-02-24 09:28:43', '2022-02-24 09:28:43'),
(2, 1, 'iphone 12', '20000', '100', NULL, '2022-02-24 09:32:04', '2022-02-24 09:32:04'),
(3, 1, 'iphone 13', '200000', '100', 'public/products/video-1645718264.mp4', '2022-02-24 10:27:44', '2022-02-24 10:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `name`, `email`, `address`, `image`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'abc0@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:50', '2022-02-24 08:55:30'),
(2, 'abc', 'abc1@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:50', '2022-02-22 11:08:50'),
(3, 'abc', 'abc2@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:50', '2022-02-22 11:08:50'),
(4, 'abc', 'abc3@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:50', '2022-02-22 11:08:50'),
(5, 'abc', 'abc4@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:50', '2022-02-22 11:08:50'),
(6, 'abc', 'abc5@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:50', '2022-02-22 11:08:50'),
(7, 'abc', 'abc6@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:50', '2022-02-22 11:08:50'),
(8, 'abc', 'abc7@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:50', '2022-02-22 11:08:50'),
(9, 'abc', 'abc8@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:50', '2022-02-22 11:08:50'),
(10, 'abc', 'abc9@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:50', '2022-02-22 11:08:50'),
(11, 'abc', 'abc10@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(12, 'abc', 'abc11@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(13, 'abc', 'abc12@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(14, 'abc', 'abc13@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(15, 'abc', 'abc14@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(16, 'abc', 'abc15@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(17, 'abc', 'abc16@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(18, 'abc', 'abc17@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(19, 'abc', 'abc18@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(20, 'abc', 'abc19@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(21, 'abc', 'abc20@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(22, 'abc', 'abc21@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(23, 'abc', 'abc22@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(24, 'abc', 'abc23@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(25, 'abc', 'abc24@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(26, 'abc', 'abc25@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(27, 'abc', 'abc26@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(28, 'abc', 'abc27@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(29, 'abc', 'abc28@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(30, 'abc', 'abc29@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(31, 'abc', 'abc30@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(32, 'abc', 'abc31@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(33, 'abc', 'abc32@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(34, 'abc', 'abc33@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(35, 'abc', 'abc34@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(36, 'abc', 'abc35@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(37, 'abc', 'abc36@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:51', '2022-02-22 11:08:51'),
(38, 'abc', 'abc37@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(39, 'abc', 'abc38@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(40, 'abc', 'abc39@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(41, 'abc', 'abc40@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(42, 'abc', 'abc41@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(43, 'abc', 'abc42@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(44, 'abc', 'abc43@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(45, 'abc', 'abc44@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(46, 'abc', 'abc45@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(47, 'abc', 'abc46@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(48, 'abc', 'abc47@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(49, 'abc', 'abc48@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(50, 'abc', 'abc49@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(51, 'abc', 'abc50@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(52, 'abc', 'abc51@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(53, 'abc', 'abc52@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(54, 'abc', 'abc53@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(55, 'abc', 'abc54@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(56, 'abc', 'abc55@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(57, 'abc', 'abc56@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(58, 'abc', 'abc57@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(59, 'abc', 'abc58@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(60, 'abc', 'abc59@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(61, 'abc', 'abc60@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(62, 'abc', 'abc61@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(63, 'abc', 'abc62@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(64, 'abc', 'abc63@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(65, 'abc', 'abc64@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(66, 'abc', 'abc65@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:52', '2022-02-22 11:08:52'),
(67, 'abc', 'abc66@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(68, 'abc', 'abc67@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(69, 'abc', 'abc68@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(70, 'abc', 'abc69@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(71, 'abc', 'abc70@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(72, 'abc', 'abc71@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(73, 'abc', 'abc72@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(74, 'abc', 'abc73@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(75, 'abc', 'abc74@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(76, 'abc', 'abc75@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(77, 'abc', 'abc76@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(78, 'abc', 'abc77@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(79, 'abc', 'abc78@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(80, 'abc', 'abc79@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(81, 'abc', 'abc80@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(82, 'abc', 'abc81@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(83, 'abc', 'abc82@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(84, 'abc', 'abc83@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(85, 'abc', 'abc84@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(86, 'abc', 'abc85@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(87, 'abc', 'abc86@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(88, 'abc', 'abc87@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(89, 'abc', 'abc88@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(90, 'abc', 'abc89@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(91, 'abc', 'abc90@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(92, 'abc', 'abc91@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:53', '2022-02-22 11:08:53'),
(93, 'abc', 'abc92@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:54', '2022-02-22 11:08:54'),
(94, 'abc', 'abc93@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:54', '2022-02-22 11:08:54'),
(95, 'abc', 'abc94@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:54', '2022-02-22 11:08:54'),
(96, 'abc', 'abc95@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:54', '2022-02-22 11:08:54'),
(97, 'abc', 'abc96@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:54', '2022-02-22 11:08:54'),
(98, 'abc', 'abc97@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:54', '2022-02-22 11:08:54'),
(99, 'abc', 'abc98@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:54', '2022-02-22 11:08:54'),
(100, 'abc', 'abc99@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:54', '2022-02-22 11:08:54'),
(101, 'abc', 'abc100@mail.com', 'dummy address', 'head-659652_1280.png', '2022-02-22 11:08:54', '2022-02-22 11:08:54'),
(103, 'jay', 'jay_pandya95@yahoo.com', 'dasda', NULL, '2022-02-23 10:42:05', '2022-02-23 10:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'jay', 'jay@gmail.com', NULL, '$2y$10$Am9PmnsO/Z/kKctUwdwfrOJPdOW2WW/w3u5qVg.U.rZZ1Xm4Rc94.', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shops_email_unique` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
