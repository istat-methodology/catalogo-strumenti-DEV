package it.istat.mec.catalog.request;
import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateProcessDesignRequest implements Serializable  {

	
	private static final long serialVersionUID = -3888879913264397676L;
	private Integer id;	
	private String descr;	
	private Integer step;	
	
}
