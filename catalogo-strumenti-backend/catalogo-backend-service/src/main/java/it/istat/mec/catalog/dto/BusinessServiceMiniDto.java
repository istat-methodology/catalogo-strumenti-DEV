package it.istat.mec.catalog.dto;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class BusinessServiceMiniDto implements Serializable {
	
	private static final long serialVersionUID = 4566784616153269006L;
	
	private Integer id;	
	private String name;	
	private String descr;
	private BaseDto tool;
}
