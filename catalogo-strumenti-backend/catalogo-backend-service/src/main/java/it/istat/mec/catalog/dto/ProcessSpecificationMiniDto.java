package it.istat.mec.catalog.dto;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class ProcessSpecificationMiniDto implements Serializable{

	
	private static final long serialVersionUID = 204395729981711595L;
	private Integer id;	
	private ProcessDesignMiniDto processDesign;
 	private DesignTypeDto designType;
	private InformationObjectDto informationObject;
	
}
