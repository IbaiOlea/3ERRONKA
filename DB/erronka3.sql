-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: erronka3
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `beharrak`
--

DROP TABLE IF EXISTS `beharrak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beharrak` (
  `ID_beharrak` int NOT NULL AUTO_INCREMENT,
  `ID_erabiltzailea` int NOT NULL,
  `BeharrakProduktuak` varchar(100) NOT NULL,
  `BeharrakDeskripzioa` varchar(400) DEFAULT NULL,
  `BeharrakEskaeraOrdua` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_beharrak`),
  KEY `fk_erabiltzaile_beharrak_idx` (`ID_erabiltzailea`),
  CONSTRAINT `fk_erabiltzaile_beharrak` FOREIGN KEY (`ID_erabiltzailea`) REFERENCES `erabiltzaileak` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beharrak`
--

LOCK TABLES `beharrak` WRITE;
/*!40000 ALTER TABLE `beharrak` DISABLE KEYS */;
/*!40000 ALTER TABLE `beharrak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erabiltzaileak`
--

DROP TABLE IF EXISTS `erabiltzaileak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `erabiltzaileak` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Izena` varchar(100) NOT NULL,
  `Abizena` varchar(100) NOT NULL,
  `Posta_elektronikoa` varchar(255) NOT NULL,
  `Pasahitza` text NOT NULL,
  `Jaiotze_data` date DEFAULT NULL,
  `Sexua` varchar(45) NOT NULL,
  `Altuera` int DEFAULT NULL,
  `Pisua` decimal(3,1) DEFAULT NULL,
  `IMC` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `posta_elektronikoa` (`Posta_elektronikoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erabiltzaileak`
--

LOCK TABLES `erabiltzaileak` WRITE;
/*!40000 ALTER TABLE `erabiltzaileak` DISABLE KEYS */;
/*!40000 ALTER TABLE `erabiltzaileak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erosketa_produktuak`
--

DROP TABLE IF EXISTS `erosketa_produktuak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `erosketa_produktuak` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Erosketa_ID` int NOT NULL,
  `Produktu_ID` int NOT NULL,
  `Kantitatea` int NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  `Ordua` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `erosketa_id` (`Erosketa_ID`),
  KEY `produktu_id` (`Produktu_ID`),
  CONSTRAINT `erosketa_produktuak_ibfk_1` FOREIGN KEY (`Erosketa_ID`) REFERENCES `erosketak` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `erosketa_produktuak_ibfk_2` FOREIGN KEY (`Produktu_ID`) REFERENCES `produktuak` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erosketa_produktuak`
--

LOCK TABLES `erosketa_produktuak` WRITE;
/*!40000 ALTER TABLE `erosketa_produktuak` DISABLE KEYS */;
/*!40000 ALTER TABLE `erosketa_produktuak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erosketak`
--

DROP TABLE IF EXISTS `erosketak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `erosketak` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Erabiltzaile_ID` int NOT NULL,
  `Erosketa_data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Guztira` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `erabiltzaile_id` (`Erabiltzaile_ID`),
  CONSTRAINT `erosketak_ibfk_1` FOREIGN KEY (`Erabiltzaile_ID`) REFERENCES `erabiltzaileak` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erosketak`
--

LOCK TABLES `erosketak` WRITE;
/*!40000 ALTER TABLE `erosketak` DISABLE KEYS */;
/*!40000 ALTER TABLE `erosketak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eskaerak`
--

DROP TABLE IF EXISTS `eskaerak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eskaerak` (
  `ID_eskaera` int NOT NULL AUTO_INCREMENT,
  `ID_langilea` int NOT NULL,
  `ID_erabiltzailea` int NOT NULL,
  `ID_produktua` int NOT NULL,
  `KategoriaEskaera` varchar(100) DEFAULT NULL,
  `ProduktuEskaera` char(100) DEFAULT NULL,
  `EskaeraOrdua` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_eskaera`),
  KEY `fk_erabiltzaile_eskaera_idx` (`ID_erabiltzailea`),
  KEY `fk_langilea_eskaera_idx` (`ID_langilea`),
  KEY `fk_langilea_eskaera_idx1` (`ID_produktua`),
  CONSTRAINT `fk_erabiltzaile_eskaera` FOREIGN KEY (`ID_erabiltzailea`) REFERENCES `erabiltzaileak` (`ID`),
  CONSTRAINT `fk_langilea_eskaera` FOREIGN KEY (`ID_langilea`) REFERENCES `langileak` (`ID`),
  CONSTRAINT `fk_produktua_eskaera` FOREIGN KEY (`ID_produktua`) REFERENCES `produktuak` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eskaerak`
--

LOCK TABLES `eskaerak` WRITE;
/*!40000 ALTER TABLE `eskaerak` DISABLE KEYS */;
/*!40000 ALTER TABLE `eskaerak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langileak`
--

DROP TABLE IF EXISTS `langileak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `langileak` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Izena` varchar(100) NOT NULL,
  `Abizena` varchar(100) NOT NULL,
  `Posta_elektronikoa` varchar(255) NOT NULL,
  `Pasahitza` text NOT NULL,
  `Jaiotze_data` date DEFAULT NULL,
  `Soldata` decimal(10,2) NOT NULL,
  `Lanpostua` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `posta_elektronikoa` (`Posta_elektronikoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langileak`
--

LOCK TABLES `langileak` WRITE;
/*!40000 ALTER TABLE `langileak` DISABLE KEYS */;
/*!40000 ALTER TABLE `langileak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produktuak`
--

DROP TABLE IF EXISTS `produktuak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produktuak` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Izena` varchar(150) NOT NULL,
  `Kategoria` varchar(45) NOT NULL,
  `Prezioa` decimal(10,2) NOT NULL,
  `Stock` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktuak`
--

LOCK TABLES `produktuak` WRITE;
/*!40000 ALTER TABLE `produktuak` DISABLE KEYS */;
/*!40000 ALTER TABLE `produktuak` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-25  9:18:51
