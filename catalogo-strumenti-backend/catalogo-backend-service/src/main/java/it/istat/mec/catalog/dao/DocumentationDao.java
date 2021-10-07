package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.Documentation;

@Repository
public interface DocumentationDao extends JpaRepository<Documentation, Long> {

	@Override
	List<Documentation> findAll();
	
	@Override
	Optional<Documentation> findById(Long id);

	public void save(Optional<Documentation> tools);

	public void delete(Documentation tools);
}
