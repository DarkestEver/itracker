-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2017 at 10:17 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.0.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itrack`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insert_track11` (IN `_description` VARCHAR(255), IN `_projectid` INT, IN `_tagsid` INT, IN `_starttime` DATETIME, IN `_endtime` DATETIME, IN `_userid` INT)  BEGIN  
IF TIMESTAMPDIFF(MINUTE,_starttime,_endtime) > 0 THEN
 		INSERT into track (description, projectid, tagsid, starttime, stoptime, `status`, userid) VALUES (_description, _projectid, _tagsid, _starttime, _endtime, 2, _userid);
    END IF;
   IF TIMESTAMPDIFF(MINUTE,_starttime,_endtime) = 0 THEN
 		update  track set status = 2 where DATE_FORMAT(starttime,'%y-%m-%d') = DATE_FORMAT(_starttime,'%y-%m-%d');
 		INSERT into track (description, projectid, tagsid, starttime, stoptime, `status`, userid) VALUES (_description, _projectid, _tagsid, _starttime, _endtime, 1, _userid);
    END IF;
    select 1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `congkey` varchar(255) DEFAULT NULL,
  `congvalues` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `groups` int(11) NOT NULL,
  `lebel` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `createdon` date NOT NULL,
  `modifiedon` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `projectid` varchar(15) NOT NULL,
  `projectname` varchar(255) NOT NULL,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifieddate` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `projectid`, `projectname`, `createddate`, `modifieddate`, `status`) VALUES
(0, 'pro1', 'proj1', '2017-07-30 06:17:27', '0000-00-00', 1),
(1, 'pro2', 'proj2', '2017-07-30 06:17:27', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `tagname` varchar(255) NOT NULL,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifieddate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tagname`, `createddate`, `modifieddate`) VALUES
(0, 'closed', '2017-07-30 22:00:08', '0000-00-00'),
(1, 'estimation', '2017-07-30 22:00:58', '0000-00-00'),
(2, 'in progress', '2017-07-30 22:00:34', '0000-00-00'),
(3, 'on hold', '2017-07-30 22:00:34', '0000-00-00'),
(4, 'open', '2017-07-30 22:00:08', '0000-00-00'),
(5, 'waiting response', '2017-07-30 22:00:58', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `id` int(11) NOT NULL,
  `description` varchar(15) DEFAULT NULL,
  `projectid` varchar(15) DEFAULT NULL,
  `tagsid` varchar(255) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `stoptime` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `description`, `projectid`, `tagsid`, `starttime`, `stoptime`, `userid`, `createddate`, `status`) VALUES
(11, '', 'pro1', NULL, '2017-07-30 00:00:00', '2017-07-30 00:00:00', 0, '2017-07-30 12:32:10', 1),
(12, '', 'pro1', NULL, '2017-07-30 00:00:00', '2017-07-30 00:00:00', 0, '2017-07-30 12:32:11', 1),
(13, '', 'pro1', NULL, '2017-07-30 00:00:00', '2017-07-30 00:00:00', 0, '2017-07-30 12:32:14', 1),
(14, '', '0', NULL, '2017-07-30 00:00:00', '2017-07-30 00:00:00', 0, '2017-07-30 12:51:05', 1),
(15, '', '0', NULL, '2017-07-30 00:00:00', '2017-07-30 00:00:00', 0, '2017-07-30 12:52:46', 1),
(16, 'aaa', '0', NULL, '2017-07-30 11:05:00', '2017-07-30 00:00:00', 0, '2017-07-30 12:54:33', 1),
(17, 'aaa', '0', NULL, '2017-07-30 01:05:00', '2017-07-30 01:15:00', 0, '2017-07-30 12:58:43', 1),
(18, 'sd', '0', NULL, '2017-07-30 12:05:00', '2017-07-30 01:10:00', 0, '2017-07-30 13:00:00', 1),
(19, 'sd', '0', NULL, '2017-07-30 12:05:00', '2017-07-30 01:10:00', 0, '2017-07-30 13:00:39', 1),
(20, 'aaa', '0', NULL, '2017-07-30 03:20:00', '2017-07-30 12:00:00', 0, '2017-07-30 13:01:09', 1),
(21, '', '0', NULL, '2017-07-30 00:00:00', '2017-07-30 00:00:00', 0, '2017-07-30 19:14:28', 1),
(22, 'aaa', 'pro1', '0', '2017-07-31 00:05:00', '2017-07-31 23:30:00', 0, '2017-07-31 16:55:04', 1),
(23, '1111', 'pro1', '0', '2017-08-02 13:05:00', '2017-08-02 23:15:00', 0, '2017-08-02 22:11:00', 1),
(24, '', '', '', '2017-08-05 11:14:00', '2017-08-05 11:00:00', 0, '2017-08-05 07:44:43', 1),
(25, '', '', '', '2017-08-05 11:15:00', '2017-08-05 10:15:00', 0, '2017-08-05 07:45:39', 1),
(26, '', '', '', '2017-08-05 11:15:00', '2017-08-05 10:15:00', 0, '2017-08-05 07:46:44', 1),
(27, '', '', '', '2017-08-05 11:16:00', '2017-08-05 11:15:00', 0, '2017-08-05 07:47:03', 1),
(28, '', '', '', '2017-08-05 11:19:00', '2017-08-05 10:19:00', 0, '2017-08-05 07:49:53', 1),
(29, '', '', '', '2017-08-05 11:26:00', '2017-08-05 11:24:00', 0, '2017-08-05 07:56:38', 1),
(30, '', '', '', '2017-08-05 11:28:00', '2017-08-05 11:28:00', 0, '2017-08-05 07:58:16', 1),
(31, '', '', '', '2017-08-05 11:29:00', '2017-08-05 11:29:00', 0, '2017-08-05 07:59:09', 1),
(32, '', '', '', '2017-08-05 11:29:00', '2017-08-05 11:29:00', 0, '2017-08-05 08:00:34', 1),
(33, '', '', '', '2017-08-05 11:30:00', '2017-08-05 10:30:00', 0, '2017-08-05 08:04:25', 1),
(34, '', '', '', '2017-08-05 11:38:00', '2017-08-05 10:38:00', 0, '2017-08-05 08:08:41', 1),
(35, '', '', '', '2017-08-05 12:37:00', '2017-08-05 12:36:00', 0, '2017-08-05 09:07:11', 1),
(53, 'aaa', 'pro1', '0', '2017-08-06 00:00:00', '2017-08-06 02:59:00', 0, '2017-08-06 13:13:55', 1),
(54, 'my name is kesh', 'pro1', '0', '2017-08-06 03:10:00', '2017-08-06 03:59:00', 0, '2017-08-06 13:13:55', 1),
(55, 'aaa', 'pro1', '0', '2017-08-06 05:10:00', '2017-08-06 23:59:00', 0, '2017-08-06 13:13:55', 1),
(56, 'aaa', 'pro1', '0', '2017-08-02 17:05:00', '2017-08-02 17:05:00', 0, '2017-08-06 13:35:09', 1),
(57, 'aaa', 'pro1', '0', '2017-08-06 17:18:00', '2017-08-06 17:19:00', 0, '2017-08-06 13:49:37', 1),
(58, 'aaa', 'pro1', '1', '2017-08-06 17:20:00', '2017-08-06 17:22:00', 0, '2017-08-06 13:52:57', 1),
(59, 'aaa', 'pro1', '0', '2017-08-06 17:28:00', '2017-08-06 17:28:00', 0, '2017-08-06 13:59:42', 1),
(60, 'aaa', 'pro1', '0', '2017-08-06 17:33:00', '2017-08-06 17:33:00', 0, '2017-08-06 14:03:16', 1),
(61, 'aaa', 'pro1', '0', '2017-08-06 17:33:00', '2017-08-06 17:33:00', 0, '2017-08-06 14:05:02', 1),
(62, 'aaa', 'pro1', '0', '2017-08-07 03:05:00', '2017-08-07 03:19:00', 0, '2017-08-06 23:49:40', 2),
(64, 'aaa', 'pro1', '1', '2017-08-07 04:05:00', '2017-08-07 04:50:00', 0, '2017-08-07 00:35:28', 2),
(66, 'test1', 'pro1', '3', '2017-08-07 05:00:00', '2017-08-07 05:40:00', 0, '2017-08-07 01:11:18', 2),
(67, 'usp1', '226021', '2', NULL, NULL, NULL, '2017-08-07 06:01:27', 1),
(68, 'usp1', '226021', '2', '2017-08-07 08:40:00', '2017-08-07 09:40:00', 0, '2017-08-07 06:04:20', 2),
(69, 'sd', '0', '2', '2017-08-07 06:21:00', '2017-08-07 22:21:00', NULL, '2017-08-07 06:22:50', 2),
(70, 'aaa', '0', '2', '2017-08-07 06:23:00', '2017-08-07 06:50:00', NULL, '2017-08-07 06:23:13', 2),
(71, 'aaa', '0', '1', '2017-08-07 07:28:00', '2017-08-07 08:28:00', 0, '2017-08-07 06:28:45', 2),
(72, 'sd', '0', '1', '2017-08-07 17:31:00', '2017-08-07 20:31:00', 0, '2017-08-07 06:32:20', 1),
(73, 'aaa', '0', '0', '2017-08-09 00:36:00', '2017-08-09 00:36:00', 0, '2017-08-10 00:36:12', 2),
(74, 'aaa', '0', '0', '2017-08-09 01:00:00', '2017-08-09 01:00:00', 0, '2017-08-10 01:00:36', 2),
(75, 'aaa', '0', '0', '2017-08-09 01:00:00', '2017-08-09 01:00:00', 0, '2017-08-10 01:00:59', 2),
(76, 'aaa', '0', '0', '2017-08-09 01:00:00', '2017-08-09 01:00:00', 0, '2017-08-10 01:01:22', 2),
(77, 'aaa', '0', '0', '2017-08-09 01:00:00', '2017-08-09 01:00:00', 0, '2017-08-10 01:02:40', 2),
(78, 'aaa', '0', '0', '2017-08-09 01:00:00', '2017-08-09 01:00:00', 0, '2017-08-10 01:03:32', 2),
(79, 'aaa', '0', '1', '2017-08-09 01:04:00', '2017-08-09 01:04:00', 0, '2017-08-10 01:04:26', 2),
(80, 'aaa', '0', '1', '2017-08-09 01:04:00', '2017-08-09 01:04:00', 0, '2017-08-10 01:05:37', 2),
(81, 'aaa', '0', '1', '2017-08-09 01:04:00', '2017-08-09 01:04:00', 0, '2017-08-10 01:05:56', 2),
(82, 'aaa', '0', '1', '2017-08-09 01:06:00', '2017-08-09 01:06:00', 0, '2017-08-10 01:06:19', 2),
(83, 'aaa', '0', '0', '2017-08-09 01:09:00', '2017-08-09 01:09:00', 0, '2017-08-10 01:09:23', 2),
(84, 'aaa', '0', '1', '2017-08-09 01:13:00', '2017-08-09 01:13:00', 0, '2017-08-10 01:13:57', 2),
(85, 'aaa', '0', '1', '2017-08-09 01:13:00', '2017-08-09 01:13:00', 0, '2017-08-10 01:14:02', 2),
(86, 'aaa', '0', '1', '2017-08-09 01:13:00', '2017-08-09 01:13:00', 0, '2017-08-10 01:14:06', 2),
(87, 'aaa', '0', '0', '2017-08-09 01:15:00', '2017-08-09 01:15:00', 0, '2017-08-10 01:15:42', 2),
(88, 'aaa', '0', '0', '2017-08-09 01:15:00', '2017-08-09 01:15:00', 0, '2017-08-10 01:15:48', 2),
(89, 'aaa', '0', '0', '2017-08-09 01:16:00', '2017-08-09 01:16:00', 0, '2017-08-10 01:17:02', 2),
(90, 'aaa', '0', '0', '2017-08-09 01:19:00', '2017-08-09 01:19:00', 0, '2017-08-10 01:19:38', 2),
(91, 'aaa', '0', '0', '2017-08-09 01:06:00', '2017-08-09 01:06:00', 0, '2017-08-10 01:25:58', 2),
(92, 'aaa', '0', '1', '2017-08-09 01:26:00', '2017-08-09 02:26:00', 0, '2017-08-10 01:26:52', 1),
(93, 'sd', '0', '0', '2017-09-22 05:50:00', '2017-09-22 20:26:00', 0, '2017-09-22 20:26:42', 2),
(94, 'aaa', '0', '0', '2017-09-22 21:50:00', '2017-09-22 22:26:00', 0, '2017-09-22 20:27:23', 2),
(95, 'aaa', '0', '1', '2017-09-22 20:28:00', '2017-09-22 20:28:00', 0, '2017-09-22 20:29:01', 1),
(96, 'aaa', '0', '0', '2017-09-27 01:12:00', '2017-09-27 01:12:00', 0, '2017-09-26 01:12:55', 2),
(97, 'aaa', '0', '0', '2017-09-27 01:12:00', '2017-09-27 03:12:00', 0, '2017-09-26 01:14:32', 2),
(98, 'aaa', '0', '0', '2017-09-27 01:17:00', '2017-09-27 01:17:00', 0, '2017-09-26 01:18:21', 2),
(99, 'aaa', '0', '0', '2017-09-27 01:17:00', '2017-09-27 01:17:00', 0, '2017-09-26 01:18:55', 2),
(100, 'aaa', '0', '0', '2017-09-27 01:12:00', '2017-09-27 01:12:00', 0, '2017-09-26 01:19:12', 2),
(101, 'aaa', '0', '0', '2017-09-27 01:12:00', '2017-09-27 01:20:00', 0, '2017-09-26 01:19:42', 2),
(102, 'aaa', '0', '2', '2017-09-27 01:12:00', '2017-09-27 01:55:00', 0, '2017-09-26 01:21:19', 2),
(103, 'aaa', '0', '1', '2017-09-27 01:26:00', '2017-09-27 01:26:00', 0, '2017-09-26 01:26:38', 1),
(104, 'aaa', '0', '1', '2017-09-25 07:51:00', '2017-09-25 08:52:00', 0, '2017-09-26 01:53:09', 2),
(105, 'aaa', '0', '1', '2017-09-25 07:51:00', '2017-09-25 09:52:00', 0, '2017-09-26 01:53:29', 2),
(106, 'sd', '0', '1', '2017-09-25 23:20:00', '2017-09-25 23:55:00', 0, '2017-09-26 01:57:00', 2),
(107, 'sd', '0', '0', '2017-09-25 10:57:00', '2017-09-25 12:57:00', 0, '2017-09-26 01:57:43', 2),
(108, 'sd', '0', '1', '2017-09-25 23:20:00', '2017-09-25 23:55:00', 0, '2017-09-26 01:58:02', 2),
(109, 'aaa', '0', '1', '2017-09-25 17:59:00', '2017-09-25 19:59:00', 0, '2017-09-26 01:59:57', 2),
(110, 'aaa', '0', '0', '2017-09-25 23:00:00', '2017-09-25 23:15:00', 0, '2017-09-26 02:00:43', 2),
(111, 'aaa', '0', '0', '2017-09-25 20:01:00', '2017-09-25 22:01:00', 0, '2017-09-26 02:01:14', 2),
(112, 'test1', '0', '3', '2017-09-25 02:08:00', '2017-09-25 02:40:00', 0, '2017-09-26 23:11:46', 1),
(113, 'aaa', '0', '1', '2017-09-26 23:20:00', '2017-09-26 23:20:00', 0, '2017-09-26 23:20:23', 2),
(114, 'aaa', '0', '1', '2017-09-26 23:20:00', '2017-09-26 23:25:00', 0, '2017-09-26 23:26:00', 2),
(115, 'aaa', '0', '0', '2017-09-26 23:26:00', '2017-09-26 23:26:00', 0, '2017-09-26 23:46:31', 2),
(116, 'aaa', '0', '1', '2017-09-26 23:26:00', '2017-09-26 23:28:00', 0, '2017-09-26 23:46:51', 2),
(117, 'aaa', '0', '1', '2017-09-26 23:57:00', '2017-09-26 23:57:00', 0, '2017-09-26 23:57:33', 2),
(118, 'aaa', '0', '0', '2017-09-26 23:57:00', '2017-09-26 23:58:00', 0, '2017-09-26 23:58:03', 2),
(119, 'aaa', '0', '0', '2017-09-26 23:59:00', '2017-09-26 23:59:00', 0, '2017-09-26 23:59:07', 2),
(120, 'aaa', '0', '0', '2017-09-26 23:59:00', '2017-09-26 23:59:00', 0, '2017-09-26 23:59:19', 2),
(121, 'aaa', '0', '0', '2017-09-26 00:00:00', '2017-09-26 00:00:00', 0, '2017-09-27 00:00:11', 2),
(122, 'aaa', '0', '1', '2017-09-26 00:00:00', '2017-09-26 00:00:00', 0, '2017-09-27 00:00:39', 2),
(123, 'aaa', '0', '1', '2017-09-26 00:01:00', '2017-09-26 00:01:00', 0, '2017-09-27 00:01:18', 2),
(124, 'aaa', '0', '0', '2017-09-26 00:01:00', '2017-09-26 00:01:00', 0, '2017-09-27 00:01:26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `password` varchar(300) DEFAULT NULL,
  `usertype` varchar(255) DEFAULT NULL,
  `registerDate` date DEFAULT NULL,
  `lastvisitDate` date DEFAULT NULL,
  `activation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `USERNAME`, `password`, `usertype`, `registerDate`, `lastvisitDate`, `activation`) VALUES
(0, 'keshav kant singh', 'admin@admin.com', '5edfa2692bdacc5e6ee805c626c50cb44cebb065f092d9a1067d89f74dacd326', 'admin', NULL, NULL, 1),
(0, 'himanshu', 'himanshu@admin.com', '5edfa2692bdacc5e6ee805c626c50cb44cebb065f092d9a1067d89f74dacd326', 'admin', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_jointrack`
-- (See below for the actual view)
--
CREATE TABLE `view_jointrack` (
`description` varchar(15)
,`projectid` varchar(15)
,`tagsid` varchar(255)
,`starttime` datetime
,`stoptime` datetime
,`userid` int(11)
,`status` int(11)
,`tagname` varchar(255)
,`projectname` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_tracking`
-- (See below for the actual view)
--
CREATE TABLE `view_tracking` (
`id` int(11)
,`description` varchar(15)
,`projectid` varchar(15)
,`tagsid` varchar(255)
,`stoptime` datetime
,`starttime` datetime
,`starttime1` varchar(10)
,`stoptime1` varchar(10)
,`minutes` decimal(17,0)
,`startingtime` decimal(17,0)
,`userid` int(11)
,`status` int(11)
,`tagname` varchar(255)
,`projectname` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `view_jointrack`
--
DROP TABLE IF EXISTS `view_jointrack`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_jointrack`  AS  select `track`.`description` AS `description`,`track`.`projectid` AS `projectid`,`track`.`tagsid` AS `tagsid`,`track`.`starttime` AS `starttime`,`track`.`stoptime` AS `stoptime`,`track`.`userid` AS `userid`,`track`.`status` AS `status`,`tags`.`tagname` AS `tagname`,`projects`.`projectname` AS `projectname` from ((`track` join `tags` on((`tags`.`id` = `track`.`tagsid`))) join `projects` on((`projects`.`projectid` = `track`.`projectid`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_tracking`
--
DROP TABLE IF EXISTS `view_tracking`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_tracking`  AS  select `track`.`id` AS `id`,`track`.`description` AS `description`,`track`.`projectid` AS `projectid`,`track`.`tagsid` AS `tagsid`,`track`.`stoptime` AS `stoptime`,`track`.`starttime` AS `starttime`,date_format(`track`.`starttime`,'%H:%i') AS `starttime1`,date_format(`track`.`stoptime`,'%H:%i') AS `stoptime1`,round((time_to_sec(timediff(`track`.`stoptime`,`track`.`starttime`)) / 60),0) AS `minutes`,round((time_to_sec(date_format(`track`.`starttime`,'%H:%i:%s')) / 60),0) AS `startingtime`,`track`.`userid` AS `userid`,`track`.`status` AS `status`,`tags`.`tagname` AS `tagname`,`projects`.`projectname` AS `projectname` from ((`track` left join `tags` on((`tags`.`id` = `track`.`tagsid`))) left join `projects` on((`projects`.`projectid` = `track`.`projectid`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`projectid`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tagname`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USERNAME`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
