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
@Table(name = "CSM_DOCUMENTATION")
public class Documentation implements Serializable  {

	private static final long serialVersionUID = 6402993856799845862L;
	
	@Id
	@Column(name = "ID")
	private Long id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "PUBLISHER")
	private String publisher;
	
	@Column(name = "DOCUMENT_TYPE")
	private String documentType;
	
	@Column(name = "NOTES")
	private String notes;
	
	@Column(name = "RESOURCE")
	private String resource;
	
	@Column(name = "TOOL")
	private String tool;
	
	@ManyToOne
    @JoinColumn(name = "CSM_METHODOLOGICAL_TOOL_ID", insertable = false, updatable = false)
    private CatalogTool catalogTool;
	
}
