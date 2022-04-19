package it.istat.mec.catalog.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class DocumentationTypeDto extends BaseDto {

	
	private static final long serialVersionUID = -2849827615748381854L;
		
	private String descr;
}
