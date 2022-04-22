package it.istat.mec.catalog.dto;
import java.io.Serializable;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
@EqualsAndHashCode(callSuper=false)
@Data
@NoArgsConstructor
public class StatisticalMethodDto extends BaseDto  implements Serializable {
	
	private static final long serialVersionUID = -6819215887293605229L;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private String releaseDate; 
	private String description;
	private String requirements;	
	private String assumptions;			
	private String constraints;	
	private String notes;	
	@DateTimeFormat(pattern = "dd/MM/yyyy")	
	private String lastUpdate;		
	private String tags;	
	private String version;	
	private String standardIstat;
	
	
}
