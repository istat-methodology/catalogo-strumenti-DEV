package it.istat.mec.catalog.request;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateStatisticalServiceRequest {
	private Long id;	
	private String metodiEsposti;
	private String dipendenze;	
	private String protocollo;		
	private Long toolId;
}
