package it.istat.mec.catalog.dto;

import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class LinkAgentToolDto implements Serializable  {

	private static final long serialVersionUID = -1468589263439846991L;
	
	private Integer id;
	private AgentDto agent;
	//private String tool;	
	private String role;	
	private String notes;	
	private String referenceDate;
}
