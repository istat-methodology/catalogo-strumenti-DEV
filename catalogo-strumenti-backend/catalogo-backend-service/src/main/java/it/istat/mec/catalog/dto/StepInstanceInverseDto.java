package it.istat.mec.catalog.dto;
import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StepInstanceInverseDto implements Serializable  {

	private static final long serialVersionUID = -3088590458451619674L;
	private Integer id;	
	private String method;	
	private BaseDto statMethod;	
	private String descr;		
	private String functionality;	
	private String appServiceId;
	private List<ProcessStepInverseDto> processSteps;
}
