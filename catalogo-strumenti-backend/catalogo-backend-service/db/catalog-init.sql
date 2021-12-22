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
 
 
 -- classificazioni
 truncate `cls_document_type`;
 INSERT INTO `cls_document_type` (`id`,`name`,`descr`) VALUES (1,'User Guide',NULL),(2,'Paper',NULL),(3,'Technical Note',NULL),(4,'Deliverable',NULL),(6,'Web Resiurce',NULL),(7,'Pubblication',NULL),(8,'Abstract',NULL),(9,'Poster',NULL),(10,'Legal Note',NULL),(11,'Contracts and Administration',NULL);
 truncate `cls_tool_type`;
 INSERT INTO `cls_tool_type` (`id`,`name`,`descr`) VALUES (1,'statistical service',NULL),(2,'desktop application',NULL),(3,'procedure',NULL),(4,'Statistical Method',NULL);
 


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




truncate catalog.csm_cls_data_type;
INSERT INTO catalog.csm_cls_data_type VALUES (1, 'VARIABLE', NULL);
INSERT INTO catalog.csm_cls_data_type VALUES (2, 'PARAMETER', NULL);
INSERT INTO catalog.csm_cls_data_type VALUES (3, 'DATASET', NULL);
INSERT INTO catalog.csm_cls_data_type VALUES (4, 'RULESET', NULL);
INSERT INTO catalog.csm_cls_data_type VALUES (5, 'RULE', NULL);
INSERT INTO catalog.csm_cls_data_type VALUES (6, 'MODEL', NULL);


--
-- TOC entry 4917 (class 0 OID 25190)
-- Dependencies: 238
-- Data for Name: csm_cls_rule; Type: TABLE DATA; Schema: catalog; Owner: -
--
truncate catalog.csm_cls_rule;
INSERT INTO catalog.csm_cls_rule VALUES (1, 'Dominio', 'Definisce i valori o le modalità ammissibili della variabile', 'Può comprendere missing e/o zero; distinguere tra variabile qualitativa e quantitativa');
INSERT INTO catalog.csm_cls_rule VALUES (2, 'Coerenza logica', 'Definisce le combinazioni ammissibili di valori e/o modalità tra due o più variabili ', 'Prevalentemente per  variabli qualitative, anche se la regola può riguardare entrambe le tipologie di variabili (es. ETA(0-15) STACIV(coniugato) con ETA fissa)');
INSERT INTO catalog.csm_cls_rule VALUES (3, 'Quadratura', 'Definisce l''uguaglianza ammissibile tra la somma di due o più variabili quantitative e il totale corrispondente (che può essere noto a priori o a sua volta ottenuto dalla somma di altre variabili del dataset)', 'Solo variabili quantitative');
INSERT INTO catalog.csm_cls_rule VALUES (4, 'Disuguaglianza forma semplice', 'Definisce la relazione matematica ammissibile (>, >=, <, <=) tra due variabili quantitative', 'Solo variabili quantitative');
INSERT INTO catalog.csm_cls_rule VALUES (5, 'Disuguaglianza forma composta', 'Definisce la relazione matematica ammissibile (>, >=, <, <=) tra due quantità, dove ciascuna quantità può essere costituita da una sola variabile X o dalla somma/differenza/prodotto tra due o più variabili X', 'Solo variabili quantitative');
INSERT INTO catalog.csm_cls_rule VALUES (6, 'Validazione/Completezza', 'Verifica in base alle regole di compilazione del questionario che i dati siano stati immessi correttamente', 'Distinguere tra variabile qualitativa e quantitativa');
INSERT INTO catalog.csm_cls_rule VALUES (7, 'Editing', NULL, 'Valore di default al caricamento del file');


--
-- TOC entry 4919 (class 0 OID 25198)
-- Dependencies: 240
-- Data for Name: csm_cls_statistical_variable; Type: TABLE DATA; Schema: catalog; Owner: -
--
truncate catalog.csm_cls_statistical_variable;
INSERT INTO catalog.csm_cls_statistical_variable VALUES (1, NULL, 'Variabili identificative delle unità', 8, 1, 'VARIABILI IDENTIFICATIVE DELLE UNITÀ', 'UNIT INDENTIFIER');
INSERT INTO catalog.csm_cls_statistical_variable VALUES (2, NULL, 'Variabili statistiche di classificazione', 1, 2, 'VARIABILI STATISTICHE DI CLASSIFICAZIONE', 'CLASSIFICATION');
INSERT INTO catalog.csm_cls_statistical_variable VALUES (3, NULL, 'Variabili statistiche numeriche', 2, 3, 'VARIABILI STATISTICHE NUMERICHE', 'NUMERIC');
INSERT INTO catalog.csm_cls_statistical_variable VALUES (4, NULL, 'Variabili statistiche testuali', 3, 4, 'VARIABILI STATISTICHE TESTUALI', 'TEXTUAL/OPENED');
INSERT INTO catalog.csm_cls_statistical_variable VALUES (5, NULL, 'Concetti relativi al contenuto dei dati', 6, 5, 'AGGREGATO', 'AGGREGATE');
INSERT INTO catalog.csm_cls_statistical_variable VALUES (6, NULL, 'Concetti di tipo operativo', 4, 6, 'CONCETTI DI TIPO OPERATIVO', 'OPERATIONAL');
INSERT INTO catalog.csm_cls_statistical_variable VALUES (7, NULL, 'Concetti di tipo temporale', 5, 7, 'CONCETTI DI TIPO TEMPORALE', 'TEMPORAL');
INSERT INTO catalog.csm_cls_statistical_variable VALUES (8, NULL, 'Concetti relativi alla frequenza', 7, 8, 'CONCETTI RELATIVI ALLA FREQUENZA', 'FREQUENCY');
INSERT INTO catalog.csm_cls_statistical_variable VALUES (9, NULL, 'Concetti usati per identificare il peso campionario', 10, 9, 'PESO', 'PESO');
INSERT INTO catalog.csm_cls_statistical_variable VALUES (10, NULL, 'Paradati ..', 12, 10, 'PARADATO', 'PARADATA');
INSERT INTO catalog.csm_cls_statistical_variable VALUES (11, NULL, 'Variabili statistiche composte', 11, 11, 'CONCETTI IDENTIFICATIVI DEL DATASET', 'DATASET IDENTIFIER');
INSERT INTO catalog.csm_cls_statistical_variable VALUES (12, NULL, 'Variabili non definite', 9, 12, 'NON DEFINITA', 'UNDEFINED');


--
-- TOC entry 4921 (class 0 OID 25206)
-- Dependencies: 242
-- Data for Name: csm_cls_type_io; Type: TABLE DATA; Schema: catalog; Owner: -
--
truncate catalog.csm_cls_type_io;
INSERT INTO catalog.csm_cls_type_io VALUES (1, 'INPUT');
INSERT INTO catalog.csm_cls_type_io VALUES (2, 'OUTPUT');
INSERT INTO catalog.csm_cls_type_io VALUES (3, 'INPUT_OUTPUT');




-- 
-- GSBPM_PROCESS
--
truncate catalog.csm_gsbpm_process; 
INSERT INTO catalog.csm_gsbpm_process (ID, NAME, PHASE, SUBPROCESS, ACTIVE) 
	VALUES 
        -- (0,'GSBPM Process',null,0,0),
		(1,'Specify needs',0,1,0),
		(2,'Design',0,2,1),
		(3,'Build',0,3,1),
		(4,'Collect',0,4,1),
		(5,'Process',0,5,1),
		(6,'Analyse',0,6,1),
		(7,'Disseminate',0,7,1),
		(8,'Evaluate',0,8,0),
		(11,'Identify needs',1,1,0),
		(12,'Consult and confirm needs',1,2,0),
		(13,'Establish output objectives',1,3,0),
		(14,'Identify concepts',1,4,0),
		(15,'Check data availability',1,5,0),
		(16,'Prepare and submit business case',1,6,0),
		(21,'Design outputs',2,1,1),
		(22,'Design variable descriptions',2,2,1),
		(23,'Design collection',2,3,1),
		(24,'Design frame & sample',2,4,1),
		(25,'Design processing & analysis',2,5,1),
		(26,'Design production systems & workflow',2,6,1),
		(31,'Reuse or build collection instruments',3,1,1),
		(32,'Reuse or build processing and analysis components',3,2,1),
		(33,'Reuse or build dissemination components',3,3,1),
		(34,'Configure workflows',3,4,1),
		(35,'Test production system',3,5,1),
		(36,'Test statistical business process',3,6,1),
		(37,'Finalise production system',3,7,1),
		(41,'Create frame and select sample',4,1,1),
		(42,'Set up collection',4,2,1),
		(43,'Run collection',4,3,1),
		(44,'Finalize collection',4,4,1),
		(51,'Integrate data',5,1,1),
		(52,'Classify & code',5,2,1),
		(53,'Review & validate',5,3,1),
		(54,'Edit & impute',5,4,1),
		(55,'Derive new variables & units',5,5,1),
		(56,'Calculate weights',5,6,1),
		(57,'Calculate aggregates',5,7,1),
		(58,'Finalise data files',5,8,1),
		(61,'Prepare draft outputs',6,1,1),
		(62,'Validate outputs',6,2,1),
		(63,'Interpret & explain outputs',6,3,1),
		(64,'Apply disclosure control',6,4,1),
		(65,'Finalise outputs',6,5,1),
		(71,'Update output systems',7,1,1),
		(72,'Produce dissemination products',7,2,1),
		(73,'Manage release of dissemination products',7,3,1),
		(74,'Promote dissemination products',7,4,1),
		(75,'Manage user support',7,5,1),
		(81,'Update output systems',8,1,0),
		(82,'Produce dissemination products',8,2,0),
		(83,'Manage release of dissemination products',8,3,0);
        

-- TOC entry 4952 (class 0 OID 25312)
-- Dependencies: 273
-- Data for Name: csm_user_roles; Type: TABLE DATA; Schema: catalog; Owner: -
--
truncate catalog.csm_user_roles;
INSERT INTO catalog.csm_user_roles VALUES (1, 'ROLE_ADMIN');
INSERT INTO catalog.csm_user_roles VALUES (2, 'ROLE_USER');


--
-- TOC entry 4954 (class 0 OID 25318)
-- Dependencies: 275
-- Data for Name: csm_users; Type: TABLE DATA; Schema: catalog; Owner: -
--
truncate catalog.csm_users;
INSERT INTO catalog.csm_users VALUES (1, 'admin@is2.it', 'Administrator', 'Workbench', '$2a$10$VB7y/I.oD16QBVaExgH1K.VEuBUKRyXcCUVweUGhs1vDl0waTQPmC', 1);
INSERT INTO catalog.csm_users VALUES (2, 'user@is2.it', 'User', 'Workbench', '$2a$10$yK1pW21E8nlZd/YcOt6uB.n8l36a33RP3/hehbWFAcBsFJhVKlZ82', 2);
INSERT INTO catalog.csm_users VALUES (3, 'fra@fra.it', 'Francesco Amato', 'fra', '$2a$10$DIcyvIFwhDkEOT9nBugTleDM73OkZffZUdfmvjMCEXdJr3PZP8Kxm', 1);


--
-- TOC entry 4956 (class 0 OID 25323)
-- Dependencies: 277
-- Data for Name: csm_view_data_type; Type: TABLE DATA; Schema: catalog; Owner: -
--
truncate catalog.csm_view_data_type;
INSERT INTO catalog.csm_view_data_type VALUES (1, 'DATASET', NULL);
INSERT INTO catalog.csm_view_data_type VALUES (2, 'RULESET', NULL);




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



