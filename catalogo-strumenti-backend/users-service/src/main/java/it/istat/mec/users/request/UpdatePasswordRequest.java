package it.istat.mec.users.request;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UpdatePasswordRequest implements Serializable {
	
	private static final long serialVersionUID = -4032108024328522689L;
	 
	 	@NotNull
	    @Size(min = 6, max = 50)
	    private String oldpass;
	    
	    @NotNull
	    @Size(min = 6, max = 50)
	    private String newpass;
}
