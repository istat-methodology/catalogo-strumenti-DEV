package it.istat.mec.catalog.request;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateDocumentationRequest {
	
	private Long id;	
	private String name;	
	private String publisher;
	private String documentType;
	private String notes;	
	private String resource;
    private Long tool;
}
