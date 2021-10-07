package it.istat.mec.catalog.dto;
import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class SoftwareProcedureDto implements Serializable {
	
	private static final long serialVersionUID = -3306626906230930771L;
	private Long id;	
	private String nome;	
	private String organizzazione;	
	private String toolId;	
}
