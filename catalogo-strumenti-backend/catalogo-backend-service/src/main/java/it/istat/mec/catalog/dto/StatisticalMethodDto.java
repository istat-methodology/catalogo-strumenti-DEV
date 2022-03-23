package it.istat.mec.catalog.dto;
import java.io.Serializable;
import java.util.Date;


import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class StatisticalMethodDto  implements Serializable {
	
	private static final long serialVersionUID = -6819215887293605229L;
	
	private String id;
	private String name;
	private String description;
	private String requirements;	
	private String assumptions;			
	private String constraints;	
	private String notes;		
	private Date lastUpdate;		
	private String tags;	
	private String version;	
	private Date releaseDate; 
	private String standardIstat;
}
