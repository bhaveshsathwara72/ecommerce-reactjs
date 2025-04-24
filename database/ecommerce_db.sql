-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 23, 2025 at 09:54 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@gmail.com', '$2y$12$xhlr7vw39ldD1PNmPpeTwusZudwTqCGQBg/Gyt1hqOk570mtAkkcq', NULL, '2025-04-23 00:45:40', '2025-04-23 00:45:40');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(3, 1, 4, 4, '2025-04-23 08:12:02', '2025-04-23 08:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `description`, `created_at`, `updated_at`) VALUES
(4, 'Sedans', 'sedans', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', 'null', '2025-04-23 06:38:07', '2025-04-23 07:04:45'),
(5, 'SUVs', 'suvs', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(6, 'Trucks', 'trucks', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(7, 'Hatchbacks', 'hatchbacks', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(8, 'Coupes', 'coupes', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(9, 'Convertibles', 'convertibles', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(10, 'Electric Vehicles', 'electric', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(11, 'Hybrids', 'hybrids', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(12, 'Luxury Cars', 'luxury', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(13, 'Sports Cars', 'sports', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(14, 'Minivans', 'minivans', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(15, 'Crossovers', 'crossovers', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(16, 'Supercars', 'supercars', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(17, 'Muscle Cars', 'muscle', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(18, 'Classic Cars', 'classic', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(19, 'Off-Road Vehicles', 'offroad', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(20, 'Commercial Vehicles', 'commercial', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(21, 'Performance Cars', 'performance', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(22, 'Compact Cars', 'compact', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07'),
(23, 'Luxury SUVs', 'luxury-suvs', 'categories/ucGZQblsjoZgIxi2FPqZq8s2Ro6qPcvYwgkklxww.jpg', NULL, '2025-04-23 06:38:07', '2025-04-23 06:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_20_create_orders_table', 1),
(5, '2024_03_20_create_products_table', 1),
(6, '2024_03_20_create_order_items_table', 2),
(7, '2025_04_23_055623_create_personal_access_tokens_table', 3),
(8, '[timestamp]_create_admins_table', 4),
(9, '2025_04_23_072700_create_categories_table', 5),
(10, '[timestamp]_create_carts_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 374041.00, 'completed', '2025-04-23 08:20:17', '2025-04-23 13:00:47'),
(2, 2, 132405.00, 'completed', '2025-04-23 08:43:49', '2025-04-23 13:00:56'),
(3, 2, 236439.00, 'pending', '2025-04-23 13:03:34', '2025-04-23 13:03:34'),
(4, 2, 236439.00, 'pending', '2025-04-23 13:04:54', '2025-04-23 13:04:54'),
(5, 2, 236439.00, 'pending', '2025-04-23 13:04:56', '2025-04-23 13:04:56'),
(6, 2, 236439.00, 'pending', '2025-04-23 13:05:55', '2025-04-23 13:05:55'),
(7, 2, 236439.00, 'pending', '2025-04-23 13:06:19', '2025-04-23 13:06:19'),
(8, 2, 236439.00, 'pending', '2025-04-23 13:07:09', '2025-04-23 13:07:09'),
(9, 2, 52017.00, 'pending', '2025-04-23 13:08:10', '2025-04-23 13:08:10'),
(10, 2, 260085.00, 'pending', '2025-04-23 13:08:32', '2025-04-23 13:08:32');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 52017.00, '2025-04-23 08:20:17', '2025-04-23 08:20:17'),
(2, 1, 4, 4, 80506.00, '2025-04-23 08:20:17', '2025-04-23 08:20:17'),
(3, 2, 2, 1, 52017.00, '2025-04-23 08:43:49', '2025-04-23 08:43:49'),
(4, 2, 1, 1, 80388.00, '2025-04-23 08:43:49', '2025-04-23 08:43:49'),
(5, 3, 2, 3, 52017.00, '2025-04-23 13:03:34', '2025-04-23 13:03:34'),
(6, 3, 1, 1, 80388.00, '2025-04-23 13:03:34', '2025-04-23 13:03:34'),
(7, 4, 2, 3, 52017.00, '2025-04-23 13:04:54', '2025-04-23 13:04:54'),
(8, 4, 1, 1, 80388.00, '2025-04-23 13:04:54', '2025-04-23 13:04:54'),
(9, 5, 2, 3, 52017.00, '2025-04-23 13:04:56', '2025-04-23 13:04:56'),
(10, 5, 1, 1, 80388.00, '2025-04-23 13:04:56', '2025-04-23 13:04:56'),
(11, 6, 2, 3, 52017.00, '2025-04-23 13:05:55', '2025-04-23 13:05:55'),
(12, 6, 1, 1, 80388.00, '2025-04-23 13:05:55', '2025-04-23 13:05:55'),
(13, 7, 2, 3, 52017.00, '2025-04-23 13:06:19', '2025-04-23 13:06:19'),
(14, 7, 1, 1, 80388.00, '2025-04-23 13:06:19', '2025-04-23 13:06:19'),
(15, 8, 2, 3, 52017.00, '2025-04-23 13:07:09', '2025-04-23 13:07:09'),
(16, 8, 1, 1, 80388.00, '2025-04-23 13:07:09', '2025-04-23 13:07:09'),
(17, 9, 2, 1, 52017.00, '2025-04-23 13:08:10', '2025-04-23 13:08:10'),
(18, 10, 2, 5, 52017.00, '2025-04-23 13:08:32', '2025-04-23 13:08:32');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Admin', 1, 'admin-token', '2141a5c4b072c58097b0bf3fbd21171f3cfa8ca6407910375f038946cda02aaf', '[\"*\"]', NULL, NULL, '2025-04-23 00:52:01', '2025-04-23 00:52:01'),
(2, 'App\\Models\\Admin', 1, 'admin-token', 'ee94f43fc7b1c21ee67bc0aa82f94786bf8156cb6d7e5dfd5678e029f4f26c5b', '[\"*\"]', NULL, NULL, '2025-04-23 00:52:11', '2025-04-23 00:52:11'),
(3, 'App\\Models\\Admin', 1, 'admin-token', 'f746fce5678ff4a67cf7ed87958225afac170580dd4fb1b41ac8769ebd940c2c', '[\"*\"]', NULL, NULL, '2025-04-23 00:54:33', '2025-04-23 00:54:33'),
(4, 'App\\Models\\Admin', 1, 'admin-token', 'd8e2b48d6f7333b44accb2ee7d044bbda2ac75c936c31a8137eeba6c081c2fbf', '[\"*\"]', NULL, NULL, '2025-04-23 00:54:47', '2025-04-23 00:54:47'),
(5, 'App\\Models\\Admin', 1, 'admin-token', '8310bbce3b99dea9020a5c6e85de4aad5a2f4876c12e168a0fc2e3e1711b9e8b', '[\"*\"]', NULL, NULL, '2025-04-23 00:55:44', '2025-04-23 00:55:44'),
(6, 'App\\Models\\Admin', 1, 'admin-token', 'e2822ae9376edb856b085aea7f7a21437dcdd4f3fc32e85d0f26175db1ed97dd', '[\"*\"]', '2025-04-23 01:50:10', NULL, '2025-04-23 00:55:54', '2025-04-23 01:50:10'),
(7, 'App\\Models\\Admin', 1, 'admin-token', '6d96375ae9eb055e60f7721e03fdd4deeb056b9a9a6d997732777c2badb9d0a1', '[\"*\"]', NULL, NULL, '2025-04-23 02:02:33', '2025-04-23 02:02:33'),
(8, 'App\\Models\\Admin', 1, 'admin-token', '934c1a7c932abc9a96a7dd41b09c0e7d3b59e98bb00ced72f6cb25fa5527faa3', '[\"*\"]', NULL, NULL, '2025-04-23 02:02:44', '2025-04-23 02:02:44'),
(10, 'App\\Models\\Admin', 1, 'admin-token', '96c072d3b34390a81216709b48ee9fd653dfe93a5fa51d39eea211f76a19f79b', '[\"*\"]', '2025-04-23 08:23:18', NULL, '2025-04-23 04:30:19', '2025-04-23 08:23:18'),
(11, 'App\\Models\\User', 2, 'auth_token', 'dc6474cb06de357d3cf8516d144256c78793e8f037fd2ac8e0c3deeebdaa28df', '[\"*\"]', NULL, NULL, '2025-04-23 07:36:30', '2025-04-23 07:36:30'),
(12, 'App\\Models\\User', 2, 'auth_token', '2a3b98f2df1600378fd02d51ec0ab0155958c2cc07f2aef078fe3d8db108d80a', '[\"*\"]', NULL, NULL, '2025-04-23 07:36:39', '2025-04-23 07:36:39'),
(13, 'App\\Models\\User', 2, 'auth_token', '6bf849df85e9161147035f6366da62c92949fabb36d4c5b15781d8902855678a', '[\"*\"]', '2025-04-23 08:24:59', NULL, '2025-04-23 08:23:38', '2025-04-23 08:24:59'),
(15, 'App\\Models\\User', 2, 'auth_token', '3b30b11cdbad46ee1361c1a897c3c05b45b5ca73f492a34be1365b1255689de4', '[\"*\"]', NULL, NULL, '2025-04-23 08:29:08', '2025-04-23 08:29:08'),
(16, 'App\\Models\\User', 2, 'auth_token', '3884115e263950e6e710835b3aeb6193c145ac3a8c13a005ce3b4f19e2744723', '[\"*\"]', NULL, NULL, '2025-04-23 08:35:54', '2025-04-23 08:35:54'),
(17, 'App\\Models\\User', 2, 'auth_token', '268733d68a1e6f1b5d85650c0f40b0fa89cf7ad73d3ecce521f7731ddec84345', '[\"*\"]', NULL, NULL, '2025-04-23 08:36:25', '2025-04-23 08:36:25'),
(18, 'App\\Models\\User', 2, 'auth_token', '98692d353a04d78dbe882b72ea95f25e76492f30c9c39186c909f1a7bd11e11a', '[\"*\"]', NULL, NULL, '2025-04-23 08:36:48', '2025-04-23 08:36:48'),
(19, 'App\\Models\\User', 2, 'auth_token', '5e94fe6a016f9090d37cfe62d34eae5a878bd073544d89e79952f970fcc4f97f', '[\"*\"]', '2025-04-23 08:37:13', NULL, '2025-04-23 08:37:11', '2025-04-23 08:37:13'),
(20, 'App\\Models\\User', 2, 'auth_token', '72bbef68d5ef1bf63673cee4f5d2ab135b3c8352386bea13cb53f480a4e304a1', '[\"*\"]', '2025-04-23 08:38:11', NULL, '2025-04-23 08:38:07', '2025-04-23 08:38:11'),
(21, 'App\\Models\\User', 2, 'auth_token', 'f7cc0e5f12773ee2d7c71881cc078e98be18bf2933c0904ea3b536416746c88f', '[\"*\"]', '2025-04-23 08:38:38', NULL, '2025-04-23 08:38:35', '2025-04-23 08:38:38'),
(22, 'App\\Models\\User', 2, 'auth_token', '3b24234fc83babffd068e09b5eb8124922af353c54158b804f6b837f767f6913', '[\"*\"]', '2025-04-23 13:13:01', NULL, '2025-04-23 08:41:38', '2025-04-23 13:13:01'),
(23, 'App\\Models\\Admin', 1, 'admin-token', '4fcb210d600cda1369e35609180e1bf8c3ddb4d95be1efe7ca541105887d4300', '[\"*\"]', '2025-04-23 12:22:23', NULL, '2025-04-23 08:47:11', '2025-04-23 12:22:23'),
(25, 'App\\Models\\Admin', 1, 'admin-token', '804e8840d10cfd16bd83e70d1d6952640b8384bc16cd51be0d50c48d47a6fd5a', '[\"*\"]', '2025-04-23 13:00:56', NULL, '2025-04-23 12:28:13', '2025-04-23 13:00:56'),
(26, 'App\\Models\\User', 2, 'auth_token', '335a8da016d2c7ed2212b4ff341d01d59835e83a69806c6bf816b56c09d272d6', '[\"*\"]', '2025-04-23 14:24:40', NULL, '2025-04-23 13:13:21', '2025-04-23 14:24:40');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `mileage` int(11) DEFAULT NULL,
  `fuel_type` varchar(255) DEFAULT NULL,
  `transmission` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `engine_size` varchar(255) DEFAULT NULL,
  `doors` int(11) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`features`)),
  `vin` varchar(255) DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `image`, `category_id`, `created_at`, `updated_at`, `make`, `model`, `year`, `mileage`, `fuel_type`, `transmission`, `color`, `engine_size`, `doors`, `seats`, `features`, `vin`, `condition`) VALUES
(1, 'Toyota 3 Series', 'Velit vitae cum iure adipisci. Repudiandae eligendi hic dolores voluptatem tempore expedita et vero. Commodi adipisci eligendi impedit cumque. Consequatur id quia autem qui ducimus.', 80388.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 5, '2025-04-23 06:41:53', '2025-04-23 06:54:51', 'Audi', 'C-Class', 2019, 80030, 'Diesel', 'Manual', 'OldLace', '1.8L', 2, 3, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'UYT4BTIXO55OZ1NH3', 'Certified Pre-Owned'),
(2, 'Toyota F-150', 'Amet qui sunt animi libero esse. Aliquam aperiam natus sunt. Et ipsam et voluptatem fugit est.', 52017.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 12, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Honda', 'A4', 2017, 85768, 'Petrol', 'Automatic', 'DarkKhaki', '2.2L', 3, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'TTSX36Y5A2C3XNKZ4', 'New'),
(3, 'Ford C-Class', 'Ipsa sint perspiciatis et quia et unde ea. Deleniti itaque harum voluptatem voluptatem consequuntur. Culpa minus quae quos consequuntur.', 28327.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 20, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', '3 Series', 2020, 13085, 'Electric', 'CVT', 'DarkGoldenRod', '2L', 3, 4, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'MZXB5W2QAID0H3X4U', 'New'),
(4, 'Audi A4', 'Similique at aut qui fuga quia. Dicta dolor qui rem id autem ea. Consequuntur et tenetur sit vitae.', 80506.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 4, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Ford', 'Accord', 2010, 70167, 'Electric', 'CVT', 'Pink', '3.1L', 3, 7, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'EAIEQTLJOBBREP0YU', 'Used'),
(5, 'Audi Accord', 'Est est quod adipisci id. Eos quidem iure laboriosam doloremque sint aut. Nesciunt aperiam quos eligendi deleniti molestias architecto cupiditate. Aut velit possimus iste eius.', 47222.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 5, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'A4', 2016, 21294, 'Electric', 'Manual', 'LightGray', '1.9L', 3, 2, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'XYJ9Z1CELYH8TY57O', 'Certified Pre-Owned'),
(6, 'Tesla C-Class', 'Temporibus tenetur quod occaecati quia culpa sed laboriosam. Ex laudantium sit iusto exercitationem saepe a.', 16165.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 20, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', 'Model 3', 2014, 39987, 'Diesel', 'CVT', 'SpringGreen', '5.4L', 2, 4, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '3OCGNFH2D6XQ3B1DV', 'Certified Pre-Owned'),
(7, 'Audi C-Class', 'Perspiciatis consequuntur sit distinctio eum aut. Molestiae sequi similique neque aperiam qui asperiores facere. Ea sunt in quasi natus est harum qui. Ab recusandae asperiores distinctio provident.', 10215.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 20, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Honda', 'Model 3', 2013, 55707, 'Electric', 'CVT', 'Teal', '4.2L', 4, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'GP4MOUQPGRJOS8X4W', 'Certified Pre-Owned'),
(8, 'BMW 3 Series', 'Suscipit unde ut animi expedita doloribus sint voluptatum. Enim incidunt consequatur qui qui ducimus. Libero rerum quibusdam similique sint debitis non.', 83122.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 16, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'Accord', 2011, 50037, 'Diesel', 'CVT', 'DarkViolet', '4L', 5, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '8K68IL5OBRRMOLCQT', 'Used'),
(9, 'Honda Camry', 'Repudiandae unde explicabo ut ipsam temporibus aspernatur et. Nobis voluptas in culpa earum sit quo sed. Ducimus repellendus fugit ipsam rerum quas sit. Ut ut quis eos voluptatum.', 86880.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 11, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', '3 Series', 2022, 61119, 'Diesel', 'CVT', 'Turquoise', '4.9L', 2, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'GLJMD0WSHOEVEFIG6', 'Certified Pre-Owned'),
(10, 'Tesla Model 3', 'Et suscipit et voluptatem consequuntur molestiae at eaque. Molestias ipsam adipisci voluptatem. Harum in porro et ipsum ut ut quia et.', 22196.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 20, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', 'Accord', 2019, 73842, 'Petrol', 'Automatic', 'DarkOrchid', '4.1L', 4, 3, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'LLC4Q2DS48DF7S1DT', 'Certified Pre-Owned'),
(11, 'Audi Accord', 'Ea ut est nihil atque est et. Quos amet inventore fuga natus non. Nihil recusandae nostrum libero provident possimus labore officiis.', 54994.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 10, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'C-Class', 2020, 6075, 'Diesel', 'CVT', 'ForestGreen', '5.4L', 3, 4, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'PBMKTWS2MP73KVCKA', 'Certified Pre-Owned'),
(12, 'Tesla Accord', 'Voluptas ut voluptate et fuga qui reiciendis. Reprehenderit possimus neque blanditiis numquam. Voluptatem et aut facilis vitae occaecati veritatis.', 48480.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 5, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'BMW', 'Camry', 2023, 64357, 'Petrol', 'Automatic', 'Orchid', '5.2L', 4, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'G1IIU48XVLUNT6SVQ', 'Used'),
(13, 'Audi F-150', 'Sit aperiam soluta quo et qui autem. Eius tenetur quibusdam modi qui. Tenetur voluptatum iusto vero suscipit ea ipsa. Amet et minus velit dolores.', 49207.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 21, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Ford', 'Camry', 2017, 16033, 'Diesel', 'Automatic', 'Snow', '4.3L', 5, 5, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'TFW14VABK3H16QDUK', 'Certified Pre-Owned'),
(14, 'Toyota F-150', 'Explicabo repudiandae voluptatum omnis est expedita. Exercitationem nobis sint voluptate id. Atque et magni autem modi ex consequatur repudiandae.', 18898.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 15, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'Model 3', 2015, 81917, 'Hybrid', 'CVT', 'DarkGreen', '4.1L', 2, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '31W152KYI7JCZNSPC', 'Certified Pre-Owned'),
(15, 'Ford F-150', 'Ratione rerum tenetur non. Ea iure vitae sed pariatur laudantium. Soluta in cumque asperiores quas non voluptatem. Aut cumque et maiores occaecati veritatis molestiae quia.', 14831.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 9, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', 'A4', 2019, 28076, 'Electric', 'CVT', 'MidnightBlue', '3.4L', 5, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '2SOU8N74ZXCCFP4OB', 'Used'),
(16, 'Tesla F-150', 'Omnis dolorem rerum exercitationem omnis quia. Dolore eligendi cupiditate quibusdam quis. Voluptates amet et perferendis consequatur.', 80152.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 13, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', 'A4', 2016, 87851, 'Electric', 'Manual', 'MediumTurquoise', '1.6L', 3, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '1M8YC4O7KVAFRF85P', 'New'),
(17, 'Audi A4', 'Nesciunt nihil est nihil. Quae vel aliquid adipisci aut. Consectetur consequatur impedit voluptas quia aut. Aut eligendi laborum saepe est est placeat expedita facilis.', 83164.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 17, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Ford', 'C-Class', 2014, 80447, 'Petrol', 'CVT', 'Orchid', '4L', 5, 2, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '5NM4NPIRXIEA91CWA', 'New'),
(18, 'Honda C-Class', 'Dolor aut qui sunt voluptatem dolores quo aperiam praesentium. Ex optio quae beatae ad mollitia ipsum. Et autem ab amet voluptate. Qui et et repellat corrupti et.', 63878.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 4, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Mercedes', 'A4', 2022, 56860, 'Electric', 'CVT', 'MediumSlateBlue', '3.5L', 5, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '6RRKMOHMU5M92LVXE', 'New'),
(19, 'Toyota 3 Series', 'Dolores voluptatem autem sit eum illum beatae. Quo cupiditate aperiam omnis dolores non quos minus. Placeat veritatis id distinctio commodi quaerat nostrum exercitationem.', 11243.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 6, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'Camry', 2013, 85161, 'Hybrid', 'Manual', 'LightCoral', '3L', 2, 3, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'G6T12QE9J8XZGAJL4', 'Certified Pre-Owned'),
(20, 'Toyota F-150', 'Exercitationem velit voluptas labore iusto sequi beatae dolorum et. Quo fugit officia eveniet ex. Consectetur repellendus unde sit repellat. Et quasi qui fuga et.', 96405.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 6, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'BMW', 'Model 3', 2019, 91442, 'Diesel', 'CVT', 'LightGoldenRodYellow', '5.7L', 2, 4, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '40U0X4Q9NV1DE2ZE0', 'Certified Pre-Owned'),
(21, 'Audi F-150', 'Aut odio est enim aliquam. Iste dicta voluptate dolor natus sapiente est enim. Temporibus laboriosam ipsam ut atque quis officia. Inventore dolorem sed maiores quidem.', 90827.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 18, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'BMW', 'F-150', 2010, 72743, 'Electric', 'Manual', 'SlateGray', '1.8L', 5, 2, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'KVU6RWVNORUFOJHLP', 'New'),
(22, 'Toyota Model 3', 'Autem et soluta vel labore. Excepturi quaerat corporis minus.', 80605.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 16, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Honda', 'Model 3', 2016, 62249, 'Electric', 'CVT', 'DarkGray', '2.4L', 5, 5, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '99K96CNOWTD304SY1', 'New'),
(23, 'BMW C-Class', 'Qui ut vel in. Vel dolores dolore qui ex doloremque ipsa. Placeat iusto quo pariatur. Sunt ut ducimus repellendus harum sit quaerat praesentium.', 65281.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 4, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Mercedes', 'Camry', 2018, 44337, 'Diesel', 'CVT', 'MediumTurquoise', '5.1L', 5, 4, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'TG6DJ9BMKT90QIYWC', 'Certified Pre-Owned'),
(24, 'BMW Accord', 'Magni facere quas dolor repellat ut earum quisquam. Ullam labore id commodi et repellat. Optio in dolores perspiciatis quos.', 51018.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 15, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Ford', 'F-150', 2011, 90252, 'Diesel', 'CVT', 'Orange', '3.2L', 2, 3, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '9CFGBZXW2TEV9ZM79', 'Used'),
(25, 'Toyota F-150', 'Praesentium et est molestiae ut optio assumenda quo. Dolor est iste est vitae. Est ullam quis et exercitationem et enim. Quo voluptatem eos velit fugit enim.', 92317.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 18, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', 'A4', 2015, 22091, 'Electric', 'CVT', 'LightGreen', '3L', 4, 5, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'XDV42HAJQCVGDAH79', 'Used'),
(26, 'Tesla Model 3', 'Ad dicta ipsum quae. Omnis debitis velit quae ea. Debitis blanditiis nulla sit nobis eius omnis iusto.', 75528.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 8, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', '3 Series', 2014, 55235, 'Petrol', 'CVT', 'MintCream', '2.9L', 2, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '1IYMGMV3R5RAWGRRX', 'Used'),
(27, 'BMW 3 Series', 'Eligendi odio ad nostrum accusamus sed asperiores aut. Porro et et voluptatem aut voluptate expedita veritatis sint. Rerum omnis non laborum illum aut. Repellendus libero quam velit et animi iste.', 16216.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 9, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', 'Model 3', 2010, 55216, 'Electric', 'CVT', 'Beige', '3L', 2, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'WCKDUE32V9LHWN0TE', 'Certified Pre-Owned'),
(28, 'Toyota C-Class', 'Aut similique porro ex modi. Repellat ad quisquam nemo. Delectus quia itaque earum aut cum.', 31631.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 20, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', '3 Series', 2016, 70322, 'Petrol', 'CVT', 'Gold', '5.9L', 3, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'CKPXGTYLRTXLDK8ON', 'New'),
(29, 'Audi A4', 'Laudantium id voluptas quia nesciunt eligendi voluptatum aut. Accusamus iure ea harum ab aspernatur. Quasi et similique exercitationem ea iusto deserunt sed.', 90507.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 5, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Ford', 'F-150', 2022, 51106, 'Electric', 'CVT', 'Aquamarine', '2.4L', 4, 4, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '14NICRZX99EBFKUCH', 'Certified Pre-Owned'),
(30, 'BMW A4', 'Accusamus veniam vel quia eligendi vel et adipisci. Et ut recusandae velit officia quas atque quas beatae. Rem odio ratione nesciunt tempora quo. Aut beatae qui natus nesciunt nesciunt consequatur.', 86522.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 12, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'A4', 2011, 8871, 'Hybrid', 'CVT', 'MediumSpringGreen', '2.1L', 5, 2, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'ROPNSN3OPGDVYXA4B', 'New'),
(31, 'Honda Camry', 'Necessitatibus totam velit at repudiandae. Minus beatae consequuntur ut quasi corporis ut.', 86867.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 17, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'Accord', 2012, 88089, 'Diesel', 'Automatic', 'Yellow', '2.9L', 5, 4, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'V8V0I7TP55BI10Y1X', 'Certified Pre-Owned'),
(32, 'BMW F-150', 'Explicabo incidunt possimus voluptas eos asperiores in laborum eaque. Rerum consequatur aut ex sunt. Sint maiores qui qui doloribus. Et laborum ut aperiam sunt unde earum praesentium ab.', 16242.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 8, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', 'Camry', 2022, 8992, 'Petrol', 'Manual', 'Fuchsia', '2.8L', 4, 2, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'A16LPELZ7XFLVYCTE', 'Used'),
(33, 'Honda 3 Series', 'Et ut quae dolorem ut in. Sapiente perspiciatis harum magnam illo et. Enim quas tenetur ut aut voluptas. Enim enim expedita placeat in consectetur enim qui.', 56749.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 6, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', 'Camry', 2021, 68718, 'Diesel', 'Automatic', 'Beige', '3.2L', 5, 4, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'WCWBD941Z9IX5I76P', 'Certified Pre-Owned'),
(34, 'Honda 3 Series', 'Et quae nulla voluptatem. Soluta non aliquam voluptatem deleniti minus ipsum qui. Alias corporis eum iusto sunt culpa.', 54922.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 10, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'Camry', 2010, 79636, 'Hybrid', 'CVT', 'Darkorange', '2.7L', 3, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '1QFKRZYJGG9JZ6AAH', 'Used'),
(35, 'Audi F-150', 'Dolorem quia quia voluptatem ipsam iure adipisci repellat. Placeat aut laudantium at sequi assumenda exercitationem officia. Reiciendis ut numquam magnam. Eius quasi deleniti aut eaque qui rerum non.', 12150.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 13, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'BMW', 'Accord', 2012, 75024, 'Electric', 'Manual', 'Tan', '5L', 4, 4, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'O424XGR75JWILG7JT', 'Certified Pre-Owned'),
(36, 'Honda F-150', 'Dolorum sit natus amet vel voluptatum maxime. Reprehenderit et nam culpa recusandae autem illum quia. Quis repellendus mollitia ad est velit qui praesentium ex.', 61465.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 10, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Ford', 'Accord', 2017, 53510, 'Petrol', 'CVT', 'OrangeRed', '3.3L', 4, 2, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'FXPRS5WIZK147FYJV', 'Used'),
(37, 'BMW A4', 'Incidunt et ut amet nostrum assumenda culpa. Nihil harum dolores id est. Hic provident officiis et enim a ut. Est sint officia qui similique.', 32265.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 12, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', '3 Series', 2019, 16226, 'Hybrid', 'Manual', 'DarkGray', '3.2L', 4, 4, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'AXDZPXEJXU1ZOI320', 'New'),
(38, 'Toyota Model 3', 'Quod quo ea ea. Est in qui quia earum cum quasi totam ducimus. Quo doloribus enim aut ipsam fugiat. Molestiae optio quia fugiat necessitatibus sed. Quae laudantium ut veniam et qui.', 36882.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 6, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'BMW', 'Model 3', 2017, 17510, 'Petrol', 'Manual', 'LightSkyBlue', '2.3L', 5, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '9AJMINATY5TC14VC3', 'Used'),
(39, 'Audi Accord', 'Asperiores maiores nam veniam qui commodi iste. Aliquam repellendus ex necessitatibus et iste repudiandae est. Consequatur ducimus voluptatibus qui velit beatae.', 33419.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 18, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'F-150', 2019, 64809, 'Electric', 'CVT', 'Turquoise', '4.8L', 2, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'AGVP7Z8KWEYSJV95Z', 'Certified Pre-Owned'),
(40, 'Ford Camry', 'Alias commodi autem rerum et quia aperiam sit amet. Distinctio quis dicta non quisquam eius quia. Rerum voluptas qui dolorem doloribus eum saepe quibusdam natus.', 53686.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 21, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'F-150', 2018, 98293, 'Hybrid', 'Manual', 'PaleVioletRed', '2L', 5, 3, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'R8E94DAQOGHQW6U83', 'Used'),
(41, 'Audi Camry', 'At at qui libero tenetur molestiae ab. Aut illo et labore sequi quo eligendi. Sint et in cupiditate sunt illo optio aut accusamus.', 32917.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 13, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', 'Accord', 2020, 70636, 'Electric', 'CVT', 'Orchid', '3.6L', 5, 7, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '8VBAFBFW5LLLNFUGX', 'Certified Pre-Owned'),
(42, 'Toyota Accord', 'Minima eveniet voluptas praesentium voluptate. Sed voluptas autem accusamus. Vitae hic quidem aut vitae eveniet corrupti. Ut id voluptate ipsa corrupti.', 27004.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 13, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'Model 3', 2016, 20063, 'Electric', 'CVT', 'LemonChiffon', '3.7L', 3, 7, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '7N64IZ1P7IVA6N91B', 'New'),
(43, 'BMW C-Class', 'Nam asperiores quibusdam fugiat sed eos. Voluptatem illum ea aperiam minus. Explicabo ipsum sapiente blanditiis exercitationem perspiciatis. Hic qui aut quam.', 78558.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 6, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'BMW', 'F-150', 2019, 49785, 'Electric', 'Automatic', 'DeepPink', '3.2L', 4, 2, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'NU1SHMXGYRRO01URA', 'Certified Pre-Owned'),
(44, 'Honda A4', 'Ducimus eum quia distinctio nulla qui et maiores. Maxime dicta neque beatae inventore. Voluptas quo qui reiciendis nihil sunt eos eos. Doloribus sint modi corrupti qui quibusdam.', 97282.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 14, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Honda', 'A4', 2020, 81046, 'Hybrid', 'Manual', 'PeachPuff', '2.1L', 2, 5, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'S1GBD364TIRG4WD09', 'New'),
(45, 'Audi 3 Series', 'Omnis dolor voluptas explicabo non vel aliquid. Aut labore sunt magni eaque error labore. Cumque ad consequatur a iusto eos. Dignissimos omnis asperiores aut ut quod similique molestias.', 57612.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 6, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', 'Model 3', 2019, 28060, 'Diesel', 'CVT', 'Pink', '5.6L', 5, 2, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'AAYSGCN5KSOOCQWBG', 'Certified Pre-Owned'),
(46, 'Mercedes Camry', 'Qui labore qui quod ut. Libero quisquam culpa voluptas qui quisquam. Id ipsum doloribus asperiores porro voluptates mollitia beatae sunt. Autem sed dolore dolore consequatur ut dolores ut quaerat.', 24227.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 5, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', '3 Series', 2023, 36518, 'Electric', 'CVT', 'PaleTurquoise', '4.4L', 3, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'AVSC9JWQRQO4JLEFF', 'Used'),
(47, 'Ford Camry', 'Velit impedit sint quo quibusdam reprehenderit iure aut et. Dolores sint quos asperiores accusamus voluptatem pariatur deserunt. Est et amet incidunt est.', 47616.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 23, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'Camry', 2010, 99488, 'Hybrid', 'Automatic', 'LightGreen', '2.9L', 5, 7, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'G3GY032T2IW705IUR', 'Used'),
(48, 'Audi Camry', 'Esse nam ea non et sed. Et quibusdam deserunt tempora voluptas ab in. Maxime autem perspiciatis eaque tenetur.', 69695.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 15, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', 'C-Class', 2017, 74847, 'Electric', 'Manual', 'ForestGreen', '6L', 5, 5, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'ZI69VA2OZ6F70LTZZ', 'New'),
(49, 'Toyota A4', 'Tempora perspiciatis repellendus ab impedit quo. Rerum quas dolorem aliquam totam voluptatem. Voluptatem iste dolorem animi corrupti. Quasi aliquid illo earum voluptatem.', 38853.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 23, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Honda', 'F-150', 2019, 15326, 'Hybrid', 'Manual', 'SlateGray', '2L', 3, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'Y6S77YY4T6KR5KGRW', 'New'),
(50, 'Audi Model 3', 'Velit eaque delectus id omnis. Eum voluptatem et omnis maxime consequatur corrupti dolore. Et eaque cum blanditiis dolores nobis quis explicabo.', 88046.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 14, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'A4', 2023, 46580, 'Diesel', 'Automatic', 'Indigo', '3L', 2, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'I9TEYS2CYAFJM2S0D', 'Certified Pre-Owned'),
(51, 'Tesla Camry', 'Reprehenderit molestiae corporis inventore quidem aut amet. Nihil illum cumque distinctio asperiores ad.', 67362.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 14, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Mercedes', 'Accord', 2019, 53823, 'Hybrid', 'Automatic', 'Green', '1.6L', 4, 2, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'I6D40XH4CH5NY4G9P', 'New'),
(52, 'BMW Camry', 'Consequatur dolorem dolorem atque nisi. Explicabo occaecati quisquam rerum maxime quo vitae. Natus non mollitia quaerat consequatur est rerum.', 19508.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 4, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', '3 Series', 2021, 7704, 'Hybrid', 'CVT', 'SteelBlue', '3.7L', 3, 4, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'GSOIXHEBVJXLMEIIT', 'New'),
(53, 'Tesla Accord', 'Inventore provident et ex amet dolor. Facere eius quia eius harum. Perferendis nobis perspiciatis fuga consectetur. Et iure earum inventore sed necessitatibus deleniti ut.', 78637.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 17, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'Model 3', 2013, 39446, 'Electric', 'Manual', 'MediumAquaMarine', '4.4L', 4, 5, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'WONJZ9KMV33J48VFI', 'Certified Pre-Owned'),
(54, 'Audi Model 3', 'Labore corporis modi sapiente rerum excepturi. Eos neque voluptatibus molestiae reprehenderit culpa cum. Laudantium aut maiores ut similique. Aut dignissimos repellendus facere earum.', 28975.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 11, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Mercedes', 'Model 3', 2011, 84754, 'Hybrid', 'Manual', 'OliveDrab', '4.1L', 3, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'D7KUCZJRFZHRS8KD7', 'Certified Pre-Owned'),
(55, 'Toyota 3 Series', 'Incidunt voluptate reprehenderit illum ab et. Et tenetur adipisci et nostrum quia. Sit quo nostrum quidem in. Quia at odit minus enim.', 85292.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 4, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Ford', '3 Series', 2018, 75645, 'Diesel', 'Automatic', 'Sienna', '5.4L', 4, 7, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'X8Q3S4H3CB3IM59BE', 'Certified Pre-Owned'),
(56, 'Toyota C-Class', 'Quos quia repellendus et quidem accusantium. Numquam laudantium omnis eius. Placeat quis sit fugiat praesentium et voluptatem a quo.', 45954.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 4, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'BMW', 'Camry', 2015, 59114, 'Petrol', 'CVT', 'Black', '3.5L', 5, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'PZ11Q6FSALRQ691D7', 'New'),
(57, 'Ford F-150', 'Et est quibusdam nihil quaerat voluptatibus sit quaerat. Voluptates error adipisci sint maxime iusto sapiente. Atque totam omnis porro ut dolores inventore blanditiis.', 87426.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 13, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', 'A4', 2020, 51453, 'Diesel', 'CVT', 'DarkGreen', '5L', 2, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'RMWNQE85UTHYIJRHL', 'Certified Pre-Owned'),
(58, 'Mercedes C-Class', 'Velit omnis omnis placeat facilis voluptas placeat mollitia. Distinctio sed accusamus facilis recusandae.', 98163.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 17, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', 'Accord', 2020, 57514, 'Petrol', 'CVT', 'DarkSeaGreen', '2.6L', 3, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'T7DFJBA5CX9ANFSIJ', 'Certified Pre-Owned'),
(59, 'Honda Camry', 'Adipisci temporibus ut id aut officiis. Suscipit enim odit minus omnis facilis consequuntur. Vel inventore deleniti magni unde est ut.', 76350.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 15, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', 'Model 3', 2016, 79575, 'Electric', 'Automatic', 'WhiteSmoke', '3.1L', 2, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'N2E21Y2TEMXY46W2K', 'Certified Pre-Owned'),
(60, 'Ford Accord', 'Deserunt sequi qui voluptate quod rem. Quia dolorum voluptas iste rerum. Dolores sint dolor deserunt pariatur voluptate quisquam optio ex. Est alias odit consequuntur similique nam quia doloribus.', 46191.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 15, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Honda', 'Camry', 2019, 94908, 'Petrol', 'CVT', 'Brown', '1.3L', 4, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'LCGDBMZL4F3B5ITRH', 'New'),
(61, 'Ford Model 3', 'Assumenda eius rerum recusandae sit officia nisi quam. Perspiciatis tenetur libero et accusantium.', 80099.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 12, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', 'Accord', 2023, 14454, 'Diesel', 'Manual', 'HotPink', '3.3L', 5, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '809GY1QWBUYPJ2VWK', 'Used'),
(62, 'Mercedes Model 3', 'Consectetur quaerat laboriosam sit sunt. Qui omnis est sint. Et quia iste dolore corporis veritatis est.', 49295.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 19, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', 'A4', 2022, 24737, 'Electric', 'Automatic', 'DimGrey', '1L', 3, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '1C64QA9G2ZEQ0J7R1', 'Used'),
(63, 'Toyota C-Class', 'Asperiores fugiat nemo vel harum amet quibusdam. Accusantium dolor cumque ipsam nihil perferendis illum. Ea quis enim reprehenderit ducimus molestiae sed harum.', 45953.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 18, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', 'A4', 2010, 75031, 'Hybrid', 'CVT', 'CornflowerBlue', '4.2L', 2, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'FUC3LW43HVH6U5JDV', 'Certified Pre-Owned'),
(64, 'BMW A4', 'Porro laborum qui ut unde eos neque ut. Corporis sint et sit qui similique eveniet voluptatem. Id ducimus hic culpa voluptas sed quas. Optio consequatur nemo molestiae saepe nihil dolore.', 32498.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 5, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Ford', 'A4', 2023, 84302, 'Hybrid', 'CVT', 'Orange', '4.3L', 5, 2, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'ETNP5IP1Y7SAUN0XI', 'Used'),
(65, 'Toyota F-150', 'Et at et tempore laudantium sint velit. Sit temporibus quisquam ut ducimus eligendi rerum sunt. Quae ullam incidunt aut impedit. Et sed omnis et illo dolorem nobis nihil odit.', 63067.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 18, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', 'A4', 2023, 87087, 'Diesel', 'CVT', 'OldLace', '1.5L', 5, 5, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'CL2J645TB97JY03ZF', 'Used'),
(66, 'Ford Accord', 'Minus sapiente quam et cum consequuntur aperiam quis. Voluptates labore harum consequatur sed sapiente. Occaecati debitis eaque vitae aut cumque qui adipisci.', 13653.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 20, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'BMW', '3 Series', 2012, 5175, 'Petrol', 'CVT', 'Blue', '1.6L', 5, 7, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'URDNJW1UUGXPSGW3L', 'Certified Pre-Owned'),
(67, 'BMW Camry', 'Ea et ut harum aut molestias unde voluptas. Exercitationem et illo accusamus et ipsum voluptate eum. Necessitatibus qui aliquam ad blanditiis. Et ut quia distinctio saepe aliquid consectetur sunt.', 92228.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 12, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', 'A4', 2023, 17554, 'Electric', 'CVT', 'Indigo', '1.4L', 4, 3, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'JJMVDNRRI3JOJUPWR', 'Used'),
(68, 'Honda A4', 'Praesentium sit quo et laudantium. Harum inventore minima repellat debitis sint. Aut minima commodi sed dicta magni dolorem.', 60366.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 10, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', 'A4', 2012, 72813, 'Diesel', 'Manual', 'MidnightBlue', '4.1L', 4, 3, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'RSSSS9CD2VNEOO3PY', 'Used'),
(69, 'Mercedes C-Class', 'Dolore nesciunt quo ipsa cupiditate minus aut molestiae enim. Minima maiores fuga quia non officia quos corporis. Deleniti sunt minima impedit sed officiis.', 85612.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 10, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Mercedes', 'Model 3', 2018, 99997, 'Diesel', 'CVT', 'DarkGray', '2L', 2, 3, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '1IZQYAN3G8SIBKJV8', 'New'),
(70, 'Toyota Model 3', 'Beatae voluptates et et. Nemo blanditiis nihil et quia nihil. Qui neque aut ut incidunt vero. Praesentium cumque eum atque voluptas.', 37220.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 5, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'BMW', 'F-150', 2017, 99421, 'Hybrid', 'CVT', 'SlateBlue', '3.4L', 2, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '82L7EBZ26IT3KQ8BH', 'New'),
(71, 'BMW F-150', 'Et perspiciatis expedita hic repellat sed. Aut voluptas officiis quo voluptatum modi consectetur voluptatem. Ex ut veniam vel maxime et ut voluptatum.', 36821.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 23, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Mercedes', 'Model 3', 2012, 43822, 'Diesel', 'CVT', 'SandyBrown', '2L', 4, 4, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'UA8DZ05FDU27LGGKV', 'Certified Pre-Owned'),
(72, 'BMW C-Class', 'Quam alias id qui molestiae. Voluptas ea voluptatem magnam quis non qui reprehenderit. Id culpa iusto et omnis qui quasi sed.', 15149.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 14, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Honda', 'Model 3', 2015, 58571, 'Hybrid', 'CVT', 'SlateBlue', '1.8L', 5, 7, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '7H0F3I0L8DZHIM6K9', 'Certified Pre-Owned'),
(73, 'Mercedes Camry', 'Consequatur nisi ratione molestias saepe doloribus veniam veritatis minima. Neque cum fuga rerum doloribus eius rerum commodi. Deserunt aut debitis beatae quia sint odio qui.', 63691.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 9, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', '3 Series', 2023, 56465, 'Petrol', 'Automatic', 'Cornsilk', '2.8L', 4, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'MDPRLKS4MRAII5K1E', 'Certified Pre-Owned'),
(74, 'Ford C-Class', 'Rerum vel quis autem perferendis inventore dolor. Qui optio aut odit ut deleniti dicta. Quas sint sapiente laudantium consectetur eum rerum aut. Autem deserunt excepturi dolor non.', 22857.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 23, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'BMW', '3 Series', 2010, 94265, 'Hybrid', 'Manual', 'MediumPurple', '5.1L', 2, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'HP6YTFUOPI4SMY2MV', 'New'),
(75, 'Honda Model 3', 'Ad quis placeat eum. Et dolore consequatur alias esse alias hic veniam. Esse dolores quas et aliquam voluptatum ea.', 55576.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 23, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', 'Accord', 2014, 1975, 'Electric', 'Manual', 'Salmon', '3.2L', 4, 7, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'PHTQLH8OIPLVSEBFU', 'Used'),
(76, 'BMW F-150', 'Laudantium praesentium consequatur omnis ut quis dolores. Deleniti eos praesentium dolorum voluptate. Libero voluptatibus enim quaerat ad quae.', 39094.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 14, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', 'Model 3', 2023, 85754, 'Diesel', 'Manual', 'SandyBrown', '3.1L', 2, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'WD1O86JMXM81Q1DAP', 'Certified Pre-Owned'),
(77, 'Tesla Camry', 'Culpa voluptatem velit consequatur id ut. Magni tenetur voluptatem quo neque aliquid eius. Autem quia illum necessitatibus assumenda. Aut aut vel eaque non officia.', 93021.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 23, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'Model 3', 2022, 24574, 'Hybrid', 'Automatic', 'LightPink', '2.5L', 2, 4, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '2IGAYXLFU8OWC2I6I', 'Certified Pre-Owned'),
(78, 'Ford A4', 'Magnam fugit velit tempora eos dolore qui. Tempora blanditiis et ipsa temporibus ratione error.', 10182.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 5, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Honda', 'Camry', 2016, 35113, 'Hybrid', 'CVT', 'NavajoWhite', '1.3L', 4, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '8DZAGJALVENQQSNG9', 'Certified Pre-Owned'),
(79, 'Ford C-Class', 'Iure ut vel quidem corporis omnis. Qui hic ipsam velit et voluptatem autem.', 83464.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 17, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', 'Accord', 2013, 24569, 'Diesel', 'Automatic', 'DarkOrchid', '5.6L', 3, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '5O0WJJ4L137P6X51G', 'Certified Pre-Owned'),
(80, 'Mercedes Accord', 'Natus dicta hic nihil molestiae. Ut non dicta molestiae accusamus et accusamus ea. Est numquam fuga repellendus.', 72158.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 23, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Mercedes', 'A4', 2013, 89543, 'Petrol', 'CVT', 'LightCyan', '2.1L', 5, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'WZBC82V2JVEJ7AKV6', 'New'),
(81, 'Ford A4', 'Inventore temporibus officia incidunt dolorem architecto aut pariatur. Ducimus quae impedit minus ipsam placeat sapiente. Facilis et ducimus molestiae velit delectus id ab.', 10727.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 7, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Honda', 'Model 3', 2016, 79879, 'Diesel', 'Automatic', 'SlateGray', '4L', 2, 2, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'DTGZ0YTRVCNQZ72EG', 'New'),
(82, 'Honda Camry', 'Molestiae laudantium ullam est enim placeat rerum consequatur. Consequatur eos nesciunt aperiam deserunt. Deserunt voluptate accusamus veritatis voluptatum inventore laborum totam.', 67147.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 6, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', 'A4', 2011, 94878, 'Diesel', 'Manual', 'Ivory', '2.2L', 5, 3, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '92G5FKM3PX0IJSB45', 'Certified Pre-Owned'),
(83, 'Tesla Accord', 'Quaerat placeat voluptates maiores quos. Harum sed aut quos natus et. Fugiat maiores recusandae perspiciatis debitis eos ipsum. Qui fuga autem enim fugiat ut.', 21562.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 17, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Honda', 'A4', 2023, 52368, 'Electric', 'CVT', 'Gainsboro', '4.6L', 2, 2, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '3YA7WEIL7Y323Q52V', 'New'),
(84, 'Tesla Camry', 'Vero animi rem et cupiditate quaerat. Consectetur voluptatum quia neque nobis blanditiis.', 75531.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 12, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', '3 Series', 2017, 40692, 'Electric', 'Automatic', 'Silver', '5.6L', 3, 3, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'QJPCSMAXJY4ZU7WYE', 'Certified Pre-Owned'),
(85, 'Ford Camry', 'Fugit aliquam fuga at cupiditate asperiores adipisci omnis. Accusantium natus qui quibusdam qui libero. Excepturi fugiat quasi aspernatur. Ipsam consectetur accusamus modi ut nam quae.', 51868.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 5, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Honda', '3 Series', 2022, 14931, 'Petrol', 'CVT', 'LightGoldenRodYellow', '2.7L', 2, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '84J17GLPDR067HG1K', 'New'),
(86, 'Audi C-Class', 'Est aperiam at cupiditate labore. Aperiam aut voluptas consequatur aut quia non. Recusandae repudiandae tempore quia placeat dolorem optio.', 53651.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 23, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', 'Camry', 2014, 27244, 'Hybrid', 'Manual', 'Chartreuse', '3.8L', 2, 4, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '78FA6159FVRXTYS88', 'Certified Pre-Owned'),
(87, 'Mercedes A4', 'Eligendi qui id officia quos et cupiditate beatae. Molestias quibusdam maiores repellat fugiat. Velit dolor veniam sint quis animi distinctio necessitatibus. Iste velit suscipit alias molestiae.', 88599.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 17, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', 'Accord', 2012, 2503, 'Petrol', 'Automatic', 'Yellow', '4.1L', 5, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'H0XP26KDXRLT0UD77', 'Certified Pre-Owned'),
(88, 'Honda Model 3', 'Quas eaque unde ipsa consequuntur facere. Iure quasi et assumenda tenetur vero dignissimos atque praesentium. Sint ullam qui sunt ab qui omnis.', 15304.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 17, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Honda', 'C-Class', 2010, 37630, 'Petrol', 'Manual', 'DarkKhaki', '1.2L', 2, 5, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'JRUCDGYFDYMHR3GMK', 'Certified Pre-Owned'),
(89, 'Mercedes A4', 'Non consequuntur quos ea voluptas. Totam cumque quasi iure. Eveniet odio ipsa possimus esse illum libero repellat. Nihil alias alias quo officia maiores fuga sit iure.', 27094.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 8, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'BMW', 'F-150', 2019, 27891, 'Hybrid', 'Manual', 'DeepPink', '5.6L', 2, 3, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'Y4DJ7PZJHJVKRBITK', 'New'),
(90, 'Honda C-Class', 'Rerum perspiciatis dolor illo deleniti dolore tempora et. Ea aspernatur inventore quos repudiandae voluptatem minima occaecati repellat. Nostrum optio at voluptatibus qui qui ut quia.', 37144.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 14, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Ford', '3 Series', 2010, 24476, 'Electric', 'CVT', 'Cyan', '5.6L', 3, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'YDBFOAFGZIB1GAAUZ', 'New'),
(91, 'Ford Accord', 'Fugit et molestias aut delectus molestiae. Placeat placeat consequatur soluta qui et aspernatur neque. Nihil aperiam recusandae ipsum. Consectetur ipsa nihil quo qui.', 74805.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 21, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Ford', 'Accord', 2010, 85383, 'Diesel', 'Automatic', 'LightGreen', '1L', 2, 2, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'K4G8B3M0N9HUPKV5H', 'New'),
(92, 'Mercedes Accord', 'Soluta est blanditiis vero. Nihil voluptatibus nesciunt sunt sint. Consequuntur in in expedita vel.', 60035.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 16, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'BMW', 'Model 3', 2016, 45668, 'Diesel', 'Automatic', 'PowderBlue', '5L', 5, 2, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '4Z1KDPC9TRO3IBJ3N', 'Used'),
(93, 'BMW Camry', 'Molestiae delectus ipsum quam maiores aliquid. Est voluptates ad nobis aliquam ratione modi. Et fuga sint enim consequuntur beatae inventore.', 20238.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 5, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Audi', 'A4', 2015, 12306, 'Electric', 'CVT', 'Fuchsia', '4.4L', 5, 7, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'RV0G2H7VQ2PWO2GTR', 'Certified Pre-Owned'),
(94, 'Toyota A4', 'Consequatur autem ut deserunt ea vel mollitia. Sit maxime quae praesentium cum eveniet. Qui est expedita sapiente sint ducimus saepe quis dolorem.', 69907.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 17, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', 'Model 3', 2015, 13143, 'Petrol', 'CVT', 'Tan', '2.3L', 2, 7, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '32080DMAT49FCIKT2', 'Certified Pre-Owned'),
(95, 'Mercedes Accord', 'Iste saepe et nulla. Quia delectus nulla delectus iure quia nemo. Quae placeat mollitia alias ullam consequatur qui perspiciatis aperiam.', 69658.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 6, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Tesla', 'Accord', 2017, 23818, 'Electric', 'CVT', 'SlateGray', '3.1L', 3, 7, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'TLHQX4LB0NEWOFW8Z', 'Certified Pre-Owned'),
(96, 'BMW 3 Series', 'Assumenda quam harum magnam qui. Eum quas voluptatum vel vel repudiandae ullam tenetur. Libero enim nobis explicabo quibusdam commodi animi dolor.', 11809.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 6, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Toyota', '3 Series', 2010, 16021, 'Petrol', 'Manual', 'DeepSkyBlue', '5.6L', 3, 5, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'RBEV1YRFT8ZTG9FQ0', 'Used'),
(97, 'Tesla Accord', 'Autem voluptatibus velit iste. Temporibus eos animi voluptatibus quis in. Dolor est deserunt necessitatibus possimus perferendis est.', 85861.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 21, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'BMW', 'C-Class', 2017, 96211, 'Electric', 'Automatic', 'CadetBlue', '5.7L', 4, 6, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'WUVNCAWIN420K2LKJ', 'New'),
(98, 'Ford Model 3', 'Inventore voluptas eos rerum fuga at animi enim. Ea vitae voluptas et rerum ad. Excepturi sit qui quidem quo quia mollitia.', 31983.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 14, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Ford', 'Accord', 2022, 62249, 'Electric', 'Automatic', 'DeepPink', '2.4L', 3, 2, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', 'BL26YBLSB5VNE4WXP', 'New'),
(99, 'Tesla Accord', 'Aut laboriosam sapiente ducimus asperiores cum voluptatibus placeat. Quas quam enim explicabo libero et. Velit sint impedit amet rerum porro.', 83930.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 21, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Honda', '3 Series', 2023, 86315, 'Hybrid', 'Automatic', 'RoyalBlue', '1.3L', 4, 5, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '1CFQOYDLU1B6BEAG5', 'Used'),
(100, 'Tesla Model 3', 'Inventore quae doloribus quidem. Unde ex rerum ut eos cupiditate ad officia. Fugiat et neque consequatur et expedita aspernatur. Quibusdam in expedita ducimus corrupti facere dolorum optio.', 41914.00, 1, '\"products/fdouuGjpjTvjwPIzkqmpk2ZbWCzbBlNb4FT2WLDJ.jpg\"', 17, '2025-04-23 06:41:53', '2025-04-23 06:41:53', 'Honda', '3 Series', 2015, 22510, 'Hybrid', 'Automatic', 'FloralWhite', '3.2L', 4, 8, '\"[\\\"GPS\\\",\\\"Bluetooth\\\",\\\"Backup Camera\\\"]\"', '3CI8C0SPJT61RN10L', 'Certified Pre-Owned');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0otu3OPfGndgpwCblhvJy2bW40tpLWn8spJC5buW', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHY3RkxkY2xHRXJFeDVrY0xhSTBRcUhFVXhiT0d5WDRSd2hiVUJTZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745386508),
('KiNyF2Kl5wF1QgnaEsOqSrLRcDrRPOcm2gFXzPdp', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTBXUHpIN1pvSU03RnBsU1Y4Y0RCVkdEdVdqMWNDdEt3M2EwUWlxdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745430979);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Bhavesh Sathwara', 'sathwarainfotech@gmail.com', NULL, '$2y$12$UIjcQVQcDwBMN5ATu1A2seCLwaQ7aJHTh63pgduBaF0dIq36h1u32', NULL, '2025-04-23 04:50:59', '2025-04-23 05:07:08'),
(2, 'Bhavesh', 'bhavesh@gmail.com', NULL, '$2y$12$dy/scfxG8ChAFVtfyOC02uKRqcw.lHet8FDIIpwxtD.oEX6i4i7aa', NULL, '2025-04-23 07:36:30', '2025-04-23 07:36:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
