package it.istat.mec.catalog.dto;
import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StepInstanceDto implements Serializable  {

	private static final long serialVersionUID = -3088590458451619674L;
	private Long id;	
	private String method;	
	private String statMethod;	
	private String descr;		
	private String functionality;	
	private String appServiceId;
}
