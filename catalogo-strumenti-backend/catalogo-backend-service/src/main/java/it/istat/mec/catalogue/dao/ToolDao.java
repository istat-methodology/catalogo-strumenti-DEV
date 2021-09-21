package it.istat.mec.catalogue.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import it.istat.mec.catalogue.domain.Tool;

@Repository
public interface ToolDao extends JpaRepository<Tool, Long> {
	
	@Override
	List<Tool> findAll();
	
	@Override
	Optional<Tool> findById(Long id);

	public void save(Optional<Tool> tools);

	public void delete(Tool tools);
}
