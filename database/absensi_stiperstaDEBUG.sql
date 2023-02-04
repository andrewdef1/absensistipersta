-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2023 at 05:36 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensi_stipersta`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `start_time` time NOT NULL,
  `batas_start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `batas_end_time` time NOT NULL,
  `tanggal_awal` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `title`, `description`, `start_time`, `batas_start_time`, `end_time`, `batas_end_time`, `tanggal_awal`, `tanggal_akhir`, `code`, `created_at`, `updated_at`) VALUES
(3, 'Februari 2023', 'Presensi Februari 2023', '00:00:00', '22:00:00', '23:00:00', '23:59:00', '2023-02-01', '2023-02-28', NULL, '2023-02-01 08:51:19', '2023-02-04 04:06:38'),
(13, 'Maret 2023', 'Presensi Maret 2023', '07:00:00', '20:00:00', '21:00:00', '23:59:00', '2023-03-01', '2023-03-31', NULL, '2023-02-01 08:51:19', '2023-02-01 09:50:33');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_position`
--

CREATE TABLE `attendance_position` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attendance_id` bigint(20) UNSIGNED NOT NULL,
  `position_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance_position`
--

INSERT INTO `attendance_position` (`id`, `attendance_id`, `position_id`, `created_at`, `updated_at`) VALUES
(13, 3, 3, NULL, NULL),
(14, 3, 2, NULL, NULL),
(15, 3, 4, NULL, NULL),
(16, 3, 1, NULL, NULL),
(26, 13, 3, NULL, NULL),
(27, 13, 2, NULL, NULL),
(28, 13, 4, NULL, NULL),
(29, 13, 1, NULL, NULL);

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
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `holiday_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `title`, `description`, `holiday_date`, `created_at`, `updated_at`) VALUES
(121, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-01-01', '2023-02-01 13:45:51', '2023-02-01 13:45:51'),
(122, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-01-07', '2023-02-01 13:45:51', '2023-02-01 13:45:51'),
(123, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-01-08', '2023-02-01 13:45:51', '2023-02-01 13:45:51'),
(124, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-01-14', '2023-02-01 13:45:51', '2023-02-01 13:45:51'),
(125, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-01-15', '2023-02-01 13:45:51', '2023-02-01 13:45:51'),
(126, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-01-21', '2023-02-01 13:45:51', '2023-02-01 13:45:51'),
(127, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-01-22', '2023-02-01 13:45:51', '2023-02-01 13:45:51'),
(128, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-01-28', '2023-02-01 13:45:51', '2023-02-01 13:45:51'),
(129, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-01-29', '2023-02-01 13:45:51', '2023-02-01 13:45:51'),
(171, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-02-05', '2023-02-01 13:53:18', '2023-02-01 13:53:18'),
(172, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-02-11', '2023-02-01 13:53:18', '2023-02-01 13:53:18'),
(173, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-02-12', '2023-02-01 13:53:18', '2023-02-01 13:53:18'),
(174, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-02-18', '2023-02-01 13:53:18', '2023-02-01 13:53:18'),
(175, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-02-19', '2023-02-01 13:53:18', '2023-02-01 13:53:18'),
(176, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-02-25', '2023-02-01 13:53:18', '2023-02-01 13:53:18'),
(177, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-02-26', '2023-02-01 13:53:18', '2023-02-01 13:53:18'),
(186, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-03-04', '2023-02-01 13:56:46', '2023-02-01 13:56:46'),
(187, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-03-05', '2023-02-01 13:56:46', '2023-02-01 13:56:46'),
(188, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-03-11', '2023-02-01 13:56:46', '2023-02-01 13:56:46'),
(189, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-03-12', '2023-02-01 13:56:46', '2023-02-01 13:56:46'),
(190, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-03-18', '2023-02-01 13:56:46', '2023-02-01 13:56:46'),
(191, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-03-19', '2023-02-01 13:56:46', '2023-02-01 13:56:46'),
(192, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-03-25', '2023-02-01 13:56:46', '2023-02-01 13:56:46'),
(193, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-03-26', '2023-02-01 13:56:46', '2023-02-01 13:56:46'),
(194, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-04-01', '2023-02-01 13:57:34', '2023-02-01 13:57:34'),
(195, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-04-02', '2023-02-01 13:57:34', '2023-02-01 13:57:34'),
(196, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-04-08', '2023-02-01 13:57:34', '2023-02-01 13:57:34'),
(197, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-04-09', '2023-02-01 13:57:34', '2023-02-01 13:57:34'),
(198, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-04-15', '2023-02-01 13:57:34', '2023-02-01 13:57:34'),
(199, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-04-16', '2023-02-01 13:57:34', '2023-02-01 13:57:34'),
(200, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-04-22', '2023-02-01 13:57:34', '2023-02-01 13:57:34'),
(201, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-04-23', '2023-02-01 13:57:34', '2023-02-01 13:57:34'),
(202, 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-04-29', '2023-02-01 13:57:34', '2023-02-01 13:57:34'),
(203, 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-04-30', '2023-02-01 13:57:34', '2023-02-01 13:57:34');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_16_075041_create_roles_table', 1),
(6, '2022_06_16_075123_add_role_id_to_users_table', 1),
(7, '2022_06_17_134607_create_positions_table', 1),
(8, '2022_06_17_142639_add_phone_and_position_id_to_users_table', 1),
(9, '2022_06_20_114945_create_holidays_table', 1),
(10, '2022_06_21_135647_create_attendances_table', 1),
(11, '2022_06_21_135721_create_attendance_position_table', 1),
(12, '2022_06_21_144144_create_presences_table', 1),
(13, '2022_06_26_214220_create_permissions_table', 1),
(14, '2022_06_26_214239_add_is_permission_to_presences_table', 1),
(15, '2022_06_26_215859_add_permission_date_to_permissions_table', 1),
(16, '2022_06_27_162656_add_is_accepted_to_permissions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `attendance_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `permission_date` date NOT NULL,
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Dosen', '2023-01-04 17:08:51', '2023-01-04 18:05:45'),
(2, 'Tenaga Kependidikan', '2023-01-04 17:08:51', '2023-01-04 18:06:02'),
(3, 'Ketua', '2023-01-04 17:08:51', '2023-01-04 18:06:32'),
(4, 'Operator', '2023-01-04 17:08:51', '2023-01-04 17:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `presences`
--

CREATE TABLE `presences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `attendance_id` bigint(20) UNSIGNED NOT NULL,
  `presence_date` date NOT NULL,
  `presence_enter_time` varchar(255) DEFAULT NULL,
  `presence_out_time` time DEFAULT NULL,
  `lokasi_masuk` varchar(255) DEFAULT NULL,
  `lokasi_pulang` varchar(255) DEFAULT NULL,
  `is_permission` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `presences`
--

INSERT INTO `presences` (`id`, `user_id`, `attendance_id`, `presence_date`, `presence_enter_time`, `presence_out_time`, `lokasi_masuk`, `lokasi_pulang`, `is_permission`, `created_at`, `updated_at`) VALUES
(65, 2, 3, '2023-02-01', '18:51:39', '19:47:20', NULL, NULL, 0, '2023-02-01 09:51:39', '2023-02-01 10:47:20'),
(84, 2, 3, '2023-02-04', '13:34:48', NULL, '-2.5812804,140.499901', NULL, 0, '2023-02-04 04:34:48', '2023-02-04 04:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-01-04 17:08:45', '2023-01-04 17:08:45'),
(2, 'operator', '2023-01-04 17:08:45', '2023-01-04 17:08:45'),
(3, 'user', '2023-01-04 17:08:45', '2023-01-04 17:08:45');

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
  `phone` varchar(255) DEFAULT NULL,
  `position_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `position_id`, `role_id`, `remember_token`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Drew (Admin)', 'andrewdefretes@gmail.com', '2023-01-04 17:10:39', '$2y$10$YOnD7.7GNqWoRiGswl2co.ThOekuaj5UaYwRalXZwMM.8jTZ.dTy2', '081326118259', 4, 1, '', NULL, '2023-01-04 17:10:39', '2023-01-04 17:10:39'),
(2, 'Dr. Yunus P. Paulangan, S.Kel., Msi', 'yunuspaulangan@stipersta.ac.id', NULL, '$2y$10$UrbAvV8Fr/I/P1iEBK/1QOHGfy832YmbaBtkz497WGwvy2LGo39rS', '08555555555555', 3, 3, NULL, NULL, '2023-01-04 17:13:37', '2023-01-04 17:13:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_position`
--
ALTER TABLE `attendance_position`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_position_attendance_id_foreign` (`attendance_id`),
  ADD KEY `attendance_position_position_id_foreign` (`position_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_user_id_foreign` (`user_id`),
  ADD KEY `permissions_attendance_id_foreign` (`attendance_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `presences`
--
ALTER TABLE `presences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `presences_user_id_foreign` (`user_id`),
  ADD KEY `presences_attendance_id_foreign` (`attendance_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD KEY `position_id` (`position_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `attendance_position`
--
ALTER TABLE `attendance_position`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `presences`
--
ALTER TABLE `presences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance_position`
--
ALTER TABLE `attendance_position`
  ADD CONSTRAINT `attendance_position_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_position_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`);

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `presences`
--
ALTER TABLE `presences`
  ADD CONSTRAINT `presences_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `presences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`),
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
