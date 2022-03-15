package it.istat.mec.catalog.request;
import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateProcessStepRequest implements Serializable  {

	private static final long serialVersionUID = 2330235480557677106L;
	
	private Long id;	
	private String name;	
	private String descr;		
	private String label;	
	private String businessServiceId;	
	private String substep;	
}

