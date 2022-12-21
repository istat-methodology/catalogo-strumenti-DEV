package it.istat.mec.catalog.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.ProcessSpecification;

@Repository
public interface ProcessSpecificationDao extends JpaRepository<ProcessSpecification, Integer> {
	
	List<ProcessSpecification> findAll();
	
	List<ProcessSpecification> findByProcessDesign(Integer idProcessDesign);

	public void save(Optional<ProcessSpecification> processSpecification);

	public void delete(ProcessSpecification processSpecification);
}
