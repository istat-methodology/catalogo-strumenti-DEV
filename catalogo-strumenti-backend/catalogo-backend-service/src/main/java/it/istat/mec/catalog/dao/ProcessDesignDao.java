package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.ProcessDesign;


@Repository
public interface ProcessDesignDao extends JpaRepository<ProcessDesign, Integer> {
	
	List<ProcessDesign> findAll();
	
	List<ProcessDesign> findByStep(Integer id_step);

	public void save(Optional<ProcessDesign> processDesign);

	public void delete(ProcessDesign processDesign);
}