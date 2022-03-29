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
	private Integer id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "PUBLISHER")
	private String publisher;
	
	@Column(name = "DOCUMENT_TYPE")
	private DocumentType documentType;
	
	@Column(name = "NOTES")
	private String notes;
	
	@Column(name = "RESOURCE")
	private String resource;
	 
	@ManyToOne
    @JoinColumn(name = "TOOL")
    private CatalogTool tool;
	 
	public Documentation() {
		
	}
	public Documentation(Integer id) {
		super();
		this.id = id;
	}
}
