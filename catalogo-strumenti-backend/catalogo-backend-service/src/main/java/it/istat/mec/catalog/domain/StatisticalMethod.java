package it.istat.mec.catalog.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@Table(name = "CSM_STATISTICAL_METHOD")
public class StatisticalMethod  implements Serializable  {

	private static final long serialVersionUID = 4339427012531827317L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name = "ID")
	private Long id;
	
	@Column(name = "REQUIREMENTS")
	private String requirements;
	
	@Column(name = "ASSUMPTIONS")
	private String assumptions;		
	
	@Column(name = "CONSTRAINTS")
	private String constraints;
	
	@Column(name = "NOTES")
	private String notes;		
	
//	@OneToMany
//    @JoinColumn(name = "TOOL", insertable = true, updatable = true)
//    private CatalogTool catalogTool;

	@ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(name = "csm_link_method_tool", joinColumns = {
            @JoinColumn(name = "METHOD", referencedColumnName = "ID", nullable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "TOOL", referencedColumnName = "ID", nullable = false)})
	private List<CatalogTool> catalogTools;
}
