package it.istat.mec.catalog.dto;
import java.io.Serializable;
import java.util.List;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BusinessProcessDto implements Serializable {
	
	private static final long serialVersionUID = 8416262083164963412L;
	
	private Integer id;	
	private String name;	
	private String descr;		
	private String label;	
	private String orderCode;	
	private String parent;	
	private List<ProcessStepDto> processSteps;
}

