package it.istat.mec.catalog.request;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateBusinessServiceRequest implements Serializable {
	
	private static final long serialVersionUID = 3464594196893757575L;
	private Long id;	
	private String name;	
	private String descr;
}
