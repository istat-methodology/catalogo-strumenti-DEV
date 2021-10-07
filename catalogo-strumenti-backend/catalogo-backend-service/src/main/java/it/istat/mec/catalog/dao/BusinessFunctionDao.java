package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.BusinessFunction;


@Repository
public interface BusinessFunctionDao extends JpaRepository<BusinessFunction, Long> {

	@Override
	List<BusinessFunction> findAll();
	
	@Override
	Optional<BusinessFunction> findById(Long id);

	public void save(Optional<BusinessFunction> tools);

	public void delete(BusinessFunction tools);
}
