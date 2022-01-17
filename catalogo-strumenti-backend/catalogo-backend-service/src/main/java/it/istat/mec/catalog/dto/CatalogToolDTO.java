package it.istat.mec.catalog.dto;


import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CatalogToolDTO implements Serializable {

 
	private static final long serialVersionUID = -6905546979001300372L;
	
	private Long id;	
	private Date releaseDate;	
	private String description;		
	private String name;	
	private int standardIstat;	
	private String tags;	
	private String version;
	private ToolTypeDto toolType;	
	private int service;	
	private Date lastUpdate;	
	private String requirements;	
	private List<GSBPMProcessDto> gsbpmProcesses;
	private List<StatisticalMethodDto> statisticalMethods;
	
	
}
