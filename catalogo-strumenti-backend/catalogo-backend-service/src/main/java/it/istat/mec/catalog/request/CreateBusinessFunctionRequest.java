package it.istat.mec.catalog.request;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateBusinessFunctionRequest {
	private Long id;	
	private String name;		
	private String descr;		
	private String label;	
	private String active;	
	private String gsbpm;
}
