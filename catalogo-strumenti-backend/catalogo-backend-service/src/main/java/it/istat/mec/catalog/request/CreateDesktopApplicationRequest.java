package it.istat.mec.catalog.request;
import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateDesktopApplicationRequest implements Serializable {

	private static final long serialVersionUID = 2790253861618980390L;
	private Integer id;	
	private String dipendenze;		
	private String download;		
	private String licenza;	
	private String linguaggio;	
	private String pacchetto; 		
	private String sistemaOperativo; 	
	private Integer tool;
}
