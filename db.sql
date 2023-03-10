-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: inmobiliaria
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
  `NAME_CLIENT` varchar(32) NOT NULL,
  `LASTNAME_CLIENT` varchar(32) NOT NULL,
  `PHONE_CLIENT` varchar(16) NOT NULL,
  `TYPE_CLIENT` char(16) NOT NULL DEFAULT 'Interesado',
  `EMAIL_CLIENT` varchar(32) DEFAULT NULL,
  `SPOUSE_NAME` varchar(32) DEFAULT NULL,
  `SPOUSE_OCUPATION` varchar(32) DEFAULT NULL,
  `SPOUSE_DIRECTION` varchar(64) DEFAULT NULL,
  `SPOUSE_SALARY` decimal(6,2) DEFAULT NULL,
  `SPOUSE_ENTITY` varchar(32) DEFAULT NULL,
  `DIRECTION_CLIENT` varchar(64) DEFAULT NULL,
  `OCUPATION_CLIENT` varchar(32) DEFAULT NULL,
  `SALARY_CLIENT` decimal(7,2) DEFAULT NULL,
  `MARITAL_STATUS_CLIENT` varchar(8) DEFAULT NULL,
  `ENTITY_CLIENT` varchar(64) DEFAULT NULL,
  `DIRECTION_ENTITY` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('1703815264','Teresa','Paz','+593988515697','Interesado','teresa@email.com','Cedillo','Empleado publico','Sangolqui',5000.00,'ESPE','Quito','Empleado publico',5000.00,'Soltero','Agua potable quito','Mariana de Jesus'),('1709876543','Celeste Pamela','Nicolalde Enriquez','+593988515697','Interesado','celeste@email.com','Cedillo Paz','Empleado publico','Quito',5000.00,'Poderosisima Universidad Central','Quito','Empleado privado',4000.00,'Casado','PUCE','La central'),('1727516062','Ismael','Cedillo','+593988515697','Interesado','ismael.cedillo@outlook.es',NULL,NULL,NULL,NULL,NULL,'Quito',NULL,NULL,'Soltero',NULL,NULL);
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
  `CHECK_DOCUMENT` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_DOCUMENT`),
  KEY `FK_DOCUMENT_PROVIDE_CLIENT` (`ID_CLIENT`),
  CONSTRAINT `FK_DOCUMENT_PROVIDE_CLIENT` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRIGGER_1` AFTER INSERT ON `document` FOR EACH ROW begin

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `ID_EMPLOYEE` char(36) NOT NULL DEFAULT 'UUID()',
  `EMP_ID_EMPLOYEE` char(36) DEFAULT 'UUID()',
  `NAME_EMPLOYEE` varchar(32) NOT NULL,
  `LASTNAME_EMPLOYEE` varchar(32) NOT NULL,
  `EMAIL_EMPLOYEE` varchar(32) NOT NULL,
  `POSITION_EMPLOYEE` varchar(16) DEFAULT NULL,
  `PASSWORD_EMPLOYEE` varchar(128) NOT NULL,
  `PERMISSIONS` varchar(16) NOT NULL,
  PRIMARY KEY (`ID_EMPLOYEE`),
  KEY `FK_EMPLOYEE_EMPLOYEE__EMPLOYEE` (`EMP_ID_EMPLOYEE`),
  CONSTRAINT `FK_EMPLOYEE_EMPLOYEE__EMPLOYEE` FOREIGN KEY (`EMP_ID_EMPLOYEE`) REFERENCES `employee` (`ID_EMPLOYEE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('06ee23ec-ad5c-11ed-b174-0a002700000a','f2d82d9a-a8e7-11ed-89a1-9c2dcd0ce107','Theo','Rosero','tmr@email.com','emp','b8c84a4d3ee98620eb60ce4318e16111beabf9db7813d0d974db03259fde820d913c5bd5260fbb70ba27901e6c09e8730ead3436495010e210f831deae1386f3','emp'),('0afc4adb-ad5c-11ed-b174-0a002700000a','f2d82d9a-a8e7-11ed-89a1-9c2dcd0ce107','Andres','Coronel','acr@email.com','emp','b8c84a4d3ee98620eb60ce4318e16111beabf9db7813d0d974db03259fde820d913c5bd5260fbb70ba27901e6c09e8730ead3436495010e210f831deae1386f3','emp'),('0fe753b4-ad5d-11ed-b174-0a002700000a','f2d82d9a-a8e7-11ed-89a1-9c2dcd0ce107','Elian','Garces','ega@email.com','emp','b8c84a4d3ee98620eb60ce4318e16111beabf9db7813d0d974db03259fde820d913c5bd5260fbb70ba27901e6c09e8730ead3436495010e210f831deae1386f3','emp'),('613a0980-ad3d-11ed-b174-0a002700000a',NULL,'Admin','Admin','admin@email.com','dev','b8c84a4d3ee98620eb60ce4318e16111beabf9db7813d0d974db03259fde820d913c5bd5260fbb70ba27901e6c09e8730ead3436495010e210f831deae1386f3','admin'),('63c72a9a-ad5b-11ed-b174-0a002700000a','adf70ade-ad5a-11ed-b174-0a002700000a','Fernando','Solis','frs@email.com','emp','b8c84a4d3ee98620eb60ce4318e16111beabf9db7813d0d974db03259fde820d913c5bd5260fbb70ba27901e6c09e8730ead3436495010e210f831deae1386f3','emp'),('65b2b6c2-ad5b-11ed-b174-0a002700000a','adf70ade-ad5a-11ed-b174-0a002700000a','Fredy','Due├▒as','fd@email.com','emp','b8c84a4d3ee98620eb60ce4318e16111beabf9db7813d0d974db03259fde820d913c5bd5260fbb70ba27901e6c09e8730ead3436495010e210f831deae1386f3','emp'),('9cd2d356-b314-11ed-b911-9c2dcd0ce107','f2d82d9a-a8e7-11ed-89a1-9c2dcd0ce107','yuly','Roman','yuly@email.com','emp','b8c84a4d3ee98620eb60ce4318e16111beabf9db7813d0d974db03259fde820d913c5bd5260fbb70ba27901e6c09e8730ead3436495010e210f831deae1386f3','emp'),('adf70ade-ad5a-11ed-b174-0a002700000a',NULL,'Omar','Quimbita','orq@email.com','jefe','b8c84a4d3ee98620eb60ce4318e16111beabf9db7813d0d974db03259fde820d913c5bd5260fbb70ba27901e6c09e8730ead3436495010e210f831deae1386f3','emp'),('f2d82d9a-a8e7-11ed-89a1-9c2dcd0ce107',NULL,'Ismael','Cedillo','incp@email.com','jefe','b8c84a4d3ee98620eb60ce4318e16111beabf9db7813d0d974db03259fde820d913c5bd5260fbb70ba27901e6c09e8730ead3436495010e210f831deae1386f3','emp');
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
  `VALUE_PAYMENT` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENT`,`ID_PROPERTY`,`ID_PAYMENT`),
  CONSTRAINT `FK_PAYMENT_LETTER_PROPERTY` FOREIGN KEY (`ID_CLIENT`, `ID_PROPERTY`) REFERENCES `property` (`ID_CLIENT`, `ID_PROPERTY`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('1703815264','665749dd-a8e8-11ed-89a1-9c2dcd0ce107','665860f0-a8e8-11ed-89a1-9c2dcd0ce107','Reservacion','2023-02-09',5000.00),('1709876543','b50fd07a-a97a-11ed-89a1-9c2dcd0ce107','b510ff53-a97a-11ed-89a1-9c2dcd0ce107','Reservacion','2023-02-10',5000.00);
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
  `NEIGHBORHOOD` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENT`,`ID_PROPERTY`),
  CONSTRAINT `FK_PROPERTY_PURCHASE_CLIENT` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES ('1703815264','665749dd-a8e8-11ed-89a1-9c2dcd0ce107','Terreno','Carcelen'),('1709876543','b50fd07a-a97a-11ed-89a1-9c2dcd0ce107','Departamento','El inca');
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
  CONSTRAINT `FK_PROPERTY_PROPERTYF_FEATURE` FOREIGN KEY (`ID_FEATURE`) REFERENCES `feature` (`ID_FEATURE`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PROPERTY_PROPERTYF_PROPERTY` FOREIGN KEY (`ID_CLIENT`, `ID_PROPERTY`) REFERENCES `property` (`ID_CLIENT`, `ID_PROPERTY`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `ID_STAGE` int NOT NULL AUTO_INCREMENT,
  `NAME_STAGE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID_STAGE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage`
--

LOCK TABLES `stage` WRITE;
/*!40000 ALTER TABLE `stage` DISABLE KEYS */;
INSERT INTO `stage` VALUES (1,'Carta de Presentaci├│n y Econ├│mica'),(2,'An├ílisis y Verificaci├│n Econ├│mico'),(3,'Arquitectura y Dise├▒o Arquitect├│nico'),(4,'Presupuesto de Acabados y Dise├▒o de Interiores'),(5,'Solicitud financiero y Aprobaci├│n de Etapas'),(6,'Legislaci├│n y Registro Bien Inmueble');
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
  `ID_STAGE` int NOT NULL,
  `STAGE_START_DATE` date DEFAULT NULL,
  `STAGE_END_DATE` date DEFAULT NULL,
  `CONDITIONS` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENT`,`ID_STAGE`),
  KEY `FK_STAGE_CL_STAGE_CLI_STAGE` (`ID_STAGE`),
  CONSTRAINT `FK_STAGE_CL_STAGE_CLI_CLIENT` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_STAGE_CL_STAGE_CLI_STAGE` FOREIGN KEY (`ID_STAGE`) REFERENCES `stage` (`ID_STAGE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_client`
--

LOCK TABLES `stage_client` WRITE;
/*!40000 ALTER TABLE `stage_client` DISABLE KEYS */;
INSERT INTO `stage_client` VALUES ('1703815264',1,'2023-05-09','2023-08-09',0),('1703815264',2,'2023-08-09','2023-11-09',0),('1703815264',3,'2023-11-09','2024-02-09',0),('1703815264',4,'2024-02-09','2024-05-09',0),('1703815264',5,'2024-05-09','2024-08-09',0),('1703815264',6,'2024-08-09','2024-11-09',0),('1709876543',1,'2023-05-10','2023-08-10',0),('1709876543',2,'2023-08-10','2023-11-10',0),('1709876543',3,'2023-11-10','2024-02-10',0),('1709876543',4,'2024-02-10','2024-05-10',0),('1709876543',5,'2024-05-10','2024-08-10',0),('1709876543',6,'2024-08-10','2024-11-10',0);
/*!40000 ALTER TABLE `stage_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribe` (
  `ID_EMPLOYEE` char(36) NOT NULL DEFAULT 'UUID()',
  `ID_CLIENT` varchar(10) NOT NULL,
  `DATE_SUBSCRIBE` date DEFAULT NULL,
  `CITY_SUBSCRIBE` varchar(16) DEFAULT NULL,
  KEY `FK_SUBSCRIB_SUBSCRIBE_EMPLOYEE` (`ID_EMPLOYEE`),
  KEY `FK_SUBSCRIB_SUBSCRIBE_CLIENT` (`ID_CLIENT`),
  CONSTRAINT `FK_SUBSCRIB_SUBSCRIBE_CLIENT` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_SUBSCRIB_SUBSCRIBE_EMPLOYEE` FOREIGN KEY (`ID_EMPLOYEE`) REFERENCES `employee` (`ID_EMPLOYEE`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe`
--

LOCK TABLES `subscribe` WRITE;
/*!40000 ALTER TABLE `subscribe` DISABLE KEYS */;
INSERT INTO `subscribe` VALUES ('f2d82d9a-a8e7-11ed-89a1-9c2dcd0ce107','1727516062','2023-02-09','Quito'),('f2d82d9a-a8e7-11ed-89a1-9c2dcd0ce107','1703815264','2023-02-09','Quito'),('f2d82d9a-a8e7-11ed-89a1-9c2dcd0ce107','1709876543','2023-02-10','Quito');
/*!40000 ALTER TABLE `subscribe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-22 20:20:53
