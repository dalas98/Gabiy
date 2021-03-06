-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2018 at 11:45 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gabiy`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(7) NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_person` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `ip_address` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `username`, `password`, `name`, `address`, `contact_person`, `email`, `ip_address`, `token`, `level`) VALUES
('admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin SD Tech', 'PT. Sinergi Digital Ruko Bintaro', '', '', '', '', 1),
('CUS001', 'gilang', '0079fcb602361af76c4fd616d60f9414', 'Gilang Romadhon Nurohman', 'Jakarta Barat', '08283838383', 'gilang@gmail.com', '192.168.100.31', 'G3qCCFKkAmBjFiEuNooVZDKQGyvLSOXAGGVRJZFIJOUPNTXQVQ', 2),
('CUS002', 'romadhon', '0079fcb602361af76c4fd616d60f9414', 'romadhon', 'Jakarta Barat', '09888828828', 'gilang@gmail.com', '192.168.100.31', '48pDNJhnijUsDrCWRQXPSspsSZEGUWKUyBEMKUXJIHLTUQRZPR', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer_device`
--

CREATE TABLE `customer_device` (
  `id` varchar(7) NOT NULL,
  `nama_device` varchar(50) NOT NULL,
  `device_alias` varchar(20) NOT NULL,
  `pin` varchar(2) NOT NULL,
  `description` text NOT NULL,
  `keyword` varchar(200) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `customer_id` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_device`
--

INSERT INTO `customer_device` (`id`, `nama_device`, `device_alias`, `pin`, `description`, `keyword`, `kategori`, `customer_id`) VALUES
('CD0001', 'Lampu lantai 2', 'Lampu biasa', '15', 'Lampu', 'lampu,lantai,dua', 'Lampu', 'CUS001'),
('CD0002', 'AC', 'AC Ruang tengah', '19', 'ac', 'ac,ruang,tengah', 'AC', 'CUS002'),
('CD0003', 'Lampu sorot', 'Lampu sorot lampu te', '13', 'Lampu', 'oke,lampu,sorot,tengah', 'Lampu', 'CUS001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `customer_device`
--
ALTER TABLE `customer_device`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_device`
--
ALTER TABLE `customer_device`
  ADD CONSTRAINT `customer_device_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
