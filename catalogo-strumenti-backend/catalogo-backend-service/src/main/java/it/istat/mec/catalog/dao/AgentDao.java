package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.Agent;


@Repository
public interface AgentDao extends JpaRepository<Agent, Long> {

	@Override
	List<Agent> findAll();
	
	@Override
	Optional<Agent> findById(Long id);

	public void save(Optional<Agent> tools);

	public void delete(Agent tools);
}
