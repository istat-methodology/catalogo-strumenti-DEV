package it.istat.mec.catalog.request;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(callSuper=true)
@NoArgsConstructor
public class CreateProcessStepRequest extends CreateBaseRequest {


	private static final long serialVersionUID = 8375069278943530804L;
	private String descr;		
	private String label;	
	// paolinux 21-12-2022 changed string to int type
	private Integer businessServiceId;	
	private Integer substep;	
}

