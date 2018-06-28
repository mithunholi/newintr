-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2017 at 09:53 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `intranet`
--

-- --------------------------------------------------------

--
-- Table structure for table `atomic_counter`
--

CREATE TABLE `atomic_counter` (
  `id` int(11) NOT NULL,
  `user_uid` int(11) NOT NULL,
  `user_uid_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `atomic_counter`
--

INSERT INTO `atomic_counter` (`id`, `user_uid`, `user_uid_dt`) VALUES
(2, 62, '2017-07-07 20:36:24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `id` int(20) NOT NULL,
  `tbl_user_id` varchar(255) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `middle_name` text NOT NULL,
  `dob` date NOT NULL,
  `doj` date NOT NULL,
  `employeeid_number` int(20) NOT NULL,
  `permanent_address` text NOT NULL,
  `local_address` text NOT NULL,
  `blood_group` varchar(40) NOT NULL,
  `email_id` varchar(20) NOT NULL,
  `skype_mail` varchar(255) NOT NULL,
  `eoxys_mail` varchar(255) NOT NULL,
  `phone_number` int(30) NOT NULL,
  `passport_number` varchar(30) NOT NULL,
  `pancard_number` varchar(30) NOT NULL,
  `education_qualification` text NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`id`, `tbl_user_id`, `first_name`, `last_name`, `middle_name`, `dob`, `doj`, `employeeid_number`, `permanent_address`, `local_address`, `blood_group`, `email_id`, `skype_mail`, `eoxys_mail`, `phone_number`, `passport_number`, `pancard_number`, `education_qualification`, `created_at`, `updated_at`) VALUES
(1, 'HR2017070056', 'Mickey', 'Mouse', 'Banu', '0020-01-07', '0027-01-07', 221, 'Hospet', 'sdgfsdg', 'B ', 'mknilophar@gmail.com', 'mknilophar@gmail.com', 'nilophar@eoxys.com', 123134, '131243', '23243', 'B.E', '2017-07-14 06:43:00.000000', '2017-07-14 06:43:00.000000'),
(2, 'HR2017070057', 'Mickey', 'Mouse', 'Banu', '0020-01-07', '0027-01-07', 221, 'Hospet', 'sdgfsdg', 'B ', 'mknilophar@gmail.com', 'mknilophar@gmail.com', 'nilophar@eoxys.com', 123134, '131243', '23243', 'B.E', '2017-07-14 06:43:07.000000', '2017-07-14 06:43:07.000000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `user_role_id` varchar(255) NOT NULL,
  `user_uid` varchar(255) NOT NULL,
  `activation_sts` int(2) NOT NULL,
  `valiadtion_status` int(10) NOT NULL,
  `registration_status` int(11) NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`, `user_role_id`, `user_uid`, `activation_sts`, `valiadtion_status`, `registration_status`, `created_at`, `updated_at`) VALUES
(1, 'super@org.com', '-6f839e817f18945260c755f42690d4b24e0ea085', '1', '1', 1, 0, 0, '2017-06-29 18:30:00.000000', '2017-06-29 18:30:00.000000'),
(2, 'kalai@eoxys.com', '-4b92c4d24bf7a4905432bd5da22133a513dce959', '1', 'ADM2017070008', 1, 0, 0, '2017-07-08 06:56:48.000000', '2017-07-08 06:56:48.000000'),
(3, 'nilo@eoxys.com', '-6f839e817f18945260c755f42690d4b24e0ea085', '1', 'ADM2017070009', 1, 0, 0, '2017-07-08 07:17:25.000000', '2017-07-08 07:17:25.000000'),
(4, 'sandeepp@eoxys.com', '-5f7f2cbbbc7875086111b13a7713a1e7027ceed9', '1', 'ADM2017070010', 1, 0, 0, '2017-07-08 08:08:42.000000', '2017-07-08 08:08:42.000000'),
(5, 'ram@eoxys.com', '-466b21f42ad1763df942cbfccd4f594abf7b8cf0', '2', 'CEO2017070011', 1, 0, 0, '2017-07-08 08:08:42.000000', '2017-07-08 08:08:42.000000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_role`
--

CREATE TABLE `tbl_user_role` (
  `id` int(20) NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `user_value` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_role`
--

INSERT INTO `tbl_user_role` (`id`, `user_role`, `user_value`) VALUES
(1, 'ADM', 'ADMIN'),
(2, 'CEO', 'CEO'),
(3, 'HR', 'HR'),
(4, 'USR', 'USER'),
(5, 'MGMT', 'MANAGEMENT');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atomic_counter`
--
ALTER TABLE `atomic_counter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_role`
--
ALTER TABLE `tbl_user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atomic_counter`
--
ALTER TABLE `atomic_counter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_user_role`
--
ALTER TABLE `tbl_user_role`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
