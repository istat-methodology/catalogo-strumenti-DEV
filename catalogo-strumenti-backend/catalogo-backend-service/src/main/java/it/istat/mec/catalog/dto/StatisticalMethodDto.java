package it.istat.mec.catalog.dto;
import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class StatisticalMethodDto extends ToolDto implements Serializable {
	
	private static final long serialVersionUID = -6819215887293605229L;
	
	private String requirements;	
	private String assumptions;			
	private String constraints;	
	private String notes;		
	private ToolMiniDto tool;	
}
