-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2020 at 07:33 AM
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

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`a_id`, `a_streetname`, `a_postalcode`, `a_city`) VALUES
(1, 'Geiselbergstr', 1110, 'Vienna'),
(2, 'Berlinerstrs', 13350, 'Berlin'),
(3, 'Bagdat STR', 34000, 'istanbul'),
(4, 'DresdnerStr', 1200, 'Vienna'),
(5, 'Karlova', 22223, 'Prague'),
(6, 'Hochbergstr', 4440, 'Salzburg');

-- --------------------------------------------------------

--
-- Table structure for table `delivered`
--

CREATE TABLE `delivered` (
  `de_id` int(11) NOT NULL,
  `fk_em_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivered`
--

INSERT INTO `delivered` (`de_id`, `fk_em_id`) VALUES
(2, 1),
(1, 3);

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

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`em_id`, `em_first_name`, `em_last_name`, `fk_mds_id`) VALUES
(1, 'Pierre', 'Cox', 7),
(2, 'Thomas', 'Crane', 6),
(3, 'Bradyn', 'Kramer', 5);

-- --------------------------------------------------------

--
-- Table structure for table `mds`
--

CREATE TABLE `mds` (
  `mds_id` int(11) NOT NULL,
  `fk_pa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mds`
--

INSERT INTO `mds` (`mds_id`, `fk_pa_id`) VALUES
(3, 1),
(4, 2),
(1, 3),
(5, 4),
(6, 5),
(2, 6),
(7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `pa_id` int(11) NOT NULL,
  `pa_size` varchar(55) DEFAULT NULL,
  `pa_pickedupdate` date DEFAULT current_timestamp(),
  `pa_status` enum('station','home') DEFAULT NULL,
  `fk_sender_id` int(11) DEFAULT NULL,
  `fk_re_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`pa_id`, `pa_size`, `pa_pickedupdate`, `pa_status`, `fk_sender_id`, `fk_re_id`) VALUES
(1, 'Small', '2020-07-14', 'station', 2, 1),
(2, 'Small', '2020-07-10', 'home', 3, 2),
(3, 'Heavy', '2020-07-19', 'home', 3, 2),
(4, 'Small', '2020-07-17', 'station', 1, 1),
(5, 'Small', '2020-07-20', 'home', 3, 3),
(6, 'Heavy', '2020-07-10', 'home', 1, 3);

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

--
-- Dumping data for table `process`
--

INSERT INTO `process` (`pr_id`, `picked_up_date`, `delivered_date`, `delivered_status`, `fk_re_id`, `fk_em_id`, `fk_mds_id`) VALUES
(1, '2020-07-06', '2020-07-09', 'Y', 2, 3, 1),
(2, '2020-07-08', '2020-07-13', 'N', 2, 1, 2),
(3, '2020-07-06', '2020-07-29', 'N', 1, 2, 6);

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

--
-- Dumping data for table `receiver`
--

INSERT INTO `receiver` (`re_id`, `re_first_name`, `re_last_name`, `fk_a_id`, `fk_pr_id`, `fk_pa_id`) VALUES
(1, 'Cierra', 'Vega', 1, 2, 1),
(2, 'Alden', 'Cantrel', 2, 2, 2),
(3, 'Miranda', 'Shaffer', 3, 3, 3);

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
-- Dumping data for table `sender`
--

INSERT INTO `sender` (`sender_id`, `sender_first_name`, `sender_name_name`, `resident_city`, `fk_a_id`) VALUES
(1, 'Giovanny', 'Tucker', 'Istanbul', 3),
(2, 'Mylie', 'Barron', 'BERLIN', 2),
(3, 'Hulya', 'Kurt', 'Vienna', 1);

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
  ADD KEY `fk_pa_id` (`fk_pa_id`),
  ADD KEY `fk_pr_id` (`fk_pr_id`);

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
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `delivered`
--
ALTER TABLE `delivered`
  MODIFY `de_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `em_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mds`
--
ALTER TABLE `mds`
  MODIFY `mds_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `pa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `process`
--
ALTER TABLE `process`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `receiver`
--
ALTER TABLE `receiver`
  MODIFY `re_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sender`
--
ALTER TABLE `sender`
  MODIFY `sender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `receiver_ibfk_2` FOREIGN KEY (`fk_pa_id`) REFERENCES `package` (`pa_id`),
  ADD CONSTRAINT `receiver_ibfk_3` FOREIGN KEY (`fk_pa_id`) REFERENCES `package` (`pa_id`),
  ADD CONSTRAINT `receiver_ibfk_4` FOREIGN KEY (`fk_pr_id`) REFERENCES `process` (`pr_id`),
  ADD CONSTRAINT `receiver_ibfk_5` FOREIGN KEY (`fk_a_id`) REFERENCES `address` (`a_id`);

--
-- Constraints for table `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `sender_ibfk_1` FOREIGN KEY (`fk_a_id`) REFERENCES `address` (`a_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
