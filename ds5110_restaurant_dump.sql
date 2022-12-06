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
INSERT INTO `business_hour` VALUES (1,'Monday','11:00:00','20:00:00',0),(2,'Tuesday','11:00:00','20:00:00',1),(3,'Wednesday','11:00:00','20:00:00',1),(4,'Thursday','11:00:00','20:00:00',1),(5,'Friday','11:00:00','20:00:00',1),(6,'Saturday','11:00:00','20:00:00',1),(7,'Sunday','11:00:00','20:00:00',1),(8,'Monday','11:00:00','22:00:00',0),(9,'Tuesday','11:00:00','22:00:00',0),(10,'Wednesday','11:00:00','22:00:00',0),(11,'Thursday','11:00:00','22:00:00',0),(12,'Friday','11:00:00','22:00:00',0),(13,'Saturday','11:00:00','22:00:00',0),(14,'Sunday','11:00:00','22:00:00',0),(15,'Monday','12:00:00','22:00:00',0),(16,'Tuesday','12:00:00','22:00:00',0),(17,'Wednesday','12:00:00','22:00:00',0),(18,'Thursday','12:00:00','22:00:00',0),(19,'Friday','12:00:00','22:00:00',0),(20,'Saturday','12:00:00','22:00:00',0),(21,'Sunday','12:00:00','22:00:00',0),(22,'Monday','11:00:00','23:30:00',1);
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
  `customerID` int NOT NULL,
  `firstName` varchar(64) NOT NULL,
  `lastName` varchar(64) NOT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `customerPassword` varchar(64) NOT NULL,
  PRIMARY KEY (`customerID`),
  CONSTRAINT `cstomer_fk_cusotmer_email` FOREIGN KEY (`customerID`) REFERENCES `customer_email` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Joseph','Carter','(521)898-4758','3#)!O0WZLg'),(2,'George','Green','(926)440-5474','qZZe14Ap!W'),(3,'Benjamin','Hardin','(675)314-7341','cv#8QbpU&B'),(4,'James','Delacruz','(172)443-5148','W30oBwJ%_)'),(5,'Ashley','Morris','(320)824-8276','K#!!3Gzio8'),(6,'Joel','Reed','(723)303-6661','k_r2KmJuFx'),(7,'April','Serrano','(985)778-6923','g_6JjICawu'),(8,'Debra','Meyer','(225)866-9361','))I1FzOiVY'),(9,'Amanda','Sanchez','(278)662-6820','j7KFJMd&%v'),(10,'Bethany','Lopez','(983)825-3437','_)4xLsevo&'),(11,'James','Mathews','(792)278-0210','48Pp8QwnL@'),(12,'Jennifer','Smith','(831)472-9937','*3kmm*Se0x'),(13,'Catherine','Nelson','(279)737-5928','13DZZbDG(K'),(14,'Robert','Williams','(986)149-2581','+DUNxYuwt6'),(15,'Maria','Jenkins','(178)936-6048','(e1bJxil57'),(16,'James','Stewart','(733)625-0386','*f+9CxiE@e'),(17,'Joshua','Henderson','(906)657-4216','s@Y6OcpnCi'),(18,'Michelle','Grant','(187)859-0508','a_4D0J4dKa'),(19,'David','Pierce','(272)420-4572','%aNM*xJVd0'),(20,'Tami','Perez','(978)645-3392','4mx#ANUd&7'),(21,'Michael','Rodriguez','(116)356-9790','%4cH&nK*4t'),(22,'Randall','Livingston','(377)262-9166','*_2N1j*sM('),(23,'Tina','Powell','(495)700-4738','5d!6JuYMsk'),(24,'Catherine','Pena','(515)876-1170','@7VoZNVpCt'),(25,'Tyler','Taylor','(789)228-6215','CR6OBxo!z!'),(26,'Gerald','Carr','(400)064-3117','VpVUa9_I%1'),(27,'James','King','(226)014-1097',')71wS1ef($'),(28,'Luis','Smith','(343)979-2416',')1GW+Ofw%s'),(29,'Kayla','Henderson','(370)438-8891','o+0xXIMfs9'),(30,'Aaron','Oliver','(182)922-2970','58p)ImN3+g'),(31,'Rebecca','Perez','(793)929-9788','^)35Wvk85i'),(32,'Gina','Kerr','(901)858-6871','+M2xVTm*C@'),(33,'Shannon','James','(713)804-0269','Y^7V0U3Oln'),(34,'Robert','Washington','(144)439-2900','*2*Kr$Lj$d'),(35,'Gary','Roberts','(958)402-4285','$dS1Nz#zT5'),(36,'Alexis','Rodriguez','(186)828-1262','*4j9)MQtyO'),(37,'Christopher','Williams','(757)636-3790','+HvDIv4p(7'),(38,'Paul','Gray','(547)982-7714','yx1P9a#hp%'),(39,'Thomas','Rivera','(591)807-2376','v2O7R*ma)V'),(40,'Gloria','Moore','(968)209-9945','c!(2)vOb(4'),(41,'Mrs.','Elizabeth','(724)463-0424','@A&9BmoO8R'),(42,'Kevin','Le','(137)987-8200','F%5ihaXuAa'),(43,'Amy','Lane','(948)728-5281','!B6TwAZqjg'),(44,'Valerie','Rojas','(796)872-0074','1+Tk9Dom*8'),(45,'Samantha','Mitchell','(654)646-6425','#2x0XzR7y*'),(46,'Wanda','Hernandez','(625)592-5550','X_O2UwvEMU'),(47,'Eric','Gonzalez','(634)376-5721','0g_$4TJfhS'),(48,'Matthew','Baker','(877)460-3700','(yK#!Z*oX7'),(49,'Bryan','Cowan','(241)329-3198','@c1LpTIv0y'),(50,'Erin','Thomas','(395)208-3182','z3KI@jP%*Q'),(53,'Bowen','Xu','(612)345-6789','123456');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_email`
--

DROP TABLE IF EXISTS `customer_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_email` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_email`
--

LOCK TABLES `customer_email` WRITE;
/*!40000 ALTER TABLE `customer_email` DISABLE KEYS */;
INSERT INTO `customer_email` VALUES (12,'alvarezcheryl@gmail.com'),(34,'andrew93@gmail.com'),(50,'billywilliams@gmail.com'),(15,'brad95@gmail.com'),(24,'brandon42@gmail.com'),(33,'brian72@gmail.com'),(8,'caseylisa@gmail.com'),(44,'cheryl94@gmail.com'),(46,'christine08@gmail.com'),(45,'cookthomas@gmail.com'),(23,'cward@gmail.com'),(29,'cynthia39@gmail.com'),(19,'danielstephanie@gmail.com'),(48,'david11@gmail.com'),(42,'davidwhite@gmail.com'),(3,'debra39@gmail.com'),(1,'ekim@gmail.com'),(14,'hardingkelsey@gmail.com'),(16,'hodgesjason@gmail.com'),(10,'ichavez@gmail.com'),(11,'jason88@gmail.com'),(28,'jennifer16@gmail.com'),(27,'johnsonjeffrey@gmail.com'),(35,'jonescrystal@gmail.com'),(41,'julieodom@gmail.com'),(21,'kellismith@gmail.com'),(31,'kimberlyjordan@gmail.com'),(43,'lhull@gmail.com'),(37,'lopezjessica@gmail.com'),(7,'macdonaldbrandi@gmail.com'),(9,'mary33@gmail.com'),(17,'maynardmichael@gmail.com'),(2,'melissa97@gmail.com'),(38,'michael10@gmail.com'),(36,'michaelramos@gmail.com'),(22,'nathan04@gmail.com'),(49,'noah51@gmail.com'),(39,'pamelamontgomery@gmail.com'),(4,'paula26@gmail.com'),(47,'pchambers@gmail.com'),(30,'pprice@gmail.com'),(26,'rodriguezmargaret@gmail.com'),(40,'rvaldez@gmail.com'),(20,'sabrina88@gmail.com'),(6,'simonandrew@gmail.com'),(25,'tfox@gmail.com'),(13,'timothy80@gmail.com'),(5,'vanessasimmons@gmail.com'),(32,'wkennedy@gmail.com'),(18,'woodardmadison@gmail.com'),(53,'xu.bowen@neu.edu');
/*!40000 ALTER TABLE `customer_email` ENABLE KEYS */;
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
INSERT INTO `dining_table` VALUES (1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,2,1),(7,2,1),(8,2,1),(9,2,1),(10,2,1),(11,2,1),(12,2,1),(13,2,1),(14,2,1),(15,2,1),(16,4,1),(17,4,1),(18,4,1),(19,4,1),(20,4,1),(21,3,0);
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
INSERT INTO `dish_has_ingredient` VALUES (1,1,10),(1,2,1),(2,3,10),(3,4,5),(3,5,5),(4,1,5),(4,5,5),(5,6,10),(6,7,10),(7,8,10),(7,9,5),(8,1,5),(8,8,10),(9,8,5),(9,10,1),(9,11,1),(9,12,1),(9,13,1),(10,3,6),(10,14,1),(11,7,6),(11,14,6),(12,1,5),(12,4,5),(12,6,5),(12,7,5),(12,15,1),(12,16,1),(12,17,1),(13,1,5),(13,18,1),(14,18,1),(14,19,1),(15,13,1),(15,18,1),(15,20,2),(15,21,1),(16,20,2),(16,22,1),(16,23,1),(17,10,1),(17,16,1),(17,20,2),(17,24,1),(18,10,1),(18,16,1),(18,20,2),(18,25,1),(19,1,5),(19,16,1),(19,17,1),(20,3,5),(20,17,1),(20,26,1),(21,1,3),(21,3,3),(21,16,1),(21,17,1),(22,6,5),(22,16,1),(22,17,1),(23,3,5),(23,17,1),(23,26,1),(24,16,1),(24,17,1),(24,27,5),(25,4,5),(25,16,1),(25,17,1),(26,4,5),(26,17,1),(26,26,1),(26,27,5),(26,28,5),(27,1,2),(27,3,2),(27,4,2),(27,5,2),(27,6,2),(27,7,2),(27,16,1),(27,17,1),(27,27,2),(28,29,1),(29,22,1),(30,1,5),(30,4,5),(30,27,5),(31,29,1),(32,25,1),(33,27,15),(34,24,1),(35,28,5),(36,30,2),(37,17,1),(38,18,1),(39,19,1),(39,31,1),(40,16,1),(40,32,10),(41,33,3),(42,34,1),(43,34,1),(43,35,2);
/*!40000 ALTER TABLE `dish_has_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeID` int NOT NULL,
  `firstName` varchar(64) NOT NULL,
  `lastName` varchar(64) NOT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `ssn` char(11) DEFAULT NULL,
  `salary` decimal(9,2) DEFAULT NULL,
  `occupation` enum('Waiter','Chef','Manager') NOT NULL,
  `rating` enum('1','2','3','4','5') DEFAULT NULL,
  PRIMARY KEY (`employeeID`),
  UNIQUE KEY `ssn` (`ssn`),
  CONSTRAINT `employee_fk_employee_email` FOREIGN KEY (`employeeID`) REFERENCES `employee_email` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_chk_1` CHECK ((`salary` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Joseph','Avila','(723)994-2069','243-24-7849',60000.00,'Waiter','5'),(2,'Bailey','Gray','(589)185-1918','485-78-0762',60000.00,'Waiter','5'),(3,'Molly','Cooper','(801)347-2516','061-70-8553',60000.00,'Waiter','5'),(4,'Calvin','Green','(680)852-5000','207-66-3182',60000.00,'Waiter','5'),(5,'Julie','Gonzalez','(728)675-9196','014-40-6080',60000.00,'Waiter','5'),(6,'Dwayne','Craig','(564)556-4824','768-56-2830',60000.00,'Waiter','5'),(7,'Phyllis','Simmons','(104)955-7538','172-10-2608',60000.00,'Waiter','5'),(8,'April','Torres','(591)807-9083','106-56-1224',60000.00,'Waiter','5'),(9,'April','Morgan','(975)937-8453','206-40-0183',60000.00,'Waiter','5'),(10,'Grant','Johnson','(819)963-2554','143-64-7072',60000.00,'Waiter','5'),(11,'Melissa','Anderson','(275)907-3446','131-18-4571',90000.00,'Chef','5'),(12,'Meredith','Torres','(218)615-2541','629-23-9953',90000.00,'Chef','5'),(13,'Margaret','Freeman','(773)823-6263','779-16-7826',90000.00,'Chef','5'),(14,'Emily','Soto','(448)567-0297','792-06-4786',90000.00,'Chef','5'),(15,'Samuel','Jacobson','(642)336-8719','723-03-5606',90000.00,'Chef','5'),(16,'Chad','White','(858)625-3706','156-84-5935',90000.00,'Chef','5'),(17,'Bryan','Tucker','(381)750-4583','756-39-4600',90000.00,'Chef','5'),(18,'Amanda','Jones','(672)181-7800','700-76-1575',90000.00,'Chef','5'),(19,'Justin','Johnson','(855)406-2978','292-33-1036',90000.00,'Chef','5'),(20,'Elijah','Johnson','(641)057-8086','599-10-3880',90000.00,'Chef','5'),(21,'Nathan','Campbell','(538)549-5281','089-90-5921',120000.00,'Manager','5'),(22,'Christopher','Taylor','(386)009-8767','443-77-0127',120000.00,'Manager','5'),(23,'Brenda','Boyer','(343)785-5315','715-01-8980',120000.00,'Manager','5'),(24,'Benjamin','Ramirez','(225)379-0401','577-74-2776',120000.00,'Manager','5'),(25,'Jonathan','Gross','(266)521-8717','300-97-6471',120000.00,'Manager','5'),(26,'Nancy','Mcintyre','(623)187-1135','683-09-8650',120000.00,'Manager','5'),(27,'Daniel','Hogan','(394)632-3360','078-49-2848',120000.00,'Manager','5'),(28,'Calvin','Huynh','(112)422-0162','888-30-7914',120000.00,'Manager','5'),(29,'Anthony','Johnson','(403)163-8743','362-24-0467',120000.00,'Manager','5'),(30,'Jennifer','Garner','(563)673-2879','063-90-3888',120000.00,'Manager','5'),(31,'Peppa','Pig','(612)345-6789','123-45-6789',100000.00,'Chef','4');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_email`
--

DROP TABLE IF EXISTS `employee_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_email` (
  `employeeID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  PRIMARY KEY (`employeeID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_email`
--

LOCK TABLES `employee_email` WRITE;
/*!40000 ALTER TABLE `employee_email` DISABLE KEYS */;
INSERT INTO `employee_email` VALUES (18,'aaron21@gmail.com'),(14,'bethanyrandall@gmail.com'),(3,'brenda82@gmail.com'),(7,'carolyn02@gmail.com'),(17,'chelsea54@gmail.com'),(16,'christine61@gmail.com'),(26,'cmartin@gmail.com'),(4,'diazrichard@gmail.com'),(13,'emilyduncan@gmail.com'),(19,'epatterson@gmail.com'),(30,'gina14@gmail.com'),(20,'jeanettebennett@gmail.com'),(28,'joebarton@gmail.com'),(25,'laurawilkerson@gmail.com'),(1,'laurenvance@gmail.com'),(27,'megancrawford@gmail.com'),(6,'mhurley@gmail.com'),(12,'milesanna@gmail.com'),(5,'moranrandy@gmail.com'),(15,'morgankrystal@gmail.com'),(9,'perrygordon@gmail.com'),(31,'pig.peppa@neu.edu'),(8,'pmartin@gmail.com'),(22,'rebecca36@gmail.com'),(2,'salinaskelli@gmail.com'),(11,'scott50@gmail.com'),(29,'tylernelson@gmail.com'),(24,'ugray@gmail.com'),(23,'wdavila@gmail.com'),(10,'ywallace@gmail.com'),(21,'zjones@gmail.com');
/*!40000 ALTER TABLE `employee_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `ingredientID` int NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ingredientID`),
  CONSTRAINT `ingredient_fk_ingredient_name` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient_name` (`ingredientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ingredient_chk_1` CHECK ((`stock` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,500),(2,100),(3,488),(4,500),(5,500),(6,500),(7,500),(8,500),(9,500),(10,499),(11,500),(12,500),(13,500),(14,98),(15,100),(16,499),(17,500),(18,500),(19,500),(20,498),(21,500),(22,100),(23,100),(24,99),(25,100),(26,500),(27,500),(28,495),(29,100),(30,500),(31,500),(32,500),(33,500),(34,30),(35,10);
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
-- Table structure for table `ingredient_name`
--

DROP TABLE IF EXISTS `ingredient_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient_name` (
  `ingredientID` int NOT NULL AUTO_INCREMENT,
  `ingredientName` varchar(64) NOT NULL,
  PRIMARY KEY (`ingredientID`),
  UNIQUE KEY `ingredientName` (`ingredientName`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_name`
--

LOCK TABLES `ingredient_name` WRITE;
/*!40000 ALTER TABLE `ingredient_name` DISABLE KEYS */;
INSERT INTO `ingredient_name` VALUES (19,'Alfredo sauce'),(18,'Black pasta'),(28,'Broccoli'),(1,'Calamari'),(12,'Carrot'),(31,'Cheese'),(3,'Cherrystone'),(26,'Clam sauce'),(14,'Cocktail sauce'),(9,'Crouton'),(11,'Cucumber'),(29,'Haddock'),(17,'Linguine'),(7,'Littleneck'),(15,'Lobster'),(23,'Marsala sauce'),(22,'Monkfish'),(20,'Mushroom'),(6,'Mussel'),(33,'Orange'),(21,'Pepper'),(32,'Pepperoni'),(30,'Potato'),(13,'Red onion'),(2,'Red sauce'),(8,'Romaine'),(24,'Salmon'),(27,'Scallop'),(5,'Scampi'),(4,'Shrimp'),(25,'Swordfish'),(34,'Test Food'),(35,'Test Food 2'),(10,'Tomato'),(16,'Tomato sauce');
/*!40000 ALTER TABLE `ingredient_name` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,500,100.00,21,'2022-10-01','2022-10-14'),(2,2,100,50.00,22,'2022-10-01','2023-09-30'),(3,3,500,100.00,21,'2022-10-01','2022-10-14'),(4,4,500,100.00,21,'2022-10-01','2022-10-14'),(5,5,500,100.00,21,'2022-10-01','2022-10-14'),(6,6,500,100.00,21,'2022-10-01','2022-10-14'),(7,7,500,100.00,21,'2022-10-01','2022-10-14'),(8,8,500,150.00,23,'2022-10-01','2022-10-14'),(9,9,500,50.00,22,'2022-10-01','2023-09-30'),(10,10,500,150.00,23,'2022-10-01','2022-10-14'),(11,11,500,150.00,23,'2022-10-01','2022-10-14'),(12,12,500,150.00,23,'2022-10-01','2022-10-14'),(13,13,500,150.00,23,'2022-10-01','2022-10-14'),(14,14,100,50.00,22,'2022-10-01','2022-09-30'),(15,15,100,200.00,21,'2022-10-01','2022-10-14'),(16,16,500,100.00,22,'2022-10-01','2022-09-30'),(17,17,500,100.00,22,'2022-10-01','2022-09-30'),(18,18,500,100.00,22,'2022-10-01','2022-09-30'),(19,19,500,100.00,22,'2022-10-01','2022-09-30'),(20,20,500,150.00,23,'2022-10-01','2022-10-14'),(21,21,500,150.00,23,'2022-10-01','2022-10-14'),(22,22,100,200.00,21,'2022-10-01','2022-10-14'),(23,23,100,50.00,22,'2022-10-01','2023-09-30'),(24,24,100,200.00,21,'2022-10-01','2022-10-14'),(25,25,100,200.00,21,'2022-10-01','2022-10-14'),(26,26,500,50.00,22,'2022-10-01','2023-09-30'),(27,27,500,200.00,21,'2022-10-01','2022-10-14'),(28,28,500,150.00,23,'2022-10-01','2022-10-14'),(29,29,100,200.00,21,'2022-10-01','2022-10-14'),(30,30,500,150.00,23,'2022-10-01','2022-10-14'),(31,31,500,150.00,22,'2022-10-01','2022-10-14'),(32,32,500,150.00,23,'2022-10-01','2022-10-14'),(33,33,500,150.00,23,'2022-10-01','2022-10-14'),(34,34,20,15.00,22,'2022-12-06','2022-12-17'),(35,34,10,10.00,23,'2022-12-06','2022-12-20'),(36,35,10,14.00,26,'2022-12-07','2022-12-19');
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
INSERT INTO `menu` VALUES (1,1,'Fried Calamari','Lemon & red sauce',16.50,1),(2,1,'Clams Casino','Broiled cherrystones, crispy topping',17.25,1),(3,1,'Shrimp Scampi','Garlic, lemon, butter, romano',17.50,1),(4,1,'Calamari Scampi','Garlic, lemon, butter, romano',17.50,1),(5,1,'Mussel Siciliano','Fennel, thyme, shallots, lemon, wine',16.00,1),(6,1,'Littleneck Siciliano','Fennel, thyme, shallots, lemon, wine',17.25,1),(7,1,'Caesar Salad','Romaine, croutons, romano',11.00,1),(8,1,'Calamari Salad','Classic marinated calamari served over a bed of greens',16.75,1),(9,1,'House Salad','Greens, tomatoes, cucumbers, carrots, red onion, balsamic viniagrette',9.75,1),(10,1,'Cherrystones','1/2 dozen raw, served with cocktail sauce',14.00,1),(11,1,'Littlenecks','1/2 dozen raw, served with cocktail sauce',14.00,1),(12,2,'Lobster Fra Diavolo','1.25 lb live lobster cut into pieces with littlenecks, mussels, shrimp and calamari simmered in a spicy seafood tomato sauce served over linguine',67.00,1),(13,3,'Aglio Olio','Ground calamari, olive oil, garlic, anchovy',28.00,1),(14,3,'Alfredo','Cream reduction, butter, romano',28.00,1),(15,3,'Puttanesca','Mushrooms, peppers, onions, olive anchovy butter',28.00,1),(16,4,'Monkfish Marsala','Tender medallions of monkfish simmered with mushrooms in a sweet marsala sauce',26.25,1),(17,4,'North End Style Salmon','Pan seared with sundried tomatoes & mushrooms in tomato basil sauce',28.50,1),(18,4,'North End Style Swordfish','Pan seared with sundried tomatoes & mushrooms in tomato basil sauce',30.25,1),(19,5,'Calamari','Signature seafood tomato sauce',26.75,1),(20,5,'Clams','Olive oil, garlic & clam sauce',29.00,1),(21,5,'Calamari & Clams Combo','Signature seafood tomato sauce',29.00,1),(22,5,'Mussel Marinara','Signature seafood tomato sauce',25.50,1),(23,5,'Vongole Neapolitan','Olive oil, garlic & clam sauce',30.00,1),(24,5,'Scallops','Signature seafood tomato sauce',29.75,1),(25,5,'Shrimp','Signature seafood tomato sauce',29.75,1),(26,5,'Shrimp, Scallops & Broccoli','Olive oil, garlic & clam sauce',31.00,1),(27,5,'Frutti Di Mare','Signature seafood tomato sauce',43.00,1),(28,6,'Fish Haddock Chips','Fresh filleted haddock',28.50,1),(29,6,'Fish Monkfish Chips','Fresh filleted monkfish',28.50,1),(30,6,'Fritto Misto','Shrimp, scallops, calamari, fish',36.75,1),(31,7,'Haddock',NULL,25.50,1),(32,7,'Swordfish',NULL,25.50,1),(33,7,'Scallops',NULL,26.50,1),(34,7,'Salmon',NULL,28.50,1),(35,8,'Broccoli Saute',NULL,8.50,1),(36,8,'French Fries',NULL,5.50,1),(37,8,'Linguine',NULL,8.00,1),(38,8,'Black Pasta',NULL,9.50,1),(39,9,'Cheese','10-inch with alfredo sauce',14.00,1),(40,9,'Pepperoni','10-inch with tomato sauce',16.00,1),(41,10,'Orange Juice','Not from concentrate',10.00,1),(42,11,'Dips','The dip for chips',3.00,0),(43,12,'Food 2',NULL,1.00,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_category`
--

DROP TABLE IF EXISTS `menu_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_category` (
  `categoryID` int NOT NULL,
  `categoryDescription` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`categoryID`),
  CONSTRAINT `menu_category_fk_mcn` FOREIGN KEY (`categoryID`) REFERENCES `menu_category_name` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_category`
--

LOCK TABLES `menu_category` WRITE;
/*!40000 ALTER TABLE `menu_category` DISABLE KEYS */;
INSERT INTO `menu_category` VALUES (1,'Activate your taste buds'),(2,'Seafood chowder'),(3,'Fresh homemade black linguine made with squid ink'),(4,'Served a la carte'),(5,'Cooked from scratch & served in the pan'),(6,'Served lightly breaded with fries, onion rings, & tartar'),(7,'Crispy topping, olive oil, garlic, romano, breadcrumbs'),(8,'Extra and more'),(9,'Garlic-seasoned crust with a rich, buttery taste'),(10,'Refreshing taste'),(11,NULL),(12,NULL);
/*!40000 ALTER TABLE `menu_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_category_name`
--

DROP TABLE IF EXISTS `menu_category_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_category_name` (
  `categoryID` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(64) NOT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `categoryName` (`categoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_category_name`
--

LOCK TABLES `menu_category_name` WRITE;
/*!40000 ALTER TABLE `menu_category_name` DISABLE KEYS */;
INSERT INTO `menu_category_name` VALUES (3,'Black Pasta'),(7,'Broiled'),(4,'Classics'),(10,'Drink'),(6,'Fried'),(2,'Lobster Fra Diavolo'),(11,'Other'),(9,'Pizza'),(5,'Seafood & Linguine'),(8,'Sides'),(1,'Starters'),(12,'Test Cate 2');
/*!40000 ALTER TABLE `menu_category_name` ENABLE KEYS */;
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
INSERT INTO `order_list` VALUES (1,1,19,1),(2,1,31,1),(2,2,36,1),(3,1,39,1),(4,1,31,1),(4,2,36,1),(5,1,13,1),(5,2,14,1),(5,3,24,1),(5,4,19,1),(6,1,22,1),(6,2,26,1),(7,1,13,1),(7,2,14,1),(7,3,24,1),(7,4,19,1),(8,1,1,1),(8,2,15,1),(8,3,17,1),(8,4,25,1),(9,1,40,1),(9,2,34,1),(9,3,30,1),(9,4,16,1),(10,1,2,1),(10,2,12,1),(10,3,18,1),(10,4,20,1),(11,1,9,1),(11,2,21,1),(11,3,26,1),(11,4,29,1),(12,1,28,1),(13,1,6,4),(13,2,5,1),(13,3,40,1),(14,1,14,2),(14,2,39,1),(14,3,35,1),(14,4,22,1),(15,1,32,1),(15,2,40,1),(16,1,9,1),(16,2,22,1),(17,1,25,1),(17,2,5,1),(18,1,10,2),(18,2,27,1),(19,1,24,2),(19,2,3,1),(20,1,39,1),(20,2,26,2),(21,1,15,1),(21,2,20,2),(22,1,24,2),(22,2,16,2),(23,1,29,2),(23,2,40,1),(24,1,16,2),(24,2,1,1),(24,3,6,1),(25,1,40,4),(25,2,24,1),(26,1,20,2),(26,2,11,2),(27,1,21,2),(28,1,12,1),(29,1,30,2),(29,2,27,2),(29,3,38,1),(30,1,17,1),(30,2,26,1),(31,1,13,1),(31,2,8,1),(31,3,27,1),(32,1,26,2),(33,1,26,1),(33,2,21,2),(33,3,25,2),(34,1,28,2),(34,2,22,1),(34,3,40,2),(35,1,25,2),(35,2,9,1),(35,3,17,2),(35,4,12,2),(36,1,22,2),(37,1,13,1),(37,2,20,2),(37,3,21,1),(37,4,39,2),(38,1,36,2),(38,2,30,2),(39,1,20,1),(39,2,23,2),(40,1,36,2),(41,1,34,2),(42,1,41,1),(42,2,33,1),(42,3,34,1),(43,1,17,1),(43,2,19,2),(44,1,32,4),(44,2,1,1),(44,3,23,1),(45,1,5,2),(46,1,10,1),(46,2,20,1),(46,3,30,1),(47,1,31,2),(47,2,9,2),(48,1,26,1),(48,2,14,1),(48,3,25,1),(49,1,35,2),(50,1,32,1),(50,2,17,1),(51,1,10,1),(51,2,37,1),(51,3,4,1),(52,1,36,2),(52,2,20,2),(52,3,38,2),(53,1,36,2),(54,1,3,2),(54,2,36,2),(55,1,41,2),(56,1,11,1),(56,2,10,1),(56,3,27,2),(56,4,13,2),(57,1,9,2),(57,2,19,1),(58,1,16,2),(58,2,34,2),(59,1,24,1),(60,1,25,5),(60,2,4,2),(61,1,7,1),(62,1,19,1),(62,2,29,2),(62,3,31,1),(63,1,37,2),(63,2,27,1),(64,1,12,2),(64,2,35,2),(64,3,10,2),(65,1,10,1),(65,2,3,1),(66,1,35,2),(66,2,32,1),(66,3,21,1),(67,1,19,2),(67,2,16,2),(68,1,31,2),(68,2,18,1),(68,3,24,1),(69,1,37,2),(69,2,2,2),(70,1,12,2),(70,2,21,2),(71,1,10,1),(71,2,1,2),(72,1,11,1),(72,2,25,1),(73,1,25,2),(74,1,29,1),(75,1,11,1),(76,1,30,1),(76,2,38,2),(77,1,2,1),(78,1,19,2),(79,1,14,2),(79,2,26,1),(80,1,19,2),(80,2,12,2),(81,1,8,1),(81,2,26,2),(82,1,31,1),(82,2,33,1),(83,1,6,2),(83,2,38,1),(84,1,31,1),(84,2,12,1),(84,3,29,2),(85,1,21,2),(86,1,7,2),(86,2,29,1),(86,3,30,1),(87,1,2,2),(88,1,34,2),(88,2,15,2),(88,3,21,1),(89,1,35,1),(89,2,14,2),(90,1,9,3),(90,2,31,2),(90,3,36,1),(91,1,34,2),(91,2,6,2),(91,3,41,2),(92,1,38,2),(92,2,4,2),(92,3,13,2),(93,1,29,1),(93,2,15,1),(94,1,34,1),(94,2,18,1),(94,3,9,1),(95,1,13,1),(96,1,1,1),(96,2,33,1),(97,1,8,2),(97,2,12,2),(98,1,25,1),(98,2,39,1),(99,1,25,1),(99,2,35,2),(100,1,1,2),(100,2,15,2),(101,1,19,1),(101,2,15,2),(102,1,10,2),(102,2,35,1),(102,3,17,1),(103,1,19,2),(103,2,34,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_queue`
--

LOCK TABLES `order_queue` WRITE;
/*!40000 ALTER TABLE `order_queue` DISABLE KEYS */;
INSERT INTO `order_queue` VALUES (1,1,11),(2,2,12),(3,3,13),(4,4,14),(5,5,15),(6,6,16),(7,7,17),(8,8,18),(9,9,19),(10,10,20),(11,11,11),(12,12,12),(13,102,11);
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-10-01','12:17:00','Ready',1,1,26.75,0.00,26.75,37,NULL),(2,'2022-10-02','17:32:00','Ready',1,2,31.00,0.00,31.00,38,NULL),(3,'2022-10-03','14:15:00','Ready',1,1,14.00,0.00,14.00,39,NULL),(4,'2022-10-03','12:00:00','Ready',1,2,31.00,5.00,36.00,1,6),(5,'2022-10-03','18:00:00','Ready',1,4,112.50,20.00,132.50,4,16),(6,'2022-10-04','13:00:00','Ready',1,2,56.50,10.00,66.50,5,6),(7,'2022-10-21','18:00:00','Ready',1,4,112.50,20.00,132.50,17,16),(8,'2022-10-21','18:00:00','Ready',1,4,102.75,20.00,122.75,18,17),(9,'2022-10-21','18:00:00','Ready',1,4,107.50,19.00,126.50,19,18),(10,'2022-10-21','18:00:00','Ready',1,4,143.50,30.00,173.50,20,19),(11,'2022-10-21','18:00:00','Ready',1,4,98.25,20.00,118.25,21,20),(12,'2022-10-30','19:00:00','Ready',1,2,28.50,0.00,28.50,40,NULL),(13,'2022-12-05','23:03:01','Received',0,6,101.00,0.00,101.00,30,NULL),(14,'2022-12-05','23:03:01','Received',0,5,104.00,0.00,104.00,39,NULL),(15,'2022-12-05','23:03:01','Received',0,2,41.50,0.00,41.50,47,NULL),(16,'2022-12-05','23:03:01','Received',0,2,35.25,0.00,35.25,43,NULL),(17,'2022-12-05','23:03:01','Received',0,2,45.75,0.00,45.75,49,NULL),(18,'2022-12-05','23:03:02','Received',0,3,71.00,0.00,71.00,6,NULL),(19,'2022-12-05','23:03:02','Received',0,3,77.00,0.00,77.00,28,NULL),(20,'2022-12-05','23:03:02','Received',0,3,76.00,0.00,76.00,22,NULL),(21,'2022-12-05','23:03:03','Received',0,3,86.00,0.00,86.00,19,NULL),(22,'2022-12-05','23:03:03','Received',0,4,112.00,0.00,112.00,4,NULL),(23,'2022-12-05','23:03:03','Received',0,3,73.00,0.00,73.00,17,NULL),(24,'2022-12-05','23:03:03','Received',0,4,86.25,0.00,86.25,22,NULL),(25,'2022-12-05','23:03:04','Received',0,5,93.75,0.00,93.75,34,NULL),(26,'2022-12-05','23:03:04','Received',0,4,86.00,0.00,86.00,46,NULL),(27,'2022-12-05','23:03:04','Received',0,2,58.00,0.00,58.00,50,NULL),(28,'2022-12-05','23:03:05','Received',0,1,67.00,0.00,67.00,31,NULL),(29,'2022-12-05','23:03:05','Received',0,5,169.00,0.00,169.00,1,NULL),(30,'2022-12-05','23:03:05','Received',0,2,59.50,0.00,59.50,26,NULL),(31,'2022-12-05','23:03:06','Received',0,3,87.75,0.00,87.75,43,NULL),(32,'2022-12-05','23:03:06','Received',0,2,62.00,0.00,62.00,1,NULL),(33,'2022-12-05','23:03:06','Received',0,5,148.50,0.00,148.50,9,NULL),(34,'2022-12-05','23:03:07','Received',0,5,114.50,0.00,114.50,42,NULL),(35,'2022-12-05','23:03:07','Received',0,7,260.25,0.00,260.25,8,NULL),(36,'2022-12-05','23:03:07','Received',0,2,51.00,0.00,51.00,34,NULL),(37,'2022-12-05','23:03:08','Received',0,6,143.00,0.00,143.00,43,NULL),(38,'2022-12-05','23:03:08','Received',0,4,84.50,0.00,84.50,9,NULL),(39,'2022-12-05','23:03:08','Received',0,3,89.00,0.00,89.00,43,NULL),(40,'2022-12-05','23:03:08','Received',0,2,11.00,0.00,11.00,11,NULL),(41,'2022-12-05','23:03:09','Received',0,2,57.00,0.00,57.00,29,NULL),(42,'2022-12-05','23:03:09','Received',0,3,65.00,0.00,65.00,19,NULL),(43,'2022-12-05','23:03:09','Received',0,3,82.00,0.00,82.00,27,NULL),(44,'2022-12-05','23:03:10','Received',0,6,148.50,0.00,148.50,12,NULL),(45,'2022-12-05','23:03:10','Received',0,2,32.00,0.00,32.00,32,NULL),(46,'2022-12-05','23:03:10','Received',0,3,79.75,0.00,79.75,26,NULL),(47,'2022-12-05','23:03:11','Received',0,4,70.50,0.00,70.50,24,NULL),(48,'2022-12-05','23:03:11','Received',0,3,88.75,0.00,88.75,17,NULL),(49,'2022-12-05','23:03:11','Received',0,2,17.00,0.00,17.00,21,NULL),(50,'2022-12-05','23:03:12','Received',0,2,54.00,0.00,54.00,5,NULL),(51,'2022-12-05','23:03:12','Received',0,3,39.50,0.00,39.50,20,NULL),(52,'2022-12-05','23:03:12','Received',0,6,88.00,0.00,88.00,25,NULL),(53,'2022-12-05','23:03:13','Received',0,2,11.00,0.00,11.00,3,NULL),(54,'2022-12-05','23:03:13','Received',0,4,46.00,0.00,46.00,36,NULL),(55,'2022-12-05','23:03:13','Received',0,2,20.00,0.00,20.00,22,NULL),(56,'2022-12-05','23:03:13','Received',0,6,170.00,0.00,170.00,17,NULL),(57,'2022-12-05','23:03:14','Received',0,3,46.25,0.00,46.25,42,NULL),(58,'2022-12-05','23:03:14','Received',0,4,109.50,0.00,109.50,5,NULL),(59,'2022-12-05','23:03:14','Received',0,1,29.75,0.00,29.75,46,NULL),(60,'2022-12-05','23:03:15','Received',0,7,183.75,0.00,183.75,30,NULL),(61,'2022-12-05','23:03:15','Received',0,1,11.00,0.00,11.00,28,NULL),(62,'2022-12-05','23:03:15','Received',0,4,109.25,0.00,109.25,12,NULL),(63,'2022-12-05','23:03:15','Received',0,3,59.00,0.00,59.00,7,NULL),(64,'2022-12-05','23:03:16','Received',0,6,179.00,0.00,179.00,35,NULL),(65,'2022-12-05','23:03:16','Received',0,2,31.50,0.00,31.50,46,NULL),(66,'2022-12-05','23:03:16','Received',0,4,71.50,0.00,71.50,19,NULL),(67,'2022-12-05','23:03:17','Received',0,4,106.00,0.00,106.00,40,NULL),(68,'2022-12-05','23:03:17','Received',0,4,111.00,0.00,111.00,7,NULL),(69,'2022-12-05','23:03:17','Received',0,4,50.50,0.00,50.50,7,NULL),(70,'2022-12-05','23:03:18','Received',0,4,192.00,0.00,192.00,11,NULL),(71,'2022-12-05','23:03:18','Received',0,3,47.00,0.00,47.00,3,NULL),(72,'2022-12-05','23:03:18','Received',0,2,43.75,0.00,43.75,7,NULL),(73,'2022-12-05','23:03:19','Received',0,2,59.50,0.00,59.50,23,NULL),(74,'2022-12-05','23:03:19','Received',0,1,28.50,0.00,28.50,6,NULL),(75,'2022-12-05','23:03:19','Received',0,1,14.00,0.00,14.00,3,NULL),(76,'2022-12-05','23:03:19','Received',0,3,55.75,0.00,55.75,46,NULL),(77,'2022-12-05','23:03:20','Received',0,1,17.25,0.00,17.25,47,NULL),(78,'2022-12-05','23:03:20','Received',0,2,53.50,0.00,53.50,47,NULL),(79,'2022-12-05','23:03:20','Received',0,3,87.00,0.00,87.00,41,NULL),(80,'2022-12-05','23:03:20','Received',0,4,187.50,0.00,187.50,1,NULL),(81,'2022-12-05','23:03:21','Received',0,3,78.75,0.00,78.75,37,NULL),(82,'2022-12-05','23:03:21','Received',0,2,52.00,0.00,52.00,35,NULL),(83,'2022-12-05','23:03:21','Received',0,3,44.00,0.00,44.00,22,NULL),(84,'2022-12-05','23:03:22','Received',0,4,149.50,0.00,149.50,50,NULL),(85,'2022-12-05','23:03:22','Received',0,2,58.00,0.00,58.00,3,NULL),(86,'2022-12-05','23:03:22','Received',0,4,87.25,0.00,87.25,50,NULL),(87,'2022-12-05','23:03:23','Received',0,2,34.50,0.00,34.50,1,NULL),(88,'2022-12-05','23:03:23','Received',0,5,142.00,0.00,142.00,23,NULL),(89,'2022-12-05','23:03:23','Received',0,3,64.50,0.00,64.50,2,NULL),(90,'2022-12-05','23:03:24','Received',0,6,85.75,0.00,85.75,15,NULL),(91,'2022-12-05','23:03:24','Received',0,6,111.50,0.00,111.50,5,NULL),(92,'2022-12-05','23:03:24','Received',0,6,110.00,0.00,110.00,30,NULL),(93,'2022-12-05','23:03:25','Received',0,2,56.50,0.00,56.50,6,NULL),(94,'2022-12-05','23:03:25','Received',0,3,68.50,0.00,68.50,14,NULL),(95,'2022-12-05','23:03:25','Received',0,1,28.00,0.00,28.00,21,NULL),(96,'2022-12-05','23:03:26','Received',0,2,43.00,0.00,43.00,35,NULL),(97,'2022-12-05','23:03:26','Received',0,4,167.50,0.00,167.50,6,NULL),(98,'2022-12-05','23:03:26','Received',0,2,43.75,0.00,43.75,16,NULL),(99,'2022-12-05','23:03:26','Received',0,3,46.75,0.00,46.75,47,NULL),(100,'2022-12-05','23:03:27','Received',0,4,89.00,0.00,89.00,38,NULL),(101,'2022-12-05','23:03:27','Received',0,3,82.75,0.00,82.75,21,NULL),(102,'2022-12-05','23:03:27','Ready',1,4,65.00,0.00,65.00,24,NULL),(103,'2022-12-05','23:14:59','Canceled',0,4,110.50,3.00,113.50,53,20);
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
INSERT INTO `reservation` VALUES ('2022-10-03',13,6,1,2,'Reserved',1),('2022-10-03',13,7,2,2,'Canceled',2),('2022-10-03',18,8,3,2,'Canceled',3),('2022-10-03',19,16,4,4,'Reserved',4),('2022-10-04',38,6,5,2,'Reserved',5),('2022-10-04',38,7,6,2,'Canceled',6),('2022-10-04',43,16,7,4,'Canceled',7),('2022-10-04',43,17,8,4,'Canceled',8),('2022-10-12',61,16,9,4,'Canceled',9),('2022-10-12',61,17,10,4,'Canceled',10),('2022-10-12',66,6,11,2,'Canceled',3),('2022-10-12',66,16,12,4,'Canceled',4),('2022-10-13',85,1,13,1,'Canceled',5),('2022-10-13',86,16,14,4,'Canceled',6),('2022-10-13',91,6,15,2,'Canceled',7),('2022-10-13',92,16,16,4,'Canceled',8),('2022-10-21',115,16,17,4,'Reserved',1),('2022-10-21',115,17,18,4,'Reserved',4),('2022-10-21',115,18,19,4,'Reserved',7),('2022-10-21',115,19,20,4,'Reserved',8),('2022-10-21',115,20,21,4,'Reserved',9),('2022-10-22',138,6,22,2,'Canceled',1),('2022-10-22',138,7,23,2,'Canceled',2),('2022-10-30',163,6,24,2,'Canceled',5),('2022-10-30',164,7,25,2,'Canceled',6),('2022-12-06',43,16,53,4,'Canceled',2);
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
INSERT INTO `reservation_window` VALUES (1,'Monday','00:00:00',0),(2,'Monday','01:00:00',0),(3,'Monday','02:00:00',0),(4,'Monday','03:00:00',0),(5,'Monday','04:00:00',0),(6,'Monday','05:00:00',0),(7,'Monday','06:00:00',0),(8,'Monday','07:00:00',0),(9,'Monday','08:00:00',0),(10,'Monday','09:00:00',0),(11,'Monday','10:00:00',0),(12,'Monday','11:00:00',1),(13,'Monday','12:00:00',1),(14,'Monday','13:00:00',1),(15,'Monday','14:00:00',1),(16,'Monday','15:00:00',1),(17,'Monday','16:00:00',1),(18,'Monday','17:00:00',1),(19,'Monday','18:00:00',1),(20,'Monday','19:00:00',1),(21,'Monday','20:00:00',1),(22,'Monday','21:00:00',1),(23,'Monday','22:00:00',1),(24,'Monday','23:00:00',1),(25,'Tuesday','00:00:00',0),(26,'Tuesday','01:00:00',0),(27,'Tuesday','02:00:00',0),(28,'Tuesday','03:00:00',0),(29,'Tuesday','04:00:00',0),(30,'Tuesday','05:00:00',0),(31,'Tuesday','06:00:00',0),(32,'Tuesday','07:00:00',0),(33,'Tuesday','08:00:00',0),(34,'Tuesday','09:00:00',0),(35,'Tuesday','10:00:00',0),(36,'Tuesday','11:00:00',1),(37,'Tuesday','12:00:00',1),(38,'Tuesday','13:00:00',1),(39,'Tuesday','14:00:00',1),(40,'Tuesday','15:00:00',1),(41,'Tuesday','16:00:00',1),(42,'Tuesday','17:00:00',1),(43,'Tuesday','18:00:00',1),(44,'Tuesday','19:00:00',1),(45,'Tuesday','20:00:00',1),(46,'Tuesday','21:00:00',0),(47,'Tuesday','22:00:00',0),(48,'Tuesday','23:00:00',0),(49,'Wednesday','00:00:00',0),(50,'Wednesday','01:00:00',0),(51,'Wednesday','02:00:00',0),(52,'Wednesday','03:00:00',0),(53,'Wednesday','04:00:00',0),(54,'Wednesday','05:00:00',0),(55,'Wednesday','06:00:00',0),(56,'Wednesday','07:00:00',0),(57,'Wednesday','08:00:00',0),(58,'Wednesday','09:00:00',0),(59,'Wednesday','10:00:00',0),(60,'Wednesday','11:00:00',1),(61,'Wednesday','12:00:00',1),(62,'Wednesday','13:00:00',1),(63,'Wednesday','14:00:00',1),(64,'Wednesday','15:00:00',1),(65,'Wednesday','16:00:00',1),(66,'Wednesday','17:00:00',1),(67,'Wednesday','18:00:00',1),(68,'Wednesday','19:00:00',1),(69,'Wednesday','20:00:00',1),(70,'Wednesday','21:00:00',0),(71,'Wednesday','22:00:00',0),(72,'Wednesday','23:00:00',0),(73,'Thursday','00:00:00',0),(74,'Thursday','01:00:00',0),(75,'Thursday','02:00:00',0),(76,'Thursday','03:00:00',0),(77,'Thursday','04:00:00',0),(78,'Thursday','05:00:00',0),(79,'Thursday','06:00:00',0),(80,'Thursday','07:00:00',0),(81,'Thursday','08:00:00',0),(82,'Thursday','09:00:00',0),(83,'Thursday','10:00:00',0),(84,'Thursday','11:00:00',1),(85,'Thursday','12:00:00',1),(86,'Thursday','13:00:00',1),(87,'Thursday','14:00:00',1),(88,'Thursday','15:00:00',1),(89,'Thursday','16:00:00',1),(90,'Thursday','17:00:00',1),(91,'Thursday','18:00:00',1),(92,'Thursday','19:00:00',1),(93,'Thursday','20:00:00',1),(94,'Thursday','21:00:00',0),(95,'Thursday','22:00:00',0),(96,'Thursday','23:00:00',0),(97,'Friday','00:00:00',0),(98,'Friday','01:00:00',0),(99,'Friday','02:00:00',0),(100,'Friday','03:00:00',0),(101,'Friday','04:00:00',0),(102,'Friday','05:00:00',0),(103,'Friday','06:00:00',0),(104,'Friday','07:00:00',0),(105,'Friday','08:00:00',0),(106,'Friday','09:00:00',0),(107,'Friday','10:00:00',0),(108,'Friday','11:00:00',1),(109,'Friday','12:00:00',1),(110,'Friday','13:00:00',1),(111,'Friday','14:00:00',1),(112,'Friday','15:00:00',1),(113,'Friday','16:00:00',1),(114,'Friday','17:00:00',1),(115,'Friday','18:00:00',1),(116,'Friday','19:00:00',1),(117,'Friday','20:00:00',1),(118,'Friday','21:00:00',0),(119,'Friday','22:00:00',0),(120,'Friday','23:00:00',0),(121,'Saturday','00:00:00',0),(122,'Saturday','01:00:00',0),(123,'Saturday','02:00:00',0),(124,'Saturday','03:00:00',0),(125,'Saturday','04:00:00',0),(126,'Saturday','05:00:00',0),(127,'Saturday','06:00:00',0),(128,'Saturday','07:00:00',0),(129,'Saturday','08:00:00',0),(130,'Saturday','09:00:00',0),(131,'Saturday','10:00:00',0),(132,'Saturday','11:00:00',1),(133,'Saturday','12:00:00',1),(134,'Saturday','13:00:00',1),(135,'Saturday','14:00:00',1),(136,'Saturday','15:00:00',1),(137,'Saturday','16:00:00',1),(138,'Saturday','17:00:00',1),(139,'Saturday','18:00:00',1),(140,'Saturday','19:00:00',1),(141,'Saturday','20:00:00',1),(142,'Saturday','21:00:00',0),(143,'Saturday','22:00:00',0),(144,'Saturday','23:00:00',0),(145,'Sunday','00:00:00',0),(146,'Sunday','01:00:00',0),(147,'Sunday','02:00:00',0),(148,'Sunday','03:00:00',0),(149,'Sunday','04:00:00',0),(150,'Sunday','05:00:00',0),(151,'Sunday','06:00:00',0),(152,'Sunday','07:00:00',0),(153,'Sunday','08:00:00',0),(154,'Sunday','09:00:00',0),(155,'Sunday','10:00:00',0),(156,'Sunday','11:00:00',1),(157,'Sunday','12:00:00',1),(158,'Sunday','13:00:00',1),(159,'Sunday','14:00:00',1),(160,'Sunday','15:00:00',1),(161,'Sunday','16:00:00',1),(162,'Sunday','17:00:00',1),(163,'Sunday','18:00:00',1),(164,'Sunday','19:00:00',1),(165,'Sunday','20:00:00',1),(166,'Sunday','21:00:00',0),(167,'Sunday','22:00:00',0),(168,'Sunday','23:00:00',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiting_list`
--

LOCK TABLES `waiting_list` WRITE;
/*!40000 ALTER TABLE `waiting_list` DISABLE KEYS */;
INSERT INTO `waiting_list` VALUES (1,'2022-10-21',115,26,4,'Joined'),(2,'2022-10-21',115,27,4,'Joined'),(3,'2022-10-21',115,28,4,'Joined'),(4,'2022-10-21',115,29,4,'Joined'),(5,'2022-10-21',115,30,4,'Joined'),(6,'2022-10-21',115,31,4,'Joined'),(7,'2022-10-21',115,32,4,'Joined'),(8,'2022-10-21',115,33,4,'Joined'),(9,'2022-10-21',115,34,4,'Joined'),(10,'2022-10-21',115,35,4,'Joined'),(11,'2022-10-21',115,36,4,'Canceled'),(12,'2022-12-07',66,53,3,'Canceled');
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
select ingredientID into ingredientID_var from ingredient_name where ingredientName = ingredientName_var;
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
		(select ingredientID from ingredient_name where ingredientName = ingredientName_var), 
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
declare employeeID_var int;
-- get id first
insert into employee_email (email) values (email_var);
select employeeID into employeeID_var from employee_email where email = email_var;
-- insert other stuff
insert into employee (employeeID, firstName, lastName, phone, ssn, salary, occupation, rating)
values (employeeID_var, firstName_var, lastName_var, phone_var, ssn_var, salary_var, occupation_var, '5');
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
declare id_var varchar(64);
declare duplicate_name boolean default false;
declare CONTINUE handler for 1062
	set duplicate_name = true;
insert into menu_category_name (categoryName) values (categoryName_var);
select categoryID into id_var from menu_category_name where categoryName = categoryName_var;
insert into menu_category (categoryID) values (id_var);
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
values ((select categoryID from menu_category_name where categoryName = categoryName_var), dishName_var, price_var, true);
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
declare ingredientID_var int;
declare duplicate_name boolean default false;
declare CONTINUE handler for 1062
	set duplicate_name = true;
insert into ingredient_name (ingredientName) values (ingredientName_var);
select ingredientID into ingredientID_var from ingredient_name where ingredientName = ingredientName_var;
insert into ingredient (ingredientID, stock) values (ingredientID_var, 0);
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
delete from customer_email where customerID = customerID_var;
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
delete from employee_email where employeeID = employeeID_var;
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
natural join ingredient_name as i
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
select mc.categoryID, mcn.categoryName, count(mc.categoryID) as freq
from menu_category_name as mcn
natural join menu_category as mc
natural join menu as m
natural join order_list
group by mc.categoryID, mcn.categoryName
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
select ce.customerID, c.firstName, c.lastName, ce.email, c.phone, c.customerPassword
from customer_email as ce natural join customer as c
where ce.email = email_var and c.customerPassword = password_var;
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
declare customerID_var int;
-- get one id first
insert into customer_email (email) values (email_var);
select customerID into customerID_var from customer_email where email = email_var;
-- insert other stuff
insert into customer (customerID, firstName, lastName, phone, customerPassword)
values (customerID_var, firstName_var, lastName_var, phone_var, password_var);
-- return the id
select customerID_var;
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
    update reservation_window set windowStatus = true where 0 < windowID and businessDay = businessDay_var and openTime_var <= startTime and startTime <= closeTime_var;
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
from ingredient_name as i
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
select ee.employeeID, concat(e.firstName, ' ', e.lastName) as ename, ee.email, e.phone, e.ssn, e.salary, e.occupation, e.rating
from employee_email as ee natural join employee as e
where filter_var or (e.occupation = occupation_var)
order by ee.employeeID ASC;
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
select ingn.ingredientID, ingn.ingredientName, i.stock
from ingredient_name as ingn natural join ingredient as i
order by ingn.ingredientID ASC;
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
/*!50001 VIEW `ingredient_inventory` AS select `inv`.`inventoryID` AS `inventoryID`,`ing`.`ingredientName` AS `ingredientName`,`inv`.`quantity` AS `quantity`,`inv`.`totalCost` AS `totalCost`,`e`.`employeeID` AS `employeeID`,concat(`e`.`firstName`,' ',`e`.`lastName`) AS `employeeName`,`inv`.`purchaseDate` AS `purchaseDate`,`inv`.`expDate` AS `expDate` from ((`inventory` `inv` join `ingredient_name` `ing` on((`inv`.`ingredientID` = `ing`.`ingredientID`))) join `employee` `e` on((`inv`.`employeeID` = `e`.`employeeID`))) */;
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
/*!50001 VIEW `menu_for_customer` AS select `menu`.`menuID` AS `menuID`,`mcn`.`categoryName` AS `categoryName`,`menu`.`dishName` AS `dishName`,`menu`.`price` AS `price` from (`menu` join `menu_category_name` `mcn` on((`menu`.`categoryID` = `mcn`.`categoryID`))) where ((0 <> `menu`.`dishStatus`) is true) order by `menu`.`menuID` */;
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
/*!50001 VIEW `menu_for_employee` AS select `m`.`menuID` AS `menuID`,`mcn`.`categoryName` AS `categoryName`,`m`.`dishName` AS `dishName`,`m`.`dishDescription` AS `dishDescription`,`m`.`price` AS `price`,`m`.`dishStatus` AS `dishStatus` from (`menu_category_name` `mcn` left join `menu` `m` on((`m`.`categoryID` = `mcn`.`categoryID`))) order by `m`.`menuID` */;
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

-- Dump completed on 2022-12-06  0:17:13
