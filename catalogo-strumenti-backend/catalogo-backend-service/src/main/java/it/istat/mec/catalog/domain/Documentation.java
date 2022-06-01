package it.istat.mec.catalog.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "CSM_DOCUMENTATION")
public class Documentation implements Serializable  {

	
	private static final long serialVersionUID = -6958458136121721618L;

	@Id  @GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name = "ID")
	private Integer id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "PUBLISHER")
	private String publisher;
	
	
	@ManyToOne(optional = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "DOCUMENT_TYPE")
	private DocumentationType documentType;
	
	@Column(name = "NOTES")
	private String notes;
	
	@Column(name = "RESOURCE")
	private String resource;
	 
	@ManyToMany
    @JoinTable(name = "csm_link_documentation_tool", joinColumns = {
            @JoinColumn(name = "csm_documentation_ID", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "csm_methodological_tool_ID", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)})
    private List<CatalogTool> catalogTools;
	
	@ManyToMany 
    @JoinTable(name = "csm_link_documentation_method", joinColumns = {
            @JoinColumn(name = "csm_documentation_ID", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "csm_statistical_method_ID", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)})
    private List<StatisticalMethod> statisticalMethods;
	
	 
	public Documentation() {
		
	}
	public Documentation(Integer id) {
		super();
		this.id = id;
	}
}
