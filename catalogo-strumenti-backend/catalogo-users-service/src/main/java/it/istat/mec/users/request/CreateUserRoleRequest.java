package it.istat.mec.users.request;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class CreateUserRoleRequest implements Serializable {

	
	private static final long serialVersionUID = -7593214175915897125L;
	private int id;
	private String role;
}
