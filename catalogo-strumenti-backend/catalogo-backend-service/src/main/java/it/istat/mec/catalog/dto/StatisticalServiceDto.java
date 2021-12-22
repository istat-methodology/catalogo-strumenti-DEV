package it.istat.mec.catalog.dto;
import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class StatisticalServiceDto extends ToolDto implements Serializable {

	private static final long serialVersionUID = -5755522890190560245L;
	
	private String protocol;	
	private String url;	
	private String outcomes;	
	private String serviceDependencies;		
	private String restrictions;
	private String gsbpm;		
	private String businessFunction;	
	private String processDesign;
}
