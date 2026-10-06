-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 03, 2026 at 08:04 PM
-- Server version: 11.8.9-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u739450562_buffet`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `version` varchar(191) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `author` varchar(191) DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`files`)),
  `purchase_username` varchar(191) DEFAULT NULL,
  `purchase_code` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` tinyint(3) UNSIGNED NOT NULL,
  `label_name` varchar(191) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `label`, `label_name`, `address`, `apartment`, `latitude`, `longitude`, `user_id`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 10, 'Work', 'Gaur City 2', 'Galaxy North Avenue 2', NULL, NULL, 1, '', 0, '', 0, '2026-09-18 20:12:03', '2026-09-18 20:12:03');

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `position` varchar(30) NOT NULL DEFAULT 'middle' COMMENT 'top | after_hero | middle | bottom',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5 COMMENT '5 = active, 10 = inactive',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `title`, `description`, `link`, `position`, `sort`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 'Neemrana Fort-Palace', NULL, NULL, 'top', 2, 5, NULL, NULL, '2026-09-17 22:02:23', '2026-09-17 22:03:38'),
(3, 'Anantara Jewel Bagh', 'Jaipur', NULL, 'top', 3, 5, NULL, NULL, '2026-09-17 22:11:03', '2026-09-17 22:11:03');

-- --------------------------------------------------------

--
-- Table structure for table `backend_menus`
--

CREATE TABLE `backend_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `link` varchar(191) NOT NULL,
  `icon` varchar(191) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backend_menus`
--

INSERT INTO `backend_menus` (`id`, `name`, `link`, `icon`, `status`, `parent_id`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'dashboard', 'fas fa-laptop', 1, 0, 100, NULL, NULL),
(2, 'restaurants', 'restaurants', 'fa fa-store fa-fw', 1, 0, 99, NULL, NULL),
(3, 'manage_restaurants', '#', 'fas fa-utensils', 1, 0, 98, NULL, NULL),
(4, 'categories', 'category', 'fas fa-th-large', 1, 3, 97, NULL, NULL),
(5, 'menu_items', 'menu-items', 'fas fa-th', 1, 3, 96, NULL, NULL),
(6, 'cuisines', 'cuisine', 'fas fa-grip-horizontal', 1, 3, 95, NULL, NULL),
(7, 'time_slots', 'time-slots', 'fas fa-calendar-alt', 1, 3, 94, NULL, NULL),
(8, 'tables', 'tables', 'fas fa-table', 1, 3, 93, NULL, NULL),
(9, 'rating', 'rating', 'fas fa-star', 1, 3, 92, NULL, NULL),
(10, 'qr_builder', 'qr-code', 'fas fa-barcode', 1, 3, 91, NULL, NULL),
(11, 'reservation_orders', '#', 'fa fa-chart-bar', 1, 0, 90, NULL, NULL),
(12, 'reservations', 'reservation', 'fas fa-calendar-check', 1, 11, 89, NULL, NULL),
(13, 'orders', 'orders', 'fas fa-cart-plus', 1, 11, 88, NULL, NULL),
(14, 'pending_orders', 'order-notification', 'fas fa-cubes', 1, 11, 87, NULL, NULL),
(15, 'live_orders', 'live-orders', 'fas fa-cubes', 1, 11, 87, NULL, NULL),
(16, 'promo_communication', '#', 'fa fa-chart-bar', 1, 0, 90, NULL, NULL),
(17, 'coupons', 'coupon', 'fas fa-ticket-alt', 1, 16, 88, NULL, NULL),
(18, 'complaints', 'complaints', 'fas fa-flag-checkered', 1, 16, 87, NULL, NULL),
(19, 'push_notification', 'push-notification', 'far fa-bell', 1, 16, 415, NULL, NULL),
(20, 'banners', 'banner', 'fas fa-film', 1, 16, 69, NULL, NULL),
(21, 'account', '#', 'fas fa-th-large', 1, 0, 86, NULL, NULL),
(22, 'transactions', 'transaction', 'fas fa-wallet', 1, 21, 85, NULL, NULL),
(23, 'collections', 'collection', 'fas fa-credit-card', 1, 21, 84, NULL, NULL),
(24, 'request_withdraws', 'request-withdraw', 'fas fa-money-bill-alt', 1, 21, 83, NULL, NULL),
(25, 'withdraw', 'withdraw', 'fas fa-cash-register', 1, 21, 82, NULL, NULL),
(26, 'expense', 'expense', 'fas fa-coins', 1, 21, 81, NULL, NULL),
(27, 'users_addon', '#', 'fas fa-id-card ', 1, 0, 80, NULL, NULL),
(28, 'user', 'user', 'fas fa-users', 1, 27, 79, NULL, NULL),
(29, 'customers', 'customers', 'fas fa-user', 1, 27, 78, NULL, NULL),
(30, 'restaurant_owners', 'restaurant-owners', 'fas fa-user-tie', 1, 27, 77, NULL, NULL),
(31, 'delivery_boys', 'delivery-boys', 'fas fa-truck-loading', 1, 27, 76, NULL, NULL),
(32, 'addons', 'addons', 'fa fa-crosshairs', 1, 27, 88, NULL, NULL),
(33, 'report', '#', 'fas fa-chart-pie', 1, 0, 75, NULL, NULL),
(34, 'restaurant_owner_sales_report', 'restaurant-owner-sales-report', 'fas fa-file-invoice', 1, 33, 74, NULL, NULL),
(35, 'admin_commission', 'admin-commission-report', 'fas fa-file-invoice-dollar', 1, 33, 73, NULL, NULL),
(36, 'credit_balance', 'credit-balance-report', 'fas fa-wallet', 1, 33, 72, NULL, NULL),
(37, 'delivery_order_balance', 'cash-on-delivery-order-balance-report', 'fas fa-chart-bar', 1, 33, 71, NULL, NULL),
(38, 'customer_report', 'customer-report', 'fas fa-chart-line', 1, 33, 70, NULL, NULL),
(39, 'withdraw_report', 'withdraw-report', 'fas fa-money-check', 1, 33, 69, NULL, NULL),
(40, 'collection_report', 'delivery-boy-collection-report', 'fas fa-money-check-alt', 1, 33, 68, NULL, NULL),
(41, 'reservation_report', 'reservation-report', 'fas fa-address-book', 1, 33, 71, NULL, NULL),
(42, 'setup', '#', 'fas fa-chart-pie', 1, 0, 75, NULL, NULL),
(43, 'settings', 'setting', 'fas fa-cogs', 1, 42, 67, NULL, NULL),
(44, 'advertisements', 'advertisement', 'fas fa-rectangle-ad', 1, 16, 68, '2026-09-16 15:51:25', '2026-09-16 15:51:25'),
(46, 'plans', 'plan', 'fas fa-tags', 1, 16, 67, '2026-09-16 17:30:01', '2026-09-16 17:30:01'),
(47, 'restaurant_applications', 'restaurant-application', 'fas fa-store', 1, 16, 66, '2026-09-16 17:30:01', '2026-09-16 17:30:01');

-- --------------------------------------------------------

--
-- Table structure for table `balances`
--

CREATE TABLE `balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `balance` decimal(13,2) NOT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `balances`
--

INSERT INTO `balances` (`id`, `name`, `type`, `balance`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'admin', 1, 0.00, '1', 1, '1', 1, '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(2, 'customer', 1, 0.00, '1', 1, '1', 1, '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(3, 'restaurantowner1', 1, 0.00, '1', 1, '1', 1, '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(4, 'delivery', 1, 0.00, '1', 1, '1', 1, '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(5, 'waiter', 1, 0.00, '1', 1, '1', 1, '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(6, 'godwinlobo', 1, 0.00, '1', 1, '1', 1, '2026-09-16 18:06:24', '2026-09-16 18:06:24'),
(7, 'godwin', 1, 0.00, '1', 1, '1', 1, '2026-09-16 19:09:04', '2026-09-16 19:09:04'),
(8, 'hshs@gmail.com', 1, 0.00, '1', 1, '1', 1, '2026-09-16 19:11:16', '2026-09-16 19:11:16'),
(9, 'ayush', 1, 0.00, '1', 1, '1', 1, '2026-09-16 23:13:56', '2026-09-16 23:13:56'),
(10, 'ayushman18', 1, 0.00, '1', 1, '1', 1, '2026-10-04 00:54:09', '2026-10-04 00:54:09'),
(11, 'AYUSH22', 1, 0.00, '1', 1, '1', 1, '2026-10-04 01:18:21', '2026-10-04 01:18:21');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(191) NOT NULL,
  `bank_code` varchar(191) DEFAULT NULL,
  `recipient_name` varchar(191) DEFAULT NULL,
  `account_number` varchar(191) DEFAULT NULL,
  `mobile_agent_name` varchar(191) DEFAULT NULL,
  `mobile_agent_number` varchar(191) DEFAULT NULL,
  `paypal_id` varchar(191) DEFAULT NULL,
  `upi_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `link` varchar(191) DEFAULT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `restaurant_id`, `title`, `short_description`, `link`, `sort`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 3, 'ee', NULL, NULL, 1, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-16 19:19:24', '2026-09-16 19:19:24'),
(2, 6, 'Holiday Buffet', 'Holiday Buffet', NULL, 2, 5, 'App\\Models\\User', 7, 'App\\Models\\User', 7, '2026-09-18 22:07:33', '2026-09-18 22:07:33');

-- --------------------------------------------------------

--
-- Table structure for table `best_selling_category`
--

CREATE TABLE `best_selling_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `counter` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `depth` int(10) UNSIGNED NOT NULL,
  `left` int(10) UNSIGNED NOT NULL,
  `right` int(10) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `requested` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `depth`, `left`, `right`, `parent_id`, `status`, `requested`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Ayush', 'ayush', NULL, 0, 0, 0, 0, 5, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-16 16:50:45', '2026-09-16 16:50:45'),
(2, '4* Hotel', '4-hotel', NULL, 0, 0, 0, 0, 5, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-21 20:57:32', '2026-09-21 20:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `category_menu_items`
--

CREATE TABLE `category_menu_items` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_menu_items`
--

INSERT INTO `category_menu_items` (`category_id`, `menu_item_id`) VALUES
(1, 61);

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `delivery_charge` decimal(13,2) DEFAULT NULL,
  `amount` decimal(13,2) NOT NULL,
  `date` date NOT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `discount_type` int(10) UNSIGNED NOT NULL,
  `coupon_type` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `limit` int(10) UNSIGNED NOT NULL,
  `user_limit` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(13,2) NOT NULL,
  `minimum_order_amount` decimal(13,2) DEFAULT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `slug`, `discount_type`, `coupon_type`, `restaurant_id`, `limit`, `user_limit`, `amount`, `minimum_order_amount`, `from_date`, `to_date`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'RSC', 'rsc', 5, 10, 1, 5000, 6000, 200.00, 1000.00, '2026-09-17 16:40:00', '2026-09-19 16:40:00', 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-17 16:40:20', '2026-09-18 20:34:34'),
(2, 'DIWALI OFFER', 'diwali-offer', 10, 10, 6, 2000, 2000, 5.00, 1000.00, '2026-09-21 22:53:00', '2026-09-21 23:53:00', 'App\\Models\\User', 7, 'App\\Models\\User', 7, '2026-09-21 22:53:56', '2026-09-21 22:53:56');

-- --------------------------------------------------------

--
-- Table structure for table `cuisines`
--

CREATE TABLE `cuisines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `depth` int(10) UNSIGNED NOT NULL,
  `left` int(10) UNSIGNED NOT NULL,
  `right` int(10) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `requested` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cuisines`
--

INSERT INTO `cuisines` (`id`, `name`, `slug`, `description`, `depth`, `left`, `right`, `parent_id`, `status`, `requested`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Buffet Menu', 'buffet-menu', '<p>Buffet Menu</p>', 0, 0, 0, 0, 5, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-16 16:51:46', '2026-09-17 21:45:29'),
(2, 'Continental Menu', 'continental-menu', '<p>Continental Cuisine</p>', 0, 0, 0, 0, 5, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-17 21:24:52', '2026-09-18 20:19:18'),
(3, 'Chinese Cuisine', 'chinese-cuisine', '<p>Chinese Cuisine</p>', 0, 0, 0, 0, 5, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-17 21:25:13', '2026-09-18 20:32:54'),
(4, 'European Cuisine', 'european-cuisine', '<p>European Cuisine</p>', 0, 0, 0, 0, 5, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-17 21:25:37', '2026-09-18 20:33:12'),
(5, 'Mughlai', 'mughlai', '<p>Mughlai</p>', 0, 0, 0, 0, 5, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-17 21:41:22', '2026-09-17 21:41:22'),
(6, 'À la Carte Menu', 'a-la-carte-menu', '<p>À la Carte Menu</p>', 0, 0, 0, 0, 5, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-17 21:43:25', '2026-09-17 21:43:25'),
(7, 'Table d\'Hôte Menu', 'table-dhote-menu', '<p>A <a href=\"https://www.google.com/goto?url=CAESaQHrOzAVZLJkIAK_AduZdEZ8VQ2IwHEEEJYSC8EFSKVSoswAS0GRm-QFAYlE4sSSbP4l1DGy5VyS0nb-eKZsbYiXeVBBmJwOFQ5UqFHmkoHWbkSeNhvuZgbPK-PKytYbHXESYfrql96sTw\">table d\'hôte</a> meal is a multi-course menu offered at a fixed total price, featuring limited choices for each course.&nbsp;</p>', 0, 0, 0, 0, 5, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-17 21:44:00', '2026-09-23 18:05:51'),
(8, 'American Buffet', 'american-buffet', '<p>American Buffet</p>', 0, 0, 0, 0, 5, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-17 21:44:53', '2026-09-18 16:52:27'),
(9, 'Luncheon Menu', 'luncheon-menu', '<p>Luncheon Menu</p>', 0, 0, 0, 0, 5, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-17 21:46:53', '2026-09-17 21:46:53'),
(10, 'Signature Menu', 'signature-menu', '<p>Signature Menu</p>', 0, 0, 0, 0, 5, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-17 21:47:25', '2026-09-17 21:47:25');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_accounts`
--

CREATE TABLE `delivery_boy_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `delivery_charge` decimal(13,2) NOT NULL,
  `balance` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_status_histories`
--

CREATE TABLE `delivery_status_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(13,2) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `amount` double(13,2) UNSIGNED NOT NULL,
  `expense_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `footer_menu_sections`
--

CREATE TABLE `footer_menu_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_menu_sections`
--

INSERT INTO `footer_menu_sections` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'About', '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(2, 'Services', '2026-09-14 23:12:23', '2026-09-14 23:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` char(36) NOT NULL,
  `meta` text DEFAULT NULL,
  `remarks` varchar(191) DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `flag_icon` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `flag_icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '🇬🇧', 5, '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(2, 'German', 'de', '🇩🇪', 5, '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(3, 'Bangla', 'bn', '🇧🇩', 5, '2026-09-14 23:12:23', '2026-09-14 23:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `ledgers`
--

CREATE TABLE `ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `balance_id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `amount` decimal(13,2) NOT NULL,
  `balance` decimal(13,2) NOT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) NOT NULL,
  `group` varchar(191) NOT NULL,
  `key` text NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `mime_type` varchar(191) DEFAULT NULL,
  `disk` varchar(191) NOT NULL,
  `conversions_disk` varchar(191) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\ThemeSettings', 4, 'fe73dff2-43cf-4921-a4e5-ec209b92450e', 'site_logo', 'ChatGPT Image Sep 16, 2026, 12_33_21 PM', 'ChatGPT-Image-Sep-16,-2026,-12_33_21-PM.png', 'image/png', 'public', 'public', 822943, '[]', '[]', '[]', '[]', 1, '2026-09-16 12:33:35', '2026-09-16 12:33:35'),
(3, 'App\\Models\\ThemeSettings', 90, 'c6b92f6e-bb29-48b6-b24f-79fe05b76c6e', 'site_footer_logo', 'ChatGPT Image Sep 16, 2026, 12_33_21 PM', 'ChatGPT-Image-Sep-16,-2026,-12_33_21-PM.png', 'image/png', 'public', 'public', 822943, '[]', '[]', '[]', '[]', 1, '2026-09-16 12:33:35', '2026-09-16 12:33:35'),
(4, 'App\\Models\\ThemeSettings', 5, '156b0843-953d-4ade-a3ec-b513d4bf4b0a', 'fav_icon', 'ChatGPT Image Sep 16, 2026, 12_34_53 PM', 'ChatGPT-Image-Sep-16,-2026,-12_34_53-PM.png', 'image/png', 'public', 'public', 908238, '[]', '[]', '[]', '[]', 1, '2026-09-16 12:35:02', '2026-09-16 12:35:02'),
(6, 'App\\Models\\Banner', 1, '84319397-ceee-4545-b91f-3d752a8a3421', 'banner', 'ChatGPT Image Sep 16, 2026, 12_33_21 PM', 'ChatGPT-Image-Sep-16,-2026,-12_33_21-PM.png', 'image/png', 'public', 'public', 822943, '[]', '[]', '[]', '[]', 1, '2026-09-16 19:19:24', '2026-09-16 19:19:24'),
(8, 'App\\Models\\Cuisine', 10, '823440a3-fe2b-4471-b96d-40d95235d3c7', 'cuisines', 'Signature Dish', 'Signature-Dish.jpg', 'image/jpeg', 'public', 'public', 371156, '[]', '[]', '{\"image\":true}', '[]', 1, '2026-09-17 21:58:42', '2026-09-17 21:58:43'),
(9, 'App\\Models\\Advertisement', 2, '258f13c8-e70a-4111-bd03-040510e0b29d', 'advertisement', 'Neemrana Fort-Palace', 'Neemrana-Fort-Palace.jpg', 'image/jpeg', 'public', 'public', 52211, '[]', '[]', '[]', '[]', 1, '2026-09-17 22:02:23', '2026-09-17 22:02:23'),
(10, 'App\\Models\\Advertisement', 3, 'c2325a0c-59b9-4f06-a9b9-f7e492417696', 'advertisement', 'Anantara Jewel Bagh, Jaipur', 'Anantara-Jewel-Bagh,-Jaipur.avif', 'image/jpeg', 'public', 'public', 44598, '[]', '[]', '[]', '[]', 1, '2026-09-17 22:11:03', '2026-09-17 22:11:03'),
(11, 'App\\Models\\Cuisine', 1, '481f9254-b4e6-45e8-bc48-2a5d97fff197', 'cuisines', 'Buffet Menu', 'Buffet-Menu.jpg', 'image/jpeg', 'public', 'public', 51525, '[]', '[]', '{\"image\":true}', '[]', 1, '2026-09-18 16:34:07', '2026-09-18 16:34:08'),
(12, 'App\\Models\\MenuItem', 61, '2a24e75d-4701-406c-bd5c-e421b7a7b969', 'menu-items', 'Buffet Menu', 'Buffet-Menu.jpg', 'image/jpeg', 'public', 'public', 51525, '[]', '[]', '{\"image\":true}', '[]', 1, '2026-09-18 16:36:35', '2026-09-18 16:36:35'),
(13, 'App\\Models\\Cuisine', 8, 'f94b18a9-9f5f-4a94-8b87-49ac8c39b69b', 'cuisines', 'American Buffet', 'American-Buffet.jpg', 'image/jpeg', 'public', 'public', 357881, '[]', '[]', '{\"image\":true}', '[]', 1, '2026-09-18 16:52:42', '2026-09-18 16:52:45'),
(14, 'App\\Models\\User', 7, '185da643-11fb-4f68-a6dc-81dbe1d2f9a6', 'user', 'Hotel Owner', 'Hotel-Owner.jpg', 'image/jpeg', 'public', 'public', 28828, '[]', '[]', '[]', '[]', 1, '2026-09-18 20:06:54', '2026-09-18 20:06:54'),
(15, 'App\\Models\\User', 1, '93f61c87-e84b-4a33-914a-a2ed61e8cc3c', 'user', 'Admintrator', 'Admintrator.jpg', 'image/jpeg', 'public', 'public', 15520, '[]', '[]', '[]', '[]', 1, '2026-09-18 20:07:24', '2026-09-18 20:07:24'),
(16, 'App\\Models\\Cuisine', 2, '1a1810c2-406b-41f8-832c-36c1675867c9', 'cuisines', 'Continental Menu', 'Continental-Menu.jpg', 'image/jpeg', 'public', 'public', 65472, '[]', '[]', '{\"image\":true}', '[]', 1, '2026-09-18 20:19:18', '2026-09-18 20:19:18'),
(17, 'App\\Models\\Cuisine', 5, 'f4551708-2a64-4924-8f32-4f4079961024', 'cuisines', 'Mughalai Menu', 'Mughalai-Menu.jpg', 'image/jpeg', 'public', 'public', 155328, '[]', '[]', '{\"image\":true}', '[]', 1, '2026-09-18 20:22:19', '2026-09-18 20:22:20'),
(18, 'App\\Models\\Cuisine', 3, 'c7886474-3c2a-4c53-96cd-f07d53158503', 'cuisines', 'Chinese Menu', 'Chinese-Menu.jpg', 'image/jpeg', 'public', 'public', 45412, '[]', '[]', '{\"image\":true}', '[]', 1, '2026-09-18 20:32:54', '2026-09-18 20:32:54'),
(19, 'App\\Models\\Banner', 2, 'aec47fa8-fe34-432e-b2dc-11ff2e300e38', 'banner', 'Buffet Menu', 'Buffet-Menu.jpg', 'image/jpeg', 'public', 'public', 51525, '[]', '[]', '[]', '[]', 1, '2026-09-18 22:07:33', '2026-09-18 22:07:33'),
(20, 'App\\Models\\User', 8, 'a0d43381-64e0-4b6f-8452-f2bd6d3d9c60', 'user', 'images', 'images.png', 'image/png', 'public', 'public', 8857, '[]', '[]', '[]', '[]', 1, '2026-09-19 22:31:08', '2026-09-19 22:31:08'),
(21, 'App\\Models\\User', 9, '5cf2ca3a-890f-4527-8dae-640d2b0d3b17', 'user', 'images', 'images.png', 'image/png', 'public', 'public', 8857, '[]', '[]', '[]', '[]', 1, '2026-09-19 22:39:02', '2026-09-19 22:39:02'),
(22, 'App\\Models\\User', 6, 'ed1e7f7f-42fc-443f-b5ab-972104176482', 'user', 'Customer', 'Customer.jpg', 'image/jpeg', 'public', 'public', 24051, '[]', '[]', '[]', '[]', 1, '2026-09-21 18:11:48', '2026-09-21 18:11:48'),
(23, 'App\\Models\\Category', 2, '642b1057-e76f-4151-9167-0a6f9fc73006', 'categories', '4 Hotel', '4-Hotel', 'image/jpeg', 'public', 'public', 331847, '[]', '[]', '[]', '[]', 1, '2026-09-21 20:57:33', '2026-09-21 20:57:33');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `cuisine_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `unit_price` decimal(13,2) DEFAULT NULL,
  `discount_price` decimal(13,2) NOT NULL DEFAULT 0.00,
  `counter` double NOT NULL DEFAULT 0,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `tags` longtext DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `menu_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `restaurant_id`, `cuisine_id`, `name`, `slug`, `description`, `unit_price`, `discount_price`, `counter`, `status`, `tags`, `order`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`, `menu_number`) VALUES
(1, 1, NULL, 'Royal Breakfast Buffet', 'royal-breakfast-buffet', 'A delicious morning buffet with Indian breakfast favorites.', 399.00, 349.00, 0, 1, 'breakfast,buffet,indian', 1, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 101),
(2, 1, NULL, 'Royal Lunch Buffet', 'royal-lunch-buffet', 'Complete North Indian lunch buffet with starters, mains and desserts.', 599.00, 549.00, 0, 1, 'lunch,buffet,north-indian', 2, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 102),
(3, 1, NULL, 'Royal Dinner Buffet', 'royal-dinner-buffet', 'Premium dinner buffet featuring Mughlai and North Indian specialties.', 699.00, 649.00, 0, 1, 'dinner,buffet,mughlai', 3, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 103),
(4, 1, NULL, 'Tandoori Starter Platter', 'tandoori-starter-platter', 'Assorted tandoori starters served fresh from the grill.', 349.00, 299.00, 0, 1, 'starter,tandoori,grill', 4, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 104),
(5, 1, NULL, 'Butter Chicken', 'butter-chicken', 'Creamy classic butter chicken prepared with traditional spices.', 329.00, 299.00, 0, 1, 'main-course,chicken,north-indian', 5, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 105),
(6, 1, NULL, 'Paneer Tikka Masala', 'paneer-tikka-masala', 'Soft paneer cooked in a rich tomato and spice gravy.', 299.00, 269.00, 0, 1, 'main-course,paneer,vegetarian', 6, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 106),
(7, 1, NULL, 'Veg Biryani', 'veg-biryani', 'Aromatic basmati rice cooked with vegetables and Indian spices.', 249.00, 219.00, 0, 1, 'biryani,rice,vegetarian', 7, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 107),
(8, 1, NULL, 'Chicken Biryani', 'chicken-biryani', 'Fragrant basmati rice layered with tender chicken and spices.', 349.00, 319.00, 0, 1, 'biryani,chicken,rice', 8, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 108),
(9, 1, NULL, 'Dal Makhani', 'dal-makhani', 'Slow-cooked black lentils finished with butter and cream.', 229.00, 199.00, 0, 1, 'dal,vegetarian,north-indian', 9, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 109),
(10, 1, NULL, 'Gulab Jamun', 'gulab-jamun', 'Soft milk dumplings served warm in sweet sugar syrup.', 149.00, 129.00, 0, 1, 'dessert,sweet', 10, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 110),
(11, 1, NULL, 'Fresh Fruit Custard', 'fresh-fruit-custard', 'Creamy custard topped with seasonal fresh fruits.', 169.00, 149.00, 0, 1, 'dessert,fruit', 11, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 111),
(12, 1, NULL, 'Fresh Beverage Counter', 'fresh-beverage-counter', 'Refreshing juices, soft drinks and traditional beverages.', 199.00, 179.00, 0, 1, 'beverages,drinks', 12, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 112),
(13, 2, NULL, 'Urban Breakfast Buffet', 'urban-breakfast-buffet', 'Fresh Indian breakfast buffet with multiple vegetarian options.', 349.00, 299.00, 0, 1, 'breakfast,buffet,veg', 1, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 201),
(14, 2, NULL, 'Urban Lunch Buffet', 'urban-lunch-buffet', 'Unlimited lunch buffet featuring popular Indian dishes.', 499.00, 449.00, 0, 1, 'lunch,buffet,indian', 2, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 202),
(15, 2, NULL, 'Urban Dinner Buffet', 'urban-dinner-buffet', 'Evening buffet with Punjabi and North Indian specialties.', 599.00, 549.00, 0, 1, 'dinner,buffet,punjabi', 3, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 203),
(16, 2, NULL, 'Paneer Tikka', 'urban-paneer-tikka', 'Char-grilled cottage cheese with Indian herbs and spices.', 269.00, 239.00, 0, 1, 'starter,paneer,veg', 4, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 204),
(17, 2, NULL, 'Chole Bhature', 'urban-chole-bhature', 'Popular Punjabi chickpea curry served with fluffy bhature.', 229.00, 199.00, 0, 1, 'punjabi,breakfast,veg', 5, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 205),
(18, 2, NULL, 'Shahi Paneer', 'shahi-paneer', 'Rich creamy paneer curry with aromatic Indian spices.', 299.00, 269.00, 0, 1, 'main-course,paneer,veg', 6, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 206),
(19, 2, NULL, 'Amritsari Chole', 'amritsari-chole', 'Punjabi style spicy chickpea curry.', 219.00, 189.00, 0, 1, 'punjabi,main-course,veg', 7, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 207),
(20, 2, NULL, 'Jeera Rice', 'urban-jeera-rice', 'Fragrant basmati rice flavored with roasted cumin.', 179.00, 159.00, 0, 1, 'rice,veg', 8, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 208),
(21, 2, NULL, 'Tandoori Roti Basket', 'tandoori-roti-basket', 'Freshly baked assortment of Indian breads.', 149.00, 129.00, 0, 1, 'bread,tandoori,veg', 9, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 209),
(22, 2, NULL, 'Rasmalai', 'urban-rasmalai', 'Soft cottage cheese dumplings in chilled saffron milk.', 169.00, 149.00, 0, 1, 'dessert,sweet', 10, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 210),
(23, 2, NULL, 'Ice Cream Counter', 'urban-ice-cream-counter', 'Multiple flavors of creamy premium ice cream.', 199.00, 179.00, 0, 1, 'dessert,ice-cream', 11, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 211),
(24, 2, NULL, 'Masala Chai & Coffee', 'masala-chai-coffee', 'Unlimited hot tea and freshly brewed coffee.', 129.00, 99.00, 0, 1, 'beverage,tea,coffee', 12, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 212),
(25, 3, NULL, 'Asian Breakfast Buffet', 'asian-breakfast-buffet', 'Fresh Asian-inspired breakfast buffet with noodles, rice and beverages.', 449.00, 399.00, 0, 1, 'breakfast,buffet,asian', 1, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 301),
(26, 3, NULL, 'Chinese Lunch Buffet', 'chinese-lunch-buffet', 'Unlimited Chinese and Indo-Chinese lunch buffet.', 549.00, 499.00, 0, 1, 'lunch,buffet,chinese', 2, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 302),
(27, 3, NULL, 'Asian Dinner Buffet', 'asian-dinner-buffet', 'Premium dinner buffet with Chinese and Thai favorites.', 649.00, 599.00, 0, 1, 'dinner,buffet,asian', 3, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 303),
(28, 3, NULL, 'Crispy Spring Rolls', 'crispy-spring-rolls', 'Golden crispy vegetable spring rolls served with dip.', 199.00, 169.00, 0, 1, 'starter,chinese', 4, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 304),
(29, 3, NULL, 'Honey Chilli Potato', 'honey-chilli-potato', 'Crispy potatoes tossed in sweet and spicy sauce.', 229.00, 199.00, 0, 1, 'starter,chinese,veg', 5, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 305),
(30, 3, NULL, 'Veg Hakka Noodles', 'veg-hakka-noodles', 'Classic wok-tossed noodles with fresh vegetables.', 249.00, 219.00, 0, 1, 'noodles,chinese,veg', 6, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 306),
(31, 3, NULL, 'Chicken Manchurian', 'chicken-manchurian', 'Crispy chicken cooked in a flavorful Manchurian sauce.', 299.00, 269.00, 0, 1, 'chicken,chinese,main-course', 7, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 307),
(32, 3, NULL, 'Fried Rice', 'wok-fried-rice', 'Wok-fried aromatic rice with vegetables and sauces.', 229.00, 199.00, 0, 1, 'rice,chinese,veg', 8, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 308),
(33, 3, NULL, 'Thai Green Curry', 'thai-green-curry', 'Creamy Thai green curry with vegetables and herbs.', 329.00, 299.00, 0, 1, 'thai,curry,main-course', 9, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 309),
(34, 3, NULL, 'Mango Pudding', 'mango-pudding', 'Smooth chilled mango pudding with fresh fruit flavor.', 179.00, 159.00, 0, 1, 'dessert,mango', 10, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 310),
(35, 3, NULL, 'Chocolate Brownie', 'wok-chocolate-brownie', 'Warm chocolate brownie served with dessert toppings.', 199.00, 179.00, 0, 1, 'dessert,chocolate', 11, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 311),
(36, 3, NULL, 'Asian Beverage Bar', 'asian-beverage-bar', 'Refreshing mocktails, iced tea and soft beverages.', 229.00, 199.00, 0, 1, 'beverage,mocktail,drinks', 12, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 312),
(37, 4, NULL, 'Italian Breakfast Buffet', 'italian-breakfast-buffet', 'Continental and Italian-inspired breakfast buffet.', 449.00, 399.00, 0, 1, 'breakfast,buffet,italian', 1, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 401),
(38, 4, NULL, 'Italian Lunch Buffet', 'italian-lunch-buffet', 'Unlimited Italian lunch buffet with pizzas, pasta and salads.', 599.00, 549.00, 0, 1, 'lunch,buffet,italian', 2, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 402),
(39, 4, NULL, 'Italian Dinner Buffet', 'italian-dinner-buffet', 'Premium Italian dinner buffet with authentic flavors.', 699.00, 649.00, 0, 1, 'dinner,buffet,italian', 3, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 403),
(40, 4, NULL, 'Garlic Bread', 'bella-garlic-bread', 'Fresh baked garlic bread with herbs and butter.', 179.00, 149.00, 0, 1, 'starter,bakery,italian', 4, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 404),
(41, 4, NULL, 'Margherita Pizza', 'bella-margherita-pizza', 'Classic Italian pizza with tomato, mozzarella and basil.', 299.00, 269.00, 0, 1, 'pizza,italian,veg', 5, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 405),
(42, 4, NULL, 'Farmhouse Pizza', 'bella-farmhouse-pizza', 'Loaded vegetable pizza with fresh herbs and cheese.', 349.00, 319.00, 0, 1, 'pizza,italian,veg', 6, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 406),
(43, 4, NULL, 'Penne Arrabbiata', 'penne-arrabbiata', 'Penne pasta tossed in spicy tomato sauce.', 299.00, 269.00, 0, 1, 'pasta,italian,veg', 7, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 407),
(44, 4, NULL, 'Creamy Alfredo Pasta', 'creamy-alfredo-pasta', 'Creamy pasta prepared with parmesan and herbs.', 329.00, 299.00, 0, 1, 'pasta,italian', 8, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 408),
(45, 4, NULL, 'Italian Garden Salad', 'italian-garden-salad', 'Fresh seasonal vegetables with Italian dressing.', 199.00, 169.00, 0, 1, 'salad,healthy,italian', 9, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 409),
(46, 4, NULL, 'Tiramisu', 'bella-tiramisu', 'Classic Italian coffee-flavored dessert.', 249.00, 219.00, 0, 1, 'dessert,italian,coffee', 10, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 410),
(47, 4, NULL, 'Chocolate Mousse', 'bella-chocolate-mousse', 'Rich and creamy chocolate mousse.', 199.00, 179.00, 0, 1, 'dessert,chocolate', 11, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 411),
(48, 4, NULL, 'Italian Mocktail Bar', 'italian-mocktail-bar', 'Refreshing Italian-style mocktails and beverages.', 249.00, 219.00, 0, 1, 'beverage,mocktail,italian', 12, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 412),
(49, 5, NULL, 'BBQ Breakfast Buffet', 'bbq-breakfast-buffet', 'Hearty breakfast buffet with Indian and continental choices.', 399.00, 349.00, 0, 1, 'breakfast,buffet', 1, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 501),
(50, 5, NULL, 'BBQ Lunch Buffet', 'bbq-lunch-buffet', 'Unlimited BBQ lunch buffet with grills, biryani and desserts.', 649.00, 599.00, 0, 1, 'lunch,buffet,bbq', 2, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 502),
(51, 5, NULL, 'BBQ Dinner Buffet', 'bbq-dinner-buffet', 'Premium unlimited dinner buffet with live BBQ counters.', 749.00, 699.00, 0, 1, 'dinner,buffet,bbq', 3, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 503),
(52, 5, NULL, 'Live BBQ Platter', 'live-bbq-platter', 'Fresh grilled vegetables and meats from the live BBQ counter.', 399.00, 349.00, 0, 1, 'starter,bbq,grill', 4, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 504),
(53, 5, NULL, 'Tandoori Chicken', 'bbq-tandoori-chicken', 'Juicy chicken marinated with Indian spices and grilled.', 349.00, 319.00, 0, 1, 'chicken,tandoori,bbq', 5, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 505),
(54, 5, NULL, 'Grilled Paneer', 'bbq-grilled-paneer', 'Grilled paneer cubes with smoky herbs and spices.', 299.00, 269.00, 0, 1, 'paneer,bbq,veg', 6, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 506),
(55, 5, NULL, 'Mutton Biryani', 'bbq-mutton-biryani', 'Aromatic basmati rice cooked with tender mutton and spices.', 399.00, 369.00, 0, 1, 'biryani,mutton,rice', 7, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 507),
(56, 5, NULL, 'Butter Naan Basket', 'butter-naan-basket', 'Freshly baked butter naan served hot.', 179.00, 149.00, 0, 1, 'bread,naan', 8, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 508),
(57, 5, NULL, 'BBQ Chicken Wings', 'bbq-chicken-wings', 'Smoky grilled chicken wings with BBQ glaze.', 329.00, 299.00, 0, 1, 'chicken,wings,bbq', 9, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 509),
(58, 5, NULL, 'Brownie With Ice Cream', 'brownie-with-ice-cream', 'Warm chocolate brownie topped with creamy ice cream.', 249.00, 219.00, 0, 1, 'dessert,brownie,ice-cream', 10, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 510),
(59, 5, NULL, 'Gulab Jamun Counter', 'bbq-gulab-jamun-counter', 'Traditional Indian sweet served warm.', 149.00, 129.00, 0, 1, 'dessert,sweet', 11, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 511),
(60, 5, NULL, 'Unlimited Beverage Counter', 'unlimited-beverage-counter', 'Unlimited soft drinks, juices and refreshing beverages.', 199.00, 169.00, 0, 1, 'beverage,drinks,unlimited', 12, 'App\\Models\\User', 3, 'App\\Models\\User', 3, '2026-09-16 07:12:23', '2026-09-16 07:12:23', 512),
(61, 6, NULL, 'Buffet Large', 'buffet-large', NULL, 1500.00, 1200.00, 0, 5, NULL, 1, 'App\\Models\\User', 7, 'App\\Models\\User', 7, '2026-09-18 16:36:35', '2026-09-21 23:34:20', 8033);

-- --------------------------------------------------------

--
-- Table structure for table `menu_item_options`
--

CREATE TABLE `menu_item_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `price` decimal(13,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_item_variations`
--

CREATE TABLE `menu_item_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `discount_price` decimal(13,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_04_02_193005_create_translations_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_04_16_055437_create_categories_table', 1),
(7, '2020_04_16_055951_create_restaurants_table', 1),
(8, '2020_04_16_061409_create_menu_items_table', 1),
(9, '2020_04_16_062121_create_category_menu_items_table', 1),
(10, '2020_04_16_062315_create_orders_table', 1),
(11, '2020_04_16_063024_create_order_line_items_table', 1),
(12, '2020_04_16_063722_create_settings_table', 1),
(13, '2020_04_16_070938_create_order_histories_table', 1),
(14, '2020_04_16_113855_create_jobs_table', 1),
(15, '2020_04_30_105431_create_gateways_table', 1),
(16, '2020_05_03_074532_create_balances_table', 1),
(17, '2020_05_03_074808_create_invoices_table', 1),
(18, '2020_05_03_074929_create_ledgers_table', 1),
(19, '2020_05_03_075008_create_transactions_table', 1),
(20, '2020_05_07_111209_create_notifications_table', 1),
(21, '2020_05_19_061437_create_delivery_status_histories_table', 1),
(22, '2020_07_07_141444_create_menu_item_variations_table', 1),
(23, '2020_07_07_142259_create_menu_item_options_table', 1),
(24, '2020_07_14_221338_create_sliders_table', 1),
(25, '2020_07_16_114819_create_otp_table', 1),
(26, '2020_09_09_043116_create_permission_tables', 1),
(27, '2020_09_10_080029_create_backend_menus_table', 1),
(28, '2020_09_24_141335_create_banners_table', 1),
(29, '2020_10_08_111835_create_user_deposits_table', 1),
(30, '2020_10_08_140504_create_withdraws_table', 1),
(31, '2020_10_11_145937_create_collection_payments_table', 1),
(32, '2020_10_12_110558_create_best_selling_category_table', 1),
(33, '2020_10_12_122641_create_delivery_boy_accounts_table', 1),
(34, '2020_10_12_155325_create_request_withdraw_table', 1),
(35, '2020_10_15_071733_create_restaurant_ratings_table', 1),
(36, '2020_10_20_171007_create_footer_menu_sections', 1),
(37, '2020_10_20_171044_create_pages', 1),
(38, '2020_11_16_115104_create_discounts_table', 1),
(39, '2020_11_16_115104_create_templates_table', 1),
(40, '2021_01_03_162509_create_qr_codes_table', 1),
(41, '2021_02_04_150801_create_tables_table', 1),
(42, '2021_02_04_151350_create_time_slots_table', 1),
(43, '2021_03_07_162908_create_addresses_table', 1),
(44, '2021_04_10_183151_create_cuisines_table', 1),
(45, '2021_04_11_110236_create_restaurant_cuisines_table', 1),
(46, '2021_04_11_175528_add_cuisine_id_to_menu_items_table', 1),
(47, '2021_04_18_183151_create_addons_table', 1),
(48, '2021_04_18_183151_create_reservations_table', 1),
(49, '2022_01_01_133631_add_waiter_status_field_to_restaurants', 1),
(50, '2022_01_02_131938_add_menu_number_field_to_menu_items_table', 1),
(51, '2022_01_24_135409_create_banks_table', 1),
(52, '2022_01_25_130122_add_payment_method_to_withdraws', 1),
(53, '2022_02_13_121315_create_languages_table', 1),
(54, '2022_02_15_122629_create_push_notifications_table', 1),
(55, '2022_03_02_174656_add_provider_to_users', 1),
(56, '2022_03_02_174657_update_settings_add_envato_key', 1),
(57, '2022_03_02_174658_update_settings_add_support_key', 1),
(58, '2022_05_17_155917_create_reports_table', 1),
(59, '2022_05_26_155053_add_web_token_to_users', 1),
(60, '2022_10_13_125844_create_coupons_table', 1),
(61, '2022_10_24_051740_create_media_table', 1),
(62, '2023_10_12_121925_add_deleted_at_to_restaurants_table', 1),
(63, '2024_05_15_135627_add_country_code_to_users_table', 1),
(64, '2024_11_14_132743_create_expenses_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 1),
(4, 'App\\Models\\User', 1),
(5, 'App\\Models\\User', 1),
(6, 'App\\Models\\User', 1),
(7, 'App\\Models\\User', 1),
(8, 'App\\Models\\User', 1),
(9, 'App\\Models\\User', 1),
(10, 'App\\Models\\User', 1),
(11, 'App\\Models\\User', 1),
(12, 'App\\Models\\User', 1),
(13, 'App\\Models\\User', 1),
(14, 'App\\Models\\User', 1),
(15, 'App\\Models\\User', 1),
(16, 'App\\Models\\User', 1),
(17, 'App\\Models\\User', 1),
(18, 'App\\Models\\User', 1),
(19, 'App\\Models\\User', 1),
(20, 'App\\Models\\User', 1),
(21, 'App\\Models\\User', 1),
(22, 'App\\Models\\User', 1),
(23, 'App\\Models\\User', 1),
(24, 'App\\Models\\User', 1),
(25, 'App\\Models\\User', 1),
(26, 'App\\Models\\User', 1),
(27, 'App\\Models\\User', 1),
(28, 'App\\Models\\User', 1),
(29, 'App\\Models\\User', 1),
(30, 'App\\Models\\User', 1),
(32, 'App\\Models\\User', 1),
(33, 'App\\Models\\User', 1),
(34, 'App\\Models\\User', 1),
(35, 'App\\Models\\User', 1),
(36, 'App\\Models\\User', 1),
(38, 'App\\Models\\User', 1),
(39, 'App\\Models\\User', 1),
(40, 'App\\Models\\User', 1),
(41, 'App\\Models\\User', 1),
(42, 'App\\Models\\User', 1),
(43, 'App\\Models\\User', 1),
(45, 'App\\Models\\User', 1),
(46, 'App\\Models\\User', 1),
(47, 'App\\Models\\User', 1),
(48, 'App\\Models\\User', 1),
(49, 'App\\Models\\User', 1),
(50, 'App\\Models\\User', 1),
(51, 'App\\Models\\User', 1),
(52, 'App\\Models\\User', 1),
(53, 'App\\Models\\User', 1),
(54, 'App\\Models\\User', 1),
(55, 'App\\Models\\User', 1),
(56, 'App\\Models\\User', 1),
(57, 'App\\Models\\User', 1),
(58, 'App\\Models\\User', 1),
(59, 'App\\Models\\User', 1),
(60, 'App\\Models\\User', 1),
(61, 'App\\Models\\User', 1),
(62, 'App\\Models\\User', 1),
(63, 'App\\Models\\User', 1),
(64, 'App\\Models\\User', 1),
(65, 'App\\Models\\User', 1),
(66, 'App\\Models\\User', 1),
(67, 'App\\Models\\User', 1),
(68, 'App\\Models\\User', 1),
(69, 'App\\Models\\User', 1),
(70, 'App\\Models\\User', 1),
(71, 'App\\Models\\User', 1),
(72, 'App\\Models\\User', 1),
(73, 'App\\Models\\User', 1),
(74, 'App\\Models\\User', 1),
(75, 'App\\Models\\User', 1),
(76, 'App\\Models\\User', 1),
(77, 'App\\Models\\User', 1),
(78, 'App\\Models\\User', 1),
(79, 'App\\Models\\User', 1),
(80, 'App\\Models\\User', 1),
(81, 'App\\Models\\User', 1),
(82, 'App\\Models\\User', 1),
(83, 'App\\Models\\User', 1),
(84, 'App\\Models\\User', 1),
(85, 'App\\Models\\User', 1),
(86, 'App\\Models\\User', 1),
(87, 'App\\Models\\User', 1),
(88, 'App\\Models\\User', 1),
(89, 'App\\Models\\User', 1),
(90, 'App\\Models\\User', 1),
(91, 'App\\Models\\User', 1),
(92, 'App\\Models\\User', 1),
(93, 'App\\Models\\User', 1),
(94, 'App\\Models\\User', 1),
(95, 'App\\Models\\User', 1),
(96, 'App\\Models\\User', 1),
(97, 'App\\Models\\User', 1),
(98, 'App\\Models\\User', 1),
(99, 'App\\Models\\User', 1),
(100, 'App\\Models\\User', 1),
(101, 'App\\Models\\User', 1),
(102, 'App\\Models\\User', 1),
(103, 'App\\Models\\User', 1),
(104, 'App\\Models\\User', 1),
(105, 'App\\Models\\User', 1),
(106, 'App\\Models\\User', 1),
(107, 'App\\Models\\User', 1),
(108, 'App\\Models\\User', 1),
(109, 'App\\Models\\User', 1),
(110, 'App\\Models\\User', 1),
(111, 'App\\Models\\User', 1),
(112, 'App\\Models\\User', 1),
(113, 'App\\Models\\User', 1),
(114, 'App\\Models\\User', 1),
(115, 'App\\Models\\User', 1),
(116, 'App\\Models\\User', 1),
(117, 'App\\Models\\User', 1),
(118, 'App\\Models\\User', 1),
(119, 'App\\Models\\User', 1),
(120, 'App\\Models\\User', 1),
(121, 'App\\Models\\User', 1),
(122, 'App\\Models\\User', 1),
(123, 'App\\Models\\User', 1),
(124, 'App\\Models\\User', 1),
(125, 'App\\Models\\User', 1),
(126, 'App\\Models\\User', 1),
(127, 'App\\Models\\User', 1),
(128, 'App\\Models\\User', 1),
(129, 'App\\Models\\User', 1),
(130, 'App\\Models\\User', 1),
(131, 'App\\Models\\User', 1),
(132, 'App\\Models\\User', 1),
(133, 'App\\Models\\User', 1),
(134, 'App\\Models\\User', 1),
(135, 'App\\Models\\User', 1),
(136, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `sub_total` decimal(13,2) NOT NULL,
  `delivery_charge` decimal(13,2) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `platform` tinyint(3) UNSIGNED DEFAULT NULL,
  `order_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `device_id` varchar(191) DEFAULT NULL,
  `ip` varchar(191) DEFAULT NULL,
  `payment_status` tinyint(3) UNSIGNED NOT NULL,
  `paid_amount` decimal(13,2) NOT NULL,
  `address` longtext NOT NULL,
  `mobile` varchar(191) NOT NULL,
  `lat` varchar(191) NOT NULL,
  `long` varchar(191) NOT NULL,
  `misc` longtext DEFAULT NULL,
  `invoice_id` char(36) DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_boy_id` bigint(20) DEFAULT NULL,
  `product_received` tinyint(4) NOT NULL DEFAULT 10,
  `payment_method` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_histories`
--

CREATE TABLE `order_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `previous_status` int(10) UNSIGNED DEFAULT NULL,
  `current_status` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_line_items`
--

CREATE TABLE `order_line_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `unit_price` decimal(13,2) NOT NULL,
  `discounted_price` decimal(13,2) NOT NULL DEFAULT 0.00,
  `item_total` decimal(13,2) NOT NULL,
  `menu_item_variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `options` longtext DEFAULT NULL,
  `instructions` longtext DEFAULT NULL,
  `options_total` double UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `code` varchar(191) NOT NULL,
  `expire_date` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `footer_menu_section_id` bigint(20) UNSIGNED NOT NULL,
  `template_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `description`, `footer_menu_section_id`, `template_id`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Terms & Conditions', 'terms-conditions', '<p><img src=\"https://chatgpt.com/backend-api/estuary/content?id=file_0000000039b48211871862616a8147c2&amp;ts=497094&amp;p=fs&amp;cid=1&amp;sig=4f4b1536d5eea4924157ed2f99ee7930865af4e713205b3bcdc53da97ce55f3f&amp;v=0\" alt=\"7ce41d11-ad3f-4a26-8395-3fc049bd7ed1.png\"></p><p>inn sbb k paes ka datat do bdiya sa name h buffet lounge ek multirestuarant web h , isme cusines wgera log kha payenge</p><p>Haan, <strong>Buffet Lounge</strong> ko ek proper multi-restaurant food ordering/discovery platform maan ke pages rakh sakte ho—jahan users different restaurants, cuisines, menus aur dishes explore karke order kar sakein. Common restaurant platforms mein About, Privacy, Terms aur Contact jaise pages ke saath ordering-related information bhi hoti hai.</p><p>Tumhare screenshot ke hisaab se <strong>Pages</strong> mein ye data daal do:</p><figure class=\"table\"><table><thead><tr><th>Title</th><th>Footer Menu Section</th><th>Template</th><th>Status</th></tr></thead><tbody><tr><td><strong>About Us</strong></td><td>About</td><td>About</td><td>Active</td></tr><tr><td><strong>Contact Us</strong></td><td>About</td><td>Contact</td><td>Active</td></tr><tr><td><strong>Privacy Policy</strong></td><td>Services</td><td>About</td><td>Active</td></tr><tr><td><strong>Terms &amp; Conditions</strong></td><td>About</td><td>Default</td><td>Active</td></tr><tr><td><strong>Refund &amp; Cancellation Policy</strong></td><td>Services</td><td>Default</td><td>Active</td></tr><tr><td><strong>Shipping &amp; Delivery Policy</strong></td><td>Services</td><td>Default</td><td>Active</td></tr><tr><td><strong>Frequently Asked Questions</strong></td><td>Services</td><td>Default</td><td>Active</td></tr><tr><td><strong>How It Works</strong></td><td>Services</td><td>Default</td><td>Active</td></tr><tr><td><strong>Restaurants</strong></td><td>Services</td><td>Default</td><td>Active</td></tr><tr><td><strong>Popular Cuisines</strong></td><td>Services</td><td>Default</td><td>Active</td></tr><tr><td><strong>Offers &amp; Deals</strong></td><td>Services</td><td>Default</td><td>Active</td></tr><tr><td><strong>Order Food Online</strong></td><td>Services</td><td>Default</td><td>Active</td></tr><tr><td><strong>Become a Restaurant Partner</strong></td><td>Partner</td><td>Default</td><td>Active</td></tr><tr><td><strong>Partner With Us</strong></td><td>Partner</td><td>Default</td><td>Active</td></tr><tr><td><strong>Customer Support</strong></td><td>Support</td><td>Default</td><td>Active</td></tr></tbody></table></figure><h3>🍽️ Buffet Lounge ke liye About Us ka content</h3><p><strong>About Buffet Lounge</strong></p><blockquote><p>Welcome to <strong>Buffet Lounge</strong>, your destination to discover restaurants, explore delicious cuisines, and enjoy great food from multiple restaurants in one place.</p><p>Buffet Lounge brings together a wide variety of restaurants, cuisines, menus, and food options, making it easier for customers to discover what they love.</p><p>Whether you\'re looking for Indian, Chinese, Italian, Continental, Fast Food, Mughlai, South Indian, Desserts, Beverages or something new to try, Buffet Lounge helps you explore restaurants and their menus conveniently.</p><p>Our goal is to make food discovery and ordering <strong>simple, convenient and enjoyable</strong> for everyone.</p></blockquote><h3>🍕 Popular Cuisines</h3><p>Is page/section mein ye cuisines rakh sakte ho:</p><ul><li>North Indian</li><li>South Indian</li><li>Chinese</li><li>Mughlai</li><li>Punjabi</li><li>Italian</li><li>Continental</li><li>Fast Food</li><li>Biryani</li><li>Pizza</li><li>Burgers</li><li>Street Food</li><li>Desserts</li><li>Bakery</li><li>Beverages</li><li>Cafe</li><li>Healthy Food</li><li>Thali</li><li>Seafood</li><li>BBQ &amp; Grill</li></ul><h3>📞 Contact Us</h3><p><strong>Buffet Lounge Customer Support</strong></p><blockquote><p>Have a question about an order, restaurant, payment or any other issue? Our support team is here to help.</p><p><strong>Email:</strong> <a href=\"mailto:support@buffetlounge.com\">support@buffetlounge.com</a><br><strong>Phone:</strong> +91 XXXXX XXXXX<br><strong>Support Hours:</strong> 10:00 AM – 10:00 PM</p><p>For order-related queries, please keep your <strong>Order ID</strong> ready so that our team can assist you quickly.</p></blockquote><p><strong>Important:</strong> Email/phone/domain ko actual details se replace karna.</p><h3>❓ FAQ mein ye questions daalna</h3><ol><li>How can I place an order?</li><li>How do I search for a restaurant?</li><li>How can I browse cuisines?</li><li>Can I order from multiple restaurants?</li><li>What payment methods are available?</li><li>How can I track my order?</li><li>Can I cancel my order?</li><li>What happens if my order is delayed?</li><li>How can I contact restaurant support?</li><li>How can I become a restaurant partner?</li></ol><p><strong>Ek important point:</strong> agar Buffet Lounge mein actual <strong>delivery</strong> bhi hai, tab Shipping &amp; Delivery page rakho. Agar sirf restaurant discovery/dine-in/table booking hai, to us page ki jagah <strong>Table Reservation Policy</strong> rakhna better rahega.</p><p>&nbsp;</p><p>privacy policy and termans and contion do</p><p>Bilkul. <strong>Buffet Lounge</strong> ke multi-restaurant food ordering platform ke liye ready-to-use <strong>Privacy Policy</strong> aur <strong>Terms &amp; Conditions</strong> de raha hoon. Isse admin ke respective pages mein paste kar sakte ho.</p><h2>Privacy Policy</h2><p><strong>Last Updated: September 16, 2026</strong></p><p>Welcome to <strong>Buffet Lounge</strong>. We respect your privacy and are committed to protecting the personal information you provide while using our website, mobile application, and related services.</p><p>This Privacy Policy explains how Buffet Lounge collects, uses, stores, and protects your information when you browse restaurants, explore cuisines, place orders, make payments, create an account, or use any other services available through our platform.</p><h2>1. Information We Collect</h2><p>We may collect the following information when you use Buffet Lounge:</p><h3>Personal Information</h3><ul><li>Full name</li><li>Email address</li><li>Mobile/phone number</li><li>Delivery address</li><li>Billing information</li><li>Account login information</li></ul><h3>Order Information</h3><ul><li>Restaurant selected</li><li>Food items ordered</li><li>Order amount</li><li>Order history</li><li>Delivery details</li><li>Order status</li></ul><h3>Payment Information</h3><p>Payments may be processed through third-party payment gateways. Buffet Lounge may receive transaction-related information such as payment status, transaction ID, and payment method. We do not intentionally store complete debit/credit card details on our servers.</p><h3>Device &amp; Technical Information</h3><p>We may automatically collect:</p><ul><li>IP address</li><li>Browser type</li><li>Device information</li><li>Operating system</li><li>Website/app usage information</li><li>Cookies and similar technologies</li></ul><h2>2. How We Use Your Information</h2><p>Your information may be used to:</p><ul><li>Create and manage your account</li><li>Process and deliver your orders</li><li>Connect you with restaurants and delivery partners</li><li>Process payments</li><li>Provide order updates and notifications</li><li>Respond to customer support requests</li><li>Improve our website and services</li><li>Personalize your experience</li><li>Prevent fraud, misuse, and unauthorized activity</li><li>Send promotional offers where permitted by applicable law</li></ul><h2>3. Restaurant &amp; Delivery Partners</h2><p>To fulfill your order, relevant information such as your name, contact number, delivery address, and order details may be shared with the restaurant and/or delivery partner responsible for processing or delivering your order.</p><p>Such information is shared only to the extent reasonably required to provide the requested service.</p><h2>4. Payment Services</h2><p>Buffet Lounge may use third-party payment service providers to process online payments. Payment providers may collect and process payment information according to their own privacy policies and applicable laws.</p><h2>5. Cookies</h2><p>We may use cookies and similar technologies to:</p><ul><li>Keep you logged in</li><li>Remember preferences</li><li>Understand website usage</li><li>Improve website performance</li><li>Provide relevant offers and content</li></ul><p>You may manage or disable cookies through your browser settings, although some features may not function properly as a result.</p><h2>6. Data Security</h2><p>We take reasonable technical and organizational measures to protect your information from unauthorized access, alteration, disclosure, or destruction.</p><p>However, no internet-based service can guarantee complete security of information.</p><h2>7. Data Sharing</h2><p>We do not sell your personal information as a standalone product.</p><p>Information may be shared with:</p><ul><li>Restaurants</li><li>Delivery/service partners</li><li>Payment gateways</li><li>Hosting and technology providers</li><li>Customer support/service providers</li><li>Government or legal authorities when required by applicable law</li></ul><h2>8. Third-Party Services</h2><p>Buffet Lounge may contain links or integrations with third-party websites and services. We are not responsible for the privacy practices, security, or content of third-party services.</p><p>We recommend reviewing their respective privacy policies before providing information.</p><h2>9. Children\'s Privacy</h2><p>Buffet Lounge is not intended to knowingly collect personal information from children without appropriate parental or guardian involvement.</p><p>If you believe that a child has provided personal information to us improperly, please contact us so that appropriate action can be taken.</p><h2>10. Your Rights</h2><p>Subject to applicable laws, you may have rights to:</p><ul><li>Request access to your personal information</li><li>Request correction of inaccurate information</li><li>Request deletion of certain information</li><li>Withdraw certain permissions or consent</li><li>Opt out of promotional communications</li></ul><p>Requests may be submitted through our customer support/contact channels.</p><h2>11. Changes to This Privacy Policy</h2><p>We may update this Privacy Policy from time to time to reflect changes in our services, technology, or applicable legal requirements.</p><p>Any updated version will be published on this page with a revised <strong>Last Updated</strong> date.</p><h2>12. Contact Us</h2><p>If you have any questions regarding this Privacy Policy, please contact:</p><p><strong>Buffet Lounge</strong><br><strong>Email:</strong> [support@yourdomain.com]<br><strong>Phone:</strong> [+91 XXXXX XXXXX]<br><strong>Address:</strong> [Business Address]</p><h2>Terms &amp; Conditions</h2><p><strong>Last Updated: September 16, 2026</strong></p><p>Welcome to <strong>Buffet Lounge</strong>. These Terms &amp; Conditions govern your use of the Buffet Lounge website, mobile application, and related services.</p><p>By accessing or using Buffet Lounge, you agree to comply with these Terms &amp; Conditions. If you do not agree with any part of these terms, please do not use our services.</p><h2>1. About Buffet Lounge</h2><p>Buffet Lounge is a multi-restaurant platform that allows users to discover restaurants, explore cuisines and menus, and access food-related services available through participating restaurants.</p><p>Restaurants listed on the platform may be independently operated businesses.</p><h2>2. User Account</h2><p>Certain features may require you to create an account.</p><p>You agree to:</p><ul><li>Provide accurate and current information</li><li>Keep your login credentials confidential</li><li>Not share your account with unauthorized persons</li><li>Notify us if you suspect unauthorized access</li><li>Take responsibility for activity conducted through your account</li></ul><p>Buffet Lounge may suspend or terminate accounts involved in fraudulent, abusive, or unauthorized activities.</p><h2>3. Restaurant Information</h2><p>Restaurant names, menus, food descriptions, images, prices, availability, timings, offers, and other information may be provided or updated by participating restaurants.</p><p>While reasonable efforts may be made to maintain accurate information, Buffet Lounge does not guarantee that every listing, menu, price, image, or availability status will always be completely accurate or current.</p><h2>4. Food Orders</h2><p>When you place an order through Buffet Lounge:</p><ol><li>You select the restaurant and food items.</li><li>You provide the required delivery/contact information.</li><li>You select an available payment method.</li><li>The order is submitted for processing.</li><li>The restaurant may accept or reject the order depending on availability and other operational circumstances.</li></ol><p>An order should not be considered finally confirmed until confirmation is provided through the platform or applicable communication channel.</p><h2>5. Prices &amp; Charges</h2><p>Food prices, taxes, delivery charges, platform/service charges, discounts, and other applicable charges may vary depending on the restaurant, location, order, and applicable offers.</p><p>The applicable amount displayed at checkout will generally be the amount payable for the order, subject to correction of genuine errors or applicable adjustments.</p><h2>6. Payments</h2><p>Buffet Lounge may support multiple payment methods, including online payment and/or cash payment where available.</p><p>Online payments may be processed through third-party payment gateways.</p><p>Buffet Lounge is not responsible for temporary failures caused by banks, payment gateways, network providers, or other third-party payment services.</p><h2>7. Order Cancellation</h2><p>Orders may be cancelled subject to the cancellation conditions applicable to the particular restaurant and order.</p><p>Once food preparation has started, cancellation may not be permitted or may be subject to applicable charges.</p><p>Any refund, where applicable, will be processed according to the relevant refund policy and payment provider\'s processing timelines.</p><h2>8. Refunds</h2><p>Refund eligibility may depend on circumstances including:</p><ul><li>Restaurant cancellation</li><li>Incorrect or missing items</li><li>Order not delivered</li><li>Payment failure</li><li>Duplicate payment</li><li>Other verified service issues</li></ul><p>Refund requests may require verification of the order and supporting information.</p><p>Where a refund is approved, the amount may be returned through the original payment method or another applicable method.</p><h2>9. Delivery</h2><p>Delivery availability, estimated delivery time, delivery charges, and delivery areas may vary based on restaurant, location, weather, traffic, demand, and other operational circumstances.</p><p>Any delivery time displayed on the platform may be an estimate and is not necessarily a guaranteed delivery time.</p><h2>10. User Responsibilities</h2><p>You agree not to:</p><ul><li>Use Buffet Lounge for unlawful purposes</li><li>Provide false or misleading information</li><li>Create fraudulent accounts</li><li>Place fake or abusive orders</li><li>Attempt to interfere with the platform</li><li>Access another user\'s account without permission</li><li>Upload harmful or malicious content</li><li>Misuse promotional offers</li><li>Attempt to gain unauthorized access to our systems</li></ul><p>Violation of these terms may result in restriction or termination of access.</p><h2>11. Restaurant Responsibility</h2><p>Participating restaurants are responsible for matters relating to their food and restaurant operations, including where applicable:</p><ul><li>Food preparation</li><li>Food quality</li><li>Ingredients and allergens</li><li>Restaurant hygiene</li><li>Menu accuracy</li><li>Restaurant pricing</li><li>Order acceptance</li><li>Food availability</li></ul><p>Users should contact the restaurant or Buffet Lounge support regarding any applicable issue.</p><h2>12. Food Allergies &amp; Dietary Requirements</h2><p>Users are responsible for informing the restaurant about relevant allergies or dietary requirements before ordering where such communication is available.</p><p>Buffet Lounge does not guarantee that food will be completely free from specific allergens or cross-contamination unless expressly stated by the relevant restaurant.</p><h2>13. Promotions &amp; Offers</h2><p>Buffet Lounge and participating restaurants may provide promotional offers, coupons, discounts, or other campaigns.</p><p>Each promotion may have separate eligibility criteria, validity periods, usage limits, and conditions.</p><p>Buffet Lounge reserves the right to withdraw or modify promotions where permitted by applicable law.</p><h2>14. Intellectual Property</h2><p>The Buffet Lounge name, logo, website design, graphics, software, text, and other platform content may be protected by applicable intellectual-property laws.</p><p>You may not reproduce, copy, modify, distribute, sell, or commercially exploit Buffet Lounge content without appropriate authorization.</p><p>Restaurant names, logos, images, and other third-party materials may belong to their respective owners.</p><h2>15. Platform Availability</h2><p>We aim to keep Buffet Lounge available and functioning properly, but we do not guarantee uninterrupted or error-free operation.</p><p>The platform may occasionally be unavailable due to:</p><ul><li>Maintenance</li><li>Technical issues</li><li>Server problems</li><li>Network failures</li><li>Security incidents</li><li>Third-party service failures</li><li>Circumstances beyond reasonable control</li></ul><h2>16. Limitation of Liability</h2><p>To the extent permitted by applicable law, Buffet Lounge will not be responsible for indirect, incidental, or consequential losses arising from the use or inability to use the platform.</p><p>Nothing in these Terms is intended to exclude or limit any liability that cannot legally be excluded or limited under applicable law.</p><h2>17. Changes to Terms</h2><p>Buffet Lounge may update these Terms &amp; Conditions from time to time.</p><p>Updated terms will be published on this page, and continued use of the platform after changes are published may constitute acceptance of the updated terms, subject to applicable law.</p><h2>18. Governing Law</h2><p>These Terms &amp; Conditions shall be governed by the applicable laws of India.</p><p>Any disputes shall be subject to the jurisdiction of the courts having appropriate jurisdiction over the matter and applicable parties.</p><h2>19. Contact Us</h2><p>For questions, complaints, order-related issues, or other concerns:</p><p><strong>Buffet Lounge</strong><br><strong>Email:</strong> [support@yourdomain.com]<br><strong>Phone:</strong> [+91 XXXXX XXXXX]<br><strong>Address:</strong> [Business Address]</p>', 2, 1, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, NULL, '2026-09-21 19:27:30'),
(2, 'About Us', 'about-us', '<p><strong>About The Buffet Lounge</strong></p><blockquote><p>Welcome to &nbsp;<strong>The</strong> <strong>Buffet Lounge</strong>, your destination to discover restaurants, explore delicious cuisines, and enjoy great food from multiple restaurants in one place.</p><p>&nbsp;</p><p><strong>The Buffet Lounge</strong> brings together a wide variety of restaurants, cuisines, menus, and food options, making it easier for customers to discover what they love.</p><p>&nbsp;</p><p>Whether you\'re looking for Indian, Chinese, Italian, Continental, Fast Food, Mughlai, South Indian, Desserts, Beverages or something new to try, &nbsp;The Buffet Lounge helps you explore Hotels / Restaurants and their menus/buffet conveniently.</p><p>&nbsp;</p><p>Our goal is to make food discovery and ordering <strong>simple, convenient and enjoyable</strong> for everyone.</p><p>&nbsp;</p></blockquote><h3>🍕 Popular Cuisines</h3><ul><li>North Indian / South Indian / Chinese / Mughlai / Punjabi / Italian / Continental / Fast Food / Biryani / Pizza / Burgers / Street Food / Desserts / Bakery / Beverages / Cafe / Healthy Food / Thali / Seafood / BBQ &amp; Grill.</li></ul>', 1, 2, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, NULL, '2026-09-21 19:28:12'),
(3, 'Privacy', 'privacy', '<p><strong>The Buffet Lounge&nbsp;</strong></p><p>&nbsp;</p><p>We respect your privacy and are committed to protecting the personal information you provide while using our website, mobile application, and related services.</p><p>This Privacy Policy explains how Buffet Lounge collects, uses, stores, and protects your information when you browse restaurants, explore cuisines, place orders, make payments, create an account, or use any other services available through our platform.</p><p>&nbsp;</p><h2>1. <strong>Information we Collect</strong></h2><p>We may collect the following information when you use The Buffet Lounge:</p><p>&nbsp;</p><h3><strong>Personal Information</strong></h3><ul><li>Full name</li><li>Email address</li><li>Mobile/phone number</li><li>Delivery address</li><li>Billing information</li><li>Account login information</li><li>&nbsp;</li></ul><h3><strong>Order Information</strong></h3><ul><li>Restaurant selected</li><li>Food items ordered</li><li>Order amount</li><li>Order history</li><li>Delivery details</li><li>Order status</li><li>&nbsp;</li></ul><h3>Payment Information</h3><p>Payments may be processed through third-party payment gateways. The Buffet Lounge may receive transaction-related information such as payment status, transaction ID, and payment method. We do not intentionally store complete debit/credit card details on our servers.</p><p>&nbsp;</p><h3>1. <strong>Device &amp; Technical Information</strong></h3><p>We may automatically collect:</p><ul><li>IP address</li><li>Browser type</li><li>Device information</li><li>Operating system</li><li>Website/app usage information</li><li>Cookies and similar technologies</li><li>&nbsp;</li></ul><h2>2. <strong>How we use your Information</strong></h2><p>Your information may be used to:</p><ul><li>Create and manage your account</li><li>Process and deliver your orders</li><li>Connect you with restaurants and delivery partners</li><li>Process payments</li><li>Provide order updates and notifications</li><li>Respond to customer support requests</li><li>Improve our website and services</li><li>Personalize your experience</li><li>Prevent fraud, misuse, and unauthorized activity</li><li>Send promotional offers where permitted by applicable law</li><li>&nbsp;</li></ul><h2>3. <strong>Restaurant &amp; Delivery Partners</strong></h2><p>To fulfill your order, relevant information such as your name, contact number, delivery address, and order details may be shared with the restaurant and/or delivery partner responsible for processing or delivering your order.</p><p>Such information is shared only to the extent reasonably required to provide the requested service.</p><p>&nbsp;</p><h2>4. <strong>Payment Services</strong></h2><p>Buffet Lounge may use third-party payment service providers to process online payments. Payment providers may collect and process payment information according to their own privacy policies and applicable laws.</p><p>&nbsp;</p><h2>5. <strong>Cookies</strong></h2><p>We may use cookies and similar technologies to:</p><ul><li>Keep you logged in</li><li>Remember preferences</li><li>Understand website usage</li><li>Improve website performance</li><li>Provide relevant offers and content</li></ul><p>You may manage or disable cookies through your browser settings, although some features may not function properly as a result.</p><p>&nbsp;</p><h2>6. <strong>Data Security</strong></h2><p>We take reasonable technical and organizational measures to protect your information from unauthorized access, alteration, disclosure, or destruction.</p><p>However, no internet-based service can guarantee complete security of information.</p><p>&nbsp;</p><h2>7. <strong>Data Sharing</strong></h2><p>We do not sell your personal information as a standalone product.</p><p>Information may be shared with:</p><ul><li>Restaurants</li><li>Delivery/service partners</li><li>Payment gateways</li><li>Hosting and technology providers</li><li>Customer support/service providers</li><li>Government or legal authorities when required by applicable law</li><li>&nbsp;</li></ul><h2>8. <strong>Third-Party Services</strong></h2><p>Buffet Lounge may contain links or integrations with third-party websites and services. We are not responsible for the privacy practices, security, or content of third-party services.</p><p>We recommend reviewing their respective privacy policies before providing information.</p><p>&nbsp;</p><h2>9. <strong>Children\'s Privacy</strong></h2><p>Buffet Lounge is not intended to knowingly collect personal information from children without appropriate parental or guardian involvement.</p><p>If you believe that a child has provided personal information to us improperly, please contact us so that appropriate action can be taken.</p><p>&nbsp;</p><h2>10. <strong>Your Rights</strong></h2><p>Subject to applicable laws, you may have rights to:</p><ul><li>Request access to your personal information</li><li>Request correction of inaccurate information</li><li>Request deletion of certain information</li><li>Withdraw certain permissions or consent</li><li>Opt out of promotional communications</li></ul><p>Requests may be submitted through our customer support/contact channels.</p><p>&nbsp;</p><h2>11. <strong>Changes to This Privacy Policy</strong></h2><p>We may update this Privacy Policy from time to time to reflect changes in our services, technology, or applicable legal requirements.</p><p>Any updated version will be published on this page with a revised <strong>Last Updated</strong> date.</p><p>&nbsp;</p><h2>12. <strong>Contact Us</strong></h2><p>If you have any questions regarding this Privacy Policy, please contact:</p><p><strong>The Buffet Lounge</strong><br><strong>Email:&nbsp;</strong> [support@buffetlounge.com]<br><strong>Phone:</strong> [+91 99532 24486 ]</p>', 2, 2, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, NULL, '2026-09-21 19:29:58'),
(4, 'Contact Us', 'contact-us', '<p><strong>Buffet Lounge Customer Support</strong></p><blockquote><p>Have a question about an order, restaurant, payment or any other issue? Our support team is here to help.</p><p><strong>Email:</strong> <a href=\"mailto:support@buffetlounge.com\">support@buffetlounge.com</a><br><strong>Phone:</strong> 99532 24486<br><strong>Support Hours:</strong> 10:00 AM – 10:00 PM</p><p>For order-related queries, please keep your <strong>Order ID</strong> ready so that our team can assist you quickly.</p></blockquote>', 1, 2, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, NULL, '2026-09-21 19:26:36');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'web', NULL, NULL),
(2, 'category', 'web', NULL, NULL),
(3, 'category_create', 'web', NULL, NULL),
(4, 'category_edit', 'web', NULL, NULL),
(5, 'category_delete', 'web', NULL, NULL),
(6, 'coupon', 'web', NULL, NULL),
(7, 'coupon_create', 'web', NULL, NULL),
(8, 'coupon_edit', 'web', NULL, NULL),
(9, 'coupon_show', 'web', NULL, NULL),
(10, 'coupon_delete', 'web', NULL, NULL),
(11, 'cuisine', 'web', NULL, NULL),
(12, 'cuisine_create', 'web', NULL, NULL),
(13, 'cuisine_edit', 'web', NULL, NULL),
(14, 'cuisine_delete', 'web', NULL, NULL),
(15, 'menu-items', 'web', NULL, NULL),
(16, 'menu-items_create', 'web', NULL, NULL),
(17, 'menu-items_edit', 'web', NULL, NULL),
(18, 'menu-items_delete', 'web', NULL, NULL),
(19, 'menu-items_show', 'web', NULL, NULL),
(20, 'reservation', 'web', NULL, NULL),
(21, 'reservation_create', 'web', NULL, NULL),
(22, 'reservation_edit', 'web', NULL, NULL),
(23, 'reservation_show', 'web', NULL, NULL),
(24, 'reservation_delete', 'web', NULL, NULL),
(25, 'orders', 'web', NULL, NULL),
(26, 'orders_create', 'web', NULL, NULL),
(27, 'orders_edit', 'web', NULL, NULL),
(28, 'orders_delete', 'web', NULL, NULL),
(29, 'orders_show', 'web', NULL, NULL),
(30, 'rating', 'web', NULL, NULL),
(31, 'order-notification', 'web', NULL, NULL),
(32, 'request-products', 'web', NULL, NULL),
(33, 'request-products_create', 'web', NULL, NULL),
(34, 'request-products_edit', 'web', NULL, NULL),
(35, 'request-products_delete', 'web', NULL, NULL),
(36, 'request-products_show', 'web', NULL, NULL),
(37, 'live-orders', 'web', NULL, NULL),
(38, 'complaints', 'web', NULL, NULL),
(39, 'restaurants', 'web', NULL, NULL),
(40, 'restaurants_create', 'web', NULL, NULL),
(41, 'restaurants_edit', 'web', NULL, NULL),
(42, 'restaurants_delete', 'web', NULL, NULL),
(43, 'restaurants_show', 'web', NULL, NULL),
(44, 'qr-code', 'web', NULL, NULL),
(45, 'transaction', 'web', NULL, NULL),
(46, 'customers', 'web', NULL, NULL),
(47, 'customers_create', 'web', NULL, NULL),
(48, 'customers_edit', 'web', NULL, NULL),
(49, 'customers_delete', 'web', NULL, NULL),
(50, 'customers_show', 'web', NULL, NULL),
(51, 'restaurant-owners', 'web', NULL, NULL),
(52, 'restaurant-owners_create', 'web', NULL, NULL),
(53, 'restaurant-owners_edit', 'web', NULL, NULL),
(54, 'restaurant-owners_delete', 'web', NULL, NULL),
(55, 'restaurant-owners_show', 'web', NULL, NULL),
(56, 'restaurant-owner-sales-report', 'web', NULL, NULL),
(57, 'admin-commission-report', 'web', NULL, NULL),
(58, 'credit-balance-report', 'web', NULL, NULL),
(59, 'cash-on-delivery-order-balance-report', 'web', NULL, NULL),
(60, 'customer-report', 'web', NULL, NULL),
(61, 'withdraw-report', 'web', NULL, NULL),
(62, 'delivery-boy-collection-report', 'web', NULL, NULL),
(63, 'reservation-report', 'web', NULL, NULL),
(64, 'banner', 'web', NULL, NULL),
(65, 'banner_create', 'web', NULL, NULL),
(66, 'banner_edit', 'web', NULL, NULL),
(67, 'banner_delete', 'web', NULL, NULL),
(68, 'page', 'web', NULL, NULL),
(69, 'page_create', 'web', NULL, NULL),
(70, 'page_edit', 'web', NULL, NULL),
(71, 'page_delete', 'web', NULL, NULL),
(72, 'setting', 'web', NULL, NULL),
(73, 'collection', 'web', NULL, NULL),
(74, 'collection_create', 'web', NULL, NULL),
(75, 'collection_delete', 'web', NULL, NULL),
(76, 'withdraw', 'web', NULL, NULL),
(77, 'withdraw_create', 'web', NULL, NULL),
(78, 'role', 'web', NULL, NULL),
(79, 'role_create', 'web', NULL, NULL),
(80, 'role_edit', 'web', NULL, NULL),
(81, 'role_delete', 'web', NULL, NULL),
(82, 'role_show', 'web', NULL, NULL),
(83, 'rating', 'web', NULL, NULL),
(84, 'time-slots', 'web', NULL, NULL),
(85, 'time-slots_create', 'web', NULL, NULL),
(86, 'time-slots_edit', 'web', NULL, NULL),
(87, 'time-slots_delete', 'web', NULL, NULL),
(88, 'time-slots_show', 'web', NULL, NULL),
(89, 'tables', 'web', NULL, NULL),
(90, 'tables_create', 'web', NULL, NULL),
(91, 'tables_edit', 'web', NULL, NULL),
(92, 'tables_delete', 'web', NULL, NULL),
(93, 'tables_show', 'web', NULL, NULL),
(94, 'request-withdraw', 'web', NULL, NULL),
(95, 'request-withdraw_create', 'web', NULL, NULL),
(96, 'request-withdraw_edit', 'web', NULL, NULL),
(97, 'request-withdraw_delete', 'web', NULL, NULL),
(98, 'withdraw', 'web', NULL, NULL),
(99, 'withdraw_create', 'web', NULL, NULL),
(100, 'withdraw_delete', 'web', NULL, NULL),
(101, 'administrators', 'web', NULL, NULL),
(102, 'administrators_create', 'web', NULL, NULL),
(103, 'administrators_edit', 'web', NULL, NULL),
(104, 'administrators_delete', 'web', NULL, NULL),
(105, 'administrators_show', 'web', NULL, NULL),
(106, 'delivery-boys', 'web', NULL, NULL),
(107, 'delivery-boys_create', 'web', NULL, NULL),
(108, 'delivery-boys_edit', 'web', NULL, NULL),
(109, 'delivery-boys_delete', 'web', NULL, NULL),
(110, 'delivery-boys_show', 'web', NULL, NULL),
(111, 'addons', 'web', NULL, NULL),
(112, 'addons_create', 'web', NULL, NULL),
(113, 'addons_delete', 'web', NULL, NULL),
(114, 'bank', 'web', NULL, NULL),
(115, 'bank_create', 'web', NULL, NULL),
(116, 'bank_edit', 'web', NULL, NULL),
(117, 'bank_show', 'web', NULL, NULL),
(118, 'bank_delete', 'web', NULL, NULL),
(119, 'language', 'web', NULL, NULL),
(120, 'language_create', 'web', NULL, NULL),
(121, 'language_edit', 'web', NULL, NULL),
(122, 'language_delete', 'web', NULL, NULL),
(123, 'push-notification', 'web', NULL, NULL),
(124, 'push-notification_create', 'web', NULL, NULL),
(125, 'push-notification_delete', 'web', NULL, NULL),
(126, 'update', 'web', NULL, NULL),
(127, 'user', 'web', NULL, NULL),
(128, 'user_create', 'web', NULL, NULL),
(129, 'user_edit', 'web', NULL, NULL),
(130, 'user_delete', 'web', NULL, NULL),
(131, 'user_show', 'web', NULL, NULL),
(132, 'expense', 'web', NULL, NULL),
(133, 'expense_create', 'web', NULL, NULL),
(134, 'expense_edit', 'web', NULL, NULL),
(135, 'expense_delete', 'web', NULL, NULL),
(136, 'expense_show', 'web', NULL, NULL),
(137, 'advertisement', 'web', '2026-09-16 15:51:25', '2026-09-16 15:51:25'),
(138, 'advertisement_create', 'web', '2026-09-16 15:51:25', '2026-09-16 15:51:25'),
(139, 'advertisement_edit', 'web', '2026-09-16 15:51:25', '2026-09-16 15:51:25'),
(140, 'advertisement_delete', 'web', '2026-09-16 15:51:25', '2026-09-16 15:51:25'),
(144, 'plan', 'web', '2026-09-16 17:30:01', '2026-09-16 17:30:01'),
(145, 'plan_create', 'web', '2026-09-16 17:30:01', '2026-09-16 17:30:01'),
(146, 'plan_edit', 'web', '2026-09-16 17:30:01', '2026-09-16 17:30:01'),
(147, 'plan_delete', 'web', '2026-09-16 17:30:01', '2026-09-16 17:30:01'),
(148, 'restaurant_application', 'web', '2026-09-16 17:30:01', '2026-09-16 17:30:01'),
(149, 'restaurant_application_edit', 'web', '2026-09-16 17:30:01', '2026-09-16 17:30:01'),
(151, 'restaurant-application', 'web', '2026-09-19 16:52:19', '2026-09-19 16:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `billing_type` tinyint(3) UNSIGNED NOT NULL COMMENT '5=subscription, 10=commission',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `commission_rate` decimal(5,2) NOT NULL DEFAULT 0.00,
  `trial_days` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`features`)),
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=active, 0=inactive',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `description`, `billing_type`, `price`, `commission_rate`, `trial_days`, `features`, `is_featured`, `status`, `sort`, `created_at`, `updated_at`) VALUES
(1, 'Starter', 'Perfect for small restaurants just getting started', 5, 29.99, 0.00, 14, '[\"Up to 50 menu items\", \"Basic analytics\", \"QR code menu\", \"Email support\", \"14-day free trial\"]', 0, 1, 1, '2026-09-16 17:30:01', '2026-09-16 17:30:01'),
(2, 'Professional', 'Best for growing hotels and restaurants', 5, 79.99, 0.00, 7, '[\"Unlimited menu items\", \"Advanced analytics\", \"Priority support\", \"Custom QR code\", \"Reservation management\", \"7-day free trial\"]', 1, 1, 2, '2026-09-16 17:30:01', '2026-09-16 17:30:01'),
(3, 'Commission', 'No upfront cost — we only earn when you do', 10, 0.00, 12.00, 0, '[\"No monthly fee\", \"12% commission per order\", \"All features included\", \"Dedicated account manager\"]', 0, 1, 3, '2026-09-16 17:30:01', '2026-09-16 17:30:01');

-- --------------------------------------------------------

--
-- Table structure for table `push_notifications`
--

CREATE TABLE `push_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qr_codes`
--

CREATE TABLE `qr_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `style` varchar(15) DEFAULT 'square',
  `eye_style` varchar(15) DEFAULT 'square',
  `color` varchar(191) DEFAULT '0,0,0',
  `background_color` varchar(191) DEFAULT '255,255,255',
  `mode` varchar(191) DEFAULT NULL,
  `qrcode_text` varchar(191) DEFAULT NULL,
  `qrcode_logo` longtext DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qr_codes`
--

INSERT INTO `qr_codes` (`id`, `restaurant_id`, `style`, `eye_style`, `color`, `background_color`, `mode`, `qrcode_text`, `qrcode_logo`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 6, 'square', 'square', '0,0,0', '255,255,255', NULL, NULL, NULL, 'App\\Models\\User', 7, 'App\\Models\\User', 7, '2026-09-18 15:41:15', '2026-09-18 15:41:15'),
(2, 7, 'square', 'square', '0,0,0', '255,255,255', NULL, NULL, NULL, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-19 22:33:57', '2026-09-19 22:33:57'),
(3, 8, 'square', 'square', '0,0,0', '255,255,255', NULL, NULL, NULL, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-10-04 01:05:25', '2026-10-04 01:05:25');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_withdraw`
--

CREATE TABLE `request_withdraw` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `reservation_date` date NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `time_slot_id` bigint(20) UNSIGNED NOT NULL,
  `table_id` bigint(20) UNSIGNED NOT NULL,
  `guest_number` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `waiter_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_agent` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `lat` varchar(191) DEFAULT NULL,
  `long` varchar(191) DEFAULT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `current_status` tinyint(3) UNSIGNED NOT NULL,
  `delivery_status` tinyint(3) UNSIGNED NOT NULL,
  `pickup_status` tinyint(3) UNSIGNED NOT NULL,
  `table_status` tinyint(3) UNSIGNED NOT NULL,
  `applied` tinyint(1) DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `waiter_status` tinyint(3) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `user_id`, `name`, `slug`, `description`, `lat`, `long`, `opening_time`, `closing_time`, `address`, `status`, `current_status`, `delivery_status`, `pickup_status`, `table_status`, `applied`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`, `waiter_status`, `deleted_at`) VALUES
(1, 3, 'The Royal Spice', 'the-royal-spice', 'Authentic North Indian and Mughlai cuisine with delicious tandoori specialties.', '28.6419', '77.1200', '10:00:00', '23:00:00', 'Rajouri Garden, New Delhi', 5, 5, 5, 5, 5, 1, '1', 1, 'App\\Models\\User', 1, '2026-09-16 07:07:57', '2026-09-16 12:40:49', 5, NULL),
(2, 3, 'Urban Tadka', 'urban-tadka', 'A modern Indian restaurant serving Punjabi, North Indian and vegetarian dishes.', '28.6304', '77.2773', '11:00:00', '23:30:00', 'Connaught Place, New Delhi', 5, 5, 5, 5, 5, 1, '1', 1, 'App\\Models\\User', 1, '2026-09-16 07:07:57', '2026-09-16 12:40:33', 5, NULL),
(3, 3, 'Wok & Roll', 'wok-roll', 'Delicious Chinese, Thai and Indo-Chinese dishes prepared with fresh ingredients.', '28.5672', '77.2431', '11:00:00', '23:00:00', 'Lajpat Nagar, New Delhi', 5, 5, 5, 5, 5, 1, '1', 1, 'App\\Models\\User', 1, '2026-09-16 07:07:57', '2026-09-16 12:40:17', 5, NULL),
(4, 3, 'La Bella Italia', 'la-bella-italia', 'A cozy Italian restaurant serving fresh pizzas, pasta and continental dishes.', '28.5244', '77.2066', '12:00:00', '23:30:00', 'Saket, New Delhi', 5, 5, 5, 5, 5, 1, '1', 1, 'App\\Models\\User', 1, '2026-09-16 07:07:57', '2026-09-16 12:39:41', 5, NULL),
(5, 3, 'BBQ Nation House', 'bbq-nation-house', 'Family restaurant offering BBQ, grilled dishes, biryani and buffet specialties.', '28.5921', '77.0460', '11:00:00', '23:30:00', 'Dwarka, New Delhi', 5, 5, 5, 5, 5, 1, '1', 1, 'App\\Models\\User', 1, '2026-09-16 07:07:57', '2026-09-16 12:39:55', 5, NULL),
(6, 7, 'Hotel Ginger', 'hotel-ginger', NULL, '28.620560006124045', '77.42515345151176', '10:00:00', '14:00:00', 'Delhi', 5, 5, 5, 5, 5, 1, 'App\\Models\\User', 7, 'App\\Models\\User', 1, '2026-09-18 15:41:15', '2026-09-18 20:33:59', 5, NULL),
(7, 9, 'Ayush', 'ayush', 'Hotel', NULL, NULL, NULL, NULL, 'idw, nkje, new', 5, 5, 5, 5, 10, 1, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-19 22:33:57', '2026-09-19 22:33:57', 0, NULL),
(8, 10, 'cafe the aanchal', 'cafe-the-aanchal', 'Cafe — chinese,coffe', NULL, NULL, NULL, NULL, 'badshahpur haryana, haryana, india', 5, 5, 5, 5, 10, 1, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-10-04 01:05:25', '2026-10-04 01:05:25', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_applications`
--

CREATE TABLE `restaurant_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `business_name` varchar(200) NOT NULL,
  `business_type` varchar(100) DEFAULT NULL,
  `cuisine_type` varchar(200) DEFAULT NULL,
  `business_address` longtext NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `business_registration_number` varchar(100) DEFAULT NULL,
  `tax_id` varchar(100) DEFAULT NULL,
  `food_license_number` varchar(100) DEFAULT NULL,
  `owner_name` varchar(200) NOT NULL,
  `owner_phone` varchar(30) NOT NULL,
  `owner_email` varchar(150) NOT NULL,
  `business_phone` varchar(30) DEFAULT NULL,
  `plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_type` tinyint(3) UNSIGNED DEFAULT NULL COMMENT '5=subscription, 10=commission',
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_transaction_id` varchar(200) DEFAULT NULL,
  `amount_paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_status` varchar(30) NOT NULL DEFAULT 'pending',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=pending, 1=approved, 2=rejected',
  `rejection_reason` text DEFAULT NULL,
  `reviewed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_applications`
--

INSERT INTO `restaurant_applications` (`id`, `user_id`, `business_name`, `business_type`, `cuisine_type`, `business_address`, `city`, `state`, `country`, `zip_code`, `website`, `business_registration_number`, `tax_id`, `food_license_number`, `owner_name`, `owner_phone`, `owner_email`, `business_phone`, `plan_id`, `billing_type`, `payment_method`, `payment_transaction_id`, `amount_paid`, `payment_status`, `status`, `rejection_reason`, `reviewed_by`, `reviewed_at`, `notes`, `created_at`, `updated_at`) VALUES
(1, 9, 'Ayush', 'Hotel', NULL, 'idw', 'nkje', NULL, 'new', NULL, NULL, NULL, NULL, NULL, 'n', '9876545367', 'ayush@gmail.com', NULL, 2, 5, NULL, NULL, 79.99, 'pending', 1, NULL, 1, '2026-09-19 22:33:57', NULL, '2026-09-16 23:13:56', '2026-09-19 22:33:57'),
(2, 10, 'cafe the aanchal', 'Cafe', 'chinese,coffe', 'badshahpur haryana', 'haryana', 'haryana', 'india', '20', NULL, '1223445555', '44554554', '1233456', 'AYUSHMAN MISHRA', '+91123456789', 'ayushmanmihraji1@gmail.com', '9555790855', 2, 5, NULL, NULL, 79.99, 'pending', 1, NULL, 1, '2026-10-04 01:05:25', NULL, '2026-10-04 00:54:09', '2026-10-04 01:05:25');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_cuisines`
--

CREATE TABLE `restaurant_cuisines` (
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `cuisine_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_cuisines`
--

INSERT INTO `restaurant_cuisines` (`restaurant_id`, `cuisine_id`) VALUES
(1, 8),
(1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_ratings`
--

CREATE TABLE `restaurant_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `review` text DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(2, 'Customer', 'web', '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(3, 'Restaurant Owner', 'web', '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(4, 'Delivery Boy', 'web', '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(5, 'Waiter', 'web', '2026-09-14 23:12:23', '2026-09-14 23:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(151, 1),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(37, 3),
(38, 3),
(39, 3),
(43, 3),
(44, 3),
(45, 3),
(56, 3),
(64, 3),
(65, 3),
(66, 3),
(67, 3),
(76, 3),
(83, 3),
(84, 3),
(85, 3),
(86, 3),
(87, 3),
(88, 3),
(89, 3),
(90, 3),
(91, 3),
(92, 3),
(93, 3),
(94, 3),
(95, 3),
(96, 3),
(98, 3),
(1, 4),
(25, 4),
(27, 4),
(29, 4),
(31, 4),
(45, 4),
(76, 4),
(94, 4),
(95, 4),
(96, 4),
(98, 4);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `purchase_code` varchar(80) DEFAULT NULL,
  `supported_until` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `purchase_code`, `supported_until`) VALUES
(1, 'site_name', 'Buffet Lounge', NULL, NULL),
(2, 'site_email', 'info@buffetlounge.com', NULL, NULL),
(3, 'site_phone_number', '+919953224486', NULL, NULL),
(4, 'site_logo', '/tmp/phpjfGsZ4', NULL, NULL),
(5, 'fav_icon', '/tmp/phpHuAItN', NULL, NULL),
(6, 'site_address', 'Delhi', NULL, NULL),
(7, 'site_footer', 'All Rights Reserved @ The Buffet Lounge', NULL, NULL),
(8, 'site_description', 'Organic & Tasty Food for your Table.', NULL, NULL),
(9, 'currency_name', 'INR', NULL, NULL),
(10, 'currency_code', '₹', NULL, NULL),
(11, 'locale', 'en', NULL, NULL),
(12, 'geolocation_distance_radius', '20', NULL, NULL),
(13, 'order_commission_percentage', '5', NULL, NULL),
(14, 'free_delivery_radius', '0', NULL, NULL),
(15, 'charge_per_kilo', '5', NULL, NULL),
(16, 'basic_delivery_charge', '3', NULL, NULL),
(17, 'timezone', 'Asia/Kolkata', NULL, NULL),
(18, 'frontend_theme', 'default', NULL, NULL),
(19, 'twilio_disabled', '1', NULL, NULL),
(20, 'stripe_key', 'pk_test_Kqmq6XXBwdoYJFLV1CSDnaxz', NULL, NULL),
(21, 'stripe_secret', 'REDACTED', NULL, NULL),
(22, 'razorpay_key', 'rzp_test_eeBR6yhSmKHB65', NULL, NULL),
(23, 'razorpay_secret', 'REDACTED', NULL, NULL),
(24, 'paystack_public_key', 'pk_test_370ce5565f2a937efae6314df2dccba2781bfa69', NULL, NULL),
(25, 'paystack_secret_key', 'REDACTED', NULL, NULL),
(26, 'paypal_app_id', 'sb-qzxs18789565@business.example.com', NULL, NULL),
(27, 'paypal_client_id', 'AbcV-BG5b30hjofcp2dj41GB1OYXE8_9-egRlV8z4R7vHiA-1mgL3Fvj3pkrOJyq0dC_vHNRAh_tp74p', NULL, NULL),
(28, 'paypal_client_secret', 'REDACTED', NULL, NULL),
(29, 'paypal_mode', 'sandbox', NULL, NULL),
(30, 'paytm_environment', 'sandbox', NULL, NULL),
(31, 'paytm_merchant_id', 'MhjqFc42556626519745', NULL, NULL),
(32, 'paytm_merchant_key', 'REDACTED', NULL, NULL),
(33, 'paytm_merchant_website', 'WEBSTAGING', NULL, NULL),
(34, 'paytm_channel', 'WEB', NULL, NULL),
(35, 'paytm_industry_type', 'Retail', NULL, NULL),
(36, 'phonepe_merchant_id', 'PGTESTPAYUAT', NULL, NULL),
(37, 'phonepe_merchant_user_id', 'MUID123', NULL, NULL),
(38, 'phonepe_env', 'sandbox', NULL, NULL),
(39, 'phonepe_salt_key', 'REDACTED', NULL, NULL),
(40, 'phonepe_salt_index', '1', NULL, NULL),
(41, 'sslcommerz_store_name', 'testfoodkp1pi', NULL, NULL),
(42, 'sslcommerz_store_id', 'foodk6472ed754a400', NULL, NULL),
(43, 'sslcommerz_store_password', 'REDACTED', NULL, NULL),
(44, 'sslcommerz_mode', 'sandbox', NULL, NULL),
(45, 'order_attachment_checking', '5', NULL, NULL),
(46, 'delivery_boy_order_amount_limit', '10000', NULL, NULL),
(47, 'mail_from_name', 'inilabs', NULL, NULL),
(48, 'mail_from_address', 'demo@food-bank.xyz', NULL, NULL),
(49, 'mail_disabled', '1', NULL, NULL),
(50, 'firebase_api_key', 'REDACTED', NULL, NULL),
(51, 'firebase_authDomain', 'new-project-3e70e.firebaseapp.com', NULL, NULL),
(52, 'projectId', 'new-project-3e70e', NULL, NULL),
(53, 'storageBucket', 'new-project-3e70e.appspot.com', NULL, NULL),
(54, 'messagingSenderId', '874879259832', NULL, NULL),
(55, 'appId', '1:874879259832:web:3626882efc52d6c133904d', NULL, NULL),
(56, 'measurementId', 'G-DSCN9Z36TR', NULL, NULL),
(57, 'notification_fcm_json_file', 'service-account-file.json', NULL, NULL),
(58, 'facebook_key', '2146804022138583', NULL, NULL),
(59, 'facebook_secret', 'REDACTED', NULL, NULL),
(60, 'facebook_url', 'https://demo.food-bank.xyz/auth/facebook/callback', NULL, NULL),
(61, 'google_map_api_key', 'REDACTED', NULL, NULL),
(62, 'google_key', '86610761817-238dkiq3fnutpugklq5mtthan6gc0qo2.apps.googleusercontent.com', NULL, NULL),
(63, 'google_secret', 'REDACTED', NULL, NULL),
(64, 'google_url', 'https://demo.food-bank.xyz/auth/google/callback', NULL, NULL),
(65, 'otp_type_checking', 'email', NULL, NULL),
(66, 'otp_digit_limit', '6', NULL, NULL),
(67, 'otp_expire_time', '10', NULL, NULL),
(68, 'settingtypesocial', 'facebook', NULL, NULL),
(69, 'facebook', 'https://www.facebook.com/', NULL, NULL),
(70, 'instagram', 'https://www.instagram.com/', NULL, NULL),
(71, 'youtube', 'https://www.youtube.com', NULL, NULL),
(72, 'twitter', 'https://twitter.com/', NULL, NULL),
(73, 'billing-type', '10', NULL, NULL),
(74, 'support_phone', '+919953224486', NULL, NULL),
(75, 'customer_app_name', 'Customer', NULL, NULL),
(76, 'customer_app_logo', 'seeder/settings/logo.png', NULL, NULL),
(77, 'customer_splash_screen_logo', 'seeder/settings/logo.png', NULL, NULL),
(78, 'vendor_app_name', 'Vendor', NULL, NULL),
(79, 'vendor_app_logo', 'seeder/settings/logo.png', NULL, NULL),
(80, 'vendor_splash_screen_logo', 'seeder/settings/logo.png', NULL, NULL),
(81, 'delivery_app_name', 'Delivery', NULL, NULL),
(82, 'delivery_app_logo', 'seeder/settings/logo.png', NULL, NULL),
(83, 'delivery_splash_screen_logo', 'seeder/settings/logo.png', NULL, NULL),
(84, 'banner_title', 'Organic & Tasty Food on your Table', NULL, NULL),
(85, 'banner_image', 'seeder/settings/hero.png', NULL, NULL),
(86, 'app_mockup', 'seeder/settings/mockup.png', NULL, NULL),
(89, 'license_code', 'borwbtoy-mcuh-ssvu-yb46-gn7vlyx8jmbb', NULL, NULL),
(90, 'site_footer_logo', '/tmp/phpHuAItN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `path` varchar(191) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 10,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `capacity` int(11) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `restaurant_id`, `name`, `capacity`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Table 1', 5, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-17 21:28:52', '2026-09-17 21:28:52'),
(2, 2, 'Table 5', 10, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-18 20:29:37', '2026-09-18 20:29:37'),
(3, 3, 'Table 6', 2, 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-18 20:30:00', '2026-09-18 20:30:00'),
(4, 6, 'Buffet Menu', 10, 5, 'App\\Models\\User', 7, 'App\\Models\\User', 7, '2026-09-21 23:35:49', '2026-09-21 23:35:49');

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'default', NULL, NULL),
(2, 'about', NULL, NULL),
(3, 'contact', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_slots`
--

INSERT INTO `time_slots` (`id`, `restaurant_id`, `start_time`, `end_time`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 1, '10:33:00', '23:34:00', 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-17 21:32:28', '2026-09-17 21:32:28'),
(2, 2, '01:22:00', '02:35:00', 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-17 21:35:35', '2026-10-04 01:23:30'),
(3, 3, '10:30:00', '22:30:00', 5, 'App\\Models\\User', 1, 'App\\Models\\User', 1, '2026-09-18 20:31:02', '2026-09-18 20:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `source_balance_id` bigint(20) UNSIGNED DEFAULT NULL,
  `destination_balance_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `meta` text DEFAULT NULL,
  `invoice_id` char(36) NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `balance_id` int(11) NOT NULL,
  `device_token` longtext DEFAULT NULL,
  `web_token` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `applied` tinyint(3) UNSIGNED NOT NULL DEFAULT 10,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `country_code_name` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `email_verified_at`, `password`, `phone`, `address`, `balance_id`, `device_token`, `web_token`, `status`, `applied`, `last_login_at`, `remember_token`, `created_at`, `updated_at`, `provider`, `provider_id`, `country_code`, `country_code_name`) VALUES
(1, 'Admin', 'Admin', 'admin@gmail.com', 'admin', NULL, '$2y$10$xGuVZ1BuDuxsDYeMKLBDruTcx1r4Yok6vH4xhNEQhIOoEja/beksG', '9953224486', 'Delhi', 1, NULL, 'fg4gi6wQfpEeNHUO4RHh-2:APA91bGwdp5uWZ-9eMfiMvWo-acMUCQ8j9Kc4SzynXT2qKzRfVfWAcGAhktjFOhNPAqrfCYAS0hxH7tZy_TQJtvdkVDm0JVkRAI5LgK1Euvp8MsD6y_IPwM', 5, 10, NULL, '7aNhW5wI1nu889XTxHpZpvH7KV4eNoVVFdAqn0mj5QQEqPB2xQVOkykB1bXC', '2026-09-14 23:12:23', '2026-10-04 00:31:45', NULL, NULL, '880', 'bd'),
(2, 'Jack J.', 'Smith', 'customer@example.com', 'customer', NULL, '$2y$10$296lKuW/1rj0Q9IYfsBPVOiaFotWim1I4WKwtLj3AsR4xpAYg2T5u', '115675675657', 'Dhaka, Bangladesh', 2, NULL, NULL, 5, 10, NULL, 'lu7xVse6oF', '2026-09-14 23:12:23', '2026-09-14 23:12:23', NULL, NULL, '880', 'bd'),
(3, 'Richard P.', 'Gonzales', 'restaurantowner1@example.com', 'restaurantowner1', NULL, '$2y$10$D4qgNZCkdIyyMsjjU/ZiT.h.17.QuIfLaS0ZBfQUpFIQBBb/GJTsa', '453457567567', '1250 W 72nd St, New York, United State', 3, NULL, NULL, 5, 10, NULL, 'foArga1fI0', '2026-09-14 23:12:23', '2026-09-14 23:12:23', NULL, NULL, '880', 'bd'),
(4, 'Fabian C.', 'Williams', 'deliveryboy@example.com', 'delivery', NULL, '$2y$10$TY6/CaV7paBlVIepwAxS3euK1xsu1vbxtA7pD5lv9tjxTMX02T/02', '15005550007', 'Dhaka, Bangladesh', 4, NULL, NULL, 5, 10, NULL, 'xG9SJRhbX2', '2026-09-14 23:12:23', '2026-09-14 23:12:23', NULL, NULL, '880', 'bd'),
(5, 'Waiter', 'Waiter', 'waiter@example.com', 'waiter', NULL, '$2y$10$KZJirtlHepLWTm4n1nkRHOdYEuKzWmTLSQ6tEriIO3V1hKfcXLEIu', '15005550007', 'Dhaka, Bangladesh', 5, NULL, NULL, 5, 10, NULL, '53ItWmIwIc', '2026-09-14 23:12:23', '2026-09-14 23:12:23', NULL, NULL, '880', 'bd'),
(6, 'Godwin', 'Lobo', 'godwinloboindia@gmail.com', 'godwinlobo', NULL, '$2y$10$Ej5ae9U7YxImo3dTABAHXOq9pJ5qeZWQODSMQp/oBTdRCjkRQenL2', '995-322-4486', 'Gaur City 2', 6, NULL, 'dP0iAbIrVGzDzFM-ukAxq7:APA91bGDZnU8em6FvLrQFek3nGme57zIMrFN_Nq8APjmWRFCQHt7RiBhMdHEMAS6sPfZ-TsSpBfhrjheLQD8Y1d_RM6WsAAEenVt1ctT0NVrpxk2uMZXoVs', 5, 10, NULL, NULL, '2026-09-16 18:06:24', '2026-09-21 23:44:59', NULL, NULL, '91', 'in'),
(7, 'Godwin', 'Lobo', 'rgodwinlobo@yahoo.co.in', 'godwin', NULL, '$2y$10$S580jpAkDQX5wUNKC0yx2evJDdbUovjCM4JaPXwSnHNLXe2XbnomC', '9953224486', 'Gaur City 2', 7, NULL, 'dP0iAbIrVGzDzFM-ukAxq7:APA91bGDZnU8em6FvLrQFek3nGme57zIMrFN_Nq8APjmWRFCQHt7RiBhMdHEMAS6sPfZ-TsSpBfhrjheLQD8Y1d_RM6WsAAEenVt1ctT0NVrpxk2uMZXoVs', 5, 10, NULL, NULL, '2026-09-16 19:09:04', '2026-09-21 23:45:39', NULL, NULL, '91', 'in'),
(8, 'Ayush', 'Ayush', 'A@gmail.com', 'hshs@gmail.com', NULL, '$2y$10$U9S4AjD6NqRSDNHPlZqwFuzgQTlvoOLnNuYFiMebWPNZ5lGD82mwW', '9876543245', 'hdwh', 8, NULL, NULL, 5, 10, NULL, NULL, '2026-09-16 19:11:16', '2026-09-19 22:31:08', NULL, NULL, '91', 'in'),
(9, 'Ayush', 'Ayush', 'ayush@gmail.com', 'ayush', NULL, '$2y$10$SXG13jpiGzJteYJ7MZ5EaeVNBYNryqay3dkB8um5hX6IzRSIddI/u', '9876545654', 'hjiewi', 9, NULL, NULL, 5, 10, NULL, NULL, '2026-09-16 23:13:56', '2026-09-19 22:33:57', NULL, NULL, '1', 'us'),
(10, 'Ayushman', 'Mishra', 'ayushmanmishraji1@gmail.com', 'ayushman18', NULL, '$2y$10$0gCgLhHWH7gqmJxVW5LE.u0BORHI2ZDeEo38DFHy1bulGnByDTcN2', '9555790855', 'badshahpur gurugram haryana', 10, NULL, NULL, 5, 10, NULL, NULL, '2026-10-04 00:54:09', '2026-10-04 01:05:25', NULL, NULL, '1', 'us'),
(11, 'AYUSH2', 'NEW', 'ayushmanmishraji@gmail.com', 'AYUSH22', NULL, '$2y$10$7z4xjnNTDXYBU7gf.QcpIu/Y.cRe3gvSPhUryW6Jl77X6W0MfAlly', '1234567890', 'SHIV SHAKTI PG AND HOSTEL', 11, NULL, NULL, 5, 10, NULL, NULL, '2026-10-04 01:18:21', '2026-10-04 01:18:21', NULL, NULL, '1', 'us');

-- --------------------------------------------------------

--
-- Table structure for table `user_deposits`
--

CREATE TABLE `user_deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `deposit_amount` decimal(13,2) NOT NULL DEFAULT 0.00,
  `limit_amount` decimal(13,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_deposits`
--

INSERT INTO `user_deposits` (`id`, `user_id`, `deposit_amount`, `limit_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 0.00, 0.00, '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(2, 2, 0.00, 0.00, '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(3, 3, 0.00, 0.00, '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(4, 4, 0.00, 0.00, '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(5, 5, 0.00, 0.00, '2026-09-14 23:12:23', '2026-09-14 23:12:23'),
(6, 6, 0.00, 0.00, '2026-09-16 18:06:24', '2026-09-16 18:06:24'),
(7, 7, 0.00, 0.00, '2026-09-16 19:09:04', '2026-09-16 19:09:04'),
(8, 8, 0.00, 0.00, '2026-09-16 19:11:16', '2026-09-16 19:11:16'),
(9, 9, 0.00, 0.00, '2026-09-16 23:13:56', '2026-09-16 23:13:56'),
(10, 10, 0.00, 0.00, '2026-10-04 00:54:09', '2026-10-04 00:54:09'),
(11, 11, 0.00, 0.00, '2026-10-04 01:18:21', '2026-10-04 01:18:21');

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `payment_type` tinyint(3) UNSIGNED NOT NULL,
  `amount` double(13,2) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `request_withdraw_id` bigint(20) UNSIGNED NOT NULL,
  `creator_type` varchar(191) NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `addresses_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisements_position_index` (`position`),
  ADD KEY `advertisements_status_index` (`status`),
  ADD KEY `advertisements_sort_index` (`sort`);

--
-- Indexes for table `backend_menus`
--
ALTER TABLE `backend_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `balances`
--
ALTER TABLE `balances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `balances_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `balances_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banks_account_number_unique` (`account_number`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `banners_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `best_selling_category`
--
ALTER TABLE `best_selling_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `categories_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collection_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `collection_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_slug_unique` (`slug`),
  ADD KEY `coupons_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `coupons_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `cuisines`
--
ALTER TABLE `cuisines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cuisines_slug_unique` (`slug`),
  ADD KEY `cuisines_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `cuisines_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `delivery_boy_accounts`
--
ALTER TABLE `delivery_boy_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_status_histories`
--
ALTER TABLE `delivery_status_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `footer_menu_sections`
--
ALTER TABLE `footer_menu_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `invoices_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_name_unique` (`name`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indexes for table `ledgers`
--
ALTER TABLE `ledgers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ledgers_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `ledgers_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_items_slug_unique` (`slug`),
  ADD KEY `menu_items_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `menu_items_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `menu_item_options`
--
ALTER TABLE `menu_item_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_item_variations`
--
ALTER TABLE `menu_item_variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_histories`
--
ALTER TABLE `order_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_line_items`
--
ALTER TABLE `order_line_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`),
  ADD KEY `pages_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `pages_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plans_status_index` (`status`),
  ADD KEY `plans_sort_index` (`sort`);

--
-- Indexes for table `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `push_notifications_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `push_notifications_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qr_codes_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `qr_codes_editor_type_editor_id_index` (`editor_type`,`editor_id`),
  ADD KEY `qr_codes_restaurant_id_index` (`restaurant_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `reports_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `request_withdraw`
--
ALTER TABLE `request_withdraw`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_withdraw_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `request_withdraw_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservations_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `reservations_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restaurants_slug_unique` (`slug`),
  ADD KEY `restaurants_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `restaurants_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `restaurant_applications`
--
ALTER TABLE `restaurant_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ra_user_id_index` (`user_id`),
  ADD KEY `ra_status_index` (`status`),
  ADD KEY `ra_plan_id_index` (`plan_id`);

--
-- Indexes for table `restaurant_ratings`
--
ALTER TABLE `restaurant_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_ratings_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `restaurant_ratings_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tables_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `tables_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_slots_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `time_slots_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `transactions_editor_type_editor_id_index` (`editor_type`,`editor_id`),
  ADD KEY `transactions_invoice_id_index` (`invoice_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_deposits`
--
ALTER TABLE `user_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraws_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `withdraws_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `backend_menus`
--
ALTER TABLE `backend_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `balances`
--
ALTER TABLE `balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `best_selling_category`
--
ALTER TABLE `best_selling_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `collection`
--
ALTER TABLE `collection`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cuisines`
--
ALTER TABLE `cuisines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `delivery_boy_accounts`
--
ALTER TABLE `delivery_boy_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_status_histories`
--
ALTER TABLE `delivery_status_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `footer_menu_sections`
--
ALTER TABLE `footer_menu_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ledgers`
--
ALTER TABLE `ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `menu_item_options`
--
ALTER TABLE `menu_item_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_item_variations`
--
ALTER TABLE `menu_item_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_histories`
--
ALTER TABLE `order_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_line_items`
--
ALTER TABLE `order_line_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `push_notifications`
--
ALTER TABLE `push_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qr_codes`
--
ALTER TABLE `qr_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_withdraw`
--
ALTER TABLE `request_withdraw`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `restaurant_applications`
--
ALTER TABLE `restaurant_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `restaurant_ratings`
--
ALTER TABLE `restaurant_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_deposits`
--
ALTER TABLE `user_deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `restaurant_applications`
--
ALTER TABLE `restaurant_applications`
  ADD CONSTRAINT `ra_plan_fk` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ra_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
