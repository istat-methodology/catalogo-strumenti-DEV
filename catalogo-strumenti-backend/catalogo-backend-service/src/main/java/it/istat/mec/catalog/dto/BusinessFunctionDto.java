package it.istat.mec.catalog.dto;
import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class BusinessFunctionDto implements Serializable {
	
	private static final long serialVersionUID = 7587361829337508840L;
	private Long id;	
	private String name;		
	private String descr;		
	private String label;	
	private String active;		
}
