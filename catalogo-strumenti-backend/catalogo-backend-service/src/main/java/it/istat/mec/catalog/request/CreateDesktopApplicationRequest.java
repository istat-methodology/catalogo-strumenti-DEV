package it.istat.mec.catalog.request;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateDesktopApplicationRequest {
	private Long id;	
	private String dipendenze;		
	private String download;		
	private String licenza;	
	private String linguaggio;	
	private String pacchetto; 		
	private String sistemaOperativo; 	
	private String tool;
}
