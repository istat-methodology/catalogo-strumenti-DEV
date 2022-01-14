package it.istat.mec.catalog.request;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateStatisticalMethodRequest {
	
	private Long id;	
	private String name;		
	private String description;	
	private String requirements;	
	private String assumptions;	
	private String constraints;	
	private String notes;		
}
