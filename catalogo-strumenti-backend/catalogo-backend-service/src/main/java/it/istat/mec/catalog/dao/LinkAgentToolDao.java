package it.istat.mec.catalog.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.LinkAgentTool;

@Repository
public interface LinkAgentToolDao extends JpaRepository<LinkAgentTool, Integer> {
	
	List<LinkAgentTool> findByTool(CatalogTool catalogTool);
	
	
	Optional<LinkAgentTool> findById(Integer id);

	public void save(Optional<LinkAgentTool> tools);

	public void delete(LinkAgentTool tools);
}
