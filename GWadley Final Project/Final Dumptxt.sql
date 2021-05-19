CREATE DATABASE  IF NOT EXISTS `job_search` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `job_search`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: job_search
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `additional information`
--

DROP TABLE IF EXISTS `additional information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additional information` (
  `Applicants_Users_UsersID` int NOT NULL,
  `Job Postings_JobID` int NOT NULL,
  `reason_for_applying` varchar(6) DEFAULT NULL,
  `reference_letter` varchar(6) DEFAULT NULL,
  `date_applied` date NOT NULL,
  PRIMARY KEY (`Applicants_Users_UsersID`,`Job Postings_JobID`),
  KEY `fk_Applicants_has_Job Postings_Job Postings1_idx` (`Job Postings_JobID`),
  KEY `fk_Applicants_has_Job Postings_Applicants1_idx` (`Applicants_Users_UsersID`),
  CONSTRAINT `fk_Applicants_has_Job Postings_Applicants1` FOREIGN KEY (`Applicants_Users_UsersID`) REFERENCES `applicants` (`Users_UsersID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Applicants_has_Job Postings_Job Postings1` FOREIGN KEY (`Job Postings_JobID`) REFERENCES `job postings` (`JobID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional information`
--

LOCK TABLES `additional information` WRITE;
/*!40000 ALTER TABLE `additional information` DISABLE KEYS */;
INSERT INTO `additional information` VALUES (2,1,'yes','yes','2020-03-18'),(2,3,'no','yes','2021-01-05'),(2,4,'no','no','2021-03-12'),(4,3,'yes','no','2020-03-29'),(4,4,'yes','yes','2021-03-12'),(6,2,'yes','no','2020-01-14'),(7,6,'no','yes','2020-04-16'),(10,5,'no','no','2020-06-12');
/*!40000 ALTER TABLE `additional information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicant education`
--

DROP TABLE IF EXISTS `applicant education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant education` (
  `Forms_FormsID` int NOT NULL,
  `degree_earned` varchar(6) NOT NULL,
  `school` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Forms_FormsID`,`degree_earned`),
  KEY `fk_Applicant Education_Forms1_idx` (`Forms_FormsID`),
  CONSTRAINT `fk_Applicant Education_Forms1` FOREIGN KEY (`Forms_FormsID`) REFERENCES `forms` (`FormsID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant education`
--

LOCK TABLES `applicant education` WRITE;
/*!40000 ALTER TABLE `applicant education` DISABLE KEYS */;
INSERT INTO `applicant education` VALUES (1,'BS','Texas Tech'),(2,'BS','UT Dallas'),(3,'BA','LSU'),(3,'BS','Texas A&M'),(4,'BS','Baylor'),(4,'MS','UT Austin'),(5,'BS','OU-Norman'),(5,'MS','Texas State'),(5,'PhD','Texas State');
/*!40000 ALTER TABLE `applicant education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicant work history`
--

DROP TABLE IF EXISTS `applicant work history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant work history` (
  `Forms_FormsID` int NOT NULL,
  `job_title` varchar(45) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description_of_duties` text,
  `reason_for_leaving` text,
  PRIMARY KEY (`Forms_FormsID`,`job_title`),
  KEY `fk_Applicant Work History_Forms1_idx` (`Forms_FormsID`),
  CONSTRAINT `fk_Applicant Work History_Forms1` FOREIGN KEY (`Forms_FormsID`) REFERENCES `forms` (`FormsID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant work history`
--

LOCK TABLES `applicant work history` WRITE;
/*!40000 ALTER TABLE `applicant work history` DISABLE KEYS */;
INSERT INTO `applicant work history` VALUES (1,'Helpdesk','2018-10-20','2020-02-10','IT assistance','Low salary'),(2,'Logistics Associate','2015-07-29','2017-03-22','air and ocean freight logistics','Company downsizing'),(2,'Supply Chain Analyst','2017-04-01','2020-03-03',NULL,NULL),(3,'Cashier','2018-03-21','2019-08-17','accepted payments','new career'),(4,'Bank Teller','2019-02-12','2020-12-23','managed client accounts',''),(4,'HR Manager','2018-04-18','2021-02-27','Office personnel management','growth opportunities'),(5,'Hardware Engineer','2017-08-15','2021-03-21','Designed microprocessors','shrinking market cap'),(5,'Teacher\'s Assistant','2016-09-01','2017-05-25','Assisted professor in research','graduated');
/*!40000 ALTER TABLE `applicant work history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicants`
--

DROP TABLE IF EXISTS `applicants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicants` (
  `Users_UsersID` int NOT NULL,
  `applicant_address` varchar(45) DEFAULT NULL,
  `applicant_city` varchar(45) DEFAULT NULL,
  `applicant_state` varchar(45) DEFAULT NULL,
  `applicant_zip` int DEFAULT NULL,
  `applicant_contact_number` varchar(10) NOT NULL,
  `formID` int NOT NULL,
  PRIMARY KEY (`Users_UsersID`),
  KEY `fk_Applicants_Users_idx` (`Users_UsersID`),
  CONSTRAINT `fk_Applicants_Users` FOREIGN KEY (`Users_UsersID`) REFERENCES `users` (`UsersID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicants`
--

LOCK TABLES `applicants` WRITE;
/*!40000 ALTER TABLE `applicants` DISABLE KEYS */;
INSERT INTO `applicants` VALUES (2,'1298 Melody Meadows Ln','Tulsa','OK',74103,'8392931101',1),(4,'2958 Worchester Rd','Austin','TX',78681,'4920820921',2),(6,'6940 Meriam Webster Way','Paris','TX',75460,'4682213652',3),(7,'2826 Biliban Burrow Ct','Baton Rouge','LA',70805,'1439983696',4),(10,'6729 Sterling Street','Dallas','TX',75231,'5689324171',5);
/*!40000 ALTER TABLE `applicants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `departmentID` int NOT NULL,
  `department_locations` varchar(45) NOT NULL,
  `department_name` varchar(45) NOT NULL,
  `Managers_Users_UsersID` int NOT NULL,
  PRIMARY KEY (`departmentID`),
  KEY `fk_Departments_Managers1_idx` (`Managers_Users_UsersID`),
  CONSTRAINT `fk_Departments_Managers1` FOREIGN KEY (`Managers_Users_UsersID`) REFERENCES `managers` (`Users_UsersID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Suite 5','Sales',1),(2,'Suite 3','Logistics',3),(3,'Suite 2','Marketing',5),(4,'Suite 4','Technology',8),(5,'Suite 1','Accounting',9),(6,'Suite 2','Purchasing',11);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms` (
  `FormsID` int NOT NULL,
  `highest_degree_earned` varchar(6) DEFAULT NULL,
  `Applicants_Users_UsersID` int NOT NULL,
  PRIMARY KEY (`FormsID`),
  KEY `fk_Forms_Applicants1_idx` (`Applicants_Users_UsersID`),
  CONSTRAINT `fk_Forms_Applicants1` FOREIGN KEY (`Applicants_Users_UsersID`) REFERENCES `applicants` (`Users_UsersID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
INSERT INTO `forms` VALUES (1,'BS',10),(2,'BS',4),(3,'BA',7),(4,'MS',2),(5,'PhD',6);
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job postings`
--

DROP TABLE IF EXISTS `job postings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job postings` (
  `JobID` int NOT NULL AUTO_INCREMENT,
  `job_description` text NOT NULL,
  `required_experience` varchar(45) NOT NULL,
  `preferred_experience` varchar(45) NOT NULL,
  `employment_start_date` date NOT NULL,
  `salary` int NOT NULL,
  `beginner_review_date` date NOT NULL,
  `closing_date` date NOT NULL,
  `Departments_departmentID` int NOT NULL,
  PRIMARY KEY (`JobID`),
  KEY `fk_Job Postings_Departments1_idx` (`Departments_departmentID`),
  CONSTRAINT `fk_Job Postings_Departments1` FOREIGN KEY (`Departments_departmentID`) REFERENCES `departments` (`departmentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job postings`
--

LOCK TABLES `job postings` WRITE;
/*!40000 ALTER TABLE `job postings` DISABLE KEYS */;
INSERT INTO `job postings` VALUES (1,'Sales Analyst','2+ years','college degree','2020-03-14',50000,'2021-03-14','2020-05-14',1),(2,'Logistics Analyst','3-5 years','college degree','2020-01-11',65000,'2021-01-11','2020-03-11',2),(3,'Marketing Analyst','Entry Level','high school diploma','2020-01-15',39000,'2021-01-15','2021-06-15',3),(4,'IT Analyst','3 years or related','graduate degree','2021-03-23',81000,'0222-03-23','2021-05-23',4),(5,'Accounting Analyst','2+ years','college degree','2020-07-20',68000,'2021-07-20','2020-09-20',5),(6,'Purchasing Analyst','4+ years','graduate degree','2021-08-23',79000,'2022-08-23','2021-11-23',6),(7,'CIO','12 years + MBA','quantifiable case studies of experience','2022-01-01',189000,'2023-01-01','2022-03-01',4);
/*!40000 ALTER TABLE `job postings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `Users_UsersID` int NOT NULL,
  `manager_address` varchar(45) NOT NULL,
  `manager_office_phone` varchar(10) NOT NULL,
  PRIMARY KEY (`Users_UsersID`),
  CONSTRAINT `fk_Managers_Users1` FOREIGN KEY (`Users_UsersID`) REFERENCES `users` (`UsersID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES (1,'1111 Hawthorne Ln','8172092029'),(3,'1844 Decon Drive','8170230105'),(5,'5928 Comanche Trail','8172092230'),(8,'4302 Apache Path','8172096165'),(9,'2920 Lemon Lane','2141111029'),(11,'5839 Breeland Blvd','3263612039');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UsersID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `date_create` date DEFAULT NULL,
  `user_type` varchar(45) NOT NULL,
  `user_fname` varchar(45) NOT NULL,
  `user_lname` varchar(45) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  PRIMARY KEY (`UsersID`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ABerry','12345','2016-01-01','manager','Adam','Berry','aber@gmail.com'),(2,'CDavis','cowboys','2016-02-22','applicant','Carl','Davis','cdav@yahoo.com'),(3,'EFranco','redskins','2016-03-11','manager','Edgar','Franco','efra@gmail.com'),(4,'GHarris','eagles','2016-07-02','applicant','Garrett','Harris','ghar@yahoo.com'),(5,'IJones','giants','2017-02-15','manager','Idra','Jones','ijon@outlook.com'),(6,'KLowens','P@ssw0rd','2017-05-15','applicant','Kammy','Lowens','klow@gmail.com'),(7,'MNevarra','admin','2017-11-02','applicant','Maria','Nevarra','mnev@yahoo.com'),(8,'OPowers','49ers','2018-03-28','manager','Osten','Powers','opow@outlook.com'),(9,'QRivera','patriots','2018-03-29','manager','Quade','Riverra','qriv@gmail.com'),(10,'STeems','chiefs','2018-08-02','applicant','Sami','Teems','stee@yahoo.com'),(11,'UVikkers','packers','2019-02-05','manager','Ulrecht','Vikkers','uvik@outlook.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-05 22:41:12
