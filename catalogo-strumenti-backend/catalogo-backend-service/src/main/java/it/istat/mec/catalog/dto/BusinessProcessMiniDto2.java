package it.istat.mec.catalog.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class BusinessProcessMiniDto2 extends BaseDto {
	private static final long serialVersionUID = 8416262083164963412L;
	private String descr;		
	private String label;	
	private String orderCode;	
	private String parent;	
}

