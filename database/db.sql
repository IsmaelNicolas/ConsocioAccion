-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: consorcio
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ID_CLIENT` varchar(10) NOT NULL,
  `ID_EMPLOYEE` char(36) NOT NULL DEFAULT 'UUID()',
  `NAME_CLIENT` varchar(32) NOT NULL,
  `LASTNAME_CLIENT` varchar(32) NOT NULL,
  `PHONE_CLIENT` varchar(10) NOT NULL,
  `TYPE_CLIENT` char(16) NOT NULL,
  `EMAIL_CLIENT` varchar(32) DEFAULT NULL,
  `DATE_SUSCRIBE` date DEFAULT NULL,
  `CITY_SUBSCRIBE` varchar(16) DEFAULT NULL,
  `SPOUSE_NAME` varchar(32) DEFAULT NULL,
  `SPOUSE_OCUPATION` varchar(32) DEFAULT NULL,
  `SPOUSE_DIRECTION` varchar(64) DEFAULT NULL,
  `SPOUSE_SALARY` decimal(6,2) DEFAULT NULL,
  `SPOUSE_ENTITY` varchar(32) DEFAULT NULL,
  `DIRECTION_CLIENT` varchar(64) DEFAULT NULL,
  `OCUPATION_CLIENT` varchar(32) DEFAULT NULL,
  `SALARY_CLIENT` decimal(7,2) DEFAULT NULL,
  `MARITAL_STATUS_CLIENT` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENT`),
  UNIQUE KEY `EMAIL_CLIENT` (`EMAIL_CLIENT`),
  KEY `FK_CLIENT_SUBSCRIBE_EMPLOYEE` (`ID_EMPLOYEE`),
  CONSTRAINT `FK_CLIENT_SUBSCRIBE_EMPLOYEE` FOREIGN KEY (`ID_EMPLOYEE`) REFERENCES `employee` (`ID_EMPLOYEE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `ID_DOCUMENT` char(36) NOT NULL,
  `ID_CLIENT` varchar(10) NOT NULL,
  `NAME_DOCUMENT` varchar(16) NOT NULL,
  `TYPE_DOCUMENT` varchar(16) NOT NULL,
  PRIMARY KEY (`ID_DOCUMENT`),
  KEY `FK_DOCUMENT_PROVIDE_CLIENT` (`ID_CLIENT`),
  CONSTRAINT `FK_DOCUMENT_PROVIDE_CLIENT` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `ID_EMPLOYEE` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NAME_EMPLOYEE` varchar(32) NOT NULL,
  `LASTNAME_EMPLOYEE` varchar(32) NOT NULL,
  `EMAIL_EMPLOYEE` varchar(32) NOT NULL,
  `POSITION_EMPLOYEE` varchar(16) DEFAULT NULL,
  `PASSWORD_EMPLOYEE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PERMISSIONS` varchar(16) NOT NULL,
  PRIMARY KEY (`ID_EMPLOYEE`),
  UNIQUE KEY `EMAIL_EMPLOYEE` (`EMAIL_EMPLOYEE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('5d9f6512-5c0c-47c8-b8b4-12a36da37187','Ismael','Cedillo','insd@espe.edu.ec','dev','b8c84a4d3ee98620eb60ce4318e16111beabf9db7813d0d974db03259fde820d913c5bd5260fbb70ba27901e6c09e8730ead3436495010e210f831deae1386f3','admin'),('882a0d43-2620-493b-93a0-63065211cb68','Ismael','Cedillo','in@espe.edu.ec','dev','b8c84a4d3ee98620eb60ce4318e16111beabf9db7813d0d974db03259fde820d913c5bd5260fbb70ba27901e6c09e8730ead3436495010e210f831deae1386f3','admin');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature` (
  `ID_FEATURE` char(36) NOT NULL DEFAULT 'UUID()',
  `NAME_FEATURE` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID_FEATURE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `ID_CLIENT` varchar(10) NOT NULL,
  `ID_PROPERTY` char(36) NOT NULL,
  `ID_PAYMENT` char(36) NOT NULL,
  `DESCRIPTION_PAYMENT` varchar(32) DEFAULT NULL,
  `DATE_PAYMENT` date DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENT`,`ID_PROPERTY`,`ID_PAYMENT`),
  CONSTRAINT `FK_PAYMENT_LETTER_PROPERTY` FOREIGN KEY (`ID_CLIENT`, `ID_PROPERTY`) REFERENCES `property` (`ID_CLIENT`, `ID_PROPERTY`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `ID_CLIENT` varchar(10) NOT NULL,
  `ID_PROPERTY` char(36) NOT NULL,
  `TYPE_PROPERTY` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENT`,`ID_PROPERTY`),
  CONSTRAINT `FK_PROPERTY_PURCHASE_CLIENT` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertyfeature`
--

DROP TABLE IF EXISTS `propertyfeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyfeature` (
  `ID_CLIENT` varchar(10) NOT NULL,
  `ID_PROPERTY` char(36) NOT NULL,
  `ID_FEATURE` char(36) NOT NULL DEFAULT 'UUID()',
  PRIMARY KEY (`ID_CLIENT`,`ID_PROPERTY`,`ID_FEATURE`),
  KEY `FK_PROPERTY_PROPERTYF_FEATURE` (`ID_FEATURE`),
  CONSTRAINT `FK_PROPERTY_PROPERTYF_FEATURE` FOREIGN KEY (`ID_FEATURE`) REFERENCES `feature` (`ID_FEATURE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PROPERTY_PROPERTYF_PROPERTY` FOREIGN KEY (`ID_CLIENT`, `ID_PROPERTY`) REFERENCES `property` (`ID_CLIENT`, `ID_PROPERTY`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertyfeature`
--

LOCK TABLES `propertyfeature` WRITE;
/*!40000 ALTER TABLE `propertyfeature` DISABLE KEYS */;
/*!40000 ALTER TABLE `propertyfeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage`
--

DROP TABLE IF EXISTS `stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage` (
  `ID_STAGE` char(36) NOT NULL,
  `PRECONDITION_STAGE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_STAGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage`
--

LOCK TABLES `stage` WRITE;
/*!40000 ALTER TABLE `stage` DISABLE KEYS */;
/*!40000 ALTER TABLE `stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_client`
--

DROP TABLE IF EXISTS `stage_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_client` (
  `ID_CLIENT` varchar(10) NOT NULL,
  `ID_STAGE` char(36) NOT NULL,
  `STAGE_START_DATE` date DEFAULT NULL,
  `STAGE_END_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENT`,`ID_STAGE`),
  KEY `FK_STAGE_CL_STAGE_CLI_STAGE` (`ID_STAGE`),
  CONSTRAINT `FK_STAGE_CL_STAGE_CLI_CLIENT` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_STAGE_CL_STAGE_CLI_STAGE` FOREIGN KEY (`ID_STAGE`) REFERENCES `stage` (`ID_STAGE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_client`
--

LOCK TABLES `stage_client` WRITE;
/*!40000 ALTER TABLE `stage_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `stage_client` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-28 18:35:09
