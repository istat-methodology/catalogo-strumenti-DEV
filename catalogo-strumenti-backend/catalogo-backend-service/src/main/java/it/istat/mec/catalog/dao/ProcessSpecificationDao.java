package it.istat.mec.catalog.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import it.istat.mec.catalog.domain.ProcessDesign;
import it.istat.mec.catalog.domain.ProcessSpecification;
import it.istat.mec.catalog.domain.ProcessStep;

@Repository
public interface ProcessSpecificationDao extends JpaRepository<ProcessSpecification, Integer> {
	
	List<ProcessSpecification> findAll();
	
	@Query("SELECT DISTINCT pd FROM ProcessSpecification pd WHERE pd.processDesign = :idProcessDesign")	
	List<ProcessSpecification> findByProcessDesign(@Param("idProcessDesign") ProcessDesign idProcessDesign);
	
	List<ProcessSpecification> findByProcessDesign(Integer idProcessDesign);

	public void save(Optional<ProcessSpecification> processSpecification);

	public void delete(ProcessSpecification processSpecification);
}
