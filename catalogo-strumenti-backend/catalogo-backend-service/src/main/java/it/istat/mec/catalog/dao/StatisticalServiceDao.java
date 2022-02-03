package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.StatisticalService;

@Repository
public interface StatisticalServiceDao extends JpaRepository<StatisticalService, Long> {

	@Override
	List<StatisticalService> findAll();
	
	@Override
	Optional<StatisticalService> findById(Long id);

	public void save(Optional<StatisticalService> tools);

	public void delete(StatisticalService tools);
}
