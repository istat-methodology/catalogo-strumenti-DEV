package it.istat.mec.catalog.dto;
import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class StatisticalMethodDto implements Serializable {
	
	private static final long serialVersionUID = -6819215887293605229L;
	private Long id;	
	private String nome;	
	private String autore;	
	private String obiettivo;		
	private String descrizione;	
	private String generalita;	
	private String ipotesi;		
	private String limiti;	
	private String indicatoriQualita;	
	private ToolMiniDto toolId;	
}
