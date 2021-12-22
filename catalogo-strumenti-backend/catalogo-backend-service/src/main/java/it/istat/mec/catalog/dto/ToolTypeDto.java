package it.istat.mec.catalog.dto;

import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class ToolTypeDto implements Serializable  {
	
	private static final long serialVersionUID = -8003006040736589702L;
	
	private Long id;	
	private String name;	
	private String descr;
}
