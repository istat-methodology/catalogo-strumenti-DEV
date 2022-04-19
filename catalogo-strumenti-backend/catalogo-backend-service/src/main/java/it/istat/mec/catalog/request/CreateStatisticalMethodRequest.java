package it.istat.mec.catalog.request;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class CreateStatisticalMethodRequest extends CreateBaseRequest{
	

	private static final long serialVersionUID = -876023417978467575L;
	private String description;	
	private String requirements;	
	private String assumptions;	
	private String constraints;	
	private String notes;	
	private Date lastUpdate;	
	private String tags;	
	private String version;	
	private Date releaseDate;
	private Integer standardIstat;
}
