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
@Table(name = "CSM_DESKTOP_APPLICATION")
public class DesktopApplication implements Serializable  {

	
	private static final long serialVersionUID = -755222506187438035L;
	
	@Id
	@Column(name = "ID")
	private Long id;

	@Column(name = "DIPENDENZE")
	private String dipendenze;
	
	@Column(name = "DOWNLOAD")
	private String download;	

	@Column(name = "LICENZA")
	private String licenza;

	@Column(name = "LINGUAGGIO")
	private String linguaggio;

	@Column(name = "PACKAGE")
	private String pacchetto; 
	
	@Column(name = "SISTEMA_OPERATIVO")
	private String sistemaOperativo; 

	@Column(name = "TOOL")
	private String tool;
	
	@ManyToOne
    @JoinColumn(name = "TOOL", insertable = false, updatable = false)
    private CatalogTool catalogTool;

}
