package it.istat.mec.catalog.request;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateAgentRequest {
	
	private Integer id;	
	private String name;	
	private String organization;	
	private String contact;	
	private String notes;	
}
