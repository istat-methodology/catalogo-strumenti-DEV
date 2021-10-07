package it.istat.mec.catalog.request;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateSoftwareProcedureRequest {
	private Long id;	
	private String nome;	
	private String organizzazione;	
	private String toolId;	
}
