-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2021 at 02:42 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eub`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deletable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `description`, `deletable`, `created_at`, `updated_at`) VALUES
(1, 'backend-sidebar', 'This is backend sidebar', 0, '2021-05-08 11:08:10', '2021-05-08 11:08:10');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('item','divider') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'item',
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `divider_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `type`, `parent_id`, `order`, `title`, `divider_title`, `url`, `target`, `icon_class`, `created_at`, `updated_at`) VALUES
(1, 1, 'divider', NULL, 1, NULL, 'Menus', NULL, '_self', NULL, '2021-05-08 11:08:10', '2021-06-17 00:54:29'),
(2, 1, 'item', NULL, 7, 'Dashboard', NULL, '/app/dashboard', '_self', 'pe-7s-rocket', '2021-05-08 11:08:10', '2021-07-05 04:55:14'),
(3, 1, 'item', NULL, 2, 'Pages', NULL, '/app/pages', '_self', 'pe-7s-news-paper', '2021-05-08 11:08:10', '2021-07-05 04:55:13'),
(4, 1, 'divider', NULL, 4, NULL, 'Access Control', NULL, '_self', NULL, '2021-05-08 11:08:10', '2021-07-05 04:55:13'),
(5, 1, 'item', NULL, 5, 'Roles', NULL, '/app/roles', '_self', 'pe-7s-check', '2021-05-08 11:08:10', '2021-07-05 04:55:13'),
(6, 1, 'item', NULL, 6, 'Users', NULL, '/app/users', '_self', 'pe-7s-users', '2021-05-08 11:08:10', '2021-07-05 04:55:13'),
(7, 1, 'divider', NULL, 8, NULL, 'System', NULL, '_self', NULL, '2021-05-08 11:08:10', '2021-05-08 11:10:35'),
(8, 1, 'item', NULL, 9, 'Menus', NULL, '/app/menus', '_self', 'pe-7s-menu', '2021-05-08 11:08:10', '2021-05-08 11:10:35'),
(9, 1, 'item', NULL, 10, 'Backups', NULL, '/app/backups', '_self', 'pe-7s-cloud', '2021-05-08 11:08:10', '2021-05-08 11:10:35'),
(10, 1, 'item', NULL, 11, 'Settings', NULL, '/app/settings/general', '_self', 'pe-7s-settings', '2021-05-08 11:08:10', '2021-05-08 11:10:35'),
(11, 1, 'item', NULL, 3, 'Project', NULL, '/app/project', '_self', 'pe-7s-news-paper', '2021-05-08 11:10:31', '2021-07-05 04:55:13');

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
(4, '2020_05_01_135000_create_modules_table', 1),
(5, '2020_05_01_135056_create_permissions_table', 1),
(6, '2020_05_01_135107_create_roles_table', 1),
(7, '2020_05_01_135124_create_permission_role_table', 1),
(8, '2020_05_01_135153_create_menus_table', 1),
(9, '2020_05_01_135218_create_menu_items_table', 1),
(10, '2020_05_01_135232_create_pages_table', 1),
(11, '2020_05_01_135249_create_settings_table', 1),
(12, '2020_05_02_103131_create_media_table', 1),
(13, '2021_05_08_150419_create_projects_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin Dashboard', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(2, 'Settings', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(3, 'Profile', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(4, 'Backups', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(5, 'Role Management', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(6, 'User Management', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(7, 'Page Management', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(8, 'Menu Management', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(9, 'Project Management', '2021-05-08 11:08:10', '2021-05-08 11:08:10');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `module_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Access Dashboard', 'app.dashboard', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(2, 2, 'Access Settings', 'app.settings.index', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(3, 2, 'Update Settings', 'app.settings.update', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(4, 3, 'Update Profile', 'app.profile.update', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(5, 3, 'Update Password', 'app.profile.password', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(6, 4, 'Access Backups', 'app.backups.index', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(7, 4, 'Create Backups', 'app.backups.create', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(8, 4, 'Download Backups', 'app.backups.download', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(9, 4, 'Delete Backups', 'app.backups.destroy', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(10, 5, 'Access Roles', 'app.roles.index', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(11, 5, 'Create Role', 'app.roles.create', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(12, 5, 'Edit Role', 'app.roles.edit', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(13, 5, 'Delete Role', 'app.roles.destroy', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(14, 6, 'Access Users', 'app.users.index', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(15, 6, 'Create User', 'app.users.create', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(16, 6, 'Edit User', 'app.users.edit', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(17, 6, 'Delete User', 'app.users.destroy', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(18, 7, 'Access Pages', 'app.pages.index', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(19, 7, 'Create Page', 'app.pages.create', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(20, 7, 'Edit Page', 'app.pages.edit', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(21, 7, 'Delete Page', 'app.pages.destroy', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(22, 8, 'Access Menus', 'app.menus.index', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(23, 8, 'Create Menu', 'app.menus.create', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(24, 8, 'Edit Menu', 'app.menus.edit', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(25, 8, 'Delete Menu', 'app.menus.destroy', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(26, 9, 'Access Projects', 'app.project.index', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(27, 9, 'Create Project', 'app.project.create', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(28, 9, 'Edit Project', 'app.project.edit', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(29, 9, 'Delete Project', 'app.project.destroy', '2021-05-08 11:08:10', '2021-05-08 11:08:10');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 8, 1, NULL, NULL),
(9, 9, 1, NULL, NULL),
(10, 10, 1, NULL, NULL),
(11, 11, 1, NULL, NULL),
(12, 12, 1, NULL, NULL),
(13, 13, 1, NULL, NULL),
(14, 14, 1, NULL, NULL),
(15, 15, 1, NULL, NULL),
(16, 16, 1, NULL, NULL),
(17, 17, 1, NULL, NULL),
(18, 18, 1, NULL, NULL),
(19, 19, 1, NULL, NULL),
(20, 20, 1, NULL, NULL),
(21, 21, 1, NULL, NULL),
(22, 22, 1, NULL, NULL),
(23, 23, 1, NULL, NULL),
(24, 24, 1, NULL, NULL),
(25, 25, 1, NULL, NULL),
(26, 26, 1, NULL, NULL),
(27, 27, 1, NULL, NULL),
(28, 28, 1, NULL, NULL),
(29, 29, 1, NULL, NULL),
(30, 2, 3, NULL, NULL),
(31, 9, 3, NULL, NULL),
(32, 11, 3, NULL, NULL),
(33, 12, 3, NULL, NULL),
(34, 26, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `members_names` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `project_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_discription` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supervisor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `team_name`, `members_names`, `status`, `project_name`, `project_discription`, `supervisor`, `batch`, `created_at`, `updated_at`) VALUES
(9, 'xforce', 'sifat,sks,.kasiba', 1, 'Efficient image processing and machine learning approach for predicting retinal diseases ﻿', 'Efficient image processing and machine learning approach for predicting retinal diseases ﻿', 'Bikash', '8', '2021-05-29 23:32:10', '2021-05-29 23:32:10');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deletable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `deletable`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, 0, '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(2, 'User', 'user', NULL, 0, '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(3, 'FOE', 'foe', NULL, 1, '2021-06-17 00:53:36', '2021-06-17 00:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_title', 'LaraStarter', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(2, 'site_description', 'A laravel starter kit for web artisans.', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(3, 'site_address', 'Dhaka,Bangladesh', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(4, 'site_logo', NULL, '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(5, 'site_favicon', NULL, '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(6, 'mail_mailer', 'smtp', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(7, 'mail_host', 'smtp.mailtrap.io', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(8, 'mail_port', '2525', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(9, 'mail_username', '', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(10, 'mail_password', '', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(11, 'mail_encryption', 'TLS', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(12, 'mail_from_address', '', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(13, 'mail_from_name', 'LaraStarter', '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(14, 'facebook_client_id', NULL, '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(15, 'facebook_client_secret', NULL, '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(16, 'google_client_id', NULL, '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(17, 'google_client_secret', NULL, '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(18, 'github_client_id', NULL, '2021-05-08 11:08:10', '2021-05-08 11:08:10'),
(19, 'github_client_secret', NULL, '2021-05-08 11:08:10', '2021-05-08 11:08:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `status`, `remember_token`, `last_login_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$k7z7DTUD/Dn7ig.y3njt8eXwAlA878gaHo4VURyxIJm85gX0hgrfW', 1, NULL, '2021-08-06 23:58:51', '2021-05-08 11:08:10', '2021-08-06 23:58:51'),
(2, 2, 'Jone Doelk', 'user@mail.com', NULL, '$2y$10$gn56DAvhwyg34ynBDDvWIuNqOe6dw6KhbCWx5C8Yind5wJ0BUArYq', 1, NULL, NULL, '2021-05-08 11:08:10', '2021-05-08 11:14:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modules_name_unique` (`name`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
