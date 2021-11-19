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

	@Column(name = "NOME")
	private String nome;
	
	@Column(name = "ORGANIZZAZIONE")
	private String organizzazione;
	
	@Column(name = "CSM_METHODOLOGICAL_TOOL_ID")
	private String toolId;	
	
	@ManyToOne
    @JoinColumn(name = "CSM_METHODOLOGICAL_TOOL_ID", insertable = true, updatable = true)
    private CatalogTool catalogTool;
	
}
