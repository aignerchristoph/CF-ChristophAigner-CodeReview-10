-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 09, 2019 at 12:38 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr10_christoph_aigner_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `car_model` varchar(40) DEFAULT NULL,
  `car_price` int(11) DEFAULT NULL,
  `car_status` varchar(200) DEFAULT NULL,
  `car_availability` int(11) DEFAULT NULL,
  `fk_rental_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `car_model`, `car_price`, `car_status`, `car_availability`, `fk_rental_id`) VALUES
(1, 'Tesla S', 100, 'scratches on the front', 1, 1),
(2, 'Tesla 3', 50, 'no defect', 0, 1),
(3, 'Tesla X', 70, 'no defect', 1, 1),
(4, 'Audi R8', 100, 'not fueled', 1, 1),
(5, 'Ford Mustang', 120, 'scratches on the wheels', 0, 1),
(6, 'Lamborghini', 150, 'smells funky', 0, 1),
(7, 'Ferrari F40', 200, 'no seat belts', 1, 1),
(8, 'Porsche GT-3', 180, 'no defect', 0, 1),
(9, 'Mercedes AMG', 150, 'defect radio', 0, 1),
(10, 'Tesla Roadster', 200, 'top notch', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `car_rental`
--

CREATE TABLE `car_rental` (
  `rental_id` int(11) NOT NULL,
  `rental_name` varchar(50) DEFAULT NULL,
  `rental_adress` varchar(100) DEFAULT NULL,
  `rental_phone` int(11) DEFAULT NULL,
  `rental_email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_rental`
--

INSERT INTO `car_rental` (`rental_id`, `rental_name`, `rental_adress`, `rental_phone`, `rental_email`) VALUES
(1, 'Rentalizer', 'Stephansplatz 1', 676264825, 'office@rentalizer.com');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_firstname` varchar(100) DEFAULT NULL,
  `customer_lastname` varchar(50) DEFAULT NULL,
  `customer_phone` int(11) DEFAULT NULL,
  `customer_email` varchar(50) DEFAULT NULL,
  `customer_address` varchar(50) DEFAULT NULL,
  `customer_birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_firstname`, `customer_lastname`, `customer_phone`, `customer_email`, `customer_address`, `customer_birthdate`) VALUES
(1, 'Obi-Wan', 'Kenobi', 473847838, 'ben@gmail.com', 'Somewhere on Tatooine', '1969-06-02'),
(2, 'Freddie', 'Mercury', 202553437, 'freddie@gmx.com', 'queens road, england', '1960-02-17'),
(3, 'Carl', 'Craig', 2023335336, 'carl@craig.com', 'barcelona, Spain', '1985-02-05'),
(4, 'Donald', 'Trump', 2025553456, 'the donald@me.com', 'White House, Washington', '1950-03-22'),
(5, 'Elon', 'Musk', 202237443, 'elon@spacex.com', 'Spaceship Road, California', '1980-10-08');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_amount` int(11) DEFAULT NULL,
  `invoice_type` enum('creditcard','cash') DEFAULT NULL,
  `invoice_due` date DEFAULT NULL,
  `invoice_received` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_date`, `invoice_amount`, `invoice_type`, `invoice_due`, `invoice_received`) VALUES
(1, '2019-05-10', 1000, 'creditcard', '2019-05-25', '2019-05-10'),
(2, '2019-02-02', 220, 'creditcard', '2019-05-16', '2019-05-14'),
(3, '2019-06-25', 400, 'cash', '2019-06-25', '2019-06-20'),
(4, '2019-12-12', 8000, 'cash', '2019-12-12', '2019-12-10'),
(5, '2019-06-25', 2000, 'creditcard', '2019-06-30', '2019-06-29');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `reservation_start_date` date DEFAULT NULL,
  `reservation_end_date` date DEFAULT NULL,
  `reservation_start_station` enum('Vienna','Innsbruck') DEFAULT NULL,
  `reservation_end_station` enum('Vienna','Innsbruck') DEFAULT NULL,
  `reservation_status` enum('open','closed','in use') DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `reservation_start_date`, `reservation_end_date`, `reservation_start_station`, `reservation_end_station`, `reservation_status`, `fk_car_id`, `fk_invoice_id`, `fk_customer_id`) VALUES
(1, '2019-07-17', '2019-07-18', 'Vienna', 'Vienna', 'closed', 1, 1, 1),
(2, '2019-09-01', '2019-09-30', 'Vienna', 'Innsbruck', 'in use', 2, 2, 2),
(3, '2019-06-12', '2019-06-20', 'Innsbruck', 'Vienna', 'open', 3, 3, 3),
(4, '2019-05-24', '2019-05-29', 'Innsbruck', 'Innsbruck', 'closed', 4, 4, 4),
(5, '2019-04-13', '2019-04-21', 'Vienna', 'Vienna', 'closed', 5, 5, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `car_ibfk_1` (`fk_rental_id`);

--
-- Indexes for table `car_rental`
--
ALTER TABLE `car_rental`
  ADD PRIMARY KEY (`rental_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `reservation_ibfk_1` (`fk_invoice_id`),
  ADD KEY `reservation_ibfk_2` (`fk_car_id`),
  ADD KEY `reservation_ibfk_3` (`fk_customer_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_rental_id`) REFERENCES `car_rental` (`rental_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `cars` (`car_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
