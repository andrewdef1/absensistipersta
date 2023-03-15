-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2023 at 11:49 AM
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
  `id` char(36) NOT NULL,
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
('87df5d32-2e9f-418a-accf-bd727faa0121', 'Maret 2023', 'Presensi Maret 2023', '00:00:00', '14:00:00', '15:00:00', '23:59:00', '2023-03-01', '2023-03-31', NULL, '2023-03-05 13:13:57', '2023-03-15 10:48:15'),
('9fdf9c60-638d-495a-a8ef-78c6bcebfc96', 'April 2023', 'Presensi April 2023', '07:00:00', '11:00:00', '15:00:00', '18:00:00', '2023-04-01', '2023-04-30', NULL, '2023-03-11 16:12:21', '2023-03-11 16:12:21');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_position`
--

CREATE TABLE `attendance_position` (
  `id` char(36) NOT NULL,
  `attendance_id` char(36) NOT NULL,
  `position_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance_position`
--

INSERT INTO `attendance_position` (`id`, `attendance_id`, `position_id`, `created_at`, `updated_at`) VALUES
('0cbccd49-f20e-459c-8529-f8fd300fa484', '87df5d32-2e9f-418a-accf-bd727faa0121', '70c8b898-afff-4e65-b8d8-d084e1260f54', NULL, NULL),
('4acfe973-a6ff-4303-9275-2cb4282f8c4f', '87df5d32-2e9f-418a-accf-bd727faa0121', '709e1fb5-d846-4906-88c9-526fda5e4d03', NULL, NULL),
('4c0e67e7-7503-4b66-be11-4cda1bae9b3d', '9fdf9c60-638d-495a-a8ef-78c6bcebfc96', 'c0c3b6f7-da31-480b-aa25-d0359d5569d0', '2023-03-11 16:12:21', '2023-03-11 16:12:21'),
('635afea4-ed5c-4fc2-b6d7-691f42da4ed7', '87df5d32-2e9f-418a-accf-bd727faa0121', 'f1dd2782-ad06-4bf4-b787-3cc053b0fd78', NULL, NULL),
('a5028530-e7c4-42ef-981f-c47510734262', '9fdf9c60-638d-495a-a8ef-78c6bcebfc96', 'f1dd2782-ad06-4bf4-b787-3cc053b0fd78', '2023-03-11 16:12:21', '2023-03-11 16:12:21'),
('c455fb4a-1eb5-449a-ba57-722331753793', '9fdf9c60-638d-495a-a8ef-78c6bcebfc96', '709e1fb5-d846-4906-88c9-526fda5e4d03', '2023-03-11 16:12:21', '2023-03-11 16:12:21'),
('c76d09df-e335-4dbd-a878-61199b702e37', '9fdf9c60-638d-495a-a8ef-78c6bcebfc96', '70c8b898-afff-4e65-b8d8-d084e1260f54', '2023-03-11 16:12:21', '2023-03-11 16:12:21'),
('fec8f25f-98c8-4f08-8c22-0c4546c60e59', '87df5d32-2e9f-418a-accf-bd727faa0121', 'c0c3b6f7-da31-480b-aa25-d0359d5569d0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` char(36) NOT NULL,
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
  `id` char(36) NOT NULL,
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
('0b959391-90d9-4f55-a9f4-c20c6aaffcf0', 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-04-23', '2023-03-11 16:20:37', '2023-03-11 16:20:37'),
('0bec152d-7578-44ea-b112-07edd0ad681c', 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-04-29', '2023-03-11 16:20:37', '2023-03-11 16:20:37'),
('3321f061-b08f-4e10-9267-85000670ad8a', 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-04-22', '2023-03-11 16:20:37', '2023-03-11 16:20:37'),
('779f8e41-ef49-4e64-9ae4-6184e27c5286', 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-04-08', '2023-03-11 16:20:37', '2023-03-11 16:20:37'),
('79582cce-22b7-4570-8be4-948a4afc3abf', 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-04-30', '2023-03-11 16:20:37', '2023-03-11 16:20:37'),
('8d235567-6f4a-4a65-9550-031d19aa8783', 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-04-15', '2023-03-11 16:20:37', '2023-03-11 16:20:37'),
('a10af498-2ec5-4155-b873-7799f97508ed', 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-04-02', '2023-03-11 16:20:37', '2023-03-11 16:20:37'),
('a9106baa-021f-48ad-a16f-6939dfbb1cdc', 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-04-16', '2023-03-11 16:20:37', '2023-03-11 16:20:37'),
('bb2ff69b-6e3e-4735-8936-04a64a3e744b', 'Libur Hari Sabtu', 'Libur Hari Sabtu', '2023-04-01', '2023-03-11 16:20:37', '2023-03-11 16:20:37'),
('cbdb2b24-82d8-4acd-aba6-181670d3a736', 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-04-09', '2023-03-11 16:20:37', '2023-03-11 16:20:37'),
('f86011ae-1c8f-4057-9dd3-c16a42d7782f', 'Libur Hari Minggu', 'Libur Hari Minggu', '2023-03-12', '2023-03-11 16:21:47', '2023-03-11 16:21:47');

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
(64, '2014_10_12_000000_create_users_table', 1),
(65, '2014_10_12_100000_create_password_resets_table', 1),
(66, '2019_08_19_000000_create_failed_jobs_table', 1),
(67, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(68, '2022_06_16_075041_create_roles_table', 1),
(69, '2022_06_16_075123_add_role_id_to_users_table', 1),
(70, '2022_06_17_134607_create_positions_table', 1),
(71, '2022_06_17_142639_add_phone_and_position_id_to_users_table', 1),
(72, '2022_06_20_114945_create_holidays_table', 1),
(73, '2022_06_21_135647_create_attendances_table', 1),
(74, '2022_06_21_135721_create_attendance_position_table', 1),
(75, '2022_06_21_144144_create_presences_table', 1),
(76, '2022_06_26_214220_create_permissions_table', 1),
(77, '2022_06_26_214239_add_is_permission_to_presences_table', 1),
(78, '2022_06_26_215859_add_permission_date_to_permissions_table', 1),
(79, '2022_06_27_162656_add_is_accepted_to_permissions_table', 1);

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
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `attendance_id` char(36) NOT NULL,
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
  `id` char(36) NOT NULL,
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
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `name`, `created_at`, `updated_at`) VALUES
('709e1fb5-d846-4906-88c9-526fda5e4d03', 'Dosen', '2023-03-05 11:03:46', '2023-03-05 11:03:46'),
('70c8b898-afff-4e65-b8d8-d084e1260f54', 'Tenaga Kependidikan', '2023-03-05 11:03:46', '2023-03-05 11:03:46'),
('c0c3b6f7-da31-480b-aa25-d0359d5569d0', 'Ketua', '2023-03-05 11:03:46', '2023-03-05 11:03:46'),
('f1dd2782-ad06-4bf4-b787-3cc053b0fd78', 'Operator', '2023-03-05 11:03:46', '2023-03-05 11:03:46');

-- --------------------------------------------------------

--
-- Table structure for table `presences`
--

CREATE TABLE `presences` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `attendance_id` char(36) NOT NULL,
  `presence_date` date NOT NULL,
  `presence_enter_time` varchar(255) DEFAULT NULL,
  `presence_out_time` time DEFAULT NULL,
  `is_permission` tinyint(1) NOT NULL DEFAULT 0,
  `lokasi_masuk` varchar(255) DEFAULT 'unidentified',
  `lokasi_pulang` varchar(255) DEFAULT 'unidentified',
  `catatan_masuk` varchar(255) DEFAULT '-',
  `catatan_pulang` varchar(255) DEFAULT '-',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
('40a3ca0d-a666-461d-a6c9-05a3ce75c82a', 'admin', '2023-03-05 11:03:46', '2023-03-05 11:03:46'),
('54308026-8eba-4e87-9636-93585a1be3ec', 'operator', '2023-03-05 11:03:46', '2023-03-05 11:03:46'),
('db192096-37dd-47d5-8f28-f948c3c92ba1', 'user', '2023-03-05 11:03:46', '2023-03-05 11:03:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `position_id` char(36) NOT NULL,
  `role_id` char(36) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `position_id`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
('00ae73e8-efe4-4119-b486-5193c7b1e3a9', 'Drew (Admin)', 'andrewdefretes@gmail.com', '2023-03-05 11:03:46', '$2y$10$YOnD7.7GNqWoRiGswl2co.ThOekuaj5UaYwRalXZwMM.8jTZ.dTy2', '081326118259', 'f1dd2782-ad06-4bf4-b787-3cc053b0fd78', '40a3ca0d-a666-461d-a6c9-05a3ce75c82a', 'V7GRSiclGyH4c5Cys7HxaekAXwubEaIqyYJo6HcEE1cNUn3bE5Z4I7W38HjZ', '2023-03-05 11:03:46', '2023-03-05 13:00:23'),
('cbe318e0-2791-4b04-857d-012c78c958bc', 'Dr. Yunus P. Paulangan, S.Kel., Msi', 'yunuspaulangan@stipersta.ac.id', NULL, '$2y$10$RpEuD1QZ9mpHkxToH.vesO1Py9pb14HSGdVJgCedFiLECN3v9Wc8O', '08555555555555', 'c0c3b6f7-da31-480b-aa25-d0359d5569d0', 'db192096-37dd-47d5-8f28-f948c3c92ba1', NULL, '2023-03-11 14:32:10', '2023-03-11 14:32:10');

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
  ADD KEY `attendance_id` (`attendance_id`),
  ADD KEY `position_id` (`position_id`);

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
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_position_id_foreign` (`position_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance_position`
--
ALTER TABLE `attendance_position`
  ADD CONSTRAINT `attendance_position_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`),
  ADD CONSTRAINT `attendance_position_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`);

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`),
  ADD CONSTRAINT `permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `presences`
--
ALTER TABLE `presences`
  ADD CONSTRAINT `presences_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`),
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
