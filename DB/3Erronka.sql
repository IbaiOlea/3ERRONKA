-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: 3_erronka
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
-- Table structure for table `erabiltzaileak`
--

DROP TABLE IF EXISTS `erabiltzaileak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `erabiltzaileak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `izena` varchar(100) NOT NULL,
  `abizena` varchar(100) NOT NULL,
  `posta_elektronikoa` varchar(255) NOT NULL,
  `pasahitza` text NOT NULL,
  `jaiotze_data` date DEFAULT NULL,
  `sexua` varchar(45) NOT NULL,
  `altuera` int DEFAULT NULL,
  `pisua` decimal(3,1) DEFAULT NULL,
  `IMC` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posta_elektronikoa` (`posta_elektronikoa`)
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
  `id` int NOT NULL AUTO_INCREMENT,
  `erosketa_id` int NOT NULL,
  `produktu_id` int NOT NULL,
  `kantitatea` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `erosketa_id` (`erosketa_id`),
  KEY `produktu_id` (`produktu_id`),
  CONSTRAINT `erosketa_produktuak_ibfk_1` FOREIGN KEY (`erosketa_id`) REFERENCES `erosketak` (`id`) ON DELETE CASCADE,
  CONSTRAINT `erosketa_produktuak_ibfk_2` FOREIGN KEY (`produktu_id`) REFERENCES `produktuak` (`id`) ON DELETE CASCADE
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
  `id` int NOT NULL AUTO_INCREMENT,
  `erabiltzaile_id` int NOT NULL,
  `erosketa_data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `guztira` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `erabiltzaile_id` (`erabiltzaile_id`),
  CONSTRAINT `erosketak_ibfk_1` FOREIGN KEY (`erabiltzaile_id`) REFERENCES `erabiltzaileak` (`id`) ON DELETE CASCADE
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
-- Table structure for table `langileak`
--

DROP TABLE IF EXISTS `langileak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `langileak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `izena` varchar(100) NOT NULL,
  `abizena` varchar(100) NOT NULL,
  `posta_elektronikoa` varchar(255) NOT NULL,
  `pasahitza` text NOT NULL,
  `jaiotze_data` date DEFAULT NULL,
  `soldata` decimal(10,2) NOT NULL,
  `lanpostua` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posta_elektronikoa` (`posta_elektronikoa`)
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
  `id` int NOT NULL AUTO_INCREMENT,
  `izena` varchar(150) NOT NULL,
  `prezioa` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`)
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

-- Dump completed on 2025-03-20 10:31:33
