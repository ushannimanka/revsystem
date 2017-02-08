-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2017 at 11:10 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sp_revenue`
--

-- --------------------------------------------------------

--
-- Table structure for table `balance_history`
--

CREATE TABLE `balance_history` (
  `ID` int(11) NOT NULL,
  `JOB_ID` int(200) NOT NULL,
  `SP_ID` varchar(200) NOT NULL,
  `TIMESTAMP` varchar(20) NOT NULL,
  `SP_NAME` varchar(200) NOT NULL,
  `BALANCE` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balance_history`
--

INSERT INTO `balance_history` (`ID`, `JOB_ID`, `SP_ID`, `TIMESTAMP`, `SP_NAME`, `BALANCE`) VALUES
(3570, 44, 'SPP_000007', '2016-12-23 17:12:35', 'Shalika Galawala', 0),
(3571, 44, 'SPP_000011', '2016-12-23 17:12:35', 'W.M.L.D.P.J. de Silva', 0),
(3572, 44, 'SPP_000012', '2016-12-23 17:12:36', 'Ishan de Lanerolle', 0),
(3573, 44, 'SPP_000016', '2016-12-23 17:12:36', 'Sudharshan Ramasamy', 0),
(3574, 45, 'SPP_000007', '2016-12-23 17:12:52', 'Shalika Galawala', 0),
(3575, 45, 'SPP_000011', '2016-12-23 17:12:52', 'W.M.L.D.P.J. de Silva', 0),
(3576, 45, 'SPP_000012', '2016-12-23 17:12:52', 'Ishan de Lanerolle', 0),
(3577, 45, 'SPP_000016', '2016-12-23 17:12:52', 'Sudharshan Ramasamy', 0),
(3578, 46, 'SPP_000007', '2016-12-27 15:40:31', 'Shalika Galawala', 504),
(3579, 46, 'SPP_000011', '2016-12-27 15:40:31', 'W.M.L.D.P.J. de Silva', 525),
(3580, 46, 'SPP_000012', '2016-12-27 15:40:31', 'Ishan de Lanerolle', 800),
(3581, 46, 'SPP_000016', '2016-12-27 15:40:31', 'Sudharshan Ramasamy', 11785.067),
(3582, 47, 'SPP_000007', '2016-12-29 15:41:32', 'Shalika Galawala', 1008),
(3583, 47, 'SPP_000011', '2016-12-29 15:41:33', 'W.M.L.D.P.J. de Silva', 1050),
(3584, 47, 'SPP_000012', '2016-12-29 15:41:33', 'Ishan de Lanerolle', 1600),
(3585, 47, 'SPP_000016', '2016-12-29 15:41:33', 'Sudharshan Ramasamy', 23570.134),
(3586, 48, 'SPP_000007', '2017-01-23 11:55:27', 'Shalika Galawala', 1512),
(3587, 48, 'SPP_000011', '2017-01-23 11:55:27', 'W.M.L.D.P.J. de Silva', 1575),
(3588, 48, 'SPP_000012', '2017-01-23 11:55:27', 'Ishan de Lanerolle', 2400),
(3589, 48, 'SPP_000016', '2017-01-23 11:55:27', 'Sudharshan Ramasamy', 35355.201),
(3590, 49, 'SPP_000007', '2017-01-23 11:56:05', 'Shalika Galawala', 2016),
(3591, 49, 'SPP_000011', '2017-01-23 11:56:06', 'W.M.L.D.P.J. de Silva', 2100),
(3592, 49, 'SPP_000012', '2017-01-23 11:56:06', 'Ishan de Lanerolle', 3200),
(3593, 49, 'SPP_000016', '2017-01-23 11:56:06', 'Sudharshan Ramasamy', 47140.268);

-- --------------------------------------------------------

--
-- Table structure for table `jobs_log`
--

CREATE TABLE `jobs_log` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP` varchar(20) NOT NULL,
  `JOB_ID` int(200) NOT NULL,
  `SP_ID` varchar(200) NOT NULL,
  `AMOUNT` double NOT NULL,
  `DESCRIPTION` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobs_log`
--

INSERT INTO `jobs_log` (`ID`, `TIMESTAMP`, `JOB_ID`, `SP_ID`, `AMOUNT`, `DESCRIPTION`) VALUES
(3604, '2016-12-23 17:12:35', 44, 'SPP_000007', 504, 'DEBIT'),
(3605, '2016-12-23 17:12:35', 44, 'SPP_000011', 525, 'DEBIT'),
(3606, '2016-12-23 17:12:36', 44, 'SPP_000012', 800, 'DEBIT'),
(3607, '2016-12-23 17:12:36', 44, 'SPP_000016', 11785.067, 'DEBIT'),
(3608, '2016-12-23 17:12:52', 45, 'SPP_000007', 504, 'CREDIT'),
(3609, '2016-12-23 17:12:52', 45, 'SPP_000011', 525, 'CREDIT'),
(3610, '2016-12-23 17:12:52', 45, 'SPP_000012', 800, 'CREDIT'),
(3611, '2016-12-23 17:12:52', 45, 'SPP_000016', 11785.067, 'CREDIT'),
(3612, '2016-12-27 15:40:31', 46, 'SPP_000007', 504, 'DEBIT'),
(3613, '2016-12-27 15:40:31', 46, 'SPP_000011', 525, 'DEBIT'),
(3614, '2016-12-27 15:40:31', 46, 'SPP_000012', 800, 'DEBIT'),
(3615, '2016-12-27 15:40:31', 46, 'SPP_000016', 11785.067, 'DEBIT'),
(3616, '2016-12-29 15:41:32', 47, 'SPP_000007', 504, 'DEBIT'),
(3617, '2016-12-29 15:41:32', 47, 'SPP_000011', 525, 'DEBIT'),
(3618, '2016-12-29 15:41:33', 47, 'SPP_000012', 800, 'DEBIT'),
(3619, '2016-12-29 15:41:33', 47, 'SPP_000016', 11785.067, 'DEBIT'),
(3620, '2017-01-23 11:55:27', 48, 'SPP_000007', 504, 'DEBIT'),
(3621, '2017-01-23 11:55:27', 48, 'SPP_000011', 525, 'DEBIT'),
(3622, '2017-01-23 11:55:27', 48, 'SPP_000012', 800, 'DEBIT'),
(3623, '2017-01-23 11:55:27', 48, 'SPP_000016', 11785.067, 'DEBIT'),
(3624, '2017-01-23 11:56:05', 49, 'SPP_000007', 504, 'DEBIT'),
(3625, '2017-01-23 11:56:05', 49, 'SPP_000011', 525, 'DEBIT'),
(3626, '2017-01-23 11:56:06', 49, 'SPP_000012', 800, 'DEBIT'),
(3627, '2017-01-23 11:56:06', 49, 'SPP_000016', 11785.067, 'DEBIT');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jobs`
--

CREATE TABLE `tbl_jobs` (
  `JOB_ID` int(200) NOT NULL,
  `TIMESTAMP` varchar(20) NOT NULL,
  `DESCRIPTION` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jobs`
--

INSERT INTO `tbl_jobs` (`JOB_ID`, `TIMESTAMP`, `DESCRIPTION`) VALUES
(44, '2016-12-23 17:12:35', 'DEBIT'),
(45, '2016-12-23 17:12:52', 'CREDIT'),
(46, '2016-12-27 15:40:31', 'DEBIT'),
(47, '2016-12-29 15:41:32', 'DEBIT'),
(48, '2017-01-23 11:55:26', 'DEBIT'),
(49, '2017-01-23 11:56:05', 'DEBIT');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sp`
--

CREATE TABLE `tbl_sp` (
  `date` varchar(100) NOT NULL,
  `id` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `bank_code` varchar(100) NOT NULL,
  `branch_code` varchar(100) NOT NULL,
  `bank` varchar(100) NOT NULL,
  `account_number` varchar(100) NOT NULL,
  `current_balance` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sp`
--

INSERT INTO `tbl_sp` (`date`, `id`, `username`, `bank_code`, `branch_code`, `bank`, `account_number`, `current_balance`) VALUES
('30.9.16', 'SPP_000007', 'Shalika Galawala', '7056', '047', 'Commercial Bank Kirulapone mini com', '8470005407', 2016),
('30.9.16', 'SPP_000011', 'W.M.L.D.P.J. de Silva', '7214', '020', 'Mt. Lavinia', '020111004343', 2100),
('30.9.16', 'SPP_000012', 'Ishan de Lanerolle', 'HSBCLKLX', '012', 'HSBC Union Place', '003048055040', 3200),
('30.9.16', 'SPP_000016', 'Sudharshan Ramasamy', '7083', '147', 'Nawala', '147020062354', 47140.268);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance_history`
--
ALTER TABLE `balance_history`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `jobs_log`
--
ALTER TABLE `jobs_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_jobs`
--
ALTER TABLE `tbl_jobs`
  ADD PRIMARY KEY (`JOB_ID`);

--
-- Indexes for table `tbl_sp`
--
ALTER TABLE `tbl_sp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balance_history`
--
ALTER TABLE `balance_history`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3594;
--
-- AUTO_INCREMENT for table `jobs_log`
--
ALTER TABLE `jobs_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3628;
--
-- AUTO_INCREMENT for table `tbl_jobs`
--
ALTER TABLE `tbl_jobs`
  MODIFY `JOB_ID` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
