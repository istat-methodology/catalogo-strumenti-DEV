package it.istat.mec.catalog.dto;

import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class DocumentTypeDto implements Serializable  {

	
	private static final long serialVersionUID = -2849827615748381854L;
	
	private Integer id;	
	private String name;	
	private String descr;
}
