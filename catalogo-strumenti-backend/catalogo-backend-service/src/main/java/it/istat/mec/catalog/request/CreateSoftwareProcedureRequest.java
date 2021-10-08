package it.istat.mec.catalog.request;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateSoftwareProcedureRequest {
	
	private Long id;	
	private String codice;	
	private String sintassi;	
	private String dipendenze;		
	private String linguaggio;	
	private String toolId;	
}
