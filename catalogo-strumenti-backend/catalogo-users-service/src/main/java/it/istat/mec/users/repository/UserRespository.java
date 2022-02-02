package it.istat.mec.users.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import it.istat.mec.users.domain.UsersEntity;

public interface UserRespository extends JpaRepository<UsersEntity, Long> {
    UsersEntity findFirstByEmailAndPassword(@Param("email") String email, @Param("password") String password);
    UsersEntity findByEmail(@Param("email") String email);
}
