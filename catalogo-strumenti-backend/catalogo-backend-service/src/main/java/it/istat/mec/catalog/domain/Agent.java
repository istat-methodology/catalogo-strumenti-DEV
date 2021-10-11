package it.istat.mec.catalog.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@Table(name = "CSM_AGENT")
public class Agent implements Serializable  {

	
	private static final long serialVersionUID = 5508154355442723459L;
	@Id
	@Column(name = "ID")
	private Long id;

	@Column(name = "NOME")
	private String nome;
	
	@Column(name = "ORGANIZZAZIONE")
	private String organizzazione;	
	
	@ManyToMany(mappedBy = "agents")
    private List<CatalogTool> catalogTools;

}
