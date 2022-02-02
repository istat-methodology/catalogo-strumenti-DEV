package it.istat.mec.users.request;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class ResetPasswordRequest implements Serializable {


	
	private static final long serialVersionUID = -9018747510374626883L;
	
	@NotNull
    @Size(min = 6, max = 50)	
    private String password;
	
   
}
