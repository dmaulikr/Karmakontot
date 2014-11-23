-- phpMyAdmin SQL Dump
-- version 4.0.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 23, 2014 at 02:30 PM
-- Server version: 5.5.33
-- PHP Version: 5.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `karmakonto`
--

-- --------------------------------------------------------

--
-- Table structure for table `help`
--

DROP TABLE IF EXISTS `help`;
CREATE TABLE `help` (
  `help_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'help request id',
  `user` varchar(50) NOT NULL COMMENT 'user identification',
  `title` text NOT NULL COMMENT 'help title',
  `message` text NOT NULL COMMENT 'posted help message',
  `coord_lat` double NOT NULL COMMENT 'latitue coordinate',
  `coord_long` double NOT NULL COMMENT 'longitude coordinate',
  `done_by` int(11) DEFAULT NULL COMMENT 'id of confirmed done entry',
  PRIMARY KEY (`help_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='help enquiries' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `help`
--

INSERT INTO `help` (`help_id`, `user`, `title`, `message`, `coord_lat`, `coord_long`, `done_by`) VALUES
(1, 'viktor.gerdin@gmail.com', 'iPhone 5s charger', 'I need to borrow a charger that works with iPhone 5s for about an hour.', 59.853157, 17.635513, NULL),
(2, 'foo@bar.baz', 'Truck on!', 'Yolo muthereffers!', 59.853157, 17.635513, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `karma`
--

DROP TABLE IF EXISTS `karma`;
CREATE TABLE `karma` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing id',
  `user` varchar(50) NOT NULL COMMENT 'user identification',
  `points` int(11) NOT NULL COMMENT 'karma points',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `karma`
--

INSERT INTO `karma` (`id`, `user`, `points`) VALUES
(1, 'viktor.gerdin@gmail.com ', 1337),
(2, 'foo@bar.baz', 13);