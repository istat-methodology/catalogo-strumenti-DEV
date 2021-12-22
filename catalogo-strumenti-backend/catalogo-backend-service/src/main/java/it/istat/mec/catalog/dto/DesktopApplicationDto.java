package it.istat.mec.catalog.dto;
import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class DesktopApplicationDto extends ToolDto implements Serializable {

	private static final long serialVersionUID = 4289022473858721833L;
	
	private String download;	
	private String licence;	
	private String language;	
	private String pacchetto; 	
	private String operativeSystem;	
	private String version;	
	private String technicalRequirements;
}
