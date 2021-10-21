package it.istat.mec.catalog.dto;


import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ToolDto implements Serializable {

 
	private static final long serialVersionUID = -6905546979001300372L;
	private Long id;
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
	
	private List <StatisticalServiceDto> statisticalServices;
	
}
