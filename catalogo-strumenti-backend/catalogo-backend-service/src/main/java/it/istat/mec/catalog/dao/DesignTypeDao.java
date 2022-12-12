package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.DesignType;



@Repository
public interface DesignTypeDao extends JpaRepository<DesignType, Integer> {

	@Override
	List<DesignType> findAll();
	
	@Query("SELECT dt FROM DesignType AS dt "
			+ " where 1=1 AND ((dt.parent is NULL) OR (dt.parent = 0)) " )	
	List<DesignType> findParentsDesignTypes();
	
	@Query("SELECT dt FROM DesignType AS dt "
			+ " where 1=1 AND ((dt.parent = :parent)) " )	
	List<DesignType> findDesignTypesByParent(Integer parent);
	
	Optional<DesignType> findById(Integer integer);

	public void save(Optional<DesignType> tools);

	public void delete(DesignType tools);
}
