use catalogue;

INSERT INTO catalogue.CSM_Methodological_Tool	(`ID`,`Data`,`Descrizione`,`homepasge`,`download`,`Metodo_Statistico`,`Name`,`Nome`,`Note`,	`Standard`,	`Tags`,	`Versione`,	`Tipologia`,`Riferimenti`,`License` )
values (100, 'Today','Detection of outliers and influential errors using a latent variable model',
'https://rdrr.io/cran/SeleMix/','https://cran.r-project.org/package=SeleMix','Selective Editing via Mixture Models','Selemix','Selemix','Note',	'ISTAT',
'mixture, selective editing, outliers',	'1.0.2','package','https://rdrr.io/cran/SeleMix/', 'EUPL' );

-- Dati di test
INSERT INTO catalogue.business_process (ID, NAME, DESCR, LABEL, ORDER_CODE) 
	VALUES 
		(80,'Specify needs',NULL,NULL,1),
		(110,'Design',NULL,NULL,2),
		(130,'Build',NULL,NULL,3);
		
 -- Link verso il process design esistente 
INSERT INTO catalogue.CSM_link_Methodological_tool_Business_Process (`bproc`,`tool`) VALUES (80  , 100 );
INSERT INTO catalogue.CSM_link_Methodological_tool_Business_Process (`bproc`,`tool`) VALUES (110  , 100 );
INSERT INTO catalogue.CSM_link_Methodological_tool_Business_Process (`bproc`,`tool`) VALUES (130  , 100 );

-- Specializzazioni del software
INSERT INTO catalogue.CSM_Software_Procedure (`Codice`,`Sintassi`,`Dipendenze`,`Linguaggio`, `tool` ) VALUES ('', '', 'mvtnorm, graphics', 'R',  100);
-- INSERT INTO CSM_Statistical_Method (`ID`,`Nome`,`Autore`,`Obiettivo`,`Descrizione`,`Generalità`,`Ipotesi`,`Limiti`,`Indicatori_qualità`,`tool`) VALUES (100);
-- INSERT INTO CSM_Desktop_Application (`ID`,`Dipendenze`,`Download`,`Licenza`,`Linguaggio`,`Package`,`Sistema_Operativo`,`tool`) VALUES();
-- INSERT INTO CSM_Statistical_Service (`ID`,`Metodi_esposti`,`Dipendenze`,`Protocollo`,`tool`) VALUES();

-- Sezione documentale esterna, link alle persone coinvolte nello sviluppo o nella documentazione
INSERT INTO catalogue.CSM_Agent (`ID`,`Nome`,`Organizzazione`) VALUES (10,'Mario Rossi','Istat');
INSERT INTO catalogue.CSM_Agent (`ID`,`Nome`,`Organizzazione`) VALUES (20,'Luca Verdi','Eurostat');
INSERT INTO catalogue.CSM_link_Agent_tool (`agent`,`tool`,`Ruolo`,`Note`,`Date_riferimento`) VALUES (10,100,'Sviluppatore','Note','2010-2020');
INSERT INTO catalogue.CSM_link_Agent_tool (`agent`,`tool`,`Ruolo`,`Note`,`Date_riferimento`) VALUES (20,100,'Referente','Note','2020 in poi');
    
-- Sezione documentale esterna, link alle risorse di documentazione
INSERT INTO catalogue.CSM_Documentation (`ID`,`Nome`,`EDITORE`,`Type`,`Note`,`Resource`) VALUES (10,'Selemix','Istat','user guide','Note','https://cran.r-project.org/package=SeleMix');
INSERT INTO catalogue.CSM_link_Documentation_tool (`doc`,`tool`) VALUES (10,100);