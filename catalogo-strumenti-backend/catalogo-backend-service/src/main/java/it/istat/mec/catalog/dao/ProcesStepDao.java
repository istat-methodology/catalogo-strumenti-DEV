package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface ProcesStepDao extends JpaRepository<ProcesStepDao, Long> {
	@Override
	List<ProcesStepDao> findAll();
	
	@Override
	Optional<ProcesStepDao> findById(Long id);

	public void save(Optional<ProcesStepDao> processStep);

	public void delete(ProcesStepDao processStep);
}