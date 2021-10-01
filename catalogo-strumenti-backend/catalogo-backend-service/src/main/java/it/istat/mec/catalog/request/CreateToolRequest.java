package it.istat.mec.catalog.request;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class CreateToolRequest implements Serializable {	

	private static final long serialVersionUID = 260178678713176491L;
	private Integer id;
	private String data;
	private String descrizione;	
	private String metodoStatistico;
	private String nome;
	private String note;
	private String standard;
	private String tags;
	private String versione;
	private String tipologia;
	private String riferimenti;	

}
