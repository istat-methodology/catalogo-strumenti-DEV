package it.istat.mec.catalog.request;
import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateSoftwareProcedureRequest implements Serializable{
	

	private static final long serialVersionUID = -8883864019077383404L;
	private Integer id;	
	private String codice;	
	private String sintassi;	
	private String dipendenze;		
	private String linguaggio;	
	private Integer toolId;	
}
