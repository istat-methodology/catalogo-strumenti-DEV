package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.AppService;


@Repository
public interface AppServiceDao extends JpaRepository<AppService, Integer> {
	
	@Override
	List<AppService> findAll();
	
	@Override
	Optional<AppService> findById(Integer id);	

	public void save(Optional<AppService> appService);

	public void delete(AppService appService);
	
}
