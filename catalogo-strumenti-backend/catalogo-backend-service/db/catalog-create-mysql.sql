-- 
-- Schema catalogue
-- 
DROP SCHEMA IF EXISTS `catalog`;
CREATE SCHEMA `catalog` DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
use catalog;

 
-- Tabellina di appoggio. Il db dovr� collegarsi a quella di IS2.
 CREATE TABLE IF NOT EXISTS `catalog`.`business_function` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(100) NULL DEFAULT NULL,
  `DESCR` TEXT NULL DEFAULT NULL,
  `LABEL` VARCHAR(50) NULL DEFAULT NULL,
  `ACTIVE` INT(11) NULL DEFAULT NULL,
  `gsbpm` INT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table `catalog`.`CSM_Methodological_Tool`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalog`.`CSM_Methodological_Tool` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Data` VARCHAR(100) NULL DEFAULT NULL,
  `Descrizione` VARCHAR(1000) NULL DEFAULT NULL,
  `Metodo_Statistico` VARCHAR(100) NULL DEFAULT NULL,  
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Note_di_compilazione` VARCHAR(100) NULL DEFAULT NULL,
  `Standard` VARCHAR(100) NULL DEFAULT NULL,
  `Tags` VARCHAR(500) NULL DEFAULT NULL,
  `Versione` VARCHAR(100) NULL DEFAULT NULL,
  `Tipologia` VARCHAR(100) NULL DEFAULT NULL,
  `Riferimenti` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`));

-- -----------------------------------------------------
-- Table `catalog`.`CSM_Software_Procedure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalog`.`CSM_Software_Procedure` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Codice` VARCHAR(100) NULL DEFAULT NULL,
  `Sintassi` VARCHAR(100) NULL DEFAULT NULL,
  `Dipendenze` VARCHAR(100) NULL DEFAULT NULL,
  `Linguaggio` VARCHAR(100) NULL DEFAULT NULL,
  `tool` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_CSM_Software_Procedure_is2_Methodological_Tool` (`tool` ASC) VISIBLE,
  CONSTRAINT `fk_CSM_Software_Procedure_is2_Methodological_Tool`
    FOREIGN KEY (`tool`)
    REFERENCES `catalog`.`CSM_Methodological_Tool` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `catalog`.`CSM_Statistical_Method`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalog`.`CSM_Statistical_Method` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Autore` VARCHAR(100) NULL DEFAULT NULL,
  `Obiettivo` VARCHAR(100) NULL DEFAULT NULL,
  `Descrizione` VARCHAR(100) NULL DEFAULT NULL,
  `Generalita` VARCHAR(100) NULL DEFAULT NULL,
  `Ipotesi` VARCHAR(100) NULL DEFAULT NULL,
  `Limiti` VARCHAR(100) NULL DEFAULT NULL,
  `Indicatori_qualita` VARCHAR(100) NULL DEFAULT NULL,
  `tool` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Statistical_Method_is2_Methodological_Tool` (`tool` ASC) VISIBLE,
  CONSTRAINT `fk_Statistical_Method_is2_Methodological_Tool`
    FOREIGN KEY (`tool`)
    REFERENCES `catalog`.`CSM_Methodological_Tool` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `catalog`.`CSM_Statistical_Service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalog`.`CSM_Statistical_Service` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Metodi_esposti` VARCHAR(100) NULL DEFAULT NULL,
  `Dipendenze` VARCHAR(100) NULL DEFAULT NULL,
  `Protocollo` VARCHAR(100) NULL DEFAULT NULL,
  `tool` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_CSM_Statistical_Service_is2_Methodological_Tool` (`tool` ASC) VISIBLE,
  CONSTRAINT `fk_CSM_Statistical_Service_is2_Methodological_Tool`
    FOREIGN KEY (`tool`)
    REFERENCES `catalog`.`CSM_Methodological_Tool` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `catalog`.`CSM_Desktop_Application`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalog`.`CSM_Desktop_Application` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Dipendenze` VARCHAR(100) NULL DEFAULT NULL,
  `Download` VARCHAR(100) NULL DEFAULT NULL,
  `Licenza` VARCHAR(100) NULL DEFAULT NULL,
  `Linguaggio` VARCHAR(100) NULL DEFAULT NULL,
  `Package` VARCHAR(100) NULL DEFAULT NULL,
  `Sistema_Operativo` VARCHAR(100) NULL DEFAULT NULL,
  `tool` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_CSM_Desktop_Application_is2_Methodological_Tool` (`tool` ASC) VISIBLE,
  CONSTRAINT `fk_CSM_Desktop_Application_is2_Methodological_Tool`
    FOREIGN KEY (`tool`)
    REFERENCES `catalog`.`CSM_Methodological_Tool` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `catalog`.`CSM_Agent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalog`.`CSM_Agent` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Organizzazione` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `catalog`.`CSM_link_Agent_tool`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalog`.`CSM_link_Agent_tool` (
  `agent` INT NOT NULL,
  `tool` INT NOT NULL,
  `Ruolo` VARCHAR(100) NULL DEFAULT NULL,
  `Note` VARCHAR(100) NULL DEFAULT NULL,
  `Date_riferimento` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`agent`, `tool`),
  INDEX `fk_CSM_link_Agent_tool_CSM_Methodological_Tool` (`tool` ASC) VISIBLE,
  CONSTRAINT `fk_CSM_link_Agent_CSM_Methodological_tool`
    FOREIGN KEY (`agent`)
    REFERENCES `catalog`.`CSM_Agent` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CSM_link_Agent_tool_CSM_Methodological_Tool`
    FOREIGN KEY (`tool`)
    REFERENCES `catalog`.`CSM_Methodological_Tool` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `catalog`.`CSM_Documentation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalog`.`CSM_Documentation` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Organizzazione` VARCHAR(100) NULL DEFAULT NULL,
  `CSM_Methodological_Tool_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `CSM_Methodological_Tool_ID`),
  INDEX `fk_CSM_Documentation_CSM_Methodological_Tool1_idx` (`CSM_Methodological_Tool_ID` ASC) VISIBLE,
  CONSTRAINT `fk_CSM_Documentation_CSM_Methodological_Tool1`
    FOREIGN KEY (`CSM_Methodological_Tool_ID`)
    REFERENCES `catalog`.`CSM_Methodological_Tool` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `catalog`.`CSM_Methodological_Tool_has_is2_business_function`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalog`.`CSM_Methodological_Tool_has_is2_business_function` (
  `CSM_Methodological_Tool_ID` INT NOT NULL,
  `is2_business_function_ID` INT(11) NOT NULL,
  PRIMARY KEY (`CSM_Methodological_Tool_ID`, `is2_business_function_ID`),
  INDEX `fk_CSM_Methodological_Tool_has_is2_business_function_is2_bu_idx` (`is2_business_function_ID` ASC) VISIBLE,
  INDEX `fk_CSM_Methodological_Tool_has_is2_business_function_CSM_Me_idx` (`CSM_Methodological_Tool_ID` ASC) VISIBLE,
  CONSTRAINT `fk_CSM_Methodological_Tool_has_is2_business_function_CSM_Meth1`
    FOREIGN KEY (`CSM_Methodological_Tool_ID`)
    REFERENCES `catalog`.`CSM_Methodological_Tool` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CSM_Methodological_Tool_has_is2_business_function_is2_busi1`
    FOREIGN KEY (`is2_business_function_ID`)
    REFERENCES `catalog`.`business_function` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
