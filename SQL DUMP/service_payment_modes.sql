-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 01, 2024 at 12:39 PM
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
-- Database: `absolute_barber`
--

-- --------------------------------------------------------

--
-- Table structure for table `service_payment_modes`
--

CREATE TABLE `service_payment_modes` (
  `id` int(11) NOT NULL,
  `method_key` varchar(200) DEFAULT NULL,
  `method_name` varchar(100) DEFAULT NULL,
  `service_type` varchar(200) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_payment_modes`
--

INSERT INTO `service_payment_modes` (`id`, `method_key`, `method_name`, `service_type`, `enabled`) VALUES
(1, 'PayPal', 'Paypal', 'regular', 1),
(2, 'PayPal', 'Paypal', 'appointed', 1),
(3, 'Stripe', 'Stripe', 'regular', 1),
(4, 'Stripe', 'Stripe', 'appointed', 1),
(5, 'CashInShop', 'Cash in shop', 'regular', 1),
(6, 'CashInShop', 'Cash in shop', 'appointed', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `service_payment_modes`
--
ALTER TABLE `service_payment_modes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `service_payment_modes`
--
ALTER TABLE `service_payment_modes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
