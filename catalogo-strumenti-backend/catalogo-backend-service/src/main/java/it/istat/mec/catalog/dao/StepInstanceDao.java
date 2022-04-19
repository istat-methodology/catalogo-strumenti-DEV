package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import it.istat.mec.catalog.domain.AppService;
import it.istat.mec.catalog.domain.StepInstance;

@Repository
public interface StepInstanceDao extends JpaRepository<StepInstance, Integer> {
	@Override
	List<StepInstance> findAll();
	
	@Override
	Optional<StepInstance> findById(Integer id);
	
	
	public List<StepInstance> findByAppService(AppService appService);
	

	public void save(Optional<StepInstance> stepInstance);

	public void delete(StepInstance stepInstance);
}
