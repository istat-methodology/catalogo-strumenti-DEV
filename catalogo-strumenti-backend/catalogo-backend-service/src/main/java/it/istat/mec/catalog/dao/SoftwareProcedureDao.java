package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.SoftwareProcedure;

@Repository
public interface SoftwareProcedureDao extends JpaRepository<SoftwareProcedure, Long> {

	@Override
	List<SoftwareProcedure> findAll();
	
	@Override
	Optional<SoftwareProcedure> findById(Long id);

	public void save(Optional<SoftwareProcedure> tools);

	public void delete(SoftwareProcedure tools);
}
