package it.istat.mec.catalogue.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import it.istat.mec.catalogue.domain.CatalogTool;

@Repository
public interface ToolDao extends JpaRepository<CatalogTool, Long> {
	
	@Override
	List<CatalogTool> findAll();
	
	@Override
	Optional<CatalogTool> findById(Long id);

	public void save(Optional<CatalogTool> tools);

	public void delete(CatalogTool tools);
}
