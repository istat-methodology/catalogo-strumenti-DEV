package it.istat.mec.catalog.dto;


import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CatalogToolDTO implements Serializable {

 
	private static final long serialVersionUID = -6905546979001300372L;
	
	private Integer id;
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS");
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate releaseDate;
		
	private String description;		
	private String name;	
	private Integer standardIstat;	
	private String tags;	
	private String version;
	private ToolTypeDto toolType;	
	private Date lastUpdate;	
	private String requirements;
	private BusinessServiceMiniDto businessService;
	private List<GSBPMProcessMiniDto> gsbpmProcesses;
	private List<StatisticalMethodDto> statisticalMethods;
	private List<LinkAgentToolDto> linkAgentsTools;	
	private List<DocumentationDto> documentations;
	
	public String getReleaseDate() {
        return formatter.format(LocalDateTime.of(releaseDate, LocalTime.MIDNIGHT));
    }
}
