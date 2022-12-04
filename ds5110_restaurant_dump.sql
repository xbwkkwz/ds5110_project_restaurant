CREATE DATABASE  IF NOT EXISTS `restaurant` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restaurant`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `business_hour`
--

DROP TABLE IF EXISTS `business_hour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_hour` (
  `timeID` int NOT NULL AUTO_INCREMENT,
  `businessDay` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `openTime` time NOT NULL,
  `closeTime` time NOT NULL,
  `dayStatus` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`timeID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_hour`
--

LOCK TABLES `business_hour` WRITE;
/*!40000 ALTER TABLE `business_hour` DISABLE KEYS */;
INSERT INTO `business_hour` VALUES (1,'Monday','11:00:00','20:00:00',0),(2,'Tuesday','11:00:00','20:00:00',1),(3,'Wednesday','11:00:00','20:00:00',1),(4,'Thursday','11:00:00','20:00:00',1),(5,'Friday','11:00:00','20:00:00',1),(6,'Saturday','11:00:00','20:00:00',1),(7,'Sunday','11:00:00','20:00:00',1),(8,'Monday','11:00:00','22:00:00',1),(9,'Tuesday','11:00:00','22:00:00',0),(10,'Wednesday','11:00:00','22:00:00',0),(11,'Thursday','11:00:00','22:00:00',0),(12,'Friday','11:00:00','22:00:00',0),(13,'Saturday','11:00:00','22:00:00',0),(14,'Sunday','11:00:00','22:00:00',0),(15,'Monday','12:00:00','22:00:00',0),(16,'Tuesday','12:00:00','22:00:00',0),(17,'Wednesday','12:00:00','22:00:00',0),(18,'Thursday','12:00:00','22:00:00',0),(19,'Friday','12:00:00','22:00:00',0),(20,'Saturday','12:00:00','22:00:00',0),(21,'Sunday','12:00:00','22:00:00',0),(22,'Monday','06:00:00','24:00:00',0);
/*!40000 ALTER TABLE `business_hour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `chef_cooking_queue`
--

DROP TABLE IF EXISTS `chef_cooking_queue`;
/*!50001 DROP VIEW IF EXISTS `chef_cooking_queue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `chef_cooking_queue` AS SELECT 
 1 AS `queueID`,
 1 AS `orderID`,
 1 AS `orderTime`,
 1 AS `employeeID`,
 1 AS `chefName`,
 1 AS `orderStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(64) NOT NULL,
  `lastName` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `customerPassword` varchar(64) NOT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Lisa','Weiss','kathleenwilson@gmail.com','(733)974-9551','90YCI_zp+5'),(2,'Connie','Barron','jhendricks@gmail.com','(467)355-5798','%L8NX%m$#M'),(3,'Debbie','Andrews','taraweaver@gmail.com','(706)880-6619','a(v9StJgBn'),(4,'Anthony','Blair','ksmith@gmail.com','(410)842-5750','d@5GeBbguZ'),(5,'David','Brady','michellegilmore@gmail.com','(435)998-7637','Pca3uJhJk@'),(6,'Calvin','Frederick','sarahrobinson@gmail.com','(753)458-3488','MZM(7Wv_R('),(7,'Jeremy','Bennett','william82@gmail.com','(647)619-7925','Ju)JXhAr!0'),(8,'Bryan','Wyatt','carol05@gmail.com','(915)550-3241','^Tlc$eSnt2'),(9,'John','Wilson','tonyrobinson@gmail.com','(130)417-8981','a6a3Nsjv*i'),(10,'Mr.','Patrick','amyweiss@gmail.com','(423)569-9757','*Y4jzZ2ciA'),(11,'Brandy','Washington','xtaylor@gmail.com','(110)166-0077','+U9ZhCa1RC'),(12,'Willie','Oneill','alyssa90@gmail.com','(241)549-9414','SJ0Cd3iv(U'),(13,'Jasmine','Hunt','larryberg@gmail.com','(721)551-6340','%E3FrgxN!N'),(14,'Andre','Robinson','lauren71@gmail.com','(265)441-5210',')hMqhT$S7t'),(15,'David','Gonzalez','haileyrichmond@gmail.com','(842)134-2808','54AK9Cgn&^'),(16,'Colleen','Ballard','bushrobert@gmail.com','(942)458-5561','+&I4cyZu6d'),(17,'Brittany','Richardson','sloanlauren@gmail.com','(434)859-0773','@J#)3Sxj+*'),(18,'Alexandria','Escobar','nathanross@gmail.com','(499)145-3737','+56ouLiQQd'),(19,'Shari','Day','carlos15@gmail.com','(446)007-4958','I(3SmXwiJq'),(20,'Peter','Nixon','crystal53@gmail.com','(979)001-0926','e*$3OqJn3c'),(21,'Johnny','Wilkerson','nelsonmichael@gmail.com','(806)653-7737','04kEFY0D$v'),(22,'Ryan','Barker','watsoneric@gmail.com','(959)213-1616','3^&OUQ$o@B'),(23,'Adam','Solomon','vlewis@gmail.com','(598)799-3699','x_1Orn*Zs1'),(24,'Mary','Knight','williamsnicole@gmail.com','(931)153-4196','pte7NZBb+7'),(25,'Michael','Blake','ooconnor@gmail.com','(130)435-4325','o6&Syx0J$G'),(26,'Tyler','Young','ccunningham@gmail.com','(709)176-6942','3+7B92hjJv'),(27,'Robert','Hill','michael16@gmail.com','(535)608-1775',')QQ7HsH4f*'),(28,'Jennifer','Gonzales','tarellano@gmail.com','(759)026-8555','6208MhzC#T'),(29,'Renee','Davis','nvillarreal@gmail.com','(219)981-6707','1$+w4QXjbZ'),(30,'John','Hooper','corygraves@gmail.com','(968)822-2813','p3qb_Xoi_f'),(31,'Tamara','Burton','bvargas@gmail.com','(566)667-8001','#%0*WE!aB+'),(32,'Ronald','Stewart','sampsonashley@gmail.com','(850)336-4532','%8AVCKcvU7'),(33,'Lynn','Pope','marissacunningham@gmail.com','(535)186-6467','S73HEBv*J+'),(34,'Carlos','Green','ortegabrian@gmail.com','(897)768-5684','%97l8mHg@z'),(35,'Mary','Graham','zthompson@gmail.com','(862)589-6226','_5kTC0mvGe'),(36,'Melissa','Johnson','christineross@gmail.com','(849)108-3147','2FBh#Koe+1'),(37,'Gerald','Jones','roweleonard@gmail.com','(841)809-4096','C9Q5TD$q(@'),(38,'Austin','Rodriguez','jessica66@gmail.com','(643)069-5943','4o(1sPlz#l'),(39,'Victor','Stein','jsmith@gmail.com','(547)377-2724','(9(jX^3gRr'),(40,'Kelly','Ford','cynthiawalker@gmail.com','(664)807-9105','a+Z1HtYiJb'),(41,'Paul','Lawrence','robert27@gmail.com','(777)165-2747','iXQ7Tzvk&7'),(42,'Daniel','Burton','kayla13@gmail.com','(949)751-9481','*6qaHPe*EU'),(43,'Sarah','Davis','sydney45@gmail.com','(503)770-8955','@2Q4*2Ym8Y'),(44,'Kevin','Valencia','randolphkristin@gmail.com','(501)068-0885','A%O21Ho06k'),(45,'Daniel','Smith','bhill@gmail.com','(218)906-1953','_^4JpS8f%o'),(46,'Heather','Medina','lirwin@gmail.com','(301)950-9814','&*$9Zlowao'),(47,'Lance','Conner','idickson@gmail.com','(994)364-2247','@QtWmEEc4c'),(48,'Nicholas','Reed','sergio98@gmail.com','(350)872-3886','m%4Y9QbJP$'),(49,'Brian','Wang','jody80@gmail.com','(287)714-1299','j$59DQgeg!'),(50,'Jason','Dickerson','echen@gmail.com','(378)688-1592','%7QKZkzf+C'),(51,'Bowen','Xu','xu.bowen@neu.edu','6123456789','123456'),(52,'Peppa','Pig','test@neu.edu','6123456789','123456');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dining_table`
--

DROP TABLE IF EXISTS `dining_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dining_table` (
  `tableID` int NOT NULL AUTO_INCREMENT,
  `capacity` int NOT NULL,
  `tableStatus` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tableID`),
  CONSTRAINT `dining_table_chk_1` CHECK ((`capacity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dining_table`
--

LOCK TABLES `dining_table` WRITE;
/*!40000 ALTER TABLE `dining_table` DISABLE KEYS */;
INSERT INTO `dining_table` VALUES (1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,2,1),(7,2,1),(8,2,1),(9,2,1),(10,2,1),(11,2,1),(12,2,1),(13,2,1),(14,2,1),(15,2,1),(16,4,1),(17,4,1),(18,4,1),(19,4,1),(20,4,1),(21,4,1);
/*!40000 ALTER TABLE `dining_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_has_ingredient`
--

DROP TABLE IF EXISTS `dish_has_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_has_ingredient` (
  `menuID` int NOT NULL,
  `ingredientID` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`menuID`,`ingredientID`),
  KEY `dish_ingredient_fk_ingredient` (`ingredientID`),
  CONSTRAINT `dish_ingredient_fk_ingredient` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`ingredientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dish_ingredient_fk_menu` FOREIGN KEY (`menuID`) REFERENCES `menu` (`menuID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dish_has_ingredient_chk_1` CHECK ((`quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_has_ingredient`
--

LOCK TABLES `dish_has_ingredient` WRITE;
/*!40000 ALTER TABLE `dish_has_ingredient` DISABLE KEYS */;
INSERT INTO `dish_has_ingredient` VALUES (1,1,10),(1,2,1),(2,3,10),(3,4,5),(3,5,5),(4,1,5),(4,5,5),(5,6,10),(6,7,10),(7,8,10),(7,9,5),(8,1,5),(8,8,10),(9,8,5),(9,10,1),(9,11,1),(9,12,1),(9,13,1),(10,3,6),(10,14,1),(11,7,6),(11,14,6),(12,1,5),(12,4,5),(12,6,5),(12,7,5),(12,15,1),(12,16,1),(12,17,1),(13,1,5),(13,18,1),(14,18,1),(14,19,1),(15,13,1),(15,18,1),(15,20,2),(15,21,1),(16,20,2),(16,22,1),(16,23,1),(17,10,1),(17,16,1),(17,20,2),(17,24,1),(18,10,1),(18,16,1),(18,20,2),(18,25,1),(19,1,5),(19,16,1),(19,17,1),(20,3,5),(20,17,1),(20,26,1),(21,1,3),(21,3,3),(21,16,1),(21,17,1),(22,6,5),(22,16,1),(22,17,1),(23,3,5),(23,17,1),(23,26,1),(24,16,1),(24,17,1),(24,27,5),(25,4,5),(25,16,1),(25,17,1),(26,4,5),(26,17,1),(26,26,1),(26,27,5),(26,28,5),(27,1,2),(27,3,2),(27,4,2),(27,5,2),(27,6,2),(27,7,2),(27,16,1),(27,17,1),(27,27,2),(28,29,1),(29,22,1),(30,1,5),(30,4,5),(30,27,5),(31,29,1),(32,25,1),(33,27,15),(34,24,1),(35,28,5),(36,30,2),(37,17,1),(38,18,1),(39,19,1),(39,31,1),(40,16,1),(40,32,10),(41,33,3),(42,34,3),(43,36,1);
/*!40000 ALTER TABLE `dish_has_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(64) NOT NULL,
  `lastName` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `ssn` char(11) DEFAULT NULL,
  `salary` decimal(9,2) DEFAULT NULL,
  `occupation` enum('Waiter','Chef','Manager') NOT NULL,
  `rating` enum('1','2','3','4','5') DEFAULT NULL,
  PRIMARY KEY (`employeeID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `ssn` (`ssn`),
  CONSTRAINT `employee_chk_1` CHECK ((`salary` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Michael','Graham','rodriguezelizabeth@gmail.com','(801)132-0784','818-24-4107',60000.00,'Waiter','5'),(2,'Adam','Garcia','stacymiles@gmail.com','(530)958-0822','864-43-8965',60000.00,'Waiter','5'),(3,'Jose','Webster','greenevincent@gmail.com','(158)198-5390','293-21-5498',60000.00,'Waiter','5'),(4,'Alicia','Miller','schultzmelissa@gmail.com','(295)487-1651','805-40-3847',60000.00,'Waiter','5'),(5,'Joe','Alexander','gonzalesrobert@gmail.com','(737)908-4629','640-28-2567',60000.00,'Waiter','5'),(6,'Aaron','Williams','nicholasandrews@gmail.com','(762)854-8079','806-66-4299',60000.00,'Waiter','5'),(7,'Richard','Salinas','perezcarlos@gmail.com','(281)732-2882','826-01-9601',60000.00,'Waiter','5'),(8,'Richard','Snow','cynthiawalker@gmail.com','(643)525-7650','226-59-2275',60000.00,'Waiter','5'),(9,'Melissa','Payne','hoffmanryan@gmail.com','(116)185-5610','283-72-4520',60000.00,'Waiter','5'),(10,'Andrea','Carter','dawn84@gmail.com','(111)218-4560','690-90-1794',60000.00,'Waiter','5'),(11,'Timothy','Cox','sean89@gmail.com','(122)125-9422','650-01-6229',90000.00,'Chef','5'),(12,'Richard','Brown','rbernard@gmail.com','(412)232-7097','071-74-8765',90000.00,'Chef','5'),(13,'Jacqueline','Craig','cramos@gmail.com','(401)177-6248','825-93-0956',90000.00,'Chef','5'),(14,'Marcus','Skinner','harold83@gmail.com','(462)595-2167','625-11-8900',90000.00,'Chef','5'),(15,'John','Johnson','hbutler@gmail.com','(436)319-9113','084-09-0648',90000.00,'Chef','5'),(16,'Richard','Perez','sotobrandon@gmail.com','(811)999-3004','190-25-8473',90000.00,'Chef','5'),(17,'Lindsay','Williams','alexisbaldwin@gmail.com','(219)154-6781','639-53-0881',90000.00,'Chef','5'),(18,'Lauren','Erickson','dthomas@gmail.com','(996)233-4203','201-19-5475',90000.00,'Chef','5'),(19,'Nichole','Vazquez','debrasmith@gmail.com','(466)123-2439','046-02-0340',90000.00,'Chef','5'),(20,'Tony','Garcia','darlenejackson@gmail.com','(438)261-4437','851-77-0850',90000.00,'Chef','5'),(21,'Jason','Shepherd','ngonzales@gmail.com','(786)143-2537','599-77-1099',120000.00,'Manager','5'),(22,'Rebecca','Hendrix','coxalexandria@gmail.com','(641)787-9949','579-35-6854',120000.00,'Manager','5'),(23,'Jake','Barker','krystalpatrick@gmail.com','(829)060-5443','670-80-4243',120000.00,'Manager','5'),(24,'Brent','Elliott','schroederamanda@gmail.com','(114)416-2362','343-80-0053',120000.00,'Manager','5'),(25,'Caroline','Martinez','ajohnson@gmail.com','(514)283-4189','075-49-7640',120000.00,'Manager','5'),(26,'Richard','Thompson','pmartinez@gmail.com','(297)527-8405','779-76-4959',120000.00,'Manager','5'),(27,'Michele','Leon','jennifer64@gmail.com','(103)035-3404','790-88-7043',120000.00,'Manager','5'),(28,'Michaela','Castaneda','tanyacobb@gmail.com','(683)044-3206','359-29-2613',120000.00,'Manager','5'),(29,'Jennifer','Cooke','lisacook@gmail.com','(737)539-7003','864-74-4429',120000.00,'Manager','5'),(30,'Vanessa','Baxter','valerie67@gmail.com','(370)129-2863','373-92-4587',120000.00,'Manager','5'),(32,'Peppa','Pig','peppa.pig@neu.edu','6123456789','134-56-8667',110000.00,'Chef','5');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `ingredientID` int NOT NULL AUTO_INCREMENT,
  `ingredientName` varchar(64) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ingredientID`),
  UNIQUE KEY `ingredientName` (`ingredientName`),
  CONSTRAINT `ingredient_chk_1` CHECK ((`stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Calamari',467),(2,'Red sauce',98),(3,'Cherrystone',497),(4,'Shrimp',490),(5,'Scampi',500),(6,'Mussel',500),(7,'Littleneck',500),(8,'Romaine',500),(9,'Crouton',500),(10,'Tomato',499),(11,'Cucumber',500),(12,'Carrot',500),(13,'Red onion',500),(14,'Cocktail sauce',100),(15,'Lobster',100),(16,'Tomato sauce',498),(17,'Linguine',499),(18,'Black pasta',499),(19,'Alfredo sauce',499),(20,'Mushroom',492),(21,'Pepper',500),(22,'Monkfish',97),(23,'Marsala sauce',97),(24,'Salmon',100),(25,'Swordfish',99),(26,'Clam sauce',500),(27,'Scallop',490),(28,'Broccoli',500),(29,'Haddock',100),(30,'Potato',500),(31,'Cheese',500),(32,'Pepperoni',500),(33,'Orange',500),(34,'Apple',500),(36,'Test ingredient',100);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ingredient_inventory`
--

DROP TABLE IF EXISTS `ingredient_inventory`;
/*!50001 DROP VIEW IF EXISTS `ingredient_inventory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ingredient_inventory` AS SELECT 
 1 AS `inventoryID`,
 1 AS `ingredientName`,
 1 AS `quantity`,
 1 AS `totalCost`,
 1 AS `employeeID`,
 1 AS `employeeName`,
 1 AS `purchaseDate`,
 1 AS `expDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventoryID` int NOT NULL AUTO_INCREMENT,
  `ingredientID` int NOT NULL,
  `quantity` int NOT NULL,
  `totalCost` decimal(6,2) NOT NULL,
  `employeeID` int DEFAULT NULL,
  `purchaseDate` date NOT NULL,
  `expDate` date DEFAULT NULL,
  PRIMARY KEY (`inventoryID`),
  KEY `inventory_fk_ingredientID` (`ingredientID`),
  KEY `inventory_fk_employeeID` (`employeeID`),
  CONSTRAINT `inventory_fk_employeeID` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `inventory_fk_ingredientID` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`ingredientID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `inventory_chk_1` CHECK ((`quantity` > 0)),
  CONSTRAINT `inventory_chk_2` CHECK ((`totalCost` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,500,100.00,21,'2022-10-01','2022-10-14'),(2,2,100,50.00,22,'2022-10-01','2023-09-30'),(3,3,500,100.00,21,'2022-10-01','2022-10-14'),(4,4,500,100.00,21,'2022-10-01','2022-10-14'),(5,5,500,100.00,21,'2022-10-01','2022-10-14'),(6,6,500,100.00,21,'2022-10-01','2022-10-14'),(7,7,500,100.00,21,'2022-10-01','2022-10-14'),(8,8,500,150.00,23,'2022-10-01','2022-10-14'),(9,9,500,50.00,22,'2022-10-01','2023-09-30'),(10,10,500,150.00,23,'2022-10-01','2022-10-14'),(11,11,500,150.00,23,'2022-10-01','2022-10-14'),(12,12,500,150.00,23,'2022-10-01','2022-10-14'),(13,13,500,150.00,23,'2022-10-01','2022-10-14'),(14,14,100,50.00,22,'2022-10-01','2022-09-30'),(15,15,100,200.00,21,'2022-10-01','2022-10-14'),(16,16,500,100.00,22,'2022-10-01','2022-09-30'),(17,17,500,100.00,22,'2022-10-01','2022-09-30'),(18,18,500,100.00,22,'2022-10-01','2022-09-30'),(19,19,500,100.00,22,'2022-10-01','2022-09-30'),(20,20,500,150.00,23,'2022-10-01','2022-10-14'),(21,21,500,150.00,23,'2022-10-01','2022-10-14'),(22,22,100,200.00,21,'2022-10-01','2022-10-14'),(23,23,100,50.00,22,'2022-10-01','2023-09-30'),(24,24,100,200.00,21,'2022-10-01','2022-10-14'),(25,25,100,200.00,21,'2022-10-01','2022-10-14'),(26,26,500,50.00,22,'2022-10-01','2023-09-30'),(27,27,500,200.00,21,'2022-10-01','2022-10-14'),(28,28,500,150.00,23,'2022-10-01','2022-10-14'),(29,29,100,200.00,21,'2022-10-01','2022-10-14'),(30,30,500,150.00,23,'2022-10-01','2022-10-14'),(31,31,500,150.00,22,'2022-10-01','2022-10-14'),(32,32,500,150.00,23,'2022-10-01','2022-10-14'),(33,33,500,150.00,23,'2022-10-01','2022-10-14'),(54,34,500,150.00,21,'2022-11-16','2022-11-30'),(55,36,100,157.00,27,'2022-11-29','2022-12-30'),(56,36,1,1.00,30,'2022-12-01','2022-12-14');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_ingredient_stock` AFTER INSERT ON `inventory` FOR EACH ROW begin
update ingredient set stock = stock + new.quantity where ingredientID = new.ingredientID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menuID` int NOT NULL AUTO_INCREMENT,
  `categoryID` int NOT NULL,
  `dishName` varchar(64) NOT NULL,
  `dishDescription` varchar(512) DEFAULT NULL,
  `price` decimal(5,2) NOT NULL,
  `dishStatus` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`menuID`),
  KEY `menu_fk_category` (`categoryID`),
  CONSTRAINT `menu_fk_category` FOREIGN KEY (`categoryID`) REFERENCES `menu_category` (`categoryID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `menu_chk_1` CHECK ((`price` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Fried Calamari','Lemon & red sauce',16.50,1),(2,1,'Clams Casino','Broiled cherrystones, crispy topping',17.25,1),(3,1,'Shrimp Scampi','Garlic, lemon, butter, romano',17.50,1),(4,1,'Calamari Scampi','Garlic, lemon, butter, romano',17.50,1),(5,1,'Mussel Siciliano','Fennel, thyme, shallots, lemon, wine',16.00,1),(6,1,'Littleneck Siciliano','Fennel, thyme, shallots, lemon, wine',17.25,1),(7,1,'Caesar Salad','Romaine, croutons, romano',11.00,1),(8,1,'Calamari Salad','Classic marinated calamari served over a bed of greens',16.75,1),(9,1,'House Salad','Greens, tomatoes, cucumbers, carrots, red onion, balsamic viniagrette',9.75,1),(10,1,'Cherrystones','1/2 dozen raw, served with cocktail sauce',14.00,1),(11,1,'Littlenecks','1/2 dozen raw, served with cocktail sauce',14.00,1),(12,2,'Lobster Fra Diavolo','1.25 lb live lobster cut into pieces with littlenecks, mussels, shrimp and calamari simmered in a spicy seafood tomato sauce served over linguine',67.00,1),(13,3,'Aglio Olio','Ground calamari, olive oil, garlic, anchovy',28.00,1),(14,3,'Alfredo','Cream reduction, butter, romano',28.00,1),(15,3,'Puttanesca','Mushrooms, peppers, onions, olive anchovy butter',28.00,1),(16,4,'Monkfish Marsala','Tender medallions of monkfish simmered with mushrooms in a sweet marsala sauce',26.25,1),(17,4,'North End Style Salmon','Pan seared with sundried tomatoes & mushrooms in tomato basil sauce',28.50,1),(18,4,'North End Style Swordfish','Pan seared with sundried tomatoes & mushrooms in tomato basil sauce',30.25,1),(19,5,'Calamari','Signature seafood tomato sauce',26.75,1),(20,5,'Clams','Olive oil, garlic & clam sauce',29.00,1),(21,5,'Calamari & Clams Combo','Signature seafood tomato sauce',29.00,1),(22,5,'Mussel Marinara','Signature seafood tomato sauce',25.50,1),(23,5,'Vongole Neapolitan','Olive oil, garlic & clam sauce',30.00,1),(24,5,'Scallops','Signature seafood tomato sauce',29.75,1),(25,5,'Shrimp','Signature seafood tomato sauce',29.75,1),(26,5,'Shrimp, Scallops & Broccoli','Olive oil, garlic & clam sauce',31.00,1),(27,5,'Frutti Di Mare','Signature seafood tomato sauce',43.00,1),(28,6,'Fish Haddock Chips','Fresh filleted haddock',28.50,1),(29,6,'Fish Monkfish Chips','Fresh filleted monkfish',28.50,1),(30,6,'Fritto Misto','Shrimp, scallops, calamari, fish',36.75,1),(31,7,'Haddock',NULL,25.50,1),(32,7,'Swordfish',NULL,25.50,1),(33,7,'Scallops',NULL,26.50,1),(34,7,'Salmon',NULL,28.50,1),(35,8,'Broccoli Saute',NULL,8.50,1),(36,8,'French Fries',NULL,5.50,1),(37,8,'Linguine',NULL,8.00,1),(38,8,'Black Pasta',NULL,9.50,1),(39,9,'Cheese','10-inch with alfredo sauce',14.00,1),(40,9,'Pepperoni','10-inch with tomato sauce',16.00,1),(41,10,'Orange Juice','Not from concentrate',10.00,1),(42,10,'Apple Juice',NULL,10.00,1),(43,15,'Test Food','This will go to the description',10.00,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_category`
--

DROP TABLE IF EXISTS `menu_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_category` (
  `categoryID` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(64) NOT NULL,
  `categoryDescription` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `categoryName` (`categoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_category`
--

LOCK TABLES `menu_category` WRITE;
/*!40000 ALTER TABLE `menu_category` DISABLE KEYS */;
INSERT INTO `menu_category` VALUES (1,'Starters','Activate your taste buds'),(2,'Lobster Fra Diavolo','Seafood chowder'),(3,'Black Pasta','Fresh homemade black linguine made with squid ink'),(4,'Classics','Served a la carte'),(5,'Seafood & Linguine','Cooked from scratch & served in the pan'),(6,'Fried','Served lightly breaded with fries, onion rings, & tartar'),(7,'Broiled','Crispy topping, olive oil, garlic, romano, breadcrumbs'),(8,'Sides','Extra and more'),(9,'Pizza','Garlic-seasoned crust with a rich, buttery taste'),(10,'Drink','Refreshing taste'),(15,'Other',NULL);
/*!40000 ALTER TABLE `menu_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `menu_for_customer`
--

DROP TABLE IF EXISTS `menu_for_customer`;
/*!50001 DROP VIEW IF EXISTS `menu_for_customer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `menu_for_customer` AS SELECT 
 1 AS `menuID`,
 1 AS `categoryName`,
 1 AS `dishName`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `menu_for_employee`
--

DROP TABLE IF EXISTS `menu_for_employee`;
/*!50001 DROP VIEW IF EXISTS `menu_for_employee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `menu_for_employee` AS SELECT 
 1 AS `menuID`,
 1 AS `categoryName`,
 1 AS `dishName`,
 1 AS `dishDescription`,
 1 AS `price`,
 1 AS `dishStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `order_dish_ingredient`
--

DROP TABLE IF EXISTS `order_dish_ingredient`;
/*!50001 DROP VIEW IF EXISTS `order_dish_ingredient`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_dish_ingredient` AS SELECT 
 1 AS `orderID`,
 1 AS `listID`,
 1 AS `menuID`,
 1 AS `dishQuantity`,
 1 AS `ingredientID`,
 1 AS `ingredientQuantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_list`
--

DROP TABLE IF EXISTS `order_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_list` (
  `orderID` int NOT NULL,
  `listID` int NOT NULL,
  `menuID` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`orderID`,`listID`),
  KEY `list_fk_menu` (`menuID`),
  CONSTRAINT `list_fk_menu` FOREIGN KEY (`menuID`) REFERENCES `menu` (`menuID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `list_fk_order` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `order_list_chk_1` CHECK ((`quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_list`
--

LOCK TABLES `order_list` WRITE;
/*!40000 ALTER TABLE `order_list` DISABLE KEYS */;
INSERT INTO `order_list` VALUES (1,1,19,1),(2,1,31,1),(2,2,36,1),(3,1,39,1),(4,1,31,1),(4,2,36,1),(5,1,13,1),(5,2,14,1),(5,3,24,1),(5,4,19,1),(6,1,22,1),(6,2,26,1),(7,1,13,1),(7,2,14,1),(7,3,24,1),(7,4,19,1),(8,1,1,1),(8,2,15,1),(8,3,17,1),(8,4,25,1),(9,1,40,1),(9,2,34,1),(9,3,30,1),(9,4,16,1),(10,1,2,1),(10,2,12,1),(10,3,18,1),(10,4,20,1),(11,1,9,1),(11,2,21,1),(11,3,26,1),(11,4,29,1),(12,1,28,1),(13,1,2,1),(13,2,20,1),(14,1,27,1),(14,2,30,1),(15,1,30,2),(16,1,30,3),(17,1,1,2),(18,1,29,1),(18,2,32,1),(19,1,14,1),(19,2,18,1),(20,1,21,1),(21,1,38,2),(22,1,16,2),(23,1,16,1),(24,1,24,1),(25,1,43,2),(26,1,27,1),(26,2,33,1),(27,1,43,1),(28,1,23,2),(28,2,6,2),(29,1,15,1),(29,2,42,1),(29,3,10,2),(30,1,15,2),(31,1,36,1),(31,2,24,1),(31,3,40,2),(32,1,23,1),(32,2,25,2),(33,1,25,1),(33,2,38,2),(34,1,15,1),(34,2,4,2),(34,3,10,2),(35,1,16,2),(35,2,28,1),(36,1,26,2),(37,1,21,2),(37,2,26,1),(38,1,23,2),(38,2,31,2),(39,1,10,1),(39,2,29,2),(40,1,34,1),(41,1,41,1),(42,1,25,1),(42,2,20,2),(42,3,2,1),(42,4,4,2),(43,1,22,2),(44,1,17,2),(45,1,24,1),(46,1,35,2),(46,2,30,2),(47,1,18,2),(47,2,2,1),(47,3,29,1),(48,1,8,1),(48,2,10,1),(48,3,32,1),(49,1,36,1),(50,1,11,1),(50,2,32,1),(51,1,23,1),(51,2,18,1),(51,3,16,2),(52,1,18,2),(53,1,6,1),(53,2,36,1),(54,1,39,3),(54,2,28,2),(54,3,26,1),(55,1,24,2),(55,2,14,1),(55,3,43,2),(56,1,19,1),(56,2,23,2),(56,3,28,1),(56,4,3,2),(57,1,36,1),(57,2,3,2),(57,3,41,1),(58,1,8,1),(58,2,26,2),(59,1,7,2),(59,2,36,2),(60,1,19,1),(60,2,21,2),(60,3,41,1),(61,1,24,2),(61,2,2,1),(61,3,3,2),(62,1,37,1),(62,2,22,1),(62,3,18,2),(63,1,11,4),(63,2,33,2),(64,1,33,1),(64,2,39,5),(65,1,9,2),(65,2,17,1),(66,1,10,2),(66,2,1,2),(67,1,27,2),(68,1,29,1),(68,2,4,2),(68,3,34,2),(69,1,8,2),(70,1,30,1),(70,2,8,2),(70,3,1,1),(71,1,38,1),(71,2,2,1),(71,3,15,2),(71,4,34,2),(71,5,21,1),(72,1,41,1),(72,2,24,2),(72,3,36,2),(73,1,39,2),(74,1,22,2),(74,2,11,2),(74,3,37,2),(75,1,34,1),(75,2,25,1),(76,1,39,2),(76,2,20,1),(77,1,12,2),(77,2,41,2),(77,3,8,2),(78,1,11,2),(79,1,11,1),(79,2,43,1),(80,1,20,2),(80,2,42,1),(80,3,37,2),(81,1,8,1),(82,1,32,2),(82,2,40,1),(82,3,9,1),(83,1,17,1),(84,1,25,1),(84,2,40,2),(85,1,26,1),(85,2,8,1),(86,1,12,1),(87,1,32,2),(87,2,43,1),(87,3,13,2),(88,1,22,2),(89,1,30,1),(89,2,4,1),(89,3,23,1),(90,1,15,2),(91,1,33,1),(91,2,20,1),(92,1,38,1),(93,1,25,2),(93,2,10,2),(93,3,8,2),(94,1,1,1),(94,2,35,1),(94,3,12,1),(95,1,34,1),(95,2,12,2),(96,1,22,1),(97,1,18,1),(97,2,12,2),(97,3,39,1),(98,1,2,2),(98,2,14,1),(98,3,26,2),(99,1,13,1),(99,2,15,1),(99,3,21,1),(100,1,35,2),(101,1,38,2),(101,2,5,1),(101,3,4,1);
/*!40000 ALTER TABLE `order_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_queue`
--

DROP TABLE IF EXISTS `order_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_queue` (
  `queueID` int NOT NULL AUTO_INCREMENT,
  `orderID` int NOT NULL,
  `employeeID` int DEFAULT NULL,
  PRIMARY KEY (`queueID`),
  KEY `queue_fk_orders` (`orderID`),
  KEY `queue_fk_employee` (`employeeID`),
  CONSTRAINT `queue_fk_employee` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `queue_fk_orders` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_queue`
--

LOCK TABLES `order_queue` WRITE;
/*!40000 ALTER TABLE `order_queue` DISABLE KEYS */;
INSERT INTO `order_queue` VALUES (1,1,11),(2,2,12),(3,3,13),(4,4,14),(5,5,15),(6,6,16),(7,7,17),(8,8,18),(9,9,19),(10,10,20),(11,11,11),(12,12,12),(24,14,11),(25,16,12),(30,17,13),(31,19,17),(32,20,32),(33,22,17),(34,23,20),(35,15,13),(36,27,15);
/*!40000 ALTER TABLE `order_queue` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_queue_status` AFTER INSERT ON `order_queue` FOR EACH ROW begin
update orders set orderInQueue = true where orderID = NEW.orderID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `subtract_ingredient_stock` AFTER INSERT ON `order_queue` FOR EACH ROW begin
declare orderID_var int;
declare menuID_var int;
declare ingredientID_var int;
declare row_not_found boolean default false;
declare ingredient_cursor cursor for
	select orderID, menuID, ingredientID from order_dish_ingredient where orderID = NEW.orderID;
declare EXIT handler for not found
	set row_not_found = true;
open ingredient_cursor;
while row_not_found = false do
	fetch ingredient_cursor into orderID_var, menuID_var, ingredientID_var;
	update ingredient set stock = calculate_stock(orderID_var, menuID_var, ingredientID_var) where ingredientID = ingredientID_var;
end while;
close ingredient_cursor;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `orderDate` date NOT NULL,
  `orderTime` time NOT NULL,
  `orderStatus` enum('Received','Ready','Canceled') NOT NULL DEFAULT 'Received',
  `orderInQueue` tinyint(1) NOT NULL DEFAULT '0',
  `numOfDish` int NOT NULL,
  `subtotal` decimal(6,2) NOT NULL,
  `tips` decimal(6,2) DEFAULT '0.00',
  `total` decimal(6,2) DEFAULT NULL,
  `customerID` int DEFAULT NULL,
  `tableID` int DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `orders_fk_customer` (`customerID`),
  KEY `orders_fk_table` (`tableID`),
  CONSTRAINT `orders_fk_customer` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orders_fk_table` FOREIGN KEY (`tableID`) REFERENCES `dining_table` (`tableID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `orders_chk_1` CHECK ((`numOfDish` > 0)),
  CONSTRAINT `orders_chk_2` CHECK ((`subtotal` > 0)),
  CONSTRAINT `orders_chk_3` CHECK ((`tips` >= 0)),
  CONSTRAINT `orders_chk_4` CHECK ((`total` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-10-01','12:17:00','Ready',1,1,26.75,0.00,26.75,37,NULL),(2,'2022-10-02','17:32:00','Ready',1,2,31.00,0.00,31.00,38,NULL),(3,'2022-10-03','14:15:00','Ready',1,1,14.00,0.00,14.00,39,NULL),(4,'2022-10-03','12:00:00','Ready',1,2,31.00,5.00,36.00,1,6),(5,'2022-10-03','18:00:00','Ready',1,4,112.50,20.00,132.50,4,16),(6,'2022-10-04','13:00:00','Ready',1,2,56.50,10.00,66.50,5,6),(7,'2022-10-21','18:00:00','Ready',1,4,112.50,20.00,132.50,17,16),(8,'2022-10-21','18:00:00','Ready',1,4,102.75,20.00,122.75,18,17),(9,'2022-10-21','18:00:00','Ready',1,4,107.50,19.00,126.50,19,18),(10,'2022-10-21','18:00:00','Ready',1,4,143.50,30.00,173.50,20,19),(11,'2022-10-21','18:00:00','Ready',1,4,98.25,20.00,118.25,21,20),(12,'2022-10-30','19:00:00','Ready',1,2,28.50,0.00,28.50,40,NULL),(13,'2022-11-13','23:40:32','Canceled',0,2,46.25,0.00,46.25,51,NULL),(14,'2022-11-15','15:40:26','Ready',1,2,79.75,5.00,84.75,51,7),(15,'2022-11-16','01:31:36','Received',1,2,73.50,0.00,73.50,51,NULL),(16,'2022-11-16','01:39:25','Received',1,3,110.25,0.00,110.25,51,NULL),(17,'2022-11-16','01:51:25','Received',1,2,33.00,0.00,33.00,51,NULL),(18,'2022-11-29','14:48:53','Canceled',0,2,54.00,0.00,54.00,52,5),(19,'2022-11-29','14:56:56','Ready',1,2,58.25,1.00,59.25,52,9),(20,'2022-11-30','13:26:13','Received',1,1,29.00,0.00,29.00,51,NULL),(21,'2022-11-30','13:34:21','Received',0,2,19.00,0.00,19.00,51,NULL),(22,'2022-11-30','14:56:55','Ready',1,2,52.50,7.00,59.50,51,NULL),(23,'2022-11-30','15:07:46','Canceled',1,1,26.25,0.00,26.25,52,NULL),(24,'2022-11-30','15:17:27','Canceled',0,1,29.75,0.00,29.75,52,NULL),(25,'2022-11-30','16:57:45','Canceled',0,2,20.00,0.00,20.00,51,NULL),(26,'2022-11-30','17:00:47','Received',0,2,69.50,0.00,69.50,51,12),(27,'2022-11-30','17:19:24','Received',1,1,10.00,0.00,10.00,51,NULL),(28,'2022-12-01','11:08:53','Received',0,4,94.50,0.00,94.50,35,NULL),(29,'2022-12-01','11:08:53','Received',0,4,66.00,0.00,66.00,35,NULL),(30,'2022-12-01','11:08:54','Received',0,2,56.00,0.00,56.00,45,NULL),(31,'2022-12-01','11:12:05','Received',0,4,67.25,0.00,67.25,51,NULL),(32,'2022-12-01','11:12:05','Received',0,3,89.50,0.00,89.50,21,NULL),(33,'2022-12-01','11:12:05','Received',0,3,48.75,0.00,48.75,2,NULL),(34,'2022-12-01','11:12:05','Received',0,5,91.00,0.00,91.00,12,NULL),(35,'2022-12-01','11:12:06','Received',0,3,81.00,0.00,81.00,45,NULL),(36,'2022-12-01','11:12:06','Received',0,2,62.00,0.00,62.00,41,NULL),(37,'2022-12-01','11:12:06','Received',0,3,89.00,0.00,89.00,19,NULL),(38,'2022-12-01','11:12:06','Received',0,4,111.00,0.00,111.00,44,NULL),(39,'2022-12-01','11:12:07','Received',0,3,71.00,0.00,71.00,4,NULL),(40,'2022-12-01','11:12:07','Received',0,1,28.50,0.00,28.50,49,NULL),(41,'2022-12-01','11:12:07','Received',0,1,10.00,0.00,10.00,42,NULL),(42,'2022-12-01','11:12:07','Received',0,6,140.00,0.00,140.00,35,NULL),(43,'2022-12-01','11:12:08','Received',0,2,51.00,0.00,51.00,33,NULL),(44,'2022-12-01','11:12:08','Received',0,2,57.00,0.00,57.00,12,NULL),(45,'2022-12-01','11:12:08','Received',0,1,29.75,0.00,29.75,42,NULL),(46,'2022-12-01','11:12:08','Received',0,4,90.50,0.00,90.50,49,NULL),(47,'2022-12-01','11:12:09','Received',0,4,106.25,0.00,106.25,13,NULL),(48,'2022-12-01','11:12:09','Received',0,3,56.25,0.00,56.25,23,NULL),(49,'2022-12-01','11:15:05','Received',0,1,5.50,0.00,5.50,16,NULL),(50,'2022-12-01','11:15:05','Received',0,2,39.50,0.00,39.50,11,NULL),(51,'2022-12-01','11:15:37','Received',0,4,112.75,0.00,112.75,5,NULL),(52,'2022-12-01','11:15:37','Received',0,2,60.50,0.00,60.50,31,NULL),(53,'2022-12-01','11:15:38','Received',0,2,22.75,0.00,22.75,25,NULL),(54,'2022-12-01','11:15:38','Received',0,6,130.00,0.00,130.00,7,NULL),(55,'2022-12-01','11:15:38','Received',0,5,107.50,0.00,107.50,8,NULL),(56,'2022-12-01','11:15:38','Received',0,6,150.25,0.00,150.25,6,NULL),(57,'2022-12-01','11:15:39','Received',0,4,50.50,0.00,50.50,8,NULL),(58,'2022-12-01','11:15:39','Received',0,3,78.75,0.00,78.75,37,NULL),(59,'2022-12-01','11:15:39','Received',0,4,33.00,0.00,33.00,25,NULL),(60,'2022-12-01','11:18:33','Received',0,4,94.75,0.00,94.75,37,NULL),(61,'2022-12-01','11:18:33','Received',0,5,111.75,0.00,111.75,4,NULL),(62,'2022-12-01','11:18:33','Received',0,4,94.00,0.00,94.00,36,NULL),(63,'2022-12-01','11:18:34','Received',0,6,109.00,0.00,109.00,42,NULL),(64,'2022-12-01','11:18:34','Received',0,6,96.50,0.00,96.50,11,NULL),(65,'2022-12-01','11:18:35','Received',0,3,48.00,0.00,48.00,24,NULL),(66,'2022-12-01','11:18:35','Received',0,4,61.00,0.00,61.00,32,NULL),(67,'2022-12-01','11:18:35','Received',0,2,86.00,0.00,86.00,17,NULL),(68,'2022-12-01','11:18:36','Received',0,5,120.50,0.00,120.50,43,NULL),(69,'2022-12-01','11:18:36','Received',0,2,33.50,0.00,33.50,20,NULL),(70,'2022-12-01','11:18:36','Received',0,4,86.75,0.00,86.75,8,NULL),(71,'2022-12-01','11:18:37','Received',0,7,168.75,0.00,168.75,12,NULL),(72,'2022-12-01','11:18:37','Received',0,5,80.50,0.00,80.50,24,NULL),(73,'2022-12-01','11:18:37','Received',0,2,28.00,0.00,28.00,21,NULL),(74,'2022-12-01','11:18:38','Received',0,6,95.00,0.00,95.00,18,NULL),(75,'2022-12-01','11:18:38','Received',0,2,58.25,0.00,58.25,41,NULL),(76,'2022-12-01','11:18:39','Received',0,3,57.00,0.00,57.00,8,NULL),(77,'2022-12-01','11:18:39','Received',0,6,187.50,0.00,187.50,16,NULL),(78,'2022-12-01','11:18:40','Received',0,2,28.00,0.00,28.00,46,NULL),(79,'2022-12-01','11:18:40','Received',0,2,24.00,0.00,24.00,21,NULL),(80,'2022-12-01','11:18:40','Received',0,5,84.00,0.00,84.00,27,NULL),(81,'2022-12-01','11:18:41','Received',0,1,16.75,0.00,16.75,18,NULL),(82,'2022-12-01','11:18:41','Received',0,4,76.75,0.00,76.75,41,NULL),(83,'2022-12-01','11:18:41','Received',0,1,28.50,0.00,28.50,24,NULL),(84,'2022-12-01','11:18:41','Received',0,3,61.75,0.00,61.75,23,NULL),(85,'2022-12-01','11:18:42','Received',0,2,47.75,0.00,47.75,37,NULL),(86,'2022-12-01','11:18:42','Received',0,1,67.00,0.00,67.00,5,NULL),(87,'2022-12-01','11:19:45','Received',0,5,117.00,0.00,117.00,4,NULL),(88,'2022-12-01','11:19:46','Received',0,2,51.00,0.00,51.00,50,NULL),(89,'2022-12-01','11:19:46','Received',0,3,84.25,0.00,84.25,1,NULL),(90,'2022-12-01','11:19:46','Received',0,2,56.00,0.00,56.00,41,NULL),(91,'2022-12-01','11:19:47','Received',0,2,55.50,0.00,55.50,28,NULL),(92,'2022-12-01','11:19:47','Received',0,1,9.50,0.00,9.50,1,NULL),(93,'2022-12-01','11:19:47','Received',0,6,121.00,0.00,121.00,16,NULL),(94,'2022-12-01','11:19:47','Received',0,3,92.00,0.00,92.00,6,NULL),(95,'2022-12-01','11:19:48','Received',0,3,162.50,0.00,162.50,17,NULL),(96,'2022-12-01','11:19:48','Received',0,1,25.50,0.00,25.50,51,NULL),(97,'2022-12-01','11:19:48','Received',0,4,178.25,0.00,178.25,15,NULL),(98,'2022-12-01','11:19:49','Received',0,5,124.50,0.00,124.50,4,NULL),(99,'2022-12-01','11:19:49','Received',0,3,85.00,0.00,85.00,30,NULL),(100,'2022-12-01','11:19:49','Received',0,2,17.00,3.00,20.00,39,2),(101,'2022-12-01','11:19:50','Received',0,4,52.50,0.00,52.50,37,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservationDate` date NOT NULL,
  `windowID` int NOT NULL,
  `tableID` int NOT NULL,
  `customerID` int DEFAULT NULL,
  `numOfPeople` int NOT NULL,
  `reservationStatus` enum('Reserved','Canceled') NOT NULL DEFAULT 'Reserved',
  `employeeID` int DEFAULT NULL,
  PRIMARY KEY (`reservationDate`,`windowID`,`tableID`),
  KEY `reservation_fk_window` (`windowID`),
  KEY `reservation_fk_table` (`tableID`),
  KEY `reservation_fk_customer` (`customerID`),
  KEY `reservation_fk_employee` (`employeeID`),
  CONSTRAINT `reservation_fk_customer` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `reservation_fk_employee` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `reservation_fk_table` FOREIGN KEY (`tableID`) REFERENCES `dining_table` (`tableID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `reservation_fk_window` FOREIGN KEY (`windowID`) REFERENCES `reservation_window` (`windowID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `reservation_chk_1` CHECK ((`numOfPeople` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('2022-10-03',13,6,1,2,'Reserved',1),('2022-10-03',13,7,2,2,'Canceled',2),('2022-10-03',18,8,3,2,'Canceled',3),('2022-10-03',19,16,4,4,'Reserved',4),('2022-10-04',38,6,5,2,'Reserved',5),('2022-10-04',38,7,6,2,'Canceled',6),('2022-10-04',43,16,7,4,'Canceled',7),('2022-10-04',43,17,8,4,'Canceled',8),('2022-10-12',61,16,9,4,'Canceled',9),('2022-10-12',61,17,10,4,'Canceled',10),('2022-10-12',66,6,11,2,'Canceled',3),('2022-10-12',66,16,12,4,'Canceled',4),('2022-10-13',85,1,13,1,'Canceled',5),('2022-10-13',86,16,14,4,'Canceled',6),('2022-10-13',91,6,15,2,'Canceled',7),('2022-10-13',92,16,16,4,'Canceled',8),('2022-10-21',115,16,17,4,'Reserved',3),('2022-10-21',115,17,18,4,'Reserved',4),('2022-10-21',115,18,19,4,'Reserved',7),('2022-10-21',115,19,20,4,'Reserved',8),('2022-10-21',115,20,21,4,'Reserved',9),('2022-10-22',138,6,22,2,'Canceled',1),('2022-10-22',138,7,23,2,'Canceled',2),('2022-10-30',163,6,24,2,'Canceled',5),('2022-10-30',163,16,51,4,'Reserved',3),('2022-10-30',164,7,25,2,'Canceled',6),('2022-11-18',114,16,51,4,'Canceled',NULL),('2022-11-21',19,16,51,3,'Canceled',3),('2022-11-30',66,16,51,4,'Reserved',3),('2022-11-30',66,17,51,3,'Canceled',NULL),('2022-12-05',18,16,51,3,'Reserved',NULL);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `reservation_history`
--

DROP TABLE IF EXISTS `reservation_history`;
/*!50001 DROP VIEW IF EXISTS `reservation_history`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reservation_history` AS SELECT 
 1 AS `reservationDate`,
 1 AS `startTime`,
 1 AS `tableID`,
 1 AS `customerID`,
 1 AS `customerName`,
 1 AS `numOfPeople`,
 1 AS `reservationStatus`,
 1 AS `waiterID`,
 1 AS `waiterName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reservation_window`
--

DROP TABLE IF EXISTS `reservation_window`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_window` (
  `windowID` int NOT NULL AUTO_INCREMENT,
  `businessDay` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `startTime` time NOT NULL,
  `windowStatus` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`windowID`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_window`
--

LOCK TABLES `reservation_window` WRITE;
/*!40000 ALTER TABLE `reservation_window` DISABLE KEYS */;
INSERT INTO `reservation_window` VALUES (1,'Monday','00:00:00',0),(2,'Monday','01:00:00',0),(3,'Monday','02:00:00',0),(4,'Monday','03:00:00',0),(5,'Monday','04:00:00',0),(6,'Monday','05:00:00',0),(7,'Monday','06:00:00',0),(8,'Monday','07:00:00',0),(9,'Monday','08:00:00',0),(10,'Monday','09:00:00',0),(11,'Monday','10:00:00',0),(12,'Monday','11:00:00',1),(13,'Monday','12:00:00',1),(14,'Monday','13:00:00',1),(15,'Monday','14:00:00',1),(16,'Monday','15:00:00',1),(17,'Monday','16:00:00',1),(18,'Monday','17:00:00',1),(19,'Monday','18:00:00',1),(20,'Monday','19:00:00',1),(21,'Monday','20:00:00',1),(22,'Monday','21:00:00',1),(23,'Monday','22:00:00',1),(24,'Monday','23:00:00',0),(25,'Tuesday','00:00:00',0),(26,'Tuesday','01:00:00',0),(27,'Tuesday','02:00:00',0),(28,'Tuesday','03:00:00',0),(29,'Tuesday','04:00:00',0),(30,'Tuesday','05:00:00',0),(31,'Tuesday','06:00:00',0),(32,'Tuesday','07:00:00',0),(33,'Tuesday','08:00:00',0),(34,'Tuesday','09:00:00',0),(35,'Tuesday','10:00:00',0),(36,'Tuesday','11:00:00',1),(37,'Tuesday','12:00:00',1),(38,'Tuesday','13:00:00',1),(39,'Tuesday','14:00:00',1),(40,'Tuesday','15:00:00',1),(41,'Tuesday','16:00:00',1),(42,'Tuesday','17:00:00',1),(43,'Tuesday','18:00:00',1),(44,'Tuesday','19:00:00',1),(45,'Tuesday','20:00:00',1),(46,'Tuesday','21:00:00',1),(47,'Tuesday','22:00:00',1),(48,'Tuesday','23:00:00',0),(49,'Wednesday','00:00:00',0),(50,'Wednesday','01:00:00',0),(51,'Wednesday','02:00:00',0),(52,'Wednesday','03:00:00',0),(53,'Wednesday','04:00:00',0),(54,'Wednesday','05:00:00',0),(55,'Wednesday','06:00:00',0),(56,'Wednesday','07:00:00',0),(57,'Wednesday','08:00:00',0),(58,'Wednesday','09:00:00',0),(59,'Wednesday','10:00:00',0),(60,'Wednesday','11:00:00',1),(61,'Wednesday','12:00:00',1),(62,'Wednesday','13:00:00',1),(63,'Wednesday','14:00:00',1),(64,'Wednesday','15:00:00',1),(65,'Wednesday','16:00:00',1),(66,'Wednesday','17:00:00',1),(67,'Wednesday','18:00:00',1),(68,'Wednesday','19:00:00',1),(69,'Wednesday','20:00:00',1),(70,'Wednesday','21:00:00',1),(71,'Wednesday','22:00:00',1),(72,'Wednesday','23:00:00',0),(73,'Thursday','00:00:00',0),(74,'Thursday','01:00:00',0),(75,'Thursday','02:00:00',0),(76,'Thursday','03:00:00',0),(77,'Thursday','04:00:00',0),(78,'Thursday','05:00:00',0),(79,'Thursday','06:00:00',0),(80,'Thursday','07:00:00',0),(81,'Thursday','08:00:00',0),(82,'Thursday','09:00:00',0),(83,'Thursday','10:00:00',0),(84,'Thursday','11:00:00',1),(85,'Thursday','12:00:00',1),(86,'Thursday','13:00:00',1),(87,'Thursday','14:00:00',1),(88,'Thursday','15:00:00',1),(89,'Thursday','16:00:00',1),(90,'Thursday','17:00:00',1),(91,'Thursday','18:00:00',1),(92,'Thursday','19:00:00',1),(93,'Thursday','20:00:00',1),(94,'Thursday','21:00:00',1),(95,'Thursday','22:00:00',1),(96,'Thursday','23:00:00',0),(97,'Friday','00:00:00',0),(98,'Friday','01:00:00',0),(99,'Friday','02:00:00',0),(100,'Friday','03:00:00',0),(101,'Friday','04:00:00',0),(102,'Friday','05:00:00',0),(103,'Friday','06:00:00',0),(104,'Friday','07:00:00',0),(105,'Friday','08:00:00',0),(106,'Friday','09:00:00',0),(107,'Friday','10:00:00',0),(108,'Friday','11:00:00',1),(109,'Friday','12:00:00',1),(110,'Friday','13:00:00',1),(111,'Friday','14:00:00',1),(112,'Friday','15:00:00',1),(113,'Friday','16:00:00',1),(114,'Friday','17:00:00',1),(115,'Friday','18:00:00',1),(116,'Friday','19:00:00',1),(117,'Friday','20:00:00',1),(118,'Friday','21:00:00',1),(119,'Friday','22:00:00',1),(120,'Friday','23:00:00',0),(121,'Saturday','00:00:00',0),(122,'Saturday','01:00:00',0),(123,'Saturday','02:00:00',0),(124,'Saturday','03:00:00',0),(125,'Saturday','04:00:00',0),(126,'Saturday','05:00:00',0),(127,'Saturday','06:00:00',0),(128,'Saturday','07:00:00',0),(129,'Saturday','08:00:00',0),(130,'Saturday','09:00:00',0),(131,'Saturday','10:00:00',0),(132,'Saturday','11:00:00',1),(133,'Saturday','12:00:00',1),(134,'Saturday','13:00:00',1),(135,'Saturday','14:00:00',1),(136,'Saturday','15:00:00',1),(137,'Saturday','16:00:00',1),(138,'Saturday','17:00:00',1),(139,'Saturday','18:00:00',1),(140,'Saturday','19:00:00',1),(141,'Saturday','20:00:00',1),(142,'Saturday','21:00:00',1),(143,'Saturday','22:00:00',1),(144,'Saturday','23:00:00',0),(145,'Sunday','00:00:00',0),(146,'Sunday','01:00:00',0),(147,'Sunday','02:00:00',0),(148,'Sunday','03:00:00',0),(149,'Sunday','04:00:00',0),(150,'Sunday','05:00:00',0),(151,'Sunday','06:00:00',0),(152,'Sunday','07:00:00',0),(153,'Sunday','08:00:00',0),(154,'Sunday','09:00:00',0),(155,'Sunday','10:00:00',0),(156,'Sunday','11:00:00',1),(157,'Sunday','12:00:00',1),(158,'Sunday','13:00:00',1),(159,'Sunday','14:00:00',1),(160,'Sunday','15:00:00',1),(161,'Sunday','16:00:00',1),(162,'Sunday','17:00:00',1),(163,'Sunday','18:00:00',1),(164,'Sunday','19:00:00',1),(165,'Sunday','20:00:00',1),(166,'Sunday','21:00:00',1),(167,'Sunday','22:00:00',1),(168,'Sunday','23:00:00',0);
/*!40000 ALTER TABLE `reservation_window` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `waiting_history`
--

DROP TABLE IF EXISTS `waiting_history`;
/*!50001 DROP VIEW IF EXISTS `waiting_history`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `waiting_history` AS SELECT 
 1 AS `waitingID`,
 1 AS `waitingDate`,
 1 AS `startTime`,
 1 AS `customerID`,
 1 AS `customerName`,
 1 AS `numOfPeople`,
 1 AS `waitingStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `waiting_list`
--

DROP TABLE IF EXISTS `waiting_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waiting_list` (
  `waitingID` int NOT NULL AUTO_INCREMENT,
  `waitingDate` date NOT NULL,
  `windowID` int NOT NULL,
  `customerID` int DEFAULT NULL,
  `numOfPeople` int NOT NULL,
  `waitingStatus` enum('Joined','Canceled') NOT NULL DEFAULT 'Joined',
  PRIMARY KEY (`waitingID`),
  KEY `waiting_fk_customer` (`customerID`),
  KEY `waiting_fk_window` (`windowID`),
  CONSTRAINT `waiting_fk_customer` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `waiting_fk_window` FOREIGN KEY (`windowID`) REFERENCES `reservation_window` (`windowID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `waiting_list_chk_1` CHECK ((`numOfPeople` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiting_list`
--

LOCK TABLES `waiting_list` WRITE;
/*!40000 ALTER TABLE `waiting_list` DISABLE KEYS */;
INSERT INTO `waiting_list` VALUES (1,'2022-10-21',115,26,4,'Joined'),(2,'2022-10-21',115,27,4,'Joined'),(3,'2022-10-21',115,28,4,'Joined'),(4,'2022-10-21',115,29,4,'Joined'),(5,'2022-10-21',115,30,4,'Canceled'),(6,'2022-10-21',115,31,4,'Joined'),(7,'2022-10-21',115,32,4,'Joined'),(8,'2022-10-21',115,33,4,'Joined'),(9,'2022-10-21',115,34,4,'Joined'),(10,'2022-10-21',115,35,4,'Joined'),(11,'2022-10-21',115,36,4,'Canceled'),(12,'2022-11-12',138,51,2,'Canceled'),(13,'2022-11-30',67,51,3,'Joined'),(14,'2022-09-14',68,51,2,'Joined');
/*!40000 ALTER TABLE `waiting_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'restaurant'
--

--
-- Dumping routines for database 'restaurant'
--
/*!50003 DROP FUNCTION IF EXISTS `calculate_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_stock`(orderID_var int, menuID_var int, ingredientID_var int) RETURNS int
    READS SQL DATA
begin
declare new_stock int;
select check_stock(ingredientID_var) - dishQuantity * ingredientQuantity into new_stock
from order_dish_ingredient where orderID = orderID_var and menuID = menuID_var and ingredientID = ingredientID_var;
return new_stock;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calculate_total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_total`(orderID_var int) RETURNS decimal(6,2)
    READS SQL DATA
begin
declare new_total decimal(6,2);
select subtotal + tips into new_total from orders where orderID = orderID_var;
return new_total;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_order_in_queue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_order_in_queue`(orderID_var int) RETURNS tinyint(1)
    READS SQL DATA
begin
declare queueStatus boolean;
select orderInQueue into queueStatus from orders where orderID = orderID_var;
return queueStatus;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_stock`(ingredientID_var int) RETURNS int
    READS SQL DATA
begin
declare old_stock int;
select stock into old_stock from ingredient where ingredientID = ingredientID_var;
return old_stock;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `convert_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `convert_date`(date_var date) RETURNS varchar(64) CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
begin 
declare weekday_var varchar(64);
declare num int;
set num = DAYOFWEEK(date_var);
if num = 1 then
	set weekday_var = 'Sunday';
elseif num = 2 then
	set weekday_var = 'Monday';
elseif num = 3 then
	set weekday_var = 'Tuesday';
elseif num = 4 then
	set weekday_var = 'Wednesday';
elseif num = 5 then
	set weekday_var = 'Thursday';
elseif num = 6 then
	set weekday_var = 'Friday';
else
	set weekday_var = 'Saturday';
end if;
return weekday_var;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `find_day` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `find_day`(timeID_var int) RETURNS varchar(64) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
begin
declare day_var varchar(64);
select businessDay into day_var from business_hour where timeID = timeID_var;
return day_var;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `find_ingredient_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `find_ingredient_id`(ingredientName_var varchar(64)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
begin
declare ingredientID_var int;
select ingredientID into ingredientID_var from ingredient where ingredientName = ingredientName_var;
return ingredientID_var;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_business_hour` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_business_hour`(in businessDay_var varchar(64), in openTime_var time, in closeTime_var time)
begin
insert into business_hour (businessDay, openTime, closeTime, dayStatus)
values (businessDay_var, openTime_var, closeTime_var, false);
select 'Saved.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_dish_has_ingredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_dish_has_ingredient`(in dishName_var varchar(64), in ingredientName_var varchar(64), in quantity_var int)
begin
declare name_not_exist boolean default false;
declare CONTINUE handler for 1048
	set name_not_exist = true;
insert into dish_has_ingredient (menuID, ingredientID, quantity) 
values ((select menuID from menu where dishName = dishName_var), 
		(select ingredientID from ingredient where ingredientName = ingredientName_var), 
		quantity_var);
if name_not_exist = true then
	select 'Error: The food name does not exist.' as message;
else
	select 'Saved.' as message;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_employee`(in firstName_var varchar(64), in lastName_var varchar(64), in email_var varchar(64), in phone_var varchar(64), in ssn_var varchar(64), in salary_var varchar(64), in occupation_var varchar(64))
begin
insert into employee (firstName, lastName, email, phone, ssn, salary, occupation, rating)
values (firstName_var, lastName_var, email_var, phone_var, ssn_var, salary_var, occupation_var, '5');
select "Saved." as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_inventory`(in ingredientName_var varchar(64), in quantity_var int, in totalCost_var decimal(6,2), in employeeID_var int, in purchaseDate_var date, in expDate_var date)
begin
declare name_not_exist boolean default false;
declare CONTINUE handler for 1048
	set name_not_exist = true;
insert into inventory (ingredientID, quantity, totalCost, employeeID, purchaseDate, expDate)
values (find_ingredient_id(ingredientName_var), quantity_var, totalCost_var, employeeID_var, purchaseDate_var, expDate_var);
if name_not_exist = true then
	select 'Error: The ingredient name does not exist.' as message;
else
	select 'Saved.' as message;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_new_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_category`(in categoryName_var varchar(64))
begin
declare duplicate_name boolean default false;
declare CONTINUE handler for 1062
	set duplicate_name = true;
insert into menu_category (categoryName) values (categoryName_var);
if duplicate_name = true then
	select 'Error: This category name already exists.' as message;
else
	select 'Saved.' as message;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_new_dish` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_dish`(in categoryName_var varchar(64), in dishName_var varchar(64), in price_var decimal(5,2))
begin
declare category_name_not_exist boolean default false;
declare CONTINUE handler for 1048
	set category_name_not_exist = true;
insert into menu (categoryID, dishName, price, dishStatus) 
values ((select categoryID from menu_category where categoryName = categoryName_var), dishName_var, price_var, true);
if category_name_not_exist = true then
	select 'Error: This category name does not exist.' as message;
else
	select 'Saved.' as message;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_new_ingredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_ingredient`(in ingredientName_var varchar(64))
begin
declare duplicate_name boolean default false;
declare CONTINUE handler for 1062
	set duplicate_name = true;
insert into ingredient (ingredientName) values (ingredientName_var);
if duplicate_name = true then
	select 'Error: This ingredient already exists.' as message;
else
	select 'Saved.' as message;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_table`(in capacity_var int)
begin
insert into dining_table (capacity, tableStatus)
values (capacity_var, true);
select 'Saved.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assign_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assign_table`(in orderID_var int, in tableID_var int)
begin
update orders set tableID = tableID_var where orderID = orderID_var;
select 'Saved.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assign_waiter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assign_waiter`(in date_var date, in time_var time, in tableID_var int, in employeeID_var int)
begin
declare windowID_var int;
select windowID into windowID_var from reservation_window where businessDay = convert_date(date_var) and startTime = time_var;
update reservation set employeeID = employeeID_var where reservationDate = date_var and windowID = windowID_var and tableID = tableID_var;
select 'Saved.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cancel_reservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancel_reservation`(in date_var date, in time_var time, in tableID_var int)
begin
declare windowID_var int;
select windowID into windowID_var from reservation_window where businessDay = convert_date(date_var) and startTime = time_var;
update reservation set reservationStatus = 'Canceled' where reservationDate = date_var and windowID = windowID_var and tableID = tableID_var;
select 'Canceled.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cancel_waiting_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancel_waiting_list`(in waitingID_var int)
begin
update waiting_list set waitingStatus = 'Canceled' where waitingID = waitingID_var;
select 'Canceled.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `change_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `change_password`(in customerID_var int, in password_var varchar(64))
begin
update customer set customerPassword = password_var where customerID = customerID_var;
select 'Saved.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `change_phone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `change_phone`(in customerID_var int, in phone_var varchar(64))
begin
update customer set phone = phone_var where customerID = customerID_var;
select 'Saved.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_order`(in customerID_var int, in numOfDish_var int, in subtotal_var decimal(6,2))
begin
declare currentDate_var date;
declare currentTime_var time;
declare businessDay_var varchar(64);
declare openTime_var time;
declare closeTime_var time;
set currentDate_var = current_date();
set currentTime_var = current_time();
set businessDay_var = convert_date(currentDate_var);
select openTime, closeTime into openTime_var, closeTime_var from business_hour where businessDay = businessDay_var and dayStatus = true;
if openTime_var < currentTime_var and currentTime_var < closeTime_var then
	insert into orders (orderDate, orderTime, orderStatus, orderInQueue, numOfDish, subtotal, tips, total, customerID)
	values
	(currentDate_var, currentTime_var, "Received", false, numOfDish_var, subtotal_var, 0, subtotal_var, customerID_var);
	select max(orderID) from orders where customerID = customerID_var;
else
	select 'error' as message;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_order_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_order_list`(in orderID_var int, in listID_var int, in menuID_var int, in quantity_var int)
begin
insert into order_list (orderID, listID, menuID, quantity)
values
(orderID_var, listID_var, menuID_var, quantity_var);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_order_queue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_order_queue`(in orderID_var int, in employeeID_var int)
begin
declare order_status_var varchar(64);
select orderStatus into order_status_var from orders where orderID = orderID_var;
if order_status_var = 'Canceled' then
	select 'The order is canceled.' as message;
else
	insert into order_queue (orderID, employeeID)
	values (orderID_var, employeeID_var);
	select 'Saved.' as message;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_view_menu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_view_menu`()
begin
select * from menu_for_customer;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_view_one_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_view_one_order`(in orderID_var int)
begin
select orderID, orderDate, orderStatus, numOfDish, subtotal, tips, total
from orders
where orderID = orderID_var
order by orderID ASC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_view_order_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_view_order_history`(in customerID_var int)
begin
select orderID, orderDate, orderStatus, numOfDish, subtotal, tips, total
from orders
where customerID = customerID_var
order by orderID DESC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_account`(in customerID_var int)
begin
delete from customer where customerID = customerID_var;
select 'Saved.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_employee`(in employeeID_var int)
begin
delete from employee where employeeID = employeeID_var;
select 'Saved.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `employee_view_menu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_view_menu`()
begin
select * from menu_for_employee;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `employee_view_one_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_view_one_order`(in orderID_var int)
begin
select orderID, orderDate, convert(orderTime, char(8)), orderStatus, orderInQueue, numOfDish, subtotal, tips, total, customerID, convert(tableID, char(2))
from orders
where orderID = orderID_var
order by orderID ASC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `employee_view_order_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_view_order_history`()
begin
select orderID, orderDate, convert(orderTime, char(8)), orderStatus, orderInQueue, numOfDish, subtotal, tips, total, customerID, convert(tableID, char(2))
from orders
order by orderID DESC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `freq_ingredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `freq_ingredient`()
begin
select dhi.ingredientID, i.ingredientName, count(dhi.ingredientID) as freq
from dish_has_ingredient as dhi
natural join ingredient as i
group by dhi.ingredientID, i.ingredientName
order by freq DESC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_dish_name_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_dish_name_price`(in menuID_var int)
begin
select dishName, price
from menu where menuID = menuID_var;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `join_waiting_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `join_waiting_list`(in date_var date, in time_var time, in num_of_people_var int, in customerID_var int)
begin
declare windowID_var int;
select windowID into windowID_var from reservation_window where businessDay = convert_date(date_var) and startTime = time_var and windowStatus = true;
if windowID_var is null then
	select 'Error: Please input a valid dining window (max people of 4).' as message;
else
	insert into waiting_list (waitingDate, windowID, customerID, numOfPeople, waitingStatus)
	values (date_var, windowID_var, customerID_var, num_of_people_var, 'Joined');
	select 'Joined.' as message;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `popular_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `popular_category`()
begin
select mc.categoryID, mc.categoryName, count(categoryID) as freq
from menu_category as mc
natural join menu as m
natural join order_list
group by mc.categoryID, mc.categoryName
order by freq DESC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `popular_dish` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `popular_dish`()
begin
select m.menuID, m.dishName, count(m.menuID) as freq
from order_list
natural join menu as m
group by m.menuID, m.dishName 
order by freq DESC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rate_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rate_employee`(in employeeID_var int, in rating_var varchar(64))
begin
update employee set rating = rating_var
where employeeID = employeeID_var;
select "Saved." as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reserve_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reserve_table`(in date_var date, in time_var time, in num_of_people_var int, in customerID_var int)
begin
declare tableID_var int;
declare windowID_var int;
select windowID into windowID_var from reservation_window where businessDay = convert_date(date_var) and startTime = time_var and windowStatus = true;
if windowID_var is null then
	select 'Error: Please input a valid dining window (max people of 4).' as message;
else
	select tableID into tableID_var from dining_table where tableID 
		not in (select tableID from reservation where reservationDate = date_var and windowID = windowID_var and reservationStatus = 'Reserved')
        and capacity >= num_of_people_var and tableStatus = true
        limit 1;
	if tableID_var is null then
		select 'Error: No more available tables.' as message;
	else
		insert into reservation (reservationDate, windowID, tableID, customerID, numOfPeople, reservationStatus)
        values (date_var, windowID_var, tableID_var, customerID_var, num_of_people_var, 'Reserved');
        select 'Reserved.' as message;
    end if;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sign_in` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sign_in`(in email_var varchar(64), in password_var varchar(64))
begin
select * from customer where email = email_var and customerPassword = password_var;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sign_up` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sign_up`(in firstName_var varchar(64), in lastName_var varchar(64), in email_var varchar(64), in phone_var varchar(64), in password_var varchar(64))
begin
insert into customer (firstName, lastName, email, phone, customerPassword)
values (firstName_var, lastName_var, email_var, phone_var, password_var);
-- get new user id
select customerID from customer where email = email_var;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_business_hour` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_business_hour`(in timeID_var int, in dayStatus_var boolean)
begin
declare businessDay_var varchar(64);
declare openTime_var time;
declare closeTime_var time;
select businessDay, openTime, closeTime into businessDay_var, openTime_var, closeTime_var from business_hour where timeID = timeID_var;
update business_hour set dayStatus = dayStatus_var where timeID = timeID_var;
if dayStatus_var = true then
	update business_hour set dayStatus = false where timeID != timeID_var and businessDay = find_day(timeID_var);
    -- update the reservation window
    update reservation_window set windowStatus = false where 0 < windowID and businessDay = businessDay_var;
    update reservation_window set windowStatus = true where 0 < windowID and openTime_var <= startTime and startTime <= closeTime_var;
else
	update reservation_window set windowStatus = false where 0 < windowID and businessDay = businessDay_var;
end if; 
select 'Saved.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_dish_description` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_dish_description`(in menuID_var int, in description_var varchar(512))
begin
update menu set dishDescription = description_var where menuID = menuID_var;
select 'Saved.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_dish_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_dish_price`(in menuID_var int, in price_var boolean)
begin
update menu set price = price_var where menuID = menuID_var;
select 'Saved.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_dish_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_dish_status`(in menuID_var int, in dishStatus_var boolean)
begin
update menu set dishStatus = dishStatus_var where menuID = menuID_var;
select 'Saved.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_order_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_order_status`(in orderID_var int, in status_var varchar(64))
begin
if status_var = 'Ready' then
	if check_order_in_queue(orderID_var) = true then
		update orders set orderStatus = status_var where orderID = orderID_var;
		select 'Saved.' as message;
    else
		select 'The order is not in the chef queue.' as message;
	end if;
elseif status_var = 'Canceled' then
	if check_order_in_queue(orderID_var) = false then
		update orders set orderStatus = status_var where orderID = orderID_var;
		select 'Saved.' as message;
	else
		select 'The order is already in the queue and cannot be canceled.' as message;
	end if;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_salary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_salary`(in employeeID_var int, in salary_var decimal(9,2))
begin
update employee set salary = salary_var
where employeeID = employeeID_var;
select "Saved." as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_table`(in tableID_var int, in tableStatus_var boolean)
begin
update dining_table set tableStatus = tableStatus_var
where tableID = tableID_var;
select 'Saved.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_tips` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_tips`(in orderID_var int, in tips_var decimal(6,2))
begin
update orders set tips = tips_var where orderID = orderID_var;
update orders set total = calculate_total(orderID_var) where orderID = orderID_var;
select 'Saved.' as message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_all_business_hours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_all_business_hours`()
begin
select timeID, businessDay, convert(openTime, char(5)) as openTime, convert(CloseTime, char(5)) as closeTime, dayStatus
from business_hour;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_all_reservations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_all_reservations`()
begin
select * from reservation_history;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_all_tables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_all_tables`()
begin
select * from dining_table;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_all_waiting_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_all_waiting_list`()
begin
select * from waiting_history;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_business_hour` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_business_hour`()
begin
select businessDay, convert(openTime, char(5)) as openTime, convert(CloseTime, char(5)) as closeTime
from business_hour where dayStatus = true
order by businessDay ASC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_dish_ingredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_dish_ingredient`(in menuID_var int)
begin
select i.ingredientID, i.ingredientName, dhi.quantity
from ingredient as i
join dish_has_ingredient as dhi
on i.ingredientID = dhi.ingredientID
where dhi.menuID = menuID_var;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_employee`(in occupation_var varchar(64), in filter_var boolean)
begin
select employeeID, concat(firstName, ' ', lastName) as ename, email, phone, ssn, salary, occupation, rating
from employee
where filter_var or (occupation = occupation_var);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_ingredient_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_ingredient_stock`()
begin
select * from ingredient;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_inventory`()
begin
select * from ingredient_inventory
order by inventoryID ASC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_order_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_order_detail`(in orderID_var int)
begin
select ol.menuID, m.dishName, ol.quantity, m.price, ol.quantity*m.price as subtotal
from order_list as ol
natural join menu as m
where ol.orderID = orderID_var;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_queue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_queue`()
begin
select * from chef_cooking_queue;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_reservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_reservation`(in customerID_var int)
begin
select rh.reservationDate, rh.startTime, rh.tableID, rh.numOfPeople, rh.reservationStatus
from reservation_history as rh
where customerID = customerID_var
order by rh.reservationDate DESC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_waiting_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_waiting_list`(in customerID_var int)
begin
select waitingID, waitingDate, startTime, numOfPeople, waitingStatus
from waiting_history
where customerID = customerID_var;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `chef_cooking_queue`
--

/*!50001 DROP VIEW IF EXISTS `chef_cooking_queue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `chef_cooking_queue` AS select `oq`.`queueID` AS `queueID`,`oq`.`orderID` AS `orderID`,cast(`o`.`orderTime` as char(8) charset utf8mb4) AS `orderTime`,`oq`.`employeeID` AS `employeeID`,concat(`e`.`firstName`,' ',`e`.`lastName`) AS `chefName`,`o`.`orderStatus` AS `orderStatus` from ((`order_queue` `oq` join `employee` `e` on((`oq`.`employeeID` = `e`.`employeeID`))) join `orders` `o` on((`oq`.`orderID` = `o`.`orderID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ingredient_inventory`
--

/*!50001 DROP VIEW IF EXISTS `ingredient_inventory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ingredient_inventory` AS select `inv`.`inventoryID` AS `inventoryID`,`ing`.`ingredientName` AS `ingredientName`,`inv`.`quantity` AS `quantity`,`inv`.`totalCost` AS `totalCost`,`e`.`employeeID` AS `employeeID`,concat(`e`.`firstName`,' ',`e`.`lastName`) AS `employeeName`,`inv`.`purchaseDate` AS `purchaseDate`,`inv`.`expDate` AS `expDate` from ((`inventory` `inv` join `ingredient` `ing` on((`inv`.`ingredientID` = `ing`.`ingredientID`))) join `employee` `e` on((`inv`.`employeeID` = `e`.`employeeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `menu_for_customer`
--

/*!50001 DROP VIEW IF EXISTS `menu_for_customer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `menu_for_customer` AS select `menu`.`menuID` AS `menuID`,`menu_category`.`categoryName` AS `categoryName`,`menu`.`dishName` AS `dishName`,`menu`.`price` AS `price` from (`menu` join `menu_category` on((`menu`.`categoryID` = `menu_category`.`categoryID`))) where ((0 <> `menu`.`dishStatus`) is true) order by `menu`.`menuID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `menu_for_employee`
--

/*!50001 DROP VIEW IF EXISTS `menu_for_employee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `menu_for_employee` AS select `m`.`menuID` AS `menuID`,`mc`.`categoryName` AS `categoryName`,`m`.`dishName` AS `dishName`,`m`.`dishDescription` AS `dishDescription`,`m`.`price` AS `price`,`m`.`dishStatus` AS `dishStatus` from (`menu` `m` join `menu_category` `mc` on((`m`.`categoryID` = `mc`.`categoryID`))) order by `m`.`menuID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_dish_ingredient`
--

/*!50001 DROP VIEW IF EXISTS `order_dish_ingredient`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_dish_ingredient` AS select `ol`.`orderID` AS `orderID`,`ol`.`listID` AS `listID`,`ol`.`menuID` AS `menuID`,`ol`.`quantity` AS `dishQuantity`,`dhi`.`ingredientID` AS `ingredientID`,`dhi`.`quantity` AS `ingredientQuantity` from (`order_list` `ol` join `dish_has_ingredient` `dhi` on((`ol`.`menuID` = `dhi`.`menuID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reservation_history`
--

/*!50001 DROP VIEW IF EXISTS `reservation_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reservation_history` AS select `r`.`reservationDate` AS `reservationDate`,cast(`rw`.`startTime` as char(5) charset utf8mb4) AS `startTime`,`r`.`tableID` AS `tableID`,`r`.`customerID` AS `customerID`,concat(`c`.`firstName`,' ',`c`.`lastName`) AS `customerName`,`r`.`numOfPeople` AS `numOfPeople`,`r`.`reservationStatus` AS `reservationStatus`,cast(`r`.`employeeID` as char(2) charset utf8mb4) AS `waiterID`,concat(`e`.`firstName`,' ',`e`.`lastName`) AS `waiterName` from (((`reservation` `r` join `reservation_window` `rw` on((`r`.`windowID` = `rw`.`windowID`))) join `customer` `c` on((`r`.`customerID` = `c`.`customerID`))) left join `employee` `e` on((`r`.`employeeID` = `e`.`employeeID`))) order by `r`.`reservationDate` desc,cast(`rw`.`startTime` as char(5) charset utf8mb4) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `waiting_history`
--

/*!50001 DROP VIEW IF EXISTS `waiting_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `waiting_history` AS select `wl`.`waitingID` AS `waitingID`,`wl`.`waitingDate` AS `waitingDate`,cast(`rw`.`startTime` as char(5) charset utf8mb4) AS `startTime`,`wl`.`customerID` AS `customerID`,concat(`c`.`firstName`,' ',`c`.`lastName`) AS `customerName`,`wl`.`numOfPeople` AS `numOfPeople`,`wl`.`waitingStatus` AS `waitingStatus` from ((`waiting_list` `wl` join `reservation_window` `rw` on((`wl`.`windowID` = `rw`.`windowID`))) join `customer` `c` on((`wl`.`customerID` = `c`.`customerID`))) order by `wl`.`waitingDate` desc,cast(`rw`.`startTime` as char(5) charset utf8mb4) desc */;
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

-- Dump completed on 2022-12-04 10:11:56
