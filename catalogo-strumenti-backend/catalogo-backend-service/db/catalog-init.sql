use catalog;

-- Dati di test
INSERT INTO is2_business_service (ID, NAME, DESCR) 
	VALUES 
		(91,'ARC','ARC file loader INSEE'),	
		(100,'Selemix','Selective Editing via Mixture Models'),			
		(200,'Relais','Record Linkage at Istat');
		
		
-- Dati di test
INSERT INTO cls_tool_type (ID, NAME, DESCRIPTION) 
	VALUES 
		(1,'ARC','ARC file loader INSEE'),		
		(2,'Relais','Record Linkage at Istat'),
		(3,'Selemix','Selective Editing via Mixture Models');	
		
INSERT INTO `catalog`.`csm_statistical_method` (`ID`, `Nome`, `Autore`, `Obiettivo`, `Descrizione`, `Generalita`, `Ipotesi`, `Limiti`, `Indicatori_qualita`) VALUES ('1', 'Metodo di test', 'Antonio Bianchi', 'Test', 'Effettua una test', 'Prova', 'Ciao', 'Alcuni', 'Vari');
INSERT INTO `catalog`.`csm_statistical_method` (`ID`, `Nome`, `Autore`, `Obiettivo`, `Descrizione`, `Generalita`, `Ipotesi`, `Limiti`, `Indicatori_qualita`) VALUES ('2', 'Metodo di test n2', 'Franco Rossi', 'Test2', 'Fa una prova', 'Prova2', 'CiaoCiao', 'Alcuni', 'Vari');
		
		
INSERT INTO CSM_Methodological_Tool	(`ID`,`Data`,`Descrizione`, `homepage`,`download`,`Metodo_Statistico`, `Name`,`Nome`,`Note`,`Standard`, `Tags`,`Versione`,	`Tipologia`, `Riferimenti`,`Licence`,  `is2_business_service_ID`, `csm_tool_type_id`, `csm_statistical_method_ID`)
values (100, 'Today','Detection of outliers and influential errors using a latent variable model', 'www.istat.it','www.istat.it/download/Selemix',
'Selective Editing via Mixture Models','Selemix', 'Selemix','Note',	'ISTAT',
'mixture, selective editing, outliers',	'1.0.2','package','https://rdrr.io/cran/SeleMix/','l-gpl',100,3,2);

INSERT INTO CSM_Methodological_Tool	(`ID`,`Data`,`Descrizione`, `homepage`,`download`,`Metodo_Statistico`, `Name`,`Nome`,`Note`,`Standard`, `Tags`,`Versione`,	`Tipologia`, `Riferimenti`,`Licence`,  `is2_business_service_ID`, `csm_tool_type_id`, `csm_statistical_method_ID`)
values (200, 'Tomorrow','RELAIS (REcord Linkage At IStat) is a toolkit providing a set of techniques for dealing with record linkage projects.',
'www.istat.it','www.istat.it/download/Relais',
'Record Linkage','Relais','Relais','Note','ISTAT','data integration, probabilistic record linkage, string comparators, blocking/sorting/indexing, 
deduplication, open source software',	'3.1','desktop application','Available on registration','l-gpl',200,2,1);


		
INSERT INTO is2_app_service (ID, NAME, DESCR, IMPLEMENTATION_LANGUAGE, ENGINE, SOURCE_PATH, SOURCE_CODE, AUTHOR, LICENCE, CONTACT, BUSINESS_SERVICE_ID) 
	VALUES 
		(91, 'ARC LOADER', 'Java package implementing ARC loader service', 'JAVA', 'JAVA', 'it.istat.is2.catalogue.arc.service.LoadService', '', '', '', '', 91),	
		(200, 'Relais', 'R package implementing record linkage methods', 'R', 'RENJIN', 'relais/relais.R', '', 'Istat', 'EUPL1.1', 'Luca Valentino (luvalent@istat.it)', 200);


-- Specializzazioni del software
INSERT INTO CSM_Software_Procedure (`Codice`,`Sintassi`,`Dipendenze`,`Linguaggio`, `tool` ) VALUES ('300', 'test', 'mvtnorm, graphics', 'R',  100);

INSERT INTO CSM_Desktop_Application (`Dipendenze`,`Download`,`Licenza`,`Linguaggio`,`Package`,`Sistema_Operativo`,`tool`) 
VALUES('Java, R, MySQL',null,'Open Source','R, SQL','Desktop Application','Windows',200);


-- Sezione documentale esterna, link alle persone coinvolte nello sviluppo o nella documentazione
INSERT INTO CSM_Agent (`ID`,`Nome`,`Organizzazione`) VALUES (10,'Mario Rossi','Istat');
INSERT INTO CSM_Agent (`ID`,`Nome`,`Organizzazione`) VALUES (20,'Luca Verdi','Eurostat');
INSERT INTO CSM_Agent (`ID`,`Nome`,`Organizzazione`) VALUES (30,'Luca Valente','Istat');

INSERT INTO CSM_link_Agent_tool (`agent`,`tool`,`Ruolo`,`Note`,`Date_riferimento`) VALUES (10,100,'Sviluppatore','Note','2010-2020');
INSERT INTO CSM_link_Agent_tool (`agent`,`tool`,`Ruolo`,`Note`,`Date_riferimento`) VALUES (20,100,'Referente','Note','2020 in poi');
INSERT INTO CSM_link_Agent_tool (`agent`,`tool`,`Ruolo`,`Note`,`Date_riferimento`) VALUES (30,200,'Sviluppatore','Note','2005-2015');

    
-- Sezione documentale esterna, link alle risorse di documentazione
INSERT INTO CSM_Documentation (`ID`,`Nome`,`Editore`,`Note`,`Resource`,`Type`,`tool`) VALUES (10,'Selemix','Istat','Selective editing','www.istat.it/resource/selemix','test',100);
INSERT INTO CSM_Documentation (`ID`,`Nome`,`Editore`,`Note`,`Resource`,`Type`,`tool`) VALUES (20,'Relais','Istat','Probabilistic record linkage','www.istat.it/resource/relais','test',200);


	
INSERT INTO `catalog`.`csm_statistical_service` (`ID`, `Metodi_esposti`, `Dipendenze`, `Protocollo`, `tool`, `is2_app_service_ID`) VALUES ('1', 'Vari', 'Nessuna', 'Http', '100', '91');
INSERT INTO `catalog`.`csm_statistical_service` (`ID`, `Metodi_esposti`, `Dipendenze`, `Protocollo`, `tool`, `is2_app_service_ID`) VALUES ('2', 'Alcuni', 'Varie', 'Ftp', '200', '200');
