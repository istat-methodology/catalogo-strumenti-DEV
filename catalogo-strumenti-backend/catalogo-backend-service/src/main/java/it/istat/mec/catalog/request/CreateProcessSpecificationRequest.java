package it.istat.mec.catalog.request;
import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateProcessSpecificationRequest implements Serializable  {


	private static final long serialVersionUID = -8090877423372137113L;
	private Integer id;	
	
	private Integer processDesignDescription;
 	private Integer designType;
	private Integer informationObject;
}
