package it.istat.mec.users.domain;

import javax.persistence.*;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Objects;
@Setter
@Getter
@Entity
@Table(name = "wp1_users", schema = "regedit_users")
public class UsersEntity implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5107899009417460806L;
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)	
    @Column(name = "ID")
    private Integer id;
    private String email;
    private String name;
    private String surname;
    private String password;
    //(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
    // updatable = false, insertable = false
    @ManyToOne
    @JoinColumn(name = "ROLE_ID")
    
    UserRolesEntity role;

  


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UsersEntity that = (UsersEntity) o;
        return id == that.id &&
                Objects.equals(email, that.email) &&
                Objects.equals(name, that.name) &&
                Objects.equals(surname, that.surname) &&
                Objects.equals(password, that.password);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, email, name, surname, password);
    }
}
