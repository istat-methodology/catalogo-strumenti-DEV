package it.istat.mec.catalog.request;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class UpdateToolRequest implements Serializable {	

	
	private static final long serialVersionUID = -8492573172388881146L;
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
	
}
