-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Apr 15, 2024 at 06:03 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `firewall`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(128) COLLATE utf8mb3_bin NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `timestamp` int UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('bh3puh9sak1f74mbfiafdbh6hki76833', '::1', 1712918819, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323931383730383b);

-- --------------------------------------------------------

--
-- Table structure for table `firewall_logs`
--

DROP TABLE IF EXISTS `firewall_logs`;
CREATE TABLE IF NOT EXISTS `firewall_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `platform` text COLLATE utf8mb3_bin NOT NULL,
  `browser` text COLLATE utf8mb3_bin NOT NULL,
  `version` text COLLATE utf8mb3_bin NOT NULL,
  `mobile` text COLLATE utf8mb3_bin NOT NULL,
  `robot` text COLLATE utf8mb3_bin NOT NULL,
  `referrer` text COLLATE utf8mb3_bin NOT NULL,
  `base_url` text COLLATE utf8mb3_bin NOT NULL,
  `controller_url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `method_url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `full_url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `agent_string` text COLLATE utf8mb3_bin NOT NULL,
  `ip` text COLLATE utf8mb3_bin NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `firewall_logs`
--

INSERT INTO `firewall_logs` (`id`, `platform`, `browser`, `version`, `mobile`, `robot`, `referrer`, `base_url`, `controller_url`, `method_url`, `full_url`, `agent_string`, `ip`, `added_on`) VALUES
(1, 'Windows 10', 'Chrome', '123.0.0.0', '', '', '', 'http://localhost/codeigniter_firewall/', 'firewall', 'index', 'http://localhost/codeigniter_firewall/firewall', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '::1', '2024-04-15 18:01:49'),
(2, 'Windows 10', 'Chrome', '123.0.0.0', '', '', '', 'http://localhost/codeigniter_firewall/', 'firewall', 'index', 'http://localhost/codeigniter_firewall/firewall', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '::1', '2024-04-15 18:01:50'),
(3, 'Windows 10', 'Chrome', '123.0.0.0', '', '', '', 'http://localhost/codeigniter_firewall/', 'firewall', 'index', 'http://localhost/codeigniter_firewall/firewall', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '::1', '2024-04-15 18:01:50');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
