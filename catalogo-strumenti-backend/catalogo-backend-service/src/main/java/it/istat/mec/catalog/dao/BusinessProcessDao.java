package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.BusinessProcess;

@Repository
public interface BusinessProcessDao extends JpaRepository<BusinessProcess, Long> {
	@Override
	List<BusinessProcess> findAll();
	
	@Override
	Optional<BusinessProcess> findById(Long id);

	public void save(Optional<BusinessProcess> businessProcess);

	public void delete(BusinessProcess businessProcess);
}

