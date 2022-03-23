package it.istat.mec.catalog.request;
import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateBusinessFunctionRequest implements Serializable {
	
	private static final long serialVersionUID = 1721161190669807674L;
	private Long id;	
	private String name;		
	private String descr;		
	private String label;	
	private String active;	
}
