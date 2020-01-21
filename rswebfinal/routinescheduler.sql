-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2018 at 05:14 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `routinescheduler`
--
CREATE DATABASE IF NOT EXISTS `routinescheduler` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `routinescheduler`;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(50) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `course_credit` float NOT NULL,
  `course_teacher` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `course_id`, `course_title`, `course_credit`, `course_teacher`) VALUES
(1, 'IT 1101', 'IT Fundamentals', 3, 1),
(2, 'IT 1103', 'Introduction to Programming Environment', 3, 2),
(3, 'IT 1105', 'Electrical Circuits', 3, 1),
(4, 'IT 1107', 'Differential and Integral Calculus', 3, 3),
(5, 'IT 1109', 'Communicative English', 3, 2),
(6, 'IT 1104', 'Structured Programming Language Lab', 1.5, 4),
(7, 'IT 1106', 'Electrical Circuits Lab', 1.5, 2),
(8, 'IT 2101', 'Algorithm Analysis ', 3, 4),
(9, 'IT 2103', 'Computer Architecture ', 3, 5),
(10, 'IT 2105', 'Electronic Devices and Circuits ', 3, 5),
(11, 'IT 2107', 'Discrete Mathematics', 3, 6),
(12, 'IT 2109', 'Statistical and Probability Theory ', 3, 6),
(13, 'IT 2102', 'Algorithm Analysis Lab ', 1.5, 5),
(14, 'IT 2104', 'Computer Architecture Lab ', 1.5, 5),
(15, 'IT 2106', 'Electronic Devices and Circuits Lab ', 1.5, 6),
(16, 'IT 3101', 'Database Management System ', 3, 7),
(17, 'IT 3103', 'Computer Network and Internet Technology ', 3, 7),
(18, 'IT 3105', 'Signal and System ', 3, 8),
(19, 'IT 3107', 'Operating System ', 3, 8),
(20, 'IT 3109', 'Simulation and Modelling', 3, 9),
(21, 'IT 3102', 'Database Management System Lab ', 1.5, 9),
(22, 'IT 3104', 'Computer Network and Internet Technology Lab ', 1.5, 8),
(23, 'IT 3108', 'Operating System Lab ', 1.5, 7),
(24, 'IT 4101', 'Artificial Intelligences & Neural Networks ', 3, 10),
(25, 'IT 4103', 'Management Information System ', 3, 10),
(26, 'IT 4105', 'Human Computer Interfacing ', 3, 10),
(27, 'IT 4107', 'Parallel and Distributed System ', 3, 11),
(28, 'IT 4109', 'Multimedia Systems & Application ', 3, 11),
(29, 'IT 4102', 'Artificial Intelligences & Neural Networks Lab ', 1.5, 11),
(34, 't120', 'Something', 1.5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `room_no` varchar(11) NOT NULL,
  `floor` int(5) NOT NULL,
  `room_type` varchar(35) NOT NULL,
  `capacity` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `room_no`, `floor`, `room_type`, `capacity`) VALUES
(1, 'Lab-1', 3, 'Computer Lab', 60),
(2, 'Lab-2', 3, 'Computer Lab', 55),
(3, 'Lab-3', 3, 'Computer Lab', 80),
(4, '232', 2, 'Computer Lab', 50);

-- --------------------------------------------------------

--
-- Table structure for table `routine`
--

DROP TABLE IF EXISTS `routine`;
CREATE TABLE IF NOT EXISTS `routine` (
  `courseid` varchar(50) NOT NULL,
  `teacherid` varchar(50) NOT NULL,
  `roomid` varchar(50) NOT NULL,
  `classtime` varchar(70) NOT NULL,
  `classorder` int(255) NOT NULL,
  `uuid` varchar(70) NOT NULL,
  `saveddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `routine`
--

INSERT INTO `routine` (`courseid`, `teacherid`, `roomid`, `classtime`, `classorder`, `uuid`, `saveddate`) VALUES
('IT 1101', 'K M Akkas Ali', 'Lab-1', 'THU 08:30 - 09:50', 1, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 1101', 'K M Akkas Ali', 'Lab-2', 'MON 08:30 - 09:50', 2, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 1103', 'Jesmin Akhter', 'Lab-1', 'WED 10:00 - 11:20', 3, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 1103', 'Jesmin Akhter', '232', 'MON 10:00 - 11:20', 4, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 1105', 'M Shamim Kaiser', '232', 'SUN 10:00 - 11:20', 5, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 1105', 'M Shamim Kaiser', 'Lab-1', 'TUE 10:00 - 11:20', 6, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 1107', 'M Mesbahuddin Sarker', 'Lab-1', 'THU 10:00 - 11:20', 7, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 1107', 'M Mesbahuddin Sarker', 'Lab-2', 'WED 08:30 - 09:50', 8, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 1109', 'Risala Tahsin Khan', 'Lab-2', 'TUE 11:30 - 12:50', 9, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 1109', 'Risala Tahsin Khan', 'Lab-3', 'SUN 11:30 - 12:50', 10, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 1104', 'Jesmin Akhter', '232', 'THU 11:30 - 12:50', 11, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 1106', 'M Shamim Kaiser', '232', 'THU 02:00 - 04:50', 12, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 2101', 'Jesmin Akhter', '232', 'WED 11:30 - 12:50', 13, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 2101', 'Jesmin Akhter', 'Lab-2', 'SUN 10:00 - 11:20', 14, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 2103', 'Mohammad Abu Yusuf', 'Lab-3', 'WED 10:00 - 11:20', 15, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 2103', 'Mohammad Abu Yusuf', 'Lab-3', 'TUE 10:00 - 11:20', 16, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 2105', 'M Shamim Kaiser', '232', 'SUN 11:30 - 12:50', 17, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 2105', 'M Shamim Kaiser', '232', 'TUE 11:30 - 12:50', 18, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 2107', 'Md. Wahiduzzaman', 'Lab-1', 'MON 10:00 - 11:20', 19, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 2107', 'Md. Wahiduzzaman', 'Lab-3', 'MON 02:00 - 04:50', 20, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 2109', 'Md. Fazlul Karim Patwary', 'Lab-3', 'THU 08:30 - 09:50', 21, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 2109', 'Md. Fazlul Karim Patwary', '232', 'MON 08:30 - 09:50', 22, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 2102', 'Mohammad Abu Yusuf', 'Lab-2', 'THU 02:00 - 04:50', 23, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 2104', 'Jesmin Akhter', 'Lab-3', 'TUE 02:00 - 04:50', 24, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 2106', 'M Shamim Kaiser', 'Lab-1', 'SUN 02:00 - 04:50', 25, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 3101', 'Fahima Tabassum', '232', 'WED 10:00 - 11:20', 26, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 3101', 'Fahima Tabassum', 'Lab-1', 'THU 11:30 - 12:50', 27, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 3103', 'Risala Tahsin Khan', 'Lab-2', 'SUN 08:30 - 09:50', 28, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 3103', 'Risala Tahsin Khan', '232', 'WED 11:30 - 12:50', 29, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 3105', 'K M Akkas Ali', 'Lab-1', 'TUE 08:30 - 09:50', 30, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 3105', 'K M Akkas Ali', 'Lab-2', 'WED 08:30 - 09:50', 31, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 3107', 'Md. Wahiduzzaman', '232', 'THU 10:00 - 11:20', 32, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 3107', 'Md. Wahiduzzaman', 'Lab-1', 'SUN 11:30 - 12:50', 33, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 3109', 'Mohammad Abu Yusuf', 'Lab-3', 'TUE 11:30 - 12:50', 34, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 3109', 'Mohammad Abu Yusuf', 'Lab-3', 'MON 10:00 - 11:20', 35, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 3102', 'Md. Fazlul Karim Patwary', 'Lab-2', 'MON 02:00 - 04:50', 36, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 3104', 'Risala Tahsin Khan', 'Lab-1', 'THU 02:00 - 04:50', 37, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 3108', 'Md. Wahiduzzaman', 'Lab-1', 'TUE 02:00 - 04:50', 38, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 4101', 'Fahima Tabassum', '232', 'TUE 10:00 - 11:20', 39, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 4101', 'Fahima Tabassum', 'Lab-2', 'THU 08:30 - 09:50', 40, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 4103', 'Md. Wahiduzzaman', 'Lab-2', 'WED 10:00 - 11:20', 41, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 4103', 'Md. Wahiduzzaman', 'Lab-3', 'MON 11:30 - 12:50', 42, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 4105', 'M Mesbahuddin Sarker', 'Lab-3', 'MON 08:30 - 09:50', 43, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 4105', 'M Mesbahuddin Sarker', 'Lab-2', 'SUN 11:30 - 12:50', 44, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 4107', 'Mohammad Abu Yusuf', 'Lab-3', 'WED 08:30 - 09:50', 45, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 4107', 'Mohammad Abu Yusuf', 'Lab-2', 'THU 10:00 - 11:20', 46, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 4109', 'Md. Fazlul Karim Patwary', '232', 'THU 11:30 - 12:50', 47, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 4109', 'Md. Fazlul Karim Patwary', '232', 'TUE 08:30 - 09:50', 48, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 4102', 'Fahima Tabassum', 'Lab-3', 'MON 02:00 - 04:50', 49, '59317a8a-8b3e-40d0-b8eb-a11ec07d8995', '2018-01-11 15:58:55'),
('IT 1101', 'K M Akkas Ali', '232', 'WED 08:30 - 09:50', 1, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 1101', 'K M Akkas Ali', 'Lab-3', 'SUN 08:30 - 09:50', 2, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 1103', 'Jesmin Akhter', 'Lab-2', 'TUE 11:30 - 12:50', 3, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 1103', 'Jesmin Akhter', 'Lab-3', 'THU 11:30 - 12:50', 4, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 1105', 'M Shamim Kaiser', 'Lab-3', 'TUE 08:30 - 09:50', 5, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 1105', 'M Shamim Kaiser', 'Lab-2', 'MON 10:00 - 11:20', 6, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 1107', 'M Mesbahuddin Sarker', 'Lab-1', 'WED 10:00 - 11:20', 7, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 1107', 'M Mesbahuddin Sarker', '232', 'THU 08:30 - 09:50', 8, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 1109', 'Risala Tahsin Khan', '232', 'MON 08:30 - 09:50', 9, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 1109', 'Risala Tahsin Khan', 'Lab-3', 'THU 10:00 - 11:20', 10, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 1104', 'Jesmin Akhter', 'Lab-3', 'TUE 02:00 - 04:50', 11, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 1106', 'M Shamim Kaiser', 'Lab-3', 'SUN 02:00 - 04:50', 12, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 2101', 'Mohammad Abu Yusuf', 'Lab-1', 'WED 08:30 - 09:50', 13, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 2101', 'Mohammad Abu Yusuf', 'Lab-1', 'MON 10:00 - 11:20', 14, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 2103', 'Jesmin Akhter', 'Lab-3', 'MON 11:30 - 12:50', 15, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 2103', 'Jesmin Akhter', 'Lab-1', 'TUE 10:00 - 11:20', 16, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 2105', 'M Shamim Kaiser', 'Lab-2', 'THU 08:30 - 09:50', 17, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 2105', 'M Shamim Kaiser', 'Lab-3', 'TUE 11:30 - 12:50', 18, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 2107', 'M Mesbahuddin Sarker', 'Lab-2', 'SUN 10:00 - 11:20', 19, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 2107', 'M Mesbahuddin Sarker', 'Lab-2', 'THU 11:30 - 12:50', 20, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 2109', 'Md. Fazlul Karim Patwary', '232', 'SUN 08:30 - 09:50', 21, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 2109', 'Md. Fazlul Karim Patwary', 'Lab-1', 'MON 08:30 - 09:50', 22, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 2102', 'Mohammad Abu Yusuf', 'Lab-3', 'WED 02:00 - 04:50', 23, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 2104', 'Jesmin Akhter', 'Lab-1', 'THU 02:00 - 04:50', 24, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 2106', 'M Shamim Kaiser', 'Lab-2', 'MON 02:00 - 04:50', 25, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 3101', 'Fahima Tabassum', 'Lab-3', 'SUN 11:30 - 12:50', 26, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 3101', 'Fahima Tabassum', 'Lab-2', 'WED 08:30 - 09:50', 27, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 3103', 'Risala Tahsin Khan', 'Lab-1', 'TUE 11:30 - 12:50', 28, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 3103', 'Risala Tahsin Khan', '232', 'MON 10:00 - 11:20', 29, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 3105', 'K M Akkas Ali', 'Lab-1', 'SUN 08:30 - 09:50', 30, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 3105', 'K M Akkas Ali', 'Lab-1', 'MON 08:30 - 09:50', 31, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 3107', 'Md. Wahiduzzaman', 'Lab-1', 'SUN 10:00 - 11:20', 32, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 3107', 'Md. Wahiduzzaman', 'Lab-2', 'THU 10:00 - 11:20', 33, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 3109', 'Mohammad Abu Yusuf', '232', 'MON 11:30 - 12:50', 34, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 3109', 'Mohammad Abu Yusuf', 'Lab-2', 'WED 10:00 - 11:20', 35, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 3102', 'Md. Fazlul Karim Patwary', 'Lab-1', 'WED 02:00 - 04:50', 36, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 3104', 'Risala Tahsin Khan', 'Lab-1', 'TUE 02:00 - 04:50', 37, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 3108', 'Md. Wahiduzzaman', '232', 'MON 02:00 - 04:50', 38, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 4101', 'Fahima Tabassum', '232', 'TUE 10:00 - 11:20', 39, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 4101', 'Fahima Tabassum', 'Lab-3', 'SUN 10:00 - 11:20', 40, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 4103', 'M Shamim Kaiser', 'Lab-2', 'THU 10:00 - 11:20', 41, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 4103', 'M Shamim Kaiser', 'Lab-3', 'WED 11:30 - 12:50', 42, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 4105', 'Md. Wahiduzzaman', 'Lab-2', 'SUN 11:30 - 12:50', 43, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 4105', 'Md. Wahiduzzaman', 'Lab-2', 'MON 10:00 - 11:20', 44, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 4107', 'M Mesbahuddin Sarker', '232', 'TUE 11:30 - 12:50', 45, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 4107', 'M Mesbahuddin Sarker', 'Lab-2', 'MON 11:30 - 12:50', 46, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 4109', 'Mohammad Abu Yusuf', '232', 'TUE 08:30 - 09:50', 47, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 4109', 'Mohammad Abu Yusuf', 'Lab-3', 'SUN 08:30 - 09:50', 48, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 4102', 'Fahima Tabassum', '232', 'SUN 02:00 - 04:50', 49, 'b7c4ad72-7c9d-44b6-a2c0-a5128ce3b26a', '2018-01-11 16:29:50'),
('IT 1101', 'K M Akkas Ali', 'Lab-3', 'MON 08:30 - 09:50', 1, '5a09017c-40e4-4872-a4f7-8d773a4c4a90', '2018-01-17 18:51:26'),
('IT 1101', 'K M Akkas Ali', 'Lab-1', 'THU 08:30 - 09:50', 2, '5a09017c-40e4-4872-a4f7-8d773a4c4a90', '2018-01-17 18:51:26'),
('IT 1103', 'Jesmin Akhter', 'Lab-3', 'MON 11:30 - 12:50', 3, '5a09017c-40e4-4872-a4f7-8d773a4c4a90', '2018-01-17 18:51:26'),
('IT 1103', 'Jesmin Akhter', 'Lab-2', 'TUE 10:00 - 11:20', 4, '5a09017c-40e4-4872-a4f7-8d773a4c4a90', '2018-01-17 18:51:26'),
('IT 1105', 'Md. Shahidul Islam', '232', 'TUE 08:30 - 09:50', 5, '5a09017c-40e4-4872-a4f7-8d773a4c4a90', '2018-01-17 18:51:26'),
('IT 1105', 'Md. Shahidul Islam', 'Lab-2', 'SUN 08:30 - 09:50', 6, '5a09017c-40e4-4872-a4f7-8d773a4c4a90', '2018-01-17 18:51:26'),
('IT 1107', 'M Mesbahuddin Sarker', 'Lab-2', 'WED 10:00 - 11:20', 7, '5a09017c-40e4-4872-a4f7-8d773a4c4a90', '2018-01-17 18:51:26'),
('IT 1107', 'M Mesbahuddin Sarker', '232', 'TUE 11:30 - 12:50', 8, '5a09017c-40e4-4872-a4f7-8d773a4c4a90', '2018-01-17 18:51:26'),
('IT 1109', 'Risala Tahsin Khan', 'Lab-2', 'SUN 10:00 - 11:20', 9, '5a09017c-40e4-4872-a4f7-8d773a4c4a90', '2018-01-17 18:51:26'),
('IT 1109', 'Risala Tahsin Khan', '232', 'MON 10:00 - 11:20', 10, '5a09017c-40e4-4872-a4f7-8d773a4c4a90', '2018-01-17 18:51:26'),
('IT 1104', 'Jesmin Akhter', '232', 'TUE 02:00 - 04:50', 11, '5a09017c-40e4-4872-a4f7-8d773a4c4a90', '2018-01-17 18:51:26'),
('IT 1106', 'Md. Shahidul Islam', 'Lab-3', 'MON 02:00 - 04:50', 12, '5a09017c-40e4-4872-a4f7-8d773a4c4a90', '2018-01-17 18:51:26'),
('IT 3101', 'Fahima Tabassum', 'Lab-1', 'SUN 11:30 - 12:50', 1, '700f23f5-4b13-4bfc-be30-46d9578c5b6c', '2018-01-18 16:00:32'),
('IT 3101', 'Fahima Tabassum', '232', 'WED 10:00 - 11:20', 2, '700f23f5-4b13-4bfc-be30-46d9578c5b6c', '2018-01-18 16:00:32'),
('IT 3103', 'Risala Tahsin Khan', 'Lab-1', 'SUN 10:00 - 11:20', 3, '700f23f5-4b13-4bfc-be30-46d9578c5b6c', '2018-01-18 16:00:32'),
('IT 3103', 'Risala Tahsin Khan', 'Lab-1', 'THU 11:30 - 12:50', 4, '700f23f5-4b13-4bfc-be30-46d9578c5b6c', '2018-01-18 16:00:32'),
('IT 3105', 'K M Akkas Ali', 'Lab-3', 'SUN 08:30 - 09:50', 5, '700f23f5-4b13-4bfc-be30-46d9578c5b6c', '2018-01-18 16:00:32'),
('IT 3105', 'K M Akkas Ali', 'Lab-1', 'MON 08:30 - 09:50', 6, '700f23f5-4b13-4bfc-be30-46d9578c5b6c', '2018-01-18 16:00:32'),
('IT 3107', 'Md. Wahiduzzaman', 'Lab-3', 'MON 10:00 - 11:20', 7, '700f23f5-4b13-4bfc-be30-46d9578c5b6c', '2018-01-18 16:00:32'),
('IT 3107', 'Md. Wahiduzzaman', '232', 'TUE 11:30 - 12:50', 8, '700f23f5-4b13-4bfc-be30-46d9578c5b6c', '2018-01-18 16:00:32'),
('IT 3109', 'Mohammad Abu Yusuf', '232', 'TUE 10:00 - 11:20', 9, '700f23f5-4b13-4bfc-be30-46d9578c5b6c', '2018-01-18 16:00:32'),
('IT 3109', 'Mohammad Abu Yusuf', 'Lab-1', 'WED 11:30 - 12:50', 10, '700f23f5-4b13-4bfc-be30-46d9578c5b6c', '2018-01-18 16:00:32'),
('IT 3102', 'Md. Fazlul Karim Patwary', '232', 'SUN 02:00 - 04:50', 11, '700f23f5-4b13-4bfc-be30-46d9578c5b6c', '2018-01-18 16:00:32'),
('IT 3104', 'Risala Tahsin Khan', 'Lab-3', 'THU 02:00 - 04:50', 12, '700f23f5-4b13-4bfc-be30-46d9578c5b6c', '2018-01-18 16:00:32'),
('IT 3108', 'Md. Wahiduzzaman', 'Lab-1', 'WED 02:00 - 04:50', 13, '700f23f5-4b13-4bfc-be30-46d9578c5b6c', '2018-01-18 16:00:32');

-- --------------------------------------------------------

--
-- Table structure for table `routine_new`
--

DROP TABLE IF EXISTS `routine_new`;
CREATE TABLE IF NOT EXISTS `routine_new` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `routine` text,
  `time_generated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `routine_new`
--

INSERT INTO `routine_new` (`id`, `routine`, `time_generated`) VALUES
(25, 'a:5:{s:3:"Sun";a:4:{s:9:"8.30-9.50";a:3:{i:0;s:44:"IT 4109 (Lab-2) <br> Zamshed Iqbal Chowdhury";i:1;s:39:"IT 1107 (Lab-1) <br> Risala Tahsin Khan";i:2;s:32:"IT 2105 (232) <br> Jesmin Akhter";}s:11:"10.00-11.20";a:3:{i:0;s:34:"IT 1103 (232) <br> Fahima Tabassum";i:1;s:41:"IT 2109 (Lab-1) <br> M Mesbahuddin Sarker";i:2;s:44:"IT 4107 (Lab-3) <br> Zamshed Iqbal Chowdhury";}s:11:"11.30-12.50";a:3:{i:0;s:34:"IT 1105 (Lab-2) <br> K M Akkas Ali";i:1;s:45:"IT 3107 (Lab-1) <br> Md. Fazlul Karim Patwary";i:2;s:32:"IT 2105 (232) <br> Jesmin Akhter";}s:9:"2.00-4.45";a:2:{i:0;s:36:"IT 1106 (Lab-2) <br> Fahima Tabassum";i:1;s:36:"IT 3102 (Lab-1) <br> M Shamim Kaiser";}}s:3:"Mon";a:4:{s:9:"8.30-9.50";a:3:{i:0;s:37:"IT 3103 (Lab-3) <br> Md. Wahiduzzaman";i:1;s:37:"IT 4101 (232) <br> Md. Shahidul Islam";i:2;s:39:"IT 2101 (Lab-1) <br> Mohammad Abu Yusuf";}s:11:"10.00-11.20";a:3:{i:0;s:44:"IT 4109 (Lab-1) <br> Zamshed Iqbal Chowdhury";i:1;s:36:"IT 1109 (Lab-2) <br> Fahima Tabassum";i:2;s:45:"IT 3105 (Lab-3) <br> Md. Fazlul Karim Patwary";}s:11:"11.30-12.50";a:3:{i:0;s:35:"IT 3101 (232) <br> Md. Wahiduzzaman";i:1;s:36:"IT 1103 (Lab-1) <br> Fahima Tabassum";i:2;s:41:"IT 2107 (Lab-3) <br> M Mesbahuddin Sarker";}s:9:"2.00-4.45";a:1:{i:0;s:41:"IT 2106 (Lab-3) <br> M Mesbahuddin Sarker";}}s:4:"Tues";a:4:{s:9:"8.30-9.50";a:2:{i:0;s:41:"IT 2107 (Lab-3) <br> M Mesbahuddin Sarker";i:1;s:39:"IT 1107 (Lab-1) <br> Risala Tahsin Khan";}s:11:"10.00-11.20";a:3:{i:0;s:37:"IT 2101 (232) <br> Mohammad Abu Yusuf";i:1;s:39:"IT 4103 (Lab-3) <br> Md. Shahidul Islam";i:2;s:45:"IT 3107 (Lab-2) <br> Md. Fazlul Karim Patwary";}s:11:"11.30-12.50";a:2:{i:0;s:34:"IT 2103 (Lab-2) <br> Jesmin Akhter";i:1;s:39:"IT 4103 (Lab-3) <br> Md. Shahidul Islam";}s:9:"2.00-4.45";a:2:{i:0;s:35:"IT 3108 (232) <br> Md. Wahiduzzaman";i:1;s:34:"IT 2102 (Lab-3) <br> Jesmin Akhter";}}s:6:"Wednes";a:4:{s:9:"8.30-9.50";a:2:{i:0;s:32:"IT 1101 (232) <br> K M Akkas Ali";i:1;s:36:"IT 3109 (Lab-3) <br> M Shamim Kaiser";}s:11:"10.00-11.20";a:3:{i:0;s:39:"IT 4101 (Lab-1) <br> Md. Shahidul Islam";i:1;s:39:"IT 2109 (232) <br> M Mesbahuddin Sarker";i:2;s:34:"IT 1101 (Lab-3) <br> K M Akkas Ali";}s:11:"11.30-12.50";a:3:{i:0;s:36:"IT 1109 (Lab-1) <br> Fahima Tabassum";i:1;s:34:"IT 2103 (Lab-3) <br> Jesmin Akhter";i:2;s:35:"IT 3101 (232) <br> Md. Wahiduzzaman";}s:9:"2.00-4.45";a:2:{i:0;s:37:"IT 1104 (232) <br> Mohammad Abu Yusuf";i:1;s:44:"IT 4102 (Lab-1) <br> Zamshed Iqbal Chowdhury";}}s:5:"Thurs";a:4:{s:9:"8.30-9.50";a:2:{i:0;s:45:"IT 3105 (Lab-2) <br> Md. Fazlul Karim Patwary";i:1;s:37:"IT 4105 (232) <br> Md. Shahidul Islam";}s:11:"10.00-11.20";a:3:{i:0;s:34:"IT 1105 (Lab-3) <br> K M Akkas Ali";i:1;s:34:"IT 3109 (232) <br> M Shamim Kaiser";i:2;s:39:"IT 4105 (Lab-2) <br> Md. Shahidul Islam";}s:11:"11.30-12.50";a:2:{i:0;s:37:"IT 3103 (Lab-1) <br> Md. Wahiduzzaman";i:1;s:44:"IT 4107 (Lab-2) <br> Zamshed Iqbal Chowdhury";}s:9:"2.00-4.45";a:2:{i:0;s:32:"IT 2104 (232) <br> Jesmin Akhter";i:1;s:45:"IT 3104 (Lab-1) <br> Md. Fazlul Karim Patwary";}}}', '2018-08-02 06:26:13'),
(26, 'a:5:{s:3:"Sun";a:4:{s:9:"8.30-9.50";a:3:{i:0;s:34:"IT 1105 (Lab-1) <br> K M Akkas Ali";i:1;s:34:"IT 2105 (Lab-2) <br> Jesmin Akhter";i:2;s:36:"IT 3109 (Lab-3) <br> M Shamim Kaiser";}s:11:"10.00-11.20";a:3:{i:0;s:36:"IT 1109 (Lab-1) <br> Fahima Tabassum";i:1;s:39:"IT 2107 (232) <br> M Mesbahuddin Sarker";i:2;s:37:"IT 3101 (Lab-3) <br> Md. Wahiduzzaman";}s:11:"11.30-12.50";a:3:{i:0;s:34:"IT 1101 (Lab-2) <br> K M Akkas Ali";i:1;s:39:"IT 2109 (232) <br> M Mesbahuddin Sarker";i:2;s:44:"IT 4107 (Lab-3) <br> Zamshed Iqbal Chowdhury";}s:9:"2.00-4.45";a:2:{i:0;s:37:"IT 1104 (232) <br> Mohammad Abu Yusuf";i:1;s:41:"IT 2106 (Lab-3) <br> M Mesbahuddin Sarker";}}s:3:"Mon";a:4:{s:9:"8.30-9.50";a:2:{i:0;s:39:"IT 1107 (Lab-2) <br> Risala Tahsin Khan";i:1;s:39:"IT 4105 (Lab-3) <br> Md. Shahidul Islam";}s:11:"10.00-11.20";a:3:{i:0;s:39:"IT 1107 (Lab-2) <br> Risala Tahsin Khan";i:1;s:39:"IT 4103 (Lab-3) <br> Md. Shahidul Islam";i:2;s:45:"IT 3105 (Lab-1) <br> Md. Fazlul Karim Patwary";}s:11:"11.30-12.50";a:2:{i:0;s:35:"IT 3101 (232) <br> Md. Wahiduzzaman";i:1;s:36:"IT 1103 (Lab-2) <br> Fahima Tabassum";}s:9:"2.00-4.45";a:3:{i:0;s:32:"t120 (232) <br> Md. Wahiduzzaman";i:1;s:45:"IT 3104 (Lab-2) <br> Md. Fazlul Karim Patwary";i:2;s:44:"IT 4102 (Lab-1) <br> Zamshed Iqbal Chowdhury";}}s:4:"Tues";a:4:{s:9:"8.30-9.50";a:3:{i:0;s:45:"IT 3107 (Lab-3) <br> Md. Fazlul Karim Patwary";i:1;s:39:"IT 2101 (Lab-1) <br> Mohammad Abu Yusuf";i:2;s:39:"IT 4105 (Lab-2) <br> Md. Shahidul Islam";}s:11:"10.00-11.20";a:3:{i:0;s:45:"IT 3107 (Lab-2) <br> Md. Fazlul Karim Patwary";i:1;s:36:"IT 1103 (Lab-3) <br> Fahima Tabassum";i:2;s:41:"IT 2107 (Lab-1) <br> M Mesbahuddin Sarker";}s:11:"11.30-12.50";a:2:{i:0;s:36:"IT 3109 (Lab-1) <br> M Shamim Kaiser";i:1;s:37:"IT 4101 (232) <br> Md. Shahidul Islam";}s:9:"2.00-4.45";a:1:{i:0;s:36:"IT 1106 (Lab-3) <br> Fahima Tabassum";}}s:6:"Wednes";a:4:{s:9:"8.30-9.50";a:3:{i:0;s:44:"IT 4109 (Lab-3) <br> Zamshed Iqbal Chowdhury";i:1;s:36:"IT 1109 (Lab-1) <br> Fahima Tabassum";i:2;s:39:"IT 2109 (232) <br> M Mesbahuddin Sarker";}s:11:"10.00-11.20";a:3:{i:0;s:44:"IT 4109 (Lab-1) <br> Zamshed Iqbal Chowdhury";i:1;s:45:"IT 3105 (Lab-3) <br> Md. Fazlul Karim Patwary";i:2;s:32:"IT 2103 (232) <br> Jesmin Akhter";}s:11:"11.30-12.50";a:3:{i:0;s:39:"IT 4101 (Lab-1) <br> Md. Shahidul Islam";i:1;s:34:"IT 2103 (Lab-3) <br> Jesmin Akhter";i:2;s:34:"IT 1101 (Lab-2) <br> K M Akkas Ali";}s:9:"2.00-4.45";a:2:{i:0;s:36:"IT 3102 (Lab-2) <br> M Shamim Kaiser";i:1;s:34:"IT 2104 (Lab-1) <br> Jesmin Akhter";}}s:5:"Thurs";a:4:{s:9:"8.30-9.50";a:1:{i:0;s:34:"IT 2105 (Lab-3) <br> Jesmin Akhter";}s:11:"10.00-11.20";a:3:{i:0;s:35:"IT 3103 (232) <br> Md. Wahiduzzaman";i:1;s:39:"IT 2101 (Lab-3) <br> Mohammad Abu Yusuf";i:2;s:39:"IT 4103 (Lab-1) <br> Md. Shahidul Islam";}s:11:"11.30-12.50";a:3:{i:0;s:44:"IT 4107 (Lab-1) <br> Zamshed Iqbal Chowdhury";i:1;s:37:"IT 3103 (Lab-3) <br> Md. Wahiduzzaman";i:2;s:32:"IT 1105 (232) <br> K M Akkas Ali";}s:9:"2.00-4.45";a:2:{i:0;s:37:"IT 3108 (Lab-2) <br> Md. Wahiduzzaman";i:1;s:34:"IT 2102 (Lab-3) <br> Jesmin Akhter";}}}', '2018-08-02 08:15:04');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(20) NOT NULL,
  `teacher_name` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `department_name` varchar(35) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `teacher_id`, `teacher_name`, `designation`, `department_name`, `email_id`) VALUES
(1, 'KMA', 'K M Akkas Ali', 'Associate PRofessor', 'IIT', 'akkas@juniv.edu'),
(2, 'FT', 'Fahima Tabassum', 'Associate Professor', 'IIT', 'fahima@juniv.edu'),
(3, 'RTK', 'Risala Tahsin Khan', 'Associate Professor', 'IIT', 'risala@juniv.edu'),
(4, 'MAY', 'Mohammad Abu Yusuf', 'Associate Professor', 'IIT', 'yousuf@juniv.edu'),
(5, 'JA', 'Jesmin Akhter', 'Associate Professor', 'IIT', 'jesmin@juniv.edu'),
(6, 'MMS', 'M Mesbahuddin Sarker', 'Associate Professor', 'IIT', 'sarker@juniv.edu'),
(7, 'WZ', 'Md. Wahiduzzaman', 'Associate Professor', 'IIT', 'ohiduzzaman@yahoo.com'),
(8, 'FKP', 'Md. Fazlul Karim Patwary', 'Associate Professor', 'IIT', 'patwary@juniv.edu'),
(9, 'MSK', 'M Shamim Kaiser', 'Associate Professor', 'IIT', 'mkaiser@juniv.edu'),
(10, 'MSI', 'Md. Shahidul Islam', 'Assistant Professor', 'IIT', 'msislam@juniv.edu'),
(11, 'ZIC', 'Zamshed Iqbal Chowdhury', 'Lecturer', 'IIT', 'zic@juniv.edu');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
