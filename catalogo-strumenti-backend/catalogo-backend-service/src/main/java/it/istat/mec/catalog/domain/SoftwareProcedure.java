package it.istat.mec.catalog.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@Table(name = "CSM_SOFTWARE_PROCEDURE")
public class SoftwareProcedure  extends CatalogTool implements Serializable  {

	private static final long serialVersionUID = -8978924619296902306L;

 
	@Column(name = "CODE")
	private String code;
	
	@Column(name = "LANGUAGE")
	private String language;
	
	@Column(name = "DEPENDENCIES")
	private String dependencies;	
	
	@Column(name = "TECHNICAL_REQUIREMENTS")
	private String technicalRequirements;	
	
	@Column(name = "WORKFLOW")
	private String workflow;
	
	@Column(name = "DOWNLOAD")
	private String download;
	

}
