package it.istat.mec.catalog.dto;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class ProcessDesignDescriptionDto implements Serializable{

	
	private static final long serialVersionUID = 104391729981711595L;
	private Integer id;	
	private String descr;
	
}
