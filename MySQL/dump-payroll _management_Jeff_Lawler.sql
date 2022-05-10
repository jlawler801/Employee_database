-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: payroll management
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `deptartments`
--

DROP TABLE IF EXISTS `deptartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deptartments` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Departments` varchar(30) DEFAULT NULL,
  `Manager_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_manager_id` (`Manager_ID`),
  CONSTRAINT `fk_manager_id` FOREIGN KEY (`Manager_ID`) REFERENCES `employee` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deptartments`
--

LOCK TABLES `deptartments` WRITE;
/*!40000 ALTER TABLE `deptartments` DISABLE KEYS */;
INSERT INTO `deptartments` VALUES (1,'IT Department',1),(2,'Sales Department',2),(3,'Fiscal Department',7),(4,'HR Department',5);
/*!40000 ALTER TABLE `deptartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `deptmanagers`
--

DROP TABLE IF EXISTS `deptmanagers`;
/*!50001 DROP VIEW IF EXISTS `deptmanagers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `deptmanagers` AS SELECT 
 1 AS `ID`,
 1 AS `Departments`,
 1 AS `Manager`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `emp_department_view`
--

DROP TABLE IF EXISTS `emp_department_view`;
/*!50001 DROP VIEW IF EXISTS `emp_department_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `emp_department_view` AS SELECT 
 1 AS `ID`,
 1 AS `Name`,
 1 AS `Departments`,
 1 AS `role`,
 1 AS `Salary`,
 1 AS `Start_Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `emp_dept`
--

DROP TABLE IF EXISTS `emp_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_dept` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Emp_ID` int DEFAULT NULL,
  `Dept_ID` int DEFAULT NULL,
  `Role_ID` int DEFAULT NULL,
  `Salary` mediumint DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Emp_ID` (`Emp_ID`),
  KEY `Dept_ID` (`Dept_ID`),
  KEY `Role_ID` (`Role_ID`),
  CONSTRAINT `emp_dept_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`ID`),
  CONSTRAINT `emp_dept_ibfk_2` FOREIGN KEY (`Dept_ID`) REFERENCES `deptartments` (`ID`),
  CONSTRAINT `emp_dept_ibfk_3` FOREIGN KEY (`Role_ID`) REFERENCES `roles` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_dept`
--

LOCK TABLES `emp_dept` WRITE;
/*!40000 ALTER TABLE `emp_dept` DISABLE KEYS */;
INSERT INTO `emp_dept` VALUES (1,1,1,1,145000,NULL),(2,2,2,2,150000,'2019-03-04'),(3,7,3,8,120000,'2020-07-22'),(4,5,4,6,120000,'2018-05-14'),(5,4,3,9,90000,'2017-02-20'),(6,6,1,4,95000,'2020-04-28'),(7,7,1,3,100000,'2021-12-13'),(8,8,4,5,110000,'2010-05-06'),(9,9,2,7,80000,'2021-01-30');
/*!40000 ALTER TABLE `emp_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Jeffrey Lawler','914-564-4786','964 Constant AVE','United States'),(2,'Johnny Depp','213-777-1898','Hollywood Blvd','United States'),(3,'Drew Musto','216-546-1627','167 Forest lane','United States'),(4,'Jack Ma','+86-712-7867-1294','Xihu Road','China'),(5,'Justin Trudeau','+1 416-263-3330','2-234 Pine ST','Canada'),(6,'Scott Cramer','740-516-7181','445 Seed ST','United States'),(7,'Cassandra McCalman','914-393-3518','129 Depew ST','United States'),(8,'Stephanie Womack','914-209-4913','541 Grindelwald Lane','United States'),(9,'Kerron Casiano','914-647-1938','777 Copperview Apartment 5','United States');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `role` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Okta Administrator'),(2,'Sales Lead'),(3,'Network Engineer'),(4,'Systems Engineer'),(5,'Benefits Coordinator'),(6,'HR Director'),(7,'Customer Success Rep'),(8,'CFO'),(9,'Payroll');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'payroll management'
--

--
-- Final view structure for view `deptmanagers`
--

/*!50001 DROP VIEW IF EXISTS `deptmanagers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `deptmanagers` AS select `d`.`ID` AS `ID`,`d`.`Departments` AS `Departments`,`e`.`Name` AS `Manager` from (`deptartments` `d` join `employee` `e` on((`d`.`Manager_ID` = `e`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `emp_department_view`
--

/*!50001 DROP VIEW IF EXISTS `emp_department_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `emp_department_view` AS select `d`.`ID` AS `ID`,`e`.`Name` AS `Name`,`de`.`Departments` AS `Departments`,`r`.`role` AS `role`,`d`.`Salary` AS `Salary`,coalesce(`d`.`Start_Date`,'TBA') AS `Start_Date` from (((`emp_dept` `d` join `employee` `e` on((`d`.`Emp_ID` = `e`.`ID`))) join `deptartments` `de` on((`d`.`Dept_ID` = `de`.`ID`))) join `roles` `r` on((`d`.`Role_ID` = `r`.`ID`))) order by `d`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-10  0:28:12
