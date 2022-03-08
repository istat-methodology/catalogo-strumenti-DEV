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

	
	Optional<CatalogTool> findById(Integer integer);

	public void save(Optional<CatalogTool> tools);

	public void delete(CatalogTool tools);  


	@Query("SELECT DISTINCT c FROM CatalogTool c  left outer JOIN c.gsbpmProcesses p WHERE 1=1 AND ((:sizeTypes = 0) OR (c.toolType.id IN (:types)))  AND ((:sizeGsbpmIds = 0)  OR (p IN (:gsbpmIds)) )")	
	public List<CatalogTool>  findAllWithFilter(@Param("types") List<Integer> types,@Param("sizeTypes") Integer sizeTypes, @Param("gsbpmIds") List<GsbpmProcess> gsbpmIds, @Param("sizeGsbpmIds") Integer sizeGsbpmIds, Sort sort );

}
