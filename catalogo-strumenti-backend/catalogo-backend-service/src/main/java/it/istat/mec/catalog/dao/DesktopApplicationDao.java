package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.DesktopApplication;

@Repository
public interface DesktopApplicationDao extends JpaRepository<DesktopApplication, Long> {

	@Override
	List<DesktopApplication> findAll();
	
	
	@Override
	Optional<DesktopApplication> findById(Long id);

	public void save(Optional<DesktopApplication> tools);

	public void delete(DesktopApplication tools);
}
