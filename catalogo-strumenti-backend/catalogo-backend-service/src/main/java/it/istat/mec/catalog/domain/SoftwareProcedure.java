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
@Table(name = "CSM_SOFTWARE_PROCEDURE")
public class SoftwareProcedure implements Serializable  {

	private static final long serialVersionUID = -8978924619296902306L;

	@Id
	@Column(name = "ID")
	private Long id;

	@Column(name = "NOME")
	private String nome;
	
	@Column(name = "ORGANIZZAZIONE")
	private String organizzazione;
	
	@Column(name = "CSM_METHODOLOGICAL_TOOL_ID")
	private String toolId;	
}
