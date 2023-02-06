package it.istat.mec.catalog.dto;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class ProcessDesignMicroDto implements Serializable{

	
	private static final long serialVersionUID = 204395729981711595L;
	private Integer id;	
	private String descr;	
	//private ProcessStepMiniDto step;	
	//private List<ProcessSpecificationDto> processSpecification;
	
}
