-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: pineustilu
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

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
-- Table structure for table `area_units`
--

DROP TABLE IF EXISTS `area_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_units` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `area_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_people` int NOT NULL DEFAULT '0',
  `max_people` int NOT NULL DEFAULT '0',
  `tent_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `area_units_area_id_foreign` (`area_id`),
  CONSTRAINT `area_units_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_units`
--

LOCK TABLES `area_units` WRITE;
/*!40000 ALTER TABLE `area_units` DISABLE KEYS */;
INSERT INTO `area_units` VALUES (1,1,'Deck 1',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(2,1,'Deck 2',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(3,1,'Deck 8',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(4,1,'Deck 9',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(5,1,'Deck 3',4,6,'Tent 4.0','2026-05-05 07:56:52','2026-05-05 07:56:52'),(6,1,'Deck 4',4,6,'Tent 4.0','2026-05-05 07:56:52','2026-05-05 07:56:52'),(7,1,'Deck 5',4,6,'Tent 4.0','2026-05-05 07:56:52','2026-05-05 07:56:52'),(8,1,'Deck 6',4,6,'Tent 4.0','2026-05-05 07:56:52','2026-05-05 07:56:52'),(9,1,'Deck 7',4,6,'Tent 4.0','2026-05-05 07:56:52','2026-05-05 07:56:52'),(10,2,'Deck 1',4,6,'Tent 4.0','2026-05-05 07:56:52','2026-05-05 07:56:52'),(11,2,'Deck 2',4,6,'Tent 4.0','2026-05-05 07:56:52','2026-05-05 07:56:52'),(12,2,'Deck 3',4,6,'Tent 4.0','2026-05-05 07:56:52','2026-05-05 07:56:52'),(13,2,'Deck 4',4,6,'Tent 4.0','2026-05-05 07:56:52','2026-05-05 07:56:52'),(14,2,'Deck 5',4,6,'Tent 4.0','2026-05-05 07:56:52','2026-05-05 07:56:52'),(15,2,'Deck 6',4,6,'Tent 4.0','2026-05-05 07:56:52','2026-05-05 07:56:52'),(16,2,'Deck 7',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(17,2,'Deck 8',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(18,2,'Deck 9',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(19,3,'Deck 1',6,10,'Tent 6.3','2026-05-05 07:56:52','2026-05-05 07:56:52'),(20,3,'Deck 2',6,10,'Tent 6.3','2026-05-05 07:56:52','2026-05-05 07:56:52'),(21,3,'Deck 3',6,10,'Tent 6.3','2026-05-05 07:56:52','2026-05-05 07:56:52'),(22,3,'Deck 4',6,10,'Tent 6.3','2026-05-05 07:56:52','2026-05-05 07:56:52'),(23,3,'Deck 5',6,10,'Tent 6.3','2026-05-05 07:56:52','2026-05-05 07:56:52'),(24,3,'Deck 6',5,9,'Tent 5.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(25,3,'Deck 7',5,9,'Tent 5.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(26,3,'Deck 8',5,9,'Tent 5.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(27,3,'Deck 9',5,9,'Tent 5.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(28,4,'Plot 1',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(29,4,'Plot 2',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(30,4,'Plot 3',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(31,4,'Plot 4',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(32,4,'Plot 5',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(33,4,'Plot 6',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(34,4,'Plot 7',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(35,4,'Plot 8',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(36,4,'Plot 9',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(37,4,'Plot 10',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(38,4,'Plot 11',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(39,4,'Plot 12',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(40,4,'Plot 13',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(41,4,'Plot 14',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(42,4,'Plot 15',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(43,4,'Plot 16',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(44,4,'Plot 17',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(45,4,'Plot 18',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(46,4,'Plot 19',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(47,4,'Plot 20',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(48,4,'Plot 21',4,6,'Tent 4.2','2026-05-05 07:56:52','2026-05-05 07:56:52'),(49,5,'Cabin',2,5,'Cabin','2026-05-05 07:56:52','2026-05-05 07:56:52'),(50,6,'Cabin VVIP',4,8,'Cabin VVIP','2026-05-05 07:56:52','2026-05-05 07:56:52'),(51,1,'Deck 1',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(52,1,'Deck 2',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(53,1,'Deck 8',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(54,1,'Deck 9',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(55,1,'Deck 3',4,6,'Tent 4.0','2026-05-20 18:23:54','2026-05-20 18:23:54'),(56,1,'Deck 4',4,6,'Tent 4.0','2026-05-20 18:23:54','2026-05-20 18:23:54'),(57,1,'Deck 5',4,6,'Tent 4.0','2026-05-20 18:23:54','2026-05-20 18:23:54'),(58,1,'Deck 6',4,6,'Tent 4.0','2026-05-20 18:23:54','2026-05-20 18:23:54'),(59,1,'Deck 7',4,6,'Tent 4.0','2026-05-20 18:23:54','2026-05-20 18:23:54'),(60,2,'Deck 1',4,6,'Tent 4.0','2026-05-20 18:23:54','2026-05-20 18:23:54'),(61,2,'Deck 2',4,6,'Tent 4.0','2026-05-20 18:23:54','2026-05-20 18:23:54'),(62,2,'Deck 3',4,6,'Tent 4.0','2026-05-20 18:23:54','2026-05-20 18:23:54'),(63,2,'Deck 4',4,6,'Tent 4.0','2026-05-20 18:23:54','2026-05-20 18:23:54'),(64,2,'Deck 5',4,6,'Tent 4.0','2026-05-20 18:23:54','2026-05-20 18:23:54'),(65,2,'Deck 6',4,6,'Tent 4.0','2026-05-20 18:23:54','2026-05-20 18:23:54'),(66,2,'Deck 7',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(67,2,'Deck 8',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(68,2,'Deck 9',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(69,3,'Deck 1',6,10,'Tent 6.3','2026-05-20 18:23:54','2026-05-20 18:23:54'),(70,3,'Deck 2',6,10,'Tent 6.3','2026-05-20 18:23:54','2026-05-20 18:23:54'),(71,3,'Deck 3',6,10,'Tent 6.3','2026-05-20 18:23:54','2026-05-20 18:23:54'),(72,3,'Deck 4',6,10,'Tent 6.3','2026-05-20 18:23:54','2026-05-20 18:23:54'),(73,3,'Deck 5',6,10,'Tent 6.3','2026-05-20 18:23:54','2026-05-20 18:23:54'),(74,3,'Deck 6',5,9,'Tent 5.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(75,3,'Deck 7',5,9,'Tent 5.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(76,3,'Deck 8',5,9,'Tent 5.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(77,3,'Deck 9',5,9,'Tent 5.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(78,4,'Plot 1',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(79,4,'Plot 2',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(80,4,'Plot 3',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(81,4,'Plot 4',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(82,4,'Plot 5',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(83,4,'Plot 6',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(84,4,'Plot 7',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(85,4,'Plot 8',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(86,4,'Plot 9',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(87,4,'Plot 10',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(88,4,'Plot 11',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(89,4,'Plot 12',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(90,4,'Plot 13',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(91,4,'Plot 14',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(92,4,'Plot 15',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(93,4,'Plot 16',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(94,4,'Plot 17',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(95,4,'Plot 18',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(96,4,'Plot 19',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(97,4,'Plot 20',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(98,4,'Plot 21',4,6,'Tent 4.2','2026-05-20 18:23:54','2026-05-20 18:23:54'),(99,5,'Cabin',2,5,'Cabin','2026-05-20 18:23:54','2026-05-20 18:23:54'),(100,6,'Cabin VVIP',4,8,'Cabin VVIP','2026-05-20 18:23:54','2026-05-20 18:23:54');
/*!40000 ALTER TABLE `area_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `extra_charge_full` decimal(15,2) NOT NULL DEFAULT '0.00',
  `extra_charge_breakfast` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `areas_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'Pineus Tilu 1','pineus-tilu-1','Immersive experience with the soothing sound of river and the beautiful scenery of pine forest.',100000.00,40000.00,NULL,'2026-05-20 18:23:54'),(2,'Pineus Tilu 2','pineus-tilu-2','Ideal for families, Pineus Tilu 2 is equipped with a children\'s play pool, creating a fun and safe area for kids to play while parents can relax and enjoy nature.',100000.00,40000.00,NULL,'2026-05-20 18:23:54'),(3,'Pineus Tilu 3 VIP','pineus-tilu-3-vip','Enjoy exclusive comfort at Pineus Tilu 3 VIP, with more complete facilities for a premium glamping experience surrounded by the cool pine forest.',150000.00,40000.00,NULL,'2026-05-20 18:23:54'),(4,'Pineus Tilu 4','pineus-tilu-4','Pineus Tilu 4 offers more tents and a larger area, making it the perfect choice for groups or communities who want to camp together in a lively atmosphere.',100000.00,40000.00,NULL,'2026-05-20 18:23:54'),(5,'Pineus Tilu Cabin','pineus-tilu-cabin','A more private and comfortable stay experience in exclusive Pineus Tilu cabins, perfect for couples or small families who desire more privacy.',0.00,0.00,NULL,'2026-05-20 18:23:54'),(6,'Pineus Tilu Cabin VVIP','pineus-tilu-cabin-vvip','Private exclusive cabin with premium facilities & larger area, provides not only comforts but also warm atmosphere. ',0.00,0.00,NULL,'2026-05-20 18:23:54');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_details`
--

DROP TABLE IF EXISTS `booking_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `unit_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned DEFAULT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `number_of_people` int NOT NULL DEFAULT '0',
  `total_extra_charge` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_details_check_in_index` (`check_in`),
  KEY `booking_details_check_out_index` (`check_out`),
  KEY `booking_details_booking_id_check_in_index` (`booking_id`,`check_in`),
  KEY `booking_details_item_id_foreign` (`item_id`),
  KEY `idx_booking_details_availability` (`unit_id`,`check_in`,`check_out`),
  CONSTRAINT `booking_details_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `booking_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE SET NULL,
  CONSTRAINT `booking_details_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `area_units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_details`
--

LOCK TABLES `booking_details` WRITE;
/*!40000 ALTER TABLE `booking_details` DISABLE KEYS */;
INSERT INTO `booking_details` VALUES (1,1,9,NULL,'2026-05-07','2026-05-08',4,0.00,650000.00,'{\"nights\":1,\"season_breakdown\":{\"weekday\":{\"nights\":1,\"total\":650000}},\"nightly_breakdown\":[{\"date\":\"2026-05-07\",\"season\":\"weekday\",\"price\":650000}],\"amenities\":[],\"amenities_breakdown\":[],\"extra_breakfast\":{\"default_people\":4,\"extra_people\":0,\"rate\":0,\"amount\":0,\"mode\":\"\"},\"extra_charge_rates\":{\"full\":100000,\"breakfast\":40000},\"extra_charge_mode\":\"\"}','2026-05-05 08:05:49','2026-05-05 08:05:49'),(2,2,5,NULL,'2026-05-05','2026-05-09',1,0.00,2850000.00,'{\"nights\":4,\"season_breakdown\":{\"weekday\":{\"nights\":3,\"total\":1950000},\"weekend\":{\"nights\":1,\"total\":900000}},\"nightly_breakdown\":[{\"date\":\"2026-05-05\",\"season\":\"weekday\",\"price\":650000},{\"date\":\"2026-05-06\",\"season\":\"weekday\",\"price\":650000},{\"date\":\"2026-05-07\",\"season\":\"weekday\",\"price\":650000},{\"date\":\"2026-05-08\",\"season\":\"weekend\",\"price\":900000}],\"amenities\":[],\"amenities_breakdown\":[],\"extra_breakfast\":{\"default_people\":4,\"extra_people\":0,\"rate\":0,\"amount\":0,\"mode\":\"\"},\"extra_charge_rates\":{\"full\":100000,\"breakfast\":40000},\"extra_charge_mode\":\"\"}','2026-05-05 08:08:05','2026-05-05 08:08:05'),(3,4,2,NULL,'2026-05-17','2026-05-18',1,0.00,750000.00,'{\"nights\":1,\"season_breakdown\":{\"weekday\":{\"nights\":1,\"total\":750000}},\"nightly_breakdown\":[{\"date\":\"2026-05-17\",\"season\":\"weekday\",\"price\":750000}],\"amenities\":[],\"amenities_breakdown\":[],\"extra_breakfast\":{\"default_people\":4,\"extra_people\":0,\"rate\":0,\"amount\":0,\"mode\":\"\"},\"extra_charge_rates\":{\"full\":100000,\"breakfast\":40000},\"extra_charge_mode\":\"\"}','2026-05-17 10:05:17','2026-05-17 10:05:17');
/*!40000 ALTER TABLE `booking_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_outbounds`
--

DROP TABLE IF EXISTS `booking_outbounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_outbounds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `outbound_id` bigint unsigned NOT NULL,
  `outbound_variant_id` bigint unsigned DEFAULT NULL,
  `schedule_date` date DEFAULT NULL,
  `schedule_time` time DEFAULT NULL,
  `number_of_units` int NOT NULL DEFAULT '1',
  `participants_per_unit` int DEFAULT NULL,
  `total_participants` int NOT NULL DEFAULT '1',
  `add_documentation` tinyint(1) NOT NULL DEFAULT '0',
  `additional_documentation` int NOT NULL DEFAULT '0',
  `documentation_fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `need_transportation` tinyint(1) NOT NULL DEFAULT '0',
  `transportation_vehicles` int NOT NULL DEFAULT '0',
  `transportation_fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_outbounds_booking_id_foreign` (`booking_id`),
  KEY `booking_outbounds_outbound_id_foreign` (`outbound_id`),
  KEY `booking_outbounds_outbound_variant_id_foreign` (`outbound_variant_id`),
  CONSTRAINT `booking_outbounds_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `booking_outbounds_outbound_id_foreign` FOREIGN KEY (`outbound_id`) REFERENCES `outbounds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `booking_outbounds_outbound_variant_id_foreign` FOREIGN KEY (`outbound_variant_id`) REFERENCES `outbound_variants` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_outbounds`
--

LOCK TABLES `booking_outbounds` WRITE;
/*!40000 ALTER TABLE `booking_outbounds` DISABLE KEYS */;
INSERT INTO `booking_outbounds` VALUES (1,3,2,NULL,'2026-05-09',NULL,1,NULL,4,0,0,0.00,1,0,550000.00,35000.00,140000.00,690000.00,'{\"outbound_name\":\"Flying Fox\",\"variant_name\":null,\"extras\":[\"transportasi\"]}','2026-05-05 08:09:43','2026-05-05 08:09:43');
/*!40000 ALTER TABLE `booking_outbounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `booking_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_date` date NOT NULL,
  `token_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'proses',
  `guest_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bookings_token_code_unique` (`token_code`),
  KEY `bookings_user_id_foreign` (`user_id`),
  KEY `bookings_status_index` (`status`),
  KEY `bookings_booking_date_index` (`booking_date`),
  KEY `idx_bookings_status` (`status`),
  CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,3,'glamping','2026-05-05','1OPFTKWKKY','berhasil','test','8817782553','test@gmail.com',NULL,'2026-05-05 08:05:49','2026-05-05 08:06:17'),(2,3,'glamping','2026-05-05','7FD9CE78Y5','berhasil','test','8817782553','test@gmail.com',NULL,'2026-05-05 08:08:05','2026-05-05 08:08:11'),(3,3,'outbound','2026-05-05','U7NB1JYUJZ','berhasil','test','8817782553','test@gmail.com',NULL,'2026-05-05 08:09:43','2026-05-05 08:09:51'),(4,3,'glamping','2026-05-17','KXZJRKZPW4','proses','test','8817782553','test@gmail.com',NULL,'2026-05-17 10:05:17','2026-05-17 10:05:17');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('5c785c036466adea360111aa28563bfd556b5fba','i:1;',1781451591),('5c785c036466adea360111aa28563bfd556b5fba:timer','i:1781451591;',1781451591),('ab5f9bc8293d8e7b67d4c039cac5d8cd','i:1;',1779301907),('ab5f9bc8293d8e7b67d4c039cac5d8cd:timer','i:1779301907;',1779301907),('area_units_by_slug','a:6:{s:13:\"pineus-tilu-1\";a:18:{i:0;a:4:{s:2:\"id\";i:1;s:4:\"name\";s:6:\"Deck 1\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:1;a:4:{s:2:\"id\";i:2;s:4:\"name\";s:6:\"Deck 2\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:2;a:4:{s:2:\"id\";i:3;s:4:\"name\";s:6:\"Deck 8\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:3;a:4:{s:2:\"id\";i:4;s:4:\"name\";s:6:\"Deck 9\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:4;a:4:{s:2:\"id\";i:5;s:4:\"name\";s:6:\"Deck 3\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:5;a:4:{s:2:\"id\";i:6;s:4:\"name\";s:6:\"Deck 4\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:6;a:4:{s:2:\"id\";i:7;s:4:\"name\";s:6:\"Deck 5\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:7;a:4:{s:2:\"id\";i:8;s:4:\"name\";s:6:\"Deck 6\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:8;a:4:{s:2:\"id\";i:9;s:4:\"name\";s:6:\"Deck 7\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:9;a:4:{s:2:\"id\";i:51;s:4:\"name\";s:6:\"Deck 1\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:10;a:4:{s:2:\"id\";i:52;s:4:\"name\";s:6:\"Deck 2\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:11;a:4:{s:2:\"id\";i:53;s:4:\"name\";s:6:\"Deck 8\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:12;a:4:{s:2:\"id\";i:54;s:4:\"name\";s:6:\"Deck 9\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:13;a:4:{s:2:\"id\";i:55;s:4:\"name\";s:6:\"Deck 3\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:14;a:4:{s:2:\"id\";i:56;s:4:\"name\";s:6:\"Deck 4\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:15;a:4:{s:2:\"id\";i:57;s:4:\"name\";s:6:\"Deck 5\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:16;a:4:{s:2:\"id\";i:58;s:4:\"name\";s:6:\"Deck 6\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:17;a:4:{s:2:\"id\";i:59;s:4:\"name\";s:6:\"Deck 7\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}}s:13:\"pineus-tilu-2\";a:18:{i:0;a:4:{s:2:\"id\";i:10;s:4:\"name\";s:6:\"Deck 1\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:1;a:4:{s:2:\"id\";i:11;s:4:\"name\";s:6:\"Deck 2\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:2;a:4:{s:2:\"id\";i:12;s:4:\"name\";s:6:\"Deck 3\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:3;a:4:{s:2:\"id\";i:13;s:4:\"name\";s:6:\"Deck 4\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:4;a:4:{s:2:\"id\";i:14;s:4:\"name\";s:6:\"Deck 5\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:5;a:4:{s:2:\"id\";i:15;s:4:\"name\";s:6:\"Deck 6\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:6;a:4:{s:2:\"id\";i:16;s:4:\"name\";s:6:\"Deck 7\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:7;a:4:{s:2:\"id\";i:17;s:4:\"name\";s:6:\"Deck 8\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:8;a:4:{s:2:\"id\";i:18;s:4:\"name\";s:6:\"Deck 9\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:9;a:4:{s:2:\"id\";i:60;s:4:\"name\";s:6:\"Deck 1\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:10;a:4:{s:2:\"id\";i:61;s:4:\"name\";s:6:\"Deck 2\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:11;a:4:{s:2:\"id\";i:62;s:4:\"name\";s:6:\"Deck 3\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:12;a:4:{s:2:\"id\";i:63;s:4:\"name\";s:6:\"Deck 4\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:13;a:4:{s:2:\"id\";i:64;s:4:\"name\";s:6:\"Deck 5\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:14;a:4:{s:2:\"id\";i:65;s:4:\"name\";s:6:\"Deck 6\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:15;a:4:{s:2:\"id\";i:66;s:4:\"name\";s:6:\"Deck 7\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:16;a:4:{s:2:\"id\";i:67;s:4:\"name\";s:6:\"Deck 8\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:17;a:4:{s:2:\"id\";i:68;s:4:\"name\";s:6:\"Deck 9\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}}s:17:\"pineus-tilu-3-vip\";a:18:{i:0;a:4:{s:2:\"id\";i:19;s:4:\"name\";s:6:\"Deck 1\";s:14:\"default_people\";i:6;s:10:\"max_people\";i:10;}i:1;a:4:{s:2:\"id\";i:20;s:4:\"name\";s:6:\"Deck 2\";s:14:\"default_people\";i:6;s:10:\"max_people\";i:10;}i:2;a:4:{s:2:\"id\";i:21;s:4:\"name\";s:6:\"Deck 3\";s:14:\"default_people\";i:6;s:10:\"max_people\";i:10;}i:3;a:4:{s:2:\"id\";i:22;s:4:\"name\";s:6:\"Deck 4\";s:14:\"default_people\";i:6;s:10:\"max_people\";i:10;}i:4;a:4:{s:2:\"id\";i:23;s:4:\"name\";s:6:\"Deck 5\";s:14:\"default_people\";i:6;s:10:\"max_people\";i:10;}i:5;a:4:{s:2:\"id\";i:24;s:4:\"name\";s:6:\"Deck 6\";s:14:\"default_people\";i:5;s:10:\"max_people\";i:9;}i:6;a:4:{s:2:\"id\";i:25;s:4:\"name\";s:6:\"Deck 7\";s:14:\"default_people\";i:5;s:10:\"max_people\";i:9;}i:7;a:4:{s:2:\"id\";i:26;s:4:\"name\";s:6:\"Deck 8\";s:14:\"default_people\";i:5;s:10:\"max_people\";i:9;}i:8;a:4:{s:2:\"id\";i:27;s:4:\"name\";s:6:\"Deck 9\";s:14:\"default_people\";i:5;s:10:\"max_people\";i:9;}i:9;a:4:{s:2:\"id\";i:69;s:4:\"name\";s:6:\"Deck 1\";s:14:\"default_people\";i:6;s:10:\"max_people\";i:10;}i:10;a:4:{s:2:\"id\";i:70;s:4:\"name\";s:6:\"Deck 2\";s:14:\"default_people\";i:6;s:10:\"max_people\";i:10;}i:11;a:4:{s:2:\"id\";i:71;s:4:\"name\";s:6:\"Deck 3\";s:14:\"default_people\";i:6;s:10:\"max_people\";i:10;}i:12;a:4:{s:2:\"id\";i:72;s:4:\"name\";s:6:\"Deck 4\";s:14:\"default_people\";i:6;s:10:\"max_people\";i:10;}i:13;a:4:{s:2:\"id\";i:73;s:4:\"name\";s:6:\"Deck 5\";s:14:\"default_people\";i:6;s:10:\"max_people\";i:10;}i:14;a:4:{s:2:\"id\";i:74;s:4:\"name\";s:6:\"Deck 6\";s:14:\"default_people\";i:5;s:10:\"max_people\";i:9;}i:15;a:4:{s:2:\"id\";i:75;s:4:\"name\";s:6:\"Deck 7\";s:14:\"default_people\";i:5;s:10:\"max_people\";i:9;}i:16;a:4:{s:2:\"id\";i:76;s:4:\"name\";s:6:\"Deck 8\";s:14:\"default_people\";i:5;s:10:\"max_people\";i:9;}i:17;a:4:{s:2:\"id\";i:77;s:4:\"name\";s:6:\"Deck 9\";s:14:\"default_people\";i:5;s:10:\"max_people\";i:9;}}s:13:\"pineus-tilu-4\";a:42:{i:0;a:4:{s:2:\"id\";i:28;s:4:\"name\";s:6:\"Plot 1\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:1;a:4:{s:2:\"id\";i:29;s:4:\"name\";s:6:\"Plot 2\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:2;a:4:{s:2:\"id\";i:30;s:4:\"name\";s:6:\"Plot 3\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:3;a:4:{s:2:\"id\";i:31;s:4:\"name\";s:6:\"Plot 4\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:4;a:4:{s:2:\"id\";i:32;s:4:\"name\";s:6:\"Plot 5\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:5;a:4:{s:2:\"id\";i:33;s:4:\"name\";s:6:\"Plot 6\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:6;a:4:{s:2:\"id\";i:34;s:4:\"name\";s:6:\"Plot 7\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:7;a:4:{s:2:\"id\";i:35;s:4:\"name\";s:6:\"Plot 8\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:8;a:4:{s:2:\"id\";i:36;s:4:\"name\";s:6:\"Plot 9\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:9;a:4:{s:2:\"id\";i:37;s:4:\"name\";s:7:\"Plot 10\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:10;a:4:{s:2:\"id\";i:38;s:4:\"name\";s:7:\"Plot 11\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:11;a:4:{s:2:\"id\";i:39;s:4:\"name\";s:7:\"Plot 12\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:12;a:4:{s:2:\"id\";i:40;s:4:\"name\";s:7:\"Plot 13\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:13;a:4:{s:2:\"id\";i:41;s:4:\"name\";s:7:\"Plot 14\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:14;a:4:{s:2:\"id\";i:42;s:4:\"name\";s:7:\"Plot 15\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:15;a:4:{s:2:\"id\";i:43;s:4:\"name\";s:7:\"Plot 16\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:16;a:4:{s:2:\"id\";i:44;s:4:\"name\";s:7:\"Plot 17\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:17;a:4:{s:2:\"id\";i:45;s:4:\"name\";s:7:\"Plot 18\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:18;a:4:{s:2:\"id\";i:46;s:4:\"name\";s:7:\"Plot 19\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:19;a:4:{s:2:\"id\";i:47;s:4:\"name\";s:7:\"Plot 20\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:20;a:4:{s:2:\"id\";i:48;s:4:\"name\";s:7:\"Plot 21\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:21;a:4:{s:2:\"id\";i:78;s:4:\"name\";s:6:\"Plot 1\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:22;a:4:{s:2:\"id\";i:79;s:4:\"name\";s:6:\"Plot 2\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:23;a:4:{s:2:\"id\";i:80;s:4:\"name\";s:6:\"Plot 3\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:24;a:4:{s:2:\"id\";i:81;s:4:\"name\";s:6:\"Plot 4\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:25;a:4:{s:2:\"id\";i:82;s:4:\"name\";s:6:\"Plot 5\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:26;a:4:{s:2:\"id\";i:83;s:4:\"name\";s:6:\"Plot 6\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:27;a:4:{s:2:\"id\";i:84;s:4:\"name\";s:6:\"Plot 7\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:28;a:4:{s:2:\"id\";i:85;s:4:\"name\";s:6:\"Plot 8\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:29;a:4:{s:2:\"id\";i:86;s:4:\"name\";s:6:\"Plot 9\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:30;a:4:{s:2:\"id\";i:87;s:4:\"name\";s:7:\"Plot 10\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:31;a:4:{s:2:\"id\";i:88;s:4:\"name\";s:7:\"Plot 11\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:32;a:4:{s:2:\"id\";i:89;s:4:\"name\";s:7:\"Plot 12\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:33;a:4:{s:2:\"id\";i:90;s:4:\"name\";s:7:\"Plot 13\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:34;a:4:{s:2:\"id\";i:91;s:4:\"name\";s:7:\"Plot 14\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:35;a:4:{s:2:\"id\";i:92;s:4:\"name\";s:7:\"Plot 15\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:36;a:4:{s:2:\"id\";i:93;s:4:\"name\";s:7:\"Plot 16\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:37;a:4:{s:2:\"id\";i:94;s:4:\"name\";s:7:\"Plot 17\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:38;a:4:{s:2:\"id\";i:95;s:4:\"name\";s:7:\"Plot 18\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:39;a:4:{s:2:\"id\";i:96;s:4:\"name\";s:7:\"Plot 19\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:40;a:4:{s:2:\"id\";i:97;s:4:\"name\";s:7:\"Plot 20\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}i:41;a:4:{s:2:\"id\";i:98;s:4:\"name\";s:7:\"Plot 21\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:6;}}s:17:\"pineus-tilu-cabin\";a:2:{i:0;a:4:{s:2:\"id\";i:49;s:4:\"name\";s:5:\"Cabin\";s:14:\"default_people\";i:2;s:10:\"max_people\";i:5;}i:1;a:4:{s:2:\"id\";i:99;s:4:\"name\";s:5:\"Cabin\";s:14:\"default_people\";i:2;s:10:\"max_people\";i:5;}}s:22:\"pineus-tilu-cabin-vvip\";a:2:{i:0;a:4:{s:2:\"id\";i:50;s:4:\"name\";s:10:\"Cabin VVIP\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:8;}i:1;a:4:{s:2:\"id\";i:100;s:4:\"name\";s:10:\"Cabin VVIP\";s:14:\"default_people\";i:4;s:10:\"max_people\";i:8;}}}',1781451830),('bef873ce060eed910a325b85de0edf58','i:1;',1779301695),('bef873ce060eed910a325b85de0edf58:timer','i:1779301695;',1779301695),('f5e09a5bee587579a74283fc4675f769','i:1;',1779303279),('f5e09a5bee587579a74283fc4675f769:timer','i:1779303279;',1779303279),('fbe42c22654296beb8253b7807d6df27','i:2;',1779302727),('fbe42c22654296beb8253b7807d6df27:timer','i:1779302727;',1779302727),('high_season_ranges','a:1:{i:0;a:2:{s:5:\"start\";s:10:\"2025-12-20\";s:3:\"end\";s:10:\"2026-03-28\";}}',1781452131),('unit_extra_charges','a:100:{i:1;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:2;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:3;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:4;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:5;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:6;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:7;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:8;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:9;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:51;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:52;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:53;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:54;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:55;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:56;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:57;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:58;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:59;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:10;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:11;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:12;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:13;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:14;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:15;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:16;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:17;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:18;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:60;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:61;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:62;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:63;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:64;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:65;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:66;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:67;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:68;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:19;a:3:{s:14:\"default_people\";i:6;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:20;a:3:{s:14:\"default_people\";i:6;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:21;a:3:{s:14:\"default_people\";i:6;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:22;a:3:{s:14:\"default_people\";i:6;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:23;a:3:{s:14:\"default_people\";i:6;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:24;a:3:{s:14:\"default_people\";i:5;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:25;a:3:{s:14:\"default_people\";i:5;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:26;a:3:{s:14:\"default_people\";i:5;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:27;a:3:{s:14:\"default_people\";i:5;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:69;a:3:{s:14:\"default_people\";i:6;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:70;a:3:{s:14:\"default_people\";i:6;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:71;a:3:{s:14:\"default_people\";i:6;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:72;a:3:{s:14:\"default_people\";i:6;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:73;a:3:{s:14:\"default_people\";i:6;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:74;a:3:{s:14:\"default_people\";i:5;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:75;a:3:{s:14:\"default_people\";i:5;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:76;a:3:{s:14:\"default_people\";i:5;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:77;a:3:{s:14:\"default_people\";i:5;s:9:\"breakfast\";d:40000;s:4:\"full\";d:150000;}i:28;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:29;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:30;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:31;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:32;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:33;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:34;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:35;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:36;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:37;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:38;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:39;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:40;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:41;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:42;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:43;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:44;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:45;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:46;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:47;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:48;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:78;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:79;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:80;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:81;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:82;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:83;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:84;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:85;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:86;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:87;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:88;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:89;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:90;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:91;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:92;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:93;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:94;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:95;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:96;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:97;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:98;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:40000;s:4:\"full\";d:100000;}i:49;a:3:{s:14:\"default_people\";i:2;s:9:\"breakfast\";d:0;s:4:\"full\";d:0;}i:99;a:3:{s:14:\"default_people\";i:2;s:9:\"breakfast\";d:0;s:4:\"full\";d:0;}i:50;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:0;s:4:\"full\";d:0;}i:100;a:3:{s:14:\"default_people\";i:4;s:9:\"breakfast\";d:0;s:4:\"full\";d:0;}}',1781451831),('unit_prices_by_season','a:98:{i:1;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:2;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:3;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:4;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:5;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:6;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:7;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:8;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:9;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:10;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:11;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:12;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:13;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:14;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:15;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:16;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:17;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:18;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:19;a:5:{s:7:\"weekday\";d:1600000;s:7:\"weekend\";d:2000000;s:11:\"high_season\";d:2300000;s:15:\"ramadan_weekday\";d:1300000;s:15:\"ramadan_weekend\";d:1600000;}i:20;a:5:{s:7:\"weekday\";d:1600000;s:7:\"weekend\";d:2000000;s:11:\"high_season\";d:2300000;s:15:\"ramadan_weekday\";d:1300000;s:15:\"ramadan_weekend\";d:1600000;}i:21;a:5:{s:7:\"weekday\";d:1600000;s:7:\"weekend\";d:2000000;s:11:\"high_season\";d:2300000;s:15:\"ramadan_weekday\";d:1300000;s:15:\"ramadan_weekend\";d:1600000;}i:22;a:5:{s:7:\"weekday\";d:1600000;s:7:\"weekend\";d:2000000;s:11:\"high_season\";d:2300000;s:15:\"ramadan_weekday\";d:1300000;s:15:\"ramadan_weekend\";d:1600000;}i:23;a:5:{s:7:\"weekday\";d:1600000;s:7:\"weekend\";d:2000000;s:11:\"high_season\";d:2300000;s:15:\"ramadan_weekday\";d:1300000;s:15:\"ramadan_weekend\";d:1600000;}i:24;a:5:{s:7:\"weekday\";d:1500000;s:7:\"weekend\";d:1900000;s:11:\"high_season\";d:2200000;s:15:\"ramadan_weekday\";d:1200000;s:15:\"ramadan_weekend\";d:1500000;}i:25;a:5:{s:7:\"weekday\";d:1500000;s:7:\"weekend\";d:1900000;s:11:\"high_season\";d:2200000;s:15:\"ramadan_weekday\";d:1200000;s:15:\"ramadan_weekend\";d:1500000;}i:26;a:5:{s:7:\"weekday\";d:1500000;s:7:\"weekend\";d:1900000;s:11:\"high_season\";d:2200000;s:15:\"ramadan_weekday\";d:1200000;s:15:\"ramadan_weekend\";d:1500000;}i:27;a:5:{s:7:\"weekday\";d:1500000;s:7:\"weekend\";d:1900000;s:11:\"high_season\";d:2200000;s:15:\"ramadan_weekday\";d:1200000;s:15:\"ramadan_weekend\";d:1500000;}i:28;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:29;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:30;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:31;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:32;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:33;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:34;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:35;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:36;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:37;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:38;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:39;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:40;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:41;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:42;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:43;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:44;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:45;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:46;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:47;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:48;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:49;a:5:{s:7:\"weekday\";d:1500000;s:7:\"weekend\";d:1900000;s:11:\"high_season\";d:2200000;s:15:\"ramadan_weekday\";d:1200000;s:15:\"ramadan_weekend\";d:1500000;}i:50;a:5:{s:7:\"weekday\";d:2200000;s:7:\"weekend\";d:2600000;s:11:\"high_season\";d:2900000;s:15:\"ramadan_weekday\";d:1900000;s:15:\"ramadan_weekend\";d:2200000;}i:51;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:52;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:53;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:54;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:55;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:56;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:57;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:58;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:59;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:60;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:61;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:62;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:63;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:64;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:65;a:5:{s:7:\"weekday\";d:650000;s:7:\"weekend\";d:900000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:650000;}i:66;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:67;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:68;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:69;a:5:{s:7:\"weekday\";d:1600000;s:7:\"weekend\";d:2000000;s:11:\"high_season\";d:2300000;s:15:\"ramadan_weekday\";d:1300000;s:15:\"ramadan_weekend\";d:1600000;}i:70;a:5:{s:7:\"weekday\";d:1600000;s:7:\"weekend\";d:2000000;s:11:\"high_season\";d:2300000;s:15:\"ramadan_weekday\";d:1300000;s:15:\"ramadan_weekend\";d:1600000;}i:71;a:5:{s:7:\"weekday\";d:1600000;s:7:\"weekend\";d:2000000;s:11:\"high_season\";d:2300000;s:15:\"ramadan_weekday\";d:1300000;s:15:\"ramadan_weekend\";d:1600000;}i:72;a:5:{s:7:\"weekday\";d:1600000;s:7:\"weekend\";d:2000000;s:11:\"high_season\";d:2300000;s:15:\"ramadan_weekday\";d:1300000;s:15:\"ramadan_weekend\";d:1600000;}i:73;a:5:{s:7:\"weekday\";d:1600000;s:7:\"weekend\";d:2000000;s:11:\"high_season\";d:2300000;s:15:\"ramadan_weekday\";d:1300000;s:15:\"ramadan_weekend\";d:1600000;}i:74;a:5:{s:7:\"weekday\";d:1500000;s:7:\"weekend\";d:1900000;s:11:\"high_season\";d:2200000;s:15:\"ramadan_weekday\";d:1200000;s:15:\"ramadan_weekend\";d:1500000;}i:75;a:5:{s:7:\"weekday\";d:1500000;s:7:\"weekend\";d:1900000;s:11:\"high_season\";d:2200000;s:15:\"ramadan_weekday\";d:1200000;s:15:\"ramadan_weekend\";d:1500000;}i:76;a:5:{s:7:\"weekday\";d:1500000;s:7:\"weekend\";d:1900000;s:11:\"high_season\";d:2200000;s:15:\"ramadan_weekday\";d:1200000;s:15:\"ramadan_weekend\";d:1500000;}i:77;a:5:{s:7:\"weekday\";d:1500000;s:7:\"weekend\";d:1900000;s:11:\"high_season\";d:2200000;s:15:\"ramadan_weekday\";d:1200000;s:15:\"ramadan_weekend\";d:1500000;}i:78;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:79;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:80;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:81;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:82;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:83;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:84;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:85;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:86;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:87;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:88;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:89;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:90;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:91;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:92;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:93;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:94;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:95;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:96;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:97;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}i:98;a:5:{s:7:\"weekday\";d:750000;s:7:\"weekend\";d:950000;s:11:\"high_season\";d:1100000;s:15:\"ramadan_weekday\";d:500000;s:15:\"ramadan_weekend\";d:750000;}}',1781452130);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancellations`
--

DROP TABLE IF EXISTS `cancellations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancellations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `cancellation_date` date NOT NULL,
  `cancellation_fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cancelled_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_refund` decimal(15,2) NOT NULL DEFAULT '0.00',
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cancellations_booking_id_foreign` (`booking_id`),
  CONSTRAINT `cancellations_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancellations`
--

LOCK TABLES `cancellations` WRITE;
/*!40000 ALTER TABLE `cancellations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancellations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `area_id` bigint unsigned DEFAULT NULL,
  `outbound_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `facilities_area_id_foreign` (`area_id`),
  KEY `facilities_outbound_id_foreign` (`outbound_id`),
  CONSTRAINT `facilities_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `facilities_outbound_id_foreign` FOREIGN KEY (`outbound_id`) REFERENCES `outbounds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES (1,1,NULL,'4 Foam Mattresses','private','images/icons/area/kasur-busa.png','Facilities for 4 people included',NULL,'2026-05-20 18:23:54'),(2,1,NULL,'4 Pillows','private','images/icons/area/bantal.png',NULL,NULL,'2026-05-20 18:23:54'),(3,1,NULL,'4 Sleeping Bags','private','images/icons/area/kantong-tidur.png',NULL,NULL,'2026-05-20 18:23:54'),(4,1,NULL,'4 Breakfasts','private','images/icons/area/sarapan.png',NULL,NULL,'2026-05-20 18:23:54'),(5,1,NULL,'4 Floor Cushions','private','images/icons/area/kursi-bantal.png',NULL,NULL,'2026-05-20 18:23:54'),(6,1,NULL,'Coffee Table','private','images/icons/area/meja-kopi.png',NULL,NULL,'2026-05-20 18:23:54'),(7,1,NULL,'Power Outlet','private','images/icons/area/terminal.png',NULL,NULL,'2026-05-20 18:23:54'),(8,1,NULL,'Indoor & Outdoor Lights','private','images/icons/area/lampu.png',NULL,NULL,'2026-05-20 18:23:54'),(9,1,NULL,'Net Hammock (Deck 1, 2)','private','images/icons/area/hammock-jaring.png',NULL,NULL,'2026-05-20 18:23:54'),(10,1,NULL,'Private Dining Table with 4 Chairs (Deck 1, 8 & 9)','private','images/icons/area/meja-stool.png',NULL,NULL,'2026-05-20 18:23:54'),(11,1,NULL,'Private Dining Table with 4 Floor Cushions (Deck 2, 3, 4, 5, 6 & 7)','private','images/icons/area/meja-leseh.svg',NULL,NULL,'2026-05-20 18:23:54'),(12,1,NULL,'Bamboo Mat','private','images/icons/area/tikar-bambu.png',NULL,NULL,'2026-05-20 18:23:54'),(13,1,NULL,'Bathroom with Hot Water','shared','images/icons/area/shower.png',NULL,NULL,'2026-05-20 18:23:54'),(14,1,NULL,'Drinking Water & Dispenser','shared','images/icons/area/dispenser.png',NULL,NULL,'2026-05-20 18:23:54'),(15,1,NULL,'Large Communal Table','shared','images/icons/area/meja-umum.svg',NULL,NULL,'2026-05-20 18:23:54'),(16,1,NULL,'Bonfire + Bonfire Grill','shared','images/icons/area/apiunggun.png',NULL,NULL,'2026-05-20 18:23:54'),(17,1,NULL,'10 Hammocks','shared','images/icons/area/hammock.png',NULL,NULL,'2026-05-20 18:23:54'),(18,2,NULL,'4 Foam Mattresses','private','images/icons/area/kasur-busa.png',NULL,NULL,'2026-05-20 18:23:55'),(19,2,NULL,'4 Pillows','private','images/icons/area/bantal.png',NULL,NULL,'2026-05-20 18:23:55'),(20,2,NULL,'4 Sleeping Bags','private','images/icons/area/kantong-tidur.png',NULL,NULL,'2026-05-20 18:23:55'),(21,2,NULL,'4 Breakfasts','private','images/icons/area/sarapan.png',NULL,NULL,'2026-05-20 18:23:55'),(22,2,NULL,'4 Floor Cushions','private','images/icons/area/kursi-bantal.png',NULL,NULL,'2026-05-20 18:23:55'),(23,2,NULL,'Private Dining Table with 4 Floor Cushions','private','images/icons/area/meja-leseh.svg',NULL,NULL,'2026-05-20 18:23:55'),(24,2,NULL,'Power Outlet','private','images/icons/area/terminal.png',NULL,NULL,'2026-05-20 18:23:55'),(25,2,NULL,'Indoor & Outdoor Lights','private','images/icons/area/lampu.png',NULL,NULL,'2026-05-20 18:23:55'),(26,2,NULL,'Net Hammock','private','images/icons/area/hammock-jaring.png','(Deck 7, 8 & 9)',NULL,'2026-05-20 18:23:55'),(27,2,NULL,'Coffee Table','private','images/icons/area/meja-kopi.png',NULL,NULL,'2026-05-20 18:23:55'),(28,2,NULL,'Bamboo Mat','private','images/icons/area/tikar-bambu.png',NULL,NULL,'2026-05-20 18:23:55'),(29,2,NULL,'Bathroom with Hot Water','shared','images/icons/area/shower.png',NULL,NULL,'2026-05-20 18:23:55'),(30,2,NULL,'Drinking Water & Dispenser','shared','images/icons/area/dispenser.png',NULL,NULL,'2026-05-20 18:23:55'),(31,2,NULL,'Large Communal Table','shared','images/icons/area/meja-umum.svg',NULL,NULL,'2026-05-20 18:23:55'),(32,2,NULL,'Bonfire + Bonfire Grill','shared','images/icons/area/apiunggun.png',NULL,NULL,'2026-05-20 18:23:55'),(33,2,NULL,'Children\'s Play Pool','shared','images/icons/area/pool.png',NULL,NULL,'2026-05-20 18:23:55'),(34,3,NULL,'6 Foam Mattresses','private','images/icons/area/kasur-busa.png','6-person facilities for Tent 6.3 (Deck 1, 2, 3, 4, 5) includes',NULL,'2026-05-20 18:23:55'),(35,3,NULL,'6 Pillows','private','images/icons/area/bantal.png','6-person facilities for Tent 6.3 (Deck 1, 2, 3, 4, 5) includes',NULL,'2026-05-20 18:23:55'),(36,3,NULL,'6 Towels','private','images/icons/area/handuk.png','6-person facilities for Tent 6.3 (Deck 1, 2, 3, 4, 5) includes',NULL,'2026-05-20 18:23:55'),(37,3,NULL,'6 Breakfasts','private','images/icons/area/sarapan.png','6-person facilities for Tent 6.3 (Deck 1, 2, 3, 4, 5) includes',NULL,'2026-05-20 18:23:55'),(38,3,NULL,'6 Sleeping Bags','private','images/icons/area/kantong-tidur.png','6-person facilities for Tent 6.3 (Deck 1, 2, 3, 4, 5) includes',NULL,'2026-05-20 18:23:55'),(39,3,NULL,'6 Toothbrushes with Toothpaste','private','images/icons/area/sikat-gigi.png','6-person facilities for Tent 6.3 (Deck 1, 2, 3, 4, 5) includes',NULL,'2026-05-20 18:23:55'),(40,3,NULL,'5 Foam Mattresses','private','images/icons/area/kasur-busa.png','5-person facilities for Tent 5.2 (Deck 6, 7, 8, 9) includes',NULL,'2026-05-20 18:23:55'),(41,3,NULL,'5 Pillows','private','images/icons/area/bantal.png','5-person facilities for Tent 5.2 (Deck 6, 7, 8, 9) includes',NULL,'2026-05-20 18:23:55'),(42,3,NULL,'5 Towels','private','images/icons/area/handuk.png','5-person facilities for Tent 5.2 (Deck 6, 7, 8, 9) includes',NULL,'2026-05-20 18:23:55'),(43,3,NULL,'5 Breakfasts','private','images/icons/area/sarapan.png','5-person facilities for Tent 5.2 (Deck 6, 7, 8, 9) includes',NULL,'2026-05-20 18:23:55'),(44,3,NULL,'5 Sleeping Bags','private','images/icons/area/kantong-tidur.png','5-person facilities for Tent 5.2 (Deck 6, 7, 8, 9) includes',NULL,'2026-05-20 18:23:55'),(45,3,NULL,'5 Toothbrushes with Toothpaste','private','images/icons/area/sikat-gigi.png','5-person facilities for Tent 5.2 (Deck 6, 7, 8, 9) includes',NULL,'2026-05-20 18:23:55'),(46,3,NULL,'2 Hammock Swings','private','images/icons/area/hammock.png','Deck Terrace',NULL,'2026-05-20 18:23:55'),(47,3,NULL,'Net Hammock','private','images/icons/area/hammock-jaring.png','Deck Terrace',NULL,'2026-05-20 18:23:55'),(48,3,NULL,'6 Rattan Chairs','private','images/icons/area/kursi-rotan.png','Deck Terrace',NULL,'2026-05-20 18:23:55'),(49,3,NULL,'Refrigerator','private','images/icons/area/kulkas.png','Deck Terrace',NULL,'2026-05-20 18:23:55'),(50,3,NULL,'5 Power Outlets','private','images/icons/area/terminal.png','Deck Terrace',NULL,'2026-05-20 18:23:55'),(51,3,NULL,'Swing Chair','private','images/icons/area/kursi-ayun.png','Deck Terrace',NULL,'2026-05-20 18:23:55'),(52,3,NULL,'Lamp','private','images/icons/area/lampu.png','Deck Terrace',NULL,'2026-05-20 18:23:55'),(53,3,NULL,'Trash Bin','private','images/icons/area/tempat-sampah.png','Deck Terrace',NULL,'2026-05-20 18:23:55'),(54,3,NULL,'Drinking Water & Dispenser','private','images/icons/area/dispenser.png','Deck Terrace',NULL,'2026-05-20 18:23:55'),(55,3,NULL,'Pantry with table and sink','private','images/icons/area/pantry.png','Deck Terrace',NULL,'2026-05-20 18:23:55'),(56,3,NULL,'Long Solid Wood Luxury Table (80-85 cm x 2.5 m)','private','images/icons/area/meja-kayu.png','Deck Terrace',NULL,'2026-05-20 18:23:55'),(57,3,NULL,'BBQ Grill','private','images/icons/area/bbq.png','Deck Terrace',NULL,'2026-05-20 18:23:55'),(58,3,NULL,'Family Tent 6.3','private','images/icons/area/tenda.png','Deck & Tent',NULL,'2026-05-20 18:23:55'),(59,3,NULL,'Family Tent 5.2','private','images/icons/area/tenda.png','Deck & Tent',NULL,'2026-05-20 18:23:55'),(60,3,NULL,'5 Floor Cushion Seats','private','images/icons/area/kursi-bantal.png','Deck & Tent',NULL,'2026-05-20 18:23:55'),(61,3,NULL,'2 Beanbags','private','images/icons/area/beanbag.png','Deck & Tent',NULL,'2026-05-20 18:23:55'),(62,3,NULL,'Coffee Table','private','images/icons/area/meja-kopi.png','Deck & Tent',NULL,'2026-05-20 18:23:55'),(63,3,NULL,'Standing Clothes Rack','private','images/icons/area/gantungan.png','Deck & Tent',NULL,'2026-05-20 18:23:55'),(64,3,NULL,'2 Table Lamps','private','images/icons/area/lampu-meja.png','Deck & Tent',NULL,'2026-05-20 18:23:55'),(65,3,NULL,'1 Power Outlet','private','images/icons/area/terminal.png','Deck & Tent',NULL,'2026-05-20 18:23:55'),(66,3,NULL,'Indoor and Outdoor Mat','private','images/icons/area/tikar.png','Deck & Tent',NULL,'2026-05-20 18:23:55'),(67,3,NULL,'Trash Bin','private','images/icons/area/tempat-sampah.png','Deck & Tent',NULL,'2026-05-20 18:23:55'),(68,3,NULL,'5 Wooden Chairs','private','images/icons/area/kursi-kayu.png','Deck & Tent',NULL,'2026-05-20 18:23:55'),(69,3,NULL,'Carpet','private','images/icons/area/karpet.png','Deck & Tent',NULL,'2026-05-20 18:23:55'),(70,3,NULL,'Bar Table','private','images/icons/area/meja-bar.png','Deck & Tent',NULL,'2026-05-20 18:23:55'),(71,3,NULL,'Private Bathroom','private','images/icons/area/shower.png','Bathroom',NULL,'2026-05-20 18:23:55'),(72,3,NULL,'Mirror','private','images/icons/area/cermin.png','Bathroom',NULL,'2026-05-20 18:23:55'),(73,3,NULL,'Shampoo','private','images/icons/area/sampo.png','Bathroom',NULL,'2026-05-20 18:23:55'),(74,3,NULL,'Soap','private','images/icons/area/sabun.png','Bathroom',NULL,'2026-05-20 18:23:55'),(75,3,NULL,'Closet','private','images/icons/area/lemari.png','Bathroom',NULL,'2026-05-20 18:23:55'),(76,3,NULL,'Washbasin','private','images/icons/area/wastafel.png','Bathroom',NULL,'2026-05-20 18:23:55'),(77,3,NULL,'Bench','shared','images/icons/area/bangku.png',NULL,'2026-05-05 07:56:53','2026-05-20 18:23:55'),(78,3,NULL,'Trash Bin','shared','images/icons/area/tempat-sampah.png',NULL,'2026-05-05 07:56:53','2026-05-20 18:23:55'),(79,3,NULL,'Wooden Chair','shared','images/icons/area/kursi-kayu.png',NULL,'2026-05-05 07:56:53','2026-05-20 18:23:55'),(80,3,NULL,'Outdoor Lamp','shared','images/icons/area/lampu.png',NULL,'2026-05-05 07:56:53','2026-05-20 18:23:55'),(81,3,NULL,'Bonfire','shared','images/icons/area/apiunggun.png',NULL,'2026-05-05 07:56:53','2026-05-20 18:23:55'),(82,3,NULL,'5m Long Table','shared','images/icons/area/meja-panjang5m.png',NULL,'2026-05-05 07:56:53','2026-05-20 18:23:55'),(83,3,NULL,'Wooden Statue','shared','images/icons/area/patung-kayu.png',NULL,'2026-05-05 07:56:53','2026-05-20 18:23:55'),(84,3,NULL,'Wifi','shared','images/icons/area/wifi.png',NULL,'2026-05-05 07:56:53','2026-05-20 18:23:55'),(85,3,NULL,'CCTV','shared','images/icons/area/cctv.png',NULL,'2026-05-05 07:56:53','2026-05-20 18:23:55'),(86,4,NULL,'4 Foam Mattresses','private','images/icons/area/kasur-busa.png','Facilities for 4 people includes',NULL,'2026-05-20 18:23:55'),(87,4,NULL,'4 Pillows','private','images/icons/area/bantal.png',NULL,NULL,'2026-05-20 18:23:55'),(88,4,NULL,'4 Sleeping Bags','private','images/icons/area/kantong-tidur.png',NULL,NULL,'2026-05-20 18:23:55'),(89,4,NULL,'4 Breakfasts','private','images/icons/area/sarapan.png',NULL,NULL,'2026-05-20 18:23:55'),(90,4,NULL,'Private Dining Table with 6 Benches','private','images/icons/area/meja-stool.png',NULL,NULL,'2026-05-20 18:23:55'),(91,4,NULL,'Coffee Table','private','images/icons/area/meja-kopi.png',NULL,NULL,'2026-05-20 18:23:55'),(92,4,NULL,'Power Outlet','private','images/icons/area/terminal.png',NULL,NULL,'2026-05-20 18:23:55'),(93,4,NULL,'Indoor & Outdoor Lamp','private','images/icons/area/lampu.png',NULL,NULL,'2026-05-20 18:23:55'),(94,4,NULL,'All Tents Use Type 4.2','private','images/icons/area/tenda.png',NULL,NULL,'2026-05-20 18:23:55'),(95,4,NULL,'Standing Hammock','private','images/icons/area/standing.svg',NULL,NULL,'2026-05-20 18:23:55'),(96,4,NULL,'Bamboo Mat','private','images/icons/area/tikar-bambu.png',NULL,NULL,'2026-05-20 18:23:55'),(97,4,NULL,'Console Table','private','images/icons/area/meja-konsol.png',NULL,NULL,'2026-05-20 18:23:55'),(98,4,NULL,'Bathroom with Water Heater','shared','images/icons/area/shower.png',NULL,NULL,'2026-05-20 18:23:55'),(99,4,NULL,'3 Bonfires + Bonfire Grill','shared','images/icons/area/apiunggun.png',NULL,NULL,'2026-05-20 18:23:55'),(100,4,NULL,'Drinking Water & Dispenser','shared','images/icons/area/dispenser.png',NULL,NULL,'2026-05-20 18:23:55'),(101,4,NULL,'4 Shared Dining Tables','shared','images/icons/area/meja-umum.svg',NULL,NULL,'2026-05-20 18:23:55'),(102,4,NULL,'13 Hammocks','shared','images/icons/area/hammock.png',NULL,NULL,'2026-05-20 18:23:55'),(103,4,NULL,'28 Coffee Tables','shared','images/icons/area/meja-kopi.png',NULL,NULL,'2026-05-20 18:23:55'),(104,4,NULL,'Wifi','shared','images/icons/area/wifi.png',NULL,NULL,'2026-05-20 18:23:55'),(105,4,NULL,'CCTV','shared','images/icons/area/cctv.png',NULL,NULL,'2026-05-20 18:23:55'),(106,5,NULL,'King bed 180cmx200cm','private','images/icons/area/king-bed.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(107,5,NULL,'4 Pillows','private','images/icons/area/bantal.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(108,5,NULL,'3 Foam Mattresses','private','images/icons/area/kasur-busa.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(109,5,NULL,'Sleeping Bag','private','images/icons/area/kantong-tidur.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(110,5,NULL,'3 Bedside Lamps','private','images/icons/area/lampu-meja.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(111,5,NULL,'Sofa with 2 Pillows','private','images/icons/area/bantal.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(112,5,NULL,'3 Coffee Tables','private','images/icons/area/meja-kopi.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(113,5,NULL,'Comfortable Carpet','private','images/icons/area/karpet.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(114,5,NULL,'Standing Clothes Rack','private','images/icons/area/gantungan.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(115,5,NULL,'Console Table','private','images/icons/area/meja-konsol.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(116,5,NULL,'4 Power Outlets','private','images/icons/area/terminal.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(117,5,NULL,'Dispenser + Water Jug','private','images/icons/area/dispenser.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(118,5,NULL,'Smart TV','private','images/icons/area/tv.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(119,5,NULL,'Wifi','private','images/icons/area/wifi.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(120,5,NULL,'Luxury Dining Table','private','images/icons/area/meja-panjang5m.png','Terrace','2026-05-20 18:23:55','2026-05-20 18:23:55'),(121,5,NULL,'5 Rattan Chairs','private','images/icons/area/kursi-rotan.png','Terrace','2026-05-20 18:23:55','2026-05-20 18:23:55'),(122,5,NULL,'4 Log Stools','private','images/icons/area/kursi-kayu.png','Terrace','2026-05-20 18:23:55','2026-05-20 18:23:55'),(123,5,NULL,'BBQ Equipment','private','images/icons/area/peralatan-bbq.png','Terrace','2026-05-20 18:23:55','2026-05-20 18:23:55'),(124,5,NULL,'2 Hanging Lamps','private','images/icons/area/lampu.png','Terrace','2026-05-20 18:23:55','2026-05-20 18:23:55'),(125,5,NULL,'Hanging Terrace with Roof','private','images/icons/area/teras-gantung.png','Terrace','2026-05-20 18:23:55','2026-05-20 18:23:55'),(126,5,NULL,'Pantry Table','private','images/icons/area/meja-pantri.png','Pantry','2026-05-20 18:23:55','2026-05-20 18:23:55'),(127,5,NULL,'Round Washbasin','private','images/icons/area/wastafel.png','Pantry','2026-05-20 18:23:55','2026-05-20 18:23:55'),(128,5,NULL,'Refrigerator','private','images/icons/area/kulkas.png','Pantry','2026-05-20 18:23:55','2026-05-20 18:23:55'),(129,5,NULL,'Portable Stove','private','images/icons/area/kompor.png','Pantry','2026-05-20 18:23:55','2026-05-20 18:23:55'),(130,5,NULL,'BBQ Pan','private','images/icons/area/bbq.png','Pantry','2026-05-20 18:23:55','2026-05-20 18:23:55'),(131,5,NULL,'Power Outlet','private','images/icons/area/terminal.png','Pantry','2026-05-20 18:23:55','2026-05-20 18:23:55'),(132,5,NULL,'Bathtub','private','images/icons/area/bak-mandi.png','Bathroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(133,5,NULL,'Exhaust Fan','private','images/icons/area/kipas.png','Bathroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(134,5,NULL,'Cabinet','private','images/icons/area/lemari.png','Bathroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(135,5,NULL,'Hot Shower','private','images/icons/area/shower.png','Bathroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(136,5,NULL,'5 Toothbrushes + Toothpaste','private','images/icons/area/sikat-gigi.png','Bathroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(137,5,NULL,'Shampoo','private','images/icons/area/sampo.png','Bathroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(138,5,NULL,'Soap','private','images/icons/area/sabun.png','Bathroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(139,5,NULL,'Bathroom with Water Heater','shared','images/icons/area/shower.png',NULL,'2026-05-20 18:23:55','2026-05-20 18:23:55'),(140,5,NULL,'Drinking Water & Dispenser','shared','images/icons/area/dispenser.png',NULL,'2026-05-20 18:23:55','2026-05-20 18:23:55'),(141,5,NULL,'Large Shared Table','shared','images/icons/area/meja-umum.svg',NULL,'2026-05-20 18:23:55','2026-05-20 18:23:55'),(142,5,NULL,'Bonfire + Bonfire Grill','shared','images/icons/area/apiunggun.png',NULL,'2026-05-20 18:23:55','2026-05-20 18:23:55'),(143,5,NULL,'10 Hammocks','shared','images/icons/area/hammock.png',NULL,'2026-05-20 18:23:55','2026-05-20 18:23:55'),(144,5,NULL,'BBQ Grill','shared','images/icons/area/bbq.png','(does not include charcoal, food ingredients, and other supplies)','2026-05-20 18:23:55','2026-05-20 18:23:55'),(145,6,NULL,'2 bedrooms with king size beds','private','images/icons/area/king-bed.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(146,6,NULL,'4 Pillows each bedroom','private','images/icons/area/bantal.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(147,6,NULL,'2 Storage Box','private','images/icons/area/storage.svg','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(148,6,NULL,'4 Foam Mattresses','private','images/icons/area/kasur-busa.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(149,6,NULL,'Table Lamp','private','images/icons/area/lampu-meja.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(150,6,NULL,'Wifi with Special Router','private','images/icons/area/wifi.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(151,6,NULL,'Standing Clothes Rack','private','images/icons/area/gantungan.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(152,6,NULL,'Console Table with 2 Smart TV 55 inch','private','images/icons/area/meja-konsol.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(153,6,NULL,'Comfortable Carpet','private','images/icons/area/karpet.png','Bedroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(154,6,NULL,'Solid Wood Dining Table for 8 people','private','images/icons/area/meja-kayu.png','Dining & Living Room','2026-05-20 18:23:55','2026-05-20 18:23:55'),(155,6,NULL,'2 Benches','private','images/icons/area/stool.png','Dining & Living Room','2026-05-20 18:23:55','2026-05-20 18:23:55'),(156,6,NULL,'Sofa Sofabed','private','images/icons/area/sofa.png','Dining & Living Room','2026-05-20 18:23:55','2026-05-20 18:23:55'),(157,6,NULL,'Coffee Table','private','images/icons/area/meja-kopi.png','Dining & Living Room','2026-05-20 18:23:55','2026-05-20 18:23:55'),(158,6,NULL,'Shoe Rack','private','images/icons/area/rak-sepatu.png','Dining & Living Room','2026-05-20 18:23:55','2026-05-20 18:23:55'),(159,6,NULL,'Welcome Drink','private','images/icons/area/pitcher.png','Dining & Living Room','2026-05-20 18:23:55','2026-05-20 18:23:55'),(160,6,NULL,'Trash Bin','private','images/icons/area/tempat-sampah.png','Dining & Living Room','2026-05-20 18:23:55','2026-05-20 18:23:55'),(161,6,NULL,'Complete Kitchen Equipment','private','images/icons/area/peralatan-dapur.png','Kitchen','2026-05-20 18:23:55','2026-05-20 18:23:55'),(162,6,NULL,'Kitchen Island','private','images/icons/area/meja-kayu.png','Kitchen','2026-05-20 18:23:55','2026-05-20 18:23:55'),(163,6,NULL,'Refrigerator','private','images/icons/area/kulkas.png','Kitchen','2026-05-20 18:23:55','2026-05-20 18:23:55'),(164,6,NULL,'Cooler','private','images/icons/area/freezer.png','Kitchen','2026-05-20 18:23:55','2026-05-20 18:23:55'),(165,6,NULL,'Dispenser','private','images/icons/area/dispenser.png','Kitchen','2026-05-20 18:23:55','2026-05-20 18:23:55'),(166,6,NULL,'Water Gallon','private','images/icons/area/galon.png','Kitchen','2026-05-20 18:23:55','2026-05-20 18:23:55'),(167,6,NULL,'BBQ Equipment','private','images/icons/area/peralatan-bbq.png','Kitchen','2026-05-20 18:23:55','2026-05-20 18:23:55'),(168,6,NULL,'Dining Utensils','private','images/icons/area/alat-makan.png','Kitchen','2026-05-20 18:23:55','2026-05-20 18:23:55'),(169,6,NULL,'Private Toilet with Free-standing Bathtub','private','images/icons/area/bak-mandi.png','Bathroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(170,6,NULL,'Washbasin','private','images/icons/area/wastafel.png','Bathroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(171,6,NULL,'Mirror','private','images/icons/area/cermin.png','Bathroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(172,6,NULL,'8 Pax all extras','private','images/icons/area/sikat-gigi.png','Bathroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(173,6,NULL,'8 Shampoo','private','images/icons/area/sampo.png','Bathroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(174,6,NULL,'8 Soap','private','images/icons/area/sabun.png','Bathroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(175,6,NULL,'Sitting Toilet','private','images/icons/area/toilet.png','Bathroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(176,6,NULL,'8 Towels','private','images/icons/area/handuk.png','Bathroom','2026-05-20 18:23:55','2026-05-20 18:23:55'),(177,6,NULL,'2 Hammock','private','images/icons/area/hammock.png','Additional','2026-05-20 18:23:55','2026-05-20 18:23:55'),(178,6,NULL,'12 meter Bar Table','private','images/icons/area/meja-bar.png','Additional','2026-05-20 18:23:55','2026-05-20 18:23:55'),(179,6,NULL,'6 Benches','private','images/icons/area/stool.png','Additional','2026-05-20 18:23:55','2026-05-20 18:23:55'),(180,6,NULL,'2 Paintings','private','images/icons/area/lukisan.png','Additional','2026-05-20 18:23:55','2026-05-20 18:23:55'),(181,6,NULL,'Bathroom with Water Heater','shared','images/icons/area/shower.png',NULL,'2026-05-20 18:23:55','2026-05-20 18:23:55'),(182,6,NULL,'3 Bonfires + Bonfire Grill','shared','images/icons/area/apiunggun.png',NULL,'2026-05-20 18:23:55','2026-05-20 18:23:55'),(183,6,NULL,'Drinking Water & Dispenser','shared','images/icons/area/dispenser.png',NULL,'2026-05-20 18:23:55','2026-05-20 18:23:55'),(184,6,NULL,'4 Shared Dining Tables','shared','images/icons/area/meja-umum.svg',NULL,'2026-05-20 18:23:55','2026-05-20 18:23:55'),(185,6,NULL,'13 Hammock','shared','images/icons/area/hammock.png',NULL,'2026-05-20 18:23:55','2026-05-20 18:23:55'),(186,6,NULL,'28 Coffee Tables','shared','images/icons/area/meja-kopi.png',NULL,'2026-05-20 18:23:55','2026-05-20 18:23:55'),(187,6,NULL,'Wifi','shared','images/icons/area/wifi.png',NULL,'2026-05-20 18:23:55','2026-05-20 18:23:55'),(188,6,NULL,'CCTV','shared','images/icons/area/cctv.png',NULL,'2026-05-20 18:23:55','2026-05-20 18:23:55');
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_index` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faqs_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'check-availability','How to check availability?','<p>To check tent availability updates, please visit the following link:</p><ul class=\"list-disc ml-5 mt-2 space-y-1\"><li>Link: <a href=\"https://bit.ly/pineustilu-availabilities\" target=\"_blank\" rel=\"noopener\" class=\"text-green-600 underline\">bit.ly/pineustilu-availabilities</a><br><em>(You can scroll left or right to see availability)</em></li><li><strong>Green</strong> = Available</li><li><strong>Yellow</strong> = Available with special price</li><li><strong>Red</strong> = Fully booked</li></ul><p class=\"mt-3\"><strong>Note:</strong> Availability can change quickly. For example, a tent may be available during the day but fully booked by evening or the next day, as bookings are open daily. Always check the calendar or close &amp; reopen the link to see the latest updates.</p>',1,'2026-05-05 07:56:54','2026-05-05 07:56:54'),(2,'refundable-balance','We received an email about a refundable balance. Can it be saved first, or must it be refunded immediately?','<p>For overpayments, they can be saved first if you wish to use them for other additional orders. However, you can also request a refund.</p>',2,'2026-05-05 07:56:54','2026-05-05 07:56:54'),(3,'play-in-river','Can we play in the river?','<p>Yes. Direct river access is only available in the public area of Pineus Tilu II.</p>',3,'2026-05-05 07:56:54','2026-05-05 07:56:54'),(4,'best-views','Best views?','<p>Each deck and plot has its own unique features. Admin can only assist by providing documentation.</p>',4,'2026-05-05 07:56:54','2026-05-05 07:56:54'),(5,'camp-as-couple','Can we camp as a couple?','<p>Sorry, unmarried couples are not permitted to stay together if there are only two of them.</p>',5,'2026-05-05 07:56:54','2026-05-05 07:56:54'),(6,'riverside-location','Which ones are located by the riverside?','<p>All decks are located by the riverside. However, <strong>Deck 1, 2, 8, and 9 at Pineus Tilu I</strong>, as well as <strong>Cabin Deck at Pineus Tilu III VIP</strong>, are positioned at a higher elevation compared to other decks.</p>',6,'2026-05-05 07:56:54','2026-05-05 07:56:54'),(7,'plot-vs-deck','What is the difference between plot and deck?','<p>\"Deck\" refers to areas at Pineus Tilu I, II, and III VIP, while \"plot\" refers to Pineus Tilu IV. The difference is only in the naming.</p>',7,'2026-05-05 07:56:54','2026-05-05 07:56:54'),(8,'booking-down-payment','How much is the down payment (DP) for booking?','<p>For reservations, the payment system requires <strong>100% full payment</strong>. However, if you book a minimum of 9 tents, the down payment (DP) system is available. The initial payment in this case is <strong>25%</strong>.</p>',8,'2026-05-05 07:56:54','2026-05-05 07:56:54'),(9,'guest-loyalty-program','GLP (Guest Loyalty Program)','<p><strong>Guest Loyalty Program</strong> is a special promo that can be claimed if you have camped here before. Simply show proof of your previous camping reservation to get the special promo price, available only on weekdays.</p>',9,'2026-05-05 07:56:54','2026-05-05 07:56:54'),(10,'reservation-on-site','Can we make a reservation directly on-site?','<p>Yes, you can book a tent directly at the reception. However, tent availability will depend on the schedule shown at the following link:</p><p class=\"mt-2\">Link: <a href=\"https://bit.ly/pineustilu-availabilities\" target=\"_blank\" rel=\"noopener\" class=\"text-green-600 underline\">bit.ly/pineustilu-availabilities</a></p>',10,'2026-05-05 07:56:54','2026-05-05 07:56:54'),(11,'agent-price-per-tent','Are there agent prices per tent?','<p>For camping bookings of 9 tents or more, you are entitled to a <strong>5% cashback</strong> discount from the total tent/deck rental fee.</p>',11,'2026-05-05 07:56:54','2026-05-05 07:56:54'),(12,'parking-distance','Is the distance from parking to tent far?','<p>The distance from the parking area to the camping area is approximately <strong>300 meters</strong>.</p>',12,'2026-05-05 07:56:54','2026-05-05 07:56:54'),(13,'large-bus-access','Can large buses enter?','<p>Yes, small, medium, and large buses can enter. However, after passing the intersection to Pineus Tilu, there is usually escort assistance (both on arrival and departure) to avoid traffic jams when buses pass from opposite directions.</p><p class=\"mt-2\">The escort fee is approximately <strong>IDR 200,000 per bus</strong>.</p>',13,'2026-05-05 07:56:54','2026-05-05 07:56:54');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `area_id` bigint unsigned DEFAULT NULL,
  `facility_id` bigint unsigned DEFAULT NULL,
  `outbound_id` bigint unsigned DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_area_id_foreign` (`area_id`),
  KEY `galleries_facility_id_foreign` (`facility_id`),
  KEY `galleries_outbound_id_foreign` (`outbound_id`),
  CONSTRAINT `galleries_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `galleries_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `galleries_outbound_id_foreign` FOREIGN KEY (`outbound_id`) REFERENCES `outbounds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,NULL,NULL,NULL,'images/dashboard/suasana.JPG','Pineus Tilu Ambiance - Hero Image','dashboard_header','2026-05-05 07:56:53','2026-05-05 07:56:53'),(2,NULL,NULL,NULL,'images/dashboard/fullmap.jpeg','Pineus Tilu Location Map','dashboard_map','2026-05-05 07:56:53','2026-05-05 07:56:53'),(3,NULL,NULL,NULL,'images/dashboard/tenda.jpg','Glamping Tent','dashboard_galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(4,NULL,NULL,NULL,'images/dashboard/pemulihan.jpg','Recovery Area','dashboard_galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(5,NULL,NULL,NULL,'images/dashboard/aktifitas.JPG','Activities','dashboard_galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(6,NULL,NULL,NULL,'images/dashboard/apiunggun.jpg','Bonfire','dashboard_galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(7,NULL,NULL,NULL,'images/dashboard/siap.jpg','Ready-to-Use Tent','dashboard_galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(8,1,NULL,NULL,'images/area-galeri/pt-1/PT1.webp','Header Image - Pineus Tilu 1','header','2026-05-05 07:56:53','2026-05-05 07:56:53'),(9,1,NULL,NULL,'images/deck/pt1_deck.svg','Skema Deck - Pineus Tilu 1','skema_deck','2026-05-05 07:56:53','2026-05-05 07:56:53'),(10,1,NULL,NULL,'images/tent/4.0.webp','Tent - Pineus Tilu 1 - 1','tent','2026-05-05 07:56:53','2026-05-05 07:56:53'),(11,1,NULL,NULL,'images/tent/4.2.jpg','Tent - Pineus Tilu 1 - 2','tent','2026-05-05 07:56:53','2026-05-05 07:56:53'),(12,1,NULL,NULL,'images/area-galeri/pt-1/galeri1-pt1.jpeg','Galeri Pineus Tilu 1 - 1','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(13,1,NULL,NULL,'images/area-galeri/pt-1/galeri2-pt1.jpeg','Galeri Pineus Tilu 1 - 2','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(14,1,NULL,NULL,'images/area-galeri/pt-1/galeri3-pt1.jpg','Galeri Pineus Tilu 1 - 3','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(15,1,NULL,NULL,'images/area-galeri/pt-1/galeri4-pt1.jpg','Galeri Pineus Tilu 1 - 4','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(16,1,NULL,NULL,'images/area-galeri/pt-1/galeri5-pt1.jpeg','Galeri Pineus Tilu 1 - 5','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(17,1,NULL,NULL,'images/area-galeri/pt-1/galeri6-pt1.jpg','Galeri Pineus Tilu 1 - 6','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(18,2,NULL,NULL,'images/area-galeri/pt-2/main.jpg','Header Image - Pineus Tilu 2','header','2026-05-05 07:56:53','2026-05-05 07:56:53'),(19,2,NULL,NULL,'images/deck/pt2_deck.svg','Skema Deck - Pineus Tilu 2','skema_deck','2026-05-05 07:56:53','2026-05-05 07:56:53'),(20,2,NULL,NULL,'images/tent/4.0.webp','Tent - Pineus Tilu 2 - 1','tent','2026-05-05 07:56:53','2026-05-05 07:56:53'),(21,2,NULL,NULL,'images/tent/4.2.jpg','Tent - Pineus Tilu 2 - 2','tent','2026-05-05 07:56:53','2026-05-05 07:56:53'),(22,2,NULL,NULL,'images/area-galeri/pt-1/galeri1-pt1.jpeg','Galeri Pineus Tilu 2 - 1','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(23,2,NULL,NULL,'images/area-galeri/pt-1/galeri2-pt1.jpeg','Galeri Pineus Tilu 2 - 2','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(24,2,NULL,NULL,'images/area-galeri/pt-1/galeri3-pt1.jpg','Galeri Pineus Tilu 2 - 3','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(25,2,NULL,NULL,'images/area-galeri/pt-1/galeri4-pt1.jpg','Galeri Pineus Tilu 2 - 4','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(26,2,NULL,NULL,'images/area-galeri/pt-1/galeri5-pt1.jpeg','Galeri Pineus Tilu 2 - 5','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(27,2,NULL,NULL,'images/area-galeri/pt-1/galeri6-pt1.jpg','Galeri Pineus Tilu 2 - 6','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(28,3,NULL,NULL,'images/area-galeri/pt-3/main.jpg','Header Image - Pineus Tilu 3 VIP','header','2026-05-05 07:56:53','2026-05-05 07:56:53'),(29,3,NULL,NULL,'images/deck/pt3vip_deck.svg','Skema Deck - Pineus Tilu 3 VIP','skema_deck','2026-05-05 07:56:53','2026-05-05 07:56:53'),(30,3,NULL,NULL,'images/tent/5.2.png','Tent - Pineus Tilu 3 VIP','tent','2026-05-05 07:56:53','2026-05-05 07:56:53'),(31,3,NULL,NULL,'images/area-galeri/pt-3/gallery1.png','Galeri Pineus Tilu 3 VIP - 1','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(32,3,NULL,NULL,'images/area-galeri/pt-3/gallery2.png','Galeri Pineus Tilu 3 VIP - 2','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(33,3,NULL,NULL,'images/area-galeri/pt-3/gallery3.png','Galeri Pineus Tilu 3 VIP - 3','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(34,3,NULL,NULL,'images/area-galeri/pt-3/gallery4.png','Galeri Pineus Tilu 3 VIP - 4','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(35,3,NULL,NULL,'images/area-galeri/pt-3/gallery5.png','Galeri Pineus Tilu 3 VIP - 5','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(36,3,NULL,NULL,'images/area-galeri/pt-3/gallery6.png','Galeri Pineus Tilu 3 VIP - 6','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(37,4,NULL,NULL,'images/area-galeri/pt-4/main.jpg','Header Image - Pineus Tilu 4','header','2026-05-05 07:56:53','2026-05-05 07:56:53'),(38,4,NULL,NULL,'images/deck/pt4_deck.svg','Skema Deck - Pineus Tilu 4','skema_deck','2026-05-05 07:56:53','2026-05-05 07:56:53'),(39,4,NULL,NULL,'images/tent/6.3.png','Tent - Pineus Tilu 4','tent','2026-05-05 07:56:53','2026-05-05 07:56:53'),(40,4,NULL,NULL,'images/area-galeri/pt-1/galeri1-pt1.jpeg','Galeri Pineus Tilu 4 - 1','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(41,4,NULL,NULL,'images/area-galeri/pt-1/galeri2-pt1.jpeg','Galeri Pineus Tilu 4 - 2','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(42,4,NULL,NULL,'images/area-galeri/pt-1/galeri3-pt1.jpg','Galeri Pineus Tilu 4 - 3','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(43,4,NULL,NULL,'images/area-galeri/pt-1/galeri4-pt1.jpg','Galeri Pineus Tilu 4 - 4','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(44,4,NULL,NULL,'images/area-galeri/pt-1/galeri5-pt1.jpeg','Galeri Pineus Tilu 4 - 5','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(45,4,NULL,NULL,'images/area-galeri/pt-1/galeri6-pt1.jpg','Galeri Pineus Tilu 4 - 6','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(46,5,NULL,NULL,'images/area-galeri/pt-cabin/main.webp','Header Image - Pineus Tilu Cabin','header','2026-05-05 07:56:53','2026-05-05 07:56:53'),(47,5,NULL,NULL,'images/deck/ptcabinvip_deck.svg','Skema Deck - Pineus Tilu Cabin','skema_deck','2026-05-05 07:56:53','2026-05-05 07:56:53'),(48,5,NULL,NULL,'images/area-galeri/pt-cabin/galericabinvip1.jpg','Galeri Cabin VIP - 1','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(49,5,NULL,NULL,'images/area-galeri/pt-cabin/galericabinvip2.jpg','Galeri Cabin VIP - 2','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(50,5,NULL,NULL,'images/area-galeri/pt-cabin/galericabinvip3.jpg','Galeri Cabin VIP - 3','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(51,5,NULL,NULL,'images/area-galeri/pt-cabin/galericabinvip4.jpg','Galeri Cabin VIP - 4','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(52,5,NULL,NULL,'images/area-galeri/pt-cabin/galericabinvip5.jpeg','Galeri Cabin VIP - 5','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(53,5,NULL,NULL,'images/area-galeri/pt-cabin/galericabinvip6.jpg','Galeri Cabin VIP - 6','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(54,6,NULL,NULL,'images/area-galeri/pt-cabin-vvip/main.jpeg','Header Image - Pineus Tilu Cabin VVIP','header','2026-05-05 07:56:53','2026-05-05 07:56:53'),(55,6,NULL,NULL,'images/deck/ptcabinvvip_deck.svg','Skema Deck - Pineus Tilu Cabin VVIP','skema_deck','2026-05-05 07:56:53','2026-05-05 07:56:53'),(56,6,NULL,NULL,'images/area-galeri/pt-cabin-vvip/livingroom.jpeg','Galeri Cabin VVIP - Living Room','galeri','2026-05-05 07:56:53','2026-05-05 07:56:53'),(57,6,NULL,NULL,'images/area-galeri/pt-cabin-vvip/bedroom.jpeg','Galeri Cabin VVIP - Bedroom','galeri','2026-05-05 07:56:54','2026-05-05 07:56:54'),(58,6,NULL,NULL,'images/area-galeri/pt-cabin-vvip/toilet.jpeg','Galeri Cabin VVIP - Toilet','galeri','2026-05-05 07:56:54','2026-05-05 07:56:54'),(59,6,NULL,NULL,'images/area-galeri/pt-cabin-vvip/kitchen.jpeg','Galeri Cabin VVIP - Kitchen','galeri','2026-05-05 07:56:54','2026-05-05 07:56:54'),(60,6,NULL,NULL,'images/area-galeri/pt-cabin-vvip/diningroom.jpeg','Galeri Cabin VVIP - Dining Room','galeri','2026-05-05 07:56:54','2026-05-05 07:56:54'),(61,6,NULL,NULL,'images/area-galeri/pt-cabin-vvip/teras.jpeg','Galeri Cabin VVIP - Teras','galeri','2026-05-05 07:56:54','2026-05-05 07:56:54'),(62,NULL,NULL,1,'images/aktivitas-galeri/arungjeram1.jpg','Rafting Activity','outbound','2026-05-05 07:56:54','2026-05-05 07:56:54'),(63,NULL,NULL,1,'images/aktivitas-galeri/arungjeram2.jpg','Rafting Activity 2','outbound','2026-05-05 07:56:54','2026-05-05 07:56:54'),(64,NULL,NULL,2,'images/aktivitas-galeri/flyingfox.jpg','Flying Fox Activity','outbound','2026-05-05 07:56:54','2026-05-05 07:56:54'),(65,NULL,NULL,3,'images/aktivitas-galeri/offroad.jpg','Offroad Activity','outbound','2026-05-05 07:56:54','2026-05-05 07:56:54'),(66,NULL,NULL,4,'images/aktivitas-galeri/funatv.jpg','Fun ATV Activity','outbound','2026-05-05 07:56:54','2026-05-05 07:56:54'),(67,NULL,NULL,5,'images/aktivitas-galeri/paintball.jpg','Paintball Activity','outbound','2026-05-05 07:56:54','2026-05-05 07:56:54'),(68,NULL,NULL,6,'images/aktivitas-galeri/teambuilding.jpeg','Team Building Activity','outbound','2026-05-05 07:56:54','2026-05-05 07:56:54');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` bigint unsigned DEFAULT NULL,
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoices_invoice_number_unique` (`invoice_number`),
  KEY `invoices_payment_id_foreign` (`payment_id`),
  CONSTRAINT `invoices_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_items_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Amenities','Foam mattress, sleeping bag, breakfast','pax',100000.00,NULL,'2026-05-20 18:23:54'),(2,'Amenities VIP','Foam mattress, sleeping bag, breakfast, and toiletries','pax',150000.00,NULL,'2026-05-20 18:23:54'),(3,'Extra Breakfast','Buffet - all you can eat','pax',40000.00,NULL,'2026-05-20 18:23:54'),(4,'Bathroom Tools Set','1 Towels, 1 Toothbrush + Toothpaste','set',25000.00,NULL,'2026-05-20 18:23:54'),(5,'Portable Stove Set','Includes 1 stove, 1 gas cylinder, 1 frying pan, 1 pot, and 1 tong','set',100000.00,NULL,'2026-05-20 18:23:54'),(6,'Cutlery','Includes 1 plate with rice paper, 1 plastic spoon & fork, 1 chopsticks, 1 paper cup, and 1 paper bowl','set',15000.00,NULL,'2026-05-20 18:23:54'),(7,'Charcoal',NULL,'bag',50000.00,NULL,'2026-05-20 18:23:54'),(8,'Campfire Woods',NULL,'bundle',50000.00,NULL,'2026-05-20 18:23:54'),(9,'Beef Sirloin','4pcs/500g','pack',98000.00,NULL,'2026-05-20 18:23:54'),(10,'Beef Slice Short Plate','500g','pack',79000.00,NULL,'2026-05-20 18:23:54'),(11,'Beef Slice Low Fat','500g','pack',85000.00,NULL,'2026-05-20 18:23:54'),(12,'Sosis Cocktail Original','small size 500g','pack',29000.00,NULL,'2026-05-20 18:23:54'),(13,'Sosis Beef Frank Original','medium size 500g','pack',29000.00,NULL,'2026-05-20 18:23:54'),(14,'Super Meatball','35pcs - 38pcs/500g','pack',35000.00,NULL,'2026-05-20 18:23:54'),(15,'BBQ Sauce','1 bottle 300ml','bottle',39000.00,NULL,'2026-05-20 18:23:54'),(16,'Bulgogi Sauce','1 bottle 300ml','bottle',39000.00,NULL,'2026-05-20 18:23:54'),(17,'Gochujang Sauce','1 bottle 300ml','bottle',39000.00,NULL,'2026-05-20 18:23:54'),(18,'Blackpepper Teriyaki Sauce','1 bottle 300ml','bottle',29000.00,NULL,'2026-05-20 18:23:54'),(19,'Garlic Teriyaki Sauce','1 bottle 300ml','bottle',29000.00,NULL,'2026-05-20 18:23:54'),(20,'Korean BBQ Sauce','1 bottle 500ml','bottle',55000.00,NULL,'2026-05-20 18:23:54');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_09_22_145432_add_two_factor_columns_to_users_table',1),(5,'2025_11_25_000001_create_faqs_table',1),(6,'2025_11_25_000002_create_areas_table',1),(7,'2025_11_25_000004_create_season_dates_table',1),(8,'2025_11_25_000005_create_area_units_table',1),(9,'2025_11_25_000006_create_items_table',1),(10,'2025_11_25_000007_create_outbonds_table',1),(11,'2025_11_25_000010_create_bookings_table',1),(12,'2025_11_25_000011_create_booking_details_table',1),(13,'2025_11_25_000013_create_payments_table',1),(14,'2025_11_25_000014_create_reschedules_table',1),(15,'2025_11_25_000015_create_invoices_table',1),(16,'2025_11_25_000016_create_cancellations_table',1),(17,'2025_11_25_000017_create_facilities_table',1),(18,'2025_11_25_000018_create_galleries_table',1),(19,'2025_11_25_111945_create_permission_tables',1),(20,'2025_12_11_052641_create_spot_combinations_table',1),(21,'2025_12_11_092651_outbound_variants',1),(22,'2025_12_11_092652_create_prices_table',1),(23,'2025_12_11_092653_create_booking_outbonds_table',1),(24,'2025_12_28_000001_add_indexes_and_null_on_delete',1),(25,'2026_01_17_090727_add_price_to_items_table',1),(26,'2026_01_21_122522_add_indexes_for_performance',1),(27,'2026_04_17_000001_create_otp_verifications_table',2),(28,'2026_04_17_000002_add_phone_verified_at_to_users_table',2),(29,'2026_04_18_000001_add_special_notes_to_bookings_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(3,'App\\Models\\User',2),(3,'App\\Models\\User',3),(3,'App\\Models\\User',4);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_verifications`
--

DROP TABLE IF EXISTS `otp_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_verifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` timestamp NOT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `otp_verifications_phone_number_index` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_verifications`
--

LOCK TABLES `otp_verifications` WRITE;
/*!40000 ALTER TABLE `otp_verifications` DISABLE KEYS */;
INSERT INTO `otp_verifications` VALUES (2,'+628817782553','$2y$12$E6LomyNsiQoX0kwV6iTqXe/I3E7o97HurMRcroU15nO.f2ctNkR/W','2026-05-20 18:54:39',0,'2026-05-20 18:39:39','2026-05-20 18:39:39');
/*!40000 ALTER TABLE `otp_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_variants`
--

DROP TABLE IF EXISTS `outbound_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outbound_variants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `outbound_id` bigint unsigned NOT NULL,
  `variant_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_pax_per_unit` int DEFAULT NULL,
  `max_pax_per_unit` int DEFAULT NULL,
  `includes_documentation` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `outbound_variants_outbound_id_foreign` (`outbound_id`),
  CONSTRAINT `outbound_variants_outbound_id_foreign` FOREIGN KEY (`outbound_id`) REFERENCES `outbounds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_variants`
--

LOCK TABLES `outbound_variants` WRITE;
/*!40000 ALTER TABLE `outbound_variants` DISABLE KEYS */;
INSERT INTO `outbound_variants` VALUES (1,1,'capacity_based','1 Boat < 4 people',1,3,0,1,1,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(2,1,'capacity_based','1 Boat 4 people',4,4,1,1,2,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(3,1,'capacity_based','1 Boat 5 people',5,5,1,1,3,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(4,1,'capacity_based','1 Boat 6 people',6,6,1,1,4,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(5,4,'single','Single (1 pax)',1,1,0,1,1,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(6,4,'double','Double (2 pax)',2,2,0,1,2,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(7,1,'capacity_based','1 Boat < 4 people',1,3,0,1,1,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(8,1,'capacity_based','1 Boat 4 people',4,4,1,1,2,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(9,1,'capacity_based','1 Boat 5 people',5,5,1,1,3,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(10,1,'capacity_based','1 Boat 6 people',6,6,1,1,4,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(11,4,'single','Single (1 pax)',1,1,0,1,1,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(12,4,'double','Double (2 pax)',2,2,0,1,2,'2026-05-20 18:23:54','2026-05-20 18:23:54');
/*!40000 ALTER TABLE `outbound_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbounds`
--

DROP TABLE IF EXISTS `outbounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outbounds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `pricing_type` enum('per_pax','per_unit') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'per_pax',
  `unit_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_participants` int NOT NULL DEFAULT '1',
  `max_participants` int DEFAULT NULL,
  `min_age` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `distance` decimal(8,2) DEFAULT NULL,
  `has_variants` tinyint(1) NOT NULL DEFAULT '0',
  `allows_documentation_addon` tinyint(1) NOT NULL DEFAULT '0',
  `requires_transportation` tinyint(1) NOT NULL DEFAULT '1',
  `has_camping_package` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `outbounds_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbounds`
--

LOCK TABLES `outbounds` WRITE;
/*!40000 ALTER TABLE `outbounds` DISABLE KEYS */;
INSERT INTO `outbounds` VALUES (1,'Rafting','arung-jeram','Guide & rescue team, first aid kit/safety equipment, rinse area, insurance, local transportation & instructor, documentation (photos and videos). Duration 5 Km (~90 minutes).','per_unit','boat',1,NULL,10,90,5.00,1,1,0,1,1,1,'2026-05-05 07:56:52','2026-05-20 18:23:54'),(2,'Flying Fox','flying-fox','Safety harness, includes instructor, ticket, first aid kit/safety equipment. Length 200 meters with 12 meters height.','per_pax',NULL,4,NULL,6,30,0.20,0,0,1,0,1,2,'2026-05-05 07:56:52','2026-05-20 18:23:54'),(3,'Offroad','offroad','Land Rover offroad unit, includes driver, instructor, first aid kit/safety equipment, insurance, local transportation and ticket. Duration 9 Km (~120 minutes).','per_unit','car',1,7,4,120,9.00,0,0,0,0,1,3,'2026-05-05 07:56:52','2026-05-20 18:23:54'),(4,'Fun ATV','fun-atv','ATV unit, helmet, instructor, first aid kit/safety equipment, insurance & ticket. Duration 4 Km (60 minutes).','per_pax','atv',1,2,5,60,4.00,1,0,1,0,1,4,'2026-05-05 07:56:52','2026-05-20 18:23:54'),(5,'Paintball','paintball','Uniform, protective vest, mask/goggles, paintball marker/gun, 30 bullets, includes instructor, ticket, first aid kit/safety equipment.','per_pax',NULL,10,70,13,120,NULL,0,0,1,0,1,5,'2026-05-05 07:56:52','2026-05-20 18:23:54'),(6,'Team Building','team-building','Equipment, includes instructor, sound system & first aid kit/safety equipment.','per_pax',NULL,5,100,11,120,NULL,0,0,1,0,1,6,'2026-05-05 07:56:52','2026-05-20 18:23:54');
/*!40000 ALTER TABLE `outbounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
INSERT INTO `password_reset_tokens` VALUES ('zainul.ariffinihsan@gmail.com','$2y$12$TuO7SPqRuoeHNUu1F6dgIO7Dn9kdiNdP5f09I41ecqpi2WnvwCPQm','2026-05-20 18:30:54');
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fraud_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gross_amount` decimal(15,2) NOT NULL,
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `va_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_string` text COLLATE utf8mb4_unicode_ci,
  `deeplink_url` text COLLATE utf8mb4_unicode_ci,
  `snaptoken` text COLLATE utf8mb4_unicode_ci,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_order_id_unique` (`order_id`),
  KEY `payments_booking_id_foreign` (`booking_id`),
  CONSTRAINT `payments_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'view users','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(2,'create users','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(3,'edit users','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(4,'delete users','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(5,'view bookings','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(6,'create bookings','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(7,'edit bookings','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(8,'delete bookings','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(9,'approve bookings','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(10,'cancel bookings','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(11,'view areas','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(12,'create areas','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(13,'edit areas','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(14,'delete areas','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(15,'view facilities','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(16,'create facilities','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(17,'edit facilities','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(18,'delete facilities','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(19,'view galleries','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(20,'create galleries','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(21,'edit galleries','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(22,'delete galleries','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(23,'view items','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(24,'create items','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(25,'edit items','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(26,'delete items','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(27,'view outbounds','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(28,'create outbounds','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(29,'edit outbounds','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(30,'delete outbounds','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(31,'view prices','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(32,'create prices','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(33,'edit prices','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(34,'delete prices','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(35,'view payments','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(36,'process payments','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(37,'refund payments','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(38,'view reports','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(39,'export reports','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(40,'manage settings','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(41,'manage roles','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(42,'manage permissions','web','2026-05-05 07:56:51','2026-05-05 07:56:51');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` bigint unsigned DEFAULT NULL,
  `item_id` bigint unsigned DEFAULT NULL,
  `outbound_id` bigint unsigned DEFAULT NULL,
  `outbound_variant_id` bigint unsigned DEFAULT NULL,
  `season_id` bigint unsigned DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prices_outbound_id_foreign` (`outbound_id`),
  KEY `prices_outbound_variant_id_foreign` (`outbound_variant_id`),
  KEY `prices_season_id_index` (`season_id`),
  KEY `prices_item_id_foreign` (`item_id`),
  KEY `idx_prices_unit_season` (`unit_id`,`season_id`),
  CONSTRAINT `prices_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE SET NULL,
  CONSTRAINT `prices_outbound_id_foreign` FOREIGN KEY (`outbound_id`) REFERENCES `outbounds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `prices_outbound_variant_id_foreign` FOREIGN KEY (`outbound_variant_id`) REFERENCES `outbound_variants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `prices_season_id_foreign` FOREIGN KEY (`season_id`) REFERENCES `season_dates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `prices_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `area_units` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=779 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,1,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(2,2,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(3,3,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(4,4,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(5,5,NULL,NULL,NULL,1,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(6,6,NULL,NULL,NULL,1,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(7,7,NULL,NULL,NULL,1,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(8,8,NULL,NULL,NULL,1,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(9,9,NULL,NULL,NULL,1,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(10,1,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(11,2,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(12,3,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(13,4,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(14,5,NULL,NULL,NULL,2,900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(15,6,NULL,NULL,NULL,2,900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(16,7,NULL,NULL,NULL,2,900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(17,8,NULL,NULL,NULL,2,900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(18,9,NULL,NULL,NULL,2,900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(19,1,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(20,2,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(21,3,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(22,4,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(23,5,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(24,6,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(25,7,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(26,8,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(27,9,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(28,10,NULL,NULL,NULL,1,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(29,11,NULL,NULL,NULL,1,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(30,12,NULL,NULL,NULL,1,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(31,13,NULL,NULL,NULL,1,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(32,14,NULL,NULL,NULL,1,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(33,15,NULL,NULL,NULL,1,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(34,16,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(35,17,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(36,18,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(37,10,NULL,NULL,NULL,2,900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(38,11,NULL,NULL,NULL,2,900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(39,12,NULL,NULL,NULL,2,900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(40,13,NULL,NULL,NULL,2,900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(41,14,NULL,NULL,NULL,2,900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(42,15,NULL,NULL,NULL,2,900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(43,16,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(44,17,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(45,18,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(46,10,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(47,11,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(48,12,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(49,13,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(50,14,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(51,15,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(52,16,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(53,17,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(54,18,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(55,19,NULL,NULL,NULL,1,1600000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(56,20,NULL,NULL,NULL,1,1600000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(57,21,NULL,NULL,NULL,1,1600000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(58,22,NULL,NULL,NULL,1,1600000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(59,23,NULL,NULL,NULL,1,1600000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(60,24,NULL,NULL,NULL,1,1500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(61,25,NULL,NULL,NULL,1,1500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(62,26,NULL,NULL,NULL,1,1500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(63,27,NULL,NULL,NULL,1,1500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(64,19,NULL,NULL,NULL,2,2000000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(65,20,NULL,NULL,NULL,2,2000000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(66,21,NULL,NULL,NULL,2,2000000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(67,22,NULL,NULL,NULL,2,2000000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(68,23,NULL,NULL,NULL,2,2000000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(69,24,NULL,NULL,NULL,2,1900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(70,25,NULL,NULL,NULL,2,1900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(71,26,NULL,NULL,NULL,2,1900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(72,27,NULL,NULL,NULL,2,1900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(73,19,NULL,NULL,NULL,3,2300000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(74,20,NULL,NULL,NULL,3,2300000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(75,21,NULL,NULL,NULL,3,2300000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(76,22,NULL,NULL,NULL,3,2300000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(77,23,NULL,NULL,NULL,3,2300000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(78,24,NULL,NULL,NULL,3,2200000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(79,25,NULL,NULL,NULL,3,2200000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(80,26,NULL,NULL,NULL,3,2200000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(81,27,NULL,NULL,NULL,3,2200000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(82,28,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(83,29,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(84,30,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(85,31,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(86,32,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(87,33,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(88,34,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(89,35,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(90,36,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(91,37,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(92,38,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(93,39,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(94,40,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(95,41,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(96,42,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(97,43,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(98,44,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(99,45,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(100,46,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(101,47,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(102,48,NULL,NULL,NULL,1,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(103,28,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(104,29,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(105,30,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(106,31,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(107,32,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(108,33,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(109,34,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(110,35,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(111,36,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(112,37,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(113,38,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(114,39,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(115,40,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(116,41,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(117,42,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(118,43,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(119,44,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(120,45,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(121,46,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(122,47,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(123,48,NULL,NULL,NULL,2,950000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(124,28,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(125,29,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(126,30,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(127,31,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(128,32,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(129,33,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(130,34,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(131,35,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(132,36,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(133,37,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(134,38,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(135,39,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(136,40,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(137,41,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(138,42,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(139,43,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(140,44,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(141,45,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(142,46,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(143,47,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(144,48,NULL,NULL,NULL,3,1100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(145,49,NULL,NULL,NULL,1,1500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(146,49,NULL,NULL,NULL,2,1900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(147,49,NULL,NULL,NULL,3,2200000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(148,50,NULL,NULL,NULL,1,2200000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(149,50,NULL,NULL,NULL,2,2600000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(150,50,NULL,NULL,NULL,3,2900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(151,1,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(152,2,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(153,3,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(154,4,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(155,5,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(156,6,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(157,7,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(158,8,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(159,9,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(160,1,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(161,2,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(162,3,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(163,4,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(164,5,NULL,NULL,NULL,5,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(165,6,NULL,NULL,NULL,5,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(166,7,NULL,NULL,NULL,5,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(167,8,NULL,NULL,NULL,5,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(168,9,NULL,NULL,NULL,5,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(169,10,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(170,11,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(171,12,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(172,13,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(173,14,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(174,15,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(175,16,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(176,17,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(177,18,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(178,10,NULL,NULL,NULL,5,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(179,11,NULL,NULL,NULL,5,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(180,12,NULL,NULL,NULL,5,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(181,13,NULL,NULL,NULL,5,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(182,14,NULL,NULL,NULL,5,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(183,15,NULL,NULL,NULL,5,650000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(184,16,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(185,17,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(186,18,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(187,19,NULL,NULL,NULL,4,1300000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(188,20,NULL,NULL,NULL,4,1300000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(189,21,NULL,NULL,NULL,4,1300000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(190,22,NULL,NULL,NULL,4,1300000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(191,23,NULL,NULL,NULL,4,1300000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(192,24,NULL,NULL,NULL,4,1200000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(193,25,NULL,NULL,NULL,4,1200000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(194,26,NULL,NULL,NULL,4,1200000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(195,27,NULL,NULL,NULL,4,1200000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(196,19,NULL,NULL,NULL,5,1600000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(197,20,NULL,NULL,NULL,5,1600000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(198,21,NULL,NULL,NULL,5,1600000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(199,22,NULL,NULL,NULL,5,1600000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(200,23,NULL,NULL,NULL,5,1600000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(201,24,NULL,NULL,NULL,5,1500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(202,25,NULL,NULL,NULL,5,1500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(203,26,NULL,NULL,NULL,5,1500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(204,27,NULL,NULL,NULL,5,1500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(205,28,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(206,29,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(207,30,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(208,31,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(209,32,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(210,33,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(211,34,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(212,35,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(213,36,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(214,37,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(215,38,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(216,39,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(217,40,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(218,41,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(219,42,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(220,43,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(221,44,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(222,45,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(223,46,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(224,47,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(225,48,NULL,NULL,NULL,4,500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(226,28,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(227,29,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(228,30,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(229,31,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(230,32,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(231,33,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(232,34,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(233,35,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(234,36,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(235,37,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(236,38,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(237,39,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(238,40,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(239,41,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(240,42,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(241,43,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(242,44,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(243,45,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(244,46,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(245,47,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(246,48,NULL,NULL,NULL,5,750000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(247,49,NULL,NULL,NULL,4,1200000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(248,49,NULL,NULL,NULL,5,1500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(249,50,NULL,NULL,NULL,4,1900000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(250,50,NULL,NULL,NULL,5,2200000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(251,NULL,1,NULL,NULL,NULL,100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(252,NULL,2,NULL,NULL,NULL,150000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(253,NULL,3,NULL,NULL,NULL,40000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(254,NULL,4,NULL,NULL,NULL,25000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(255,NULL,5,NULL,NULL,NULL,100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(256,NULL,6,NULL,NULL,NULL,15000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(257,NULL,7,NULL,NULL,NULL,50000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(258,NULL,8,NULL,NULL,NULL,50000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(259,NULL,9,NULL,NULL,NULL,98000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(260,NULL,10,NULL,NULL,NULL,79000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(261,NULL,11,NULL,NULL,NULL,85000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(262,NULL,12,NULL,NULL,NULL,29000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(263,NULL,13,NULL,NULL,NULL,29000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(264,NULL,14,NULL,NULL,NULL,35000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(265,NULL,15,NULL,NULL,NULL,39000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(266,NULL,16,NULL,NULL,NULL,39000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(267,NULL,17,NULL,NULL,NULL,39000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(268,NULL,18,NULL,NULL,NULL,29000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(269,NULL,19,NULL,NULL,NULL,29000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(270,NULL,20,NULL,NULL,NULL,55000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(271,NULL,NULL,NULL,1,NULL,550000.00,NULL,'2026-05-20 18:23:54'),(272,NULL,NULL,NULL,2,NULL,700000.00,NULL,'2026-05-20 18:23:54'),(273,NULL,NULL,NULL,3,NULL,850000.00,NULL,'2026-05-20 18:23:54'),(274,NULL,NULL,NULL,4,NULL,950000.00,NULL,'2026-05-20 18:23:54'),(275,NULL,NULL,NULL,5,NULL,175000.00,NULL,'2026-05-20 18:23:54'),(276,NULL,NULL,NULL,6,NULL,250000.00,NULL,'2026-05-20 18:23:54'),(277,NULL,NULL,2,NULL,NULL,35000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(278,NULL,NULL,3,NULL,NULL,1500000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(279,NULL,NULL,5,NULL,NULL,80000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(280,NULL,NULL,6,NULL,NULL,175000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(281,NULL,NULL,1,NULL,NULL,100000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(282,NULL,NULL,NULL,NULL,NULL,200000.00,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(283,1,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(284,2,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(285,3,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(286,4,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(287,51,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(288,52,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(289,53,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(290,54,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(291,5,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(292,6,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(293,7,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(294,8,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(295,9,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(296,55,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(297,56,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(298,57,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(299,58,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(300,59,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(301,1,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(302,2,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(303,3,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(304,4,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(305,51,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(306,52,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(307,53,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(308,54,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(309,5,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(310,6,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(311,7,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(312,8,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(313,9,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(314,55,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(315,56,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(316,57,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(317,58,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(318,59,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(319,1,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(320,2,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(321,3,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(322,4,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(323,51,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(324,52,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(325,53,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(326,54,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(327,5,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(328,6,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(329,7,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(330,8,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(331,9,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(332,55,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(333,56,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(334,57,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(335,58,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(336,59,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(337,10,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(338,11,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(339,12,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(340,13,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(341,14,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(342,15,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(343,60,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(344,61,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(345,62,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(346,63,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(347,64,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(348,65,NULL,NULL,NULL,1,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(349,16,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(350,17,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(351,18,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(352,66,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(353,67,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(354,68,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(355,10,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(356,11,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(357,12,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(358,13,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(359,14,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(360,15,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(361,60,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(362,61,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(363,62,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(364,63,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(365,64,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(366,65,NULL,NULL,NULL,2,900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(367,16,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(368,17,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(369,18,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(370,66,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(371,67,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(372,68,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(373,10,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(374,11,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(375,12,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(376,13,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(377,14,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(378,15,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(379,60,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(380,61,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(381,62,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(382,63,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(383,64,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(384,65,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(385,16,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(386,17,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(387,18,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(388,66,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(389,67,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(390,68,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(391,19,NULL,NULL,NULL,1,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(392,20,NULL,NULL,NULL,1,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(393,21,NULL,NULL,NULL,1,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(394,22,NULL,NULL,NULL,1,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(395,23,NULL,NULL,NULL,1,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(396,69,NULL,NULL,NULL,1,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(397,70,NULL,NULL,NULL,1,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(398,71,NULL,NULL,NULL,1,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(399,72,NULL,NULL,NULL,1,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(400,73,NULL,NULL,NULL,1,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(401,24,NULL,NULL,NULL,1,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(402,25,NULL,NULL,NULL,1,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(403,26,NULL,NULL,NULL,1,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(404,27,NULL,NULL,NULL,1,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(405,74,NULL,NULL,NULL,1,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(406,75,NULL,NULL,NULL,1,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(407,76,NULL,NULL,NULL,1,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(408,77,NULL,NULL,NULL,1,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(409,19,NULL,NULL,NULL,2,2000000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(410,20,NULL,NULL,NULL,2,2000000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(411,21,NULL,NULL,NULL,2,2000000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(412,22,NULL,NULL,NULL,2,2000000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(413,23,NULL,NULL,NULL,2,2000000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(414,69,NULL,NULL,NULL,2,2000000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(415,70,NULL,NULL,NULL,2,2000000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(416,71,NULL,NULL,NULL,2,2000000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(417,72,NULL,NULL,NULL,2,2000000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(418,73,NULL,NULL,NULL,2,2000000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(419,24,NULL,NULL,NULL,2,1900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(420,25,NULL,NULL,NULL,2,1900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(421,26,NULL,NULL,NULL,2,1900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(422,27,NULL,NULL,NULL,2,1900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(423,74,NULL,NULL,NULL,2,1900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(424,75,NULL,NULL,NULL,2,1900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(425,76,NULL,NULL,NULL,2,1900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(426,77,NULL,NULL,NULL,2,1900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(427,19,NULL,NULL,NULL,3,2300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(428,20,NULL,NULL,NULL,3,2300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(429,21,NULL,NULL,NULL,3,2300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(430,22,NULL,NULL,NULL,3,2300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(431,23,NULL,NULL,NULL,3,2300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(432,69,NULL,NULL,NULL,3,2300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(433,70,NULL,NULL,NULL,3,2300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(434,71,NULL,NULL,NULL,3,2300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(435,72,NULL,NULL,NULL,3,2300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(436,73,NULL,NULL,NULL,3,2300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(437,24,NULL,NULL,NULL,3,2200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(438,25,NULL,NULL,NULL,3,2200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(439,26,NULL,NULL,NULL,3,2200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(440,27,NULL,NULL,NULL,3,2200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(441,74,NULL,NULL,NULL,3,2200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(442,75,NULL,NULL,NULL,3,2200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(443,76,NULL,NULL,NULL,3,2200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(444,77,NULL,NULL,NULL,3,2200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(445,28,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(446,29,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(447,30,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(448,31,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(449,32,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(450,33,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(451,34,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(452,35,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(453,36,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(454,37,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(455,38,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(456,39,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(457,40,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(458,41,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(459,42,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(460,43,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(461,44,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(462,45,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(463,46,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(464,47,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(465,48,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(466,78,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(467,79,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(468,80,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(469,81,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(470,82,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(471,83,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(472,84,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(473,85,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(474,86,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(475,87,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(476,88,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(477,89,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(478,90,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(479,91,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(480,92,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(481,93,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(482,94,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(483,95,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(484,96,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(485,97,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(486,98,NULL,NULL,NULL,1,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(487,28,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(488,29,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(489,30,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(490,31,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(491,32,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(492,33,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(493,34,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(494,35,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(495,36,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(496,37,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(497,38,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(498,39,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(499,40,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(500,41,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(501,42,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(502,43,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(503,44,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(504,45,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(505,46,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(506,47,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(507,48,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(508,78,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(509,79,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(510,80,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(511,81,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(512,82,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(513,83,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(514,84,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(515,85,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(516,86,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(517,87,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(518,88,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(519,89,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(520,90,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(521,91,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(522,92,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(523,93,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(524,94,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(525,95,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(526,96,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(527,97,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(528,98,NULL,NULL,NULL,2,950000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(529,28,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(530,29,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(531,30,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(532,31,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(533,32,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(534,33,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(535,34,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(536,35,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(537,36,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(538,37,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(539,38,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(540,39,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(541,40,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(542,41,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(543,42,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(544,43,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(545,44,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(546,45,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(547,46,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(548,47,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(549,48,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(550,78,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(551,79,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(552,80,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(553,81,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(554,82,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(555,83,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(556,84,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(557,85,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(558,86,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(559,87,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(560,88,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(561,89,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(562,90,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(563,91,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(564,92,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(565,93,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(566,94,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(567,95,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(568,96,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(569,97,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(570,98,NULL,NULL,NULL,3,1100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(571,49,NULL,NULL,NULL,1,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(572,49,NULL,NULL,NULL,2,1900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(573,49,NULL,NULL,NULL,3,2200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(574,50,NULL,NULL,NULL,1,2200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(575,50,NULL,NULL,NULL,2,2600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(576,50,NULL,NULL,NULL,3,2900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(577,1,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(578,2,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(579,3,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(580,4,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(581,51,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(582,52,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(583,53,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(584,54,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(585,5,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(586,6,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(587,7,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(588,8,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(589,9,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(590,55,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(591,56,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(592,57,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(593,58,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(594,59,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(595,1,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(596,2,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(597,3,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(598,4,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(599,51,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(600,52,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(601,53,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(602,54,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(603,5,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(604,6,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(605,7,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(606,8,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(607,9,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(608,55,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(609,56,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(610,57,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(611,58,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(612,59,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(613,10,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(614,11,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(615,12,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(616,13,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(617,14,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(618,15,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(619,60,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(620,61,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(621,62,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(622,63,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(623,64,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(624,65,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(625,16,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(626,17,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(627,18,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(628,66,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(629,67,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(630,68,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(631,10,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(632,11,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(633,12,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(634,13,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(635,14,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(636,15,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(637,60,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(638,61,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(639,62,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(640,63,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(641,64,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(642,65,NULL,NULL,NULL,5,650000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(643,16,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(644,17,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(645,18,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(646,66,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(647,67,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(648,68,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(649,19,NULL,NULL,NULL,4,1300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(650,20,NULL,NULL,NULL,4,1300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(651,21,NULL,NULL,NULL,4,1300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(652,22,NULL,NULL,NULL,4,1300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(653,23,NULL,NULL,NULL,4,1300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(654,69,NULL,NULL,NULL,4,1300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(655,70,NULL,NULL,NULL,4,1300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(656,71,NULL,NULL,NULL,4,1300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(657,72,NULL,NULL,NULL,4,1300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(658,73,NULL,NULL,NULL,4,1300000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(659,24,NULL,NULL,NULL,4,1200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(660,25,NULL,NULL,NULL,4,1200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(661,26,NULL,NULL,NULL,4,1200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(662,27,NULL,NULL,NULL,4,1200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(663,74,NULL,NULL,NULL,4,1200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(664,75,NULL,NULL,NULL,4,1200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(665,76,NULL,NULL,NULL,4,1200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(666,77,NULL,NULL,NULL,4,1200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(667,19,NULL,NULL,NULL,5,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(668,20,NULL,NULL,NULL,5,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(669,21,NULL,NULL,NULL,5,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(670,22,NULL,NULL,NULL,5,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(671,23,NULL,NULL,NULL,5,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(672,69,NULL,NULL,NULL,5,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(673,70,NULL,NULL,NULL,5,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(674,71,NULL,NULL,NULL,5,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(675,72,NULL,NULL,NULL,5,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(676,73,NULL,NULL,NULL,5,1600000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(677,24,NULL,NULL,NULL,5,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(678,25,NULL,NULL,NULL,5,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(679,26,NULL,NULL,NULL,5,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(680,27,NULL,NULL,NULL,5,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(681,74,NULL,NULL,NULL,5,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(682,75,NULL,NULL,NULL,5,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(683,76,NULL,NULL,NULL,5,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(684,77,NULL,NULL,NULL,5,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(685,28,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(686,29,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(687,30,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(688,31,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(689,32,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(690,33,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(691,34,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(692,35,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(693,36,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(694,37,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(695,38,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(696,39,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(697,40,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(698,41,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(699,42,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(700,43,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(701,44,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(702,45,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(703,46,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(704,47,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(705,48,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(706,78,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(707,79,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(708,80,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(709,81,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(710,82,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(711,83,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(712,84,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(713,85,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(714,86,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(715,87,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(716,88,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(717,89,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(718,90,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(719,91,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(720,92,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(721,93,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(722,94,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(723,95,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(724,96,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(725,97,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(726,98,NULL,NULL,NULL,4,500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(727,28,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(728,29,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(729,30,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(730,31,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(731,32,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(732,33,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(733,34,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(734,35,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(735,36,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(736,37,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(737,38,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(738,39,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(739,40,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(740,41,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(741,42,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(742,43,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(743,44,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(744,45,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(745,46,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(746,47,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(747,48,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(748,78,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(749,79,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(750,80,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(751,81,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(752,82,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(753,83,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(754,84,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(755,85,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(756,86,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(757,87,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(758,88,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(759,89,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(760,90,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(761,91,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(762,92,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(763,93,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(764,94,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(765,95,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(766,96,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(767,97,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(768,98,NULL,NULL,NULL,5,750000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(769,49,NULL,NULL,NULL,4,1200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(770,49,NULL,NULL,NULL,5,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(771,50,NULL,NULL,NULL,4,1900000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(772,50,NULL,NULL,NULL,5,2200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(773,NULL,NULL,2,NULL,NULL,35000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(774,NULL,NULL,3,NULL,NULL,1500000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(775,NULL,NULL,5,NULL,NULL,80000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(776,NULL,NULL,6,NULL,NULL,175000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(777,NULL,NULL,1,NULL,NULL,100000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54'),(778,NULL,NULL,NULL,NULL,NULL,200000.00,'2026-05-20 18:23:54','2026-05-20 18:23:54');
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reschedules`
--

DROP TABLE IF EXISTS `reschedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reschedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `old_book_id` bigint unsigned NOT NULL,
  `new_book_id` bigint unsigned NOT NULL,
  `reschedule_date` date NOT NULL,
  `reschedule_fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reschedules_old_book_id_foreign` (`old_book_id`),
  KEY `reschedules_new_book_id_foreign` (`new_book_id`),
  CONSTRAINT `reschedules_new_book_id_foreign` FOREIGN KEY (`new_book_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reschedules_old_book_id_foreign` FOREIGN KEY (`old_book_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reschedules`
--

LOCK TABLES `reschedules` WRITE;
/*!40000 ALTER TABLE `reschedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `reschedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(5,2),(6,2),(7,2),(9,2),(10,2),(11,2),(12,2),(13,2),(15,2),(16,2),(17,2),(19,2),(20,2),(21,2),(23,2),(24,2),(25,2),(27,2),(28,2),(29,2),(31,2),(32,2),(33,2),(35,2),(36,2),(38,2),(39,2),(5,3),(6,3),(11,3),(15,3),(19,3),(23,3),(27,3),(31,3),(35,3);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'super-admin','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(2,'admin','web','2026-05-05 07:56:51','2026-05-05 07:56:51'),(3,'user','web','2026-05-05 07:56:51','2026-05-05 07:56:51');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_dates`
--

DROP TABLE IF EXISTS `season_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season_dates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `season_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_season_dates_type_range` (`season_type`,`start_date`,`end_date`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_dates`
--

LOCK TABLES `season_dates` WRITE;
/*!40000 ALTER TABLE `season_dates` DISABLE KEYS */;
INSERT INTO `season_dates` VALUES (1,'weekday','2025-01-01','2026-12-31','Sunday - Thursday (Normal Price)',NULL,'2026-05-20 18:23:54'),(2,'weekend','2025-01-01','2026-12-31','Friday - Saturday (Weekend Price)',NULL,'2026-05-20 18:23:54'),(3,'high_season','2025-12-20','2026-03-28','All high season dates (for pricing)',NULL,'2026-05-20 18:23:54'),(4,'ramadan_weekday','2026-02-18','2026-03-18','Ramadan Promo - Sunday to Thursday',NULL,'2026-05-20 18:23:54'),(5,'ramadan_weekend','2026-02-18','2026-03-18','Ramadan Promo - Friday to Saturday',NULL,'2026-05-20 18:23:54');
/*!40000 ALTER TABLE `season_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0nPOwxrdRi5CCc6ySDvapCA76fUoUUJgeGjVPZ41',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1h3R0FteGJZT3E4d0t5U1hld1dMcURRcTZWdkpmZ3o1SGNNNjUzRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1779301357),('8Kwr8R1ZQyXsyuPcbpZq71LqIyX0gUNrHqinaHpQ',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.126.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibjdjZmwyRlFaSXhUSU1OelRJS2dibWxCZmRsT0dLWXE1aVF2bEU1RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1783267960),('iS8UxFCSwlsryAxReV1WL6ZFYYtAGW3tCwHhKyMd',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMVU0eDBuMWkxWVpSYklyNVBTSHBGdDZLN0JjejEyaXpqU1RIRzAzbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MjY6ImdsYW1waW5nX3Jlc2VydmF0aW9uX2RyYWZ0IjthOjQ6e3M6MjoiaWQiO3M6MzY6Ijk2ZGMzMmNlLTAyYjQtNDM1ZC1hOGUyLWE0MWM4MWU2ZTA4YSI7czo3OiJjaGVja2luIjtzOjEwOiIyMDI2LTA2LTE0IjtzOjE2OiJzZWxlY3RlZF91bml0X2lkIjtOO3M6MTA6InVwZGF0ZWRfYXQiO3M6MjU6IjIwMjYtMDYtMTRUMjI6Mzg6NTErMDc6MDAiO319',1781451548),('k5K6MthouvdOWvNNO983GYXqSoaBGMCQSnJjsNr8',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZzd6MUUyVURpWFllUGEwd3JRZUc0YWJCYUJ4UmkyMDZneWphWFdDYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWdpc3RlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MjY6ImdsYW1waW5nX3Jlc2VydmF0aW9uX2RyYWZ0IjthOjQ6e3M6MjoiaWQiO3M6MzY6IjA0M2FmMmUzLWJmNGMtNGI2OC05YzUyLTVlYTZmMmEzMWI4YyI7czo3OiJjaGVja2luIjtzOjEwOiIyMDI2LTA1LTIxIjtzOjE2OiJzZWxlY3RlZF91bml0X2lkIjtOO3M6MTA6InVwZGF0ZWRfYXQiO3M6MjU6IjIwMjYtMDUtMjFUMDE6MjQ6MzYrMDc6MDAiO31zOjEyOiJ2ZXJpZnlfcGhvbmUiO3M6MTM6Iis2Mjg4MTc3ODI1NTMiO3M6MTI6InZlcmlmeV9lbWFpbCI7czoyNjoiYXJpZmZpbmFyaWZmaW41MUBnbWFpbC5jb20iO3M6MTc6InZlcmlmeV9vdHBfbWV0aG9kIjtzOjg6IndoYXRzYXBwIjt9',1779302381),('RX2nvfawCCkHOEmvMvWnRuT3WiMCjeBaZTQIqoZ6',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2JpVTRCNjhjeDkzcjUxZ2J2eFdLYnZGRjJqWlJoZmZIdlJIdVdxdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1779954940);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spot_combinations`
--

DROP TABLE IF EXISTS `spot_combinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spot_combinations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `combination_code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spots` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spot_combinations`
--

LOCK TABLES `spot_combinations` WRITE;
/*!40000 ALTER TABLE `spot_combinations` DISABLE KEYS */;
/*!40000 ALTER TABLE `spot_combinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '+62',
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Super Admin','admin@pineustilu.com','2026-05-05 07:56:52','$2y$12$aKTk0ejRhG7lUIqC3CIVue7zoq4OvwgFmKQFJ/c4A/YsVRrrs2Jwa',NULL,NULL,NULL,NULL,'+62',NULL,NULL,NULL,'2026-05-05 07:56:52','2026-05-05 07:56:52'),(2,'Test User','test@example.com',NULL,'$2y$12$e/JeZ7eU9L5GDbP.E/0yJ.BoT7pkVSAQcjeJlSvVfYWL25uIhHOwu',NULL,NULL,NULL,NULL,'+62',NULL,NULL,NULL,'2026-05-05 07:56:54','2026-05-05 07:56:54'),(3,'test','test@gmail.com',NULL,'$2y$12$G73lZW9.X02poLQfJJqfi.UQS49fqdroRAzHcgc/p1AeFLpEZrpay',NULL,NULL,NULL,NULL,'+62','8817782553',NULL,NULL,'2026-05-05 07:57:59','2026-05-05 07:57:59'),(4,'Ihsan','zainul.ariffinihsan@gmail.com',NULL,'$2y$12$gun7H0Mi8dEQIa.rAXk/GuNcBrQ/i9CPv6hfppfz9y8ZlsB1FwJXW',NULL,NULL,NULL,NULL,'+62','8118272538',NULL,NULL,'2026-05-05 09:23:55','2026-05-05 09:23:55'),(5,'test2','ariffinariffin51@gmail.com',NULL,'$2y$12$ECA97jHFlnVuPe8e9o71TuqEKuLEo8x7zIMtwi4vegXdUDTfSq.Re',NULL,NULL,NULL,NULL,'+62','+628817782553',NULL,NULL,'2026-05-20 18:31:48','2026-05-20 18:31:48');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-26 13:04:52
