package it.istat.mec.catalog.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
@Data
@EqualsAndHashCode(callSuper=true)
@NoArgsConstructor
public class ProcessDesignDto extends BaseDto   {

	
	private static final long serialVersionUID = 204395729981711595L;
	
	
	private String descr;

	private String step;	

 	private DesignTypeDto designType;
	

	private InformationObjectDto informationObject;
	
}
