-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2022 at 04:00 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_list`
--

CREATE TABLE `booking_list` (
  `id` int(30) NOT NULL,
  `ref_code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `cab_id` int(30) NOT NULL,
  `pickup_zone` text NOT NULL,
  `drop_zone` text NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 = Pending,\r\n1 = Driver has Confirmed,\r\n2 = Pickup,\r\n3 = drop-off,\r\n4 = cancelled',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_list`
--

INSERT INTO `booking_list` (`id`, `ref_code`, `client_id`, `cab_id`, `pickup_zone`, `drop_zone`, `status`, `date_created`, `date_updated`) VALUES
(2, '202202-00003', 1, 2, 'Sample Pickup Zone 1', 'Sample Drop-off Zone 1', 4, '2022-02-16 13:53:27', '2022-02-16 15:01:16'),
(3, '202202-00003', 1, 2, 'Sample Pickup Zone 1', 'Sample Drop off Zone 1', 3, '2022-02-16 15:33:10', '2022-02-16 15:40:01'),
(4, '202209-00001', 1, 2, 'MAGU', 'Area 12', 3, '2022-09-28 11:47:24', '2022-09-28 17:31:45'),
(5, '202209-00003', 5, 6, 'MAGU', 'Town', 3, '2022-09-29 15:00:24', '2022-09-29 15:02:20');

-- --------------------------------------------------------

--
-- Table structure for table `cab_list`
--

CREATE TABLE `cab_list` (
  `id` int(30) NOT NULL,
  `reg_code` varchar(100) NOT NULL,
  `category_id` int(30) NOT NULL,
  `cab_reg_no` varchar(200) NOT NULL,
  `body_no` varchar(100) NOT NULL,
  `cab_model` text NOT NULL,
  `cab_driver` text NOT NULL,
  `driver_contact` text NOT NULL,
  `driver_address` text NOT NULL,
  `password` text NOT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `price` char(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cab_list`
--

INSERT INTO `cab_list` (`id`, `reg_code`, `category_id`, `cab_reg_no`, `body_no`, `cab_model`, `cab_driver`, `driver_contact`, `driver_address`, `password`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`, `price`) VALUES
(1, '202202-00002', 1, 'GBN-2306', '0002', 'Toyota Corolla Axio', 'King Chakhame', '0999532320', '250, Area 12, Lilongwe', '827ccb0eea8a706c4c34a16891f84e7b', 'uploads/dirvers/1.png?v=1644981064', 1, 0, '2022-02-16 10:59:12', '2022-10-04 15:58:27', '1000/km'),
(2, '202202-00001', 2, 'CDM-0715', '0001', 'Toyota Sienta', 'Thembinkosi Chikandira', '0992357357', '12/250, Mphungu STR, Lilongwe', '827ccb0eea8a706c4c34a16891f84e7b', 'uploads/dirvers/2.png?v=1644981833', 1, 0, '2022-02-16 11:13:30', '2022-10-04 14:49:27', '1000/km'),
(5, '202209-00001', 1, 'BK 12345', '0003', 'Toyota Corolla Axio', 'FTambala', '1234567890', 'abc, Lilongwe', 'a7a192edd9e8fd19a50ea38161786fca', NULL, 1, 0, '2022-09-28 13:36:01', '2022-10-04 15:58:55', '1000/km'),
(6, '202209-00002', 1, 'SA 6759', '0007', 'Toyota Hilux', 'Howard Bowa', '0888966675', 'Box 184, MAGU', '01cfcd4f6b8770febfb40cb906715822', NULL, 1, 0, '2022-09-29 14:51:32', '2022-10-04 15:59:24', '1000/km');

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `delete_flag`, `status`, `date_created`, `date_updated`) VALUES
(1, '5 Seater Sedan ', 'A comfortable 5 seater sedan that would carry a total of 4 passengers from point a to point ', 0, 1, '2022-02-16 10:03:54', '2022-09-29 10:34:56'),
(2, '7 Seater ', 'Travel in comfort especially if you wish to travel out of Zomba with a group of friends/family driven by a friendly and experienced driver and enjoy the beauty of Malawi. ', 0, 1, '2022-02-16 10:08:10', '2022-09-29 10:36:31');

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_added` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `image_path`, `status`, `delete_flag`, `date_created`, `date_added`) VALUES
(1, 'Tamandani', 'D', 'Chikandira', 'Female', '0992872925', '250, Mphungu STR, Area 12, Lilongwe', 'tamandanichikandira@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'uploads/clients/1.png?v=1644995661', 1, 0, '2022-02-16 13:06:42', '2022-03-29 23:33:58'),
(2, 'Franklin ', '', 'Male', '', '1234567890', 'abc, xyz', 'frank@mail', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 1, 1, '2022-09-28 13:28:03', '2022-09-28 13:41:56'),
(3, 'Franklin ', 'C', 'Male', '', '1234567890', 'abc, xyz', 'frank@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 1, 0, '2022-09-28 13:28:21', NULL),
(4, 'Barney', 'S', 'Male', '', '1234567890', '123, Lilogwe', 'barney@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 1, 0, '2022-09-28 13:29:48', NULL),
(5, 'Kondwani', '', 'Male', '', '1234567890', '184, MAGU', 'kchatchuka@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 1, 0, '2022-09-29 14:59:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Cabs365 Taxi Management System'),
(6, 'short_name', 'Cabs365 TMS'),
(11, 'logo', 'uploads/1664882100_1648624860_1644974880_logo.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1664882220_Used-cars-dealers-hit-hard-by-Covid-19.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(8, 'Thembinkosi', 'Chikandira', 'tnk009', '45bff2a14658fc9b21c6e5e9bf75186b', 'uploads/avatar-8.png?v=1644999240', NULL, 2, '2022-02-16 16:14:00', '2022-03-29 23:42:56'),
(9, 'Franklin ', 'Tambala', 'FTambala', 'a7a192edd9e8fd19a50ea38161786fca', NULL, NULL, 2, '2022-09-28 13:33:13', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_list`
--
ALTER TABLE `booking_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cab_id` (`cab_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `cab_list`
--
ALTER TABLE `cab_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_list`
--
ALTER TABLE `booking_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cab_list`
--
ALTER TABLE `cab_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_list`
--
ALTER TABLE `booking_list`
  ADD CONSTRAINT `booking_list_ibfk_1` FOREIGN KEY (`cab_id`) REFERENCES `cab_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_list_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cab_list`
--
ALTER TABLE `cab_list`
  ADD CONSTRAINT `cab_list_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
