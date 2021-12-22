package it.istat.mec.catalog.dto;


import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ToolDto implements Serializable {

 
	private static final long serialVersionUID = -6905546979001300372L;
	
	private Long id;	
	private String releaseDate;	
	private String description;		
	private String name;	
	private String standardIstat;	
	private String tags;	
	private String version;
	private String toolType;	
	private String service;	
	private String lastUpdate;	
	private String requirements;	
	
	private List <StatisticalServiceDto> statisticalServices;	
	private List <DesktopApplicationDto> desktopApplications;
	private List<SoftwareProcedureDto> softwareProcedures;
	private List<StatisticalMethodDto> statisticalMethods;
	
}
