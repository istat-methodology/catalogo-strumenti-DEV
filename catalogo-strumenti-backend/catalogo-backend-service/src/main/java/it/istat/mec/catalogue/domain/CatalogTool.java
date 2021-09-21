package it.istat.mec.catalogue.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@Table(name = "CSM_METHODOLOGICAL_TOOL")
public class CatalogTool implements Serializable  {
	
	
	private static final long serialVersionUID = -470124614809408504L;
	
	@Id
	@Column(name = "ID")
	private Long id;

	@Column(name = "DATA")
	private String data;
	
	@Column(name = "DESCRIZIONE")
	private String descrizione;

	@Column(name = "HOMEPAGE")
	private String homepage;

	@Column(name = "DOWNLOAD")
	private String download;

	@Column(name = "METODO_STATISTICO")
	private String metodoStatistico;

	@Column(name = "NOME")
	private String nome;

	@Column(name = "NOTE")
	private String note;

	@Column(name = "STANDARD")
	private String standard;

	@Column(name = "TAGS")
	private String tags;

	@Column(name = "VERSIONE")
	private String versione;

	@Column(name = "TIPOLOGIA")
	private String tipologia;

	@Column(name = "RIFERIMENTI")
	private String riferimenti;

	@Column(name = "LICENSE")
	private String license;
	
}
