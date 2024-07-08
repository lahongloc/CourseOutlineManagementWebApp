-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: courseoutlinedb
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `academic_year`
--

DROP TABLE IF EXISTS `academic_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_year` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `finish` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_year`
--

LOCK TABLES `academic_year` WRITE;
/*!40000 ALTER TABLE `academic_year` DISABLE KEYS */;
INSERT INTO `academic_year` VALUES (1,'2020-2024','2020-10-01 00:00:00','2024-09-30 00:00:00'),(2,'2021-2025','2021-10-01 00:00:00','2025-09-30 00:00:00'),(3,'2022-2026','2022-10-01 00:00:00','2026-09-30 00:00:00'),(4,'2023-2027','2023-10-01 00:00:00','2027-09-30 00:00:00');
/*!40000 ALTER TABLE `academic_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(350) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` int DEFAULT NULL,
  `outline_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `outline_id` (`outline_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`outline_id`) REFERENCES `outline` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Bài giảng rất hay và dễ hiểu.',1,1),(2,'Tôi cảm thấy khá khó khăn với phần bài tập này.',2,1),(3,'Giáo viên giải thích rất chi tiết và nắm vững kiến thức.',3,1),(4,'Mình muốn hỏi thêm về phần ví dụ này.',4,1),(5,'Phần này khá thú vị và ứng dụng được vào thực tế.',5,1),(6,'Tôi cần sự giúp đỡ về phần này, liệu có ai giúp được không?',6,1),(7,'Mong muốn thêm nhiều ví dụ thực tế hơn để hiểu sâu hơn.',7,1),(8,'Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng này.',8,1),(9,'Cần thêm thời gian để làm bài tập về nhà.',9,2),(10,'Giáo viên nên giảng bài một cách chi tiết hơn.',10,2),(11,'Bài giảng rất tốt và dễ hiểu.',11,2),(12,'Mong muốn có thêm tài liệu học tập.',12,2),(13,'Tôi cảm thấy thực sự hứng thú với nội dung này.',13,2),(14,'Phần này khá khó khăn và cần thời gian để nắm vững.',14,2),(15,'Tôi đã hiểu rõ hơn về vấn đề này sau buổi học này.',15,2),(16,'Bài giảng rất chi tiết và dễ hiểu.',16,2),(17,'Tôi cảm thấy khá khó khăn với phần này.',17,3),(18,'Giáo viên giải thích rất rõ ràng và dễ hiểu.',18,3),(19,'Phần này khá thú vị và áp dụng được vào thực tế.',19,3),(20,'Tôi cần thêm sự hỗ trợ về phần này.',20,3),(21,'Mong muốn thêm nhiều ví dụ hơn để hiểu sâu hơn.',21,3),(22,'Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng.',22,3),(23,'Bài giảng rất hay và dễ hiểu.',23,3),(24,'Tôi cảm thấy khá khó khăn với phần bài tập này.',24,3),(25,'Giáo viên giải thích rất chi tiết và nắm vững kiến thức.',25,3),(26,'Mình muốn hỏi thêm về phần ví dụ này.',26,3),(27,'Phần này khá thú vị và ứng dụng được vào thực tế.',27,3),(28,'Tôi cần sự giúp đỡ về phần này, liệu có ai giúp được không?',28,3),(29,'Mong muốn thêm nhiều ví dụ thực tế hơn để hiểu sâu hơn.',29,3),(30,'Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng này.',30,3),(31,'Cần thêm thời gian để làm bài tập về nhà.',31,4),(32,'Giáo viên nên giảng bài một cách chi tiết hơn.',32,4),(33,'Bài giảng rất tốt và dễ hiểu.',33,4),(34,'Mong muốn có thêm tài liệu học tập.',34,4),(35,'Tôi cảm thấy thực sự hứng thú với nội dung này.',35,4),(36,'Phần này khá khó khăn và cần thời gian để nắm vững.',36,4),(37,'Tôi đã hiểu rõ hơn về vấn đề này sau buổi học này.',37,4),(38,'Bài giảng rất chi tiết và dễ hiểu.',38,4),(39,'Tôi cảm thấy khá khó khăn với phần này.',39,4),(40,'Giáo viên giải thích rất rõ ràng và dễ hiểu.',40,4),(41,'Phần này khá thú vị và áp dụng được vào thực tế.',41,4),(42,'Tôi cần thêm sự hỗ trợ về phần này.',42,4),(43,'Mong muốn thêm nhiều ví dụ hơn để hiểu sâu hơn.',43,4),(44,'Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng.',44,4),(45,'Bài giảng rất hay và dễ hiểu.',45,4),(46,'Tôi cảm thấy khá khó khăn với phần bài tập này.',46,4),(47,'Giáo viên giải thích rất chi tiết và nắm vững kiến thức.',47,4),(48,'Mình muốn hỏi thêm về phần ví dụ này.',48,4),(49,'Phần này khá thú vị và ứng dụng được vào thực tế.',49,4),(50,'Tôi cần sự giúp đỡ về phần này, liệu có ai giúp được không?',50,51),(51,'Mong muốn thêm nhiều ví dụ thực tế hơn để hiểu sâu hơn.',52,4),(52,'Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng này.',53,4),(53,'Cần thêm thời gian để làm bài tập về nhà.',54,5),(54,'Giáo viên nên giảng bài một cách chi tiết hơn.',55,5),(55,'Bài giảng rất tốt và dễ hiểu.',56,5),(56,'Mong muốn có thêm tài liệu học tập.',57,5),(57,'Tôi cảm thấy thực sự hứng thú với nội dung này.',58,5),(58,'Phần này khá khó khăn và cần thời gian để nắm vững.',59,5),(59,'Tôi đã hiểu rõ hơn về vấn đề này sau buổi học này.',60,5),(60,'Bài giảng rất chi tiết và dễ hiểu.',61,5),(61,'Tôi cảm thấy khá khó khăn với phần này.',62,5),(62,'Giáo viên giải thích rất rõ ràng và dễ hiểu.',63,5),(63,'Phần này khá thú vị và áp dụng được vào thực tế.',64,5),(64,'Tôi cần thêm sự hỗ trợ về phần này.',65,5),(65,'Mong muốn thêm nhiều ví dụ hơn để hiểu sâu hơn.',66,5),(66,'Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng.',67,5),(67,'Bài giảng rất hay và dễ hiểu.',68,5),(68,'Tôi cảm thấy khá khó khăn với phần bài tập này.',69,5),(69,'Giáo viên giải thích rất chi tiết và nắm vững kiến thức.',70,5),(70,'Mình muốn hỏi thêm về phần ví dụ này.',71,5),(71,'Phần này khá thú vị và ứng dụng được vào thực tế.',72,5),(72,'Tôi cần sự giúp đỡ về phần này, liệu có ai giúp được không?',73,5),(73,'Mong muốn thêm nhiều ví dụ thực tế hơn để hiểu sâu hơn.',74,5),(74,'Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng này.',75,5),(75,'Cần thêm thời gian để làm bài tập về nhà.',76,6),(76,'Giáo viên nên giảng bài một cách chi tiết hơn.',77,6),(77,'Bài giảng rất tốt và dễ hiểu.',78,6),(78,'Mong muốn có thêm tài liệu học tập.',79,6),(79,'Tôi cảm thấy thực sự hứng thú với nội dung này.',80,6),(80,'Phần này khá khó khăn và cần thời gian để nắm vững.',81,6),(81,'Tôi đã hiểu rõ hơn về vấn đề này sau buổi học này.',82,6),(82,'Bài giảng rất chi tiết và dễ hiểu.',83,6),(83,'Tôi cảm thấy khá khó khăn với phần này.',84,6),(84,'Giáo viên giải thích rất rõ ràng và dễ hiểu.',85,6),(85,'Phần này khá thú vị và áp dụng được vào thực tế.',86,6),(86,'Tôi cần thêm sự hỗ trợ về phần này.',87,6),(87,'Mong muốn thêm nhiều ví dụ hơn để hiểu sâu hơn.',88,6),(88,'Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng.',89,6),(89,'Bài giảng rất hay và dễ hiểu.',90,6),(90,'Tôi cảm thấy khá khó khăn với phần bài tập này.',91,6),(91,'Giáo viên giải thích rất chi tiết và nắm vững kiến thức.',92,6),(92,'Mình muốn hỏi thêm về phần ví dụ này.',93,6),(93,'Phần này khá thú vị và ứng dụng được vào thực tế.',94,6),(94,'Tôi cần sự giúp đỡ về phần này, liệu có ai giúp được không?',95,6),(95,'Mong muốn thêm nhiều ví dụ thực tế hơn để hiểu sâu hơn.',96,6),(96,'Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng này.',97,6);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (1,'á»©ng dá»¥ng web','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument14875790145517656624.pdf','2024-06-14 00:00:00'),(2,'nháº­p mÃ´n tin há»c','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument16208007836997305829.pdf','2024-06-16 00:00:00'),(3,'Äáº¡i sá» tuyáº¿n tÃ­nh','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument17981584946251689673.pdf','2024-06-16 00:00:00'),(4,'cÆ¡ sá» láº­p trÃ¬nh','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument17793362811842760775.pdf','2024-06-16 00:00:00'),(5,'giáº£i tÃ­ch','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument7169311889420242110.pdf','2024-06-16 00:00:00'),(6,'ká»¹ thuáº­t láº­p trÃ¬nh','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument10776955187452553377.pdf','2024-06-16 00:00:00'),(9,'cáº¥u trÃºc dá»¯ liá»u vÃ  giáº£i thuáº­t','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument15126490934508866615.pdf','2024-06-16 00:00:00'),(11,'Cơ sở lập trình','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument17941987612681606645.pdf','2024-06-18 00:00:00'),(12,'Lập trình hướng đối tượng','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument17927040287417722732.pdf','2024-06-18 00:00:00'),(13,'Lập trình giao diện','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument5982871853973937360.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240618T142628Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3599&X-Amz-Credential=AKIAZI2LIHXTMMYKBE22%2F20240618%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=79f2bd79bdd790b8a4cf4b40aac079fa7b136f6d1d29bcd206b498fabf664680','2024-06-18 00:00:00'),(14,'Kỹ thuật lập trình','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument1928774684917574749.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240618T145113Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3599&X-Amz-Credential=AKIAZI2LIHXTMMYKBE22%2F20240618%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=f616fa2b9c5742e97ccbaa9f2b78c4999dd3244eca8a014c112ed9eb57b6f626','2024-06-18 00:00:00'),(15,'Ứng dụng web','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument17904107439798869819.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240620T084057Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=AKIAZI2LIHXTMMYKBE22%2F20240620%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=ecd3a36d5b9dd1aa64caac7b072e5c78c42f364e88112b8ce1f513af3c2080b8','2024-06-20 00:00:00'),(16,'Nhập môn tin học','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument8965424332452904590.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240620T172529Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3599&X-Amz-Credential=AKIAZI2LIHXTMMYKBE22%2F20240620%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=5f1a2b39ecafa67ac461194dbfcc653c0b9501388190c50ac34f85d93b1cd594','2024-06-21 00:00:00'),(17,'Giải tích','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument14227121389601144213.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240620T175912Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3599&X-Amz-Credential=AKIAZI2LIHXTMMYKBE22%2F20240620%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=6e99a54f44fbe96226e367ec18817b5a71298a2c8e6e6a2ad1aa867211ce8255','2024-06-21 00:00:00'),(18,'Kiến trúc máy tính','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument15240467726501170788.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240620T180433Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3599&X-Amz-Credential=AKIAZI2LIHXTMMYKBE22%2F20240620%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=cd5996c494722b092d194e227e451b31c89c1028760d2139a4545d46a94f61e4','2024-06-21 00:00:00'),(19,'Cấu trúc dữ liệu và thuật giải 1','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument9136790306988282335.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240620T180812Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3599&X-Amz-Credential=AKIAZI2LIHXTMMYKBE22%2F20240620%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=e09a9987964e22b2af6f3d1d71b1b00d199f34a2cb20642febb72aac9d98bcd7','2024-06-21 00:00:00'),(20,'Phân tích thiết kế hệ thống','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument10123956452098873971.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240621T033456Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3599&X-Amz-Credential=AKIAZI2LIHXTMMYKBE22%2F20240621%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=1bf18081dee24b0fa293516ceb37d462da69caac9f80db393a5bdf062fece9f2','2024-06-21 00:00:00'),(21,'Toán rời rạc','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument14524885973493866006.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240621T034326Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3599&X-Amz-Credential=AKIAZI2LIHXTMMYKBE22%2F20240621%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=f0a6bd22de3ce6d70c4f7c557d37fc3f7fe61bedb837c9c137760935d900fb1a','2024-06-21 00:00:00'),(22,'Chủ nghĩa xã hội khoa học','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument14748300560592710641.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240621T034859Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3599&X-Amz-Credential=AKIAZI2LIHXTMMYKBE22%2F20240621%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=dc3528eaf604531cb479e68c9e49704d679284ae22a2671ac4d2c92beb25a7fb','2024-06-21 00:00:00'),(23,'Kỹ năng nghề nghiệp','https://courseoutlinebucket.s3.amazonaws.com/D:\\MINE\\WEB SYSTEM DEVELOPMENT\\BTL\\Server\\apache-tomcat-9.0.87\\temp\\document14895359037156287582.pdf','2024-06-21 00:00:00'),(24,'Lịch sử Đảng CS Việt Nam','https://courseoutlinebucket.s3.amazonaws.com/D:\\MINE\\WEB SYSTEM DEVELOPMENT\\BTL\\Server\\apache-tomcat-9.0.87\\temp\\document7836930391280031043.pdf','2024-06-21 00:00:00'),(25,'Mạng máy tính nâng cao','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument5666068488758645411.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240621T134137Z&X-Amz-SignedHeaders=host&X-Amz-Expires=359999&X-Amz-Credential=AKIAZI2LIHXTMMYKBE22%2F20240621%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=db1751126879d39fdf61eebb80d61d21e1bfc7ccabfffefe5081da638215036b','2024-06-21 00:00:00'),(26,'Lập trình web','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument9886987079629184690.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240621T154212Z&X-Amz-SignedHeaders=host&X-Amz-Expires=359999&X-Amz-Credential=AKIAZI2LIHXTMMYKBE22%2F20240621%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=371c74d10ddfbae1d3fee45221ee405c992fc431da2ef1f672f75dea044b020b','2024-06-21 00:00:00'),(27,'Công nghệ phần mềm','https://courseoutlinebucket.s3.amazonaws.com/D%3A%5CMINE%5CWEB%20SYSTEM%20DEVELOPMENT%5CBTL%5CServer%5Capache-tomcat-9.0.87%5Ctemp%5Cdocument10085696296472415292.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240621T154517Z&X-Amz-SignedHeaders=host&X-Amz-Expires=359999&X-Amz-Credential=AKIAZI2LIHXTMMYKBE22%2F20240621%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=300e22d1b261f0c9086dacaf795ac987577a4ada3b50526cf7423c705c3ea915','2024-06-21 00:00:00');
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Công nghệ thông tin'),(2,'Quản trị kinh doanh');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_subject`
--

DROP TABLE IF EXISTS `faculty_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty_subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `faculty_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faculty_id` (`faculty_id`,`subject_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `faculty_subject_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`),
  CONSTRAINT `faculty_subject_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_subject`
--

LOCK TABLES `faculty_subject` WRITE;
/*!40000 ALTER TABLE `faculty_subject` DISABLE KEYS */;
INSERT INTO `faculty_subject` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(61,1,62),(63,1,63),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(71,1,71),(43,2,43),(44,2,44),(45,2,45),(46,2,46),(47,2,47),(48,2,48),(49,2,49),(50,2,50),(51,2,51),(52,2,52),(53,2,53),(54,2,54),(55,2,55),(56,2,56),(57,2,57),(58,2,58),(59,2,59),(60,2,60),(70,2,70),(72,2,71);
/*!40000 ALTER TABLE `faculty_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(350) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` int DEFAULT NULL,
  `outline_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `outline_id` (`outline_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`outline_id`) REFERENCES `outline` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Môn học rất thú vị và giáo viên rất nhiệt tình.',1,1),(2,'Đề cương hữu ích và dễ hiểu.',2,2),(3,'Môn học này cần cải thiện cách giảng dạy.',3,3),(4,'Tôi cảm thấy thách thức với nội dung của môn học.',4,4),(5,'Cần nâng cao chất lượng bài giảng.',5,5),(6,'Nội dung môn học khá thú vị nhưng quá nhiều công việc nhóm.',6,6),(7,'Giáo viên cần cải thiện phương pháp giảng dạy.',7,7),(8,'Tôi thích cách thức hướng dẫn thực hành của giáo viên.',8,8),(9,'Nội dung môn học rất hữu ích cho công việc sau này.',9,9),(10,'Tôi rất hài lòng với môn học này.',10,10);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `major_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `major_id` (`major_id`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,'DH20IT01',1),(2,'DH20IT02',1),(3,'DH20CS01',2),(4,'DH20CS02',2),(5,'DH20BA01',3),(6,'DH20BA02',3),(7,'DH20TO01',4),(8,'DH20TO02',4),(9,'DH21IT01',1),(10,'DH21IT02',1),(11,'DH21CS01',2),(12,'DH21CS02',2),(13,'DH21BA01',3),(14,'DH21BA02',3),(15,'DH21TO01',4),(16,'DH21TO02',4),(17,'DH22IT01',1),(18,'DH22IT02',1),(19,'DH22CS01',2),(20,'DH22CS02',2),(21,'DH22BA01',3),(22,'DH22BA02',3),(23,'DH22TO01',4),(24,'DH22TO02',4);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `faculty_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `faculty_id` (`faculty_id`),
  CONSTRAINT `lecturer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `lecturer_ibfk_2` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES (1,3,1),(2,4,1),(3,5,1),(4,6,1),(5,7,1),(6,8,1),(7,9,2),(8,10,2),(9,11,2),(10,12,2),(11,13,2);
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faculty_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faculty_id` (`faculty_id`),
  CONSTRAINT `major_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'Công nghệ thông tin',1),(2,'Khoa học máy tính',1),(3,'Quản trị kinh doanh',2),(4,'Du lịch',2);
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outline`
--

DROP TABLE IF EXISTS `outline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outline` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theo_credit_hour` int NOT NULL,
  `prac_credit_hour` int NOT NULL,
  `lecturer_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approver_id` int DEFAULT NULL,
  `document_id` int DEFAULT NULL,
  `price` float DEFAULT '20000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `document_id` (`document_id`),
  KEY `lecturer_id` (`lecturer_id`),
  KEY `subject_id` (`subject_id`),
  KEY `approver_id` (`approver_id`),
  CONSTRAINT `outline_ibfk_1` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`id`),
  CONSTRAINT `outline_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `outline_ibfk_3` FOREIGN KEY (`approver_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `outline_ibfk_4` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outline`
--

LOCK TABLES `outline` WRITE;
/*!40000 ALTER TABLE `outline` DISABLE KEYS */;
INSERT INTO `outline` VALUES (1,'Đề cương cho môn học Nhập môn tin học',3,1,4,1,'ACCEPTED',1,16,20000),(2,'Đề cương cho môn học Đại số tuyến tính',3,1,1,2,'ACCEPTED',1,3,20000),(3,'Đề cương cho môn học Cơ sở lập trình',3,1,5,3,'ACCEPTED',1,11,20000),(4,'Đề cương cho môn học Giải tích',3,1,1,4,'ACCEPTED',1,17,20000),(5,'Đề cương cho môn học Kỹ thuật lập trình',3,1,5,5,'ACCEPTED',1,14,20000),(6,'Đề cương cho môn học Kiến trúc máy tính',3,1,6,6,'ACCEPTED',1,18,20000),(7,'Đề cương cho môn học Cấu trúc dữ liệu và thuật giải 1',3,1,5,7,'ACCEPTED',1,19,20000),(8,'Trang bị cho sinh viên những kiến thức cơ bản về thiết kế UI của một website thông qua HTML/CSS/JS và thư viện JQuery ',2,-1,2,8,'ACCEPTED',1,15,20000),(9,'Đề cương cho môn học Hệ điều hành',3,1,1,9,'HOLDING',1,NULL,20000),(10,'Đề cương cho môn học Xác suất và thống kê',3,1,1,10,'HOLDING',1,NULL,20000),(11,'Đề cương cho môn học Triết học Mác - Lênin',3,1,7,11,'HOLDING',1,NULL,20000),(12,'Đề cương cho môn học Cấu trúc dữ liệu và Giải thuật 2',3,1,5,12,'HOLDING',1,NULL,20000),(13,'Đề cương cho môn học Cơ sở dữ liệu',3,1,4,13,'HOLDING',1,NULL,20000),(14,'Đề cương cho môn học Mạng máy tính',3,1,1,14,'HOLDING',1,NULL,20000),(15,'Đề cương cho môn học Kinh tế chính trị Mác - Lênin',3,1,8,15,'HOLDING',1,NULL,20000),(16,'Đề cương cho môn học Lập trình hướng đối tượng',3,1,2,16,'ACCEPTED',1,12,20000),(17,'Đề cương cho môn học Phân tích thiết kế hệ thống',3,1,4,17,'ACCEPTED',1,20,20000),(18,'Đề cương cho môn học Toán rời rạc',3,1,3,18,'ACCEPTED',1,21,20000),(19,'Đề cương cho môn học Chủ nghĩa xã hội khoa học',3,1,7,19,'ACCEPTED',1,22,20000),(20,'Đề cương cho môn học Lập trình giao diện',3,1,5,20,'ACCEPTED',1,13,20000),(21,'Đề cương cho môn học Quản trị hệ cơ sở dữ liệu',3,1,4,21,'HOLDING',1,NULL,20000),(22,'Đề cương cho môn học Kỹ năng nghề nghiệp',3,1,1,22,'ACCEPTED',1,23,20000),(23,'Đề cương cho môn học Lịch sử Đảng CS Việt Nam',3,1,8,23,'ACCEPTED',1,24,20000),(24,'Đề cương cho môn học Mạng máy tính nâng cao',3,1,3,24,'ACCEPTED',1,25,20000),(25,'Đề cương cho môn học Lập trình web',3,1,2,25,'ACCEPTED',1,26,20000),(26,'Đề cương cho môn học Công nghệ phần mềm',3,1,2,26,'ACCEPTED',1,27,20000),(27,'Đề cương cho môn học Các công nghệ lập trình hiện đại',3,1,2,27,'HOLDING',1,NULL,20000),(28,'Đề cương cho môn học Toán cho máy học',3,1,1,28,'HOLDING',1,NULL,20000),(29,'Đề cương cho môn học Trí tuệ nhân tạo',3,1,1,29,'HOLDING',1,NULL,20000),(30,'Đề cương cho môn học Cơ sở dữ liệu phân tán',3,1,4,30,'HOLDING',1,NULL,20000),(31,'Đề cương cho môn học Phân tích dữ liệu',3,1,1,31,'1',2,NULL,20000),(32,'Đề cương cho môn học Tư tưởng Hồ Chí Minh',3,1,8,32,'1',2,NULL,20000),(33,'Đề cương cho môn học Lập trình mạng',3,1,3,33,'1',2,NULL,20000),(34,'Đề cương cho môn học Quản trị mạng',3,1,3,34,'1',2,NULL,20000),(35,'Đề cương cho môn học Kiểm thử phần mềm',3,1,4,35,'1',2,NULL,20000),(36,'Đề cương cho môn học Phát triển hệ thống web',3,1,2,36,'1',2,NULL,20000),(37,'Đề cương cho môn học Thị giác máy tính',3,1,4,37,'1',2,NULL,20000),(38,'Đề cương cho môn học Khai phá dữ liệu',3,1,6,38,'1',2,NULL,20000),(39,'Đề cương cho môn học Lập trình cơ sở dữ liệu',3,1,4,39,'1',2,NULL,20000),(40,'Đề cương cho môn học Đồ án ngành',3,1,1,40,'1',2,NULL,20000),(41,'Đề cương cho môn học Thực tập tốt nghiệp',3,1,1,41,'1',2,NULL,20000),(42,'Đề cương cho môn học Khóa luận tốt nghiệp',3,1,1,42,'1',2,NULL,20000),(43,'Đề cương cho môn học Quản trị học',3,1,7,43,'1',1,NULL,20000),(44,'Đề cương cho môn học Marketing căn bản',3,1,8,44,'1',1,NULL,20000),(45,'Đề cương cho môn học Quản trị nhân sự',3,1,9,45,'1',1,NULL,20000),(46,'Đề cương cho môn học Tài chính doanh nghiệp',3,1,10,46,'1',1,NULL,20000),(47,'Đề cương cho môn học Quản trị chiến lược',3,1,11,47,'1',1,NULL,20000),(48,'Đề cương cho môn học Kế toán tài chính',3,1,7,48,'1',1,NULL,20000),(49,'Đề cương cho môn học Quản trị sản xuất',3,1,8,49,'1',1,NULL,20000),(50,'Đề cương cho môn học Kinh tế vi mô',3,1,9,50,'1',1,NULL,20000),(51,'Đề cương cho môn học Kinh tế vĩ mô',3,1,10,51,'1',1,NULL,20000),(52,'Đề cương cho môn học Quản lý du lịch',3,1,11,52,'1',1,NULL,20000),(53,'Đề cương cho môn học Marketing du lịch',3,1,7,53,'1',2,NULL,20000),(54,'Đề cương cho môn học Lữ hành và hướng dẫn viên du lịch',3,1,8,54,'1',2,NULL,20000),(55,'Đề cương cho môn học Quản trị nhà hàng khách sạn',3,1,9,55,'1',2,NULL,20000),(56,'Đề cương cho môn học Kinh tế du lịch',3,1,10,56,'1',2,NULL,20000),(57,'Đề cương cho môn học Văn hóa du lịch',3,1,11,57,'1',2,NULL,20000),(58,'Đề cương cho môn học Quản lý sự kiện',3,1,7,58,'1',2,NULL,20000),(59,'Đề cương cho môn học Pháp luật du lịch',3,1,8,59,'1',2,NULL,20000),(60,'Đề cương cho môn học Địa lý du lịch Việt Nam',3,1,9,60,'1',2,NULL,20000),(61,'THống kê ứng dụng',2,1,NULL,61,NULL,NULL,NULL,20000),(62,NULL,0,0,4,71,'HOLDING',NULL,NULL,NULL),(63,'mon kiem thu nha phan mem',2,1,2,70,'HOLDING',NULL,NULL,NULL);
/*!40000 ALTER TABLE `outline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outline_academic_year`
--

DROP TABLE IF EXISTS `outline_academic_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outline_academic_year` (
  `id` int NOT NULL AUTO_INCREMENT,
  `outline_id` int DEFAULT NULL,
  `academic_year_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `outline_id` (`outline_id`,`academic_year_id`),
  KEY `academic_year_id` (`academic_year_id`),
  CONSTRAINT `outline_academic_year_ibfk_1` FOREIGN KEY (`outline_id`) REFERENCES `outline` (`id`),
  CONSTRAINT `outline_academic_year_ibfk_2` FOREIGN KEY (`academic_year_id`) REFERENCES `academic_year` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outline_academic_year`
--

LOCK TABLES `outline_academic_year` WRITE;
/*!40000 ALTER TABLE `outline_academic_year` DISABLE KEYS */;
INSERT INTO `outline_academic_year` VALUES (1,1,1),(64,1,2),(127,1,3),(2,2,1),(65,2,2),(128,2,3),(3,3,1),(66,3,2),(129,3,3),(4,4,1),(67,4,2),(130,4,3),(5,5,1),(68,5,2),(131,5,3),(6,6,1),(69,6,2),(132,6,3),(7,7,1),(70,7,2),(133,7,3),(8,8,1),(71,8,2),(134,8,3),(9,9,1),(72,9,2),(135,9,3),(10,10,1),(73,10,2),(136,10,3),(11,11,1),(74,11,2),(137,11,3),(12,12,1),(75,12,2),(138,12,3),(13,13,1),(76,13,2),(139,13,3),(14,14,1),(77,14,2),(140,14,3),(15,15,1),(78,15,2),(141,15,3),(16,16,1),(79,16,2),(142,16,3),(17,17,1),(80,17,2),(143,17,3),(18,18,1),(81,18,2),(144,18,3),(19,19,1),(82,19,2),(145,19,3),(20,20,1),(83,20,2),(146,20,3),(21,21,1),(84,21,2),(147,21,3),(22,22,1),(85,22,2),(148,22,3),(23,23,1),(86,23,2),(149,23,3),(24,24,1),(87,24,2),(150,24,3),(25,25,1),(88,25,2),(151,25,3),(26,26,1),(89,26,2),(152,26,3),(27,27,1),(90,27,2),(153,27,3),(28,28,1),(91,28,2),(154,28,3),(29,29,1),(92,29,2),(155,29,3),(30,30,1),(93,30,2),(156,30,3),(31,31,1),(94,31,2),(157,31,3),(32,32,1),(95,32,2),(158,32,3),(33,33,1),(96,33,2),(159,33,3),(34,34,1),(97,34,2),(160,34,3),(35,35,1),(98,35,2),(161,35,3),(36,36,1),(99,36,2),(162,36,3),(37,37,1),(100,37,2),(163,37,3),(38,38,1),(101,38,2),(164,38,3),(39,39,1),(102,39,2),(165,39,3),(40,40,1),(103,40,2),(166,40,3),(41,41,1),(104,41,2),(167,41,3),(42,42,1),(105,42,2),(168,42,3),(43,43,1),(106,43,2),(169,43,3),(44,44,1),(107,44,2),(170,44,3),(45,45,1),(108,45,2),(171,45,3),(46,46,1),(109,46,2),(172,46,3),(47,47,1),(110,47,2),(173,47,3),(48,48,1),(111,48,2),(174,48,3),(49,49,1),(112,49,2),(175,49,3),(50,50,1),(113,50,2),(176,50,3),(51,51,1),(114,51,2),(177,51,3),(52,52,1),(115,52,2),(178,52,3),(53,53,1),(116,53,2),(179,53,3),(54,54,1),(117,54,2),(180,54,3),(55,55,1),(118,55,2),(181,55,3),(56,56,1),(119,56,2),(182,56,3),(57,57,1),(120,57,2),(183,57,3),(58,58,1),(121,58,2),(184,58,3),(59,59,1),(122,59,2),(185,59,3),(60,60,1),(123,60,2),(186,60,3),(187,62,1),(188,63,1);
/*!40000 ALTER TABLE `outline_academic_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outline_score`
--

DROP TABLE IF EXISTS `outline_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outline_score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `percent` float DEFAULT NULL,
  `outline_id` int DEFAULT NULL,
  `score_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `outline_id` (`outline_id`,`score_id`),
  KEY `score_id` (`score_id`),
  CONSTRAINT `outline_score_ibfk_1` FOREIGN KEY (`outline_id`) REFERENCES `outline` (`id`),
  CONSTRAINT `outline_score_ibfk_2` FOREIGN KEY (`score_id`) REFERENCES `score` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outline_score`
--

LOCK TABLES `outline_score` WRITE;
/*!40000 ALTER TABLE `outline_score` DISABLE KEYS */;
INSERT INTO `outline_score` VALUES (1,40,1,1),(2,30,1,2),(3,20,1,3),(4,10,1,4),(5,50,2,1),(6,20,2,2),(7,30,2,3),(8,60,3,1),(9,40,3,2),(10,70,4,1),(11,30,4,2),(12,80,5,1),(13,10,5,2),(14,5,5,3),(15,5,5,4),(16,40,6,1),(17,30,6,2),(18,20,6,3),(19,10,6,4),(20,50,7,1),(21,20,7,2),(22,30,7,3),(23,40,8,1),(24,60,8,2),(25,70,9,1),(26,30,9,2),(27,80,10,1),(28,10,10,2),(29,5,10,3),(30,5,10,4),(31,40,11,1),(32,30,11,2),(33,20,11,3),(34,10,11,4),(35,50,12,1),(36,20,12,2),(37,30,12,3),(38,60,13,1),(39,40,13,2),(40,70,14,1),(41,30,14,2),(42,80,15,1),(43,10,15,2),(44,5,15,3),(45,5,15,4),(46,40,16,1),(47,30,16,2),(48,20,16,3),(49,10,16,4),(50,50,17,1),(51,20,17,2),(52,30,17,3),(53,60,18,1),(54,40,18,2),(55,70,19,1),(56,30,19,2),(57,80,20,1),(58,10,20,2),(59,5,20,3),(60,5,20,4),(61,40,21,1),(62,30,21,2),(63,20,21,3),(64,10,21,4),(65,50,22,1),(66,20,22,2),(67,30,22,3),(68,60,23,1),(69,40,23,2),(70,70,24,1),(71,30,24,2),(72,80,25,1),(73,10,25,2),(74,5,25,3),(75,5,25,4),(76,40,26,1),(77,30,26,2),(78,20,26,3),(79,10,26,4),(80,50,27,1),(81,20,27,2),(82,30,27,3),(83,60,28,1),(84,40,28,2),(85,70,29,1),(86,30,29,2),(87,80,30,1),(88,10,30,2),(89,5,30,3),(90,5,30,4),(91,40,31,1),(92,30,31,2),(93,20,31,3),(94,10,31,4),(95,50,32,1),(96,20,32,2),(97,30,32,3),(98,60,33,1),(99,40,33,2),(100,70,34,1),(101,30,34,2),(102,80,35,1),(103,10,35,2),(104,5,35,3),(105,5,35,4),(106,40,36,1),(107,30,36,2),(108,20,36,3),(109,10,36,4),(110,50,37,1),(111,20,37,2),(112,30,37,3),(113,60,38,1),(114,40,38,2),(115,70,39,1),(116,30,39,2),(117,80,40,1),(118,10,40,2),(119,5,40,3),(120,5,40,4),(121,40,41,1),(122,30,41,2),(123,20,41,3),(124,10,41,4),(125,50,42,1),(126,20,42,2),(127,30,42,3),(128,60,43,1),(129,40,43,2),(130,70,44,1),(131,30,44,2),(132,80,45,1),(133,10,45,2),(134,5,45,3),(135,5,45,4),(136,40,46,1),(137,30,46,2),(138,20,46,3),(139,10,46,4),(140,50,47,1),(141,20,47,2),(142,30,47,3),(143,60,48,1),(144,40,48,2),(145,70,49,1),(146,30,49,2),(147,80,50,1),(148,10,50,2),(149,5,50,3),(150,5,50,4),(151,40,51,1),(152,30,51,2),(153,20,51,3),(154,10,51,4),(155,50,52,1),(156,20,52,2),(157,30,52,3),(158,60,53,1),(159,40,53,2),(160,70,54,1),(161,30,54,2),(162,80,55,1),(163,10,55,2),(164,5,55,3),(165,5,55,4),(166,40,56,1),(167,30,56,2),(168,20,56,3),(169,10,56,4),(170,50,57,1),(171,20,57,2),(172,30,57,3),(173,60,58,1),(174,40,58,2),(175,70,59,1),(176,30,59,2),(177,80,60,1),(178,10,60,2),(179,5,60,3),(180,5,60,4),(181,40,63,1),(182,60,63,2);
/*!40000 ALTER TABLE `outline_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outline_subject`
--

DROP TABLE IF EXISTS `outline_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outline_subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `outline_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `outline_id` (`outline_id`,`subject_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `outline_subject_ibfk_1` FOREIGN KEY (`outline_id`) REFERENCES `outline` (`id`),
  CONSTRAINT `outline_subject_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outline_subject`
--

LOCK TABLES `outline_subject` WRITE;
/*!40000 ALTER TABLE `outline_subject` DISABLE KEYS */;
INSERT INTO `outline_subject` VALUES (1,1,1,NULL),(2,2,2,NULL),(3,3,3,NULL),(4,4,4,NULL),(5,5,5,NULL),(6,6,6,NULL),(7,7,7,NULL),(9,9,9,NULL),(10,10,10,NULL),(11,11,11,NULL),(12,12,12,NULL),(13,13,13,NULL),(14,14,14,NULL),(15,15,15,NULL),(16,16,16,NULL),(17,17,17,NULL),(18,18,18,NULL),(19,19,19,NULL),(20,20,20,NULL),(21,21,21,NULL),(22,22,22,NULL),(23,23,23,NULL),(24,24,24,NULL),(25,25,25,NULL),(26,26,26,NULL),(27,27,27,NULL),(28,28,28,NULL),(29,29,29,NULL),(30,30,30,NULL),(31,31,31,NULL),(32,32,32,NULL),(33,33,33,NULL),(34,34,34,NULL),(35,35,35,NULL),(36,36,36,NULL),(37,37,37,NULL),(38,38,38,NULL),(39,39,39,NULL),(40,40,40,NULL),(41,41,41,NULL),(42,42,42,NULL),(43,43,43,NULL),(44,44,44,NULL),(45,45,45,NULL),(46,46,46,NULL),(47,47,47,NULL),(48,48,48,NULL),(49,49,49,NULL),(50,50,50,NULL),(51,51,51,NULL),(52,52,52,NULL),(53,53,53,NULL),(54,54,54,NULL),(55,55,55,NULL),(56,56,56,NULL),(57,57,57,NULL),(58,58,58,NULL),(59,59,59,NULL),(60,60,60,NULL),(64,8,4,'PRE'),(65,8,5,'PRE'),(66,8,1,'PRE'),(67,8,6,'PRE'),(68,8,3,'PRE'),(69,63,2,'PRE'),(70,63,3,'PRE'),(71,63,4,'PRE'),(72,63,5,'PRE'),(73,63,6,'PRE');
/*!40000 ALTER TABLE `outline_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` date DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `outline_id` int DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `transaction_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_transaction_id` (`transaction_id`),
  KEY `outline_id` (`outline_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`outline_id`) REFERENCES `outline` (`id`),
  CONSTRAINT `receipt_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` VALUES (2,'2024-09-30',1,24,20000.00,'14472212',14),(4,'2024-09-30',1,25,20000.00,NULL,14),(5,'2024-09-30',1,26,20000.00,'14472231',14),(6,'2024-09-30',1,24,20000.00,'14472744',44);
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assessment` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (1,'Giữa kỳ','Bài kiểm tra giữa kỳ'),(2,'Cuối kỳ','Bài kiểm tra cuối kỳ'),(3,'Bài tập lớn','Bài tập nhóm'),(4,'Thực hành','Bài thực hành');
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `academic_year_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `academic_year_id` (`academic_year_id`),
  CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`academic_year_id`) REFERENCES `academic_year` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (1,'Học kỳ 1',1),(2,'Học kỳ 2',1),(3,'Học kỳ 3',1),(4,'Học kỳ 4',1),(5,'Học kỳ 5',1),(6,'Học kỳ 6',1),(7,'Học kỳ 7',1),(8,'Học kỳ 8',1),(9,'Học kỳ 9',1),(10,'Học kỳ 10',1),(11,'Học kỳ 11',1),(12,'Học kỳ 1',2),(13,'Học kỳ 2',2),(14,'Học kỳ 3',2),(15,'Học kỳ 4',2),(16,'Học kỳ 5',2),(17,'Học kỳ 6',2),(18,'Học kỳ 7',2),(19,'Học kỳ 8',2),(20,'Học kỳ 9',2),(21,'Học kỳ 10',2),(22,'Học kỳ 11',2),(23,'Học kỳ 1',3),(24,'Học kỳ 2',3),(25,'Học kỳ 3',3),(26,'Học kỳ 4',3),(27,'Học kỳ 5',3),(28,'Học kỳ 6',3),(29,'Học kỳ 7',3),(30,'Học kỳ 8',3),(31,'Học kỳ 9',3),(32,'Học kỳ 10',3),(33,'Học kỳ 11',3);
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `grade_id` int DEFAULT NULL,
  `major_id` int DEFAULT NULL,
  `academic_year_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_code` (`student_code`),
  KEY `user_id` (`user_id`),
  KEY `grade_id` (`grade_id`),
  KEY `major_id` (`major_id`),
  KEY `academic_year_id` (`academic_year_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`),
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  CONSTRAINT `student_ibfk_4` FOREIGN KEY (`academic_year_id`) REFERENCES `academic_year` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'2051050001',14,3,2,1),(2,'2051050002',15,3,2,1),(3,'2051050003',16,3,2,1),(4,'2051050004',17,3,2,1),(5,'2051050005',18,3,2,1),(6,'2051050006',19,3,2,1),(7,'2051050007',20,3,2,1),(8,'2051050008',21,3,2,1),(9,'2051050009',22,4,2,1),(10,'2051050010',23,4,2,1),(11,'2051050011',24,4,2,1),(12,'2051050012',25,4,2,1),(13,'2051050013',26,4,2,1),(14,'2051050014',27,4,2,1),(15,'2051050015',28,4,2,1),(16,'2051050016',29,4,2,1),(17,'2051050017',30,1,1,1),(18,'2051050018',31,1,1,1),(19,'2051050019',32,1,1,1),(20,'2051050020',33,1,1,1),(21,'2051050021',34,1,1,1),(22,'2051050022',35,1,1,1),(23,'2051050023',36,1,1,1),(24,'2051050024',37,2,1,1),(25,'2051050025',38,2,1,1),(26,'2051050026',39,2,1,1),(27,'2051050027',40,2,1,1),(28,'2051050028',41,2,1,1),(29,'2051050029',42,2,1,1),(30,'20510500230',43,2,1,1),(31,'21510500001',44,9,1,2),(32,'21510500002',45,9,1,2),(33,'21510500003',46,9,1,2),(34,'21510500004',47,9,1,2),(35,'21510500005',48,9,1,2),(36,'21510500006',49,9,1,2),(37,'21510500007',50,9,1,2),(38,'21510500008',51,9,1,2),(39,'21510500009',52,10,1,2),(40,'21510500010',53,10,1,2),(41,'21510500011',54,10,1,2),(42,'21510500012',55,10,1,2),(43,'21510500013',56,10,1,2),(44,'21510500014',57,10,1,2),(45,'21510500015',58,10,1,2),(46,'21510500016',59,10,1,2),(47,'21510500017',60,11,2,2),(48,'21510500018',61,11,2,2),(49,'21510500019',62,11,2,2),(50,'21510500020',63,11,2,2),(51,'21510500021',64,11,2,2),(52,'21510500022',65,11,2,2),(53,'21510500023',66,11,2,2),(54,'21510500024',67,11,2,2),(55,'21510500025',68,12,2,2),(56,'21510500026',69,12,2,2),(57,'21510500027',70,12,2,2),(58,'21510500028',71,12,2,2),(59,'21510500029',72,12,2,2),(60,'21510500030',73,12,2,2),(61,'21510500031',74,12,2,2),(62,'21510500032',75,12,2,2),(63,'2251050002',76,19,2,3),(64,'2251050003',77,19,2,3),(65,'2251050004',78,19,2,3),(66,'2251050005',79,19,2,3),(67,'2251050006',80,19,2,3),(68,'2251050007',81,19,2,3),(69,'2251050008',82,20,2,3),(70,'2251050009',83,20,2,3),(71,'2251050010',84,20,2,3),(72,'2251050011',85,20,2,3),(73,'2251050012',86,20,2,3),(74,'2251050013',87,17,1,3),(75,'2251050014',88,17,1,3),(76,'2251050015',89,17,1,3),(77,'2251050016',90,17,1,3),(78,'2251050017',91,17,1,3),(79,'2251050018',92,18,1,3),(80,'2251050019',93,18,1,3),(81,'2251050020',94,18,1,3),(82,'2251050021',95,18,1,3),(83,'2251050022',96,18,1,3),(84,'2054050001',97,7,4,1),(85,'2054050002',98,7,4,1),(86,'2054050003',99,7,4,1),(87,'2054050004',100,8,4,1),(88,'2054050005',101,8,4,1),(89,'2054050006',102,5,3,1),(90,'2054050007',103,5,3,1),(91,'2054050008',104,5,3,1),(92,'2054050009',105,5,3,1),(93,'2054050010',106,6,3,1),(94,'2054050011',107,6,3,1),(95,'2054050012',108,6,3,1),(96,'2154050001',109,15,4,2),(97,'2154050002',110,15,4,2),(98,'2154050003',111,15,4,2),(99,'2154050004',112,15,4,2),(100,'2154050005',113,15,4,2),(101,'2154050006',114,16,4,2),(102,'2154050007',115,16,4,2),(103,'2154050008',116,16,4,2),(104,'2154050009',117,16,4,2),(105,'2154050010',118,16,4,2),(106,'2154050011',119,13,3,2),(107,'2154050012',120,13,3,2),(108,'2154050013',121,13,3,2),(109,'2154050014',122,13,3,2),(110,'2154050015',123,14,3,2),(111,'2154050016',124,14,3,2),(112,'2154050017',125,14,3,2),(113,'2254050001',126,23,4,3),(114,'2254050002',127,23,4,3),(115,'2254050003',128,23,4,3),(116,'2254050004',129,23,4,3),(117,'2254050005',130,24,4,3),(118,'2254050006',131,24,4,3),(119,'2254050007',132,24,4,3),(120,'2254050008',133,21,3,3),(121,'2254050009',134,21,3,3),(122,'2254050010',135,21,3,3),(123,'2254050011',136,21,3,3),(124,'2254050012',137,21,3,3),(125,'2254050013',138,22,3,3),(126,'2254050014',139,22,3,3),(127,'2254050015',140,22,3,3),(128,'2254050016',141,22,3,3),(129,'2254050017',142,22,3,3);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_outline_download`
--

DROP TABLE IF EXISTS `student_outline_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_outline_download` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `outline_id` int NOT NULL,
  `downloaded_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `outline_id` (`outline_id`),
  CONSTRAINT `student_outline_download_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `student_outline_download_ibfk_2` FOREIGN KEY (`outline_id`) REFERENCES `outline` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_outline_download`
--

LOCK TABLES `student_outline_download` WRITE;
/*!40000 ALTER TABLE `student_outline_download` DISABLE KEYS */;
INSERT INTO `student_outline_download` VALUES (1,1,1,'2024-01-02 10:00:00'),(2,1,2,'2024-01-02 11:00:00'),(3,1,3,'2024-01-02 12:00:00'),(4,1,4,'2024-01-02 13:00:00'),(5,1,5,'2024-01-02 14:00:00'),(6,2,4,'2024-01-03 10:00:00'),(7,2,6,'2024-01-03 10:30:00'),(8,2,7,'2024-01-03 11:00:00'),(9,3,6,'2024-01-04 09:00:00'),(10,3,8,'2024-01-04 09:30:00'),(11,3,9,'2024-01-04 10:00:00'),(12,4,10,'2024-01-05 11:00:00'),(13,4,11,'2024-01-05 11:30:00'),(14,4,12,'2024-01-05 12:00:00'),(15,4,13,'2024-01-05 12:30:00'),(16,4,14,'2024-01-05 13:00:00'),(17,5,15,'2024-01-06 14:00:00'),(18,5,16,'2024-01-06 14:30:00'),(19,5,17,'2024-01-06 15:00:00'),(20,6,21,'2024-01-07 17:30:00'),(21,6,22,'2024-01-07 18:00:00'),(22,6,23,'2024-01-07 18:30:00'),(23,6,24,'2024-01-07 19:00:00'),(24,7,25,'2024-01-08 20:00:00'),(25,7,27,'2024-01-08 21:00:00'),(26,7,28,'2024-01-08 21:30:00'),(27,7,29,'2024-01-08 22:00:00'),(28,8,30,'2024-01-09 23:00:00'),(29,8,31,'2024-01-09 23:30:00'),(30,8,32,'2024-01-10 00:00:00'),(31,8,33,'2024-01-10 00:30:00'),(32,8,34,'2024-01-10 01:00:00'),(33,9,38,'2024-01-11 03:30:00'),(34,9,39,'2024-01-11 04:00:00'),(35,10,40,'2024-01-12 05:00:00'),(36,10,41,'2024-01-12 05:30:00'),(37,10,42,'2024-01-12 06:00:00'),(38,10,43,'2024-01-12 06:30:00'),(39,10,44,'2024-01-12 07:00:00'),(40,11,49,'2024-01-13 10:00:00'),(41,12,50,'2024-01-14 11:00:00'),(42,12,51,'2024-01-14 11:30:00'),(43,12,52,'2024-01-14 12:00:00'),(44,12,53,'2024-01-14 12:30:00'),(45,13,58,'2024-01-15 15:30:00'),(46,13,59,'2024-01-15 16:00:00'),(47,14,60,'2024-01-16 17:00:00'),(48,14,1,'2024-01-16 17:30:00'),(49,15,5,'2024-01-17 20:00:00'),(50,15,6,'2024-01-17 20:30:00'),(51,15,7,'2024-01-17 21:00:00'),(52,15,8,'2024-01-17 21:30:00'),(53,15,9,'2024-01-17 22:00:00'),(54,16,10,'2024-01-18 23:00:00'),(55,16,11,'2024-01-18 23:30:00'),(56,16,12,'2024-01-19 00:00:00'),(57,17,15,'2024-01-20 02:00:00'),(58,17,16,'2024-01-20 02:30:00'),(59,17,17,'2024-01-20 03:00:00'),(60,17,18,'2024-01-20 03:30:00'),(61,17,19,'2024-01-20 04:00:00'),(62,18,20,'2024-01-21 05:00:00'),(63,18,21,'2024-01-21 05:30:00'),(64,18,22,'2024-01-21 06:00:00'),(65,18,23,'2024-01-21 06:30:00'),(66,18,24,'2024-01-21 07:00:00'),(67,19,25,'2024-01-22 08:00:00'),(68,19,29,'2024-01-22 10:00:00'),(69,20,30,'2024-01-23 11:00:00'),(70,20,31,'2024-01-23 11:30:00'),(71,20,32,'2024-01-23 12:00:00'),(72,20,33,'2024-01-23 12:30:00'),(73,20,34,'2024-01-23 13:00:00');
/*!40000 ALTER TABLE `student_outline_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Nhập môn tin học'),(2,'Đại số tuyến tính'),(3,'Cơ sở lập trình'),(4,'Giải tích'),(5,'Kỹ thuật lập trình'),(6,'Kiến trúc máy tính'),(7,'Cấu trúc dữ liệu và thuật giải 1'),(8,'Ứng dụng web'),(9,'Hệ điều hành'),(10,'Xác suất và thống kê'),(11,'Triết học Mác - Lênin'),(12,'Cấu trúc dữ liệu và Giải thuật 2'),(13,'Cơ sở dữ liệu'),(14,'Mạng máy tính'),(15,'Kinh tế chính trị Mác - Lênin'),(16,'Lập trình hướng đối tượng'),(17,'Phân tích thiết kế hệ thống'),(18,'Toán rời rạc'),(19,'Chủ nghĩa xã hội khoa học'),(20,'Lập trình giao diện'),(21,'Quản trị hệ cơ sở dữ liệu'),(22,'Kỹ năng nghề nghiệp'),(23,'Lịch sử Đảng CS Việt Nam'),(24,'Mạng máy tính nâng cao'),(25,'Lập trình web'),(26,'Công nghệ phần mềm'),(27,'Các công nghệ lập trình hiện đại'),(28,'Toán cho máy học'),(29,'Trí tuệ nhân tạo'),(30,'Cơ sở dữ liệu phân tán'),(31,'Phân tích dữ liệu'),(32,'Tư tưởng Hồ Chí Minh'),(33,'Lập trình mạng'),(34,'Quản trị mạng'),(35,'Kiểm thử phần mềm'),(36,'Phát triển hệ thống web'),(37,'Thị giác máy tính'),(38,'Khai phá dữ liệu'),(39,'Lập trình cơ sở dữ liệu'),(40,'Đồ án ngành'),(41,'Thực tập tốt nghiệp'),(42,'Khóa luận tốt nghiệp'),(43,'Quản trị học'),(44,'Marketing căn bản'),(45,'Quản trị nhân sự'),(46,'Tài chính doanh nghiệp'),(47,'Quản trị chiến lược'),(48,'Kế toán tài chính'),(49,'Quản trị sản xuất'),(50,'Kinh tế vi mô'),(51,'Kinh tế vĩ mô'),(52,'Quản lý du lịch'),(53,'Marketing du lịch'),(54,'Lữ hành và hướng dẫn viên du lịch'),(55,'Quản trị nhà hàng khách sạn'),(56,'Kinh tế du lịch'),(57,'Văn hóa du lịch'),(58,'Quản lý sự kiện'),(59,'Pháp luật du lịch'),(60,'Địa lý du lịch Việt Nam'),(61,'Thống kê ứng dụng'),(62,'mon hoc thu'),(63,'ktlt'),(64,'nmhvhbws'),(65,'mon hocj nya'),(66,'mon hocj nya'),(67,'mon hocj nya'),(68,'mon hocj nya'),(69,'kiem thu o'),(70,'kiem thu nha'),(71,'kiem thulun á');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `password` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hotline` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT (false),
  `created_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin1',1,'1970-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Admin số 1','ROLE_ADMIN','admin1@gmail.com','0123456789','avatar1.png',1,'2024-06-14 23:00:17'),(2,'admin2',1,'1970-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Admin số 2','ROLE_ADMIN','admin2@gmail.com','0123456789','avatar2.png',1,'2024-06-14 23:00:17'),(3,'thvinh',1,'1989-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trương Hoàng Vinh','ROLE_LECTURER','vinh.th@gmail.com','0123456789','http://it.ou.edu.vn/asset/ckfinder/userfiles/5/images/TS_%20TH%20Vinh.jpg',0,'2024-06-14 23:00:17'),(4,'dhthanh',1,'1989-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Dương Hữu Thành','ROLE_LECTURER','thanh.dh@gmail.com','0123456789','http://it.ou.edu.vn/asset/ckfinder/userfiles/5/images/ThS_%20DH%20Thanh.jpg',1,'2024-06-14 23:00:17'),(5,'lqphuong',1,'1981-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lưu Quang Phương','ROLE_LECTURER','phuong.lq@gmail.com','0123456789','http://it.ou.edu.vn/asset/ckfinder/userfiles/5/images/giang_vien/Phuong_2.jpg',1,'2024-06-14 23:00:17'),(6,'ntptrang',0,'1987-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Thị Phương Trang','ROLE_LECTURER','trang.ntp@gmail.com','0123456789','http://it.ou.edu.vn/asset/ckfinder/userfiles/5/images/giang_vien/PTrang1.jpg',1,'2024-06-14 23:00:17'),(7,'ntmtrang',0,'1978-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Thị Mai Trang','ROLE_LECTURER','trang.ntm@gmail.com','0123456789','http://it.ou.edu.vn/asset/ckfinder/userfiles/5/images/ThS_%20NTM%20Trang.png',1,'2024-06-14 23:00:17'),(8,'ntdat',1,'1974-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Tiến Đạt','ROLE_LECTURER','dat.nt@gmail.com','0123456789','http://it.ou.edu.vn/asset/ckfinder/userfiles/5/images/TS_%20NT%20Dat.jpg',1,'2024-06-14 23:00:17'),(9,'nhsinh',1,'1980-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Hoàng Sinh ','ROLE_LECTURER','sinh.nh@gmail.com','0123456789','https://lh4.googleusercontent.com/proxy/8tdvf_8wjAOuUdgncUo2JXPfgvFIg8lc9XFsjQIK1YLVSQRJyQG57OA0UaU1Vb__n7M6QD7CRA9YFbK1tJz6v-ggvlV89AeNX4YAOm5jUuIDtrQf-ZBzFJ3-_OS-XGsIZ6M53pIf',1,'2024-06-14 23:00:17'),(10,'hdtvy',0,'1980-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Hoàng Đinh Thảo Vy ','ROLE_LECTURER','vy.hdt@gmail.com','0123456789','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqKDGDpriotDBZeb1qD0TgOV6-sbr8BUNwDgrFJ41l1w&s',1,'2024-06-14 23:00:17'),(11,'pminh',1,'1980-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Phạm Minh','ROLE_LECTURER','minh.p@gmail.com','0123456789','https://lh3.googleusercontent.com/proxy/2ejS6TB2fLjmJcTeG8JHplvHGFdYvFDHuLNqVq00wJRikRmvodBxMytIDCs1kDPGgholuqdmm81yTB5ZlkgIpJR46bN3uy8KvbYbVMDX67aCIalw4mKM91TFOWOMyQ',1,'2024-06-14 23:00:17'),(12,'cmtri',1,'1980-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Cao Minh Trí ','ROLE_LECTURER','tri.cm@gmail.com','0123456789','https://elo.edu.vn/wp-content/uploads/2021/06/Cao-Minh-Tri.png',1,'2024-06-14 23:00:17'),(13,'httduong',0,'1980-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Hà Thị Thùy Dương','ROLE_LECTURER','duong.htt@gmail.com','0123456789','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR28nZ-wY-RCtWLtrTLMXUCLghNpU9UJ18ZY4RRcBaoMQ&s',1,'2024-06-14 23:00:17'),(14,'vnmlinh',0,'2002-11-29 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Vũ Nguyễn Mai Linh','ROLE_STUDENT','linh@gmail.com','0123456789','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR28nZ-wY-RCtWLtrTLMXUCLghNpU9UJ18ZY4RRcBaoMQ&s',1,'2024-06-14 23:00:17'),(15,'pthai',1,'2002-05-18 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Phan Thanh Hải','ROLE_STUDENT','hai@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(16,'ltdat',1,'2002-10-14 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lương Tấn Đạt','ROLE_STUDENT','dat@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(17,'lvphon',1,'2002-03-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lê Văn Phôn','ROLE_STUDENT','phon@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(18,'nvana',0,'2002-10-09 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Vân Anh','ROLE_STUDENT','anh@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(19,'thtvinh',1,'2002-06-03 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trần Hồ Thế Vinh','ROLE_STUDENT','vinh@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(20,'phquyet',1,'2002-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Phạm Hữu Quyết','ROLE_STUDENT','quyet@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(21,'pdquynh',0,'2002-02-14 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Phạm Diệu Quỳnh','ROLE_STUDENT','quynh@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(22,'lbphong',1,'2002-09-08 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lại Bình Phong','ROLE_STUDENT','phong@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(23,'nntrung',1,'2002-04-13 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Nghĩa Trung','ROLE_STUDENT','trung@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(24,'tnqnhan',1,'2002-08-15 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trần Ngọc Quang Nhân','ROLE_STUDENT','nhan@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(25,'nttru',1,'2002-10-14 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Tấn Trụ','ROLE_STUDENT','tru@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(26,'hdnguyen',1,'1999-11-17 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Hồ Đắc Nguyên','ROLE_STUDENT','nguyen@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(27,'nhhao',1,'2002-01-29 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Hoàng Hảo','ROLE_STUDENT','hao@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(28,'ntnlu',0,'2002-09-08 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Thị Ngọc Lụa','ROLE_STUDENT','lua@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(29,'tmhieu',1,'2002-12-27 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trịnh Minh Hiếu','ROLE_STUDENT','hieu@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(30,'btam',0,'2002-07-14 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Bùi Thanh Tâm','ROLE_STUDENT','tam@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(31,'hqv',1,'2002-02-12 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Hồ Quang Văn','ROLE_STUDENT','van@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(32,'dtphong',1,'2002-10-04 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Đoàn Trung Phong','ROLE_STUDENT','phong@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(33,'ntkhai',0,'2002-03-18 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Ngô Thị Kim Tài','ROLE_STUDENT','tai@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(34,'plho',1,'2001-06-02 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Phan Lê Hồ','ROLE_STUDENT','ho@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(35,'nmthanh',1,'2002-01-13 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Ngô Minh Thành','ROLE_STUDENT','thanh@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(36,'tnnam',1,'2002-10-19 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trần Nhật Nam','ROLE_STUDENT','nam@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(37,'ttphat',1,'2002-02-10 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Thái Tấn Phát','ROLE_STUDENT','phat@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(38,'hmhoang',1,'2001-09-23 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Huỳnh Minh Hoàng','ROLE_STUDENT','hoang@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(39,'ntngocyen',0,'2002-01-22 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Thị Ngọc Yến','ROLE_STUDENT','yen@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(40,'dgiahuy',1,'2002-01-03 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Đoàn Gia Huy','ROLE_STUDENT','huy@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(41,'ttkhoa',0,'2002-07-19 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trương Thị Kim Hoa','ROLE_STUDENT','hoa@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(42,'ldankiet',1,'2002-09-19 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lê Đông Anh Kiệt','ROLE_STUDENT','kiet@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(43,'ntthanh',0,'2002-05-05 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Thị Thanh','ROLE_STUDENT','thanh@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(44,'ttkiet',1,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trần Tuấn Kiệt','ROLE_STUDENT','kiettran.cv@gmail.com','0123456789','https://zpsocial-f47-org.zadn.vn/2bb9ac814b16a448fd07.jpg',1,'2024-06-14 23:00:17'),(45,'lhloc',1,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','La Hồng Lộc','ROLE_STUDENT','loc@gmail.com','0123456789','https://zpsocial-f54-org.zadn.vn/283c78389a527a0c2343.jpg',1,'2024-06-14 23:00:17'),(46,'dvkhanh',1,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Dương Văn Khánh','ROLE_STUDENT','khanh@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(47,'nhnhi',0,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Hoàng Nhi','ROLE_STUDENT','nhi@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(48,'htthuy',0,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Hồ Thanh Thúy','ROLE_STUDENT','thuy@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(49,'ntlam',0,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Ngô Thanh Lam','ROLE_STUDENT','lam@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(50,'nvlau',1,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Ngô Văn Lâu','ROLE_STUDENT','lau@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(51,'ttlan',1,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trần Lê Lân','ROLE_STUDENT','lan@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(52,'vctuan',1,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Văn Công Tuấn','ROLE_STUDENT','tuan@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(53,'tqhau',1,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Thằng Quốc Hậu','ROLE_STUDENT','hau@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(54,'nhtam',1,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Hoài Tâm','ROLE_STUDENT','tam@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(55,'nctuan',1,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Châu Tuấn','ROLE_STUDENT','tuan@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(56,'nthvy',0,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Thị Hiền Vy','ROLE_STUDENT','vy@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(57,'chhung',1,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Đỗ Chí Hưng','ROLE_STUDENT','hung@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(58,'ntmvan',1,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Thị Mỹ Vân','ROLE_STUDENT','van@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(59,'dntu',1,'2003-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Đặng Ngọc Tú','ROLE_STUDENT','tu@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(60,'tqthanh',1,'2003-05-22 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Tsàn Quý Thành','ROLE_STUDENT','thanh@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(61,'hqminh',1,'2003-06-07 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Hoàng Quốc Minh','ROLE_STUDENT','minh@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(62,'tbatuan',1,'2003-04-28 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trương Bùi Anh Tuấn','ROLE_STUDENT','tuan@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(63,'nxloc',1,'2003-01-27 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Xuân Lộc','ROLE_STUDENT','loc@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(64,'tatien',1,'2003-01-28 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trần An Tiến','ROLE_STUDENT','tien@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(65,'thkhang',1,'2003-09-14 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trịnh Huỳnh Thịnh Khang','ROLE_STUDENT','khang@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(66,'ntanh',1,'2003-04-20 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Thế Anh','ROLE_STUDENT','anh@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(67,'dtthao',0,'2003-02-20 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Đoàn Thị Thảo','ROLE_STUDENT','thao@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(68,'lnaphong',1,'2003-09-27 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lê Nguyễn Anh Phong','ROLE_STUDENT','phong@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(69,'lpthinh',1,'2003-01-04 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lâm Phát Thịnh','ROLE_STUDENT','thinh@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(70,'pdmvuong',1,'2003-11-07 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Phạm Đỗ Minh Vương','ROLE_STUDENT','vuong@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(71,'ndtngan',0,'2003-08-22 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Đặng Thanh Ngân','ROLE_STUDENT','ngan@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(72,'pdan',1,'2003-09-09 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Phạm Dương An','ROLE_STUDENT','an@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(73,'ttthanh',0,'2003-09-27 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Tạ Thị Thiên Thanh','ROLE_STUDENT','thanh@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(74,'pbthieu',1,'2003-02-12 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Phạm Bá Trung Hiếu','ROLE_STUDENT','hieu@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(75,'npmnhat',1,'2003-05-15 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Phan Minh Nhật','ROLE_STUDENT','nhat@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(76,'ndnguyen',1,'2004-03-08 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Ngô Đông Nguyên','ROLE_STUDENT','nguyen@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(77,'haduy',1,'2004-01-20 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Hoàng Anh Duy','ROLE_STUDENT','duy@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(78,'pmquang',1,'2003-02-06 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Phí Minh Quang','ROLE_STUDENT','quang@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(79,'lghuy',1,'2004-01-03 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lê Gia Huy','ROLE_STUDENT','huy@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(80,'nttung',1,'2004-01-19 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Thanh Tùng','ROLE_STUDENT','tung@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(81,'nnpnhu',0,'2004-08-30 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Ngọc Phượng Như','ROLE_STUDENT','nhu@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(82,'ntlloi',1,'2004-07-31 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Tấn Lợi','ROLE_STUDENT','loi@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(83,'dbtien',1,'2004-10-09 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Đinh Bích Tiên','ROLE_STUDENT','tien@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(84,'tndminh',1,'2004-09-30 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trần Nguyễn Đức Minh','ROLE_STUDENT','minh@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(85,'bxtien',1,'2004-09-07 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Bạch Xuân Thiên','ROLE_STUDENT','thien@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(86,'hqdat',1,'2004-01-01 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Hứa Quang Đạt','ROLE_STUDENT','dat@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(87,'lthd',1,'2004-10-27 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lê Thanh Dân','ROLE_STUDENT','danthanh@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(88,'ltphat',1,'2004-12-15 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lê Tấn Phát','ROLE_STUDENT','phatle@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(89,'clngan',0,'2004-09-02 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Chu Lệ Ngân','ROLE_STUDENT','ngancl@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(90,'bvduc',1,'2004-06-13 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Bùi Văn Đức','ROLE_STUDENT','ducbv@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(91,'ltan',1,'2004-02-09 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lê Tân','ROLE_STUDENT','tanle@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(92,'tcdung',1,'2004-10-05 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trương Chí Dũng','ROLE_STUDENT','dungtc@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(93,'lahao',1,'2004-07-24 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lê Anh Hào','ROLE_STUDENT','haolah@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(94,'nhyen',0,'2004-04-15 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Hoàng Yến','ROLE_STUDENT','yennguyen@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(95,'dpnam',1,'2004-12-02 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Đặng Phương Nam','ROLE_STUDENT','namdp@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(96,'tqdat',1,'2004-10-04 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trịnh Quốc Đạt','ROLE_STUDENT','dat.trinh@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(97,'hgihan',0,'2002-09-20 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Huỳnh Gia Hân','ROLE_STUDENT','hanhg@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(98,'nqthai',1,'2002-11-16 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Quốc Thái','ROLE_STUDENT','thainguyen@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(99,'dtthuong',0,'2002-02-06 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Đặng Thị Thu Hương','ROLE_STUDENT','huongdang@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(100,'tthxuan',0,'2002-02-13 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trương Thị Hồng Xuân','ROLE_STUDENT','xuantruong@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(101,'lnanh',0,'2002-02-02 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lê Ngọc Ánh','ROLE_STUDENT','anhle@gmail.com','0123456789',NULL,0,'2024-06-14 23:00:17'),(102,'nguyentuanh',0,'2002-10-28 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Lê Anh Tú','ROLE_STUDENT','nguyentuanh@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(103,'nqdong',1,'2002-01-05 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Quý Đông','ROLE_STUDENT','nqdong@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(104,'nttthao',0,'2002-12-06 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Thị Thu Thảo','ROLE_STUDENT','nttthao@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(105,'htkimgnan',0,'2002-09-30 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Huỳnh Thị Kim Ngân','ROLE_STUDENT','htkimgnan@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(106,'nlangbang',0,'2002-02-21 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Lăng Băng','ROLE_STUDENT','nlangbang@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(107,'ctanhlinh',0,'2002-06-16 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Chu Thị Ánh Linh','ROLE_STUDENT','ctanhlinh@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(108,'lquocthang',0,'2002-11-14 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lê Quốc Thắng','ROLE_STUDENT','lquocthang@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(109,'vtkimgnan',0,'2003-07-11 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Võ Thị Kim Ngân','ROLE_STUDENT','vtkimgnan@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(110,'ntkimdang',0,'2003-02-08 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Thị Kim Đang','ROLE_STUDENT','ntkimdang@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(111,'vtthanthu',0,'2003-10-14 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Võ Thanh Thư','ROLE_STUDENT','vtthanthu@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(112,'nnathu',0,'2003-02-26 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Ngọc Anh Thư','ROLE_STUDENT','nnathu@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(113,'nnghan',0,'2003-06-30 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Ngọc Hân','ROLE_STUDENT','nnghan@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(114,'lghan',0,'2003-05-15 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lý Gia Hân','ROLE_STUDENT','lghan@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(115,'dgt',0,'2003-10-08 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Đoàn Gia Thịnh','ROLE_STUDENT','dgt@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(116,'lathu',0,'2003-12-11 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lê Anh Thư','ROLE_STUDENT','lathu@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(117,'ntynhi',0,'2003-04-21 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Thị Ý Nhi','ROLE_STUDENT','ntynhi@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(118,'ptbyen',0,'2003-07-23 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Phan Thị Bảo Yến','ROLE_STUDENT','ptbyen@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(119,'hqvinh',1,'2003-01-20 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Hứa Quang Vinh','ROLE_STUDENT','hqvinh@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(120,'tkhanhan',0,'2003-05-17 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trần Khánh Hân','ROLE_STUDENT','tkhanhan@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(121,'tlthao',0,'2003-04-04 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trần Lê Tuyết Thảo','ROLE_STUDENT','tlthao@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(122,'vnquynh',0,'2003-04-28 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Võ Như Quỳnh','ROLE_STUDENT','vnquynh@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(123,'mmintam',0,'2003-07-15 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Mã Minh Tâm','ROLE_STUDENT','mmintam@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(124,'mdthuytrang',0,'2003-04-17 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Mai Dương Thùy Trang','ROLE_STUDENT','mdthuytrang@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(125,'nhdongnhi',0,'2003-12-04 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Hoài Đông Nhi','ROLE_STUDENT','nhdongnhi@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(126,'vtnquynh',0,'2004-04-06 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Võ Thị Như Quỳnh','ROLE_STUDENT','vtnquynh@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(127,'vtphat',1,'2004-02-25 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Võ Tiến Phát','ROLE_STUDENT','vtphat@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(128,'tnphuonghang',0,'2004-02-08 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trần Nguyễn Phượng Hằng','ROLE_STUDENT','tnphuonghang@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(129,'nlquyen',0,'2004-08-13 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Lệ Quyên','ROLE_STUDENT','nlquyen@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(130,'nhaodao',0,'2004-01-16 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Hoàng Anh Đào','ROLE_STUDENT','nhaodao@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(131,'lnptrinh',0,'2004-12-02 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lộc Ngọc Phương Trinh','ROLE_STUDENT','lnptrinh@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(132,'dbhhoang',0,'2004-11-20 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Diệp Bảo Hoàng','ROLE_STUDENT','dbhhoang@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(133,'ptqnhu',0,'2004-01-05 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Phan Thị Quỳnh Như','ROLE_STUDENT','ptqnhu@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(134,'nthkieum',1,'2004-11-06 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Thị Hiếu Khiêm','ROLE_STUDENT','nthkieum@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(135,'ltphuong',0,'2004-03-20 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lưu Thanh Hương','ROLE_STUDENT','ltphuong@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(136,'mtlkhanh',0,'2004-10-04 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Mai Thị Lệ Khánh','ROLE_STUDENT','mtlkhanh@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(137,'ntnglinh',0,'2004-07-09 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Thị Ngọc Linh','ROLE_STUDENT','ntnglinh@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(138,'ntxuyen',0,'2004-01-09 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Thị Xuyến','ROLE_STUDENT','ntxuyen@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(139,'ltle',0,'2004-05-07 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Lê Trần Lê','ROLE_STUDENT','ltle@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(140,'nhbquyen',1,'2004-02-20 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Nguyễn Hạ Bảo Quyên','ROLE_STUDENT','nhbquyen@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(141,'tpthao',0,'2004-01-13 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Trần Phương Thảo','ROLE_STUDENT','tpthao@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17'),(142,'ptmanh',0,'2004-01-03 00:00:00','$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG','Phạm Thị Minh Ánh','ROLE_STUDENT','ptmanh@gmail.com',NULL,NULL,0,'2024-06-14 23:00:17');
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

-- Dump completed on 2024-07-08 15:15:41
