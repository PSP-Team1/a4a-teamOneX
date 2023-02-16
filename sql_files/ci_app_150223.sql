-- --------------------------------------------------------
-- Host:                         192.168.1.122
-- Server version:               8.0.32 - MySQL Community Server - GPL
-- Server OS:                    Linux
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ci_app
CREATE DATABASE IF NOT EXISTS `ci_app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ci_app`;

-- Dumping structure for table ci_app.account_profile
CREATE TABLE IF NOT EXISTS `account_profile` (
  `acc_id` int NOT NULL,
  `company_id` int NOT NULL,
  `reg_date` date NOT NULL,
  `t_c_approved` tinyint(1) NOT NULL,
  `postcode` text NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.account_profile: ~0 rows (approximately)
/*!40000 ALTER TABLE `account_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_profile` ENABLE KEYS */;

-- Dumping structure for table ci_app.audit_assets
CREATE TABLE IF NOT EXISTS `audit_assets` (
  `id` int NOT NULL,
  `asset_desc` text NOT NULL,
  `path` text NOT NULL,
  `audit_id` text NOT NULL,
  `last_updated` timestamp NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.audit_assets: ~0 rows (approximately)
/*!40000 ALTER TABLE `audit_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_assets` ENABLE KEYS */;

-- Dumping structure for table ci_app.audit_media
CREATE TABLE IF NOT EXISTS `audit_media` (
  `id` int NOT NULL,
  `aud_resp_id` text NOT NULL,
  `media_type` text NOT NULL,
  `file_size` text NOT NULL,
  `location` text NOT NULL,
  `compression` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.audit_media: ~0 rows (approximately)
/*!40000 ALTER TABLE `audit_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_media` ENABLE KEYS */;

-- Dumping structure for table ci_app.audit_questions
CREATE TABLE IF NOT EXISTS `audit_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `category` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NULL DEFAULT NULL,
  `template_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_audit_questions_audit_template` (`template_id`),
  CONSTRAINT `FK_audit_questions_audit_template` FOREIGN KEY (`template_id`) REFERENCES `audit_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.audit_questions: ~102 rows (approximately)
/*!40000 ALTER TABLE `audit_questions` DISABLE KEYS */;
INSERT INTO `audit_questions` (`id`, `question`, `category`, `date_created`, `last_updated`, `template_id`) VALUES
	(6, 'Level access to main entrance', 'general', '2023-02-13 13:50:48', NULL, 1),
	(7, 'Alternative entrance signposted', 'general', '2023-02-13 13:50:48', NULL, 1),
	(8, 'Fast-track queueing policy?', 'general', '2023-02-13 13:50:48', NULL, 1),
	(9, 'Level area available in front of accessible entrance', 'general', '2023-02-13 13:50:48', NULL, 1),
	(10, 'Weather protection available', 'general', '2023-02-13 13:50:48', NULL, 1),
	(11, 'Level threshold over entrance', 'general', '2023-02-13 13:50:48', NULL, 1),
	(12, 'Effective Clear Opening door width (1m external entrance door, 800mm internal door)', 'general', '2023-02-13 13:50:48', NULL, 1),
	(13, 'Activity space available to opening edge of door (300mm)', 'general', '2023-02-13 13:50:48', NULL, 1),
	(14, 'Automatic door / ‘push button’ door', 'general', '2023-02-13 13:50:48', NULL, 1),
	(15, 'Vision panels to entrance door', 'general', '2023-02-13 13:50:48', NULL, 1),
	(16, 'Manifestations to glazed panes', 'general', '2023-02-13 13:50:48', NULL, 1),
	(17, 'Ear defenders available to borrow', 'general', '2023-02-13 13:50:48', NULL, 1),
	(18, 'Lobby area clear of obstacles / projections', 'general', '2023-02-13 13:50:48', NULL, 1),
	(19, 'Lowered counter', 'general', '2023-02-13 13:50:48', NULL, 1),
	(20, 'Hearing loop available', 'general', '2023-02-13 13:50:48', NULL, 1),
	(21, 'Subtitles on key videos in venue', 'general', '2023-02-13 13:50:48', NULL, 1),
	(22, 'Flashing Fire / Smoke Alarms', 'general', '2023-02-13 13:50:48', NULL, 1),
	(23, 'BSL Signed sessions / tours', 'general', '2023-02-13 13:50:48', NULL, 1),
	(24, 'Pen and paper', 'general', '2023-02-13 13:50:48', NULL, 1),
	(25, 'Good visual Contrast', 'general', '2023-02-13 13:50:48', NULL, 1),
	(26, 'Leaflets, menus and maps available in large print', 'general', '2023-02-13 13:50:48', NULL, 1),
	(27, 'Magnifiers available', 'general', '2023-02-13 13:50:48', NULL, 1),
	(28, 'Sound boxes or sound benches available', 'general', '2023-02-13 13:50:48', NULL, 1),
	(29, 'Venue free of clutter / obstacles at floor and head height', 'general', '2023-02-13 13:50:48', NULL, 1),
	(30, 'Good lighting levels throughout', 'general', '2023-02-13 13:50:48', NULL, 1),
	(31, 'Key signage and information available in Braille', 'general', '2023-02-13 13:50:48', NULL, 1),
	(32, 'Tactile maps and models', 'general', '2023-02-13 13:50:48', NULL, 1),
	(33, '‘Touch’ Tours', 'general', '2023-02-13 13:50:48', NULL, 1),
	(34, 'Lift available?', 'general', '2023-02-13 13:50:48', NULL, 1),
	(35, 'Wheelchair available for hire?', 'general', '2023-02-13 13:50:48', NULL, 1),
	(36, 'Provision of handrails (recommended height 900mm, with a lower handrail at 600mm)', 'general', '2023-02-13 13:50:48', NULL, 1),
	(37, 'Appropriate door widths for w/c', 'general', '2023-02-13 13:50:48', NULL, 1),
	(38, 'Interpretation and displays at a suitable height for wheelchair users?', 'general', '2023-02-13 13:50:48', NULL, 1),
	(39, 'Adequate circulation space', 'general', '2023-02-13 13:50:48', NULL, 1),
	(40, 'Seating available', 'general', '2023-02-13 13:50:48', NULL, 1),
	(41, 'Relaxed’ sessions available?', 'general', '2023-02-13 13:50:48', NULL, 1),
	(42, 'Quiet’ or Sensory Space available?', 'general', '2023-02-13 13:50:48', NULL, 1),
	(43, 'Memory Box available?', 'general', '2023-02-13 13:50:48', NULL, 1),
	(44, 'Neutral threshold mat', 'general', '2023-02-13 13:50:48', NULL, 1),
	(45, 'Accessibility tab on Home page', 'website', '2023-02-13 13:50:48', NULL, 1),
	(46, 'Information provided separately for visitors with: Vision impairment Hearing impairment Mobility impairment Autism, Dementia', 'website', '2023-02-13 13:50:48', NULL, 1),
	(47, 'Videos available on website.', 'website', '2023-02-13 13:50:48', NULL, 1),
	(48, 'Audio description of video available', 'website', '2023-02-13 13:50:48', NULL, 1),
	(49, 'Link to on-line Accessibility Guide', 'website', '2023-02-13 13:50:48', NULL, 1),
	(50, 'Audio version of Accessibility Guide available on website', 'website', '2023-02-13 13:50:48', NULL, 1),
	(51, 'Sensory Story available', 'website', '2023-02-13 13:50:48', NULL, 1),
	(52, 'Wi-Fi Code displayed?', 'website', '2023-02-13 13:50:48', NULL, 1),
	(53, 'Free familiarisation visits offered?', 'website', '2023-02-13 13:50:48', NULL, 1),
	(54, 'Information on concessions available', 'website', '2023-02-13 13:50:48', NULL, 1),
	(55, 'Adjustable text and contrast available on website', 'website', '2023-02-13 13:50:48', NULL, 1),
	(56, 'Website meets W3C website accessibility guidelines', 'website', '2023-02-13 13:50:48', NULL, 1),
	(57, 'Is there an accessible toilet', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(58, 'Is there appropriate signage for the accessible toilet?', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(59, 'Adequate opening width of door (min. 900mm)', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(60, 'Adequate room size? (Ideal minimum: 2200mm x 1500mm)', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(61, 'Outward opening door.', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(62, 'Grab-rail on inside of door', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(63, 'Direction of transfer onto toilet (From right to left or left to right?)', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(64, 'Space available in front of toilet', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(65, 'Height of toilet seat 480mm', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(66, 'Height of sink', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(67, 'Shelf available', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(68, 'Hooks available at dual height', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(69, 'Type of bin available meets', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(70, 'Appropriate visual contrast grab rails', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(71, 'Appropriate toilet seat etc.', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(72, 'Emergency alarm system available', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(73, 'Emergency pull chord to floor', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(74, 'Appropriate response to alarm activation', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(75, 'Mirror accessible by all', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(76, 'Lever taps', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(77, 'Paper towels', 'wc', '2023-02-13 13:50:48', NULL, 1),
	(78, 'Level, solid car park surface', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(79, '‘Hatching’ to sides and rear of parking spaces', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(80, 'Good lighting at night', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(81, 'Contact number of venue available on arrival', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(82, 'Drop-off point available', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(83, 'Dropped kerbs available at entry points', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(84, 'Is information on accessible parking provided on the website and in any access leaflets for the site?', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(85, 'Level access to main entrance', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(86, 'Alternative entrance signposted', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(87, 'Level area available in front of accessible entrance', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(88, 'Weather protection available', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(89, 'Level threshold over entranceEffective Clear', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(90, 'Opening door width (1m external entrance door, 800mm internal door)', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(91, 'Activity space available to opening edge of door (300mm)', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(92, 'Automatic door / ‘push button’ door', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(93, 'Vision panels to entrance door', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(94, 'Manifestations to glazed panes', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(95, 'Lobby area clear of obstacles / projections', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(96, 'Fast-track queueing policy for autistic visitors', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(97, 'Ear defenders available?', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(98, 'Lowered counter', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(99, 'Hearing loop available', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(100, 'Good visual Contrast', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(101, 'Adequate circulation space', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(102, 'Large print / magnifiers available', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(103, 'Seating available', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(104, 'Flashing fire alarm', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(105, 'Neutral threshold mat', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(106, 'Tables have a minimum of 700mm clearance to the underside.', 'general2', '2023-02-13 13:50:48', NULL, 1),
	(107, 'Is information on the Reception building provided on the website?', 'general2', '2023-02-13 13:50:48', NULL, 1);
/*!40000 ALTER TABLE `audit_questions` ENABLE KEYS */;

-- Dumping structure for table ci_app.audit_template
CREATE TABLE IF NOT EXISTS `audit_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `audit_version` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `auditor` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `published_status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `legislation_version` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `publisher` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.audit_template: ~0 rows (approximately)
/*!40000 ALTER TABLE `audit_template` DISABLE KEYS */;
INSERT INTO `audit_template` (`id`, `audit_version`, `auditor`, `published_status`, `legislation_version`, `publisher`, `date_created`, `last_updated`) VALUES
	(1, 'Version 1.0 EA 2010', 'A4A', 'published', '1.0', 'Jane Cooper', '2023-02-14 23:03:03', '2023-02-14 23:03:03');
/*!40000 ALTER TABLE `audit_template` ENABLE KEYS */;

-- Dumping structure for table ci_app.b_customers
CREATE TABLE IF NOT EXISTS `b_customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `customer_pk` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.b_customers: ~4 rows (approximately)
/*!40000 ALTER TABLE `b_customers` DISABLE KEYS */;
INSERT INTO `b_customers` (`id`, `company_name`, `date_created`) VALUES
	(1, 'Customer A', '2023-02-04 03:48:34'),
	(2, 'Customer B', '2023-02-04 03:48:34'),
	(3, 'Customer C', '2023-02-04 03:48:34'),
	(4, 'Customer D', '2023-02-04 03:48:34');
/*!40000 ALTER TABLE `b_customers` ENABLE KEYS */;

-- Dumping structure for table ci_app.company
CREATE TABLE IF NOT EXISTS `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` text NOT NULL,
  `companyName` text NOT NULL,
  `companyNumber` text NOT NULL,
  KEY `company_id_IDX` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.company: ~6 rows (approximately)
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`id`, `email`, `username`, `password`, `companyName`, `companyNumber`) VALUES
	(1, 'test', 'test', 'test', 'test', 'test'),
	(2, 'test', 'test', 'test', 'test', 'test'),
	(3, ':email', 'test', 'test', 'test', 'test'),
	(4, 'test@test.com', 'Test Username', 'test password', 'test', 'test'),
	(5, 'test', 'test', 'test', 'test', 'test'),
	(6, 'test@test.com', '123', '123', '123', '123');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;

-- Dumping structure for table ci_app.company_audit
CREATE TABLE IF NOT EXISTS `company_audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `auditor` int DEFAULT '0',
  `audit_status` varchar(50) DEFAULT 'New',
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `audit_template` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_customer_audit_company` (`company_id`),
  KEY `FK_company_audit_audit_template` (`audit_template`),
  CONSTRAINT `FK_company_audit_audit_template` FOREIGN KEY (`audit_template`) REFERENCES `audit_template` (`id`),
  CONSTRAINT `FK_customer_audit_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.company_audit: ~0 rows (approximately)
/*!40000 ALTER TABLE `company_audit` DISABLE KEYS */;
INSERT INTO `company_audit` (`id`, `company_id`, `auditor`, `audit_status`, `date_created`, `audit_template`) VALUES
	(7, 1, 0, 'New', '2023-02-14 23:47:42', 1);
/*!40000 ALTER TABLE `company_audit` ENABLE KEYS */;

-- Dumping structure for table ci_app.company_audit_response
CREATE TABLE IF NOT EXISTS `company_audit_response` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `audit_id` int NOT NULL,
  `response` tinyint DEFAULT NULL,
  `auditor` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_audit_response_audit_questions` (`question_id`),
  KEY `FK_audit_response_company_audit` (`audit_id`),
  CONSTRAINT `FK_audit_response_audit_questions` FOREIGN KEY (`question_id`) REFERENCES `audit_questions` (`id`),
  CONSTRAINT `FK_audit_response_company_audit` FOREIGN KEY (`audit_id`) REFERENCES `company_audit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.company_audit_response: ~0 rows (approximately)
/*!40000 ALTER TABLE `company_audit_response` DISABLE KEYS */;
INSERT INTO `company_audit_response` (`id`, `question_id`, `audit_id`, `response`, `auditor`, `date_created`, `last_updated`) VALUES
	(128, 6, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(129, 7, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(130, 8, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(131, 9, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(132, 10, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(133, 11, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(134, 12, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(135, 13, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(136, 14, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(137, 15, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(138, 16, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(139, 17, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(140, 18, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(141, 19, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(142, 20, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(143, 21, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(144, 22, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(145, 23, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(146, 24, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(147, 25, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(148, 26, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(149, 27, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(150, 28, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(151, 29, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(152, 30, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(153, 31, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(154, 32, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(155, 33, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(156, 34, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(157, 35, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(158, 36, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(159, 37, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(160, 38, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(161, 39, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(162, 40, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(163, 41, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(164, 42, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(165, 43, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(166, 44, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(167, 45, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(168, 46, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(169, 47, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(170, 48, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(171, 49, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(172, 50, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(173, 51, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(174, 52, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(175, 53, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(176, 54, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(177, 55, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(178, 56, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(179, 57, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(180, 58, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(181, 59, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(182, 60, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(183, 61, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(184, 62, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(185, 63, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(186, 64, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(187, 65, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(188, 66, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(189, 67, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(190, 68, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(191, 69, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(192, 70, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(193, 71, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(194, 72, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(195, 73, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(196, 74, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(197, 75, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(198, 76, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(199, 77, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(200, 78, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(201, 79, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(202, 80, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(203, 81, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(204, 82, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(205, 83, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(206, 84, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(207, 85, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(208, 86, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(209, 87, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(210, 88, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(211, 89, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(212, 90, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(213, 91, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(214, 92, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(215, 93, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(216, 94, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(217, 95, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(218, 96, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(219, 97, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(220, 98, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(221, 99, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(222, 100, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(223, 101, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(224, 102, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(225, 103, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(226, 104, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(227, 105, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(228, 106, 7, NULL, NULL, '2023-02-14 23:47:45', NULL),
	(229, 107, 7, NULL, NULL, '2023-02-14 23:47:45', NULL);
/*!40000 ALTER TABLE `company_audit_response` ENABLE KEYS */;

-- Dumping structure for table ci_app.company_venue
CREATE TABLE IF NOT EXISTS `company_venue` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `company_name` text NOT NULL,
  `address` text NOT NULL,
  `postcode` text NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.company_venue: ~0 rows (approximately)
/*!40000 ALTER TABLE `company_venue` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_venue` ENABLE KEYS */;

-- Dumping structure for table ci_app.digital_products
CREATE TABLE IF NOT EXISTS `digital_products` (
  `id` int NOT NULL,
  `product_name` text NOT NULL,
  `product_type` text NOT NULL,
  `validity` text NOT NULL,
  `digitalProductUsage` text NOT NULL,
  `rrp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.digital_products: ~0 rows (approximately)
/*!40000 ALTER TABLE `digital_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `digital_products` ENABLE KEYS */;

-- Dumping structure for table ci_app.marketing_preferences
CREATE TABLE IF NOT EXISTS `marketing_preferences` (
  `id` int NOT NULL,
  `preference_name` text NOT NULL,
  `pref_val` text NOT NULL,
  `last_update` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.marketing_preferences: ~0 rows (approximately)
/*!40000 ALTER TABLE `marketing_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_preferences` ENABLE KEYS */;

-- Dumping structure for table ci_app.orders
CREATE TABLE IF NOT EXISTS `orders` (
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

-- Dumping data for table ci_app.orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table ci_app.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int NOT NULL,
  `transaction_id` text NOT NULL,
  `acc_holder` text NOT NULL,
  `order_date` date NOT NULL,
  `ip_address` text NOT NULL,
  `transaction_status` text NOT NULL,
  `order_id` text NOT NULL,
  `product_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.order_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;

-- Dumping structure for table ci_app.permission_item
CREATE TABLE IF NOT EXISTS `permission_item` (
  `id` int NOT NULL,
  `content` text NOT NULL,
  `access` text NOT NULL,
  `role_id` text NOT NULL,
  `last_updated` timestamp NOT NULL,
  `updated_by` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.permission_item: ~0 rows (approximately)
/*!40000 ALTER TABLE `permission_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_item` ENABLE KEYS */;

-- Dumping structure for table ci_app.preference_controls
CREATE TABLE IF NOT EXISTS `preference_controls` (
  `id` int NOT NULL,
  `preference_name` text NOT NULL,
  `pref_val` text NOT NULL,
  `last_update` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.preference_controls: ~0 rows (approximately)
/*!40000 ALTER TABLE `preference_controls` DISABLE KEYS */;
/*!40000 ALTER TABLE `preference_controls` ENABLE KEYS */;

-- Dumping structure for table ci_app.preference_data
CREATE TABLE IF NOT EXISTS `preference_data` (
  `id` int NOT NULL,
  `preference_name` text NOT NULL,
  `pref_val` text NOT NULL,
  `last_update` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.preference_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `preference_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `preference_data` ENABLE KEYS */;

-- Dumping structure for table ci_app.product_data
CREATE TABLE IF NOT EXISTS `product_data` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` text NOT NULL,
  `account` text NOT NULL,
  `venue` text NOT NULL,
  `start_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `productUsage` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.product_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_data` ENABLE KEYS */;

-- Dumping structure for table ci_app.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL,
  `description` text NOT NULL,
  `last_updated` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table ci_app.sys_users
CREATE TABLE IF NOT EXISTS `sys_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text NOT NULL,
  `email` text NOT NULL,
  `role` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_created` timestamp NOT NULL,
  `company_id` text NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `user_preferences` int DEFAULT NULL,
  `company_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.sys_users: ~1 rows (approximately)
/*!40000 ALTER TABLE `sys_users` DISABLE KEYS */;
INSERT INTO `sys_users` (`id`, `name`, `password`, `avatar`, `email`, `role`, `date_created`, `company_id`, `last_login`, `user_preferences`, `company_type`) VALUES
	(1, 'client', 'Test1234', 'avatar', 'client_user@domain.com', '1', '2023-02-13 12:22:59', '1', NULL, NULL, 'client'),
	(2, 'customer', 'Test1234', 'avatar', 'customer_user@domain.com', '1', '2023-02-13 12:22:59', '1', NULL, NULL, 'customer');
/*!40000 ALTER TABLE `sys_users` ENABLE KEYS */;

-- Dumping structure for table ci_app.venue_audit
CREATE TABLE IF NOT EXISTS `venue_audit` (
  `id` int NOT NULL,
  `audit_version` text NOT NULL,
  `company_id` text NOT NULL,
  `auditor` text NOT NULL,
  `date_created` date NOT NULL,
  `last_updated` date NOT NULL,
  `template_id` text NOT NULL,
  `audit_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ci_app.venue_audit: ~0 rows (approximately)
/*!40000 ALTER TABLE `venue_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `venue_audit` ENABLE KEYS */;

-- Dumping structure for trigger ci_app.company_audit_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `company_audit_after_insert` AFTER INSERT ON `company_audit` FOR EACH ROW BEGIN
INSERT INTO company_audit_response (question_id, audit_id)
SELECT q.id, NEW.id FROM audit_questions q WHERE q.template_id = NEW.audit_template ;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
