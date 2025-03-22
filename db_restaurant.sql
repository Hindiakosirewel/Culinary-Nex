-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2023 at 07:03 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `billdetails`
--

CREATE TABLE `billdetails` (
  `bill_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `item_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billstatus`
--

CREATE TABLE `billstatus` (
  `bill_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bill_phone` varchar(255) DEFAULT NULL,
  `bill_address` text DEFAULT NULL,
  `bill_when` varchar(255) DEFAULT NULL,
  `bill_method` varchar(255) DEFAULT NULL,
  `bill_discount` int(11) DEFAULT NULL,
  `bill_delivery` int(11) DEFAULT NULL,
  `bill_total` int(11) DEFAULT NULL,
  `bill_paid` varchar(255) DEFAULT NULL,
  `bill_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booktable`
--

CREATE TABLE `booktable` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `book_phone` varchar(255) DEFAULT NULL,
  `book_people` int(11) DEFAULT NULL,
  `book_tables` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `book_when` varchar(255) DEFAULT NULL,
  `book_note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `user_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `item_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `food_id` int(11) NOT NULL,
  `food_name` varchar(255) DEFAULT NULL,
  `food_star` varchar(255) DEFAULT NULL,
  `food_vote` varchar(255) DEFAULT NULL,
  `food_price` varchar(255) DEFAULT NULL,
  `food_discount` varchar(255) DEFAULT NULL,
  `food_desc` varchar(255) DEFAULT NULL,
  `food_status` varchar(255) DEFAULT NULL,
  `food_type` varchar(255) DEFAULT NULL,
  `food_category` varchar(255) DEFAULT NULL,
  `food_src` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`food_id`, `food_name`, `food_star`, `food_vote`, `food_price`, `food_discount`, `food_desc`, `food_status`, `food_type`, `food_category`, `food_src`) VALUES
(43, 'apple', '4.5', '999', '50.00', '0.00', '1 whole', 'b', 'regular meal', 'fruit', 'fruit/apple.png'),
(44, 'siomai', '4.5', '999', '20.00', '0.00', '4pcs', 'b', 'regular meal', 'dish', 'dish/siomai.png'),
(45, 'ice cream', '4.5', '999', '25.00', '0.00', '1 cup', 'b', 'regular meal', 'dessert', 'dessert/ice cream.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_birth` varchar(255) DEFAULT NULL,
  `user_gender` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `user_phone`, `user_password`, `user_birth`, `user_gender`) VALUES
(1, 'Raymond', 'raymond@gmail.com', '09075783463', '@1234567', '2003-12-07', 'male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billdetails`
--
ALTER TABLE `billdetails`
  ADD PRIMARY KEY (`bill_id`,`food_id`);

--
-- Indexes for table `billstatus`
--
ALTER TABLE `billstatus`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `booktable`
--
ALTER TABLE `booktable`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`user_id`,`food_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booktable`
--
ALTER TABLE `booktable`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
