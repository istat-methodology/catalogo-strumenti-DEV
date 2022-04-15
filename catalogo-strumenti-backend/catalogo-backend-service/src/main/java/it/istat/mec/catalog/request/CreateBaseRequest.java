package it.istat.mec.catalog.request;
import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateBaseRequest implements Serializable {
	

	private static final long serialVersionUID = 7301212976045302658L;
	private Integer id;	
	private String name;	

}
