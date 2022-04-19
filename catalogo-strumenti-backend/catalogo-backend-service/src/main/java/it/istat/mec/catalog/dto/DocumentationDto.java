package it.istat.mec.catalog.dto;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class DocumentationDto extends BaseDto {
	
	private static final long serialVersionUID = 6651381114832440178L;
	
	private String publisher;	
	private DocumentationTypeDto documentType;	
	private String notes;	
	private String resource;	
	private BaseDto tool;
	
}
