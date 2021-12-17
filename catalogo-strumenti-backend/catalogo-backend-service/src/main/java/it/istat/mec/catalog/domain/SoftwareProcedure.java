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
@Table(name = "CSM_SOFTWARE_PROCEDURE")
public class SoftwareProcedure  extends CatalogTool implements Serializable  {

	private static final long serialVersionUID = -8978924619296902306L;

 
	@Column(name = "CODICE")
	private String codice;
	
	@Column(name = "SINTASSI")
	private String sintassi;
	
	@Column(name = "DIPENDENZE")
	private String dipendenze;	
	
	@Column(name = "LINGUAGGIO")
	private String linguaggio;	
	

}
