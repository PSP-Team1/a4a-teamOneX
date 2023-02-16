-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: database
-- Generation Time: Feb 07, 2023 at 03:51 PM
-- Server version: 8.0.32
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_profile`
--

CREATE TABLE `account_profile` (
  `acc_id` int NOT NULL,
  `company_id` int NOT NULL,
  `reg_date` date NOT NULL,
  `t_c_approved` tinyint(1) NOT NULL,
  `postcode` text NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_assets`
--

CREATE TABLE `audit_assets` (
  `id` int NOT NULL,
  `asset_desc` text NOT NULL,
  `path` text NOT NULL,
  `audit_id` text NOT NULL,
  `last_updated` timestamp NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_media`
--

CREATE TABLE `audit_media` (
  `id` int NOT NULL,
  `aud_resp_id` text NOT NULL,
  `media_type` text NOT NULL,
  `file_size` text NOT NULL,
  `location` text NOT NULL,
  `compression` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_response`
--

CREATE TABLE `audit_response` (
  `id` int NOT NULL,
  `question_id` text NOT NULL,
  `audit_id` text NOT NULL,
  `response` tinyint NOT NULL,
  `auditor` text NOT NULL,
  `date_created` date NOT NULL,
  `last_updated` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_template`
--

CREATE TABLE `audit_template` (
  `id` int NOT NULL,
  `audit_version` text NOT NULL,
  `auditor` text NOT NULL,
  `published_status` text NOT NULL,
  `legislation_version` text NOT NULL,
  `publisher` text NOT NULL,
  `date_created` date NOT NULL,
  `last_updated` timestamp NOT NULL,
  `last_updated_bu` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b_customers`
--

CREATE TABLE `b_customers` (
  `id` int NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b_customers`
--

INSERT INTO `b_customers` (`id`, `company_name`, `date_created`) VALUES
(1, 'Customer A', '2023-02-04 03:48:34'),
(2, 'Customer B', '2023-02-04 03:48:34'),
(3, 'Customer C', '2023-02-04 03:48:34'),
(4, 'Customer D', '2023-02-04 03:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int NOT NULL,
  `description` text NOT NULL,
  `company_name` text NOT NULL,
  `hq_addr` text NOT NULL,
  `director` text NOT NULL,
  `last_updated` text NOT NULL,
  `company_no` text NOT NULL,
  `company_type` text NOT NULL,
  `is_reg_charity` tinyint(1) NOT NULL,
  `company_role` text NOT NULL,
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_venue`
--

CREATE TABLE `company_venue` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `company_name` text NOT NULL,
  `address` text NOT NULL,
  `postcode` text NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `digital_products`
--

CREATE TABLE `digital_products` (
  `id` int NOT NULL,
  `product_name` text NOT NULL,
  `product_type` text NOT NULL,
  `validity` text NOT NULL,
  `digitalProductUsage` text NOT NULL,
  `rrp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_preferences`
--

CREATE TABLE `marketing_preferences` (
  `id` int NOT NULL,
  `preference_name` text NOT NULL,
  `pref_val` text NOT NULL,
  `last_update` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `transaction_id` int NOT NULL,
  `acc_holder` text NOT NULL,
  `order_date` date NOT NULL,
  `ip_address` text NOT NULL,
  `transaction_status` text NOT NULL,
  `reference_unique` text NOT NULL,
  `total` int NOT NULL,
  `promo_code(s)` text NOT NULL,
  `special_notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `transaction_id` text NOT NULL,
  `acc_holder` text NOT NULL,
  `order_date` date NOT NULL,
  `ip_address` text NOT NULL,
  `transaction_status` text NOT NULL,
  `order_id` text NOT NULL,
  `product_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_item`
--

CREATE TABLE `permission_item` (
  `id` int NOT NULL,
  `content` text NOT NULL,
  `access` text NOT NULL,
  `role_id` text NOT NULL,
  `last_updated` timestamp NOT NULL,
  `updated_by` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preference_controls`
--

CREATE TABLE `preference_controls` (
  `id` int NOT NULL,
  `preference_name` text NOT NULL,
  `pref_val` text NOT NULL,
  `last_update` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preference_data`
--

CREATE TABLE `preference_data` (
  `id` int NOT NULL,
  `preference_name` text NOT NULL,
  `pref_val` text NOT NULL,
  `last_update` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_data`
--

CREATE TABLE `product_data` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` text NOT NULL,
  `account` text NOT NULL,
  `venue` text NOT NULL,
  `start_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `productUsage` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int NOT NULL,
  `question` text NOT NULL,
  `cateogry` text NOT NULL,
  `date_created` date NOT NULL,
  `last_updated` date NOT NULL,
  `template_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `description` text NOT NULL,
  `last_updated` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sys_users`
--

CREATE TABLE `sys_users` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text NOT NULL,
  `email` text NOT NULL,
  `role_id` text NOT NULL,
  `date_created` date NOT NULL,
  `company_id` text NOT NULL,
  `last_login` timestamp NOT NULL,
  `user_preferences` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `venue_audit`
--

CREATE TABLE `venue_audit` (
  `id` int NOT NULL,
  `audit_version` text NOT NULL,
  `company_id` text NOT NULL,
  `auditor` text NOT NULL,
  `date_created` date NOT NULL,
  `last_updated` date NOT NULL,
  `template_id` text NOT NULL,
  `audit_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `b_customers`
--
ALTER TABLE `b_customers`
  ADD UNIQUE KEY `customer_pk` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `b_customers`
--
ALTER TABLE `b_customers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
