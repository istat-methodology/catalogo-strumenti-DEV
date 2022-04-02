-- 
-- Insert SELEMIX statistical service
-- 
USE catalog;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';



-- BUSINESS SERVICE
-- truncate csm_business_service;
INSERT INTO csm_business_service (ID, NAME, DESCR) VALUES	(100,'Selective editing','Selective editing is a general approach for the detection of influential errors. It is based on the idea of looking for influential errors with respect to the main results in order to focus the most accurate treatment on the corresponding subset of units to limit the costs of interactive editing, while maintaining the desired level of quality of estimates [GSDEM 2.0]') ;

-- truncate csm_business_function;
INSERT INTO csm_business_function (ID, NAME, DESCR, LABEL, ACTIVE) VALUES (10,	'Selective Editing', 'Influential errors detection', 'SMX',	1);
INSERT INTO csm_business_function (ID, NAME, DESCR, LABEL, ACTIVE) VALUES (20,	'Outlier Detection', 'Outlier detection', 'OUT',	1);
INSERT INTO csm_business_function (ID, NAME, DESCR, LABEL, ACTIVE) VALUES (30,	'Model extimation', 'Model extimates using ECM', 'ECM',	1);

insert into csm_link_gsbpm_business_function values (53,10),(53,20),(53,30),(54,10),(54,20),(54,30);


-- BUSINESS_PROCESS
-- truncate csm_business_process;
INSERT INTO csm_business_process (ID, NAME, DESCR, LABEL, PARENT, ORDER_CODE) VALUES (80,'Selezione errori influenti','Esegue la stima, predizione e valuta gli errori influenti in due processi successivi','Selemix',NULL,1);
INSERT INTO csm_business_process (ID, NAME, DESCR, LABEL, PARENT, ORDER_CODE) VALUES (110,'Stima e predizione modello','Escuzione del processo di stima e predizione del modello','Estimates',80,1);
INSERT INTO csm_business_process (ID, NAME, DESCR, LABEL, PARENT, ORDER_CODE) VALUES (130,'Identificazione errori influenti','Esecuzione del processo di identificazione errori influenti','Selection',80,2);
INSERT INTO csm_business_process (ID, NAME, DESCR, LABEL, PARENT, ORDER_CODE) VALUES (112,'Stima modello di regressione','Estimates regression model','Model',110,1);
INSERT INTO csm_business_process (ID, NAME, DESCR, LABEL, PARENT, ORDER_CODE) VALUES (114,'Predizione','Predicted value estimates','Prediction',110,2);
INSERT INTO csm_business_process (ID, NAME, DESCR, LABEL, PARENT, ORDER_CODE) VALUES (116,'Outlier','Outlier Detection','Outlier',110,3);

-- truncate csm_link_function_process;
INSERT INTO csm_link_function_process (BUSINESS_FUNCTION_ID, BUSINESS_PROCESS_ID) VALUES (10,80),(20,114),(30,112),(20,116);

-- PROCESS_STEP
-- -- truncate csm_process_step;
INSERT INTO csm_process_step (ID, NAME, DESCR, LABEL, BUSINESS_SERVICE_ID) VALUES (100,'MLEST','This function performs the maximum likelihood estimates of the parameters of a contamination model by ECM algorithm and it provides the expected values of the true data for all units that were used for the estimation','MLEST',100);
INSERT INTO csm_process_step (ID, NAME, DESCR, LABEL, BUSINESS_SERVICE_ID) VALUES (150,'MLEST_STRATA','MLEST with stratification','MLEST_STRATA', 100);
INSERT INTO csm_process_step (ID, NAME, DESCR, LABEL, BUSINESS_SERVICE_ID) VALUES (200,'PREDY','On the basis of a set of contamination model parameters, and a set of observed data, it calculates the expected values of the corresponding real data. Missing values for the variables response as well as are allowed, but not for covariates','PREDY',100);
INSERT INTO csm_process_step (ID, NAME, DESCR, LABEL, BUSINESS_SERVICE_ID) VALUES (250,'PREDY_STRATA','PREDY with stratification','PREDY_STRATA',100);
INSERT INTO csm_process_step (ID, NAME, DESCR, LABEL, BUSINESS_SERVICE_ID) VALUES (300,'SELEDIT','This function performs Selective Editing. On the basis of a set of observed data and the corresponding predictions for the true data, it selects the units required for interactive editing','SELEDIT',100);
INSERT INTO csm_process_step (ID, NAME, DESCR, LABEL, BUSINESS_SERVICE_ID) VALUES (350,'SELEDIT_STRATA','SELEDIT with stratification','SELEDIT_STRATA',100);
-- INSERT INTO csm_process_step (ID, NAME, DESCR, LABEL, BUSINESS_SERVICE_ID) VALUES (400,'OUTL','Scelta Outlier',100);
-- INSERT INTO csm_process_step (ID, NAME, DESCR, LABEL, BUSINESS_SERVICE_ID) VALUES (500,'MOD','Imposta Modello',100);

-- -- truncate csm_link_process_step;
INSERT INTO csm_link_process_step (BUSINESS_PROCESS_ID, PROCESS_STEP_ID) VALUES (110,100),(130,300);

-- -- truncate csm_link_function_view_data_type;
INSERT INTO csm_link_function_view_data_type (BUSINESS_FUNCTION_ID, VIEW_DATA_TYPE_ID) 	VALUES (20,1);
-- APPLICATION SERVICE
-- -- truncate csm_app_service;
INSERT INTO csm_app_service (ID, NAME, DESCR, IMPLEMENTATION_LANGUAGE, ENGINE, SOURCE_PATH, SOURCE_CODE, AUTHOR, LICENCE,CONTACT,BUSINESS_SERVICE_ID) 
	VALUES (100,'SeleMix','Selemix is an R package to treat quantitative data, which aims to identify a set of units affected by errors which potentially influence the estimates of interest (selective editing)','R','RSERVE','selemix/csm_selemix.R','','Istat','EUPL1.1','Maria Teresa Buglielli (bugliell@istat.it)',100);
-- STEP INSTANCES
-- -- truncate csm_step_instance;
INSERT INTO csm_step_instance (ID, METHOD, STATMETHOD, DESCR, FUNCTIONALITY, APP_SERVICE_ID) VALUES (1,'csm_mlest',2,'This function performs the maximum likelihood estimates of the parameters of a contamination model by ECM algorithm and it provides the expected values of the â€œtrueâ€� data for all units that were used for the estimation','MLEST',100);
INSERT INTO csm_step_instance (ID, METHOD, STATMETHOD, DESCR, FUNCTIONALITY, APP_SERVICE_ID) VALUES (2,'csm_ypred',2,'On the basis of a set of contamination model parameters, and a set of observed data, it calculates the expected values of the corresponding real data. Missing values for the variables response as well as are allowed, but not for covariates','PREDY',100);
INSERT INTO csm_step_instance (ID, METHOD, STATMETHOD, DESCR, FUNCTIONALITY, APP_SERVICE_ID) VALUES (3,'csm_seledit',2,'This function performs Selective Editing. On the basis of a set of observed data and the corresponding predictions for the true data, it selects the units required for interactive editing','SELEDIT',100);
-- INSERT INTO csm_step_instance (ID, METHOD, DESCR, FUNCTIONALITY, APP_SERVICE_ID) VALUES (4,'csm_strata_mlest','MLEST with stratification','MLEST_STRATA',100);
-- INSERT INTO csm_step_instance (ID, METHOD, DESCR, FUNCTIONALITY, APP_SERVICE_ID) VALUES (5,'csm_strata_ypred','PREDY with stratification','PREDY_STRATA',100);
-- INSERT INTO csm_step_instance (ID, METHOD, DESCR, FUNCTIONALITY, APP_SERVICE_ID) VALUES (6,'csm_strata_seledit','SELEDIT with stratification','SELEDIT_STRATA',100);
-- INSERT INTO csm_step_instance (ID, METHOD, DESCR, FUNCTIONALITY, APP_SERVICE_ID) VALUES (4,'csm_modest','Valutazione del modello','MODEL',100);
-- INSERT INTO csm_step_instance (ID, METHOD, DESCR, FUNCTIONALITY, APP_SERVICE_ID) VALUES (5,'csm_selpairs','Generazione Grafico','GRAPH',100);
-- PARAMETERS
-- -- truncate csm_parameter;
INSERT INTO csm_parameter (ID, NAME, DESCR, DEFAULT_VAL, JSON_TEMPLATE)  VALUES (101,'MODEL','DATA MODEL',NULL,'{ "data": [], "schema": { "type": "array", "items": { "type": "object", "properties": { "layer": { "title": "Layer", "type": "string" }, "N": { "title": "N", "type": "number" }, "is.conv": { "title": "conv", "type": "boolean" }, "lambda": { "title": "lambda", "type": "number" }, "w": { "title": "w", "type": "number" }, "B": { "title": "B", "type": "string" }, "bic_norm": { "title": "bic_norm", "type": "string" }, "bic_mix": { "title": "bic_mix", "type": "string" }, "aic_norm": { "title": "aic_norm", "type": "string" }, "aic_mix": { "title": "aic_mix", "type": "string" }, "sigma": { "title": "sigma", "type": "number" } } } }, "options": { "type": "table", "showActionsColumn": false }}');
INSERT INTO csm_parameter (ID, NAME, DESCR, DEFAULT_VAL, JSON_TEMPLATE)  VALUES (102,'INPUT_PARAMETERS','INPUT PARAMETERS',NULL,'{"data": [],"schema": { "properties": {"graph": {"required": true,"title": "Graph","description": "Activates graphic output","type": "number","default": 0,"minimum": 0.01,"maximum": 10},"model": {"required": true,"title": "Model","description": "Data Distribution: LN lognormal / N Normal","default": "LN"},"tot": {"title": "Tot","description": "Estimates of originals vector for the target variables"},"t.sel": {"title": "t.sel","description": "Optional vector of threshold values for selective edinting on the target variables"},"t.outl": {"required": true,"title": "t.outl","description": "Threshold value for posterior probabilities of identifying outliers","type": "number","default": 0.05,"minimum": 0.01,"maximum": 10},"eps": {"required": true,"title": "eps","description": "Tolerance for the log-likelihood convergence","type": "number","default": 0.0000001,"minimum": 0.0000001,"maximum": 1},"lambda.fix": {"required": true,"title": "lambda.fix","description": "TRUE if w is known","type": "number","default": 0,"maximum": 1 },"w.fix": {"required": true,"title": "w.fix","description": "TRUE if w is known","type": "number","default": 0,"minimum": 0.01,"maximum": 1}},"type": "object" }}');
INSERT INTO csm_parameter (ID, NAME, DESCR, DEFAULT_VAL, JSON_TEMPLATE)  VALUES (103,'OUTPUT_PARAMETERS','OUTPUT PARAMETERS - INFO REPORT',NULL,NULL);
-- ROLES
-- -- truncate csm_app_role;
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (100,'SKIP','N','VARIABILE NON UTILIZZATA',100,1,NULL);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (101,'IDENTIFICATIVO','I','CHIAVE OSSERVAZIONE',1,1,NULL);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (102,'TARGET','y','VARIABILE DI OGGETTO DI ANALISI',3,1,NULL);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (103,'COVARIATA','x','VARIABILE INDIPENDENTE',4,1,NULL);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (104,'PREDIZIONE','ypred','VARIABILE DI PREDIZIONE',5,1,NULL);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (105,'OUTLIER','OUTLIERS','FLAG OUTLIER',6,1,NULL);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (106,'PESO','W','PESO CAMPIONARIO',7,1,NULL);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (107,'ERRORI INFLUENTI','E','ERRORE INFLUENTE',10,1,NULL);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (108,'RANKING','R','INFLUENCE RANKING',11,1,NULL);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (109,'OUTPUT','OUTVARS','VARIABILE DI OUTPUT',20,1,NULL);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (110,'STRATO','STRATA','PARTIZIONAMENTO DEL DATASET',2,1,NULL);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (111,'PARAMETRI','REPORT','PARAMETRI DI INPUT',997,2,102);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (112,'MODELLO','MODEL','MODELLO DATI',998,2,101);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (116,'MODELLO','MDLOUT','MODELLO DATI',998,2,101);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (113,'SCORE','F','INFLUENCE SCORE',12,1,NULL);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (114,'INFO','PARAMETERS','PARAMETRI OUT - INFO RIEPILOGO',999,2,103);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (115,'CONVERGENZA','CONV','VARIABILE DI CONVERGENZA',6,1,NULL);
INSERT INTO csm_app_role (ID, NAME, CODE, DESCR, ORDER_CODE, CLS_DATA_TYPE_ID,PARAMETER_ID) VALUES (117,'AGGREGATES','AGGREGATES','STRATA INFORMATION',995,2,NULL);
-- STEP INSTANCE SIGNATURE
-- -- truncate csm_step_instance_signature;
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (1,1,102,1,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (2,1,103,1,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (3,1,105,2,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (4,1,104,2,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (5,1,110,1,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (6,1,111,1,0);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (7,1,112,2,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (27,1,114,2,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (55,1,115,2,0);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (8,2,102,1,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (9,2,103,1,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (10,2,105,2,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (11,2,104,2,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (12,2,110,1,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (13,2,111,1,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (14,2,112,1,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (28,2,114,2,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (15,3,102,1,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (17,3,104,1,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (18,3,110,1,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (19,3,111,1,0);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (56,3,115,1,0);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (20,3,107,2,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (21,3,108,2,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (22,3,113,2,1);
INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (29,3,114,2,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (23,4,102,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (24,4,103,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (25,4,111,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (26,4,112,2,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (30,4,114,2,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (31,7,111,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (32,7,110,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (33,7,104,2,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (34,7,105,2,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (35,7,103,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (36,7,102,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (37,7,114,2,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (38,9,102,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (39,9,113,2,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (40,9,114,2,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (41,9,111,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (42,9,110,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (43,9,104,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (44,9,108,2,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (45,9,107,2,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (46,8,114,2,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (47,8,103,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (48,8,105,2,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (49,8,104,2,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (50,8,110,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (51,8,111,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (52,8,102,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (53,8,112,1,1);
-- INSERT INTO csm_step_instance_signature (ID, STEP_INSTANCE_ID, APP_ROLE_ID, CLS_TYPE_IO_ID, REQUIRED) VALUES (54,8,111,1,1);
-- -- truncate csm_link_step_instance;
INSERT INTO csm_link_step_instance (PROCESS_STEP_ID,PROCESS_STEP_INSTANCE_ID) VALUES (100,1),(200,2),(300,3);
-- truncate csm_link_business_service_app_role;
INSERT INTO csm_link_business_service_app_role (business_service_ID, app_role_ID) VALUES (100,100),(100,101),(100,102),(100,103),(100,104),(100,105),(100,106),(100,107),(100,108),(100,109),(100,110),(100,111),(100,112),(100,113),(100,114),(100,115);

INSERT INTO `CSM_Methodological_Tool` (`ID`,`Name`,`Description`,`Tags`,`Version`,`Tool_type`,`service`) values 
(100,'Selemix','Detection of outliers and influential errors using a latent variable model','mixture,selective editing,outliers','1.0.2',1,100),
(150,'Selemix','Detection of outliers and influential errors using a latent variable model','mixture,selective editing,outliers','1.0.2',2,100);

insert into csm_tool_gsbpm (gsbpm,tool) values (53,100),(53,150),(54,100),(54,150);


-- INSERT INTO `cls_document_type` (`id`,`name`,`descr`) VALUES (1,'User Guide',NULL),(2,'Paper',NULL),(3,'Technical Note',NULL),(4,'Deliverable',NULL),(6,'Web Resiurce',NULL),(7,'Pubblication',NULL),(8,'Abstract',NULL),(9,'Poster',NULL),(10,'Legal Note',NULL),(11,'Contracts and Administration',NULL);
-- INSERT INTO `cls_tool_type` (`id`,`name`,`descr`) VALUES (1,'statistical service',NULL),(2,'desktop application',NULL),(3,'procedure',NULL),(4,'Statistical Method',NULL);
 
INSERT INTO `csm_statistical_method` ( ID, Name, Description, Notes) VALUES 
(100,'Selemix','Selective Editing via Mixture Models','https://www.istat.it/it/metodi-e-strumenti/metodi-e-strumenti-it/elaborazione/strumenti-di-elaborazione/selemix');
INSERT INTO `csm_link_method_tool` VALUES (100,100),(100,150);


 
-- Sezione process design
INSERT INTO `csm_information_object` (id, name, csm_app_role_ID, csm_business_service_ID) VALUES 
(102,'TARGET',102,100),(103,'COVARIATA',103,100),(104,'PREDIZIONE',104,100),(105,'OUTLIER',105,100),(107,'ERRORI INFLUENTI',107,100),(109,'OUTPUT',109,100),(110,'STRATO',110,100),(112,'MODELLO',112,100);
INSERT INTO `csm_process_design` (id, name, step, type, csm_information_object_id) VALUES
(100,'MLEST',100,1,102),(100,'MLEST',100,1,103),(100,'MLEST',100,2,112),(100,'MLEST',100,2,104),(100,'MLEST',100,2,105), -- MLEST process design (object list)
(150,'MLEST',150,1,102),(150,'MLEST',150,1,103),(150,'MLEST',150,2,112),(150,'MLEST',150,2,104),(150,'MLEST',150,2,105),(150,'MLEST',150,1,110),
(200,'MLEST',200,1,102),(200,'MLEST',200,1,103),(200,'MLEST',200,1,112),(200,'MLEST',200,2,104),(200,'MLEST',200,2,105), -- YPRED process design (object list)
(250,'MLEST',250,1,102),(250,'MLEST',250,1,103),(250,'MLEST',250,1,112),(250,'MLEST',250,2,104),(250,'MLEST',250,2,105),(250,'MLEST',250,1,110),
(300,'MLEST',300,1,102),(300,'MLEST',300,1,104),(300,'MLEST',200,2,107), -- SELEDIT process design (object list)
(350,'MLEST',350,1,102),(350,'MLEST',350,1,104),(350,'MLEST',250,2,107),(350,'MLEST',250,1,110);


-- Specializzazioni del software
INSERT INTO `csm_statistical_service` VALUES (100,'http',NULL,NULL,NULL,NULL,'5.4','Selective Editing',NULL);
INSERT INTO `csm_desktop_application` VALUES (150,'https://www.istat.it/it/files//2015/04/SELEMIX_WIN.zip','EUPL','R Statistical Language',NULL,'Windows','1.0.2',NULL);

-- Sezione documentale esterna, link alle persone coinvolte nello sviluppo o nella documentazione
INSERT INTO `CSM_Agent` (`ID`,`Name`,`Organization`) VALUES (10,'Mario Rossi','Istat'),(20,'Luca Verdi','Eurostat'),(30,'Mauro Bruni','Istat');
INSERT INTO `CSM_link_Agent_tool` (`ID`,`agent`,`tool`,`role`,`Notes`,`Reference_Date`) VALUES 
(1,10,100,'Developer','Note','2010-2020'),(2,20,100,'Referent','Note','2020 onwards'),(3,30,150,'Developer','Note','2010-2020'),(4,20,150,'Referent','Note','2020 onwards');
    
-- Sezione documentale esterna, link alle risorse di documentazione
INSERT INTO `CSM_Documentation` (`ID`,`Name`,`Publisher`,`Document_type`,`Notes`,`Resource`,`tool`) VALUES 
(10,'Selemix','Istat',1,'Note','https://rdrr.io/cran/SeleMix/',100),
(20,'Selemix','Istat',2,'Note','https://cran.r-project.org/package=SeleMix',100);




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET FOREIGN_KEY_CHECKS=1;
-- UPDATE csm_app_service SET SOURCE_CODE = "# Copyright 2019 ISTAT\n# \n#  Licensed under the EUPL, Version 1.1 or â€“ as soon they will be approved by\n#  the European Commission - subsequent versions of the EUPL (the \Licence\);\n#  You may not use this work except in compliance with the Licence. You may\n#  obtain a copy of the Licence at:\n# \n#  http://ec.europa.eu/idabc/eupl5\n# \n#  Unless required by applicable law or agreed to in writing, software\n#  distributed under the Licence is distributed on an \AS IS\ basis, WITHOUT\n#  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the\n#  Licence for the specific language governing permissions and limitations under\n#  the Licence.\n# \n#  @author Francesco Amato <framato @ istat.it>\n#  @author Mauro Bruno <mbruno @ istat.it>\n#  @author Paolo Francescangeli  <pafrance @ istat.it>\n#  @author Renzo Iannacone <iannacone @ istat.it>\n#  @author Stefano Macone <macone @ istat.it>\n#   \n#  @version 1.0.0\n#\nrm(list=ls())\nlibrary(\SeleMix\)\nlibrary(\rjson\)\n\n#   Lista Ruoli\n#0	SKIP				N	VARIABILE NON UTILIZZATA\n#1	IDENTIFICATIVO		I	CHIAVE OSSERVAZIONE\n#2	TARGET			  Y	VARIABILE DI OGGETTO DI ANALISI\n#3	COVARIATA		  X	VARIABILE INDIPENDENTE\n#4	PREDIZIONE			P	VARIABILE DI PREDIZIONE\n#5	OUTLIER			  O	FLAG OUTLIER\n#6	PESO				W	PESO CAMPIONARIO\n#7	ERRORE			  E	ERRORE INFLUENTE\n#8	RANKING			  R	INFLUENCE RANKING\n#9	OUTPUT			  T	VARIABILE DI OUTPUT\n#10	STRATO			  S	PARTIZIONAMENTO DEL DATASET\n#11	PARAMETRI		  Z	PARAMETRI DI ESERCIZIO\n#12	MODELLO			  M	MODELLO DATI\n#13	SCORE			  F	INFLUENCE SCORE\n#14	REPORT			  G	PARAMETRO DI OUTPUT / REPORT\n\n\n# Lista oggetti Bridge Java - R\n# SELEMIX_RESULTSET = \sel_out\;\n# SELEMIX_WORKSET =   \workset\;\n# SELEMIX_RUOLI_VAR = \role_var\;\n# SELEMIX_RUOLI_VAR_OUTPUT = \role_var_out\;\n# SELEMIX_RUOLI_INPUT = \role_in\;\n# SELEMIX_RUOLI_OUTPUT = \ruol_out\;\n# SELEMIX_PARAMETRI = \array_par\;\n# SELEMIX_MODELLO = \array_mod\;\n\n\n### ESEMPI DI MODELLI MONO E MULTIVARIATI\n\n#MODELLO MULTIVARIATO 2 VAR TARGET\n#B <- c(1.78840493, -0.065592887, 0.74442347, -0.009121287, -0.04293598,  1.048079464)\n#sigma <- c(0.17068817, 0.03489681, 0.03489681, 0.49760310)\n#lambda <- 19.96269\n#w <- 0.2122271\n\n#MODELLO MULTIVARIATO CON 2 VAR TARGET SENZA COVAR\n#B <- c(5.973958, 5.112587)\n#sigma <- c(0.3867086, -0.2527695, -0.2527695,  1.2920025)\n#lambda <- 11.205\n#w <- 0.332\n\n#MODELLO MONOVARIATO	\n#B <- c(-0.152, 1.215)\n#sigma <- c(1.25)\n#lambda <- 15.5\n#w <- 0.0479\n\n#MODELLO MONOVARIATO SENZA COVAR	\n#B <- c(-0.152)\n#sigma <- c(1.25)\n#lambda <- 15.5\n#w <- 0.0479\n\n# Impostazione manuale dataset \n#workset <- read.csv2(\'C:/Users/pafrance/photon-workspace/Rscripts/input.strata.csv\', dec=\.\, sep=\;\)\n\n# imposta variabili di ruolo (specifica manualmente chi Ã¨ target, covar ecc ecc)\n#Y <- \Y1\\n#X <- \X1\\n#S <- \S1\\n\n#prova passaggio parametri in json\nml_est_json = function(original_request) {\n    request = fromJSON(original_request)\n    \n    final_result <- csm_mlest(request$workset, request$roles, request$wsparams)\n    \n    JSON_result = toJSON(final_result)\n    return(JSON_result)\n}\n\n\n\n\n#stima completa\ncsm_mlest_ori <- function( workset, roles, wsparams=NULL,...) {\n 	\n	stdout <- vector(\'character\')\n	con <- textConnection(\'stdout\', \'wr\', local = TRUE)\n	\n    x <- workset[roles$X]\n	y <- workset[roles$Y]\n	\n	#Default params\n	model=\LN\\n	t.outl=0.5\n	lambda=3\n	w=0.05\n	lambda.fix=FALSE\n	w.fix=FALSE\n	eps=1e-7\n	max.iter=500	\n	\n	#Parameter check\n	print(wsparams)\n	if(!is.null(wsparams)){\n	\n	print(\asdfffffffffffffffffffffffffffffffffffffffffffff\)\n	print(wsparams$model)\n		if(exists(\wsparams$model\)) model=wsparams$model\n		if(exists(\wsparams$t.outl\)) t.outl=wsparams$t.outl\n		if(exists(\wsparams$lambda\)) lambda=wsparams$lambda\n		if(exists(\wsparams$w\)) w=wsparams$w\n		if(exists(\wsparams$lambda.fix\)) lambda.fix=wsparams$lambda.fix\n		if(exists(\wsparams$w.fix\)) w.fix=wsparams$w.fix\n		if(exists(\wsparams$eps\)) eps=wsparams$eps\n		if(exists(\wsparams$max.iter\)) max.iter=wsparams$max.iter\n 	}\n	\n	#Execute algorithm (mettere un try catch)\n	\n	est <- ml.est(y=y, x=x, model = model, lambda= as.numeric(lambda),  w= as.numeric(w), lambda.fix=lambda.fix, w.fix=w.fix, eps=as.numeric(eps), max.iter=as.numeric(max.iter), t.outl= as.numeric(t.outl), graph=FALSE)\n	if(length(workset)>1) ypred <- matrix(est$ypred,nrow=nrow(workset),ncol=length(roles$Y))\n	else ypred <- as.matrix(est$ypred)\n	\n	#reimpostazione nomi delle variabili\n	outp <- data.frame(tau=est$tau, outlier=est$outlier, pattern=est$pattern)\n	predname = c()\n	out1 = c()\n	for(i in 1:ncol(ypred)) {\n		pred = ypred[,i]\n		predname = c(predname, paste(\YPRED\,i,sep=\_\))\n		out1 <- cbind(out1,pred)\n	}\n	out1=data.frame(out1)\n	colnames(out1) <- predname\n	#output parameters\n	report <- list(n.outlier = sum(est$outlier), missing = sum(as.numeric(est$pattern)),  is.conv = est$is.conv, sing = est$sing, bic.aic = est$bic.aic)\n	mod <- list(B=est$B, sigma=est$sigma, lambda=est$lambda, w=est$w )\n	param_mod <- list( Model = toJSON(mod))\n    #param_mod <- mod	\n	\n	param_report <- list( Report = toJSON(report))\n	#param_report <-  report\n	#setting output roles \n	 \n	#roles <- list (P= c(roles$X,roles$Y, predname,names(outp)), O=\outlier\, M=names(mod), G=names(report))\n	roles <- list (P= c(roles$X,roles$Y, predname,names(outp)), O=\outlier\, M=\Model\,G=\Report\)\n	r_out<-cbind(x,y,outp,out1)\n	rolesgroup <- list (P= c(\P\, \O\),  M=\M\,G=\G\)\n	print(rolesgroup)\n	#result <-list( workset_out=r_out, roles_out=roles,rolesgroup_out=rolesgroup, params_out=mod, report=report, log=stdout)\n	result <-list( workset_out=r_out, roles_out=roles,rolesgroup_out=rolesgroup, params_out=param_mod, report_out=param_report, log=stdout)\n	\n	sink()\n	close(con)\n	return(result)\n}\n\n\n\n\n#stima completa con layer\ncsm_mlest <- function( workset, roles, wsparams=NULL,...) {\n 	\n	stdout <- vector(\'character\')\n	con <- textConnection(\'stdout\', \'wr\', local = TRUE)\n		\n	#Default params\n	model=\LN\\n	t.outl=0.5\n	lambda=3\n	w=0.05\n	lambda.fix=FALSE\n	w.fix=FALSE\n	eps=1e-7\n	max.iter=500	\n	\n	#Parameter check\n	if(!is.null(wsparams)){\n\n		if(exists(\wsparams$model\)) model=wsparams$model\n		if(exists(\wsparams$t.outl\)) t.outl=wsparams$t.outl\n		if(exists(\wsparams$lambda\)) lambda=wsparams$lambda\n		if(exists(\wsparams$w\)) w=wsparams$w\n		if(exists(\wsparams$lambda.fix\)) lambda.fix=wsparams$lambda.fix\n		if(exists(\wsparams$w.fix\)) w.fix=wsparams$w.fix\n		if(exists(\wsparams$eps\)) eps=wsparams$eps\n		if(exists(\wsparams$max.iter\)) max.iter=wsparams$max.iter\n 	}\n	\n	# get DATASET \n    \n	s <- workset[[roles$S]]\n	\n 	layers <- sort(unique(s))\n\n    r_out <-c()\n    print(layers)\n	 mod <-c()\n	param_mod <-c()\n	for(layer in layers){\n		rm(workset_layer)\n		rm(x)\n		rm(y)\n		rm(s1)\n		rm(outp)\n		rm(out1)\n		 \n	    workset_layer <- workset[workset[roles$S]==layer, , drop = TRUE ]\n	  \n	    x <- workset_layer[roles$X]\n		y <- workset_layer[roles$Y]\n		s1 <- workset_layer[roles$S]\n		\n		#Execute algorithm (mettere un try catch)\n		\n		est <-  try(ml.est(y=y, x=x, model = model, lambda= as.numeric(lambda),  w= as.numeric(w), lambda.fix=lambda.fix, w.fix=w.fix, eps=as.numeric(eps), max.iter=as.numeric(max.iter), t.outl= as.numeric(t.outl), graph=FALSE))\n		predname = c()\n		out1 = c()\n		if((\est\%in%ls() & class(est)[1]!=\try-error\)){\n		    if(length(workset_layer)>1) ypred <- matrix(est$ypred,nrow=nrow(workset_layer),ncol=length(roles$Y))\n			else ypred <- as.matrix(est$ypred)\n			\n			#reimpostazione nomi delle variabili\n			outp <- data.frame(tau=est$tau, outlier=est$outlier, pattern=est$pattern)\n			\n			for(i in 1:ncol(ypred)) {\n				pred = ypred[,i]\n				predname = c(predname, paste(\YPRED\,i,sep=\_\))\n				out1 <- cbind(out1,pred)\n			}\n			out1=data.frame(out1)\n			colnames(out1) <- predname\n		}\n		else{\n			 outp <- data.frame(tau=NA, outlier=NA, pattern=NA)\n		}\n			#output \n			r_out<- rbind(r_out, cbind(x,y,s1,outp,out1))\n			\n				 \n			#output parameters\n			mod <- rbind(mod, toJSON(list(layer=layer,B=est$B, sigma=est$sigma, lambda=est$lambda, w=est$w )))\n			\n			#Report output \n			report <- list(n.outlier = sum(est$outlier), missing = sum(as.numeric(est$pattern)),  is.conv = est$is.conv, sing = est$sing, bic.aic = est$bic.aic)\n			param_report <- list( Report = toJSON(report))\n		\n	} \n  		param_mod <- list( Model = toJSON(mod))\n		print(	param_mod)\n	#setting output roles \n	roles <- list (P= c(roles$X,roles$Y,roles$S, predname,names(outp)), O=\outlier\, M=\Model\,G=\Report\)\n	#setting output rolesgroup \n	rolesgroup <- list (P= c(\P\, \O\),  M=\M\,G=\G\)\n		\n	#result \n	result <-list( workset_out=r_out, roles_out=roles,rolesgroup_out=rolesgroup, params_out=param_mod, report_out=param_report, log=stdout)\n	\n	sink()\n	close(con)\n	return(result)\n}\n\n#esecuzione strato\nstrata.mlest <- function(workset, y, x=NULL, s, ...) {\n  #sistemazione dell\'input\n  strata <- as.factor(workset[,S])\n  workset[,Y] <- as.numeric(workset[,Y])\n  workset[,X] <- as.numeric(workset[,X])\n  #init data\n  df <- data.frame()\n  mod <- data.frame()\n  report <- data.frame()\n  #esegue MLEST sullo strato\n  for (i in levels(strata)) {\n    w <- workset[workset[,S]==i, , drop = TRUE ]\n  	est1<- mlest(w, Y, X)\n    df <- rbind(df,  cbind(w, est1$out)) #ricreazione del dataset \n  }\n  #costruisce la lista di ritorno\n  result <-list( out= df, roles= est1$roles, mod = est1$mod, report = est1$report)\n  return(result)\n}\n\n#Predizione da modello\ncsm_ypred <- function(workset, y, x=NULL, ... ) {\n	if(!exists(\model\))  model=\LN\\n	if(!exists(\t.outl\))  t.outl=0.5\n	\n	#environment check\n	if(missing(y)) stop(\'iSS Error: Missing TARGET Variable(s)\')\n	y <- matrix(as.numeric(workset[,Y]),ncol=length(Y),nrow=nrow(workset))\n	if(!missing(x)) x <- matrix(as.numeric(workset[,X]),ncol=length(X),nrow=nrow(workset))\n	\n	if((exists(\'B\')& exists(\'sigma\')& exists(\'lambda\')& exists(\'w\'))) {\n		sizex = ifelse(exists(\X\), length(X), 0)\n		beta <- matrix(as.numeric(B), nrow=1+sizex, ncol=length(Y), byrow=TRUE)\n		s <- matrix(as.numeric(sigma), nrow=length(Y),  ncol=length(Y), byrow=TRUE)\n		l <- as.numeric(lambda)\n		v <- as.numeric(w)\n	}\n	else {\n		stop(\'iSS Error: Missing model\')\n	}\n	est <- pred.y(y=y, x=x, sigma = s, B = beta, model = model, lambda= l,  w= v, t.outl= as.numeric(t.outl))\n	out <- data.frame(est) \n\n	#setting output roles\n	report <- list(n.outlier = sum(est$outlier), missing = sum(as.numeric(est$pattern)) )\n	roles <- list (P=colnames(out)[1:length(Y)], O= \outlier\, G=names(report))\n	result <- list( out=out, roles= roles, report = report)\n	return(result)\n}\n\n#esecuzione strato\nstrata.ypred <- function(workset, y, x=NULL, s, ...) {\n  #sistemazione dell\'input\n  strata <- as.factor(workset[,S])\n  #workset[,S] <- as.factor(workset[,S])\n  workset[,Y] <- as.numeric(workset[,Y])\n  workset[,X] <- as.numeric(workset[,X])\n  \n  #esempio di selezione per strato\n  df <- data.frame()\n  report <- data.frame()\n  #esegue YPRED sullo strato\n  for (i in levels(strata)) {\n  	w <- workset[workset[,S]==i, , drop = TRUE ]\n  	est1<- ypred(w, Y, X) #ypred(w, y=y, x=x, sigma = s, B = beta, model = model, lambda= l,  w= v, t.outl= as.numeric(t.outl))\n    df <- rbind(df,  cbind(w, est1$out)) #ricreazione del dataset \n  }\n  result <-list( out=df, roles= est1$roles, report = est1$report)\n  return(result)\n}\n\n#editing selettivo\ncsm_seledit <- function(workset, y, p, ...) {\n    #controllo environment\n	if(missing(y)|missing(p)) {\n		stop(\'iSS Error: Missing TARGET or PREDICTION Variable(s)\')\n	}\n	if(length(y)!=length(p)) {\n		stop(\'iSS Error: Input dimension mismatch\')\n	}\n	\n	data <- matrix(as.numeric(workset[,Y]),ncol=length(Y),nrow=nrow(workset))\n	ypred <- matrix(as.numeric(workset[,P]),ncol=length(P),nrow=nrow(workset))\n	if(!exists(\wgt\))  wgt=rep(1,nrow(workset))\n	if(!exists(\tot\))  tot=colSums(ypred * wgt) \n	if(!exists(\t.sel\))  t.sel=0.01\n	\n	what <- sel.edit (y=data, ypred=ypred, wgt, tot, t.sel= as.numeric(t.sel))\n	out= data.frame(what)\n	\n	#setting output roles\n	report <- list(n.error = sum(out$sel))\n	roles <- list (E=\sel\, R= \rank\, F=\global.score\, G=names(report))\n	result <-list( out= out, roles= roles, report = report)\n	return(result)\n}\n\n#esecuzione strato\nstrata.seledit <- function(workset, y, p, s, ...) {\n  #sistemazione dell\''input\n  strata <- as.factor(workset[,S])\n  workset[,Y] <- as.numeric(workset[,Y])\n  workset[,P] <- as.numeric(workset[,P])\n\n  #esempio di selezione per strato\n  df <- data.frame()\n  #report <- data.frame()\n  #esegue SELEDIT sullo strato\n  for (i in levels(strata)) {\n  	w <- workset[workset[,S]==i, , drop = TRUE ]\n  	est1<- seledit(w, Y, P) \n    df <- rbind(df,  cbind(w, est1$out)) #ricreazione del dataset \n  }\n  result <-list( out=df, roles= est1$roles, report = est1$report )\n  return(result)\n}\n\n#esecuzione di prova in ambiente R\n#est2 <- strata.mlest(workset, Y, X, S)" WHERE (ID = '100');
