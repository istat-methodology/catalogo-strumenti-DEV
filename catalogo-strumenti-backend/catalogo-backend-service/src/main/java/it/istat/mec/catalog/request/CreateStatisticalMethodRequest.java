package it.istat.mec.catalog.request;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateStatisticalMethodRequest {
	private Long id;	
	private String nome;	
	private String autore;	
	private String obiettivo;		
	private String descrizione;	
	private String generalita;	
	private String ipotesi;		
	private String limiti;	
	private String indicatoriQualita;	
	private Long toolId;	
}
