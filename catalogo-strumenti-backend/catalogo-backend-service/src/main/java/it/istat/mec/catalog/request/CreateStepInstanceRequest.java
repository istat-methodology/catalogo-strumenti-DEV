package it.istat.mec.catalog.request;
import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateStepInstanceRequest implements Serializable  {

	
	private static final long serialVersionUID = -3888879913264397676L;
	private Long id;	
	private String method;	
	private String statMethod;	
	private String descr;		
	private String functionality;	
	private String appServiceId;
}
