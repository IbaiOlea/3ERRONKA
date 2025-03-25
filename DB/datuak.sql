-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: erronka3
-- ------------------------------------------------------
-- Server version	8.0.41

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langileak`
--

LOCK TABLES `langileak` WRITE;
/*!40000 ALTER TABLE `langileak` DISABLE KEYS */;
INSERT INTO `langileak` VALUES (1,'Jon','Etxebarria','jon.etxebarria@email.com','pasahitz123','1985-06-15',2500.00,'Ingeniaria'),(2,'Ane','Zubizarreta','ane.zubizarreta@email.com','seguru5678','1990-09-22',2800.00,'Analista'),(3,'Mikel','Agirre','mikel.agirre@email.com','qwerty987','1982-03-11',3200.00,'Kudeatzailea'),(4,'Maite','Olabarria','maite.olabarria@email.com','maitepass','1995-12-05',2200.00,'Diseinatzailea'),(5,'Iker','Euskaldun','iker.euskaldun@email.com','iker2024','1988-07-19',2700.00,'Programatzailea'),(6,'Nerea','Goikoetxea','nerea.goikoetxea@email.com','nerea456','1992-04-30',2600.00,'Kontularia'),(7,'Gorka','Mendizabal','gorka.mendizabal@email.com','gorkakodea','1986-09-10',3100.00,'Proiektuburua'),(8,'Maitane','Urrutia','maitane.urrutia@email.com','maipass99','1993-11-28',2300.00,'Marketina'),(9,'Unai','Arrizabalaga','unai.arrizabalaga@email.com','unai789','1984-05-17',2900.00,'Administratzailea'),(10,'Leire','Bergara','leire.bergara@email.com','leire2022','1991-02-14',2400.00,'Hezitzailea'),(11,'Ander','Goienetxea','ander.goienetxea@email.com','anderpass','1989-08-24',2700.00,'Arkitektoa'),(12,'Oihane','Larrabetzu','oihane.larrabetzu@email.com','oihane123','1996-06-06',2250.00,'Erizaina'),(13,'Eneko','Aldamiz','eneko.aldamiz@email.com','eneko999','1987-10-12',2800.00,'Zuzendaria'),(14,'Irati','Legorburu','irati.legorburu@email.com','irati321','1994-03-09',2350.00,'Kazetaria'),(15,'Xabier','Lizeaga','xabier.lizeaga@email.com','xabier654','1998-12-21',2150.00,'Ikertzailea'),(16,'Miren','Zarate','miren.zarate@email.com','mirenxyz','1997-07-29',2200.00,'Psikologoa'),(17,'Asier','Aretxabaleta','asier.aretxa@email.com','asier555','1983-05-05',2950.00,'Ekonomista'),(18,'Uxue','Aginaga','uxue.aginaga@email.com','uxue000','1999-01-30',2100.00,'Musikaria'),(19,'Iñaki','Beldarrain','iñaki.beldarrain@email.com','iñakipass','1979-11-18',3300.00,'Abokatua'),(20,'Aiora','Otxandiano','aiora.otxandiano@email.com','aiora333','1993-04-07',2500.00,'Irakaslea');
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
  `Argazkia` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktuak`
--

LOCK TABLES `produktuak` WRITE;
/*!40000 ALTER TABLE `produktuak` DISABLE KEYS */;
INSERT INTO `produktuak` VALUES (1,'Pepino','Barazkia',1.79,112,NULL),(2,'Tomate','Barazkia',2.99,50,NULL),(3,'Lechuga','Barazkia',1.99,30,NULL),(4,'Zanahoria','Barazkia',1.49,80,NULL),(5,'Calabacin','Barazkia',1.99,60,NULL),(6,'Berenjena','Barazkia',2.49,40,NULL),(7,'Brocoli','Barazkia',2.99,30,NULL),(8,'Coliflor','Barazkia',2.99,30,NULL),(9,'Calabaza','Barazkia',1.99,50,NULL),(10,'Arroz Integrala','Karbohidratoak',1.20,50,NULL),(11,'Avena','Karbohidratoak',2.50,30,NULL),(12,'Garbantzuak','Karbohidratoak',1.50,40,NULL),(13,'Patata','Karbohidratoak',0.99,60,NULL),(14,'Pasta integrala','Karbohidratoak',1.00,70,NULL),(15,'Quinoa','Karbohidratoak',3.00,20,NULL),(16,'Protein Shake','Edariak',15.99,50,NULL),(17,'Protein Bar','Janariak',2.99,200,NULL),(18,'Whey Protein','Osagarriak',29.99,30,NULL),(19,'Oilaskoa','Haragia',4.99,100,NULL),(20,'Protein Pancakes','Janariak',5.99,50,NULL);
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

-- Dump completed on 2025-03-25 11:45:05
