package it.istat.mec.catalog.dto;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class ProcessDesignDto implements Serializable{

	
	private static final long serialVersionUID = 204395729981711595L;
	private Integer id;	
	private String descr;	
	// TODO: Verificare la relazione step - ProcessDesign, non ritorna la lista di step
	private ProcessStepMiniDto step;	
	private ProcessSpecificationDto processSpecification;
	
}
