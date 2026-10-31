-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2023 at 01:18 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seg_ebookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `BookID` varchar(4) NOT NULL,
  `Genre` char(30) DEFAULT NULL,
  `ISBN` varchar(30) DEFAULT NULL,
  `Title` char(50) DEFAULT NULL,
  `PublisherID` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`BookID`, `Genre`, `ISBN`, `Title`, `PublisherID`) VALUES
('B001', 'Fantasy', '9780590353427', 'The Sorcerer’s Stone', 'pub-507492'),
('B002', 'Fantasy', '9780747538493', 'The Chamber of Secrets', 'pub-508774'),
('B003', 'Fantasy', '9781338299175', 'The Goblet of Fire', 'pub-501345'),
('B004', 'Fantasy', '9781408865439', 'The Order of the Phoenix', 'pub-502434'),
('B005', 'Romance', '9780316038379', 'Twilight', 'pub-454415'),
('B006', 'Adventure', '9780141393407', 'Robinson Crusoe', 'pub-454415'),
('B007', 'Romance', '9781139410533', 'Nightmare Abbey', 'pub-548783');

-- --------------------------------------------------------

--
-- Table structure for table `book_cart`
--

CREATE TABLE `book_cart` (
  `CartID` varchar(10) NOT NULL,
  `Quantity` varchar(5) DEFAULT NULL,
  `TotalPrice` varchar(5) DEFAULT NULL,
  `MemberID` varchar(4) DEFAULT NULL,
  `BookID` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_cart`
--

INSERT INTO `book_cart` (`CartID`, `Quantity`, `TotalPrice`, `MemberID`, `BookID`) VALUES
('131497568', '3', 'RM105', 'M002', 'B004'),
('153697895', '7', 'RM245', 'M005', 'B002'),
('181080898', '2', 'RM70', 'M001', 'B005'),
('346851297', '175', 'RM70', 'M006', 'B003'),
('435279136', '1', 'RM35', 'M003', 'B001'),
('786653912', '4', 'RM240', 'M004', 'B007');

-- --------------------------------------------------------

--
-- Table structure for table `book_catalogue`
--

CREATE TABLE `book_catalogue` (
  `CatalogueID` varchar(6) NOT NULL,
  `IssueDate` varchar(15) DEFAULT NULL,
  `BookID` varchar(4) DEFAULT NULL,
  `PublisherID` varchar(15) DEFAULT NULL,
  `ManagerID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_catalogue`
--

INSERT INTO `book_catalogue` (`CatalogueID`, `IssueDate`, `BookID`, `PublisherID`, `ManagerID`) VALUES
('CAT001', '2013-7-12', 'B001', 'pub-507492', 'MA001'),
('CAT002', '2018-12-15', 'B002', 'pub-508774', 'MA002'),
('CAT003', '2015-5-23', 'B003', 'pub-501345', 'MA003'),
('CAT004', '2020-7-7', 'B004', 'pub-502434', 'MA001'),
('CAT005', '2019-4-9', 'B005', 'pub-769212', 'MA002'),
('CAT006', '2023-8-31', 'B006', 'pub-454415', 'MA003'),
('CAT007', '2021-2-27', 'B007', 'pub-548783', 'MA001');

-- --------------------------------------------------------

--
-- Table structure for table `book_delivery`
--

CREATE TABLE `book_delivery` (
  `TrackingNumber` varchar(15) NOT NULL,
  `DeliveryStatus` char(15) DEFAULT NULL,
  `PaymentID` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_delivery`
--

INSERT INTO `book_delivery` (`TrackingNumber`, `DeliveryStatus`, `PaymentID`) VALUES
('620764874912', 'In Transit', 'PAY001'),
('627263097413', 'Out for Deliver', 'PAY002'),
('645187269301', 'Delivered', 'PAY003'),
('659102837635', 'Pending', 'PAY004'),
('660172198735', 'Delivered', 'PAY005');

-- --------------------------------------------------------

--
-- Table structure for table `book_information`
--

CREATE TABLE `book_information` (
  `BookAvailability` char(15) DEFAULT NULL,
  `NumberOfStock` varchar(5) DEFAULT NULL,
  `ManagerID` varchar(5) DEFAULT NULL,
  `BookID` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_information`
--

INSERT INTO `book_information` (`BookAvailability`, `NumberOfStock`, `ManagerID`, `BookID`) VALUES
('In-stock', '55', 'MA001', 'B005'),
('In-stock', '64', 'MA002', 'B001'),
('In-stock', '22', 'MA003', 'B002'),
('In-stock', '38', 'MA001', 'B004'),
('In-stock', '87', 'MA002', 'B003'),
('In-stock', '41', 'MA003', 'B007'),
('In-stock', '51', 'MA001', 'B006');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `ReviewWithShortText` char(10) DEFAULT NULL,
  `StarRating` varchar(2) DEFAULT NULL,
  `MemberID` varchar(4) DEFAULT NULL,
  `BookID` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`ReviewWithShortText`, `StarRating`, `MemberID`, `BookID`) VALUES
('Good', '4', 'M001', 'B007'),
('Really Goo', '5', 'M002', 'B002'),
('Bad', '2', 'M003', 'B004'),
('Mid', '3', 'M004', 'B003'),
('Really Goo', '5', 'M001', 'B007');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `InvoiceID` varchar(10) NOT NULL,
  `Date` varchar(10) DEFAULT NULL,
  `TotalQuantityOfBookOrdered` varchar(10) DEFAULT NULL,
  `TotalAmountToBePaid` varchar(10) DEFAULT NULL,
  `BookID` varchar(4) DEFAULT NULL,
  `PublisherID` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`InvoiceID`, `Date`, `TotalQuantityOfBookOrdered`, `TotalAmountToBePaid`, `BookID`, `PublisherID`) VALUES
('inv-001', '2023-10-10', '20', '600', 'B001', 'pub-507492'),
('inv-002', '2023-9-5', '10', '250', 'B002', 'pub-508774'),
('inv-003', '2023-9-20', '30', '1050', 'B003', 'pub-501345'),
('inv-004', '2023-8-20', '15', '700', 'B004', 'pub-502434'),
('inv-005', '2023-10-1', '40', '300', 'B005', 'pub-769212'),
('inv-006', '2023-9-1', '35', '600', 'B006', 'pub-454415'),
('inv-007', '2023-9-28', '30', '550', 'B007', 'pub-548783'),
('inv-008', '2023-8-8', '15', '450', 'B001', 'pub-507492'),
('inv-009', '2023-9-30', '20', '350', 'B002', 'pub-508774'),
('inv-010', '2023-9-20', '25', '650', 'B001', 'pub-507492');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `ManagerID` varchar(5) NOT NULL,
  `name` char(30) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`ManagerID`, `name`, `PhoneNumber`) VALUES
('MA001', 'Steward', '0147659895'),
('MA002', 'Thomas', '0173739897'),
('MA003', 'Elizabeth', '0165542627');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `MemberID` varchar(4) NOT NULL,
  `DateRegister` varchar(15) DEFAULT NULL,
  `StudentID` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`MemberID`, `DateRegister`, `StudentID`) VALUES
('M001', '2023-7-21', 'ST001'),
('M002', '2023-2-18', 'ST002'),
('M003', '2023-10-7', 'ST003'),
('M004', '2023-5-11', 'ST004'),
('M005', '2023-8-8', 'ST005'),
('M006', '2023-8-9', 'ST006');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` varchar(6) NOT NULL,
  `PaymentType` char(10) DEFAULT NULL,
  `TotalPayment` varchar(5) DEFAULT NULL,
  `CartID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `PaymentType`, `TotalPayment`, `CartID`) VALUES
('PAY001', 'E-wallet', 'RM70', '181080898'),
('PAY002', 'Credit Car', 'RM105', '131497568'),
('PAY003', 'E-wallet', 'RM35', '435279136'),
('PAY004', 'Credit Car', 'RM240', '786653912'),
('PAY005', 'Credit Car', 'RM245', '153697895'),
('PAY006', 'E-wallet', 'RM175', '346851297');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `PublisherID` varchar(15) NOT NULL,
  `Name` char(20) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`PublisherID`, `Name`, `Address`, `PhoneNumber`) VALUES
('pub-454415', 'Frank Luther', '21, Petaling Jaya 47400, Selan', '013-5269878'),
('pub-501345', 'Robert Adams', '38, Petaling Jaya 47400, Selan', '016-7583934'),
('pub-502434', 'Michael Julius', '44, Shah Alam 40150, Selangor', '019-7468082'),
('pub-507492', 'J K Rowling', '42, Shah Alam 40150, Selangor', '012-8117673'),
('pub-508774', 'Albert Michael', '12, Subang Jaya 47500, Selango', '012-7607975'),
('pub-548783', 'Elizabeth Farah', '46, Shah Alam 40150, Selangor', '011-4345099'),
('pub-769212', 'Sarah Francis', '2, Subang Jaya 47500, Selangor', '017-5538781');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `StudentID` varchar(5) NOT NULL,
  `StudentName` char(30) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Gender` char(6) DEFAULT NULL,
  `PhoneNumber` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `StudentName`, `Address`, `Gender`, `PhoneNumber`) VALUES
('ST001', 'Jack', '22, Shah Alam, Selangor', 'Male', '012-9097854'),
('ST002', 'Daniel', '10, Subang Jaya', 'Male', '012-2126745'),
('ST003', 'Sarah', '6, Setia Alam, Selangor', 'Female', '012-3196578'),
('ST004', 'Alya', '32, Petaling Jaya, Selangor', 'Female', '016-6306582'),
('ST005', 'Amin', '55, Seri Kembangan, Selangor', 'Male', '019-78534761'),
('ST006', 'Razak', '9, Shah Alam, Selangor', 'Male', '012-5367670'),
('ST007', 'Sofia', '18, Shah Alam, Selangor', 'Female', '012-3226267');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BookID`),
  ADD KEY `PublisherID` (`PublisherID`);

--
-- Indexes for table `book_cart`
--
ALTER TABLE `book_cart`
  ADD PRIMARY KEY (`CartID`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `BookID` (`BookID`);

--
-- Indexes for table `book_catalogue`
--
ALTER TABLE `book_catalogue`
  ADD PRIMARY KEY (`CatalogueID`),
  ADD KEY `BookID` (`BookID`),
  ADD KEY `PublisherID` (`PublisherID`),
  ADD KEY `ManagerID` (`ManagerID`);

--
-- Indexes for table `book_delivery`
--
ALTER TABLE `book_delivery`
  ADD PRIMARY KEY (`TrackingNumber`),
  ADD KEY `PaymentID` (`PaymentID`);

--
-- Indexes for table `book_information`
--
ALTER TABLE `book_information`
  ADD KEY `ManagerID` (`ManagerID`),
  ADD KEY `BookID` (`BookID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `BookID` (`BookID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`InvoiceID`),
  ADD KEY `BookID` (`BookID`),
  ADD KEY `PublisherID` (`PublisherID`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`ManagerID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`MemberID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `CartID` (`CartID`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`PublisherID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`PublisherID`) REFERENCES `publisher` (`PublisherID`);

--
-- Constraints for table `book_cart`
--
ALTER TABLE `book_cart`
  ADD CONSTRAINT `book_cart_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`),
  ADD CONSTRAINT `book_cart_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`);

--
-- Constraints for table `book_catalogue`
--
ALTER TABLE `book_catalogue`
  ADD CONSTRAINT `book_catalogue_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`),
  ADD CONSTRAINT `book_catalogue_ibfk_2` FOREIGN KEY (`PublisherID`) REFERENCES `publisher` (`PublisherID`),
  ADD CONSTRAINT `book_catalogue_ibfk_3` FOREIGN KEY (`ManagerID`) REFERENCES `manager` (`ManagerID`);

--
-- Constraints for table `book_delivery`
--
ALTER TABLE `book_delivery`
  ADD CONSTRAINT `book_delivery_ibfk_1` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`);

--
-- Constraints for table `book_information`
--
ALTER TABLE `book_information`
  ADD CONSTRAINT `book_information_ibfk_1` FOREIGN KEY (`ManagerID`) REFERENCES `manager` (`ManagerID`),
  ADD CONSTRAINT `book_information_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`PublisherID`) REFERENCES `publisher` (`PublisherID`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`CartID`) REFERENCES `book_cart` (`CartID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
