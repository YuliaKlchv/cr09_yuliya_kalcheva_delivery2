-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2020 at 06:29 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_yuliya_kalcheva_delivery2`
--
CREATE DATABASE IF NOT EXISTS `cr09_yuliya_kalcheva_delivery2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr09_yuliya_kalcheva_delivery2`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `a_id` int(11) NOT NULL,
  `a_streetname` varchar(55) DEFAULT NULL,
  `a_postalcode` int(11) DEFAULT NULL,
  `a_city` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `delivered`
--

CREATE TABLE `delivered` (
  `de_id` int(11) NOT NULL,
  `fk_em_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `em_id` int(11) NOT NULL,
  `em_first_name` varchar(55) DEFAULT NULL,
  `em_last_name` varchar(55) DEFAULT NULL,
  `fk_mds_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mds`
--

CREATE TABLE `mds` (
  `mds_id` int(11) NOT NULL,
  `fk_pa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `pa_id` int(11) NOT NULL,
  `pa_size` varchar(55) DEFAULT NULL,
  `pa_pickedupdate` date DEFAULT NULL,
  `pa_status` enum('station','home') DEFAULT NULL,
  `fk_sender_id` int(11) DEFAULT NULL,
  `fk_re_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `process`
--

CREATE TABLE `process` (
  `pr_id` int(11) NOT NULL,
  `picked_up_date` date DEFAULT NULL,
  `delivered_date` date DEFAULT NULL,
  `delivered_status` enum('Y','N') DEFAULT NULL,
  `fk_re_id` int(11) DEFAULT NULL,
  `fk_em_id` int(11) DEFAULT NULL,
  `fk_mds_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `receiver`
--

CREATE TABLE `receiver` (
  `re_id` int(11) NOT NULL,
  `re_first_name` varchar(55) DEFAULT NULL,
  `re_last_name` varchar(55) DEFAULT NULL,
  `fk_a_id` int(11) DEFAULT NULL,
  `fk_pr_id` int(11) DEFAULT NULL,
  `fk_pa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sender`
--

CREATE TABLE `sender` (
  `sender_id` int(11) NOT NULL,
  `sender_first_name` varchar(55) DEFAULT NULL,
  `sender_name_name` varchar(55) DEFAULT NULL,
  `resident_city` varchar(55) DEFAULT NULL,
  `fk_a_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `delivered`
--
ALTER TABLE `delivered`
  ADD PRIMARY KEY (`de_id`),
  ADD KEY `fk_em_id` (`fk_em_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`em_id`),
  ADD KEY `fk_mds_id` (`fk_mds_id`);

--
-- Indexes for table `mds`
--
ALTER TABLE `mds`
  ADD PRIMARY KEY (`mds_id`),
  ADD KEY `fk_pa_id` (`fk_pa_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`pa_id`),
  ADD KEY `fk_sender_id` (`fk_sender_id`),
  ADD KEY `fk_re_id` (`fk_re_id`);

--
-- Indexes for table `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`pr_id`),
  ADD KEY `fk_re_id` (`fk_re_id`),
  ADD KEY `fk_em_id` (`fk_em_id`),
  ADD KEY `fk_mds_id` (`fk_mds_id`);

--
-- Indexes for table `receiver`
--
ALTER TABLE `receiver`
  ADD PRIMARY KEY (`re_id`),
  ADD KEY `fk_a_id` (`fk_a_id`),
  ADD KEY `fk_pa_id` (`fk_pa_id`);

--
-- Indexes for table `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`sender_id`),
  ADD KEY `fk_a_id` (`fk_a_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivered`
--
ALTER TABLE `delivered`
  MODIFY `de_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `em_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mds`
--
ALTER TABLE `mds`
  MODIFY `mds_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `pa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `process`
--
ALTER TABLE `process`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receiver`
--
ALTER TABLE `receiver`
  MODIFY `re_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sender`
--
ALTER TABLE `sender`
  MODIFY `sender_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivered`
--
ALTER TABLE `delivered`
  ADD CONSTRAINT `delivered_ibfk_1` FOREIGN KEY (`fk_em_id`) REFERENCES `employee` (`em_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_mds_id`) REFERENCES `mds` (`mds_id`);

--
-- Constraints for table `mds`
--
ALTER TABLE `mds`
  ADD CONSTRAINT `mds_ibfk_1` FOREIGN KEY (`fk_pa_id`) REFERENCES `package` (`pa_id`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_sender_id`) REFERENCES `sender` (`sender_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_re_id`) REFERENCES `receiver` (`re_id`);

--
-- Constraints for table `process`
--
ALTER TABLE `process`
  ADD CONSTRAINT `process_ibfk_1` FOREIGN KEY (`fk_re_id`) REFERENCES `receiver` (`re_id`),
  ADD CONSTRAINT `process_ibfk_2` FOREIGN KEY (`fk_em_id`) REFERENCES `employee` (`em_id`),
  ADD CONSTRAINT `process_ibfk_3` FOREIGN KEY (`fk_mds_id`) REFERENCES `mds` (`mds_id`);

--
-- Constraints for table `receiver`
--
ALTER TABLE `receiver`
  ADD CONSTRAINT `receiver_ibfk_1` FOREIGN KEY (`fk_a_id`) REFERENCES `address` (`a_id`),
  ADD CONSTRAINT `receiver_ibfk_2` FOREIGN KEY (`fk_pa_id`) REFERENCES `package` (`pa_id`);

--
-- Constraints for table `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `sender_ibfk_1` FOREIGN KEY (`fk_a_id`) REFERENCES `address` (`a_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
