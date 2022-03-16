package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import it.istat.mec.catalog.domain.ProcessStep;


@Repository
public interface ProcessStepDao extends JpaRepository<ProcessStep, Long> {
	@Override
	List<ProcessStep> findAll();
	
	@Override
	Optional<ProcessStep> findById(Long id);

	public void save(Optional<ProcessStep> processStep);

	public void delete(ProcessStep processStep);
}