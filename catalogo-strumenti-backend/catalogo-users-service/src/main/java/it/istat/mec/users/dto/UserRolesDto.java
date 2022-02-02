package it.istat.mec.users.dto;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserRolesDto implements Serializable {
	
	private static final long serialVersionUID = -2410632865937295451L;
	private int id;
	private String role;
}
