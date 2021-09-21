-- 
-- Schema catalogue
-- 
DROP SCHEMA IF EXISTS `catalog`;
CREATE SCHEMA `catalog` DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
use catalog;

-- metodo_statistico deve diventare un auto-join sullo strumento metodo statistico, ma ora non ce ne sono ancora
CREATE TABLE CSM_Methodological_Tool	(
	`ID` 	 	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Data` varchar(100),
	`Descrizione` varchar(1000),
	`homepage` varchar(100),
    `download` varchar(100),
	`Metodo_Statistico` varchar(100),	
	`Nome` varchar(100),
	`Note` varchar(100),
	`Standard` varchar(100),
	`Tags` varchar(500),
	`Versione` varchar(100),
	`Tipologia` varchar(100),
	`Riferimenti` varchar(100),
    `License` varchar(45)
 );
  -- Tabellina di appoggio. Il db dobrebbe collegarsi a quella di IS2.
 CREATE TABLE `business_process` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCR` text COLLATE utf8mb4_unicode_ci,
  `LABEL` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORDER_CODE` int(11) DEFAULT NULL,  
  PRIMARY KEY (`ID`)
);
 -- Link verso il process design esistente
CREATE TABLE CSM_link_Methodological_tool_Business_Process (
	`bproc` 	INT,
    `tool` 	 	INT,
	
    primary key (bproc,tool),
    CONSTRAINT `fk_CSM_Methodological_tool_business_process` FOREIGN KEY (`bproc`)
	REFERENCES `business_process` (`ID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_Link_business_process_Methodological_Tool` FOREIGN KEY (`tool`)
	REFERENCES `CSM_Methodological_Tool` (`ID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
    
	);

-- Specializzazioni del software 
CREATE TABLE CSM_Software_Procedure (
	`ID` 	 	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Codice` varchar(100),
	`Sintassi` varchar(100),
	`Dipendenze` varchar(100),
	`Linguaggio` varchar(100),
    `tool` INT,
    CONSTRAINT `fk_CSM_Software_Procedure_is2_Methodological_Tool` FOREIGN KEY (`tool`)
	REFERENCES `CSM_Methodological_Tool` (`ID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
 );
CREATE TABLE CSM_Statistical_Method (
	`ID` 	 	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Nome` varchar(100),
	`Autore` varchar(100),
	`Obiettivo` varchar(100),
	`Descrizione` varchar(100),
	`Generalità` varchar(100),
	`Ipotesi` varchar(100),
	`Limiti` varchar(100),
	`Indicatori_qualità` varchar(100),
    `tool` INT,
    CONSTRAINT `fk_Statistical_Method_is2_Methodological_Tool` FOREIGN KEY (`tool`)
	REFERENCES `CSM_Methodological_Tool` (`ID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
	);
CREATE TABLE CSM_Statistical_Service (
	`ID` 	 	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Metodi_esposti`  varchar(100),
	`Dipendenze` varchar(100),
	`Protocollo` varchar(100),
    `tool` INT,
    CONSTRAINT `fk_CSM_Statistical_Service_is2_Methodological_Tool` FOREIGN KEY (`tool`)
	REFERENCES `CSM_Methodological_Tool` (`ID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
 );
CREATE TABLE CSM_Desktop_Application (
	`ID` 	 	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Dipendenze` varchar(100),
	`Download` varchar(100),
	`Licenza` varchar(100),
	`Linguaggio` varchar(100),
	`Package` varchar(100),
	`Sistema_Operativo` varchar(100),
    `tool` INT,
    CONSTRAINT `fk_CSM_Desktop_Application_is2_Methodological_Tool` FOREIGN KEY (`tool`)
	REFERENCES `CSM_Methodological_Tool` (`ID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
 );
 
 -- Sezione documentale esterna, link alle persone coinvolte nello sviluppo o nella documentazione
CREATE TABLE CSM_Agent (
	`ID` 	 	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Nome` varchar(100),
	`Organizzazione` varchar(100)
	);
CREATE TABLE CSM_link_Agent_tool (
	`agent` 	INT,
    `tool` 	 	INT,
	`Ruolo` varchar(100),
    `Note` varchar(100),
    `Date_riferimento` varchar(100),
    
    primary key (agent,tool),
    CONSTRAINT `fk_CSM_link_Agent_CSM_Methodological_tool` FOREIGN KEY (`agent`)
	REFERENCES `CSM_Agent` (`ID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_CSM_link_Agent_tool_CSM_Methodological_Tool` FOREIGN KEY (`tool`)
	REFERENCES `CSM_Methodological_Tool` (`ID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
    
	);
    
-- Sezione documentale esterna, link alle risorse di documentazione
DROP TABLE IF EXISTS CSM_Documentation;
DROP TABLE IF EXISTS CSM_link_Documentation_tool;

CREATE TABLE CSM_Documentation (
	`ID` 	 	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Nome` varchar(100),
	`EDITORE` varchar(100),
    `Type` varchar(100),
    `Note` varchar(100),
    `Resource` varchar(1000)
	);
CREATE TABLE CSM_link_Documentation_tool (
	`doc` 	INT,
    `tool` 	 	INT,
	
    primary key (doc,tool),
    CONSTRAINT `fk_CSM_Documentation_CSM_Methodological_tool` FOREIGN KEY (`doc`)
	REFERENCES `CSM_Documentation` (`ID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_Link_CSM_Documentation_CSM_Methodological_Tool` FOREIGN KEY (`tool`)
	REFERENCES `CSM_Methodological_Tool` (`ID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
    
	);
	