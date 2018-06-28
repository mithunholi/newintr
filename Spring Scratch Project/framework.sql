-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 28, 2017 at 01:13 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `framework`
--

-- --------------------------------------------------------

--
-- Table structure for table `atomic_counter`
--

CREATE TABLE `atomic_counter` (
  `id` bigint(11) NOT NULL,
  `user_uid` bigint(11) NOT NULL,
  `user_uid_dt` datetime NOT NULL,
  `cuser_uid` bigint(11) NOT NULL,
  `cuser_uid_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `atomic_counter`
--

INSERT INTO `atomic_counter` (`id`, `user_uid`, `user_uid_dt`, `cuser_uid`, `cuser_uid_dt`) VALUES
(1, 0, '2016-03-01 18:16:52', 23, '2016-03-17 11:31:05');

-- --------------------------------------------------------

--
-- Table structure for table `back_office_users`
--

CREATE TABLE `back_office_users` (
  `id` bigint(11) NOT NULL,
  `employee_id` bigint(11) NOT NULL,
  `password` text,
  `user_role_uid` varchar(255) DEFAULT NULL,
  `user_uid` varchar(255) DEFAULT NULL,
  `validation_sts` int(2) NOT NULL DEFAULT '0',
  `activation_sts` int(2) NOT NULL DEFAULT '0',
  `registration_sts` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `back_office_users`
--

INSERT INTO `back_office_users` (`id`, `employee_id`, `password`, `user_role_uid`, `user_uid`, `validation_sts`, `activation_sts`, `registration_sts`, `created_at`, `updated_at`) VALUES
(128, 0, '-6f839e817f18945260c755f42690d4b24e0ea085', '1', 'ADM2015120023', 1, 1, 1, '2015-12-07 22:03:25', '2015-12-07 22:03:25'),
(157, 118, '6c2b6746c48dd8bd2ab40da30cdbddb056aaed9d', '12', 'AP2016030020', 0, 1, 0, '2016-03-04 10:57:54', '2016-03-04 10:57:54'),
(160, 120, '6c2b6746c48dd8bd2ab40da30cdbddb056aaed9d', '20', 'MNB2016030023', 0, 1, 0, '2016-03-05 14:08:47', '2016-03-05 14:08:47');

-- --------------------------------------------------------

--
-- Table structure for table `back_office_user_failed_login_report`
--

CREATE TABLE `back_office_user_failed_login_report` (
  `id` bigint(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `client_ip_address` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_zone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `back_office_user_login_report`
--

CREATE TABLE `back_office_user_login_report` (
  `id` bigint(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `action` int(11) NOT NULL,
  `client_ip_address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_zone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `back_office_user_login_report`
--

INSERT INTO `back_office_user_login_report` (`id`, `user_id`, `action`, `client_ip_address`, `created_at`, `time_zone`) VALUES
(10, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-03 12:35:53', ''),
(11, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-03 12:35:53', ''),
(12, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-03 12:50:23', ''),
(13, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-03 13:06:31', NULL),
(14, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-03 15:11:05', 'GMT+0530'),
(15, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-04 04:37:19', 'GMT+0530'),
(16, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-05 07:11:49', 'GMT+0530'),
(17, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-05 07:14:13', NULL),
(18, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-05 07:14:18', 'GMT+0530'),
(19, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-05 07:16:49', NULL),
(20, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-05 07:16:53', 'GMT+0530'),
(21, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-05 07:17:58', NULL),
(22, 157, 1, '0:0:0:0:0:0:0:1', '2016-03-05 07:18:07', 'GMT+0530'),
(23, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-05 08:29:20', 'GMT+0530'),
(24, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-05 08:29:50', NULL),
(25, 157, 1, '0:0:0:0:0:0:0:1', '2016-03-05 08:29:59', 'GMT+0530'),
(26, 157, 0, '0:0:0:0:0:0:0:1', '2016-03-05 08:39:25', NULL),
(27, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-05 08:39:27', 'GMT+0530'),
(28, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-05 08:40:38', NULL),
(29, 160, 1, '0:0:0:0:0:0:0:1', '2016-03-05 08:40:47', 'GMT+0530'),
(30, 160, 0, '0:0:0:0:0:0:0:1', '2016-03-05 08:41:53', NULL),
(31, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-05 08:42:16', 'GMT+0530'),
(32, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-05 08:43:31', NULL),
(33, 157, 1, '0:0:0:0:0:0:0:1', '2016-03-05 08:43:52', 'GMT+0530'),
(34, 157, 0, '0:0:0:0:0:0:0:1', '2016-03-05 08:44:18', NULL),
(35, 160, 1, '0:0:0:0:0:0:0:1', '2016-03-05 08:44:36', 'GMT+0530'),
(36, 160, 0, '0:0:0:0:0:0:0:1', '2016-03-05 09:02:27', NULL),
(37, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-05 09:13:11', 'GMT+0530'),
(38, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-05 09:21:53', NULL),
(39, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-05 09:22:28', 'GMT+0530'),
(40, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-05 09:26:20', NULL),
(41, 157, 1, '0:0:0:0:0:0:0:1', '2016-03-05 09:26:28', 'GMT+0530'),
(42, 157, 0, '0:0:0:0:0:0:0:1', '2016-03-05 09:26:55', NULL),
(43, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-05 09:26:57', 'GMT+0530'),
(44, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-05 09:27:12', NULL),
(45, 160, 1, '0:0:0:0:0:0:0:1', '2016-03-05 09:27:20', 'GMT+0530'),
(46, 160, 0, '0:0:0:0:0:0:0:1', '2016-03-05 09:27:38', NULL),
(47, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-05 11:16:52', 'GMT+0530'),
(48, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-07 05:10:41', 'GMT+0530'),
(49, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-07 05:12:13', NULL),
(50, 157, 1, '0:0:0:0:0:0:0:1', '2016-03-07 06:26:38', 'GMT+0530'),
(51, 157, 0, '0:0:0:0:0:0:0:1', '2016-03-07 06:26:55', NULL),
(52, 128, 1, '192.168.1.29', '2016-03-11 06:40:55', 'GMT+0530'),
(53, 128, 1, '192.168.1.15', '2016-03-11 06:50:20', 'GMT+0530'),
(54, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-16 09:26:20', 'GMT+0530'),
(55, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-17 07:37:17', 'GMT+0530'),
(56, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-17 08:02:58', NULL),
(57, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-17 08:06:14', 'GMT+0530'),
(58, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-17 08:07:16', NULL),
(59, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-17 10:07:18', 'GMT+0530'),
(60, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-17 11:10:17', NULL),
(61, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-17 11:10:57', 'GMT+0530'),
(62, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-17 11:24:05', NULL),
(63, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-17 11:24:14', 'GMT+0530'),
(64, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-17 11:27:02', NULL),
(65, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-17 13:25:11', 'GMT+0530'),
(66, 128, 0, '0:0:0:0:0:0:0:1', '2016-03-17 13:25:49', NULL),
(67, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-17 13:29:07', 'GMT+0530'),
(68, 128, 1, '0:0:0:0:0:0:0:1', '2016-03-17 14:41:57', 'GMT+0530'),
(69, 128, 1, '127.0.0.1', '2017-07-28 09:31:56', 'GMT+0530'),
(70, 128, 0, '127.0.0.1', '2017-07-28 10:24:09', NULL),
(71, 128, 1, '127.0.0.1', '2017-07-28 10:24:18', 'GMT+0530'),
(72, 128, 1, '127.0.0.1', '2017-07-28 10:26:57', 'GMT+0530'),
(73, 128, 0, '127.0.0.1', '2017-07-28 10:59:06', NULL),
(74, 128, 1, '127.0.0.1', '2017-07-28 10:59:14', 'GMT+0530'),
(75, 128, 0, '127.0.0.1', '2017-07-28 11:01:36', NULL),
(76, 128, 1, '127.0.0.1', '2017-07-28 11:08:22', 'GMT+0530'),
(77, 128, 0, '127.0.0.1', '2017-07-28 11:09:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `back_office_user_module_access`
--

CREATE TABLE `back_office_user_module_access` (
  `id` bigint(11) NOT NULL,
  `module_id` bigint(11) NOT NULL,
  `bo_user_role_id` bigint(11) NOT NULL,
  `access` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `back_office_user_module_access`
--

INSERT INTO `back_office_user_module_access` (`id`, `module_id`, `bo_user_role_id`, `access`, `created_at`) VALUES
(5, 0, 1, '111', '2016-03-05 12:06:20'),
(6, 1, 1, '010', '2016-03-05 12:06:20'),
(7, 2, 1, '110', '2016-03-05 12:06:20'),
(9, 0, 12, '010', '2016-03-05 09:26:15'),
(10, 1, 12, '010', '2016-03-05 09:26:15'),
(17, 0, 20, '010', '2016-03-05 08:43:19'),
(18, 1, 20, '010', '2016-03-05 08:43:19'),
(25, 0, 22, '100', '2016-03-04 14:33:45'),
(26, 1, 22, '010', '2016-03-04 14:33:45'),
(30, 4, 1, '111', '2017-07-28 10:23:57');

-- --------------------------------------------------------

--
-- Table structure for table `back_office_user_role`
--

CREATE TABLE `back_office_user_role` (
  `id` bigint(11) NOT NULL,
  `role_uid` varchar(255) NOT NULL,
  `role_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `back_office_user_role`
--

INSERT INTO `back_office_user_role` (`id`, `role_uid`, `role_value`) VALUES
(1, 'ADM', 'Admin'),
(12, 'AP', 'AP USERS'),
(20, 'MNB', 'BALA CHANDAR MURUGESAN'),
(23, 'Cus-MNB', 'Customer MNB');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(11) NOT NULL,
  `name` text NOT NULL,
  `desig` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `country` text NOT NULL,
  `address_line1` text NOT NULL,
  `address_line2` text NOT NULL,
  `zip` text NOT NULL,
  `email` text NOT NULL,
  `dob` datetime NOT NULL,
  `age` int(5) NOT NULL,
  `sex` varchar(5) NOT NULL,
  `phone` text NOT NULL,
  `url` text,
  `thumb_url` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `desig`, `city`, `state`, `country`, `address_line1`, `address_line2`, `zip`, `email`, `dob`, `age`, `sex`, `phone`, `url`, `thumb_url`, `created_at`, `updated_at`) VALUES
(0, 'Goutham le cheri', '', 'rsyrsy', 'Bridgetown', 'Barbados', 'srsrg', 'srgsrg', '25246', 'super@org', '1997-12-07 00:00:00', 18, '0', '243464', '/personal/2016_01_29_18_23_58_images7.jpg', '/personal/thumb/2016_01_29_18_23_58_images7_thumb.jpg', '2015-12-07 12:58:11', '2015-12-07 22:12:18'),
(118, 'BALA CHANDAR MURUGESAN1', 'MNB', 'Trichy', 'Tamil Nadu', 'India', 'Test', 'Test', '6200001', 'bala@eoxys.com', '1998-03-01 00:00:00', 17, '0', '918867336833', '/profile/2016_02_29_13_13_22_Screenshot_2016-02-27-17-57-35.png', '/profile/thumb/2016_02_29_13_13_22_Screenshot_2016-02-27-17-57-35_thumb.png', '2016-02-29 13:11:38', '2016-02-29 13:11:38'),
(119, 'MNB', 'afdsg', 'Melbourne', 'Marsh Harbour', 'Bahamas', 'N0.19, Salai Street,', 'klfbmgvklmb', '456789', 'murugesanbala@hotmail.com', '1998-03-01 00:00:00', 17, '0', '918867336833', '/profile/2016_02_29_13_44_18_Home.png', '/profile/thumb/2016_02_29_13_44_18_Home_thumb.png', '2016-02-29 13:44:43', '2016-02-29 13:44:43'),
(120, 'AP-1', 'MD', 'Trichy', 'Tamil Nadu', 'India', 'TEST', 'TEST', '6200001', 'ap@eoxys.com', '1989-01-10 00:00:00', 27, '0', '918867336833', '/profile/2016_03_01_20_03_47_Screenshot_2016-02-27-17-57-35.png', '/profile/thumb/2016_03_01_20_03_47_Screenshot_2016-02-27-17-57-35_thumb.png', '2016-03-01 20:04:42', '2016-03-01 20:04:42'),
(121, 'MNB-Name', 'MNB', 'Bangalore', 'Inagua', 'Bahamas', 'TEST', 'TEST', '6200001', 'yan@org', '1998-03-05 00:00:00', 18, '0', '918867336833', '/profile/2016_03_05_14_54_52_eclipseError.png', '/profile/thumb/2016_03_05_14_54_52_eclipseError_thumb.png', '2016-03-05 14:55:25', '2016-03-05 14:55:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atomic_counter`
--
ALTER TABLE `atomic_counter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `back_office_users`
--
ALTER TABLE `back_office_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `back_office_user_failed_login_report`
--
ALTER TABLE `back_office_user_failed_login_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `back_office_user_login_report`
--
ALTER TABLE `back_office_user_login_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `back_office_user_module_access`
--
ALTER TABLE `back_office_user_module_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `back_office_user_role`
--
ALTER TABLE `back_office_user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atomic_counter`
--
ALTER TABLE `atomic_counter`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `back_office_users`
--
ALTER TABLE `back_office_users`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;
--
-- AUTO_INCREMENT for table `back_office_user_failed_login_report`
--
ALTER TABLE `back_office_user_failed_login_report`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `back_office_user_login_report`
--
ALTER TABLE `back_office_user_login_report`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `back_office_user_module_access`
--
ALTER TABLE `back_office_user_module_access`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `back_office_user_role`
--
ALTER TABLE `back_office_user_role`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
