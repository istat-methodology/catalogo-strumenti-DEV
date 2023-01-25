package it.istat.mec.catalog.dto;
import java.io.Serializable;
import java.util.List;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class ProcessStepDto extends BaseDto  implements Serializable  {

	private static final long serialVersionUID = -7489319580466971471L;

	private String descr;		
	private String label;	
	private BusinessServiceMiniDto businessService;	
	private String substep;	
	private List<StepInstanceDto> stepInstances;
 	private List<ProcessDesignMiniDto> processDesigns;
}
