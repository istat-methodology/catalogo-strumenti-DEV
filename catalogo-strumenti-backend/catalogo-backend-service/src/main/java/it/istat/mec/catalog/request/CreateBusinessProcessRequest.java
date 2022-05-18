package it.istat.mec.catalog.request;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class CreateBusinessProcessRequest extends CreateBaseRequest  {
	
	private static final long serialVersionUID = 9171474870614821071L;

	private String descr;		
	private String label;	
	private Integer orderCode;	
	private Integer parent;	
	private Integer businessFunction;	
}
