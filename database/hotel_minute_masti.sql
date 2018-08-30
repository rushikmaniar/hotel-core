-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2018 at 10:24 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hotel_minute_masti`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookiing_master`
--

CREATE TABLE IF NOT EXISTS `bookiing_master` (
  `bookiing_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `check_in` datetime NOT NULL,
  `check_out` datetime NOT NULL,
  `is_payed` int(11) NOT NULL COMMENT 'payment done ?'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='booking master table. all record of booking';

-- --------------------------------------------------------

--
-- Table structure for table `payment_master`
--

CREATE TABLE IF NOT EXISTS `payment_master` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount_payable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='payment_master table';

-- --------------------------------------------------------

--
-- Table structure for table `room_allocation`
--

CREATE TABLE IF NOT EXISTS `room_allocation` (
  `allocation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bookiing_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='room allcoation table ';

-- --------------------------------------------------------

--
-- Table structure for table `room_category`
--

CREATE TABLE IF NOT EXISTS `room_category` (
  `room_cat_id` int(11) NOT NULL,
  `room_cat_name` varchar(255) NOT NULL,
  `room_cat_charges` int(255) NOT NULL,
  `no_of_rooms` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='rooms category table';

-- --------------------------------------------------------

--
-- Table structure for table `room_master`
--

CREATE TABLE IF NOT EXISTS `room_master` (
  `room_no` varchar(255) NOT NULL,
  `room_type` int(11) NOT NULL COMMENT '0=simple,1=semi delux,2=delux',
  `isbooked` tinyint(1) NOT NULL COMMENT '0=not booked,1=bookes',
  `bookiing_id` int(11) DEFAULT NULL COMMENT 'booking_id if booked'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='room_master table.all room details';

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL COMMENT 'user_id from user_master',
  `user_first_name` varchar(255) NOT NULL,
  `user_last_name` varchar(255) NOT NULL,
  `user_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='user_details table';

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `user_first_name`, `user_last_name`, `user_address`) VALUES
(1, 'Meet', 'Mehta', 'asas');

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

CREATE TABLE IF NOT EXISTS `user_master` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_contact` bigint(10) NOT NULL COMMENT 'user contact mobile',
  `user_password` varchar(255) NOT NULL,
  `user_type` int(11) NOT NULL COMMENT '1=admin,2=user'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='user login table';

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`user_id`, `user_email`, `user_contact`, `user_password`, `user_type`) VALUES
(1, 'admin@hotel.com', 9898989898, '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookiing_master`
--
ALTER TABLE `bookiing_master`
  ADD PRIMARY KEY (`bookiing_id`);

--
-- Indexes for table `payment_master`
--
ALTER TABLE `payment_master`
  ADD PRIMARY KEY (`payment_id`), ADD UNIQUE KEY `user_id` (`user_id`), ADD UNIQUE KEY `booking_id` (`booking_id`);

--
-- Indexes for table `room_allocation`
--
ALTER TABLE `room_allocation`
  ADD PRIMARY KEY (`allocation_id`);

--
-- Indexes for table `room_category`
--
ALTER TABLE `room_category`
  ADD PRIMARY KEY (`room_cat_id`), ADD UNIQUE KEY `room_cat_name` (`room_cat_name`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_master`
--
ALTER TABLE `user_master`
  ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `user_name` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookiing_master`
--
ALTER TABLE `bookiing_master`
  MODIFY `bookiing_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_master`
--
ALTER TABLE `payment_master`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `room_allocation`
--
ALTER TABLE `room_allocation`
  MODIFY `allocation_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `room_category`
--
ALTER TABLE `room_category`
  MODIFY `room_cat_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_master`
--
ALTER TABLE `user_master`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment_master`
--
ALTER TABLE `payment_master`
ADD CONSTRAINT `booking payment` FOREIGN KEY (`booking_id`) REFERENCES `bookiing_master` (`bookiing_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `user payment link` FOREIGN KEY (`user_id`) REFERENCES `user_master` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
ADD CONSTRAINT `user master link` FOREIGN KEY (`user_id`) REFERENCES `user_master` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
