package it.istat.mec.catalog.dto;
import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class ProcessStepDto implements Serializable  {

	private static final long serialVersionUID = -7489319580466971471L;
	private Long id;	
	private String name;	
	private String descr;		
	private String label;	
	private String businessServiceId;	
	private String substep;	
}
