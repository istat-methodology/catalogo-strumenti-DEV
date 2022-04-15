package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.BusinessFunction;
import it.istat.mec.catalog.domain.GsbpmProcess;


@Repository
public interface BusinessFunctionDao extends JpaRepository<BusinessFunction, Integer> {

	@Override
	List<BusinessFunction> findAll();
	
	@Override
	Optional<BusinessFunction> findById(Integer id);

	public void save(Optional<BusinessFunction> businessFunction);

	public void delete(BusinessFunction businessFunction);
	
	@Query("SELECT DISTINCT f FROM BusinessFunction f  left outer JOIN f.gsbpmProcesses p WHERE 1=1  AND ((:sizeGsbpmIds = 0)  OR (p IN (:gsbpmIds)) )")	
	public List<BusinessFunction>  findAllWithFilter(@Param("gsbpmIds") List<GsbpmProcess> gsbpmIds, @Param("sizeGsbpmIds") Integer sizeGsbpmIds, Sort sort );
}
