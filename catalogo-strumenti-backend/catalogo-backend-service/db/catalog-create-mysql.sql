-- 
-- Schema catalogue
-- 
DROP SCHEMA IF EXISTS `catalog`;
CREATE SCHEMA `catalog` DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
use catalog;

 
-- Tabellina di appoggio. Il db dovrà collegarsi a quella relativa di IS2.
DROP TABLE IF EXISTS `catalog`.`is2_business_service` ;

 CREATE TABLE IF NOT EXISTS `catalog`.`is2_business_service` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(100) NULL DEFAULT NULL,
  `DESCR` TEXT NULL DEFAULT NULL,  
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 201
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Tabellina di appoggio. Il db dovrà collegarsi a quella relativa di IS2.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `catalog`.`is2_app_service` ;

CREATE TABLE IF NOT EXISTS `catalog`.`is2_app_service` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(100) NULL DEFAULT NULL,
  `DESCR` TEXT NULL DEFAULT NULL,
  `IMPLEMENTATION_LANGUAGE` VARCHAR(100) NULL DEFAULT NULL,
  `ENGINE` VARCHAR(100) NULL DEFAULT NULL,
  `SOURCE_PATH` VARCHAR(100) NULL DEFAULT NULL,
  `SOURCE_CODE` LONGTEXT NULL DEFAULT NULL,
  `AUTHOR` VARCHAR(100) NULL DEFAULT NULL,
  `LICENCE` VARCHAR(100) NULL DEFAULT NULL,
  `CONTACT` VARCHAR(100) NULL DEFAULT NULL,
  `BUSINESS_SERVICE_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_is2_app_service_is2_business_service`
    FOREIGN KEY (`BUSINESS_SERVICE_ID`)
    REFERENCES `catalog`.`is2_business_service` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 251
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE INDEX `fk_is2_app_service_is2_business_service` ON `catalog`.`is2_app_service` (`BUSINESS_SERVICE_ID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `catalog`.`cls_tool_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `catalog`.`cls_tool_type` ;

CREATE TABLE IF NOT EXISTS `catalog`.`cls_tool_type` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `catalog`.`csm_statistical_method`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `catalog`.`csm_statistical_method` ;

CREATE TABLE IF NOT EXISTS `catalog`.`csm_statistical_method` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Autore` VARCHAR(100) NULL DEFAULT NULL,
  `Obiettivo` VARCHAR(100) NULL DEFAULT NULL,
  `Descrizione` VARCHAR(100) NULL DEFAULT NULL,
  `Generalita` VARCHAR(100) NULL DEFAULT NULL,
  `Ipotesi` VARCHAR(100) NULL DEFAULT NULL,
  `Limiti` VARCHAR(100) NULL DEFAULT NULL,
  `Indicatori_qualita` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `catalog`.`csm_methodological_tool`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `catalog`.`csm_methodological_tool` ;

CREATE TABLE IF NOT EXISTS `catalog`.`csm_methodological_tool` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Data` VARCHAR(100) NULL DEFAULT NULL,
  `Descrizione` VARCHAR(1000) NULL DEFAULT NULL,
  `homepage` VARCHAR(100) NULL DEFAULT NULL,
  `download` VARCHAR(100) NULL DEFAULT NULL,
  `Metodo_Statistico` VARCHAR(100) NULL DEFAULT NULL,
  `Name` VARCHAR(100) NULL DEFAULT NULL,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Note` VARCHAR(100) NULL DEFAULT NULL,
  `Standard` VARCHAR(100) NULL DEFAULT NULL,
  `Tags` VARCHAR(500) NULL DEFAULT NULL,
  `Versione` VARCHAR(100) NULL DEFAULT NULL,
  `Tipologia` VARCHAR(100) NULL DEFAULT NULL,
  `Riferimenti` VARCHAR(100) NULL DEFAULT NULL,
  `Licence` VARCHAR(45) NULL DEFAULT NULL,
  `is2_business_service_ID` INT NOT NULL,
  `csm_tool_type_id` INT NOT NULL,
  `csm_statistical_method_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `is2_business_service_ID`, `csm_statistical_method_ID`),
  CONSTRAINT `fk_csm_methodological_tool_is2_business_service1`
    FOREIGN KEY (`is2_business_service_ID`)
    REFERENCES `catalog`.`is2_business_service` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_csm_methodological_tool_csm_tool_type1`
    FOREIGN KEY (`csm_tool_type_id`)
    REFERENCES `catalog`.`cls_tool_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_csm_methodological_tool_csm_statistical_method1`
    FOREIGN KEY (`csm_statistical_method_ID`)
    REFERENCES `catalog`.`csm_statistical_method` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 201
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE INDEX `fk_csm_methodological_tool_is2_business_service1_idx` ON `catalog`.`csm_methodological_tool` (`is2_business_service_ID` ASC) VISIBLE;

CREATE INDEX `fk_csm_methodological_tool_csm_tool_type1_idx` ON `catalog`.`csm_methodological_tool` (`csm_tool_type_id` ASC) VISIBLE;

CREATE INDEX `fk_csm_methodological_tool_csm_statistical_method1_idx` ON `catalog`.`csm_methodological_tool` (`csm_statistical_method_ID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `catalog`.`csm_software_procedure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `catalog`.`csm_software_procedure` ;

CREATE TABLE IF NOT EXISTS `catalog`.`csm_software_procedure` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Codice` VARCHAR(100) NULL DEFAULT NULL,
  `Sintassi` VARCHAR(100) NULL DEFAULT NULL,
  `Dipendenze` VARCHAR(100) NULL DEFAULT NULL,
  `Linguaggio` VARCHAR(100) NULL DEFAULT NULL,
  `tool` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_CSM_Software_Procedure_is2_Methodological_Tool`
    FOREIGN KEY (`tool`)
    REFERENCES `catalog`.`csm_methodological_tool` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE INDEX `fk_CSM_Software_Procedure_is2_Methodological_Tool` ON `catalog`.`csm_software_procedure` (`tool` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `catalog`.`csm_statistical_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `catalog`.`csm_statistical_service` ;

CREATE TABLE IF NOT EXISTS `catalog`.`csm_statistical_service` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Metodi_esposti` VARCHAR(100) NULL DEFAULT NULL,
  `Dipendenze` VARCHAR(100) NULL DEFAULT NULL,
  `Protocollo` VARCHAR(100) NULL DEFAULT NULL,
  `tool` INT NULL DEFAULT NULL,
  `is2_app_service_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_CSM_Statistical_Service_csm_Methodological_Tool`
    FOREIGN KEY (`tool`)
    REFERENCES `catalog`.`csm_methodological_tool` (`ID`),
  CONSTRAINT `fk_csm_statistical_service_is2_app_service1`
    FOREIGN KEY (`is2_app_service_ID`)
    REFERENCES `catalog`.`is2_app_service` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE INDEX `fk_CSM_Statistical_Service_csm_Methodological_Tool` ON `catalog`.`csm_statistical_service` (`tool` ASC) VISIBLE;

CREATE INDEX `fk_csm_statistical_service_is2_app_service1_idx` ON `catalog`.`csm_statistical_service` (`is2_app_service_ID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `catalog`.`csm_desktop_application`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `catalog`.`csm_desktop_application` ;

CREATE TABLE IF NOT EXISTS `catalog`.`csm_desktop_application` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Dipendenze` VARCHAR(100) NULL DEFAULT NULL,
  `Download` VARCHAR(100) NULL DEFAULT NULL,
  `Licenza` VARCHAR(100) NULL DEFAULT NULL,
  `Linguaggio` VARCHAR(100) NULL DEFAULT NULL,
  `Package` VARCHAR(100) NULL DEFAULT NULL,
  `Sistema_Operativo` VARCHAR(100) NULL DEFAULT NULL,
  `tool` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_CSM_Desktop_Application_csm_Methodological_Tool`
    FOREIGN KEY (`tool`)
    REFERENCES `catalog`.`csm_methodological_tool` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE INDEX `fk_CSM_Desktop_Application_csm_Methodological_Tool` ON `catalog`.`csm_desktop_application` (`tool` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `catalog`.`csm_agent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `catalog`.`csm_agent` ;

CREATE TABLE IF NOT EXISTS `catalog`.`csm_agent` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Organizzazione` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `catalog`.`csm_link_agent_tool`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `catalog`.`csm_link_agent_tool` ;

CREATE TABLE IF NOT EXISTS `catalog`.`csm_link_agent_tool` (
  `agent` INT NOT NULL,
  `tool` INT NOT NULL,
  `Ruolo` VARCHAR(100) NULL DEFAULT NULL,
  `Note` VARCHAR(100) NULL DEFAULT NULL,
  `Date_riferimento` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`agent`, `tool`),
  CONSTRAINT `fk_CSM_link_Agent_CSM_Methodological_tool`
    FOREIGN KEY (`agent`)
    REFERENCES `catalog`.`csm_agent` (`ID`),
  CONSTRAINT `fk_CSM_link_Agent_tool_CSM_Methodological_Tool`
    FOREIGN KEY (`tool`)
    REFERENCES `catalog`.`csm_methodological_tool` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE INDEX `fk_CSM_link_Agent_tool_CSM_Methodological_Tool` ON `catalog`.`csm_link_agent_tool` (`tool` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `catalog`.`csm_documentation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `catalog`.`csm_documentation` ;

CREATE TABLE IF NOT EXISTS `catalog`.`csm_documentation` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `EDITORE` VARCHAR(100) NULL DEFAULT NULL,
  `Type` VARCHAR(100) NULL DEFAULT NULL,
  `Note` VARCHAR(100) NULL DEFAULT NULL,
  `Resource` VARCHAR(1000) NULL DEFAULT NULL,
  `tool` INT NOT NULL,
  PRIMARY KEY (`ID`, `tool`),
  CONSTRAINT `fk_csm_documentation_csm_methodological_tool1`
    FOREIGN KEY (`tool`)
    REFERENCES `catalog`.`csm_methodological_tool` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE INDEX `fk_csm_documentation_csm_methodological_tool1_idx` ON `catalog`.`csm_documentation` (`tool` ASC) VISIBLE;
