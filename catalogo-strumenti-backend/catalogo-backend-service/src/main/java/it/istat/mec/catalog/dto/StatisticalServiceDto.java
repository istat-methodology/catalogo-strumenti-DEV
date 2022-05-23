package it.istat.mec.catalog.dto;
import java.io.Serializable;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@NoArgsConstructor
public class StatisticalServiceDto extends CatalogToolDTO implements Serializable {

	private static final long serialVersionUID = -5755522890190560245L;
		
	private String protocol;	
	private String url;	
	private String outcomes;	
	private String serviceDependencies;		
	private String restrictions;	

}
