CREATE DATABASE  IF NOT EXISTS `catalog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `catalog`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: catalog
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `cls_design_type`
--

DROP TABLE IF EXISTS `cls_design_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cls_design_type` (
  `id` int NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cls_document_type`
--

DROP TABLE IF EXISTS `cls_document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cls_document_type` (
  `id` int NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `descr` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cls_tool_type`
--

DROP TABLE IF EXISTS `cls_tool_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cls_tool_type` (
  `id` int NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `descr` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `cms_view_methodological_tool`
--

DROP TABLE IF EXISTS `cms_view_methodological_tool`;
/*!50001 DROP VIEW IF EXISTS `cms_view_methodological_tool`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cms_view_methodological_tool` AS SELECT 
 1 AS `step`,
 1 AS `step_id`,
 1 AS `method_name`,
 1 AS `method_id`,
 1 AS `tool`,
 1 AS `Tool_type`,
 1 AS `id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cms_view_process_design`
--

DROP TABLE IF EXISTS `cms_view_process_design`;
/*!50001 DROP VIEW IF EXISTS `cms_view_process_design`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cms_view_process_design` AS SELECT 
 1 AS `process`,
 1 AS `process_id`,
 1 AS `step`,
 1 AS `step_id`,
 1 AS `object`,
 1 AS `descr`,
 1 AS `id`,
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
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Organization` text COLLATE utf8mb4_unicode_ci,
  `Contact` text COLLATE utf8mb4_unicode_ci,
  `Notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_app_role`
--

DROP TABLE IF EXISTS `csm_app_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_app_role` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CODE` text COLLATE utf8mb4_unicode_ci,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  `ORDER_CODE` int DEFAULT NULL,
  `CLS_DATA_TYPE_ID` int DEFAULT NULL,
  `PARAMETER_ID` int DEFAULT NULL,
  `HIDDEN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_app_role_csm_data_type` (`CLS_DATA_TYPE_ID`),
  KEY `fk_csm_app_role_csm_paramter` (`PARAMETER_ID`),
  CONSTRAINT `fk_csm_app_role_csm_data_type` FOREIGN KEY (`CLS_DATA_TYPE_ID`) REFERENCES `csm_cls_data_type` (`ID`),
  CONSTRAINT `fk_csm_app_role_csm_paramter` FOREIGN KEY (`PARAMETER_ID`) REFERENCES `csm_parameter` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_app_service`
--

DROP TABLE IF EXISTS `csm_app_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_app_service` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  `IMPLEMENTATION_LANGUAGE` text COLLATE utf8mb4_unicode_ci,
  `ENGINE` text COLLATE utf8mb4_unicode_ci,
  `SOURCE_PATH` text COLLATE utf8mb4_unicode_ci,
  `SOURCE_CODE` text COLLATE utf8mb4_unicode_ci,
  `AUTHOR` text COLLATE utf8mb4_unicode_ci,
  `LICENCE` text COLLATE utf8mb4_unicode_ci,
  `CONTACT` text COLLATE utf8mb4_unicode_ci,
  `business_service_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_app_service_csm_business_service1_idx` (`business_service_ID`),
  CONSTRAINT `fk_csm_app_service_csm_business_service1` FOREIGN KEY (`business_service_ID`) REFERENCES `csm_business_service` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_business_function`
--

DROP TABLE IF EXISTS `csm_business_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_business_function` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  `LABEL` text COLLATE utf8mb4_unicode_ci,
  `ACTIVE` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_business_process`
--

DROP TABLE IF EXISTS `csm_business_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_business_process` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  `LABEL` text COLLATE utf8mb4_unicode_ci,
  `ORDER_CODE` int DEFAULT NULL,
  `PARENT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_business_process_csm_business_process` (`PARENT`),
  CONSTRAINT `fk_csm_business_process_csm_business_process` FOREIGN KEY (`PARENT`) REFERENCES `csm_business_process` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_business_service`
--

DROP TABLE IF EXISTS `csm_business_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_business_service` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_cls_data_type`
--

DROP TABLE IF EXISTS `csm_cls_data_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_cls_data_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_cls_rule`
--

DROP TABLE IF EXISTS `csm_cls_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_cls_rule` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  `NOTE` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_cls_statistical_variable`
--

DROP TABLE IF EXISTS `csm_cls_statistical_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_cls_statistical_variable` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  `TYPE` int DEFAULT NULL,
  `ORDER_CODE` int DEFAULT NULL,
  `VARIABLE_NAME_ITA` text COLLATE utf8mb4_unicode_ci,
  `VARIABLE_NAME_ENG` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_cls_type_io`
--

DROP TABLE IF EXISTS `csm_cls_type_io`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_cls_type_io` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_data_processing`
--

DROP TABLE IF EXISTS `csm_data_processing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_data_processing` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  `LAST_UPDATE` datetime DEFAULT NULL,
  `BUSINESS_PROCESS_ID` int NOT NULL,
  `WORK_SESSION_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_data_processing_business_process` (`BUSINESS_PROCESS_ID`),
  KEY `fk_csm_data_processing_worksession` (`WORK_SESSION_ID`),
  CONSTRAINT `fk_csm_data_processing_business_process` FOREIGN KEY (`BUSINESS_PROCESS_ID`) REFERENCES `csm_business_process` (`ID`),
  CONSTRAINT `fk_csm_data_processing_worksession` FOREIGN KEY (`WORK_SESSION_ID`) REFERENCES `csm_work_session` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_dataset_column`
--

DROP TABLE IF EXISTS `csm_dataset_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_dataset_column` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text COLLATE utf8mb4_unicode_ci,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_dataset_file`
--

DROP TABLE IF EXISTS `csm_dataset_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_dataset_file` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FILE_NAME` text COLLATE utf8mb4_unicode_ci,
  `FILE_LABEL` text COLLATE utf8mb4_unicode_ci,
  `FILE_FORMAT` text COLLATE utf8mb4_unicode_ci,
  `FIELD_SEPARATOR` text COLLATE utf8mb4_unicode_ci,
  `TOTAL_ROWS` int DEFAULT NULL,
  `LAST_UPDATE` datetime DEFAULT NULL,
  `CLS_DATA_TYPE_ID` int DEFAULT NULL,
  `WORK_SESSION_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_datakset_file_data_type` (`CLS_DATA_TYPE_ID`),
  KEY `fk_csm_datakset_file_worksession` (`WORK_SESSION_ID`),
  CONSTRAINT `fk_csm_datakset_file_data_type` FOREIGN KEY (`CLS_DATA_TYPE_ID`) REFERENCES `csm_cls_data_type` (`ID`),
  CONSTRAINT `fk_csm_datakset_file_worksession` FOREIGN KEY (`WORK_SESSION_ID`) REFERENCES `csm_work_session` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_desktop_application`
--

DROP TABLE IF EXISTS `csm_desktop_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_desktop_application` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Download` text COLLATE utf8mb4_unicode_ci,
  `Licence` text COLLATE utf8mb4_unicode_ci,
  `Language` text COLLATE utf8mb4_unicode_ci,
  `Package` text COLLATE utf8mb4_unicode_ci,
  `Operative_System` text COLLATE utf8mb4_unicode_ci,
  `Version` text COLLATE utf8mb4_unicode_ci,
  `Technical_requirements` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_csm_desktop_application_csm_methodological_tool1` FOREIGN KEY (`ID`) REFERENCES `csm_methodological_tool` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_documentation`
--

DROP TABLE IF EXISTS `csm_documentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_documentation` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Publisher` text COLLATE utf8mb4_unicode_ci,
  `Document_type` int DEFAULT NULL,
  `Notes` text COLLATE utf8mb4_unicode_ci,
  `Resource` text COLLATE utf8mb4_unicode_ci,
  `tool` int NOT NULL,
  PRIMARY KEY (`ID`,`tool`),
  KEY `fk_csm_documentation_csm_methodological_tool1_idx` (`tool`),
  KEY `fk_csm_documentation_csm_document_type1_idx` (`Document_type`),
  CONSTRAINT `fk_csm_documentation_csm_document_type1` FOREIGN KEY (`Document_type`) REFERENCES `cls_document_type` (`id`),
  CONSTRAINT `fk_csm_documentation_csm_methodological_tool1` FOREIGN KEY (`tool`) REFERENCES `csm_methodological_tool` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_excel_import`
--

DROP TABLE IF EXISTS `csm_excel_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_excel_import` (
  `gsbpm` text COLLATE utf8mb4_unicode_ci,
  `business_process` text COLLATE utf8mb4_unicode_ci,
  `process_step` text COLLATE utf8mb4_unicode_ci,
  `step_desc` text COLLATE utf8mb4_unicode_ci,
  `action_desc` text COLLATE utf8mb4_unicode_ci,
  `Transormable_input` text COLLATE utf8mb4_unicode_ci,
  `label_in` text COLLATE utf8mb4_unicode_ci,
  `process_support` text COLLATE utf8mb4_unicode_ci,
  `process_method` text COLLATE utf8mb4_unicode_ci,
  `transformable_output_synt` text COLLATE utf8mb4_unicode_ci,
  `transformable_output` text COLLATE utf8mb4_unicode_ci,
  `label_out` text COLLATE utf8mb4_unicode_ci,
  `statistical_method` text COLLATE utf8mb4_unicode_ci,
  `desktop_application` text COLLATE utf8mb4_unicode_ci,
  `statistical_service` text COLLATE utf8mb4_unicode_ci,
  `procname` text COLLATE utf8mb4_unicode_ci,
  `business_function` text COLLATE utf8mb4_unicode_ci,
  `methodological_tool` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `phase` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `CODE` text COLLATE utf8mb4_unicode_ci,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `PHASE` int DEFAULT NULL,
  `SUBPROCESS` int DEFAULT NULL,
  `ACTIVE` tinyint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_gsbpm_process_csm_gsbpm_process` (`PHASE`),
  CONSTRAINT `fk_phase_sub_proc` FOREIGN KEY (`PHASE`) REFERENCES `csm_gsbpm_process` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_information_object`
--

DROP TABLE IF EXISTS `csm_information_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_information_object` (
  `id` int NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `csm_app_role_ID` int NOT NULL,
  `csm_business_service_ID` int NOT NULL,
  `descr` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`csm_business_service_ID`),
  KEY `fk_csm_information_object_csm_business_service1_idx` (`csm_business_service_ID`),
  CONSTRAINT `fk_csm_information_object_csm_business_service1` FOREIGN KEY (`csm_business_service_ID`) REFERENCES `csm_business_service` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_link_agent_tool`
--

DROP TABLE IF EXISTS `csm_link_agent_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_link_agent_tool` (
  `agent` int NOT NULL,
  `tool` int NOT NULL,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Notes` text COLLATE utf8mb4_unicode_ci,
  `Reference_Date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`agent`,`tool`),
  KEY `fk_CSM_link_Agent_tool_CSM_Methodological_Tool` (`tool`),
  CONSTRAINT `fk_CSM_link_Agent_CSM_Methodological_tool` FOREIGN KEY (`agent`) REFERENCES `csm_agent` (`ID`),
  CONSTRAINT `fk_CSM_link_Agent_tool_CSM_Methodological_Tool` FOREIGN KEY (`tool`) REFERENCES `csm_methodological_tool` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `csm_log`
--

DROP TABLE IF EXISTS `csm_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MSG` text COLLATE utf8mb4_unicode_ci,
  `MSG_TIME` datetime DEFAULT NULL,
  `TYPE` text COLLATE utf8mb4_unicode_ci,
  `WORK_SESSION_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_log_worksession` (`WORK_SESSION_ID`),
  CONSTRAINT `fk_csm_log_worksession` FOREIGN KEY (`WORK_SESSION_ID`) REFERENCES `csm_work_session` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_methodological_tool`
--

DROP TABLE IF EXISTS `csm_methodological_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_methodological_tool` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Release_Date` date DEFAULT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Standard_Istat` tinyint DEFAULT '0',
  `Tags` text COLLATE utf8mb4_unicode_ci,
  `Version` text COLLATE utf8mb4_unicode_ci,
  `Tool_type` int NOT NULL,
  `service` int NOT NULL,
  `Last_update` date DEFAULT NULL,
  `Requirements` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_methodological_tool_csm_tool_type1_idx` (`Tool_type`),
  KEY `fk_csm_methodological_tool_csm_business_service1_idx` (`service`),
  CONSTRAINT `fk_csm_methodological_tool_csm_business_service1` FOREIGN KEY (`service`) REFERENCES `csm_business_service` (`ID`),
  CONSTRAINT `fk_csm_methodological_tool_csm_tool_type1` FOREIGN KEY (`Tool_type`) REFERENCES `cls_tool_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_parameter`
--

DROP TABLE IF EXISTS `csm_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_parameter` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  `DEFAULT_VAL` text COLLATE utf8mb4_unicode_ci,
  `JSON_TEMPLATE` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_process_design`
--

DROP TABLE IF EXISTS `csm_process_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_process_design` (
  `id` int NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `step` int NOT NULL,
  `type` int NOT NULL,
  `csm_information_object_id` int NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  KEY `fk_csm_process_design_csm_process_step1_idx` (`step`),
  KEY `fk_csm_process_design_csm_design_type1_idx` (`type`),
  KEY `fk_csm_process_design_csm_information_object1_idx` (`csm_information_object_id`),
  CONSTRAINT `fk_csm_process_design_csm_design_type1` FOREIGN KEY (`type`) REFERENCES `cls_design_type` (`id`),
  CONSTRAINT `fk_csm_process_design_csm_information_object1` FOREIGN KEY (`csm_information_object_id`) REFERENCES `csm_information_object` (`id`),
  CONSTRAINT `fk_csm_process_design_csm_process_step1` FOREIGN KEY (`step`) REFERENCES `csm_process_step` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_process_step`
--

DROP TABLE IF EXISTS `csm_process_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_process_step` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABEL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  `BUSINESS_SERVICE_ID` int NOT NULL,
  `SUBSTEP` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_process_step_business_service` (`BUSINESS_SERVICE_ID`),
  KEY `fk_csm_ITERATE_process_step` (`SUBSTEP`),
  CONSTRAINT `fk_csm_ITERATE_process_step` FOREIGN KEY (`SUBSTEP`) REFERENCES `csm_process_step` (`ID`),
  CONSTRAINT `fk_csm_process_step_business_service` FOREIGN KEY (`BUSINESS_SERVICE_ID`) REFERENCES `csm_business_service` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_rule`
--

DROP TABLE IF EXISTS `csm_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_rule` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `CODE` text COLLATE utf8mb4_unicode_ci,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  `BLOCKING` int DEFAULT NULL,
  `ERROR_CODE` int DEFAULT NULL,
  `ACTIVE` int DEFAULT NULL,
  `RULE` text COLLATE utf8mb4_unicode_ci,
  `VARIABLE_ID` int DEFAULT NULL,
  `CLS_RULE_ID` int NOT NULL,
  `RULESET_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_rule_cls_rule` (`CLS_RULE_ID`),
  KEY `fk_rule_ruleset` (`RULESET_ID`),
  CONSTRAINT `fk_rule_cls_rule` FOREIGN KEY (`CLS_RULE_ID`) REFERENCES `csm_cls_rule` (`ID`),
  CONSTRAINT `fk_rule_ruleset` FOREIGN KEY (`RULESET_ID`) REFERENCES `csm_ruleset` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_ruleset`
--

DROP TABLE IF EXISTS `csm_ruleset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_ruleset` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FILE_NAME` text COLLATE utf8mb4_unicode_ci,
  `FILE_LABEL` text COLLATE utf8mb4_unicode_ci,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  `RULES_TOTAL` int DEFAULT NULL,
  `LAST_UPDATE` datetime DEFAULT NULL,
  `WORK_SESSION_ID` int NOT NULL,
  `DATASET_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_ruleset_work_session` (`WORK_SESSION_ID`),
  KEY `fk_ruleset_dataset` (`DATASET_ID`),
  CONSTRAINT `fk_ruleset_dataset` FOREIGN KEY (`DATASET_ID`) REFERENCES `csm_dataset_file` (`ID`),
  CONSTRAINT `fk_ruleset_work_session` FOREIGN KEY (`WORK_SESSION_ID`) REFERENCES `csm_work_session` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_software_procedure`
--

DROP TABLE IF EXISTS `csm_software_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_software_procedure` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Code` longtext COLLATE utf8mb4_unicode_ci,
  `Language` text COLLATE utf8mb4_unicode_ci,
  `Dependencies` text COLLATE utf8mb4_unicode_ci,
  `Technical_Requirements` text COLLATE utf8mb4_unicode_ci,
  `Workflow` text COLLATE utf8mb4_unicode_ci,
  `Download` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_csm_software_procedure_csm_methodological_tool1` FOREIGN KEY (`ID`) REFERENCES `csm_methodological_tool` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_statistical_method`
--

DROP TABLE IF EXISTS `csm_statistical_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_statistical_method` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Requirements` text COLLATE utf8mb4_unicode_ci,
  `Assumptions` text COLLATE utf8mb4_unicode_ci,
  `Constraints` text COLLATE utf8mb4_unicode_ci,
  `Notes` text COLLATE utf8mb4_unicode_ci,
  `Release_date` datetime DEFAULT NULL,
  `Standard_Istat` tinyint DEFAULT NULL,
  `Tags` text COLLATE utf8mb4_unicode_ci,
  `Version` text COLLATE utf8mb4_unicode_ci,
  `Last_Update` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_statistical_program`
--

DROP TABLE IF EXISTS `csm_statistical_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_statistical_program` (
  `gsbpm` int NOT NULL,
  `process` int NOT NULL,
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Descr` text COLLATE utf8mb4_unicode_ci,
  `cycle` int DEFAULT NULL,
  PRIMARY KEY (`gsbpm`,`process`),
  KEY `fk_csm_gsbpm_process_has_csm_business_process_csm_business__idx` (`process`),
  KEY `fk_csm_gsbpm_process_has_csm_business_process_csm_gsbpm_pro_idx` (`gsbpm`),
  CONSTRAINT `fk_csm_gsbpm_process_has_csm_business_process_csm_business_pr1` FOREIGN KEY (`process`) REFERENCES `csm_business_process` (`ID`),
  CONSTRAINT `fk_csm_gsbpm_process_has_csm_business_process_csm_gsbpm_proce1` FOREIGN KEY (`gsbpm`) REFERENCES `csm_gsbpm_process` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_statistical_service`
--

DROP TABLE IF EXISTS `csm_statistical_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_statistical_service` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Protocol` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `Outcomes` text COLLATE utf8mb4_unicode_ci,
  `Service_Dependencies` text COLLATE utf8mb4_unicode_ci,
  `Restrictions` text COLLATE utf8mb4_unicode_ci,
  `GSBPM` text COLLATE utf8mb4_unicode_ci,
  `Business_Function` text COLLATE utf8mb4_unicode_ci,
  `process_design` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_csm_statistical_service_csm_methodological_tool1` FOREIGN KEY (`ID`) REFERENCES `csm_methodological_tool` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_step_instance`
--

DROP TABLE IF EXISTS `csm_step_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_step_instance` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `METHOD` text COLLATE utf8mb4_unicode_ci,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  `FUNCTIONALITY` text COLLATE utf8mb4_unicode_ci,
  `APP_SERVICE_ID` int NOT NULL,
  `STATMETHOD` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_step_instance_csm_app_service` (`APP_SERVICE_ID`),
  KEY `fk_csm_step_instance_csm_statistical_method1_idx1` (`STATMETHOD`),
  CONSTRAINT `fk_csm_step_instance_csm_app_service` FOREIGN KEY (`APP_SERVICE_ID`) REFERENCES `csm_app_service` (`ID`),
  CONSTRAINT `fk_csm_step_instance_csm_statistical_method1` FOREIGN KEY (`STATMETHOD`) REFERENCES `csm_statistical_method` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `csm_tool_gsbpm`
--

DROP TABLE IF EXISTS `csm_tool_gsbpm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_tool_gsbpm` (
  `tool` int DEFAULT NULL,
  `gsbpm` int DEFAULT NULL,
  KEY `fk_csm_tool_gsbpm_csm_methodological_tool1_idx` (`tool`),
  KEY `fk_csm_tool_gsbpm_csm_gsbpm_process1_idx` (`gsbpm`),
  CONSTRAINT `fk_csm_tool_gsbpm_csm_gsbpm_process1` FOREIGN KEY (`gsbpm`) REFERENCES `csm_gsbpm_process` (`ID`),
  CONSTRAINT `fk_csm_tool_gsbpm_csm_methodological_tool1` FOREIGN KEY (`tool`) REFERENCES `csm_methodological_tool` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_user_roles`
--

DROP TABLE IF EXISTS `csm_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_user_roles` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ROLE` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_users`
--

DROP TABLE IF EXISTS `csm_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EMAIL` text COLLATE utf8mb4_unicode_ci,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `SURNAME` text COLLATE utf8mb4_unicode_ci,
  `PASSWORD` text COLLATE utf8mb4_unicode_ci,
  `ROLE_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_users_csm_user_roles` (`ROLE_ID`),
  CONSTRAINT `fk_csm_users_csm_user_roles` FOREIGN KEY (`ROLE_ID`) REFERENCES `csm_user_roles` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_view_data_type`
--

DROP TABLE IF EXISTS `csm_view_data_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_view_data_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csm_work_session`
--

DROP TABLE IF EXISTS `csm_work_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_work_session` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
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
-- Table structure for table `csm_workset`
--

DROP TABLE IF EXISTS `csm_workset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csm_workset` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` text COLLATE utf8mb4_unicode_ci,
  `DATASET_COLUMN` int DEFAULT NULL,
  `ORDER_CODE` int DEFAULT NULL,
  `CONTENT` json DEFAULT NULL,
  `CONTENT_SIZE` int DEFAULT NULL,
  `VALUE_PARAMETER` longtext COLLATE utf8mb4_unicode_ci,
  `CLS_DATA_TYPE_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_csm_workset_data_type` (`CLS_DATA_TYPE_ID`),
  CONSTRAINT `fk_csm_workset_data_type` FOREIGN KEY (`CLS_DATA_TYPE_ID`) REFERENCES `csm_cls_data_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'catalog'
--

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
/*!50001 VIEW `cms_view_methodological_tool` AS select distinct `b`.`NAME` AS `step`,`b`.`ID` AS `step_id`,`m`.`Name` AS `method_name`,`m`.`ID` AS `method_id`,`t`.`Name` AS `tool`,`t`.`Tool_type` AS `Tool_type`,`t`.`ID` AS `id` from (((`csm_excel_import` `a` join `csm_statistical_method` `m` on((`a`.`process_method` = `m`.`Name`))) join `csm_methodological_tool` `t` on(((`t`.`Name` = `a`.`desktop_application`) or (`t`.`Name` = `a`.`statistical_service`) or (`t`.`Name` = `a`.`procname`)))) join `csm_process_step` `b` on((`a`.`process_step` = `b`.`NAME`))) */;
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
/*!50001 VIEW `cms_view_process_design` AS select `b`.`process` AS `process`,`p`.`ID` AS `process_id`,`s`.`NAME` AS `step`,`s`.`ID` AS `step_id`,`c`.`name` AS `object`,`c`.`descr` AS `descr`,`c`.`id` AS `id`,`b`.`type` AS `type` from (((`csm_excel_objects` `b` join `csm_information_object` `c` on(((`b`.`name` = `c`.`name`) and (`b`.`descr` = `c`.`descr`)))) join `csm_process_step` `s` on((`s`.`NAME` = `b`.`step`))) join `csm_business_process` `p` on((`p`.`NAME` = `b`.`process`))) order by `s`.`ID`,`b`.`process` */;
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
/*!50001 VIEW `csm_excel_objects` AS select `csm_excel_import`.`Transormable_input` AS `descr`,`csm_excel_import`.`label_in` AS `name`,1 AS `type`,`csm_excel_import`.`process_step` AS `step`,`csm_excel_import`.`business_process` AS `process` from `csm_excel_import` union select `csm_excel_import`.`transformable_output` AS `descr`,`csm_excel_import`.`label_out` AS `name`,2 AS `type`,`csm_excel_import`.`process_step` AS `step`,`csm_excel_import`.`business_process` AS `process` from `csm_excel_import` union select `csm_excel_import`.`process_support` AS `descr`,'' AS `name`,3 AS `type`,`csm_excel_import`.`process_step` AS `step`,`csm_excel_import`.`business_process` AS `process` from `csm_excel_import` */;
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

-- Dump completed on 2022-03-24 11:24:18
