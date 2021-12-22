package it.istat.mec.catalog.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@MappedSuperclass
@Table(name = "CSM_METHODOLOGICAL_TOOL")
public class CatalogTool implements Serializable  {
	
	private static final long serialVersionUID = -470124614809408504L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name = "ID")
	private Long id;

	@Column(name = "RELEASE_DATE")
	private String releaseDate;
	
	@Column(name = "DESCRIPTION")
	private String description;	
	
	@Column(name = "NAME")
	private String name;
	
	@Column(name = "STANDARD_ISTAT")
	private String standardIstat;	

	@Column(name = "TAGS")
	private String tags;

	@Column(name = "VERSION")
	private String version;

	@Column(name = "TOOL_TYPE")
	private String toolType;
	
	@Column(name = "SERVICE")
	private String service;

	@Column(name = "LAST_UPDATE")
	private String lastUpdate;
	
	@Column(name = "REQUIREMENTS")
	private String requirements;	
	
	@JsonBackReference
    @ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(name = "csm_methodological_tool_has_is2_business_function", joinColumns = {
            @JoinColumn(name = "CSM_METHODOLOGICAL_TOOL_ID", referencedColumnName = "ID", nullable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "IS2_BUSINESS_FUNCTION_ID", referencedColumnName = "ID", nullable = false)})
    private List<BusinessFunction> businessFunctions;
	
	@JsonBackReference
    @ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(name = "csm_link_agent_tool", joinColumns = {
            @JoinColumn(name = "TOOL", referencedColumnName = "ID", nullable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "AGENT", referencedColumnName = "ID", nullable = false)})
    private List<Agent> agents;
	
	@OneToMany(mappedBy = "catalogTool", cascade = CascadeType.ALL)    
    private List<Documentation> documentations;
	
	public CatalogTool() {
		super();
		
	}
	public CatalogTool(Long id) {
		super();
		this.id = id;
	}
}
