package it.istat.mec.catalog.dto;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class BusinessServiceDto implements Serializable {
	
	private static final long serialVersionUID = 4566784616153269006L;
	
	private Long id;	
	private String name;	
	private String descr;
	
	private List<ProcessStepDto> processSteps;
	private List<AppServiceDto> appServices;
}
