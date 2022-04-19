package it.istat.mec.catalog.request;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class CreateBusinessServiceRequest extends CreateBaseRequest {
	
	private static final long serialVersionUID = 3464594196893757575L;
		
	private String descr;
}
