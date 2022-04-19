package it.istat.mec.catalog.request;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class CreateAgentRequest extends CreateBaseRequest {
	

	private static final long serialVersionUID = 8532095325784183855L;
	
	
	private String organization;	
	private String contact;	
	private String notes;

}
