package it.istat.mec.catalog.request;
import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateBusinessProcessRequest implements Serializable {
	
	private static final long serialVersionUID = 9171474870614821071L;
	private Long id;	
	private String name;	
	private String descr;		
	private String label;	
	private String orderCode;	
	private String parent;	
}
