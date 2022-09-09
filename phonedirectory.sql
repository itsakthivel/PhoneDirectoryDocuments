-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: phonedirectory
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Contact_details`
--

DROP TABLE IF EXISTS `Contact_details`;
CREATE TABLE `Contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_code` varchar(25) DEFAULT NULL,
  `student_rollno` varchar(25) DEFAULT NULL,
  `email_address` varchar(50) NOT NULL,
  `primary_phone` varchar(25) NOT NULL,
  `alternate_phone` varchar(25) DEFAULT NULL,
  `whatsapp_no` varchar(25) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `State` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_address` (`email_address`),
  UNIQUE KEY `emp_code` (`emp_code`),
  UNIQUE KEY `student_rollno` (`student_rollno`),
  CONSTRAINT `contact_details_ibfk_3` FOREIGN KEY (`emp_code`) REFERENCES `Employee_details` (`emp_code`),
  CONSTRAINT `contact_details_ibfk_4` FOREIGN KEY (`student_rollno`) REFERENCES `Student_details` (`student_rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Dumping data for table `Contact_details`
--

LOCK TABLES `Contact_details` WRITE;
/*!40000 ALTER TABLE `Contact_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department_details`
--

DROP TABLE IF EXISTS `Department_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department_details` (
  `depart_id` int(11) NOT NULL,
  `depart_name` varchar(25) NOT NULL,
  PRIMARY KEY (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department_details`
--

LOCK TABLES `Department_details` WRITE;
/*!40000 ALTER TABLE `Department_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Department_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_details`
--

DROP TABLE IF EXISTS `Employee_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_code` varchar(25) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `department_id` int(11) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `joining_date` date NOT NULL,
  `relieving` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emp_code` (`emp_code`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `employee_details_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `Department_details` (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_details`
--

LOCK TABLES `Employee_details` WRITE;
/*!40000 ALTER TABLE `Employee_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login_details`
--

DROP TABLE IF EXISTS `Login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login_details` (
  `user_id` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login_details`
--

LOCK TABLES `Login_details` WRITE;
/*!40000 ALTER TABLE `Login_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Login_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_details`
--

DROP TABLE IF EXISTS `Student_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_rollno` varchar(25) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `department_id` int(11) NOT NULL,
  `hostler` tinyint(4) NOT NULL,
  `batch` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_rollno` (`student_rollno`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `student_details_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `Department_details` (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_details`
--

LOCK TABLES `Student_details` WRITE;
/*!40000 ALTER TABLE `Student_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-07 11:02:00
