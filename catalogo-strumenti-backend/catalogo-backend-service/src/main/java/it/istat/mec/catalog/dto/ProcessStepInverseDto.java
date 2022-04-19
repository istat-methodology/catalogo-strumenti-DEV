package it.istat.mec.catalog.dto;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class ProcessStepInverseDto extends BaseDto {

	private static final long serialVersionUID = -7489319580466971471L;

	private String descr;		
	private String label;	
	private String businessServiceId;	
	private String substep;	

	private List<BusinessProcessInverseDto> businessProcesses;
}
