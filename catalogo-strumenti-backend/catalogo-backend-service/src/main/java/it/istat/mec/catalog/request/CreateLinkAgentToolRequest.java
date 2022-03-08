package it.istat.mec.catalog.request;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateLinkAgentToolRequest implements Serializable {	
	
	
	private static final long serialVersionUID = 2633386735219158125L;

	private Integer id;	
	
	private Integer agent;	
 	
	private Integer tool;
	
	private String role;	
	
	private String notes;	
	
	private String referenceDate;	
}
