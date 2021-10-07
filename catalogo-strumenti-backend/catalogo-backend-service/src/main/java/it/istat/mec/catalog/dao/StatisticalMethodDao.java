package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.StatisticalMethod;

@Repository
public interface StatisticalMethodDao extends JpaRepository<StatisticalMethod, Long> {

	@Override
	List<StatisticalMethod> findAll();
	
	@Override
	Optional<StatisticalMethod> findById(Long id);

	public void save(Optional<StatisticalMethod> tools);

	public void delete(StatisticalMethod tools);
}
