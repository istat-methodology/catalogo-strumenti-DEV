package it.istat.mec.catalog.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class BusinessProcessMiniDto2 extends BaseDto {
	
	private static final long serialVersionUID = -9069760688210503195L;
	private String code;
}

