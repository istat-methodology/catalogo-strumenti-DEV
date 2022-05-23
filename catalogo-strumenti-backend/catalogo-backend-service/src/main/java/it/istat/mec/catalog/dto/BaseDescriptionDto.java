package it.istat.mec.catalog.dto;
 
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class BaseDescriptionDto extends BaseDto {
	
	private static final long serialVersionUID = -1613591770971506155L;
 
	private String description;	
}
