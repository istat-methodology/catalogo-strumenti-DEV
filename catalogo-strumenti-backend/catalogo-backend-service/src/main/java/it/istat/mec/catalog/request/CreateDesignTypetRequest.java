package it.istat.mec.catalog.request;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class CreateDesignTypetRequest extends CreateBaseRequest {

	private static final long serialVersionUID = 6192099384570113205L;
	private Integer id;	
	private String type;	
	private Integer parent;
}
