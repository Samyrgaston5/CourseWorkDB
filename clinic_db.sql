-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2025 at 07:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `facility_operations`
--

CREATE TABLE `facility_operations` (
  `FacilityID` int(11) NOT NULL,
  `Facility_name` varchar(100) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Facility_type` varchar(150) NOT NULL,
  `Capacity` varchar(200) NOT NULL,
  `Contact_details` int(15) NOT NULL,
  `Date_added` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `Facility_head` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lab_test`
--

CREATE TABLE `lab_test` (
  `TestID` int(11) NOT NULL,
  `CaseID` int(11) NOT NULL,
  `Test_type` varchar(150) NOT NULL,
  `Test_result` varchar(200) NOT NULL,
  `Test_date` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `TechnicianID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_case`
--

CREATE TABLE `malaria_case` (
  `CaseID` int(11) NOT NULL,
  `PatientID` int(11) NOT NULL,
  `FacilityID` int(11) NOT NULL,
  `TreatmentID` int(11) NOT NULL,
  `Malaria_type` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_data`
--

CREATE TABLE `patient_data` (
  `PatientID` int(11) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Phone_number` varchar(10) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Date_added` datetime(5) NOT NULL DEFAULT current_timestamp(5),
  `Update_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `ReferralID` int(11) NOT NULL,
  `CaseID` int(11) NOT NULL,
  `Referral_from` varchar(200) NOT NULL,
  `Referral_to` varchar(200) NOT NULL,
  `Referral_date` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `Reason` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_management`
--

CREATE TABLE `resource_management` (
  `ResourceID` int(11) NOT NULL,
  `FacilityID` int(11) NOT NULL,
  `Resource_type` varchar(150) NOT NULL,
  `Quantity` varchar(150) NOT NULL,
  `Last_update_date` date NOT NULL,
  `Description` varchar(150) NOT NULL,
  `Date_added` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `TreatmentID` int(11) NOT NULL,
  `Treatment_name` varchar(150) NOT NULL,
  `Treatment_description` varchar(200) NOT NULL,
  `Dosage` varchar(200) NOT NULL,
  `Side_effects` varchar(150) NOT NULL,
  `Date_added` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `Update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `facility_operations`
--
ALTER TABLE `facility_operations`
  ADD PRIMARY KEY (`FacilityID`);

--
-- Indexes for table `lab_test`
--
ALTER TABLE `lab_test`
  ADD PRIMARY KEY (`TestID`),
  ADD UNIQUE KEY `TechnicianID` (`TechnicianID`),
  ADD UNIQUE KEY `CaseID` (`CaseID`);

--
-- Indexes for table `malaria_case`
--
ALTER TABLE `malaria_case`
  ADD PRIMARY KEY (`CaseID`),
  ADD UNIQUE KEY `PatientID` (`PatientID`),
  ADD UNIQUE KEY `FacilityID` (`FacilityID`),
  ADD UNIQUE KEY `TreatmentID` (`TreatmentID`);

--
-- Indexes for table `patient_data`
--
ALTER TABLE `patient_data`
  ADD PRIMARY KEY (`PatientID`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`ReferralID`),
  ADD UNIQUE KEY `CaseID` (`CaseID`);

--
-- Indexes for table `resource_management`
--
ALTER TABLE `resource_management`
  ADD PRIMARY KEY (`ResourceID`),
  ADD UNIQUE KEY `FacilityID` (`FacilityID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`TreatmentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `facility_operations`
--
ALTER TABLE `facility_operations`
  MODIFY `FacilityID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_test`
--
ALTER TABLE `lab_test`
  MODIFY `TestID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `malaria_case`
--
ALTER TABLE `malaria_case`
  MODIFY `CaseID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_data`
--
ALTER TABLE `patient_data`
  MODIFY `PatientID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `ReferralID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resource_management`
--
ALTER TABLE `resource_management`
  MODIFY `ResourceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `TreatmentID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
