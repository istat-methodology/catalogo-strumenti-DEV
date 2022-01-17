package it.istat.mec.catalog.request;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class CreateToolRequest implements Serializable {	

	private static final long serialVersionUID = 260178678713176491L;
	
	private Date releaseDate;
	private String description;	
	private String name;
	private int standardIstat;	
	private String tags;
	private String version;
	private int toolType;
	private int service;
	//private String lastUpdate;
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
	private int gsbpm;		
	private String businessFunction;	
	private String processDesign;
	

}
