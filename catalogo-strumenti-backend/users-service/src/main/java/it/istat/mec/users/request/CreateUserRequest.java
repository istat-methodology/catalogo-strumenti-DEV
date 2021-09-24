package it.istat.mec.users.request;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class CreateUserRequest implements Serializable {

	
	private static final long serialVersionUID = 4145077658932991811L;
	
	
	@NotNull
    @Size(min = 2, max = 100)
	
    private String email;
	
    private String name;
    
    private String surname;
    
    @NotNull
    @Size(min = 2, max = 50)
    private String password;
    
    @NotNull
    private Integer role;
}
