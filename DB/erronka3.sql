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
INSERT INTO `langileak` VALUES (1,'Ibai','Olea','iolea','ibai.olea@osasungarria.com','MSN001','1978-05-15',3300.00,'Administratzailea'),(2,'Silvia','Vargas','svargas','silvia.vargas@osasungarria.com','MSN002','1985-09-20',2500.00,'Dietetikaria'),(3,'Marcos','Pérez','mperez','marcos.perez@osasungarria.com','MSN003','1980-12-10',2200.00,'Entrenatzaile Pertsonala'),(4,'Ana','López','alopez','ana.lopez@osasungarria.com','MSN004','1992-03-18',2100.00,'Fisioterapeuta'),(5,'Luis','García','lgarcia','luis.garcia@osasungarria.com','MSN005','1975-07-25',2800.00,'Mediku Orokorra'),(6,'Clara','Sánchez','csanchez','clara.sanchez@osasungarria.com','MSN006','1990-11-05',2400.00,'Psikologoa'),(7,'Pedro','Fernández','pfernandez','pedro.fernandez@osasungarria.com','MSN007','1983-04-30',2600.00,'Nutrizionista'),(8,'Ander ','Gabilondo','agabilondo','ander.gabilondo@osasungarria.com','MSN008','1987-06-22',3200.00,'Administratzailea'),(9,'David','Martínez','dmartinez','david.martinez@osasungarria.com','MSN009','1982-01-17',2300.00,'Entrenatzaile Pertsonala'),(10,'Paula','Hernández','phernandez','paula.hernandez@osasungarria.com','MSN010','1993-09-28',2100.00,'Fisioterapeuta'),(11,'José','Ruiz','jruiz','jose.ruiz@osasungarria.com','MSN011','1988-02-14',2600.00,'Mediku Orokorra'),(12,'Carmen','Jiménez','cjimenez','carmen.jimenez@osasungarria.com','MSN012','1985-05-11',2500.00,'Psikologoa'),(13,'Andrés','Ortega','aortega','andres.ortega@osasungarria.com','MSN013','1979-08-03',2400.00,'Nutrizionista'),(14,'Sofía','Castro','scastro','sofia.castro@osasungarria.com','MSN014','1991-12-06',2200.00,'Dietetikaria'),(15,'Fernando','Morales','fmorales','fernando.morales@osasungarria.com','MSN015','1980-10-21',2300.00,'Entrenatzaile Pertsonala'),(16,'Laura','Navarro','lnavarro','laura.navarro@osasungarria.com','MSN016','1994-07-09',2100.00,'Fisioterapeuta'),(17,'Oihan','Orabengoa','diglesias','oihan.orabengoa@osasungarria.com','MSN017','1981-04-15',3200.00,'Administratzailea'),(18,'Lucía','Torres','ltorres','lucia.torres@osasungarria.com','MSN018','1986-06-18',2500.00,'Psikologoa'),(19,'Roberto','Ramos','rramos','roberto.ramos@osasungarria.com','MSN019','1977-09-25',2400.00,'Nutrizionista'),(20,'Elena','Gómez','egomez','elena.gomez@osasungarria.com','MSN020','1995-02-08',2200.00,'Dietetikaria'),(21,'Juan','Muñoz','jmunoz','juan.munoz@osasungarria.com','MSN021','1989-11-30',2300.00,'Entrenatzaile Pertsonala'),(22,'Cristina','Delgado','cdelgado','cristina.delgado@osasungarria.com','MSN022','1992-08-12',2100.00,'Fisioterapeuta'),(23,'Antonio','Vega','avega','antonio.vega@osasungarria.com','MSN023','1976-05-27',2600.00,'Mediku Orokorra'),(24,'Patricia','Méndez','pmendez','patricia.mendez@osasungarria.com','MSN024','1984-12-19',2500.00,'Psikologoa'),(25,'Alejandro','Flores','aflores','alejandro.flores@osasungarria.com','MSN025','1983-03-14',2400.00,'Nutrizionista'),(26,'Rosa','Cabrera','rcabrera','rosa.cabrera@osasungarria.com','MSN026','1990-09-23',2200.00,'Dietetikaria'),(27,'Manuel','Pascual','mpascual','manuel.pascual@osasungarria.com','MSN027','1987-07-07',2300.00,'Entrenatzaile Pertsonala'),(28,'Natalia','Reyes','nreyes','natalia.reyes@osasungarria.com','MSN028','1993-10-02',2100.00,'Fisioterapeuta'),(29,'Hugo','Santos','hsantos','hugo.santos@osasungarria.com','MSN029','1981-06-11',2600.00,'Mediku Orokorra'),(30,'Beatriz','Núñez','bnunez','beatriz.nunez@osasungarria.com','MSN030','1985-01-30',2500.00,'Psikologoa');
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
  `Argazkia` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_produktuak_hornitzaileak1_idx` (`ID_Hornitzaileak`),
  CONSTRAINT `fk_produktuak_hornitzaileak1` FOREIGN KEY (`ID_Hornitzaileak`) REFERENCES `hornitzaileak` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktuak`
--

LOCK TABLES `produktuak` WRITE;
/*!40000 ALTER TABLE `produktuak` DISABLE KEYS */;
INSERT INTO `produktuak` VALUES (1,'Quinoa Ekologikoa 500g',1,'Zerealak',5.99,100,'https://www.ecoalgrano.com/wp-content/uploads/2020/07/quinoa-ecologica.jpg'),(2,'Ezti Natural 250g',2,'AzukreArtzainak',7.50,80,'https://cdn.shopify.com/s/files/1/0850/8457/products/miel_mel_250g_1024x1024.jpg?v=1633486183'),(3,'Mendiko Sagarrak (1kg)',3,'Frutak',3.99,120,'https://upload.wikimedia.org/wikipedia/commons/c/c9/Red_Apple.jpg'),(4,'Azenario Freskoa 1kg',4,'Barazkiak',2.99,150,'https://www.dicel.com/wp-content/uploads/2021/10/zanahorias.jpg'),(5,'Mandarinen Lata 1L',5,'Edariak',4.50,90,'https://www.ideal.es/sociedad/images/2022/01/31/20220131104625254.jpg'),(6,'Yogur Naturala 500g',6,'Esnekiak',3.75,110,'https://www.naturgreen.com/wp-content/uploads/2022/01/yogur-natural.jpg'),(7,'Ogi Integrala 1kg',7,'Zerealak',2.99,130,'https://static.planetorganic.com/wp-content/uploads/2021/06/wholemeal-bread.jpg'),(8,'Oliva Olioa Birjin 750ml',8,'Olioak',8.99,70,'https://www.oliveoiltimes.com/wp-content/uploads/2020/04/olive_oil_bottle.jpg'),(9,'Espinakak Freskoak 500g',9,'Barazkiak',2.50,140,'https://media.istockphoto.com/photos/fresh-spinach-leaves-picture-id1072971888'),(10,'Oilasko Bularra Ekologikoa 1kg',10,'Haragiak',9.99,60,'https://www.thespruceeats.com/thmb/tJIVGRX7qNVj9eQ2xE5K3Sc84lg=/4000x2670/filters:no_upscale():max_bytes(150000):strip_icc()/raw-chicken-breast-153600054.jpg'),(11,'Narrazko Zuku Natural 1L',11,'Edariak',3.50,100,'https://5.imimg.com/data5/YD/ZB/MY-20437653/fresh-orange-juice-500x500.jpg'),(12,'Pasta Integral 500g',12,'Zerealak',2.50,120,'https://media.istockphoto.com/photos/raw-whole-wheat-pasta-picture-id843302276'),(13,'Arroz Integral 1kg',13,'Zerealak',3.20,110,'https://upload.wikimedia.org/wikipedia/commons/e/e2/Whole-grain_brown_rice.jpg'),(14,'Brócoli Freskoa 500g',14,'Barazkiak',2.80,130,'https://www.thehealthymaven.com/wp-content/uploads/2020/02/broccoli-1024x1024.jpg'),(15,'Lentejak Ekologikoak 500g',15,'Legumeak',2.99,140,'https://www.amazon.com/images/I/61TKsS7EmwL._AC_SY679_.jpg'),(16,'Detox Berde Batidoa 250ml',16,'Edariak',4.20,80,'https://cdn.shopify.com/s/files/1/0822/6151/products/green-detox-juice-4_1024x1024.jpg?v=1617402437'),(17,'Nuezak Naturalak 250g',17,'Fruituek',5.50,90,'https://www.harvestdirect.co.uk/2020/07/whole-walnuts.jpg'),(18,'Té Berde Ekologikoa 20 azkarra',18,'Edariak',3.99,100,'https://www.organicfacts.net/wp-content/uploads/2018/07/green-tea.jpg'),(19,'Aguakate Freskoa Unitatea',19,'Frutak',1.50,200,'https://www.pexels.com/photo/green-vegetable-3194522/'),(20,'Pepinoa Ekologikoa Unitatea',20,'Barazkiak',0.99,220,'https://static.abc.es/media/cultura/2020/07/07/pepino-kO--1240x600@abc.jpg'),(21,'Kiwi Ekologikoa 500g',21,'Frutak',4.00,110,'https://upload.wikimedia.org/wikipedia/commons/2/21/Kiwi_fruit.jpg'),(22,'Koliflor Freskoa 1 Unitatea',22,'Barazkiak',2.50,130,'https://www.nutrientandsoil.com/wp-content/uploads/2020/06/cauliflower.jpg'),(23,'Mermelada Naturalengo Mermelada 300g',23,'AzukreArtzainak',4.50,90,'https://www.sweetcana.com/8507-large_default/strawberry-jam-organic-250g.jpg'),(24,'Ogi Integral Artisau 500g',24,'Ogitartekoa',3.20,100,'https://www.healthyeating.org/images/bread_500g.jpg'),(25,'Garbantzu Ekologikoak 500g',25,'Legumeak',2.99,120,'https://www.dicel.com/wp-content/uploads/2021/07/garbanzos.jpg'),(26,'Manzanilla Infusio 20 azkarra',26,'Edariak',2.50,150,'https://www.britishtea.com/wp-content/uploads/2020/11/green-tea-infused.jpg'),(27,'Muesli Naturala 500g',27,'Zerealak',4.20,80,'https://cdn11.bigcommerce.com/s-27a49/images/stencil/1280x1280/products/379/3519/muesli_3_2000x.jpg?v=1617402437'),(28,'Tofu Ekologikoa 300g',28,'Landareko Proteinak',3.99,100,'https://cdn.shopify.com/s/files/1/1221/1033/products/tofu_300g.jpg?v=1644417761'),(29,'Smoothie Fruto Gorri 300ml',29,'Edariak',4.99,90,'https://www.trendwise.com/wp-content/uploads/2020/06/red-fruit-smoothie.jpg'),(30,'Zerbeza Artisau Alkoholik gabe 330ml',30,'Edariak',2.50,150,'https://beerconnoisseur.com/sites/default/files/styles/entry_full/public/2021-02/20210201_0.jpg?itok=eytz0O0a');
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

-- Dump completed on 2025-03-27 10:37:02
