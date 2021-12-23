package it.istat.mec.catalog.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.GsbpmProcess;

@Repository
public interface ToolDao extends JpaRepository<CatalogTool, Long> {
	
	@Override
	List<CatalogTool> findAll();

	
	@Override
	Optional<CatalogTool> findById(Long id);

	public void save(Optional<CatalogTool> tools);

	public void delete(CatalogTool tools);

	@Query("SELECT c FROM CatalogTool c "
		+ " where 1=1 AND ((:types is NULL) OR (c.toolType in (:types))) "
			+ " AND ((:gsbpmIds is NULL) ) ")	
	public List<CatalogTool>  findAllWithFilter(@Param("types") List<Integer> types, @Param("gsbpmIds") List<GsbpmProcess> gsbpmIds);
}
