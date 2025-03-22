-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2023 at 05:19 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookhaven`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_payment`
--

CREATE TABLE `bank_payment` (
  `PaymentID` int(6) NOT NULL,
  `TransferCode` int(8) NOT NULL,
  `AccNo` varchar(10) NOT NULL,
  `Bank` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_payment`
--

INSERT INTO `bank_payment` (`PaymentID`, `TransferCode`, `AccNo`, `Bank`) VALUES
(502, 90063, '8120056702', 'HSBC'),
(503, 90167, '8056970004', 'Amana Bank'),
(504, 91004, '8625409783', 'Chartered Bank'),
(505, 92059, '8536002471', 'HSBC'),
(506, 95001, '8625409783', 'Chartered Bank');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ItemCode` int(6) NOT NULL,
  `ISBN` int(13) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Genre` varchar(50) NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Author` varchar(50) NOT NULL,
  `Publisher` varchar(50) DEFAULT NULL,
  `YearOfPublication` varchar(4) DEFAULT NULL,
  `Edition` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ItemCode`, `ISBN`, `Title`, `Genre`, `Category`, `Author`, `Publisher`, `YearOfPublication`, `Edition`) VALUES
(1120, 747591059, 'Harry Potter and the Deathly Hallows', 'Fantasy', 'Young Adult Novel', 'J.K.Rowling', 'Bloomsbury', '2007', '1'),
(300502, 1590593324, 'Beginning MySQL Database Design and Optimization', 'Education', 'Database Management', 'Chad Russell', 'Springer', '2004', '1'),
(400201, 70164543, 'Operating Systems: A Spiral Approach', 'Education', 'Computer Science', 'Ramez Elmasri', 'Mcgraw Hill Higher Education', '2010', '1'),
(596320, 241351635, '12 Rules for Life', 'Self-help', 'Psychology', 'Jordan Peterson', 'Penguin Allen', '2018', '1'),
(805030, 1444424096, 'The Screwtape Letters', 'Epistolary novel', 'Novel', 'C.S.Lewis', 'Geoffrey Bles', '1942', '2'),
(820100, 133971248, 'Fundamentals of Database Systems', 'Education', 'Database Management', 'Ramez Elmasri', 'Pearson', '2015', '7');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(8) NOT NULL,
  `fName` varchar(50) NOT NULL,
  `lName` varchar(50) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` varchar(12) NOT NULL,
  `addLine1` varchar(50) NOT NULL,
  `addLine2` varchar(50) NOT NULL,
  `addLine3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `fName`, `lName`, `Email`, `Phone`, `addLine1`, `addLine2`, `addLine3`) VALUES
(65041, 'Matt', 'Fradd', 'm_fradd@gmail.com', '041569307541', '05', 'Trelawny Place', 'California'),
(65042, 'Scott', 'Hahn', 'Hahns50@yahoo.com', '042785304659', '60', ' Marlborough Drive', 'New York'),
(65043, 'Gilbert', 'Chesterton', 'chester01@yahoo.com', '040752643970', '6780', 'St. Albert Place', 'Florida'),
(65044, 'Tammy', 'Peterson', 'tpeter2@gmail.com', '046302157001', '394', 'Madison Avenue', 'Washington'),
(65045, 'Joe', 'Rogan', 'j_roe@gmail.com', '048567020439', '101', 'Theatre Avenue', 'Miami');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ItemCode` int(6) NOT NULL,
  `ItemName` varchar(50) NOT NULL,
  `Price` decimal(6,2) NOT NULL,
  `Supplier` varchar(50) NOT NULL,
  `StockLevel` int(6) DEFAULT NULL,
  `ReorderLevel` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ItemCode`, `ItemName`, `Price`, `Supplier`, `StockLevel`, `ReorderLevel`) VALUES
(1001, 'Blue Pen', 2.00, 'Anderson', 1500, 250),
(1002, '15cm Ruler', 5.00, 'Anderson', 1000, 250),
(1120, 'Harry Potter and the Deathly Hallows', 50.00, 'Peterson', 3000, 1000),
(100560, 'Pencil Box', 10.00, 'Dawkins', 750, 500),
(152000, 'Water Bottle', 8.00, 'Harris', 1200, 500),
(152010, 'Lunch Box', 13.00, 'Harris', 4000, 1000),
(300502, 'Beginning MySQL Database Design and Optimization', 30.00, 'Charles', 620, 500),
(400201, 'Operating Systems: A Spiral Approach', 30.00, 'Dawkins', 2630, 250),
(596320, '12 Rules for Life', 12.00, 'Morgan', 4500, 750),
(805030, 'The Screwtape Letters', 45.00, 'Charles', 3200, 720),
(820100, 'Fundamentals of Database Systems', 75.00, 'Peterson', 1640, 200);

-- --------------------------------------------------------

--
-- Table structure for table `item_supplier`
--

CREATE TABLE `item_supplier` (
  `ItemCode` int(6) NOT NULL,
  `SupplierID` int(5) NOT NULL,
  `DateSupplied` date NOT NULL,
  `Quantity` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_supplier`
--

INSERT INTO `item_supplier` (`ItemCode`, `SupplierID`, `DateSupplied`, `Quantity`) VALUES
(1120, 1006, '2023-04-06', 500),
(152010, 1008, '2023-10-03', 1000),
(596320, 1009, '2023-08-01', 650),
(805030, 1011, '2023-01-12', 250),
(820100, 1006, '2023-04-06', 1500);

-- --------------------------------------------------------

--
-- Table structure for table `online_payment`
--

CREATE TABLE `online_payment` (
  `PaymentID` int(6) NOT NULL,
  `CardNo` int(16) NOT NULL,
  `Bank` varchar(50) NOT NULL,
  `CardHolderName` varchar(50) NOT NULL,
  `IssuedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `online_payment`
--

INSERT INTO `online_payment` (`PaymentID`, `CardNo`, `Bank`, `CardHolderName`, `IssuedDate`) VALUES
(251, 2147483647, 'HNB', 'Scott Hahn', '2020-08-06'),
(252, 2147483647, 'HSBC', 'Tammy Peterson', '2018-11-25'),
(253, 2147483647, 'HSBC', 'Joe Rogan', '2021-04-13'),
(254, 2147483647, 'Chartered Bank', 'Gilbert Chesterton', '2019-03-06'),
(255, 2147483647, 'HSBC', 'Joe Rogan', '2021-04-13');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` int(6) NOT NULL,
  `OrderDate` date NOT NULL,
  `OrderedItems` varchar(100) DEFAULT NULL,
  `TotalAmount` decimal(6,2) NOT NULL,
  `OrderConfirmation` varchar(50) NOT NULL,
  `PaymentDetails` varchar(50) NOT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `DeliveryAddress` varchar(70) DEFAULT NULL,
  `CustomerID` int(8) NOT NULL,
  `PaymentID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `OrderDate`, `OrderedItems`, `TotalAmount`, `OrderConfirmation`, `PaymentDetails`, `DeliveryDate`, `DeliveryAddress`, `CustomerID`, `PaymentID`) VALUES
(4000, '2023-03-09', '12 Rules for Life, The Screwtape Letters', 57.00, 'Bank Payment', 'Successful', '2023-03-19', '394, Madison Avenue, Washington', 65044, 502),
(4001, '2023-05-07', 'The Screwtape Letters, Harry Potter and the Deathly Hallows', 95.00, 'Online Payment', 'Pending', '2023-05-17', '60,  Marlborough Drive, New York', 65042, 251),
(4002, '2023-06-02', 'Fundamentals of Database Systems, Operating Systems: A Spiral Approach', 105.00, 'Bank Payment', 'Successful', '2023-06-12', '6780, St. Albert Place, Florida', 65043, 503),
(4003, '2023-06-03', 'Lunch Box, Water Bottle', 21.00, 'Bank Payment', 'Pending', '2023-06-13', '101, Theatre Avenue, Miami', 65045, 504),
(4004, '2023-06-20', 'Water Bottle, Pencil Box', 18.00, 'Online Payment', 'Successful', '2023-06-30', '394, Madison Avenue, Washington', 65044, 252),
(4005, '2023-08-01', '15cm Ruler, 12 Rules for Life, Water Bottle', 25.00, 'Online Payment', 'Successful', '2023-08-11', '101, Theatre Avenue, Miami', 65045, 253),
(4006, '2023-09-16', 'Harry Potter and the Deathly Hallows', 50.00, 'Online Payment', 'Pending', '2023-09-26', '6780, St. Albert Place, Florida', 65043, 254),
(4007, '2023-09-18', 'Blue Pen, 15cm Ruler', 7.00, 'Bank Payment', 'Successful', '2023-09-28', '394, Madison Avenue, Washington', 65044, 505),
(4008, '2023-10-27', 'Pencil Box', 10.00, 'Bank Payment', 'Successful', '2023-11-07', '394, Madison Avenue, Washington', 65044, 506),
(4009, '2023-11-10', 'Fundamentals of Database Systems', 75.00, 'Online Payment', 'Pending', '2023-11-20', '101, Theatre Avenue, Miami', 65045, 255);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `ItemCode` int(6) NOT NULL,
  `OrderID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`ItemCode`, `OrderID`) VALUES
(1001, 4007),
(1002, 4005),
(1002, 4007),
(1120, 4001),
(1120, 4006),
(100560, 4004),
(100560, 4008),
(152000, 4003),
(152000, 4004),
(152000, 4005),
(152010, 4003),
(400201, 4002),
(596320, 4000),
(596320, 4005),
(805030, 4000),
(805030, 4001),
(820100, 4002),
(820100, 4009);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(6) NOT NULL,
  `Amount` decimal(6,2) NOT NULL,
  `DateAndTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `Amount`, `DateAndTime`) VALUES
(251, 95.00, '2023-05-13 08:35:00'),
(252, 18.00, '2023-06-24 11:10:00'),
(253, 25.00, '2023-08-05 01:59:00'),
(254, 50.00, '2023-09-21 02:26:00'),
(255, 75.00, '2023-11-15 03:05:00'),
(502, 57.00, '2023-03-16 02:33:00'),
(503, 105.00, '2023-06-02 12:50:00'),
(504, 21.00, '2023-06-09 06:21:00'),
(505, 7.00, '2023-09-23 04:01:00'),
(506, 10.00, '2023-11-01 05:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `stationary`
--

CREATE TABLE `stationary` (
  `ItemCode` int(6) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Manufacturer` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stationary`
--

INSERT INTO `stationary` (`ItemCode`, `Name`, `Category`, `Manufacturer`) VALUES
(1001, 'Blue Pen', 'Pen', 'Atlas'),
(1002, '15cm Ruler', 'Ruler', 'Atlas'),
(100560, 'Pencil Box', 'Container', 'Smiggle'),
(152000, 'Water Bottle', 'Bottle', 'Smiggle'),
(152010, 'Lunch Box', 'Container', 'Smiggle');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int(5) NOT NULL,
  `SupplierName` varchar(50) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `SupplierName`, `Email`, `Phone`) VALUES
(1005, 'Anderson', 'anderson05@gmail.com', '044717532611'),
(1006, 'Peterson', 'peterson8@yahoo.com', '046223782643'),
(1007, 'Dawkins', 'r_dawks46@yahoo.com', '044336845265'),
(1008, 'Harris', 'harris@gmail.com', '045625865302'),
(1009, 'Morgan', 'e_morgan@gmail.com', '044978570246'),
(1011, 'Charles', 'charlie@yahoo.com', '042904025780');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_payment`
--
ALTER TABLE `bank_payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD UNIQUE KEY `PaymentID` (`PaymentID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ItemCode`),
  ADD UNIQUE KEY `ItemCode` (`ItemCode`),
  ADD UNIQUE KEY `ISBN` (`ISBN`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ItemCode`),
  ADD UNIQUE KEY `ItemCode` (`ItemCode`);

--
-- Indexes for table `item_supplier`
--
ALTER TABLE `item_supplier`
  ADD PRIMARY KEY (`ItemCode`,`SupplierID`,`DateSupplied`),
  ADD KEY `IS_SID_fk` (`SupplierID`);

--
-- Indexes for table `online_payment`
--
ALTER TABLE `online_payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD UNIQUE KEY `PaymentID` (`PaymentID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD UNIQUE KEY `OrderID` (`OrderID`),
  ADD KEY `O_CID_fk` (`CustomerID`),
  ADD KEY `O_PID_fk` (`PaymentID`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`ItemCode`,`OrderID`),
  ADD KEY `OI_OID_fk` (`OrderID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD UNIQUE KEY `PaymentID` (`PaymentID`);

--
-- Indexes for table `stationary`
--
ALTER TABLE `stationary`
  ADD PRIMARY KEY (`ItemCode`),
  ADD UNIQUE KEY `ItemCode` (`ItemCode`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`),
  ADD UNIQUE KEY `SupplierID` (`SupplierID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_payment`
--
ALTER TABLE `bank_payment`
  ADD CONSTRAINT `BP_PID_fk` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`);

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `I_ICo_fk` FOREIGN KEY (`ItemCode`) REFERENCES `item` (`ItemCode`);

--
-- Constraints for table `item_supplier`
--
ALTER TABLE `item_supplier`
  ADD CONSTRAINT `IS_ICo_fk` FOREIGN KEY (`ItemCode`) REFERENCES `item` (`ItemCode`),
  ADD CONSTRAINT `IS_SID_fk` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`);

--
-- Constraints for table `online_payment`
--
ALTER TABLE `online_payment`
  ADD CONSTRAINT `OP_PID_fk` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `O_CID_fk` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `O_PID_fk` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `OI_ICo_fk` FOREIGN KEY (`ItemCode`) REFERENCES `item` (`ItemCode`),
  ADD CONSTRAINT `OI_OID_fk` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`);

--
-- Constraints for table `stationary`
--
ALTER TABLE `stationary`
  ADD CONSTRAINT `S_ICo_fk` FOREIGN KEY (`ItemCode`) REFERENCES `item` (`ItemCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
