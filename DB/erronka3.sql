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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erabiltzaileak`
--

LOCK TABLES `erabiltzaileak` WRITE;
/*!40000 ALTER TABLE `erabiltzaileak` DISABLE KEYS */;
INSERT INTO `erabiltzaileak` VALUES (1,'Almudena','Cortés','almudena.cortes@saludnatural.com','verde123','1985-04-12','F',165,58.0,21.3),(2,'Bernardo','Soler','bernardo.soler@saludnatural.com','natura456','1979-11-03','M',178,75.0,23.7),(3,'Carla','Rivas','carla.rivas@saludnatural.com','bio789','1992-07-19','F',160,52.0,20.3),(4,'Diego','Molina','diego.molina@saludnatural.com','salud321','1988-03-25','M',172,68.0,23),(5,'Elena','Fuentes','elena.fuentes@saludnatural.com','verde654','1990-08-30','F',158,54.0,21.6),(6,'Federico','Navarro','federico.navarro@saludnatural.com','natura987','1983-12-05','M',180,80.0,24.7),(7,'Gloria','Paredes','gloria.paredes@saludnatural.com','bio159','1993-05-15','F',162,55.0,21),(8,'Héctor','Vega','hector.vega@saludnatural.com','salud753','1987-09-22','M',175,70.0,22.9),(9,'Isabel','Luna','isabel.luna@saludnatural.com','verde852','1991-01-18','F',160,53.0,20.8),(10,'Javier','Romero','javier.romero@saludnatural.com','natura4567','1986-06-07','M',182,78.0,23.5),(11,'Karla','Cano','karla.cano@saludnatural.com','bio135','1994-10-12','F',159,52.5,20.7),(12,'Luis','Del Valle','luis.delvalle@saludnatural.com','salud246','1980-02-28','M',177,72.0,22.9),(13,'Marina','Cruz','marina.cruz@saludnatural.com','verde369','1993-11-17','F',163,56.0,21.1),(14,'Nicolás','Ibarra','nicolas.ibarra@saludnatural.com','natura147','1989-04-03','M',174,68.0,22.5),(15,'Olga','Reyes','olga.reyes@saludnatural.com','bio258','1991-08-09','F',160,54.0,21.1),(16,'Pablo','Sanz','pablo.sanz@saludnatural.com','salud3698','1982-12-20','M',180,76.0,23.5),(17,'Quintina','Morales','quintina.morales@saludnatural.com','verde9876','1990-03-30','F',162,55.5,21.1),(18,'Ramón','Giménez','ramon.gimenez@saludnatural.com','natura3210','1984-07-04','M',176,73.0,23.6),(19,'Sara','Ortega','sara.ortega@saludnatural.com','bio741','1992-09-15','F',161,53.5,20.5),(20,'Tomás','Herrera','tomas.herrera@saludnatural.com','salud8520','1987-05-21','M',178,74.0,23.3),(21,'Ursula','Méndez','ursula.mendez@saludnatural.com','verde963','1993-12-11','F',159,52.0,20.5),(22,'Víctor','López','victor.lopez@saludnatural.com','natura1597','1981-06-26','M',175,70.0,22.9),(23,'Wanda','Soler','wanda.soler@saludnatural.com','bio7531','1994-02-14','F',160,53.0,20.8),(24,'Xavier','Ruiz','xavier.ruiz@saludnatural.com','salud357','1985-08-18','M',180,78.0,24.1),(25,'Yolanda','Gil','yolanda.gil@saludnatural.com','verde951','1990-11-27','F',163,57.0,21.4),(26,'Zacarías','Ferrer','zacarias.ferrer@saludnatural.com','natura8521','1983-03-09','M',177,71.0,22.7),(27,'Amalia','Bravo','amalia.bravo@saludnatural.com','bio4561','1989-10-05','F',162,56.5,21.5),(28,'Benjamín','Vidal','benjamin.vidal@saludnatural.com','salud6541','1986-12-31','M',175,69.5,22.6);
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
  `Fakturak_ID` int NOT NULL,
  `Produktu_ID` int NOT NULL,
  `Kantitatea` int NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  `Ordua` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `erosketa_id` (`Fakturak_ID`),
  KEY `produktu_id` (`Produktu_ID`),
  CONSTRAINT `erosketa_produktuak_ibfk_1` FOREIGN KEY (`Fakturak_ID`) REFERENCES `fakturak` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `erosketa_produktuak_ibfk_2` FOREIGN KEY (`Produktu_ID`) REFERENCES `produktuak` (`ID`) ON DELETE CASCADE
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
  `Erabiltzaile_ID` int NOT NULL,
  `Erosketa_data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Guztira` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `erabiltzaile_id` (`Erabiltzaile_ID`),
  CONSTRAINT `fakturak_ibfk_1` FOREIGN KEY (`Erabiltzaile_ID`) REFERENCES `erabiltzaileak` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `ID_langilea` int NOT NULL,
  `ID_erabiltzailea` int NOT NULL,
  `ID_produktua` int NOT NULL,
  `KategoriaGomendioa` varchar(100) DEFAULT NULL,
  `ProduktuGomendioa` char(100) DEFAULT NULL,
  `EskaeraData` date DEFAULT NULL,
  PRIMARY KEY (`ID_gomendazioak`),
  KEY `fk_erabiltzaile_eskaera_idx` (`ID_erabiltzailea`),
  KEY `fk_langilea_eskaera_idx` (`ID_langilea`),
  KEY `fk_langilea_eskaera_idx1` (`ID_produktua`),
  CONSTRAINT `fk_erabiltzaile_eskaera` FOREIGN KEY (`ID_erabiltzailea`) REFERENCES `erabiltzaileak` (`ID`),
  CONSTRAINT `fk_langilea_eskaera` FOREIGN KEY (`ID_langilea`) REFERENCES `langileak` (`ID`),
  CONSTRAINT `fk_produktua_eskaera` FOREIGN KEY (`ID_produktua`) REFERENCES `produktuak` (`ID`)
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hornitzaileak`
--

LOCK TABLES `hornitzaileak` WRITE;
/*!40000 ALTER TABLE `hornitzaileak` DISABLE KEYS */;
INSERT INTO `hornitzaileak` VALUES (1,'VidaSaludable','Juan Martínez',911223344,600201,'Madrid','Orgánico'),(2,'EcoAlimentos','María Rodríguez',912334455,600202,'Barcelona','Frutas y Verduras'),(3,'Naturaleza Viva','Carlos López',913445566,600203,'Valencia','Cereales y Legumbres'),(4,'BioNutrición','Ana García',914556677,600204,'Sevilla','Lácteos Orgánicos'),(5,'Alma Verde','Luis Fernández',915667788,600205,'Bilbao','Bebidas Naturales'),(6,'Sabor Puro','Carmen Sánchez',916778899,600206,'Zaragoza','Miel y Derivados'),(7,'Frescura Total','Jorge Gómez',917889900,600207,'Málaga','Productos Frescos'),(8,'Grano Integral','Lucía Díaz',918990011,600208,'Oviedo','Cereales Integrales'),(9,'La Huerta Sana','Miguel Ruiz',919001122,600209,'Vigo','Frutas y Verduras'),(10,'OrgaVida','Elena Morales',920112233,600210,'Alicante','Productos Orgánicos'),(11,'Campo Natural','Sergio Jiménez',921223344,600211,'Madrid','Carnes y Pescados Orgánicos'),(12,'Sabor Natural','Isabel Ortega',922334455,600212,'Barcelona','Aceites y Vinagres'),(13,'EcoSabor','Roberto Pérez',923445566,600213,'Valencia','Legumbres y Cereales'),(14,'PuroOrigen','Patricia Martín',924556677,600214,'Sevilla','Miel y Derivados'),(15,'VerdeVivo','Francisco Herrera',925667788,600215,'Bilbao','Frutas y Verduras'),(16,'Naturaleza en Mesa','Marta Castro',926778899,600216,'Zaragoza','Bebidas Naturales'),(17,'Raíz Sana','Diego Romero',927889900,600217,'Málaga','Cereales Integrales'),(18,'Origen Puro','Verónica Rojas',928990011,600218,'Oviedo','Legumbres'),(19,'EcoOrigen','Álvaro González',929001122,600219,'Vigo','Productos Orgánicos'),(20,'Vida Integral','Sofía Díaz',930112233,600220,'Alicante','Superalimentos'),(21,'Salud y Sabor','Andrés Molina',931223344,600221,'Madrid','Bebidas Naturales'),(22,'NaturaPlus','Claudia Ruiz',932334455,600222,'Barcelona','Frutas y Verduras'),(23,'EcoVida','Fernando García',933445566,600223,'Valencia','Cereales y Legumbres'),(24,'Puro Sabor','Raquel López',934556677,600224,'Sevilla','Aceites y Vinagres'),(25,'Verde Integral','Ignacio Sánchez',935667788,600225,'Bilbao','Superalimentos'),(26,'Sabor Vital','Beatriz Jiménez',936778899,600226,'Zaragoza','Legumbres y Cereales'),(27,'Origen Natural','Manuel Torres',937889900,600227,'Málaga','Productos Orgánicos'),(28,'EcoCampo','Susana Vargas',938990011,600228,'Oviedo','Frutas y Verduras'),(29,'NaturaVida','Roberto Martínez',939001122,600229,'Vigo','Cereales Integrales'),(30,'Salud Natural','Laura Fernández',940112233,600230,'Alicante','Superalimentos');
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
  `Lanpostua` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `posta_elektronikoa` (`Posta_elektronikoa`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langileak`
--

LOCK TABLES `langileak` WRITE;
/*!40000 ALTER TABLE `langileak` DISABLE KEYS */;
INSERT INTO `langileak` VALUES (111,'Ricardo','Alonso','ralonso','ricardo.alonso@saludnatural.com','empSalud01','1978-05-15',2300.00,'Nutricionista'),(112,'Silvia','Vargas','svargas','silvia.vargas@saludnatural.com','empSalud02','1985-09-20',2500.00,'Dietista'),(113,'Marcos','Pérez','mperez','marcos.perez@saludnatural.com','empSalud03','1980-12-10',2200.00,'Entrenador Personal'),(114,'Ana','López','alopez','ana.lopez@saludnatural.com','empSalud04','1992-03-18',2100.00,'Fisioterapeuta'),(115,'Luis','García','lgarcia','luis.garcia@saludnatural.com','empSalud05','1975-07-25',2800.00,'Médico General'),(116,'Clara','Sánchez','csanchez','clara.sanchez@saludnatural.com','empSalud06','1990-11-05',2400.00,'Psicóloga'),(117,'Pedro','Fernández','pfernandez','pedro.fernandez@saludnatural.com','empSalud07','1983-04-30',2600.00,'Nutricionista'),(118,'Marta','Domínguez','mdominguez','marta.dominguez@saludnatural.com','empSalud08','1987-06-22',2200.00,'Dietista'),(119,'David','Martínez','dmartinez','david.martinez@saludnatural.com','empSalud09','1982-01-17',2300.00,'Entrenador Personal'),(120,'Paula','Hernández','phernandez','paula.hernandez@saludnatural.com','empSalud10','1993-09-28',2100.00,'Fisioterapeuta'),(121,'José','Ruiz','jruiz','jose.ruiz@saludnatural.com','empSalud11','1988-02-14',2600.00,'Médico General'),(122,'Carmen','Jiménez','cjimenez','carmen.jimenez@saludnatural.com','empSalud12','1985-05-11',2500.00,'Psicóloga'),(123,'Andrés','Ortega','aortega','andres.ortega@saludnatural.com','empSalud13','1979-08-03',2400.00,'Nutricionista'),(124,'Sofía','Castro','scastro','sofia.castro@saludnatural.com','empSalud14','1991-12-06',2200.00,'Dietista'),(125,'Fernando','Morales','fmorales','fernando.morales@saludnatural.com','empSalud15','1980-10-21',2300.00,'Entrenador Personal'),(126,'Laura','Navarro','lnavarro','laura.navarro@saludnatural.com','empSalud16','1994-07-09',2100.00,'Fisioterapeuta'),(127,'Daniel','Iglesias','diglesias','daniel.iglesias@saludnatural.com','empSalud17','1981-04-15',2800.00,'Médico General'),(128,'Lucía','Torres','ltorres','lucia.torres@saludnatural.com','empSalud18','1986-06-18',2500.00,'Psicóloga'),(129,'Roberto','Ramos','rramos','roberto.ramos@saludnatural.com','empSalud19','1977-09-25',2400.00,'Nutricionista'),(130,'Elena','Gómez','egomez','elena.gomez@saludnatural.com','empSalud20','1995-02-08',2200.00,'Dietista'),(131,'Juan','Muñoz','jmunoz','juan.munoz@saludnatural.com','empSalud21','1989-11-30',2300.00,'Entrenador Personal'),(132,'Cristina','Delgado','cdelgado','cristina.delgado@saludnatural.com','empSalud22','1992-08-12',2100.00,'Fisioterapeuta'),(133,'Antonio','Vega','avega','antonio.vega@saludnatural.com','empSalud23','1976-05-27',2600.00,'Médico General'),(134,'Patricia','Méndez','pmendez','patricia.mendez@saludnatural.com','empSalud24','1984-12-19',2500.00,'Psicóloga'),(135,'Alejandro','Flores','aflores','alejandro.flores@saludnatural.com','empSalud25','1983-03-14',2400.00,'Nutricionista'),(136,'Rosa','Cabrera','rcabrera','rosa.cabrera@saludnatural.com','empSalud26','1990-09-23',2200.00,'Dietista'),(137,'Manuel','Pascual','mpascual','manuel.pascual@saludnatural.com','empSalud27','1987-07-07',2300.00,'Entrenador Personal'),(138,'Natalia','Reyes','nreyes','natalia.reyes@saludnatural.com','empSalud28','1993-10-02',2100.00,'Fisioterapeuta'),(139,'Hugo','Santos','hsantos','hugo.santos@saludnatural.com','empSalud29','1981-06-11',2600.00,'Médico General'),(140,'Beatriz','Núñez','bnunez','beatriz.nunez@saludnatural.com','empSalud30','1985-01-30',2500.00,'Psicóloga');
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
  `ID_Hornitzaileak` int NOT NULL,
  `Kategoria` varchar(45) NOT NULL,
  `Prezioa` decimal(10,2) NOT NULL,
  `Stock` int NOT NULL,
  `Argazkia` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_produktuak_hornitzaileak1_idx` (`ID_Hornitzaileak`),
  CONSTRAINT `fk_produktuak_hornitzaileak1` FOREIGN KEY (`ID_Hornitzaileak`) REFERENCES `hornitzaileak` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktuak`
--

LOCK TABLES `produktuak` WRITE;
/*!40000 ALTER TABLE `produktuak` DISABLE KEYS */;
INSERT INTO `produktuak` VALUES (21,'Quinoa Orgánica 500g',1,'Cereales',5.99,100,'quinoa.jpg'),(22,'Miel Natural 250g',2,'Endulzantes',7.50,80,'miel.jpg'),(23,'Manzanas Orgánicas (1kg)',3,'Frutas',3.99,120,'manzana.jpg'),(24,'Zanahorias Frescas 1kg',4,'Verduras',2.99,150,'zanahoria.jpg'),(25,'Leche de Almendra 1L',5,'Bebidas',4.50,90,'almendra.jpg'),(26,'Yogur Natural 500g',6,'Lácteos',3.75,110,'yogur.jpg'),(27,'Avena Integral 1kg',7,'Cereales',2.99,130,'avena.jpg'),(28,'Aceite de Oliva Virgen 750ml',8,'Aceites',8.99,70,'aceite.jpg'),(29,'Espinacas Frescas 500g',9,'Verduras',2.50,140,'espinacas.jpg'),(30,'Pechuga de Pollo Orgánica 1kg',10,'Carnes',9.99,60,'pollo.jpg'),(31,'Zumo de Naranja Natural 1L',11,'Bebidas',3.50,100,'zumo.jpg'),(32,'Pasta Integral 500g',12,'Cereales',2.50,120,'pasta.jpg'),(33,'Arroz Integral 1kg',13,'Cereales',3.20,110,'arroz.jpg'),(34,'Brócoli Fresco 500g',14,'Verduras',2.80,130,'brocoli.jpg'),(35,'Lentejas Orgánicas 500g',15,'Legumbres',2.99,140,'lentejas.jpg'),(36,'Batido Verde Detox 250ml',16,'Bebidas',4.20,80,'batido.jpg'),(37,'Nueces Naturales 250g',17,'Frutos Secos',5.50,90,'nueces.jpg'),(38,'Té Verde Orgánico 20 bolsitas',18,'Bebidas',3.99,100,'te.jpg'),(39,'Aguacate Fresco Unidad',19,'Frutas',1.50,200,'aguacate.jpg'),(40,'Pepino Orgánico Unidad',20,'Verduras',0.99,220,'pepino.jpg'),(41,'Kiwi Orgánico 500g',21,'Frutas',4.00,110,'kiwi.jpg'),(42,'Coliflor Fresca 1 Unidad',22,'Verduras',2.50,130,'coliflor.jpg'),(43,'Mermelada Natural de Fresa 300g',23,'Endulzantes',4.50,90,'mermelada.jpg'),(44,'Pan Integral Artesanal 500g',24,'Panadería',3.20,100,'pan.jpg'),(45,'Garbanzos Orgánicos 500g',25,'Legumbres',2.99,120,'garbanzos.jpg'),(46,'Infusión de Manzanilla 20 bolsitas',26,'Bebidas',2.50,150,'manzanilla.jpg'),(47,'Muesli Natural 500g',27,'Cereales',4.20,80,'muesli.jpg'),(48,'Tofu Orgánico 300g',28,'Proteínas Vegetales',3.99,100,'tofu.jpg'),(49,'Smoothie de Frutos Rojos 300ml',29,'Bebidas',4.99,90,'smoothie.jpg'),(50,'Cerveza Artesanal Sin Alcohol 330ml',30,'Bebidas',2.50,150,'cerveza.jpg');
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

-- Dump completed on 2025-03-26 11:51:24
