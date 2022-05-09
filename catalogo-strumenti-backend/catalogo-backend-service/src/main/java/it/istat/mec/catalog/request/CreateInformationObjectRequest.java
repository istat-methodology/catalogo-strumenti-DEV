package it.istat.mec.catalog.request;
import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateInformationObjectRequest implements Serializable  {

	private static final long serialVersionUID = -1505851406997934704L;
	private Integer id;	
	private String name;
	private String descr;
	private String csmAppRoleId;
	private String businessService;

}
