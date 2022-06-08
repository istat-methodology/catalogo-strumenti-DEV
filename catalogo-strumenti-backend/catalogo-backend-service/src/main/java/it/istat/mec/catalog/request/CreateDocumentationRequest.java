package it.istat.mec.catalog.request;


import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class CreateDocumentationRequest  extends CreateBaseRequest  {
	

	private static final long serialVersionUID = -1693781320259958626L;
	private String publisher;
	private Integer documentType;
	private String notes;	
	private String resource;
    private Integer tool;
    private Integer method;
}
