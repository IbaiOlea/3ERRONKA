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
-- Table structure for table `erabiltzaileak`
--

DROP TABLE IF EXISTS `erabiltzaileak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `erabiltzaileak` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Izena` varchar(100) DEFAULT NULL,
  `Abizena` varchar(100) DEFAULT NULL,
  `Posta_elektronikoa` varchar(255) NOT NULL,
  `Pasahitza` text NOT NULL,
  `Jaiotze_data` date DEFAULT NULL,
  `Sexua` varchar(45) DEFAULT NULL,
  `Altuera` int DEFAULT NULL,
  `Pisua` decimal(3,1) DEFAULT NULL,
  `IMC` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `posta_elektronikoa` (`Posta_elektronikoa`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erabiltzaileak`
--

LOCK TABLES `erabiltzaileak` WRITE;
/*!40000 ALTER TABLE `erabiltzaileak` DISABLE KEYS */;
INSERT INTO `erabiltzaileak` VALUES (1,'Almudena','Cortés','almudena.cortes@saludnatural.com','verde123','1985-04-12','F',165,68.0,24.977043158861342),(2,'Bernardo','Soler','bernardo.soler@saludnatural.com','natura456','1979-11-03','M',178,75.0,23.7),(3,'Carla','Rivas','carla.rivas@saludnatural.com','bio789','1992-07-19','F',160,52.0,20.3),(4,'Diego','Molina','diego.molina@saludnatural.com','salud321','1988-03-25','M',172,68.0,23),(5,'Elena','Fuentes','elena.fuentes@saludnatural.com','verde654','1990-08-30','F',158,54.0,21.6),(6,'Federico','Navarro','federico.navarro@saludnatural.com','natura987','1983-12-05','M',180,80.0,24.7),(7,'Gloria','Paredes','gloria.paredes@saludnatural.com','bio159','1993-05-15','F',162,55.0,21),(8,'Héctor','Vega','hector.vega@saludnatural.com','salud753','1987-09-22','M',175,70.0,22.9),(9,'Isabel','Luna','isabel.luna@saludnatural.com','verde852','1991-01-18','F',160,53.0,20.8),(10,'Javier','Romero','javier.romero@saludnatural.com','natura4567','1986-06-07','M',182,78.0,23.5),(11,'Karla','Cano','karla.cano@saludnatural.com','bio135','1994-10-12','F',159,52.5,20.7),(12,'Luis','Del Valle','luis.delvalle@saludnatural.com','salud246','1980-02-28','M',177,72.0,22.9),(13,'Marina','Cruz','marina.cruz@saludnatural.com','verde369','1993-11-17','F',163,56.0,21.1),(14,'Nicolás','Ibarra','nicolas.ibarra@saludnatural.com','natura147','1989-04-03','M',174,68.0,22.5),(15,'Olga','Reyes','olga.reyes@saludnatural.com','bio258','1991-08-09','F',160,54.0,21.1),(16,'Pablo','Sanz','pablo.sanz@saludnatural.com','salud3698','1982-12-20','M',180,76.0,23.5),(17,'Quintina','Morales','quintina.morales@saludnatural.com','verde9876','1990-03-30','F',162,55.5,21.1),(18,'Ramón','Giménez','ramon.gimenez@saludnatural.com','natura3210','1984-07-04','M',176,73.0,23.6),(19,'Sara','Ortega','sara.ortega@saludnatural.com','bio741','1992-09-15','F',161,53.5,20.5),(20,'Tomás','Herrera','tomas.herrera@saludnatural.com','salud8520','1987-05-21','M',178,74.0,23.3),(21,'Ursula','Méndez','ursula.mendez@saludnatural.com','verde963','1993-12-11','F',159,52.0,20.5),(22,'Víctor','López','victor.lopez@saludnatural.com','natura1597','1981-06-26','M',175,70.0,22.9),(23,'Wanda','Soler','wanda.soler@saludnatural.com','bio7531','1994-02-14','F',160,53.0,20.8),(24,'Xavier','Ruiz','xavier.ruiz@saludnatural.com','salud357','1985-08-18','M',180,78.0,24.1),(25,'Yolanda','Gil','yolanda.gil@saludnatural.com','verde951','1990-11-27','F',163,57.0,21.4),(26,'Zacarías','Ferrer','zacarias.ferrer@saludnatural.com','natura8521','1983-03-09','M',177,71.0,22.7),(27,'Amalia','Bravo','amalia.bravo@saludnatural.com','bio4561','1989-10-05','F',162,56.5,21.5),(28,'Benjamín','Vidal','benjamin.vidal@saludnatural.com','salud6541','1986-12-31','M',175,69.5,22.6),(29,'Estebe','Ormazabal','estebe.ormazabal@saludnatural.com','aaaaaaaaa',NULL,NULL,NULL,NULL,0);
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
  `ErabiltzaileID` int NOT NULL,
  `ProduktuID` int NOT NULL,
  `Kantitatea` int NOT NULL,
  `Prezioa` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `produktu_id` (`ProduktuID`),
  KEY `erosketa_produktuak_ibfk_1_idx` (`ErabiltzaileID`),
  CONSTRAINT `erosketa_produktuak_ibfk_1` FOREIGN KEY (`ErabiltzaileID`) REFERENCES `erabiltzaileak` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `erosketa_produktuak_ibfk_2` FOREIGN KEY (`ProduktuID`) REFERENCES `produktuak` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erosketa_produktuak`
--

LOCK TABLES `erosketa_produktuak` WRITE;
/*!40000 ALTER TABLE `erosketa_produktuak` DISABLE KEYS */;
/*!40000 ALTER TABLE `erosketa_produktuak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fakturak`
--

DROP TABLE IF EXISTS `fakturak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fakturak` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ErabiltzaileID` int NOT NULL,
  `ErosketaProduktuID` int NOT NULL,
  `Erosketa_data` date DEFAULT NULL,
  `Guztira` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `erabiltzaile_id` (`ErabiltzaileID`),
  KEY `fakturak_ibfk_2_idx` (`ErosketaProduktuID`),
  CONSTRAINT `fakturak_ibfk_1` FOREIGN KEY (`ErabiltzaileID`) REFERENCES `erabiltzaileak` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fakturak_ibfk_2` FOREIGN KEY (`ErosketaProduktuID`) REFERENCES `erosketa_produktuak` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fakturak`
--

LOCK TABLES `fakturak` WRITE;
/*!40000 ALTER TABLE `fakturak` DISABLE KEYS */;
/*!40000 ALTER TABLE `fakturak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gomendazioak`
--

DROP TABLE IF EXISTS `gomendazioak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gomendazioak` (
  `ID_gomendazioak` int NOT NULL AUTO_INCREMENT,
  `LangileID` int NOT NULL,
  `ErabiltzaileID` int NOT NULL,
  `ProduktuID` int NOT NULL,
  `KategoriaGomendioa` varchar(100) DEFAULT NULL,
  `ProduktuGomendioa` char(100) DEFAULT NULL,
  `EskaeraData` date DEFAULT NULL,
  PRIMARY KEY (`ID_gomendazioak`),
  KEY `fk_erabiltzaile_eskaera_idx` (`ErabiltzaileID`),
  KEY `fk_langilea_eskaera_idx` (`LangileID`),
  KEY `fk_langilea_eskaera_idx1` (`ProduktuID`),
  CONSTRAINT `fk_erabiltzaile_eskaera` FOREIGN KEY (`ErabiltzaileID`) REFERENCES `erabiltzaileak` (`ID`),
  CONSTRAINT `fk_langilea_eskaera` FOREIGN KEY (`LangileID`) REFERENCES `langileak` (`ID`),
  CONSTRAINT `fk_produktua_eskaera` FOREIGN KEY (`ProduktuID`) REFERENCES `produktuak` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gomendazioak`
--

LOCK TABLES `gomendazioak` WRITE;
/*!40000 ALTER TABLE `gomendazioak` DISABLE KEYS */;
/*!40000 ALTER TABLE `gomendazioak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hornitzaileak`
--

DROP TABLE IF EXISTS `hornitzaileak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hornitzaileak` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Izena-enpresa` varchar(45) DEFAULT NULL,
  `Izena-gerente` varchar(45) DEFAULT NULL,
  `Telefono-enpresa` int DEFAULT NULL,
  `Telefono-gerente` int DEFAULT NULL,
  `Lokalizazioa` varchar(45) DEFAULT NULL,
  `ProduktuKategoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hornitzaileak`
--

LOCK TABLES `hornitzaileak` WRITE;
/*!40000 ALTER TABLE `hornitzaileak` DISABLE KEYS */;
INSERT INTO `hornitzaileak` VALUES (1,'BizitzaOsasungarria','Juan Martínez',911223344,600201,'Madril','Ekologikoa'),(2,'EkologiaElikagaiak','María Rodríguez',912334455,600202,'Bartzelona','Frutak eta Barazkiak'),(3,'NaturaBizia','Carlos López',913445566,600203,'Valentzia','Zerealak eta Lekaleak'),(4,'BioElikadura','Ana García',914556677,600204,'Sevilla','Esneki Ekologikoak'),(5,'ArimaBerdea','Luis Fernández',915667788,600205,'Bilbo','Edari Naturalak'),(6,'ZaporeGarbia','Carmen Sánchez',916778899,600206,'Zaragoza','Ezti eta Eratorriak'),(7,'FreskotasunOsoa','Jorge Gómez',917889900,600207,'Malaga','Produktu Freskoak'),(8,'AleOsoa','Lucía Díaz',918990011,600208,'Oviedo','Zereal Integralak'),(9,'BaratzeOsasuntsua','Miguel Ruiz',919001122,600209,'Vigo','Frutak eta Barazkiak'),(10,'OrgaBizia','Elena Morales',920112233,600210,'Alacant','Produktu Ekologikoak'),(11,'LurNaturala','Sergio Jiménez',921223344,600211,'Madril','Haragi eta Arrain Ekologikoak'),(12,'ZaporeNaturala','Isabel Ortega',922334455,600212,'Bartzelona','Olioak eta Ozpinak'),(13,'EkologiZaporea','Roberto Pérez',923445566,600213,'Valentzia','Lekaleak eta Zerealak'),(14,'JatorriGarbia','Patricia Martín',924556677,600214,'Sevilla','Ezti eta Eratorriak'),(15,'BerdeBizia','Francisco Herrera',925667788,600215,'Bilbo','Frutak eta Barazkiak'),(16,'NaturaMahaiGainean','Marta Castro',926778899,600216,'Zaragoza','Edari Naturalak'),(17,'ErroOsasuntsua','Diego Romero',927889900,600217,'Malaga','Zereal Integralak'),(18,'JatorriPuroa','Verónica Rojas',928990011,600218,'Oviedo','Lekaleak'),(19,'EkologiJatorria','Álvaro González',929001122,600219,'Vigo','Produktu Ekologikoak'),(20,'BizitzaIntegrala','Sofía Díaz',930112233,600220,'Alacant','Superelikagaiak'),(21,'OsasunEtaZaporea','Andrés Molina',931223344,600221,'Madril','Edari Naturalak'),(22,'NaturaPlus','Claudia Ruiz',932334455,600222,'Bartzelona','Frutak eta Barazkiak'),(23,'EkologiBizitza','Fernando García',933445566,600223,'Valentzia','Zerealak eta Lekaleak'),(24,'ZaporePuroa','Raquel López',934556677,600224,'Sevilla','Olioak eta Ozpinak'),(25,'BerdeIntegrala','Ignacio Sánchez',935667788,600225,'Bilbo','Superelikagaiak'),(26,'ZaporeBizia','Beatriz Jiménez',936778899,600226,'Zaragoza','Lekaleak eta Zerealak'),(27,'JatorriNaturala','Manuel Torres',937889900,600227,'Malaga','Produktu Ekologikoak'),(28,'EkologiLurra','Susana Vargas',938990011,600228,'Oviedo','Frutak eta Barazkiak'),(29,'NaturaBizitza','Roberto Martínez',939001122,600229,'Vigo','Zereal Integralak'),(30,'OsasunNaturala','Laura Fernández',940112233,600230,'Alacant','Superelikagaiak');
/*!40000 ALTER TABLE `hornitzaileak` ENABLE KEYS */;
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
  `Usuarioa` varchar(100) NOT NULL,
  `Posta_elektronikoa` varchar(255) NOT NULL,
  `Pasahitza` text NOT NULL,
  `Jaiotze_data` date DEFAULT NULL,
  `Soldata` decimal(10,2) NOT NULL,
  `LangileMota` varchar(45) NOT NULL,
  `Lanpostua` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `posta_elektronikoa` (`Posta_elektronikoa`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langileak`
--

LOCK TABLES `langileak` WRITE;
/*!40000 ALTER TABLE `langileak` DISABLE KEYS */;
INSERT INTO `langileak` VALUES (1,'Ibai','Olea','iolea','ibai.olea@osasungarria.com','MSN001','1978-05-15',3300.00,'Administratzailea','Administratzailea'),(2,'Silvia','Vargas','svargas','silvia.vargas@osasungarria.com','MSN002','1985-09-20',2500.00,'Langilea','Dietetikaria'),(3,'Marcos','Pérez','mperez','marcos.perez@osasungarria.com','MSN003','1980-12-10',2200.00,'Langilea','Entrenatzaile Pertsonala'),(4,'Ana','López','alopez','ana.lopez@osasungarria.com','MSN004','1992-03-18',2100.00,'Langilea','Fisioterapeuta'),(5,'Luis','García','lgarcia','luis.garcia@osasungarria.com','MSN005','1975-07-25',2800.00,'Langilea','Mediku Orokorra'),(6,'Clara','Sánchez','csanchez','clara.sanchez@osasungarria.com','MSN006','1990-11-05',2400.00,'Langilea','Psikologoa'),(7,'Pedro','Fernández','pfernandez','pedro.fernandez@osasungarria.com','MSN007','1983-04-30',2600.00,'Langilea','Nutrizionista'),(8,'Ander ','Gabilondo','agabilondo','ander.gabilondo@osasungarria.com','MSN008','1987-06-22',3200.00,'Administratzailea','Administratzailea'),(9,'David','Martínez','dmartinez','david.martinez@osasungarria.com','MSN009','1982-01-17',2300.00,'Langilea','Entrenatzaile Pertsonala'),(10,'Paula','Hernández','phernandez','paula.hernandez@osasungarria.com','MSN010','1993-09-28',2100.00,'Langilea','Fisioterapeuta'),(11,'José','Ruiz','jruiz','jose.ruiz@osasungarria.com','MSN011','1988-02-14',2600.00,'Langilea','Mediku Orokorra'),(12,'Carmen','Jiménez','cjimenez','carmen.jimenez@osasungarria.com','MSN012','1985-05-11',2500.00,'Langilea','Psikologoa'),(13,'Andrés','Ortega','aortega','andres.ortega@osasungarria.com','MSN013','1979-08-03',2400.00,'Langilea','Nutrizionista'),(14,'Sofía','Castro','scastro','sofia.castro@osasungarria.com','MSN014','1991-12-06',2200.00,'Langilea','Dietetikaria'),(15,'Fernando','Morales','fmorales','fernando.morales@osasungarria.com','MSN015','1980-10-21',2300.00,'Langilea','Entrenatzaile Pertsonala'),(16,'Laura','Navarro','lnavarro','laura.navarro@osasungarria.com','MSN016','1994-07-09',2100.00,'Langilea','Fisioterapeuta'),(17,'Oihan','Orabengoa','diglesias','oihan.orabengoa@osasungarria.com','MSN017','1981-04-15',3200.00,'Administratzailea','Administratzailea'),(18,'Lucía','Torres','ltorres','lucia.torres@osasungarria.com','MSN018','1986-06-18',2500.00,'Langilea','Psikologoa'),(19,'Roberto','Ramos','rramos','roberto.ramos@osasungarria.com','MSN019','1977-09-25',2400.00,'Langilea','Nutrizionista'),(20,'Elena','Gómez','egomez','elena.gomez@osasungarria.com','MSN020','1995-02-08',2200.00,'Langilea','Dietetikaria'),(21,'Juan','Muñoz','jmunoz','juan.munoz@osasungarria.com','MSN021','1989-11-30',2300.00,'Langilea','Entrenatzaile Pertsonala'),(22,'Cristina','Delgado','cdelgado','cristina.delgado@osasungarria.com','MSN022','1992-08-12',2100.00,'Langilea','Fisioterapeuta'),(23,'Antonio','Vega','avega','antonio.vega@osasungarria.com','MSN023','1976-05-27',2600.00,'Langilea','Mediku Orokorra'),(24,'Patricia','Méndez','pmendez','patricia.mendez@osasungarria.com','MSN024','1984-12-19',2500.00,'Langilea','Psikologoa'),(25,'Alejandro','Flores','aflores','alejandro.flores@osasungarria.com','MSN025','1983-03-14',2400.00,'Langilea','Nutrizionista'),(26,'Rosa','Cabrera','rcabrera','rosa.cabrera@osasungarria.com','MSN026','1990-09-23',2200.00,'Langilea','Dietetikaria'),(27,'Manuel','Pascual','mpascual','manuel.pascual@osasungarria.com','MSN027','1987-07-07',2300.00,'Langilea','Entrenatzaile Pertsonala'),(28,'Natalia','Reyes','nreyes','natalia.reyes@osasungarria.com','MSN028','1993-10-02',2100.00,'Langilea','Fisioterapeuta'),(29,'Hugo','Santos','hsantos','hugo.santos@osasungarria.com','MSN029','1981-06-11',2600.00,'Langilea','Mediku Orokorra'),(30,'Beatriz','Núñez','bnunez','beatriz.nunez@osasungarria.com','MSN030','1985-01-30',2500.00,'Langilea','Psikologoa');
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
  `HornitzaileID` int NOT NULL,
  `Kategoria` varchar(45) NOT NULL,
  `Prezioa` decimal(10,2) NOT NULL,
  `Stock` int NOT NULL,
  `Argazkia` longtext,
  PRIMARY KEY (`ID`),
  KEY `fk_produktuak_hornitzaileak1_idx` (`HornitzaileID`),
  CONSTRAINT `fk_produktuak_hornitzaileak1` FOREIGN KEY (`HornitzaileID`) REFERENCES `hornitzaileak` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktuak`
--

LOCK TABLES `produktuak` WRITE;
/*!40000 ALTER TABLE `produktuak` DISABLE KEYS */;
INSERT INTO `produktuak` VALUES (1,'Quinoa Ekologikoa 500g',1,'Zerealak',5.99,100,'data:image/jpeg;base64,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'),(2,'Ezti Natural 250g',2,'Azukre Artzainak',7.50,80,'data:image/jpeg;base64,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'),(3,'Mendiko Sagarrak 1kg',3,'Frutak',3.99,120,'https://www.supertambo.es/web/tambo/img/productos/2968/manzana_golden_b_2_2.jpg'),(4,'Azenario Freskoa 1kg',4,'Barazkiak',2.99,150,'https://cdn-bm.aktiosdigitalservices.com/tol/bm/media/product/img/300x300/A23510_00.jpg?t=20250216030026'),(5,'Mandarinen Bricka 1L',5,'Edariak',4.50,90,'https://m.media-amazon.com/images/I/613SKskEFyL.jpg'),(6,'Yogur Naturala 500g',6,'Esnekiak',3.75,110,'https://shop.veritas.es/documents/10180/23257/19476_G.jpg'),(7,'Ogi Integrala 1kg',7,'Zerealak',2.99,130,'https://cdn-bm.aktiosdigitalservices.com/tol/bm/media/product/img/300x300/A64036_00.jpg?t=20250221030050'),(8,'Oliva Olioa Birjin 750ml',8,'Olioak',8.99,70,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp-AUPHxsiWKrOZKliB5akN2HkyihIJ9Q8Zw&s'),(9,'Espinakak Freskoak 500g',9,'Barazkiak',2.50,140,'https://cdn-bm.aktiosdigitalservices.com/tol/bm/media/product/img/300x300/A23762_00.jpg?t=20250315030039'),(10,'Oilasko Bularra Ekologikoa 1kg',10,'Haragiak',9.99,60,'https://cdn-bm.aktiosdigitalservices.com/tol/bm/media/product/img/300x300/A85031_00.jpg?t=20250201030201'),(11,'Narrazko Zuku Natural 1L',11,'Edariak',3.50,100,'https://shop.veritas.es/documents/10180/23257/21658_G.jpg'),(12,'Pasta Integral 500g',12,'Zerealak',2.50,120,'https://assets.supermercadosmas.com/img/615x615/product/image/072556/072556.jpg'),(13,'Arroz Integral 1kg',13,'Zerealak',3.20,110,'https://static.condisline.com/resize_1280x1024/images/catalog/large/103060.jpg'),(14,'Brócoli Freskoa 500g',14,'Barazkiak',2.80,130,'https://m.media-amazon.com/images/I/81RdeW-3RvL._AC_UF1000,1000_QL80_.jpg'),(15,'Lentejak Ekologikoak 500g',15,'Legumeak',2.99,140,'https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/202103/23/00118007900055____10__600x600.jpg'),(16,'Detox Berde Batidoa 250ml',16,'Edariak',4.20,80,'https://m.media-amazon.com/images/I/71NZ8CailiL.jpg'),(17,'Nuezak Naturalak 250g',17,'Fruituek',5.50,90,'https://labatanera.com/136-large_default/nueces-naturales.jpg'),(18,'Té Berde Ekologikoa 20 azkarra',18,'Edariak',3.99,100,'https://www.supereko.net/media/catalog/product/cache/3/image/1000x1231/9df78eab33525d08d6e5fb8d27136e95/t/e/te-verde-descafeinado-sin-teina-20-bolsitas-ecologico-artemis-28g.jpg'),(19,'Aguakate Freskoa Unitatea',19,'Frutak',1.50,200,'https://frutasloscursos.com/wp-content/uploads/2024/02/pack-aguacate-4kg.jpg'),(20,'Pepinoa Ekologikoa Unitatea',20,'Barazkiak',0.99,220,'https://www.ekonomatua.eus/web/image/product.template/5903/image_1920?unique=e287f44'),(21,'Kiwi Ekologikoa 500g',21,'Frutak',4.00,110,'https://m.media-amazon.com/images/I/61-VTx2EhpL.jpg'),(22,'Koliflor Freskoa 1 Unitatea',22,'Barazkiak',2.50,130,'https://mercatsantacaterina.com/wp-content/uploads/2023/11/VER-0025-1.jpg'),(23,'Mermelada Naturalengo Mermelada 300g',23,'Azukre Artzainak',4.50,90,'https://sobaoslazapita.es/wp-content/uploads/2020/03/mermelada-fresa-315g-la-artesana.jpg'),(24,'Ogi Integral Artisau 500g',24,'Ogitartekoa',3.20,100,'https://www.lacoopeencasa.coop/media/lcec/publico/articulos/4/2/8/428f49eacb1725d8212ea0c2ec071997'),(25,'Garbantzu Ekologikoak 500g',25,'Legumeak',2.99,120,'https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/202103/23/00118008400055____9__600x600.jpg'),(26,'Manzanilla Infusio 20 azkarra',26,'Edariak',2.50,150,'https://masparafarmacia.com/14123-large_default/uriach-aquilea-infusion-manzanilla-20-sobres.jpg'),(27,'Muesli Naturala 500g',27,'Zerealak',4.20,80,'https://www.manantial-salud.com/272-superlarge_default/muesli-natural-500-g.jpg'),(28,'Tofu Ekologikoa 300g',28,'Landareko Proteinak',3.99,100,'https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/202501/03/00120729101665____5__600x600.jpg'),(29,'Smoothie Fruto Gorri 300ml',29,'Edariak',4.99,90,'https://m.media-amazon.com/images/I/71G9hDplrzL.jpg'),(30,'Zerbeza Artisau Alkoholik gabe 330ml',30,'Edariak',2.50,150,'https://cdn-bm.aktiosdigitalservices.com/tol/bm/media/product/img/300x300/A87805_00.jpg?t=20250308030044');
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

-- Dump completed on 2025-04-01 11:39:30
