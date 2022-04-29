package it.istat.mec.catalog.request;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class CreateToolRequest extends CreateBaseRequest {	

	private static final long serialVersionUID = 260178678713176491L;

	private String releaseDate;
	private String description;	

	private Integer standardIstat;	
	private String tags;
	private String version;
	private Integer toolType;
	private Integer service;	
	private String requirements;	
	private String download;	
	private String licence;	
	private String language;	
	private String packageApplication; 	
	private String operativeSystem;		
	private String technicalRequirements;
	private String code;	
	private String dependencies;	
	private String workflow;
	private String protocol;	
	private String url;	
	private String outcomes;	
	private String serviceDependencies;		
	private String restrictions;
	private Integer[] gsbpmProcesses;	
	private Integer[] statisticalMethods;
	private CreateLinkAgentToolRequest[] linkAgents;	 
	private Integer[] documentations;
	private String businessFunction;	
	private String processDesign;
	

}
