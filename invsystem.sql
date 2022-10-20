-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3305
-- Generation Time: Oct 20, 2022 at 04:29 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_active` int(11) NOT NULL DEFAULT 0,
  `brand_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `brand_active`, `brand_status`) VALUES
(1, 'Celcom', 1, 1),
(2, 'Digi', 1, 1),
(3, 'INGENICO', 1, 1),
(4, 'WYZE', 1, 1),
(5, 'Apple', 1, 1),
(6, 'Samsung', 1, 1),
(7, 'TP-Link', 1, 1),
(8, 'Amazon', 1, 1),
(9, 'Sony', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(255) NOT NULL,
  `categories_active` int(11) NOT NULL DEFAULT 0,
  `categories_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_active`, `categories_status`) VALUES
(1, 'Sim Card', 1, 1),
(2, 'Terminal', 1, 1),
(3, 'Hoodies & Sweatshirts', 1, 1),
(4, 'Shorts', 1, 1),
(5, 'Jackets', 1, 1),
(6, 'Security Camera', 1, 1),
(7, 'Routers', 1, 1),
(8, 'Smart Phones', 1, 2),
(9, 'Headphones', 1, 1),
(10, 'Alexa Voice Remote', 1, 2),
(11, 'Chargers', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `client_name` varchar(255) NOT NULL,
  `client_contact` varchar(255) NOT NULL,
  `sub_total` varchar(255) NOT NULL,
  `vat` varchar(255) NOT NULL,
  `total_amount` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `paid` varchar(255) NOT NULL,
  `due` varchar(255) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `payment_place` int(11) NOT NULL,
  `gstn` varchar(255) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `state_name` varchar(50) NOT NULL,
  `brand_name` varchar(50) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `client_name`, `client_contact`, `sub_total`, `vat`, `total_amount`, `discount`, `grand_total`, `paid`, `due`, `payment_type`, `payment_status`, `payment_place`, `gstn`, `order_status`, `user_id`, `state_name`, `brand_name`, `category_name`, `product_name`, `product_id`) VALUES
(1, '2022-10-18 02:31:06', 'James Rusell', '7014444410', '49.00', '8.82', '57.82', '0', '57.82', '60', '-2.18', 2, 1, 1, '8.82', 1, 1, '0', '0', '0', '', 1),
(2, '2022-10-18 02:31:06', 'Thomas', '7014445400', '45.00', '8.10', '53.10', '0', '53.10', '55', '-1.90', 3, 1, 1, '8.10', 1, 1, '0', '0', '0', '', 1),
(3, '2022-10-18 02:31:06', 'Colin', '7896500020', '45.00', '8.10', '53.10', '0', '53.10', '100', '-46.90', 2, 2, 2, '8.10', 1, 1, '0', '0', '0', '', 1),
(4, '2022-10-18 02:31:06', 'Jack', '8547854444', '264.00', '47.52', '311.52', '0', '311.52', '311.52', '0.00', 2, 1, 1, '47.52', 1, 1, '0', '0', '0', '', 1),
(5, '2022-10-18 02:31:06', 'Thomas Stuart', '8540001014', '106.00', '19.08', '125.08', '0', '125.08', '125', '0.08', 1, 1, 1, '19.08', 1, 1, '0', '0', '0', '', 1),
(6, '2022-10-18 02:31:06', 'James Greenwood', '5214440120', '742.00', '133.56', '875.56', '0', '875.56', '875.56', '0.00', 2, 1, 1, '133.56', 1, 1, '0', '0', '0', '', 1),
(7, '2022-10-18 02:31:06', 'Annie Gillespie', '7450126690', '90.00', '16.20', '106.20', '0', '106.20', '106.20', '0.00', 3, 1, 1, '16.20', 1, 2, '0', '0', '0', '', 1),
(8, '2022-10-18 02:31:06', 'Kristen Stiger', '8540001250', '348.00', '62.64', '410.64', '0', '410.64', '410.64', '0.00', 2, 1, 1, '62.64', 1, 2, '0', '0', '0', '', 1),
(9, '2022-10-18 02:31:06', 'Jamie ', '7401114536', '1284.00', '231.12', '1515.12', '0', '1515.12', '1515.12', '0.00', 2, 1, 1, '231.12', 2, 1, '0', '0', '0', '', 1),
(10, '2022-10-18 02:31:06', 'William Moore', '7410000069', '274.00', '49.32', '323.32', '10', '313.32', '313.32', '0.00', 3, 1, 1, '49.32', 1, 1, '0', '0', '0', '', 1),
(11, '2022-10-18 02:31:06', 'abu', '0178379183', '740.00', '133.20', '873.20', '0', '873.20', '900.00', '-26.80', 2, 1, 1, '95.40', 2, 1, '0', '0', '0', '', 1),
(12, '2022-10-18 02:31:06', 'ali', '089228393', '530.00', '95.40', '625.40', '0', '625.40', '600', '25.40', 1, 1, 1, '95.40', 1, 1, '0', '0', '0', '', 1),
(13, '2022-10-18 02:31:06', 'abugin', '0142929492', '69.00', '12.42', '81.42', '0', '81.42', '90', '-8.58', 2, 1, 1, '12.42', 1, 1, '', '', '', '', 1),
(14, '2022-10-18 02:31:06', 'abugin2', '0178784738', '69.00', '12.42', '81.42', '0', '81.42', '90', '-8.58', 1, 1, 2, '12.42', 1, 1, '', '', '', '', 1),
(15, '2022-10-18 02:31:06', 'chihs', '018947284', '69.00', '12.42', '81.42', '0', '81.42', '90', '-8.58', 1, 1, 1, '12.42', 1, 1, '', '', '', '', 1),
(35, '2022-10-18 02:50:30', 'ABUGIN12', '0148293920', '69.00', '12.42', '81.42', '0', '81.42', '90', '-8.58', 1, 2, 1, '12.42', 1, 1, '', '', '', '', 0),
(36, '2022-10-18 02:51:31', 'fadsfgad', '01748293092', '2.00', '0.36', '2.36', '0', '2.36', '4', '-1.64', 1, 1, 2, '0.36', 1, 1, '', '', '', '', NULL),
(37, '2022-10-18 07:09:24', 'fhgjhho', '0126879998', '0.00', '0.00', '0.00', '0', '0.00', '0', '0.00', 3, 1, 1, '0.00', 1, 1, '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `quantity` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `order_item_status` int(11) NOT NULL DEFAULT 0,
  `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `order_id`, `product_id`, `quantity`, `rate`, `total`, `order_item_status`, `state_id`) VALUES
(1, 1, 1, '2', '49', '49.00', 1, 0),
(2, 2, 13, '2', '45', '45.00', 1, 0),
(3, 3, 15, '31', '45', '45.00', 1, 0),
(4, 0, 16, '12', '22', '264.00', 1, 0),
(5, 0, 16, '13', '22', '264.00', 1, 0),
(6, 0, 16, '12', '22', '286.00', 1, 0),
(7, 4, 16, '12', '22', '264.00', 1, 0),
(8, 5, 3, '2', '53', '106.00', 1, 0),
(9, 6, 3, '14', '53', '742.00', 1, 0),
(10, 7, 15, '2', '45', '90.00', 1, 0),
(11, 8, 9, '4', '87', '348.00', 1, 0),
(12, 9, 14, '4', '321', '1284.00', 2, 0),
(13, 10, 6, '1', '70', '70.00', 1, 0),
(14, 10, 7, '1', '29', '29.00', 1, 0),
(15, 10, 10, '1', '35', '35.00', 1, 0),
(16, 10, 4, '1', '140', '140.00', 1, 0),
(18, 11, 3, '10', '53', '530.00', 2, 0),
(19, 11, 5, '1', '210', '210.00', 2, 0),
(20, 12, 3, '10', '53', '530.00', 1, 0),
(21, 13, 1, '1', '69', '69.00', 1, 0),
(22, 14, 1, '1', '69', '69.00', 1, 0),
(23, 32, 2, '1', '2', '2.00', 1, 0),
(24, 34, 1, '1', '69', '69.00', 1, 0),
(25, 35, 1, '1', '69', '69.00', 1, 0),
(26, 36, 2, '1', '2', '2.00', 1, 0),
(27, 37, 65, '1', '0', '0.00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` text NOT NULL,
  `brand_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `submit_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user` varchar(50) NOT NULL,
  `state_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `state_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_image`, `brand_id`, `categories_id`, `quantity`, `rate`, `active`, `status`, `submit_date`, `user`, `state_id`, `type_id`, `state_name`) VALUES
(65, 'Digi', '../assests/images/stock/1855834822634e30203ca56.jpg', 2, 1, '99', '0', 1, 1, '2022-10-18 07:09:24', '', 4, 0, ''),
(67, 'Celcom', '../assests/images/stock/380519876634e30dc9aea3.jpg', 1, 2, '100', '0', 1, 1, '2022-10-18 04:51:40', '', 5, 0, ''),
(68, 'gerwgrew', '../assests/images/stock/1566955802634e3401f41bf.jpg', 5, 6, '30', '', 1, 1, '2022-10-18 05:05:06', '', 2, 0, ''),
(104, 'jfld', '../assests/images/stock/1315513554634e5180a16b1.jpg', 3, 2, '10', '', 1, 1, '2022-10-18 07:10:56', '', 10, 0, ''),
(112, 'jjaof', '../assests/images/stock/1709108190634e51d0ee37f.jpg', 3, 3, '20', '', 1, 1, '2022-10-18 07:12:16', '', 5, 0, ''),
(113, '', '', 0, 0, '', '', 0, 0, '2022-10-18 07:12:16', '', 0, 0, 'Perak'),
(114, '', '', 0, 0, '', '', 0, 0, '2022-10-18 07:12:16', '', 0, 0, 'Kedah'),
(115, '', '', 0, 0, '', '', 0, 0, '2022-10-18 07:12:16', '', 0, 0, 'Johor'),
(116, '', '', 0, 0, '', '', 0, 0, '2022-10-18 07:12:16', '', 0, 0, 'Perlis'),
(117, '', '', 0, 0, '', '', 0, 0, '2022-10-18 07:12:16', '', 0, 0, 'Kedah'),
(120, 'adjfanv', '../assests/images/stock/1562350491634e56f8c4cd4.jpg', 1, 2, '20', '', 1, 1, '2022-10-18 07:34:16', '', 0, 0, '4'),
(121, 'fghjk', '../assests/images/stock/2059087111634e5c93e6db8.jpg', 3, 4, '30', '', 1, 1, '2022-10-18 07:58:11', '', 0, 0, 'Johor');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL,
  `state_active` int(11) NOT NULL DEFAULT 0,
  `state_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_name`, `state_active`, `state_status`) VALUES
(1, 'Selangor', 1, 1),
(2, 'Johor', 1, 1),
(3, 'Kelantan', 1, 1),
(4, 'Perak', 1, 1),
(5, 'Kedah', 1, 1),
(6, 'Melaka', 1, 1),
(7, 'Terengganu', 1, 1),
(8, 'Melaka', 1, 1),
(9, 'Pahang', 1, 1),
(10, 'Perlis', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `stocks_id` int(11) NOT NULL,
  `stocks_date` date NOT NULL,
  `emp_name` varchar(255) NOT NULL,
  `emp_contact` varchar(255) NOT NULL,
  `sub_total` varchar(255) NOT NULL,
  `vat` varchar(255) NOT NULL,
  `total_amount` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `paid` varchar(255) NOT NULL,
  `due` varchar(255) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `payment_place` int(11) NOT NULL,
  `gstn` varchar(255) NOT NULL,
  `stock_status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`stocks_id`, `stocks_date`, `emp_name`, `emp_contact`, `sub_total`, `vat`, `total_amount`, `discount`, `grand_total`, `paid`, `due`, `payment_type`, `payment_status`, `payment_place`, `gstn`, `stock_status`, `user_id`) VALUES
(1, '2021-06-02', 'James Rusell', '7014444410', '49.00', '8.82', '57.82', '0', '57.82', '60', '-2.18', 2, 1, 1, '8.82', 1, 1),
(2, '2021-06-02', 'Thomas', '7014445400', '45.00', '8.10', '53.10', '0', '53.10', '55', '-1.90', 3, 1, 1, '8.10', 1, 1),
(3, '2021-06-02', 'Colin', '7896500020', '45.00', '8.10', '53.10', '0', '53.10', '100', '-46.90', 2, 2, 2, '8.10', 1, 1),
(4, '2022-01-18', 'Jack', '8547854444', '264.00', '47.52', '311.52', '0', '311.52', '311.52', '0.00', 2, 1, 1, '47.52', 1, 1),
(5, '2022-01-26', 'Thomas Stuart', '8540001014', '106.00', '19.08', '125.08', '0', '125.08', '125', '0.08', 1, 1, 1, '19.08', 1, 1),
(6, '2022-01-31', 'James Greenwood', '5214440120', '742.00', '133.56', '875.56', '0', '875.56', '875.56', '0.00', 2, 1, 1, '133.56', 1, 1),
(7, '2022-01-31', 'Annie Gillespie', '7450126690', '90.00', '16.20', '106.20', '0', '106.20', '106.20', '0.00', 3, 1, 1, '16.20', 1, 2),
(8, '2022-01-30', 'Kristen Stiger', '8540001250', '348.00', '62.64', '410.64', '0', '410.64', '410.64', '0.00', 2, 1, 1, '62.64', 1, 2),
(9, '2022-02-02', 'Jamie ', '7401114536', '1284.00', '231.12', '1515.12', '0', '1515.12', '1515.12', '0.00', 2, 1, 1, '231.12', 1, 1),
(10, '2022-02-02', 'William Moore', '7410000069', '274.00', '49.32', '323.32', '10', '313.32', '313.32', '0.00', 3, 1, 1, '49.32', 1, 1),
(11, '2022-10-13', 'abu', '0178379183', '740.00', '133.20', '873.20', '0', '873.20', '900.00', '-26.80', 2, 1, 1, '95.40', 1, 1),
(12, '2022-10-14', 'abu', '019826837', '53.00', '9.54', '62.54', '0', '62.54', '62.54', '0.00', 1, 1, 1, '9.54', 1, 1),
(13, '2022-10-15', 'fdsfsf', '01938293723', '530.00', '95.40', '625.40', '0', '625.40', '700', '-74.60', 1, 1, 1, '95.40', 1, 1),
(14, '2022-10-15', 'fdsfsf', '01938293723', '530.00', '95.40', '625.40', '0', '625.40', '700', '-74.60', 1, 1, 1, '95.40', 1, 1),
(15, '2022-10-14', 'abufs', '0284829382', '2650.00', '477.00', '3127.00', '0', '3127.00', '3000.00', '127.00', 1, 1, 1, '477.00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock_item`
--

CREATE TABLE `stock_item` (
  `stock_item_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `quantity` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `stock_item_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_item`
--

INSERT INTO `stock_item` (`stock_item_id`, `stock_id`, `product_id`, `quantity`, `rate`, `total`, `stock_item_status`) VALUES
(1, 1, 1, '2', '49', '49.00', 1),
(2, 2, 13, '2', '45', '45.00', 1),
(3, 3, 15, '31', '45', '45.00', 1),
(4, 0, 16, '12', '22', '264.00', 1),
(5, 0, 16, '13', '22', '264.00', 1),
(6, 0, 16, '12', '22', '286.00', 1),
(7, 4, 16, '12', '22', '264.00', 1),
(8, 5, 3, '2', '53', '106.00', 1),
(9, 6, 3, '14', '53', '742.00', 1),
(10, 7, 15, '2', '45', '90.00', 1),
(11, 8, 9, '4', '87', '348.00', 1),
(12, 9, 14, '4', '321', '1284.00', 1),
(13, 10, 6, '1', '70', '70.00', 1),
(14, 10, 7, '1', '29', '29.00', 1),
(15, 10, 10, '1', '35', '35.00', 1),
(16, 10, 4, '1', '140', '140.00', 1),
(18, 11, 3, '10', '53', '530.00', 1),
(19, 11, 5, '1', '210', '210.00', 1),
(20, 12, 3, '10', '53', '53.00', 1),
(21, 13, 3, '10', '53', '530.00', 1),
(22, 14, 3, '10', '53', '530.00', 1),
(23, 15, 3, '50', '53', '2650.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `type_active` int(11) NOT NULL,
  `type_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`, `type_active`, `type_status`) VALUES
(1, 'Terminal', 1, 1),
(2, 'SimCard', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`) VALUES
(1, 'admin', 'd00f5d5217896fb7fd601412cb890830', ''),
(2, 'staff', '5f4dcc3b5aa765d61d8327deb882cf99', 'staff@stockmg.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`stocks_id`);

--
-- Indexes for table `stock_item`
--
ALTER TABLE `stock_item`
  ADD PRIMARY KEY (`stock_item_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `stocks_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `stock_item`
--
ALTER TABLE `stock_item`
  MODIFY `stock_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
