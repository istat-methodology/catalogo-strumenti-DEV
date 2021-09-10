package it.istat.mec.catalogue.dto;


import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ToolDto implements Serializable {

 
	private static final long serialVersionUID = -6905546979001300372L;
	private Integer id;
	private String descrizione;
	private String data;
	private String autore;
	private String documentazione;
	private String metodoStatistico;
	private String nome;
	private String noteDiCompilazione;
	private String standard;
	private String tags;
	private String versione;
	private String tipologia;
	private String riferimenti;
	 
	
}
