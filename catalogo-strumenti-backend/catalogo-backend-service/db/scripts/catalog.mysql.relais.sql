-- 
-- Insert SELEMIX statistical service
-- 
USE catalog;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- RELAIS init script
INSERT INTO csm_business_service VALUES (200, 'Relais', 'Record Linkage at Istat');
INSERT INTO `CSM_Methodological_Tool` (`ID`,`Name`,`Description`,`Tags`,`Version`,`Tool_type`,`service`) values 
(200,'RELAIS','RELAIS (REcord Linkage At IStat) is a toolkit providing a set of techniques for dealing with record linkage projects.','data integration, probabilistic record linkage, string comparators, blocking/sorting/indexing, deduplication, open source software',	'3.1',2,200);

insert into csm_tool_gsbpm (gsbpm,tool) values (53,200);

-- 'https://www.istat.it/en/methods-and-loperFtools/methods-and-it-tools/process/processing-tools/relais'

INSERT INTO `csm_statistical_method` ( ID, Name, Description, Notes) VALUES (200,'Fellegi Sunter','Probabilistic Record Linkage','https://ec.europa.eu/eurostat/cros/content/fellegi-sunter-and-jaro-approach-record-linkage-method_en');
INSERT INTO `csm_link_method_tool` VALUES (200,200);


INSERT INTO `csm_desktop_application` VALUES (200,'https://www.istat.it/it/files//2020/03/RELAIS_3.1.zip','EUPL 1.1','R and SQL',NULL,'Windows','3.1',NULL);

-- TOC entry 4938 (class 0 OID 25260)
-- Dependencies: 259
-- Data for Name: csm_parameter; Type: TABLE DATA; Schema: is2; Owner: -
--

INSERT INTO csm_parameter (id, name, descr, default_val, json_template) VALUES (1, 'MATCHING VARIABLES', 'MATCHING VARIABLES', NULL, '{"data":[],"schema":{"items":{"properties":{"MatchingVariable":{"maxLength":50,"required":true,"title":"MatchingVariable","type":"string"},"MatchingVariableA":{"maxLength":50,"required":true,"title":"MatchingVariableA","type":"string"},"MatchingVariableB":{"maxLength":50,"required":true,"title":"MatchingVariableB","type":"string"},"Method":{"enum":["Equality","Jaro","Dice","JaroWinkler","Levenshtein","3Grams","Soundex","NumericComparison","NumericEuclideanDistance","WindowEquality","Inclusion3Grams","SimHash","Weighed3Grams"],"required":true,"title":"Method"},"Threshold":{"title":"Threshold","type":"number"},"Window":{"title":"Window","type":"integer"}},"type":"object"},"type":"array"},"options":{"type":"table","showActionsColumn":true,"hideAddItemsBtn":true,"items":{"fields":{"Method":{"type":"select","noneLabel":"","removeDefaultNone":false},"MatchingVariableA":{"type":"select","noneLabel":"","dataSource":"matchedVariablesbyRoles.X1"},"MatchingVariableB":{"type":"select","noneLabel":"","dataSource":"matchedVariablesbyRoles.X2"}}},"form":{"buttons":{"addRow":"addRow","removeRow":"removeRow"}},"view":{"templates":{"container-table":"#tableTemplate","container-array-toolbar":"#addItemsBtn","container-array-actionbar":"#rowItemBtn"}}}}');
INSERT INTO csm_parameter (id, name, descr, default_val, json_template) VALUES (2, 'THRESHOLD MATCHING', 'THRESHOLD MATCHING', '1', '{"data":[],"schema":{"name":"THRESHOLD MATCHING","type":"number", "minimum": 0.01,"maximum": 1}}');
INSERT INTO csm_parameter (id, name, descr, default_val, json_template)  VALUES (3, 'THRESHOLD UNMATCHING', 'THRESHOLD UNMATCHING', '1', '{"data":[],"schema":{"name":"THRESHOLD UNMATCHING","type":"number", "minimum": 0.01,"maximum": 1}}');

INSERT INTO csm_parameter (id, name, descr, default_val, json_template) VALUES (5, 'BLOCKING VARIABLES', 'BLOCKING VARIABLES', NULL, '{"data":[],"schema":{"type":"object", "properties": { "BLOCKING_A": { "type":"array", "title":"BLOCKING A","items": {"type": "string"} }, "BLOCKING_B": { "type":"array", "title":"BLOCKING B" ,"items": {"type": "string"}} }}, "options": {"fields":{"BLOCKING_A":{"type":"array",    "toolbarSticky": true,"items":{"type":"select","noneLabel":"","dataSource":"matchedVariables"}},"BLOCKING_B":{"type":"array",   "toolbarSticky": true, "items":{"type":"select","noneLabel":"","dataSource":"matchedVariables"}}}}}');
INSERT INTO csm_parameter (id, name, descr, default_val, json_template) VALUES (20, 'REDUCTION METHOD', 'REDUCTION METHOD', NULL, '{"data":[],"schema":{"type":"object","properties":{"REDUCTION-METHOD":{"type":"string","enum":["CartesianProduct","BlockingVariables","SortedNeighborhood","SimHash"]},"BLOCKING":{"type":"object","hidden":true,"name":"BLOCKING VARIABLES","properties":{"BLOCKING A":{"type":"array","required":false,"title":"BLOCKING A","items":{"type":"string"},"properties":{}},"BLOCKING B":{"type":"array","required":false,"title":"BLOCKING B","items":{"type":"string"},"properties":{}}}},"SORTED NEIGHBORHOOD":{"type":"object","hidden":true,"name":"SORTING VARIABLES","properties":{"SORTING A":{"type":"array","required":false,"title":"SORTING A","items":{"type":"string"},"properties":{}},"SORTING B":{"type":"array","required":false,"title":"SORTING B","items":{"type":"string"},"properties":{}},"WINDOW":{"title":"WINDOW","type":"integer","width":"10"}}},"SIMHASH":{"type":"object","hidden":true,"name":"SHINGLING VARIABLES","properties":{"SHINGLING A":{"type":"array","required":false,"title":"SHINGLING A","items":{"type":"string"},"properties":{}},"SHINGLING B":{"type":"array","required":false,"title":"SHINGLING B","items":{"type":"string"},"properties":{}},"HDTHRESHOLD":{"type":"string","items":{"type":"string"},"required":true},"ROTATIONS":{"type":"string","title":"NUMBER OF ROTATIONS","items":{"type":"string"},"required":true}}}}},"options":{"fields":{"REDUCTION-METHOD":{"type":"select","label":"REDUCTION METHOD","removeDefaultNone":true,"id":"REDUCTION-METHOD","sort":false,"optionLabels":["CROSS PRODUCT","BLOCKING","SORTED NEIGHBORHOOD","SIMHASH"]},"BLOCKING":{"type":"object","fields":{"BLOCKING A":{"label":"BLOCKING A","type":"select","multiple":true,"sort":false,"removeDefaultNone":true,"dataSource":"matchedVariablesbyRoles.X1"},"BLOCKING B":{"label":"BLOCKING B","type":"select","sort":false,"removeDefaultNone":true,"dataSource":"matchedVariablesbyRoles.X2"}}},"SORTED NEIGHBORHOOD":{"type":"object","fields":{"SORTING A":{"label":"SORTING KEY A","type":"select","sort":false,"multiple":true,"removeDefaultNone":true,"dataSource":"matchedVariablesbyRoles.X1"},"SORTING B":{"label":"SORTING KEY B","type":"select","sort":false,"removeDefaultNone":true,"dataSource":"matchedVariablesbyRoles.X2"}}},"SIMHASH":{"type":"object","fields":{"SHINGLING A":{"label":"SHINGLING KEY A","type":"select","sort":false,"multiple":true,"removeDefaultNone":true,"dataSource":"matchedVariablesbyRoles.X1"},"SHINGLING B":{"label":"SHINGLING KEY B","type":"select","sort":false,"removeDefaultNone":true,"dataSource":"matchedVariablesbyRoles.X2"},"HDTHRESHOLD":{"label":"HAMMING DISTANCE THRESHOLD","type":"select","removeDefaultNone":true,"dataSource":["30","35","40","45","50"]},"ROTATIONS":{"label":"NUMBER OF ROTATIONS","type":"select","removeDefaultNone":true,"dataSource":[" 4"," 8","16","32"]}}}}},"postRender":"reduction"}');
INSERT INTO csm_parameter (id, name, descr, default_val, json_template) VALUES (21, 'INDEXES MATCHED', 'INDEXES MATCHED', NULL, NULL);

INSERT INTO csm_parameter (id, name, descr, default_val, json_template)  VALUES (30, 'P', 'MATCH FREQUENCY IN SEARCH SPACE', NULL, '{"data":[],"schema":{"name":"P","type":"number", "minimum": 0.000001,"maximum": 1}}');

-- TOC entry 4938 (class 0 OID 25260)
-- Dependencies: 259
-- Data for Name: csm_app_role; Type: TABLE DATA; Schema: is2; Owner: -
--

INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (1, 'X', 'MATCHING VARIABLES', 'MATCHING VARAIBLES', 1, 2, 1);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (2, 'X1', 'VARIABLES DATASET A', 'SELECTED VARIABLES IN DATASET A', 2, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (3, 'X2', 'VARIABLES DATASET B', 'SELECTED VARIABLES IN DATASET B', 3, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (4, 'CT', 'CONTINGENCY TABLE', 'CONTINGENCY TABLE', 4, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (5, 'FS', 'MU TABLE', 'MU TABLE', 14, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (6, 'B', 'BLOCKING', 'SLICING DEL DATASET', 7, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (7, 'MT', 'MATCHING TABLE', 'MATCHING TABLE', 8, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (8, 'TH', 'THRESHOLD MATCHING', 'THRESHOLD MATCHING', 9, 2, 2);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (9, 'TU', 'THRESHOLD UNMATCHING', 'THRESHOLD UNMATCHING', 10, 2, 3);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (10, 'PM', 'POSSIBLE MATCHING TABLE', 'POSSIBLE MATCHING TABLE', 11, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (13, 'RA', 'RESIDUAL A', 'RESIDUAL DATASET  A', 12, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (14, 'RB', 'RESIDUAL B', 'RESIDUAL DATASET  B', 13, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (15, 'MD', 'DATA', 'DATA', 1, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (16, 'RS', 'RULESET', 'RULESET', 2, 4, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (17, 'MP', 'MARGINAL PROBABILITIES', 'MARGINAL PROBABILITIES', 17, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (18, 'BA', 'BLOCKING A', 'SLICING DEL DATASET A', 18, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (19, 'BB', 'BLOCKING B', 'SLICING DEL DATASET B', 19, 1, NULL);

INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (20, 'RM', 'REDUCTION METHOD', 'METHOD OF REDUCTION OF THE SEARCH SPACE', 20, 2,20 );

INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID, HIDDEN)  VALUES (21, 'CIT','INDEXES MATCHED', 'INDEX ROWS MATCHED CONTENGENCY TABLE', 21, 1,21,'Y');
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (22, 'MTR', 'MATCHING TABLE REDUCED', 'MATCHING TABLE WITH CONSTRAINT', 22, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (23, 'QI', 'QUALITY INDICATORS', 'QUALITY INDICATORS OF RESULTS', 14, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (24, 'PMR', 'POSSIBLE MATCHING TABLE REDUCED', 'POSSIBLE MATCHING TABLE WITH CONSTRAINT', 22, 1, NULL);

INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (26, 'MPV', 'MARGINALS-VARNAMES', 'MARGINAL PROBABILITIES: VARIABLE NAMES', 26, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (27, 'MPC', 'MARGINALS-COMPARISON', 'MARGINAL PROBABILITIES: VARIABLE NAMES', 27, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (28, 'MPM', 'MARGINALS-MFREQ', 'MARGINAL PROBABILITIES: VARIABLE NAMES', 28, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (29, 'MPU', 'MARGINALS-UFREQ', 'MARGINAL PROBABILITIES: VARIABLE NAMES', 29, 1, NULL);
INSERT INTO csm_app_role (ID, CODE, NAME, DESCR, ORDER_CODE,CLS_DATA_TYPE_ID, PARAMETER_ID)  VALUES (30, 'P', 'P', 'MATCH FREQUENCY IN SEARCH SPACE', 30, 2, 30);
--
-- TOC entry 4907 (class 0 OID 25150)
-- Dependencies: 228
-- Data for Name: csm_app_service; Type: TABLE DATA; Schema: is2; Owner: -
--

INSERT INTO csm_app_service (ID, NAME, DESCR, IMPLEMENTATION_LANGUAGE, ENGINE,SOURCE_PATH, SOURCE_CODE, AUTHOR, LICENCE,CONTACT,BUSINESS_SERVICE_ID) 
	VALUES  
		(200,'Relais','R package implementing record linkage methods','R','RENJIN','relais/relais.R','','Istat','EUPL1.1','Luca Valentino (luvalent@istat.it)',200),
		(250,'Relais Java','Java package implementing record linkage methods','JAVA','JAVA','it.istat.is2.catalogue.relais.service.RelaisService','','Istat','EUPL1.1','Luca Valentino (luvalent@istat.it)',200);
	
 --
-- TOC entry 4909 (class 0 OID 25158)
-- Dependencies: 230
-- Data for Name: csm_business_function; Type: TABLE DATA; Schema: is2; Owner: -
--

INSERT INTO csm_business_function (ID, NAME, DESCR, LABEL, ACTIVE) VALUES (1, 'Record Linkage', 'The purpose of record linkage is to identify the same real world entity that can be differently represented in data sources, even if unique identifiers are not available or are affected by errors.', 'RL', 1);

--
-- TOC entry 4911 (class 0 OID 25166)
-- Dependencies: 232
-- Data for Name: csm_business_process; Type: TABLE DATA; Schema: is2; Owner: -
--

INSERT INTO csm_business_process (id, name, descr, label, order_code, parent) VALUES (1, 'Probabilistic Record Linkage', 'Probabilistic Record Linkage', 'PRL', 1, NULL);
INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (2, 'Deterministic Record Linkage', 'Deterministic Record Linkage', 'DRL', 2, NULL);
INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (3, 'Probabilistic Record Linkage reading Marginals', 'Probabilistic Record Linkage reading Marginals', 'MAR', 3, NULL);

INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (70, 'Contingency Table', 'Calculate contingency table', 'CrossTable', 1, 1);
INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (71, 'Fellegi Sunter', 'Fellegi Sunter algorithm', 'FellegiSunter', 2, 1);
INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (72, 'Matching Table', 'Matching records', 'MatchingTable', 3, 1);
INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (77, 'Matching constraint', 'Constraint apply on matches', 'MatchingTableReduced', 4, 1);
INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (78, 'Residuals', 'Create residuals', 'Residuals', 5, 1);

INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (5, 'Probabilistic Record Linkage Batch', 'Probabilistic Record Linkage Batch', 'PRL batch', 1, NULL);
INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (73, 'PRL batch', 'One process with all workflow steps  ', 'PRL batch', 1, 5);

INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (170, 'Contingency Table', 'Calculate contingency table', 'CrossTable', 1, 2);
INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (76, 'Deterministic Record Linkage', 'Deterministic Record Linkage', 'DRL', 2, 2);
INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (178, 'Residuals', 'Create residuals', 'Residuals', 4, 2);

INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (270, 'Contingency Table', 'Calculate contingency table', 'CrossTable', 1, 3);
INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (271, 'Read Marginals', 'Read Marginals Probabilities', 'FellegiSunter', 2, 3);
INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (272, 'Matching Table', 'Matching records', 'MatchingTable', 3, 3);
INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (273, 'Matching constraint', 'Constraint apply on matches', 'MatchingTableReduced', 4, 3);
INSERT INTO csm_business_process (id, name, descr, label, order_code, parent)  VALUES (274, 'Residuals', 'Create residuals', 'Residuals', 5, 3);


--
-- TOC entry 4931 (class 0 OID 25237)
-- Dependencies: 252
-- Data for Name: csm_link_business_service_app_role; Type: TABLE DATA; Schema: is2; Owner: -
--

INSERT INTO csm_link_business_service_app_role VALUES (200, 1);
INSERT INTO csm_link_business_service_app_role VALUES (200, 2);
INSERT INTO csm_link_business_service_app_role VALUES (200, 3);
INSERT INTO csm_link_business_service_app_role VALUES (200, 4);
INSERT INTO csm_link_business_service_app_role VALUES (200, 5);
INSERT INTO csm_link_business_service_app_role VALUES (200, 6);
INSERT INTO csm_link_business_service_app_role VALUES (200, 7);
INSERT INTO csm_link_business_service_app_role VALUES (200, 8);
INSERT INTO csm_link_business_service_app_role VALUES (200, 9);
INSERT INTO csm_link_business_service_app_role VALUES (200, 10);


INSERT INTO csm_link_business_service_app_role VALUES (200, 13);
INSERT INTO csm_link_business_service_app_role VALUES (200, 14);

INSERT INTO csm_link_business_service_app_role VALUES (200, 17);

INSERT INTO csm_link_business_service_app_role VALUES (200, 18);
INSERT INTO csm_link_business_service_app_role VALUES (200, 19);

INSERT INTO csm_link_business_service_app_role VALUES (200, 20);
INSERT INTO csm_link_business_service_app_role VALUES (200, 21);

INSERT INTO csm_link_business_service_app_role VALUES (200, 22);
INSERT INTO csm_link_business_service_app_role VALUES (200, 23);
INSERT INTO csm_link_business_service_app_role VALUES (200, 24);

INSERT INTO csm_link_business_service_app_role VALUES (200, 26);
INSERT INTO csm_link_business_service_app_role VALUES (200, 27);
INSERT INTO csm_link_business_service_app_role VALUES (200, 28);
INSERT INTO csm_link_business_service_app_role VALUES (200, 29);
INSERT INTO csm_link_business_service_app_role VALUES (200, 30);

--
-- TOC entry 4932 (class 0 OID 25240)
-- Dependencies: 253
-- Data for Name: csm_link_function_process; Type: TABLE DATA; Schema: is2; Owner: -
--

INSERT INTO csm_link_function_process VALUES (1, 1),(1, 2),(1, 3),(1, 5);

INSERT INTO csm_link_function_process VALUES (1,70 ),(1,71 ),(1,72 ),(1,77 ),(1,78 );
-- INSERT INTO csm_link_function_process VALUES (5,73 ),(2,170),(2,76 ),(2,178),(3,270);
-- INSERT INTO csm_link_function_process VALUES (3,271),(3,272),(3,273),(3,274);
--
-- TOC entry 4933 (class 0 OID 25243)
-- Dependencies: 254
-- Data for Name: csm_link_function_view_data_type; Type: TABLE DATA; Schema: is2; Owner: -
--

INSERT INTO csm_link_function_view_data_type VALUES (1, 1);


--
-- TOC entry 4940 (class 0 OID 25268)
-- Dependencies: 261
-- Data for Name: csm_process_step; Type: TABLE DATA; Schema: is2; Owner: -
--

INSERT INTO csm_process_step ( id, name, label, descr, business_service_id) VALUES (70, 'Contingency Table', 'CONTINGENCY_TABLE','Calculate contingency table', 200);
INSERT INTO csm_process_step ( id, name, label, descr, business_service_id)  VALUES (71, 'Fellegi Sunter', 'FELLEGI_SUNTER','Fellegi Sunter algorithm', 200);
INSERT INTO csm_process_step ( id, name, label, descr, business_service_id)  VALUES (72, 'Matching Table','MATCHING_TABLE', 'Matching records', 200);
INSERT INTO csm_process_step ( id, name, label, descr, business_service_id)  VALUES (77, 'Matching constraint (optional)', 'MATCHING_TABLE_REDUCED','Constraint apply on matches', 200);
INSERT INTO csm_process_step ( id, name, label, descr, business_service_id)  VALUES (78, 'Residuals (optional)', 'RESIDUALS','Create residuals (not matched)', 200);

INSERT INTO csm_process_step  ( id, name, label, descr, business_service_id) VALUES (76, 'Deterministic Matching Table','DETERMINISTIC_MATCHING_TABLE', 'Deterministic Matching records', 200);

INSERT INTO csm_process_step  ( id, name, label, descr, business_service_id) VALUES (80, 'Read Marginals','FELLEGI_SUNTER', 'Read Marginal probabilities', 200);


--
-- TOC entry 4934 (class 0 OID 25246)
-- Dependencies: 255
-- Data for Name: csm_link_process_step; Type: TABLE DATA; Schema: is2; Owner: -
--


INSERT INTO csm_link_process_step VALUES (70, 70);
INSERT INTO csm_link_process_step VALUES (71, 71);
INSERT INTO csm_link_process_step VALUES (72, 72);
INSERT INTO csm_link_process_step VALUES (77, 77);
INSERT INTO csm_link_process_step VALUES (78, 78);

INSERT INTO csm_link_process_step VALUES (73, 70);
INSERT INTO csm_link_process_step VALUES (73, 71);
INSERT INTO csm_link_process_step VALUES (73, 72);

INSERT INTO csm_link_process_step VALUES (170, 70);
INSERT INTO csm_link_process_step VALUES (76, 76);
INSERT INTO csm_link_process_step VALUES (178, 78);

INSERT INTO csm_link_process_step VALUES (270, 70);
INSERT INTO csm_link_process_step VALUES (271, 80);
INSERT INTO csm_link_process_step VALUES (272, 72);
INSERT INTO csm_link_process_step VALUES (273, 77);
INSERT INTO csm_link_process_step VALUES (274, 78);

--
-- TOC entry 4946 (class 0 OID 25294)
-- Dependencies: 267
-- Data for Name: csm_step_instance; Type: TABLE DATA; Schema: is2; Owner: -
--

INSERT INTO csm_step_instance (id, method, descr, functionality, app_service_id, statmethod) VALUES (11, 'probabilisticContingencyTable', 'This function calculates the contingency Table', 'ContingencyTable', 250, 200);
INSERT INTO csm_step_instance (id, method, descr, functionality, app_service_id, statmethod)  VALUES (12, 'fellegisunter', 'This function implements the Fellegi Sunter algorithm', 'FellegiSunter', 200, 200);
INSERT INTO csm_step_instance (id, method, descr, functionality, app_service_id, statmethod)  VALUES (13, 'probabilisticResultTablesByIndex', 'This function calculates the Matching Table', 'MatchingTable', 250, 200);
INSERT INTO csm_step_instance (id, method, descr, functionality, app_service_id, statmethod)  VALUES (14, 'reducedResultTablesGreedy',  'This function implements the constraint on matches', 'MatchingTableReduced', 250, 200);
INSERT INTO csm_step_instance (id, method, descr, functionality, app_service_id, statmethod)  VALUES (15, 'createResiduals',  'This function calculates Residual Tables', 'Residuals', 250, 200);
-- INSERT INTO csm_step_instance (id, method, descr, functionality, app_service_id, statmethod)  VALUES (15, 'contingencyTableBlocking', 'This function calculates the contingency Table with Blocking variable', 'ContingencyTableBlocking', 250);
-- INSERT INTO csm_step_instance (id, method, descr, functionality, app_service_id, statmethod)  VALUES (16, 'resultTablesBlocking', 'This function calculates the Matching Table with Blocking variable', 'MatchingTableBlocking', 250);
INSERT INTO csm_step_instance (id, method, descr, functionality, app_service_id, statmethod)  VALUES (20, 'deterministicResultTablesByIndex', 'This function calculates the Matching Table with Deterministic Rule', 'MatchingTable', 250, 200);
INSERT INTO csm_step_instance (id, method, descr, functionality, app_service_id, statmethod)  VALUES (21, 'mufrommarginals', 'This function apply Fellegi Sunter model from read marginal probabilities', 'FellegiSunter', 200, 200);

--
-- TOC entry 4935 (class 0 OID 25249)
-- Dependencies: 256
-- Data for Name: csm_link_step_instance; Type: TABLE DATA; Schema: is2; Owner: -
--

INSERT INTO csm_link_step_instance VALUES (70, 11);
INSERT INTO csm_link_step_instance VALUES (71, 12);
INSERT INTO csm_link_step_instance VALUES (72, 13);
INSERT INTO csm_link_step_instance VALUES (77, 14);
INSERT INTO csm_link_step_instance VALUES (78, 15);


-- INSERT INTO csm_link_step_instance VALUES (73, 15);
-- INSERT INTO csm_link_step_instance VALUES (75, 16);
INSERT INTO csm_link_step_instance VALUES (76, 20);
INSERT INTO csm_link_step_instance VALUES (80, 21);



--
-- TOC entry 4948 (class 0 OID 25302)
-- Dependencies: 269
-- Data for Name: csm_step_instance_signature; Type: TABLE DATA; Schema: is2; Owner: -
--

INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (166, 1, 1, 11, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (154, 1, 2, 11, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (155, 1, 3, 11, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (156, 1, 20, 11, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (161, 0, 7, 11, 2);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (162, 0,21, 11, 2);

INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (167, 1, 4, 12, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (168, 0, 5, 12, 2);

INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (169, 1, 2, 13, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (170, 1, 3, 13, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (171, 1, 5, 13, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (175, 1, 21, 13, 1);

INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (173, 0, 7, 13, 2);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (176, 1, 8, 13, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (177, 1, 9, 13, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (178, 0, 23, 13, 2);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (179, 0, 10, 13, 2);

-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (180, 1, 1, 15, 1);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (181, 1, 2, 15, 1);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (182, 1, 3, 15, 1);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (183, 0, 7, 15, 2);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (184, NULL, 11, 15, 2);

-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (195, 1, 18, 15, 1);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (196, 1, 19, 15, 1);


-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (185, 1, 2, 16, 1);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (186, 1, 3, 16, 1);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (187, 1, 5, 16, 1);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (188, 0, 4, 16, 1);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (189, NULL, 7, 16, 2);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (190, 1, 8, 16, 1);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (191, 1, 9, 16, 1);
 
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (197, 1, 18, 16, 1);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (198, 1, 19, 16, 1);

INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (194, 0, 17, 12, 2);

INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (195, 1, 7, 14, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (197, 0, 22, 14, 2);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (205, 1, 10, 14, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (207, 0, 24, 14, 2);

INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (210, 1, 7, 15, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (211, 0, 22, 15, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (212, 1, 2, 15, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (213, 1, 3, 15, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (214, 0, 13, 15, 2);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (215, 0, 14, 15, 2);

-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (200, 1, 1, 20, 1);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (201, 1, 2, 20, 1);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (202, 1, 3, 20, 1);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (203, 1, 20, 20, 1);
-- INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (204, 1, 7, 20, 2);

INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (200, 0, 4, 20, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (201, 1, 2, 20, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (202, 1, 3, 20, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (203, 1, 21, 20, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (204, 0, 7, 20, 2);

INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (220, 1, 4, 21, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (221, 1, 26, 21, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (222, 1, 27, 21, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (223, 1, 28, 21, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (224, 1, 29, 21, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (225, 1, 30, 21, 1);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (226, 0, 5, 21, 2);
INSERT INTO csm_step_instance_signature (id, required, app_role_id, step_instance_id, cls_type_io_id) VALUES (227, 0, 17, 21, 2);

-- Sezione documentale esterna, link alle persone coinvolte nello sviluppo o nella documentazione
INSERT INTO `CSM_Agent` (`ID`,`Name`,`Organization`) VALUES (50,'Marina Belli','Istat');
INSERT INTO `CSM_Agent` (`ID`,`Name`,`Organization`) VALUES (20,'Luca Valente','Istat');
INSERT INTO `CSM_link_Agent_tool` (`ID`,`agent`,`tool`,`role`,`notes`,`reference_date`) VALUES (5,50,200,'Developer','Note','2010-2020'),(6,20,200,'Referente','Note','2020 onwards');
    
-- Sezione documentale esterna, link alle risorse di documentazione
INSERT INTO CSM_Documentation (`ID`,`Name`,`Publisher`,`Document_type`,`Notes`,`Resource`) VALUES 
(40,'Relais','Istat',1,'Note','https://www.istat.it/it/files/2014/03/Relais3.1UserGuide.pdf');

INSERT INTO `CSM_link_Documentation_tool` VALUES (40,200);

-- Sezione process design

INSERT INTO `csm_information_object` (id, csm_app_role_ID, csm_business_service_ID, name, descr) VALUES 
(501, 1,  200, 'MATCHING VARIABLES', 'MATCHING VARAIBLES'),
(502, 2,  200, 'VARIABLES DATASET A', 'SELECTED VARIABLES IN DATASET A'),
(503, 3,  200, 'VARIABLES DATASET B', 'SELECTED VARIABLES IN DATASET B'),
(504, 4,  200, 'CONTINGENCY TABLE', 'CONTINGENCY TABLE'),
(505, 5,  200, 'MU TABLE', 'MU TABLE'),
(506, 6,  200, 'BLOCKING', 'SLICING DEL DATASET'),
(507, 7,  200, 'MATCHING TABLE', 'MATCHING TABLE'),
(508, 8,  200, 'THRESHOLD MATCHING', 'THRESHOLD MATCHING'),
(509, 9,  200, 'THRESHOLD UNMATCHING', 'THRESHOLD UNMATCHING'),
(510, 10, 200, 'POSSIBLE MATCHING TABLE', 'POSSIBLE MATCHING TABLE'),
(513, 13, 200, 'RESIDUAL A', 'RESIDUAL DATASET  A'),
(514, 14, 200, 'RESIDUAL B', 'RESIDUAL DATASET  B'),
(515, 15, 200, 'DATA', 'DATA'),
(516, 16, 200, 'RULESET', 'RULESET'),
(517, 17, 200, 'MARGINAL PROBABILITIES', 'MARGINAL PROBABILITIES'),
(518, 18, 200, 'BLOCKING A', 'SLICING DEL DATASET A'),
(519, 19, 200, 'BLOCKING B', 'SLICING DEL DATASET B'),
(520, 20, 200, 'REDUCTION METHOD', 'METHOD OF REDUCTION OF THE SEARCH SPACE'),
(521, 21, 200, 'INDEXES MATCHED', 'INDEX ROWS MATCHED CONTENGENCY TABLE'),
(522, 22, 200, 'MATCHING TABLE REDUCED', 'MATCHING TABLE WITH CONSTRAINT'),
(523, 23, 200, 'QUALITY INDICATORS', 'QUALITY INDICATORS OF RESULTS'),
(524, 24, 200, 'POSSIBLE MATCHING TABLE REDUCED', 'POSSIBLE MATCHING TABLE WITH CONSTRAINT'),
(526, 26, 200, 'MARGINALS-VARNAMES', 'MARGINAL PROBABILITIES: VARIABLE NAMES'),
(527, 27, 200, 'MARGINALS-COMPARISON', 'MARGINAL PROBABILITIES: VARIABLE NAMES'),
(528, 28, 200, 'MARGINALS-MFREQ', 'MARGINAL PROBABILITIES: VARIABLE NAMES'),
(529, 29, 200, 'MARGINALS-UFREQ', 'MARGINAL PROBABILITIES: VARIABLE NAMES'),
(530, 30, 200, 'MATCH FREQUENCY IN SEARCH SPACE', 'MATCH FREQUENCY IN SEARCH SPACE');
 
INSERT INTO `csm_process_design_description` (id, descr) VALUES
(180011, 'probabilisticContingencyTable'),
(180012, 'fellegisunter'),
(180013, 'probabilisticResultTablesByIndex'),
(180014, 'reducedResultTablesGreedy'),
(180015, 'createResiduals'),
(180020, 'deterministicResultTablesByIndex'),
(180021, 'mufrommarginals');

INSERT INTO `csm_process_design_description` (id, descr) VALUES
(180022, 'mufrommarginals2');


INSERT INTO `csm_process_design` (process_design_ID, step, type, csm_information_object_id) VALUES
(180011,70,1,502),(180011,70,1,503),(180011,70,2,513),(180011,70,2,504),(180011,70,2,505); 
INSERT INTO `csm_process_design` (process_design_ID, step, type, csm_information_object_id) VALUES
(180012,71,1,502),(180012,71,1,503),(180012,71,2,513),(180012,71,2,504),(180012,71,2,505),(180012,71,1,510);
INSERT INTO `csm_process_design` (process_design_ID, step, type, csm_information_object_id) VALUES
(180013,72,1,502),(180013,72,1,503),(180013,72,1,513),(180013,72,2,504),(180013,72,2,505);
INSERT INTO `csm_process_design` (process_design_ID, step, type, csm_information_object_id) VALUES
(180014,77,1,502),(180014,77,1,503),(180014,77,1,513),(180014,77,2,504),(180014,77,2,505),(180014,77,1,510);
INSERT INTO `csm_process_design` (process_design_ID, step, type, csm_information_object_id) VALUES
(180020,78,1,502),(180020,78,1,504),(180020,78,2,507); 
INSERT INTO `csm_process_design` (process_design_ID, step, type, csm_information_object_id) VALUES
(180021,76,1,502),(180021,76,1,504),(180021,2,76,507);
INSERT INTO `csm_process_design` (process_design_ID, step, type, csm_information_object_id) VALUES
(180022,80,1,502),(180021,80,1,504),(180021,2,80,507),(180021,2,80,510); 
 


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET FOREIGN_KEY_CHECKS=1;
