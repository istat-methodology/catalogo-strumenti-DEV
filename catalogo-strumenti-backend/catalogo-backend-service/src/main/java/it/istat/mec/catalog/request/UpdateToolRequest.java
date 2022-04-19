package it.istat.mec.catalog.request;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class UpdateToolRequest extends CreateBaseRequest {	

	
	private static final long serialVersionUID = -8492573172388881146L;
	
	private String releaseDate;
	private String description;	
	
	private String standardIstat;	
	private String tags;
	private String version;
	private String toolType;
	private String service;
	private String lastUpdate;
	private String requirements;	
	
}
