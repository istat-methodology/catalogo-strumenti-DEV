package it.istat.mec.catalog.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
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
	
	@Column(name = "REQUIREMENTS")
	private String requirements;
	
	@Column(name = "ASSUMPTIONS")
	private String assumptions;		
	
	@Column(name = "CONSTRAINTS")
	private String constraints;
	
	@Column(name = "NOTES")
	private String notes;		
	
	@ManyToOne
    @JoinColumn(name = "TOOL", insertable = true, updatable = true)
    private CatalogTool catalogTool;
}
