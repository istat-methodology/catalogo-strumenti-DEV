package it.istat.is2.apigateway.dto;
import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class UsersDto implements Serializable {
	
	private static final long serialVersionUID = -5524009610812626199L;
	private Integer id;
    private String email;
    private String name; 
    private String role; 
}
