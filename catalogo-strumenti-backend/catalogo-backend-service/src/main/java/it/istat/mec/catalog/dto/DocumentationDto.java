package it.istat.mec.catalog.dto;
import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class DocumentationDto implements Serializable {
	
	private static final long serialVersionUID = 6651381114832440178L;
	
	private Integer id;	
	private String name;	
	private String publisher;	
	private DocumentationTypeDto documentType;	
	private String notes;	
	private String resource;	
	private CatalogToolMiniDto tool;
	
}
