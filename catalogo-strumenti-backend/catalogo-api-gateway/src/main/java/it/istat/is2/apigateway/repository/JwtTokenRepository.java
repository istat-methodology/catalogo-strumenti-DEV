package it.istat.is2.apigateway.repository;

import it.istat.is2.apigateway.domain.JwttokenEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JwtTokenRepository extends JpaRepository<JwttokenEntity, String> {
}
