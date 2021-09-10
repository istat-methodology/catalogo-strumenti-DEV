package it.istat.is2.apigateway.repository;

import it.istat.is2.apigateway.domain.UsersEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

public interface UserRespository extends JpaRepository<UsersEntity, Long> {
    UsersEntity findFirstByEmailAndPassword(@Param("email") String email, @Param("password") String password);
    UsersEntity findByEmail(@Param("email") String email);
}
