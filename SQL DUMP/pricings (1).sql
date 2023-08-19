-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 20, 2023 at 12:13 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beauty`
--

-- --------------------------------------------------------

--
-- Table structure for table `pricings`
--

CREATE TABLE `pricings` (
  `id` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `currency` varchar(20) NOT NULL DEFAULT '$',
  `format` varchar(100) DEFAULT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`features`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pricings`
--

INSERT INTO `pricings` (`id`, `title`, `subtitle`, `price`, `currency`, `format`, `features`, `created_at`, `updated_at`) VALUES
(1, 'deluxe', 'For our pro users', 1990, '$', 'monthly', '[\"unlimited tests\",\"5 active domains\",\"10 active goals\",\"5 active projects\",\"5+ personalizations\",\"basic post-segmenation\",\"live log\"]', '2023-08-19 14:57:46', '2023-08-19 22:12:26'),
(2, 'standard', 'our most popular plan', 880, '$', 'yearly', '[\"unlimited tests\",\"5 active domains\",\"10 active goals\",\"5 active projects\",\"5+ personalizations\",\"basic post-segmenation\",\"live log\"]', '2023-08-19 15:29:19', '2023-08-19 22:12:22'),
(4, 'basic', 'For our users just sorting out', 699, '$', 'yearly', '[\"unlimited tests\",\"5 active domains\",\"10 active goals\",\"5 active projects\",\"5+ personalizations\",\"basic post-segmenation\",\"live log\"]', '2023-08-19 16:44:41', '2023-08-19 16:44:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pricings`
--
ALTER TABLE `pricings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pricings`
--
ALTER TABLE `pricings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
