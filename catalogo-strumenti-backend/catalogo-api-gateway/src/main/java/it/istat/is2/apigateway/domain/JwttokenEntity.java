package it.istat.is2.apigateway.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Objects;

@Entity
@Table(name = "catalog_gateway_jwttoken", schema = "catalog")
public class JwttokenEntity {
    private String token;

    public JwttokenEntity() {
    }

    public JwttokenEntity(String token) {
        this.token = token;
    }

    @Id
    @Column(name = "token")
    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        JwttokenEntity that = (JwttokenEntity) o;
        return Objects.equals(token, that.token);
    }

    @Override
    public int hashCode() {
        return Objects.hash(token);
    }
}
