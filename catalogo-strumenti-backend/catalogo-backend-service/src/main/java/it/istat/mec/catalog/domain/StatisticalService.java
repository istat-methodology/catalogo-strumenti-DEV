package it.istat.mec.catalog.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@DiscriminatorValue("1")
@Table(name = "CSM_STATISTICAL_SERVICE")
public class StatisticalService  extends CatalogTool  implements Serializable  {

	private static final long serialVersionUID = 8909524485339722213L;

 
	@Column(name = "PROTOCOL")
	private String protocol;
	
	@Column(name = "URL")
	private String url;
	
	@Column(name = "OUTCOMES")
	private String outcomes;	
	
	@Column(name = "SERVICE_DEPENDENCIES")
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
