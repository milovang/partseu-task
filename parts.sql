-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jan 31, 2019 at 09:07 PM
-- Server version: 10.2.14-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parts`
--

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
CREATE TABLE IF NOT EXISTS `catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `image`, `date`) VALUES
(1, '100%', '100percent.jpg', '2019-01-22'),
(2, 'AFX Helmets', 'afx.jpg', '2019-01-09'),
(3, 'Alpinestars', 'alpinestars.jpg', '2019-01-15'),
(4, 'Arctiva', 'arctiva.jpg', '2019-01-04'),
(5, 'ATV', 'atv.jpg', '2018-08-16'),
(6, 'Biltwell', 'biltwell.jpg', '2018-04-04'),
(7, 'FatBook', 'fatbook.jpg', '2018-11-05'),
(8, 'FMF Exhaust', 'fmf.jpg', '2018-10-27'),
(9, 'Icon Spring', 'icon_spring.jpg', '2018-03-13'),
(10, 'Icon Fall', 'icon-fall.jpg', '2018-07-16'),
(11, 'Moose Racing', 'moose-racing.jpg', '2018-07-01'),
(12, 'Moose Utility Division', 'moose-utitlity.jpg', '2018-01-03'),
(13, 'Neken', 'Neken.jpg', '2018-11-10'),
(14, 'Offroad', 'offroad.jpg', '2018-04-17'),
(15, 'Oldbook', 'oldbook.jpg', '2018-11-28');

-- --------------------------------------------------------

--
-- Table structure for table `catalogs_categories`
--

DROP TABLE IF EXISTS `catalogs_categories`;
CREATE TABLE IF NOT EXISTS `catalogs_categories` (
  `catalog_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`catalog_id`,`category_id`),
  KEY `IDX_553701C7CC3C66FC` (`catalog_id`),
  KEY `IDX_553701C712469DE2` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `catalogs_categories`
--

INSERT INTO `catalogs_categories` (`catalog_id`, `category_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 3),
(3, 1),
(3, 2),
(4, 4),
(5, 1),
(5, 2),
(6, 3),
(6, 5),
(7, 3),
(7, 5),
(8, 2),
(8, 3),
(9, 3),
(9, 5),
(10, 3),
(10, 5),
(11, 2),
(12, 1),
(13, 2),
(14, 2),
(15, 5);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'atv'),
(2, 'offroad'),
(3, 'street'),
(4, 'snow'),
(5, 'v-twin'),
(6, 'water'),
(7, 'test');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catalogs_categories`
--
ALTER TABLE `catalogs_categories`
  ADD CONSTRAINT `FK_553701C712469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_553701C7CC3C66FC` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
