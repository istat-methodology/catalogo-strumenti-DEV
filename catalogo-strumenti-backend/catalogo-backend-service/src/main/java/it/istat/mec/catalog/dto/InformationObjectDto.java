package it.istat.mec.catalog.dto;

import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class InformationObjectDto extends BaseDto implements Serializable  {

	
	private static final long serialVersionUID = 204395729981711595L;	
	
	
	private String descr;
	private String csmAppRoleId;
	//private BusinessServiceMiniDto businessService;
	

}
