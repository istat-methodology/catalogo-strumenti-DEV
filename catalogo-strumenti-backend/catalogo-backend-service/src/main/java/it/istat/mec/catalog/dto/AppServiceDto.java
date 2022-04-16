package it.istat.mec.catalog.dto;

import java.util.List;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AppServiceDto extends BaseDto {
	 
	private static final long serialVersionUID = -8722479449260924506L;

		
	private String descr;	
	private String implementationLanguage;	
	private String engine;	
	private String sourcePath;	
	private String sourceCode;	
	private String author;	
	private String licence;	
	private String contact;
	private List<StepInstanceDto> stepInstances;
}
