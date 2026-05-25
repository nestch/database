-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: autorack.proxy.rlwy.net    Database: nestch_db
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `favoriteTable`
--

DROP TABLE IF EXISTS `favoriteTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoriteTable` (
  `userID` int NOT NULL,
  `propertyID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`userID`,`propertyID`),
  KEY `propertyID` (`propertyID`),
  CONSTRAINT `favoriteTable_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userTable` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favoriteTable_ibfk_2` FOREIGN KEY (`propertyID`) REFERENCES `propertyTable` (`propertyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoriteTable`
--

LOCK TABLES `favoriteTable` WRITE;
/*!40000 ALTER TABLE `favoriteTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoriteTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featureTable`
--

DROP TABLE IF EXISTS `featureTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `featureTable` (
  `featureID` int NOT NULL AUTO_INCREMENT,
  `featureName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featureStatus` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`featureID`),
  UNIQUE KEY `featureName` (`featureName`),
  KEY `ix_featureTable_featureID` (`featureID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featureTable`
--

LOCK TABLES `featureTable` WRITE;
/*!40000 ALTER TABLE `featureTable` DISABLE KEYS */;
INSERT INTO `featureTable` VALUES (1,'Piscina','1'),(2,'Academia','1'),(3,'Churrasqueira','1'),(4,'Área de Lazer','1'),(5,'Garagem Coberta','1'),(7,'Salão de Festas','1'),(8,'Playground','1'),(9,'Portaria 24h','1'),(10,'Elevador','1'),(11,'Mobiliado','1'),(12,'Armários na Cozinha','1'),(13,'Varanda','1'),(14,'Vista para o Mar','1'),(15,'Segurança 24h','1'),(16,'Quadra Poliesportiva','1'),(17,'Sala de Jogos','1'),(18,'Sauna','1'),(19,'Varanda Gourmet','1'),(20,'Jardim','1');
/*!40000 ALTER TABLE `featureTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificationTable`
--

DROP TABLE IF EXISTS `notificationTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificationTable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` int DEFAULT NULL,
  `receiver` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receiver` (`receiver`),
  KEY `ix_notificationTable_id` (`id`),
  CONSTRAINT `notificationTable_ibfk_1` FOREIGN KEY (`receiver`) REFERENCES `userTable` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificationTable`
--

LOCK TABLES `notificationTable` WRITE;
/*!40000 ALTER TABLE `notificationTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificationTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertyFeatureTable`
--

DROP TABLE IF EXISTS `propertyFeatureTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyFeatureTable` (
  `propertyID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `featureID` int NOT NULL,
  PRIMARY KEY (`propertyID`,`featureID`),
  KEY `featureID` (`featureID`),
  CONSTRAINT `propertyFeatureTable_ibfk_1` FOREIGN KEY (`propertyID`) REFERENCES `propertyTable` (`propertyID`),
  CONSTRAINT `propertyFeatureTable_ibfk_2` FOREIGN KEY (`featureID`) REFERENCES `featureTable` (`featureID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertyFeatureTable`
--

LOCK TABLES `propertyFeatureTable` WRITE;
/*!40000 ALTER TABLE `propertyFeatureTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `propertyFeatureTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertyImageTable`
--

DROP TABLE IF EXISTS `propertyImageTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyImageTable` (
  `imageID` int NOT NULL AUTO_INCREMENT,
  `propertyID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageStatus` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageOrder` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`imageID`),
  KEY `propertyID` (`propertyID`),
  KEY `ix_propertyImageTable_imageID` (`imageID`),
  CONSTRAINT `propertyImageTable_ibfk_1` FOREIGN KEY (`propertyID`) REFERENCES `propertyTable` (`propertyID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertyImageTable`
--

LOCK TABLES `propertyImageTable` WRITE;
/*!40000 ALTER TABLE `propertyImageTable` DISABLE KEYS */;
INSERT INTO `propertyImageTable` VALUES (1,'1766851634819','https://nestch-property.s3.sa-east-1.amazonaws.com/1766851634819/1000037547.jpg','1',1),(2,'1766851634819','https://nestch-property.s3.sa-east-1.amazonaws.com/1766851634819/1000037552.jpg','1',1),(3,'1766851634819','https://nestch-property.s3.sa-east-1.amazonaws.com/1766851634819/1000037551.jpg','1',1),(7,'1769879080366','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879080366/WhatsApp Image 2026-01-14 at 10.55.34 (9).jpeg','1',1),(16,'1769879080366','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879080366/WhatsApp Image 2026-01-14 at 10.55.34 (10).jpeg','1',10),(19,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846293.jpg','1',1),(20,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846269.webp','1',2),(21,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846270.webp','1',3),(22,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846271.webp','1',4),(23,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846272.jpg','1',5),(24,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846273.webp','1',6),(25,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846274.jpg','1',7),(26,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846275.jpg','1',8),(27,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846276.jpg','1',9),(28,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846277.webp','1',10),(29,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846278.jpg','1',11),(30,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846279.webp','1',12),(31,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846280.jpg','1',13),(32,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846281.jpg','1',14),(33,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846282.webp','1',15),(34,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846283.jpg','1',16),(35,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846284.webp','1',17),(36,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846285.jpg','1',18),(38,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846287.jpg','1',20),(39,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846288.jpg','1',21),(40,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846289.webp','1',22),(41,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846290.webp','1',23),(42,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846292.jpg','1',24),(43,'1769879668299','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879668299/4637846295.jpg','1',25),(44,'1769879080366','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879080366/4637846276.jpg','1',1),(45,'1769879080366','https://nestch-property.s3.sa-east-1.amazonaws.com/1769879080366/4637846278.jpg','1',1);
/*!40000 ALTER TABLE `propertyImageTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertyTable`
--

DROP TABLE IF EXISTS `propertyTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyTable` (
  `propertyID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ownerID` int NOT NULL,
  `typeID` int DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `postalCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `neighborhood` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rooms` int DEFAULT NULL,
  `suites` int DEFAULT NULL,
  `bathrooms` int DEFAULT NULL,
  `livingArea` int DEFAULT NULL,
  `totalArea` int DEFAULT NULL,
  `parkingSpaces` int DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `approvalType` int DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  `salePrice` decimal(11,2) DEFAULT NULL,
  `rentPrice` decimal(10,2) DEFAULT NULL,
  `propertyStatus` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`propertyID`),
  KEY `ownerID` (`ownerID`),
  KEY `ix_propertyTable_propertyID` (`propertyID`),
  KEY `typeID` (`typeID`),
  CONSTRAINT `propertyTable_ibfk_1` FOREIGN KEY (`ownerID`) REFERENCES `userTable` (`userID`),
  CONSTRAINT `propertyTable_ibfk_2` FOREIGN KEY (`typeID`) REFERENCES `propertyTypeTable` (`typeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertyTable`
--

LOCK TABLES `propertyTable` WRITE;
/*!40000 ALTER TABLE `propertyTable` DISABLE KEYS */;
INSERT INTO `propertyTable` VALUES ('1766851634819',1,3,'Título','Descrição','71919360','DF','Brasília','Norte (Águas Claras)','Rua Rua 37','2','703A',2,1,2,73,75,2,7,1,1400.00,800.00,600000.00,2400.00,'1'),('1769879080366',10,5,'CLN 310 - Reformada e Mobiliada - topzera','A unidade na CLN 310 apresenta-se reformada e mobiliada, configuração ideal para investidores ou futuros moradores. Esta propriedade destaca sua infraestrutura completa e moderna, com mobiliário cuidadosamente selecionado e uma varanda acolhedora. A segurança 24 horas no local garante a tranquilidade dos seus ocupantes.\n\nA localização estratégica na CLN 310 oferece acesso facilitado a uma ampla gama de serviços e comércios essenciais. Proximidades incluem padarias para conveniência diária, escolas para famílias, um shopping para lazer e compras, academias para bem-estar e saúde, além de órgãos públicos e cinema. Esta concentração de facilidades consolida a região como um polo de conveniência e praticidade, proporcionando um estilo de vida urbano dinâmico e confortável, com tudo ao alcance.\n\nA CLN 310, com sua reforma e mobília, representa uma opção residencial pronta para uso imediato, minimizando a necessidade de adaptações.','70756-510','DF','Brasília','Asa Norte','Quadra CLN 310 Bloco A','217','mesmo bloco da padaria',1,1,1,30,35,1,2,0,500.00,500.00,395000.00,3600.00,'A'),('1769879668299',10,1,'Linda Casa no Condomínio verde','Residência em condomínio. Ambiente residencial consolidado, tranquilidade. Segurança 24h. Imóvel totalmente mobiliado, conforto imediato. Interiores com disposição inteligente de espaços. Ambientes bem definidos. Cozinha americana, armários planejados, eletrodomésticos modernos. Salas de estar e jantar, luminosidade natural. Dormitórios com bom aproveitamento de área. Acabamentos de qualidade. Ventilação natural. Privacidade assegurada.\n\nJardim privativo, paisagismo. Varanda espaçosa, convívio com a natureza. Varanda gourmet, churrasqueira, bancada de apoio, espaço para confraternizações. Momentos de lazer. Área de lazer do condomínio, diversas opções. Sala de jogos, diversão para todas as idades. Espaços para atividade física. Conveniência da localização. Proximidade de pontos comerciais e serviços. Padaria a poucos minutos. Escolas de renome na região. Shopping centers com variadas opções de compras e entretenimento. Mobilidade facilitada. Qualidade de vida.','','DF','Brasília','Jardm Botânico','Condomínio Verde Rua 10 casa 5','5','',1,1,2,150,1000,10,0,0,NULL,NULL,1500000.00,NULL,'A');
/*!40000 ALTER TABLE `propertyTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertyTimeTable`
--

DROP TABLE IF EXISTS `propertyTimeTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyTimeTable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `propertyID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `weekday` int DEFAULT NULL,
  `timeStart` int DEFAULT NULL,
  `timeEnd` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `propertyID` (`propertyID`),
  KEY `ix_propertyTimeTable_id` (`id`),
  CONSTRAINT `propertyTimeTable_ibfk_1` FOREIGN KEY (`propertyID`) REFERENCES `propertyTable` (`propertyID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertyTimeTable`
--

LOCK TABLES `propertyTimeTable` WRITE;
/*!40000 ALTER TABLE `propertyTimeTable` DISABLE KEYS */;
INSERT INTO `propertyTimeTable` VALUES (7,'1766851634819',2,8,18);
/*!40000 ALTER TABLE `propertyTimeTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertyTypeTable`
--

DROP TABLE IF EXISTS `propertyTypeTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyTypeTable` (
  `typeID` int NOT NULL AUTO_INCREMENT,
  `typeName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeStatus` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`typeID`),
  KEY `ix_typeTable_typeID` (`typeID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertyTypeTable`
--

LOCK TABLES `propertyTypeTable` WRITE;
/*!40000 ALTER TABLE `propertyTypeTable` DISABLE KEYS */;
INSERT INTO `propertyTypeTable` VALUES (1,'Casa','A'),(2,'Casa de Condomínio','A'),(3,'Apartamento','A'),(4,'Cobertura','A'),(5,'Kitnet','A'),(6,'Sala','A'),(7,'Loja','A'),(8,'Lote / Terreno','A'),(9,'Sítio','A'),(10,'Chácara','A'),(11,'Fazenda','A'),(12,'Studio','A'),(13,'Flat','A');
/*!40000 ALTER TABLE `propertyTypeTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposalTable`
--

DROP TABLE IF EXISTS `proposalTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposalTable` (
  `proposalID` int NOT NULL AUTO_INCREMENT,
  `referenceID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` int DEFAULT NULL,
  `updatedAt` int DEFAULT NULL,
  `proposalSender` int NOT NULL,
  `proposalValue` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proposalStatus` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`proposalID`),
  KEY `referenceID` (`referenceID`),
  KEY `proposalSender` (`proposalSender`),
  KEY `ix_proposalTable_proposalID` (`proposalID`),
  CONSTRAINT `proposalTable_ibfk_1` FOREIGN KEY (`referenceID`) REFERENCES `visitTable` (`visitID`),
  CONSTRAINT `proposalTable_ibfk_2` FOREIGN KEY (`proposalSender`) REFERENCES `userTable` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposalTable`
--

LOCK TABLES `proposalTable` WRITE;
/*!40000 ALTER TABLE `proposalTable` DISABLE KEYS */;
INSERT INTO `proposalTable` VALUES (1,'1771099331',1771099958,1771099958,1,'600000.0','0');
