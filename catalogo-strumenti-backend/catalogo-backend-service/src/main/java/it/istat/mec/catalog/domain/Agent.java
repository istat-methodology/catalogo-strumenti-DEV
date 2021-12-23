package it.istat.mec.catalog.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
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

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "ORGANIZATION")
	private String organization;
	
	@Column(name = "CONTACT")
	private String contact;
	
	@Column(name = "NOTES")
	private String notes;
	
	@OneToMany(mappedBy = "agent")
    private List<LinkAgentTool> linkAgentTools;

}
