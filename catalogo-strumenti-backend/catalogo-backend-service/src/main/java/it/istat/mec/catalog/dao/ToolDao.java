package it.istat.mec.catalog.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import it.istat.mec.catalog.domain.Agent;
import it.istat.mec.catalog.domain.BusinessFunction;
import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.Documentation;
import it.istat.mec.catalog.domain.GsbpmProcess;
import it.istat.mec.catalog.domain.StatisticalMethod;

@Repository
public interface ToolDao extends JpaRepository<CatalogTool, Integer> {
	
	@Override
	List<CatalogTool> findAll();

	
	Optional<CatalogTool> findById(Integer integer);

	public void save(Optional<CatalogTool> tools);

	public void delete(CatalogTool tools);  


	@Query("SELECT DISTINCT c FROM CatalogTool c  left outer JOIN c.gsbpmProcesses p WHERE 1=1 AND ((:sizeTypes = 0) OR (c.toolType.id IN (:types)))  AND ((:sizeGsbpmIds = 0)  OR (p IN (:gsbpmIds)) )")	
	public List<CatalogTool>  findAllWithFilter(@Param("types") List<Integer> types,@Param("sizeTypes") Integer sizeTypes, @Param("gsbpmIds") List<GsbpmProcess> gsbpmIds, @Param("sizeGsbpmIds") Integer sizeGsbpmIds, Sort sort );

	@Query("SELECT DISTINCT c FROM CatalogTool c JOIN c.businessService bs JOIN bs.processSteps ps JOIN ps.businessProcesses bp JOIN bp.businessFunctions bf WHERE bf = :businessFunction")	
	List<CatalogTool> findToolsByBusinessFunctions(@Param("businessFunction")BusinessFunction businessFunction);
	

	@Query("select c from CatalogTool c join c.statisticalMethods sm WHERE sm = :statisticalMethod")	
	List<CatalogTool> findToolsStatisticalMethod(@Param("statisticalMethod")StatisticalMethod statisticalMethod);
	
	@Query("select c from CatalogTool c join c.linkAgentsTools lat WHERE lat.agent = :agent")	
	List<CatalogTool> findToolsByAgent(@Param("agent")Agent agent);
	
	@Query("select c from CatalogTool c join c.documentations doc WHERE doc = :documentation")	
	List<CatalogTool> findToolsByDocumentation(@Param("documentation")Documentation documentation);
	
	
}
