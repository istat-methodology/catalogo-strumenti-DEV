package it.istat.mec.catalog.dto;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class BusinessFunctionMiniDto extends BaseDto {
	
	private static final long serialVersionUID = 7587361829337508840L;
		
	private String descr;		
	private String label;	
	private String active;		
	private List<GSBPMProcessMiniDto> gsbpmProcesses;
	private List<BaseDescriptionDto> businessProcesses;
}
