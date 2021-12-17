package it.istat.mec.catalog.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@Table(name = "CSM_STATISTICAL_METHOD")
public class StatisticalMethod   extends CatalogTool  implements Serializable  {

	private static final long serialVersionUID = 4339427012531827317L;
	 
	@Column(name = "NOME")
	private String nome;
	
	@Column(name = "AUTORE")
	private String autore;
	
	@Column(name = "OBIETTIVO")
	private String obiettivo;	
	
	@Column(name = "DESCRIZIONE")
	private String descrizione;
	
	@Column(name = "GENERALITA")
	private String generalita;
	
	@Column(name = "IPOTESI")
	private String ipotesi;	
	
	@Column(name = "LIMITI")
	private String limiti;
	
	@Column(name = "INDICATORI_QUALITA")
	private String indicatoriQualita;
	
	
	
	@ManyToOne
    @JoinColumn(name = "TOOL", insertable = true, updatable = true)
    private CatalogTool catalogTool;
}
