package it.istat.mec.catalog.domain;

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
@Table(name = "CSM_STATISTICAL_SERVICE")
public class StatisticalService implements Serializable  {

	private static final long serialVersionUID = 8909524485339722213L;

	@Id
	@Column(name = "ID")
	private Long id;

	@Column(name = "METODI_ESPOSTI")
	private String metodiEsposti;
	
	@Column(name = "DIPENDENZE")
	private String dipendenze;
	
	@Column(name = "PROTOCOLLO")
	private String protocollo;	
	
	@Column(name = "TOOL")
	private String toolId;
}
