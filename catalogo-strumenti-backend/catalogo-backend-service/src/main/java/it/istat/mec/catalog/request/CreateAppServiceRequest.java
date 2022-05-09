package it.istat.mec.catalog.request;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateAppServiceRequest implements Serializable {
	
	private static final long serialVersionUID = 5037760373614510313L;
	
	private Integer id;	
	private String name;
	private String descr;
	private String implementationLanguage;	
	private String engine;	
	private String sourcePath;	
	private String sourceCode;	
	private String author;	
	private String licence;	
	private String contact;
	private Integer businessService;
	
}
