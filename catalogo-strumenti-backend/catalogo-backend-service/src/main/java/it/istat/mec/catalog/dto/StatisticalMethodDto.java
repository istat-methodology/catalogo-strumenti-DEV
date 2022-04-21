package it.istat.mec.catalog.dto;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class StatisticalMethodDto extends BaseDto  implements Serializable {
	
	private static final long serialVersionUID = -6819215887293605229L;
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS");
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate releaseDate; 
	private String description;
	private String requirements;	
	private String assumptions;			
	private String constraints;	
	private String notes;		
	private Date lastUpdate;		
	private String tags;	
	private String version;	
	private String standardIstat;
	
	public String getReleaseDate() {
        return formatter.format(LocalDateTime.of(releaseDate, LocalTime.MIDNIGHT));
    }
}
