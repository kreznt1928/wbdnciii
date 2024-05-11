-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2024 at 08:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rollie_kiosk`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `date_time` datetime DEFAULT current_timestamp(),
  `customer_name` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `total_price`, `date_time`, `customer_name`, `order_status`) VALUES
(2, 36.00, '2024-01-13 02:23:39', 'Angel Sebastian', 'Pending'),
(3, 12.00, '2024-01-14 15:42:15', 'Alexa Lyn Andrada', 'Confirmed'),
(4, 149.80, '2024-01-14 15:42:34', 'Benjie Ryan Hebron', 'Shipped'),
(5, 84.00, '2024-01-14 15:45:47', 'Jestoni Maravillas', 'Confirmed'),
(6, 84.00, '2024-01-14 15:46:30', 'Jun Tayag', 'Shipped'),
(11, 21.40, '2024-05-11 13:02:26', 'Rollie Morete', 'Pending'),
(12, 21.40, '2024-05-11 13:03:19', 'Rollie Morete', 'Pending'),
(13, 21.40, '2024-05-11 13:06:03', 'afsdf', 'Pending'),
(14, 21.40, '2024-05-11 13:06:36', 'Beverly', 'Pending'),
(15, 125.00, '2024-05-11 13:08:28', 'Beverly Mercurio', 'Pending'),
(16, 650.00, '2024-05-11 13:09:21', 'Ardelia Vidal', 'Pending'),
(17, 975.00, '2024-05-11 13:09:57', 'Jeb Mayonte', 'Pending'),
(18, 5221.35, '2024-05-11 13:19:23', 'Chester ', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 3, 2, 12.00, 123.00),
(3, 3, 2, 1.00, 12.00),
(4, 4, 1, 7.00, 21.40),
(5, 5, 2, 7.00, 12.00),
(6, 6, 2, 7.00, 12.00),
(8, 11, 1, 1.00, 21.40),
(9, 12, 1, 1.00, 21.40),
(10, 13, 1, 1.00, 21.40),
(11, 14, 1, 1.00, 21.40),
(12, 15, 3, 5.00, 25.00),
(13, 16, 5, 10.00, 65.00),
(14, 17, 5, 15.00, 65.00),
(15, 18, 4, 116.03, 45.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `price_per_unit` decimal(10,2) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `unit`, `price_per_unit`, `image_url`) VALUES
(1, 'Talong', 'kg', 21.40, 'images/cucumber.jpg'),
(2, 'Corn', 'pc', 12.00, 'images/corn.jpg'),
(3, 'Kalabasa', 'kg', 25.00, 'images/Picture (5).jpg'),
(4, 'Ampalaya', 'kg', 45.00, 'images/Picture (6).jpg'),
(5, 'Singkamas', 'bl', 65.00, 'images/Picture (7).jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
