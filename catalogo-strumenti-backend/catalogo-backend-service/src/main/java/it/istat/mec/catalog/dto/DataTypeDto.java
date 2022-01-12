package it.istat.mec.catalog.dto;

import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class DataTypeDto implements Serializable  {

	
	private static final long serialVersionUID = 204395729981711595L;
	
	private Long id;	
	private String name;	
	private String descr;
}