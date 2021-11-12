package it.istat.mec.catalog.dto;
import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class StatisticalServiceDto implements Serializable {

	private static final long serialVersionUID = -5755522890190560245L;
	private Long id;	
	private String metodiEsposti;
	private String dipendenze;	
	private String protocollo;		
	private ToolMiniDto tool;

}
