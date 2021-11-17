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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@Table(name = "CSM_METHODOLOGICAL_TOOL")
public class CatalogTool implements Serializable  {
	
	
	

	private static final long serialVersionUID = -470124614809408504L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name = "ID")
	private Long id;

	@Column(name = "DATA")
	private String data;
	
	@Column(name = "DESCRIZIONE")
	private String descrizione;	

	@Column(name = "METODO_STATISTICO")
	private String metodoStatistico;

	@Column(name = "NOME")
	private String nome;

	@Column(name = "NOTE_DI_COMPILAZIONE")
	private String note;

	@Column(name = "STANDARD")
	private String standard;

	@Column(name = "TAGS")
	private String tags;

	@Column(name = "VERSIONE")
	private String versione;

	@Column(name = "TIPOLOGIA")
	private String tipologia;

	@Column(name = "RIFERIMENTI")
	private String riferimenti;	
	
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
	
	@OneToMany(mappedBy = "catalogTool", cascade = CascadeType.ALL)    
    private List<StatisticalService> statisticalServices;
	
	@OneToMany(mappedBy = "catalogTool", cascade = CascadeType.ALL)    
    private List<DesktopApplication> desktopApplications;
	
	@OneToMany(mappedBy = "catalogTool", cascade = CascadeType.ALL)    
    private List<SoftwareProcedure> softwareProcedures;
	
	@OneToMany(mappedBy = "catalogTool", cascade = CascadeType.ALL)    
    private List<StatisticalMethod> statisticalMethods;

	public CatalogTool() {
		super();
		
	}
	public CatalogTool(Long id) {
		super();
		this.id = id;
	}
}
