package it.istat.mec.catalog.request;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateDocumentationRequest {
	private Long id;	
	private String nome;	
	private String organizzazione;	
	private Long toolId;
}
