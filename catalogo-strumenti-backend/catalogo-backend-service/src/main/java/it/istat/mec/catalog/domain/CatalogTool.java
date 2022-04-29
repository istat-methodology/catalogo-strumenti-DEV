package it.istat.mec.catalog.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorColumn(name="TOOL_TYPE", 
discriminatorType = DiscriminatorType.INTEGER)
@Entity
@Table(name = "CSM_METHODOLOGICAL_TOOL")
public class CatalogTool implements Serializable  {
	
	private static final long serialVersionUID = -470124614809408504L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name = "ID")
	private Integer id;

	@Column(name = "RELEASE_DATE")
	private Date releaseDate;
	
	@Column(name = "DESCRIPTION")
	private String description;	
	
	@Column(name = "NAME")
	private String name;
	
	@Column(name = "STANDARD_ISTAT")
	private Integer standardIstat;	

	@Column(name = "TAGS")
	private String tags;

	@Column(name = "VERSION")
	private String version;

    @ManyToOne(optional = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "TOOL_TYPE", nullable = false, insertable = false,updatable = false)
 	private ToolType toolType;
	
	
    
    @ManyToOne(optional = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "SERVICE", nullable = false, updatable = false)
	private BusinessService businessService;

	@Column(name = "LAST_UPDATE")
	private Date lastUpdate;
	
	@Column(name = "REQUIREMENTS")
	private String requirements;	
	
	
	
	@JsonBackReference
	@OneToMany(mappedBy = "tool", cascade = CascadeType.ALL)  
    private List<LinkAgentTool> linkAgentsTools;
	
	@OneToMany(mappedBy = "tool", cascade = CascadeType.ALL)    
    private List<Documentation> documentations;
	
	
	
	@ManyToMany
    @JoinTable(name = "csm_link_method_tool", joinColumns = {
            @JoinColumn(name = "TOOL", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "METHOD", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)})
	private List<StatisticalMethod> statisticalMethods;
	
    @ManyToMany
    @JoinTable(name = "csm_tool_gsbpm",  joinColumns = {
            @JoinColumn(name = "TOOL", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "GSBPM", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)})
    private List<GsbpmProcess> gsbpmProcesses;
    
	
	public CatalogTool() {
		super();
		
	}
	public CatalogTool(Integer id) {
		super();
		this.id = id;
	}
}
