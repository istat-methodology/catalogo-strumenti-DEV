package it.istat.mec.catalog.domain;

import java.io.Serializable;
import java.util.Date;
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
	private Integer id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "REQUIREMENTS")
	private String requirements;
	
	@Column(name = "ASSUMPTIONS")
	private String assumptions;		
	
	@Column(name = "CONSTRAINTS")
	private String constraints;
	
	@Column(name = "NOTES")
	private String notes;		
	
	@Column(name = "LAST_UPDATE")
	private Date lastUpdate;
	
	@Column(name = "TAGS")
	private String tags;

	@Column(name = "VERSION")
	private String version;
	
	@Column(name = "RELEASE_DATE")
	private Date releaseDate;
	
	@Column(name = "STANDARD_ISTAT")
	private Integer standardIstat;
	


	@ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(name = "csm_link_method_tool", joinColumns = {
            @JoinColumn(name = "METHOD", referencedColumnName = "ID", nullable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "TOOL", referencedColumnName = "ID", nullable = false)})
	private List<CatalogTool> catalogTools;
	
	
	@ManyToMany
    @JoinTable(name = "csm_link_documentation_method", joinColumns = {
            @JoinColumn(name = "csm_statistical_method_ID", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "csm_documentation_ID", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)})
    private List<Documentation> documentations;
	
	public StatisticalMethod() {
		
	}
	public StatisticalMethod(Integer id) {
		super();
		this.id = id;
	}
	
}
