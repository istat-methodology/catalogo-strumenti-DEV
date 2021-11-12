package it.istat.mec.catalog.dto;
import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class DesktopApplicationDto implements Serializable {

	private static final long serialVersionUID = 4289022473858721833L;
	private Long id;	
	private String dipendenze;		
	private String download;		
	private String licenza;	
	private String linguaggio;	
	private String pacchetto; 		
	private String sistemaOperativo; 	
	private ToolMiniDto tool;
}
