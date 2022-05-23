package it.istat.mec.catalog.dto;

import java.io.Serializable;

import it.istat.mec.catalog.domain.ProcessDesignDescription;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class ProcessDesignDto implements Serializable{

	
	private static final long serialVersionUID = 204395729981711595L;
	private Integer id;	
	private String descr;
	private String step;	
	private ProcessDesignDescription processDesignDescription;
 	private DesignTypeDto designType;
	private InformationObjectDto informationObject;
	
}
