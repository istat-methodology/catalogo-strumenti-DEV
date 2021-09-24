package it.istat.mec.users.domain;

import javax.persistence.*;


import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
@Setter
@Getter
@Entity
@Table(name = "wp1_user_roles", schema = "regedit_users", catalog = "")
public class UserRolesEntity implements Serializable{
   
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)	
    @Column(name = "ID")
	private Integer id;
	
    private String role;
    
    
    @OneToMany(mappedBy = "role")
    private List<UsersEntity> usersEntity= new ArrayList<>();
    

    
   

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserRolesEntity that = (UserRolesEntity) o;
        return id == that.id &&
                Objects.equals(role, that.role);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, role);
    }

	@Override
	public String toString() {
		return role;
	}
    
}
