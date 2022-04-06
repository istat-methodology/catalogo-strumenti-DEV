package it.istat.mec.catalog.dto;

import java.io.Serializable;


import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class InformationObjectDto implements Serializable  {

	
	private static final long serialVersionUID = 204395729981711595L;
	

	private Integer id;

	private String name;

	private String descr;

	private String csmAppRoleId;

	private String businessService;

	private String processDesign;

}
