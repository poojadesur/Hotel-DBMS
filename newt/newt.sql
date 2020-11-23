-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: HOTEL_QUOKKA
-- ------------------------------------------------------
-- Server version	8.0.21-0ubuntu0.20.04.4

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
-- Current Database: `HOTEL_QUOKKA`
--

/*!40000 DROP DATABASE IF EXISTS `HOTEL_QUOKKA`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `HOTEL_QUOKKA` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `HOTEL_QUOKKA`;

--
-- Table structure for table `CLEANS_ROOM`
--

DROP TABLE IF EXISTS `CLEANS_ROOM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLEANS_ROOM` (
  `Maid_SSN` int NOT NULL,
  `Room_Number` int NOT NULL,
  PRIMARY KEY (`Maid_SSN`,`Room_Number`),
  KEY `Room_Number` (`Room_Number`),
  CONSTRAINT `CLEANS_ROOM_ibfk_2` FOREIGN KEY (`Room_Number`) REFERENCES `ROOM` (`Room_Number`),
  CONSTRAINT `CLEANS_ROOM_ibfk_3` FOREIGN KEY (`Maid_SSN`) REFERENCES `MAID_SERVICE` (`Maid_SSN`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLEANS_ROOM`
--

LOCK TABLES `CLEANS_ROOM` WRITE;
/*!40000 ALTER TABLE `CLEANS_ROOM` DISABLE KEYS */;
INSERT INTO `CLEANS_ROOM` VALUES (987654321,501),(986255421,502),(112233445,503),(986255421,503);
/*!40000 ALTER TABLE `CLEANS_ROOM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FAMILY_INFO`
--

DROP TABLE IF EXISTS `FAMILY_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FAMILY_INFO` (
  `Booking_ID` int NOT NULL,
  `Age` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Booking_ID`,`Age`,`Name`),
  CONSTRAINT `FAMILY_INFO_ibfk_1` FOREIGN KEY (`Booking_ID`) REFERENCES `GUEST` (`Booking_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FAMILY_INFO`
--

LOCK TABLES `FAMILY_INFO` WRITE;
/*!40000 ALTER TABLE `FAMILY_INFO` DISABLE KEYS */;
INSERT INTO `FAMILY_INFO` VALUES (1,49,'mehul_mom'),(1,50,'mehul_dad'),(2,4,'pooja_kid'),(3,2,'chingi'),(3,20,'puppy'),(3,50,'jehangir'),(12,50,'Dada'),(36,5,'chinki');
/*!40000 ALTER TABLE `FAMILY_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLOOR_SUP`
--

DROP TABLE IF EXISTS `FLOOR_SUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FLOOR_SUP` (
  `SUP_SSN` int NOT NULL,
  `Floor_Number` int NOT NULL,
  PRIMARY KEY (`SUP_SSN`),
  CONSTRAINT `valid_sup_floor` CHECK (((`Floor_Number` >= 1) and (`Floor_Number` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLOOR_SUP`
--

LOCK TABLES `FLOOR_SUP` WRITE;
/*!40000 ALTER TABLE `FLOOR_SUP` DISABLE KEYS */;
INSERT INTO `FLOOR_SUP` VALUES (987654321,5);
/*!40000 ALTER TABLE `FLOOR_SUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GUEST`
--

DROP TABLE IF EXISTS `GUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GUEST` (
  `Booking_ID` int NOT NULL AUTO_INCREMENT,
  `Full_Name` varchar(50) NOT NULL,
  `Check_In_Date` date NOT NULL,
  `Check_Out_Date` date NOT NULL,
  `No_Members_To_Book_For` int NOT NULL,
  PRIMARY KEY (`Booking_ID`),
  CONSTRAINT `valid_checkin` CHECK ((`Check_In_Date` <= `Check_Out_Date`))
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GUEST`
--

LOCK TABLES `GUEST` WRITE;
/*!40000 ALTER TABLE `GUEST` DISABLE KEYS */;
INSERT INTO `GUEST` VALUES (1,'Mehul','2020-10-12','2020-12-01',3),(2,'Pooja','2020-05-15','2020-05-22',2),(3,'Manasvi','2020-03-15','2020-03-22',4),(4,'David','2020-01-11','2020-01-15',1),(12,'Kunwar','2020-02-10','2020-02-15',2),(36,'mayank goel','2020-10-06','2020-10-22',2);
/*!40000 ALTER TABLE `GUEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GUEST_EMAILID`
--

DROP TABLE IF EXISTS `GUEST_EMAILID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GUEST_EMAILID` (
  `Booking_ID` int NOT NULL,
  `Email_ID` varchar(70) NOT NULL,
  PRIMARY KEY (`Booking_ID`,`Email_ID`),
  CONSTRAINT `GUEST_EMAILID_ibfk_1` FOREIGN KEY (`Booking_ID`) REFERENCES `GUEST` (`Booking_ID`) ON DELETE CASCADE,
  CONSTRAINT `valid_email` CHECK (regexp_like(`Email_ID`,_utf8mb4'^[A-Za-z0-9._%-+!#$&/=?^|~]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GUEST_EMAILID`
--

LOCK TABLES `GUEST_EMAILID` WRITE;
/*!40000 ALTER TABLE `GUEST_EMAILID` DISABLE KEYS */;
INSERT INTO `GUEST_EMAILID` VALUES (1,'mathurmehul3@gmail.com'),(1,'susubajo@gmail.com'),(2,'fattie@gmail.com'),(2,'poopja@gmail.com'),(3,'armadillo@gmail.com'),(4,'GOAT@gmail.com');
/*!40000 ALTER TABLE `GUEST_EMAILID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GUEST_PHONENUM`
--

DROP TABLE IF EXISTS `GUEST_PHONENUM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GUEST_PHONENUM` (
  `Booking_ID` int NOT NULL,
  `Phone_Number` char(10) NOT NULL,
  PRIMARY KEY (`Booking_ID`,`Phone_Number`),
  CONSTRAINT `GUEST_PHONENUM_ibfk_1` FOREIGN KEY (`Booking_ID`) REFERENCES `GUEST` (`Booking_ID`) ON DELETE CASCADE,
  CONSTRAINT `valid_phonenum` CHECK (regexp_like(`Phone_Number`,_utf8mb4'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GUEST_PHONENUM`
--

LOCK TABLES `GUEST_PHONENUM` WRITE;
/*!40000 ALTER TABLE `GUEST_PHONENUM` DISABLE KEYS */;
INSERT INTO `GUEST_PHONENUM` VALUES (1,'8605936547'),(1,'9689882210'),(2,'5678765674'),(3,'1112223334'),(3,'1112543334'),(4,'9988776655');
/*!40000 ALTER TABLE `GUEST_PHONENUM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAID_SERVICE`
--

DROP TABLE IF EXISTS `MAID_SERVICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MAID_SERVICE` (
  `Maid_SSN` int NOT NULL,
  `Type_of_Cleaning` varchar(50) DEFAULT NULL,
  `Super_SSN` int DEFAULT NULL,
  PRIMARY KEY (`Maid_SSN`),
  KEY `Super_SSN` (`Super_SSN`),
  CONSTRAINT `MAID_SERVICE_ibfk_3` FOREIGN KEY (`Maid_SSN`) REFERENCES `STAFF` (`SSN`) ON DELETE CASCADE,
  CONSTRAINT `MAID_SERVICE_ibfk_4` FOREIGN KEY (`Super_SSN`) REFERENCES `MAID_SERVICE` (`Maid_SSN`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAID_SERVICE`
--

LOCK TABLES `MAID_SERVICE` WRITE;
/*!40000 ALTER TABLE `MAID_SERVICE` DISABLE KEYS */;
INSERT INTO `MAID_SERVICE` VALUES (112233445,'Dust master',987654321),(555666777,NULL,NULL),(888777666,NULL,987654321),(986255421,'Bed_cleaning',987654321),(987654321,'Bathroom expert',NULL),(999888777,NULL,987654321);
/*!40000 ALTER TABLE `MAID_SERVICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECREATIONAL_ACTIVITIES`
--

DROP TABLE IF EXISTS `RECREATIONAL_ACTIVITIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RECREATIONAL_ACTIVITIES` (
  `Latitude` decimal(5,2) NOT NULL,
  `Longitude` decimal(5,2) NOT NULL,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`Latitude`,`Longitude`,`Type`),
  CONSTRAINT `RECREATIONAL_ACTIVITIES_ibfk_1` FOREIGN KEY (`Latitude`, `Longitude`) REFERENCES `TOURIST_LOCATION` (`Latitude`, `Longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECREATIONAL_ACTIVITIES`
--

LOCK TABLES `RECREATIONAL_ACTIVITIES` WRITE;
/*!40000 ALTER TABLE `RECREATIONAL_ACTIVITIES` DISABLE KEYS */;
INSERT INTO `RECREATIONAL_ACTIVITIES` VALUES (123.34,111.33,'restraunt'),(123.34,111.33,'swingset'),(312.30,253.45,'rides');
/*!40000 ALTER TABLE `RECREATIONAL_ACTIVITIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROOM`
--

DROP TABLE IF EXISTS `ROOM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROOM` (
  `Room_Number` int NOT NULL,
  `Floor_Number` int NOT NULL,
  `Number_of_Beds` int NOT NULL,
  `Availability_of_Room` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Room_Number`),
  CONSTRAINT `valid_beds` CHECK (((`Number_of_Beds` >= 1) and (`Number_of_Beds` <= 3))),
  CONSTRAINT `valid_floor_no` CHECK (((`Floor_Number` >= 1) and (`Floor_Number` <= 5))),
  CONSTRAINT `valid_room_no` CHECK (((`Room_Number` < 600) and (`Room_Number` > (`Floor_Number` * 100)) and (`Room_Number` < ((`Floor_Number` + 1) * 100))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROOM`
--

LOCK TABLES `ROOM` WRITE;
/*!40000 ALTER TABLE `ROOM` DISABLE KEYS */;
INSERT INTO `ROOM` VALUES (101,1,2,0),(102,1,2,1),(103,1,1,1),(104,1,3,1),(105,1,3,1),(201,2,2,0),(202,2,2,0),(203,2,1,1),(204,2,3,1),(205,2,3,1),(301,3,2,1),(302,3,2,1),(303,3,1,1),(304,3,3,0),(305,3,3,0),(401,4,2,0),(402,4,2,0),(403,4,1,1),(404,4,3,0),(405,4,3,1),(501,5,2,0),(502,5,2,0),(503,5,1,1),(504,5,3,1),(505,5,3,1);
/*!40000 ALTER TABLE `ROOM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROOM_BOOKED`
--

DROP TABLE IF EXISTS `ROOM_BOOKED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROOM_BOOKED` (
  `Room_Number` int NOT NULL,
  `Guest_Booking_ID` int DEFAULT NULL,
  PRIMARY KEY (`Room_Number`),
  KEY `Guest_Booking_ID` (`Guest_Booking_ID`),
  CONSTRAINT `ROOM_BOOKED_ibfk_1` FOREIGN KEY (`Room_Number`) REFERENCES `ROOM` (`Room_Number`),
  CONSTRAINT `ROOM_BOOKED_ibfk_2` FOREIGN KEY (`Guest_Booking_ID`) REFERENCES `GUEST` (`Booking_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROOM_BOOKED`
--

LOCK TABLES `ROOM_BOOKED` WRITE;
/*!40000 ALTER TABLE `ROOM_BOOKED` DISABLE KEYS */;
INSERT INTO `ROOM_BOOKED` VALUES (202,1),(304,2),(305,2),(404,3),(501,4),(502,4),(201,12),(401,36),(402,36);
/*!40000 ALTER TABLE `ROOM_BOOKED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROOM_COST`
--

DROP TABLE IF EXISTS `ROOM_COST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROOM_COST` (
  `Floor_Number` int NOT NULL,
  `Number_of_Beds` int NOT NULL,
  `Cost` decimal(7,2) NOT NULL,
  PRIMARY KEY (`Floor_Number`,`Number_of_Beds`),
  CONSTRAINT `ROOM_COST_chk_1` CHECK (((`Floor_Number` >= 1) and (`Floor_Number` <= 5))),
  CONSTRAINT `ROOM_COST_chk_2` CHECK (((`Number_of_Beds` >= 1) and (`Number_of_Beds` <= 3)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROOM_COST`
--

LOCK TABLES `ROOM_COST` WRITE;
/*!40000 ALTER TABLE `ROOM_COST` DISABLE KEYS */;
INSERT INTO `ROOM_COST` VALUES (1,1,10000.00),(1,2,15000.00),(1,3,18000.00),(2,1,20000.00),(2,2,25000.00),(2,3,28000.00),(3,1,30000.00),(3,2,35000.00),(3,3,38000.00),(4,1,40000.00),(4,2,45000.00),(4,3,48000.00),(5,1,50000.00),(5,2,55000.00),(5,3,58000.00);
/*!40000 ALTER TABLE `ROOM_COST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STAFF`
--

DROP TABLE IF EXISTS `STAFF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STAFF` (
  `SSN` int NOT NULL,
  `Staff_ID` int NOT NULL AUTO_INCREMENT,
  `Full_Name` varchar(100) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Monthly_Wages` decimal(7,2) DEFAULT NULL,
  `Date_of_Joining` date DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  UNIQUE KEY `unique_id` (`Staff_ID`),
  UNIQUE KEY `Staff_ID` (`Staff_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STAFF`
--

LOCK TABLES `STAFF` WRITE;
/*!40000 ALTER TABLE `STAFF` DISABLE KEYS */;
INSERT INTO `STAFF` VALUES (112233445,7,'shaanti',30,15000.00,'2019-01-01'),(123456789,1,'Mehul Jr',19,100.00,'2019-10-26'),(555666777,13,'lazy maid',60,6000.00,'2020-10-05'),(811128521,6,'Ishika',22,45000.00,'2018-01-01'),(812522521,5,'Arjun',40,25000.00,'2018-06-10'),(812524521,4,'Laxman',50,35000.00,'2019-05-11'),(888777666,14,'test name',18,20000.00,'2020-10-05'),(986255421,3,'BBC_Boy',30,15000.00,'2019-09-20'),(987654321,2,'BBC_Girl',35,20000.00,'2019-11-20'),(999888777,11,'kaka halwai',50,15000.00,'2020-10-05');
/*!40000 ALTER TABLE `STAFF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STAFF_EMAILID`
--

DROP TABLE IF EXISTS `STAFF_EMAILID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STAFF_EMAILID` (
  `SSN` int NOT NULL,
  `Email_ID` varchar(70) NOT NULL,
  PRIMARY KEY (`SSN`,`Email_ID`),
  CONSTRAINT `STAFF_EMAILID_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `STAFF` (`SSN`) ON DELETE CASCADE,
  CONSTRAINT `valid_staff_email` CHECK (regexp_like(`Email_ID`,_utf8mb4'^[A-Za-z0-9._%-+!#$&/=?^|~]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STAFF_EMAILID`
--

LOCK TABLES `STAFF_EMAILID` WRITE;
/*!40000 ALTER TABLE `STAFF_EMAILID` DISABLE KEYS */;
INSERT INTO `STAFF_EMAILID` VALUES (123456789,'mama@mumu.com'),(123456789,'mehul123@mumu.com'),(811128521,'ishu@gmail.com'),(812522521,'reddy@gmail.com'),(812524521,'juju@onthe.com'),(812524521,'lux@dosa.com'),(812524521,'smasher@dosa.com'),(986255421,'masala@dosa.com'),(987654321,'bhaiya@cheese.com');
/*!40000 ALTER TABLE `STAFF_EMAILID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STAFF_PHONENUM`
--

DROP TABLE IF EXISTS `STAFF_PHONENUM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STAFF_PHONENUM` (
  `SSN` int NOT NULL,
  `Phone_Number` char(10) NOT NULL,
  PRIMARY KEY (`SSN`,`Phone_Number`),
  CONSTRAINT `STAFF_PHONENUM_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `STAFF` (`SSN`) ON DELETE CASCADE,
  CONSTRAINT `valid_staff_phonenum` CHECK (regexp_like(`Phone_Number`,_utf8mb4'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STAFF_PHONENUM`
--

LOCK TABLES `STAFF_PHONENUM` WRITE;
/*!40000 ALTER TABLE `STAFF_PHONENUM` DISABLE KEYS */;
INSERT INTO `STAFF_PHONENUM` VALUES (123456789,'9193239181'),(123456789,'9193929181'),(811128521,'9552503084'),(812522521,'9551103084'),(812524521,'9567103084'),(986255421,'1167103084'),(987654321,'9111239181');
/*!40000 ALTER TABLE `STAFF_PHONENUM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TOURIST_LOCATION`
--

DROP TABLE IF EXISTS `TOURIST_LOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TOURIST_LOCATION` (
  `Latitude` decimal(5,2) NOT NULL,
  `Longitude` decimal(5,2) NOT NULL,
  `Location_Name` varchar(50) DEFAULT NULL,
  `Weather` varchar(50) DEFAULT NULL,
  `Opening_Time` time NOT NULL,
  `Closing_Time` time NOT NULL,
  PRIMARY KEY (`Latitude`,`Longitude`),
  CONSTRAINT `Valid_Opening_Timings` CHECK ((`Opening_Time` <= `Closing_Time`)),
  CONSTRAINT `valid_weather` CHECK (((`Weather` = _utf8mb4'Cloudy') or (`Weather` = _utf8mb4'Rainy') or (`Weather` = _utf8mb4'Sunny') or (`Weather` = _utf8mb4'Windy')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TOURIST_LOCATION`
--

LOCK TABLES `TOURIST_LOCATION` WRITE;
/*!40000 ALTER TABLE `TOURIST_LOCATION` DISABLE KEYS */;
INSERT INTO `TOURIST_LOCATION` VALUES (123.34,111.33,'park','cloudy','09:00:00','13:00:00'),(312.30,253.45,'lake','sunny','03:50:30','15:15:30'),(500.34,311.33,'mountain','Rainy','05:00:00','18:00:00');
/*!40000 ALTER TABLE `TOURIST_LOCATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TOUR_GUIDE`
--

DROP TABLE IF EXISTS `TOUR_GUIDE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TOUR_GUIDE` (
  `Guide_SSN` int NOT NULL,
  `Years_of_Experience` int NOT NULL,
  `Booked_By_ID` int DEFAULT NULL,
  PRIMARY KEY (`Guide_SSN`),
  KEY `Booked_By_ID` (`Booked_By_ID`),
  CONSTRAINT `TOUR_GUIDE_ibfk_1` FOREIGN KEY (`Guide_SSN`) REFERENCES `STAFF` (`SSN`) ON DELETE CASCADE,
  CONSTRAINT `TOUR_GUIDE_ibfk_2` FOREIGN KEY (`Booked_By_ID`) REFERENCES `GUEST` (`Booking_ID`) ON DELETE SET NULL,
  CONSTRAINT `TOUR_GUIDE_ibfk_3` FOREIGN KEY (`Booked_By_ID`) REFERENCES `TRIP_BOOKING` (`Guest_Booking_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TOUR_GUIDE`
--

LOCK TABLES `TOUR_GUIDE` WRITE;
/*!40000 ALTER TABLE `TOUR_GUIDE` DISABLE KEYS */;
INSERT INTO `TOUR_GUIDE` VALUES (812522521,5,12),(812524521,10,NULL);
/*!40000 ALTER TABLE `TOUR_GUIDE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRANSPORT`
--

DROP TABLE IF EXISTS `TRANSPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRANSPORT` (
  `Number_Plate` char(10) NOT NULL,
  `Availability` tinyint(1) NOT NULL DEFAULT '1',
  `Start_Time` time NOT NULL,
  `Last_Ride_Time` time NOT NULL,
  `Booked_By_ID` int DEFAULT NULL,
  PRIMARY KEY (`Number_Plate`),
  KEY `Booked_By_ID` (`Booked_By_ID`),
  CONSTRAINT `TRANSPORT_ibfk_1` FOREIGN KEY (`Booked_By_ID`) REFERENCES `GUEST` (`Booking_ID`) ON DELETE SET NULL,
  CONSTRAINT `TRANSPORT_ibfk_2` FOREIGN KEY (`Booked_By_ID`) REFERENCES `TRIP_BOOKING` (`Guest_Booking_ID`) ON DELETE SET NULL,
  CONSTRAINT `valid_numberplate` CHECK (regexp_like(`Number_Plate`,_utf8mb4'^[A-Z][A-Z][0-9][0-9][A-Z][A-Z][0-9][0-9][0-9][0-9]')),
  CONSTRAINT `valid_timings` CHECK ((`Start_Time` <= `Last_Ride_Time`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSPORT`
--

LOCK TABLES `TRANSPORT` WRITE;
/*!40000 ALTER TABLE `TRANSPORT` DISABLE KEYS */;
INSERT INTO `TRANSPORT` VALUES ('MH14PN4567',0,'05:00:00','19:00:00',12),('MP11BH0121',1,'05:00:00','19:00:00',NULL),('OR12IB0021',1,'08:00:00','19:00:00',NULL),('RJ14JP0256',1,'08:00:00','19:00:00',NULL),('TS14HY0011',1,'08:00:00','19:00:00',NULL);
/*!40000 ALTER TABLE `TRANSPORT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRANSPORT_COST`
--

DROP TABLE IF EXISTS `TRANSPORT_COST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRANSPORT_COST` (
  `Start_Time` time NOT NULL,
  `Last_Ride_Time` time NOT NULL,
  `Cost` float NOT NULL,
  PRIMARY KEY (`Start_Time`,`Last_Ride_Time`),
  CONSTRAINT `validtimings` CHECK ((`Start_Time` <= `Last_Ride_Time`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSPORT_COST`
--

LOCK TABLES `TRANSPORT_COST` WRITE;
/*!40000 ALTER TABLE `TRANSPORT_COST` DISABLE KEYS */;
INSERT INTO `TRANSPORT_COST` VALUES ('05:00:00','19:00:00',5000),('06:30:30','20:30:30',6000.5),('07:30:30','20:30:30',6000),('08:00:00','19:00:00',3000),('20:00:00','23:00:00',7000);
/*!40000 ALTER TABLE `TRANSPORT_COST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRIP_BOOKING`
--

DROP TABLE IF EXISTS `TRIP_BOOKING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRIP_BOOKING` (
  `Guide_SSN` int NOT NULL,
  `Latitude` decimal(5,2) NOT NULL,
  `Longitude` decimal(5,2) NOT NULL,
  `Guest_Booking_ID` int NOT NULL,
  `Transport_Number_Plate` char(10) NOT NULL,
  PRIMARY KEY (`Guide_SSN`,`Latitude`,`Longitude`,`Guest_Booking_ID`,`Transport_Number_Plate`),
  KEY `Latitude` (`Latitude`,`Longitude`),
  KEY `Guest_Booking_ID` (`Guest_Booking_ID`),
  KEY `Transport_Number_Plate` (`Transport_Number_Plate`),
  CONSTRAINT `TRIP_BOOKING_ibfk_5` FOREIGN KEY (`Latitude`, `Longitude`) REFERENCES `TOURIST_LOCATION` (`Latitude`, `Longitude`) ON DELETE CASCADE,
  CONSTRAINT `TRIP_BOOKING_ibfk_6` FOREIGN KEY (`Guide_SSN`) REFERENCES `TOUR_GUIDE` (`Guide_SSN`) ON DELETE CASCADE,
  CONSTRAINT `TRIP_BOOKING_ibfk_7` FOREIGN KEY (`Guest_Booking_ID`) REFERENCES `GUEST` (`Booking_ID`) ON DELETE CASCADE,
  CONSTRAINT `TRIP_BOOKING_ibfk_8` FOREIGN KEY (`Transport_Number_Plate`) REFERENCES `TRANSPORT` (`Number_Plate`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRIP_BOOKING`
--

LOCK TABLES `TRIP_BOOKING` WRITE;
/*!40000 ALTER TABLE `TRIP_BOOKING` DISABLE KEYS */;
INSERT INTO `TRIP_BOOKING` VALUES (812522521,123.34,111.33,12,'MH14PN4567');
/*!40000 ALTER TABLE `TRIP_BOOKING` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-06 13:59:01
