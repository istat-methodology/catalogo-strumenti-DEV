CREATE DATABASE  IF NOT EXISTS `catalog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `catalog`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: is2.westeurope.cloudapp.azure.com    Database: catalog
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `catalog_gateway_jwttoken`
--

DROP TABLE IF EXISTS `catalog_gateway_jwttoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_gateway_jwttoken` (
  `token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_gateway_jwttoken`
--

LOCK TABLES `catalog_gateway_jwttoken` WRITE;
/*!40000 ALTER TABLE `catalog_gateway_jwttoken` DISABLE KEYS */;
INSERT INTO `catalog_gateway_jwttoken` VALUES ('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmcmFAZnJhLml0IiwidXNlcklkIjozLCJhdXRoIjpbIlJPTEVfQURNSU4iXSwiaWF0IjoxNjUzNDYzMTIyLCJleHAiOjE2NTM0OTE5MjJ9.V31CFCJmElgQkUyY-z_3a7ul0m6h7MG5oDkUm10wxLw'),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmcmFAZnJhLml0IiwidXNlcklkIjozLCJhdXRoIjpbIlJPTEVfQURNSU4iXSwiaWF0IjoxNjUzNjg2NTA5LCJleHAiOjE2NTM3MTUzMDl9.kWKfIFA0FAryhcXCyLD4WB3BI8eimw7DdLGfM1T5ges'),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmcmFAZnJhLml0IiwidXNlcklkIjozLCJhdXRoIjpbIlJPTEVfQURNSU4iXSwiaWF0IjoxNjUzNjg2NTE0LCJleHAiOjE2NTM3MTUzMTR9.p1FGYD1pIOHRwHifEiEUeOhpB9cMR3JUPJuNjH9eIvg'),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmcmFAZnJhLml0IiwidXNlcklkIjozLCJhdXRoIjpbIlJPTEVfQURNSU4iXSwiaWF0IjoxNjUzNzY4Njc1LCJleHAiOjE2NTM3OTc0NzV9.d9pqJrIuTLAXpa5JTWvxumw7u-Vf1aMiqzezNlrgFxg'),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmcmFAZnJhLml0IiwidXNlcklkIjozLCJhdXRoIjpbIlJPTEVfQURNSU4iXSwiaWF0IjoxNjUzODkyMDM1LCJleHAiOjE2NTM5MjA4MzV9.tPeR8T9T7KYTQ5AnKwZBYTgcxntyVuYByAGzZt2r9qU'),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmcmFAZnJhLml0IiwidXNlcklkIjozLCJhdXRoIjpbIlJPTEVfQURNSU4iXSwiaWF0IjoxNjUzOTgxNTgxLCJleHAiOjE2NTQwMTAzODF9.-A5D4RDSVYdk1qRpj5c8lWQckN7nnvER7UDaVqVzO64'),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmcmFAZnJhLml0IiwidXNlcklkIjozLCJhdXRoIjpbIlJPTEVfQURNSU4iXSwiaWF0IjoxNjUzOTkxNjkyLCJleHAiOjE2NTQwMjA0OTJ9.PeX-gE3WTd_LCm-EuxhcwlYvQxsiMdRJviIJAcxigJc'),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmcmFAZnJhLml0IiwidXNlcklkIjozLCJhdXRoIjpbIlJPTEVfQURNSU4iXSwiaWF0IjoxNjU0NTA5MzYzLCJleHAiOjE2NTQ1MzgxNjN9.Kqc9zLodTpmLI96DH1NpKQXYz-QzVFYqTTKUyDNDAjs'),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmcmFAZnJhLml0IiwidXNlcklkIjozLCJhdXRoIjpbIlJPTEVfQURNSU4iXSwiaWF0IjoxNjU0NTk0NTkzLCJleHAiOjE2NTQ2MjMzOTN9.gSHLW-56k-w7yhf5yy5Urnajbkq9bOT5Y7it27oaIHg'),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmcmFAZnJhLml0IiwidXNlcklkIjozLCJhdXRoIjpbIlJPTEVfQURNSU4iXSwiaWF0IjoxNjU0Njc3MDMwLCJleHAiOjE2NTQ3MDU4MzB9.x1c4v2jDi5XPugcdjPbKP2oNpsaC6gDynqnFQjbwa60'),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmcmFAZnJhLml0IiwidXNlcklkIjozLCJhdXRoIjpbIlJPTEVfQURNSU4iXSwiaWF0IjoxNjU0Njc3MjEzLCJleHAiOjE2NTQ3MDYwMTN9.VsXqSNxNDi6B6fBT7fSXsxqC7vWppFVFBv3unMigI-8'),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmcmFAZnJhLml0IiwidXNlcklkIjozLCJhdXRoIjpbIlJPTEVfQURNSU4iXSwiaWF0IjoxNjU0NjgzNDI3LCJleHAiOjE2NTQ3MTIyMjd9.f9DXD_-TAyfHstB6p9mHuOva8MbsWNbTkd3UAeoD74E'),('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmcmFAZnJhLml0IiwidXNlcklkIjozLCJhdXRoIjpbIlJPTEVfQURNSU4iXSwiaWF0IjoxNjU0NjgzNDMxLCJleHAiOjE2NTQ3MTIyMzF9.muYB1S4d_-SO-uUGWXJSVyJ4lmfZnVw2eYCsVoZA3W0');
/*!40000 ALTER TABLE `catalog_gateway_jwttoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cls_design_type`
--

DROP TABLE IF EXISTS `cls_design_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cls_design_type` (
  `id` int NOT NULL,
  `type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cls_design_type`
--

LOCK TABLES `cls_design_type` WRITE;
/*!40000 ALTER TABLE `cls_design_type` DISABLE KEYS */;
INSERT INTO `cls_design_type` VALUES (1,'INPUT'),(2,'OUTPUT'),(3,'SUPPORT/PARAMETERS');
/*!40000 ALTER TABLE `cls_design_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cls_document_type`
--

DROP TABLE IF EXISTS `cls_document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cls_document_type` (
  `id` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cls_document_type`
--

LOCK TABLES `cls_document_type` WRITE;
/*!40000 ALTER TABLE `cls_document_type` DISABLE KEYS */;
INSERT INTO `cls_document_type` VALUES (1,'User Guide',NULL),(2,'Paper',NULL),(3,'Technical Note',NULL),(4,'Deliverable',NULL),(6,'Web Resource',NULL),(7,'Pubblication',NULL),(8,'Abstract',NULL),(9,'Poster',NULL),(10,'Legal Note',NULL),(11,'Contracts and Administration',NULL);
/*!40000 ALTER TABLE `cls_document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cls_tool_type`
--

DROP TABLE IF EXISTS `cls_tool_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cls_tool_type` (
  `id` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cls_tool_type`
--

LOCK TABLES `cls_tool_type` WRITE;
/*!40000 ALTER TABLE `cls_tool_type` DISABLE KEYS */;
INSERT INTO `cls_tool_type` VALUES (1,'Statistical Service',NULL),(2,'Desktop Application',NULL),(3,'Procedure',NULL);
/*!40000 ALTER TABLE `cls_tool_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cms_view_methodological_tool`
--

DROP TABLE IF EXISTS `cms_view_methodological_tool`;
/*!50001 DROP VIEW IF EXISTS `cms_view_methodological_tool`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cms_view_methodological_tool` AS SELECT 
 1 AS `gsbpm_id`,
 1 AS `gsbpm`,
 1 AS `tool_id`,
 1 AS `tool`,
 1 AS `Tool_type`,
 1 AS `method_id`,
 1 AS `method`,
 1 AS `funct_id`,
 1 AS `functionality`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cms_view_process_design`
--

DROP TABLE IF EXISTS `cms_view_process_design`;
/*!50001 DROP VIEW IF EXISTS `cms_view_process_design`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cms_view_process_design` AS SELECT 
 1 AS `process_id`,
 1 AS `process`,
 1 AS `step_id`,
 1 AS `step`,
 1 AS `design_id`,
 1 AS `object`,
 1 AS `description`,
 1 AS `type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cms_view_process_tree`
--

DROP TABLE IF EXISTS `cms_view_process_tree`;
/*!50001 DROP VIEW IF EXISTS `cms_view_process_tree`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cms_view_process_tree` AS SELECT 
 1 AS `gsbpm`,
 1 AS `subprocess`,
 1 AS `Business_Function`,
 1 AS `Funct_desc`,
 1 AS `Process`,
 1 AS `Process_desc`,
 1 AS `Step`,
 1 AS `Step_desc`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `csm_agent`
--

DROP TABLE IF EXISTS `csm_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_agent` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Organization` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Contact` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_agent`
--

LOCK TABLES `csm_agent` WRITE;
/*!40000 ALTER TABLE `csm_agent` DISABLE KEYS */;
INSERT INTO `csm_agent` VALUES (10,'Mario Rossi','Istat',NULL,NULL),(20,'Luca Verdi','Eurostat',NULL,NULL),(30,'Mauro Bruni','Istat',NULL,NULL),(50,'Marina Belli','Istat','belli@istat.it',' ');
/*!40000 ALTER TABLE `csm_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_app_role`
--

DROP TABLE IF EXISTS `csm_app_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_app_role` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CODE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ORDER_CODE` int DEFAULT NULL,
  `CLS_DATA_TYPE_ID` int DEFAULT NULL,
  `PARAMETER_ID` int DEFAULT NULL,
  `HIDDEN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_app_role_csm_data_type` (`CLS_DATA_TYPE_ID`),
  KEY `fk_csm_app_role_csm_paramter` (`PARAMETER_ID`),
  CONSTRAINT `fk_csm_app_role_csm_data_type` FOREIGN KEY (`CLS_DATA_TYPE_ID`) REFERENCES `csm_cls_data_type` (`ID`),
  CONSTRAINT `fk_csm_app_role_csm_paramter` FOREIGN KEY (`PARAMETER_ID`) REFERENCES `csm_parameter` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_app_role`
--

LOCK TABLES `csm_app_role` WRITE;
/*!40000 ALTER TABLE `csm_app_role` DISABLE KEYS */;
INSERT INTO `csm_app_role` VALUES (1,'X','MATCHING VARIABLES','MATCHING VARAIBLES',1,2,1,NULL),(2,'X1','VARIABLES DATASET A','SELECTED VARIABLES IN DATASET A',2,1,NULL,NULL),(3,'X2','VARIABLES DATASET B','SELECTED VARIABLES IN DATASET B',3,1,NULL,NULL),(4,'CT','CONTINGENCY TABLE','CONTINGENCY TABLE',4,1,NULL,NULL),(5,'FS','MU TABLE','MU TABLE',14,1,NULL,NULL),(6,'B','BLOCKING','SLICING DEL DATASET',7,1,NULL,NULL),(7,'MT','MATCHING TABLE','MATCHING TABLE',8,1,NULL,NULL),(8,'TH','THRESHOLD MATCHING','THRESHOLD MATCHING',9,2,2,NULL),(9,'TU','THRESHOLD UNMATCHING','THRESHOLD UNMATCHING',10,2,3,NULL),(10,'PM','POSSIBLE MATCHING TABLE','POSSIBLE MATCHING TABLE',11,1,NULL,NULL),(13,'RA','RESIDUAL A','RESIDUAL DATASET  A',12,1,NULL,NULL),(14,'RB','RESIDUAL B','RESIDUAL DATASET  B',13,1,NULL,NULL),(15,'MD','DATA','DATA',1,1,NULL,NULL),(16,'RS','RULESET','RULESET',2,4,NULL,NULL),(17,'MP','MARGINAL PROBABILITIES','MARGINAL PROBABILITIES',17,1,NULL,NULL),(18,'BA','BLOCKING A','SLICING DEL DATASET A',18,1,NULL,NULL),(19,'BB','BLOCKING B','SLICING DEL DATASET B',19,1,NULL,NULL),(20,'RM','REDUCTION METHOD','METHOD OF REDUCTION OF THE SEARCH SPACE',20,2,20,NULL),(21,'CIT','INDEXES MATCHED','INDEX ROWS MATCHED CONTENGENCY TABLE',21,1,21,'Y'),(22,'MTR','MATCHING TABLE REDUCED','MATCHING TABLE WITH CONSTRAINT',22,1,NULL,NULL),(23,'QI','QUALITY INDICATORS','QUALITY INDICATORS OF RESULTS',14,1,NULL,NULL),(24,'PMR','POSSIBLE MATCHING TABLE REDUCED','POSSIBLE MATCHING TABLE WITH CONSTRAINT',22,1,NULL,NULL),(26,'MPV','MARGINALS-VARNAMES','MARGINAL PROBABILITIES: VARIABLE NAMES',26,1,NULL,NULL),(27,'MPC','MARGINALS-COMPARISON','MARGINAL PROBABILITIES: VARIABLE NAMES',27,1,NULL,NULL),(28,'MPM','MARGINALS-MFREQ','MARGINAL PROBABILITIES: VARIABLE NAMES',28,1,NULL,NULL),(29,'MPU','MARGINALS-UFREQ','MARGINAL PROBABILITIES: VARIABLE NAMES',29,1,NULL,NULL),(30,'P','P','MATCH FREQUENCY IN SEARCH SPACE',30,2,30,NULL),(100,'N','SKIP','VARIABILE NON UTILIZZATA',100,1,NULL,NULL),(101,'I','IDENTIFICATIVO','CHIAVE OSSERVAZIONE',1,1,NULL,NULL),(102,'y','TARGET','VARIABILE DI OGGETTO DI ANALISI',3,1,NULL,NULL),(103,'x','COVARIATA','VARIABILE INDIPENDENTE',4,1,NULL,NULL),(104,'ypred','PREDIZIONE','VARIABILE DI PREDIZIONE',5,1,NULL,NULL),(105,'OUTLIERS','OUTLIER','FLAG OUTLIER',6,1,NULL,NULL),(106,'W','PESO','PESO CAMPIONARIO',7,1,NULL,NULL),(107,'E','ERRORI INFLUENTI','ERRORE INFLUENTE',10,1,NULL,NULL),(108,'R','RANKING','INFLUENCE RANKING',11,1,NULL,NULL),(109,'OUTVARS','OUTPUT','VARIABILE DI OUTPUT',20,1,NULL,NULL),(110,'STRATA','STRATO','PARTIZIONAMENTO DEL DATASET',2,1,NULL,NULL),(111,'REPORT','PARAMETRI','PARAMETRI DI INPUT',997,2,102,NULL),(112,'MODEL','MODELLO','MODELLO DATI',998,2,101,NULL),(113,'F','SCORE','INFLUENCE SCORE',12,1,NULL,NULL),(114,'PARAMETERS','INFO','PARAMETRI OUT - INFO RIEPILOGO',999,2,103,NULL),(115,'CONV','CONVERGENZA','VARIABILE DI CONVERGENZA',6,1,NULL,NULL),(116,'MDLOUT','MODELLO','MODELLO DATI',998,2,101,NULL),(117,'AGGREGATES','AGGREGATES','STRATA INFORMATION',995,2,NULL,NULL),(999,'U','UNDEFINED','UNDEFINED VARIABLE',100,1,NULL,NULL);
/*!40000 ALTER TABLE `csm_app_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_app_service`
--

DROP TABLE IF EXISTS `csm_app_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_app_service` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `IMPLEMENTATION_LANGUAGE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ENGINE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `SOURCE_PATH` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `SOURCE_CODE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `AUTHOR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `LICENCE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CONTACT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `business_service_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_app_service_csm_business_service1_idx` (`business_service_ID`),
  CONSTRAINT `fk_csm_app_service_csm_business_service1` FOREIGN KEY (`business_service_ID`) REFERENCES `csm_business_service` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_app_service`
--

LOCK TABLES `csm_app_service` WRITE;
/*!40000 ALTER TABLE `csm_app_service` DISABLE KEYS */;
INSERT INTO `csm_app_service` VALUES (100,'SeleMix','Selemix is an R package to treat quantitative data, which aims to identify a set of units affected by errors which potentially influence the estimates of interest (selective editing)','R','RSERVE','selemix/csm_selemix.R','','Istat','EUPL1.1','Maria Teresa Buglielli (bugliell@istat.it)',100),(200,'Relais','R package implementing record linkage methods','R','RENJIN','relais/relais.R','','Istat','EUPL1.1','Luca Valentino (luvalent@istat.it)',200),(250,'Relais Java','Java package implementing record linkage methods','JAVA','JAVA','it.istat.is2.catalogue.relais.service.RelaisService','','Istat','EUPL1.1','Luca Valentino (luvalent@istat.it)',200);
/*!40000 ALTER TABLE `csm_app_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_business_function`
--

DROP TABLE IF EXISTS `csm_business_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_business_function` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `LABEL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ACTIVE` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_business_function`
--

LOCK TABLES `csm_business_function` WRITE;
/*!40000 ALTER TABLE `csm_business_function` DISABLE KEYS */;
INSERT INTO `csm_business_function` VALUES (1,'Record Linkage','The purpose of record linkage is to identify the same real world entity that can be differently represented in data sources, even if unique identifiers are not available or are affected by errors.','RL',NULL),(10,'Selective Editing','Influential errors detection','SMX',1),(20,'Outlier Detection','Outlier detection','OUT',1),(30,'Model extimation','Model extimates using ECM','ECM',1),(31,'Disegno di campionamento Indagini_economiche',NULL,NULL,NULL),(32,'Disegno di campionamento Indagini_sociali 1 stadio',NULL,NULL,NULL),(33,'Disegno di campionamento Indagini_sociali 2 stadi',NULL,NULL,NULL),(34,'Controllo e correzione valori ed unità errate',NULL,NULL,NULL),(35,'Validazione microdati corretti',NULL,NULL,NULL),(36,'Stima piccole aree',NULL,NULL,NULL),(37,'Integrazione dati',NULL,NULL,NULL);
/*!40000 ALTER TABLE `csm_business_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_business_process`
--

DROP TABLE IF EXISTS `csm_business_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_business_process` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `LABEL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ORDER_CODE` int DEFAULT NULL,
  `PARENT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_business_process_csm_business_process` (`PARENT`),
  CONSTRAINT `fk_csm_business_process_csm_business_process` FOREIGN KEY (`PARENT`) REFERENCES `csm_business_process` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_business_process`
--

LOCK TABLES `csm_business_process` WRITE;
/*!40000 ALTER TABLE `csm_business_process` DISABLE KEYS */;
INSERT INTO `csm_business_process` VALUES (1,'Probabilistic Record Linkage','Probabilistic Record Linkage','PRL',1,NULL),(2,'Deterministic Record Linkage','Deterministic Record Linkage','DRL',2,NULL),(3,'Probabilistic Record Linkage reading Marginals','Probabilistic Record Linkage reading Marginals','MAR',3,NULL),(5,'Probabilistic Record Linkage Batch','Probabilistic Record Linkage Batch','PRL batch',1,NULL),(70,'Contingency Table','Calculate contingency table','CrossTable',1,1),(71,'Fellegi Sunter','Fellegi Sunter algorithm','FellegiSunter',2,1),(72,'Matching Table','Matching records','MatchingTable',3,1),(73,'PRL batch','One process with all workflow steps  ','PRL batch',1,5),(76,'Deterministic Record Linkage','Deterministic Record Linkage','DRL',2,2),(77,'Matching constraint','Constraint apply on matches','MatchingTableReduced',4,1),(78,'Residuals','Create residuals','Residuals',5,1),(80,'Selezione errori influenti','Esegue la stima, predizione e valuta gli errori influenti in due processi successivi','Selemix',1,NULL),(110,'Stima e predizione modello','Escuzione del processo di stima e predizione del modello','Estimates',1,80),(112,'Stima modello di regressione','Estimates regression model','Model',1,110),(114,'Predizione','Predicted value estimates','Prediction',2,110),(116,'Outlier','Outlier Detection','Outlier',3,110),(130,'Identificazione errori influenti','Esecuzione del processo di identificazione errori influenti','Selection',2,80),(170,'Contingency Table','Calculate contingency table','CrossTable',1,2),(178,'Residuals','Create residuals','Residuals',4,2),(270,'Contingency Table','Calculate contingency table','CrossTable',1,3),(271,'Read Marginals','Read Marginals Probabilities','FellegiSunter',2,3),(272,'Matching Table','Matching records','MatchingTable',3,3),(273,'Matching constraint','Constraint apply on matches','MatchingTableReduced',4,3),(274,'Residuals','Create residuals','Residuals',5,3),(275,'Definizione della popolazione obiettivo dell’indagine',NULL,NULL,NULL,NULL),(276,'definizione del disegno di campionamento (stratificato)',NULL,NULL,NULL,NULL),(277,'Selezione delle unità',NULL,NULL,NULL,NULL),(278,'Disegno di campionamento',NULL,NULL,NULL,NULL),(279,'Selezione',NULL,NULL,NULL,NULL),(280,'Calcolo pesi diretti',NULL,NULL,NULL,NULL),(281,'preparazione lista UPS partendo da lista unità finali',NULL,NULL,NULL,NULL),(282,'acquisizione lista UPS',NULL,NULL,NULL,NULL),(283,'aggiornamento lista',NULL,NULL,NULL,NULL),(284,'Lettura e preparazione dati indagine',NULL,NULL,NULL,NULL),(285,'controllo e correzione errori sistematici',NULL,NULL,NULL,NULL),(286,'controllo e correzione degli errori influenti e/o anomali',NULL,NULL,NULL,NULL),(287,'controllo e correzione errori casuali',NULL,NULL,NULL,NULL),(288,'imputazione massiva',NULL,NULL,NULL,NULL),(289,'Post editing',NULL,NULL,NULL,NULL),(290,'Preparazione dati input',NULL,NULL,NULL,NULL),(291,'Analisi preliminari',NULL,NULL,NULL,NULL),(292,'Parametrizzazione del modello',NULL,NULL,NULL,NULL),(293,'calcolo stime',NULL,NULL,NULL,NULL),(294,'Analisi dell\'output',NULL,NULL,NULL,NULL),(295,'Acquisizione delle fonti da integrare',NULL,NULL,NULL,NULL),(296,'Analisi qualitativa delle variabili',NULL,NULL,NULL,NULL),(297,'preparazione dati',NULL,NULL,NULL,NULL),(298,'Creazione dello spazio di ricerca',NULL,NULL,NULL,NULL),(299,'Confronto',NULL,NULL,NULL,NULL),(300,'Modello decisionale',NULL,NULL,NULL,NULL),(301,'Abbinamento dei record',NULL,NULL,NULL,NULL),(302,'Applicazione del vincolo di 1:1',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `csm_business_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_business_service`
--

DROP TABLE IF EXISTS `csm_business_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_business_service` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_business_service`
--

LOCK TABLES `csm_business_service` WRITE;
/*!40000 ALTER TABLE `csm_business_service` DISABLE KEYS */;
INSERT INTO `csm_business_service` VALUES (100,'Selective editing','Selective editing is a general approach for the detection of influential errors. It is based on the idea of looking for influential errors with respect to the main results in order to focus the most accurate treatment on the corresponding subset of units to limit the costs of interactive editing, while maintaining the desired level of quality of estimates [GSDEM 2.0]'),(150,'Selemix','Detection of outliers and influential errors using a latent variable model'),(200,'Relais','Record Linkage at Istat'),(201,'FS4, R2BEAT, SAS macro Cube, R-BalancedSampling','FS4, R2BEAT, SAS macro Cube, R-BalancedSampling'),(202,'Mauss-R, R2Beat, Multiway, Sampling Strata','Mauss-R, R2Beat, Multiway, Sampling Strata'),(203,'Re-Genesees','Re-Genesees'),(204,'AGAIN (solo per specifiche indagini)','AGAIN (solo per specifiche indagini)'),(205,'AGAIN (solo per specifiche indagini); applicazione sviluppata per il Censimento della popolazione nel 2018 (Cuccia, Bianchi)','AGAIN (solo per specifiche indagini); applicazione sviluppata per il Censimento della popolazione nel 2018 (Cuccia, Bianchi)'),(206,'Concord-SCIA','Concord-SCIA'),(207,'Regenesses','Regenesses'),(208,'Procedure ad hoc SAS o R','Procedure ad hoc SAS o R'),(209,'Procedure ad hoc SAS o R , relais','Procedure ad hoc SAS o R , relais'),(210,'Procedure ad hoc SAS o R\nLibreria SamplingStrata,  ecc','Procedure ad hoc SAS o R\nLibreria SamplingStrata,  ecc'),(211,'Mauss-R, R2Beat, Multiway, Sampling Strata','Mauss-R, R2Beat, Multiway, Sampling Strata'),(212,'Procedure ad hoc SAS (Proc survey select)  o R','Procedure ad hoc SAS (Proc survey select)  o R'),(213,'Procedure ad hoc SAS (Proc survey select) o R','Procedure ad hoc SAS (Proc survey select) o R'),(214,'Sas, R, SQL','Sas, R, SQL'),(215,'Sas (Banff), R (SeleMix)','Sas (Banff), R (SeleMix)'),(216,'Sas (Banff), R, SQL','Sas (Banff), R, SQL'),(217,'procedure ad hoc','procedure ad hoc'),(218,'ad esempio utilizzando libreria R \"MASS\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"','ad esempio utilizzando libreria R \"MASS\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"'),(219,'Pacchetto R mind','Pacchetto R mind'),(220,'Funzione diagnostic.R','Funzione diagnostic.R'),(221,'RLfunc','RLfunc'),(222,'fastLink; Rlfunc','fastLink; Rlfunc'),(223,'fastLink','fastLink'),(999,'Dummy','Placeholder for undefined processes and objects');
/*!40000 ALTER TABLE `csm_business_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_cls_data_type`
--

DROP TABLE IF EXISTS `csm_cls_data_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_cls_data_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_cls_data_type`
--

LOCK TABLES `csm_cls_data_type` WRITE;
/*!40000 ALTER TABLE `csm_cls_data_type` DISABLE KEYS */;
INSERT INTO `csm_cls_data_type` VALUES (1,'VARIABLE',NULL),(2,'PARAMETER',NULL),(3,'DATASET',NULL),(4,'RULESET',NULL),(5,'RULE',NULL),(6,'MODEL',NULL);
/*!40000 ALTER TABLE `csm_cls_data_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_cls_rule`
--

DROP TABLE IF EXISTS `csm_cls_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_cls_rule` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NOTE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_cls_rule`
--

LOCK TABLES `csm_cls_rule` WRITE;
/*!40000 ALTER TABLE `csm_cls_rule` DISABLE KEYS */;
INSERT INTO `csm_cls_rule` VALUES (1,'Dominio','Definisce i valori o le modalità ammissibili della variabile','Può comprendere missing e/o zero; distinguere tra variabile qualitativa e quantitativa'),(2,'Coerenza logica','Definisce le combinazioni ammissibili di valori e/o modalità tra due o più variabili ','Prevalentemente per  variabli qualitative, anche se la regola può riguardare entrambe le tipologie di variabili (es. ETA(0-15) STACIV(coniugato) con ETA fissa)'),(3,'Quadratura','Definisce l\'uguaglianza ammissibile tra la somma di due o più variabili quantitative e il totale corrispondente (che può essere noto a priori o a sua volta ottenuto dalla somma di altre variabili del dataset)','Solo variabili quantitative'),(4,'Disuguaglianza forma semplice','Definisce la relazione matematica ammissibile (>, >=, <, <=) tra due variabili quantitative','Solo variabili quantitative'),(5,'Disuguaglianza forma composta','Definisce la relazione matematica ammissibile (>, >=, <, <=) tra due quantità, dove ciascuna quantità può essere costituita da una sola variabile X o dalla somma/differenza/prodotto tra due o più variabili X','Solo variabili quantitative'),(6,'Validazione/Completezza','Verifica in base alle regole di compilazione del questionario che i dati siano stati immessi correttamente','Distinguere tra variabile qualitativa e quantitativa'),(7,'Editing',NULL,'Valore di default al caricamento del file');
/*!40000 ALTER TABLE `csm_cls_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_cls_statistical_variable`
--

DROP TABLE IF EXISTS `csm_cls_statistical_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_cls_statistical_variable` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `TYPE` int DEFAULT NULL,
  `ORDER_CODE` int DEFAULT NULL,
  `VARIABLE_NAME_ITA` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VARIABLE_NAME_ENG` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_cls_statistical_variable`
--

LOCK TABLES `csm_cls_statistical_variable` WRITE;
/*!40000 ALTER TABLE `csm_cls_statistical_variable` DISABLE KEYS */;
INSERT INTO `csm_cls_statistical_variable` VALUES (1,NULL,'Variabili identificative delle unità',8,1,'VARIABILI IDENTIFICATIVE DELLE UNITÀ','UNIT INDENTIFIER'),(2,NULL,'Variabili statistiche di classificazione',1,2,'VARIABILI STATISTICHE DI CLASSIFICAZIONE','CLASSIFICATION'),(3,NULL,'Variabili statistiche numeriche',2,3,'VARIABILI STATISTICHE NUMERICHE','NUMERIC'),(4,NULL,'Variabili statistiche testuali',3,4,'VARIABILI STATISTICHE TESTUALI','TEXTUAL/OPENED'),(5,NULL,'Concetti relativi al contenuto dei dati',6,5,'AGGREGATO','AGGREGATE'),(6,NULL,'Concetti di tipo operativo',4,6,'CONCETTI DI TIPO OPERATIVO','OPERATIONAL'),(7,NULL,'Concetti di tipo temporale',5,7,'CONCETTI DI TIPO TEMPORALE','TEMPORAL'),(8,NULL,'Concetti relativi alla frequenza',7,8,'CONCETTI RELATIVI ALLA FREQUENZA','FREQUENCY'),(9,NULL,'Concetti usati per identificare il peso campionario',10,9,'PESO','PESO'),(10,NULL,'Paradati ..',12,10,'PARADATO','PARADATA'),(11,NULL,'Variabili statistiche composte',11,11,'CONCETTI IDENTIFICATIVI DEL DATASET','DATASET IDENTIFIER'),(12,NULL,'Variabili non definite',9,12,'NON DEFINITA','UNDEFINED');
/*!40000 ALTER TABLE `csm_cls_statistical_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_cls_type_io`
--

DROP TABLE IF EXISTS `csm_cls_type_io`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_cls_type_io` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_cls_type_io`
--

LOCK TABLES `csm_cls_type_io` WRITE;
/*!40000 ALTER TABLE `csm_cls_type_io` DISABLE KEYS */;
INSERT INTO `csm_cls_type_io` VALUES (1,'INPUT'),(2,'OUTPUT'),(3,'INPUT_OUTPUT');
/*!40000 ALTER TABLE `csm_cls_type_io` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_data_processing`
--

DROP TABLE IF EXISTS `csm_data_processing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_data_processing` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `LAST_UPDATE` datetime DEFAULT NULL,
  `BUSINESS_PROCESS_ID` int NOT NULL,
  `WORK_SESSION_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_data_processing_business_process` (`BUSINESS_PROCESS_ID`),
  KEY `fk_csm_data_processing_worksession` (`WORK_SESSION_ID`),
  CONSTRAINT `fk_csm_data_processing_business_process` FOREIGN KEY (`BUSINESS_PROCESS_ID`) REFERENCES `csm_business_process` (`ID`),
  CONSTRAINT `fk_csm_data_processing_worksession` FOREIGN KEY (`WORK_SESSION_ID`) REFERENCES `csm_work_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_data_processing`
--

LOCK TABLES `csm_data_processing` WRITE;
/*!40000 ALTER TABLE `csm_data_processing` DISABLE KEYS */;
/*!40000 ALTER TABLE `csm_data_processing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_dataset_column`
--

DROP TABLE IF EXISTS `csm_dataset_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_dataset_column` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ORDER_CODE` int DEFAULT NULL,
  `CONTENT` json DEFAULT NULL,
  `CONTENT_SIZE` int DEFAULT NULL,
  `DATASET_FILE_ID` int DEFAULT NULL,
  `STATISTICAL_VARIABLE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_dataset_column_dataset_id` (`DATASET_FILE_ID`),
  KEY `fk_csm_dataset_column_statistical_variable` (`STATISTICAL_VARIABLE_ID`),
  CONSTRAINT `fk_csm_dataset_column_dataset_id` FOREIGN KEY (`DATASET_FILE_ID`) REFERENCES `csm_dataset_file` (`ID`),
  CONSTRAINT `fk_csm_dataset_column_statistical_variable` FOREIGN KEY (`STATISTICAL_VARIABLE_ID`) REFERENCES `csm_cls_statistical_variable` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_dataset_column`
--

LOCK TABLES `csm_dataset_column` WRITE;
/*!40000 ALTER TABLE `csm_dataset_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `csm_dataset_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_dataset_file`
--

DROP TABLE IF EXISTS `csm_dataset_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_dataset_file` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FILE_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `FILE_LABEL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `FILE_FORMAT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `FIELD_SEPARATOR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `TOTAL_ROWS` int DEFAULT NULL,
  `LAST_UPDATE` datetime DEFAULT NULL,
  `CLS_DATA_TYPE_ID` int DEFAULT NULL,
  `WORK_SESSION_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_datakset_file_data_type` (`CLS_DATA_TYPE_ID`),
  KEY `fk_csm_datakset_file_worksession` (`WORK_SESSION_ID`),
  CONSTRAINT `fk_csm_datakset_file_data_type` FOREIGN KEY (`CLS_DATA_TYPE_ID`) REFERENCES `csm_cls_data_type` (`ID`),
  CONSTRAINT `fk_csm_datakset_file_worksession` FOREIGN KEY (`WORK_SESSION_ID`) REFERENCES `csm_work_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_dataset_file`
--

LOCK TABLES `csm_dataset_file` WRITE;
/*!40000 ALTER TABLE `csm_dataset_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `csm_dataset_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_desktop_application`
--

DROP TABLE IF EXISTS `csm_desktop_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_desktop_application` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Download` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Licence` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Language` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Package` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Operative_System` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Version` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Technical_requirements` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_csm_desktop_application_csm_methodological_tool1` FOREIGN KEY (`ID`) REFERENCES `csm_methodological_tool` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_desktop_application`
--

LOCK TABLES `csm_desktop_application` WRITE;
/*!40000 ALTER TABLE `csm_desktop_application` DISABLE KEYS */;
INSERT INTO `csm_desktop_application` VALUES (150,'https://www.istat.it/it/files//2015/04/SELEMIX_WIN.zip','EUPL','R Statistical Language',NULL,'Windows','1.0.2',NULL),(200,'https://www.istat.it/it/files//2020/03/RELAIS_3.1.zip','EUPL 1.1','R and SQL',NULL,'Windows','3.1',NULL);
/*!40000 ALTER TABLE `csm_desktop_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_documentation`
--

DROP TABLE IF EXISTS `csm_documentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_documentation` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Publisher` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Document_type` int DEFAULT NULL,
  `Notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Resource` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_documentation_csm_document_type1_idx` (`Document_type`),
  CONSTRAINT `fk_csm_documentation_csm_document_type1` FOREIGN KEY (`Document_type`) REFERENCES `cls_document_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_documentation`
--

LOCK TABLES `csm_documentation` WRITE;
/*!40000 ALTER TABLE `csm_documentation` DISABLE KEYS */;
INSERT INTO `csm_documentation` VALUES (10,'Selemix','Istat',1,'Note','https://rdrr.io/cran/SeleMix/'),(20,'Selemix','Istat',2,'Note','https://cran.r-project.org/package=SeleMix'),(40,'Relais','Istat',1,'Note','https://www.istat.it/it/files/2014/03/Relais3.1UserGuide.pdf');
/*!40000 ALTER TABLE `csm_documentation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_excel_import`
--

DROP TABLE IF EXISTS `csm_excel_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_excel_import` (
  `gsbpm` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `business_process` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `process_step` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `step_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `action_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Transormable_input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `label_in` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `process_support` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `process_method` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `transformable_output_synt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `transformable_output` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `label_out` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `statistical_method` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `desktop_application` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `statistical_service` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `procname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `business_function` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `methodological_tool` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `phase` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_excel_import`
--

LOCK TABLES `csm_excel_import` WRITE;
/*!40000 ALTER TABLE `csm_excel_import` DISABLE KEYS */;
INSERT INTO `csm_excel_import` VALUES ('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Definizione della popolazione obiettivo dell’indagine','lettura dati','Lettura dati archivio','Lettura archivi di riferimento (ASIA, Farm register, RACLI, FRAME SBS  a seconda delle unità di rilevazione)','archivio o registro contenente la potenziale popolazione di interesse','input0','metadati di lettura (path, tracciato record, psw, ecc)','lettura dati (read, read.table, ecc)','microdati d\'archivio formattati','dati d\'archivio in formato elaborabile','ouput1','','','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Definizione della popolazione obiettivo dell’indagine','selezione unità','Selezione del sottoinsieme di unità appartenenti alla popolazione obiettivo dell’indagine','applicazione metodi di selezione. Tipicamente tramite condizioni di IF utilizzando variabili disponibili nell\'archivio di riferimento','dati in formato elaborabile','output 1','metadati utili alla selzionee delle unità appartentii alla popolazione di indagine (es. classsi ateco, dimensione, ecc)','Metodi di selezione','microdati popolazione da archivio','Lista unità appartenenti alla popolazione obiettivo con potenziali variabili di stratificazzione, localizzazione delle unità, ecc.','output 2','','','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Definizione della popolazione obiettivo dell’indagine','lettura dati','lettura dati su \"ASIA eventi\"\"\"\"\"\"\"\" e da indagini precedenti\"\"\"\"\"\"\"','si  tratta di acquisire informazioni sulle trasformazioni delle unità della popolazione di riferimento','archivio o registro con informazioni sugli eventi di trasformazione delle  unità','inpiut 0 bis','metadati di lettura (path, tracciato record, psw, ecc) ','lettura dati','microdati ausiliari','dati in formato elaborabile','output 1 bis','','','','','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Definizione della popolazione obiettivo dell’indagine','integrazione dati','abbinamento lista unità appartenenti alla popolazione con informazioni sulle trasformazioni','le informazioni sulle trasformazioni devono essere correttamente abbinate alle singole unità','lista unità con informazioni sulle trasformazioni ','output 1 + input 0 bis','chiavi di link tra unità della popolazione e unità trasformate ','abbinamento tra fonti di dati','microdatipopolazione arricchita','lista unità aggiornata con informazioni sulle trasformazioni','output 2','metodi di rekord linkage: da merge a relais','','','','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Definizione della popolazione obiettivo dell’indagine','aggiornamento lista','Aggiornamento della lista per trasformazione unità (cessazioni, fusioni, trasformazioni, ecc)','Si tratta di aggiornare la lista della popolazione utilizzando le regole di evoluzione demografica delle unità gia presenti nella popolazione selezionata. Gli eventi di cui si deve tener conto sono soltamente contenuti in \"ASIA eventi\"\"\"\"\"\"\"\" o riguardano informazioni su singole imprese che hanno subito trasformazioni (suddivisoni, trasformazioni, cessazioni, ecc)\"\"\"\"\"\"\"','lista unità aggiornata con informazioni sulle trasformazioni','output 2','metadati sugli eventi di trasformazione','implementazione regole di trasformazione','microdati  archivio aggiornati','Lista aggiornata delle unità appartenenti alla popolazione obiettivo  ','output 3','','','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Definizione della popolazione obiettivo dell’indagine','lettura dati ','lettura dati da fonti con informazioni ausiliarie','acquisizione lista nuove unità non presenti nell\'ouput 3','lista nuove unità','input0 bis','metadati di lettura (path, tracciato record, psw, ecc)','lettura dati (read, read.table, ecc)','microdati ausiliari','microdati formattati','output 1bis','','','','','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Definizione della popolazione obiettivo dell’indagine','aggiornamento lista','aggiunta rekord nuove nate','Si tratta di aggiungere unità “nuove nate” non presenti nell\'ultima versione del registro','Lista unità appartenenti alla popolazione obiettivo aggiornata','ouput 3+output 1 bis','','unione file','microdati popolazione ','Lista aggiornata integrata con le nuove unità','output 4','','','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','definizione del disegno di campionamento (stratificato)','lettura dati ','acquisizione micro dati con informazioni ausiliarie sui fenomeni di interesse e linkabili alla lista della popolazione','In alcuni casi è possibile linkare direttamente alle unità della popolazione selezionata informazioni sui variabili proxy dei fenomeni di interesse provenienenti da altre fonti (tipicamente indagini precedenti o archivi amministrativi). Queste verranno usate per descrivere le distribuzioni (medie e varianze) utili alla definizione del disegno di campionamento','archivio o fonti con variabili proxy delle variabili diinteresse','input 1','Metadati di lettura concernenti le fonti con le variabili proxy (path, tracciato record, psw, ecc)','lettura dati','microdati ausiliari','microdati relativi a tutta o a una parte della popolazione','input 1','metodfi di rekord linkage: da merge a relais','','','Procedure ad hoc SAS o R , relais','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','definizione del disegno di campionamento (stratificato)','integrazione dati','abbinamento della lista delle unità della popolazione aggiornatacon informazioni variabili proxy','','','input1+outpu4','','abbinamento tra fonti di dati','microdati popolazioni arricchiti','lista popolazione arricchita','output 5','','','','','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','definizione del disegno di campionamento (stratificato)','lettura dati','acquisizione micro dati con informazioni ausiliarie NON integrabile a livello micro con lista popolazione (alternativa ai due passi precedetni)','In alcuni casi NON è possibile linkare direttamente alle unità della popolazione selezionata informazioni sui variabili proxy dei fenomeni di interesse provenienenti da altre fonti (tipicamente indagini precedenti o archivi amministrativi). Nondimeno è possibile acquisire informazioni su variabili proxy che potranno essere successivamente connesse alla popolazione di interesse tramite codice di strato','dati da indagini precedenti, dati da registro, dati amministrativi con variabili proxy delle variabili di interesse e con variabili utili alla stratificazione che devono essere presenti anche nella lista di popolazione','input 2','Metadati sulle fonti con informazioni sulla variabilità ','lettura dati','microdati ausiliari','microdati con informazioni ausiliarie','output 5 bis (alternatiivo a output 5)','','','','','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','definizione del disegno di campionamento (stratificato)','analisi  dati','Individuazione di variabili esplicative dei fenomeni di interesse','Si tratta dell\'analisi delle fonti con le variabili proxy utile a individuare quali tra le varibili acquisite possono essere più utili. Alcune analisi possono essere indirizzate da indicazioni fornite da esperti di settore o da precedenti edizioni dell\'indagine','lista popolazione arricchita o \nlista microdati con informazioni ausiliarie','output 5 o output 5 bis','indicazioni sulle potenziali variabili esplicative','analisi della dipendenza ','identificativo variabili esplicative','lista potenziali varibili di stratificazione','output 6','matrici di corrrelazione, tabelle di contingenza, alberi di regressione, ecc.','','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','definizione del disegno di campionamento (stratificato)','identificazioni unità influenti','determinazione del take all strato','Serve ad individuare le unità maggiormente significative. Quelle cioè che spiegano una parte rilevante dei fenomeni osservati. Di solto di determina una soglia dimensionale','Lista unità appartenenti alla popolazione obiettivo integrata \ninformazione ausiliaria sui fenomeni di interesse','(output 5 o output 5 bis) + output 6','cv desiderati per dominio','implementazione algoritmo per la definizione eventuali strati take all','identificativo unità','Lista unità con flag delle unità che appartegono al take all stratum','output 7','algoritmo di hidiroglou betelot','','','','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','definizione del disegno di campionamento (stratificato)','identificazione unità ininfluenti','determinazione del take none strato','Serve ad individuare le unità che danno un contributo poco rilevante al fenomeno complessivo. Questo passo crea una distorsione trascurabile. Di solito si determina una soglia dimensionale','Lista unità appartenenti alla popolazione obiettivo per la selezione del campione+\ninformazione ausiliaria sui fenomeni di interesse','(output 5 o output 5 bis) + output 6','cv desiderati per dominio','implementazione algoritmo per la definizione eventuali strati take none','identificativo unità','Lista unità con flag delle unità che appartegono al take none stratum','output 8','','','','','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','definizione del disegno di campionamento (stratificato)','stratificazione','determinazione della stratificazione','si determina la suddivisione delle unità in gruppi ritenuti omogenei rispetto alle variabili proxi ed i parametri che caratterizzano ciascun gruppo.\n','Lista unità appartenenti alla popolazione obiettivo per la selezione del campione+flag concernenti i take all e i take non strata','(output 5  o output 5 bis) + output 7 + output 8','parametri utili alla stratificazione.Es. dimensione minima di strato cv di dominio','Implementazione tecniche di raggruppamento delle unità e caratterizzazione dei gruppi: medie e varianze di strato di variabili correlate alle variabili di interesse\n','identificativo di strato com medie e varianze','Lista strati con medie e varianze','ouput 9','metodi di \"clusterizzazzione\"\"\"\"\"\"\"\" , algoritmi evolutivi,  kmeans, regenesees, summary, ecc\"\"\"\"\"\"\"','','','Procedure ad hoc SAS o R\nLibreria SamplingStrata,  ecc','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','definizione del disegno di campionamento (stratificato)','aggiornamento lista','integrazione popolazione aggiornata con lista strati (nel caso si sia usato l\'output 5 bis)','ad ogni unità della lista si abbina il suo codice strato','lista popolazione aggiornata e lista strati','output 4 + output 10','','abbinamento per codice di strato','popolazione stratificata ','lista strati con parametri utili all\'allocazzione','output 10 bis','','','','','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','definizione del disegno di campionamento (stratificato)','determinazione numerosità campionaria','allocazione delle unità','implementazione algoritmo di allocazione (es: proporzionale, ottima, Bethel, multiway, …)','dati da indagiini precedenti, dati da registro, da amministtrativi con variabili proxy delle variabili di interesse e con variabili utili alla stratificazione','output 10 o output 10 bis','cv desiderati per dominio','implementazione algoritmo di allocazione (es: proporzionale, ottima, Bethel, multiway, …)','lista strati con dimensione campionaria','lista strati con dimesnione campionaria','output 11','Bethel, proporzional, Neyman, ecc','','','Mauss-R, R2Beat, Multiway, Sampling Strata','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Selezione delle unità','identificazione unità campionarie','Selezione delle unità','in questo passo si indivisuano le unità che faranno concretamente parte del campione ','Output algoritmo di allocazione e lista popolazione arricchita','output 11 + output 6','Informazioni sulle unità già selezionate da altre indagini','metodo di selezione','campione indagine','lista unità campionarie con codsiuce strato e peso campionario iniziale','output 12','selezione sistematica, seuenziale, poisson, coordinata, ecc.','FS4, R2BEAT, SAS macro Cube, R-BalancedSampling','','Procedure ad hoc SAS (Proc survey select)  o R','Disegno di campionamento Indagini_economiche','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Definizione della popolazione obiettivo dell’indagine','lettura dati','Lettura dati archivi di riferimento ','Lettura archivio o registro contenente la potenziale popolazione di interesse, comuni, scuole o altro a seconda delle unità di rilevazione e variabili di stratificazione','archivio di riferimento','input 0','metadati di lettura (path, tracciato record, psw, ecc)','lettura dati (read, read.table, ecc)','microdati archivio formattai','dati archivio in formato elaborabile','ouput1','','','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_sociali 1 stadio','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Definizione della popolazione obiettivo dell’indagine','selezione unità','Selezione del sottoinsieme di unità appartenenti alla popolazione obiettivo dell’indagine','applicazione metodi di selezione. Tipicamente tramite condizioni di IF utilizzando variabili disponibili nell\'archivio di riferimento','dati archivio in formato elaborabile','ouput 1','condizioni di appartenenza alla popolazione','metodi di selezione (if)','microdati popolazione da archivio','Lista unità appartenenti alla popolazione obiettivo','output 2','','','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_sociali 1 stadio','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Disegno di campionamento','analisi dati','Individuazione variabili esplicative dei fenomeni di interesse','Individuazione di variabili su cui basare l\'allocazione (stime di precedenti indagini, frequenze tipiche)','Lista unità appartenenti alla popolazione obiettivo','ouput 2','Fonti ausiliarie relative a variabili correlate alle variabili di interesse','analisi della dipendenza','identificativo variabili esplicative','Lista potenziali variabili di stratifcazione','ouput 3','matrici di corrrelazione, tabelle di contingenza, alberi di regressione, ecc.','','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_sociali 1 stadio','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Disegno di campionamento','stratificazione','Definizione dello strato e dei domini pianificati','si determina la suddivisione delle unità in gruppi ritenuti omogenei rispetto alle variabili proxi e si determinano i parametri che caratterizzano ciascun gruppo.','Lista unità appartenenti alla popolazione obiettivo per la selezione del campione','','parametri utili alla stratificazione.Es. dimensione minima di strato cv di dominio','Implementazione tecniche di raggruppamento delle unità e caratterizzazione dei gruppi: medie e varianze di strato di variabili correlate alle variabili di interesse','identificativo di strato con medi e varianze','lista strati con parametri utili all\'allocazione','','metodi di \"clusterizzazzione\"\"\"\"\"\"\"\" , algoritmi evolutivi,  kmeans, regenesees, summary, ecc\"\"\"\"\"\"\"','','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_sociali 1 stadio','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Disegno di campionamento','aggiornamento lista','integrazione popolazione aggiornata con lista strati','ad ogni unità della lista si abbina il suo codice strato','lista popolazione aggiornata e lista strati','','','abbinamento per codice di strato','popolazione stratificata ','lista strati con parametri utili all\'allocazzione','','','','','','Disegno di campionamento Indagini_sociali 1 stadio','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Disegno di campionamento','determinazione numerosità campionaria','allocazione delle unità','implementazione algoritmo di allocazione (es: proporzionale, ottima, Bethel, multiway, …)','lista strati con parametri utili all\'allocazzione','output 10 o output 10 bis','cv desiderati per dominio','implementazione algoritmo di allocazione (es: proporzionale, ottima, Bethel, multiway, …)','lista strati con dimensione campionaria','lista strati con dimesnione campionaria','output 11','Bethel, proporzional, Neyman, ecc','Mauss-R, R2Beat, Multiway, Sampling Strata','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_sociali 1 stadio','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Selezione','selezione unità','Selezione delle unità indagini cross section','selezione semplice: in questo passo si identificano le unità della popolazione che saranno effettivamente incluse nel campione per una indagine cross section','Output algoritmo di allocazione e lista popolazione aggiornata','','Informazioni sulle unità già selezionate da altre indagini','implementazione metodi di selezione','campione selezionato','Campione selezionato','','Selezione probabilistica con probabilità uguali','FS4, R2BEAT, SAS macro Cube, R-BalancedSampling','','Procedure ad hoc SAS (Proc survey select)  o R','Disegno di campionamento Indagini_sociali 1 stadio','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Selezione','selezione unità','selezione per indagini panel','Selezione con metodi di rotazione per indagini panel','Output algoritmo di allocazione e lista popolazione aggiornata e identificativi unità selezionate nelle precedenti occasioni di indagine','','Schema temporale di rilevazione (rotazione)','metodo di selezione dei periodi','campione sezionato','Campione selezionato con attribuzione dei periodi di rilevazione','','Selezione casuale dei periodi di rilevazione della unità','','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_sociali 1 stadio','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Calcolo pesi diretti','Calcolo pesi diretti','Calcolo pesi diretti','Calcolo pesi diretti','Campione selezionato','','Probabilità di inclusione ','Calcolo del peso diretto','','Campione selezionato con pesi diretti ','','Calcolo del peso campionario sulla base delle probabilità di inclusione','','','Procedure ad hoc SAS (Proc survey select) o R','Disegno di campionamento Indagini_sociali 1 stadio','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','preparazione lista UPS partendo da lista unità finali','lettura dati','lettura archivio unità finali','Questo passo viene solitamente effettuato esternamente (ad esempio DCRD) piuttosto che da chi è direttamente coinvolto nella predisposizione del disegno dicampionamentop a due stadi','archivio unità finali (famigle, individui, alunni, ecc)','input 0','metadati di lettura (path, tracciato record, psw, ecc)','lettura dati (read, read.table, ecc)','dati formattati','dati in formato elaborabile per i passi successsivi','output 1','','','','','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','preparazione lista UPS partendo da lista unità finali','preprazione dati','partizione delle popolazione delle unità finali in sottopolazioni ','serve per individuare gruppi di unità finali in cui applicare eventualmente disegni di campionamento differenti. Ad esempio famiglie con tefono e famiglie senza telefono (non sempre questo passo viene effettuato)','archivio unità finali (famigle, individui, alunni, ecc)','output 1','caratteristiche delle unità finali utili a differenziare i disegni di campionamento','implementazione regole deterministiche (IF THEN)','dati formattati','lista unità finali con flag delle unità da osserevare tramite campinamento a due stadi','output 2','','','','','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','preparazione lista UPS partendo da lista unità finali','preprazione lista unità primarie','aggregazione delle unità finali per codice unità primaria','si aggregano le unità finali per codice delle UPS ','archivio unità primarie di selezione','output 2','codici unità primarie','metodi di aggregazione (tablle, summary, ecc)','dati formattati','lista unità primarie (UPS)','output 3a','','','','','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','acquisizione lista UPS','lettura dati','lettura lista unità primarie ','questo nel caso tale archivio sia disponibile e non serva passare per i passi precedenti. Tipici esempi: archivio dei comuni con popolazione; archivio scuole con alunni','archivio unità primarie di selezione','input 1','codici unità primarie','lettura dati (read, read.table, ecc)','dati formattati','lista unità primarie (UPS)','output 3b','','','','','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','aggiornamento lista','lettura dati','Lettura archivi di riferimento o registri con le trasformazioni delle unità UPS','Acquisizione informazioni su eventi di trasformazione delle UPS lettura e/o acquisizione informazioni su UPS che hanno subito trasformazioni (ad esempio  fusione di comuni)','Lista unità appartenenti alla popolazione obiettivo','output 3a o output 3b','Fonti ausiliarie relative a eventi di trasformazione delle unità',' lettura dati e applicazione regole di trasformazione delle unità ','dati formattati','Lista unità appartenenti alla popolazione obiettivo aggiornata','output 4','','','','','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','aggiornamento lista','integrazione dati','abbinamento alla lista delle informazioni sulle trasformazioni','si tratta di linkare le informazioni sulle trasformazioni alla lista iniziale. E\' una operazione che può richiedere attenzione alle regole di continuità delle unità','archivio o registro con informazioni sugli eventi di trasformazione delle UPS','output 5','Fonti ausiliarie relative a eventi di trasformazione delle unità',' lettura dati e applicazione regole di trasformazione delle unità ','dati formattati','Lista unità appartenenti alla popolazione obiettivo aggiornata con trasformazioni','output 6','','','','','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','aggiornamento lista','aggiornamento lista','Aggiornamento della lista (eliminazione unità cessate e integrazione con nuove nate)','Si tratta di aggiornare la lista della popolazione UPS utilizzando le regole di evoluzione demografica delle unità gia presenti nella popolazione selezionata. Particolare attenzione deve essere posta alle regole di continuità e quindi ai codici identificativi delle unità nel corso del tempo','Lista unità appartenenti alla popolazione obiettivo aggiornata','output 6','Fonti ausiliarie relative a eventi di trasformazione delle unità',' lettura dati e applicazione regole di trasformazione delle unità ','dati formattati','Lista unità appartenenti alla popolazione obiettivo aggiornata con trasformazioni','output 7','','','','','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','aggiornamento lista','lettura dati','lettura archivi di riferimento','Acquisizione informazioni aggiornate su popolazione delle UPS e calcolo della dimensione in termini di unità finali che hanno subito trasformazioni\nqueste informazioni posso arrivare anche da indagini precedenti (ad esempio Forze Lavoro)','Lista unità appartenenti alla popolazione obiettivo aggiornata','output 7','Fonti ausiliarie relative a nuove unità ',' lettura dati e applicazione regole di trasformazione delle unità ','dati formattati','Lista unità appartenenti alla popolazione obiettivo integrata con le nuove unità','output 8','','','','','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','aggiornamento lista','integrazione dati','abbinamento delle informazioni sulle unità finali alla lista delle unità UPS','le informazioni sulle trasformazioni devono essere correttamente abbinate alle singole unità','Lista unità appartenenti alla popolazione obiettivo integrata con le nuove unità e le nuove informazioni ausiliarie','output 8','Liste unità precedenti','Link tra archivi','dati formattati','Lista UPS appartenenti alla popolazione obiettivo aggiornata e integrata con le nuove unità e informazioni sulle unità finali','output 9','','','','','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Disegno di campionamento','analisi dati','Individuazione di variabili fortemente correlate alle variabili di interesse','Individuazione di variabili su cui basare l\'allocazione (stime di precedenti indagini, frequenze tipiche)','Lista unità appartenenti alla popolazione obiettivo aggiornata e integrata con le nuove unità','output 9','Fonti ausiliarie relative a variabili correlate alle variabili di interesse','Individuazione variabili','dati formattati','Lista unità appartenenti alla popolazione obiettivo per la selezione del campione','output 10','','','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Disegno di campionamento','stratificazione 1','determinazione della stratificazione','si stratifcano le unità finali (USS) per caratteristiche delle UPS e si assegnano i domini di stima','Lista unità appartenenti alla popolazione obiettivo per la selezione del campione','output 10','Variabili di stratificazione','Assegnazione dello strato','dati formattati','Lista unità stratificata 1','output 11','Classificazione delle unità della popolazione','','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Disegno di campionamento','Aggregazione ','aggrego le unità primarie per la prima stratificazione','contiamo le unità finali per ciascuno strato della stratificazione 1','Lista strati di stratificazione 1','output 11','Variabili di stratificazione','Aggregazione USS in UPS','dati formattati','Lista unità primarie stratificata 1','output 12','','','','','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Disegno di campionamento','lettura dati','acquisizione informazioni ausiliarie sugli strati','letture fonti ausiliarie con informazioni proxy sulle variabili di interesse (ad esempio un\'altra indagine) e calcolo caratteristiche a livello della prima stratificazione','Informazioni esterne','input 2','Numerosità, medie e varianze di strato di variabili correlate alle variabili di interesse','Aquisizione stime e varianze','dati formattati','Medie e varianze per strato 1','output 13','Calcolo di medie e varianze','Re-Genesees','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Disegno di campionamento','integrazione dati','abbinamento caratteristiche di stratificazione 1 a lista strati','si tratta di un merge by codice stratificazione 1','Input algoritmo di allocazione','output 13 e input 2','cv desiderati per dominio','Merge','dati formattati','Input algoritmo di allocazione','output 14','','','','','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Disegno di campionamento','allocazione','determinole numerosità per strato','Implementazione algoritmo di allocazione sugli strati (es: proporzionale, uniforme, media tra proporzionale e uniforme, ottima, Bethel, multiway, …)','Input algoritmo di allocazione','output 14','cv desiderati per dominio','Algoritmo di allocazione','dati formattati','Output algoritmo di allocazione, lista strati con dimensione campionaria','output 15','Bethel, proporzional, Neyman, ecc','Mauss-R, R2Beat, Multiway, Sampling Strata','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Disegno di campionamento','stratificazione 2','suddivisione in gruppi delle UPS','si suddividono le UPS in strati sulla base della dimensione in termini di unità di popolazione, della allocazione e di parametri di disegno campionario (determinazione AR, NAR)','lista strati con dimensione campionaria','output 12 e output 15','Parametri del disegno a due stadi: interviste per UPS e numero di UPS campione per strato','Stratificazione delle UPS','dati formattati','Lista UPS stratificate secondo stratificazione 2','output 16','','','','','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Selezione','selezione ','Selezione UPS','Selezione delle UPS, con o senza rotazione e/o coordinamento','UPS statificate 2','output 16','Informazioni sulle unità già selezionate da altre indagini','Selezione con probabilità uguali o proporzionali alla dimensione ','dati formattati','Campione UPS selezionato','output 17','Selezione probabilistica con probabilità uguali','FS4, R2BEAT, SAS macro Cube, R-BalancedSampling','','Procedure ad hoc SAS (Proc survey select)  o R','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Selezione','assegnazione','calcolo del numero unità finali campionarie per UPS selezionate','Definizione del numero di unità finali campione per UPS','Campione UPS selezionato','output 17','Parametri del disegno a due stadi: interviste per UPS e numero di UPS campione per strato','Calcolo numero di unità campione finali per UPS ','dati formattati','Campione UPS selezionato con campione SSU','output 18','Applicazione del criterio dell\'autoponderanza','','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Selezione','suddivisione temporale delle interviste','','Stratificazione temporale delle unità finali, assegnazione dei periodi di rilevazione per i UPS','Campione selezionato','output 18','Schema temporale di rilevazione','Metodo di selezione dei periodi','dati formattati','Campione selezionato con attribuzione dei periodi di rilevazione','output 19','Selezione casuale dei periodi di rilevazione della unità','','','Procedure ad hoc SAS o R','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('Possibili modalità: 2.4. Design frame and sample oppure 4.1. Create frame and select sample','Selezione','Calcolo pesi diretti','Calcolo pesi diretti','Calcolo pesi diretti','Campione selezionato','output 19','Probabilità di inclusione ','Calcolo del peso diretto','dati formattati','Campione selezionato con pesi diretti ','output 20','Calcolo del peso campionario sulla base delle probabilità di inclusione','','','Procedure ad hoc SAS (Proc survey select) o R','Disegno di campionamento Indagini_sociali 2 stadi','','',24),('4.1. create frame and select sample','Lettura e preparazione dati indagine','lettura dati','lettura dati grezzi indagine di riferimento','lettura dati grezzi indagine di riferimento.','dati indagine grezzi ','input0','metadati di lettura  (path, psw, tracciato record, ecc.)','lettura dati (read , read.table, ecc.)','microdati indagine formattati','dati indagine in  formato elaborabile per i passi successivi','output 1','metodi non statistici','','','','Controllo e correzione valori ed unità errate','','',41),('4.1. create frame and select sample','Lettura e preparazione dati indagine','lettura dati','lettura dati di fonti ausiliarie','lettura dati ausiliari (archivi, indagini precedenti, ecc.)','dati fonti ausiliarie','input1','metadati di lettura  (path, psw, tracciato record, ecc.)','lettura dati (read , read.table, ecc.)','microdati  ausiliari','dati micro con informazioni ausiliarie in formato elaborabile per i passi successivi','output 2','metodi non statistici','','','','Controllo e correzione valori ed unità errate','','',41),('4.1. create frame and select sample','Lettura e preparazione dati indagine','integrazione dati','abbinamento dati grezzi indagine e dati ausiliari','Qualora siano disponibili fonti ausiliarie con dati micro, questi vengono linkati con i dati di indagine','dati indagine +\ndati micro con informazioni ausiliarie','ouput1 + output2','chiavi di link tra dati indagine e fonti ausiliarie','abbinamento tra fonti di dati','microdati indagine integrati','dati indagine arricchita con informazioni ausiliarie','output 3','metodi di record linkage: merge, relais, etc','','','','Controllo e correzione valori ed unità errate','','',41),('4.1. create frame and select sample','Lettura e preparazione dati indagine','aggiornamento unità rispondenti','aggiornamento del flag di appartenenza alla popolazione di riferimento per le unità rispondenti',' analisi del profilo dei rispondenti per controllo e individuazione delle unità eleggibili tra le rispondenti','dati indagine eventualmente arricchita con informazioni ausiliarie','output 1 o output 3','condizioni di eleggibilità nella popolazione di riferimento','implementazione regoledi eleggibilità','microdati indagine aggiornati','dataset delle unità eleggibili','output 4','regole deterministiche di identificazione','','','Sas, R, SQL','Controllo e correzione valori ed unità errate','','Review, Selection',41),('5.3 Review & Validate','controllo e correzione errori sistematici',' identificazione unità errate','Controllo dei dati per l\'individuazione delle unità affette da errori sistematici','esempi tipici di errori sistematici sono quelli che concernono l\'errata interpretazione dell\'unità di misura da utilizzare, errori di filtro/percorso del questionario elettronico, ecc','dataset delle unità eleggibili','output 4','fonti ausiliarie, \nregole di (in)compatibilità:\n- regole formali\n- regole sostanziali','Analisi delle distribuzioni e dellle relazioni tra variabili ','identificativo variabili per unità','dataset con flag identificativo delle unità e delle variabili su cui si ritiene vi sia un errore sistematico','output 5','analisi grafiche: scatter plot, qq-plot, \nanalisi dei gruppi: cluster analysis, analisi delle classi latenti, \nanalisi delle distribuzioni univariate e multivariate,','','','Sas, R, SQL','Controllo e correzione valori ed unità errate','','Review, Selection',53),('\n5.4 Edit & Impute','controllo e correzione errori sistematici','correzione dati','Correzione degli errori sistematici (inclusi eventuali valori mancanti)','','dataset delle unità eleggibili con identificativo delle unità-variabili affette da errori sistematici','output 5','supporto tematico alla determinazione delle regole di correzione deterministica degli errori sistematici','implementazione della condizione di errore e relativa azione di correzione (if then)','dati indagine corretti','dataset  corretto con flag di imputazione','output 6','regole deterministiche di correzione','','','Sas, R, SQL','Controllo e correzione valori ed unità errate','','Treatment',53),('5.3 Review & Validate','controllo e correzione degli errori influenti e/o anomali','analisi dati','Controllo dei dati per l\'individuazione delle unità affette da errori influenti e/o valori anomali','In questo passo si analizzano i livelli delle stime ','dataset corretto con flag di imputazione per errore sistematico','output 6','livelli attesi delle stime','Individuazione errori anomali e/o influenti','report','report su distribuzione delle variabili e parametri modelli (tipicamente di regressione)','output 7','analisi grafiche: scatter plot, qq-plot, ecc.\nanalisi delle distribuzioni, \nanalisi longitudinali, funzione score, metodo di Hidiroglou-Berthelot, modelli mistura a classi latenti (modelli di contaminazione)','AGAIN (solo per specifiche indagini)','','Sas (Banff), R (SeleMix)','Controllo e correzione valori ed unità errate','','Review',53),('5.3 Review & Validate','controllo e correzione degli errori influenti e/o anomali',' identificazione unità errate','Identificazione delle  unità influenti e/o anomale','In questo passo si identificano le unità che manifestano potenziali errori influenti (di impatto significativo) sulle stime di interesse e i valori anomali. Tali unità non necessariamente risulteranno errate.','dataset  corretto con flag di imputazione per  errore sistematico','output 6','report su distribuzione delle variabili e parametri modelli (tipicamente di regressione)\noutput 7','Individuazione errori anomali e/o influenti','identificativo variabili per unità ','dataset con flag identificativo delle unità influenti e/o anomale','output 8','determinazione valori soglia: metodo di Hidiroglou-Berthelot, metodo dei quartili, modelli mistura a classi latenti (modelli di contaminazione)','AGAIN (solo per specifiche indagini)','','Sas (Banff), R (SeleMix)','Controllo e correzione valori ed unità errate','','Selection',53),('5.4 Edit & Impute','controllo e correzione degli errori influenti e/o anomali','correzione dati','Correzione delle unità influenti e/o anomale','ricontatto delle unità critiche, confronto con fonti ausiliarie e/o dati storici','dataset  corretto con flag di imputazione per errore sistematico e flag identificativo delle potenziali unità influenti e dei valori anomali','output 8','conoscenza del fenomeno, fonti ausiliarie, supporto da parte degli esperti del fenomeno per la correzione degli errori influenti (idealmente le unità critiche  vengono inviate ai tematici per la loro correzione)','correzione interattiva errori influenti; correzione valori anomali errati','dati indagine corretti','dataset corretto da errori sistematici e influenti e/o anomali con relativi flag di correzione ','output 9','correzione interattiva, ricontatto delle unità critiche, correzione automatica valori influenti/anomali errati (regressione, donatore, etc.)','AGAIN (solo per specifiche indagini); applicazione sviluppata per il Censimento della popolazione nel 2018 (Cuccia, Bianchi)','','Sas, R, SQL','Controllo e correzione valori ed unità errate','','Treatment',54),('5.3 Review & Validate','controllo e correzione errori casuali','identificazione unità errate','Controllo dei dati per l\'individuazione delle unità affette da errori casuali non influenti','individuazione di unità che violano almento una regola di (in)compatibilità','dataset corretto da eventuali errori sistematici e da  errori influenti e/o anomali','output 9','regole di (in)compatibilità:\n- regole formali\n- regole sostanziali','implementazione delle regole di (in)compatibilità','identificativo variabili per unità ','dataset con flag identificativo delle unità-variabili potenzialmente errate;\nReport con misure di qualità','output 10 + report','regole di (in)compatibilità','Concord-SCIA','','Sas (Banff), R, SQL','Controllo e correzione valori ed unità errate','','Review',53),('5.3 Review & Validate','controllo e correzione errori casuali','identificazione variabili errate','Localizzazione errori','individuazione del minimo numero di variabili da trattare tra le unità errate (principio del minimo cambiamento)','dataset con flag in variabili potenzialmente errate','output 10','regole di (in)compatibilità:\n- regole formali\n- regole sostanziali\ncoefficienti di affidabilità delle variabili','set-covering problem (risoluzione di problemi di minima copertura)','identificativo variabili per unità','dataset con flag sulle variabili errate','output 11','metodo di Fellegi-Holt, algoritmo di Chernikova','Concord-SCIA','','Sas (Banff), R, SQL','Controllo e correzione valori ed unità errate','','Selection',54),('5.4 Edit & Impute','controllo e correzione errori casuali','correzione dati','Correzione degli errori casuali non influenti (inclusi eventuali valori mancanti)','l\'output 10 viene suddiviso in due parti sulla base del flag che indica quali siano i record affetti da errore e i record esatti','dataset con flag sulle variabili errate; dataset degli errati; dataset degli esatti','output 11','','imputazione','dati indagine corretti','dataset corretto con flag di correzione ','output 12','\nhot-deck, NIM (nearest neghbour imputation method), regressione, etc.','Concord-SCIA','','Sas (Banff), R, SQL','Controllo e correzione valori ed unità errate','','Treatment',54),('5.4 Edit & Impute','imputazione massiva','correzione dati','imputazione di record con un numero elevato di mancate risposte',' in questo passo sono trattati ad esempio i record in cui le uniche informazioni disponibili sono quelle derivanti da fonte amministrativa. Si tratta quindi di record particolari che solitamente sono trattati a parte, a valle del processo di controllo e correzione.','dataset corretto da errori sistematici, influenti e/o anomali e casuali, comprendendo i record un numero elevato di mancate risposte','output 12','fonti ausiliarie e dati storici','imputazione','dati indagine corretti','dataset corretto con flag di imputazione','output 13','\nhot-deck, NIM (nearest neghbour imputation method), regressione, etc.','','','Sas, R, SQL','Controllo e correzione valori ed unità errate','','Treatment',53),('5.3 Review & Validate','Post editing','macro-editing','Controllo delle stime finali e identificazione degli aggregati sospetti','Analisi delle distribuzioni ottenute sui dati di indagine corretti e confronto con le distribuzioni ottenute da fonti ausuliarie o dati storici, al fine di individuare eventuali aggregati sospetti','dataset corretto','output 13',' tabelle delle stime da analizzare; fonti ausiliarie','analisi longitudinali, confronto con altre fonti; ','report','indicatori di qualità','output 14','intervalli di confidenza,\nanalisi grafiche, \nanalisi delle distribuzioni','','','Sas, R, SQL','Validazione microdati corretti','','Review',53),('5.3 Review & Validate','Post editing','identificazione unità errate','Identificazione delle unità errate che hanno generato gli aggregati sospetti','In questo passo si analizza l\'impatto delle correzioni, dei pesi, della variabilità campionariasu livello delle stime. Si ricercano inoltre ulteriori errori sistematici','dataset corretto','output 13','indicatori di qualità (output 14)','analisi di impatto e di influenza','identificativo variabili per unità','dataset corretto con flag sulle unità che hanno generato gli aggregati sospetti','output 15','intervalli di confidenza, ad hoc','','','Sas, R, SQL','Validazione microdati corretti','','Selection',53),('5.3 Review & Validate','Post editing','micro-editing: identificazione unità errate','Controllo microdati','ri-verifica, sul dataset corretto, di tutte le regole di (in)compatibilità al fine di identificare eventuali record errati (sfuggiti ai controlli precedenti o generati dai vari trattamenti effettuati nei passi precedenti)','dataset corretto','output 13','regole di (in)compatibilità:\n- regole formali\n- regole sostanziali','implementazione delle regole di (in)compatibilità esplicitate nei passi precedenti (if then)','identificativo variabili per unità','dataset con flag identificativo delle unità-variabili potenzialmente errate;\nReport con misure di qualità','output 16','regole di (in)compatibilità','','','Sas, R, SQL','Validazione microdati corretti','','Review',53),('5.7 “Calculate aggregates”','Preparazione dati input','lettura dati','lettura dati di indagine in cui sono già presenti i pesi campionari definitivi','','Dati indagine','input 0','Metadati di lettura(path, tracciato record ecc)','lettura dati indagine (es. read, read.table ecc)','microdati indagine formatttati','Dati indagine in formato elaborabile per i passi successivi','Output1','','','','procedure ad hoc','Stima piccole aree','','dati Forze Lavoro',57),('5.7 “Calculate aggregates”','Preparazione dati input','identificazione ','si assegnano a ciascuna unità i flag di appartenza ai diversi domini di interesse','','Dati indagine formattati ','output 1','Metadati relativi all\'individuazione del dominio','implementazione regole deterministiche: if - then','microdati indagine formatttati con flag di dominio','dati indagine formattati+flag dominio','Output2','','','','procedure ad hoc','Stima piccole aree','','codici territoriali FUA e City',57),('5.7 “Calculate aggregates”','Preparazione dati input','identificazione ','si assegnano a ciascuna unità i flag di appartenenza a una macroarea (opzionale)','','Dati indagine formattati+flag dominio','output 2','Metadati relativi all\'individuazione della macroarea','implementazione regole deterministiche: if - then','microdati indagine formatttati con flag di dominio e macro area','dati indagine formattati+flag dominio+ macroarea','Output3','','','','procedure ad hoc','Stima piccole aree','','',57),('5.7 “Calculate aggregates”','Preparazione dati input','aggregazione','calcolo dei totali delle potenziali variabili esplicative del modello','','Dati indagine formattati+flag dominio+macroarea','output3','Indicazione variabili esplicative e del peso finale','Aggregazione pesata ','dataset totali','Dataset di totali noti (una riga per dominio e tante colonne quante sono le variabili esplicative)','Output4','','','','procedure ad hoc','Stima piccole aree','','',57),('5.7 “Calculate aggregates”','Preparazione dati input','lettura dati','lettura dati da registro con potenziali variabili esplicative e flag di dominio','','input da registro o archivio ','input 1','Metadati di lettura(path, tracciato record ecc)','lettura dati archivio (es.read, read.table, ecc)','microdati archivio formattati','dati da archivio formattati','Output4','','','','','Stima piccole aree','','',57),('5.7 “Calculate aggregates”','Preparazione dati input','aggregazione','si calcolano i totali delle variabili  esplicative per dominio ','','Dati da registro','input_registro','Indicazione del flag di dominio coerente con l\'output2 e varibili esplicative','Aggregazione delle variabili esplicative per il dominio','dataset totali','Dataset di totali noti (una riga per dominio e tante colonne quante sono le variabili esplicative)','Output4','','','','procedure ad hoc','Stima piccole aree','','Totali provenienti da RBI e RTL',57),('5.7 “Calculate aggregates”','Preparazione dati input','lettura dati','si acquisiscono file di totali noti (una riga per dominio e una colonna per ciascuna variabilie esplicativa) preparati esternamente','','File con totali noti','input_noti','Metadati di lettura (path, tracciato record ecc)','lettura file totali noti predisposti esternamente','dataset totali','Dataset di totali noti (una riga per dominio e tante colonne quante sono le variabili esplicative)','Output4','','','','procedure ad hoc','Stima piccole aree','','Totali provenienti da RBI e RTL',57),('5.7 “Calculate aggregates”','Analisi preliminari','Analisi dati','produzione stime dirette e relativi cv, per tutti i domini di una data tipologia (ad esempio stima per ciascun comune) ','','Dati indagine formattati+flag dominio+macroarea','Output3','Indicazione variabili di interesse e del peso','Aggregazione pesata delle variabili di interesse per il dominio con il calcolo dei relativi coefficenti di varaizione','report','Dataset di stime dirette (calibrate) e cv per dominio (una riga per dominio e due colonne per ciasciuna variabile dipende: stima e cv)','Outpu5','Stimatori calibrati','Regenesses','','','Stima piccole aree','','',57),('5.7 “Calculate aggregates”','Analisi preliminari','Analisi dati','Valutazione qualità stime dirette','','Dataset di stime dirette (calibrate) e cv per dominio (una riga per dominio e due colonne per ciasciuna variabile dipende: stima e cv)','Output5','Indicazione da parte dei committenti in merito alla qualità minima accettabile dell\'accuratezza delle stime espresse in termini di CV per ciascun dominio (spesso provenienti da regolamenti Europei e linee guida internazionali)','Confronto tra cv indicati dai committenti con cv contenuti in Output5','report','Tabelle che indicano quanti e quali domini non soddisfano i criteri di accettabilità indicati dai committenti','Output6','','Regenesses','','','Stima piccole aree','','',57),('5.7 “Calculate aggregates”','Analisi preliminari','Analisi dati','Studio della distribuzione dei domini tra le macroaree','','Dati indagine formattati+flag dominio+macroarea','Output3','Indicazione sul numero minimo di domini per ciascuna macroarea al fine di stimare con accuratezza i parametri del modello','Distribuzione per macroarea dei domini (ad esempio comuni per macroarea proviciale)','report','Tabelle che indicano quante e quali macroaree permettono di stimare con accuratezza i parametri del modello. ','Output7','','','','procedure ad hoc','Stima piccole aree','','',57),('5.7 “Calculate aggregates”','Analisi preliminari','aggregazione','ridefinizione delle macroaree nel caso l\'attuale definizione non permetta di stimare i parametri del modello (opzionale)','','Dati indagine formattati+flag dominio+macroarea+indicazioni sulla accuratezza di stima dei parametri del modello per macroarea ','Output3 e Output7','indicazione sulle possibili macroaree che possono essere aggregate nel caso l\'analisi svolta indichi che qualche macroarea non permette di stimare i parametri del modello (opzionale)','Distribuzione per macroarea (ridefinita) dei domini','dataset totali','Tabelle che indicano quante e quali macroaree permettono di stimare con accuratezza i parametri del modello. ','Output7b','','','','procedure ad hoc','Stima piccole aree','','',57),('5.7 “Calculate aggregates”','Parametrizzazione del modello','Analisi dati','scelte variabili esplicative per la componente ad effetti fissi del modello (scelta tra quelle di cui si dispone dei totali noti)','','Dati indagine formattati+flag dominio+macroarea','Output3','Metadati relativi all\'individuazione delle variabili esplicative','Regressioni per l\'individuazione del modello con il miglior fitting','report con lista variabili','Tabelle di riassunto dei principali indicatori di model fitting (es AIC, BIC, loglk ecc)','Output8','stepwise regression','','','ad esempio utilizzando libreria R \"MASS\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"','Stima piccole aree','','- Informazioni in ambito occupazionale a livello di individuo in ambito sociale;\n- titolo di studio e la frequenza a corsi di istruzione;\n- le tipologie di pensione (vecchiaia, assistenziale e di invalidità);\n- trattamenti monetari non pensionistici',57),('5.7 “Calculate aggregates”','Parametrizzazione del modello','Analisi dati','scelte variabili esplicative per la componente ad effetti casuali del modello (scelta tra quelle di cui si dispone dei totali noti)','','Dati indagine formattati+flag dominio+macroarea','Output3','Metadati relativi all\'individuazione degli effetti causali','Individuazione della variabile da considerare come effetti casuali','report con lista variabili','Dati indagine formattati+flag dominio+macroarea+effetti casuali','Output3b','','','','Pacchetto R mind','Stima piccole aree','','FUA e city',57),('5.7 “Calculate aggregates”','Parametrizzazione del modello','Analisi dati','scelta macroarea (ad esempio modello per regione)','','Dati indagine formattati+flag dominio+macroarea+effetti casuali','Output3b','','Regressioni per l\'individuazione del modello con il miglior fitting','report','Tabelle di riassunto dei principali indicatori di model fitting (es AIC, BIC, loglk ecc)','Output9','','','','Pacchetto R mind','Stima piccole aree','','',57),('5.7 “Calculate aggregates”','Parametrizzazione del modello','Analisi dati','scelta metodo di stima parametri modello di regressione (OLS vs WLS)','','Dati indagine formattati+flag dominio+macroarea+effetti casuali','Output3b','Indicazione del peso (opzionale)','Individuazione della variabile peso campionario','report','Dati indagine formattati+flag dominio+macroarea+effetti casuali+peso','Output3c','','','','Pacchetto R mind','Stima piccole aree','','',57),('5.7 “Calculate aggregates”','calcolo stime','Calcolo Stime','Calcolo Stime, indicatori di qualità delle stime e del modello','','Dati indagine formattati+flag dominio+macroarea+effetti casuali+peso\ne\nDataset di totali noti \n','Output3c+output4','\nparametri su cui sono possibili scelte alternative da parte del committente o della persona incaricata del calcolo','lancio della funzione R mind.unit ','lista con contenuti procedura di stima','Lista contenente output della funzione mind.unit','Output10','EBLUP, Projection e stimatore sintetico, OLS, WLS','','','Pacchetto R mind','Stima piccole aree','','',57),('5.7 “Calculate aggregates”','Analisi dell\'output','valutazione modello','valutazione della qualità delle stime e del modello, ovvero valutazione  di MSE,CV, ICC, random effects, beta, standard deviation residui, standard deviatione ffetti casuali, ecc','','ouput passo di stima','','indicazioni sulla qualità accettabile','','report','','','REML, Intraclass Correlation Coefficent,R2, Adj R2,…','','','Pacchetto R mind','Stima piccole aree','','',57),('5.7 “Calculate aggregates”','Analisi dell\'output','analisi distribuzioni','Analisi delle distribuzioni delle stime e dei CV\n','','Lista contenente output della funzione mind.unit e Dataset di stime dirette (calibrate) e cv per dominio','Output10 e Output5','Indicazione da parte dei committenti in merito alla qualità minima accettabile dell\'accuratezza delle stime espresse in termini di CV per ciascun dominio (spesso provenienti da regolamenti Europei e linee guida internazionali)','Confronto tra stime dirette ed indirette','report','Tabelle che indicano quanti e quali domini non soddisfano i criteri di accettabilità indicati dai committenti','Output11','boxplot, istogrammi, quartili, plot, tabelle differenze, ecc.','','','Pacchetto R mind','Stima piccole aree','','',57),('5.7 “Calculate aggregates”','Analisi dell\'output','analisi distribuzioni','diagnostica stime da modello','','Output10 e Output5','','','lancio funzione diagnostic.R','report','Lista contenente output della funzione diagnostic.R','Output14','Bias diagnostic, coverage diagnostic, goodness of fit diagnostic, calibration diagnostic','','','Funzione diagnostic.R','Stima piccole aree','','',57),('5.7 “Calculate aggregates”','Analisi dell\'output','analisi spaziale','Analisi spaziale delle stime serve ad identificare eventuali pattern spaziali delle stime tipicamente attraverso la mappatura delle stime e degli errori per individuazioni di eventuali patter spaziali','','Lista contenente output della funzione mind.unit e Dataset di stime dirette (calibrate) e cv per dominio e shapefile di dominio','Output10 +  Output5+shapefile','conoscenza del fenomeno e del territorio di supporto alla ricerca dei pattern','spatial analysis ','report','Mappe per stime e cv','Output13','','','','','Stima piccole aree','','',57),('5.1 Integrate data','Acquisizione delle fonti da integrare','lettura dati','lettura prima fonte ','I dati del dataset relativo alla prima fonte vengono caricati assieme ai nomi delle variabili presenti','primo archivio o fonte  da integrare','input1','metadati di lettura (path, tracciato record, psw, ecc)','lettura dati (read, read.table, ecc)','dataset in memoria','i dati dalla fonte 1 sono desponibili per il processo di elaborazione','output 1','','','','','Integrazione dati','','',51),('5.1 Integrate data','Acquisizione delle fonti da integrare','lettura dati','lettura seconda fonte','I dati del dataset relativo alla seconda fonte vengono caricati assieme ai nomi delle variabili presenti','Secondo archivio o fonte  da integrare','input2','metadati di lettura (path, tracciato record, psw, ecc)','lettura dati (read, read.table, ecc)','dataset in memoria','i dati dalla fonte 2 sono desponibili per il processo di elaborazione','output 2','','','','','Integrazione dati','','',51),('5.1 Integrate data','Analisi qualitativa delle variabili','Completezza','Calcolare l\'indice di completezza di una variabile','Quest\'indicatore, relativo ad una variabile di un dataset, rappresenta la frequenza con cui la variabile assuma un valore non missing nel dataset. Le variabili migliori sono quelle per cui il valore dell\'indicatore è alto (vicino a 1)  ','Dataset caricati, elenco delle variabili','output 1 + output 2','','Calcolo indice sintetico','Tabella con il valore dell\'indicatore per ogni variabile esaminata','Per ogni variabile esaminata l\'indicatore assume un valore numerico decimale compreso tra 0 e 1, è possibile dunque creare una gerarchia tra le variabili','outputA1','Frazione di righe/unità senza missing value','','','','Integrazione dati','',' Le variabili migliori sono quelle per cui il valore dell\'indicatore è alto (vicino a 1)  ',51),('5.1 Integrate data','Analisi qualitativa delle variabili','Accuratezza','Calcolare l\'indice di accuratezza di una variabile rispetto ad un dominio di valori','Quest\'indicatore, relativo ad una variabile di un dataset, rappresenta la frequenza con cui la variabile assuma un valore ammissibile nel dataset. Le variabili migliori sono quelle per cui il valore dell\'indicatore è alto (vicino a 1)  ','Dataset caricati, elenco delle variabili','output 1 + output 2','Elenco valori ammissibili per la variabile','Calcolo indice sintetico','Tabella con il valore dell\'indicatore per ogni variabile esaminata','Per ogni variabile esaminata l\'indicatore assume un valore numerico decimale compreso tra 0 e 1, è possibile dunque creare una gerarchia tra le variabili','outputA1','Dato un elenco di valori corretti per la variabile, il valore dell\'indicatore é Frazione di righe/unità con un valore corretto','','','','Integrazione dati','',' Le variabili migliori sono quelle per cui il valore dell\'indicatore è alto (vicino a 1)  ',51),('5.1 Integrate data','Analisi qualitativa delle variabili','Consistenza','Calcolare l\'indice di accuratezza di una variabile rispetto al valore si un\'altra variabile','Quest\'indicatore, relativo ad una variabile di un dataset, rappresenta la frequenza con cui la variabile nel dataset assuma un valore coerente con il valore di un\'altra variabile correlata. Le variabili migliori sono quelle per cui il valore dell\'indicatore è alto (vicino a 1)  ','Dataset caricati, elenco delle variabili','output 1 + output 2','Nome variabili correlate, Elenco valori ammissibili per la variabile in relazione ai valori della variabile correlata','Calcolo indice sintetico','Tabella con il valore dell\'indicatore per ogni variabile esaminata','Per ogni variabile esaminata l\'indicatore assume un valore numerico decimale compreso tra 0 e 1, è possibile dunque creare una gerarchia tra le variabili','outputA1','Questo indicatore valuta se i valori di due variabile di una stessa riga/entità sono coerenti tra loro attraverso un elenco vi valori abbinati correttamente. Il valore é dell\'indicatore è la Frazione di righe/unità che hanno valori coerenti sulle due variabili','','','','Integrazione dati','',' Le variabili migliori sono quelle per cui il valore dell\'indicatore è alto (vicino a 1)  ',51),('5.1 Integrate data','Analisi qualitativa delle variabili','Entropia','Calcolare la distribuzione dei valori della variabile nel dataset','Quest\'indicatore, relativo ad una variabile di un dataset, rappresenta la distribuzione di frequenza delle singole modalità che assume la variabile. Le variabili migliori sono quelle per cui il valore dell\'indicatore è alto (vicino a 1)  ','Dataset caricati, elenco delle variabili','output 1 + output 2','','Calcolo indice sintetico','Tabella con il valore dell\'indicatore per ogni variabile esaminata','Per ogni variabile esaminata l\'indicatore assume un valore numerico decimale compreso tra 0 e 1, è possibile dunque creare una gerarchia tra le variabili','outputA1','Indice di Gini calcolato sulle frequenze delle modalità','','','','Integrazione dati','',' Le variabili migliori sono quelle per cui il valore dell\'indicatore è alto (vicino a 1)  ',51),('5.1 Integrate data','Analisi qualitativa delle variabili','Correlazione tra variabili','Calcolare l\'indice di correlazione tra due variabile di un dataset','Quest\'indicatore, relativo ad due variabile di un dataset, rappresenta la frequenza con cui il valore di una delle due variabili dipende dal valore della seconda. Se il valore dell\'indicatore è alto (vicino a 1) è preferire non usare entrambe le variabili nel processo di integrazione','Dataset caricati, elenco delle coppie di variabili','output 1 + output 2','','Calcolo indice sintetico','Tabella con il valore dell\'indicatore per ogni coppia di variabili esaminata','Per ogni variabile esaminata l\'indicatore assume un valore numerico decimale compreso tra 0 e 1, è possibile dunque creare una gerarchia tra le variabili','outputA1','Indice di correlazione','','','','Integrazione dati','',' Le variabili migliori sono quelle per cui il valore di correlazione con le altre variabili è basso (vicino a 0)  ',51),('5.1 Integrate data','Analisi qualitativa delle variabili','Categorie','Calcolare il numero di modalità che assume la variabile di un dataset','Calcolare il numero di modalità che assume la variabile di un dataset','Dataset caricati, elenco delle variabili','output 1 + output 2','','Calcolo indice sintetico','Tabella con il valore dell\'indicatore per ogni variabile esaminata','Per ogni variabile esaminata l\'indicatore assume un valore intero','outputA1','V di Cramer','','','','Integrazione dati','','',51),('5.1 Integrate data','Analisi qualitativa delle variabili','Adeguatezza al bloccaggio','Calcolare per una variabile un indice di adeguatezza ad essere usata com variabile di bloccaggio','Quest\'indicatore, relativo ad una variabile comune dei due dataset, valuta tutte le modalità che assume la variabile e la dimensione del blocco che ne risulterebbe se venisse usata come variabile di bloccaggio. Il valore dell\'indicatore é la frequenza delle modalità che generano blocchi di dimensione nel range previsto. Le variabili più adeguate sono quelle per cui il valore dell\'indicatore è alto (vicino a 1)  ','Dataset caricati, elenco delle variabili','output 1 + output 2','Range sulla dimensione del singolo blocco','Calcolo indice sintetico','Tabella con il valore dell\'indicatore per ogni variabile esaminata','Per ogni variabile esaminata l\'indicatore assume un valore numerico decimale compreso tra 0 e 1, è possibile dunque creare una gerarchia tra le variabili','outputA1','Simula la riduzione dello spazio di ricerca per bloccaggio calcolando il numero di blocchi e il numero di coppie in ogni blocco. Il valore dell\'indicatore è la Frazione di blocchi con un numero di coppie nel range definito','','','','Integrazione dati','',' Le variabili migliori sono quelle per cui il valore dell\'indicatore è alto (vicino a 1)  ',51),('5.1 Integrate data','preparazione dati','Lista dei valori inaccurati','Elenco delle modalità di una variabile non conformi al formato atteso','Se alcune variabili comuni possono essere considerate utili per il processo di integrazione ma sono rappresentate nelle due fonti con strutture differenti si applicano delle tecniche di trasformazione per renderle meglio confrontabili con gli algoritmi di confronto standard','Dataset da integrare','output 1 + output 2','formato previsto per i valori della variabile','Tutti i valori della variabile non conformi al formato previsto sono inseriti in una lista di valori inaccurati','file con la lista dei valori inaccurati','lista dei valori inaccurati','outputA2','','','','','Integrazione dati','','',51),('5.1 Integrate data','preparazione dati','Standardizzazione','Aggiunta di nuove variabili ai dataset attraverso trasformazioni delle variabili esistenti','','','','tipo di standardizzazione','La nuova variabile si ottiene applicando alla vecchia alcune semplici operazioni di standardizzazione come il cambio dal case o la cancellazione di alcuni caratteri speciali','dataset modificati','Dataset da integrare','output 1 + output 2','','','','','Integrazione dati','','',51),('5.1 Integrate data','preparazione dati','Fusione','','','','','eventuale carattere di separazione','La nuova variabile si ottiene concatenando i valori di due o più variabili','dataset modificati','Dataset da integrare','output 1 + output 2','','','','RLfunc','Integrazione dati','','',51),('5.1 Integrate data','preparazione dati','Separazione','','','','','carattere separatore','Due nuove variabili si ottengono spezzando il valore di una variabile','dataset modificati','Dataset da integrare','output 1 + output 2','','','','RLfunc','Integrazione dati','','',51),('5.1 Integrate data','preparazione dati','Risoluzione degli errori','','','','','lista di valori errati con correzione','La nuova variabile si ottiene sostituendo i valori definiti errati nella lista di sipporto col corrispondente valore corretto','dataset modificati','Dataset da integrare','output 1 + output 2','','','','','Integrazione dati','','',51),('5.1 Integrate data','preparazione dati','Riconciliazione degli schemi','Individuazione delle variabili comuni nei due dataset','','','','','Due variabili dei due dataset possono essere indicante come associate anche se hanno un  nome diverso','','','','','','','RLfunc','Integrazione dati','','',51),('5.1 Integrate data','Creazione dello spazio di ricerca','Prodotto cartesiano','Si selezionano le coppie di record su cui sarà eseguito il modello decisionale','Si tratta di un passo fondamentale nel processo di integrazione e deve conciliare la richiesta di alta qualità del risultato con la necessità  di rendere trattabile il problema dal puntoi di vista computazionale. In questo passo si decidono con una tecnica efficiente le sole coppie di record (dei due dataset) che saranno oggetto del processo nei passi successivi. Solo le coppie presenti nello spazio di ricerca potranno essere dichiarate match ovvero risultare abbinati alla fine del processo di integrazione.','Dataset da integrare','output 1 + output 2','','Lo spazio di ricerca è composto da tutte le possibili coppie','Spazio di ricerca',' ','output3','Cross Product','','','fastLink; Rlfunc','Integrazione dati','','',51),('5.1 Integrate data','Creazione dello spazio di ricerca','Bloccaggio','','','','','Variabili di bloccaggio','Lo spazio di ricerca è composto da tutte le coppie che hanno lo stesso valore sulle variabili di bloccaggio. Ogni modalità crea un blocco distinto','','','','Blocking','','','RLfunc','Integrazione dati','','',51),('5.1 Integrate data','Creazione dello spazio di ricerca','Unione di bloccaggi','','','','','Variabili di bloccaggio','Lo spazio di ricerca è composto da tutte le coppie che hanno lo stesso valore sulle variabili di bloccaggio. Viene creato un unico insieme','','','','Blocking','','','RLfunc','Integrazione dati','','',51),('5.1 Integrate data','Creazione dello spazio di ricerca','Vicini ordinati','','','','','Variabili di ordinamento e dimensione della finestra','Lo spazio di ricerca è composto da tutte le coppie che sono sufficientemente vicine (all\'interno di una stessa finestra) nell\'ordinameno','','','','Sorted Neighborhood','','','RLfunc','Integrazione dati','','',51),('5.1 Integrate data','Creazione dello spazio di ricerca','Bloccaggio innestato','','','','','Variabili di bloccaggio, variabili di ordinamento e dimensione della finestra','Si considerano solo le coppie che hanno lo stesso valore sulle variabili di bloccaggio. All\'interno di ogni blocco si scelgono solo le coppie che sono sufficientemente vicine (all\'interno di una stessa finestra) nell\'ordinameno sulle variabili di ordinamento e queste compongono lo spazio di ricerca','','','','Blocking + Sorted Neighborhood','','','','Integrazione dati','','',51),('5.1 Integrate data','Creazione dello spazio di ricerca','SimHash','','','','','Variabili di hashing, dimensione del q-gramma, numero di rotazioni, soglia sulla distanza degli hash','Per ogni record viene creata un\'impronta hash di lunghezza fissa che poi viene usata per ordinare i dataset. Per i record vicini vengono confrontate le impronte se la distanza di Hamming è inferiore alla soglia la coppia entra nello spazio di ricerca. L\'operazione si può replicare più volte permutando i bit dell\'impronta','','','','SimHash','','','','Integrazione dati','','',51),('5.1 Integrate data','Creazione dello spazio di ricerca','SimHash bloccato','','','','','Variabili di bloccaggio, variabili di hashing, dimensione del q-gramma, numero di rotazioni, soglia sulla distanza degli hash','Si considerano solo le coppie che hanno lo stesso valore sulle variabili di bloccaggio. All\'interno di ogni blocco si applica poi il metodo SimHash per scegliere le coppie che compongono lo spazio di ricerca','','','','Blocking + SimHash','','','','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Uguaglianza','Scelta delle variabili di matching scelta delle metriche di confronto e delle soglie','In base alle indicazioni del committente o, in mancanza di queste, in base agli indicatori di qualità calcolati sulle variabili comuni (output3) si seleziona un set di variabili definito variabili di matching. Questo set è un sottoinsieme delle variabili comuni che devono assicurare un buon livello di completezza e di potere identificativo delle entità oggetto di integrazione. Per ogni variabile si decide un algoritmo di confronto. Il confronto può essere esatto (usuaglianza) o approssimato (similitudine). In caso si scelga un algoritmo approssimato va anche definita una soglia oltre la quale i due valori sono considerati concordanti e sotto la quale sono considerati discordanti.','Spazio di ricerca, Variabili di matching, funzioni di confronto e soglie','output3','','Confronto i record di ogni coppia su tutte le vatriabili di matching e associo la coppia ad un profilo che è un vettore di 0 e 1. Se nel posto i del vettore c\'è uno 0 vuol dire che la coppia è discordante sulla variabile i, se c\'è un 1 vuol dire che è concordante.','Tabella di contingenza','Le tabella di contingenza contiene tutti i possibili profili, ovvero tutte le possibili combinazioni di 0 e 1 (discordanze e concordanze) sulle variabili di matching. Per ogni profilo è indicato il numero di coppie dello spazio di ricerca che hanno quel profilo','output4','Uguaglianza','','','fastLink; Rlfunc','Integrazione dati','','Se diversi profili (righe) della tabella di contingenza hanno una frequenza 0 o comunque molto bassa rispetto alle dimensioni dei dataset vuol dire che c\'è qualche variabile con basso potere identificativo o correlata con le altre variabili, in questo caso sarà necessario rieseguire il passo cambiando le variabili di matching o modificando le funzioni e le soglie scelte.',51),('5.1 Integrate data','Confronto','Somiglianza di Levensthein','','','','','','','','','','Somiglianza di Levensthein','','','fastLink; Rlfunc','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Somiglianza di Jaro','','','','','','','','','','Somiglianza di Jaro','','','fastLink','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Somiglianza di Jaro-Winkler','','','','','','','','','','Somiglianza di Jaro-Winkler','','','fastLink; Rlfunc','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Somiglianza Soundex','','','','','','','','','','Somiglianza Soundex','','','RLfunc','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Somiglianza Q-Grams','','','','','','','','','','Somiglianza Q-Grams','','','RLfunc','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Somiglianza inclusion 3-Grams','','','','','','','','','','Somiglianza Q-Grams con target la stringa più piccola','','','','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Somiglianza 3-Grams pesata','','','','','','','','','','Somiglianza Q-Grams con i pesi TF*IDF','','','','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Somiglianza SimHash','','','','','','','','','','SimHash','','','','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Somiglianza numerica','','','','','','','','','','Somiglianza numerica','','','','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Somiglianza uguaglianza con tolleranza','','','','','','','','','','Uguaglianza numerica con tolleranza','','','','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Somiglianza di Dice','','','','','','','','','','Somiglianza di Dice','','','RLfunc','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Somiglianza Full Damerau-Levenshtein','','','','','','','','','','Somiglianza Full Damerau-Levenshtein','','','RLfunc','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Somiglianza Hamming','','','','','','','','','','Somiglianza Hamming','','','RLfunc','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Somiglianza per maggior sottostringa comune','','','','','','','','','','Somiglianza per maggior sottostringa comune','','','RLfunc','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Distanza coseno tra profili Q-Grams','','','','','','','','','','Q-Grams con Distanza coseno','','','RLfunc','Integrazione dati','','',51),('5.1 Integrate data','Confronto','Distanza di Jaccard tra profili Q-Grams','','','','','','','','','','Q-Grams con Distanza di Jaccard','','','RLfunc','Integrazione dati','','',51),('5.1 Integrate data','Modello decisionale','Deterministico esatto','Il modello individua i profili delle coppie da considerare match','Nel modello deterministico esatto i match sono solo le coppie che hanno concordanza su tutte le variabili di matching','tabella di contingenza','output4','','Il profilo dei match è solo quello con tutte le concordanze (vettore di tutti 1)','Tabella MU',' Tabella con tutti i profili divisi in match/unmatch','output5','Merge','','','RLfunc','Integrazione dati','','Se le probabilità marginali risultano incoerenti ( le concordanze sono più frequenti in U o le discordanze sono più frequenti in M) è necessario cambiare i parametri del modello perché il fenomeno descritto non è quello desiderato. In questo caso sarà necessario rieseguire i passi di confronto e modello decisionale cambiando le variabili di matching o modificando le funzioni e le soglie scelte per il confronto.',51),('5.1 Integrate data','Modello decisionale','Deterministico basato su regola','In base alla regola scelta il modello individua i profili delle coppie da considerare match','I match sono tutte le coppie che in base alla concordanza/discordanza sulle variabili di matching verificano la regola','','','Regola definita su concordanza e discordanza sulle variabili di matching','I profili dei match sono quelli che verificano la regola','Tabella MU',' Tabella con tutti i profili divisi in match/unmatch','output5','Verifica deterministica dei profili','','','RLfunc','Integrazione dati','','',51),('5.1 Integrate data','Modello decisionale','Probabilistico di Fellegi-Sunter','Il modello probabilistico assegna ad ogni coppie una probabilità a posteriori di essere un match','Per i modelli deterministici bisogna individuare i profili delle coppie da considerare match e questo deve essere fatto sulla base delle distribuzioni di frequenza della tabella di contingenza e in base alle indicazioni del commitente. Per i modelli probabilistici sarà il modello stesso autonomamente a classificare i profili assegnando ad ognuno una probabilità a posteriori','','','','Prima si stimano le probabilita marginali delle singole variabili di matching in caso di concordanza (m1 e u1) e in caso di discordanza (m0 e u0). Ad ogni profilo viene associata una probabilita m e u queste si calcolano come il prodotto delle probabilita marginali m1 e u1 delle singole variabili che valgono 1 sul profilo e mo e u0 per le variabili che valgono 0 sul profilo','Tabella delle probabilita marginali delle variabili di matching e MU table ','Tabella riportante le probabilità marginali stimate dal modello per ogni variabile di matching in caso di concordanza (m1, u1) e discordanza (m0,u0). Tabella con la probabilità a posteriori per ogni profilo calcolata dalle probabilità marginali ','output5 + output6','Algoritmo EM per la stima delle marginali, formula della probabilità condizionata per calcola la probabilità a posteriori','','','fastLink; Rlfunc','Integrazione dati','','',51),('5.1 Integrate data','Modello decisionale','Probabilistico da Marginali','In base alle probabilità marginali inserite il modello probabilistico assegna ad ogni coppie una probabilità a posteriori di essere un match','Sfruttando le probabilità marginali di ogni singola variabile di matching e utilizzando l\'ipotesi di indipendenza condizionata di queste viene calcolata la probabilità a posteriori che dipende solo dal priofilo','','','Probabilita marginali m1, u1 e m0, u0  per tutte variabili di matching','Ad ogni profilo viene associata una probabilita m e u queste si calcolano come il prodotto delle probabilita marginali m1 e u1 delle singole variabili che valgono 1 sul profilo e mo e u0 per le variabili che valgono 0 sul profilo','MU table','Tabella con la probabilità a posteriori per ogni profilo calcolata dalle probabilità marginali ','output5','Algoritmo EM per la stima delle marginali, formula della probabilità condizionata per calcola la probabilità a posteriori','','','fastLink','Integrazione dati','','',51),('5.1 Integrate data','Abbinamento dei record','Abbinamento dei record','Scelta delle soglie (per i modelli probabilistici) e inferenza dello stato di abbinamento sui record dei dataset','Se il modello è probabilistico si scelgono due soglie: soglia di match e soglia di unmatch. Tutti i profili con una probabilita a posteriori maggiore della soglia di match sono classificati come match (abbinamenti), i profili con una probabilità inferiore alla soglia di unmatch sono classificati come unmatch (non abbinamenti), i profili con una probabilità compresa tra le due soglie sono classificati come possible match (ossia devono essere revisionati ulteriormente). Una volta classificati tutti i profili lo status (match/unmatch/possible Match) viene inferito dai profili a tutte le coppie di record che fanno parte di quel profilo e vengono dunque create le liste degli abbinamenti e delle eventuali coppie da revisionare.',' ','output1 +  output2 + output5',' ','Crea le liste degli abbinamenti, delle coppie da revisionare (se presenti) e degli indicatori di qualità sull\'abbinamento','Lista dei Match e dei PossibleMatch','Tabella dei i record abbinati con tutte le variabili comuni + Tabella dei record abbinati come coppie da revisionare con tutte le variabili comuni + Precision e recall calcolati dal modello per il risultato dell\'integrazione','output7 + output8 + output9','','','','','Integrazione dati','','Se il numero degli abbinamenti e delle coppie da revisionare è soddisfacente il processo di abbinamento si conclude se invece si ritiene insufficiente va eseguito un nuovo processo che riceve come input i record residui (non abbinati) delle due fonti.',51),('5.1 Integrate data','Applicazione del vincolo di 1:1','Riduzione Ottima','Nel caso sia richiesto si riduce la lista degli abbinamenti applicando il vincolo di abbinamento 1:1','In base alle indicazioni del committente si decide se l\'abbinamento dei record deve essere di tipo 1:1 ovvero se ogni record della prima fonte si deve abbinare al massimo ad un record della seconda fonte e viceversa. In questo caso si risolvono i casi di abbinamenti multipli scegliendo l\'abbinamento più promettente. La lista degli abbinamenti ridotti sarà un sottoinsieme della lista degli abbinamenti e più precisamente sarà quello con una qualità migliore tra tutti i sotto insiemi che verificano il vincolo.','Tabella match + Tabella dei possible match','output 7 + output8','','Data la funzione F che ha come dominio le coppie di abbinati ed é definita come la somma delle probabilità a posteriori delle coppie, il metodo individua il sotto insieme di record della tabella degli abbinati che, verificando il vincolo di unicità 1 a 1, massimizza F','Lista dei Match 1:1 e dei PossibleMatch 1:1','Tabella dei record abbinati che verificano il vincolo di 1:1 +  Tabella dei record abbinati come coppie da revisionareche verificano il vincolo di 1:1','output10 + output11','metodo del simplesso','','','fastLink','Integrazione dati','','Se il numero degli abbinamenti e delle coppie da revisionare è soddisfacente il processo di abbinamento si conclude se invece si ritiene insufficiente va eseguito un nuovo processo che riceve come input i record residui (non abbinati) delle due fonti.',51),('5.1 Integrate data','Applicazione del vincolo di 1:1','Riduzione metodo di Karmarcar','','','','','','Data la funzione F che ha come dominio le coppie di abbinati ed é definita come la somma delle probabilità a posteriori delle coppie, il metodo individua il sotto insieme di record della tabella degli abbinati che, verificando il vincolo di unicità 1 a 1, massimizza F','','','','metodo di Karmarkar','','','','Integrazione dati','','',51),('5.1 Integrate data','Applicazione del vincolo di 1:1','Riduzione greedy','','','','','','Si crea la lista di record della tabella degli abbinati ordinata per probabilità a posteriori e la coppia sopravvive alla riduzione solo se non viola il vincolo di unicità 1 a 1 con le altre coppie sopravvisute','','','','lista ordinata','','','RLfunc','Integrazione dati','','',51);
/*!40000 ALTER TABLE `csm_excel_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `csm_excel_objects`
--

DROP TABLE IF EXISTS `csm_excel_objects`;
/*!50001 DROP VIEW IF EXISTS `csm_excel_objects`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `csm_excel_objects` AS SELECT 
 1 AS `descr`,
 1 AS `name`,
 1 AS `type`,
 1 AS `step`,
 1 AS `process`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `csm_gsbpm_process`
--

DROP TABLE IF EXISTS `csm_gsbpm_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_gsbpm_process` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CODE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `PHASE` int DEFAULT NULL,
  `SUBPROCESS` int DEFAULT NULL,
  `ACTIVE` tinyint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_gsbpm_process_csm_gsbpm_process` (`PHASE`),
  CONSTRAINT `fk_phase_sub_proc` FOREIGN KEY (`PHASE`) REFERENCES `csm_gsbpm_process` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_gsbpm_process`
--

LOCK TABLES `csm_gsbpm_process` WRITE;
/*!40000 ALTER TABLE `csm_gsbpm_process` DISABLE KEYS */;
INSERT INTO `csm_gsbpm_process` VALUES (1,'1','Specify needs',NULL,1,0),(2,'2','Design',NULL,2,1),(3,'3','Build',NULL,3,1),(4,'4','Collect',NULL,4,1),(5,'5','Process',NULL,5,1),(6,'6','Analyse',NULL,6,1),(7,'7','Disseminate',NULL,7,1),(8,'8','Evaluate',NULL,8,0),(11,'1.1','Identify needs',1,1,0),(12,'1.2','Consult and confirm needs',1,2,0),(13,'1.3','Establish output objectives',1,3,0),(14,'1.4','Identify concepts',1,4,0),(15,'1.5','Check data availability',1,5,0),(16,'1.6','Prepare and submit business case',1,6,0),(21,'2.1','Design outputs',2,1,1),(22,'2.2','Design variable descriptions',2,2,1),(23,'2.3','Design collection',2,3,1),(24,'2.4','Design frame & sample',2,4,1),(25,'2.5','Design processing & analysis',2,5,1),(26,'2.6','Design production systems & workflow',2,6,1),(31,'3.1','Reuse or build collection instruments',3,1,1),(32,'3.2','Reuse or build processing and analysis components',3,2,1),(33,'3.3','Reuse or build dissemination components',3,3,1),(34,'3.4','Configure workflows',3,4,1),(35,'3.5','Test production system',3,5,1),(36,'3.6','Test statistical business process',3,6,1),(37,'3.7','Finalise production system',3,7,1),(41,'4.1','Create frame and select sample',4,1,1),(42,'4.2','Set up collection',4,2,1),(43,'4.3','Run collection',4,3,1),(44,'4.4','Finalize collection',4,4,1),(51,'5.1','Integrate data',5,1,1),(52,'5.2','Classify & code',5,2,1),(53,'5.3','Review & validate',5,3,1),(54,'5.4','Edit & impute',5,4,1),(55,'5.5','Derive new variables & units',5,5,1),(56,'5.6','Calculate weights',5,6,1),(57,'5.7','Calculate aggregates',5,7,1),(58,'5.8','Finalise data files',5,8,1),(61,'6.1','Prepare draft outputs',6,1,1),(62,'6.2','Validate outputs',6,2,1),(63,'6.3','Interpret & explain outputs',6,3,1),(64,'6.4','Apply disclosure control',6,4,1),(65,'6.5','Finalise outputs',6,5,1),(71,'7.1','Update output systems',7,1,1),(72,'7.2','Produce dissemination products',7,2,1),(73,'7.3','Manage release of dissemination products',7,3,1),(74,'7.4','Promote dissemination products',7,4,1),(75,'7.5','Manage user support',7,5,1),(81,'8.1','Update output systems',8,1,0),(82,'8.2','Produce dissemination products',8,2,0),(83,'8.3','Manage release of dissemination products',8,3,0);
/*!40000 ALTER TABLE `csm_gsbpm_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_information_object`
--

DROP TABLE IF EXISTS `csm_information_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_information_object` (
  `id` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `csm_app_role_ID` int NOT NULL,
  `csm_business_service_ID` int NOT NULL,
  `descr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`csm_business_service_ID`),
  KEY `fk_csm_information_object_csm_business_service1_idx` (`csm_business_service_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_information_object`
--

LOCK TABLES `csm_information_object` WRITE;
/*!40000 ALTER TABLE `csm_information_object` DISABLE KEYS */;
INSERT INTO `csm_information_object` VALUES (1,'input0',1,1,'archivio o registro contenente la potenziale popolazione di interesse'),(2,'output 1',1,1,'dati in formato elaborabile'),(3,'inpiut 0 bis',1,1,'archivio o registro con informazioni sugli eventi di trasformazione delle  unità'),(4,'output 1 + input 0 bis',1,1,'lista unità con informazioni sulle trasformazioni'),(5,'output 2',1,1,'lista unità aggiornata con informazioni sulle trasformazioni'),(6,'input0 bis',1,1,'lista nuove unità'),(7,'ouput 3+output 1 bis',1,1,'Lista unità appartenenti alla popolazione obiettivo aggiornata'),(8,'input 1',1,1,'archivio o fonti con variabili proxy delle variabili diinteresse'),(9,'input1+outpu4',1,1,''),(10,'input 2',1,1,'dati da indagini precedenti, dati da registro, dati amministrativi con variabili proxy delle variabili di interesse e con variabili utili alla stratificazione che devono essere presenti anche nella lista di popolazione'),(11,'output 5 o output 5 bis',1,1,'lista popolazione arricchita o \nlista microdati con informazioni ausiliarie'),(12,'(output 5 o output 5 bis) + output 6',1,1,'Lista unità appartenenti alla popolazione obiettivo integrata \ninformazione ausiliaria sui fenomeni di interesse'),(13,'(output 5 o output 5 bis) + output 6',1,1,'Lista unità appartenenti alla popolazione obiettivo per la selezione del campione+\ninformazione ausiliaria sui fenomeni di interesse'),(14,'(output 5  o output 5 bis) + output 7 + output 8',1,1,'Lista unità appartenenti alla popolazione obiettivo per la selezione del campione+flag concernenti i take all e i take non strata'),(15,'output 4 + output 10',1,1,'lista popolazione aggiornata e lista strati'),(16,'output 10 o output 10 bis',1,1,'dati da indagiini precedenti, dati da registro, da amministtrativi con variabili proxy delle variabili di interesse e con variabili utili alla stratificazione'),(17,'output 11 + output 6',1,1,'Output algoritmo di allocazione e lista popolazione arricchita'),(18,'input 0',1,1,'archivio di riferimento'),(19,'ouput 1',1,1,'dati archivio in formato elaborabile'),(20,'ouput 2',1,1,'Lista unità appartenenti alla popolazione obiettivo'),(21,'output 10 o output 10 bis',1,1,'lista strati con parametri utili all\'allocazzione'),(22,'input 0',1,1,'archivio unità finali (famigle, individui, alunni, ecc)'),(23,'output 1',1,1,'archivio unità finali (famigle, individui, alunni, ecc)'),(24,'output 2',1,1,'archivio unità primarie di selezione'),(25,'input 1',1,1,'archivio unità primarie di selezione'),(26,'output 3a o output 3b',1,1,'Lista unità appartenenti alla popolazione obiettivo'),(27,'output 5',1,1,'archivio o registro con informazioni sugli eventi di trasformazione delle UPS'),(28,'output 6',1,1,'Lista unità appartenenti alla popolazione obiettivo aggiornata'),(29,'output 7',1,1,'Lista unità appartenenti alla popolazione obiettivo aggiornata'),(30,'output 8',1,1,'Lista unità appartenenti alla popolazione obiettivo integrata con le nuove unità e le nuove informazioni ausiliarie'),(31,'output 9',1,1,'Lista unità appartenenti alla popolazione obiettivo aggiornata e integrata con le nuove unità'),(32,'output 10',1,1,'Lista unità appartenenti alla popolazione obiettivo per la selezione del campione'),(33,'output 11',1,1,'Lista strati di stratificazione 1'),(34,'input 2',1,1,'Informazioni esterne'),(35,'output 13 e input 2',1,1,'Input algoritmo di allocazione'),(36,'output 14',1,1,'Input algoritmo di allocazione'),(37,'output 12 e output 15',1,1,'lista strati con dimensione campionaria'),(38,'output 16',1,1,'UPS statificate 2'),(39,'output 17',1,1,'Campione UPS selezionato'),(40,'output 18',1,1,'Campione selezionato'),(41,'output 19',1,1,'Campione selezionato'),(42,'input0',1,1,'dati indagine grezzi'),(43,'input1',1,1,'dati fonti ausiliarie'),(44,'ouput1 + output2',1,1,'dati indagine +\ndati micro con informazioni ausiliarie'),(45,'output 1 o output 3',1,1,'dati indagine eventualmente arricchita con informazioni ausiliarie'),(46,'output 4',1,1,'dataset delle unità eleggibili'),(47,'output 5',1,1,'dataset delle unità eleggibili con identificativo delle unità-variabili affette da errori sistematici'),(48,'output 6',1,1,'dataset corretto con flag di imputazione per errore sistematico'),(49,'output 6',1,1,'dataset  corretto con flag di imputazione per  errore sistematico'),(50,'output 8',1,1,'dataset  corretto con flag di imputazione per errore sistematico e flag identificativo delle potenziali unità influenti e dei valori anomali'),(51,'output 9',1,1,'dataset corretto da eventuali errori sistematici e da  errori influenti e/o anomali'),(52,'output 10',1,1,'dataset con flag in variabili potenzialmente errate'),(53,'output 11',1,1,'dataset con flag sulle variabili errate; dataset degli errati; dataset degli esatti'),(54,'output 12',1,1,'dataset corretto da errori sistematici, influenti e/o anomali e casuali, comprendendo i record un numero elevato di mancate risposte'),(55,'output 13',1,1,'dataset corretto'),(56,'output 13',1,1,'dataset corretto'),(57,'output 13',1,1,'dataset corretto'),(58,'input 0',1,1,'Dati indagine'),(59,'output 1',1,1,'Dati indagine formattati'),(60,'output 2',1,1,'Dati indagine formattati+flag dominio'),(61,'output3',1,1,'Dati indagine formattati+flag dominio+macroarea'),(62,'input 1',1,1,'input da registro o archivio'),(63,'input_registro',1,1,'Dati da registro'),(64,'input_noti',1,1,'File con totali noti'),(65,'Output3',1,1,'Dati indagine formattati+flag dominio+macroarea'),(66,'Output5',1,1,'Dataset di stime dirette (calibrate) e cv per dominio (una riga per dominio e due colonne per ciasciuna variabile dipende: stima e cv)'),(67,'Output3 e Output7',1,1,'Dati indagine formattati+flag dominio+macroarea+indicazioni sulla accuratezza di stima dei parametri del modello per macroarea'),(68,'Output3',1,1,'Dati indagine formattati+flag dominio+macroarea'),(69,'Output3b',1,1,'Dati indagine formattati+flag dominio+macroarea+effetti casuali'),(70,'Output3c+output4',1,1,'Dati indagine formattati+flag dominio+macroarea+effetti casuali+peso\ne\nDataset di totali noti \n'),(71,'Output10 e Output5',1,1,'Lista contenente output della funzione mind.unit e Dataset di stime dirette (calibrate) e cv per dominio'),(72,'Output10 +  Output5+shapefile',1,1,'Lista contenente output della funzione mind.unit e Dataset di stime dirette (calibrate) e cv per dominio e shapefile di dominio'),(73,'input1',1,1,'primo archivio o fonte  da integrare'),(74,'input2',1,1,'Secondo archivio o fonte  da integrare'),(75,'output 1 + output 2',1,1,'Dataset caricati, elenco delle variabili'),(76,'output 1 + output 2',1,1,'Dataset caricati, elenco delle variabili'),(77,'output 1 + output 2',1,1,'Dataset caricati, elenco delle variabili'),(78,'output 1 + output 2',1,1,'Dataset caricati, elenco delle variabili'),(79,'output 1 + output 2',1,1,'Dataset caricati, elenco delle coppie di variabili'),(80,'output 1 + output 2',1,1,'Dataset caricati, elenco delle variabili'),(81,'output 1 + output 2',1,1,'Dataset caricati, elenco delle variabili'),(82,'output 1 + output 2',1,1,'Dataset da integrare'),(83,'output 1 + output 2',1,1,'Dataset da integrare'),(84,'output3',1,1,'Spazio di ricerca, Variabili di matching, funzioni di confronto e soglie'),(85,'output4',1,1,'tabella di contingenza'),(86,'output1 +  output2 + output5',1,1,''),(87,'output 7 + output8',1,1,'Tabella match + Tabella dei possible match'),(88,'ouput1',1,1,'dati d\'archivio in formato elaborabile'),(89,'output 2',1,1,'Lista unità appartenenti alla popolazione obiettivo con potenziali variabili di stratificazzione, localizzazione delle unità, ecc.'),(90,'output 1 bis',1,1,'dati in formato elaborabile'),(91,'output 2',1,1,'lista unità aggiornata con informazioni sulle trasformazioni'),(92,'output 3',1,1,'Lista aggiornata delle unità appartenenti alla popolazione obiettivo'),(93,'output 1bis',1,1,'microdati formattati'),(94,'output 4',1,1,'Lista aggiornata integrata con le nuove unità'),(95,'input 1',1,1,'microdati relativi a tutta o a una parte della popolazione'),(96,'output 5',1,1,'lista popolazione arricchita'),(97,'output 5 bis (alternatiivo a output 5)',1,1,'microdati con informazioni ausiliarie'),(98,'output 6',1,1,'lista potenziali varibili di stratificazione'),(99,'output 7',1,1,'Lista unità con flag delle unità che appartegono al take all stratum'),(100,'output 8',1,1,'Lista unità con flag delle unità che appartegono al take none stratum'),(101,'ouput 9',1,1,'Lista strati con medie e varianze'),(102,'output 10 bis',1,1,'lista strati con parametri utili all\'allocazzione'),(103,'output 11',1,1,'lista strati con dimesnione campionaria'),(104,'output 12',1,1,'lista unità campionarie con codsiuce strato e peso campionario iniziale'),(105,'ouput1',1,1,'dati archivio in formato elaborabile'),(106,'output 2',1,1,'Lista unità appartenenti alla popolazione obiettivo'),(107,'ouput 3',1,1,'Lista potenziali variabili di stratifcazione'),(108,'output 11',1,1,'lista strati con dimesnione campionaria'),(109,'output 1',1,1,'dati in formato elaborabile per i passi successsivi'),(110,'output 2',1,1,'lista unità finali con flag delle unità da osserevare tramite campinamento a due stadi'),(111,'output 3a',1,1,'lista unità primarie (UPS)'),(112,'output 3b',1,1,'lista unità primarie (UPS)'),(113,'output 4',1,1,'Lista unità appartenenti alla popolazione obiettivo aggiornata'),(114,'output 6',1,1,'Lista unità appartenenti alla popolazione obiettivo aggiornata con trasformazioni'),(115,'output 7',1,1,'Lista unità appartenenti alla popolazione obiettivo aggiornata con trasformazioni'),(116,'output 8',1,1,'Lista unità appartenenti alla popolazione obiettivo integrata con le nuove unità'),(117,'output 9',1,1,'Lista UPS appartenenti alla popolazione obiettivo aggiornata e integrata con le nuove unità e informazioni sulle unità finali'),(118,'output 10',1,1,'Lista unità appartenenti alla popolazione obiettivo per la selezione del campione'),(119,'output 11',1,1,'Lista unità stratificata 1'),(120,'output 12',1,1,'Lista unità primarie stratificata 1'),(121,'output 13',1,1,'Medie e varianze per strato 1'),(122,'output 14',1,1,'Input algoritmo di allocazione'),(123,'output 15',1,1,'Output algoritmo di allocazione, lista strati con dimensione campionaria'),(124,'output 16',1,1,'Lista UPS stratificate secondo stratificazione 2'),(125,'output 17',1,1,'Campione UPS selezionato'),(126,'output 18',1,1,'Campione UPS selezionato con campione SSU'),(127,'output 19',1,1,'Campione selezionato con attribuzione dei periodi di rilevazione'),(128,'output 20',1,1,'Campione selezionato con pesi diretti'),(129,'output 1',1,1,'dati indagine in  formato elaborabile per i passi successivi'),(130,'output 2',1,1,'dati micro con informazioni ausiliarie in formato elaborabile per i passi successivi'),(131,'output 3',1,1,'dati indagine arricchita con informazioni ausiliarie'),(132,'output 4',1,1,'dataset delle unità eleggibili'),(133,'output 5',1,1,'dataset con flag identificativo delle unità e delle variabili su cui si ritiene vi sia un errore sistematico'),(134,'output 6',1,1,'dataset  corretto con flag di imputazione'),(135,'output 7',1,1,'report su distribuzione delle variabili e parametri modelli (tipicamente di regressione)'),(136,'output 8',1,1,'dataset con flag identificativo delle unità influenti e/o anomale'),(137,'output 9',1,1,'dataset corretto da errori sistematici e influenti e/o anomali con relativi flag di correzione'),(138,'output 10 + report',1,1,'dataset con flag identificativo delle unità-variabili potenzialmente errate;\nReport con misure di qualità'),(139,'output 11',1,1,'dataset con flag sulle variabili errate'),(140,'output 12',1,1,'dataset corretto con flag di correzione'),(141,'output 13',1,1,'dataset corretto con flag di imputazione'),(142,'output 14',1,1,'indicatori di qualità'),(143,'output 15',1,1,'dataset corretto con flag sulle unità che hanno generato gli aggregati sospetti'),(144,'output 16',1,1,'dataset con flag identificativo delle unità-variabili potenzialmente errate;\nReport con misure di qualità'),(145,'Output1',1,1,'Dati indagine in formato elaborabile per i passi successivi'),(146,'Output2',1,1,'dati indagine formattati+flag dominio'),(147,'Output3',1,1,'dati indagine formattati+flag dominio+ macroarea'),(148,'Output4',1,1,'Dataset di totali noti (una riga per dominio e tante colonne quante sono le variabili esplicative)'),(149,'Output4',1,1,'dati da archivio formattati'),(150,'Output4',1,1,'Dataset di totali noti (una riga per dominio e tante colonne quante sono le variabili esplicative)'),(151,'Outpu5',1,1,'Dataset di stime dirette (calibrate) e cv per dominio (una riga per dominio e due colonne per ciasciuna variabile dipende: stima e cv)'),(152,'Output6',1,1,'Tabelle che indicano quanti e quali domini non soddisfano i criteri di accettabilità indicati dai committenti'),(153,'Output7',1,1,'Tabelle che indicano quante e quali macroaree permettono di stimare con accuratezza i parametri del modello.'),(154,'Output7b',1,1,'Tabelle che indicano quante e quali macroaree permettono di stimare con accuratezza i parametri del modello.'),(155,'Output8',1,1,'Tabelle di riassunto dei principali indicatori di model fitting (es AIC, BIC, loglk ecc)'),(156,'Output3b',1,1,'Dati indagine formattati+flag dominio+macroarea+effetti casuali'),(157,'Output9',1,1,'Tabelle di riassunto dei principali indicatori di model fitting (es AIC, BIC, loglk ecc)'),(158,'Output3c',1,1,'Dati indagine formattati+flag dominio+macroarea+effetti casuali+peso'),(159,'Output10',1,1,'Lista contenente output della funzione mind.unit'),(160,'Output11',1,1,'Tabelle che indicano quanti e quali domini non soddisfano i criteri di accettabilità indicati dai committenti'),(161,'Output14',1,1,'Lista contenente output della funzione diagnostic.R'),(162,'Output13',1,1,'Mappe per stime e cv'),(163,'output 1',1,1,'i dati dalla fonte 1 sono desponibili per il processo di elaborazione'),(164,'output 2',1,1,'i dati dalla fonte 2 sono desponibili per il processo di elaborazione'),(165,'outputA1',1,1,'Per ogni variabile esaminata l\'indicatore assume un valore numerico decimale compreso tra 0 e 1, è possibile dunque creare una gerarchia tra le variabili'),(166,'outputA1',1,1,'Per ogni variabile esaminata l\'indicatore assume un valore numerico decimale compreso tra 0 e 1, è possibile dunque creare una gerarchia tra le variabili'),(167,'outputA1',1,1,'Per ogni variabile esaminata l\'indicatore assume un valore numerico decimale compreso tra 0 e 1, è possibile dunque creare una gerarchia tra le variabili'),(168,'outputA1',1,1,'Per ogni variabile esaminata l\'indicatore assume un valore numerico decimale compreso tra 0 e 1, è possibile dunque creare una gerarchia tra le variabili'),(169,'outputA1',1,1,'Per ogni variabile esaminata l\'indicatore assume un valore numerico decimale compreso tra 0 e 1, è possibile dunque creare una gerarchia tra le variabili'),(170,'outputA1',1,1,'Per ogni variabile esaminata l\'indicatore assume un valore intero'),(171,'outputA1',1,1,'Per ogni variabile esaminata l\'indicatore assume un valore numerico decimale compreso tra 0 e 1, è possibile dunque creare una gerarchia tra le variabili'),(172,'outputA2',1,1,'lista dei valori inaccurati'),(173,'output 1 + output 2',1,1,'Dataset da integrare'),(174,'output 1 + output 2',1,1,'Dataset da integrare'),(175,'output 1 + output 2',1,1,'Dataset da integrare'),(176,'output 1 + output 2',1,1,'Dataset da integrare'),(177,'output3',1,1,''),(178,'output4',1,1,'Le tabella di contingenza contiene tutti i possibili profili, ovvero tutte le possibili combinazioni di 0 e 1 (discordanze e concordanze) sulle variabili di matching. Per ogni profilo è indicato il numero di coppie dello spazio di ricerca che hanno quel profilo'),(179,'output5',1,1,'Tabella con tutti i profili divisi in match/unmatch'),(180,'output5',1,1,'Tabella con tutti i profili divisi in match/unmatch'),(181,'output5 + output6',1,1,'Tabella riportante le probabilità marginali stimate dal modello per ogni variabile di matching in caso di concordanza (m1, u1) e discordanza (m0,u0). Tabella con la probabilità a posteriori per ogni profilo calcolata dalle probabilità marginali'),(182,'output5',1,1,'Tabella con la probabilità a posteriori per ogni profilo calcolata dalle probabilità marginali'),(183,'output7 + output8 + output9',1,1,'Tabella dei i record abbinati con tutte le variabili comuni + Tabella dei record abbinati come coppie da revisionare con tutte le variabili comuni + Precision e recall calcolati dal modello per il risultato dell\'integrazione'),(184,'output10 + output11',1,1,'Tabella dei record abbinati che verificano il vincolo di 1:1 +  Tabella dei record abbinati come coppie da revisionareche verificano il vincolo di 1:1'),(185,'SUPPORT',1,1,'metadati di lettura (path, tracciato record, psw, ecc)'),(186,'SUPPORT',1,1,'metadati utili alla selzionee delle unità appartentii alla popolazione di indagine (es. classsi ateco, dimensione, ecc)'),(187,'SUPPORT',1,1,'chiavi di link tra unità della popolazione e unità trasformate'),(188,'SUPPORT',1,1,'metadati sugli eventi di trasformazione'),(189,'SUPPORT',1,1,'Metadati di lettura concernenti le fonti con le variabili proxy (path, tracciato record, psw, ecc)'),(190,'SUPPORT',1,1,'Metadati sulle fonti con informazioni sulla variabilità'),(191,'SUPPORT',1,1,'indicazioni sulle potenziali variabili esplicative'),(192,'SUPPORT',1,1,'cv desiderati per dominio'),(193,'SUPPORT',1,1,'cv desiderati per dominio'),(194,'SUPPORT',1,1,'parametri utili alla stratificazione.Es. dimensione minima di strato cv di dominio'),(195,'SUPPORT',1,1,'cv desiderati per dominio'),(196,'SUPPORT',1,1,'Informazioni sulle unità già selezionate da altre indagini'),(197,'SUPPORT',1,1,'condizioni di appartenenza alla popolazione'),(198,'SUPPORT',1,1,'Fonti ausiliarie relative a variabili correlate alle variabili di interesse'),(199,'SUPPORT',1,1,'parametri utili alla stratificazione.Es. dimensione minima di strato cv di dominio'),(200,'SUPPORT',1,1,'cv desiderati per dominio'),(201,'SUPPORT',1,1,'Informazioni sulle unità già selezionate da altre indagini'),(202,'SUPPORT',1,1,'Schema temporale di rilevazione (rotazione)'),(203,'SUPPORT',1,1,'Probabilità di inclusione'),(204,'SUPPORT',1,1,'metadati di lettura (path, tracciato record, psw, ecc)'),(205,'SUPPORT',1,1,'caratteristiche delle unità finali utili a differenziare i disegni di campionamento'),(206,'SUPPORT',1,1,'codici unità primarie'),(207,'SUPPORT',1,1,'codici unità primarie'),(208,'SUPPORT',1,1,'Fonti ausiliarie relative a eventi di trasformazione delle unità'),(209,'SUPPORT',1,1,'Fonti ausiliarie relative a eventi di trasformazione delle unità'),(210,'SUPPORT',1,1,'Fonti ausiliarie relative a eventi di trasformazione delle unità'),(211,'SUPPORT',1,1,'Fonti ausiliarie relative a nuove unità'),(212,'SUPPORT',1,1,'Liste unità precedenti'),(213,'SUPPORT',1,1,'Variabili di stratificazione'),(214,'SUPPORT',1,1,'Variabili di stratificazione'),(215,'SUPPORT',1,1,'Numerosità, medie e varianze di strato di variabili correlate alle variabili di interesse'),(216,'SUPPORT',1,1,'cv desiderati per dominio'),(217,'SUPPORT',1,1,'cv desiderati per dominio'),(218,'SUPPORT',1,1,'Parametri del disegno a due stadi: interviste per UPS e numero di UPS campione per strato'),(219,'SUPPORT',1,1,'Informazioni sulle unità già selezionate da altre indagini'),(220,'SUPPORT',1,1,'Parametri del disegno a due stadi: interviste per UPS e numero di UPS campione per strato'),(221,'SUPPORT',1,1,'Schema temporale di rilevazione'),(222,'SUPPORT',1,1,'Probabilità di inclusione'),(223,'SUPPORT',1,1,'metadati di lettura  (path, psw, tracciato record, ecc.)'),(224,'SUPPORT',1,1,'chiavi di link tra dati indagine e fonti ausiliarie'),(225,'SUPPORT',1,1,'condizioni di eleggibilità nella popolazione di riferimento'),(226,'SUPPORT',1,1,'fonti ausiliarie, \nregole di (in)compatibilità:\n- regole formali\n- regole sostanziali'),(227,'SUPPORT',1,1,'supporto tematico alla determinazione delle regole di correzione deterministica degli errori sistematici'),(228,'SUPPORT',1,1,'livelli attesi delle stime'),(229,'SUPPORT',1,1,'report su distribuzione delle variabili e parametri modelli (tipicamente di regressione)\noutput 7'),(230,'SUPPORT',1,1,'conoscenza del fenomeno, fonti ausiliarie, supporto da parte degli esperti del fenomeno per la correzione degli errori influenti (idealmente le unità critiche  vengono inviate ai tematici per la loro correzione)'),(231,'SUPPORT',1,1,'regole di (in)compatibilità:\n- regole formali\n- regole sostanziali'),(232,'SUPPORT',1,1,'regole di (in)compatibilità:\n- regole formali\n- regole sostanziali\ncoefficienti di affidabilità delle variabili'),(233,'SUPPORT',1,1,'fonti ausiliarie e dati storici'),(234,'SUPPORT',1,1,'tabelle delle stime da analizzare; fonti ausiliarie'),(235,'SUPPORT',1,1,'indicatori di qualità (output 14)'),(236,'SUPPORT',1,1,'regole di (in)compatibilità:\n- regole formali\n- regole sostanziali'),(237,'SUPPORT',1,1,'Metadati di lettura(path, tracciato record ecc)'),(238,'SUPPORT',1,1,'Metadati relativi all\'individuazione del dominio'),(239,'SUPPORT',1,1,'Metadati relativi all\'individuazione della macroarea'),(240,'SUPPORT',1,1,'Indicazione variabili esplicative e del peso finale'),(241,'SUPPORT',1,1,'Indicazione del flag di dominio coerente con l\'output2 e varibili esplicative'),(242,'SUPPORT',1,1,'Metadati di lettura (path, tracciato record ecc)'),(243,'SUPPORT',1,1,'Indicazione variabili di interesse e del peso'),(244,'SUPPORT',1,1,'Indicazione da parte dei committenti in merito alla qualità minima accettabile dell\'accuratezza delle stime espresse in termini di CV per ciascun dominio (spesso provenienti da regolamenti Europei e linee guida internazionali)'),(245,'SUPPORT',1,1,'Indicazione sul numero minimo di domini per ciascuna macroarea al fine di stimare con accuratezza i parametri del modello'),(246,'SUPPORT',1,1,'indicazione sulle possibili macroaree che possono essere aggregate nel caso l\'analisi svolta indichi che qualche macroarea non permette di stimare i parametri del modello (opzionale)'),(247,'SUPPORT',1,1,'Metadati relativi all\'individuazione delle variabili esplicative'),(248,'SUPPORT',1,1,'Metadati relativi all\'individuazione degli effetti causali'),(249,'SUPPORT',1,1,'Indicazione del peso (opzionale)'),(250,'SUPPORT',1,1,'\nparametri su cui sono possibili scelte alternative da parte del committente o della persona incaricata del calcolo'),(251,'SUPPORT',1,1,'indicazioni sulla qualità accettabile'),(252,'SUPPORT',1,1,'Indicazione da parte dei committenti in merito alla qualità minima accettabile dell\'accuratezza delle stime espresse in termini di CV per ciascun dominio (spesso provenienti da regolamenti Europei e linee guida internazionali)'),(253,'SUPPORT',1,1,'conoscenza del fenomeno e del territorio di supporto alla ricerca dei pattern'),(254,'SUPPORT',1,1,'metadati di lettura (path, tracciato record, psw, ecc)'),(255,'SUPPORT',1,1,'Elenco valori ammissibili per la variabile'),(256,'SUPPORT',1,1,'Nome variabili correlate, Elenco valori ammissibili per la variabile in relazione ai valori della variabile correlata'),(257,'SUPPORT',1,1,'Range sulla dimensione del singolo blocco'),(258,'SUPPORT',1,1,'formato previsto per i valori della variabile'),(259,'SUPPORT',1,1,'tipo di standardizzazione'),(260,'SUPPORT',1,1,'eventuale carattere di separazione'),(261,'SUPPORT',1,1,'carattere separatore'),(262,'SUPPORT',1,1,'lista di valori errati con correzione'),(263,'SUPPORT',1,1,'Variabili di bloccaggio'),(264,'SUPPORT',1,1,'Variabili di bloccaggio'),(265,'SUPPORT',1,1,'Variabili di ordinamento e dimensione della finestra'),(266,'SUPPORT',1,1,'Variabili di bloccaggio, variabili di ordinamento e dimensione della finestra'),(267,'SUPPORT',1,1,'Variabili di hashing, dimensione del q-gramma, numero di rotazioni, soglia sulla distanza degli hash'),(268,'SUPPORT',1,1,'Variabili di bloccaggio, variabili di hashing, dimensione del q-gramma, numero di rotazioni, soglia sulla distanza degli hash'),(269,'SUPPORT',1,1,'Regola definita su concordanza e discordanza sulle variabili di matching'),(270,'SUPPORT',1,1,'Probabilita marginali m1, u1 e m0, u0  per tutte variabili di matching'),(402,'TARGET',101,100,'Matrix or data frame containing the response variablesmatrix or data frame containing the response variables'),(403,'COVARIATA',103,100,'Optional matrix or data frame containing the error free covariates'),(404,'PREDIZIONE',104,100,'Matrix of predicted values for Target variables'),(405,'OUTLIER',105,100,'An observation that lies an abnormal distance from other values in a random sample from a population'),(407,'ERRORI INFLUENTI',107,100,'Influential data consists of data points that influence (skew) an analysis in a signficant way'),(409,'OUTPUT',109,100,'Output Variable set'),(410,'STRATO',110,100,'Subset of the population which is being sampled'),(412,'MODELLO',112,100,'Multivariate Regression Model'),(501,'MATCHING VARIABLES',1,200,'MATCHING VARAIBLES'),(502,'VARIABLES DATASET A',2,200,'SELECTED VARIABLES IN DATASET A'),(503,'VARIABLES DATASET B',3,200,'SELECTED VARIABLES IN DATASET B'),(504,'CONTINGENCY TABLE',4,200,'CONTINGENCY TABLE'),(505,'MU TABLE',5,200,'MU TABLE'),(506,'BLOCKING',6,200,'SLICING DEL DATASET'),(507,'MATCHING TABLE',7,200,'MATCHING TABLE'),(508,'THRESHOLD MATCHING',8,200,'THRESHOLD MATCHING'),(509,'THRESHOLD UNMATCHING',9,200,'THRESHOLD UNMATCHING'),(510,'POSSIBLE MATCHING TABLE',10,200,'POSSIBLE MATCHING TABLE'),(513,'RESIDUAL A',13,200,'RESIDUAL DATASET  A'),(514,'RESIDUAL B',14,200,'RESIDUAL DATASET  B'),(515,'DATA',15,200,'DATA'),(516,'RULESET',16,200,'RULESET'),(517,'MARGINAL PROBABILITIES',17,200,'MARGINAL PROBABILITIES'),(518,'BLOCKING A',18,200,'SLICING DEL DATASET A'),(519,'BLOCKING B',19,200,'SLICING DEL DATASET B'),(520,'REDUCTION METHOD',20,200,'METHOD OF REDUCTION OF THE SEARCH SPACE'),(521,'INDEXES MATCHED',21,200,'INDEX ROWS MATCHED CONTENGENCY TABLE'),(522,'MATCHING TABLE REDUCED',22,200,'MATCHING TABLE WITH CONSTRAINT'),(523,'QUALITY INDICATORS',23,200,'QUALITY INDICATORS OF RESULTS'),(524,'POSSIBLE MATCHING TABLE REDUCED',24,200,'POSSIBLE MATCHING TABLE WITH CONSTRAINT'),(526,'MARGINALS-VARNAMES',26,200,'MARGINAL PROBABILITIES: VARIABLE NAMES'),(527,'MARGINALS-COMPARISON',27,200,'MARGINAL PROBABILITIES: VARIABLE NAMES'),(528,'MARGINALS-MFREQ',28,200,'MARGINAL PROBABILITIES: VARIABLE NAMES'),(529,'MARGINALS-UFREQ',29,200,'MARGINAL PROBABILITIES: VARIABLE NAMES'),(530,'MATCH FREQUENCY IN SEARCH SPACE',30,200,'MATCH FREQUENCY IN SEARCH SPACE');
/*!40000 ALTER TABLE `csm_information_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_link_agent_tool`
--

DROP TABLE IF EXISTS `csm_link_agent_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_link_agent_tool` (
  `ID` int NOT NULL,
  `agent` int NOT NULL,
  `tool` int NOT NULL,
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Reference_Date` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_CSM_link_Agent_tool_CSM_Methodological_Tool` (`tool`),
  KEY `fk_CSM_link_Agent_CSM_Methodological_tool` (`agent`),
  CONSTRAINT `fk_CSM_link_Agent_CSM_Methodological_tool` FOREIGN KEY (`agent`) REFERENCES `csm_agent` (`ID`),
  CONSTRAINT `fk_CSM_link_Agent_tool_CSM_Methodological_Tool` FOREIGN KEY (`tool`) REFERENCES `csm_methodological_tool` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_link_agent_tool`
--

LOCK TABLES `csm_link_agent_tool` WRITE;
/*!40000 ALTER TABLE `csm_link_agent_tool` DISABLE KEYS */;
INSERT INTO `csm_link_agent_tool` VALUES (1,10,100,'Developer','Note','2010-2020'),(2,20,100,'Referent','Note','2020 onwards'),(3,30,150,'Developer','Note','2010-2020'),(4,20,150,'Referent','Note','2020 onwards'),(5,50,200,'Developer','Note','2010-2020'),(6,20,200,'Referente','Note','2020 onwards');
/*!40000 ALTER TABLE `csm_link_agent_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_link_business_service_app_role`
--

DROP TABLE IF EXISTS `csm_link_business_service_app_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_link_business_service_app_role` (
  `business_service_ID` int NOT NULL,
  `app_role_ID` int NOT NULL,
  PRIMARY KEY (`business_service_ID`,`app_role_ID`),
  KEY `fk_csm_business_service_has_csm_app_role_csm_app_role1_idx` (`app_role_ID`),
  KEY `fk_csm_business_service_has_csm_app_role_csm_business_servi_idx` (`business_service_ID`),
  CONSTRAINT `fk_csm_business_service_has_csm_app_role_app_role1` FOREIGN KEY (`app_role_ID`) REFERENCES `csm_app_role` (`ID`),
  CONSTRAINT `fk_csm_business_service_has_csm_app_role_business_service1` FOREIGN KEY (`business_service_ID`) REFERENCES `csm_business_service` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_link_business_service_app_role`
--

LOCK TABLES `csm_link_business_service_app_role` WRITE;
/*!40000 ALTER TABLE `csm_link_business_service_app_role` DISABLE KEYS */;
INSERT INTO `csm_link_business_service_app_role` VALUES (200,1),(200,2),(200,3),(200,4),(200,5),(200,6),(200,7),(200,8),(200,9),(200,10),(200,13),(200,14),(200,17),(200,18),(200,19),(200,20),(200,21),(200,22),(200,23),(200,24),(200,26),(200,27),(200,28),(200,29),(200,30),(100,100),(100,101),(100,102),(100,103),(100,104),(100,105),(100,106),(100,107),(100,108),(100,109),(100,110),(100,111),(100,112),(100,113),(100,114),(100,115);
/*!40000 ALTER TABLE `csm_link_business_service_app_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_link_documentation_method`
--

DROP TABLE IF EXISTS `csm_link_documentation_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_link_documentation_method` (
  `csm_documentation_ID` int NOT NULL,
  `csm_statistical_method_ID` int NOT NULL,
  PRIMARY KEY (`csm_documentation_ID`,`csm_statistical_method_ID`),
  KEY `fk_csm_documentation_has_csm_statistical_method_csm_statist_idx` (`csm_statistical_method_ID`),
  KEY `fk_csm_documentation_has_csm_statistical_method_csm_documen_idx` (`csm_documentation_ID`),
  CONSTRAINT `fk_csm_documentation_has_csm_statistical_method_csm_documenta1` FOREIGN KEY (`csm_documentation_ID`) REFERENCES `csm_documentation` (`ID`),
  CONSTRAINT `fk_csm_documentation_has_csm_statistical_method_csm_statistic1` FOREIGN KEY (`csm_statistical_method_ID`) REFERENCES `csm_statistical_method` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_link_documentation_method`
--

LOCK TABLES `csm_link_documentation_method` WRITE;
/*!40000 ALTER TABLE `csm_link_documentation_method` DISABLE KEYS */;
INSERT INTO `csm_link_documentation_method` VALUES (10,100),(20,100);
/*!40000 ALTER TABLE `csm_link_documentation_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_link_documentation_tool`
--

DROP TABLE IF EXISTS `csm_link_documentation_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_link_documentation_tool` (
  `csm_documentation_ID` int NOT NULL,
  `csm_methodological_tool_ID` int NOT NULL,
  PRIMARY KEY (`csm_documentation_ID`,`csm_methodological_tool_ID`),
  KEY `fk_csm_documentation_has_csm_methodological_tool_csm_method_idx` (`csm_methodological_tool_ID`),
  KEY `fk_csm_documentation_has_csm_methodological_tool_csm_docume_idx` (`csm_documentation_ID`),
  CONSTRAINT `fk_csm_documentation_has_csm_methodological_tool_csm_document1` FOREIGN KEY (`csm_documentation_ID`) REFERENCES `csm_documentation` (`ID`),
  CONSTRAINT `fk_csm_documentation_has_csm_methodological_tool_csm_methodol1` FOREIGN KEY (`csm_methodological_tool_ID`) REFERENCES `csm_methodological_tool` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_link_documentation_tool`
--

LOCK TABLES `csm_link_documentation_tool` WRITE;
/*!40000 ALTER TABLE `csm_link_documentation_tool` DISABLE KEYS */;
INSERT INTO `csm_link_documentation_tool` VALUES (10,150),(20,150),(40,200);
/*!40000 ALTER TABLE `csm_link_documentation_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_link_function_process`
--

DROP TABLE IF EXISTS `csm_link_function_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_link_function_process` (
  `BUSINESS_FUNCTION_ID` int NOT NULL,
  `BUSINESS_PROCESS_ID` int NOT NULL,
  PRIMARY KEY (`BUSINESS_FUNCTION_ID`,`BUSINESS_PROCESS_ID`),
  KEY `fk_csm_bfunc_bprocess_csm_business_process` (`BUSINESS_PROCESS_ID`),
  CONSTRAINT `fk_csm_bfunc_bprocess_csm_business_function` FOREIGN KEY (`BUSINESS_FUNCTION_ID`) REFERENCES `csm_business_function` (`ID`),
  CONSTRAINT `fk_csm_bfunc_bprocess_csm_business_process` FOREIGN KEY (`BUSINESS_PROCESS_ID`) REFERENCES `csm_business_process` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_link_function_process`
--

LOCK TABLES `csm_link_function_process` WRITE;
/*!40000 ALTER TABLE `csm_link_function_process` DISABLE KEYS */;
INSERT INTO `csm_link_function_process` VALUES (1,1),(1,2),(1,3),(1,5),(1,70),(1,71),(1,72),(1,77),(1,78),(10,80),(20,110),(30,112),(20,114),(20,116),(10,130),(31,275),(32,275),(31,276),(31,277),(32,278),(33,278),(32,279),(33,279),(32,280),(33,281),(33,282),(33,283),(34,284),(34,285),(34,286),(34,287),(34,288),(35,289),(36,290),(36,291),(36,292),(36,293),(36,294),(37,295),(37,296),(37,297),(37,298),(37,299),(37,300),(37,301),(37,302);
/*!40000 ALTER TABLE `csm_link_function_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_link_function_view_data_type`
--

DROP TABLE IF EXISTS `csm_link_function_view_data_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_link_function_view_data_type` (
  `BUSINESS_FUNCTION_ID` int NOT NULL,
  `VIEW_DATA_TYPE_ID` int NOT NULL,
  PRIMARY KEY (`BUSINESS_FUNCTION_ID`,`VIEW_DATA_TYPE_ID`),
  KEY `fk_csm_view_data_type_csm_view_data_type` (`VIEW_DATA_TYPE_ID`),
  CONSTRAINT `fk_csm_view_data_type_csm_business_function` FOREIGN KEY (`BUSINESS_FUNCTION_ID`) REFERENCES `csm_business_function` (`ID`),
  CONSTRAINT `fk_csm_view_data_type_csm_view_data_type` FOREIGN KEY (`VIEW_DATA_TYPE_ID`) REFERENCES `csm_view_data_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_link_function_view_data_type`
--

LOCK TABLES `csm_link_function_view_data_type` WRITE;
/*!40000 ALTER TABLE `csm_link_function_view_data_type` DISABLE KEYS */;
INSERT INTO `csm_link_function_view_data_type` VALUES (1,1),(20,1);
/*!40000 ALTER TABLE `csm_link_function_view_data_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_link_gsbpm_business_function`
--

DROP TABLE IF EXISTS `csm_link_gsbpm_business_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_link_gsbpm_business_function` (
  `gsbpm_ID` int NOT NULL,
  `business_function_ID` int NOT NULL,
  PRIMARY KEY (`gsbpm_ID`,`business_function_ID`),
  KEY `fk_csm_gsbpm_process_has_csm_business_function_csm_business_idx` (`business_function_ID`),
  KEY `fk_csm_gsbpm_process_has_csm_business_function_csm_gsbpm_pr_idx` (`gsbpm_ID`),
  CONSTRAINT `fk_csm_gsbpm_process_has_csm_business_function_csm_business_f1` FOREIGN KEY (`business_function_ID`) REFERENCES `csm_business_function` (`ID`),
  CONSTRAINT `fk_csm_gsbpm_process_has_csm_business_function_csm_gsbpm_proc1` FOREIGN KEY (`gsbpm_ID`) REFERENCES `csm_gsbpm_process` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_link_gsbpm_business_function`
--

LOCK TABLES `csm_link_gsbpm_business_function` WRITE;
/*!40000 ALTER TABLE `csm_link_gsbpm_business_function` DISABLE KEYS */;
INSERT INTO `csm_link_gsbpm_business_function` VALUES (53,1),(53,10),(54,10),(53,20),(54,20),(53,30),(54,30),(24,31),(24,32),(24,33),(41,34),(53,34),(54,34),(53,35),(57,36),(51,37);
/*!40000 ALTER TABLE `csm_link_gsbpm_business_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_link_gsbpm_method`
--

DROP TABLE IF EXISTS `csm_link_gsbpm_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_link_gsbpm_method` (
  `gsbpm` int NOT NULL,
  `method` int NOT NULL,
  KEY `gsbpm` (`gsbpm`),
  KEY `method` (`method`),
  CONSTRAINT `csm_link_gsbpm_method_ibfk_1` FOREIGN KEY (`gsbpm`) REFERENCES `csm_gsbpm_process` (`ID`),
  CONSTRAINT `csm_link_gsbpm_method_ibfk_2` FOREIGN KEY (`method`) REFERENCES `csm_statistical_method` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_link_gsbpm_method`
--

LOCK TABLES `csm_link_gsbpm_method` WRITE;
/*!40000 ALTER TABLE `csm_link_gsbpm_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `csm_link_gsbpm_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_link_method_tool`
--

DROP TABLE IF EXISTS `csm_link_method_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_link_method_tool` (
  `method` int NOT NULL,
  `tool` int NOT NULL,
  PRIMARY KEY (`method`,`tool`),
  KEY `fk_csm_link_method_tool_csm_methodological_tool1_idx` (`tool`),
  CONSTRAINT `fk_csm_link_method_tool_csm_methodological_tool1` FOREIGN KEY (`tool`) REFERENCES `csm_methodological_tool` (`ID`),
  CONSTRAINT `fk_csm_link_method_tool_csm_statistical_method1` FOREIGN KEY (`method`) REFERENCES `csm_statistical_method` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_link_method_tool`
--

LOCK TABLES `csm_link_method_tool` WRITE;
/*!40000 ALTER TABLE `csm_link_method_tool` DISABLE KEYS */;
INSERT INTO `csm_link_method_tool` VALUES (100,100),(100,150),(200,200),(213,201),(216,201),(230,201),(212,202),(228,202),(226,203),(236,204),(237,205),(238,206),(239,206),(240,206),(250,207),(251,207),(201,208),(202,208),(205,208),(206,208),(207,208),(212,208),(214,208),(215,208),(217,208),(223,208),(224,208),(226,208),(228,208),(231,208),(203,209),(210,210),(212,211),(228,211),(213,212),(216,212),(230,212),(218,213),(233,214),(234,214),(235,214),(237,214),(240,214),(241,214),(242,214),(243,214),(236,215),(238,216),(239,216),(240,216),(244,217),(245,217),(246,217),(248,217),(249,217),(252,217),(253,217),(254,218),(254,219),(255,219),(256,219),(257,219),(258,219),(259,220),(264,221),(265,221),(267,221),(269,221),(270,221),(271,221),(276,221),(277,221),(282,221),(268,222),(275,222),(278,222),(279,223),(281,223);
/*!40000 ALTER TABLE `csm_link_method_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_link_process_design`
--

DROP TABLE IF EXISTS `csm_link_process_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_link_process_design` (
  `id` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `step` int NOT NULL,
  `type` int NOT NULL,
  `csm_information_object_id` int NOT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  KEY `fk_csm_link_process_design_csm_process_step1_idx` (`step`),
  KEY `fk_csm_link_process_design_csm_design_type1_idx` (`type`),
  KEY `fk_csm_link_process_design_csm_information_object1_idx` (`csm_information_object_id`),
  CONSTRAINT `fk_csm_link_process_design_csm_design_type1` FOREIGN KEY (`type`) REFERENCES `cls_design_type` (`id`),
  CONSTRAINT `fk_csm_link_process_design_csm_information_object1` FOREIGN KEY (`csm_information_object_id`) REFERENCES `csm_information_object` (`id`),
  CONSTRAINT `fk_csm_link_process_design_csm_process_step1` FOREIGN KEY (`step`) REFERENCES `csm_process_step` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_link_process_design`
--

LOCK TABLES `csm_link_process_design` WRITE;
/*!40000 ALTER TABLE `csm_link_process_design` DISABLE KEYS */;
/*!40000 ALTER TABLE `csm_link_process_design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_link_process_step`
--

DROP TABLE IF EXISTS `csm_link_process_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_link_process_step` (
  `BUSINESS_PROCESS_ID` int NOT NULL,
  `PROCESS_STEP_ID` int NOT NULL,
  PRIMARY KEY (`BUSINESS_PROCESS_ID`,`PROCESS_STEP_ID`),
  KEY `fk_csm_bprocess_bstep_csm_process_step` (`PROCESS_STEP_ID`),
  CONSTRAINT `fk_csm_bprocess_bstep_csm_business_process` FOREIGN KEY (`BUSINESS_PROCESS_ID`) REFERENCES `csm_business_process` (`ID`),
  CONSTRAINT `fk_csm_bprocess_bstep_csm_process_step` FOREIGN KEY (`PROCESS_STEP_ID`) REFERENCES `csm_process_step` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_link_process_step`
--

LOCK TABLES `csm_link_process_step` WRITE;
/*!40000 ALTER TABLE `csm_link_process_step` DISABLE KEYS */;
INSERT INTO `csm_link_process_step` VALUES (70,70),(73,70),(170,70),(270,70),(71,71),(73,71),(72,72),(73,72),(272,72),(76,76),(77,77),(273,77),(78,78),(178,78),(274,78),(271,80),(80,100),(110,100),(112,100),(114,200),(116,200),(80,300),(130,300),(275,351),(276,351),(278,351),(281,351),(282,351),(283,351),(284,351),(290,351),(295,351),(275,352),(279,352),(275,353),(276,353),(278,353),(283,353),(284,353),(275,354),(276,354),(278,354),(283,354),(276,355),(276,356),(276,357),(276,358),(278,358),(276,359),(278,359),(277,360),(278,361),(286,361),(291,361),(292,361),(279,362),(280,362),(281,363),(281,364),(278,365),(278,366),(290,366),(291,366),(278,367),(278,368),(279,369),(279,370),(279,371),(284,372),(285,373),(286,373),(285,374),(286,374),(287,374),(288,374),(287,375),(289,375),(287,376),(289,377),(289,378),(290,379),(293,380),(294,381),(294,382),(294,383),(296,384),(296,385),(296,386),(296,387),(296,388),(296,389),(296,390),(297,391),(297,392),(297,393),(297,394),(297,395),(297,396),(298,397),(298,398),(298,399),(298,400),(298,401),(298,402),(298,403),(299,404),(299,405),(299,406),(299,407),(299,408),(299,409),(299,410),(299,411),(299,412),(299,413),(299,414),(299,415),(299,416),(299,417),(299,418),(299,419),(299,420),(300,421),(300,422),(300,423),(300,424),(301,425),(302,426),(302,427),(302,428);
/*!40000 ALTER TABLE `csm_link_process_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_link_step_instance`
--

DROP TABLE IF EXISTS `csm_link_step_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_link_step_instance` (
  `PROCESS_STEP_ID` int NOT NULL,
  `PROCESS_STEP_INSTANCE_ID` int NOT NULL,
  PRIMARY KEY (`PROCESS_STEP_ID`,`PROCESS_STEP_INSTANCE_ID`),
  KEY `fk_csm_step_instance_step_instance` (`PROCESS_STEP_INSTANCE_ID`),
  CONSTRAINT `fk_csm_step_instance_process_step` FOREIGN KEY (`PROCESS_STEP_ID`) REFERENCES `csm_process_step` (`ID`),
  CONSTRAINT `fk_csm_step_instance_step_instance` FOREIGN KEY (`PROCESS_STEP_INSTANCE_ID`) REFERENCES `csm_step_instance` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_link_step_instance`
--

LOCK TABLES `csm_link_step_instance` WRITE;
/*!40000 ALTER TABLE `csm_link_step_instance` DISABLE KEYS */;
INSERT INTO `csm_link_step_instance` VALUES (100,1),(200,2),(300,3),(70,11),(71,12),(72,13),(77,14),(78,15),(76,20),(80,21);
/*!40000 ALTER TABLE `csm_link_step_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_log`
--

DROP TABLE IF EXISTS `csm_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MSG` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `MSG_TIME` datetime DEFAULT NULL,
  `TYPE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `WORK_SESSION_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_log_worksession` (`WORK_SESSION_ID`),
  CONSTRAINT `fk_csm_log_worksession` FOREIGN KEY (`WORK_SESSION_ID`) REFERENCES `csm_work_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_log`
--

LOCK TABLES `csm_log` WRITE;
/*!40000 ALTER TABLE `csm_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `csm_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_methodological_tool`
--

DROP TABLE IF EXISTS `csm_methodological_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_methodological_tool` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Release_Date` date DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Standard_Istat` tinyint DEFAULT '0',
  `Tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Version` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Tool_type` int NOT NULL,
  `service` int NOT NULL,
  `Last_update` date DEFAULT NULL,
  `Requirements` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_methodological_tool_csm_tool_type1_idx` (`Tool_type`),
  KEY `fk_csm_methodological_tool_csm_business_service1_idx` (`service`),
  CONSTRAINT `fk_csm_methodological_tool_csm_business_service1` FOREIGN KEY (`service`) REFERENCES `csm_business_service` (`ID`),
  CONSTRAINT `fk_csm_methodological_tool_csm_tool_type1` FOREIGN KEY (`Tool_type`) REFERENCES `cls_tool_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_methodological_tool`
--

LOCK TABLES `csm_methodological_tool` WRITE;
/*!40000 ALTER TABLE `csm_methodological_tool` DISABLE KEYS */;
INSERT INTO `csm_methodological_tool` VALUES (100,NULL,'Detection of outliers and influential errors using a latent variable model','Selemix Service',0,'mixture,selective editing,outliers','1.0.2',1,100,'2022-06-08',NULL),(150,NULL,'Detection of outliers and influential errors using a latent variable model','Selemix',0,'mixture,selective editing,outliers','1.0.2',2,150,NULL,NULL),(200,NULL,'RELAIS (REcord Linkage At IStat) is a toolkit providing a set of techniques for dealing with record linkage projects.','RELAIS',0,'data integration, probabilistic record linkage, string comparators, blocking/sorting/indexing, deduplication, open source software','3.1',2,200,NULL,NULL),(201,NULL,NULL,'FS4, R2BEAT, SAS macro Cube, R-BalancedSampling',0,NULL,NULL,2,201,NULL,NULL),(202,NULL,NULL,'Mauss-R, R2Beat, Multiway, Sampling Strata',0,NULL,NULL,2,202,NULL,NULL),(203,NULL,NULL,'Re-Genesees',0,NULL,NULL,2,203,NULL,NULL),(204,NULL,NULL,'AGAIN (solo per specifiche indagini)',0,NULL,NULL,2,204,NULL,NULL),(205,NULL,NULL,'AGAIN (solo per specifiche indagini); applicazione sviluppata per il Censimento della popolazione nel 2018 (Cuccia, Bianchi)',0,NULL,NULL,2,205,NULL,NULL),(206,NULL,NULL,'Concord-SCIA',0,NULL,NULL,2,206,NULL,NULL),(207,NULL,NULL,'Regenesses',0,NULL,NULL,2,207,NULL,NULL),(208,NULL,NULL,'Procedure ad hoc SAS o R',0,NULL,NULL,3,208,NULL,NULL),(209,NULL,NULL,'Procedure ad hoc SAS o R , relais',0,NULL,NULL,3,209,NULL,NULL),(210,NULL,NULL,'Procedure ad hoc SAS o R\nLibreria SamplingStrata,  ecc',0,NULL,NULL,3,210,NULL,NULL),(211,NULL,NULL,'Mauss-R, R2Beat, Multiway, Sampling Strata',0,NULL,NULL,3,211,NULL,NULL),(212,NULL,NULL,'Procedure ad hoc SAS (Proc survey select)  o R',0,NULL,NULL,3,212,NULL,NULL),(213,NULL,NULL,'Procedure ad hoc SAS (Proc survey select) o R',0,NULL,NULL,3,213,NULL,NULL),(214,NULL,NULL,'Sas, R, SQL',0,NULL,NULL,3,214,NULL,NULL),(215,NULL,NULL,'Sas (Banff), R (SeleMix)',0,NULL,NULL,3,215,NULL,NULL),(216,NULL,NULL,'Sas (Banff), R, SQL',0,NULL,NULL,3,216,NULL,NULL),(217,NULL,NULL,'procedure ad hoc',0,NULL,NULL,3,217,NULL,NULL),(218,NULL,NULL,'ad esempio utilizzando libreria R \"MASS\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"',0,NULL,NULL,3,218,NULL,NULL),(219,NULL,NULL,'Pacchetto R mind',0,NULL,NULL,3,219,NULL,NULL),(220,NULL,NULL,'Funzione diagnostic.R',0,NULL,NULL,3,220,NULL,NULL),(221,NULL,NULL,'RLfunc',0,NULL,NULL,3,221,NULL,NULL),(222,NULL,NULL,'fastLink; Rlfunc',0,NULL,NULL,3,222,NULL,NULL),(223,NULL,NULL,'fastLink',0,NULL,NULL,3,223,NULL,NULL);
/*!40000 ALTER TABLE `csm_methodological_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_parameter`
--

DROP TABLE IF EXISTS `csm_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_parameter` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DEFAULT_VAL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `JSON_TEMPLATE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_parameter`
--

LOCK TABLES `csm_parameter` WRITE;
/*!40000 ALTER TABLE `csm_parameter` DISABLE KEYS */;
INSERT INTO `csm_parameter` VALUES (1,'MATCHING VARIABLES','MATCHING VARIABLES',NULL,'{\"data\":[],\"schema\":{\"items\":{\"properties\":{\"MatchingVariable\":{\"maxLength\":50,\"required\":true,\"title\":\"MatchingVariable\",\"type\":\"string\"},\"MatchingVariableA\":{\"maxLength\":50,\"required\":true,\"title\":\"MatchingVariableA\",\"type\":\"string\"},\"MatchingVariableB\":{\"maxLength\":50,\"required\":true,\"title\":\"MatchingVariableB\",\"type\":\"string\"},\"Method\":{\"enum\":[\"Equality\",\"Jaro\",\"Dice\",\"JaroWinkler\",\"Levenshtein\",\"3Grams\",\"Soundex\",\"NumericComparison\",\"NumericEuclideanDistance\",\"WindowEquality\",\"Inclusion3Grams\",\"SimHash\",\"Weighed3Grams\"],\"required\":true,\"title\":\"Method\"},\"Threshold\":{\"title\":\"Threshold\",\"type\":\"number\"},\"Window\":{\"title\":\"Window\",\"type\":\"integer\"}},\"type\":\"object\"},\"type\":\"array\"},\"options\":{\"type\":\"table\",\"showActionsColumn\":true,\"hideAddItemsBtn\":true,\"items\":{\"fields\":{\"Method\":{\"type\":\"select\",\"noneLabel\":\"\",\"removeDefaultNone\":false},\"MatchingVariableA\":{\"type\":\"select\",\"noneLabel\":\"\",\"dataSource\":\"matchedVariablesbyRoles.X1\"},\"MatchingVariableB\":{\"type\":\"select\",\"noneLabel\":\"\",\"dataSource\":\"matchedVariablesbyRoles.X2\"}}},\"form\":{\"buttons\":{\"addRow\":\"addRow\",\"removeRow\":\"removeRow\"}},\"view\":{\"templates\":{\"container-table\":\"#tableTemplate\",\"container-array-toolbar\":\"#addItemsBtn\",\"container-array-actionbar\":\"#rowItemBtn\"}}}}'),(2,'THRESHOLD MATCHING','THRESHOLD MATCHING','1','{\"data\":[],\"schema\":{\"name\":\"THRESHOLD MATCHING\",\"type\":\"number\", \"minimum\": 0.01,\"maximum\": 1}}'),(3,'THRESHOLD UNMATCHING','THRESHOLD UNMATCHING','1','{\"data\":[],\"schema\":{\"name\":\"THRESHOLD UNMATCHING\",\"type\":\"number\", \"minimum\": 0.01,\"maximum\": 1}}'),(5,'BLOCKING VARIABLES','BLOCKING VARIABLES',NULL,'{\"data\":[],\"schema\":{\"type\":\"object\", \"properties\": { \"BLOCKING_A\": { \"type\":\"array\", \"title\":\"BLOCKING A\",\"items\": {\"type\": \"string\"} }, \"BLOCKING_B\": { \"type\":\"array\", \"title\":\"BLOCKING B\" ,\"items\": {\"type\": \"string\"}} }}, \"options\": {\"fields\":{\"BLOCKING_A\":{\"type\":\"array\",    \"toolbarSticky\": true,\"items\":{\"type\":\"select\",\"noneLabel\":\"\",\"dataSource\":\"matchedVariables\"}},\"BLOCKING_B\":{\"type\":\"array\",   \"toolbarSticky\": true, \"items\":{\"type\":\"select\",\"noneLabel\":\"\",\"dataSource\":\"matchedVariables\"}}}}}'),(20,'REDUCTION METHOD','REDUCTION METHOD',NULL,'{\"data\":[],\"schema\":{\"type\":\"object\",\"properties\":{\"REDUCTION-METHOD\":{\"type\":\"string\",\"enum\":[\"CartesianProduct\",\"BlockingVariables\",\"SortedNeighborhood\",\"SimHash\"]},\"BLOCKING\":{\"type\":\"object\",\"hidden\":true,\"name\":\"BLOCKING VARIABLES\",\"properties\":{\"BLOCKING A\":{\"type\":\"array\",\"required\":false,\"title\":\"BLOCKING A\",\"items\":{\"type\":\"string\"},\"properties\":{}},\"BLOCKING B\":{\"type\":\"array\",\"required\":false,\"title\":\"BLOCKING B\",\"items\":{\"type\":\"string\"},\"properties\":{}}}},\"SORTED NEIGHBORHOOD\":{\"type\":\"object\",\"hidden\":true,\"name\":\"SORTING VARIABLES\",\"properties\":{\"SORTING A\":{\"type\":\"array\",\"required\":false,\"title\":\"SORTING A\",\"items\":{\"type\":\"string\"},\"properties\":{}},\"SORTING B\":{\"type\":\"array\",\"required\":false,\"title\":\"SORTING B\",\"items\":{\"type\":\"string\"},\"properties\":{}},\"WINDOW\":{\"title\":\"WINDOW\",\"type\":\"integer\",\"width\":\"10\"}}},\"SIMHASH\":{\"type\":\"object\",\"hidden\":true,\"name\":\"SHINGLING VARIABLES\",\"properties\":{\"SHINGLING A\":{\"type\":\"array\",\"required\":false,\"title\":\"SHINGLING A\",\"items\":{\"type\":\"string\"},\"properties\":{}},\"SHINGLING B\":{\"type\":\"array\",\"required\":false,\"title\":\"SHINGLING B\",\"items\":{\"type\":\"string\"},\"properties\":{}},\"HDTHRESHOLD\":{\"type\":\"string\",\"items\":{\"type\":\"string\"},\"required\":true},\"ROTATIONS\":{\"type\":\"string\",\"title\":\"NUMBER OF ROTATIONS\",\"items\":{\"type\":\"string\"},\"required\":true}}}}},\"options\":{\"fields\":{\"REDUCTION-METHOD\":{\"type\":\"select\",\"label\":\"REDUCTION METHOD\",\"removeDefaultNone\":true,\"id\":\"REDUCTION-METHOD\",\"sort\":false,\"optionLabels\":[\"CROSS PRODUCT\",\"BLOCKING\",\"SORTED NEIGHBORHOOD\",\"SIMHASH\"]},\"BLOCKING\":{\"type\":\"object\",\"fields\":{\"BLOCKING A\":{\"label\":\"BLOCKING A\",\"type\":\"select\",\"multiple\":true,\"sort\":false,\"removeDefaultNone\":true,\"dataSource\":\"matchedVariablesbyRoles.X1\"},\"BLOCKING B\":{\"label\":\"BLOCKING B\",\"type\":\"select\",\"sort\":false,\"removeDefaultNone\":true,\"dataSource\":\"matchedVariablesbyRoles.X2\"}}},\"SORTED NEIGHBORHOOD\":{\"type\":\"object\",\"fields\":{\"SORTING A\":{\"label\":\"SORTING KEY A\",\"type\":\"select\",\"sort\":false,\"multiple\":true,\"removeDefaultNone\":true,\"dataSource\":\"matchedVariablesbyRoles.X1\"},\"SORTING B\":{\"label\":\"SORTING KEY B\",\"type\":\"select\",\"sort\":false,\"removeDefaultNone\":true,\"dataSource\":\"matchedVariablesbyRoles.X2\"}}},\"SIMHASH\":{\"type\":\"object\",\"fields\":{\"SHINGLING A\":{\"label\":\"SHINGLING KEY A\",\"type\":\"select\",\"sort\":false,\"multiple\":true,\"removeDefaultNone\":true,\"dataSource\":\"matchedVariablesbyRoles.X1\"},\"SHINGLING B\":{\"label\":\"SHINGLING KEY B\",\"type\":\"select\",\"sort\":false,\"removeDefaultNone\":true,\"dataSource\":\"matchedVariablesbyRoles.X2\"},\"HDTHRESHOLD\":{\"label\":\"HAMMING DISTANCE THRESHOLD\",\"type\":\"select\",\"removeDefaultNone\":true,\"dataSource\":[\"30\",\"35\",\"40\",\"45\",\"50\"]},\"ROTATIONS\":{\"label\":\"NUMBER OF ROTATIONS\",\"type\":\"select\",\"removeDefaultNone\":true,\"dataSource\":[\" 4\",\" 8\",\"16\",\"32\"]}}}}},\"postRender\":\"reduction\"}'),(21,'INDEXES MATCHED','INDEXES MATCHED',NULL,NULL),(30,'P','MATCH FREQUENCY IN SEARCH SPACE',NULL,'{\"data\":[],\"schema\":{\"name\":\"P\",\"type\":\"number\", \"minimum\": 0.000001,\"maximum\": 1}}'),(101,'MODEL','DATA MODEL',NULL,'{ \"data\": [], \"schema\": { \"type\": \"array\", \"items\": { \"type\": \"object\", \"properties\": { \"layer\": { \"title\": \"Layer\", \"type\": \"string\" }, \"N\": { \"title\": \"N\", \"type\": \"number\" }, \"is.conv\": { \"title\": \"conv\", \"type\": \"boolean\" }, \"lambda\": { \"title\": \"lambda\", \"type\": \"number\" }, \"w\": { \"title\": \"w\", \"type\": \"number\" }, \"B\": { \"title\": \"B\", \"type\": \"string\" }, \"bic_norm\": { \"title\": \"bic_norm\", \"type\": \"string\" }, \"bic_mix\": { \"title\": \"bic_mix\", \"type\": \"string\" }, \"aic_norm\": { \"title\": \"aic_norm\", \"type\": \"string\" }, \"aic_mix\": { \"title\": \"aic_mix\", \"type\": \"string\" }, \"sigma\": { \"title\": \"sigma\", \"type\": \"number\" } } } }, \"options\": { \"type\": \"table\", \"showActionsColumn\": false }}'),(102,'INPUT_PARAMETERS','INPUT PARAMETERS',NULL,'{\"data\": [],\"schema\": { \"properties\": {\"graph\": {\"required\": true,\"title\": \"Graph\",\"description\": \"Activates graphic output\",\"type\": \"number\",\"default\": 0,\"minimum\": 0.01,\"maximum\": 10},\"model\": {\"required\": true,\"title\": \"Model\",\"description\": \"Data Distribution: LN lognormal / N Normal\",\"default\": \"LN\"},\"tot\": {\"title\": \"Tot\",\"description\": \"Estimates of originals vector for the target variables\"},\"t.sel\": {\"title\": \"t.sel\",\"description\": \"Optional vector of threshold values for selective edinting on the target variables\"},\"t.outl\": {\"required\": true,\"title\": \"t.outl\",\"description\": \"Threshold value for posterior probabilities of identifying outliers\",\"type\": \"number\",\"default\": 0.05,\"minimum\": 0.01,\"maximum\": 10},\"eps\": {\"required\": true,\"title\": \"eps\",\"description\": \"Tolerance for the log-likelihood convergence\",\"type\": \"number\",\"default\": 0.0000001,\"minimum\": 0.0000001,\"maximum\": 1},\"lambda.fix\": {\"required\": true,\"title\": \"lambda.fix\",\"description\": \"TRUE if w is known\",\"type\": \"number\",\"default\": 0,\"maximum\": 1 },\"w.fix\": {\"required\": true,\"title\": \"w.fix\",\"description\": \"TRUE if w is known\",\"type\": \"number\",\"default\": 0,\"minimum\": 0.01,\"maximum\": 1}},\"type\": \"object\" }}'),(103,'OUTPUT_PARAMETERS','OUTPUT PARAMETERS - INFO REPORT',NULL,NULL);
/*!40000 ALTER TABLE `csm_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_process_design`
--

DROP TABLE IF EXISTS `csm_process_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_process_design` (
  `process_design_id` int NOT NULL,
  `step` int NOT NULL,
  `type` int NOT NULL,
  `csm_information_object_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_csm_process_design_csm_process_step1_idx` (`step`),
  KEY `fk_csm_process_design_csm_design_type1_idx` (`type`),
  KEY `fk_csm_process_design_csm_information_object1_idx` (`csm_information_object_id`),
  KEY `fk_process_design_descr_idx` (`process_design_id`),
  CONSTRAINT `fk_csm_process_design_csm_design_type1` FOREIGN KEY (`type`) REFERENCES `cls_design_type` (`id`),
  CONSTRAINT `fk_csm_process_design_csm_information_object1` FOREIGN KEY (`csm_information_object_id`) REFERENCES `csm_information_object` (`id`),
  CONSTRAINT `fk_csm_process_design_csm_process_step1` FOREIGN KEY (`step`) REFERENCES `csm_process_step` (`ID`),
  CONSTRAINT `fk_link_process_design_description` FOREIGN KEY (`process_design_id`) REFERENCES `csm_process_design_description` (`id`),
  CONSTRAINT `fk_process_design_descr` FOREIGN KEY (`process_design_id`) REFERENCES `csm_process_design_description` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=674 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_process_design`
--

LOCK TABLES `csm_process_design` WRITE;
/*!40000 ALTER TABLE `csm_process_design` DISABLE KEYS */;
INSERT INTO `csm_process_design` VALUES (275351,351,3,254,1),(281351,351,3,254,2),(295351,351,3,254,3),(290351,351,3,242,4),(290351,351,3,237,5),(284351,351,3,223,6),(292361,361,1,61,7),(278351,351,3,215,8),(283351,351,3,211,9),(286361,361,1,48,10),(283351,351,3,210,11),(278361,361,2,32,12),(278361,361,1,31,13),(283351,351,3,209,14),(278361,361,1,20,15),(283351,351,3,208,16),(280362,362,3,222,17),(282351,351,3,207,18),(279362,362,3,222,19),(282351,351,3,206,20),(280362,362,3,203,21),(275351,351,3,204,22),(279362,362,3,203,23),(281351,351,3,204,24),(295351,351,3,204,25),(279362,362,2,128,26),(276351,351,3,190,27),(276351,351,3,189,28),(275351,351,3,185,29),(281351,351,3,185,30),(279362,362,1,41,31),(295351,351,3,185,32),(281363,363,3,205,33),(281363,363,2,110,34),(295351,351,2,164,35),(281363,363,1,23,36),(295351,351,2,163,37),(281364,364,3,207,38),(290351,351,2,150,39),(281364,364,3,206,40),(290351,351,2,149,41),(281364,364,2,111,42),(290351,351,2,148,43),(290351,351,2,145,44),(281364,364,1,24,45),(284351,351,2,130,46),(278365,365,3,214,47),(284351,351,2,129,48),(278365,365,3,213,49),(278351,351,2,121,50),(278365,365,2,119,51),(283351,351,2,116,52),(278365,365,1,118,53),(278365,365,1,32,54),(291366,366,3,246,55),(290366,366,3,241,56),(290366,366,3,240,57),(278366,366,3,214,58),(283351,351,2,113,59),(278366,366,3,213,60),(282351,351,2,112,61),(291366,366,2,154,62),(281351,351,2,109,63),(290366,366,2,150,64),(275351,351,2,105,65),(290366,366,2,148,66),(276351,351,2,97,67),(278366,366,2,120,68),(276351,351,2,95,69),(290366,366,1,68,70),(275351,351,2,93,71),(291366,366,1,67,72),(275351,351,2,90,73),(290366,366,1,65,74),(275351,351,2,88,75),(290366,366,1,63,76),(295351,351,1,74,77),(290366,366,1,61,78),(295351,351,1,73,79),(278366,366,1,33,80),(290351,351,1,64,81),(278367,367,3,217,82),(278367,367,3,216,83),(290351,351,1,62,84),(278367,367,3,200,85),(290351,351,1,58,86),(278367,367,3,195,87),(284351,351,1,43,88),(278367,367,3,193,89),(284351,351,1,42,90),(278367,367,3,192,91),(278351,351,1,34,92),(278367,367,2,123,93),(283351,351,1,29,94),(278367,367,1,122,95),(283351,351,1,26,96),(278367,367,1,36,97),(282351,351,1,25,98),(278368,368,3,220,99),(281351,351,1,22,100),(278368,368,3,218,101),(278368,368,2,124,102),(275351,351,1,18,103),(278368,368,1,37,104),(279369,369,3,219,105),(276351,351,1,10,106),(276351,351,1,8,107),(279369,369,3,201,108),(275351,351,1,6,109),(279369,369,3,196,110),(275351,351,1,3,111),(279369,369,2,125,112),(275351,351,1,1,113),(279369,369,2,39,114),(279369,369,1,38,115),(279352,352,3,219,116),(279370,370,3,220,117),(279352,352,3,202,118),(279370,370,3,218,119),(279352,352,3,201,120),(279370,370,2,126,121),(275352,352,3,197,122),(279370,370,1,125,123),(279352,352,3,196,124),(279370,370,1,39,125),(275352,352,3,186,126),(279371,371,3,221,127),(275352,352,2,106,128),(279371,371,2,127,129),(279371,371,1,40,130),(275352,352,2,89,131),(275352,352,1,19,132),(284372,372,3,225,133),(275352,352,1,2,134),(284372,372,2,132,135),(284353,353,3,224,136),(284372,372,2,46,137),(278353,353,3,217,138),(284372,372,1,45,139),(278353,353,3,216,140),(286373,373,3,229,141),(283353,353,3,212,142),(283353,353,3,210,143),(283353,353,3,209,144),(283353,353,3,208,145),(278353,353,3,200,146),(278353,353,3,195,147),(278353,353,3,193,148),(285373,373,3,226,149),(278353,353,3,192,150),(286373,373,2,136,151),(275353,353,3,187,152),(285373,373,2,133,153),(284353,353,2,131,154),(285373,373,1,132,155),(278353,353,2,122,156),(286373,373,1,49,157),(283353,353,2,117,158),(285373,373,1,46,159),(283353,353,2,114,160),(288374,374,3,233,161),(276353,353,2,96,162),(286374,374,3,230,163),(285374,374,3,227,164),(288374,374,2,141,165),(287374,374,2,140,166),(286374,374,2,137,167),(285374,374,2,134,168),(288374,374,1,54,169),(275353,353,2,91,170),(287374,374,1,53,171),(284353,353,1,44,172),(286374,374,1,50,173),(285374,374,1,47,174),(278353,353,2,36,175),(287375,375,3,236,176),(289375,375,3,235,177),(287375,375,3,231,178),(289375,375,2,143,179),(287375,375,2,138,180),(289375,375,1,57,181),(289375,375,1,56,182),(289375,375,1,55,183),(287375,375,1,51,184),(287376,376,3,232,185),(287376,376,2,139,186),(278353,353,1,35,187),(287376,376,1,52,188),(283353,353,1,30,189),(289377,377,3,234,190),(283353,353,1,27,191),(289377,377,2,142,192),(276353,353,1,9,193),(289377,377,1,57,194),(275353,353,2,5,195),(289377,377,1,56,196),(289377,377,1,55,197),(275353,353,1,4,198),(289378,378,3,236,199),(283354,354,3,210,200),(289378,378,3,231,201),(283354,354,3,209,202),(289378,378,2,144,203),(289378,378,1,57,204),(289378,378,1,56,205),(289378,378,1,55,206),(283354,354,3,208,207),(290379,379,3,239,208),(290379,379,3,238,209),(275354,354,3,188,210),(290379,379,2,147,211),(283354,354,2,115,212),(290379,379,2,146,213),(276354,354,2,102,214),(290379,379,1,60,215),(275354,354,2,94,216),(290379,379,1,59,217),(275354,354,2,92,218),(293380,380,3,250,219),(275354,354,1,91,220),(293380,380,2,159,221),(293380,380,1,70,222),(283354,354,1,28,223),(294381,381,3,251,224),(276354,354,1,15,225),(294382,382,3,252,226),(275354,354,1,7,227),(294382,382,3,244,228),(275354,354,1,5,229),(294382,382,2,161,230),(276355,355,3,191,231),(294382,382,2,160,232),(276355,355,2,98,233),(294382,382,1,71,234),(276355,355,1,11,235),(294383,383,3,253,236),(276356,356,3,217,237),(294383,383,2,162,238),(276356,356,3,216,239),(294383,383,1,72,240),(276356,356,3,200,241),(276356,356,3,195,242),(276356,356,3,193,243),(276356,356,3,192,244),(276356,356,2,99,245),(276356,356,1,12,246),(276357,357,3,217,247),(276357,357,3,216,248),(276357,357,3,200,249),(276357,357,3,195,250),(276357,357,3,193,251),(276357,357,3,192,252),(276357,357,2,100,253),(276357,357,1,13,254),(276358,358,3,199,255),(278358,358,3,199,256),(276358,358,3,194,257),(278358,358,3,194,258),(276358,358,2,101,259),(276358,358,1,14,260),(276359,359,3,217,261),(278359,359,3,217,262),(276359,359,3,216,263),(278359,359,3,216,264),(276359,359,3,200,265),(278359,359,3,200,266),(276359,359,3,195,267),(278359,359,3,195,268),(276359,359,3,193,269),(278359,359,3,193,270),(276359,359,3,192,271),(278359,359,3,192,272),(276359,359,2,108,273),(278359,359,2,108,274),(276359,359,2,103,275),(278359,359,2,103,276),(278359,359,1,21,277),(276359,359,1,16,278),(277360,360,3,219,279),(277360,360,3,201,280),(277360,360,3,196,281),(277360,360,2,104,282),(277360,360,1,17,283),(291361,361,3,252,284),(292361,361,3,249,285),(292361,361,3,248,286),(292361,361,3,247,287),(291361,361,3,245,288),(291361,361,3,244,289),(291361,361,3,243,290),(286361,361,3,228,291),(278361,361,3,198,292),(292361,361,2,158,293),(292361,361,2,157,294),(292361,361,1,156,295),(292361,361,2,156,296),(292361,361,2,155,297),(291361,361,2,153,298),(291361,361,2,152,299),(291361,361,2,151,300),(286361,361,2,135,301),(278361,361,2,118,302),(278361,361,2,107,303),(292361,361,1,69,304),(292361,361,2,69,305),(291361,361,1,68,306),(292361,361,1,68,307),(291361,361,1,66,308),(291361,361,1,65,309),(292361,361,1,65,310),(291361,361,1,61,311),(296384,384,2,171,312),(296384,384,2,169,313),(296384,384,2,168,314),(296384,384,2,167,315),(296384,384,2,166,316),(296384,384,2,165,317),(296384,384,1,81,318),(296384,384,1,80,319),(296384,384,1,78,320),(296384,384,1,77,321),(296384,384,1,76,322),(296384,384,1,75,323),(296385,385,3,255,324),(296385,385,2,171,325),(296385,385,2,169,326),(296385,385,2,168,327),(296385,385,2,167,328),(296385,385,2,166,329),(296385,385,2,165,330),(296385,385,1,81,331),(296385,385,1,80,332),(296385,385,1,78,333),(296385,385,1,77,334),(296385,385,1,76,335),(296385,385,1,75,336),(296386,386,3,256,337),(296386,386,2,171,338),(296386,386,2,169,339),(296386,386,2,168,340),(296386,386,2,167,341),(296386,386,2,166,342),(296386,386,2,165,343),(296386,386,1,81,344),(296386,386,1,80,345),(296386,386,1,78,346),(296386,386,1,77,347),(296386,386,1,76,348),(296386,386,1,75,349),(296387,387,2,171,350),(296387,387,2,169,351),(296387,387,2,168,352),(296387,387,2,167,353),(296387,387,2,166,354),(296387,387,2,165,355),(296387,387,1,81,356),(296387,387,1,80,357),(296387,387,1,78,358),(296387,387,1,77,359),(296387,387,1,76,360),(296387,387,1,75,361),(296388,388,2,171,362),(296388,388,2,169,363),(296388,388,2,168,364),(296388,388,2,167,365),(296388,388,2,166,366),(296388,388,2,165,367),(296388,388,1,79,368),(296389,389,2,170,369),(296389,389,1,81,370),(296389,389,1,80,371),(296389,389,1,78,372),(296389,389,1,77,373),(296389,389,1,76,374),(296389,389,1,75,375),(296390,390,3,257,376),(296390,390,2,171,377),(296390,390,2,169,378),(296390,390,2,168,379),(296390,390,2,167,380),(296390,390,2,166,381),(296390,390,2,165,382),(296390,390,1,81,383),(296390,390,1,80,384),(296390,390,1,78,385),(296390,390,1,77,386),(296390,390,1,76,387),(296390,390,1,75,388),(297391,391,3,258,389),(297391,391,1,176,390),(297391,391,1,175,391),(297391,391,1,174,392),(297391,391,1,173,393),(297391,391,2,172,394),(297391,391,1,83,395),(297391,391,1,82,396),(297392,392,3,259,397),(297392,392,2,176,398),(297392,392,2,175,399),(297392,392,2,174,400),(297392,392,2,173,401),(297392,392,2,83,402),(297392,392,2,82,403),(297393,393,3,260,404),(297393,393,2,176,405),(297393,393,2,175,406),(297393,393,2,174,407),(297393,393,2,173,408),(297393,393,2,83,409),(297393,393,2,82,410),(297394,394,3,261,411),(297394,394,2,176,412),(297394,394,2,175,413),(297394,394,2,174,414),(297394,394,2,173,415),(297394,394,2,83,416),(297394,394,2,82,417),(297395,395,3,262,418),(297395,395,2,176,419),(297395,395,2,175,420),(297395,395,2,174,421),(297395,395,2,173,422),(297395,395,2,83,423),(297395,395,2,82,424),(298397,397,2,177,425),(298397,397,1,176,426),(298397,397,1,175,427),(298397,397,1,174,428),(298397,397,1,173,429),(298397,397,1,83,430),(298397,397,1,82,431),(298398,398,3,264,432),(298398,398,3,263,433),(298399,399,3,264,434),(298399,399,3,263,435),(298400,400,3,265,436),(298401,401,3,266,437),(298402,402,3,267,438),(298403,403,3,268,439),(299404,404,2,178,440),(299404,404,1,84,441),(300421,421,2,180,442),(300421,421,2,179,443),(300421,421,1,85,444),(300422,422,3,269,445),(300422,422,2,180,446),(300422,422,2,179,447),(300423,423,2,181,448),(300424,424,3,270,449),(300424,424,2,182,450),(301425,425,2,183,451),(301425,425,1,86,452),(302426,426,2,184,453),(302426,426,1,87,454),(110100,100,1,402,484),(110100,100,1,403,485),(110100,100,2,412,486),(110100,100,2,404,487),(110100,100,2,405,488),(120150,150,1,402,489),(120150,150,1,403,490),(120150,150,2,412,491),(120150,150,2,404,492),(120150,150,2,405,493),(120150,150,1,410,494),(130200,200,1,402,495),(130200,200,1,403,496),(130200,200,1,412,497),(130200,200,2,404,498),(130200,200,2,405,499),(140250,250,1,402,500),(140250,250,1,403,501),(140250,250,1,412,502),(140250,250,2,404,503),(140250,250,2,405,504),(140250,250,1,410,505),(150300,300,1,402,506),(150300,300,1,404,507),(150300,300,2,407,508),(160350,350,1,402,509),(160350,350,1,404,510),(160350,350,2,407,511),(160350,350,1,410,512),(180011,70,1,502,638),(180011,70,1,503,639),(180011,70,2,513,640),(180011,70,2,504,641),(180011,70,2,505,642),(180012,71,1,502,643),(180012,71,1,503,644),(180012,71,2,513,645),(180012,71,2,504,646),(180012,71,2,505,647),(180012,71,1,510,648),(180013,72,1,502,649),(180013,72,1,503,650),(180013,72,1,513,651),(180013,72,2,504,652),(180013,72,2,505,653),(180014,77,1,502,654),(180014,77,1,503,655),(180014,77,1,513,656),(180014,77,2,504,657),(180014,77,2,505,658),(180014,77,1,510,659),(180020,78,1,502,660),(180020,78,1,504,661),(180020,78,2,507,662);
/*!40000 ALTER TABLE `csm_process_design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_process_design_description`
--

DROP TABLE IF EXISTS `csm_process_design_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_process_design_description` (
  `id` int NOT NULL,
  `descr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_process_design_description`
--

LOCK TABLES `csm_process_design_description` WRITE;
/*!40000 ALTER TABLE `csm_process_design_description` DISABLE KEYS */;
INSERT INTO `csm_process_design_description` VALUES (110100,'Prediction and model estimation - Information Object list'),(120150,'Prediction and model estimation - Information Object list and strata'),(130200,'Outiler search - Information Object list'),(140250,'Outiler search - Information Object list with strata'),(150300,'Selective Editing - Information Object list'),(160350,'Selective Editing - Information Object list with strata'),(180011,'probabilisticContingencyTable'),(180012,'fellegisunter'),(180013,'probabilisticResultTablesByIndex'),(180014,'reducedResultTablesGreedy'),(180015,'createResiduals'),(180020,'deterministicResultTablesByIndex'),(180021,'mufrommarginals'),(180022,'mufrommarginals2'),(275351,NULL),(275352,NULL),(275353,NULL),(275354,NULL),(276351,NULL),(276353,NULL),(276354,NULL),(276355,NULL),(276356,NULL),(276357,NULL),(276358,NULL),(276359,NULL),(277360,NULL),(278351,NULL),(278353,NULL),(278358,NULL),(278359,NULL),(278361,NULL),(278365,NULL),(278366,NULL),(278367,NULL),(278368,NULL),(279352,NULL),(279362,NULL),(279369,NULL),(279370,NULL),(279371,NULL),(280362,NULL),(281351,NULL),(281363,NULL),(281364,NULL),(282351,NULL),(283351,NULL),(283353,NULL),(283354,NULL),(284351,NULL),(284353,NULL),(284372,NULL),(285373,NULL),(285374,NULL),(286361,NULL),(286373,NULL),(286374,NULL),(287374,NULL),(287375,NULL),(287376,NULL),(288374,NULL),(289375,NULL),(289377,NULL),(289378,NULL),(290351,NULL),(290366,NULL),(290379,NULL),(291361,NULL),(291366,NULL),(292361,NULL),(293380,NULL),(294381,NULL),(294382,NULL),(294383,NULL),(295351,NULL),(296384,NULL),(296385,NULL),(296386,NULL),(296387,NULL),(296388,NULL),(296389,NULL),(296390,NULL),(297391,NULL),(297392,NULL),(297393,NULL),(297394,NULL),(297395,NULL),(298397,NULL),(298398,NULL),(298399,NULL),(298400,NULL),(298401,NULL),(298402,NULL),(298403,NULL),(299404,NULL),(300421,NULL),(300422,NULL),(300423,NULL),(300424,NULL),(301425,NULL),(302426,NULL);
/*!40000 ALTER TABLE `csm_process_design_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_process_step`
--

DROP TABLE IF EXISTS `csm_process_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_process_step` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABEL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BUSINESS_SERVICE_ID` int NOT NULL,
  `SUBSTEP` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_process_step_business_service` (`BUSINESS_SERVICE_ID`),
  KEY `fk_csm_ITERATE_process_step` (`SUBSTEP`),
  CONSTRAINT `fk_csm_ITERATE_process_step` FOREIGN KEY (`SUBSTEP`) REFERENCES `csm_process_step` (`ID`),
  CONSTRAINT `fk_csm_process_step_business_service` FOREIGN KEY (`BUSINESS_SERVICE_ID`) REFERENCES `csm_business_service` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_process_step`
--

LOCK TABLES `csm_process_step` WRITE;
/*!40000 ALTER TABLE `csm_process_step` DISABLE KEYS */;
INSERT INTO `csm_process_step` VALUES (70,'Contingency Table','CONTINGENCY_TABLE','Calculate contingency table',200,NULL),(71,'Fellegi Sunter','FELLEGI_SUNTER','Fellegi Sunter algorithm',200,NULL),(72,'Matching Table','MATCHING_TABLE','Matching records',200,NULL),(76,'Deterministic Matching Table','DETERMINISTIC_MATCHING_TABLE','Deterministic Matching records',200,NULL),(77,'Matching constraint (optional)','MATCHING_TABLE_REDUCED','Constraint apply on matches',200,NULL),(78,'Residuals (optional)','RESIDUALS','Create residuals (not matched)',200,NULL),(80,'Read Marginals','FELLEGI_SUNTER','Read Marginal probabilities',200,NULL),(100,'Model Estimates and prediction','Model Estimates and prediction','This function performs the maximum likelihood estimates of the parameters of a contamination model by ECM algorithm and it provides the expected values of the true data for all units that were used for the estimation',100,NULL),(150,'Model Estimates and prediction with strata','Model Estimates and prediction with strata','This function performs the maximum likelihood estimates of the parameters of a contamination model by ECM algorithm and it provides the expected values of the true data for all units that were used for the estimation',100,NULL),(200,'Outlier prediction','Outlier prediction','On the basis of a set of contamination model parameters, and a set of observed data, it calculates the expected values of the corresponding real data. Missing values for the variables response as well as are allowed, but not for covariates',100,NULL),(250,'Outlier prediction with strata ','Outlier prediction with strata','On the basis of a set of contamination model parameters, and a set of observed data, it calculates the expected values of the corresponding real data. Missing values for the variables response as well as are allowed, but not for covariates',100,NULL),(300,'Selective Editing','Selective Editing','This function performs Selective Editing. On the basis of a set of observed data and the corresponding predictions for the true data, it selects the units required for interactive editing',100,NULL),(350,'Selective Editing with strata','Selective Editing with strata','This function performs Selective Editing. On the basis of a set of observed data and the corresponding predictions for the true data, it selects the units required for interactive editing',100,NULL),(351,'lettura dati',NULL,NULL,999,NULL),(352,'selezione unità',NULL,NULL,999,NULL),(353,'integrazione dati',NULL,NULL,999,NULL),(354,'aggiornamento lista',NULL,NULL,999,NULL),(355,'analisi  dati',NULL,NULL,999,NULL),(356,'identificazioni unità influenti',NULL,NULL,999,NULL),(357,'identificazione unità ininfluenti',NULL,NULL,999,NULL),(358,'stratificazione',NULL,NULL,999,NULL),(359,'determinazione numerosità campionaria',NULL,NULL,999,NULL),(360,'identificazione unità campionarie',NULL,NULL,999,NULL),(361,'analisi dati',NULL,NULL,999,NULL),(362,'Calcolo pesi diretti',NULL,NULL,999,NULL),(363,'preprazione dati',NULL,NULL,999,NULL),(364,'preprazione lista unità primarie',NULL,NULL,999,NULL),(365,'stratificazione 1',NULL,NULL,999,NULL),(366,'Aggregazione ',NULL,NULL,999,NULL),(367,'allocazione',NULL,NULL,999,NULL),(368,'stratificazione 2',NULL,NULL,999,NULL),(369,'selezione ',NULL,NULL,999,NULL),(370,'assegnazione',NULL,NULL,999,NULL),(371,'suddivisione temporale delle interviste',NULL,NULL,999,NULL),(372,'aggiornamento unità rispondenti',NULL,NULL,999,NULL),(373,' identificazione unità errate',NULL,NULL,999,NULL),(374,'correzione dati',NULL,NULL,999,NULL),(375,'identificazione unità errate',NULL,NULL,999,NULL),(376,'identificazione variabili errate',NULL,NULL,999,NULL),(377,'macro-editing',NULL,NULL,999,NULL),(378,'micro-editing: identificazione unità errate',NULL,NULL,999,NULL),(379,'identificazione ',NULL,NULL,999,NULL),(380,'Calcolo Stime',NULL,NULL,999,NULL),(381,'valutazione modello',NULL,NULL,999,NULL),(382,'analisi distribuzioni',NULL,NULL,999,NULL),(383,'analisi spaziale',NULL,NULL,999,NULL),(384,'Completezza',NULL,NULL,999,NULL),(385,'Accuratezza',NULL,NULL,999,NULL),(386,'Consistenza',NULL,NULL,999,NULL),(387,'Entropia',NULL,NULL,999,NULL),(388,'Correlazione tra variabili',NULL,NULL,999,NULL),(389,'Categorie',NULL,NULL,999,NULL),(390,'Adeguatezza al bloccaggio',NULL,NULL,999,NULL),(391,'Lista dei valori inaccurati',NULL,NULL,999,NULL),(392,'Standardizzazione',NULL,NULL,999,NULL),(393,'Fusione',NULL,NULL,999,NULL),(394,'Separazione',NULL,NULL,999,NULL),(395,'Risoluzione degli errori',NULL,NULL,999,NULL),(396,'Riconciliazione degli schemi',NULL,NULL,999,NULL),(397,'Prodotto cartesiano',NULL,NULL,999,NULL),(398,'Bloccaggio',NULL,NULL,999,NULL),(399,'Unione di bloccaggi',NULL,NULL,999,NULL),(400,'Vicini ordinati',NULL,NULL,999,NULL),(401,'Bloccaggio innestato',NULL,NULL,999,NULL),(402,'SimHash',NULL,NULL,999,NULL),(403,'SimHash bloccato',NULL,NULL,999,NULL),(404,'Uguaglianza',NULL,NULL,999,NULL),(405,'Somiglianza di Levensthein',NULL,NULL,999,NULL),(406,'Somiglianza di Jaro',NULL,NULL,999,NULL),(407,'Somiglianza di Jaro-Winkler',NULL,NULL,999,NULL),(408,'Somiglianza Soundex',NULL,NULL,999,NULL),(409,'Somiglianza Q-Grams',NULL,NULL,999,NULL),(410,'Somiglianza inclusion 3-Grams',NULL,NULL,999,NULL),(411,'Somiglianza 3-Grams pesata',NULL,NULL,999,NULL),(412,'Somiglianza SimHash',NULL,NULL,999,NULL),(413,'Somiglianza numerica',NULL,NULL,999,NULL),(414,'Somiglianza uguaglianza con tolleranza',NULL,NULL,999,NULL),(415,'Somiglianza di Dice',NULL,NULL,999,NULL),(416,'Somiglianza Full Damerau-Levenshtein',NULL,NULL,999,NULL),(417,'Somiglianza Hamming',NULL,NULL,999,NULL),(418,'Somiglianza per maggior sottostringa comune',NULL,NULL,999,NULL),(419,'Distanza coseno tra profili Q-Grams',NULL,NULL,999,NULL),(420,'Distanza di Jaccard tra profili Q-Grams',NULL,NULL,999,NULL),(421,'Deterministico esatto',NULL,NULL,999,NULL),(422,'Deterministico basato su regola',NULL,NULL,999,NULL),(423,'Probabilistico di Fellegi-Sunter',NULL,NULL,999,NULL),(424,'Probabilistico da Marginali',NULL,NULL,999,NULL),(425,'Abbinamento dei record',NULL,NULL,999,NULL),(426,'Riduzione Ottima',NULL,NULL,999,NULL),(427,'Riduzione metodo di Karmarcar',NULL,NULL,999,NULL),(428,'Riduzione greedy',NULL,NULL,999,NULL);
/*!40000 ALTER TABLE `csm_process_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_rule`
--

DROP TABLE IF EXISTS `csm_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_rule` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CODE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BLOCKING` int DEFAULT NULL,
  `ERROR_CODE` int DEFAULT NULL,
  `ACTIVE` int DEFAULT NULL,
  `RULE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VARIABLE_ID` int DEFAULT NULL,
  `CLS_RULE_ID` int NOT NULL,
  `RULESET_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_rule_cls_rule` (`CLS_RULE_ID`),
  KEY `fk_rule_ruleset` (`RULESET_ID`),
  CONSTRAINT `fk_rule_cls_rule` FOREIGN KEY (`CLS_RULE_ID`) REFERENCES `csm_cls_rule` (`ID`),
  CONSTRAINT `fk_rule_ruleset` FOREIGN KEY (`RULESET_ID`) REFERENCES `csm_ruleset` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_rule`
--

LOCK TABLES `csm_rule` WRITE;
/*!40000 ALTER TABLE `csm_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `csm_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_ruleset`
--

DROP TABLE IF EXISTS `csm_ruleset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_ruleset` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FILE_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `FILE_LABEL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `RULES_TOTAL` int DEFAULT NULL,
  `LAST_UPDATE` datetime DEFAULT NULL,
  `WORK_SESSION_ID` int NOT NULL,
  `DATASET_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_ruleset_work_session` (`WORK_SESSION_ID`),
  KEY `fk_ruleset_dataset` (`DATASET_ID`),
  CONSTRAINT `fk_ruleset_dataset` FOREIGN KEY (`DATASET_ID`) REFERENCES `csm_dataset_file` (`ID`),
  CONSTRAINT `fk_ruleset_work_session` FOREIGN KEY (`WORK_SESSION_ID`) REFERENCES `csm_work_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_ruleset`
--

LOCK TABLES `csm_ruleset` WRITE;
/*!40000 ALTER TABLE `csm_ruleset` DISABLE KEYS */;
/*!40000 ALTER TABLE `csm_ruleset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_software_procedure`
--

DROP TABLE IF EXISTS `csm_software_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_software_procedure` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Language` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Dependencies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Technical_Requirements` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Workflow` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Download` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_csm_software_procedure_csm_methodological_tool1` FOREIGN KEY (`ID`) REFERENCES `csm_methodological_tool` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_software_procedure`
--

LOCK TABLES `csm_software_procedure` WRITE;
/*!40000 ALTER TABLE `csm_software_procedure` DISABLE KEYS */;
/*!40000 ALTER TABLE `csm_software_procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_statistical_method`
--

DROP TABLE IF EXISTS `csm_statistical_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_statistical_method` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Requirements` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Assumptions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Constraints` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Release_date` datetime DEFAULT NULL,
  `Standard_Istat` tinyint DEFAULT NULL,
  `Tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Version` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Last_Update` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_statistical_method`
--

LOCK TABLES `csm_statistical_method` WRITE;
/*!40000 ALTER TABLE `csm_statistical_method` DISABLE KEYS */;
INSERT INTO `csm_statistical_method` VALUES (100,'Selemix','Selective Editing via Mixture Models','s',NULL,NULL,'https://www.istat.it/it/metodi-e-strumenti/metodi-e-strumenti-it/elaborazione/strumenti-di-elaborazione/selemix','2022-06-09 00:00:00',1,'dd',NULL,'2022-06-08'),(200,'Fellegi Sunter','Probabilistic Record Linkage',NULL,NULL,NULL,'https://ec.europa.eu/eurostat/cros/content/fellegi-sunter-and-jaro-approach-record-linkage-method_en',NULL,NULL,NULL,NULL,NULL),(201,'lettura dati (read, read.table, ecc)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(202,'Metodi di selezione',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(203,'lettura dati',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(204,'abbinamento tra fonti di dati',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(205,'implementazione regole di trasformazione',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(206,'unione file',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(207,'analisi della dipendenza ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(208,'implementazione algoritmo per la definizione eventuali strati take all',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(209,'implementazione algoritmo per la definizione eventuali strati take none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(210,'Implementazione tecniche di raggruppamento delle unità e caratterizzazione dei gruppi: medie e varianze di strato di variabili correlate alle variabili di interesse\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(211,'abbinamento per codice di strato',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(212,'implementazione algoritmo di allocazione (es: proporzionale, ottima, Bethel, multiway, …)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(213,'metodo di selezione',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(214,'metodi di selezione (if)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(215,'Implementazione tecniche di raggruppamento delle unità e caratterizzazione dei gruppi: medie e varianze di strato di variabili correlate alle variabili di interesse',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(216,'implementazione metodi di selezione',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(217,'metodo di selezione dei periodi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(218,'Calcolo del peso diretto',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(219,'implementazione regole deterministiche (IF THEN)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(220,'metodi di aggregazione (tablle, summary, ecc)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(221,' lettura dati e applicazione regole di trasformazione delle unità ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,'Link tra archivi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,'Individuazione variabili',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,'Assegnazione dello strato',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(225,'Aggregazione USS in UPS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(226,'Aquisizione stime e varianze',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(227,'Merge',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(228,'Algoritmo di allocazione',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(229,'Stratificazione delle UPS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230,'Selezione con probabilità uguali o proporzionali alla dimensione ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(231,'Calcolo numero di unità campione finali per UPS ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(232,'lettura dati (read , read.table, ecc.)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(233,'implementazione regoledi eleggibilità',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(234,'Analisi delle distribuzioni e dellle relazioni tra variabili ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(235,'implementazione della condizione di errore e relativa azione di correzione (if then)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(236,'Individuazione errori anomali e/o influenti',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(237,'correzione interattiva errori influenti; correzione valori anomali errati',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(238,'implementazione delle regole di (in)compatibilità',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(239,'set-covering problem (risoluzione di problemi di minima copertura)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(240,'imputazione',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(241,'analisi longitudinali, confronto con altre fonti; ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(242,'analisi di impatto e di influenza',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(243,'implementazione delle regole di (in)compatibilità esplicitate nei passi precedenti (if then)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(244,'lettura dati indagine (es. read, read.table ecc)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(245,'implementazione regole deterministiche: if - then',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(246,'Aggregazione pesata ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(247,'lettura dati archivio (es.read, read.table, ecc)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(248,'Aggregazione delle variabili esplicative per il dominio',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(249,'lettura file totali noti predisposti esternamente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(250,'Aggregazione pesata delle variabili di interesse per il dominio con il calcolo dei relativi coefficenti di varaizione',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(251,'Confronto tra cv indicati dai committenti con cv contenuti in Output5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(252,'Distribuzione per macroarea dei domini (ad esempio comuni per macroarea proviciale)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(253,'Distribuzione per macroarea (ridefinita) dei domini',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(254,'Regressioni per l\'individuazione del modello con il miglior fitting',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(255,'Individuazione della variabile da considerare come effetti casuali',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(256,'Individuazione della variabile peso campionario',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(257,'lancio della funzione R mind.unit ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(258,'Confronto tra stime dirette ed indirette',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(259,'lancio funzione diagnostic.R',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(260,'spatial analysis ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(261,'Calcolo indice sintetico',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(262,'Tutti i valori della variabile non conformi al formato previsto sono inseriti in una lista di valori inaccurati',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(263,'La nuova variabile si ottiene applicando alla vecchia alcune semplici operazioni di standardizzazione come il cambio dal case o la cancellazione di alcuni caratteri speciali',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(264,'La nuova variabile si ottiene concatenando i valori di due o più variabili',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(265,'Due nuove variabili si ottengono spezzando il valore di una variabile',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(266,'La nuova variabile si ottiene sostituendo i valori definiti errati nella lista di sipporto col corrispondente valore corretto',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(267,'Due variabili dei due dataset possono essere indicante come associate anche se hanno un  nome diverso',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(268,'Lo spazio di ricerca è composto da tutte le possibili coppie',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(269,'Lo spazio di ricerca è composto da tutte le coppie che hanno lo stesso valore sulle variabili di bloccaggio. Ogni modalità crea un blocco distinto',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(270,'Lo spazio di ricerca è composto da tutte le coppie che hanno lo stesso valore sulle variabili di bloccaggio. Viene creato un unico insieme',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(271,'Lo spazio di ricerca è composto da tutte le coppie che sono sufficientemente vicine (all\'interno di una stessa finestra) nell\'ordinameno',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(272,'Si considerano solo le coppie che hanno lo stesso valore sulle variabili di bloccaggio. All\'interno di ogni blocco si scelgono solo le coppie che sono sufficientemente vicine (all\'interno di una stessa finestra) nell\'ordinameno sulle variabili di ordinamento e queste compongono lo spazio di ricerca',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(273,'Per ogni record viene creata un\'impronta hash di lunghezza fissa che poi viene usata per ordinare i dataset. Per i record vicini vengono confrontate le impronte se la distanza di Hamming è inferiore alla soglia la coppia entra nello spazio di ricerca. L\'operazione si può replicare più volte permutando i bit dell\'impronta',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(274,'Si considerano solo le coppie che hanno lo stesso valore sulle variabili di bloccaggio. All\'interno di ogni blocco si applica poi il metodo SimHash per scegliere le coppie che compongono lo spazio di ricerca',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(275,'Confronto i record di ogni coppia su tutte le vatriabili di matching e associo la coppia ad un profilo che è un vettore di 0 e 1. Se nel posto i del vettore c\'è uno 0 vuol dire che la coppia è discordante sulla variabile i, se c\'è un 1 vuol dire che è concordante.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(276,'Il profilo dei match è solo quello con tutte le concordanze (vettore di tutti 1)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(277,'I profili dei match sono quelli che verificano la regola',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(278,'Prima si stimano le probabilita marginali delle singole variabili di matching in caso di concordanza (m1 e u1) e in caso di discordanza (m0 e u0). Ad ogni profilo viene associata una probabilita m e u queste si calcolano come il prodotto delle probabilita marginali m1 e u1 delle singole variabili che valgono 1 sul profilo e mo e u0 per le variabili che valgono 0 sul profilo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(279,'Ad ogni profilo viene associata una probabilita m e u queste si calcolano come il prodotto delle probabilita marginali m1 e u1 delle singole variabili che valgono 1 sul profilo e mo e u0 per le variabili che valgono 0 sul profilo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(280,'Crea le liste degli abbinamenti, delle coppie da revisionare (se presenti) e degli indicatori di qualità sull\'abbinamento',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(281,'Data la funzione F che ha come dominio le coppie di abbinati ed é definita come la somma delle probabilità a posteriori delle coppie, il metodo individua il sotto insieme di record della tabella degli abbinati che, verificando il vincolo di unicità 1 a 1, massimizza F',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(282,'Si crea la lista di record della tabella degli abbinati ordinata per probabilità a posteriori e la coppia sopravvive alla riduzione solo se non viola il vincolo di unicità 1 a 1 con le altre coppie sopravvisute',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `csm_statistical_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_statistical_program`
--

DROP TABLE IF EXISTS `csm_statistical_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_statistical_program` (
  `gsbpm` int NOT NULL,
  `process` int NOT NULL,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Descr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cycle` int DEFAULT NULL,
  PRIMARY KEY (`gsbpm`,`process`),
  KEY `fk_csm_gsbpm_process_has_csm_business_process_csm_business__idx` (`process`),
  KEY `fk_csm_gsbpm_process_has_csm_business_process_csm_gsbpm_pro_idx` (`gsbpm`),
  CONSTRAINT `fk_csm_gsbpm_process_has_csm_business_process_csm_business_pr1` FOREIGN KEY (`process`) REFERENCES `csm_business_process` (`ID`),
  CONSTRAINT `fk_csm_gsbpm_process_has_csm_business_process_csm_gsbpm_proce1` FOREIGN KEY (`gsbpm`) REFERENCES `csm_gsbpm_process` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_statistical_program`
--

LOCK TABLES `csm_statistical_program` WRITE;
/*!40000 ALTER TABLE `csm_statistical_program` DISABLE KEYS */;
/*!40000 ALTER TABLE `csm_statistical_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_statistical_service`
--

DROP TABLE IF EXISTS `csm_statistical_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_statistical_service` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Protocol` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Outcomes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Service_Dependencies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Restrictions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `GSBPM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Business_Function` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `process_design` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_csm_statistical_service_csm_methodological_tool1` FOREIGN KEY (`ID`) REFERENCES `csm_methodological_tool` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_statistical_service`
--

LOCK TABLES `csm_statistical_service` WRITE;
/*!40000 ALTER TABLE `csm_statistical_service` DISABLE KEYS */;
INSERT INTO `csm_statistical_service` VALUES (100,'http',NULL,NULL,NULL,NULL,'5.4',NULL,NULL);
/*!40000 ALTER TABLE `csm_statistical_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_step_instance`
--

DROP TABLE IF EXISTS `csm_step_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_step_instance` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `METHOD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `FUNCTIONALITY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `APP_SERVICE_ID` int NOT NULL,
  `STATMETHOD` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_step_instance_csm_app_service` (`APP_SERVICE_ID`),
  KEY `fk_csm_step_instance_csm_statistical_method1_idx1` (`STATMETHOD`),
  CONSTRAINT `fk_csm_step_instance_csm_app_service` FOREIGN KEY (`APP_SERVICE_ID`) REFERENCES `csm_app_service` (`ID`),
  CONSTRAINT `kk_stat_method_functionality` FOREIGN KEY (`STATMETHOD`) REFERENCES `csm_statistical_method` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_step_instance`
--

LOCK TABLES `csm_step_instance` WRITE;
/*!40000 ALTER TABLE `csm_step_instance` DISABLE KEYS */;
INSERT INTO `csm_step_instance` VALUES (1,'csm_mlest','This function performs the maximum likelihood estimates of the parameters of a contamination model by ECM algorithm and it provides the expected values of the data for all units that were used for the estimation','MLEST',100,100),(2,'csm_ypred','On the basis of a set of contamination model parameters, and a set of observed data, it calculates the expected values of the corresponding real data. Missing values for the variables response as well as are allowed, but not for covariates','PREDY',100,100),(3,'csm_seledit','This function performs Selective Editing. On the basis of a set of observed data and the corresponding predictions for the true data, it selects the units required for interactive editing','SELEDIT',100,100),(11,'probabilisticContingencyTable','This function calculates the contingency Table','ContingencyTable',250,200),(12,'fellegisunter','This function implements the Fellegi Sunter algorithm','FellegiSunter',200,200),(13,'probabilisticResultTablesByIndex','This function calculates the Matching Table','MatchingTable',250,200),(14,'reducedResultTablesGreedy','This function implements the constraint on matches','MatchingTableReduced',250,200),(15,'createResiduals','This function calculates Residual Tables','Residuals',250,200),(20,'deterministicResultTablesByIndex','This function calculates the Matching Table with Deterministic Rule','MatchingTable',250,200),(21,'mufrommarginals','This function apply Fellegi Sunter model from read marginal probabilities','FellegiSunter',200,200);
/*!40000 ALTER TABLE `csm_step_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_step_instance_signature`
--

DROP TABLE IF EXISTS `csm_step_instance_signature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_step_instance_signature` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `REQUIRED` tinyint DEFAULT NULL,
  `APP_ROLE_ID` int NOT NULL,
  `STEP_INSTANCE_ID` int NOT NULL,
  `CLS_TYPE_IO_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_step_instance_signature_csm_app_role` (`APP_ROLE_ID`),
  KEY `fk_csm_step_instance_signature_csm_step_instance` (`STEP_INSTANCE_ID`),
  KEY `fk_csm_step_instance_signature_csm_type_io` (`CLS_TYPE_IO_ID`),
  CONSTRAINT `fk_csm_step_instance_signature_csm_app_role` FOREIGN KEY (`APP_ROLE_ID`) REFERENCES `csm_app_role` (`ID`),
  CONSTRAINT `fk_csm_step_instance_signature_csm_step_instance` FOREIGN KEY (`STEP_INSTANCE_ID`) REFERENCES `csm_step_instance` (`ID`),
  CONSTRAINT `fk_csm_step_instance_signature_csm_type_io` FOREIGN KEY (`CLS_TYPE_IO_ID`) REFERENCES `csm_cls_type_io` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_step_instance_signature`
--

LOCK TABLES `csm_step_instance_signature` WRITE;
/*!40000 ALTER TABLE `csm_step_instance_signature` DISABLE KEYS */;
INSERT INTO `csm_step_instance_signature` VALUES (1,1,102,1,1),(2,1,103,1,1),(3,1,105,1,2),(4,1,104,1,2),(5,1,110,1,1),(6,0,111,1,1),(7,1,112,1,2),(8,1,102,2,1),(9,1,103,2,1),(10,1,105,2,2),(11,1,104,2,2),(12,1,110,2,1),(13,1,111,2,1),(14,1,112,2,1),(15,1,102,3,1),(17,1,104,3,1),(18,1,110,3,1),(19,0,111,3,1),(20,1,107,3,2),(21,1,108,3,2),(22,1,113,3,2),(27,1,114,1,2),(28,1,114,2,2),(29,1,114,3,2),(55,0,115,1,2),(56,0,115,3,1),(154,1,2,11,1),(155,1,3,11,1),(156,1,20,11,1),(161,0,7,11,2),(162,0,21,11,2),(166,1,1,11,1),(167,1,4,12,1),(168,0,5,12,2),(169,1,2,13,1),(170,1,3,13,1),(171,1,5,13,1),(173,0,7,13,2),(175,1,21,13,1),(176,1,8,13,1),(177,1,9,13,1),(178,0,23,13,2),(179,0,10,13,2),(194,0,17,12,2),(195,1,7,14,1),(197,0,22,14,2),(200,0,4,20,1),(201,1,2,20,1),(202,1,3,20,1),(203,1,21,20,1),(204,0,7,20,2),(205,1,10,14,1),(207,0,24,14,2),(210,1,7,15,1),(211,0,22,15,1),(212,1,2,15,1),(213,1,3,15,1),(214,0,13,15,2),(215,0,14,15,2),(220,1,4,21,1),(221,1,26,21,1),(222,1,27,21,1),(223,1,28,21,1),(224,1,29,21,1),(225,1,30,21,1),(226,0,5,21,2),(227,0,17,21,2);
/*!40000 ALTER TABLE `csm_step_instance_signature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_step_runtime`
--

DROP TABLE IF EXISTS `csm_step_runtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_step_runtime` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ORDER_CODE` int DEFAULT NULL,
  `ROLE_GROUP` int DEFAULT NULL,
  `DATA_PROCESSING_ID` int NOT NULL,
  `WORKSET_ID` int NOT NULL,
  `APP_ROLE_ID` int NOT NULL,
  `CLS_DATA_TYPE_ID` int NOT NULL,
  `CLS_TYPE_IO_ID` int NOT NULL,
  `STEP_INSTANCE_SIGNATURE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_step_runtime_csm_data_processing` (`DATA_PROCESSING_ID`),
  KEY `fk_csm_step_runtime_csm_workset` (`WORKSET_ID`),
  KEY `fk_csm_step_runtime_csm_app_role` (`APP_ROLE_ID`),
  KEY `fk_csm_step_runtime_csm_data_type` (`CLS_DATA_TYPE_ID`),
  KEY `fk_csm_step_runtime_csm_type_io` (`CLS_TYPE_IO_ID`),
  KEY `fk_csm_step_runtime_csm_signature` (`STEP_INSTANCE_SIGNATURE_ID`),
  CONSTRAINT `fk_csm_step_runtime_csm_app_role` FOREIGN KEY (`APP_ROLE_ID`) REFERENCES `csm_app_role` (`ID`),
  CONSTRAINT `fk_csm_step_runtime_csm_data_processing` FOREIGN KEY (`DATA_PROCESSING_ID`) REFERENCES `csm_data_processing` (`ID`),
  CONSTRAINT `fk_csm_step_runtime_csm_data_type` FOREIGN KEY (`CLS_DATA_TYPE_ID`) REFERENCES `csm_cls_data_type` (`ID`),
  CONSTRAINT `fk_csm_step_runtime_csm_signature` FOREIGN KEY (`STEP_INSTANCE_SIGNATURE_ID`) REFERENCES `csm_step_instance_signature` (`ID`),
  CONSTRAINT `fk_csm_step_runtime_csm_type_io` FOREIGN KEY (`CLS_TYPE_IO_ID`) REFERENCES `csm_cls_type_io` (`ID`),
  CONSTRAINT `fk_csm_step_runtime_csm_workset` FOREIGN KEY (`WORKSET_ID`) REFERENCES `csm_workset` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_step_runtime`
--

LOCK TABLES `csm_step_runtime` WRITE;
/*!40000 ALTER TABLE `csm_step_runtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `csm_step_runtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_tool_gsbpm`
--

DROP TABLE IF EXISTS `csm_tool_gsbpm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_tool_gsbpm` (
  `tool` int DEFAULT NULL,
  `gsbpm` int DEFAULT NULL,
  KEY `fk_csm_tool_gsbpm_csm_methodological_tool1_idx` (`tool`),
  KEY `fk_csm_tool_gsbpm_csm_gsbpm_process1_idx` (`gsbpm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_tool_gsbpm`
--

LOCK TABLES `csm_tool_gsbpm` WRITE;
/*!40000 ALTER TABLE `csm_tool_gsbpm` DISABLE KEYS */;
INSERT INTO `csm_tool_gsbpm` VALUES (150,53),(150,54),(150,53),(150,54),(200,53),(208,24),(209,24),(210,24),(211,24),(202,24),(212,24),(201,24),(213,24),(203,24),(214,41),(214,53),(215,53),(204,53),(214,54),(205,54),(216,53),(206,53),(216,54),(206,54),(217,57),(207,57),(218,57),(219,57),(220,57),(221,51),(222,51),(223,51),(100,53),(100,53);
/*!40000 ALTER TABLE `csm_tool_gsbpm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_user_roles`
--

DROP TABLE IF EXISTS `csm_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_user_roles` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ROLE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_user_roles`
--

LOCK TABLES `csm_user_roles` WRITE;
/*!40000 ALTER TABLE `csm_user_roles` DISABLE KEYS */;
INSERT INTO `csm_user_roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `csm_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_users`
--

DROP TABLE IF EXISTS `csm_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EMAIL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `SURNAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `PASSWORD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ROLE_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_users_csm_user_roles` (`ROLE_ID`),
  CONSTRAINT `fk_csm_users_csm_user_roles` FOREIGN KEY (`ROLE_ID`) REFERENCES `csm_user_roles` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_users`
--

LOCK TABLES `csm_users` WRITE;
/*!40000 ALTER TABLE `csm_users` DISABLE KEYS */;
INSERT INTO `csm_users` VALUES (1,'admin@csm.it','Administrator','Workbench','$2a$10$VB7y/I.oD16QBVaExgH1K.VEuBUKRyXcCUVweUGhs1vDl0waTQPmC',1),(2,'user@csm.it','User','Workbench','$2a$10$yK1pW21E8nlZd/YcOt6uB.n8l36a33RP3/hehbWFAcBsFJhVKlZ82',2),(3,'fra@fra.it','Francesco Amato','fra','$2a$10$DIcyvIFwhDkEOT9nBugTleDM73OkZffZUdfmvjMCEXdJr3PZP8Kxm',1);
/*!40000 ALTER TABLE `csm_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_view_data_type`
--

DROP TABLE IF EXISTS `csm_view_data_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_view_data_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_view_data_type`
--

LOCK TABLES `csm_view_data_type` WRITE;
/*!40000 ALTER TABLE `csm_view_data_type` DISABLE KEYS */;
INSERT INTO `csm_view_data_type` VALUES (1,'DATASET',NULL),(2,'RULESET',NULL);
/*!40000 ALTER TABLE `csm_view_data_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_work_session`
--

DROP TABLE IF EXISTS `csm_work_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_work_session` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DESCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `LAST_UPDATE` datetime DEFAULT NULL,
  `USER_ID` int NOT NULL,
  `BUSINESS_FUNCTION_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_worksession_user` (`USER_ID`),
  KEY `fk_csm_worksession_business_function` (`BUSINESS_FUNCTION_ID`),
  CONSTRAINT `fk_csm_worksession_business_function` FOREIGN KEY (`BUSINESS_FUNCTION_ID`) REFERENCES `csm_business_function` (`ID`),
  CONSTRAINT `fk_csm_worksession_user` FOREIGN KEY (`USER_ID`) REFERENCES `csm_users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_work_session`
--

LOCK TABLES `csm_work_session` WRITE;
/*!40000 ALTER TABLE `csm_work_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `csm_work_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_workflow`
--

DROP TABLE IF EXISTS `csm_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_workflow` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RULE_ID` int NOT NULL,
  `STEP` int NOT NULL,
  `SUB_STEP` int NOT NULL,
  `ELSE_STEP` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_workflow`
--

LOCK TABLES `csm_workflow` WRITE;
/*!40000 ALTER TABLE `csm_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `csm_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csm_workset`
--

DROP TABLE IF EXISTS `csm_workset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_workset` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DATASET_COLUMN` int DEFAULT NULL,
  `ORDER_CODE` int DEFAULT NULL,
  `CONTENT` json DEFAULT NULL,
  `CONTENT_SIZE` int DEFAULT NULL,
  `VALUE_PARAMETER` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CLS_DATA_TYPE_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_workset_data_type` (`CLS_DATA_TYPE_ID`),
  CONSTRAINT `fk_csm_workset_data_type` FOREIGN KEY (`CLS_DATA_TYPE_ID`) REFERENCES `csm_cls_data_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csm_workset`
--

LOCK TABLES `csm_workset` WRITE;
/*!40000 ALTER TABLE `csm_workset` DISABLE KEYS */;
/*!40000 ALTER TABLE `csm_workset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `cms_view_methodological_tool`
--

/*!50001 DROP VIEW IF EXISTS `cms_view_methodological_tool`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cms_view_methodological_tool` AS select distinct `g`.`CODE` AS `gsbpm_id`,`g`.`NAME` AS `gsbpm`,`t`.`ID` AS `tool_id`,`t`.`Name` AS `tool`,`t`.`Tool_type` AS `Tool_type`,`m`.`ID` AS `method_id`,`m`.`Name` AS `method`,`i`.`ID` AS `funct_id`,`i`.`METHOD` AS `functionality` from (`csm_step_instance` `i` left join ((((`csm_gsbpm_process` `g` join `csm_tool_gsbpm` `b` on((`b`.`gsbpm` = `g`.`ID`))) join `csm_methodological_tool` `t` on((`t`.`ID` = `b`.`tool`))) join `csm_link_method_tool` `a` on((`t`.`ID` = `a`.`tool`))) join `csm_statistical_method` `m` on((`a`.`method` = `m`.`ID`))) on((`m`.`ID` = `i`.`STATMETHOD`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cms_view_process_design`
--

/*!50001 DROP VIEW IF EXISTS `cms_view_process_design`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cms_view_process_design` AS select distinct `p`.`ID` AS `process_id`,`p`.`NAME` AS `process`,`s`.`ID` AS `step_id`,`s`.`NAME` AS `step`,`d`.`process_design_id` AS `design_id`,`o`.`name` AS `object`,`o`.`descr` AS `description`,`d`.`type` AS `type` from ((((`csm_process_design` `d` join `csm_information_object` `o` on((`d`.`csm_information_object_id` = `o`.`id`))) join `csm_process_step` `s` on((`s`.`ID` = `d`.`step`))) join `csm_link_process_step` `l` on((`s`.`ID` = `l`.`PROCESS_STEP_ID`))) join `csm_business_process` `p` on((`p`.`ID` = `l`.`BUSINESS_PROCESS_ID`))) order by `d`.`process_design_id`,`s`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cms_view_process_tree`
--

/*!50001 DROP VIEW IF EXISTS `cms_view_process_tree`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cms_view_process_tree` AS select concat(`csm_gsbpm_process`.`PHASE`,'.',`csm_gsbpm_process`.`SUBPROCESS`) AS `gsbpm`,`csm_gsbpm_process`.`NAME` AS `subprocess`,`csm_business_function`.`NAME` AS `Business_Function`,`csm_business_function`.`DESCR` AS `Funct_desc`,`csm_business_process`.`NAME` AS `Process`,`csm_business_process`.`DESCR` AS `Process_desc`,`csm_process_step`.`NAME` AS `Step`,`csm_process_step`.`DESCR` AS `Step_desc` from ((((((`csm_gsbpm_process` join `csm_link_gsbpm_business_function` on((`csm_gsbpm_process`.`ID` = `csm_link_gsbpm_business_function`.`gsbpm_ID`))) join `csm_business_function` on((`csm_link_gsbpm_business_function`.`business_function_ID` = `csm_business_function`.`ID`))) join `csm_link_function_process` on((`csm_link_function_process`.`BUSINESS_FUNCTION_ID` = `csm_business_function`.`ID`))) join `csm_business_process` on((`csm_link_function_process`.`BUSINESS_PROCESS_ID` = `csm_business_process`.`ID`))) join `csm_link_process_step` on((`csm_link_process_step`.`BUSINESS_PROCESS_ID` = `csm_business_process`.`ID`))) join `csm_process_step` on((`csm_link_process_step`.`PROCESS_STEP_ID` = `csm_process_step`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `csm_excel_objects`
--

/*!50001 DROP VIEW IF EXISTS `csm_excel_objects`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `csm_excel_objects` AS select trim(`csm_excel_import`.`Transormable_input`) AS `descr`,trim(`csm_excel_import`.`label_in`) AS `name`,1 AS `type`,`csm_excel_import`.`process_step` AS `step`,`csm_excel_import`.`business_process` AS `process` from `csm_excel_import` where (trim(`csm_excel_import`.`label_in`) <> '') union select trim(`csm_excel_import`.`transformable_output`) AS `descr`,trim(`csm_excel_import`.`label_out`) AS `name`,2 AS `type`,`csm_excel_import`.`process_step` AS `step`,`csm_excel_import`.`business_process` AS `process` from `csm_excel_import` where (trim(`csm_excel_import`.`label_out`) <> '') union select trim(`csm_excel_import`.`process_support`) AS `descr`,'SUPPORT' AS `name`,3 AS `type`,`csm_excel_import`.`process_step` AS `step`,`csm_excel_import`.`business_process` AS `process` from `csm_excel_import` where (trim(`csm_excel_import`.`process_support`) <> '') */;
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

-- Dump completed on 2022-06-08 15:14:53
