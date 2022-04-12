package it.istat.mec.catalog.dto;
import java.io.Serializable;
import java.util.List;

import it.istat.mec.catalog.domain.StepInstance;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AppServiceDto implements Serializable {
	 
	private static final long serialVersionUID = -8722479449260924506L;

	private Long id;	
	private String name;	
	private String descr;	
	private Long implementationLanguage;	
	private String engine;	
	private String SourcePath;	
	private Long sourceCode;	
	private String author;	
	private String licence;	
	private Long contact;
	private List<StepInstance> stepInstances;
}
