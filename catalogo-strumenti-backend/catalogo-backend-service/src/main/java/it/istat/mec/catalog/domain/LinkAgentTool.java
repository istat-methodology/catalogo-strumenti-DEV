package it.istat.mec.catalog.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@Table(name = "CSM_LINK_AGENT_TOOL")
public class LinkAgentTool implements Serializable  {
	

	private static final long serialVersionUID = -6213687145415319796L;
 
	@Id
	@ManyToOne
    @JoinColumn(name = "AGENT")
	private Agent agent;
	
	@Id
 	@ManyToOne
    @JoinColumn(name = "TOOL")
	private CatalogTool tool;
	
	@Column(name = "ROLE")
	private String role;
	
	@Column(name = "NOTES")
	private String notes;
	
	@Column(name = "REFERENCE_DATE")
	private String referenceDate;
}
