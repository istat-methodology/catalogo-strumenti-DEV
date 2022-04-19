package it.istat.mec.catalog.request;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class CreateBusinessFunctionRequest extends CreateBaseRequest {
	
	private static final long serialVersionUID = 1721161190669807674L;
		
	private String descr;		
	private String label;	
	private String active;	
}
