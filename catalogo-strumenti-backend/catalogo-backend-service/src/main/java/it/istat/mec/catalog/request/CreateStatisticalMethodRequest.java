package it.istat.mec.catalog.request;
import java.util.Date;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateStatisticalMethodRequest {
	
	private Integer id;	
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
}
