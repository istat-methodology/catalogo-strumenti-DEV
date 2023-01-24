package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.ProcessDesign;
import it.istat.mec.catalog.domain.ProcessStep;



@Repository
public interface ProcessDesignDao extends JpaRepository<ProcessDesign, Integer> {
	
	List<ProcessDesign> findAll();
	
	@Query("SELECT DISTINCT pd FROM ProcessDesign pd WHERE pd.step = :idStep")	
	public List<ProcessDesign> findByStep(@Param("idStep") ProcessStep idStep);
	
	List<ProcessDesign> findByStep(Integer id_step);
	
	Optional<ProcessDesign> findById(Integer id_design);

	public void save(Optional<ProcessDesign> processDesign);

	public void delete(ProcessDesign processDesign);
}