-- Inizializzazione sezione catalogo strumenti
use catalog;
 
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

 
 -- Sezione Methodological Tool
truncate `CSM_Methodological_Tool`;        
INSERT INTO `CSM_Methodological_Tool` (`ID`,`Name`,`Description`,`Tags`,`Version`,`Tool_type`,`service`) values 
(100,'Selemix','Detection of outliers and influential errors using a latent variable model','mixture,selective editing,outliers','1.0.2',1,100),
(150,'Selemix','Detection of outliers and influential errors using a latent variable model','mixture,selective editing,outliers','1.0.2',2,100),
(200,'RELAIS','RELAIS (REcord Linkage At IStat) is a toolkit providing a set of techniques for dealing with record linkage projects.','data integration, probabilistic record linkage, string comparators, blocking/sorting/indexing, deduplication, open source software',	'3.1',2,200);

-- 'https://rdrr.io/cran/SeleMix/','https://cran.r-project.org/package=SeleMix','Selective Editing via Mixture Models','Selemix','Selemix','Note', 'https://rdrr.io/cran/SeleMix/csm_statistical_method',
-- 'https://www.istat.it/en/methods-and-loperFtools/methods-and-it-tools/process/processing-tools/relais'
 
 


truncate `csm_statistical_method`;
INSERT INTO `csm_statistical_method` VALUES (1,'Fellegi Sunter','Probabilistic Record Linkage',NULL,NULL,NULL,'https://ec.europa.eu/eurostat/cros/content/fellegi-sunter-and-jaro-approach-record-linkage-method_en'),(2,'Selemix','Selective Editing via Mixture Models',NULL,NULL,NULL,'https://www.istat.it/it/metodi-e-strumenti/metodi-e-strumenti-it/elaborazione/strumenti-di-elaborazione/selemix');
truncate `csm_link_method_tool`;
INSERT INTO `csm_link_method_tool` VALUES (2,100),(2,150),(1,200);
 
-- Sezione process design

-- Specializzazioni del software
truncate `csm_desktop_application`;
INSERT INTO `csm_desktop_application` VALUES (100,'https://www.istat.it/it/files//2015/04/SELEMIX_WIN.zip','EUPL','R Statistical Language',NULL,'Windows','1.0.2',NULL),(200,'https://www.istat.it/it/files//2020/03/RELAIS_3.1.zip','EUPL 1.1','R and SQL',NULL,'Windows','3.1',NULL);
truncate `csm_statistical_service`;
INSERT INTO `csm_statistical_service` VALUES (100,'http',NULL,NULL,NULL,NULL,'5.4','Selective Editing',NULL);

-- Sezione documentale esterna, link alle persone coinvolte nello sviluppo o nella documentazione
truncate `CSM_Agent`; 
INSERT INTO `CSM_Agent` (`ID`,`Name`,`Organization`) VALUES (10,'Mario Rossi','Istat'),(20,'Luca Verdi','Eurostat'),(30,'Luca Valente','Istat');
truncate `CSM_link_Agent_tool`;
INSERT INTO `CSM_link_Agent_tool` (`agent`,`tool`,`role`,`notes`,`reference_date`) VALUES (10,100,'Developer','Note','2010-2020'),(20,100,'Referent','Note','2020 onwards'),(30,200,'Developer','Note','2005-2015');
    
-- Sezione documentale esterna, link alle risorse di documentazione
truncate `CSM_Documentation`;
INSERT INTO CSM_Documentation (`ID`,`Name`,`Publisher`,`Document_type`,`Notes`,`Resource`,`tool`) VALUES (10,'Selemix','Istat',1,'Note','https://cran.r-project.org/package=SeleMix',100),(20,'Relais','Istat',1,'Note','https://www.istat.it/it/files/2014/03/Relais3.1UserGuide.pdf',200);


insert into catalog.csm_tool_gsbpm values (100, 22);
insert into catalog.csm_tool_gsbpm values (100, 23);
insert into catalog.csm_tool_gsbpm values (150, 23);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



 
 

