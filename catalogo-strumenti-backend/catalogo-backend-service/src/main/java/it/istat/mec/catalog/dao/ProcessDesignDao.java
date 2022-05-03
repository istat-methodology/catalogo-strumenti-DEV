package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.ProcessDesign;
import it.istat.mec.catalog.domain.ProcessStep;


@Repository
public interface ProcessDesignDao extends JpaRepository<ProcessDesign, Integer> {
	
	List<ProcessDesign> findAll();
	
	List<ProcessDesign> findByStep(ProcessStep step);

	public void save(Optional<ProcessDesign> processDesign);

	public void delete(ProcessDesign processDesign);
}