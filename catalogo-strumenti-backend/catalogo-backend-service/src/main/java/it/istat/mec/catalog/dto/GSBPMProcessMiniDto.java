package it.istat.mec.catalog.dto;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class GSBPMProcessMiniDto extends BaseDto implements Serializable {

	private static final long serialVersionUID = -6905546979001300372L;
    
	private String code; 
          
 
}
