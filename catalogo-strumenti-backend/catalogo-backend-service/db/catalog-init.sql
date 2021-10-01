use catalog;

INSERT INTO CSM_Methodological_Tool	(`ID`,`Data`,`Descrizione`,`Metodo_Statistico`,`Nome`,`Note_di_compilazione`, `Standard`, `Tags`, `Versione`, `Tipologia`, `Riferimenti`)
values (100, 'Today','Detection of outliers and influential errors using a latent variable model',
'Selective Editing via Mixture Models','Selemix','Note',	'ISTAT',
'mixture, selective editing, outliers',	'1.0.2','package','https://rdrr.io/cran/SeleMix/');

-- Dati di test
INSERT INTO business_function (ID, NAME, DESCR, LABEL, ACTIVE, GSBPM) 
	VALUES 
		(80,'Specify needs',NULL,NULL,1,NULL),
		(110,'Design',NULL,NULL,2,NULL),
		(130,'Build',NULL,NULL,3,NULL);
		
INSERT INTO CSM_Methodological_Tool	(`ID`, `Data`, `Descrizione`, `Metodo_Statistico`, `Nome`, `Note_di_compilazione`, `Standard`, `Tags`, `Versione`, `Tipologia`, `Riferimenti`)
values (200, 'Tomorrow','RELAIS (REcord Linkage At IStat) is a toolkit providing a set of techniques for dealing with record linkage projects.',
'Record Linkage','Relais','Note','ISTAT','data integration, probabilistic record linkage, string comparators, blocking/sorting/indexing, 
deduplication, open source software',	'3.1','desktop application','Available on registration');



 -- Link verso il process design esistente 
INSERT INTO CSM_Methodological_Tool_has_is2_business_function (`CSM_Methodological_Tool_ID`,`is2_business_function_ID`) VALUES (100, 80);
INSERT INTO CSM_Methodological_Tool_has_is2_business_function (`CSM_Methodological_Tool_ID`,`is2_business_function_ID`) VALUES (100, 110);
INSERT INTO CSM_Methodological_Tool_has_is2_business_function (`CSM_Methodological_Tool_ID`,`is2_business_function_ID`) VALUES (100, 130);

-- Specializzazioni del software
INSERT INTO CSM_Software_Procedure (`Codice`,`Sintassi`,`Dipendenze`,`Linguaggio`, `tool` ) VALUES ('', '', 'mvtnorm, graphics', 'R',  100);
-- INSERT INTO CSM_Statistical_Method (`ID`,`Nome`,`Autore`,`Obiettivo`,`Descrizione`,`Generalità`,`Ipotesi`,`Limiti`,`Indicatori_qualità`,`tool`) VALUES (100);
INSERT INTO CSM_Desktop_Application (`Dipendenze`,`Download`,`Licenza`,`Linguaggio`,`Package`,`Sistema_Operativo`,`tool`) 
VALUES('Java, R, MySQL',null,'Open Source','R, SQL','Desktop Application','Windows',200);
-- INSERT INTO CSM_Statistical_Service (`ID`,`Metodi_esposti`,`Dipendenze`,`Protocollo`,`tool`) VALUES();

-- Sezione documentale esterna, link alle persone coinvolte nello sviluppo o nella documentazione
INSERT INTO CSM_Agent (`ID`,`Nome`,`Organizzazione`) VALUES (10,'Mario Rossi','Istat');
INSERT INTO CSM_Agent (`ID`,`Nome`,`Organizzazione`) VALUES (20,'Luca Verdi','Eurostat');
INSERT INTO CSM_link_Agent_tool (`agent`,`tool`,`Ruolo`,`Note`,`Date_riferimento`) VALUES (10,100,'Sviluppatore','Note','2010-2020');
INSERT INTO CSM_link_Agent_tool (`agent`,`tool`,`Ruolo`,`Note`,`Date_riferimento`) VALUES (20,100,'Referente','Note','2020 in poi');

INSERT INTO CSM_Agent (`ID`,`Nome`,`Organizzazione`) VALUES (30,'Luca Valente','Istat');
INSERT INTO CSM_link_Agent_tool (`agent`,`tool`,`Ruolo`,`Note`,`Date_riferimento`) VALUES (30,200,'Sviluppatore','Note','2005-2015');

    
-- Sezione documentale esterna, link alle risorse di documentazione
INSERT INTO CSM_Documentation (`ID`,`Nome`,`Organizzazione`,`CSM_Methodological_Tool_ID`) VALUES (10,'Selemix','Istat',100);
INSERT INTO CSM_Documentation (`ID`,`Nome`,`Organizzazione`,`CSM_Methodological_Tool_ID`) VALUES (20,'Relais','Istat',200);

	