package it.istat.mec.catalog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import it.istat.mec.catalog.domain.AppService;

;


@Repository
public interface AppServiceDao extends JpaRepository<AppService, Integer> {


}
