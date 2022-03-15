package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.StatisticalMethod;

@Repository
public interface StatisticalMethodDao extends JpaRepository<StatisticalMethod, Integer> {

	@Override
	List<StatisticalMethod> findAll();
	
	//List<StatisticalMethod> findByCatalogTools(List<CatalogTool> tools);
	
	@Override
	Optional<StatisticalMethod> findById(Integer id);

	public void save(Optional<StatisticalMethod> tools);

	public void delete(StatisticalMethod tools);
}
