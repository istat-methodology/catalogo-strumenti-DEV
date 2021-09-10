package it.istat.is2.apigateway.domain;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "wp1_user_roles", schema = "regedit_users", catalog = "")
public class UserRolesEntity {
    private int id;
    private String role;

    @Id
    @Column(name = "ID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "ROLE")
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

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
