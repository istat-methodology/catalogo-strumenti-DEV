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
@Table(name = "CSM_STATISTICAL_SERVICE")
public class StatisticalService  extends CatalogTool  implements Serializable  {

	private static final long serialVersionUID = 8909524485339722213L;

 
	@Column(name = "PROTOCOL")
	private String protocol;
	
	@Column(name = "URL")
	private String url;
	
	@Column(name = "OUTCOMES")
	private String outcomes;	
	
	@Column(name = "SERVICES_DEPENDENCIES")
	private String serviceDependencies;	
	
	@Column(name = "RESTRICTIONS")
	private String restrictions;	
	
	@Column(name = "GSBPM")
	private String gsbpm;	
	
	@Column(name = "BUSINESS_FUNCTION")
	private String businessFunction;
	
	@Column(name = "PROCESS_DESIGN")
	private String processDesign;
 
}
