package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import it.istat.mec.catalog.domain.BusinessService;
import it.istat.mec.catalog.domain.ProcessDesign;
import it.istat.mec.catalog.domain.ProcessStep;



@Repository
public interface ProcessDesignDao extends JpaRepository<ProcessDesign, Integer> {
	
	List<ProcessDesign> findAll();
	
	@Query("SELECT DISTINCT pd FROM ProcessDesign pd WHERE pd.step = :idStep")	
	public List<ProcessDesign> findByStep(@Param("idStep") ProcessStep idStep);
	
	//public List<ProcessDesign> findByStep(Optional<ProcessStep> processStep);
	
	//List<ProcessDesign> findByStep(ProcessStep processStep);
	List<ProcessDesign> findByStep(Integer id_step);

	public void save(Optional<ProcessDesign> processDesign);

	public void delete(ProcessDesign processDesign);
}