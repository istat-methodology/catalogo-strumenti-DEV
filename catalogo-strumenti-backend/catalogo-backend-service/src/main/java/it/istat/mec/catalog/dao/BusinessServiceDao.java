package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.BusinessService;


@Repository
public interface BusinessServiceDao extends JpaRepository<BusinessService, Long> {

	@Override
	List<BusinessService> findAll();
	
	@Override
	Optional<BusinessService> findById(Long id);

	public void save(Optional<BusinessService> businessService);

	public void delete(BusinessService businessService);
}
