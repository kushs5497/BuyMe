CREATE DATABASE  IF NOT EXISTS `buyme` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `buyme`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: buyme
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerts` (
  `item_id` int NOT NULL,
  `message` varchar(500) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`item_id`,`message`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `alerts_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_bid`
--

DROP TABLE IF EXISTS `auto_bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_bid` (
  `item_id` int DEFAULT NULL,
  `bidder` varchar(20) DEFAULT NULL,
  `maximum_bid` float DEFAULT NULL,
  `bid_increment` float DEFAULT NULL,
  KEY `item_id` (`item_id`),
  KEY `bidder` (`bidder`),
  CONSTRAINT `auto_bid_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `auto_bid_ibfk_2` FOREIGN KEY (`bidder`) REFERENCES `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_bid`
--

LOCK TABLES `auto_bid` WRITE;
/*!40000 ALTER TABLE `auto_bid` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid_history`
--

DROP TABLE IF EXISTS `bid_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid_history` (
  `item_id` int DEFAULT NULL,
  `current_bid` float DEFAULT NULL,
  `bidder` varchar(20) DEFAULT NULL,
  KEY `item_id` (`item_id`),
  KEY `bidder` (`bidder`),
  CONSTRAINT `bid_history_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `bid_history_ibfk_2` FOREIGN KEY (`bidder`) REFERENCES `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid_history`
--

LOCK TABLES `bid_history` WRITE;
/*!40000 ALTER TABLE `bid_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `bid_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_reps`
--

DROP TABLE IF EXISTS `cust_reps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_reps` (
  `rep_id` int NOT NULL AUTO_INCREMENT,
  `rep_name` varchar(50) DEFAULT NULL,
  `rep_password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_reps`
--

LOCK TABLES `cust_reps` WRITE;
/*!40000 ALTER TABLE `cust_reps` DISABLE KEYS */;
INSERT INTO `cust_reps` VALUES (1,'rep','rep');
/*!40000 ALTER TABLE `cust_reps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interests`
--

DROP TABLE IF EXISTS `interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interests` (
  `type` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`type`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `interests_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests`
--

LOCK TABLES `interests` WRITE;
/*!40000 ALTER TABLE `interests` DISABLE KEYS */;
/*!40000 ALTER TABLE `interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `starting_bid` float DEFAULT NULL,
  `bid_increment` float DEFAULT NULL,
  `current_price` float DEFAULT NULL,
  `sell_by_date` datetime DEFAULT NULL,
  `bought` tinyint(1) DEFAULT '0',
  `reserve_price` float DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `username` (`username`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `question` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `username` (`username`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replys`
--

DROP TABLE IF EXISTS `replys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replys` (
  `reply_id` int NOT NULL AUTO_INCREMENT,
  `reply` varchar(500) DEFAULT NULL,
  `customer_rep_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `customer_rep_id` (`customer_rep_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `replys_ibfk_1` FOREIGN KEY (`customer_rep_id`) REFERENCES `cust_reps` (`rep_id`),
  CONSTRAINT `replys_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replys`
--

LOCK TABLES `replys` WRITE;
/*!40000 ALTER TABLE `replys` DISABLE KEYS */;
/*!40000 ALTER TABLE `replys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sold_items`
--

DROP TABLE IF EXISTS `sold_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sold_items` (
  `item_id` int NOT NULL,
  `category` varchar(30) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `buyer` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `buyer` (`buyer`),
  CONSTRAINT `sold_items_ibfk_1` FOREIGN KEY (`buyer`) REFERENCES `user` (`username`) ON UPDATE CASCADE,
  CONSTRAINT `sold_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sold_items`
--

LOCK TABLES `sold_items` WRITE;
/*!40000 ALTER TABLE `sold_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sold_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-05 18:57:19
