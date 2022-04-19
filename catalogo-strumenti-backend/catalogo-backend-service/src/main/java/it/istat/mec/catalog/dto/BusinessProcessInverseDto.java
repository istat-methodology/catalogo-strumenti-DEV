package it.istat.mec.catalog.dto;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class BusinessProcessInverseDto extends BaseDto {
	
	private static final long serialVersionUID = 8416262083164963412L;
	
	
	private String descr;		
	private String label;	
	private String orderCode;	
	private String parent;	
	private List<BusinessFunctionInverseDto> businessFunctions;
}

