package it.istat.mec.catalog.request;
import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateStatisticalServiceRequest implements Serializable {
	
	private static final long serialVersionUID = 2787428890801105770L;
	private Integer id;	
	private String protocol;	
	private String url;	
	private String outcomes;	
	private String serviceDependencies;		
	private String restrictions;
	private String gsbpm;		
	private String businessFunction;	
	private String processDesign;
}
